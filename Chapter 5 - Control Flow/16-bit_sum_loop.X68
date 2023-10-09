*-----------------------------------------------------------
* Title      : 16-bit Sum of Data (Looped)
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

* Put program code here
                               ; Setting up the variables!!!
    movea.l #$00005000,a0      ; initialize pointer register
    moveq   #$0,d0             ; initialize sum to zero
    moveq   #$3,d1             ; initialize element count
    move.w  #$2040,(a0)+       ; store the sample values
    move.w  #$1c22,(a0)+
    move.w  #$0242,(a0)+
    movea.l #$00005000,a0      ; reset pointer register to properly start the program
    
LOOP: add.w  (a0)+,d0    ; sum next element
      subq.w #1,d1       ; update element count
      bne    LOOP        ; if count not zero then goto LOOP
      
      move.w d0,total    ; store summation

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG    $6000
   
total    ds.w    1       ; sum of data elements

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
