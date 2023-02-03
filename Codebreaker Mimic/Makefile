#
TARGET = ms5_codebreaker_4.0
ALT_DEVICE_FAMILY ?= soc_cv_av
SOCEDS_ROOT ?= $(SOCEDS_DEST_ROOT)
HWLIBS_ROOT = $(SOCEDS_ROOT)/ip/altera/hps/altera_hps/hwlib
CROSS_COMPILE = arm-linux-gnueabihf-
CFLAGS = -static -g -Wall -D$(ALT_DEVICE_FAMILY) -I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY)   -I$(HWLIBS_ROOT)/include/
LDFLAGS =  -g -Wall  
CC = $(CROSS_COMPILE)gcc
ARCH= arm


build: $(TARGET)


$(TARGET): main.o Hardware_Module.o GameLogic.o dependencies/terasic_lib.o  \
dependencies/LCD_Lib.o dependencies/LCD_Driver.o dependencies/LCD_Hw.o dependencies/lcd_graphic.o dependencies/font.o
	$(CC) $(LDFLAGS)   $^ -o $@   -lrt -lm
%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(TARGET) *.a *.o *~ *.bmp

.PHONY: all
all: $(TARGET)		
