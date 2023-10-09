*-----------------------------------------------------------
* Title      : Find the max number (looped)
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

                        ; INITIALIZATION
    move.w   #4, length            ; Store sample length
    move.l   #$00005000, initial   ; Store sample address to start storing of numbers
    movea.l  initial,a0  
    move.w   #$a48e,(a0)+ 
    move.w   #$71ac,(a0)+
    move.w   #$34f1,(a0)+
    move.w   #$e57a,(a0)+
    
                        ; PROGRAM STARTS
    
    movea.l initial,a0             ; initialize pointer register
    moveq   #0,d0                  ; max := 0
    move.w  length,d1              ; initialize element count
    
    beq.s   DONE                   ; if length = 0 then DONE
    
    LOOP: move.w  (a0)+,d2         ; temp := next data element
          cmp.w   d2,d0            ; compare temp with max, "max-temp" !
          bcc.s   LOOPTEST         ; if max > or = temp goto LOOPTEST
          
          move.w d2,d0             ; ...else new max, max := temp
    
    LOOPTEST: subq.w #1,d1         ; update element count
              bne LOOP             ; if count not zero then goto LOOP
              
    DONE: move.w d0,maxnum         ; store the max number as result

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
    
length   ds.w   1       
initial  ds.l   1
maxnum   ds.l   1

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
