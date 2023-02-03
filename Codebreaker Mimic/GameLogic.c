/**-----------------------------------------------------------------------------------
  Author:       Ryan Woodward
  Class:        SWE350 - Embedded Systems 1
  Institution:  Grand Canyon University
  Instructor:   Professor Mark Reha
  Date:         12-9-2022
  File:         CodebreakerGameLogic.c
  Version:      4.0
  Description:  The C file containing the game logic for Codebreaker Game
------------------------------------------------------------------------------------
 NOTES:

 -----------------------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include "Hardware_Module.h"
#include "dependencies/address_map_arm.h"

//----------------------------------
// Fields
//----------------------------------
int playerSequence[4] = {0,0,0,0};  // Array to hold the sequence the player enters with push buttons
int codeSequence[4] = {0,0,0,0};    // Array to hold the sequence that is randomly generated
int usedNumberOfPlayerTurns = 0;                   // Variable to track expended number of turns for player
int maxNumberOfPlayerTurns = 3;                    // Variable to hold the max number of turns permitted for a player
bool playerWins = false;                           // Variable to hold a win/loss condition (T = win/ F = Loss)
int numCorrectPosition = 0;                        // Variale that holds the quantity of buttons in correct position following compareSequence function
int totalBtnsUsed = 0;                             // Variable that holds to quantity of buttons in player sequence that exist in code sequence

//----------------------------------
// Function Prototypes
//----------------------------------

void initGame();
void generateButtonSequence();
void gameLoop();
void playerTurn();
void displayTurns();
void computerTurn();
void compareSequences();
void checkForWin();
void gameConclusion(bool winLose);
void switchPrintToLCD(int valueToPrint);
void playAgain();

//----------------------------------
// Functions
//----------------------------------
/**
 * This Function is used to Initialize a game. When called this functional 'resets' all key variables to
 * their starting value to begin a new game of Codebreaker. Then Begins a game of Codebreaker
 */
void initGame(){
    playerWins = false;
    usedNumberOfPlayerTurns = 0;
    displayTurns();
    startLCD();
    generateButtonSequence();
    gameLoop();
}

/**
 * This function is called to fill the codeSequence array with randomly generated values between 0 and 4
 * Because the pressed buttons return values 1,2,4,8 the switch statement handles values of 3 and 4
 * and makes them 4 and 8 respectively
 */
void generateButtonSequence(){
    srand(time(0));

    int idx;
    for(idx = 0; idx < 4; idx++){
        codeSequence[idx] = rand()%4;
        switch(codeSequence[idx]){
            case 0: codeSequence[idx] = 1;
                break;
            case 1: codeSequence[idx] = 2;
                break;
            case 2: codeSequence[idx] = 4;
                break;
            case 3: codeSequence[idx] = 8;
        }
    }

    for(idx = 0; idx < 4; idx++){
        printf("codeSeq: %d\n", codeSequence[idx]);
    }
    // *********** FOR TESTING PURPOSES ONLY **********
    /*writeToLCD("Code Sequence");
    switchPrintToLCD(codeSequence[0]);
    switchPrintToLCD(codeSequence[1]);
    switchPrintToLCD(codeSequence[2]);
    switchPrintToLCD(codeSequence[3]);*/
}

/**
 * This Function serves as the primary game loop for codebreaker, should be called after initGame function
 * @param loopRunner - variable for game loop conditional statement
 */
void gameLoop(){
    writeToLCD("Welcome to...     Codebreaker!");

    while(usedNumberOfPlayerTurns < maxNumberOfPlayerTurns){
        playerTurn();
        usedNumberOfPlayerTurns++;
        displayTurns();
        computerTurn();
        compareSequences();
        checkForWin();
    }

    gameConclusion(playerWins);
    playAgain();
}

/**
 * This function serves to handle the user's turn within a game of codebreaker. This function sends
 * several prompts to be printed on the LCD and awaits the input of 4 button presses for there
 * guess of the code sequence.
 */
void playerTurn(){
    writeToLCD("Your Turn!");
    startButtons();
    writeToLCD("Press 1st Button");
    playerSequence[0]=readButton();
    //printf("playerSquence[0]: %d\n", playerSequence[0]);
    writeToLCD("Press 2nd Button");
    playerSequence[1]=readButton();
    //printf("playerSquence[1]: %d\n", playerSequence[1]);
    writeToLCD("Press 3rd Button");
    playerSequence[2]=readButton();
    //printf("playerSquence[2]: %d\n", playerSequence[2]);
    writeToLCD("Press 4th Button");
    playerSequence[3]=readButton();
    //printf("playerSquence[3]: %d\n", playerSequence[3]);
    closeButtons();
}

/**
 * This function serves to represent the computers turn. This function prints out, to the LCD, each
 * of the values (corresponding to buttons) the user entered as their sequence.
 */
void computerTurn(){
    writeToLCD("Your Sequence: ");

    int idx;
    for(idx =0; idx < 4; idx++){
        switch(playerSequence[idx]){
            case 1: writeToLCD("one");
                break;
            case 2: writeToLCD("two");
                break;
            case 4: writeToLCD("three");
                break;
            case 8: writeToLCD("four");
                break;
        }
    }
}

/**
 * This function is used to compare the two sequences variables to determine first, how many values and index match
 * and second, how many values of the code sequence exist in the user sequence
 */
