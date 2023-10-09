*-----------------------------------------------------------
* Title      : Find first non-blank character
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

                        ; INITIALIZATION
    move.l   #$00005000, a0         ; Store string here 
    move.b   #$20,(a0)+             ; $20 = blank
    move.b   #$20,(a0)+ 
    move.b   #$20,(a0)+ 
    move.b   #$46,(a0)+             ; $46 = F
    move.b   #$20,(a0)+    
    move.l   #$00005000, a0         ; Point to the start of string
    moveq    #BLANK,d1              ; initialize for blank

    
loop:
    cmp.b   (a0)+,d1                ; is current char a blank? 
    beq     loop                    ; if yes, continue scan
    
    subq.l   #1,a0                  ; ...else adjust pointer to current char   
                                    ; result will be in a0 register
    
    
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $6000  

BLANK   EQU     ' '

    END    START        ; last line of source

    








*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
