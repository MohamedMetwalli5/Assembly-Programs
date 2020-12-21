*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    MOVE.B   #0,D0  *the register that will be used to store the sum and we put in it an initial value of 0
    MOVE.B   #0,D1  *the register that will be used with the "trap (built-in function)" to print the sum  
    MOVE.B   NUM1,D0  *copy the first number to the sum register D0
    ADD.B    NUM2,D0  *add the second number to the sum register D0
    ADD.B    NUM3,D0  *add the third number to the sum register D0  
    ADD.B    NUM4,D0  *add the fourth number to the sum register D0  
    ADD.B    NUM5,D0  *add the fifth number to the sum register D0  
    ADD.B    NUM6,D0  *add the sixth number to the sum register D0  
    MOVE.B   D0,D1    *copy the content of the register "D0" to the register D1
    MOVE.B #$A,D2     *used to print the output (the sum) in decimal
    MOVE.B #$0f,D0    *used to print the output (the sum) in decimal  
    trap #15          *used to print the output (the sum) in decimal 
    
    SIMHALT             ; halt simulator

* Put variables and constants here
    
NUM1 DC.B $6  *store the first number
NUM2 DC.B $4  *store the second number  
NUM3 DC.B $C  *store the third number
NUM4 DC.B $10 *store the fourth number
NUM5 DC.B $11 *store the fifth number  
NUM6 DC.B $32 *store the sixth number
    
    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
