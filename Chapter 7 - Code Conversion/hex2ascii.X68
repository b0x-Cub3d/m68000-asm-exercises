*-----------------------------------------------------------
* Title      : hex2ascii
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

    move.b  #$c,d0      ; get hex-digit
    cmp.b   #10,d0      ; is digit < 10?
    blt.s   add_0       ; if yes then add '0' only
    
    add.b   #'A'-'0'-10,d0  ; else add offset for 'A'-'F' also
    
add_0:
    add.b   #'0',d0     ; convert to ascii
    move.b  d0,d1       ; show result in d1   
  
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000 

    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
