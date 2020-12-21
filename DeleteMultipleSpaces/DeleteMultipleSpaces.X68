*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
       
    
begin                 LEA  STRING,A0         *putting the address of the entered string in A0
                      LEA  RESULT,A1         *making the address of the resulted string to be in A1             
                      LEA  LENGTHOFSTRING,A2 *putting the length of the entered string in A2
                      MOVE.B (A2),D2         *store the length of the string in D2
                      SUB.B  #1,D2           *to use debra   
                
getfirstcharacter     MOVE.B (A0),D0         *putting the first character of the string in D0   
                      CMP.B   #32,D0         *is it a space
                      BEQ     again          *it is a space then go to branch "again"   
                      BRA     notspace       *it is a space then go to branch "notspace"
again                 ADDA.L #1,A0           *increament the address in A0   
                      BRA     getfirstcharacter  *still didn't meet any non-space character

notspace              MOVE.B  (A0)+,(A1)+    *put the first non-character of A0 in the first place in A1 and increament the two address registers
                      MOVE.B  #0,D0          *add the initial value of the flag that would indicate whether we have to append a character or not in the RESULT string
                      
                     
                      
loop                  MOVE.B  (A0),D1       *put the first character of A0 in the register D1   
                      CMP.B   #32,D1        *is D1 a white space ?    
                      BNE     here          *go to the branch "here" if D1 isn't a white space
                      BRA     there         *go to the branch "there" if D1 is a white space
here                  MOVE.B  #0,D0         *we set the flag D0 with 0
                      BRA     adddirectly   *go to branch "adddirectly" if D0 equals 0
there                 CMP.B   #0,D0         *check whether the flag is zero or one  
                      BNE     addhere       *don't add because you just added a space just before this  
adddirectly           MOVE.B  (A0)+,(A1)+   *add the character at the address "A0" to the position at the address "A1"
                      CMP.B   #32,D1        *check whether the character that was copied to D0 before is a space
                      BEQ     setflag1      *it is a space , then go to "setflag1"
                      BNE     setflag0      *it isn't a space , then go to "setflag0"

setflag1              MOVE.B  #1,D0      *set the flag D0 with 1
                      BRA     righthere  
addhere               ADDA.L  #1,A0      *increament the address "A0"
righthere             BRA     next       *go to the "next" branch to avoid going to the next two lines
setflag0              MOVE.B  #0,D0      *set the flag D0 with 0   
                      BRA     next       *go to the "next" branch                 
        
next                  DBRA   D2,loop     *repeat this loop again until D2 equals -1
                           
                     
    SIMHALT             ; halt simulator

* Put variables and constants here
STRING              DC.B     ' Ap ril 8   1985666'  *Enter the string here
LENGTHOFSTRING      DC.B     19                     *Enter the length of the string              
RESULT              DS.B     19                     *Enter the length of the string again (this is the place where the new string is going to be stored)  
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
