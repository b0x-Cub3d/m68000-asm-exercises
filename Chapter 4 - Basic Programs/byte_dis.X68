*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

* Put program code here
    move.w  #$5F,d1
    move.b  d1,d0
    and.b   #MASK,d0
    move.b  d0,result+1
    move.b  d1,d0
    lsr.b   #4,d0
    move.b  d0,result

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $6000

MASK EQU    $000F       ; mask for lower nibble
value   ds.b    1       ; byte to be disassembled
        ds.b    1       ; align result on word boundary
result  ds.w    1       ; storage for disassembled byte

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
