*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    movea.l #$3000,a0    ; initialize pointer register
    moveq   #0,d0        ; initialize sum to zero
    move.w  #3,d1
    
LOOP:
    add.w (a0)+,d0      ; sum next element
    subq.w #1,d1        ; update element count
    bne    LOOP         ; if count not zero then goto loop
    
    move.w d0, total    ; store summation
    
    rts

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $2000
    
length  ds.w    1   ; number of data elements
begin   ds.l    1   ; address of data elements
total   ds.w    1   ; sum of data elements

    ORG     $3000

num1    dc.w    $2040   ; CONSTANTS
num2    dc.w    $1C22
num3    dc.w    $0242   
   
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
