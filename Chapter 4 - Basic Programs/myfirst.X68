*-----------------------------------------------------------
* Title      : Hello World
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    lea message, a1     ; load message
    move.b  #14, d0     ; task #14 in d0 will display a null terminated string without a newline afterwards
    trap    #15         ; message is displayed on screen
    SIMHALT             ; halt simulator

* Put variables and constants here
message dc.b    'Hello World',0

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
