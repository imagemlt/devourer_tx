#include "Rtl8812aDevice.h"
#include "EepromManager.h"
#include "RadioManagementModule.h"


Rtl8812aDevice::Rtl8812aDevice(RtlUsbAdapter device, Logger_t logger)
    : _device{device},
      _eepromManager{std::make_shared<EepromManager>(device, logger)},
      _radioManagement{std::make_shared<RadioManagementModule>(
          device, _eepromManager, logger)},
      _halModule{device, _eepromManager, _radioManagement, logger},
      _logger{logger} {}

void Rtl8812aDevice::InitWrite(SelectedChannel channel){
	StartWithMonitorMode(channel);
	SetMonitorChannel(channel);
	_logger->info("In Monitor Mode");
	

}

bool Rtl8812aDevice::send_packet(const uint8_t* packet, size_t length) {
    struct tx_desc *ptxdesc;
  uint8_t* usb_frame;
  //struct ieee80211_radiotap_header *rtap_hdr;
  int real_packet_length,usb_frame_length,radiotap_length;

  bool vht = false;
  int ret=0;
	int qos_len = 0;
	int dot11_hdr_len = 24;
	int snap_len = 6;
	unsigned char *pdata;
	u16 frame_ctl;
	unsigned char src_mac_addr[6];
	unsigned char dst_mac_addr[6];
	u8 fixed_rate = MGN_1M, sgi = 0, bwidth = 0, ldpc = 0, stbc = 0;
	u16 txflags = 0;
  int rate_id = 0;
  radiotap_length = int(packet[2]);
  real_packet_length = length - radiotap_length;
  
  if(radiotap_length != 0x0d)vht=true;

  usb_frame_length = real_packet_length + TXDESC_SIZE;

  _logger->info("radiotap length is {},80211 length is {},usb_frame length should be {}",radiotap_length,real_packet_length,usb_frame_length);

 

  struct ieee80211_radiotap_header *rtap_hdr;
	rtap_hdr = (struct ieee80211_radiotap_header *)packet;
	struct ieee80211_radiotap_iterator iterator;
	ret = ieee80211_radiotap_iterator_init(&iterator, rtap_hdr, radiotap_length , NULL);
        while (!ret) {
		ret = ieee80211_radiotap_iterator_next(&iterator);

		if (ret)
			continue;

		/* see if this argument is something we can use */
		switch (iterator.this_arg_index) {

		case IEEE80211_RADIOTAP_RATE:		/* u8 */
			fixed_rate = *iterator.this_arg;
			break;

		case IEEE80211_RADIOTAP_TX_FLAGS:
			txflags = get_unaligned_le16(iterator.this_arg);
			break;

		case IEEE80211_RADIOTAP_MCS: {		/* u8,u8,u8 */
			u8 mcs_have = iterator.this_arg[0];
			printf("MCS value:%d %d %d\n",iterator.this_arg[0],iterator.this_arg[1],iterator.this_arg[2]);
			printf("mcs parse:%d\n",mcs_have);
			if (mcs_have & IEEE80211_RADIOTAP_MCS_HAVE_MCS) {
				fixed_rate = iterator.this_arg[2] & 0x7f;
				if(fixed_rate > 31)
					fixed_rate = 0;
				fixed_rate += MGN_MCS0;
			}
			printf("mcs_have & 4 = %d,%d \n",(mcs_have & 4),(iterator.this_arg[1] & 1));
			if ((mcs_have & 4) && 
			    (iterator.this_arg[1] & 4))
				sgi = 1;
			if ((mcs_have & 1) && 
			    (iterator.this_arg[1] & 1))
				bwidth = 1;
			if ((mcs_have & 0x10) && 
			    (iterator.this_arg[1] & 0x10))
				ldpc = 1;
			if ((mcs_have & 0x20))
				stbc = (iterator.this_arg[1] >> 5) & 3;	
		}
		break;

		case IEEE80211_RADIOTAP_VHT: {
		/* u16 known, u8 flags, u8 bandwidth, u8 mcs_nss[4], u8 coding, u8 group_id, u16 partial_aid */
			u8 known = iterator.this_arg[0];
			u8 flags = iterator.this_arg[2];
			unsigned int mcs, nss;
			if((known & 4) && (flags & 4))
				sgi = 1;
			if((known & 1) && (flags & 1))
				stbc = 1;
			if(known & 0x40) {
				bwidth = iterator.this_arg[3] & 0x1f;
				if(bwidth>=1 && bwidth<=3)
					bwidth = 1; // 40 MHz
				else if(bwidth>=4 && bwidth<=10)
					bwidth = 2;	// 80 MHz
				else
					bwidth = 0; // 20 MHz
			}
			if(iterator.this_arg[8] & 1)
				ldpc = 1;
			mcs = (iterator.this_arg[4]>>4) & 0x0f;
			nss = iterator.this_arg[4] & 0x0f;
			if(nss > 0) {
				if(nss > 4) nss = 4;
				if(mcs > 9) mcs = 9;
				fixed_rate = MGN_VHT1SS_MCS0 + ((nss-1)*10 + mcs);
			}
		}
		break;

		default:
			break;
		}
	}

	printf("fixed rate:%d\n",fixed_rate);
	printf("sgi =%d,bandwdith=%d,ldpc=%d,stbc=%d\n",sgi,bwidth,ldpc,stbc);
  
  usb_frame = new uint8_t[usb_frame_length]();

  ptxdesc = (struct tx_desc *)usb_frame;
  
  SET_TX_DESC_FIRST_SEG_8812(usb_frame, 1);
  SET_TX_DESC_LAST_SEG_8812(usb_frame, 1);
  SET_TX_DESC_OWN_8812(usb_frame,1);

  SET_TX_DESC_PKT_SIZE_8812(usb_frame, static_cast<uint8_t>(real_packet_length));
  
  SET_TX_DESC_OFFSET_8812(usb_frame,static_cast<uint8_t>(TXDESC_SIZE + OFFSET_SZ));

  SET_TX_DESC_MACID_8812(usb_frame,static_cast<uint8_t>(0x01));
  
  if(!vht){
    rate_id=7;
  }else{
    rate_id=9;
  }

  SET_TX_DESC_BMC_8812(usb_frame, 1);
	SET_TX_DESC_RATE_ID_8812(usb_frame, static_cast<uint8_t>(rate_id)); // 原来设置的是7，得考虑下
									    //

	SET_TX_DESC_QUEUE_SEL_8812(usb_frame,0x12);
  SET_TX_DESC_HWSEQ_EN_8812(usb_frame, static_cast<uint8_t>(0)); /* Hw do not set sequence number */
	SET_TX_DESC_SEQ_8812(usb_frame, debug); /* Copy inject sequence number to TxDesc */
        debug ++;
	SET_TX_DESC_RETRY_LIMIT_ENABLE_8812(usb_frame, static_cast<uint8_t>(1));

	SET_TX_DESC_DATA_RETRY_LIMIT_8812(usb_frame, static_cast<uint8_t>(0));
  if(sgi){
    _logger->info("short gi enabled,set sgi");
    SET_TX_DESC_DATA_SHORT_8812(usb_frame, 1);
  }



	SET_TX_DESC_DISABLE_FB_8812(usb_frame, 1); 

	SET_TX_DESC_USE_RATE_8812(usb_frame, 1);
        
  
	SET_TX_DESC_TX_RATE_8812(usb_frame, static_cast<uint8_t>(MRateToHwRate(fixed_rate))); // 原来设置的是6,也需要考虑下怎么转换
  
  if (ldpc){
		SET_TX_DESC_DATA_LDPC_8812(usb_frame, ldpc);
	}
	
	SET_TX_DESC_DATA_STBC_8812(usb_frame, stbc & 3);
	
  uint8_t BWSettingOfDesc;
	if(_channel.ChannelWidth== CHANNEL_WIDTH_80)
	{
		if(bwidth == 80)
			BWSettingOfDesc= 2;
		else if(bwidth == 40)
			BWSettingOfDesc = 1;
		else
			BWSettingOfDesc = 0;
	}
	else if(_channel.ChannelWidth== CHANNEL_WIDTH_40)
	{
		if((bwidth == 40) || (bwidth == 80))
			BWSettingOfDesc = 1;
		else
			BWSettingOfDesc = 0;
	}
	else
		BWSettingOfDesc = 0;

	
  SET_TX_DESC_DATA_BW_8812(usb_frame, BWSettingOfDesc); 

  rtl8812a_cal_txdesc_chksum(usb_frame);
  _logger->info("tx desc formed");
  for (size_t i = 0; i < usb_frame_length; ++i) {
        // Print each byte as a two-digit hexadecimal number
        std::cout << "0x" << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(usb_frame[i]);
        
        // Print a space between bytes, but not after the last byte
        if (i < usb_frame_length - 1) {
            std::cout << ",";
        }
    }
    std::cout << std::dec << std::endl;  // Reset to decimal formatting
	// ----- end of fill tx desc ----- 
  uint8_t * addr=usb_frame+TXDESC_SIZE;
  memcpy(addr,packet + radiotap_length,real_packet_length);
  _logger->info("packet formed");
  for (size_t i = 0; i < usb_frame_length; ++i) {
        // Print each byte as a two-digit hexadecimal number
        std::cout << "0x" << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(usb_frame[i]);
        
        // Print a space between bytes, but not after the last byte
        if (i < usb_frame_length - 1) {
            std::cout << ",";
        }
    }
    std::cout << std::dec << std::endl;  // Reset to decimal formatting
					
    return _device.send_packet(usb_frame,usb_frame_length);
}

