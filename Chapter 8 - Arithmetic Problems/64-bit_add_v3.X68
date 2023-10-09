*-----------------------------------------------------------
* Title      : 64-bit addition
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    movea.w #$6000,a0
    move.w  #$6a4d,(a0)+
    move.w  #$ed05,(a0)+
    move.w  #$a937,(a0)+
    move.w  #$6414,(a0)+
    movea.w #$6200,a1
    move.w  #$56c8,(a1)+
    move.w  #$46e6,(a1)+
    move.w  #$76c8,(a1)+
    move.w  #$4aea,(a1)+
    movea.w #$6000,a0
    movea.w #$6200,a1
    
* Put program code here
    
    movea.l #$6000+8,a0         ; address beyond end of first number
    movea.l #$6200+8,a1         ; address beyond end of second number
    move    #0,ccr              ; clear extend flag(and other flags)

    addx.l  -(a1),-(a0)         ; add lower long words, result in num1
    addx.l  -(a1),-(a0)         ; add higher long words, result in num1
    

    SIMHALT             ; halt simulator

* Put variables and constants here
    
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
