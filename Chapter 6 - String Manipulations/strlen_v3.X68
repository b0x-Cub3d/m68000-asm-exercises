*-----------------------------------------------------------
* Title      : Length of string (v3)
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

                        ; INITIALIZATION
    moveq    #256-1, d2             ; init max string length = 256
    move.w   d2,d0                  ; length count := max string length
    moveq    #CR, d1                ; init ascii value of CR
    move.l   #$00005000, a0         ; Store string here
    move.b   #'M',(a0)+
    move.b   #'C',(a0)+
    move.b   #'6',(a0)+ 
    move.b   #'8',(a0)+ 
    move.b   #'0',(a0)+ 
    move.b   #'0',(a0)+
    move.b   #'0',(a0)+
    move.b   #CR,(a0)+   
    move.l   #$00005000, a0         ; Point to the start of string
    
    ; scan string for carriage return, stop scan when
    ; carriage return found or 256 characters scanned.
    
loop:
    cmp.b   (a0)+,d1                  ; is current char a carriage return? 
    dbeq    d0,loop                   ; if no and not end of string - cont.
    
    sub.w   d0,d2                     ; determine string length   
    move.w   d2,d3                    ; show result
    
    
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $6000
 
CR  EQU $0d   

    END    START        ; last line of source

    







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
