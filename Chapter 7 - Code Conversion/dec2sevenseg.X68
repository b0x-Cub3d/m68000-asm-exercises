*-----------------------------------------------------------
* Title      : dec2sevenseg
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

    move.b    #3,digit      ; store var in digit

    movea.l  #sseg,a0      ; pointer to conversion table
    clr.b    d1      
    move.b   digit,d0      ; get digit
    cmp.b    #9,d0         ; valid digit?
    bhi.s    done          ; if not valid then clear result     
    
    ext.w   d0             ; make index byte look like a word
    move.b 0(a0,d0),d1     ; get seven-segment code from table

done:
    move.b d1,code         ; save bcd code 
  
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
    
digit   ds.b    1       ; digit
code    ds.b    1       ; bcd code
sseg    dc.b    $3f,$06,$5b,$4f,$66,$6d,$7d,$07,$7f,$6f ; conversion table

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
