; Disassembly of "mystery"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $000", ROM0[$0]

RST_00::
    ret


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

RST_08::
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

RST_10::
    add b
    ld b, b
    jr nz, jr_000_0024

    ld [$0204], sp
    db $01

RST_18::
    ld bc, $0402
    ld [$2010], sp
    ld b, b
    add b

RST_20::
    rst $38
    rst $38
    rst $38
    rst $38

jr_000_0024:
    rst $38
    rst $38
    rst $38
    rst $38

RST_28::
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

RST_30::
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

RST_38::
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

VBlankInterrupt::
    push hl
    ld hl, $c0a9
    jp Jump_000_0067


    rst $38

LCDCInterrupt::
    push hl
    ld hl, $c0b9
    jp Jump_000_0067


    rst $38

TimerOverflowInterrupt::
    push hl
    ld hl, $c0c9
    jp Jump_000_0067


    rst $38

SerialTransferCompleteInterrupt::
    push hl
    ld hl, $c0d9
    jp Jump_000_0067


    rst $38

JoypadTransitionInterrupt::
    push hl
    ld hl, $c0e9
    jp Jump_000_0067


Jump_000_0067:
    push af

    push bc
    push de

jr_000_006a:
    ld a, [hl+]
    or [hl]
    jr z, jr_000_0079

    push hl
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    call Call_000_007e
    pop hl
    inc hl
    jr jr_000_006a

jr_000_0079:
    pop de
    pop bc
    pop af
    pop hl
    reti


Call_000_007e:
    jp hl


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

Boot::
    nop
    jp Jump_000_0150


HeaderLogo::
    db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
    db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
    db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
    db "HACKLET", $00, $00, $00, $00, $00, $00, $00, $00, $00

HeaderNewLicenseeCode::
    db $00, $00

HeaderSGBFlag::
    db $00

HeaderCartridgeType::
    db $00

HeaderROMSize::
    db $00

HeaderRAMSize::
    db $00

HeaderDestinationCode::
    db $00

HeaderOldLicenseeCode::
    db $00

HeaderMaskROMVersion::
    db $01

HeaderComplementCheck::
    db $ea

HeaderGlobalChecksum::
    db $9d, $2b

Jump_000_0150:
    di
    ld d, a
    xor a
    ld sp, $e000
    ld hl, $dfff
    ld c, $20
    ld b, $00

jr_000_015d:
    ld [hl-], a
    dec b
    jr nz, jr_000_015d

    dec c
    jr nz, jr_000_015d

    ld hl, $feff
    ld b, $00

jr_000_0169:
    ld [hl-], a
    dec b
    jr nz, jr_000_0169

    ld hl, $ffff
    ld b, $80

jr_000_0172:
    ld [hl-], a
    dec b
    jr nz, jr_000_0172

    ld a, d
    ld [$c0a0], a
    call Call_000_0ea2
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ldh [rSTAT], a
    ldh [rWY], a
    ld a, $07
    ldh [rWX], a
    ld bc, $ff80
    ld hl, $0eb9
    ld b, $0a

jr_000_0192:
    ld a, [hl+]
    ld [c], a
    inc c
    dec b
    jr nz, jr_000_0192

    ld bc, $0e7a
    call Call_000_0e31
    ld bc, $0ec3
    call Call_000_0e43
    ld a, $e4
    ldh [rBGP], a
    ldh [rOBP0], a
    ld a, $1b
    ldh [rOBP1], a
    ld a, $c0
    ldh [rLCDC], a
    xor a
    ldh [rIF], a
    ld a, $09
    ldh [rIE], a
    xor a
    ldh [rNR52], a
    ldh [rSC], a
    ld a, $66
    ldh [rSB], a
    ld a, $80
    ldh [rSC], a
    xor a
    call Call_000_216a
    ei
    call Call_000_0f8d
    adc a
    ld [bc], a
    ld bc, $7600
    jr @-$01

    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret


    rst $38
    rst $38
    rst $38
    jp Jump_000_1e77


    rst $38
    jp Jump_000_1535


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

Call_000_0200:
    add sp, -$03
    ld hl, sp+$05
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, [bc]
    ld hl, sp+$02
    ld [hl], a
    cp $08
    jp nz, Jump_000_028a

    jr jr_000_0215

    jp Jump_000_028a


jr_000_0215:
    ld hl, $0001
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], d
    ld e, a
    ld a, [de]
    inc hl
    ld [hl], a
    or a
    jp nz, Jump_000_028a

    jr jr_000_022c

    jp Jump_000_028a


jr_000_022c:
    ld hl, $0002
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], d
    ld e, a
    ld a, [de]
    inc hl
    ld [hl], a
    cp $04
    jp nz, Jump_000_028a

    jr jr_000_0244

    jp Jump_000_028a


jr_000_0244:
    ld hl, $0003
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], d
    ld e, a
    ld a, [de]
    inc hl
    ld [hl], a
    cp $09
    jp nz, Jump_000_028a

    jr jr_000_025c

    jp Jump_000_028a


jr_000_025c:
    ld hl, $0004
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], d
    ld e, a
    ld a, [de]
    inc hl
    ld [hl], a
    cp $01
    jp nz, Jump_000_028a

    jr jr_000_0274

    jp Jump_000_028a


jr_000_0274:
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld a, [bc]
    ld c, a
    cp $03
    jp nz, Jump_000_028a

    jr jr_000_0285

    jp Jump_000_028a


jr_000_0285:
    ld e, $01
    jp Jump_PrintTitleScreen


Jump_000_028a:
    ld e, $00

Jump_PrintTitleScreen:
    add sp, $03
    ret


    add sp, -$2e
    ld hl, sp+$1a
    ld a, l
    ld d, h
    ld hl, sp+$05
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld e, [hl]
    ld hl, sp+$0b
    ld [hl+], a
    ld [hl], e
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_000_0faf
    inc d
    ld d, e
    ld e, b
    ld e, $16
    ld d, e
    ld a, d
    ld a, [bc]
    ld de, $494f
    inc c
    db $10
    ld e, e
    ld c, b
    inc bc
    inc d
    ld sp, $477c
    ld d, e
    nop
    ld hl, sp+$16
    ld a, l
    ld d, h
    ld hl, sp+$0b
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld e, [hl]
    ld hl, sp+$09
    ld [hl+], a
    ld [hl], e
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_000_0faf
    inc b
    db $10
    ld bc, $534d
    nop
    ld hl, sp+$10
    ld a, l
    ld d, h
    ld hl, sp+$09
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld e, [hl]
    ld hl, sp+$07
    ld [hl+], a
    ld [hl], e
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_000_0faf
    ld a, [$0000]
    ld hl, sp+$0f
    ld [hl], $00
    dec hl
    ld [hl], $01
    ld hl, $0537
    push hl
    call CallPrintDataToScreen
    add sp, $02
    ld hl, $054e
    push hl
    call CallPrintDataToScreen
    add sp, $02

CheckCode:
    xor a
    ld hl, sp+$0e
    or [hl]
    jp z, Jump_000_04d5

    call Call_000_20c4
    ld b, e
    ld a, b
    cp $01
    jp z, Jump_000_033d

    ld a, b
    cp $02
    jp z, Jump_000_0354

    ld a, b
    cp $04
    jp z, Jump_000_036e

    ld a, b
    cp $08
    jp z, Jump_000_039d

    ld a, b
    cp $10
    jp z, Jump_PrintFlagMessage

    ld a, b
    cp $80
    jp z, Jump_PrintFlagMessage

    jp JumpPrintActualFlag_001


Jump_000_033d:
    ld hl, sp+$0f
    ld a, [hl]
    xor $80
    cp $85
    jp nc, Jump_000_0348

    inc [hl]

Jump_000_0348:
    ld hl, $00c8
    push hl
    call Call_001_WaitLoop
    add sp, $02
    jp JumpPrintActualFlag_001


Jump_000_0354:
    ld e, $80
    ld hl, sp+$0f
    ld a, [hl]
    xor $80
    ld d, a
    ld a, e
    sub d
    jp nc, Jump_000_0362

    dec [hl]

Jump_000_0362:
    ld hl, $00c8
    push hl
    call Call_001_WaitLoop
    add sp, $02
    jp JumpPrintActualFlag_001


Jump_000_036e:
    ld hl, sp+$09
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$0f
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$07
    ld [hl+], a
    ld [hl], d
    ld e, a
    ld a, [de]
    ld b, a
    xor $80
    cp $89
    jp nc, Jump_000_0391

    ld a, b
    add $01
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld [de], a

Jump_000_0391:
    ld hl, $00c8
    push hl
    call Call_001_WaitLoop
    add sp, $02
    jp JumpPrintActualFlag_001


Jump_000_039d:
    ld hl, sp+$09
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$0f
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$07
    ld [hl+], a
    ld [hl], d
    ld e, a
    ld a, [de]
    ld b, a
    ld e, $80
    ld a, b
    xor $80
    ld d, a
    ld a, e
    sub d
    jp nc, Jump_000_03c3

    dec b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, b
    ld [de], a

Jump_000_03c3:
    ld hl, $00c8
    push hl
    call Call_001_WaitLoop
    add sp, $02
    jp JumpPrintActualFlag_001


Jump_PrintFlagMessage:
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_0200
    ld b, e
    add sp, $02
    xor a
    or b
    jp nz, Jump_PrintWrongPin

    ld hl, $0559
    push hl
    call CallPrintDataToScreen
    add sp, $02
    ld hl, $0566
    push hl
    call CallPrintDataToScreen
    add sp, $02
    ld hl, sp+$0e
    ld [hl], $00
    jp JumpPrintActualFlag


Jump_PrintWrongPin:
    ld hl, $0802
    push hl
    call Call_000_05a2
    add sp, $02
    ld hl, $0579
    push hl
    call CallPrintDataToScreen
    add sp, $02
    ld hl, $0bb8
    push hl
    call Call_001_WaitLoop
    add sp, $02
    call Call_000_0f04

JumpPrintActualFlag:
    ld hl, $00c8
    push hl
    call Call_001_WaitLoop
    add sp, $02

JumpPrintActualFlag_001:
    ld hl, $0601
    push hl
    call Call_000_05a2
    add sp, $02
    ld hl, sp+$0d
    ld [hl], $00

PrintFlagBitByBit:
    ld hl, sp+$0d
    ld a, [hl]
    xor $80
    cp $86
    ld a, $00
    rla
    ld c, a
    xor a
    or c
    jp z, Jump_000_047e

    ld hl, sp+$09
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$0d
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$07
    ld [hl+], a
    ld [hl], d
    ld e, a
    ld a, [de]
    ld hl, sp+$04
    ld [hl], a
    add $30
    dec hl
    ld [hl-], a
    dec hl
    ld [hl+], a
    inc hl
    ld a, [hl]
    rla
    sbc a
    dec hl
    ld [hl], a
    push bc
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0584
    push hl
    call CallPrintDataToScreen
    add sp, $04
    pop hl
    ld c, l
    ld hl, sp+$0d
    ld a, [hl]
    add $01
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld [hl], a
    jp PrintFlagBitByBit


Jump_000_047e:
    ld hl, sp+$0d
    ld [hl], $00

Jump_CheckCode:
    ld hl, sp+$0d
    ld a, [hl]
    xor $80
    cp $86
    jp nc, CheckCode

    ld e, [hl]
    ld a, e
    rlc a
    sbc a
    ld d, a
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$01
    ld [hl+], a
    ld [hl], d
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    ld a, $07
    push af
    inc sp
    ld a, c
    push af
    inc sp
    call Call_000_05a2
    add sp, $02
    ld hl, sp+$0d
    ld a, [hl+]
    inc hl
    cp [hl]
    jr nz, jr_000_04b7

    jr FlagPreparation

jr_000_04b7:
    jp Jump_000_04c6


FlagPreparation:
    ld hl, $0589
    push hl
    call CallPrintDataToScreen
    add sp, $02
    jp Jump_000_04cf


Jump_000_04c6:
    ld hl, $058b
    push hl
    call CallPrintDataToScreen
    add sp, $02

Jump_000_04cf:
    ld hl, sp+$0d
    inc [hl]
    jp Jump_CheckCode


Jump_000_04d5:
    ld hl, $0b00
    push hl
    call Call_000_05a2
    add sp, $02
    ld hl, sp+$0d
    ld [hl], $00

Jump_000_04e2:
    ld hl, sp+$0d
    ld a, [hl]
    xor $80
    cp $94
    jp nc, Jump_000_0534

    ld hl, sp+$05
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$0d
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    push bc
    ld a, $04
    push af
    inc sp
    ld hl, sp+$10
    ld a, [hl]
    push af
    inc sp
    call Call_000_05dd
    ld b, e
    add sp, $02
    pop hl
    ld c, l
    ld hl, sp+$0b
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$01
    ld [hl+], a
    ld [hl], d
    ld e, a
    ld a, [de]
    ld b, a
    xor c
    ld c, a
    rla
    sbc a
    ld b, a
    push bc
    ld hl, $058d
    push hl
    call CallPrintDataToScreen
    add sp, $04
    ld hl, sp+$0d
    inc [hl]
    jp Jump_000_04e2


