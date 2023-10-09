*-----------------------------------------------------------
* Title      : 16-bit multiplication
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

    move.w  #0003,num1
    move.w  #0005,num2

    move.w  num1,d0     ; multiplicand
    mulu    num2,d0     ; unsigned multiplication
    move.l  d0,result   ; 32-bit result
  
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
num1    ds.w    1       ; 16-bit multiplicand
num2    ds.w    1       ; 16-bit multiplier
result  ds.l    1       ; 32-bit result

    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
