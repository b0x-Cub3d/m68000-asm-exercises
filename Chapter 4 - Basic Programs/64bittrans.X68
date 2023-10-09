*-----------------------------------------------------------
* Title      : 64-bit Transfer
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.l #$3e2a42a1, value
    move.l #$21f260a0, value+4
    
    move.l value, result
    move.l value+4, result+4

    SIMHALT             ; halt simulator
    
* Put variables and constants here
    ORG    $6000
value   ds.l     2
    ORG    $6800
result  ds.l     2    

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