Jump_000_0534:
    add sp, $2e
    ret


    jr nz, jr_000_0543

    ld b, e
    ld a, c
    ld d, e
    ld h, l
    ld h, e
    jr nz, jr_000_0589

    ld c, c
    jr nz, jr_000_058a

jr_000_0543:
    ld b, d
    jr nz, jr_000_058e

    ld h, c
    ld h, e
    ld l, e
    ld l, h
    ld h, l
    ld [hl], h
    ld a, [bc]
    nop
    ld a, [bc]
    ld b, l
    ld l, [hl]
    ld [hl], h
    ld h, l
    ld [hl], d
    jr nz, @+$52

    ld c, c
    ld c, [hl]
    nop
    ld a, [bc]
    ld b, e
    ld l, a
    ld l, [hl]
    ld h, a
    ld [hl], d
    ld h, c
    ld [hl], h
    ld [hl], e
    ld hl, $200a
    nop
    ld c, b
    ld h, l
    ld [hl], d
    ld h, l
    jr nz, jr_000_05d5

    ld [hl], e
    jr nz, jr_000_05e8

    ld l, a
    ld [hl], l
    ld [hl], d
    jr nz, jr_000_05da

    ld l, h
    ld h, c
    ld h, a
    ld a, [hl-]
    nop
    ld d, a
    ld [hl], d
    ld l, a
    ld l, [hl]
    ld h, a
    jr nz, @+$52

    ld c, c
    ld c, [hl]
    ld hl, $2000
    dec h
    ld h, e
    jr nz, jr_000_0589

jr_000_0589:
    ld e, [hl]

jr_000_058a:
    nop
    jr nz, jr_000_058d

jr_000_058d:
    dec h

jr_000_058e:
    ld h, e
    nop

Call_000_0590:
    push bc
    ld hl, sp+$04
    ld a, [hl]
    call Call_000_13d8
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld a, [hl]
    call Call_000_1401
    pop bc
    ret


Call_000_05a2:
    ld hl, sp+$02
    ld a, [hl+]
    ld [$c10f], a
    ld a, [hl]
    ld [$c110], a
    ret


    ld a, [$c0a1]
    and $02
    jr nz, jr_000_05b9

    push bc
    call Call_000_1535
    pop bc

jr_000_05b9:
    ld a, [$c10f]
    ld e, a
    ret


    ld a, [$c0a1]
    and $02
    jr nz, jr_000_05ca

    push bc
    call Call_000_1535
    pop bc

jr_000_05ca:
    ld a, [$c110]
    ld e, a
    ret


    ld hl, $0003
    add hl, sp
    ld e, [hl]
    dec hl

jr_000_05d5:
    ld l, [hl]
    ld c, l
    call Call_000_064f

jr_000_05da:
    ld e, c
    ld d, b
    ret


Call_000_05dd:
    ld hl, $0003
    add hl, sp
    ld e, [hl]
    dec hl
    ld l, [hl]
    ld c, l
    call Call_000_064f

jr_000_05e8:
    ret


    ld hl, $0005
    add hl, sp
    ld d, [hl]
    dec hl
    ld e, [hl]
    dec hl
    ld a, [hl]
    dec hl
    ld l, [hl]
    ld h, a
    ld b, h
    ld c, l
    call Call_000_0657
    ld e, c
    ld d, b
    ret


    ld hl, $0005
    add hl, sp
    ld d, [hl]
    dec hl
    ld e, [hl]
    dec hl
    ld a, [hl]
    dec hl
    ld l, [hl]
    ld h, a
    ld b, h
    ld c, l
    call Call_000_0657
    ret


    ld hl, $0003
    add hl, sp
    ld e, [hl]
    dec hl
    ld l, [hl]
    ld c, l
    call Call_000_0691
    ld e, c
    ld d, b
    ret


    ld hl, $0003
    add hl, sp
    ld e, [hl]
    dec hl
    ld l, [hl]
    ld c, l
    call Call_000_0691
    ret


Call_000_0629:
    ld hl, $0005
    add hl, sp
    ld d, [hl]
    dec hl
    ld e, [hl]
    dec hl
    ld a, [hl]
    dec hl
    ld l, [hl]
    ld h, a
    ld b, h
    ld c, l
    call Call_000_0694
    ld e, c
    ld d, b
    ret


Call_000_063d:
    ld hl, $0005
    add hl, sp
    ld d, [hl]
    dec hl
    ld e, [hl]
    dec hl
    ld a, [hl]
    dec hl
    ld l, [hl]
    ld h, a
    ld b, h
    ld c, l
    call Call_000_0694
    ret


Call_000_064f:
    ld a, c
    rlca
    sbc a
    ld b, a
    ld a, e
    rlca
    sbc a
    ld d, a

Call_000_0657:
    ld a, b
    ld [$c111], a
    xor d
    ld [$c112], a
    bit 7, d
    jr z, jr_000_0669

    sub a
    sub e
    ld e, a
    sbc a
    sub d
    ld d, a

jr_000_0669:
    bit 7, b
    jr z, jr_000_0673

    sub a
    sub c
    ld c, a
    sbc a
    sub b
    ld b, a

jr_000_0673:
    call Call_000_0694
    ret c

    ld a, [$c112]
    and $80
    jr z, jr_000_0684

    sub a
    sub c
    ld c, a
    sbc a
    sub b
    ld b, a

jr_000_0684:
    ld a, [$c111]
    and $80
    ret z

    sub a
    sub e
    ld e, a
    sbc a
    sub d
    ld d, a
    ret


Call_000_0691:
    ld b, $00
    ld d, b

Call_000_0694:
    ld a, e
    or d
    jr nz, jr_000_069f

    ld bc, $0000
    ld d, b
    ld e, c
    scf
    ret


jr_000_069f:
    ld l, c
    ld h, b
    ld bc, $0000
    or a
    ld a, $10

jr_000_06a7:
    ld [$c113], a
    rl l
    rl h
    rl c
    rl b
    push bc
    ld a, c
    sbc e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    ccf
    jr c, jr_000_06bf

    pop bc
    jr jr_000_06c1

jr_000_06bf:
    inc sp
    inc sp

jr_000_06c1:
    ld a, [$c113]
    dec a
    jr nz, jr_000_06a7

    ld d, b
    ld e, c
    rl l
    ld c, l
    rl h
    ld b, h
    or a
    ret


Call_000_06d1:
    push hl
    ld hl, $c125
    ld a, $13
    cp [hl]
    jr z, jr_000_06dd

    inc [hl]
    jr jr_000_06ec

jr_000_06dd:
    ld [hl], $00
    ld hl, $c126
    ld a, $11
    cp [hl]
    jr z, jr_000_06ea

    inc [hl]
    jr jr_000_06ec

jr_000_06ea:
    ld [hl], $00

jr_000_06ec:
    pop hl
    ret


Call_000_06ee:
    ld a, b
    ld [$c118], a
    ld a, c
    ld [$c11a], a
    xor a
    ld [$c119], a
    ld a, d
    ld [$c11b], a
    cpl
    ld l, a
    ld h, $ff
    inc hl
    ld bc, $0000
    add hl, bc
    ld a, l
    ld [$c120], a
    ld a, h
    ld [$c11f], a

Jump_000_070f:
jr_000_070f:
    ld a, [$c119]
    ld b, a
    ld a, [$c11b]
    sub b
    ret c

    ld a, [$c117]
    or a
    call z, Call_000_0825
    ld a, [$c11f]
    bit 7, a
    jr z, jr_000_0753

    ld a, [$c117]
    or a
    call nz, Call_000_0791
    ld a, [$c119]
    inc a
    ld [$c119], a
    ld a, [$c11f]
    ld b, a
    ld a, [$c120]
    ld c, a
    ld h, $00
    ld a, [$c119]
    ld l, a
    add hl, hl
    add hl, hl
    add hl, bc
    ld bc, $0006
    add hl, bc
    ld a, h
    ld [$c11f], a
    ld a, l
    ld [$c120], a
    jr jr_000_070f

jr_000_0753:
    ld a, [$c117]
    or a
    call nz, Call_000_07c9
    ld a, [$c119]
    inc a
    ld [$c119], a
    ld b, $00
    ld a, [$c119]
    ld c, a
    ld h, $ff
    ld a, [$c11b]
    cpl
    ld l, a
    inc hl
    add hl, bc
    ld a, [$c11f]
    ld b, a
    ld a, [$c120]
    ld c, a
    add hl, hl
    add hl, hl
    add hl, bc
    ld bc, $000a
    add hl, bc
    ld a, h
    ld [$c11f], a
    ld a, l
    ld [$c120], a
    ld a, [$c11b]
    dec a
    ld [$c11b], a
    jp Jump_000_070f


Call_000_0791:
    ld a, [$c118]
    ld b, a
    ld a, [$c11a]
    ld c, a
    ld a, [$c119]
    ld d, a
    ld a, [$c11b]
    ld e, a
    push bc
    push de
    ld a, b
    sub e
    ld h, a
    ld a, b
    add e
    ld b, a
    ld a, c
    add d
    ld c, a
    ld d, h
    ld e, c
    call Call_000_0979
    pop de
    pop bc
    ld a, d
    or a
    ret z

    push bc
    push de
    ld a, b
    sub e
    ld h, a
    ld a, b
    add e
    ld b, a
    ld a, c
    sub d
    ld c, a
    ld d, h
    ld e, c
    call Call_000_0979
    pop de
    pop bc
    ret


Call_000_07c9:
    ld a, [$c118]
    ld b, a
    ld a, [$c11a]
    ld c, a
    ld a, [$c119]
    ld d, a
    ld a, [$c11b]
    ld e, a
    push bc
    push de
    ld a, b
    sub e
    ld h, a
    ld a, b
    add e
    ld b, a
    ld a, c
    add d
    ld c, a
    ld d, h
    ld e, c
    call Call_000_0979
    pop de
    pop bc
    push bc
    push de
    ld a, b
    sub e
    ld h, a
    ld a, b
    add e
    ld b, a
    ld a, c
    sub d
    ld c, a
    ld d, h
    ld e, c
    call Call_000_0979
    pop de
    pop bc
    ld a, d
    sub e
    ret z

    push bc
    push de
    ld a, b
    sub d
    ld h, a
    ld a, b
    add d
    ld b, a
    ld a, c
    sub e
    ld c, a
    ld d, h
    ld e, c
    call Call_000_0979
    pop de
    pop bc
    push bc
    push de
    ld a, b
    sub d
    ld h, a
    ld a, b
    add d
    ld b, a
    ld a, c
    add e
    ld c, a
    ld d, h
    ld e, c
    call Call_000_0979
    pop de
    pop bc
    ret


Call_000_0825:
    ld a, [$c118]
    ld b, a
    ld a, [$c11a]
    ld c, a
    ld a, [$c119]
    ld d, a
    ld a, [$c11b]
    ld e, a
    push bc
    push de
    ld a, b
    add d
    ld b, a
    ld a, c
    sub e
    ld c, a
    call Call_000_0c0a
    pop de
    pop bc
    push bc
    push de
    ld a, b
    sub e
    ld b, a
    ld a, c
    sub d
    ld c, a
    call Call_000_0c0a
    pop de
    pop bc
    push bc
    push de
    ld a, b
    sub d
    ld b, a
    ld a, c
    add e
    ld c, a
    call Call_000_0c0a
    pop de
    pop bc
    push bc
    push de
    ld a, b
    add e
    ld b, a
    ld a, c
    add d
    ld c, a
    call Call_000_0c0a
    pop de
    pop bc
    ld a, d
    or a
    ret z

    sub e
    ret z

    push bc
    push de
    ld a, b
    sub d
    ld b, a
    ld a, c
    sub e
    ld c, a
    call Call_000_0c0a
    pop de
    pop bc
    push bc
    push de
    ld a, b
    sub e
    ld b, a
    ld a, c
    add d
    ld c, a
    call Call_000_0c0a
    pop de
    pop bc
    push bc
    push de
    ld a, b
    add d
    ld b, a
    ld a, c
    add e
    ld c, a
    call Call_000_0c0a
    pop de
    pop bc
    push bc
    push de
    ld a, b
    add e
    ld b, a
    ld a, c
    sub d
    ld c, a
    call Call_000_0c0a
    pop de
    pop bc
    ret


Call_000_08a3:
    ld a, [$c118]
    ld b, a
    ld a, [$c119]
    ld c, a
    sub b
    jr nc, jr_000_08b6

    ld a, c
    ld [$c118], a
    ld a, b
    ld [$c119], a

jr_000_08b6:
    ld a, [$c11a]
    ld b, a
    ld a, [$c11b]
    ld c, a
    sub b
    jr nc, jr_000_08c9

    ld a, c
    ld [$c11a], a
    ld a, b
    ld [$c11b], a

