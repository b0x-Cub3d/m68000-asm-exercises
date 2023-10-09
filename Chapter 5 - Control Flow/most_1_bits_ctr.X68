*-----------------------------------------------------------
* Title      : Find element with most 1 bits (ctr)
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

                        ; INITIALIZATION
    move.w   #4,d0                    
    movea.l  #$00005000, a0  
    move.w   #$6779,(a0)+
    move.w   #$15e3,(a0)+
    move.w   #$68f2,(a0)+
    move.w   #$8700,(a0)+
    move.w   #$592a,(a0)+
    movea.l  #$00005000, a0 
    
;get_max_bits
; input:
; a0 - source
; d0 - length - 1
; return:
; a1 - first word with max # of set bits
; d1 - the number of bits
    
    
                        ; PROGRAM STARTS
    
get_max_bits:
    movea.l  a0,a1                   ; reset the max counters
    moveq    #0,d1                   ;
    
    moveq    #0,d2                   ; this will be kept 0
    
.next_word:
    move.w  (a0)+,d3                 ; get the next word
    moveq   #15,d4                   ; total # of bits
    moveq   #0,d5                    ; # of set bits

.next_bit:
    add.w   d3,d3                    ; shift left
    addx.w  d2,d5                    ; add 0 + carry
    dbf     d4,.next_bit

    cmp.w   d5,d1
    bcc.s   .skip                    ; branch if max >= current

    move.w  d5,d1
    
.skip:
    dbf     d0,.next_word
    rts    
  
* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
