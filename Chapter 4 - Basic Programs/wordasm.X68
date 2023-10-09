*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.b  #$c,d0
    move.b  #$2,d1
    move.b  #$6,d2
    move.b  #$9,d3
    add.w   d0,d4       ; obviously could be turned into a loop
    lsl.w   #4,d4
    add.w   d1,d4
    lsl.w   #4,d4
    add.w   d2,d4
    lsl.w   #4,d4
    add.w   d3,d4
    

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