jr_000_08c9:
    ld a, [$c118]
    ld b, a
    ld d, a
    ld a, [$c11a]
    ld c, a
    ld a, [$c11b]
    ld e, a
    call Call_000_0979
    ld a, [$c119]
    ld b, a
    ld d, a
    ld a, [$c11a]
    ld c, a
    ld a, [$c11b]
    ld e, a
    call Call_000_0979
    ld a, [$c118]
    inc a
    ld [$c118], a
    ld a, [$c119]
    dec a
    ld [$c119], a
    ld a, [$c118]
    ld b, a
    ld a, [$c119]
    ld d, a
    ld a, [$c11a]
    ld c, a
    ld e, a
    call Call_000_0979
    ld a, [$c118]
    ld b, a
    ld a, [$c119]
    ld d, a
    ld a, [$c11b]
    ld c, a
    ld e, a
    call Call_000_0979
    ld a, [$c117]
    or a
    ret z

    ld a, [$c118]
    ld b, a
    ld a, [$c119]
    sub b
    ret c

    ld a, [$c11a]
    inc a
    ld [$c11a], a
    ld a, [$c11b]
    dec a
    ld [$c11b], a
    ld a, [$c11a]
    ld b, a
    ld a, [$c11b]
    sub b
    ret c

    ld a, [$c114]
    ld c, a
    ld a, [$c115]
    ld [$c114], a
    ld a, c
    ld [$c115], a

jr_000_094a:
    ld a, [$c118]
    ld b, a
    ld a, [$c119]
    ld d, a
    ld a, [$c11a]
    ld c, a
    ld e, a
    call Call_000_0979
    ld a, [$c11b]
    ld b, a
    ld a, [$c11a]
    cp b
    jr z, jr_000_096a

    inc a
    ld [$c11a], a
    jr jr_000_094a

jr_000_096a:
    ld a, [$c114]
    ld c, a
    ld a, [$c115]
    ld [$c114], a
    ld a, c
    ld [$c115], a
    ret


Call_000_0979:
    ld a, c
    sub e
    jr nc, jr_000_097f

    cpl
    inc a

jr_000_097f:
    ld [$c11d], a
    ld h, a
    ld a, b
    sub d
    jr nc, jr_000_0989

    cpl
    inc a

jr_000_0989:
    ld [$c11c], a
    sub h
    jp c, Jump_000_0af6

    ld a, b
    sub d
    jp nc, Jump_000_09a1

    ld a, c
    sub e
    jr z, jr_000_09ad

    ld a, $00
    jr nc, jr_000_09ad

    ld a, $ff
    jr jr_000_09ad

Jump_000_09a1:
    ld a, e
    sub c
    jr z, jr_000_09ab

    ld a, $00
    jr nc, jr_000_09ab

    ld a, $ff

jr_000_09ab:
    ld b, d
    ld c, e

jr_000_09ad:
    ld [$c11e], a
    ld hl, $1f60
    ld d, $00
    ld e, c
    add hl, de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, b
    and $f8
    ld e, a
    add hl, de
    add hl, de
    ld a, [$c11d]
    or a
    jp z, Jump_000_0a9a

    push hl
    ld h, $00
    ld l, a
    add hl, hl
    ld a, h
    ld [$c121], a
    ld a, l
    ld [$c122], a
    ld d, h
    ld e, l
    ld a, [$c11c]
    cpl
    ld l, a
    ld h, $ff
    inc hl
    add hl, de
    ld a, h
    ld [$c11f], a
    ld a, l
    ld [$c120], a
    ld a, [$c11c]
    cpl
    ld l, a
    ld h, $ff
    inc hl
    ld a, [$c11d]
    ld d, $00
    ld e, a
    add hl, de
    add hl, hl
    ld a, h
    ld [$c123], a
    ld a, l
    ld [$c124], a
    pop hl
    ld a, [$c11c]
    ld e, a
    ld a, b
    and $07
    add $10
    ld c, a
    ld b, $00
    ld a, [bc]
    ld b, a
    ld c, a

Jump_000_0a10:
    rrc c
    ld a, [$c11f]
    bit 7, a
    jr z, jr_000_0a41

    push de
    bit 7, c
    jr z, jr_000_0a28

    ld a, b
    cpl
    ld c, a
    call Call_000_0c27
    dec hl
    ld c, $80
    ld b, c

jr_000_0a28:
    ld a, [$c120]
    ld d, a
    ld a, [$c122]
    add d
    ld [$c120], a
    ld a, [$c11f]
    ld d, a
    ld a, [$c121]
    adc d
    ld [$c11f], a
    pop de
    jr jr_000_0a82

jr_000_0a41:
    push de
    push bc
    ld a, b
    cpl
    ld c, a
    call Call_000_0c27
    ld a, [$c11e]
    or a
    jr z, jr_000_0a5b

    inc hl
    ld a, l
    and $0f
    jr nz, jr_000_0a69

    ld de, $0130
    add hl, de
    jr jr_000_0a69

jr_000_0a5b:
    dec hl
    dec hl
    dec hl
    ld a, l
    and $0f
    xor $0e
    jr nz, jr_000_0a69

    ld de, $fed0
    add hl, de

jr_000_0a69:
    ld a, [$c120]
    ld d, a
    ld a, [$c124]
    add d
    ld [$c120], a
    ld a, [$c11f]
    ld d, a
    ld a, [$c123]
    adc d
    ld [$c11f], a
    pop bc
    ld b, c
    pop de

jr_000_0a82:
    bit 7, c
    jr z, jr_000_0a8d

    push de
    ld de, $0010
    add hl, de
    pop de
    ld b, c

jr_000_0a8d:
    ld a, b
    or c
    ld b, a
    dec e
    jp nz, Jump_000_0a10

    ld a, b
    cpl
    ld c, a
    jp Jump_000_0c27


Jump_000_0a9a:
    ld a, [$c11c]
    ld e, a
    inc e
    ld a, b
    and $07
    jr z, jr_000_0ab8

    push hl
    add $10
    ld l, a
    ld h, $00
    ld c, [hl]
    pop hl
    xor a

jr_000_0aad:
    rrca
    or c
    dec e
    jr z, jr_000_0ac0

    bit 0, a
    jr z, jr_000_0aad

    jr jr_000_0ac0

jr_000_0ab8:
    ld a, e
    dec a
    and $f8
    jr z, jr_000_0ae7

    jr jr_000_0acc

jr_000_0ac0:
    ld b, a
    cpl
    ld c, a
    push de
    call Call_000_0c27
    ld de, $000f
    add hl, de
    pop de

jr_000_0acc:
    ld a, e
    or a
    ret z

    and $f8
    jr z, jr_000_0ae7

    xor a
    ld c, a
    cpl
    ld b, a
    push de
    call Call_000_0c27
    ld de, $000f
    add hl, de
    pop de
    ld a, e
    sub $08
    ret z

    ld e, a
    jr jr_000_0acc

jr_000_0ae7:
    ld a, $80

jr_000_0ae9:
    dec e
    jr z, jr_000_0af0

    sra a
    jr jr_000_0ae9

jr_000_0af0:
    ld b, a
    cpl
    ld c, a
    jp Jump_000_0c27


Jump_000_0af6:
    ld a, c
    sub e
    jp nc, Jump_000_0b07

    ld a, b
    sub d
    jr z, jr_000_0b13

    ld a, $00
    jr nc, jr_000_0b13

    ld a, $ff
    jr jr_000_0b13

Jump_000_0b07:
    ld a, c
    sub e
    jr z, jr_000_0b11

    ld a, $00
    jr nc, jr_000_0b11

    ld a, $ff

jr_000_0b11:
    ld b, d
    ld c, e

jr_000_0b13:
    ld [$c11e], a
    ld hl, $1f60
    ld d, $00
    ld e, c
    add hl, de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, b
    and $f8
    ld e, a
    add hl, de
    add hl, de
    ld a, [$c11d]
    ld e, a
    inc e
    ld a, [$c11c]
    or a
    jp z, Jump_000_0be9

    push hl
    ld h, $00
    ld l, a
    add hl, hl
    ld a, h
    ld [$c121], a
    ld a, l
    ld [$c122], a
    ld d, h
    ld e, l
    ld a, [$c11d]
    cpl
    ld l, a
    ld h, $ff
    inc hl
    add hl, de
    ld a, h
    ld [$c11f], a
    ld a, l
    ld [$c120], a
    ld a, [$c11d]
    cpl
    ld l, a
    ld h, $ff
    inc hl
    ld a, [$c11c]
    ld d, $00
    ld e, a
    add hl, de
    add hl, hl
    ld a, h
    ld [$c123], a
    ld a, l
    ld [$c124], a
    pop hl
    ld a, [$c11d]
    ld e, a
    ld a, b
    and $07
    add $10
    ld c, a
    ld b, $00
    ld a, [bc]
    ld b, a
    ld c, a

jr_000_0b7b:
    push de
    push bc
    ld a, b
    cpl
    ld c, a
    call Call_000_0c27
    inc hl
    ld a, l
    and $0f
    jr nz, jr_000_0b8d

    ld de, $0130
    add hl, de

jr_000_0b8d:
    pop bc
    ld a, [$c11f]
    bit 7, a
    jr z, jr_000_0bad

    ld a, [$c120]
    ld d, a
    ld a, [$c122]
    add d
    ld [$c120], a
    ld a, [$c11f]
    ld d, a
    ld a, [$c121]
    adc d
    ld [$c11f], a
    jr jr_000_0bdf

jr_000_0bad:
    ld a, [$c11e]
    or a
    jr nz, jr_000_0bbf

    rlc b
    bit 0, b
    jr z, jr_000_0bc9

    ld de, $fff0
    add hl, de
    jr jr_000_0bc9

jr_000_0bbf:
    rrc b
    bit 7, b
    jr z, jr_000_0bc9

    ld de, $0010
    add hl, de

jr_000_0bc9:
    ld a, [$c120]
    ld d, a
    ld a, [$c124]
    add d
    ld [$c120], a
    ld a, [$c11f]
    ld d, a
    ld a, [$c123]
    adc d
    ld [$c11f], a

jr_000_0bdf:
    pop de
    dec e
    jr nz, jr_000_0b7b

    ld a, b
    cpl
    ld c, a
    jp Jump_000_0c27


Jump_000_0be9:
    ld a, b
    and $07
    push hl
    add $10
    ld l, a
    ld h, $00
    ld a, [hl]
    pop hl
    ld b, a
    cpl
    ld c, a

jr_000_0bf7:
    push de
    call Call_000_0c27
    inc hl
    ld a, l
    and $0f
    jr nz, jr_000_0c05

    ld de, $0130
    add hl, de

jr_000_0c05:
    pop de
    dec e
    ret z

    jr jr_000_0bf7

Call_000_0c0a:
    ld hl, $1f60
    ld d, $00
    ld e, c
    add hl, de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, b
    and $f8
    ld e, a
    add hl, de
    add hl, de
    ld a, b
    and $07
    add $10
    ld c, a
    ld b, $00
    ld a, [bc]
    ld b, a
    cpl
    ld c, a

Call_000_0c27:
Jump_000_0c27:
    ld a, [$c114]
    ld d, a
    ld a, [$c116]
    cp $01
    jr z, jr_000_0c5b

    cp $02
    jr z, jr_000_0c75

    cp $03
    jr z, jr_000_0c8f

    ld e, b
    bit 0, d
    jr nz, jr_000_0c42

    push bc
    ld b, $00

jr_000_0c42:
    bit 1, d
    jr nz, jr_000_0c48

    ld e, $00

jr_000_0c48:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_0c48

    ld a, [hl]
    and c
    or b
    ld [hl+], a
    ld a, [hl]
    and c
    or e
    ld [hl], a
    ld a, b
    or a
    ret nz

    pop bc
    ret


jr_000_0c5b:
    ld c, b
    bit 0, d
    jr nz, jr_000_0c62

    ld b, $00

jr_000_0c62:
    bit 1, d
    jr nz, jr_000_0c68

    ld c, $00

jr_000_0c68:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_0c68

    ld a, [hl]
    or b
    ld [hl+], a
    ld a, [hl]
    or c
    ld [hl], a
    ret


jr_000_0c75:
    ld c, b
    bit 0, d
    jr nz, jr_000_0c7c

    ld b, $00

jr_000_0c7c:
    bit 1, d
    jr nz, jr_000_0c82

    ld c, $00

jr_000_0c82:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_0c82

    ld a, [hl]
    xor b
    ld [hl+], a
    ld a, [hl]
    xor c
    ld [hl], a
    ret


jr_000_0c8f:
    ld b, c
    bit 0, d
    jr z, jr_000_0c96

    ld b, $ff

jr_000_0c96:
    bit 1, d
    jr z, jr_000_0c9c

    ld c, $ff

jr_000_0c9c:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_0c9c

    ld a, [hl]
    and b
    ld [hl+], a
    ld a, [hl]
    and c
    ld [hl], a
    ret


