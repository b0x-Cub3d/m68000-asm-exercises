*-----------------------------------------------------------
* Title      : Find the min num (looped)
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

                        ; INITIALIZATION
    move.w   #5, length            ; Store sample length
    move.l   #$00005000, initial   ; Store sample address to start storing of numbers
    movea.l  initial,a0  
    move.b   #$65,(a0)+ 
    move.b   #$79,(a0)+
    move.b   #$15,(a0)+
    move.b   #$e3,(a0)+
    move.b   #$72,(a0)+
    
                        ; PROGRAM STARTS
    
    movea.l initial,a0             ; initialize pointer register
    move.b  #$ff,d0                ; min := 255 (max num for byte)
    move.w  length,d1              ; initialize element count
    
    beq.s   DONE                   ; if length = 0 then DONE
    
    LOOP: move.b  (a0)+,d2         ; move element to register
          cmp.b   d2,d0            ; compare values
          bls.s   LOOPTEST         ; if min < or = temp goto LOOPTEST
          
          move.b  d2,d0            ; ...else new min, min := element
    
    LOOPTEST: subq.w #1,d1         ; update element count
              bne    LOOP          ; if count not zero then goto LOOP
              
    DONE: move.b d0,minnum         ; store the min number as result

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
    
length   ds.w   1       
initial  ds.l   1
minnum   ds.b   1

    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
