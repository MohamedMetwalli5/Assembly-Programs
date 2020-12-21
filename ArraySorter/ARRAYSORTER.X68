*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    
           LEA sorted,A1     *the address of the sorted array at the end of sorting is stored in A1
           MOVE #7,D0        *the counter of the outer loop , and we made it 7 because we use "debra buit-in function" 
    
outerloop  MOVE.B  #0,D4     *set the max number at the beginning of every outer loop with 0
           MOVE    #7,D1     *the counter of the inner loop , and we made it 7 because we use "debra"
           LEA     list,A0   *the pointer for the elements in the inner (only loop of numbers) loop 
            
innerloop  MOVE.B  (A0),D2   *the element in the inner loop (the old loop)
           CMP.B   D4,D2     *to know which number of the two numbers is bigger
           BPL.B   setmax    *to set the bigger number in D4 , by going to branch "setmax"
           BRA     next      *not bigger number , then go to branch "next"
           
setmax     EXG     D4,D2      *setting the maximum number in D4 , by exchanging the contents of two registers (D2,D4)
           MOVE.L  A0,A2      *store the address of the max number until now in A2
           ADDA.L  #1,A0      *increament the address of A0
           BRA     there      *to avoid incresing A0 two times in case of entering the "setmax" , go to branch "there"
                   
next       ADDA.L  #1,A0          *increament the address of A0 to go to the next number
there      DBRA    D1,innerloop   *if the counter of the outer loop didn't indicate the end of the loop then go to the innerloop                
           MOVE.B  D4,(A1)+       *stting the maxnumber in the right position in the sorted array descendingly
           MOVE.B  #0,(A2)        *set the maximum number until now to be 0 in the old array as we use two arrays   
           DBRA D0,outerloop      *if the counter of the outer loop didn't indicate the end of the loop then go to the innerloop to find the next number    
           BRA     exit            

exit       *the end of sorting the array 

        
    SIMHALT             ; halt simulator

* Put variables and constants here

list DC.B 1,2,5,4,8,5,4,2         *the old array of size which to be eneter to be sorted
sorted DC.B 0,0,0,0,0,0,0,0       *the new sorted array of size 8 will be stored here descendingly after sorting the old array

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