Call_000_0ca9:
    ld hl, $1f60
    ld d, $00
    ld e, c
    add hl, de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, b
    and $f8
    ld e, a
    add hl, de
    add hl, de
    ld a, b
    and $07
    add $10
    ld c, a
    ld b, $00
    ld a, [bc]
    ld c, a

jr_000_0cc4:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_0cc4

    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld e, a
    ld b, $00
    ld a, d
    and c
    jr z, jr_000_0cd6

    set 0, b

jr_000_0cd6:
    ld a, e
    and c
    jr z, jr_000_0cdc

    set 1, b

jr_000_0cdc:
    ld e, b
    ret


Call_000_0cde:
    ld hl, $1f60
    ld d, $00
    ld a, [$c126]
    rlca
    rlca
    rlca
    ld e, a
    add hl, de
    add hl, de
    ld b, [hl]
    inc hl
    ld h, [hl]
    ld l, b
    ld a, [$c125]
    rlca
    rlca
    rlca
    ld e, a
    add hl, de
    add hl, de
    ld a, c
    ld b, h
    ld c, l
    ld h, d
    ld l, a
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, $1677
    add hl, de
    ld d, h
    ld e, l
    ld h, b
    ld l, c
    ld a, [$c114]
    ld c, a

jr_000_0d0d:
    ld a, [de]
    inc de
    push de
    push hl
    ld hl, $c115
    ld l, [hl]
    ld b, a
    xor a
    bit 0, l
    jr z, jr_000_0d1c

    cpl

jr_000_0d1c:
    or b
    bit 0, c
    jr nz, jr_000_0d22

    xor b

jr_000_0d22:
    ld d, a
    xor a
    bit 1, l
    jr z, jr_000_0d29

    cpl

jr_000_0d29:
    or b
    bit 1, c
    jr nz, jr_000_0d2f

    xor b

jr_000_0d2f:
    ld e, a
    pop hl

jr_000_0d31:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_0d31

    ld a, d
    ld [hl+], a
    ld a, e
    ld [hl+], a
    pop de
    ld a, l
    and $0f
    jr nz, jr_000_0d0d

    ret


    ld hl, sp+$02
    ld a, [hl+]
    ld [$c125], a
    ld a, [hl+]
    ld [$c126], a
    ret


    push bc
    ld a, [$c0a1]
    cp $01
    call nz, Call_000_1e77
    ld hl, sp+$04
    ld a, [hl]
    ld c, a
    call Call_000_0cde
    call Call_000_06d1
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    call Call_000_0ca9
    pop bc
    ret


    ld hl, sp+$02
    ld a, [hl+]
    ld [$c114], a
    ld a, [hl+]
    ld [$c115], a
    ld a, [hl]
    ld [$c116], a
    ret


    push bc
    ld a, [$c0a1]
    cp $01
    call nz, Call_000_1e77
    ld hl, sp+$04
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld [$c117], a
    call Call_000_06ee
    pop bc
    ret


    push bc
    ld a, [$c0a1]
    cp $01
    call nz, Call_000_1e77
    ld hl, sp+$04
    ld a, [hl+]
    ld [$c118], a
    ld a, [hl+]
    ld [$c11a], a
    ld a, [hl+]
    ld [$c119], a
    ld a, [hl+]
    ld [$c11b], a
    ld a, [hl]
    ld [$c117], a
    call Call_000_08a3
    pop bc
    ret


    push bc
    ld a, [$c0a1]
    cp $01
    call nz, Call_000_1e77
    ld hl, sp+$04
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld e, a
    call Call_000_0979
    pop bc
    ret


    push bc
    ld a, [$c0a1]
    cp $01
    call nz, Call_000_1e77
    ld hl, sp+$04
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    call Call_000_0c0a
    pop bc
    ret


    push bc
    ld a, [$c0a1]
    cp $01
    call nz, Call_000_1e77
    ld hl, sp+$04
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld [$c114], a
    ld a, [hl+]
    ld [$c116], a
    call Call_000_0c0a
    pop bc
    ret


Call_000_0e03:
    ld a, l
    ld [$c0a1], a
    and $03
    ld l, a
    ld bc, $01e0
    sla l
    sla l
    add hl, bc
    jp hl


Call_000_0e13:
    ld hl, $c0a9
    jp Jump_000_0e4f


Call_000_0e19:
    ld hl, $c0b9
    jp Jump_000_0e4f


Call_000_0e1f:
    ld hl, $c0c9
    jp Jump_000_0e4f


Call_000_0e25:
    ld hl, $c0d9
    jp Jump_000_0e4f


Call_000_0e2b:
    ld hl, $c0e9
    jp Jump_000_0e4f


Call_000_0e31:
    ld hl, $c0a9
    jp Jump_000_0e6f


Call_000_0e37:
    ld hl, $c0b9
    jp Jump_000_0e6f


Call_000_0e3d:
    ld hl, $c0c9
    jp Jump_000_0e6f


Call_000_0e43:
    ld hl, $c0d9
    jp Jump_000_0e6f


Call_000_0e49:
    ld hl, $c0e9
    jp Jump_000_0e6f


Call_000_0e4f:
Jump_000_0e4f:
jr_000_0e4f:
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    or d
    ret z

    ld a, e
    cp c
    jr nz, jr_000_0e4f

    ld a, d
    cp b
    jr nz, jr_000_0e4f

    xor a
    ld [hl-], a
    ld [hl], a
    inc a
    ld d, h
    ld e, l
    dec de
    inc hl

jr_000_0e64:
    ld a, [hl+]
    ld [de], a
    ld b, a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    or b
    ret z

    jr jr_000_0e64

Jump_000_0e6f:
jr_000_0e6f:
    ld a, [hl+]
    or [hl]
    jr z, jr_000_0e76

    inc hl
    jr jr_000_0e6f

jr_000_0e76:
    ld [hl], b
    dec hl
    ld [hl], c
    ret


    ld hl, $c0a7
    inc [hl]
    jr nz, jr_000_0e82

    inc hl
    inc [hl]

jr_000_0e82:
    call $ff80
    ld a, $01
    ld [$c0a5], a
    ret


    ldh a, [rLCDC]
    add a
    ret nc

    xor a
    di
    ld [$c0a5], a
    ei

jr_000_0e95:
    halt
    ld a, [$c0a5]
    or a
    jr z, jr_000_0e95

    xor a
    ld [$c0a5], a
    ret


Call_000_0ea2:
    ldh a, [rLCDC]
    add a
    ret nc

jr_000_0ea6:
    ldh a, [rLY]
    cp $92
    jr nc, jr_000_0ea6

jr_000_0eac:
    ldh a, [rLY]
    cp $91
    jr c, jr_000_0eac

    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a
    ret


    ld a, $c0
    ldh [rDMA], a
    ld a, $28

jr_000_0ebf:
    dec a
    jr nz, jr_000_0ebf

    ret


    ld a, [$c0a4]
    cp $02
    jr nz, jr_000_0ed3

    ldh a, [rSB]
    ld [$c0a3], a
    ld a, $00
    jr jr_000_0ee1

jr_000_0ed3:
    cp $01
    jr nz, jr_000_0eed

    ldh a, [rSB]
    cp $55
    jr z, jr_000_0ee1

    ld a, $04
    jr jr_000_0ee3

jr_000_0ee1:
    ld a, $00

jr_000_0ee3:
    ld [$c0a4], a
    xor a
    ldh [rSC], a
    ld a, $66
    ldh [rSB], a

jr_000_0eed:
    ld a, $80
    ldh [rSC], a
    ret


    ld hl, sp+$02
    ld l, [hl]
    ld h, $00
    call Call_000_0e03
    ret


    ld hl, $c0a1
    ld e, [hl]
    ret


    ei
    ret


    di
    ret


Call_000_0f04:
    ld a, [$c0a0]
    jp Jump_000_0150


    di
    ld hl, sp+$02
    xor a
    ldh [rIF], a
    ld a, [hl]
    ldh [rIE], a
    ei
    ret


    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_0e13
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_0e19
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_0e1f
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_0e25
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_0e2b
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_0e31
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_0e37
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_0e3d
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_0e43
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_0e49
    pop bc
    ret


    ld hl, $c0a7
    di
    ld a, [hl+]
    ei
    ld d, [hl]
    ld e, a
    ret


    ret


Call_000_0f8d:
    pop hl
    ld a, [$c0a6]
    push af
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, [hl+]
    inc hl
    push hl
    ld [$c0a6], a
    ld [$2000], a
    ld hl, $0fa6
    push hl
    ld l, e
    ld h, d
    jp hl


    pop hl
    pop af
    ld [$2000], a
    ld [$c0a6], a
    jp hl


Call_000_0faf:
    ld c, l
    ld b, h
    pop hl

Jump_000_0fb2:
    ld e, [hl]
    inc hl
    bit 7, e
    jp z, Jump_000_0fc4

    ld a, [hl]
    inc hl

Jump_000_0fbb:
    ld [bc], a
    inc bc
    inc e
    jp nz, Jump_000_0fbb

    jp Jump_000_0fb2


Jump_000_0fc4:
    xor a
    or e
    jp z, Jump_000_0fd4

Jump_000_0fc9:
    ld a, [hl]
    inc hl
    ld [bc], a
    inc bc
    dec e
    jp nz, Jump_000_0fc9

    jp Jump_000_0fb2


Jump_000_0fd4:
    push hl
    ret


CallPrintDataToScreen:
    ld hl, sp+$02
    ld c, l
    ld b, h
    ld l, c
    ld h, b
    inc hl
    inc hl
    push hl
    ld hl, $0000
    push hl
    ld hl, $1275
    push hl
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_10fe
    add sp, $08
    ret


    add sp, -$04
    ld hl, sp+$02
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld hl, sp+$06
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    ld hl, sp+$08
    ld a, l
    ld d, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
    push bc
    push hl
    push bc
    ld hl, $1280
    push hl
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_10fe
    add sp, $08
    pop bc
    push bc
    ld a, $00
    push af
    inc sp
    call Call_000_1280
    add sp, $03
    add sp, $04
    ret


Call_000_1031:
    add sp, -$04
    xor a
    ld hl, sp+$0a
    or [hl]
    jp z, Jump_000_106c

    ld hl, sp+$06
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, b
    bit 7, a
    jp z, Jump_000_106c

    ld hl, sp+$0b
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld a, $2d
    push af
    inc sp
    ld hl, $105a
    push hl
    ld l, c
    ld h, b
    jp hl


    add sp, $03
    ld hl, sp+$06
    ld c, [hl]
    inc hl
    ld b, [hl]
    xor a
    sbc c
    ld c, a
    ld a, $00
    sbc b
    ld b, a
    dec hl
    ld [hl], c
    inc hl
    ld [hl], b

Jump_000_106c:
    ld hl, sp+$06
    ld a, [hl+]
    inc hl
    sub [hl]
    dec hl
    ld a, [hl+]
    inc hl
    sbc [hl]
    jp c, Jump_000_10a6

    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_0629
    ld b, d
    ld c, e
    add sp, $04
    ld hl, sp+$0d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$0d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld a, $00
    push af
    inc sp
    ld hl, sp+$0d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push bc
    call Call_000_1031
    add sp, $09

Jump_000_10a6:
    ld hl, sp+$0b
    ld c, [hl]
    inc hl
    ld b, [hl]
    push bc
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_063d
    ld hl, sp+$09
    ld [hl], d
    dec hl
    ld [hl], e
    add sp, $04
    pop bc
    ld de, $10ed
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], d
    ld e, a
    ld a, [de]
    inc hl
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    ld hl, $10e8
    push hl
    ld l, c
    ld h, b
    jp hl


    add sp, $03
    add sp, $04
    ret


    jr nc, jr_000_1120

    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, @+$3b

    ld b, c
    ld b, d
    ld b, e
    ld b, h
    ld b, l
    ld b, [hl]
    nop

Call_000_10fe:
    add sp, -$05

Jump_000_1100:
    ld hl, sp+$07
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, [bc]
    ld hl, sp+$01
    ld [hl], a
    xor a
    or [hl]
    jp z, Jump_000_1272

    ld a, [hl]
    cp $25
    jp nz, Jump_000_1248

    jr jr_000_1119

    jp Jump_000_1248


jr_000_1119:
    inc bc
    ld hl, sp+$07
    ld [hl], c
    inc hl
    ld [hl], b
    ld a, [bc]

jr_000_1120:
    ld c, a
    cp $63
    jp z, Jump_000_1141

    ld a, c
    cp $64
    jp z, Jump_000_119d

    ld a, c
    cp $73
    jp z, Jump_000_11ff

    ld a, c
    cp $75
    jp z, Jump_000_116c

    ld a, c
    cp $78
    jp z, Jump_000_11ce

    jp Jump_000_1260


Jump_000_1141:
    ld hl, sp+$0d
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    dec hl
    ld [hl], c
    inc hl
    ld [hl], b
    dec bc
    ld a, [bc]
    ld c, a
    ld hl, sp+$04
    ld [hl], c
    ld hl, sp+$09
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$06
    ld a, [hl]
    push af
    inc sp
    ld hl, $1167
    push hl
    ld l, b
    ld h, c
    jp hl


    add sp, $03
    jp Jump_000_1260


