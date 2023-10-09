*-----------------------------------------------------------
* Title      : Number of Negative, Positive, and Zero Numbers
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program
                        
    move.w   #6, length            ; Store sample length
    move.l   #$00005000, initial   ; Store sample address to start storing of numbers
    movea.l  initial,a0  
    move.w   #$7602,(a0)+ 
    move.w   #$8d48,(a0)+
    move.w   #$2120,(a0)+
    move.w   #$0000,(a0)+ 
    move.w   #$e605,(a0)+
    move.w   #$0004,(a0)+
    
    movea.l initial,a0             ; initialize pointer register
    moveq   #0,d0                  ; nneg := 0
    moveq   #0,d1                  ; npos := 0
    moveq   #0,d2                  ; nzro := 0
    move.w  length,d3              ; initialize element count
    
    beq.s   DONE

    
    LOOP:     move.w   (a0)+,d4              ; copy data element
              cmpi.w   #0,d4                  ; test data element
              blt.s    NEGT                  ; if < 0 then goto NEGT
              cmpi.w   #0,d4                  ; test data element
              bgt.s    POSI                  ; if > 0 then goto POSI

              addq.w   #1,d2                 ; ...else, it is zero
              bra      LOOPTEST        
          
    NEGT:     addq.w   #1,d0                 ; nneg := nneg + 1
              bra      LOOPTEST
    
    POSI:     addq.w   #1,d1                 ; npos := npos + 1    
    
    LOOPTEST: subq.w #1,d3               ; update element count
              bne LOOP                   ; if count not zero then goto LOOP
              
    DONE:     move.l d0,totalneg   ; store total number of negative numbers
              move.l d1,totalpos   ; store total number of positive numbers
              move.l d2,totalzro   ; store total number of zero numbers

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
    
length      ds.w   1       
initial     ds.l   1
totalneg    ds.l   1
totalpos    ds.l   1
totalzro    ds.l   1

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
