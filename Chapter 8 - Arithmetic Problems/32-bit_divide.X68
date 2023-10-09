*-----------------------------------------------------------
* Title      : 32-bit binary divide
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

    move.l  #$0074cbb1,num1
    move.w  #$0141,num2

    move.l  num1,d0     ; 32-bit dividend
    divu    num2,d0     ; unsigned divide - num1/num2
    move.l  d0,remaind   ; store results-remainder & quotient
  
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
num1       ds.l    1       ; 32-bit dividend
num2       ds.w    1       ; 16-bit divisor
remaind    ds.w    1       ; 16-bit remainder
quotient   ds.w    1       ; 16-bit quotient


    END    START        ; last line of source






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