Jump_000_116c:
    ld hl, sp+$0d
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    dec hl
    ld [hl], c
    inc hl
    ld [hl], b
    dec bc
    dec bc
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld a, $00
    push af
    inc sp
    ld hl, $000a
    push hl
    push bc
    call Call_000_1031
    add sp, $09
    jp Jump_000_1260


Jump_000_119d:
    ld hl, sp+$0d
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    dec hl
    ld [hl], c
    inc hl
    ld [hl], b
    dec bc
    dec bc
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld a, $01
    push af
    inc sp
    ld hl, $000a
    push hl
    push bc
    call Call_000_1031
    add sp, $09
    jp Jump_000_1260


Jump_000_11ce:
    ld hl, sp+$0d
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    dec hl
    ld [hl], c
    inc hl
    ld [hl], b
    dec bc
    dec bc
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld a, $00
    push af
    inc sp
    ld hl, $0010
    push hl
    push bc
    call Call_000_1031
    add sp, $09
    jp Jump_000_1260


Jump_000_11ff:
    ld hl, sp+$0d
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    dec hl
    ld [hl], c
    inc hl
    ld [hl], b
    dec bc
    dec bc
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], b

Jump_000_1218:
    ld hl, sp+$02
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl], a
    xor a
    or [hl]
    jp z, Jump_000_1260

    ld hl, sp+$09
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$02
    ld a, [hl]
    push af
    inc sp
    ld hl, $123c
    push hl
    ld l, c
    ld h, b
    jp hl


    add sp, $03
    ld hl, sp+$02
    inc [hl]
    jr nz, jr_000_1245

    inc hl
    inc [hl]

jr_000_1245:
    jp Jump_000_1218


Jump_000_1248:
    ld hl, sp+$09
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$03
    ld a, [hl]
    push af
    inc sp
    ld hl, $125e
    push hl
    ld l, c
    ld h, b
    jp hl


    add sp, $03

Jump_000_1260:
    ld hl, sp+$07
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0001
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$07
    ld [hl+], a
    ld [hl], d
    jp Jump_000_1100


Jump_000_1272:
    add sp, $05
    ret


    ld hl, sp+$02
    ld a, [hl]
    push af
    inc sp
    call Call_000_0590
    add sp, $01
    ret


Call_000_1280:
    add sp, -$02
    ld hl, sp+$05
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$00
    ld [hl], a
    inc de
    ld a, [de]
    inc hl
    ld [hl-], a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$04
    ld a, [hl]
    ld [de], a
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$00
    ld [hl], a
    inc de
    ld a, [de]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    ld e, c
    ld d, b
    ld a, l
    ld [de], a
    inc de
    ld a, h
    ld [de], a
    add sp, $02
    ret


Jump_000_12b0:
    ld a, d
    or e
    ret z

    ld a, h
    cp $98
    jr c, jr_000_12bb

    sub $10
    ld h, a

jr_000_12bb:
    xor a
    cp e
    jr nz, jr_000_12c0

    dec d

jr_000_12c0:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_12c0

    ld a, [bc]
    ld [hl+], a
    inc bc

jr_000_12c9:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_12c9

    ld a, [bc]
    ld [hl], a
    inc bc
    inc l
    jr nz, jr_000_12dd

    inc h
    ld a, h
    cp $98
    jr nz, jr_000_12dd

    ld h, $88

jr_000_12dd:
    dec e
    jr nz, jr_000_12c0

    dec d
    bit 7, d
    jr z, jr_000_12c0

    ret


Jump_000_12e6:
    ld a, d
    or e
    ret z

    ld a, h
    cp $98
    jr c, jr_000_12f1

    sub $10
    ld h, a

jr_000_12f1:
    push de
    ld a, [bc]
    ld e, a
    inc bc
    push bc
    ld bc, $0000
    ld a, [$c115]
    bit 0, a
    jr z, jr_000_1302

    ld b, $ff

jr_000_1302:
    bit 1, a
    jr z, jr_000_1308

    ld c, $ff

jr_000_1308:
    ld d, a
    ld a, [$c114]
    xor d
    ld d, a
    bit 0, d
    jr z, jr_000_1315

    ld a, e
    xor b
    ld b, a

jr_000_1315:
    bit 1, d
    jr z, jr_000_131c

    ld a, e
    xor c
    ld c, a

jr_000_131c:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_131c

    ld [hl], b
    inc hl

jr_000_1324:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_1324

    ld [hl], c
    inc hl
    ld a, h
    cp $98
    jr nz, jr_000_1333

    ld h, $88

jr_000_1333:
    pop bc
    pop de
    dec de
    ld a, d
    or e
    jr nz, jr_000_12f1

    ret


Call_000_133b:
    call Call_000_0ea2
    push hl
    ld hl, $c0fe
    ld b, $06

jr_000_1344:
    ld a, [hl]
    inc hl
    or [hl]
    cp $00
    jr z, jr_000_1356

    inc hl
    inc hl
    dec b
    jr nz, jr_000_1344

    pop hl
    ld hl, $0000
    jr jr_000_137a

jr_000_1356:
    pop de
    ld [hl], d
    dec hl
    ld [hl], e
    ld a, [$c0fc]
    dec hl
    ld [hl], a
    push hl
    call Call_000_13cb
    ld a, [$c0a1]
    and $02
    call nz, Call_000_1383
    ld hl, $c0fa
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    ld a, [$c0fc]
    add [hl]
    ld [$c0fc], a
    pop hl

jr_000_137a:
    ldh a, [rLCDC]
    or $81
    and $e7
    ldh [rLCDC], a
    ret


Call_000_1383:
    ld hl, $c0fa
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    ld e, [hl]
    ld d, $00
    rl e
    rl d
    rl e
    rl d
    rl e
    rl d
    dec hl
    ld a, [hl]
    push af
    and $03
    ld bc, $0080
    cp $01
    jr z, jr_000_13af

    ld bc, $0000
    cp $02
    jr z, jr_000_13af

    ld bc, $0100

jr_000_13af:
    inc hl
    inc hl
    add hl, bc
    ld c, l
    ld b, h
    ld a, [$c0f9]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, $90
    add h
    ld h, a
    pop af
    bit 2, a
    jp z, Jump_000_12b0

    jp Jump_000_12e6


Call_000_13cb:
    ld a, [hl+]
    ld [$c0f9], a
    ld a, [hl+]
    ld [$c0fa], a
    ld a, [hl+]
    ld [$c0fb], a
    ret


Call_000_13d8:
    cp $0a
    jr nz, jr_000_13ea

    push af
    ld a, [$c0a1]
    and $08
    jr nz, jr_000_13e9

    call Call_000_14c4
    pop af
    ret


jr_000_13e9:
    pop af

jr_000_13ea:
    call Call_000_1401
    call Call_000_14d9
    ret


    call Call_000_1401
    call Call_000_14d9
    ret


    call Call_000_14ad
    ld a, $00
    call Call_000_1401
    ret


Call_000_1401:
    push af
    ld a, [$c0fb]
    or a
    jr nz, jr_000_1416

    call Call_000_1470
    xor a
    ld [$c0fc], a
    call Call_000_0f8d
    ld l, [hl]
    dec d
    nop
    nop

jr_000_1416:
    pop af
    push bc
    push de
    push hl
    ld e, a
    ld hl, $c0fa
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    and $03
    cp $02
    jr z, jr_000_142d

    inc hl
    ld d, $00
    add hl, de
    ld e, [hl]

jr_000_142d:
    ld a, [$c0f9]
    add e
    ld e, a
    ld a, [$c110]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, [$c10f]
    ld c, a
    ld b, $00
    add hl, bc
    ld bc, $9800
    add hl, bc

jr_000_1448:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_1448

    ld [hl], e
    pop hl
    pop de
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld a, [hl]
    inc hl
    ld h, [hl]
    ld l, a
    call Call_000_133b
    push hl
    pop de
    pop bc
    ret


    push bc
    ld hl, sp+$04
    ld a, [hl]
    inc hl
    ld h, [hl]
    ld l, a
    call Call_000_13cb
    pop bc
    ld de, $0000
    ret


Call_000_1470:
    push bc
    call Call_000_1535
    ld a, $01
    ld [$c0fc], a
    xor a
    ld hl, $c0fd
    ld b, $12

jr_000_147f:
    ld [hl+], a
    dec b
    jr nz, jr_000_147f

    ld a, $03
    ld [$c114], a
    ld a, $00
    ld [$c115], a
    call Call_000_1492
    pop bc
    ret


Call_000_1492:
    push de
    push hl
    ld hl, $9800
    ld e, $20

jr_000_1499:
    ld d, $20

jr_000_149b:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_149b

    ld [hl], $00
    inc hl
    dec d
    jr nz, jr_000_149b

    dec e
    jr nz, jr_000_1499

    pop hl
    pop de
    ret


Call_000_14ad:
    push hl
    ld hl, $c10f
    xor a
    cp [hl]
    jr z, jr_000_14b8

    dec [hl]
    jr jr_000_14c2

jr_000_14b8:
    ld [hl], $13
    ld hl, $c110
    xor a
    cp [hl]
    jr z, jr_000_14c2

    dec [hl]

jr_000_14c2:
    pop hl
    ret


Call_000_14c4:
    push hl
    xor a
    ld [$c10f], a
    ld hl, $c110
    ld a, $11
    cp [hl]
    jr z, jr_000_14d4

    inc [hl]
    jr jr_000_14d7

jr_000_14d4:
    call Call_000_1507

jr_000_14d7:
    pop hl
    ret


Call_000_14d9:
    push hl
    ld hl, $c10f
    ld a, $13
    cp [hl]
    jr z, jr_000_14e5

    inc [hl]
    jr jr_000_1505

jr_000_14e5:
    ld [hl], $00
    ld hl, $c110
    ld a, $11
    cp [hl]
    jr z, jr_000_14f2

    inc [hl]
    jr jr_000_1505

jr_000_14f2:
    ld a, [$c0a1]
    and $04
    jr z, jr_000_1502

    xor a
    ld [$c110], a
    ld [$c10f], a
    jr jr_000_1505

jr_000_1502:
    call Call_000_1507

jr_000_1505:
    pop hl
    ret


Call_000_1507:
    push bc
    push de
    push hl
    ld hl, $9800
    ld bc, $9820
    ld e, $1f

jr_000_1512:
    ld d, $20

jr_000_1514:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_1514

    ld a, [bc]
    ld [hl+], a
    inc bc
    dec d
    jr nz, jr_000_1514

    dec e
    jr nz, jr_000_1512

    ld d, $20

jr_000_1525:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_1525

    ld a, $00
    ld [hl+], a
    dec d
    jr nz, jr_000_1525

    pop hl
    pop de
    pop bc
    ret


Call_000_1535:
Jump_000_1535:
    di
    ldh a, [rLCDC]
    bit 7, a
    jr z, jr_000_1551

    call Call_000_0ea2
    ld bc, $1ed9
    ld hl, $c0a9
    call Call_000_0e4f
    ld bc, $1ee4
    ld hl, $c0b9
    call Call_000_0e4f

jr_000_1551:
    call Call_000_155e
    ldh a, [rLCDC]
    or $81
    and $e7
    ldh [rLCDC], a
    ei
    ret


Call_000_155e:
    xor a
    ld [$c10f], a
    ld [$c110], a
    call Call_000_1492
    ld a, $02
    ld [$c0a1], a
    ret


    ld hl, $1575
    call Call_000_133b
    ret


    inc b
    rst $38
    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    dec d
    ld d, $17
    jr jr_000_15aa

    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_000_15ba

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_000_15ca

    ld a, [hl+]
    dec hl
    inc l
    dec l
    ld l, $2f
    jr nc, jr_000_15da

    ld [hl-], a

jr_000_15aa:
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_000_15ea

    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $3f
    ld b, b
    ld b, c
    ld b, d

jr_000_15ba:
    ld b, e
    ld b, h
    ld b, l
    ld b, [hl]
    ld b, a
    ld c, b
    ld c, c
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    ld d, c
    ld d, d

jr_000_15ca:
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d

jr_000_15da:
    ld h, e
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    ld l, l
    ld l, [hl]
    ld l, a
    ld [hl], b
    ld [hl], c
    ld [hl], d

