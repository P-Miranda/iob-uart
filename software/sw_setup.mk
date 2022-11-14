# (c) 2022-Present IObundle, Lda, all rights reserved
#
# This makefile segment lists all software header and source files 
#
# It is included in submodules/LIB/Makefile for populating the
# build directory
#

#sw accessible register headers
# pc-emul sources
SRC+=$(BUILD_PSRC_DIR)/iob_uart_swreg.h

$(BUILD_PSRC_DIR)/iob_uart_swreg.h: $(BUILD_ESRC_DIR)/iob_uart_swreg.h
	cp $< $@

# embedded sources
SRC+=$(BUILD_ESRC_DIR)/iob_uart_swreg.h $(BUILD_ESRC_DIR)/iob_uart_swreg_emb.c

$(BUILD_ESRC_DIR)/iob_uart_swreg%: $(UART_DIR)/mkregs.toml
	$(LIB_DIR)/scripts/mkregs.py iob_uart $(UART_DIR) SW --out_dir $(BUILD_ESRC_DIR)