void compareSequences(){

    /* Represents how many buttons the user entered that are correct and in the correct position of the code sequence */
    numCorrectPosition = 0;
    /* Represent how many buttons the user entered that match a use in the code array but not necessarily in the correct position */
    totalBtnsUsed = 0;

    /* These two array indices represent the quantity of the index used in the sequence.*/
    int valsInCodeSequence[4] = {0,0,0,0};
    int valsInPlyrSequence[4] = {0,0,0,0};

    /*-----------------------------------------------------------------------------
     * This first block is used for determining the number of of correct position
     * in the player entered sequence againt the code sequence
     *
     * this loop checks if the playerSequence matches the codeSequence and counts how many values are used correctly
     * from the user sequence to the code sequence. if numCorrectPosition equals 4 */
    int idx;
    for(idx = 0; idx < 4; idx++){
        if(playerSequence[idx] == codeSequence[idx]){
            numCorrectPosition++;
        }
    }

    /*--------------------------------------------------------------------------------
    * This second block is used to determine how many of the user entered values in the
    * player sequence array exist, including in quantity, in the code sequence array
    *
    * This Loop is used to track the quantity of a certain value contained in the
    * two game sequence arrays. the placeholder arrays' indices are incremented according
     * to what value is in the game sequence index*/
    //This loop uses switch statements to
    for(idx = 0; idx < 4; idx++){
        switch(playerSequence[idx]){//case 1 2 4 8
            case 1: valsInPlyrSequence[0]++;
                break;
            case 2: valsInPlyrSequence[1]++;
                break;
            case 4: valsInPlyrSequence[2]++;
                break;
            case 8: valsInPlyrSequence[3]++;
        }

        switch(codeSequence[idx]){//case 1 2 4 8
            case 1: valsInCodeSequence[0]++;
                break;
            case 2: valsInCodeSequence[1]++;
                break;
            case 4: valsInCodeSequence[2]++;
                break;
            case 8: valsInCodeSequence[3]++;
        }
    }

    /* This loop is used to compare the values in the placeholder arrays and increments the
     * tracking variable 'totalBtnsUsed' upon meeting certain conditions
     */
    for(idx = 0; idx < 4; idx++){

        //Condition if the vals at the index are the same. If they are the same, the user has it correct.
        /* This first condition checks if the values are the place holders indices are equal
         * If they are equal this means the player sequence has a correct button used */
        if(valsInPlyrSequence[idx] == valsInCodeSequence[idx]){
            totalBtnsUsed += valsInCodeSequence[idx];
        }

        /* First 'if' checks if either index of the array contains a '0 This is because if either contain '0' there is nothing to be done.
        * If user[i] = 0 or code[i] = 0 the user will always be wrong unless code[i] is also 0. That condition is handled above.*/
        if(valsInPlyrSequence[idx] != 0 && valsInCodeSequence[idx] != 0){

            /* the first nested-if handles if user[i] > code[i] the user has used more than the correct number of buttons
            so code[i] will increment the correct value to totalButtons used variable */
            if(valsInPlyrSequence[idx] > valsInCodeSequence[idx]){
                totalBtnsUsed += valsInCodeSequence[idx];

                /* this second nested-if handles if user{i] < code[i] the user has less than correct number of buttons
                user[i] will increment the correct value to totalButtons used variable */
            }else if(valsInPlyrSequence[idx] < valsInCodeSequence[idx]){
                totalBtnsUsed += valsInPlyrSequence[idx];
            }
        }
    }
    /**---------------------------------------------------------------------------------------*/

    /* This final code block is used to print the tracking variables to the LCD
     * the if-else statement handles the printing of values 3 and four */
    writeToLCD("# of Buttons in Correct Position");

    if(numCorrectPosition == 3){
        writeToLCD("three");
    }else if(numCorrectPosition == 4){
        writeToLCD("four");
    }else{
        switchPrintToLCD(numCorrectPosition);
    }

    writeToLCD("# of Buttons    that exist in   Code Sequence:");
    if(totalBtnsUsed == 3){
        writeToLCD("three");
    }else if(totalBtnsUsed == 4){
        writeToLCD("four");
    }else {
        switchPrintToLCD(totalBtnsUsed);
    }
}

/**
 * This function handles win or loss conditions in the game. It will be called to verify a win
 * (code sequence == player sequence) or a loss (all player turns expended)
 */
void checkForWin(){
    if(numCorrectPosition == 4){
        playerWins = true;
    }else if(numCorrectPosition != 4 && usedNumberOfPlayerTurns >= maxNumberOfPlayerTurns){
        playerWins = false;
    }
}

/**
 * This function handles the result from the checkForWin function.
 * the passed variables is the win or loss variable
 * @param winLose
 */
void gameConclusion(bool winLose){
    if(winLose){
        usedNumberOfPlayerTurns += 100;
        writeToLCD("You Won!");
    }else{
        writeToLCD("You Lost!");
    }
}

/**
 * This function handles printing to the LCD. Because Integers are inappropriate types to print
 * on the LCD the switch will pass the corresponding string of a vlid integer
 * @param valueToPrint
 */
void switchPrintToLCD(int valueToPrint){
    switch(valueToPrint){
        case 0: writeToLCD("Zero");
            break;
        case 1: writeToLCD("One");
            break;
        case 2: writeToLCD("Two");
            break;
        case 4: writeToLCD("Three");
            break;
        case 8: writeToLCD("Four");
            break;
        default:
            if(valueToPrint > 4){
                writeToLCD("Four");
            }
    }
}

/**
 * This loop handles the logic for a user to play again upon game conclusion.
 * button 0 is a no and button  is a yes
 */
void playAgain(){
    writeToLCD("Play Again?     (b0 = N/b1 = Y");
    startButtons();
    int checkValue = readButton();
    closeButtons();

    if(checkValue == 2){
        initGame();
    }else{
        writeToLCD("Auf Wiedersehen!");
        closeLCD();
    }
}

/**
 * This function is used to write the remaining turns to the hex display
 */
void displayTurns(){
    startHexDisplay();
    writeToHexDisplay(maxNumberOfPlayerTurns - usedNumberOfPlayerTurns);
    closeHexDisplay();
}