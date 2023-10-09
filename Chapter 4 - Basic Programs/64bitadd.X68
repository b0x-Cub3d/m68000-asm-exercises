*-----------------------------------------------------------
* Title      : 64-bit addition
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.l #$12a2e640, value1
    move.l #$f2100123, value1+4
    move.l #$001019bf, value2
    move.l #$40023f51, value2+4    

    movem.l value1, d0-d3    ; d0-d1 := value1 and d2-d3 := value2
    add.l   d3, d1           ; add least sign. long word
    addx.l  d2, d0           ; add most sig. long word with extend
    movem.l d0-d1, result    ; store 64 bit addition result

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG    $2000
    
value1  ds.l    2
value2  ds.l    2
result  ds.l    2
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
