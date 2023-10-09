*-----------------------------------------------------------
* Title      : 16-bit multiplication via binary multiplication
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

    move.w  #$706f,num1
    move.w  #$0161,num2

    clr.l   d0          ; clear 32-bit product
    move.l  d0,d1       ; upper word must be clear for add.l
    move.w  num1,d1     ; 16-bit multiplicand
    move.w  num2,d2     ; 16-bit multiplier
    moveq   #16-1,d3    ; loop count := 16 (-1 for dbra)
    
loop:
    add.l   d0,d0      ; shift product left 1 bit
    add.w   d2,d2      ; shift multiplier left 1 bit
    bcc.s   step       ; if multiplier[15] was 1
    
    add.l   d1,d0      ; ...then add multiplicand

step:   
    dbra    d3,loop    ; ...else continue
    move.l  d0,result  : store result
  
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
