main:
    ldi r18, 6
sum:
    ldi r16, 0
    sub r18, r16
    brbs 1, end
    add r20, r18
    ldi r16, 1
    sub r18, r16
    rjmp sum
        
end:
    ret