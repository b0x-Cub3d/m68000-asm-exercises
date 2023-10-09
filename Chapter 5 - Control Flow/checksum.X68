*-----------------------------------------------------------
* Title      : Checksum
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

                        ; INITIALIZATION
    move.w   #$3, d1                ; Store sample length
    moveq    #$0, d0                ; Store the checksum here
    move.l   #$00005000, a0         ; Store sample address to start storing of numbers  
    move.b   #$28,(a0)+ 
    move.b   #$55,(a0)+
    move.b   #$26,(a0)+
    move.l   #$00005000, a0
    
    
                        ; PROGRAM STARTS
    
LOOP: move.b   (a0)+,d2             ; move value in
      eor.b    d2,d0                ; exclusive-or next element
      subq.w   #1,d1                ; update element count
      bne      LOOP                 ; if count not zero goto LOOP
          
      move.b   d0,checksum          ; store the checksum as result

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
    
checksum   ds.b   1       


    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
