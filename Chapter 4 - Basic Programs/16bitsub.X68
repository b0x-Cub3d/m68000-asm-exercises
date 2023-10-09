*-----------------------------------------------------------
* Title      :16-bit Subtraction
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.w  #$3977, d0
    move.w  #$2182, d1
    sub.w   d1, d0

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
