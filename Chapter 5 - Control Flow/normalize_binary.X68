*-----------------------------------------------------------
* Title      : Normalize a binary number
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

                        ; INITIALIZATION
    move.l   #$00005000, d0   ; Store sample address to store number
    movea.l  d0,a0  
    move.l   #$30001000,(a0)
    
                        ; PROGRAM STARTS
    
    moveq   #0,d1                  ; initialize the shift count
    movea.l d0,a0          ; get address of number to normalize
    move.l  (a0),d2                ; get number to be normalized
    ble.s   DONE                   ; if zero or normalized then DONE
    
    JUSTIFY:  addq.w  #1,d1         ; increment shift count
              lsl.l   #1,d2         ; shift number 1 bit to the left
              bpl     JUSTIFY       ; again if NEG = 0
              
    DONE:     move.b d1,shiftnum        ; store shift count
              move.l d2,justnum         ; store normalized number

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
           
justnum  ds.l   1
shiftnum ds.b   1

    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
