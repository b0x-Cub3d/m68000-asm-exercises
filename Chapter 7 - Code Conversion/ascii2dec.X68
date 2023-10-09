*-----------------------------------------------------------
* Title      : ascii2dec
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program
    
    moveq   #-1,d1      ; set error flag
    move.b  #'7',d0     ; get character
    sub.b   #'0',d0     ; is character below ascii zero?
    bcs.s   done        ; if yes then not a digit
    
    cmp.b   #9,d0       ; is character above ascii nine? 
    bhi.s   done        ; if yes then not a digit
    
    exg     d0,d1       ; get number of character (result)

done:
    rts
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000

    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