jr_000_15ea:
    ld [hl], e
    ld [hl], h
    ld [hl], l
    db $76
    ld [hl], a
    ld a, b
    ld a, c
    ld a, d
    ld a, e
    ld a, h
    ld a, l
    ld a, [hl]
    ld a, a
    add b
    add c
    add d
    add e
    add h
    add l
    add [hl]
    add a
    adc b
    adc c
    adc d
    adc e
    adc h
    adc l
    adc [hl]
    adc a
    sub b
    sub c
    sub d
    sub e
    sub h
    sub l
    sub [hl]
    sub a
    sbc b
    sbc c
    sbc d
    sbc e
    sbc h
    sbc l
    sbc [hl]
    sbc a
    and b
    and c
    and d
    and e
    and h
    and l
    and [hl]
    and a
    xor b
    xor c
    xor d
    xor e
    xor h
    xor l
    xor [hl]
    xor a
    or b
    or c
    or d
    or e
    or h
    or l
    or [hl]
    or a
    cp b
    cp c
    cp d
    cp e
    cp h
    cp l
    cp [hl]
    cp a
    ret nz

    pop bc
    jp nz, $c4c3

    push bc
    add $c7
    ret z

    ret


    jp z, $cccb

    call $cfce
    ret nc

    pop de
    jp nc, $d4d3

    push de
    sub $d7
    ret c

    reti


    jp c, $dcdb

    db $dd
    sbc $df
    ldh [$e1], a
    ld [c], a
    db $e3
    db $e4
    push hl
    and $e7
    add sp, -$17
    ld [$eceb], a
    db $ed
    xor $ef
    ldh a, [$f1]
    ld a, [c]
    di
    db $f4
    push af
    or $f7
    ld hl, sp-$07
    ld a, [$fcfb]
    db $fd
    cp $ff
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_000_16a5

    ld b, d
    add c
    rst $20
    inc h
    inc h
    inc a
    inc a
    inc h
    inc h
    rst $20
    add c
    ld b, d
    inc h
    jr @+$1a

    inc d
    ld a, [c]
    add c
    add c
    ld a, [c]
    inc d
    jr jr_000_16b0

    jr z, jr_000_16e9

    add c
    add c
    ld c, a
    jr z, jr_000_16b7

    rst $38
    add c
    add c
    add c
    add c
    add c

jr_000_16a5:
    add c
    rst $38
    ld hl, sp-$78
    adc a
    adc c
    ld sp, hl
    ld b, c
    ld b, c
    ld a, a
    rst $38

jr_000_16b0:
    adc c
    adc c
    adc c
    ld sp, hl
    add c
    add c
    rst $38

jr_000_16b7:
    ld bc, $0603
    adc h
    ret c

    ld [hl], b
    jr nz, jr_000_16bf

jr_000_16bf:
    ld a, [hl]
    jp $d3d3


    db $db
    jp $7ec3


    jr jr_000_1705

    inc l
    inc l
    ld a, [hl]
    jr jr_000_16e6

    nop
    db $10
    inc e
    ld [de], a
    db $10
    db $10
    ld [hl], b
    ldh a, [$60]
    ldh a, [$c0]
    cp $d8
    sbc $18
    jr jr_000_16df

jr_000_16df:
    ld [hl], b
    ret z

    sbc $db
    db $db
    ld a, [hl]
    dec de

jr_000_16e6:
    dec de
    nop
    nop

jr_000_16e9:
    nop
    rst $38
    rst $38
    rst $38
    nop
    nop
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    ld a, h
    add $c6
    nop
    add $c6
    ld a, h
    nop
    ld b, $06
    ld b, $00
    ld b, $06

jr_000_1705:
    ld b, $00
    ld a, h
    ld b, $06
    ld a, h
    ret nz

    ret nz

    ld a, h
    nop
    ld a, h
    ld b, $06
    ld a, h
    ld b, $06
    ld a, h
    nop
    add $c6
    add $7c
    ld b, $06
    ld b, $00
    ld a, h
    ret nz

    ret nz

    ld a, h
    ld b, $06
    ld a, h
    nop
    ld a, h
    ret nz

    ret nz

    ld a, h
    add $c6
    ld a, h
    nop
    ld a, h
    ld b, $06
    nop
    ld b, $06
    ld b, $00
    ld a, h
    add $c6
    ld a, h
    add $c6
    ld a, h
    nop
    ld a, h
    add $c6
    ld a, h
    ld b, $06
    ld a, h
    nop
    nop
    inc a
    ld b, [hl]
    ld b, $7e
    ld h, [hl]
    inc a
    nop
    ld a, b
    ld h, [hl]
    ld a, l
    ld h, h
    ld a, [hl]
    inc bc
    dec bc
    ld b, $00
    nop
    nop
    rra
    rra
    rra
    inc e
    inc e
    nop
    nop
    nop
    db $fc
    db $fc
    db $fc
    inc e
    inc e
    inc e
    inc e
    inc e
    rra
    rra
    rra
    nop
    nop
    inc e
    inc e
    inc e
    db $fc
    db $fc
    db $fc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr @+$1a

    jr jr_000_179b

    jr jr_000_1785

jr_000_1785:
    jr jr_000_1787

jr_000_1787:
    ld h, [hl]
    ld h, [hl]
    ld b, h
    nop
    nop
    nop
    nop
    nop
    nop
    inc h
    ld a, [hl]
    inc h
    inc h
    ld a, [hl]
    inc h
    nop
    inc d
    ld a, $55
    inc a

jr_000_179b:
    ld e, $55
    ld a, $14
    ld h, d
    ld h, [hl]
    inc c
    jr @+$32

    ld h, [hl]
    ld b, [hl]
    nop
    ld a, b
    call z, $ce61
    call z, $78cc
    nop
    jr jr_000_17c9

    stop
    nop
    nop
    nop
    nop
    inc b
    ld [$1818], sp
    jr jr_000_17d5

    ld [$2004], sp
    db $10
    jr jr_000_17db

    jr @+$1a

    db $10
    jr nz, jr_000_17c8

jr_000_17c8:
    ld d, h

jr_000_17c9:
    jr c, jr_000_17c9

    jr c, jr_000_1821

    nop
    nop
    nop
    jr jr_000_17ea

    ld a, [hl]
    jr @+$1a

jr_000_17d5:
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_17db:
    nop
    jr nc, jr_000_180e

    jr nz, jr_000_17e0

jr_000_17e0:
    nop
    nop
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_17ea:
    nop
    nop
    jr @+$1a

    nop
    inc bc
    ld b, $0c
    jr jr_000_1824

    ld h, b
    ret nz

    nop
    inc a
    ld h, [hl]
    ld l, [hl]
    db $76
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    jr jr_000_1839

    jr jr_000_181b

    jr jr_000_181d

    jr jr_000_1807

jr_000_1807:
    inc a
    ld h, [hl]
    ld c, $1c
    jr c, jr_000_187d

    ld a, [hl]

jr_000_180e:
    nop
    ld a, [hl]
    inc c
    jr jr_000_184f

    ld b, $46
    inc a
    nop
    inc c
    inc e
    inc l
    ld c, h

jr_000_181b:
    ld a, [hl]
    inc c

jr_000_181d:
    inc c
    nop
    ld a, [hl]
    ld h, b

jr_000_1821:
    ld a, h
    ld b, $06

jr_000_1824:
    ld b, [hl]
    inc a
    nop
    inc e
    jr nz, jr_000_188a

    ld a, h
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    ld a, [hl]
    ld b, $0e
    inc e
    jr @+$1a

    jr jr_000_1837

jr_000_1837:
    inc a
    ld h, [hl]

jr_000_1839:
    ld h, [hl]
    inc a
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    inc a
    ld h, [hl]
    ld h, [hl]
    ld a, $06
    inc c
    jr c, jr_000_1847

jr_000_1847:
    nop
    jr jr_000_1862

    nop
    nop
    jr jr_000_1866

    nop

jr_000_184f:
    nop
    jr jr_000_186a

    nop
    jr jr_000_186d

    stop
    ld b, $0c
    jr jr_000_188b

    jr @+$0e

    ld b, $00
    nop
    nop
    inc a

jr_000_1862:
    nop
    nop
    inc a
    nop

jr_000_1866:
    nop
    ld h, b
    jr nc, jr_000_1882

jr_000_186a:
    inc c
    jr jr_000_189d

jr_000_186d:
    ld h, b
    nop
    inc a
    ld b, [hl]
    ld b, $0c
    jr jr_000_188d

    nop
    jr jr_000_18b4

    ld h, [hl]
    ld l, [hl]
    ld l, d
    ld l, [hl]
    ld h, b

jr_000_187d:
    inc a
    nop
    inc a
    ld h, [hl]
    ld h, [hl]

jr_000_1882:
    ld a, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    nop
    ld a, h
    ld h, [hl]
    ld h, [hl]

jr_000_188a:
    ld a, h

jr_000_188b:
    ld h, [hl]
    ld h, [hl]

jr_000_188d:
    ld a, h
    nop
    inc a
    ld h, d
    ld h, b
    ld h, b
    ld h, b
    ld h, d
    inc a
    nop
    ld a, h
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]

jr_000_189d:
    ld a, h
    nop
    ld a, [hl]
    ld h, b
    ld h, b
    ld a, h
    ld h, b
    ld h, b
    ld a, [hl]
    nop
    ld a, [hl]
    ld h, b
    ld h, b
    ld a, h
    ld h, b
    ld h, b
    ld h, b
    nop
    inc a
    ld h, d
    ld h, b
    ld l, [hl]
    ld h, [hl]

jr_000_18b4:
    ld h, [hl]
    ld a, $00
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld a, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    nop
    jr jr_000_18d9

    jr jr_000_18db

    jr jr_000_18dd

    jr jr_000_18c7

jr_000_18c7:
    ld b, $06
    ld b, $06
    ld b, $46
    inc a
    nop
    ld h, [hl]
    ld l, h
    ld a, b
    ld [hl], b
    ld a, b
    ld l, h
    ld h, [hl]
    nop
    ld h, b
    ld h, b

jr_000_18d9:
    ld h, b
    ld h, b

jr_000_18db:
    ld h, b
    ld h, b

jr_000_18dd:
    ld a, h
    nop
    db $fc
    sub $d6
    sub $d6
    add $c6
    nop
    ld h, d
    ld [hl], d
    ld a, d
    ld e, [hl]
    ld c, [hl]
    ld b, [hl]
    ld b, d
    nop
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    ld a, h
    ld h, [hl]
    ld h, [hl]
    ld a, h
    ld h, b
    ld h, b
    ld h, b
    nop
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    ld b, $7c
    ld h, [hl]
    ld h, [hl]
    ld a, h
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    nop
    inc a
    ld h, d
    ld [hl], b
    inc a
    ld c, $46
    inc a
    nop
    ld a, [hl]
    jr @+$1a

    jr @+$1a

    jr jr_000_1936

    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, h
    ld a, b
    nop
    add $c6
    add $d6
    sub $d6
    db $fc

jr_000_1936:
    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    jr @+$1a

    jr jr_000_1947

jr_000_1947:
    ld a, [hl]
    ld c, $1c
    jr c, jr_000_19bc

    ld h, b
    ld a, [hl]
    nop
    ld e, $18
    jr jr_000_196b

    jr jr_000_196d

    ld e, $00
    ld b, b
    ld h, b
    jr nc, jr_000_1973

    inc c
    ld b, $02
    nop
    ld a, b
    jr jr_000_197a

    jr jr_000_197c

    jr jr_000_19de

    nop
    db $10
    jr c, jr_000_19d6

    nop

jr_000_196b:
    nop
    nop

jr_000_196d:
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_1973:
    nop
    nop
    ld a, [hl]
    nop
    nop
    ret nz

    ret nz

jr_000_197a:
    ld h, b
    nop

jr_000_197c:
    nop
    nop
    nop
    nop
    inc a
    ld b, [hl]
    ld a, $66
    ld h, [hl]
    ld a, $00
    ld h, b
    ld a, h
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld a, h
    nop
    nop
    inc a
    ld h, d
    ld h, b
    ld h, b
    ld h, d
    inc a
    nop
    ld b, $3e
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld a, $00
    nop
    inc a
    ld h, [hl]
    ld a, [hl]
    ld h, b
    ld h, d
    inc a
    nop
    ld e, $30
    ld a, h
    jr nc, @+$32

    jr nc, jr_000_19de

    nop
    nop
    ld a, $66
    ld h, [hl]
    ld h, [hl]
    ld a, $46
    inc a
    ld h, b
    ld a, h
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]

jr_000_19bc:
    ld h, [hl]
    ld h, [hl]
    nop
    jr jr_000_19c1

jr_000_19c1:
    jr jr_000_19db

    jr jr_000_19dd

    jr jr_000_19c7

jr_000_19c7:
    nop
    ld [$1818], sp
    jr jr_000_19e5

    ld e, b
    jr nc, jr_000_1a30

    ld h, h
    ld l, b
    ld [hl], b
    ld a, b
    ld l, h
    ld h, [hl]

jr_000_19d6:
    nop
    jr jr_000_19f1

    jr jr_000_19f3

jr_000_19db:
    jr jr_000_19f5

jr_000_19dd:
    inc c

jr_000_19de:
    nop
    nop
    db $fc
    sub $d6
    sub $d6

jr_000_19e5:
    add $00
    nop
    ld a, h
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    nop
    nop
    inc a

jr_000_19f1:
    ld h, [hl]
    ld h, [hl]

