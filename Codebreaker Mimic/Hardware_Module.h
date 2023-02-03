/**-----------------------------------------------------------------------------------
  Author:       Ryan Woodward
  Class:        SWE350 - Embedded Systems 1
  Institution:  Grand Canyon University
  Instructor:   Professor Mark Reha
  Date:         12-9-2022
  File:         Hardware_Module.h
  Version:      3.0
  Description:  Header file for Hardware_Module.c functions
------------------------------------------------------------------------------------*/
#ifndef MILESTONE3_MASTER_HARDWARE_MODULE_H
#define MILESTONE3_MASTER_HARDWARE_MODULE_H
extern void writeToLCD(char* aChar);
extern void startLCD();
extern void closeLCD();
extern void startButtons();
extern int readButton();
extern void closeButtons();
extern void startHexDisplay();
extern void writeToHexDisplay(int argVal);
extern int closeHexDisplay();
#endif //MILESTONE3_MASTER_HARDWARE_MODULE_H
