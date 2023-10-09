*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    ; Adjust num of elements and storage address of data here
    move.w  #3,length
    move.l  #$5000,begin
    ;;;;
    
    movea.l begin,a0      ; initialize pointer register
    moveq   #0,d0         ; initialize sum to zero
    move.w  length,d1     ; initialize element count
    
    beq.s   DONE          ; if length = 0 then done
    
LOOP:
    add.w   (a0)+,d0      ; sum next element
    bcc.s   LOOPTEST      ; if carry = 0 then goto looptest
    
    addi.l  #carrybit,d0  ; ...else add 16-bit carry
    
LOOPTEST:
    subq.w  #1,d1         ; update element count
    bne     LOOP          ; if count not zero then goto loop
    
DONE:
    move.l  d0,total

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG    $6000

length  ds.w    1   ; num of data elements
begin   ds.l    1   ; address of data elements
total   ds.l    1   ; sum of data elements
carrybit    EQU   $10000 ; carry bit value

    ORG     $5000
nums1 dc.w   $2040, $1C22, $0242


    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