jr_000_19f3:
    ld h, [hl]
    ld h, [hl]

jr_000_19f5:
    inc a
    nop
    nop
    ld a, h
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld a, h
    ld h, b
    ld h, b
    nop
    ld a, $66
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld a, $06
    nop
    ld l, h
    ld [hl], b
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    nop
    nop
    inc a
    ld [hl], d
    jr c, jr_000_1a30

    ld c, [hl]
    inc a
    nop
    jr jr_000_1a55

    jr @+$1a

    jr @+$1a

    inc c
    nop
    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld a, $00
    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, h
    ld a, b
    nop
    nop

jr_000_1a30:
    add $c6
    sub $d6
    sub $fc
    nop
    nop
    ld h, [hl]
    ld h, [hl]
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    nop
    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, $1e
    ld b, [hl]
    inc a
    nop
    ld a, [hl]
    ld c, $1c
    jr c, jr_000_1abd

    ld a, [hl]
    nop
    ld c, $18
    jr jr_000_1a83

    jr jr_000_1a6d

jr_000_1a55:
    ld c, $00
    jr jr_000_1a71

    jr jr_000_1a73

    jr jr_000_1a75

    jr @+$1a

    ld [hl], b
    jr jr_000_1a7a

    inc c
    jr jr_000_1a7d

    ld [hl], b
    nop
    nop
    ld h, b
    ld a, [c]
    sbc [hl]
    inc c
    nop

jr_000_1a6d:
    nop
    nop
    db $10
    db $10

jr_000_1a71:
    jr z, jr_000_1a9b

jr_000_1a73:
    ld b, h
    ld b, h

jr_000_1a75:
    add d
    cp $3c
    ld h, d
    ld h, b

jr_000_1a7a:
    ld h, b
    ld h, b
    ld h, d

jr_000_1a7d:
    inc e
    jr nc, @+$26

    nop
    ld h, [hl]
    ld h, [hl]

jr_000_1a83:
    ld h, [hl]
    ld h, [hl]
    ld a, $00
    inc c
    jr jr_000_1a8a

jr_000_1a8a:
    inc a
    ld a, [hl]
    ld h, b
    inc a
    nop
    jr jr_000_1af7

    nop
    inc a
    ld b, $7e
    ld a, $00
    inc h
    nop
    inc a
    ld b, [hl]

jr_000_1a9b:
    ld a, $46
    ld a, $00
    jr nc, jr_000_1ab9

    nop
    inc a
    ld b, $7e
    ld a, $00
    jr jr_000_1ac1

    nop
    inc a
    ld b, $7e
    ld a, $00
    nop
    inc a
    ld h, d
    ld h, b
    ld h, d
    inc a
    ld [$1818], sp
    inc [hl]

jr_000_1ab9:
    nop
    inc a
    ld a, [hl]
    ld h, b

jr_000_1abd:
    ld a, $00
    inc h
    nop

jr_000_1ac1:
    inc a
    ld h, [hl]
    ld a, [hl]
    ld h, b
    ld a, $00
    jr nc, @+$1a

    nop
    inc a
    ld a, [hl]
    ld h, b
    inc a
    nop
    inc h
    nop
    jr jr_000_1aeb

    jr jr_000_1aed

    jr jr_000_1ad7

jr_000_1ad7:
    jr jr_000_1afd

    nop
    jr jr_000_1af4

    jr jr_000_1af6

    nop
    db $10
    ld [$1800], sp
    jr jr_000_1afd

    jr jr_000_1ae7

jr_000_1ae7:
    inc h
    nop
    inc a
    ld h, [hl]

jr_000_1aeb:
    ld a, [hl]
    ld h, [hl]

jr_000_1aed:
    ld h, [hl]
    nop
    jr jr_000_1af1

jr_000_1af1:
    inc a
    ld h, [hl]
    ld a, [hl]

jr_000_1af4:
    ld h, [hl]
    ld h, [hl]

jr_000_1af6:
    nop

jr_000_1af7:
    inc c
    jr jr_000_1b78

    ld h, b
    ld a, h
    ld h, b

jr_000_1afd:
    ld a, [hl]
    nop
    nop
    nop
    ld a, [hl]
    dec de
    ld a, a
    ret c

    ld a, [hl]
    nop
    ccf
    ld a, b
    ret c

    sbc $f8
    ret c

    rst $18
    nop
    jr jr_000_1b45

    nop
    inc a
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    inc h
    nop
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    jr nc, jr_000_1b39

    nop
    inc a
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    jr jr_000_1b4d

    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    jr nc, jr_000_1b49

    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    ld h, [hl]
    nop

jr_000_1b39:
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld a, $46
    inc a
    ld h, [hl]
    nop
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]

jr_000_1b45:
    inc a
    nop
    ld h, [hl]
    nop

jr_000_1b49:
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]

jr_000_1b4d:
    inc a
    nop
    jr jr_000_1b8d

    ld h, d
    ld h, b
    ld h, b
    ld h, d
    inc a
    jr @+$1e

    ld a, [hl-]
    jr nc, jr_000_1bd7

    jr nc, jr_000_1b8d

    ld a, [hl]
    nop
    ld h, [hl]
    ld h, [hl]
    inc a
    jr jr_000_1ba0

    jr @+$1a

    nop
    inc a
    ld h, [hl]
    ld h, [hl]
    ld l, h
    ld h, [hl]
    ld h, [hl]
    db $ec
    nop
    jr @+$1a

    jr jr_000_1b8b

    jr jr_000_1b8d

    jr jr_000_1b8f

    inc c

jr_000_1b78:
    jr jr_000_1b7a

jr_000_1b7a:
    inc a
    ld b, $7e
    ld a, $00
    inc c
    jr jr_000_1b82

jr_000_1b82:
    jr jr_000_1b9c

    jr jr_000_1b9e

    nop
    inc c
    jr jr_000_1b8a

jr_000_1b8a:
    inc a

jr_000_1b8b:
    ld h, [hl]
    ld h, [hl]

jr_000_1b8d:
    inc a
    nop

jr_000_1b8f:
    inc c
    jr jr_000_1b92

jr_000_1b92:
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld a, $00
    inc [hl]
    ld e, b
    nop
    ld a, h
    ld h, [hl]

jr_000_1b9c:
    ld h, [hl]
    ld h, [hl]

jr_000_1b9e:
    nop
    ld a, [de]

jr_000_1ba0:
    inc l
    ld h, d
    ld [hl], d
    ld e, d
    ld c, [hl]
    ld b, [hl]
    nop
    nop
    inc a
    ld b, [hl]
    ld a, $66
    ld a, $00
    ld a, [hl]
    nop
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    ld a, [hl]
    nop
    jr jr_000_1bba

jr_000_1bba:
    jr jr_000_1bec

    ld h, b
    ld h, [hl]
    inc a
    nop
    nop
    nop
    ld a, $30
    jr nc, jr_000_1bf6

    nop
    nop
    nop
    nop
    ld a, h
    inc c
    inc c
    inc c
    nop
    ld h, d
    db $e4
    ld l, b
    db $76
    dec hl
    ld b, e
    add [hl]
    rrca

jr_000_1bd7:
    ld h, d
    db $e4
    ld l, b
    db $76
    ld l, $56
    sbc a
    ld b, $00
    jr jr_000_1be2

jr_000_1be2:
    jr @+$1a

    jr @+$1a

    jr jr_000_1c03

    ld [hl], $6c
    ret c

    ld l, h

jr_000_1bec:
    ld [hl], $1b
    nop
    ret c

    ld l, h
    ld [hl], $1b
    ld [hl], $6c
    ret c

jr_000_1bf6:
    nop
    inc [hl]
    ld e, b
    nop
    inc a
    ld b, $7e
    ld a, $00
    inc [hl]
    ld e, b
    nop
    inc a

jr_000_1c03:
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    ld [bc], a
    inc a
    ld h, [hl]
    ld l, [hl]
    db $76
    ld h, [hl]
    inc a
    ld b, b
    nop
    ld [bc], a
    inc a
    ld l, [hl]
    db $76
    ld h, [hl]
    inc a
    ld b, b
    nop
    nop
    ld a, [hl]
    db $db
    sbc $d8
    ld a, a
    nop
    nop
    ld a, [hl]
    ret c

    ret c

    db $fc
    ret c

    ret c

    sbc $20
    db $10
    inc a
    ld h, [hl]
    ld h, [hl]
    ld a, [hl]
    ld h, [hl]
    ld h, [hl]
    inc [hl]
    ld e, b
    inc a
    ld h, [hl]
    ld h, [hl]
    ld a, [hl]
    ld h, [hl]
    ld h, [hl]
    inc [hl]
    ld e, b
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    ld h, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc c
    jr @+$32

    nop
    nop
    nop
    nop
    nop
    nop
    db $10
    jr c, jr_000_1c63

    db $10
    stop
    nop
    ld a, d
    jp z, $caca

    ld a, d
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    inc a
    ld b, d
    sbc c
    or l

jr_000_1c63:
    or c
    sbc l
    ld b, d
    inc a
    inc a
    ld b, d
    cp c
    or l
    cp c
    or l
    ld b, d
    inc a
    pop af
    ld e, e
    ld d, l
    ld d, c
    ld d, c
    nop
    nop
    nop
    ld h, [hl]
    nop
    and $66
    ld h, [hl]
    or $06
    inc e
    or $66
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    or $06
    inc e
    nop
    ld h, [hl]
    db $76
    inc a
    ld l, [hl]
    ld h, [hl]
    nop
    nop
    nop
    ld a, h
    inc c
    inc c
    inc c
    ld a, [hl]
    nop
    nop
    nop
    ld e, $06
    ld c, $1e
    ld [hl], $00
    nop
    nop
    ld a, [hl]
    inc c
    inc c
    inc c
    inc c
    nop
    nop
    nop
    ld a, h
    ld b, $66
    ld h, [hl]
    ld h, [hl]
    nop
    nop
    nop
    inc e
    inc c
    inc c
    inc c
    inc c
    nop
    nop
    nop
    ld e, $0c
    ld b, $06
    ld b, $00
    nop
    nop
    ld a, [hl]
    ld [hl], $36
    ld [hl], $36
    nop
    nop
    ld h, b
    ld l, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld a, [hl]
    nop
    nop
    nop
    inc a
    inc c
    inc c
    nop
    nop
    nop
    nop
    nop
    ld a, $06
    ld b, $06
    ld a, $00
    nop
    ld h, b
    ld a, [hl]
    ld b, $06
    ld b, $0e
    nop
    nop
    nop
    ld l, h
    ld a, $66
    ld h, [hl]
    ld l, [hl]
    nop
    nop
    nop
    inc e
    inc c
    inc c
    inc c
    inc a
    nop
    nop
    nop
    ld a, $36
    ld [hl], $36
    inc e
    nop
    nop
    nop
    ld [hl], $36
    ld [hl], $36
    ld a, [hl]
    nop
    nop
    nop
    ld a, [hl]
    ld h, [hl]
    db $76
    ld b, $7e
    nop
    nop
    nop
    ld h, [hl]
    ld h, [hl]
    inc a
    ld c, $7e
    nop
    nop
    nop
    ld a, $06
    ld [hl], $36
    inc [hl]
    jr nc, jr_000_1d1f

jr_000_1d1f:
    nop
    ld a, b
    inc c
    inc c
    inc c
    inc c
    nop
    nop
    nop
    sub $d6
    sub $d6
    cp $00
    nop
    nop
    ld a, h
    ld l, h
    ld l, h
    ld l, h
    db $ec
    nop
    nop
    nop
    inc e
    inc c
    inc c
    inc c
    inc c
    inc c
    nop
    nop
    ld a, $06
    ld b, $06
    ld b, $06
    nop
    nop
    cp $66
    ld h, [hl]
    ld h, [hl]
    ld a, [hl]
    nop
    nop
    nop
    ld a, [hl]
    ld h, [hl]
    db $76
    ld b, $06
    ld b, $00
    nop
    ld [hl], $36
    inc e
    inc c
    inc c
    inc c
    nop
    inc e
    ld [hl-], a
    inc a
    ld h, [hl]
    ld h, [hl]
    inc a
    ld c, h
    jr c, jr_000_1d68

jr_000_1d68:
    db $10
    jr c, jr_000_1dd7

    add $82
    nop
    nop
    ld h, [hl]
    rst $30
    sbc c
    sbc c
    rst $28
    ld h, [hl]
    nop
    nop
    nop
    nop
    db $76
    call c, $dcc8
    halt
    inc e
    ld [hl], $66
    ld a, h
    ld h, [hl]
    ld h, [hl]
    ld a, h
    ld h, b
    nop
    cp $66
    ld h, d
    ld h, b
    ld h, b
    ld h, b
    ld hl, sp+$00
    nop
    cp $6c
    ld l, h
    ld l, h
    ld l, h
    ld c, b
    cp $66
    jr nc, @+$1a

    jr nc, @+$68

    cp $00
    nop
    ld e, $38
    ld l, h
    ld l, h
    ld l, h
    jr c, jr_000_1da7

