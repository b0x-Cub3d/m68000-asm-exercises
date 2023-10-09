*-----------------------------------------------------------
* Title      : Add Even Parity to ASCII Characters
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

    lea      string,a0         ; pointer to start of string
    moveq    #CHAR_0,d0        ; init with ascii zero
    moveq    #BLANK,d1         ; init with ascii blank
    move.w   #3,d2             ; string length to d2
    beq.s    done              ; if length = 0 then done
    subq.w   #1,d2             ; adjust string counter for dbra
      
loop:
    cmp.b    (a0)+,d0          ; is curr char zero?
    bne.s    done              ; if no then done
    
    move.b   d1,-1(a0)         ; replace zero with blank in curr char
    dbra     d2,loop           ; stop scan if all char = '0'

done:
    rts    
  
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $5000  

string  dc.b    '123456',0             ; string to be processed

    ORG $6000

CHAR_0  EQU   '0'                 ; ascii value for zero
BLANK   EQU   ' '                 ; ascii value for blank    

    END    START        ; last line of source

    









*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
