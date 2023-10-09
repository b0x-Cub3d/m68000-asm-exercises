*-----------------------------------------------------------
* Title      : Find element with most 1 bits
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

                        ; INITIALIZATION
    move.w   #5,length                    
    move.l   #$00005000, initial
    movea.l  initial,a0  
    move.w   #$6779,(a0)+
    move.w   #$15e3,(a0)+
    move.w   #$68f2,(a0)+
    move.w   #$8700,(a0)+
    move.w   #$592a,(a0)+
    
    
                        ; PROGRAM STARTS
    
    moveq   #0,d0                   ; initialize the bit count (max)
    moveq   #0,d5                   ; initialize the bit count (temp)
    move.w  #$0000,d1               ; "zero" for testing
    movea.l initial,a0              ; get address for array of numbers
    move.w  length,d2               ; initialize element count
    
    beq.s   DONE                    ; if length = 0 then DONE
    
    OUTER_LOOP:     move.w  (a0)+,d3      ; move element to register
                    move.w  d3,d4         ; copy element to have its bits counted
                    moveq   #0,d5         ; restart counter
                    
            INNER_LOOP:          btst.l  #0,d4         ; test the LSB if it is set
                                 beq     SKIP          ; if not, goto SKIP
              
                                 addq    #1,d5         ; otherwise, increment count
              
            SKIP:                lsr.w   #1,d4         ; shift number 1 bit to the left
                                 cmpi.w  #0,d4         ; see if number equals to zero
                                 bne     INNER_LOOP    ; if not, goto INNER_LOOP
    
                    cmp.w   d0,d5       ; compare the bit counts
                    bcs     LOOP_TEST   ; if temp > max, then...

                    move.w  d5,d0       ; store new bit max
                    move.w  d3,d6       ; store number 
                    
    LOOP_TEST:      subq.w  #1,d2       ; update element count
                    bne     OUTER_LOOP  ; loop back to the beginning
              
    DONE:     move.b d0,bitnum      ; store bit count
              move.w d6,result      ; store resulting number

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
length   ds.w   1
initial  ds.l   1        
bitnum   ds.b   1
empty    ds.b   1 ; for alignment-sake
result   ds.w   1


    END    START        ; last line of source








*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