jr_000_1da7:
    nop
    nop
    ld l, h
    ld l, h
    ld l, h
    ld l, h
    ld a, a
    ret nz

    nop
    nop
    ld a, [hl]
    jr jr_000_1dcc

    jr jr_000_1dce

    db $10
    inc a
    jr jr_000_1df6

    ld h, [hl]
    ld h, [hl]
    inc a
    jr jr_000_1dfb

    nop
    inc a
    ld h, [hl]
    ld a, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    nop
    nop
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]

jr_000_1dcc:
    inc h
    ld h, [hl]

jr_000_1dce:
    nop
    inc e
    ld [hl], $78
    call c, $eccc
    ld a, b
    nop

jr_000_1dd7:
    inc c
    jr jr_000_1e12

    ld d, h
    ld d, h
    jr c, jr_000_1e0e

    ld h, b
    nop
    db $10
    ld a, h
    sub $d6
    sub $7c
    db $10
    ld a, $70
    ld h, b
    ld a, [hl]
    ld h, b
    ld [hl], b
    ld a, $00
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]

jr_000_1df6:
    nop
    nop
    ld a, [hl]
    nop
    ld a, [hl]

jr_000_1dfb:
    nop
    ld a, [hl]
    nop
    nop
    jr @+$1a

    ld a, [hl]
    jr @+$1a

    nop
    ld a, [hl]
    nop
    jr nc, jr_000_1e21

    inc c
    jr jr_000_1e3c

    nop
    ld a, [hl]

jr_000_1e0e:
    nop
    inc c
    jr @+$32

jr_000_1e12:
    jr @+$0e

    nop
    ld a, [hl]
    nop
    nop
    ld c, $1b
    dec de
    jr jr_000_1e35

    jr jr_000_1e37

    jr jr_000_1e39

jr_000_1e21:
    jr jr_000_1e3b

    ret c

    ret c

    ld [hl], b
    nop
    jr jr_000_1e41

    nop
    ld a, [hl]
    nop

jr_000_1e2c:
    jr jr_000_1e46

    nop
    nop
    ld [hl-], a
    ld c, h
    nop
    ld [hl-], a
    ld c, h

jr_000_1e35:
    nop
    nop

jr_000_1e37:
    jr c, @+$6e

jr_000_1e39:
    jr c, jr_000_1e3b

jr_000_1e3b:
    nop

jr_000_1e3c:
    nop
    nop
    nop
    jr c, jr_000_1ebd

jr_000_1e41:
    jr c, jr_000_1e43

jr_000_1e43:
    nop
    nop
    nop

jr_000_1e46:
    nop
    nop
    nop
    nop
    nop
    jr jr_000_1e65

    nop
    nop
    nop
    nop
    rrca
    jr jr_000_1e2c

    ld [hl], b
    jr nc, jr_000_1e57

jr_000_1e57:
    jr c, jr_000_1ec5

    ld l, h
    ld l, h
    ld l, h
    nop
    nop
    nop
    jr c, jr_000_1ecd

    jr @+$32

    ld a, h
    nop

jr_000_1e65:
    nop
    nop
    ld a, b
    inc c
    jr c, jr_000_1e77

    ld a, b
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop

Call_000_1e77:
Jump_000_1e77:
jr_000_1e77:
    di
    ldh a, [rLCDC]
    bit 7, a
    jr z, jr_000_1e81

    call Call_000_0ea2

jr_000_1e81:
    ld hl, $8100
    ld de, $1680
    ld b, $00
    call Call_000_2116
    ld bc, $1ed9
    call Call_000_0e31
    ld bc, $1ee4
    call Call_000_0e37
    ld a, $48
    ldh [rLYC], a
    ld a, $44
    ldh [rSTAT], a
    ldh a, [rIE]
    or $02
    ldh [rIE], a
    ld hl, $9800
    ld a, $10
    ld bc, $000c
    ld e, $12

jr_000_1eb0:
    ld d, $14

jr_000_1eb2:
    ld [hl+], a
    inc a
    dec d
    jr nz, jr_000_1eb2

    add hl, bc
    dec e
    jr nz, jr_000_1eb0

    ldh a, [rLCDC]

jr_000_1ebd:
    or $91
    and $f7
    ldh [rLCDC], a
    ld a, $01

jr_000_1ec5:
    ld [$c0a1], a
    ld a, $00
    ld [$c116], a

jr_000_1ecd:
    ld a, $03
    ld [$c114], a
    ld a, $00
    ld [$c115], a
    ei
    ret


    ldh a, [rLCDC]
    or $10
    ldh [rLCDC], a
    ld a, $48
    ldh [rLYC], a
    ret


jr_000_1ee4:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_1ee4

    ldh a, [rLCDC]
    and $ef
    ldh [rLCDC], a
    ret


Call_000_1ef1:
    ld hl, $8100
    ld de, $1680
    call Call_000_2148
    ret


Call_000_1efb:
    push de
    push hl
    ld l, b
    sla l
    sla l
    sla l
    ld h, $00
    add hl, hl
    ld d, h
    ld e, l
    ld hl, $1f60
    sla c
    sla c
    sla c
    ld b, $00
    add hl, bc
    add hl, bc
    ld b, [hl]
    inc hl
    ld h, [hl]
    ld l, b
    add hl, de
    ld b, h
    ld c, l
    pop hl
    push bc
    ld a, h
    or l
    jr z, jr_000_1f29

    ld de, $0010
    call Call_000_2148

jr_000_1f29:
    pop hl
    pop bc
    ld de, $0010
    call Call_000_2148
    ret


    push bc
    ld a, [$c0a1]
    cp $01
    call nz, Call_000_1e77
    ld hl, sp+$04
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_000_1efb
    pop bc
    ret


    push bc
    ld a, [$c0a1]
    cp $01
    call nz, Call_000_1e77
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    call Call_000_1ef1
    pop bc
    ret


    nop
    add c
    ld [bc], a
    add c
    inc b
    add c
    ld b, $81
    ld [$0a81], sp
    add c
    inc c
    add c
    ld c, $81
    ld b, b
    add d
    ld b, d
    add d
    ld b, h
    add d
    ld b, [hl]
    add d
    ld c, b
    add d
    ld c, d
    add d
    ld c, h
    add d
    ld c, [hl]
    add d
    add b
    add e
    add d
    add e
    add h
    add e
    add [hl]
    add e
    adc b
    add e
    adc d
    add e
    adc h
    add e
    adc [hl]
    add e
    ret nz

    add h
    jp nz, $c484

    add h
    add $84
    ret z

    add h
    jp z, $cc84

    add h
    adc $84
    nop
    add [hl]
    ld [bc], a
    add [hl]
    inc b
    add [hl]
    ld b, $86
    ld [$0a86], sp
    add [hl]
    inc c
    add [hl]
    ld c, $86
    ld b, b
    add a
    ld b, d
    add a
    ld b, h
    add a
    ld b, [hl]
    add a
    ld c, b
    add a
    ld c, d
    add a
    ld c, h
    add a
    ld c, [hl]
    add a
    add b
    adc b
    add d
    adc b
    add h
    adc b
    add [hl]
    adc b
    adc b
    adc b
    adc d
    adc b
    adc h
    adc b
    adc [hl]
    adc b
    ret nz

    adc c
    jp nz, $c489

    adc c
    add $89
    ret z

    adc c
    jp z, $cc89

    adc c
    adc $89
    nop
    adc e
    ld [bc], a
    adc e
    inc b
    adc e
    ld b, $8b
    ld [$0a8b], sp
    adc e
    inc c
    adc e
    ld c, $8b
    ld b, b
    adc h
    ld b, d
    adc h
    ld b, h
    adc h
    ld b, [hl]
    adc h
    ld c, b
    adc h
    ld c, d
    adc h
    ld c, h
    adc h
    ld c, [hl]
    adc h
    add b
    adc l
    add d
    adc l
    add h
    adc l
    add [hl]
    adc l
    adc b
    adc l
    adc d
    adc l
    adc h
    adc l
    adc [hl]
    adc l
    ret nz

    adc [hl]
    jp nz, $c48e

    adc [hl]
    add $8e
    ret z

    adc [hl]
    jp z, $cc8e

    adc [hl]
    adc $8e
    nop
    sub b
    ld [bc], a
    sub b
    inc b
    sub b
    ld b, $90
    ld [$0a90], sp
    sub b
    inc c
    sub b
    ld c, $90
    ld b, b
    sub c
    ld b, d
    sub c
    ld b, h
    sub c
    ld b, [hl]
    sub c
    ld c, b
    sub c
    ld c, d
    sub c
    ld c, h
    sub c
    ld c, [hl]
    sub c
    add b
    sub d
    add d
    sub d
    add h
    sub d
    add [hl]
    sub d
    adc b
    sub d
    adc d
    sub d
    adc h
    sub d
    adc [hl]
    sub d
    ret nz

    sub e
    jp nz, $c493

    sub e
    add $93
    ret z

    sub e
    jp z, $cc93

    sub e
    adc $93
    nop
    sub l
    ld [bc], a
    sub l
    inc b
    sub l
    ld b, $95
    ld [$0a95], sp
    sub l
    inc c
    sub l
    ld c, $95
    ld b, b
    sub [hl]
    ld b, d
    sub [hl]
    ld b, h
    sub [hl]
    ld b, [hl]
    sub [hl]
    ld c, b
    sub [hl]
    ld c, d
    sub [hl]
    ld c, h
    sub [hl]
    ld c, [hl]
    sub [hl]
    push af
    push bc

jr_000_2082:
    ld b, $ff

jr_000_2084:
    call Call_MAIN_LOOP
    or a
    jr nz, jr_000_2082

    dec b
    jr nz, jr_000_2084

    pop bc
    pop af
    ret


Call_MAIN_LOOP:
    push bc
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    swap a
    ld b, a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    or b
    swap a
    ld b, a
    ld a, $30
    ldh [rP1], a
    ld a, b
    pop bc
    ret


Call_000_20bd:
jr_000_20bd:
    call Call_MAIN_LOOP
    and b
    jr z, jr_000_20bd

    ret


Call_000_20c4:
    call Call_MAIN_LOOP
    ld e, a
    ret


    push bc
    ld hl, sp+$04
    ld b, [hl]
    call Call_000_20bd
    ld e, a
    pop bc
    ret


Call_000_WaitLoop:
    push bc
    call Call_WaitLoop
    ld b, $32

Jump_000_20d9:
    jr jr_000_20db

jr_000_20db:
    jr jr_000_20dd

jr_000_20dd:
    jr jr_000_20df

jr_000_20df:
    jr jr_000_20e1

jr_000_20e1:
    jr jr_000_20e3

jr_000_20e3:
    dec b
    jp nz, Jump_000_20d9

    nop
    pop bc
    jr jr_000_20eb

jr_000_20eb:
    jr jr_000_20ed

jr_000_20ed:
    jr jr_000_20ef

jr_000_20ef:
    ret


Call_WaitLoop:
jr_WaitLoop:
    dec de
    ld a, e
    or d
    ret z

    ld b, $33

Jump_WaitInputLoop:
    jr jr_000_20f8

jr_000_20f8:
    jr jr_000_20fa

jr_000_20fa:
    jr jr_000_20fc

jr_000_20fc:
    jr jr_000_20fe

jr_000_20fe:
    jr jr_000_2100

jr_000_2100:
    dec b
    jp nz, Jump_WaitInputLoop

    nop
    jr jr_000_2107

jr_000_2107:
    jr jr_000_2109

jr_000_2109:
    jr jr_000_210b

jr_000_210b:
    jr jr_WaitLoop

Call_001_WaitLoop:
    ld hl, sp+$02
    ld e, [hl]
    inc hl
    ld d, [hl]
    call Call_000_WaitLoop
    ret


Call_000_2116:
Jump_000_2116:
jr_000_2116:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_2116

    ld [hl], b
    inc hl
    dec de
    ld a, d
    or e
    jr nz, jr_000_2116

    ret


    ldh a, [rLCDC]
    bit 6, a
    jr nz, jr_000_212f

    ld hl, $9800
    jr jr_000_2142

jr_000_212f:
    ld hl, $9c00
    jr jr_000_2142

    ldh a, [rLCDC]
    bit 3, a
    jr nz, jr_000_213f

    ld hl, $9800
    jr jr_000_2142

jr_000_213f:
    ld hl, $9c00

jr_000_2142:
    ld de, $0400
    jp Jump_000_2116


Call_000_2148:
jr_000_2148:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_2148

    ld a, [bc]
    ld [hl+], a
    inc bc
    dec de
    ld a, d
    or e
    jr nz, jr_000_2148

    ret


    push bc
    ld hl, sp+$09
    ld d, [hl]
    dec hl
    ld e, [hl]
    dec hl
    ld b, [hl]
    dec hl
    ld c, [hl]
    dec hl
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    call Call_000_2148
    pop bc
    ret


Call_000_216a:
    ret


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
