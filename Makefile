# Project Name
TARGET = Blink

# Sources
CPP_SOURCES = Blink.cpp 

# Library Locations
LIBDAISY_DIR = ./lib/libDaisy
DAISYSP_DIR = ./lib/DaisySP

# Core location, and generic makefile.
SYSTEM_FILES_DIR = $(LIBDAISY_DIR)/core

ifneq (,$(wildcard $(SYSTEM_FILES_DIR)))
	include $(SYSTEM_FILES_DIR)/Makefile
endif

$(LIBDAISY_DIR):
	mkdir -p $@
	curl -L -o - https://github.com/electro-smith/libDaisy/archive/refs/heads/master.tar.gz | tar -x -z -f - --strip-components=1 -C $@

$(DAISYSP_DIR):
	mkdir -p $@
	curl -L -o - https://github.com/electro-smith/DaisySP/archive/refs/heads/master.tar.gz | tar -x -z -f - --strip-components=1 -C $@

download_libs: $(LIBDAISY_DIR) $(DAISYSP_DIR)

clean_libs:
	rm -rf $(LIBDAISY_DIR) $(DAISYSP_DIR)

update_libs: clean_libs download_libs
