*-----------------------------------------------------------
* Title      : Sum of 32-bit data (Looped with check) simpler version
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program
                        
    move.w   #3, length    ; Store sample length
    move.l   #$00005000, initial    ; Store sample address to start storing of numbers
    movea.l  initial,a0  
    move.w   #$2040,(a0)+ 
    move.w   #$1c22,(a0)+
    move.w   #$e242,(a0)+
    
    movea.l initial,a0  ; initialize pointer register
    moveq   #0,d0       ; initialize sum to zero
    move.l  d0,d2       ; clear temporary register
    move.w  length,d1   ; initialize element count
    
    beq.s   DONE        ; if length = 0 then DONE
    
    LOOP: move.w (a0)+,d2      ; d2[15-0] := data element
          add.l  d2,d0         ; add data element to sum
          subq.w #1,d1         ; update element count
          bne LOOP             ; if count not zero then goto loop
              
    DONE: move.l d0,total   ; store summation

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
    
length   ds.w   1       
initial  ds.l   1
total    ds.l   1

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