void Rtl8812aDevice::Init(Action_ParsedRadioPacket packetProcessor,
                          SelectedChannel channel) {
  _packetProcessor = packetProcessor;

  debug = 0;
  StartWithMonitorMode(channel);
  SetMonitorChannel(channel);

  // 設置無線模式爲支持任何協議
/*
  _device.rtw_write8(REG_RESP_SIFS_CCK,static_cast<uint8_t>(0x08));
  _device.rtw_write8(REG_RESP_SIFS_CCK + 1, static_cast<uint8_t>(0x08));
  _device.rtw_write8(REG_RESP_SIFS_OFDM, static_cast<uint8_t>(0x0a)); /* SIFS_T2T_OFDM (0x0a) 
	_device.rtw_write8(REG_RESP_SIFS_OFDM + 1, static_cast<uint8_t>(0x0a)); /* SIFS_R2T_OFDM(0x0a) 
  u8	R2T_SIFS = 0xa, SIFS_Timer = 0xe; //先不支持vht試試看看效果

  _device.rtw_write8(REG_SIFS_CTX + 1, SIFS_Timer);
		// SIFS for OFDM consecutive tx like CTS data! 
	_device.rtw_write8(REG_SIFS_TRX + 1, SIFS_Timer);

	_device.rtw_write8(REG_SPEC_SIFS + 1, SIFS_Timer);
	_device.rtw_write8(REG_MAC_SPEC_SIFS + 1, SIFS_Timer);

		/* 20100719 Joseph: Revise SIFS setting due to Hardware register definition change. 
	_device.rtw_write8(REG_RESP_SIFS_OFDM + 1, SIFS_Timer);
	_device.rtw_write8(REG_RESP_SIFS_OFDM, SIFS_Timer);

  _device.rtw_write8(REG_RESP_SIFS_OFDM + 1, R2T_SIFS);
*/
  _logger->info("設置爲支持多種調製模式");
  _logger->info("Listening air...");

  for (;;)
    _device.infinite_read();

#if 0
  _device.UsbDevice.SetBulkDataHandler(BulkDataHandler);
  _readTask = Task.Run(() = > _device.UsbDevice.InfinityRead());
#endif
}

void Rtl8812aDevice::SetMonitorChannel(SelectedChannel channel) {
  _channel = channel;
  _radioManagement->set_channel_bwmode(channel.Channel, channel.ChannelOffset,
                                      channel.ChannelWidth);
}

void Rtl8812aDevice::StartWithMonitorMode(SelectedChannel selectedChannel) {
  if (NetDevOpen(selectedChannel) == false) {
    throw std::ios_base::failure("StartWithMonitorMode failed NetDevOpen");
  }

  _radioManagement->SetMonitorMode();
}

bool Rtl8812aDevice::NetDevOpen(SelectedChannel selectedChannel) {
  auto status = _halModule.rtw_hal_init(selectedChannel);
  if (status == false) {
    return false;
  }

  return true;
}

SelectedChannel Rtl8812aDevice::GetSelectedChannel(){
  return _channel;
}
