*-----------------------------------------------------------
* Title      : Count 1 bits
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

                        ; INITIALIZATION
                        
    move.l   #$00005000, d0         ; Store sample address to store number
    movea.l  d0,a0  
    move.l   #$b794,(a0)
    
                        ; PROGRAM STARTS
    
    moveq   #0,d1                   ; initialize the bit count
    movea.l d0,a0                   ; get address of number to count bits
    move.l  (a0),d0                 ; get number
    beq.s   DONE                    ; if zero then DONE
    
    LOOP:     btst.l  #0,d0         ; test the LSB if it is set
              beq     SKIP          ; if not, goto SKIP
              
              addq    #1,d1         ; otherwise, increment count
              
    SKIP:     lsr.l   #1,d0         ; shift number 1 bit to the left
              cmpi.l  #0,d0         ; see if number equals to zero
              bne     LOOP          ; if not, goto LOOP
              
    DONE:     move.b d1,bitnum      ; store bit count

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
           
bitnum   ds.b   1

    END    START        ; last line of source







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
