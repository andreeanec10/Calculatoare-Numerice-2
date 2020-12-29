main:
    ldi r20, 5
    ldi r16, 0
    push r20
    push r16
    rcall dif
    ret

dif:
    pop r16
    pop r20
    sub r16, r20
    ret