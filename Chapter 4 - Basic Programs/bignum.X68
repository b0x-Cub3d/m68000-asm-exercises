*-----------------------------------------------------------
* Title      : Find the Bigger Number
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.l  #$12345678, value1
    move.l  #$87654321, value2
    
    movem.l value1, d0/d1   ; load values to be compared
    cmp.l   d0, d1          ; compare 32-bit values
    bhi STORE               ; if value2 >= value1 then goto store
    move.l  d0,d1           ; ...else d1 = value1
    STORE: move.l   d1,result ; store larger value

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG    $2000

value1  ds.l    1       ; 1st value
value2  ds.l    1       ; 2nd value
result  ds.l    1       ; reserve long word storage

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
