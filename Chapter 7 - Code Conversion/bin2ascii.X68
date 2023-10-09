*-----------------------------------------------------------
* Title      : bin2ascii
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                   ; first instruction of program

* Put program code here

    movea.l     #string+16,a0  ; pointer to end of string(+1)
    moveq       #15,d0         ; loop count(-1)
    move.b      #'0',d1         
    move.w      number,d2      ; skip multiply first time
    
loop:
    move.b      d1,-(a0)       ; assume current lsb is zero
    ror.w       #1,d2          ; test current lsb
    bcc.s       loopend        ; if zero then try next bit
    
    addi.b      #1,(a0)
    
loopend:
    dbra        d0,loop        ; process all bits

    SIMHALT              ; halt simulator

* Put variables and constants here
    ORG    $6000
    
number     dc.w     31d2   ; store number here
string     ds.w     1      ; store string here


    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
