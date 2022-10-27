DDRA        equ 0x01
    PORTA       equ 0x02
    TCCR0A      equ 0x19
    TCCR0B      equ 0x18
    TIMSK       equ 0x26
    OCR0A       equ 0x16
 
    rjmp        main            ; Adresa 0x0000
    reti                        ; Adresa 0x0001
    reti                        ; Adresa 0x0002
    reti                        ; Adresa 0x0003
    reti                        ; Adresa 0x0004
    reti                        ; Adresa 0x0005
    reti                        ; Adresa 0x0006
    reti                        ; Adresa 0x0007
    reti                        ; Adresa 0x0008
    rjmp        TIM0_COMPA_ISR  ; Adresa 0x0009
    reti                        ; Adresa 0x000A
    reti                        ; Adresa 0x000B
    reti                        ; Adresa 0x000C
    reti                        ; Adresa 0x000D
    reti                        ; Adresa 0x000E
    reti                        ; Adresa 0x000F
    reti                        ; Adresa 0x0010
 
TIM0_COMPA_ISR:
    ; TODO 4: Schimba?i (toggle) starea pinului PA0.
    ldi r18, 0b00000001
main:
    ; TODO 4: Configura?i pinul PA0 ca ?i ie?ire.
    ldi r16, 0b00000000
    out DDRA, r16

    ; TODO 4: Porni?i un timer care sã genereze o întrerupere de compara?ie pe canalul A. Pune?i
    ; valoarea 42 ca valoare de compara?ie pentru canalul A.
    ldi         R16, 0b00000000 ; COM0A = 0 (normal port operation, OC0A disconnected)
                                ; COM0B = 0 (normal port operation, OC0B disconnected)
                                ; WGM0[1:0] = 0 (normal mode operation)
    out         TCCR0A, R16

    ldi         R16, 0b00000001 ; WGM0[2] = 0 (normal mode operation)
                                ; CS0 = 1 (clkT = clkIO/1, no prescaling)
    out         TCCR0B, R16

    ldi r17, 42
    cp r16, r17
 
    ; TODO 4: Activa?i întreruperile global.
    sei
    
    ; De?i programul pare sã stea într-o buclã infinitã, ar trebui sã vedem cã totu?i starea
    ; pinului PA0 se schimbã.
    loop:
        rjmp loop