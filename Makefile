# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /data/data/com.termux/files/usr/bin/sh

# The CMake executable.
CMAKE_COMMAND = /data/data/com.termux/files/usr/bin/cmake

# The command to remove a file.
RM = /data/data/com.termux/files/usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /data/data/com.termux/files/home/devourer_tx

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data/data/com.termux/files/home/devourer_tx

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "No interactive CMake dialog available..."
	/data/data/com.termux/files/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Running CMake to regenerate build system..."
	/data/data/com.termux/files/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /data/data/com.termux/files/home/devourer_tx/CMakeFiles /data/data/com.termux/files/home/devourer_tx//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /data/data/com.termux/files/home/devourer_tx/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named WiFiDriver

# Build rule for target.
WiFiDriver: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 WiFiDriver
.PHONY : WiFiDriver

# fast build rule for target.
WiFiDriver/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/build
.PHONY : WiFiDriver/fast

hal/Hal8812PwrSeq.o: hal/Hal8812PwrSeq.c.o
.PHONY : hal/Hal8812PwrSeq.o

# target to build an object file
hal/Hal8812PwrSeq.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/hal/Hal8812PwrSeq.c.o
.PHONY : hal/Hal8812PwrSeq.c.o

hal/Hal8812PwrSeq.i: hal/Hal8812PwrSeq.c.i
.PHONY : hal/Hal8812PwrSeq.i

# target to preprocess a source file
hal/Hal8812PwrSeq.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/hal/Hal8812PwrSeq.c.i
.PHONY : hal/Hal8812PwrSeq.c.i

hal/Hal8812PwrSeq.s: hal/Hal8812PwrSeq.c.s
.PHONY : hal/Hal8812PwrSeq.s

# target to generate assembly for a file
hal/Hal8812PwrSeq.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/hal/Hal8812PwrSeq.c.s
.PHONY : hal/Hal8812PwrSeq.c.s

hal/hal8812a_fw.o: hal/hal8812a_fw.c.o
.PHONY : hal/hal8812a_fw.o

# target to build an object file
hal/hal8812a_fw.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/hal/hal8812a_fw.c.o
.PHONY : hal/hal8812a_fw.c.o

hal/hal8812a_fw.i: hal/hal8812a_fw.c.i
.PHONY : hal/hal8812a_fw.i

# target to preprocess a source file
hal/hal8812a_fw.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/hal/hal8812a_fw.c.i
.PHONY : hal/hal8812a_fw.c.i

hal/hal8812a_fw.s: hal/hal8812a_fw.c.s
.PHONY : hal/hal8812a_fw.s

# target to generate assembly for a file
hal/hal8812a_fw.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/hal/hal8812a_fw.c.s
.PHONY : hal/hal8812a_fw.c.s

src/EepromManager.o: src/EepromManager.cpp.o
.PHONY : src/EepromManager.o

# target to build an object file
src/EepromManager.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/EepromManager.cpp.o
.PHONY : src/EepromManager.cpp.o

src/EepromManager.i: src/EepromManager.cpp.i
.PHONY : src/EepromManager.i

# target to preprocess a source file
src/EepromManager.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/EepromManager.cpp.i
.PHONY : src/EepromManager.cpp.i

src/EepromManager.s: src/EepromManager.cpp.s
.PHONY : src/EepromManager.s

# target to generate assembly for a file
src/EepromManager.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/EepromManager.cpp.s
.PHONY : src/EepromManager.cpp.s

src/FirmwareManager.o: src/FirmwareManager.cpp.o
.PHONY : src/FirmwareManager.o

# target to build an object file
src/FirmwareManager.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/FirmwareManager.cpp.o
.PHONY : src/FirmwareManager.cpp.o

src/FirmwareManager.i: src/FirmwareManager.cpp.i
.PHONY : src/FirmwareManager.i

# target to preprocess a source file
src/FirmwareManager.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/FirmwareManager.cpp.i
.PHONY : src/FirmwareManager.cpp.i

src/FirmwareManager.s: src/FirmwareManager.cpp.s
.PHONY : src/FirmwareManager.s

