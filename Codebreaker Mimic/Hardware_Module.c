/**-----------------------------------------------------------------------------------
  Author:       Ryan Woodward
  Class:        SWE350 - Embedded Systems 1
  Institution:  Grand Canyon University
  Instructor:   Professor Mark Reha
  Date:         12-9-2022
  File:         CodebreakerGameLogic.c
  Version:      4.0
  Description:  The C file containing all the code for working with board hardware
------------------------------------------------------------------------------------
 Notes:
    Milestone 5 - Modularize the start & close methods - model it after the mmap function in class example

 rewrite so that it communicates the seven seg. and then approripate it.
 ----------------------------------------------------------------------------------*/
#include "dependencies/terasic_os_includes.h"
#include "dependencies/LCD_Lib.h"
#include "dependencies/lcd_graphic.h"
#include "dependencies/font.h"

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "dependencies/address_map_arm.h"

//----------------------------------
// Fields
//----------------------------------

/*----- Fields for LCD -----*/
#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

/*----- Fields for Push Buttons -----*/
#define USER_IO_DIR     (0x01000000)
#define BIT_LED         (0x01000000)
#define BUTTON_MASK     (0x02000000)

//----------------------------------
// Fields
//----------------------------------
void *virtual_base;         // pointer to the virtual base address for LCD
int fd;                     // variable for mapping with LCD bridge
void *virtual_base_2;       // pointer to the virtual bridge for push buttons
int fd2;                    // variable for mapping with push button bridge
LCD_CANVAS LcdCanvas;       // LCD canvas variable- essentially for attributes of LCD
uint32_t  scan_input;
int i;                      // index variable
volatile int *KEY_ptr;      // pointer to the Pushbutton base address
int fd3;                    // value for mapping the gpio pins
void *virtual_base_3;       // pointer to virtual base for gpio pins
volatile unsigned int *JP1_ptr; // pointer to work with the GPIO pins

//----------------------------------
// Function Prototypes
//----------------------------------
void startLCD();
void writeToLCD(char someString[]);
void closeLCD();
void startButtons();
int readButton();
void closeButtons();
void startHexDisplay();
void writeToHexDisplay();
int closeHexDisplay();


//----------------------------------
// Functions
//----------------------------------
/**
 * This function is called to initialize the LCD. Sets up the virtual bridge and addresses
 * necessary to write to the LCD. Also assign values to LCD attributes
 */
void startLCD() {

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}
	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}
		//Assigns values to LCD attributes
		LcdCanvas.Width = LCD_WIDTH;
		LcdCanvas.Height = LCD_HEIGHT;
		LcdCanvas.BitPerPixel = 1;
		LcdCanvas.FrameSize = LcdCanvas.Width * LcdCanvas.Height / 8;
		LcdCanvas.pFrame = (void *)malloc(LcdCanvas.FrameSize);
		
	if (LcdCanvas.pFrame == NULL){
			printf("failed to allocate lcd frame buffer\r\n");
	}else{			
        //initializes the LCD HW pointer
		LCDHW_Init(virtual_base);
        //initializes the backlight for LCD
		LCDHW_BackLight(true); // turn on LCD backlight
	//initializes LCD
    LCD_Init();
    //Clear the Screen/canvas
    DRAW_Clear(&LcdCanvas, LCD_WHITE);
	}
}

/**
 * This function writes the passed 'string' to the LCD and then has the program sleep and
 * refreshes the LCD canvas
 * @param someString
 */
void writeToLCD(char someString[]){
    DRAW_Clear(&LcdCanvas, LCD_WHITE);
    DRAW_PrintString(&LcdCanvas, 1, 10, someString, LCD_BLACK, &font_16x16);
    DRAW_Refresh(&LcdCanvas);
    usleep(2500000);
}

/**
 * This function is used to handle the closing of the LCD and the un-allocation of LCD pointer
 * variables.
 */
void closeLCD(){
    DRAW_Clear(&LcdCanvas, LCD_WHITE);
    DRAW_Refresh(&LcdCanvas);
    LCDHW_BackLight(false);
    free(LcdCanvas.pFrame);

    if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
        printf( "ERROR: munmap() failed...\n" );
        close( fd );
        return( 1 );
    }
    close( fd );
}

/**
 * THis function handles the setup and initialization of the push buttons virtual bridge and addresses.
 */
void startButtons(){

    if( ( fd2 = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
        printf( "ERROR: could not open \"/dev/mem\"...\n" );
        return( 1 );
    }

    virtual_base_2 = mmap( NULL, LW_BRIDGE_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, LW_BRIDGE_BASE );

    if( virtual_base_2 == MAP_FAILED ) {
        printf( "ERROR: mmap2() failed...\n" );
        close( fd2 );
        return( 1 );
    }

    KEY_ptr = virtual_base_2 + KEY_BASE;
}

/**
 * THis function is used to read a value from a push button, it will continually loop
 * until a value aside 0 (meaning no button is depressed) is read.
 * @return
 */
int readButton(){
    int readValue = 0;
    while(true){

        if(*KEY_ptr != 0){
            readValue = *KEY_ptr;
            return readValue;
        }
        usleep(1*1000000);
    }
}

/**
 * This function handles the closing and un-allocation of memory for push button pointers
 */
void closeButtons(){

    if( munmap( virtual_base_2, LW_BRIDGE_SPAN ) != 0 ) {
        printf( "ERROR: munmap() failed...\n" );
        close( fd2 );
        return( 1 );
    }

    close( fd2 );
}

/**
 * This function handles the setup and initialization of the GPIO pins. It is named HEX
 * because it specifically designed to write through the BCD to 7 Segment Decoder
 */
void startHexDisplay(){
    if((fd3 = open("/dev/mem", (O_RDWR | O_SYNC))) == -1){
        printf("ERROR: Could not Open...");
        return (-1);
    }

    virtual_base_3 = mmap(NULL, LW_BRIDGE_SPAN, (PROT_READ | PROT_WRITE), MAP_SHARED, fd3, LW_BRIDGE_BASE);
    if(virtual_base_3 == MAP_FAILED){
        printf("ERROR: mmap() failed...");
        close(fd3);
        return (NULL);
    }

    JP1_ptr = (unsigned int *) (virtual_base_3 + JP1_BASE);
    *(JP1_ptr + 1) = 0x0000000F;
}

/**
 * This function handles writing a value (0-9) to the first HEX display (HEX0)
 * It accepts an integer argument and prints it on the seven segment display
 * @param passedIntArg
 */
void writeToHexDisplay(int passedIntArg){
    *(JP1_ptr + 0) = passedIntArg;
}

/**
 * This function handles the close, de-allocation of memoru, and general cleanup
 * after the Seven segment display has been written to.
 * @return  Integer - negative value is error in the un-mapping process
 */
int closeHexDisplay(){
    if(munmap (virtual_base_3, LW_BRIDGE_SPAN) != 0){
        printf("ERROR: munmap failed...");
        return(-1);
    }
    close(fd3);
    return 0;
}




