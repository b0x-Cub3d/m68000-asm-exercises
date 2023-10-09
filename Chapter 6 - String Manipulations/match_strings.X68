*-----------------------------------------------------------
* Title      : Matching Strings
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

    lea      string1,a0         ; pointer to start of string1
    lea      string2,a1         ; pointer to start of string2
    moveq    #-1,d1             ; assume no match
    moveq    #0,d0              ; length counter := 0
    move.b   (a0)+,d0           ; init length counter
    cmp.b    (a1)+,d0           ; string length equal?
    bne.s    done               ; if not = then no match
    
    tst.b    d0                 ; string length = 0?
    beq.s    same               ; if = 0 then strings match
    
    subq.w   #1,d0              ; adjust counter for dbne
      
loop:
    cmpm.b    (a0)+,(a1)+       ; compare current string elements
    dbne      d0,loop           ; if match and not end of string, continue

same:    
    not.w   d1                  ; string match

done:
    rts    
  
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $5000   

string1  dc.b    3,'CAT',0             ; string to be processed

    ORG $5400   

string2  dc.b    3,'CAT',0             ; string to be processed

    END    START        ; last line of source

    










*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
