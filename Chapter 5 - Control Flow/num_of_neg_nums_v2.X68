*-----------------------------------------------------------
* Title      : Number of Negative Numbers v2
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program
                        
    move.w   #3, length            ; Store sample length
    move.l   #$00005000, initial   ; Store sample address to start storing of numbers
    movea.l  initial,a0  
    move.w   #$f1dc,(a0)+ 
    move.w   #$7e0a,(a0)+
    move.w   #$824b,(a0)+
    
    movea.l initial,a0             ; initialize pointer register
    moveq   #0,d0                  ; nneg := 0
    move.w  length,d1              ; initialize element count
    
    beq.s   DONE                   ; if length = 0 then DONE
    
    LOOP: move  (a0)+,d3           ; move number to d3
          btst  #15,d3             ; if the zero flag is set, then...
          beq   LOOPTEST           ; the number is positive
          
          addq.w #1,d0             ; ...else nneg := nneg + 1
    
    LOOPTEST: subq.w #1,d1         ; update element count
              bne LOOP             ; if count not zero then goto LOOP
              
    DONE: move.l d0,total   ; store total number of negative numbers

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
