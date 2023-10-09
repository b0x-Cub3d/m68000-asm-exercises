*-----------------------------------------------------------
* Title      : Byte Disassembly (alternative)
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

* Put program code here
    move.b  #$5f,value  ; init variable
    clr.w d0            ; clear data reg. d0(0:15)
    move.b  value,d0    ; get byte to be disassembled
    rol.w   #4,d0       ; move byte to d0(4:11)
    lsr.b   #4,d0       ; shift d0(4:7) to d0(0:3)
    move.b  d0,result   ; store disassembled byte

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $6000

value   ds.b    1       ; byte to be disassembled
        ds.b    1       ; align result on word boundary
result  ds.w    1       ; storage for disassembled byte

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