# target to generate assembly for a file
src/FirmwareManager.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/FirmwareManager.cpp.s
.PHONY : src/FirmwareManager.cpp.s

src/FrameParser.o: src/FrameParser.cpp.o
.PHONY : src/FrameParser.o

# target to build an object file
src/FrameParser.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/FrameParser.cpp.o
.PHONY : src/FrameParser.cpp.o

src/FrameParser.i: src/FrameParser.cpp.i
.PHONY : src/FrameParser.i

# target to preprocess a source file
src/FrameParser.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/FrameParser.cpp.i
.PHONY : src/FrameParser.cpp.i

src/FrameParser.s: src/FrameParser.cpp.s
.PHONY : src/FrameParser.s

# target to generate assembly for a file
src/FrameParser.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/FrameParser.cpp.s
.PHONY : src/FrameParser.cpp.s

src/HalModule.o: src/HalModule.cpp.o
.PHONY : src/HalModule.o

# target to build an object file
src/HalModule.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/HalModule.cpp.o
.PHONY : src/HalModule.cpp.o

src/HalModule.i: src/HalModule.cpp.i
.PHONY : src/HalModule.i

# target to preprocess a source file
src/HalModule.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/HalModule.cpp.i
.PHONY : src/HalModule.cpp.i

src/HalModule.s: src/HalModule.cpp.s
.PHONY : src/HalModule.s

# target to generate assembly for a file
src/HalModule.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/HalModule.cpp.s
.PHONY : src/HalModule.cpp.s

src/ParsedRadioPacket.o: src/ParsedRadioPacket.cpp.o
.PHONY : src/ParsedRadioPacket.o

# target to build an object file
src/ParsedRadioPacket.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/ParsedRadioPacket.cpp.o
.PHONY : src/ParsedRadioPacket.cpp.o

src/ParsedRadioPacket.i: src/ParsedRadioPacket.cpp.i
.PHONY : src/ParsedRadioPacket.i

# target to preprocess a source file
src/ParsedRadioPacket.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/ParsedRadioPacket.cpp.i
.PHONY : src/ParsedRadioPacket.cpp.i

src/ParsedRadioPacket.s: src/ParsedRadioPacket.cpp.s
.PHONY : src/ParsedRadioPacket.s

# target to generate assembly for a file
src/ParsedRadioPacket.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/ParsedRadioPacket.cpp.s
.PHONY : src/ParsedRadioPacket.cpp.s

src/RadioManagementModule.o: src/RadioManagementModule.cpp.o
.PHONY : src/RadioManagementModule.o

# target to build an object file
src/RadioManagementModule.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/RadioManagementModule.cpp.o
.PHONY : src/RadioManagementModule.cpp.o

src/RadioManagementModule.i: src/RadioManagementModule.cpp.i
.PHONY : src/RadioManagementModule.i

# target to preprocess a source file
src/RadioManagementModule.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/RadioManagementModule.cpp.i
.PHONY : src/RadioManagementModule.cpp.i

src/RadioManagementModule.s: src/RadioManagementModule.cpp.s
.PHONY : src/RadioManagementModule.s

# target to generate assembly for a file
src/RadioManagementModule.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/RadioManagementModule.cpp.s
.PHONY : src/RadioManagementModule.cpp.s

src/Rtl8812aDevice.o: src/Rtl8812aDevice.cpp.o
.PHONY : src/Rtl8812aDevice.o

# target to build an object file
src/Rtl8812aDevice.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/Rtl8812aDevice.cpp.o
.PHONY : src/Rtl8812aDevice.cpp.o

src/Rtl8812aDevice.i: src/Rtl8812aDevice.cpp.i
.PHONY : src/Rtl8812aDevice.i

# target to preprocess a source file
src/Rtl8812aDevice.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/Rtl8812aDevice.cpp.i
.PHONY : src/Rtl8812aDevice.cpp.i

src/Rtl8812aDevice.s: src/Rtl8812aDevice.cpp.s
.PHONY : src/Rtl8812aDevice.s

# target to generate assembly for a file
src/Rtl8812aDevice.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/Rtl8812aDevice.cpp.s
.PHONY : src/Rtl8812aDevice.cpp.s

