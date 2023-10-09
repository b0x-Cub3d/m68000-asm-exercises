*-----------------------------------------------------------
* Title      : decimal addition v1
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

    move.l  #36701985,bcdnum1
    move.l  #12663459,bcdnum2

    clr.w   d2
    move.b  #LENGTH,d2
    move.w  d2,a2               ; a2[0-31] = bytes in bcd number
    lea     bcdnum1(a2),a0      ; points beyond end of bcdnum1
    lea     bcdnum2(a2),a1      ; points beyond end of bcdnum2
    
    subq    #1,d2               ; adjust length for loop termination
    move    #0,ccr              ; clear extend flag for abcd

loop:
    abcd.b  -(a1),-(a0)         ; bcd addition with extend
    dbra    d2,loop             ; continue  
  
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG     $6000
LENGTH      EQU     $04
    ORG     $6002      
bcdnum1     ds.l    1
    ORG     $6102
bcdnum2     ds.l    1

    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
