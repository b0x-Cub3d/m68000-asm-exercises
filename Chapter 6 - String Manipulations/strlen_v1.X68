*-----------------------------------------------------------
* Title      : Length of string (v1)
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

                        ; INITIALIZATION
    moveq    #0, d0                 ; init string length
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
    
loop:
    cmpi.b   #CR,(a0)+              ; is curr char a carriage return    
    
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $6000
 
CR  EQU $0d   

    END    START        ; last line of source

    






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