src/RtlUsbAdapter.o: src/RtlUsbAdapter.cpp.o
.PHONY : src/RtlUsbAdapter.o

# target to build an object file
src/RtlUsbAdapter.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/RtlUsbAdapter.cpp.o
.PHONY : src/RtlUsbAdapter.cpp.o

src/RtlUsbAdapter.i: src/RtlUsbAdapter.cpp.i
.PHONY : src/RtlUsbAdapter.i

# target to preprocess a source file
src/RtlUsbAdapter.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/RtlUsbAdapter.cpp.i
.PHONY : src/RtlUsbAdapter.cpp.i

src/RtlUsbAdapter.s: src/RtlUsbAdapter.cpp.s
.PHONY : src/RtlUsbAdapter.s

# target to generate assembly for a file
src/RtlUsbAdapter.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/RtlUsbAdapter.cpp.s
.PHONY : src/RtlUsbAdapter.cpp.s

src/WiFiDriver.o: src/WiFiDriver.cpp.o
.PHONY : src/WiFiDriver.o

# target to build an object file
src/WiFiDriver.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/WiFiDriver.cpp.o
.PHONY : src/WiFiDriver.cpp.o

src/WiFiDriver.i: src/WiFiDriver.cpp.i
.PHONY : src/WiFiDriver.i

# target to preprocess a source file
src/WiFiDriver.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/WiFiDriver.cpp.i
.PHONY : src/WiFiDriver.cpp.i

src/WiFiDriver.s: src/WiFiDriver.cpp.s
.PHONY : src/WiFiDriver.s

# target to generate assembly for a file
src/WiFiDriver.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/WiFiDriver.cpp.s
.PHONY : src/WiFiDriver.cpp.s

src/main.o: src/main.cpp.o
.PHONY : src/main.o

# target to build an object file
src/main.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/main.cpp.o
.PHONY : src/main.cpp.o

src/main.i: src/main.cpp.i
.PHONY : src/main.i

# target to preprocess a source file
src/main.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/main.cpp.i
.PHONY : src/main.cpp.i

src/main.s: src/main.cpp.s
.PHONY : src/main.s

# target to generate assembly for a file
src/main.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/WiFiDriver.dir/build.make CMakeFiles/WiFiDriver.dir/src/main.cpp.s
.PHONY : src/main.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... WiFiDriver"
	@echo "... hal/Hal8812PwrSeq.o"
	@echo "... hal/Hal8812PwrSeq.i"
	@echo "... hal/Hal8812PwrSeq.s"
	@echo "... hal/hal8812a_fw.o"
	@echo "... hal/hal8812a_fw.i"
	@echo "... hal/hal8812a_fw.s"
	@echo "... src/EepromManager.o"
	@echo "... src/EepromManager.i"
	@echo "... src/EepromManager.s"
	@echo "... src/FirmwareManager.o"
	@echo "... src/FirmwareManager.i"
	@echo "... src/FirmwareManager.s"
	@echo "... src/FrameParser.o"
	@echo "... src/FrameParser.i"
	@echo "... src/FrameParser.s"
	@echo "... src/HalModule.o"
	@echo "... src/HalModule.i"
	@echo "... src/HalModule.s"
	@echo "... src/ParsedRadioPacket.o"
	@echo "... src/ParsedRadioPacket.i"
	@echo "... src/ParsedRadioPacket.s"
	@echo "... src/RadioManagementModule.o"
	@echo "... src/RadioManagementModule.i"
	@echo "... src/RadioManagementModule.s"
	@echo "... src/Rtl8812aDevice.o"
	@echo "... src/Rtl8812aDevice.i"
	@echo "... src/Rtl8812aDevice.s"
	@echo "... src/RtlUsbAdapter.o"
	@echo "... src/RtlUsbAdapter.i"
	@echo "... src/RtlUsbAdapter.s"
	@echo "... src/WiFiDriver.o"
	@echo "... src/WiFiDriver.i"
	@echo "... src/WiFiDriver.s"
	@echo "... src/main.o"
	@echo "... src/main.i"
	@echo "... src/main.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

