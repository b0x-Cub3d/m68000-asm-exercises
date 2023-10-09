*-----------------------------------------------------------
* Title      : bcd2bin v2
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                   ; first instruction of program

* Put program code here

    movea.w     #number,a0  ; pointer to 1st bcd digit
    moveq       #4-1,d0     ; number of digits(-1) to process
    clr.l       d1          ; clear final result
    clr.l       d2          ; clear digit register
    bra.s       nomult      ; skip multiply first time
    
loop:
    mulu.w       #10,d1     ; d1 = d1 * 10
    
nomult:
    move.b      (a0)+,d2    ; next bcd digit, (d2[15-8] unchanged)
    add.w       d2,d1       ; add next digit
    dbra        d0,loop     ; continue processing if still digits
    
    move.w      d1,result   ; store result

    SIMHALT              ; halt simulator

* Put variables and constants here
    ORG    $6000
    
number     dc.b     2,9,7,1   ; store number here
result     ds.w     1      ; store result here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
