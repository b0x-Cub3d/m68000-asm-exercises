*-----------------------------------------------------------
* Title      : Factorials
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.b  #5, value

    clr.w   d0              ; d0(0:15) := 0
    move.b  value,d0        ; get value
    add.b   d0,d0           ; d0(0:7) := 2 :: value
    movea.w #ftable,a0      ; initialize pointer to factorial table
    move.w  0(a0,d0),result ; store factorial result 

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $2000
    
ftable:
       dc   1              ; 0! := 1
       dc   1              ; 1! := 1
       dc   2              ; 2! := 2
       dc   6              ; 3! := 6
       dc   24             ; 4! := 24
       dc   120            ; 5! := 120
       dc   720            ; 6! := 720
       dc   5040           ; 7! := 5040

value  ds.b  1              ; determine factorial for this value
       ds.b  1              ; alignment storage
result ds.w  1              ; result of factorial
          
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
