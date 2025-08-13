
initproc:	file format elf64-littleriscv

Disassembly of section .text:

0000000000010000 <_start>:
   10000: 7175         	addi	sp, sp, -0x90
   10002: e506         	sd	ra, 0x88(sp)
   10004: e122         	sd	s0, 0x80(sp)
   10006: fca6         	sd	s1, 0x78(sp)
   10008: f8ca         	sd	s2, 0x70(sp)
   1000a: f4ce         	sd	s3, 0x68(sp)
   1000c: f0d2         	sd	s4, 0x60(sp)
   1000e: ecd6         	sd	s5, 0x58(sp)
   10010: e8da         	sd	s6, 0x50(sp)
   10012: e4de         	sd	s7, 0x48(sp)
   10014: e0e2         	sd	s8, 0x40(sp)
   10016: 0900         	addi	s0, sp, 0x90
   10018: 8aae         	mv	s5, a1
   1001a: 892a         	mv	s2, a0

000000000001001c <.Lpcrel_hi68>:
   1001c: 0000d517     	auipc	a0, 0xd
   10020: 00450993     	addi	s3, a0, 0x4
   10024: 4505         	li	a0, 0x1
   10026: 00a9b4af     	amoadd.d	s1, a0, (s3)
   1002a: 0089b503     	ld	a0, 0x8(s3)
   1002e: 0230000f     	fence	r, rw
   10032: 00950a63     	beq	a0, s1, 0x10046 <.Lpcrel_hi68+0x2a>
   10036: 0100000f     	fence	w, 0
   1003a: 0089b503     	ld	a0, 0x8(s3)
   1003e: 0230000f     	fence	r, rw
   10042: fe951ae3     	bne	a0, s1, 0x10036 <.Lpcrel_hi68+0x1a>
   10046: 01098513     	addi	a0, s3, 0x10

000000000001004a <.Lpcrel_hi69>:
   1004a: 00005597     	auipc	a1, 0x5
   1004e: fd658593     	addi	a1, a1, -0x2a
   10052: 6621         	lui	a2, 0x8
   10054: 00001097     	auipc	ra, 0x1
   10058: 51c080e7     	jalr	0x51c(ra) <_ZN22buddy_system_allocator4Heap4init17h097231ac74310fdbE>
   1005c: 4601         	li	a2, 0x0
   1005e: 0485         	addi	s1, s1, 0x1
   10060: 0310000f     	fence	rw, w
   10064: 0099b423     	sd	s1, 0x8(s3)
   10068: 45a1         	li	a1, 0x8
   1006a: f6043823     	sd	zero, -0x90(s0)
   1006e: f6b43c23     	sd	a1, -0x88(s0)
   10072: f8043023     	sd	zero, -0x80(s0)
   10076: 0a090e63     	beqz	s2, 0x10132 <.Lpcrel_hi73+0x24>
   1007a: 4c01         	li	s8, 0x0
   1007c: f9040a13     	addi	s4, s0, -0x70

0000000000010080 <.Lpcrel_hi70>:
   10080: 00004517     	auipc	a0, 0x4
   10084: 49850993     	addi	s3, a0, 0x498
   10088: a00d         	j	0x100aa <.Lpcrel_hi70+0x2a>
   1008a: f7843503     	ld	a0, -0x88(s0)
   1008e: 0c05         	addi	s8, s8, 0x1
   10090: 00449593     	slli	a1, s1, 0x4
   10094: 00148613     	addi	a2, s1, 0x1
   10098: 952e         	add	a0, a0, a1
   1009a: 01653023     	sd	s6, 0x0(a0)
   1009e: 01753423     	sd	s7, 0x8(a0)
   100a2: f8c43023     	sd	a2, -0x80(s0)
   100a6: 092c0463     	beq	s8, s2, 0x1012e <.Lpcrel_hi73+0x20>
   100aa: 003c1513     	slli	a0, s8, 0x3
   100ae: 9556         	add	a0, a0, s5
   100b0: 610c         	ld	a1, 0x0(a0)
   100b2: 567d         	li	a2, -0x1
   100b4: 00c58533     	add	a0, a1, a2
   100b8: 00154503     	lbu	a0, 0x1(a0)
   100bc: 0605         	addi	a2, a2, 0x1
   100be: f97d         	bnez	a0, 0x100b4 <.Lpcrel_hi70+0x34>
   100c0: f8840513     	addi	a0, s0, -0x78
   100c4: 00003097     	auipc	ra, 0x3
   100c8: a64080e7     	jalr	-0x59c(ra) <_ZN4core3str8converts9from_utf817h738c3b55a64ab805E>
   100cc: f8843503     	ld	a0, -0x78(s0)
   100d0: e11d         	bnez	a0, 0x100f6 <.Lpcrel_hi70+0x76>
   100d2: f7043503     	ld	a0, -0x90(s0)
   100d6: f8043483     	ld	s1, -0x80(s0)
   100da: f9043b03     	ld	s6, -0x70(s0)
   100de: f9843b83     	ld	s7, -0x68(s0)
   100e2: faa494e3     	bne	s1, a0, 0x1008a <.Lpcrel_hi70+0xa>
   100e6: f7040513     	addi	a0, s0, -0x90
   100ea: 85ce         	mv	a1, s3
   100ec: 00000097     	auipc	ra, 0x0
   100f0: 7c8080e7     	jalr	0x7c8(ra) <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hda445081f7d4a6e0E>
   100f4: bf59         	j	0x1008a <.Lpcrel_hi70+0xa>
   100f6: 000a3503     	ld	a0, 0x0(s4)
   100fa: 008a3583     	ld	a1, 0x8(s4)
   100fe: faa43023     	sd	a0, -0x60(s0)
   10102: fab43423     	sd	a1, -0x58(s0)

0000000000010106 <.Lpcrel_hi71>:
   10106: 00004517     	auipc	a0, 0x4

000000000001010a <.Lpcrel_hi72>:
   1010a: 00004617     	auipc	a2, 0x4

000000000001010e <.Lpcrel_hi73>:
   1010e: 00004717     	auipc	a4, 0x4
   10112: 02b00593     	li	a1, 0x2b
   10116: 36250513     	addi	a0, a0, 0x362
   1011a: 42660693     	addi	a3, a2, 0x426
   1011e: 44270713     	addi	a4, a4, 0x442
   10122: fa040613     	addi	a2, s0, -0x60
   10126: 00002097     	auipc	ra, 0x2
   1012a: cfe080e7     	jalr	-0x302(ra) <_ZN4core6result13unwrap_failed17hce77d3a84c0ed806E>
   1012e: f7843583     	ld	a1, -0x88(s0)
   10132: 854a         	mv	a0, s2
   10134: 00000097     	auipc	ra, 0x0
   10138: 012080e7     	jalr	0x12(ra) <main>
   1013c: 2501         	sext.w	a0, a0
   1013e: 00001097     	auipc	ra, 0x1
   10142: 8ac080e7     	jalr	-0x754(ra) <_ZN8user_lib4task4exit17h577e6242661a5447E>

0000000000010146 <main>:
   10146: 1101         	addi	sp, sp, -0x20
   10148: ec06         	sd	ra, 0x18(sp)
   1014a: e822         	sd	s0, 0x10(sp)
   1014c: e426         	sd	s1, 0x8(sp)
   1014e: 1000         	addi	s0, sp, 0x20
   10150: 0dc00893     	li	a7, 0xdc
   10154: 4501         	li	a0, 0x0
   10156: 4581         	li	a1, 0x0
   10158: 4601         	li	a2, 0x0
   1015a: 00000073     	ecall
   1015e: c10d         	beqz	a0, 0x10180 <.Lpcrel_hi0>
   10160: 54fd         	li	s1, -0x1
   10162: fe042223     	sw	zero, -0x1c(s0)
   10166: fe440513     	addi	a0, s0, -0x1c
   1016a: 00001097     	auipc	ra, 0x1
   1016e: 8aa080e7     	jalr	-0x756(ra) <_ZN8user_lib4task4wait17hf23c39620adf1b7bE>
   10172: fe9518e3     	bne	a0, s1, 0x10162 <main+0x1c>
   10176: 00001097     	auipc	ra, 0x1
   1017a: 884080e7     	jalr	-0x77c(ra) <_ZN8user_lib4task6yield_17h1883d5d9b4cfe256E>
   1017e: b7d5         	j	0x10162 <main+0x1c>

0000000000010180 <.Lpcrel_hi0>:
   10180: 00004517     	auipc	a0, 0x4

0000000000010184 <.Lpcrel_hi1>:
   10184: 00004597     	auipc	a1, 0x4
   10188: e8050513     	addi	a0, a0, -0x180
   1018c: e9458593     	addi	a1, a1, -0x16c
   10190: 0dd00893     	li	a7, 0xdd
   10194: 4601         	li	a2, 0x0
   10196: 00000073     	ecall
   1019a: 4501         	li	a0, 0x0
   1019c: 60e2         	ld	ra, 0x18(sp)
   1019e: 6442         	ld	s0, 0x10(sp)
   101a0: 64a2         	ld	s1, 0x8(sp)
   101a2: 6105         	addi	sp, sp, 0x20
   101a4: 8082         	ret

00000000000101a6 <__rust_alloc_error_handler>:
   101a6: 00001317     	auipc	t1, 0x1
   101aa: 2a430067     	jr	0x2a4(t1) <__rg_oom>

00000000000101ae <__switch_user>:
   101ae: 00153423     	sd	ra, 0x8(a0)
   101b2: 10153423     	sd	ra, 0x108(a0)
   101b6: 00253823     	sd	sp, 0x10(a0)
   101ba: 00353c23     	sd	gp, 0x18(a0)
   101be: 02453023     	sd	tp, 0x20(a0)
   101c2: 02553423     	sd	t0, 0x28(a0)
   101c6: 02653823     	sd	t1, 0x30(a0)
   101ca: 02753c23     	sd	t2, 0x38(a0)
   101ce: e120         	sd	s0, 0x40(a0)
   101d0: e524         	sd	s1, 0x48(a0)
   101d2: ed2c         	sd	a1, 0x58(a0)
   101d4: f130         	sd	a2, 0x60(a0)
   101d6: f534         	sd	a3, 0x68(a0)
   101d8: f938         	sd	a4, 0x70(a0)
   101da: fd3c         	sd	a5, 0x78(a0)
   101dc: 09053023     	sd	a6, 0x80(a0)
   101e0: 09153423     	sd	a7, 0x88(a0)
   101e4: 09253823     	sd	s2, 0x90(a0)
   101e8: 09353c23     	sd	s3, 0x98(a0)
   101ec: 0b453023     	sd	s4, 0xa0(a0)
   101f0: 0b553423     	sd	s5, 0xa8(a0)
   101f4: 0b653823     	sd	s6, 0xb0(a0)
   101f8: 0b753c23     	sd	s7, 0xb8(a0)
   101fc: 0d853023     	sd	s8, 0xc0(a0)
   10200: 0d953423     	sd	s9, 0xc8(a0)
   10204: 0da53823     	sd	s10, 0xd0(a0)
   10208: 0db53c23     	sd	s11, 0xd8(a0)
   1020c: 0fc53023     	sd	t3, 0xe0(a0)
   10210: 0fd53423     	sd	t4, 0xe8(a0)
   10214: 0fe53823     	sd	t5, 0xf0(a0)
   10218: 0ff53c23     	sd	t6, 0xf8(a0)
   1021c: e928         	sd	a0, 0x50(a0)
   1021e: 0105b103     	ld	sp, 0x10(a1)
   10222: 0185b183     	ld	gp, 0x18(a1)
   10226: 0205b203     	ld	tp, 0x20(a1)
   1022a: 0285b283     	ld	t0, 0x28(a1)
   1022e: 0305b303     	ld	t1, 0x30(a1)
   10232: 0385b383     	ld	t2, 0x38(a1)
   10236: 61a0         	ld	s0, 0x40(a1)
   10238: 65a4         	ld	s1, 0x48(a1)
   1023a: 69a8         	ld	a0, 0x50(a1)
   1023c: 71b0         	ld	a2, 0x60(a1)
   1023e: 75b4         	ld	a3, 0x68(a1)
   10240: 79b8         	ld	a4, 0x70(a1)
   10242: 7dbc         	ld	a5, 0x78(a1)
   10244: 0805b803     	ld	a6, 0x80(a1)
   10248: 0885b883     	ld	a7, 0x88(a1)
   1024c: 0905b903     	ld	s2, 0x90(a1)
   10250: 0985b983     	ld	s3, 0x98(a1)
   10254: 0a05ba03     	ld	s4, 0xa0(a1)
   10258: 0a85ba83     	ld	s5, 0xa8(a1)
   1025c: 0b05bb03     	ld	s6, 0xb0(a1)
   10260: 0b85bb83     	ld	s7, 0xb8(a1)
   10264: 0c05bc03     	ld	s8, 0xc0(a1)
   10268: 0c85bc83     	ld	s9, 0xc8(a1)
   1026c: 0d05bd03     	ld	s10, 0xd0(a1)
   10270: 0d85bd83     	ld	s11, 0xd8(a1)
   10274: 0e05be03     	ld	t3, 0xe0(a1)
   10278: 0e85be83     	ld	t4, 0xe8(a1)
   1027c: 0f05bf03     	ld	t5, 0xf0(a1)
   10280: 0f85bf83     	ld	t6, 0xf8(a1)
   10284: 1085b083     	ld	ra, 0x108(a1)
   10288: 6dac         	ld	a1, 0x58(a1)
   1028a: 8082         	ret

000000000001028c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h44f94debc98ae57fE>:
   1028c: 1141         	addi	sp, sp, -0x10
   1028e: e406         	sd	ra, 0x8(sp)
   10290: e022         	sd	s0, 0x0(sp)
   10292: 0800         	addi	s0, sp, 0x10
   10294: 0245e603     	lwu	a2, 0x24(a1)
   10298: 6108         	ld	a0, 0x0(a0)
   1029a: 01067693     	andi	a3, a2, 0x10
   1029e: ea99         	bnez	a3, 0x102b4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h44f94debc98ae57fE+0x28>
   102a0: 02067613     	andi	a2, a2, 0x20
   102a4: ee19         	bnez	a2, 0x102c2 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h44f94debc98ae57fE+0x36>
   102a6: 60a2         	ld	ra, 0x8(sp)
   102a8: 6402         	ld	s0, 0x0(sp)
   102aa: 0141         	addi	sp, sp, 0x10
   102ac: 00003317     	auipc	t1, 0x3
   102b0: f9830067     	jr	-0x68(t1) <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hd702446eeb002cb5E>
   102b4: 60a2         	ld	ra, 0x8(sp)
   102b6: 6402         	ld	s0, 0x0(sp)
   102b8: 0141         	addi	sp, sp, 0x10
   102ba: 00003317     	auipc	t1, 0x3
   102be: d1230067     	jr	-0x2ee(t1) <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17he7375797a8d2e315E>
   102c2: 60a2         	ld	ra, 0x8(sp)
   102c4: 6402         	ld	s0, 0x0(sp)
   102c6: 0141         	addi	sp, sp, 0x10
   102c8: 00003317     	auipc	t1, 0x3
   102cc: d6c30067     	jr	-0x294(t1) <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u8$GT$3fmt17h6087460a09305b13E>

00000000000102d0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h95f43ea8b7f4bdb5E>:
   102d0: 1141         	addi	sp, sp, -0x10
   102d2: e406         	sd	ra, 0x8(sp)
   102d4: e022         	sd	s0, 0x0(sp)
   102d6: 0800         	addi	s0, sp, 0x10
   102d8: 6108         	ld	a0, 0x0(a0)
   102da: 60a2         	ld	ra, 0x8(sp)
   102dc: 6402         	ld	s0, 0x0(sp)
   102de: 0141         	addi	sp, sp, 0x10
   102e0: 00002317     	auipc	t1, 0x2
   102e4: 84c30067     	jr	-0x7b4(t1) <_ZN68_$LT$core..ptr..alignment..Alignment$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9c9e1fbca3327e3E>

00000000000102e8 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8c0101d7a0e2b9bbE>:
   102e8: 1141         	addi	sp, sp, -0x10
   102ea: e406         	sd	ra, 0x8(sp)
   102ec: e022         	sd	s0, 0x0(sp)
   102ee: 0800         	addi	s0, sp, 0x10
   102f0: 6110         	ld	a2, 0x0(a0)
   102f2: 6514         	ld	a3, 0x8(a0)
   102f4: 872e         	mv	a4, a1
   102f6: 8532         	mv	a0, a2
   102f8: 85b6         	mv	a1, a3
   102fa: 863a         	mv	a2, a4
   102fc: 60a2         	ld	ra, 0x8(sp)
   102fe: 6402         	ld	s0, 0x0(sp)
   10300: 0141         	addi	sp, sp, 0x10
   10302: 00003317     	auipc	t1, 0x3
   10306: 80830067     	jr	-0x7f8(t1) <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h67f5dc862fdd3cceE>

000000000001030a <_ZN4spin4once17Once$LT$T$C$R$GT$18try_call_once_slow17h76607cb82faf7e81E>:
   1030a: 1141         	addi	sp, sp, -0x10
   1030c: e406         	sd	ra, 0x8(sp)
   1030e: e022         	sd	s0, 0x0(sp)
   10310: 0800         	addi	s0, sp, 0x10

0000000000010312 <.Lpcrel_hi8>:
   10312: 00005517     	auipc	a0, 0x5
   10316: 0ff00593     	li	a1, 0xff
   1031a: cf650513     	addi	a0, a0, -0x30a
   1031e: 01050613     	addi	a2, a0, 0x10
   10322: 9a71         	andi	a2, a2, -0x4
   10324: 4685         	li	a3, 0x1
   10326: 1406272f     	lr.w.aq	a4, (a2)
   1032a: 00b777b3     	and	a5, a4, a1
   1032e: eb81         	bnez	a5, 0x1033e <.Lpcrel_hi8+0x2c>
   10330: 00d747b3     	xor	a5, a4, a3
   10334: 8fed         	and	a5, a5, a1
   10336: 8fb9         	xor	a5, a5, a4
   10338: 18f627af     	sc.w	a5, a5, (a2)
   1033c: f7ed         	bnez	a5, 0x10326 <.Lpcrel_hi8+0x14>
   1033e: 0ff77793     	andi	a5, a4, 0xff
   10342: cb95         	beqz	a5, 0x10376 <.Lpcrel_hi8+0x64>
   10344: 0ff77713     	andi	a4, a4, 0xff
   10348: fce05fe3     	blez	a4, 0x10326 <.Lpcrel_hi8+0x14>
   1034c: 00d70563     	beq	a4, a3, 0x10356 <.Lpcrel_hi8+0x44>
   10350: a089         	j	0x10392 <.Lpcrel_hi8+0x80>
   10352: 0100000f     	fence	w, 0
   10356: 01050703     	lb	a4, 0x10(a0)
   1035a: 0230000f     	fence	r, rw
   1035e: fed70ae3     	beq	a4, a3, 0x10352 <.Lpcrel_hi8+0x40>
   10362: 0ff77713     	andi	a4, a4, 0xff
   10366: d361         	beqz	a4, 0x10326 <.Lpcrel_hi8+0x14>
   10368: 4509         	li	a0, 0x2
   1036a: 04a71463     	bne	a4, a0, 0x103b2 <.Lpcrel_hi9>
   1036e: 60a2         	ld	ra, 0x8(sp)
   10370: 6402         	ld	s0, 0x0(sp)
   10372: 0141         	addi	sp, sp, 0x10
   10374: 8082         	ret
   10376: 55fd         	li	a1, -0x1
   10378: 159a         	slli	a1, a1, 0x26
   1037a: 00053023     	sd	zero, 0x0(a0)
   1037e: e50c         	sd	a1, 0x8(a0)
   10380: 4589         	li	a1, 0x2
   10382: 0310000f     	fence	rw, w
   10386: 00b50823     	sb	a1, 0x10(a0)
   1038a: 60a2         	ld	ra, 0x8(sp)
   1038c: 6402         	ld	s0, 0x0(sp)
   1038e: 0141         	addi	sp, sp, 0x10
   10390: 8082         	ret
   10392: 4509         	li	a0, 0x2
   10394: fca70de3     	beq	a4, a0, 0x1036e <.Lpcrel_hi8+0x5c>

0000000000010398 <.Lpcrel_hi11>:
   10398: 00004517     	auipc	a0, 0x4

000000000001039c <.Lpcrel_hi12>:
   1039c: 00004597     	auipc	a1, 0x4
   103a0: ca050513     	addi	a0, a0, -0x360
   103a4: d0c58613     	addi	a2, a1, -0x2f4
   103a8: 45b5         	li	a1, 0xd
   103aa: 00002097     	auipc	ra, 0x2
   103ae: 8ae080e7     	jalr	-0x752(ra) <_ZN4core9panicking5panic17h8d5ae4408e8894d1E>

00000000000103b2 <.Lpcrel_hi9>:
   103b2: 00004517     	auipc	a0, 0x4

00000000000103b6 <.Lpcrel_hi10>:
   103b6: 00004597     	auipc	a1, 0x4
   103ba: d0e50513     	addi	a0, a0, -0x2f2
   103be: d3258613     	addi	a2, a1, -0x2ce
   103c2: 02600593     	li	a1, 0x26
   103c6: 00002097     	auipc	ra, 0x2
   103ca: 892080e7     	jalr	-0x76e(ra) <_ZN4core9panicking5panic17h8d5ae4408e8894d1E>

00000000000103ce <_ZN8user_lib10task_sched4vdso13user_schedule17h5677c1e9b839c140E>:
   103ce: 7171         	addi	sp, sp, -0xb0
   103d0: f506         	sd	ra, 0xa8(sp)
   103d2: f122         	sd	s0, 0xa0(sp)
   103d4: ed26         	sd	s1, 0x98(sp)
   103d6: e94a         	sd	s2, 0x90(sp)
   103d8: e54e         	sd	s3, 0x88(sp)
   103da: e152         	sd	s4, 0x80(sp)
   103dc: fcd6         	sd	s5, 0x78(sp)
   103de: f8da         	sd	s6, 0x70(sp)
   103e0: f4de         	sd	s7, 0x68(sp)
   103e2: 1900         	addi	s0, sp, 0xb0

00000000000103e4 <.Lpcrel_hi17>:
   103e4: 00005517     	auipc	a0, 0x5
   103e8: c2450493     	addi	s1, a0, -0x3dc
   103ec: 01048503     	lb	a0, 0x10(s1)
   103f0: 4589         	li	a1, 0x2
   103f2: 0230000f     	fence	r, rw
   103f6: 2cb51363     	bne	a0, a1, 0x106bc <.Lpcrel_hi31+0x13c>
   103fa: ffc4f593     	andi	a1, s1, -0x4
   103fe: 4505         	li	a0, 0x1
   10400: 44a5a62f     	amoor.w.aq	a2, a0, (a1)
   10404: 0ff67613     	andi	a2, a2, 0xff
   10408: e601         	bnez	a2, 0x10410 <.Lpcrel_hi17+0x2c>
   1040a: a039         	j	0x10418 <.Lpcrel_hi17+0x34>
   1040c: 0100000f     	fence	w, 0
   10410: 00048603     	lb	a2, 0x0(s1)
   10414: fe65         	bnez	a2, 0x1040c <.Lpcrel_hi17+0x28>
   10416: b7ed         	j	0x10400 <.Lpcrel_hi17+0x1c>
   10418: 648c         	ld	a1, 0x8(s1)
   1041a: 7ff58593     	addi	a1, a1, 0x7ff
   1041e: 02a584a3     	sb	a0, 0x29(a1)
   10422: 0195b503     	ld	a0, 0x19(a1)
   10426: 2c050e63     	beqz	a0, 0x10702 <.Lpcrel_hi18>
   1042a: 4605         	li	a2, 0x1
   1042c: 00c5352f     	amoadd.d	a0, a2, (a0)
   10430: 30054363     	bltz	a0, 0x10736 <.Lpcrel_hi19+0x14>
   10434: 0195ba83     	ld	s5, 0x19(a1)
   10438: 0215b503     	ld	a0, 0x21(a1)
   1043c: 0084b903     	ld	s2, 0x8(s1)
   10440: f5543c23     	sd	s5, -0xa8(s0)
   10444: f6a43023     	sd	a0, -0xa0(s0)
   10448: 7ff90693     	addi	a3, s2, 0x7ff
   1044c: 0116b503     	ld	a0, 0x11(a3)
   10450: 1e050d63     	beqz	a0, 0x1064a <.Lpcrel_hi31+0xca>
   10454: 00093583     	ld	a1, 0x0(s2)
   10458: 6988         	ld	a0, 0x10(a1)
   1045a: 010ab603     	ld	a2, 0x10(s5)
   1045e: 20c51963     	bne	a0, a2, 0x10670 <.Lpcrel_hi31+0xf0>
   10462: 6d88         	ld	a0, 0x18(a1)
   10464: 018ab603     	ld	a2, 0x18(s5)
   10468: 24c50f63     	beq	a0, a2, 0x106c6 <.Lpcrel_hi20>
   1046c: 854a         	mv	a0, s2
   1046e: 00000097     	auipc	ra, 0x0
   10472: 70e080e7     	jalr	0x70e(ra) <_ZN8user_lib10task_sched7manager11TaskManager5fetch17h987f5f973d4cd6e2E>
   10476: 2c050163     	beqz	a0, 0x10738 <.Lpcrel_hi22>
   1047a: 8a2a         	mv	s4, a0
   1047c: 89ae         	mv	s3, a1

000000000001047e <.Lpcrel_hi23>:
   1047e: 00004597     	auipc	a1, 0x4
   10482: 4685         	li	a3, 0x1
   10484: 4505         	li	a0, 0x1
   10486: 4665         	li	a2, 0x19
   10488: 04000893     	li	a7, 0x40
   1048c: 04258593     	addi	a1, a1, 0x42
   10490: 028a8713     	addi	a4, s5, 0x28
   10494: 00000073     	ecall
   10498: f6840513     	addi	a0, s0, -0x98
   1049c: 00d735af     	amoadd.d	a1, a3, (a4)

00000000000104a0 <.Lpcrel_hi24>:
   104a0: 00003617     	auipc	a2, 0x3

00000000000104a4 <.Lpcrel_hi25>:
   104a4: 00004717     	auipc	a4, 0x4
   104a8: 4789         	li	a5, 0x2
   104aa: f6b43423     	sd	a1, -0x98(s0)
   104ae: fa040593     	addi	a1, s0, -0x60
   104b2: fc860b93     	addi	s7, a2, -0x38
   104b6: 04470b13     	addi	s6, a4, 0x44
   104ba: faa43023     	sd	a0, -0x60(s0)
   104be: fb743423     	sd	s7, -0x58(s0)
   104c2: f8043823     	sd	zero, -0x70(s0)
   104c6: f7643823     	sd	s6, -0x90(s0)
   104ca: f6f43c23     	sd	a5, -0x88(s0)
   104ce: f8b43023     	sd	a1, -0x80(s0)
   104d2: f8d43423     	sd	a3, -0x78(s0)

00000000000104d6 <.Lpcrel_hi26>:
   104d6: 00004597     	auipc	a1, 0x4
   104da: fb740513     	addi	a0, s0, -0x49
   104de: f4258593     	addi	a1, a1, -0xbe
   104e2: f7040613     	addi	a2, s0, -0x90
   104e6: 00002097     	auipc	ra, 0x2
   104ea: e0a080e7     	jalr	-0x1f6(ra) <_ZN4core3fmt5write17h7ce9e976de62bebaE>
   104ee: c51d         	beqz	a0, 0x1051c <.Lpcrel_hi29+0x24>

00000000000104f0 <.Lpcrel_hi27>:
   104f0: 00004517     	auipc	a0, 0x4

00000000000104f4 <.Lpcrel_hi28>:
   104f4: 00004617     	auipc	a2, 0x4

00000000000104f8 <.Lpcrel_hi29>:
   104f8: 00004717     	auipc	a4, 0x4
   104fc: 02b00593     	li	a1, 0x2b
   10500: f7850513     	addi	a0, a0, -0x88
   10504: f5460693     	addi	a3, a2, -0xac
   10508: fb070713     	addi	a4, a4, -0x50
   1050c: fb740613     	addi	a2, s0, -0x49
   10510: 00002097     	auipc	ra, 0x2
   10514: 914080e7     	jalr	-0x6ec(ra) <_ZN4core6result13unwrap_failed17hce77d3a84c0ed806E>
   10518: 0100000f     	fence	w, 0
   1051c: 020ab503     	ld	a0, 0x20(s5)
   10520: 0230000f     	fence	r, rw
   10524: f6843583     	ld	a1, -0x98(s0)
   10528: feb518e3     	bne	a0, a1, 0x10518 <.Lpcrel_hi29+0x20>
   1052c: 0c0a8023     	sb	zero, 0xc0(s5)
   10530: 020a8593     	addi	a1, s5, 0x20
   10534: 4685         	li	a3, 0x1

0000000000010536 <.Lpcrel_hi30>:
   10536: 00004717     	auipc	a4, 0x4
   1053a: 4505         	li	a0, 0x1
   1053c: 4665         	li	a2, 0x19
   1053e: 02d5b02f     	amoadd.d.rl	zero, a3, (a1)
   10542: f8a70593     	addi	a1, a4, -0x76
   10546: 04000893     	li	a7, 0x40
   1054a: 00000073     	ecall
   1054e: 028a0513     	addi	a0, s4, 0x28
   10552: f6840593     	addi	a1, s0, -0x98
   10556: 4609         	li	a2, 0x2
   10558: fa040713     	addi	a4, s0, -0x60
   1055c: 00d5352f     	amoadd.d	a0, a3, (a0)
   10560: fab43023     	sd	a1, -0x60(s0)
   10564: fb743423     	sd	s7, -0x58(s0)
   10568: f8043823     	sd	zero, -0x70(s0)
   1056c: f6a43423     	sd	a0, -0x98(s0)
   10570: f7643823     	sd	s6, -0x90(s0)
   10574: f6c43c23     	sd	a2, -0x88(s0)
   10578: f8e43023     	sd	a4, -0x80(s0)
   1057c: f8d43423     	sd	a3, -0x78(s0)

0000000000010580 <.Lpcrel_hi31>:
   10580: 00004597     	auipc	a1, 0x4
   10584: fb740513     	addi	a0, s0, -0x49
   10588: e9858593     	addi	a1, a1, -0x168
   1058c: f7040613     	addi	a2, s0, -0x90
   10590: 00002097     	auipc	ra, 0x2
   10594: d60080e7     	jalr	-0x2a0(ra) <_ZN4core3fmt5write17h7ce9e976de62bebaE>
   10598: 1a051863     	bnez	a0, 0x10748 <.Lpcrel_hi32>
   1059c: 020a3503     	ld	a0, 0x20(s4)
   105a0: 0230000f     	fence	r, rw
   105a4: f6843583     	ld	a1, -0x98(s0)
   105a8: 00b50c63     	beq	a0, a1, 0x105c0 <.Lpcrel_hi31+0x40>
   105ac: 0100000f     	fence	w, 0
   105b0: 020a3503     	ld	a0, 0x20(s4)
   105b4: 0230000f     	fence	r, rw
   105b8: f6843583     	ld	a1, -0x98(s0)
   105bc: feb518e3     	bne	a0, a1, 0x105ac <.Lpcrel_hi31+0x2c>
   105c0: 4a85         	li	s5, 0x1
   105c2: 020a0513     	addi	a0, s4, 0x20
   105c6: 0d5a0023     	sb	s5, 0xc0(s4)
   105ca: 0355302f     	amoadd.d.rl	zero, s5, (a0)
   105ce: f5843583     	ld	a1, -0xa8(s0)
   105d2: f6043603     	ld	a2, -0xa0(s0)
   105d6: 0185bb03     	ld	s6, 0x18(a1)
   105da: 018a3b83     	ld	s7, 0x18(s4)
   105de: 854a         	mv	a0, s2
   105e0: 00000097     	auipc	ra, 0x0
   105e4: 47c080e7     	jalr	0x47c(ra) <_ZN8user_lib10task_sched7manager11TaskManager3add17hb47692f9e35976dbE>
   105e8: 6488         	ld	a0, 0x8(s1)
   105ea: 0bb2         	slli	s7, s7, 0xc
   105ec: 76f9         	lui	a3, 0xffffe
   105ee: 0b32         	slli	s6, s6, 0xc
   105f0: 7ff50713     	addi	a4, a0, 0x7ff
   105f4: 01973603     	ld	a2, 0x19(a4)
   105f8: 02173783     	ld	a5, 0x21(a4)
   105fc: 417685b3     	sub	a1, a3, s7
   10600: 41668533     	sub	a0, a3, s6
   10604: f6c43823     	sd	a2, -0x90(s0)
   10608: f6f43c23     	sd	a5, -0x88(s0)
   1060c: 01473ca3     	sd	s4, 0x19(a4)
   10610: 033730a3     	sd	s3, 0x21(a4)
   10614: c215         	beqz	a2, 0x10638 <.Lpcrel_hi31+0xb8>
   10616: 56fd         	li	a3, -0x1
   10618: 02d6362f     	amoadd.d.rl	a2, a3, (a2)
   1061c: 01561e63     	bne	a2, s5, 0x10638 <.Lpcrel_hi31+0xb8>
   10620: 0230000f     	fence	r, rw
   10624: 892a         	mv	s2, a0
   10626: f7040513     	addi	a0, s0, -0x90
   1062a: 89ae         	mv	s3, a1
   1062c: 00000097     	auipc	ra, 0x0
   10630: 144080e7     	jalr	0x144(ra) <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E>
   10634: 854a         	mv	a0, s2
   10636: 85ce         	mv	a1, s3
   10638: 0310000f     	fence	rw, w
   1063c: 00048023     	sb	zero, 0x0(s1)
   10640: 00000097     	auipc	ra, 0x0
   10644: b6e080e7     	jalr	-0x492(ra) <__switch_user>
   10648: a8b9         	j	0x106a6 <.Lpcrel_hi31+0x126>
   1064a: 557d         	li	a0, -0x1
   1064c: 02aab52f     	amoadd.d.rl	a0, a0, (s5)
   10650: 4585         	li	a1, 0x1
   10652: 00b51a63     	bne	a0, a1, 0x10666 <.Lpcrel_hi31+0xe6>
   10656: 0230000f     	fence	r, rw
   1065a: f5840513     	addi	a0, s0, -0xa8
   1065e: 00000097     	auipc	ra, 0x0
   10662: 112080e7     	jalr	0x112(ra) <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E>
   10666: 0310000f     	fence	rw, w
   1066a: 00048023     	sb	zero, 0x0(s1)
   1066e: a825         	j	0x106a6 <.Lpcrel_hi31+0x126>
   10670: 4501         	li	a0, 0x0
   10672: 4581         	li	a1, 0x0
   10674: 4601         	li	a2, 0x0
   10676: 020684a3     	sb	zero, 0x29(a3)
   1067a: 0310000f     	fence	rw, w
   1067e: 00048023     	sb	zero, 0x0(s1)
   10682: 07c00893     	li	a7, 0x7c
   10686: 00000073     	ecall
   1068a: 557d         	li	a0, -0x1
   1068c: 02aab52f     	amoadd.d.rl	a0, a0, (s5)
   10690: 4585         	li	a1, 0x1
   10692: 00b51a63     	bne	a0, a1, 0x106a6 <.Lpcrel_hi31+0x126>
   10696: 0230000f     	fence	r, rw
   1069a: f5840513     	addi	a0, s0, -0xa8
   1069e: 00000097     	auipc	ra, 0x0
   106a2: 0d2080e7     	jalr	0xd2(ra) <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E>
   106a6: 70aa         	ld	ra, 0xa8(sp)
   106a8: 740a         	ld	s0, 0xa0(sp)
   106aa: 64ea         	ld	s1, 0x98(sp)
   106ac: 694a         	ld	s2, 0x90(sp)
   106ae: 69aa         	ld	s3, 0x88(sp)
   106b0: 6a0a         	ld	s4, 0x80(sp)
   106b2: 7ae6         	ld	s5, 0x78(sp)
   106b4: 7b46         	ld	s6, 0x70(sp)
   106b6: 7ba6         	ld	s7, 0x68(sp)
   106b8: 614d         	addi	sp, sp, 0xb0
   106ba: 8082         	ret
   106bc: 00000097     	auipc	ra, 0x0
   106c0: c4e080e7     	jalr	-0x3b2(ra) <_ZN4spin4once17Once$LT$T$C$R$GT$18try_call_once_slow17h76607cb82faf7e81E>
   106c4: bb1d         	j	0x103fa <.Lpcrel_hi17+0x16>

00000000000106c6 <.Lpcrel_hi20>:
   106c6: 00004517     	auipc	a0, 0x4
   106ca: 4605         	li	a2, 0x1
   106cc: 46a1         	li	a3, 0x8
   106ce: f8043823     	sd	zero, -0x70(s0)
   106d2: 05e1         	addi	a1, a1, 0x18
   106d4: a6250513     	addi	a0, a0, -0x59e
   106d8: f6a43823     	sd	a0, -0x90(s0)
   106dc: f6c43c23     	sd	a2, -0x88(s0)
   106e0: f8d43023     	sd	a3, -0x80(s0)
   106e4: f8043423     	sd	zero, -0x78(s0)
   106e8: 018a8613     	addi	a2, s5, 0x18

00000000000106ec <.Lpcrel_hi21>:
   106ec: 00004697     	auipc	a3, 0x4
   106f0: 4505         	li	a0, 0x1
   106f2: aac68713     	addi	a4, a3, -0x554
   106f6: f7040693     	addi	a3, s0, -0x90
   106fa: 00001097     	auipc	ra, 0x1
   106fe: 5f2080e7     	jalr	0x5f2(ra) <_ZN4core9panicking13assert_failed17hfb22785cb78c4079E>

0000000000010702 <.Lpcrel_hi18>:
   10702: 00004517     	auipc	a0, 0x4
   10706: 4585         	li	a1, 0x1
   10708: f8043823     	sd	zero, -0x70(s0)
   1070c: 4621         	li	a2, 0x8
   1070e: a5650513     	addi	a0, a0, -0x5aa
   10712: f6a43823     	sd	a0, -0x90(s0)
   10716: f6b43c23     	sd	a1, -0x88(s0)
   1071a: f8c43023     	sd	a2, -0x80(s0)
   1071e: f8043423     	sd	zero, -0x78(s0)

0000000000010722 <.Lpcrel_hi19>:
   10722: 00004517     	auipc	a0, 0x4
   10726: a8e50593     	addi	a1, a0, -0x572
   1072a: f7040513     	addi	a0, s0, -0x90
   1072e: 00001097     	auipc	ra, 0x1
   10732: 508080e7     	jalr	0x508(ra) <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>
   10736: 0000         	unimp

0000000000010738 <.Lpcrel_hi22>:
   10738: 00004517     	auipc	a0, 0x4
   1073c: a4850513     	addi	a0, a0, -0x5b8
   10740: 00001097     	auipc	ra, 0x1
   10744: 484080e7     	jalr	0x484(ra) <_ZN4core6option13unwrap_failed17h521714a0f82b5c0dE>

0000000000010748 <.Lpcrel_hi32>:
   10748: 00004517     	auipc	a0, 0x4

000000000001074c <.Lpcrel_hi33>:
   1074c: 00004617     	auipc	a2, 0x4

0000000000010750 <.Lpcrel_hi34>:
   10750: 00004717     	auipc	a4, 0x4
   10754: 02b00593     	li	a1, 0x2b
   10758: d2050513     	addi	a0, a0, -0x2e0
   1075c: cfc60693     	addi	a3, a2, -0x304
   10760: d5870713     	addi	a4, a4, -0x2a8
   10764: fb740613     	addi	a2, s0, -0x49
   10768: 00001097     	auipc	ra, 0x1
   1076c: 6bc080e7     	jalr	0x6bc(ra) <_ZN4core6result13unwrap_failed17hce77d3a84c0ed806E>

0000000000010770 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E>:
   10770: 610c         	ld	a1, 0x0(a0)
   10772: 567d         	li	a2, -0x1
   10774: 06c58363     	beq	a1, a2, 0x107da <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E+0x6a>
   10778: 00858693     	addi	a3, a1, 0x8
   1077c: 02c6b6af     	amoadd.d.rl	a3, a2, (a3)
   10780: 4605         	li	a2, 0x1
   10782: 04c69c63     	bne	a3, a2, 0x107da <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E+0x6a>
   10786: 1101         	addi	sp, sp, -0x20
   10788: ec06         	sd	ra, 0x18(sp)
   1078a: e822         	sd	s0, 0x10(sp)
   1078c: e426         	sd	s1, 0x8(sp)
   1078e: e04a         	sd	s2, 0x0(sp)
   10790: 1000         	addi	s0, sp, 0x20
   10792: 0230000f     	fence	r, rw
   10796: 6504         	ld	s1, 0x8(a0)
   10798: 00c4b92f     	amoadd.d	s2, a2, (s1)
   1079c: 6488         	ld	a0, 0x8(s1)
   1079e: 0230000f     	fence	r, rw
   107a2: 01250963     	beq	a0, s2, 0x107b4 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E+0x44>
   107a6: 0100000f     	fence	w, 0
   107aa: 6488         	ld	a0, 0x8(s1)
   107ac: 0230000f     	fence	r, rw
   107b0: ff251be3     	bne	a0, s2, 0x107a6 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E+0x36>
   107b4: 01048513     	addi	a0, s1, 0x10
   107b8: 4621         	li	a2, 0x8
   107ba: 0c800693     	li	a3, 0xc8
   107be: 00001097     	auipc	ra, 0x1
   107c2: 0c6080e7     	jalr	0xc6(ra) <_ZN22buddy_system_allocator4Heap7dealloc17h804bc78107026547E>
   107c6: 0905         	addi	s2, s2, 0x1
   107c8: 0310000f     	fence	rw, w
   107cc: 0124b423     	sd	s2, 0x8(s1)
   107d0: 60e2         	ld	ra, 0x18(sp)
   107d2: 6442         	ld	s0, 0x10(sp)
   107d4: 64a2         	ld	s1, 0x8(sp)
   107d6: 6902         	ld	s2, 0x0(sp)
   107d8: 6105         	addi	sp, sp, 0x20
   107da: 8082         	ret

00000000000107dc <_ZN5alloc7raw_vec11finish_grow17h003a2cb2db90aaf1E>:
   107dc: 7139         	addi	sp, sp, -0x40
   107de: fc06         	sd	ra, 0x38(sp)
   107e0: f822         	sd	s0, 0x30(sp)
   107e2: f426         	sd	s1, 0x28(sp)
   107e4: f04a         	sd	s2, 0x20(sp)
   107e6: ec4e         	sd	s3, 0x18(sp)
   107e8: e852         	sd	s4, 0x10(sp)
   107ea: e456         	sd	s5, 0x8(sp)
   107ec: 0080         	addi	s0, sp, 0x40
   107ee: 892e         	mv	s2, a1
   107f0: 660c         	ld	a1, 0x8(a2)
   107f2: 84aa         	mv	s1, a0
   107f4: c9b1         	beqz	a1, 0x10848 <.Lpcrel_hi16+0x22>
   107f6: 01063983     	ld	s3, 0x10(a2)
   107fa: 06098263     	beqz	s3, 0x1085e <.Lpcrel_hi18+0xa>
   107fe: 00063a03     	ld	s4, 0x0(a2)

0000000000010802 <.Lpcrel_hi15>:
   10802: 0000d517     	auipc	a0, 0xd
   10806: 81e50513     	addi	a0, a0, -0x7e2
   1080a: 45a1         	li	a1, 0x8
   1080c: 864a         	mv	a2, s2
   1080e: 00001097     	auipc	ra, 0x1
   10812: 21a080e7     	jalr	0x21a(ra) <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17ha0e0f697851c23bcE>
   10816: c92d         	beqz	a0, 0x10888 <.Lpcrel_hi14+0x1e>
   10818: 8aaa         	mv	s5, a0
   1081a: 85d2         	mv	a1, s4
   1081c: 864e         	mv	a2, s3
   1081e: 00003097     	auipc	ra, 0x3
   10822: eb2080e7     	jalr	-0x14e(ra) <memcpy>

0000000000010826 <.Lpcrel_hi16>:
   10826: 0000c517     	auipc	a0, 0xc
   1082a: 7fa50513     	addi	a0, a0, 0x7fa
   1082e: 4621         	li	a2, 0x8
   10830: 85d2         	mv	a1, s4
   10832: 86ce         	mv	a3, s3
   10834: 00001097     	auipc	ra, 0x1
   10838: 242080e7     	jalr	0x242(ra) <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$7dealloc17h724503898ea03b8eE>
   1083c: 8556         	mv	a0, s5
   1083e: 001ab593     	seqz	a1, s5
   10842: 040a8663     	beqz	s5, 0x1088e <.Lpcrel_hi14+0x24>
   10846: a0a9         	j	0x10890 <.Lpcrel_hi14+0x26>
   10848: 02090f63     	beqz	s2, 0x10886 <.Lpcrel_hi14+0x1c>

000000000001084c <.Lpcrel_hi17>:
   1084c: 00004517     	auipc	a0, 0x4
   10850: 7b454003     	lbu	zero, 0x7b4(a0)

0000000000010854 <.Lpcrel_hi18>:
   10854: 0000c517     	auipc	a0, 0xc
   10858: 7cc50513     	addi	a0, a0, 0x7cc
   1085c: a819         	j	0x10872 <.Lpcrel_hi14+0x8>
   1085e: 04090663     	beqz	s2, 0x108aa <.Lpcrel_hi14+0x40>

0000000000010862 <.Lpcrel_hi13>:
   10862: 00004517     	auipc	a0, 0x4
   10866: 79e54003     	lbu	zero, 0x79e(a0)

000000000001086a <.Lpcrel_hi14>:
   1086a: 0000c517     	auipc	a0, 0xc
   1086e: 7b650513     	addi	a0, a0, 0x7b6
   10872: 45a1         	li	a1, 0x8
   10874: 864a         	mv	a2, s2
   10876: 00001097     	auipc	ra, 0x1
   1087a: 1b2080e7     	jalr	0x1b2(ra) <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17ha0e0f697851c23bcE>
   1087e: 00153593     	seqz	a1, a0
   10882: c511         	beqz	a0, 0x1088e <.Lpcrel_hi14+0x24>
   10884: a031         	j	0x10890 <.Lpcrel_hi14+0x26>
   10886: 4521         	li	a0, 0x8
   10888: 00153593     	seqz	a1, a0
   1088c: e111         	bnez	a0, 0x10890 <.Lpcrel_hi14+0x26>
   1088e: 4521         	li	a0, 0x8
   10890: e08c         	sd	a1, 0x0(s1)
   10892: e488         	sd	a0, 0x8(s1)
   10894: 0124b823     	sd	s2, 0x10(s1)
   10898: 70e2         	ld	ra, 0x38(sp)
   1089a: 7442         	ld	s0, 0x30(sp)
   1089c: 74a2         	ld	s1, 0x28(sp)
   1089e: 7902         	ld	s2, 0x20(sp)
   108a0: 69e2         	ld	s3, 0x18(sp)
   108a2: 6a42         	ld	s4, 0x10(sp)
   108a4: 6aa2         	ld	s5, 0x8(sp)
   108a6: 6121         	addi	sp, sp, 0x40
   108a8: 8082         	ret
   108aa: 4521         	li	a0, 0x8
   108ac: 00153593     	seqz	a1, a0
   108b0: dd79         	beqz	a0, 0x1088e <.Lpcrel_hi14+0x24>
   108b2: bff9         	j	0x10890 <.Lpcrel_hi14+0x26>

00000000000108b4 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hda445081f7d4a6e0E>:
   108b4: 711d         	addi	sp, sp, -0x60
   108b6: ec86         	sd	ra, 0x58(sp)
   108b8: e8a2         	sd	s0, 0x50(sp)
   108ba: e4a6         	sd	s1, 0x48(sp)
   108bc: e0ca         	sd	s2, 0x40(sp)
   108be: fc4e         	sd	s3, 0x38(sp)
   108c0: 1080         	addi	s0, sp, 0x60
   108c2: 89aa         	mv	s3, a0
   108c4: 6114         	ld	a3, 0x0(a0)
   108c6: 00169493     	slli	s1, a3, 0x1
   108ca: 4511         	li	a0, 0x4
   108cc: 892e         	mv	s2, a1
   108ce: 00956363     	bltu	a0, s1, 0x108d4 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hda445081f7d4a6e0E+0x20>
   108d2: 4491         	li	s1, 0x4
   108d4: 03b6d593     	srli	a1, a3, 0x3b
   108d8: 4501         	li	a0, 0x0
   108da: eda9         	bnez	a1, 0x10934 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hda445081f7d4a6e0E+0x80>
   108dc: 00449593     	slli	a1, s1, 0x4
   108e0: 5645         	li	a2, -0xf
   108e2: 00165713     	srli	a4, a2, 0x1
   108e6: 04b76763     	bltu	a4, a1, 0x10934 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hda445081f7d4a6e0E+0x80>
   108ea: e299         	bnez	a3, 0x108f0 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hda445081f7d4a6e0E+0x3c>
   108ec: 4501         	li	a0, 0x0
   108ee: a809         	j	0x10900 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hda445081f7d4a6e0E+0x4c>
   108f0: 0089b503     	ld	a0, 0x8(s3)
   108f4: 0692         	slli	a3, a3, 0x4
   108f6: fca43023     	sd	a0, -0x40(s0)
   108fa: fcd43823     	sd	a3, -0x30(s0)
   108fe: 4521         	li	a0, 0x8
   10900: fca43423     	sd	a0, -0x38(s0)
   10904: fa840513     	addi	a0, s0, -0x58
   10908: fc040613     	addi	a2, s0, -0x40
   1090c: 00000097     	auipc	ra, 0x0
   10910: ed0080e7     	jalr	-0x130(ra) <_ZN5alloc7raw_vec11finish_grow17h003a2cb2db90aaf1E>
   10914: fa843503     	ld	a0, -0x58(s0)
   10918: e505         	bnez	a0, 0x10940 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hda445081f7d4a6e0E+0x8c>
   1091a: fb043503     	ld	a0, -0x50(s0)
   1091e: 0099b023     	sd	s1, 0x0(s3)
   10922: 00a9b423     	sd	a0, 0x8(s3)
   10926: 60e6         	ld	ra, 0x58(sp)
   10928: 6446         	ld	s0, 0x50(sp)
   1092a: 64a6         	ld	s1, 0x48(sp)
   1092c: 6906         	ld	s2, 0x40(sp)
   1092e: 79e2         	ld	s3, 0x38(sp)
   10930: 6125         	addi	sp, sp, 0x60
   10932: 8082         	ret
   10934: 85b2         	mv	a1, a2
   10936: 864a         	mv	a2, s2
   10938: 00001097     	auipc	ra, 0x1
   1093c: 1c2080e7     	jalr	0x1c2(ra) <_ZN5alloc7raw_vec12handle_error17h4c159b224947bec3E>
   10940: fb043503     	ld	a0, -0x50(s0)
   10944: fb843583     	ld	a1, -0x48(s0)
   10948: 864a         	mv	a2, s2
   1094a: 00001097     	auipc	ra, 0x1
   1094e: 1b0080e7     	jalr	0x1b0(ra) <_ZN5alloc7raw_vec12handle_error17h4c159b224947bec3E>

0000000000010952 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5cfbbcbbaf81b5c4E>:
   10952: 6110         	ld	a2, 0x0(a0)
   10954: 00064683     	lbu	a3, 0x0(a2)
   10958: 852e         	mv	a0, a1
   1095a: ca9d         	beqz	a3, 0x10990 <.Lpcrel_hi0>
   1095c: 1101         	addi	sp, sp, -0x20
   1095e: ec06         	sd	ra, 0x18(sp)
   10960: e822         	sd	s0, 0x10(sp)
   10962: 1000         	addi	s0, sp, 0x20
   10964: 0605         	addi	a2, a2, 0x1
   10966: fec43423     	sd	a2, -0x18(s0)

000000000001096a <.Lpcrel_hi1>:
   1096a: 00004597     	auipc	a1, 0x4

000000000001096e <.Lpcrel_hi2>:
   1096e: 00004697     	auipc	a3, 0x4
   10972: 4611         	li	a2, 0x4
   10974: 85e58593     	addi	a1, a1, -0x7a2
   10978: 86a68713     	addi	a4, a3, -0x796
   1097c: fe840693     	addi	a3, s0, -0x18
   10980: 00002097     	auipc	ra, 0x2
   10984: 044080e7     	jalr	0x44(ra) <_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hc5eacf3f24554cf9E>
   10988: 60e2         	ld	ra, 0x18(sp)
   1098a: 6442         	ld	s0, 0x10(sp)
   1098c: 6105         	addi	sp, sp, 0x20
   1098e: 8082         	ret

0000000000010990 <.Lpcrel_hi0>:
   10990: 00004597     	auipc	a1, 0x4
   10994: 83c58593     	addi	a1, a1, -0x7c4
   10998: 4611         	li	a2, 0x4
   1099a: 00002317     	auipc	t1, 0x2
   1099e: f4830067     	jr	-0xb8(t1) <_ZN57_$LT$core..fmt..Formatter$u20$as$u20$core..fmt..Write$GT$9write_str17h8de15734ef83d9feE>

00000000000109a2 <_ZN8user_lib7syscall8sys_exit17h522b4db6f4eeaa6eE.llvm.3900917005521907075>:
   109a2: 7139         	addi	sp, sp, -0x40
   109a4: fc06         	sd	ra, 0x38(sp)
   109a6: f822         	sd	s0, 0x30(sp)
   109a8: 0080         	addi	s0, sp, 0x40
   109aa: 4581         	li	a1, 0x0
   109ac: 4601         	li	a2, 0x0
   109ae: 05d00893     	li	a7, 0x5d
   109b2: 00000073     	ecall

00000000000109b6 <.Lpcrel_hi3>:
   109b6: 00004517     	auipc	a0, 0x4
   109ba: 4585         	li	a1, 0x1
   109bc: 4621         	li	a2, 0x8
   109be: 85a50513     	addi	a0, a0, -0x7a6
   109c2: fe043023     	sd	zero, -0x20(s0)
   109c6: fca43023     	sd	a0, -0x40(s0)
   109ca: fcb43423     	sd	a1, -0x38(s0)
   109ce: fcc43823     	sd	a2, -0x30(s0)
   109d2: fc043c23     	sd	zero, -0x28(s0)

00000000000109d6 <.Lpcrel_hi4>:
   109d6: 00004517     	auipc	a0, 0x4
   109da: 85a50593     	addi	a1, a0, -0x7a6
   109de: fc040513     	addi	a0, s0, -0x40
   109e2: 00001097     	auipc	ra, 0x1
   109e6: 254080e7     	jalr	0x254(ra) <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>

00000000000109ea <_ZN8user_lib4task4exit17h577e6242661a5447E>:
   109ea: 1141         	addi	sp, sp, -0x10
   109ec: e406         	sd	ra, 0x8(sp)
   109ee: e022         	sd	s0, 0x0(sp)
   109f0: 0800         	addi	s0, sp, 0x10
   109f2: 00000097     	auipc	ra, 0x0
   109f6: fb0080e7     	jalr	-0x50(ra) <_ZN8user_lib7syscall8sys_exit17h522b4db6f4eeaa6eE.llvm.3900917005521907075>

00000000000109fa <_ZN8user_lib4task6yield_17h1883d5d9b4cfe256E>:
   109fa: 1141         	addi	sp, sp, -0x10
   109fc: e406         	sd	ra, 0x8(sp)
   109fe: e022         	sd	s0, 0x0(sp)
   10a00: 0800         	addi	s0, sp, 0x10
   10a02: 00000097     	auipc	ra, 0x0
   10a06: 9cc080e7     	jalr	-0x634(ra) <_ZN8user_lib10task_sched4vdso13user_schedule17h5677c1e9b839c140E>
   10a0a: 4501         	li	a0, 0x0
   10a0c: 60a2         	ld	ra, 0x8(sp)
   10a0e: 6402         	ld	s0, 0x0(sp)
   10a10: 0141         	addi	sp, sp, 0x10
   10a12: 8082         	ret

0000000000010a14 <_ZN8user_lib4task4wait17hf23c39620adf1b7bE>:
   10a14: 1101         	addi	sp, sp, -0x20
   10a16: ec06         	sd	ra, 0x18(sp)
   10a18: e822         	sd	s0, 0x10(sp)
   10a1a: e426         	sd	s1, 0x8(sp)
   10a1c: e04a         	sd	s2, 0x0(sp)
   10a1e: 1000         	addi	s0, sp, 0x20
   10a20: 84aa         	mv	s1, a0
   10a22: 557d         	li	a0, -0x1
   10a24: 10400893     	li	a7, 0x104
   10a28: 5979         	li	s2, -0x2
   10a2a: 85a6         	mv	a1, s1
   10a2c: 4601         	li	a2, 0x0
   10a2e: 00000073     	ecall
   10a32: 01251f63     	bne	a0, s2, 0x10a50 <_ZN8user_lib4task4wait17hf23c39620adf1b7bE+0x3c>
   10a36: 00000097     	auipc	ra, 0x0
   10a3a: 998080e7     	jalr	-0x668(ra) <_ZN8user_lib10task_sched4vdso13user_schedule17h5677c1e9b839c140E>
   10a3e: 557d         	li	a0, -0x1
   10a40: 10400893     	li	a7, 0x104
   10a44: 85a6         	mv	a1, s1
   10a46: 4601         	li	a2, 0x0
   10a48: 00000073     	ecall
   10a4c: ff2505e3     	beq	a0, s2, 0x10a36 <_ZN8user_lib4task4wait17hf23c39620adf1b7bE+0x22>
   10a50: 60e2         	ld	ra, 0x18(sp)
   10a52: 6442         	ld	s0, 0x10(sp)
   10a54: 64a2         	ld	s1, 0x8(sp)
   10a56: 6902         	ld	s2, 0x0(sp)
   10a58: 6105         	addi	sp, sp, 0x20
   10a5a: 8082         	ret

0000000000010a5c <_ZN8user_lib10task_sched7manager11TaskManager3add17hb47692f9e35976dbE>:
   10a5c: 7175         	addi	sp, sp, -0x90
   10a5e: e506         	sd	ra, 0x88(sp)
   10a60: e122         	sd	s0, 0x80(sp)
   10a62: fca6         	sd	s1, 0x78(sp)
   10a64: f8ca         	sd	s2, 0x70(sp)
   10a66: f4ce         	sd	s3, 0x68(sp)
   10a68: f0d2         	sd	s4, 0x60(sp)
   10a6a: ecd6         	sd	s5, 0x58(sp)
   10a6c: e8da         	sd	s6, 0x50(sp)
   10a6e: e4de         	sd	s7, 0x48(sp)
   10a70: e0e2         	sd	s8, 0x40(sp)
   10a72: 0900         	addi	s0, sp, 0x90
   10a74: 8932         	mv	s2, a2
   10a76: 8aaa         	mv	s5, a0
   10a78: 7ff50493     	addi	s1, a0, 0x7ff
   10a7c: 0114b503     	ld	a0, 0x11(s1)
   10a80: 08000613     	li	a2, 0x80
   10a84: 0ac57863     	bgeu	a0, a2, 0x10b34 <.Lpcrel_hi1>
   10a88: 89ae         	mv	s3, a1
   10a8a: 0512         	slli	a0, a0, 0x4
   10a8c: 00aa8a33     	add	s4, s5, a0
   10a90: 000a3503     	ld	a0, 0x0(s4)
   10a94: 55fd         	li	a1, -0x1
   10a96: 02b5352f     	amoadd.d.rl	a0, a1, (a0)
   10a9a: 4585         	li	a1, 0x1
   10a9c: 00b51963     	bne	a0, a1, 0x10aae <_ZN8user_lib10task_sched7manager11TaskManager3add17hb47692f9e35976dbE+0x52>
   10aa0: 0230000f     	fence	r, rw
   10aa4: 8552         	mv	a0, s4
   10aa6: 00000097     	auipc	ra, 0x0
   10aaa: cca080e7     	jalr	-0x336(ra) <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E>
   10aae: 013a3023     	sd	s3, 0x0(s4)
   10ab2: 0114b503     	ld	a0, 0x11(s1)
   10ab6: 00150593     	addi	a1, a0, 0x1
   10aba: 012a3423     	sd	s2, 0x8(s4)
   10abe: 00b4b8a3     	sd	a1, 0x11(s1)
   10ac2: cd29         	beqz	a0, 0x10b1c <_ZN8user_lib10task_sched7manager11TaskManager3add17hb47692f9e35976dbE+0xc0>
   10ac4: 08000913     	li	s2, 0x80
   10ac8: 4985         	li	s3, 0x1
   10aca: 4a09         	li	s4, 0x2
   10acc: 09257e63     	bgeu	a0, s2, 0x10b68 <.Lpcrel_hi3>
   10ad0: fff50b13     	addi	s6, a0, -0x1
   10ad4: 0512         	slli	a0, a0, 0x4
   10ad6: 001b5b93     	srli	s7, s6, 0x1
   10ada: 00aa84b3     	add	s1, s5, a0
   10ade: 004b9c13     	slli	s8, s7, 0x4
   10ae2: 9c56         	add	s8, s8, s5
   10ae4: 6088         	ld	a0, 0x0(s1)
   10ae6: 000c3583     	ld	a1, 0x0(s8)
   10aea: 0541         	addi	a0, a0, 0x10
   10aec: 05c1         	addi	a1, a1, 0x10
   10aee: 00000097     	auipc	ra, 0x0
   10af2: 72a080e7     	jalr	0x72a(ra) <_ZN79_$LT$user_lib..task_sched..task..TaskSched$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17ha22d03c67ef1a43fE>
   10af6: 0ff57513     	andi	a0, a0, 0xff
   10afa: 03351163     	bne	a0, s3, 0x10b1c <_ZN8user_lib10task_sched7manager11TaskManager3add17hb47692f9e35976dbE+0xc0>
   10afe: 000c3503     	ld	a0, 0x0(s8)
   10b02: 008c3583     	ld	a1, 0x8(s8)
   10b06: 6090         	ld	a2, 0x0(s1)
   10b08: 6494         	ld	a3, 0x8(s1)
   10b0a: e088         	sd	a0, 0x0(s1)
   10b0c: e48c         	sd	a1, 0x8(s1)
   10b0e: 00cc3023     	sd	a2, 0x0(s8)
   10b12: 00dc3423     	sd	a3, 0x8(s8)
   10b16: 855e         	mv	a0, s7
   10b18: fb4b7ae3     	bgeu	s6, s4, 0x10acc <_ZN8user_lib10task_sched7manager11TaskManager3add17hb47692f9e35976dbE+0x70>
   10b1c: 60aa         	ld	ra, 0x88(sp)
   10b1e: 640a         	ld	s0, 0x80(sp)
   10b20: 74e6         	ld	s1, 0x78(sp)
   10b22: 7946         	ld	s2, 0x70(sp)
   10b24: 79a6         	ld	s3, 0x68(sp)
   10b26: 7a06         	ld	s4, 0x60(sp)
   10b28: 6ae6         	ld	s5, 0x58(sp)
   10b2a: 6b46         	ld	s6, 0x50(sp)
   10b2c: 6ba6         	ld	s7, 0x48(sp)
   10b2e: 6c06         	ld	s8, 0x40(sp)
   10b30: 6149         	addi	sp, sp, 0x90
   10b32: 8082         	ret

0000000000010b34 <.Lpcrel_hi1>:
   10b34: 00003517     	auipc	a0, 0x3
   10b38: 4585         	li	a1, 0x1
   10b3a: f8043823     	sd	zero, -0x70(s0)
   10b3e: 4621         	li	a2, 0x8
   10b40: 74450513     	addi	a0, a0, 0x744
   10b44: f6a43823     	sd	a0, -0x90(s0)
   10b48: f6b43c23     	sd	a1, -0x88(s0)
   10b4c: f8c43023     	sd	a2, -0x80(s0)
   10b50: f8043423     	sd	zero, -0x78(s0)

0000000000010b54 <.Lpcrel_hi2>:
   10b54: 00003517     	auipc	a0, 0x3
   10b58: 76c50593     	addi	a1, a0, 0x76c
   10b5c: f7040513     	addi	a0, s0, -0x90
   10b60: 00001097     	auipc	ra, 0x1
   10b64: 0d6080e7     	jalr	0xd6(ra) <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>

0000000000010b68 <.Lpcrel_hi3>:
   10b68: 00003597     	auipc	a1, 0x3
   10b6c: 74058613     	addi	a2, a1, 0x740
   10b70: 08000593     	li	a1, 0x80
   10b74: 00001097     	auipc	ra, 0x1
   10b78: 11e080e7     	jalr	0x11e(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

0000000000010b7c <_ZN8user_lib10task_sched7manager11TaskManager5fetch17h987f5f973d4cd6e2E>:
   10b7c: 7151         	addi	sp, sp, -0xf0
   10b7e: f586         	sd	ra, 0xe8(sp)
   10b80: f1a2         	sd	s0, 0xe0(sp)
   10b82: eda6         	sd	s1, 0xd8(sp)
   10b84: e9ca         	sd	s2, 0xd0(sp)
   10b86: e5ce         	sd	s3, 0xc8(sp)
   10b88: e1d2         	sd	s4, 0xc0(sp)
   10b8a: fd56         	sd	s5, 0xb8(sp)
   10b8c: f95a         	sd	s6, 0xb0(sp)
   10b8e: f55e         	sd	s7, 0xa8(sp)
   10b90: f162         	sd	s8, 0xa0(sp)
   10b92: ed66         	sd	s9, 0x98(sp)
   10b94: e96a         	sd	s10, 0x90(sp)
   10b96: e56e         	sd	s11, 0x88(sp)
   10b98: 1980         	addi	s0, sp, 0xf0
   10b9a: 8a2a         	mv	s4, a0
   10b9c: 7ff50593     	addi	a1, a0, 0x7ff
   10ba0: 0115b503     	ld	a0, 0x11(a1)
   10ba4: 2e050f63     	beqz	a0, 0x10ea2 <.Lpcrel_hi13+0x16c>
   10ba8: f2b43423     	sd	a1, -0xd8(s0)
   10bac: 000a3503     	ld	a0, 0x0(s4)
   10bb0: 4685         	li	a3, 0x1
   10bb2: 00d5352f     	amoadd.d	a0, a3, (a0)
   10bb6: 36054363     	bltz	a0, 0x10f1c <.Lpcrel_hi18+0x16>
   10bba: 000a3483     	ld	s1, 0x0(s4)
   10bbe: 008a3b03     	ld	s6, 0x8(s4)

0000000000010bc2 <.Lpcrel_hi4>:
   10bc2: 00004597     	auipc	a1, 0x4
   10bc6: 4505         	li	a0, 0x1
   10bc8: 4665         	li	a2, 0x19
   10bca: 04000893     	li	a7, 0x40
   10bce: 8fe58593     	addi	a1, a1, -0x702
   10bd2: f4840713     	addi	a4, s0, -0xb8
   10bd6: 00000073     	ecall
   10bda: 02848513     	addi	a0, s1, 0x28
   10bde: 00d5352f     	amoadd.d	a0, a3, (a0)

0000000000010be2 <.Lpcrel_hi5>:
   10be2: 00003597     	auipc	a1, 0x3

0000000000010be6 <.Lpcrel_hi6>:
   10be6: 00004617     	auipc	a2, 0x4
   10bea: 4789         	li	a5, 0x2
   10bec: f4a43423     	sd	a0, -0xb8(s0)
   10bf0: f8040513     	addi	a0, s0, -0x80
   10bf4: 88658593     	addi	a1, a1, -0x77a
   10bf8: 90260c13     	addi	s8, a2, -0x6fe
   10bfc: f8e43023     	sd	a4, -0x80(s0)
   10c00: f2b43823     	sd	a1, -0xd0(s0)
   10c04: f8b43423     	sd	a1, -0x78(s0)
   10c08: f6043823     	sd	zero, -0x90(s0)
   10c0c: f5843823     	sd	s8, -0xb0(s0)
   10c10: f4f43c23     	sd	a5, -0xa8(s0)
   10c14: f6a43023     	sd	a0, -0xa0(s0)
   10c18: f6d43423     	sd	a3, -0x98(s0)

0000000000010c1c <.Lpcrel_hi7>:
   10c1c: 00003597     	auipc	a1, 0x3
   10c20: f9740513     	addi	a0, s0, -0x69
   10c24: 7fc58593     	addi	a1, a1, 0x7fc
   10c28: f5040613     	addi	a2, s0, -0xb0
   10c2c: 00001097     	auipc	ra, 0x1
   10c30: 6c4080e7     	jalr	0x6c4(ra) <_ZN4core3fmt5write17h7ce9e976de62bebaE>
   10c34: 32051663     	bnez	a0, 0x10f60 <.Lpcrel_hi8>
   10c38: 7088         	ld	a0, 0x20(s1)
   10c3a: 0230000f     	fence	r, rw
   10c3e: f4843583     	ld	a1, -0xb8(s0)
   10c42: 00b50b63     	beq	a0, a1, 0x10c58 <.Lpcrel_hi7+0x3c>
   10c46: 0100000f     	fence	w, 0
   10c4a: 7088         	ld	a0, 0x20(s1)
   10c4c: 0230000f     	fence	r, rw
   10c50: f4843583     	ld	a1, -0xb8(s0)
   10c54: feb519e3     	bne	a0, a1, 0x10c46 <.Lpcrel_hi7+0x2a>
   10c58: 0204bc23     	sd	zero, 0x38(s1)
   10c5c: 02048513     	addi	a0, s1, 0x20
   10c60: 4585         	li	a1, 0x1
   10c62: 02b5302f     	amoadd.d.rl	zero, a1, (a0)
   10c66: f2843583     	ld	a1, -0xd8(s0)
   10c6a: 0115b503     	ld	a0, 0x11(a1)
   10c6e: 157d         	addi	a0, a0, -0x1
   10c70: 00a5b8a3     	sd	a0, 0x11(a1)
   10c74: 22050863     	beqz	a0, 0x10ea4 <.Lpcrel_hi13+0x16e>
   10c78: 07f00593     	li	a1, 0x7f
   10c7c: 30a5e663     	bltu	a1, a0, 0x10f88 <.Lpcrel_hi11>
   10c80: 0512         	slli	a0, a0, 0x4
   10c82: 00aa05b3     	add	a1, s4, a0
   10c86: 6190         	ld	a2, 0x0(a1)
   10c88: 4505         	li	a0, 0x1
   10c8a: 00a6362f     	amoadd.d	a2, a0, (a2)
   10c8e: 28064763     	bltz	a2, 0x10f1c <.Lpcrel_hi18+0x16>
   10c92: 000a3603     	ld	a2, 0x0(s4)
   10c96: 0005b983     	ld	s3, 0x0(a1)
   10c9a: 0085b903     	ld	s2, 0x8(a1)
   10c9e: 55fd         	li	a1, -0x1
   10ca0: 02b635af     	amoadd.d.rl	a1, a1, (a2)
   10ca4: 00a59963     	bne	a1, a0, 0x10cb6 <.Lpcrel_hi7+0x9a>
   10ca8: 0230000f     	fence	r, rw
   10cac: 8552         	mv	a0, s4
   10cae: 00000097     	auipc	ra, 0x0
   10cb2: ac2080e7     	jalr	-0x53e(ra) <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E>
   10cb6: f2843603     	ld	a2, -0xd8(s0)
   10cba: 00163503     	ld	a0, 0x1(a2)
   10cbe: 013a3023     	sd	s3, 0x0(s4)
   10cc2: 012a3423     	sd	s2, 0x8(s4)
   10cc6: 4585         	li	a1, 0x1
   10cc8: 00b5352f     	amoadd.d	a0, a1, (a0)
   10ccc: 24054863     	bltz	a0, 0x10f1c <.Lpcrel_hi18+0x16>
   10cd0: 01163503     	ld	a0, 0x11(a2)
   10cd4: 08000593     	li	a1, 0x80
   10cd8: 2cb57263     	bgeu	a0, a1, 0x10f9c <.Lpcrel_hi14>
   10cdc: 0512         	slli	a0, a0, 0x4
   10cde: 00aa0ab3     	add	s5, s4, a0
   10ce2: 000ab503     	ld	a0, 0x0(s5)
   10ce6: 00163903     	ld	s2, 0x1(a2)
   10cea: 00963983     	ld	s3, 0x9(a2)
   10cee: 55fd         	li	a1, -0x1
   10cf0: 02b5352f     	amoadd.d.rl	a0, a1, (a0)
   10cf4: 4585         	li	a1, 0x1
   10cf6: 00b51963     	bne	a0, a1, 0x10d08 <.Lpcrel_hi7+0xec>
   10cfa: 0230000f     	fence	r, rw
   10cfe: 8556         	mv	a0, s5
   10d00: 00000097     	auipc	ra, 0x0
   10d04: a70080e7     	jalr	-0x590(ra) <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h2f1d31fa8615e1a0E>
   10d08: 012ab023     	sd	s2, 0x0(s5)
   10d0c: f2843503     	ld	a0, -0xd8(s0)
   10d10: 01153903     	ld	s2, 0x11(a0)
   10d14: 013ab423     	sd	s3, 0x8(s5)
   10d18: 18090663     	beqz	s2, 0x10ea4 <.Lpcrel_hi13+0x16e>
   10d1c: f1643c23     	sd	s6, -0xe8(s0)
   10d20: f2943023     	sd	s1, -0xe0(s0)
   10d24: 4481         	li	s1, 0x0

0000000000010d26 <.Lpcrel_hi12>:
   10d26: 00003517     	auipc	a0, 0x3
   10d2a: 4d85         	li	s11, 0x1
   10d2c: f4840b13     	addi	s6, s0, -0xb8
   10d30: 4989         	li	s3, 0x2
   10d32: f8040d13     	addi	s10, s0, -0x80

0000000000010d36 <.Lpcrel_hi13>:
   10d36: 00003597     	auipc	a1, 0x3
   10d3a: 79a50a93     	addi	s5, a0, 0x79a
   10d3e: 6e258c93     	addi	s9, a1, 0x6e2
   10d42: 08000513     	li	a0, 0x80
   10d46: 18a48063     	beq	s1, a0, 0x10ec6 <.Lpcrel_hi22>
   10d4a: 85d6         	mv	a1, s5
   10d4c: 00449613     	slli	a2, s1, 0x4
   10d50: 4505         	li	a0, 0x1
   10d52: 9652         	add	a2, a2, s4
   10d54: 00063b83     	ld	s7, 0x0(a2)
   10d58: 4665         	li	a2, 0x19
   10d5a: 04000893     	li	a7, 0x40
   10d5e: 00000073     	ecall
   10d62: 028b8513     	addi	a0, s7, 0x28
   10d66: 01b5352f     	amoadd.d	a0, s11, (a0)
   10d6a: f9643023     	sd	s6, -0x80(s0)
   10d6e: f3043583     	ld	a1, -0xd0(s0)
   10d72: f8b43423     	sd	a1, -0x78(s0)
   10d76: f6043823     	sd	zero, -0x90(s0)
   10d7a: f4a43423     	sd	a0, -0xb8(s0)
   10d7e: f5843823     	sd	s8, -0xb0(s0)
   10d82: f5343c23     	sd	s3, -0xa8(s0)
   10d86: f7a43023     	sd	s10, -0xa0(s0)
   10d8a: f7b43423     	sd	s11, -0x98(s0)
   10d8e: f9740513     	addi	a0, s0, -0x69
   10d92: f5040613     	addi	a2, s0, -0xb0
   10d96: 85e6         	mv	a1, s9
   10d98: 00001097     	auipc	ra, 0x1
   10d9c: 558080e7     	jalr	0x558(ra) <_ZN4core3fmt5write17h7ce9e976de62bebaE>
   10da0: c501         	beqz	a0, 0x10da8 <.Lpcrel_hi13+0x72>
   10da2: aa35         	j	0x10ede <.Lpcrel_hi19>
   10da4: 0100000f     	fence	w, 0
   10da8: 020bb503     	ld	a0, 0x20(s7)
   10dac: 0230000f     	fence	r, rw
   10db0: f4843583     	ld	a1, -0xb8(s0)
   10db4: feb518e3     	bne	a0, a1, 0x10da4 <.Lpcrel_hi13+0x6e>
   10db8: 038bb503     	ld	a0, 0x38(s7)
   10dbc: 0505         	addi	a0, a0, 0x1
   10dbe: 02abbc23     	sd	a0, 0x38(s7)
   10dc2: 020b8513     	addi	a0, s7, 0x20
   10dc6: 03b5302f     	amoadd.d.rl	zero, s11, (a0)
   10dca: 0485         	addi	s1, s1, 0x1
   10dcc: f7249be3     	bne	s1, s2, 0x10d42 <.Lpcrel_hi13+0xc>
   10dd0: f2843b03     	ld	s6, -0xd8(s0)
   10dd4: 011b3503     	ld	a0, 0x11(s6)
   10dd8: c161         	beqz	a0, 0x10e98 <.Lpcrel_hi13+0x162>
   10dda: 4a81         	li	s5, 0x0
   10ddc: 4c05         	li	s8, 0x1
   10dde: 03f00c93     	li	s9, 0x3f
   10de2: 08000d13     	li	s10, 0x80
   10de6: 07f00d93     	li	s11, 0x7f
   10dea: 4481         	li	s1, 0x0
   10dec: 001a9993     	slli	s3, s5, 0x1
   10df0: 00198913     	addi	s2, s3, 0x1
   10df4: 004a9b93     	slli	s7, s5, 0x4
   10df8: 02a97b63     	bgeu	s2, a0, 0x10e2e <.Lpcrel_hi13+0xf8>
   10dfc: 04000513     	li	a0, 0x40
   10e00: 14aaf563     	bgeu	s5, a0, 0x10f4a <.Lpcrel_hi15>
   10e04: 00491513     	slli	a0, s2, 0x4
   10e08: 017a05b3     	add	a1, s4, s7
   10e0c: 9552         	add	a0, a0, s4
   10e0e: 6108         	ld	a0, 0x0(a0)
   10e10: 618c         	ld	a1, 0x0(a1)
   10e12: 0541         	addi	a0, a0, 0x10
   10e14: 05c1         	addi	a1, a1, 0x10
   10e16: 00000097     	auipc	ra, 0x0
   10e1a: 402080e7     	jalr	0x402(ra) <_ZN79_$LT$user_lib..task_sched..task..TaskSched$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17ha22d03c67ef1a43fE>
   10e1e: 0ff57513     	andi	a0, a0, 0xff
   10e22: 01850363     	beq	a0, s8, 0x10e28 <.Lpcrel_hi13+0xf2>
   10e26: 8956         	mv	s2, s5
   10e28: 011b3503     	ld	a0, 0x11(s6)
   10e2c: 84ca         	mv	s1, s2
   10e2e: 00298913     	addi	s2, s3, 0x2
   10e32: 02a97a63     	bgeu	s2, a0, 0x10e66 <.Lpcrel_hi13+0x130>
   10e36: 0f9af463     	bgeu	s5, s9, 0x10f1e <.Lpcrel_hi16>
   10e3a: 0fa4fd63     	bgeu	s1, s10, 0x10f34 <.Lpcrel_hi17>
   10e3e: 00491513     	slli	a0, s2, 0x4
   10e42: 00449593     	slli	a1, s1, 0x4
   10e46: 9552         	add	a0, a0, s4
   10e48: 95d2         	add	a1, a1, s4
   10e4a: 6108         	ld	a0, 0x0(a0)
   10e4c: 618c         	ld	a1, 0x0(a1)
   10e4e: 0541         	addi	a0, a0, 0x10
   10e50: 05c1         	addi	a1, a1, 0x10
   10e52: 00000097     	auipc	ra, 0x0
   10e56: 3c6080e7     	jalr	0x3c6(ra) <_ZN79_$LT$user_lib..task_sched..task..TaskSched$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17ha22d03c67ef1a43fE>
   10e5a: 0ff57513     	andi	a0, a0, 0xff
   10e5e: 01850363     	beq	a0, s8, 0x10e64 <.Lpcrel_hi13+0x12e>
   10e62: 8926         	mv	s2, s1
   10e64: 84ca         	mv	s1, s2
   10e66: 03548963     	beq	s1, s5, 0x10e98 <.Lpcrel_hi13+0x162>
   10e6a: 089dee63     	bltu	s11, s1, 0x10f06 <.Lpcrel_hi18>
   10e6e: 9bd2         	add	s7, s7, s4
   10e70: 00449513     	slli	a0, s1, 0x4
   10e74: 9552         	add	a0, a0, s4
   10e76: 610c         	ld	a1, 0x0(a0)
   10e78: 6510         	ld	a2, 0x8(a0)
   10e7a: 000bb683     	ld	a3, 0x0(s7)
   10e7e: 008bb703     	ld	a4, 0x8(s7)
   10e82: 00bbb023     	sd	a1, 0x0(s7)
   10e86: 00cbb423     	sd	a2, 0x8(s7)
   10e8a: e114         	sd	a3, 0x0(a0)
   10e8c: e518         	sd	a4, 0x8(a0)
   10e8e: 011b3503     	ld	a0, 0x11(s6)
   10e92: 8aa6         	mv	s5, s1
   10e94: f4a4ece3     	bltu	s1, a0, 0x10dec <.Lpcrel_hi13+0xb6>
   10e98: f2043483     	ld	s1, -0xe0(s0)
   10e9c: f1843b03     	ld	s6, -0xe8(s0)
   10ea0: a011         	j	0x10ea4 <.Lpcrel_hi13+0x16e>
   10ea2: 4481         	li	s1, 0x0
   10ea4: 8526         	mv	a0, s1
   10ea6: 85da         	mv	a1, s6
   10ea8: 70ae         	ld	ra, 0xe8(sp)
   10eaa: 740e         	ld	s0, 0xe0(sp)
   10eac: 64ee         	ld	s1, 0xd8(sp)
   10eae: 694e         	ld	s2, 0xd0(sp)
   10eb0: 69ae         	ld	s3, 0xc8(sp)
   10eb2: 6a0e         	ld	s4, 0xc0(sp)
   10eb4: 7aea         	ld	s5, 0xb8(sp)
   10eb6: 7b4a         	ld	s6, 0xb0(sp)
   10eb8: 7baa         	ld	s7, 0xa8(sp)
   10eba: 7c0a         	ld	s8, 0xa0(sp)
   10ebc: 6cea         	ld	s9, 0x98(sp)
   10ebe: 6d4a         	ld	s10, 0x90(sp)
   10ec0: 6daa         	ld	s11, 0x88(sp)
   10ec2: 616d         	addi	sp, sp, 0xf0
   10ec4: 8082         	ret

0000000000010ec6 <.Lpcrel_hi22>:
   10ec6: 00003597     	auipc	a1, 0x3
   10eca: 08000513     	li	a0, 0x80
   10ece: 4a258613     	addi	a2, a1, 0x4a2
   10ed2: 08000593     	li	a1, 0x80
   10ed6: 00001097     	auipc	ra, 0x1
   10eda: dbc080e7     	jalr	-0x244(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

0000000000010ede <.Lpcrel_hi19>:
   10ede: 00003517     	auipc	a0, 0x3

0000000000010ee2 <.Lpcrel_hi20>:
   10ee2: 00003617     	auipc	a2, 0x3

0000000000010ee6 <.Lpcrel_hi21>:
   10ee6: 00003717     	auipc	a4, 0x3
   10eea: 02b00593     	li	a1, 0x2b
   10eee: 58a50513     	addi	a0, a0, 0x58a
   10ef2: 56660693     	addi	a3, a2, 0x566
   10ef6: 5c270713     	addi	a4, a4, 0x5c2
   10efa: f9740613     	addi	a2, s0, -0x69
   10efe: 00001097     	auipc	ra, 0x1
   10f02: f26080e7     	jalr	-0xda(ra) <_ZN4core6result13unwrap_failed17hce77d3a84c0ed806E>

0000000000010f06 <.Lpcrel_hi18>:
   10f06: 00003517     	auipc	a0, 0x3
   10f0a: 44a50613     	addi	a2, a0, 0x44a
   10f0e: 08000593     	li	a1, 0x80
   10f12: 8526         	mv	a0, s1
   10f14: 00001097     	auipc	ra, 0x1
   10f18: d7e080e7     	jalr	-0x282(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>
   10f1c: 0000         	unimp

0000000000010f1e <.Lpcrel_hi16>:
   10f1e: 00003517     	auipc	a0, 0x3
   10f22: 40250613     	addi	a2, a0, 0x402
   10f26: 08000593     	li	a1, 0x80
   10f2a: 854a         	mv	a0, s2
   10f2c: 00001097     	auipc	ra, 0x1
   10f30: d66080e7     	jalr	-0x29a(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

0000000000010f34 <.Lpcrel_hi17>:
   10f34: 00003517     	auipc	a0, 0x3
   10f38: 40450613     	addi	a2, a0, 0x404
   10f3c: 08000593     	li	a1, 0x80
   10f40: 8526         	mv	a0, s1
   10f42: 00001097     	auipc	ra, 0x1
   10f46: d50080e7     	jalr	-0x2b0(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

0000000000010f4a <.Lpcrel_hi15>:
   10f4a: 00003517     	auipc	a0, 0x3
   10f4e: 3be50613     	addi	a2, a0, 0x3be
   10f52: 08000593     	li	a1, 0x80
   10f56: 854a         	mv	a0, s2
   10f58: 00001097     	auipc	ra, 0x1
   10f5c: d3a080e7     	jalr	-0x2c6(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

0000000000010f60 <.Lpcrel_hi8>:
   10f60: 00003517     	auipc	a0, 0x3

0000000000010f64 <.Lpcrel_hi9>:
   10f64: 00003617     	auipc	a2, 0x3

0000000000010f68 <.Lpcrel_hi10>:
   10f68: 00003717     	auipc	a4, 0x3
   10f6c: 02b00593     	li	a1, 0x2b
   10f70: 50850513     	addi	a0, a0, 0x508
   10f74: 4e460693     	addi	a3, a2, 0x4e4
   10f78: 54070713     	addi	a4, a4, 0x540
   10f7c: f9740613     	addi	a2, s0, -0x69
   10f80: 00001097     	auipc	ra, 0x1
   10f84: ea4080e7     	jalr	-0x15c(ra) <_ZN4core6result13unwrap_failed17hce77d3a84c0ed806E>

0000000000010f88 <.Lpcrel_hi11>:
   10f88: 00003597     	auipc	a1, 0x3
   10f8c: 35058613     	addi	a2, a1, 0x350
   10f90: 08000593     	li	a1, 0x80
   10f94: 00001097     	auipc	ra, 0x1
   10f98: cfe080e7     	jalr	-0x302(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

0000000000010f9c <.Lpcrel_hi14>:
   10f9c: 00003597     	auipc	a1, 0x3
   10fa0: 35458613     	addi	a2, a1, 0x354
   10fa4: 08000593     	li	a1, 0x80
   10fa8: 00001097     	auipc	ra, 0x1
   10fac: cea080e7     	jalr	-0x316(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

0000000000010fb0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h9c3bf63af0935ee5E>:
   10fb0: 1141         	addi	sp, sp, -0x10
   10fb2: e406         	sd	ra, 0x8(sp)
   10fb4: e022         	sd	s0, 0x0(sp)
   10fb6: 0800         	addi	s0, sp, 0x10
   10fb8: 0245e603     	lwu	a2, 0x24(a1)
   10fbc: 01067693     	andi	a3, a2, 0x10
   10fc0: ea99         	bnez	a3, 0x10fd6 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h9c3bf63af0935ee5E+0x26>
   10fc2: 02067613     	andi	a2, a2, 0x20
   10fc6: ee19         	bnez	a2, 0x10fe4 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h9c3bf63af0935ee5E+0x34>
   10fc8: 60a2         	ld	ra, 0x8(sp)
   10fca: 6402         	ld	s0, 0x0(sp)
   10fcc: 0141         	addi	sp, sp, 0x10
   10fce: 00002317     	auipc	t1, 0x2
   10fd2: 49a30067     	jr	0x49a(t1) <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17hd2799c607221fe30E>
   10fd6: 60a2         	ld	ra, 0x8(sp)
   10fd8: 6402         	ld	s0, 0x0(sp)
   10fda: 0141         	addi	sp, sp, 0x10
   10fdc: 00002317     	auipc	t1, 0x2
   10fe0: 0c030067     	jr	0xc0(t1) <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17hc43b8076fcefaebaE>
   10fe4: 60a2         	ld	ra, 0x8(sp)
   10fe6: 6402         	ld	s0, 0x0(sp)
   10fe8: 0141         	addi	sp, sp, 0x10
   10fea: 00002317     	auipc	t1, 0x2
   10fee: 11830067     	jr	0x118(t1) <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17hab96dee307365a25E>

0000000000010ff2 <_ZN4core3fmt5Write10write_char17h428c5629f6031090E.llvm.6561880552306615819>:
   10ff2: 1101         	addi	sp, sp, -0x20
   10ff4: ec06         	sd	ra, 0x18(sp)
   10ff6: e822         	sd	s0, 0x10(sp)
   10ff8: 1000         	addi	s0, sp, 0x20
   10ffa: 08000513     	li	a0, 0x80
   10ffe: fe042623     	sw	zero, -0x14(s0)
   11002: 00a5f663     	bgeu	a1, a0, 0x1100e <_ZN4core3fmt5Write10write_char17h428c5629f6031090E.llvm.6561880552306615819+0x1c>
   11006: feb40623     	sb	a1, -0x14(s0)
   1100a: 4605         	li	a2, 0x1
   1100c: a069         	j	0x11096 <_ZN4core3fmt5Write10write_char17h428c5629f6031090E.llvm.6561880552306615819+0xa4>
   1100e: 00b5d51b     	srliw	a0, a1, 0xb
   11012: ed19         	bnez	a0, 0x11030 <_ZN4core3fmt5Write10write_char17h428c5629f6031090E.llvm.6561880552306615819+0x3e>
   11014: 0065d513     	srli	a0, a1, 0x6
   11018: 03f5f593     	andi	a1, a1, 0x3f
   1101c: 0c056513     	ori	a0, a0, 0xc0
   11020: 08058593     	addi	a1, a1, 0x80
   11024: fea40623     	sb	a0, -0x14(s0)
   11028: feb406a3     	sb	a1, -0x13(s0)
   1102c: 4609         	li	a2, 0x2
   1102e: a0a5         	j	0x11096 <_ZN4core3fmt5Write10write_char17h428c5629f6031090E.llvm.6561880552306615819+0xa4>
   11030: 0105d51b     	srliw	a0, a1, 0x10
   11034: e515         	bnez	a0, 0x11060 <_ZN4core3fmt5Write10write_char17h428c5629f6031090E.llvm.6561880552306615819+0x6e>
   11036: 00c5d513     	srli	a0, a1, 0xc
   1103a: 03459613     	slli	a2, a1, 0x34
   1103e: 03f5f593     	andi	a1, a1, 0x3f
   11042: 0e056513     	ori	a0, a0, 0xe0
   11046: 9269         	srli	a2, a2, 0x3a
   11048: 08058593     	addi	a1, a1, 0x80
   1104c: 08060613     	addi	a2, a2, 0x80
   11050: fea40623     	sb	a0, -0x14(s0)
   11054: fec406a3     	sb	a2, -0x13(s0)
   11058: feb40723     	sb	a1, -0x12(s0)
   1105c: 460d         	li	a2, 0x3
   1105e: a825         	j	0x11096 <_ZN4core3fmt5Write10write_char17h428c5629f6031090E.llvm.6561880552306615819+0xa4>
   11060: 0125d513     	srli	a0, a1, 0x12
   11064: 02e59613     	slli	a2, a1, 0x2e
   11068: 03459693     	slli	a3, a1, 0x34
   1106c: 03f5f593     	andi	a1, a1, 0x3f
   11070: 0f056513     	ori	a0, a0, 0xf0
   11074: 9269         	srli	a2, a2, 0x3a
   11076: 92e9         	srli	a3, a3, 0x3a
   11078: 08058593     	addi	a1, a1, 0x80
   1107c: 08060613     	addi	a2, a2, 0x80
   11080: 08068693     	addi	a3, a3, 0x80
   11084: fea40623     	sb	a0, -0x14(s0)
   11088: fec406a3     	sb	a2, -0x13(s0)
   1108c: fed40723     	sb	a3, -0x12(s0)
   11090: feb407a3     	sb	a1, -0x11(s0)
   11094: 4611         	li	a2, 0x4
   11096: 4505         	li	a0, 0x1
   11098: fec40593     	addi	a1, s0, -0x14
   1109c: 04000893     	li	a7, 0x40
   110a0: 00000073     	ecall
   110a4: 4501         	li	a0, 0x0
   110a6: 60e2         	ld	ra, 0x18(sp)
   110a8: 6442         	ld	s0, 0x10(sp)
   110aa: 6105         	addi	sp, sp, 0x20
   110ac: 8082         	ret

00000000000110ae <_ZN4core3fmt5Write9write_fmt17hebbec00e056c8050E.llvm.6561880552306615819>:
   110ae: 1141         	addi	sp, sp, -0x10
   110b0: e406         	sd	ra, 0x8(sp)
   110b2: e022         	sd	s0, 0x0(sp)
   110b4: 0800         	addi	s0, sp, 0x10
   110b6: 862e         	mv	a2, a1

00000000000110b8 <.Lpcrel_hi0>:
   110b8: 00003597     	auipc	a1, 0x3
   110bc: 36058593     	addi	a1, a1, 0x360
   110c0: 60a2         	ld	ra, 0x8(sp)
   110c2: 6402         	ld	s0, 0x0(sp)
   110c4: 0141         	addi	sp, sp, 0x10
   110c6: 00001317     	auipc	t1, 0x1
   110ca: 22a30067     	jr	0x22a(t1) <_ZN4core3fmt5write17h7ce9e976de62bebaE>

00000000000110ce <_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h24c36706c4aee85dE.llvm.6561880552306615819>:
   110ce: 1141         	addi	sp, sp, -0x10
   110d0: e406         	sd	ra, 0x8(sp)
   110d2: e022         	sd	s0, 0x0(sp)
   110d4: 0800         	addi	s0, sp, 0x10

00000000000110d6 <.Lpcrel_hi1>:
   110d6: 00003517     	auipc	a0, 0x3
   110da: 2aa50693     	addi	a3, a0, 0x2aa
   110de: 4615         	li	a2, 0x5
   110e0: 852e         	mv	a0, a1
   110e2: 85b6         	mv	a1, a3
   110e4: 60a2         	ld	ra, 0x8(sp)
   110e6: 6402         	ld	s0, 0x0(sp)
   110e8: 0141         	addi	sp, sp, 0x10
   110ea: 00001317     	auipc	t1, 0x1
   110ee: 7f830067     	jr	0x7f8(t1) <_ZN57_$LT$core..fmt..Formatter$u20$as$u20$core..fmt..Write$GT$9write_str17h8de15734ef83d9feE>

00000000000110f2 <_ZN64_$LT$core..alloc..layout..Layout$u20$as$u20$core..fmt..Debug$GT$3fmt17h00e884f8a541fc15E>:
   110f2: 7179         	addi	sp, sp, -0x30
   110f4: f406         	sd	ra, 0x28(sp)
   110f6: f022         	sd	s0, 0x20(sp)
   110f8: 1800         	addi	s0, sp, 0x30
   110fa: 82ae         	mv	t0, a1
   110fc: 00850793     	addi	a5, a0, 0x8
   11100: fea43423     	sd	a0, -0x18(s0)

0000000000011104 <.Lpcrel_hi2>:
   11104: 00003817     	auipc	a6, 0x3
   11108: fe840313     	addi	t1, s0, -0x18
   1110c: 4395         	li	t2, 0x5

000000000001110e <.Lpcrel_hi3>:
   1110e: 00003597     	auipc	a1, 0x3

0000000000011112 <.Lpcrel_hi4>:
   11112: 00003697     	auipc	a3, 0x3

0000000000011116 <.Lpcrel_hi5>:
   11116: 00003897     	auipc	a7, 0x3

000000000001111a <.Lpcrel_hi6>:
   1111a: 00003e17     	auipc	t3, 0x3
   1111e: 4619         	li	a2, 0x6
   11120: 4711         	li	a4, 0x4
   11122: 2a480513     	addi	a0, a6, 0x2a4
   11126: 2ba58593     	addi	a1, a1, 0x2ba
   1112a: 0c268693     	addi	a3, a3, 0xc2
   1112e: 27288813     	addi	a6, a7, 0x272
   11132: 2b4e0893     	addi	a7, t3, 0x2b4
   11136: e01e         	sd	t2, 0x0(sp)
   11138: e41a         	sd	t1, 0x8(sp)
   1113a: e82a         	sd	a0, 0x10(sp)
   1113c: 8516         	mv	a0, t0
   1113e: 00001097     	auipc	ra, 0x1
   11142: 7ba080e7     	jalr	0x7ba(ra) <_ZN4core3fmt9Formatter26debug_struct_field2_finish17h861956c1d160201cE>
   11146: 70a2         	ld	ra, 0x28(sp)
   11148: 7402         	ld	s0, 0x20(sp)
   1114a: 6145         	addi	sp, sp, 0x30
   1114c: 8082         	ret

000000000001114e <_ZN64_$LT$core..str..error..Utf8Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h0dfaa4dd76b04a69E>:
   1114e: 7179         	addi	sp, sp, -0x30
   11150: f406         	sd	ra, 0x28(sp)
   11152: f022         	sd	s0, 0x20(sp)
   11154: 1800         	addi	s0, sp, 0x30
   11156: 82ae         	mv	t0, a1
   11158: 8e2a         	mv	t3, a0
   1115a: 0521         	addi	a0, a0, 0x8
   1115c: fea43423     	sd	a0, -0x18(s0)

0000000000011160 <.Lpcrel_hi7>:
   11160: 00003817     	auipc	a6, 0x3
   11164: fe840313     	addi	t1, s0, -0x18
   11168: 43a5         	li	t2, 0x9

000000000001116a <.Lpcrel_hi8>:
   1116a: 00003597     	auipc	a1, 0x3

000000000001116e <.Lpcrel_hi9>:
   1116e: 00003697     	auipc	a3, 0x3

0000000000011172 <.Lpcrel_hi10>:
   11172: 00003897     	auipc	a7, 0x3

0000000000011176 <.Lpcrel_hi11>:
   11176: 00003797     	auipc	a5, 0x3
   1117a: 4625         	li	a2, 0x9
   1117c: 472d         	li	a4, 0xb
   1117e: 27880513     	addi	a0, a6, 0x278
   11182: 28e58593     	addi	a1, a1, 0x28e
   11186: 29368693     	addi	a3, a3, 0x293
   1118a: 21688813     	addi	a6, a7, 0x216
   1118e: 29678893     	addi	a7, a5, 0x296
   11192: e01e         	sd	t2, 0x0(sp)
   11194: e41a         	sd	t1, 0x8(sp)
   11196: e82a         	sd	a0, 0x10(sp)
   11198: 8516         	mv	a0, t0
   1119a: 87f2         	mv	a5, t3
   1119c: 00001097     	auipc	ra, 0x1
   111a0: 75c080e7     	jalr	0x75c(ra) <_ZN4core3fmt9Formatter26debug_struct_field2_finish17h861956c1d160201cE>
   111a4: 70a2         	ld	ra, 0x28(sp)
   111a6: 7402         	ld	s0, 0x20(sp)
   111a8: 6145         	addi	sp, sp, 0x30
   111aa: 8082         	ret

00000000000111ac <_ZN62_$LT$user_lib..console..Stdout$u20$as$u20$core..fmt..Write$GT$9write_str17h47d65d129a0c1397E.llvm.6561880552306615819>:
   111ac: 1141         	addi	sp, sp, -0x10
   111ae: e406         	sd	ra, 0x8(sp)
   111b0: e022         	sd	s0, 0x0(sp)
   111b2: 0800         	addi	s0, sp, 0x10
   111b4: 4505         	li	a0, 0x1
   111b6: 04000893     	li	a7, 0x40
   111ba: 00000073     	ecall
   111be: 4501         	li	a0, 0x0
   111c0: 60a2         	ld	ra, 0x8(sp)
   111c2: 6402         	ld	s0, 0x0(sp)
   111c4: 0141         	addi	sp, sp, 0x10
   111c6: 8082         	ret

00000000000111c8 <_ZN8user_lib7console5print17h88eff661fc6d15eaE>:
   111c8: 1101         	addi	sp, sp, -0x20
   111ca: ec06         	sd	ra, 0x18(sp)
   111cc: e822         	sd	s0, 0x10(sp)
   111ce: 1000         	addi	s0, sp, 0x20
   111d0: 862a         	mv	a2, a0

00000000000111d2 <.Lpcrel_hi12>:
   111d2: 00003517     	auipc	a0, 0x3
   111d6: 24650593     	addi	a1, a0, 0x246
   111da: fef40513     	addi	a0, s0, -0x11
   111de: 00001097     	auipc	ra, 0x1
   111e2: 112080e7     	jalr	0x112(ra) <_ZN4core3fmt5write17h7ce9e976de62bebaE>
   111e6: e509         	bnez	a0, 0x111f0 <.Lpcrel_hi13>
   111e8: 60e2         	ld	ra, 0x18(sp)
   111ea: 6442         	ld	s0, 0x10(sp)
   111ec: 6105         	addi	sp, sp, 0x20
   111ee: 8082         	ret

00000000000111f0 <.Lpcrel_hi13>:
   111f0: 00003517     	auipc	a0, 0x3

00000000000111f4 <.Lpcrel_hi14>:
   111f4: 00003617     	auipc	a2, 0x3

00000000000111f8 <.Lpcrel_hi15>:
   111f8: 00003717     	auipc	a4, 0x3
   111fc: 02b00593     	li	a1, 0x2b
   11200: 27850513     	addi	a0, a0, 0x278
   11204: 25460693     	addi	a3, a2, 0x254
   11208: 2b070713     	addi	a4, a4, 0x2b0
   1120c: fef40613     	addi	a2, s0, -0x11
   11210: 00001097     	auipc	ra, 0x1
   11214: c14080e7     	jalr	-0x3ec(ra) <_ZN4core6result13unwrap_failed17hce77d3a84c0ed806E>

0000000000011218 <_ZN79_$LT$user_lib..task_sched..task..TaskSched$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17ha22d03c67ef1a43fE>:
   11218: 7175         	addi	sp, sp, -0x90
   1121a: e506         	sd	ra, 0x88(sp)
   1121c: e122         	sd	s0, 0x80(sp)
   1121e: fca6         	sd	s1, 0x78(sp)
   11220: f8ca         	sd	s2, 0x70(sp)
   11222: f4ce         	sd	s3, 0x68(sp)
   11224: f0d2         	sd	s4, 0x60(sp)
   11226: ecd6         	sd	s5, 0x58(sp)
   11228: e8da         	sd	s6, 0x50(sp)
   1122a: 0900         	addi	s0, sp, 0x90
   1122c: 892e         	mv	s2, a1
   1122e: 84aa         	mv	s1, a0

0000000000011230 <.Lpcrel_hi56>:
   11230: 00003597     	auipc	a1, 0x3
   11234: 4685         	li	a3, 0x1
   11236: 4505         	li	a0, 0x1
   11238: 4665         	li	a2, 0x19
   1123a: 04000893     	li	a7, 0x40
   1123e: 29058593     	addi	a1, a1, 0x290
   11242: 01848713     	addi	a4, s1, 0x18
   11246: 00000073     	ecall
   1124a: f7040513     	addi	a0, s0, -0x90
   1124e: 00d735af     	amoadd.d	a1, a3, (a4)

0000000000011252 <.Lpcrel_hi57>:
   11252: 00002617     	auipc	a2, 0x2

0000000000011256 <.Lpcrel_hi58>:
   11256: 00003717     	auipc	a4, 0x3
   1125a: 4789         	li	a5, 0x2
   1125c: f6b43823     	sd	a1, -0x90(s0)
   11260: fa840593     	addi	a1, s0, -0x58
   11264: 21660a13     	addi	s4, a2, 0x216
   11268: 29270993     	addi	s3, a4, 0x292
   1126c: faa43423     	sd	a0, -0x58(s0)
   11270: fb443823     	sd	s4, -0x50(s0)
   11274: f8043c23     	sd	zero, -0x68(s0)
   11278: f7343c23     	sd	s3, -0x88(s0)
   1127c: f8f43023     	sd	a5, -0x80(s0)
   11280: f8b43423     	sd	a1, -0x78(s0)
   11284: f8d43823     	sd	a3, -0x70(s0)

0000000000011288 <.Lpcrel_hi59>:
   11288: 00003597     	auipc	a1, 0x3
   1128c: fbf40513     	addi	a0, s0, -0x41
   11290: 19058593     	addi	a1, a1, 0x190
   11294: f7840613     	addi	a2, s0, -0x88
   11298: 00001097     	auipc	ra, 0x1
   1129c: 058080e7     	jalr	0x58(ra) <_ZN4core3fmt5write17h7ce9e976de62bebaE>
   112a0: c51d         	beqz	a0, 0x112ce <.Lpcrel_hi62+0x24>

00000000000112a2 <.Lpcrel_hi60>:
   112a2: 00003517     	auipc	a0, 0x3

00000000000112a6 <.Lpcrel_hi61>:
   112a6: 00003617     	auipc	a2, 0x3

00000000000112aa <.Lpcrel_hi62>:
   112aa: 00003717     	auipc	a4, 0x3
   112ae: 02b00593     	li	a1, 0x2b
   112b2: 1c650513     	addi	a0, a0, 0x1c6
   112b6: 1a260693     	addi	a3, a2, 0x1a2
   112ba: 1fe70713     	addi	a4, a4, 0x1fe
   112be: fbf40613     	addi	a2, s0, -0x41
   112c2: 00001097     	auipc	ra, 0x1
   112c6: b62080e7     	jalr	-0x49e(ra) <_ZN4core6result13unwrap_failed17hce77d3a84c0ed806E>
   112ca: 0100000f     	fence	w, 0
   112ce: 6888         	ld	a0, 0x10(s1)
   112d0: 0230000f     	fence	r, rw
   112d4: f7043583     	ld	a1, -0x90(s0)
   112d8: feb519e3     	bne	a0, a1, 0x112ca <.Lpcrel_hi62+0x20>
   112dc: 0204ba83     	ld	s5, 0x20(s1)
   112e0: 0284bb03     	ld	s6, 0x28(s1)
   112e4: 01048593     	addi	a1, s1, 0x10
   112e8: 4685         	li	a3, 0x1

00000000000112ea <.Lpcrel_hi63>:
   112ea: 00003717     	auipc	a4, 0x3
   112ee: 4505         	li	a0, 0x1
   112f0: 4665         	li	a2, 0x19
   112f2: 02d5b02f     	amoadd.d.rl	zero, a3, (a1)
   112f6: 1d670593     	addi	a1, a4, 0x1d6
   112fa: 04000893     	li	a7, 0x40
   112fe: 00000073     	ecall
   11302: 01890513     	addi	a0, s2, 0x18
   11306: f7040593     	addi	a1, s0, -0x90
   1130a: 4609         	li	a2, 0x2
   1130c: fa840713     	addi	a4, s0, -0x58
   11310: 00d5352f     	amoadd.d	a0, a3, (a0)
   11314: fab43423     	sd	a1, -0x58(s0)
   11318: fb443823     	sd	s4, -0x50(s0)
   1131c: f8043c23     	sd	zero, -0x68(s0)
   11320: f6a43823     	sd	a0, -0x90(s0)
   11324: f7343c23     	sd	s3, -0x88(s0)
   11328: f8c43023     	sd	a2, -0x80(s0)
   1132c: f8e43423     	sd	a4, -0x78(s0)
   11330: f8d43823     	sd	a3, -0x70(s0)

0000000000011334 <.Lpcrel_hi64>:
   11334: 00003597     	auipc	a1, 0x3
   11338: fbf40513     	addi	a0, s0, -0x41
   1133c: 0e458593     	addi	a1, a1, 0xe4
   11340: f7840613     	addi	a2, s0, -0x88
   11344: 00001097     	auipc	ra, 0x1
   11348: fac080e7     	jalr	-0x54(ra) <_ZN4core3fmt5write17h7ce9e976de62bebaE>
   1134c: ed35         	bnez	a0, 0x113c8 <.Lpcrel_hi65>
   1134e: 01093503     	ld	a0, 0x10(s2)
   11352: 0230000f     	fence	r, rw
   11356: f7043583     	ld	a1, -0x90(s0)
   1135a: 9ada         	add	s5, s5, s6
   1135c: 00b50c63     	beq	a0, a1, 0x11374 <.Lpcrel_hi64+0x40>
   11360: 0100000f     	fence	w, 0
   11364: 01093503     	ld	a0, 0x10(s2)
   11368: 0230000f     	fence	r, rw
   1136c: f7043583     	ld	a1, -0x90(s0)
   11370: feb518e3     	bne	a0, a1, 0x11360 <.Lpcrel_hi64+0x2c>
   11374: 02093503     	ld	a0, 0x20(s2)
   11378: 02893583     	ld	a1, 0x28(s2)
   1137c: 01090613     	addi	a2, s2, 0x10
   11380: 4685         	li	a3, 0x1
   11382: 02d6302f     	amoadd.d.rl	zero, a3, (a2)
   11386: 952e         	add	a0, a0, a1
   11388: 02aa9063     	bne	s5, a0, 0x113a8 <.Lpcrel_hi64+0x74>
   1138c: 6088         	ld	a0, 0x0(s1)
   1138e: 00093583     	ld	a1, 0x0(s2)
   11392: 00b51563     	bne	a0, a1, 0x1139c <.Lpcrel_hi64+0x68>
   11396: 6488         	ld	a0, 0x8(s1)
   11398: 00893583     	ld	a1, 0x8(s2)
   1139c: 00b53633     	sltu	a2, a0, a1
   113a0: 00a5b533     	sltu	a0, a1, a0
   113a4: 8d11         	sub	a0, a0, a2
   113a6: a039         	j	0x113b4 <.Lpcrel_hi64+0x80>
   113a8: 00aab533     	sltu	a0, s5, a0
   113ac: 40a00533     	neg	a0, a0
   113b0: 00156513     	ori	a0, a0, 0x1
   113b4: 60aa         	ld	ra, 0x88(sp)
   113b6: 640a         	ld	s0, 0x80(sp)
   113b8: 74e6         	ld	s1, 0x78(sp)
   113ba: 7946         	ld	s2, 0x70(sp)
   113bc: 79a6         	ld	s3, 0x68(sp)
   113be: 7a06         	ld	s4, 0x60(sp)
   113c0: 6ae6         	ld	s5, 0x58(sp)
   113c2: 6b46         	ld	s6, 0x50(sp)
   113c4: 6149         	addi	sp, sp, 0x90
   113c6: 8082         	ret

00000000000113c8 <.Lpcrel_hi65>:
   113c8: 00003517     	auipc	a0, 0x3

00000000000113cc <.Lpcrel_hi66>:
   113cc: 00003617     	auipc	a2, 0x3

00000000000113d0 <.Lpcrel_hi67>:
   113d0: 00003717     	auipc	a4, 0x3
   113d4: 02b00593     	li	a1, 0x2b
   113d8: 0a050513     	addi	a0, a0, 0xa0
   113dc: 07c60693     	addi	a3, a2, 0x7c
   113e0: 0d870713     	addi	a4, a4, 0xd8
   113e4: fbf40613     	addi	a2, s0, -0x41
   113e8: 00001097     	auipc	ra, 0x1
   113ec: a3c080e7     	jalr	-0x5c4(ra) <_ZN4core6result13unwrap_failed17hce77d3a84c0ed806E>

00000000000113f0 <_ZN8user_lib18handle_alloc_error17h4ebeaaf83b90a082E>:
   113f0: 711d         	addi	sp, sp, -0x60
   113f2: ec86         	sd	ra, 0x58(sp)
   113f4: e8a2         	sd	s0, 0x50(sp)
   113f6: 1080         	addi	s0, sp, 0x60
   113f8: faa43023     	sd	a0, -0x60(s0)
   113fc: fab43423     	sd	a1, -0x58(s0)
   11400: fa040513     	addi	a0, s0, -0x60

0000000000011404 <.Lpcrel_hi81>:
   11404: 00000597     	auipc	a1, 0x0

0000000000011408 <.Lpcrel_hi82>:
   11408: 00003617     	auipc	a2, 0x3
   1140c: 4685         	li	a3, 0x1
   1140e: fc043823     	sd	zero, -0x30(s0)
   11412: cee58593     	addi	a1, a1, -0x312
   11416: fea43023     	sd	a0, -0x20(s0)
   1141a: feb43423     	sd	a1, -0x18(s0)
   1141e: fe040513     	addi	a0, s0, -0x20
   11422: 1a060593     	addi	a1, a2, 0x1a0
   11426: fab43823     	sd	a1, -0x50(s0)
   1142a: fad43c23     	sd	a3, -0x48(s0)
   1142e: fca43023     	sd	a0, -0x40(s0)
   11432: fcd43423     	sd	a3, -0x38(s0)

0000000000011436 <.Lpcrel_hi83>:
   11436: 00003517     	auipc	a0, 0x3
   1143a: 18250593     	addi	a1, a0, 0x182
   1143e: fb040513     	addi	a0, s0, -0x50
   11442: 00000097     	auipc	ra, 0x0
   11446: 7f4080e7     	jalr	0x7f4(ra) <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>

000000000001144a <__rg_oom>:
   1144a: 1141         	addi	sp, sp, -0x10
   1144c: e406         	sd	ra, 0x8(sp)
   1144e: e022         	sd	s0, 0x0(sp)
   11450: 0800         	addi	s0, sp, 0x10
   11452: 862a         	mv	a2, a0
   11454: 852e         	mv	a0, a1
   11456: 85b2         	mv	a1, a2
   11458: 00000097     	auipc	ra, 0x0
   1145c: f98080e7     	jalr	-0x68(ra) <_ZN8user_lib18handle_alloc_error17h4ebeaaf83b90a082E>

0000000000011460 <_ZN76_$LT$core..panic..panic_info..PanicMessage$u20$as$u20$core..fmt..Display$GT$3fmt17h661ab1cbe6196ed1E>:
   11460: 7139         	addi	sp, sp, -0x40
   11462: fc06         	sd	ra, 0x38(sp)
   11464: f822         	sd	s0, 0x30(sp)
   11466: 0080         	addi	s0, sp, 0x40
   11468: 6110         	ld	a2, 0x0(a0)
   1146a: 7988         	ld	a0, 0x30(a1)
   1146c: 7d8c         	ld	a1, 0x38(a1)
   1146e: 6214         	ld	a3, 0x0(a2)
   11470: 6618         	ld	a4, 0x8(a2)
   11472: 6a1c         	ld	a5, 0x10(a2)
   11474: 01863803     	ld	a6, 0x18(a2)
   11478: 02063883     	ld	a7, 0x20(a2)
   1147c: 7610         	ld	a2, 0x28(a2)
   1147e: fcd43023     	sd	a3, -0x40(s0)
   11482: fce43423     	sd	a4, -0x38(s0)
   11486: fcf43823     	sd	a5, -0x30(s0)
   1148a: fd043c23     	sd	a6, -0x28(s0)
   1148e: ff143023     	sd	a7, -0x20(s0)
   11492: fec43423     	sd	a2, -0x18(s0)
   11496: fc040613     	addi	a2, s0, -0x40
   1149a: 00001097     	auipc	ra, 0x1
   1149e: e56080e7     	jalr	-0x1aa(ra) <_ZN4core3fmt5write17h7ce9e976de62bebaE>
   114a2: 70e2         	ld	ra, 0x38(sp)
   114a4: 7442         	ld	s0, 0x30(sp)
   114a6: 6121         	addi	sp, sp, 0x40
   114a8: 8082         	ret

00000000000114aa <rust_begin_unwind>:
   114aa: 7175         	addi	sp, sp, -0x90
   114ac: e506         	sd	ra, 0x88(sp)
   114ae: e122         	sd	s0, 0x80(sp)
   114b0: 0900         	addi	s0, sp, 0x90
   114b2: 610c         	ld	a1, 0x0(a0)
   114b4: 6508         	ld	a0, 0x8(a0)
   114b6: fd840813     	addi	a6, s0, -0x28

00000000000114ba <.Lpcrel_hi0>:
   114ba: fffff697     	auipc	a3, 0xfffff
   114be: fec40293     	addi	t0, s0, -0x14

00000000000114c2 <.Lpcrel_hi1>:
   114c2: 00002797     	auipc	a5, 0x2
   114c6: f7040893     	addi	a7, s0, -0x90

00000000000114ca <.Lpcrel_hi2>:
   114ca: 00000617     	auipc	a2, 0x0
   114ce: e2e68693     	addi	a3, a3, -0x1d2
   114d2: e1478793     	addi	a5, a5, -0x1ec
   114d6: f6b43823     	sd	a1, -0x90(s0)
   114da: 610c         	ld	a1, 0x0(a0)
   114dc: 6518         	ld	a4, 0x8(a0)
   114de: 4908         	lw	a0, 0x10(a0)
   114e0: fb043423     	sd	a6, -0x58(s0)
   114e4: fad43823     	sd	a3, -0x50(s0)
   114e8: fa543c23     	sd	t0, -0x48(s0)
   114ec: fcf43023     	sd	a5, -0x40(s0)

00000000000114f0 <.Lpcrel_hi3>:
   114f0: 00003697     	auipc	a3, 0x3
   114f4: f9660613     	addi	a2, a2, -0x6a
   114f8: fd143423     	sd	a7, -0x38(s0)
   114fc: fcc43823     	sd	a2, -0x30(s0)
   11500: 4611         	li	a2, 0x4
   11502: f8043c23     	sd	zero, -0x68(s0)
   11506: fcb43c23     	sd	a1, -0x28(s0)
   1150a: fee43023     	sd	a4, -0x20(s0)
   1150e: fa840593     	addi	a1, s0, -0x58
   11512: fea42623     	sw	a0, -0x14(s0)
   11516: 450d         	li	a0, 0x3
   11518: 0f068693     	addi	a3, a3, 0xf0
   1151c: f6d43c23     	sd	a3, -0x88(s0)
   11520: f8c43023     	sd	a2, -0x80(s0)
   11524: f8b43423     	sd	a1, -0x78(s0)
   11528: f8a43823     	sd	a0, -0x70(s0)
   1152c: f7840513     	addi	a0, s0, -0x88
   11530: 00000097     	auipc	ra, 0x0
   11534: c98080e7     	jalr	-0x368(ra) <_ZN8user_lib7console5print17h88eff661fc6d15eaE>
   11538: 4501         	li	a0, 0x0
   1153a: 4581         	li	a1, 0x0
   1153c: 4601         	li	a2, 0x0
   1153e: 0ac00893     	li	a7, 0xac
   11542: 00000073     	ecall
   11546: 04000593     	li	a1, 0x40
   1154a: 08100893     	li	a7, 0x81
   1154e: 4601         	li	a2, 0x0
   11550: 00000073     	ecall

0000000000011554 <.Lpcrel_hi4>:
   11554: 00003517     	auipc	a0, 0x3

0000000000011558 <.Lpcrel_hi5>:
   11558: 00003597     	auipc	a1, 0x3
   1155c: 0cc50513     	addi	a0, a0, 0xcc
   11560: 10858613     	addi	a2, a1, 0x108
   11564: 02800593     	li	a1, 0x28
   11568: 00000097     	auipc	ra, 0x0
   1156c: 6f0080e7     	jalr	0x6f0(ra) <_ZN4core9panicking5panic17h8d5ae4408e8894d1E>

0000000000011570 <_ZN22buddy_system_allocator4Heap4init17h097231ac74310fdbE>:
   11570: 1141         	addi	sp, sp, -0x10
   11572: e406         	sd	ra, 0x8(sp)
   11574: e022         	sd	s0, 0x0(sp)
   11576: 0800         	addi	s0, sp, 0x10
   11578: 962e         	add	a2, a2, a1
   1157a: 059d         	addi	a1, a1, 0x7
   1157c: ff85f793     	andi	a5, a1, -0x8
   11580: ff867f93     	andi	t6, a2, -0x8
   11584: 12ffe263     	bltu	t6, a5, 0x116a8 <.Lpcrel_hi39>
   11588: 4701         	li	a4, 0x0
   1158a: 00878593     	addi	a1, a5, 0x8
   1158e: 10bfe463     	bltu	t6, a1, 0x11696 <.Lpcrel_hi38+0xc0>
   11592: 4805         	li	a6, 0x1
   11594: 48fd         	li	a7, 0x1f

0000000000011596 <.Lpcrel_hi37>:
   11596: 00003597     	auipc	a1, 0x3
   1159a: 55555337     	lui	t1, 0x55555
   1159e: 333333b7     	lui	t2, 0x33333
   115a2: 0f0f1e37     	lui	t3, 0xf0f1
   115a6: 010106b7     	lui	a3, 0x1010
   115aa: a9a5b283     	ld	t0, -0x566(a1)
   115ae: 5553031b     	addiw	t1, t1, 0x555
   115b2: 33338f1b     	addiw	t5, t2, 0x333
   115b6: f0fe039b     	addiw	t2, t3, -0xf1
   115ba: 10168e1b     	addiw	t3, a3, 0x101
   115be: 02031593     	slli	a1, t1, 0x20
   115c2: 932e         	add	t1, t1, a1
   115c4: 020f1593     	slli	a1, t5, 0x20
   115c8: 9f2e         	add	t5, t5, a1
   115ca: 02039593     	slli	a1, t2, 0x20
   115ce: 93ae         	add	t2, t2, a1
   115d0: 020e1593     	slli	a1, t3, 0x20
   115d4: 9e2e         	add	t3, t3, a1

00000000000115d6 <.Lpcrel_hi38>:
   115d6: 00003597     	auipc	a1, 0x3
   115da: 1e258e93     	addi	t4, a1, 0x1e2
   115de: 40ff85b3     	sub	a1, t6, a5
   115e2: cdbd         	beqz	a1, 0x11660 <.Lpcrel_hi38+0x8a>
   115e4: 0015d693     	srli	a3, a1, 0x1
   115e8: 8dd5         	or	a1, a1, a3
   115ea: 0025d693     	srli	a3, a1, 0x2
   115ee: 8dd5         	or	a1, a1, a3
   115f0: 0045d693     	srli	a3, a1, 0x4
   115f4: 8dd5         	or	a1, a1, a3
   115f6: 0085d693     	srli	a3, a1, 0x8
   115fa: 8dd5         	or	a1, a1, a3
   115fc: 0105d693     	srli	a3, a1, 0x10
   11600: 8dd5         	or	a1, a1, a3
   11602: 0205d693     	srli	a3, a1, 0x20
   11606: 8dd5         	or	a1, a1, a3
   11608: fff5c593     	not	a1, a1
   1160c: 0015d693     	srli	a3, a1, 0x1
   11610: 0066f6b3     	and	a3, a3, t1
   11614: 8d95         	sub	a1, a1, a3
   11616: 01e5f6b3     	and	a3, a1, t5
   1161a: 8189         	srli	a1, a1, 0x2
   1161c: 01e5f5b3     	and	a1, a1, t5
   11620: 95b6         	add	a1, a1, a3
   11622: 0045d693     	srli	a3, a1, 0x4
   11626: 95b6         	add	a1, a1, a3
   11628: 0075f5b3     	and	a1, a1, t2
   1162c: 03c585b3     	mul	a1, a1, t3
   11630: 91e1         	srli	a1, a1, 0x38
   11632: 40f006b3     	neg	a3, a5
   11636: fff5c593     	not	a1, a1
   1163a: 8efd         	and	a3, a3, a5
   1163c: 00b815b3     	sll	a1, a6, a1
   11640: 00d5e363     	bltu	a1, a3, 0x11646 <.Lpcrel_hi38+0x70>
   11644: 85b6         	mv	a1, a3
   11646: c98d         	beqz	a1, 0x11678 <.Lpcrel_hi38+0xa2>
   11648: 40b006b3     	neg	a3, a1
   1164c: 8eed         	and	a3, a3, a1
   1164e: 025686b3     	mul	a3, a3, t0
   11652: 92e9         	srli	a3, a3, 0x3a
   11654: 96f6         	add	a3, a3, t4
   11656: 0006c683     	lbu	a3, 0x0(a3)
   1165a: 02d8f363     	bgeu	a7, a3, 0x11680 <.Lpcrel_hi38+0xaa>
   1165e: a095         	j	0x116c2 <.Lpcrel_hi41>
   11660: 04000593     	li	a1, 0x40
   11664: 40f006b3     	neg	a3, a5
   11668: fff5c593     	not	a1, a1
   1166c: 8efd         	and	a3, a3, a5
   1166e: 00b815b3     	sll	a1, a6, a1
   11672: fcd5f9e3     	bgeu	a1, a3, 0x11644 <.Lpcrel_hi38+0x6e>
   11676: bfc1         	j	0x11646 <.Lpcrel_hi38+0x70>
   11678: 04000693     	li	a3, 0x40
   1167c: 04d8e363     	bltu	a7, a3, 0x116c2 <.Lpcrel_hi41>
   11680: 068e         	slli	a3, a3, 0x3
   11682: 96aa         	add	a3, a3, a0
   11684: 6290         	ld	a2, 0x0(a3)
   11686: e29c         	sd	a5, 0x0(a3)
   11688: e390         	sd	a2, 0x0(a5)
   1168a: 97ae         	add	a5, a5, a1
   1168c: 00878613     	addi	a2, a5, 0x8
   11690: 972e         	add	a4, a4, a1
   11692: f4cff6e3     	bgeu	t6, a2, 0x115de <.Lpcrel_hi38+0x8>
   11696: 11053583     	ld	a1, 0x110(a0)
   1169a: 95ba         	add	a1, a1, a4
   1169c: 10b53823     	sd	a1, 0x110(a0)
   116a0: 60a2         	ld	ra, 0x8(sp)
   116a2: 6402         	ld	s0, 0x0(sp)
   116a4: 0141         	addi	sp, sp, 0x10
   116a6: 8082         	ret

00000000000116a8 <.Lpcrel_hi39>:
   116a8: 00003517     	auipc	a0, 0x3

00000000000116ac <.Lpcrel_hi40>:
   116ac: 00003597     	auipc	a1, 0x3
   116b0: 1d050513     	addi	a0, a0, 0x1d0
   116b4: 25c58613     	addi	a2, a1, 0x25c
   116b8: 45f9         	li	a1, 0x1e
   116ba: 00000097     	auipc	ra, 0x0
   116be: 59e080e7     	jalr	0x59e(ra) <_ZN4core9panicking5panic17h8d5ae4408e8894d1E>

00000000000116c2 <.Lpcrel_hi41>:
   116c2: 00003517     	auipc	a0, 0x3
   116c6: 25e50613     	addi	a2, a0, 0x25e
   116ca: 02000593     	li	a1, 0x20
   116ce: 8536         	mv	a0, a3
   116d0: 00000097     	auipc	ra, 0x0
   116d4: 5c2080e7     	jalr	0x5c2(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

00000000000116d8 <_ZN22buddy_system_allocator4Heap5alloc17h36cc6c43d9a86a56E>:
   116d8: 1141         	addi	sp, sp, -0x10
   116da: e406         	sd	ra, 0x8(sp)
   116dc: e022         	sd	s0, 0x0(sp)
   116de: 0800         	addi	s0, sp, 0x10
   116e0: 4689         	li	a3, 0x2
   116e2: 00d67663     	bgeu	a2, a3, 0x116ee <_ZN22buddy_system_allocator4Heap5alloc17h36cc6c43d9a86a56E+0x16>
   116e6: 4685         	li	a3, 0x1
   116e8: 0ab6f063     	bgeu	a3, a1, 0x11788 <_ZN22buddy_system_allocator4Heap5alloc17h36cc6c43d9a86a56E+0xb0>
   116ec: a879         	j	0x1178a <_ZN22buddy_system_allocator4Heap5alloc17h36cc6c43d9a86a56E+0xb2>
   116ee: fff60393     	addi	t2, a2, -0x1
   116f2: 55555837     	lui	a6, 0x55555
   116f6: 333338b7     	lui	a7, 0x33333
   116fa: 0f0f12b7     	lui	t0, 0xf0f1
   116fe: 01010337     	lui	t1, 0x1010
   11702: 0013de13     	srli	t3, t2, 0x1
   11706: 5558069b     	addiw	a3, a6, 0x555
   1170a: 3338871b     	addiw	a4, a7, 0x333
   1170e: f0f2829b     	addiw	t0, t0, -0xf1
   11712: 1013081b     	addiw	a6, t1, 0x101
   11716: 01c3e8b3     	or	a7, t2, t3
   1171a: 02069793     	slli	a5, a3, 0x20
   1171e: 00f68333     	add	t1, a3, a5
   11722: 02071793     	slli	a5, a4, 0x20
   11726: 973e         	add	a4, a4, a5
   11728: 02029793     	slli	a5, t0, 0x20
   1172c: 92be         	add	t0, t0, a5
   1172e: 02081793     	slli	a5, a6, 0x20
   11732: 983e         	add	a6, a6, a5
   11734: 0028d793     	srli	a5, a7, 0x2
   11738: 00f8e6b3     	or	a3, a7, a5
   1173c: 0046d793     	srli	a5, a3, 0x4
   11740: 8edd         	or	a3, a3, a5
   11742: 0086d793     	srli	a5, a3, 0x8
   11746: 8edd         	or	a3, a3, a5
   11748: 0106d793     	srli	a5, a3, 0x10
   1174c: 8edd         	or	a3, a3, a5
   1174e: 0206d793     	srli	a5, a3, 0x20
   11752: 8edd         	or	a3, a3, a5
   11754: fff6c693     	not	a3, a3
   11758: 0016d793     	srli	a5, a3, 0x1
   1175c: 0067f7b3     	and	a5, a5, t1
   11760: 8e9d         	sub	a3, a3, a5
   11762: 00e6f7b3     	and	a5, a3, a4
   11766: 8289         	srli	a3, a3, 0x2
   11768: 8ef9         	and	a3, a3, a4
   1176a: 96be         	add	a3, a3, a5
   1176c: 0046d713     	srli	a4, a3, 0x4
   11770: 96ba         	add	a3, a3, a4
   11772: 0056f6b3     	and	a3, a3, t0
   11776: 030686b3     	mul	a3, a3, a6
   1177a: 92e1         	srli	a3, a3, 0x38
   1177c: 577d         	li	a4, -0x1
   1177e: 00d756b3     	srl	a3, a4, a3
   11782: 0685         	addi	a3, a3, 0x1
   11784: 00b6e363     	bltu	a3, a1, 0x1178a <_ZN22buddy_system_allocator4Heap5alloc17h36cc6c43d9a86a56E+0xb2>
   11788: 85b6         	mv	a1, a3
   1178a: 46a1         	li	a3, 0x8
   1178c: 00b6e363     	bltu	a3, a1, 0x11792 <.Lpcrel_hi42>
   11790: 45a1         	li	a1, 0x8

0000000000011792 <.Lpcrel_hi42>:
   11792: 00003697     	auipc	a3, 0x3
   11796: 89e6b683     	ld	a3, -0x762(a3)
   1179a: 40b00733     	neg	a4, a1

000000000001179e <.Lpcrel_hi43>:
   1179e: 00003797     	auipc	a5, 0x3
   117a2: 8f6d         	and	a4, a4, a1
   117a4: 02d706b3     	mul	a3, a4, a3
   117a8: 92e9         	srli	a3, a3, 0x3a
   117aa: 05a78713     	addi	a4, a5, 0x5a
   117ae: 96ba         	add	a3, a3, a4
   117b0: 0006c883     	lbu	a7, 0x0(a3)
   117b4: 02000693     	li	a3, 0x20
   117b8: 82c6         	mv	t0, a7
   117ba: 0116e463     	bltu	a3, a7, 0x117c2 <.Lpcrel_hi43+0x24>
   117be: 02000293     	li	t0, 0x20
   117c2: 00389813     	slli	a6, a7, 0x3
   117c6: 982a         	add	a6, a6, a0
   117c8: ff080793     	addi	a5, a6, -0x10
   117cc: 8746         	mv	a4, a7
   117ce: 06e28d63     	beq	t0, a4, 0x11848 <.Lpcrel_hi43+0xaa>
   117d2: 0107be03     	ld	t3, 0x10(a5)
   117d6: 0705         	addi	a4, a4, 0x1
   117d8: 07a1         	addi	a5, a5, 0x8
   117da: fe0e0ae3     	beqz	t3, 0x117ce <.Lpcrel_hi43+0x30>
   117de: fff70693     	addi	a3, a4, -0x1
   117e2: 02d8fb63     	bgeu	a7, a3, 0x11818 <.Lpcrel_hi43+0x7a>
   117e6: 000e3383     	ld	t2, 0x0(t3)
   117ea: 00188293     	addi	t0, a7, 0x1
   117ee: 4305         	li	t1, 0x1
   117f0: fff70693     	addi	a3, a4, -0x1
   117f4: 0077b423     	sd	t2, 0x8(a5)
   117f8: 0007be83     	ld	t4, 0x0(a5)
   117fc: 1779         	addi	a4, a4, -0x2
   117fe: 00e313b3     	sll	t2, t1, a4
   11802: 93f2         	add	t2, t2, t3
   11804: 01d3b023     	sd	t4, 0x0(t2)
   11808: 007e3023     	sd	t2, 0x0(t3)
   1180c: 01c7b023     	sd	t3, 0x0(a5)
   11810: 17e1         	addi	a5, a5, -0x8
   11812: 8736         	mv	a4, a3
   11814: fcd2eee3     	bltu	t0, a3, 0x117f0 <.Lpcrel_hi43+0x52>
   11818: 46fd         	li	a3, 0x1f
   1181a: 0316ec63     	bltu	a3, a7, 0x11852 <.Lpcrel_hi44>
   1181e: 00083683     	ld	a3, 0x0(a6)
   11822: c2b9         	beqz	a3, 0x11868 <.Lpcrel_hi45>
   11824: 6298         	ld	a4, 0x0(a3)
   11826: 00e83023     	sd	a4, 0x0(a6)
   1182a: 10053703     	ld	a4, 0x100(a0)
   1182e: 10853783     	ld	a5, 0x108(a0)
   11832: 963a         	add	a2, a2, a4
   11834: 95be         	add	a1, a1, a5
   11836: 10c53023     	sd	a2, 0x100(a0)
   1183a: 10b53423     	sd	a1, 0x108(a0)
   1183e: 8536         	mv	a0, a3
   11840: 60a2         	ld	ra, 0x8(sp)
   11842: 6402         	ld	s0, 0x0(sp)
   11844: 0141         	addi	sp, sp, 0x10
   11846: 8082         	ret
   11848: 4501         	li	a0, 0x0
   1184a: 60a2         	ld	ra, 0x8(sp)
   1184c: 6402         	ld	s0, 0x0(sp)
   1184e: 0141         	addi	sp, sp, 0x10
   11850: 8082         	ret

0000000000011852 <.Lpcrel_hi44>:
   11852: 00003517     	auipc	a0, 0x3
   11856: 10e50613     	addi	a2, a0, 0x10e
   1185a: 02000593     	li	a1, 0x20
   1185e: 8546         	mv	a0, a7
   11860: 00000097     	auipc	ra, 0x0
   11864: 432080e7     	jalr	0x432(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

0000000000011868 <.Lpcrel_hi45>:
   11868: 00003517     	auipc	a0, 0x3

000000000001186c <.Lpcrel_hi46>:
   1186c: 00003597     	auipc	a1, 0x3
   11870: 0d050513     	addi	a0, a0, 0xd0
   11874: 10c58613     	addi	a2, a1, 0x10c
   11878: 02800593     	li	a1, 0x28
   1187c: 00000097     	auipc	ra, 0x0
   11880: 366080e7     	jalr	0x366(ra) <_ZN4core6option13expect_failed17h1d5b872aa120ef4dE>

0000000000011884 <_ZN22buddy_system_allocator4Heap7dealloc17h804bc78107026547E>:
   11884: 1141         	addi	sp, sp, -0x10
   11886: e406         	sd	ra, 0x8(sp)
   11888: e022         	sd	s0, 0x0(sp)
   1188a: 0800         	addi	s0, sp, 0x10
   1188c: 4709         	li	a4, 0x2
   1188e: 00e6f663     	bgeu	a3, a4, 0x1189a <_ZN22buddy_system_allocator4Heap7dealloc17h804bc78107026547E+0x16>
   11892: 4705         	li	a4, 0x1
   11894: 0ac77163     	bgeu	a4, a2, 0x11936 <_ZN22buddy_system_allocator4Heap7dealloc17h804bc78107026547E+0xb2>
   11898: a045         	j	0x11938 <_ZN22buddy_system_allocator4Heap7dealloc17h804bc78107026547E+0xb4>
   1189a: fff68393     	addi	t2, a3, -0x1
   1189e: 55555837     	lui	a6, 0x55555
   118a2: 333338b7     	lui	a7, 0x33333
   118a6: 0f0f12b7     	lui	t0, 0xf0f1
   118aa: 01010337     	lui	t1, 0x1010
   118ae: 0013de13     	srli	t3, t2, 0x1
   118b2: 5558071b     	addiw	a4, a6, 0x555
   118b6: 33388e9b     	addiw	t4, a7, 0x333
   118ba: f0f2881b     	addiw	a6, t0, -0xf1
   118be: 1013089b     	addiw	a7, t1, 0x101
   118c2: 01c3e2b3     	or	t0, t2, t3
   118c6: 02071793     	slli	a5, a4, 0x20
   118ca: 00f70333     	add	t1, a4, a5
   118ce: 020e9793     	slli	a5, t4, 0x20
   118d2: 9ebe         	add	t4, t4, a5
   118d4: 02081713     	slli	a4, a6, 0x20
   118d8: 983a         	add	a6, a6, a4
   118da: 02089713     	slli	a4, a7, 0x20
   118de: 98ba         	add	a7, a7, a4
   118e0: 0022d713     	srli	a4, t0, 0x2
   118e4: 00e2e7b3     	or	a5, t0, a4
   118e8: 0047d713     	srli	a4, a5, 0x4
   118ec: 8f5d         	or	a4, a4, a5
   118ee: 00875793     	srli	a5, a4, 0x8
   118f2: 8f5d         	or	a4, a4, a5
   118f4: 01075793     	srli	a5, a4, 0x10
   118f8: 8f5d         	or	a4, a4, a5
   118fa: 02075793     	srli	a5, a4, 0x20
   118fe: 8f5d         	or	a4, a4, a5
   11900: fff74713     	not	a4, a4
   11904: 00175793     	srli	a5, a4, 0x1
   11908: 0067f7b3     	and	a5, a5, t1
   1190c: 8f1d         	sub	a4, a4, a5
   1190e: 01d777b3     	and	a5, a4, t4
   11912: 8309         	srli	a4, a4, 0x2
   11914: 01d77733     	and	a4, a4, t4
   11918: 973e         	add	a4, a4, a5
   1191a: 00475793     	srli	a5, a4, 0x4
   1191e: 973e         	add	a4, a4, a5
   11920: 01077733     	and	a4, a4, a6
   11924: 03170733     	mul	a4, a4, a7
   11928: 9361         	srli	a4, a4, 0x38
   1192a: 57fd         	li	a5, -0x1
   1192c: 00e7d733     	srl	a4, a5, a4
   11930: 0705         	addi	a4, a4, 0x1
   11932: 00c76363     	bltu	a4, a2, 0x11938 <_ZN22buddy_system_allocator4Heap7dealloc17h804bc78107026547E+0xb4>
   11936: 863a         	mv	a2, a4
   11938: 4721         	li	a4, 0x8
   1193a: 00c76363     	bltu	a4, a2, 0x11940 <.Lpcrel_hi47>
   1193e: 4621         	li	a2, 0x8

0000000000011940 <.Lpcrel_hi47>:
   11940: 00002717     	auipc	a4, 0x2
   11944: 6f073703     	ld	a4, 0x6f0(a4)
   11948: 40c007b3     	neg	a5, a2
   1194c: 8ff1         	and	a5, a5, a2
   1194e: 02e78733     	mul	a4, a5, a4

0000000000011952 <.Lpcrel_hi48>:
   11952: 00003797     	auipc	a5, 0x3
   11956: 9369         	srli	a4, a4, 0x3a
   11958: ee678793     	addi	a5, a5, -0x11a
   1195c: 973e         	add	a4, a4, a5
   1195e: 00074383     	lbu	t2, 0x0(a4)
   11962: 48fd         	li	a7, 0x1f
   11964: 0a78e763     	bltu	a7, t2, 0x11a12 <.Lpcrel_hi49>
   11968: 00339713     	slli	a4, t2, 0x3
   1196c: 4805         	li	a6, 0x1
   1196e: 972a         	add	a4, a4, a0
   11970: 631c         	ld	a5, 0x0(a4)
   11972: 00781333     	sll	t1, a6, t2
   11976: e30c         	sd	a1, 0x0(a4)
   11978: 00b34eb3     	xor	t4, t1, a1
   1197c: e19c         	sd	a5, 0x0(a1)
   1197e: 4809         	li	a6, 0x2
   11980: 82ae         	mv	t0, a1
   11982: 00339e13     	slli	t3, t2, 0x3
   11986: 9e2a         	add	t3, t3, a0
   11988: 8772         	mv	a4, t3
   1198a: 00be8863     	beq	t4, a1, 0x1199a <.Lpcrel_hi48+0x48>
   1198e: cba1         	beqz	a5, 0x119de <.Lpcrel_hi48+0x8c>
   11990: 872e         	mv	a4, a1
   11992: 85be         	mv	a1, a5
   11994: 639c         	ld	a5, 0x0(a5)
   11996: febe9ce3     	bne	t4, a1, 0x1198e <.Lpcrel_hi48+0x3c>
   1199a: e31c         	sd	a5, 0x0(a4)
   1199c: 000e3583     	ld	a1, 0x0(t3)
   119a0: c581         	beqz	a1, 0x119a8 <.Lpcrel_hi48+0x56>
   119a2: 618c         	ld	a1, 0x0(a1)
   119a4: 00be3023     	sd	a1, 0x0(t3)
   119a8: 05138963     	beq	t2, a7, 0x119fa <.Lpcrel_hi50>
   119ac: fff34593     	not	a1, t1
   119b0: 00138e13     	addi	t3, t2, 0x1
   119b4: 003e1793     	slli	a5, t3, 0x3
   119b8: 00f50733     	add	a4, a0, a5
   119bc: 631c         	ld	a5, 0x0(a4)
   119be: 00781333     	sll	t1, a6, t2
   119c2: 00b2f5b3     	and	a1, t0, a1
   119c6: e30c         	sd	a1, 0x0(a4)
   119c8: e19c         	sd	a5, 0x0(a1)
   119ca: 00b34eb3     	xor	t4, t1, a1
   119ce: 82ae         	mv	t0, a1
   119d0: 83f2         	mv	t2, t3
   119d2: 0e0e         	slli	t3, t3, 0x3
   119d4: 9e2a         	add	t3, t3, a0
   119d6: 8772         	mv	a4, t3
   119d8: fabe9be3     	bne	t4, a1, 0x1198e <.Lpcrel_hi48+0x3c>
   119dc: bf7d         	j	0x1199a <.Lpcrel_hi48+0x48>
   119de: 10053583     	ld	a1, 0x100(a0)
   119e2: 10853703     	ld	a4, 0x108(a0)
   119e6: 8d95         	sub	a1, a1, a3
   119e8: 8f11         	sub	a4, a4, a2
   119ea: 10b53023     	sd	a1, 0x100(a0)
   119ee: 10e53423     	sd	a4, 0x108(a0)
   119f2: 60a2         	ld	ra, 0x8(sp)
   119f4: 6402         	ld	s0, 0x0(sp)
   119f6: 0141         	addi	sp, sp, 0x10
   119f8: 8082         	ret

00000000000119fa <.Lpcrel_hi50>:
   119fa: 00003597     	auipc	a1, 0x3
   119fe: 02000513     	li	a0, 0x20
   11a02: fae58613     	addi	a2, a1, -0x52
   11a06: 02000593     	li	a1, 0x20
   11a0a: 00000097     	auipc	ra, 0x0
   11a0e: 288080e7     	jalr	0x288(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

0000000000011a12 <.Lpcrel_hi49>:
   11a12: 00003517     	auipc	a0, 0x3
   11a16: f7e50613     	addi	a2, a0, -0x82
   11a1a: 02000593     	li	a1, 0x20
   11a1e: 851e         	mv	a0, t2
   11a20: 00000097     	auipc	ra, 0x0
   11a24: 272080e7     	jalr	0x272(ra) <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>

0000000000011a28 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17ha0e0f697851c23bcE>:
   11a28: 1101         	addi	sp, sp, -0x20
   11a2a: ec06         	sd	ra, 0x18(sp)
   11a2c: e822         	sd	s0, 0x10(sp)
   11a2e: e426         	sd	s1, 0x8(sp)
   11a30: e04a         	sd	s2, 0x0(sp)
   11a32: 1000         	addi	s0, sp, 0x20
   11a34: 84aa         	mv	s1, a0
   11a36: 4505         	li	a0, 0x1
   11a38: 00a4b92f     	amoadd.d	s2, a0, (s1)
   11a3c: 6488         	ld	a0, 0x8(s1)
   11a3e: 0230000f     	fence	r, rw
   11a42: 01250963     	beq	a0, s2, 0x11a54 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17ha0e0f697851c23bcE+0x2c>
   11a46: 0100000f     	fence	w, 0
   11a4a: 6488         	ld	a0, 0x8(s1)
   11a4c: 0230000f     	fence	r, rw
   11a50: ff251be3     	bne	a0, s2, 0x11a46 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$5alloc17ha0e0f697851c23bcE+0x1e>
   11a54: 01048513     	addi	a0, s1, 0x10
   11a58: 00000097     	auipc	ra, 0x0
   11a5c: c80080e7     	jalr	-0x380(ra) <_ZN22buddy_system_allocator4Heap5alloc17h36cc6c43d9a86a56E>
   11a60: 0905         	addi	s2, s2, 0x1
   11a62: 0310000f     	fence	rw, w
   11a66: 0124b423     	sd	s2, 0x8(s1)
   11a6a: 60e2         	ld	ra, 0x18(sp)
   11a6c: 6442         	ld	s0, 0x10(sp)
   11a6e: 64a2         	ld	s1, 0x8(sp)
   11a70: 6902         	ld	s2, 0x0(sp)
   11a72: 6105         	addi	sp, sp, 0x20
   11a74: 8082         	ret

0000000000011a76 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$7dealloc17h724503898ea03b8eE>:
   11a76: 1101         	addi	sp, sp, -0x20
   11a78: ec06         	sd	ra, 0x18(sp)
   11a7a: e822         	sd	s0, 0x10(sp)
   11a7c: e426         	sd	s1, 0x8(sp)
   11a7e: e04a         	sd	s2, 0x0(sp)
   11a80: 1000         	addi	s0, sp, 0x20
   11a82: 84aa         	mv	s1, a0
   11a84: 4505         	li	a0, 0x1
   11a86: 00a4b92f     	amoadd.d	s2, a0, (s1)
   11a8a: 6488         	ld	a0, 0x8(s1)
   11a8c: 0230000f     	fence	r, rw
   11a90: 01250963     	beq	a0, s2, 0x11aa2 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$7dealloc17h724503898ea03b8eE+0x2c>
   11a94: 0100000f     	fence	w, 0
   11a98: 6488         	ld	a0, 0x8(s1)
   11a9a: 0230000f     	fence	r, rw
   11a9e: ff251be3     	bne	a0, s2, 0x11a94 <_ZN87_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..alloc..global..GlobalAlloc$GT$7dealloc17h724503898ea03b8eE+0x1e>
   11aa2: 01048513     	addi	a0, s1, 0x10
   11aa6: 00000097     	auipc	ra, 0x0
   11aaa: dde080e7     	jalr	-0x222(ra) <_ZN22buddy_system_allocator4Heap7dealloc17h804bc78107026547E>
   11aae: 0905         	addi	s2, s2, 0x1
   11ab0: 0310000f     	fence	rw, w
   11ab4: 0124b423     	sd	s2, 0x8(s1)
   11ab8: 60e2         	ld	ra, 0x18(sp)
   11aba: 6442         	ld	s0, 0x10(sp)
   11abc: 64a2         	ld	s1, 0x8(sp)
   11abe: 6902         	ld	s2, 0x0(sp)
   11ac0: 6105         	addi	sp, sp, 0x20
   11ac2: 8082         	ret

0000000000011ac4 <_ZN5alloc7raw_vec17capacity_overflow17hcd5202a6de8001beE>:
   11ac4: 7139         	addi	sp, sp, -0x40
   11ac6: fc06         	sd	ra, 0x38(sp)
   11ac8: f822         	sd	s0, 0x30(sp)
   11aca: 0080         	addi	s0, sp, 0x40
   11acc: 85aa         	mv	a1, a0

0000000000011ace <.Lpcrel_hi9>:
   11ace: 00003517     	auipc	a0, 0x3
   11ad2: 4605         	li	a2, 0x1
   11ad4: fe043023     	sd	zero, -0x20(s0)
   11ad8: 46a1         	li	a3, 0x8
   11ada: f0a50513     	addi	a0, a0, -0xf6
   11ade: fca43023     	sd	a0, -0x40(s0)
   11ae2: fcc43423     	sd	a2, -0x38(s0)
   11ae6: fcd43823     	sd	a3, -0x30(s0)
   11aea: fc043c23     	sd	zero, -0x28(s0)
   11aee: fc040513     	addi	a0, s0, -0x40
   11af2: 00000097     	auipc	ra, 0x0
   11af6: 144080e7     	jalr	0x144(ra) <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>

0000000000011afa <_ZN5alloc7raw_vec12handle_error17h4c159b224947bec3E>:
   11afa: 1141         	addi	sp, sp, -0x10
   11afc: e406         	sd	ra, 0x8(sp)
   11afe: e022         	sd	s0, 0x0(sp)
   11b00: 0800         	addi	s0, sp, 0x10
   11b02: e511         	bnez	a0, 0x11b0e <_ZN5alloc7raw_vec12handle_error17h4c159b224947bec3E+0x14>
   11b04: 8532         	mv	a0, a2
   11b06: 00000097     	auipc	ra, 0x0
   11b0a: fbe080e7     	jalr	-0x42(ra) <_ZN5alloc7raw_vec17capacity_overflow17hcd5202a6de8001beE>
   11b0e: 00000097     	auipc	ra, 0x0
   11b12: 008080e7     	jalr	0x8(ra) <_ZN5alloc5alloc18handle_alloc_error17h5c66199385a0ad1bE>

0000000000011b16 <_ZN5alloc5alloc18handle_alloc_error17h5c66199385a0ad1bE>:
   11b16: 1141         	addi	sp, sp, -0x10
   11b18: e406         	sd	ra, 0x8(sp)
   11b1a: e022         	sd	s0, 0x0(sp)
   11b1c: 0800         	addi	s0, sp, 0x10
   11b1e: 862a         	mv	a2, a0
   11b20: 852e         	mv	a0, a1
   11b22: 85b2         	mv	a1, a2
   11b24: ffffe097     	auipc	ra, 0xffffe
   11b28: 682080e7     	jalr	0x682(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff3186>

0000000000011b2c <_ZN68_$LT$core..ptr..alignment..Alignment$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9c9e1fbca3327e3E>:
   11b2c: 7159         	addi	sp, sp, -0x70
   11b2e: f486         	sd	ra, 0x68(sp)
   11b30: f0a2         	sd	s0, 0x60(sp)
   11b32: 1880         	addi	s0, sp, 0x70
   11b34: 6108         	ld	a0, 0x0(a0)

0000000000011b36 <.Lpcrel_hi200>:
   11b36: 00002617     	auipc	a2, 0x2

0000000000011b3a <.Lpcrel_hi201>:
   11b3a: 00003297     	auipc	t0, 0x3
   11b3e: fe040813     	addi	a6, s0, -0x20

0000000000011b42 <.Lpcrel_hi202>:
   11b42: 00001797     	auipc	a5, 0x1
   11b46: fec40893     	addi	a7, s0, -0x14

0000000000011b4a <.Lpcrel_hi203>:
   11b4a: 00001717     	auipc	a4, 0x1

0000000000011b4e <.Lpcrel_hi204>:
   11b4e: 00003697     	auipc	a3, 0x3
   11b52: 4fa63603     	ld	a2, 0x4fa(a2)
   11b56: 3ba78793     	addi	a5, a5, 0x3ba
   11b5a: 61e70713     	addi	a4, a4, 0x61e
   11b5e: fd043023     	sd	a6, -0x40(s0)
   11b62: fcf43423     	sd	a5, -0x38(s0)
   11b66: fd143823     	sd	a7, -0x30(s0)
   11b6a: fce43c23     	sd	a4, -0x28(s0)
   11b6e: 40a00733     	neg	a4, a0
   11b72: 8f69         	and	a4, a4, a0
   11b74: 02c70633     	mul	a2, a4, a2
   11b78: 480d         	li	a6, 0x3
   11b7a: fa043823     	sd	zero, -0x50(s0)
   11b7e: eae28793     	addi	a5, t0, -0x152
   11b82: 9269         	srli	a2, a2, 0x3a
   11b84: 963e         	add	a2, a2, a5
   11b86: 00064603     	lbu	a2, 0x0(a2)
   11b8a: fc040793     	addi	a5, s0, -0x40
   11b8e: fea43023     	sd	a0, -0x20(s0)
   11b92: 4709         	li	a4, 0x2
   11b94: fec42623     	sw	a2, -0x14(s0)
   11b98: 7988         	ld	a0, 0x30(a1)
   11b9a: 7d8c         	ld	a1, 0x38(a1)
   11b9c: ee268613     	addi	a2, a3, -0x11e
   11ba0: f8c43823     	sd	a2, -0x70(s0)
   11ba4: f9043c23     	sd	a6, -0x68(s0)
   11ba8: faf43023     	sd	a5, -0x60(s0)
   11bac: fae43423     	sd	a4, -0x58(s0)
   11bb0: f9040613     	addi	a2, s0, -0x70
   11bb4: 00000097     	auipc	ra, 0x0
   11bb8: 73c080e7     	jalr	0x73c(ra) <_ZN4core3fmt5write17h7ce9e976de62bebaE>
   11bbc: 70a6         	ld	ra, 0x68(sp)
   11bbe: 7406         	ld	s0, 0x60(sp)
   11bc0: 6165         	addi	sp, sp, 0x70
   11bc2: 8082         	ret

0000000000011bc4 <_ZN4core6option13unwrap_failed17h521714a0f82b5c0dE>:
   11bc4: 1141         	addi	sp, sp, -0x10
   11bc6: e406         	sd	ra, 0x8(sp)
   11bc8: e022         	sd	s0, 0x0(sp)
   11bca: 0800         	addi	s0, sp, 0x10
   11bcc: 862a         	mv	a2, a0

0000000000011bce <.Lpcrel_hi346>:
   11bce: 00003517     	auipc	a0, 0x3
   11bd2: ec250513     	addi	a0, a0, -0x13e
   11bd6: 02b00593     	li	a1, 0x2b
   11bda: 00000097     	auipc	ra, 0x0
   11bde: 07e080e7     	jalr	0x7e(ra) <_ZN4core9panicking5panic17h8d5ae4408e8894d1E>

0000000000011be2 <_ZN4core6option13expect_failed17h1d5b872aa120ef4dE>:
   11be2: 711d         	addi	sp, sp, -0x60
   11be4: ec86         	sd	ra, 0x58(sp)
   11be6: e8a2         	sd	s0, 0x50(sp)
   11be8: 1080         	addi	s0, sp, 0x60
   11bea: faa43023     	sd	a0, -0x60(s0)
   11bee: fab43423     	sd	a1, -0x58(s0)
   11bf2: fa040513     	addi	a0, s0, -0x60

0000000000011bf6 <.Lpcrel_hi347>:
   11bf6: 00002597     	auipc	a1, 0x2

0000000000011bfa <.Lpcrel_hi348>:
   11bfa: 00003697     	auipc	a3, 0x3
   11bfe: 4705         	li	a4, 0x1
   11c00: fc043823     	sd	zero, -0x30(s0)
   11c04: abc58593     	addi	a1, a1, -0x544
   11c08: fea43023     	sd	a0, -0x20(s0)
   11c0c: feb43423     	sd	a1, -0x18(s0)
   11c10: fe040513     	addi	a0, s0, -0x20
   11c14: e7668593     	addi	a1, a3, -0x18a
   11c18: fab43823     	sd	a1, -0x50(s0)
   11c1c: fae43c23     	sd	a4, -0x48(s0)
   11c20: fca43023     	sd	a0, -0x40(s0)
   11c24: fce43423     	sd	a4, -0x38(s0)
   11c28: fb040513     	addi	a0, s0, -0x50
   11c2c: 85b2         	mv	a1, a2
   11c2e: 00000097     	auipc	ra, 0x0
   11c32: 008080e7     	jalr	0x8(ra) <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>

0000000000011c36 <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>:
   11c36: 7179         	addi	sp, sp, -0x30
   11c38: f406         	sd	ra, 0x28(sp)
   11c3a: f022         	sd	s0, 0x20(sp)
   11c3c: 1800         	addi	s0, sp, 0x30
   11c3e: 4605         	li	a2, 0x1
   11c40: fca43c23     	sd	a0, -0x28(s0)
   11c44: feb43023     	sd	a1, -0x20(s0)
   11c48: fec41423     	sh	a2, -0x18(s0)
   11c4c: fd840513     	addi	a0, s0, -0x28
   11c50: 00000097     	auipc	ra, 0x0
   11c54: 85a080e7     	jalr	-0x7a6(ra) <rust_begin_unwind>

0000000000011c58 <_ZN4core9panicking5panic17h8d5ae4408e8894d1E>:
   11c58: 715d         	addi	sp, sp, -0x50
   11c5a: e486         	sd	ra, 0x48(sp)
   11c5c: e0a2         	sd	s0, 0x40(sp)
   11c5e: 0880         	addi	s0, sp, 0x50
   11c60: fea43023     	sd	a0, -0x20(s0)
   11c64: feb43423     	sd	a1, -0x18(s0)
   11c68: fe040513     	addi	a0, s0, -0x20
   11c6c: 4585         	li	a1, 0x1
   11c6e: fc043823     	sd	zero, -0x30(s0)
   11c72: 46a1         	li	a3, 0x8
   11c74: faa43823     	sd	a0, -0x50(s0)
   11c78: fab43c23     	sd	a1, -0x48(s0)
   11c7c: fcd43023     	sd	a3, -0x40(s0)
   11c80: fc043423     	sd	zero, -0x38(s0)
   11c84: fb040513     	addi	a0, s0, -0x50
   11c88: 85b2         	mv	a1, a2
   11c8a: 00000097     	auipc	ra, 0x0
   11c8e: fac080e7     	jalr	-0x54(ra) <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>

0000000000011c92 <_ZN4core9panicking18panic_bounds_check17he95e13aadc91e05fE>:
   11c92: 7159         	addi	sp, sp, -0x70
   11c94: f486         	sd	ra, 0x68(sp)
   11c96: f0a2         	sd	s0, 0x60(sp)
   11c98: 1880         	addi	s0, sp, 0x70
   11c9a: f8a43823     	sd	a0, -0x70(s0)
   11c9e: f8b43c23     	sd	a1, -0x68(s0)
   11ca2: f9840513     	addi	a0, s0, -0x68

0000000000011ca6 <.Lpcrel_hi359>:
   11ca6: 00001597     	auipc	a1, 0x1
   11caa: f9040693     	addi	a3, s0, -0x70

0000000000011cae <.Lpcrel_hi360>:
   11cae: 00003717     	auipc	a4, 0x3
   11cb2: 4789         	li	a5, 0x2
   11cb4: fc043023     	sd	zero, -0x40(s0)
   11cb8: 7c258593     	addi	a1, a1, 0x7c2
   11cbc: fca43823     	sd	a0, -0x30(s0)
   11cc0: fcb43c23     	sd	a1, -0x28(s0)
   11cc4: fed43023     	sd	a3, -0x20(s0)
   11cc8: f0040693     	addi	a3, s0, -0x100
   11ccc: f6ec         	sd	a1, 0xe8(a3)
   11cce: fd040513     	addi	a0, s0, -0x30
   11cd2: e2270593     	addi	a1, a4, -0x1de
   11cd6: f2cc         	sd	a1, 0xa0(a3)
   11cd8: f6dc         	sd	a5, 0xa8(a3)
   11cda: fac8         	sd	a0, 0xb0(a3)
   11cdc: fedc         	sd	a5, 0xb8(a3)
   11cde: fa040513     	addi	a0, s0, -0x60
   11ce2: 85b2         	mv	a1, a2
   11ce4: 00000097     	auipc	ra, 0x0
   11ce8: f52080e7     	jalr	-0xae(ra) <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>

0000000000011cec <_ZN4core9panicking13assert_failed17hfb22785cb78c4079E>:
   11cec: 1101         	addi	sp, sp, -0x20
   11cee: ec06         	sd	ra, 0x18(sp)
   11cf0: e822         	sd	s0, 0x10(sp)
   11cf2: 1000         	addi	s0, sp, 0x20
   11cf4: 883a         	mv	a6, a4
   11cf6: 87b6         	mv	a5, a3
   11cf8: feb43023     	sd	a1, -0x20(s0)
   11cfc: fec43423     	sd	a2, -0x18(s0)

0000000000011d00 <.Lpcrel_hi370>:
   11d00: 00003617     	auipc	a2, 0x3
   11d04: fe040593     	addi	a1, s0, -0x20
   11d08: df060613     	addi	a2, a2, -0x210
   11d0c: fe840693     	addi	a3, s0, -0x18
   11d10: 8732         	mv	a4, a2
   11d12: 00000097     	auipc	ra, 0x0
   11d16: 008080e7     	jalr	0x8(ra) <_ZN4core9panicking19assert_failed_inner17h7ffc70a96b4184d5E>

0000000000011d1a <_ZN4core9panicking19assert_failed_inner17h7ffc70a96b4184d5E>:
   11d1a: 7151         	addi	sp, sp, -0xf0
   11d1c: f586         	sd	ra, 0xe8(sp)
   11d1e: f1a2         	sd	s0, 0xe0(sp)
   11d20: eda6         	sd	s1, 0xd8(sp)
   11d22: e9ca         	sd	s2, 0xd0(sp)
   11d24: 1980         	addi	s0, sp, 0xf0
   11d26: 84c2         	mv	s1, a6
   11d28: f0b43823     	sd	a1, -0xf0(s0)
   11d2c: f0c43c23     	sd	a2, -0xe8(s0)
   11d30: 050e         	slli	a0, a0, 0x3

0000000000011d32 <.Lpcrel_hi371>:
   11d32: 00003597     	auipc	a1, 0x3

0000000000011d36 <.Lpcrel_hi372>:
   11d36: 00003617     	auipc	a2, 0x3
   11d3a: 0c658593     	addi	a1, a1, 0xc6
   11d3e: 0da60613     	addi	a2, a2, 0xda
   11d42: 95aa         	add	a1, a1, a0
   11d44: 9532         	add	a0, a0, a2
   11d46: 6390         	ld	a2, 0x0(a5)
   11d48: 618c         	ld	a1, 0x0(a1)
   11d4a: 6108         	ld	a0, 0x0(a0)
   11d4c: f2d43023     	sd	a3, -0xe0(s0)
   11d50: f0040693     	addi	a3, s0, -0x100
   11d54: f698         	sd	a4, 0x28(a3)
   11d56: fa8c         	sd	a1, 0x30(a3)
   11d58: fe88         	sd	a0, 0x38(a3)
   11d5a: e239         	bnez	a2, 0x11da0 <.Lpcrel_hi375+0x30>
   11d5c: f3040813     	addi	a6, s0, -0xd0

0000000000011d60 <.Lpcrel_hi373>:
   11d60: 00002597     	auipc	a1, 0x2
   11d64: f1040613     	addi	a2, s0, -0xf0

0000000000011d68 <.Lpcrel_hi374>:
   11d68: 00002697     	auipc	a3, 0x2
   11d6c: f2040713     	addi	a4, s0, -0xe0

0000000000011d70 <.Lpcrel_hi375>:
   11d70: 00003797     	auipc	a5, 0x3
   11d74: 450d         	li	a0, 0x3
   11d76: fc043823     	sd	zero, -0x30(s0)
   11d7a: 95258593     	addi	a1, a1, -0x6ae
   11d7e: 93468693     	addi	a3, a3, -0x6cc
   11d82: f7043823     	sd	a6, -0x90(s0)
   11d86: f6b43c23     	sd	a1, -0x88(s0)
   11d8a: f0040593     	addi	a1, s0, -0x100
   11d8e: e1d0         	sd	a2, 0x80(a1)
   11d90: e5d4         	sd	a3, 0x88(a1)
   11d92: e9d8         	sd	a4, 0x90(a1)
   11d94: edd4         	sd	a3, 0x98(a1)
   11d96: f7040593     	addi	a1, s0, -0x90
   11d9a: dd078613     	addi	a2, a5, -0x230
   11d9e: a0b5         	j	0x11e0a <.Lpcrel_hi379+0x3c>
   11da0: f4040513     	addi	a0, s0, -0xc0
   11da4: 03000613     	li	a2, 0x30
   11da8: f4040913     	addi	s2, s0, -0xc0
   11dac: 85be         	mv	a1, a5
   11dae: 00002097     	auipc	ra, 0x2
   11db2: 922080e7     	jalr	-0x6de(ra) <memcpy>
   11db6: f3040513     	addi	a0, s0, -0xd0

0000000000011dba <.Lpcrel_hi376>:
   11dba: 00002597     	auipc	a1, 0x2

0000000000011dbe <.Lpcrel_hi377>:
   11dbe: 00000617     	auipc	a2, 0x0
   11dc2: f1040813     	addi	a6, s0, -0xf0

0000000000011dc6 <.Lpcrel_hi378>:
   11dc6: 00002717     	auipc	a4, 0x2
   11dca: f2040793     	addi	a5, s0, -0xe0

0000000000011dce <.Lpcrel_hi379>:
   11dce: 00003697     	auipc	a3, 0x3
   11dd2: 8f858593     	addi	a1, a1, -0x708
   11dd6: 51260613     	addi	a2, a2, 0x512
   11dda: f6a43823     	sd	a0, -0x90(s0)
   11dde: f6b43c23     	sd	a1, -0x88(s0)
   11de2: f9243023     	sd	s2, -0x80(s0)
   11de6: f8c43423     	sd	a2, -0x78(s0)
   11dea: 4511         	li	a0, 0x4
   11dec: fc043823     	sd	zero, -0x30(s0)
   11df0: 8d670593     	addi	a1, a4, -0x72a
   11df4: f9043823     	sd	a6, -0x70(s0)
   11df8: f0040613     	addi	a2, s0, -0x100
   11dfc: ee4c         	sd	a1, 0x98(a2)
   11dfe: f25c         	sd	a5, 0xa0(a2)
   11e00: f64c         	sd	a1, 0xa8(a2)
   11e02: f7040593     	addi	a1, s0, -0x90
   11e06: db268613     	addi	a2, a3, -0x24e
   11e0a: f0040693     	addi	a3, s0, -0x100
   11e0e: fad0         	sd	a2, 0xb0(a3)
   11e10: fec8         	sd	a0, 0xb8(a3)
   11e12: e2ec         	sd	a1, 0xc0(a3)
   11e14: e6e8         	sd	a0, 0xc8(a3)
   11e16: fb040513     	addi	a0, s0, -0x50
   11e1a: 85a6         	mv	a1, s1
   11e1c: 00000097     	auipc	ra, 0x0
   11e20: e1a080e7     	jalr	-0x1e6(ra) <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>

0000000000011e24 <_ZN4core6result13unwrap_failed17hce77d3a84c0ed806E>:
   11e24: 7119         	addi	sp, sp, -0x80
   11e26: fc86         	sd	ra, 0x78(sp)
   11e28: f8a2         	sd	s0, 0x70(sp)
   11e2a: 0100         	addi	s0, sp, 0x80
   11e2c: f8a43023     	sd	a0, -0x80(s0)
   11e30: f8b43423     	sd	a1, -0x78(s0)
   11e34: f8c43823     	sd	a2, -0x70(s0)
   11e38: f8d43c23     	sd	a3, -0x68(s0)
   11e3c: f8040813     	addi	a6, s0, -0x80

0000000000011e40 <.Lpcrel_hi380>:
   11e40: 00002597     	auipc	a1, 0x2
   11e44: f9040893     	addi	a7, s0, -0x70

0000000000011e48 <.Lpcrel_hi381>:
   11e48: 00002697     	auipc	a3, 0x2

0000000000011e4c <.Lpcrel_hi382>:
   11e4c: 00003797     	auipc	a5, 0x3
   11e50: 4509         	li	a0, 0x2
   11e52: fc043023     	sd	zero, -0x40(s0)
   11e56: fd040613     	addi	a2, s0, -0x30
   11e5a: 87258593     	addi	a1, a1, -0x78e
   11e5e: 85468693     	addi	a3, a3, -0x7ac
   11e62: d7c78793     	addi	a5, a5, -0x284
   11e66: fd043823     	sd	a6, -0x30(s0)
   11e6a: fcb43c23     	sd	a1, -0x28(s0)
   11e6e: ff143023     	sd	a7, -0x20(s0)
   11e72: fed43423     	sd	a3, -0x18(s0)
   11e76: faf43023     	sd	a5, -0x60(s0)
   11e7a: faa43423     	sd	a0, -0x58(s0)
   11e7e: fac43823     	sd	a2, -0x50(s0)
   11e82: faa43c23     	sd	a0, -0x48(s0)
   11e86: fa040513     	addi	a0, s0, -0x60
   11e8a: 85ba         	mv	a1, a4
   11e8c: 00000097     	auipc	ra, 0x0
   11e90: daa080e7     	jalr	-0x256(ra) <_ZN4core9panicking9panic_fmt17h13e197c4f14c88fbE>

0000000000011e94 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hbed24be56f0a3664E>:
   11e94: 7135         	addi	sp, sp, -0xa0
   11e96: ed06         	sd	ra, 0x98(sp)
   11e98: e922         	sd	s0, 0x90(sp)
   11e9a: e526         	sd	s1, 0x88(sp)
   11e9c: e14a         	sd	s2, 0x80(sp)
   11e9e: fcce         	sd	s3, 0x78(sp)
   11ea0: f8d2         	sd	s4, 0x70(sp)
   11ea2: f4d6         	sd	s5, 0x68(sp)
   11ea4: f0da         	sd	s6, 0x60(sp)
   11ea6: ecde         	sd	s7, 0x58(sp)
   11ea8: e8e2         	sd	s8, 0x50(sp)
   11eaa: e4e6         	sd	s9, 0x48(sp)
   11eac: e0ea         	sd	s10, 0x40(sp)
   11eae: fc6e         	sd	s11, 0x38(sp)
   11eb0: 1100         	addi	s0, sp, 0xa0
   11eb2: 89b2         	mv	s3, a2
   11eb4: 892e         	mv	s2, a1
   11eb6: 4b01         	li	s6, 0x0
   11eb8: 4d81         	li	s11, 0x0
   11eba: 4d01         	li	s10, 0x0
   11ebc: 0a0a15b7     	lui	a1, 0xa0a1

0000000000011ec0 <.Lpcrel_hi386>:
   11ec0: 00002617     	auipc	a2, 0x2
   11ec4: 6104         	ld	s1, 0x0(a0)
   11ec6: 6514         	ld	a3, 0x8(a0)
   11ec8: f8d43423     	sd	a3, -0x78(s0)
   11ecc: 6908         	ld	a0, 0x10(a0)
   11ece: f8a43823     	sd	a0, -0x70(s0)
   11ed2: fff90513     	addi	a0, s2, -0x1
   11ed6: f6a43823     	sd	a0, -0x90(s0)
   11eda: 41300533     	neg	a0, s3
   11ede: f8a43023     	sd	a0, -0x80(s0)

0000000000011ee2 <.Lpcrel_hi387>:
   11ee2: 00002517     	auipc	a0, 0x2
   11ee6: a0a58c9b     	addiw	s9, a1, -0x5f6
   11eea: 16863b83     	ld	s7, 0x168(a2)
   11eee: 2ee50513     	addi	a0, a0, 0x2ee
   11ef2: f6a43c23     	sd	a0, -0x88(s0)
   11ef6: 020c9513     	slli	a0, s9, 0x20
   11efa: 9caa         	add	s9, s9, a0
   11efc: 4a29         	li	s4, 0xa
   11efe: f6943423     	sd	s1, -0x98(s0)
   11f02: a80d         	j	0x11f34 <.Lpcrel_hi387+0x52>
   11f04: f7043503     	ld	a0, -0x90(s0)
   11f08: 9556         	add	a0, a0, s5
   11f0a: 00054503     	lbu	a0, 0x0(a0)
   11f0e: 1559         	addi	a0, a0, -0xa
   11f10: 00153513     	seqz	a0, a0
   11f14: f9043583     	ld	a1, -0x70(s0)
   11f18: 00a58023     	sb	a0, 0x0(a1)
   11f1c: f8843503     	ld	a0, -0x78(s0)
   11f20: 6d14         	ld	a3, 0x18(a0)
   11f22: 41ba8633     	sub	a2, s5, s11
   11f26: 01b905b3     	add	a1, s2, s11
   11f2a: 8526         	mv	a0, s1
   11f2c: 9682         	jalr	a3
   11f2e: 8de2         	mv	s11, s8
   11f30: 14051b63     	bnez	a0, 0x12086 <.Lpcrel_hi388+0xc2>
   11f34: 001d7513     	andi	a0, s10, 0x1
   11f38: 14051563     	bnez	a0, 0x12082 <.Lpcrel_hi388+0xbe>
   11f3c: 0169f963     	bgeu	s3, s6, 0x11f4e <.Lpcrel_hi387+0x6c>
   11f40: 8c5a         	mv	s8, s6
   11f42: 11b99563     	bne	s3, s11, 0x1204c <.Lpcrel_hi388+0x88>
   11f46: aa35         	j	0x12082 <.Lpcrel_hi388+0xbe>
   11f48: 8b62         	mv	s6, s8
   11f4a: 0f89ef63     	bltu	s3, s8, 0x12048 <.Lpcrel_hi388+0x84>
   11f4e: 41698833     	sub	a6, s3, s6
   11f52: 01690533     	add	a0, s2, s6
   11f56: 45bd         	li	a1, 0xf
   11f58: 0305e163     	bltu	a1, a6, 0x11f7a <.Lpcrel_hi387+0x98>
   11f5c: 0f698563     	beq	s3, s6, 0x12046 <.Lpcrel_hi388+0x82>
   11f60: 4581         	li	a1, 0x0
   11f62: f8043603     	ld	a2, -0x80(s0)
   11f66: 965a         	add	a2, a2, s6
   11f68: 00054683     	lbu	a3, 0x0(a0)
   11f6c: 03468c63     	beq	a3, s4, 0x11fa4 <.Lpcrel_hi387+0xc2>
   11f70: 15fd         	addi	a1, a1, -0x1
   11f72: 0505         	addi	a0, a0, 0x1
   11f74: feb61ae3     	bne	a2, a1, 0x11f68 <.Lpcrel_hi387+0x86>
   11f78: a0f9         	j	0x12046 <.Lpcrel_hi388+0x82>
   11f7a: 00750713     	addi	a4, a0, 0x7
   11f7e: 9b61         	andi	a4, a4, -0x8
   11f80: 40a70633     	sub	a2, a4, a0
   11f84: ca0d         	beqz	a2, 0x11fb6 <.Lpcrel_hi387+0xd4>
   11f86: 4681         	li	a3, 0x0
   11f88: 00d505b3     	add	a1, a0, a3
   11f8c: 0005c583     	lbu	a1, 0x0(a1)
   11f90: 01458c63     	beq	a1, s4, 0x11fa8 <.Lpcrel_hi387+0xc6>
   11f94: 0685         	addi	a3, a3, 0x1
   11f96: fed619e3     	bne	a2, a3, 0x11f88 <.Lpcrel_hi387+0xa6>
   11f9a: ff080893     	addi	a7, a6, -0x10
   11f9e: 00c8fe63     	bgeu	a7, a2, 0x11fba <.Lpcrel_hi387+0xd8>
   11fa2: a0b9         	j	0x11ff0 <.Lpcrel_hi388+0x2c>
   11fa4: 40b006b3     	neg	a3, a1
   11fa8: 00db0533     	add	a0, s6, a3
   11fac: 00150c13     	addi	s8, a0, 0x1
   11fb0: f9357ce3     	bgeu	a0, s3, 0x11f48 <.Lpcrel_hi387+0x66>
   11fb4: a895         	j	0x12028 <.Lpcrel_hi388+0x64>
   11fb6: ff080893     	addi	a7, a6, -0x10
   11fba: 45a1         	li	a1, 0x8
   11fbc: 972e         	add	a4, a4, a1
   11fbe: ff873783     	ld	a5, -0x8(a4)
   11fc2: 630c         	ld	a1, 0x0(a4)

0000000000011fc4 <.Lpcrel_hi388>:
   11fc4: 00002497     	auipc	s1, 0x2
   11fc8: 05c4b483     	ld	s1, 0x5c(s1)
   11fcc: 0197c6b3     	xor	a3, a5, s9
   11fd0: 0195c5b3     	xor	a1, a1, s9
   11fd4: 40db86b3     	sub	a3, s7, a3
   11fd8: 8edd         	or	a3, a3, a5
   11fda: 40bb87b3     	sub	a5, s7, a1
   11fde: 8ddd         	or	a1, a1, a5
   11fe0: 8df5         	and	a1, a1, a3
   11fe2: 8de5         	and	a1, a1, s1
   11fe4: 00959663     	bne	a1, s1, 0x11ff0 <.Lpcrel_hi388+0x2c>
   11fe8: 0641         	addi	a2, a2, 0x10
   11fea: 0741         	addi	a4, a4, 0x10
   11fec: fcc8f9e3     	bgeu	a7, a2, 0x11fbe <.Lpcrel_hi387+0xdc>
   11ff0: 08c80463     	beq	a6, a2, 0x12078 <.Lpcrel_hi388+0xb4>
   11ff4: 00c505b3     	add	a1, a0, a2
   11ff8: 40c00533     	neg	a0, a2
   11ffc: f8043603     	ld	a2, -0x80(s0)
   12000: 965a         	add	a2, a2, s6
   12002: f6843483     	ld	s1, -0x98(s0)
   12006: 0005c683     	lbu	a3, 0x0(a1)
   1200a: 01468763     	beq	a3, s4, 0x12018 <.Lpcrel_hi388+0x54>
   1200e: 157d         	addi	a0, a0, -0x1
   12010: 0585         	addi	a1, a1, 0x1
   12012: fea61ae3     	bne	a2, a0, 0x12006 <.Lpcrel_hi388+0x42>
   12016: a805         	j	0x12046 <.Lpcrel_hi388+0x82>
   12018: 40a006b3     	neg	a3, a0
   1201c: 00db0533     	add	a0, s6, a3
   12020: 00150c13     	addi	s8, a0, 0x1
   12024: f33572e3     	bgeu	a0, s3, 0x11f48 <.Lpcrel_hi387+0x66>
   12028: 9b4a         	add	s6, s6, s2
   1202a: 96da         	add	a3, a3, s6
   1202c: 0006c503     	lbu	a0, 0x0(a3)
   12030: f1451ce3     	bne	a0, s4, 0x11f48 <.Lpcrel_hi387+0x66>
   12034: 4d01         	li	s10, 0x0
   12036: 8b62         	mv	s6, s8
   12038: 8ae2         	mv	s5, s8
   1203a: f9043503     	ld	a0, -0x70(s0)
   1203e: 00054503     	lbu	a0, 0x0(a0)
   12042: c51d         	beqz	a0, 0x12070 <.Lpcrel_hi388+0xac>
   12044: a829         	j	0x1205e <.Lpcrel_hi388+0x9a>
   12046: 8c4e         	mv	s8, s3
   12048: 03b98d63     	beq	s3, s11, 0x12082 <.Lpcrel_hi388+0xbe>
   1204c: 4d05         	li	s10, 0x1
   1204e: 8b62         	mv	s6, s8
   12050: 8c6e         	mv	s8, s11
   12052: 8ace         	mv	s5, s3
   12054: f9043503     	ld	a0, -0x70(s0)
   12058: 00054503     	lbu	a0, 0x0(a0)
   1205c: c911         	beqz	a0, 0x12070 <.Lpcrel_hi388+0xac>
   1205e: f8843503     	ld	a0, -0x78(s0)
   12062: 6d14         	ld	a3, 0x18(a0)
   12064: 4611         	li	a2, 0x4
   12066: 8526         	mv	a0, s1
   12068: f7843583     	ld	a1, -0x88(s0)
   1206c: 9682         	jalr	a3
   1206e: ed01         	bnez	a0, 0x12086 <.Lpcrel_hi388+0xc2>
   12070: e9ba9ae3     	bne	s5, s11, 0x11f04 <.Lpcrel_hi387+0x22>
   12074: 4501         	li	a0, 0x0
   12076: bd79         	j	0x11f14 <.Lpcrel_hi387+0x32>
   12078: 8c4e         	mv	s8, s3
   1207a: f6843483     	ld	s1, -0x98(s0)
   1207e: fdb997e3     	bne	s3, s11, 0x1204c <.Lpcrel_hi388+0x88>
   12082: 4501         	li	a0, 0x0
   12084: a011         	j	0x12088 <.Lpcrel_hi388+0xc4>
   12086: 4505         	li	a0, 0x1
   12088: 60ea         	ld	ra, 0x98(sp)
   1208a: 644a         	ld	s0, 0x90(sp)
   1208c: 64aa         	ld	s1, 0x88(sp)
   1208e: 690a         	ld	s2, 0x80(sp)
   12090: 79e6         	ld	s3, 0x78(sp)
   12092: 7a46         	ld	s4, 0x70(sp)
   12094: 7aa6         	ld	s5, 0x68(sp)
   12096: 7b06         	ld	s6, 0x60(sp)
   12098: 6be6         	ld	s7, 0x58(sp)
   1209a: 6c46         	ld	s8, 0x50(sp)
   1209c: 6ca6         	ld	s9, 0x48(sp)
   1209e: 6d06         	ld	s10, 0x40(sp)
   120a0: 7de2         	ld	s11, 0x38(sp)
   120a2: 610d         	addi	sp, sp, 0xa0
   120a4: 8082         	ret

00000000000120a6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17h14df34d07f5b5af0E>:
   120a6: 7179         	addi	sp, sp, -0x30
   120a8: f406         	sd	ra, 0x28(sp)
   120aa: f022         	sd	s0, 0x20(sp)
   120ac: ec26         	sd	s1, 0x18(sp)
   120ae: e84a         	sd	s2, 0x10(sp)
   120b0: e44e         	sd	s3, 0x8(sp)
   120b2: e052         	sd	s4, 0x0(sp)
   120b4: 1800         	addi	s0, sp, 0x30
   120b6: 6904         	ld	s1, 0x10(a0)
   120b8: 0004c603     	lbu	a2, 0x0(s1)
   120bc: 00053903     	ld	s2, 0x0(a0)
   120c0: 00853983     	ld	s3, 0x8(a0)
   120c4: c61d         	beqz	a2, 0x120f2 <.Lpcrel_hi389+0x28>
   120c6: 0189b703     	ld	a4, 0x18(s3)

00000000000120ca <.Lpcrel_hi389>:
   120ca: 00002517     	auipc	a0, 0x2
   120ce: 10650693     	addi	a3, a0, 0x106
   120d2: 4611         	li	a2, 0x4
   120d4: 854a         	mv	a0, s2
   120d6: 8a2e         	mv	s4, a1
   120d8: 85b6         	mv	a1, a3
   120da: 9702         	jalr	a4
   120dc: 85d2         	mv	a1, s4
   120de: c911         	beqz	a0, 0x120f2 <.Lpcrel_hi389+0x28>
   120e0: 4505         	li	a0, 0x1
   120e2: 70a2         	ld	ra, 0x28(sp)
   120e4: 7402         	ld	s0, 0x20(sp)
   120e6: 64e2         	ld	s1, 0x18(sp)
   120e8: 6942         	ld	s2, 0x10(sp)
   120ea: 69a2         	ld	s3, 0x8(sp)
   120ec: 6a02         	ld	s4, 0x0(sp)
   120ee: 6145         	addi	sp, sp, 0x30
   120f0: 8082         	ret
   120f2: ff658513     	addi	a0, a1, -0xa
   120f6: 00153513     	seqz	a0, a0
   120fa: 00a48023     	sb	a0, 0x0(s1)
   120fe: 0209b783     	ld	a5, 0x20(s3)
   12102: 854a         	mv	a0, s2
   12104: 70a2         	ld	ra, 0x28(sp)
   12106: 7402         	ld	s0, 0x20(sp)
   12108: 64e2         	ld	s1, 0x18(sp)
   1210a: 6942         	ld	s2, 0x10(sp)
   1210c: 69a2         	ld	s3, 0x8(sp)
   1210e: 6a02         	ld	s4, 0x0(sp)
   12110: 6145         	addi	sp, sp, 0x30
   12112: 8782         	jr	a5

0000000000012114 <_ZN4core3fmt8builders11DebugStruct5field17h7302602422d0c033E>:
   12114: 7171         	addi	sp, sp, -0xb0
   12116: f506         	sd	ra, 0xa8(sp)
   12118: f122         	sd	s0, 0xa0(sp)
   1211a: ed26         	sd	s1, 0x98(sp)
   1211c: e94a         	sd	s2, 0x90(sp)
   1211e: e54e         	sd	s3, 0x88(sp)
   12120: e152         	sd	s4, 0x80(sp)
   12122: fcd6         	sd	s5, 0x78(sp)
   12124: f8da         	sd	s6, 0x70(sp)
   12126: f4de         	sd	s7, 0x68(sp)
   12128: f0e2         	sd	s8, 0x60(sp)
   1212a: 1900         	addi	s0, sp, 0xb0
   1212c: 8aaa         	mv	s5, a0
   1212e: 00854503     	lbu	a0, 0x8(a0)
   12132: 4b05         	li	s6, 0x1
   12134: 4485         	li	s1, 0x1
   12136: c115         	beqz	a0, 0x1215a <_ZN4core3fmt8builders11DebugStruct5field17h7302602422d0c033E+0x46>
   12138: 009a8423     	sb	s1, 0x8(s5)
   1213c: 016a84a3     	sb	s6, 0x9(s5)
   12140: 8556         	mv	a0, s5
   12142: 70aa         	ld	ra, 0xa8(sp)
   12144: 740a         	ld	s0, 0xa0(sp)
   12146: 64ea         	ld	s1, 0x98(sp)
   12148: 694a         	ld	s2, 0x90(sp)
   1214a: 69aa         	ld	s3, 0x88(sp)
   1214c: 6a0a         	ld	s4, 0x80(sp)
   1214e: 7ae6         	ld	s5, 0x78(sp)
   12150: 7b46         	ld	s6, 0x70(sp)
   12152: 7ba6         	ld	s7, 0x68(sp)
   12154: 7c06         	ld	s8, 0x60(sp)
   12156: 614d         	addi	sp, sp, 0xb0
   12158: 8082         	ret
   1215a: 89ba         	mv	s3, a4
   1215c: 8936         	mv	s2, a3
   1215e: 000aba03     	ld	s4, 0x0(s5)
   12162: 009ac683     	lbu	a3, 0x9(s5)
   12166: 024a4503     	lbu	a0, 0x24(s4)
   1216a: 8911         	andi	a0, a0, 0x4
   1216c: e909         	bnez	a0, 0x1217e <.Lpcrel_hi391+0xa>
   1216e: 8bae         	mv	s7, a1
   12170: 8c32         	mv	s8, a2
   12172: e2e5         	bnez	a3, 0x12252 <.Lpcrel_hi390>

0000000000012174 <.Lpcrel_hi391>:
   12174: 00003517     	auipc	a0, 0x3
   12178: aa450593     	addi	a1, a0, -0x55c
   1217c: a8f9         	j	0x1225a <.Lpcrel_hi390+0x8>
   1217e: e29d         	bnez	a3, 0x121a4 <.Lpcrel_hi393+0x1a>
   12180: 038a3683     	ld	a3, 0x38(s4)
   12184: 030a3503     	ld	a0, 0x30(s4)
   12188: 6e98         	ld	a4, 0x18(a3)

000000000001218a <.Lpcrel_hi393>:
   1218a: 00003697     	auipc	a3, 0x3
   1218e: a9368693     	addi	a3, a3, -0x56d
   12192: 8bb2         	mv	s7, a2
   12194: 460d         	li	a2, 0x3
   12196: 84ae         	mv	s1, a1
   12198: 85b6         	mv	a1, a3
   1219a: 9702         	jalr	a4
   1219c: 85a6         	mv	a1, s1
   1219e: 865e         	mv	a2, s7
   121a0: 4485         	li	s1, 0x1
   121a2: f959         	bnez	a0, 0x12138 <_ZN4core3fmt8builders11DebugStruct5field17h7302602422d0c033E+0x24>
   121a4: 000a3503     	ld	a0, 0x0(s4)
   121a8: 030a3683     	ld	a3, 0x30(s4)
   121ac: f6a43823     	sd	a0, -0x90(s0)
   121b0: 008a3503     	ld	a0, 0x8(s4)
   121b4: 038a3703     	ld	a4, 0x38(s4)
   121b8: f6a43c23     	sd	a0, -0x88(s0)
   121bc: 010a3503     	ld	a0, 0x10(s4)
   121c0: f8a43023     	sd	a0, -0x80(s0)
   121c4: 018a3503     	ld	a0, 0x18(s4)
   121c8: 4485         	li	s1, 0x1
   121ca: f6f40793     	addi	a5, s0, -0x91
   121ce: f8a43423     	sd	a0, -0x78(s0)
   121d2: 020a3503     	ld	a0, 0x20(s4)
   121d6: f4d43823     	sd	a3, -0xb0(s0)
   121da: f4e43c23     	sd	a4, -0xa8(s0)
   121de: f6f43023     	sd	a5, -0xa0(s0)
   121e2: f5040693     	addi	a3, s0, -0xb0
   121e6: f8a43823     	sd	a0, -0x70(s0)
   121ea: 028a3503     	ld	a0, 0x28(s4)

00000000000121ee <.Lpcrel_hi394>:
   121ee: 00003717     	auipc	a4, 0x3
   121f2: f69407a3     	sb	s1, -0x91(s0)
   121f6: 9fa70713     	addi	a4, a4, -0x606
   121fa: f8a43c23     	sd	a0, -0x68(s0)
   121fe: fad43023     	sd	a3, -0x60(s0)
   12202: fae43423     	sd	a4, -0x58(s0)
   12206: f5040513     	addi	a0, s0, -0xb0
   1220a: 00000097     	auipc	ra, 0x0
   1220e: c8a080e7     	jalr	-0x376(ra) <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hbed24be56f0a3664E>
   12212: f11d         	bnez	a0, 0x12138 <_ZN4core3fmt8builders11DebugStruct5field17h7302602422d0c033E+0x24>

0000000000012214 <.Lpcrel_hi395>:
   12214: 00003597     	auipc	a1, 0x3
   12218: f5040513     	addi	a0, s0, -0xb0
   1221c: 9ac58593     	addi	a1, a1, -0x654
   12220: 4609         	li	a2, 0x2
   12222: 00000097     	auipc	ra, 0x0
   12226: c72080e7     	jalr	-0x38e(ra) <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hbed24be56f0a3664E>
   1222a: f519         	bnez	a0, 0x12138 <_ZN4core3fmt8builders11DebugStruct5field17h7302602422d0c033E+0x24>
   1222c: 0189b603     	ld	a2, 0x18(s3)
   12230: f7040593     	addi	a1, s0, -0x90
   12234: 854a         	mv	a0, s2
   12236: 9602         	jalr	a2
   12238: f101         	bnez	a0, 0x12138 <_ZN4core3fmt8builders11DebugStruct5field17h7302602422d0c033E+0x24>
   1223a: fa843583     	ld	a1, -0x58(s0)
   1223e: fa043503     	ld	a0, -0x60(s0)
   12242: 6d94         	ld	a3, 0x18(a1)

0000000000012244 <.Lpcrel_hi396>:
   12244: 00003597     	auipc	a1, 0x3
   12248: 9dc58593     	addi	a1, a1, -0x624
   1224c: 4609         	li	a2, 0x2
   1224e: 9682         	jalr	a3
   12250: a8b1         	j	0x122ac <.Lpcrel_hi392+0x1c>

0000000000012252 <.Lpcrel_hi390>:
   12252: 00003517     	auipc	a0, 0x3
   12256: 9c950593     	addi	a1, a0, -0x637
   1225a: 038a3603     	ld	a2, 0x38(s4)
   1225e: 030a3503     	ld	a0, 0x30(s4)
   12262: 6e18         	ld	a4, 0x18(a2)
   12264: 0036c613     	xori	a2, a3, 0x3
   12268: 9702         	jalr	a4
   1226a: 4485         	li	s1, 0x1
   1226c: ec0516e3     	bnez	a0, 0x12138 <_ZN4core3fmt8builders11DebugStruct5field17h7302602422d0c033E+0x24>
   12270: 8662         	mv	a2, s8
   12272: 85de         	mv	a1, s7
   12274: 038a3683     	ld	a3, 0x38(s4)
   12278: 030a3503     	ld	a0, 0x30(s4)
   1227c: 6e94         	ld	a3, 0x18(a3)
   1227e: 9682         	jalr	a3
   12280: 4485         	li	s1, 0x1
   12282: ea051be3     	bnez	a0, 0x12138 <_ZN4core3fmt8builders11DebugStruct5field17h7302602422d0c033E+0x24>
   12286: 038a3583     	ld	a1, 0x38(s4)
   1228a: 030a3503     	ld	a0, 0x30(s4)
   1228e: 6d94         	ld	a3, 0x18(a1)

0000000000012290 <.Lpcrel_hi392>:
   12290: 00003597     	auipc	a1, 0x3
   12294: 93058593     	addi	a1, a1, -0x6d0
   12298: 4609         	li	a2, 0x2
   1229a: 9682         	jalr	a3
   1229c: 4485         	li	s1, 0x1
   1229e: e8051de3     	bnez	a0, 0x12138 <_ZN4core3fmt8builders11DebugStruct5field17h7302602422d0c033E+0x24>
   122a2: 0189b603     	ld	a2, 0x18(s3)
   122a6: 854a         	mv	a0, s2
   122a8: 85d2         	mv	a1, s4
   122aa: 9602         	jalr	a2
   122ac: 84aa         	mv	s1, a0
   122ae: b569         	j	0x12138 <_ZN4core3fmt8builders11DebugStruct5field17h7302602422d0c033E+0x24>

00000000000122b0 <_ZN4core3fmt5Write9write_fmt17haf629d64eb426c4dE>:
   122b0: 1141         	addi	sp, sp, -0x10
   122b2: e406         	sd	ra, 0x8(sp)
   122b4: e022         	sd	s0, 0x0(sp)
   122b6: 0800         	addi	s0, sp, 0x10
   122b8: 862e         	mv	a2, a1

00000000000122ba <.Lpcrel_hi561>:
   122ba: 00003597     	auipc	a1, 0x3
   122be: 92e58593     	addi	a1, a1, -0x6d2
   122c2: 60a2         	ld	ra, 0x8(sp)
   122c4: 6402         	ld	s0, 0x0(sp)
   122c6: 0141         	addi	sp, sp, 0x10
   122c8: 00000317     	auipc	t1, 0x0
   122cc: 02830067     	jr	0x28(t1) <_ZN4core3fmt5write17h7ce9e976de62bebaE>

00000000000122d0 <_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h651d6c57a9799a9fE>:
   122d0: 1141         	addi	sp, sp, -0x10
   122d2: e406         	sd	ra, 0x8(sp)
   122d4: e022         	sd	s0, 0x0(sp)
   122d6: 0800         	addi	s0, sp, 0x10
   122d8: 7990         	ld	a2, 0x30(a1)
   122da: 7d8c         	ld	a1, 0x38(a1)
   122dc: 86aa         	mv	a3, a0
   122de: 8532         	mv	a0, a2
   122e0: 8636         	mv	a2, a3
   122e2: 60a2         	ld	ra, 0x8(sp)
   122e4: 6402         	ld	s0, 0x0(sp)
   122e6: 0141         	addi	sp, sp, 0x10
   122e8: 00000317     	auipc	t1, 0x0
   122ec: 00830067     	jr	0x8(t1) <_ZN4core3fmt5write17h7ce9e976de62bebaE>

00000000000122f0 <_ZN4core3fmt5write17h7ce9e976de62bebaE>:
   122f0: 7175         	addi	sp, sp, -0x90
   122f2: e506         	sd	ra, 0x88(sp)
   122f4: e122         	sd	s0, 0x80(sp)
   122f6: fca6         	sd	s1, 0x78(sp)
   122f8: f8ca         	sd	s2, 0x70(sp)
   122fa: f4ce         	sd	s3, 0x68(sp)
   122fc: f0d2         	sd	s4, 0x60(sp)
   122fe: ecd6         	sd	s5, 0x58(sp)
   12300: e8da         	sd	s6, 0x50(sp)
   12302: e4de         	sd	s7, 0x48(sp)
   12304: e0e2         	sd	s8, 0x40(sp)
   12306: 0900         	addi	s0, sp, 0x90
   12308: 89b2         	mv	s3, a2
   1230a: 02000613     	li	a2, 0x20
   1230e: 468d         	li	a3, 0x3
   12310: 0209b483     	ld	s1, 0x20(s3)
   12314: f6043823     	sd	zero, -0x90(s0)
   12318: f8043023     	sd	zero, -0x80(s0)
   1231c: f8c43823     	sd	a2, -0x70(s0)
   12320: f8d40c23     	sb	a3, -0x68(s0)
   12324: faa43023     	sd	a0, -0x60(s0)
   12328: fab43423     	sd	a1, -0x58(s0)
   1232c: cce1         	beqz	s1, 0x12404 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x114>
   1232e: 0289b503     	ld	a0, 0x28(s3)
   12332: 12050463     	beqz	a0, 0x1245a <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x16a>
   12336: 0009bb83     	ld	s7, 0x0(s3)
   1233a: 0109ba03     	ld	s4, 0x10(s3)
   1233e: fff50593     	addi	a1, a0, -0x1
   12342: 00351613     	slli	a2, a0, 0x3
   12346: 051a         	slli	a0, a0, 0x6
   12348: 04e1         	addi	s1, s1, 0x18
   1234a: 4a89         	li	s5, 0x2
   1234c: 058e         	slli	a1, a1, 0x3
   1234e: 40c50b33     	sub	s6, a0, a2
   12352: 818d         	srli	a1, a1, 0x3
   12354: 00158913     	addi	s2, a1, 0x1
   12358: 0ba1         	addi	s7, s7, 0x8
   1235a: 4c05         	li	s8, 0x1
   1235c: 000bb603     	ld	a2, 0x0(s7)
   12360: ca19         	beqz	a2, 0x12376 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x86>
   12362: fa843683     	ld	a3, -0x58(s0)
   12366: fa043503     	ld	a0, -0x60(s0)
   1236a: ff8bb583     	ld	a1, -0x8(s7)
   1236e: 6e94         	ld	a3, 0x18(a3)
   12370: 9682         	jalr	a3
   12372: 10051863     	bnez	a0, 0x12482 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x192>
   12376: 6888         	ld	a0, 0x10(s1)
   12378: f8a43823     	sd	a0, -0x70(s0)
   1237c: 0184c603     	lbu	a2, 0x18(s1)
   12380: ff84b583     	ld	a1, -0x8(s1)
   12384: 6088         	ld	a0, 0x0(s1)
   12386: f8c40c23     	sb	a2, -0x68(s0)
   1238a: c18d         	beqz	a1, 0x123ac <_ZN4core3fmt5write17h7ce9e976de62bebaE+0xbc>
   1238c: 01859663     	bne	a1, s8, 0x12398 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0xa8>
   12390: 0512         	slli	a0, a0, 0x4
   12392: 9552         	add	a0, a0, s4
   12394: 610c         	ld	a1, 0x0(a0)
   12396: c991         	beqz	a1, 0x123aa <_ZN4core3fmt5write17h7ce9e976de62bebaE+0xba>
   12398: fe84b603     	ld	a2, -0x18(s1)
   1239c: f6043823     	sd	zero, -0x90(s0)
   123a0: f6a43c23     	sd	a0, -0x88(s0)
   123a4: 01561d63     	bne	a2, s5, 0x123be <_ZN4core3fmt5write17h7ce9e976de62bebaE+0xce>
   123a8: a025         	j	0x123d0 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0xe0>
   123aa: 6508         	ld	a0, 0x8(a0)
   123ac: 4585         	li	a1, 0x1
   123ae: fe84b603     	ld	a2, -0x18(s1)
   123b2: f6b43823     	sd	a1, -0x90(s0)
   123b6: f6a43c23     	sd	a0, -0x88(s0)
   123ba: 01560b63     	beq	a2, s5, 0x123d0 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0xe0>
   123be: ff04b583     	ld	a1, -0x10(s1)
   123c2: 01861a63     	bne	a2, s8, 0x123d6 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0xe6>
   123c6: 00459513     	slli	a0, a1, 0x4
   123ca: 9552         	add	a0, a0, s4
   123cc: 610c         	ld	a1, 0x0(a0)
   123ce: c199         	beqz	a1, 0x123d4 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0xe4>
   123d0: 4601         	li	a2, 0x0
   123d2: a019         	j	0x123d8 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0xe8>
   123d4: 650c         	ld	a1, 0x8(a0)
   123d6: 4605         	li	a2, 0x1
   123d8: 6488         	ld	a0, 0x8(s1)
   123da: 0512         	slli	a0, a0, 0x4
   123dc: 00aa06b3     	add	a3, s4, a0
   123e0: 6288         	ld	a0, 0x0(a3)
   123e2: 6694         	ld	a3, 0x8(a3)
   123e4: f8c43023     	sd	a2, -0x80(s0)
   123e8: f8b43423     	sd	a1, -0x78(s0)
   123ec: f7040593     	addi	a1, s0, -0x90
   123f0: 9682         	jalr	a3
   123f2: e941         	bnez	a0, 0x12482 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x192>
   123f4: 0bc1         	addi	s7, s7, 0x10
   123f6: fc8b0b13     	addi	s6, s6, -0x38
   123fa: 03848493     	addi	s1, s1, 0x38
   123fe: f40b1fe3     	bnez	s6, 0x1235c <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x6c>
   12402: a0b9         	j	0x12450 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x160>
   12404: 0189b503     	ld	a0, 0x18(s3)
   12408: c929         	beqz	a0, 0x1245a <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x16a>
   1240a: 0009ba83     	ld	s5, 0x0(s3)
   1240e: 0109b483     	ld	s1, 0x10(s3)
   12412: 00451a13     	slli	s4, a0, 0x4
   12416: 157d         	addi	a0, a0, -0x1
   12418: 0512         	slli	a0, a0, 0x4
   1241a: 8111         	srli	a0, a0, 0x4
   1241c: 00150913     	addi	s2, a0, 0x1
   12420: 9a26         	add	s4, s4, s1
   12422: 0aa1         	addi	s5, s5, 0x8
   12424: 000ab603     	ld	a2, 0x0(s5)
   12428: ca11         	beqz	a2, 0x1243c <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x14c>
   1242a: fa843683     	ld	a3, -0x58(s0)
   1242e: fa043503     	ld	a0, -0x60(s0)
   12432: ff8ab583     	ld	a1, -0x8(s5)
   12436: 6e94         	ld	a3, 0x18(a3)
   12438: 9682         	jalr	a3
   1243a: e521         	bnez	a0, 0x12482 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x192>
   1243c: 6088         	ld	a0, 0x0(s1)
   1243e: 6490         	ld	a2, 0x8(s1)
   12440: f7040593     	addi	a1, s0, -0x90
   12444: 9602         	jalr	a2
   12446: ed15         	bnez	a0, 0x12482 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x192>
   12448: 04c1         	addi	s1, s1, 0x10
   1244a: 0ac1         	addi	s5, s5, 0x10
   1244c: fd449ce3     	bne	s1, s4, 0x12424 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x134>
   12450: 0089b503     	ld	a0, 0x8(s3)
   12454: 00a96863     	bltu	s2, a0, 0x12464 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x174>
   12458: a03d         	j	0x12486 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x196>
   1245a: 4901         	li	s2, 0x0
   1245c: 0089b503     	ld	a0, 0x8(s3)
   12460: 02a07363     	bgeu	zero, a0, 0x12486 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x196>
   12464: 0009b583     	ld	a1, 0x0(s3)
   12468: 0912         	slli	s2, s2, 0x4
   1246a: fa043503     	ld	a0, -0x60(s0)
   1246e: fa843683     	ld	a3, -0x58(s0)
   12472: 992e         	add	s2, s2, a1
   12474: 00093583     	ld	a1, 0x0(s2)
   12478: 00893603     	ld	a2, 0x8(s2)
   1247c: 6e94         	ld	a3, 0x18(a3)
   1247e: 9682         	jalr	a3
   12480: c119         	beqz	a0, 0x12486 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x196>
   12482: 4505         	li	a0, 0x1
   12484: a011         	j	0x12488 <_ZN4core3fmt5write17h7ce9e976de62bebaE+0x198>
   12486: 4501         	li	a0, 0x0
   12488: 60aa         	ld	ra, 0x88(sp)
   1248a: 640a         	ld	s0, 0x80(sp)
   1248c: 74e6         	ld	s1, 0x78(sp)
   1248e: 7946         	ld	s2, 0x70(sp)
   12490: 79a6         	ld	s3, 0x68(sp)
   12492: 7a06         	ld	s4, 0x60(sp)
   12494: 6ae6         	ld	s5, 0x58(sp)
   12496: 6b46         	ld	s6, 0x50(sp)
   12498: 6ba6         	ld	s7, 0x48(sp)
   1249a: 6c06         	ld	s8, 0x40(sp)
   1249c: 6149         	addi	sp, sp, 0x90
   1249e: 8082         	ret

00000000000124a0 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E>:
   124a0: 7159         	addi	sp, sp, -0x70
   124a2: f486         	sd	ra, 0x68(sp)
   124a4: f0a2         	sd	s0, 0x60(sp)
   124a6: eca6         	sd	s1, 0x58(sp)
   124a8: e8ca         	sd	s2, 0x50(sp)
   124aa: e4ce         	sd	s3, 0x48(sp)
   124ac: e0d2         	sd	s4, 0x40(sp)
   124ae: fc56         	sd	s5, 0x38(sp)
   124b0: f85a         	sd	s6, 0x30(sp)
   124b2: f45e         	sd	s7, 0x28(sp)
   124b4: f062         	sd	s8, 0x20(sp)
   124b6: ec66         	sd	s9, 0x18(sp)
   124b8: e86a         	sd	s10, 0x10(sp)
   124ba: e46e         	sd	s11, 0x8(sp)
   124bc: 1880         	addi	s0, sp, 0x70
   124be: 89be         	mv	s3, a5
   124c0: 893a         	mv	s2, a4
   124c2: 8a36         	mv	s4, a3
   124c4: 8b32         	mv	s6, a2
   124c6: c5b9         	beqz	a1, 0x12514 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x74>
   124c8: 02456483     	lwu	s1, 0x24(a0)
   124cc: 0014fc13     	andi	s8, s1, 0x1
   124d0: 00110ab7     	lui	s5, 0x110
   124d4: 000c0463     	beqz	s8, 0x124dc <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x3c>
   124d8: 02b00a93     	li	s5, 0x2b
   124dc: 9c4e         	add	s8, s8, s3
   124de: 0044f593     	andi	a1, s1, 0x4
   124e2: c1a9         	beqz	a1, 0x12524 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x84>
   124e4: 02000593     	li	a1, 0x20
   124e8: 04ba7263     	bgeu	s4, a1, 0x1252c <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x8c>
   124ec: 4581         	li	a1, 0x0
   124ee: 000a0f63     	beqz	s4, 0x1250c <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x6c>
   124f2: 014b0633     	add	a2, s6, s4
   124f6: 86da         	mv	a3, s6
   124f8: 00068703     	lb	a4, 0x0(a3)
   124fc: 0685         	addi	a3, a3, 0x1
   124fe: fc072713     	slti	a4, a4, -0x40
   12502: 00174713     	xori	a4, a4, 0x1
   12506: 95ba         	add	a1, a1, a4
   12508: fec698e3     	bne	a3, a2, 0x124f8 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x58>
   1250c: 9c2e         	add	s8, s8, a1
   1250e: 610c         	ld	a1, 0x0(a0)
   12510: e99d         	bnez	a1, 0x12546 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xa6>
   12512: a8b9         	j	0x12570 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xd0>
   12514: 5144         	lw	s1, 0x24(a0)
   12516: 00198c13     	addi	s8, s3, 0x1
   1251a: 02d00a93     	li	s5, 0x2d
   1251e: 0044f593     	andi	a1, s1, 0x4
   12522: f1e9         	bnez	a1, 0x124e4 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x44>
   12524: 4b01         	li	s6, 0x0
   12526: 610c         	ld	a1, 0x0(a0)
   12528: c5a1         	beqz	a1, 0x12570 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xd0>
   1252a: a831         	j	0x12546 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xa6>
   1252c: 8baa         	mv	s7, a0
   1252e: 855a         	mv	a0, s6
   12530: 85d2         	mv	a1, s4
   12532: 00001097     	auipc	ra, 0x1
   12536: 816080e7     	jalr	-0x7ea(ra) <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E>
   1253a: 85aa         	mv	a1, a0
   1253c: 855e         	mv	a0, s7
   1253e: 9c2e         	add	s8, s8, a1
   12540: 000bb583     	ld	a1, 0x0(s7)
   12544: c595         	beqz	a1, 0x12570 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xd0>
   12546: 00853c83     	ld	s9, 0x8(a0)
   1254a: 039c7363     	bgeu	s8, s9, 0x12570 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xd0>
   1254e: 88a1         	andi	s1, s1, 0x8
   12550: e0c1         	bnez	s1, 0x125d0 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x130>
   12552: 02854583     	lbu	a1, 0x28(a0)
   12556: 460d         	li	a2, 0x3
   12558: 00c59363     	bne	a1, a2, 0x1255e <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xbe>
   1255c: 4585         	li	a1, 0x1
   1255e: 418c8cb3     	sub	s9, s9, s8
   12562: c5e1         	beqz	a1, 0x1262a <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x18a>
   12564: 4605         	li	a2, 0x1
   12566: 0ac59d63     	bne	a1, a2, 0x12620 <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x180>
   1256a: 85e6         	mv	a1, s9
   1256c: 4c81         	li	s9, 0x0
   1256e: a875         	j	0x1262a <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x18a>
   12570: 03053b83     	ld	s7, 0x30(a0)
   12574: 7d04         	ld	s1, 0x38(a0)
   12576: 855e         	mv	a0, s7
   12578: 85a6         	mv	a1, s1
   1257a: 8656         	mv	a2, s5
   1257c: 86da         	mv	a3, s6
   1257e: 8752         	mv	a4, s4
   12580: 00000097     	auipc	ra, 0x0
   12584: 144080e7     	jalr	0x144(ra) <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h7ccdd3b8ffc8bb9dE>
   12588: c10d         	beqz	a0, 0x125aa <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x10a>
   1258a: 4505         	li	a0, 0x1
   1258c: 70a6         	ld	ra, 0x68(sp)
   1258e: 7406         	ld	s0, 0x60(sp)
   12590: 64e6         	ld	s1, 0x58(sp)
   12592: 6946         	ld	s2, 0x50(sp)
   12594: 69a6         	ld	s3, 0x48(sp)
   12596: 6a06         	ld	s4, 0x40(sp)
   12598: 7ae2         	ld	s5, 0x38(sp)
   1259a: 7b42         	ld	s6, 0x30(sp)
   1259c: 7ba2         	ld	s7, 0x28(sp)
   1259e: 7c02         	ld	s8, 0x20(sp)
   125a0: 6ce2         	ld	s9, 0x18(sp)
   125a2: 6d42         	ld	s10, 0x10(sp)
   125a4: 6da2         	ld	s11, 0x8(sp)
   125a6: 6165         	addi	sp, sp, 0x70
   125a8: 8082         	ret
   125aa: 6c9c         	ld	a5, 0x18(s1)
   125ac: 855e         	mv	a0, s7
   125ae: 85ca         	mv	a1, s2
   125b0: 864e         	mv	a2, s3
   125b2: 70a6         	ld	ra, 0x68(sp)
   125b4: 7406         	ld	s0, 0x60(sp)
   125b6: 64e6         	ld	s1, 0x58(sp)
   125b8: 6946         	ld	s2, 0x50(sp)
   125ba: 69a6         	ld	s3, 0x48(sp)
   125bc: 6a06         	ld	s4, 0x40(sp)
   125be: 7ae2         	ld	s5, 0x38(sp)
   125c0: 7b42         	ld	s6, 0x30(sp)
   125c2: 7ba2         	ld	s7, 0x28(sp)
   125c4: 7c02         	ld	s8, 0x20(sp)
   125c6: 6ce2         	ld	s9, 0x18(sp)
   125c8: 6d42         	ld	s10, 0x10(sp)
   125ca: 6da2         	ld	s11, 0x8(sp)
   125cc: 6165         	addi	sp, sp, 0x70
   125ce: 8782         	jr	a5
   125d0: 03000593     	li	a1, 0x30
   125d4: 5104         	lw	s1, 0x20(a0)
   125d6: 02854603     	lbu	a2, 0x28(a0)
   125da: f8c43823     	sd	a2, -0x70(s0)
   125de: 03053b83     	ld	s7, 0x30(a0)
   125e2: 03853d03     	ld	s10, 0x38(a0)
   125e6: 4605         	li	a2, 0x1
   125e8: d10c         	sw	a1, 0x20(a0)
   125ea: 8daa         	mv	s11, a0
   125ec: 02c50423     	sb	a2, 0x28(a0)
   125f0: 855e         	mv	a0, s7
   125f2: 85ea         	mv	a1, s10
   125f4: 8656         	mv	a2, s5
   125f6: 86da         	mv	a3, s6
   125f8: 8752         	mv	a4, s4
   125fa: 00000097     	auipc	ra, 0x0
   125fe: 0ca080e7     	jalr	0xca(ra) <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h7ccdd3b8ffc8bb9dE>
   12602: f541         	bnez	a0, 0x1258a <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xea>
   12604: 8a26         	mv	s4, s1
   12606: 418c84b3     	sub	s1, s9, s8
   1260a: 0485         	addi	s1, s1, 0x1
   1260c: 14fd         	addi	s1, s1, -0x1
   1260e: c4d1         	beqz	s1, 0x1269a <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x1fa>
   12610: 020d3603     	ld	a2, 0x20(s10)
   12614: 03000593     	li	a1, 0x30
   12618: 855e         	mv	a0, s7
   1261a: 9602         	jalr	a2
   1261c: d965         	beqz	a0, 0x1260c <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x16c>
   1261e: b7b5         	j	0x1258a <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xea>
   12620: 001cd593     	srli	a1, s9, 0x1
   12624: 0c85         	addi	s9, s9, 0x1
   12626: 001cdc93     	srli	s9, s9, 0x1
   1262a: 02052b83     	lw	s7, 0x20(a0)
   1262e: 03053c03     	ld	s8, 0x30(a0)
   12632: 03853d03     	ld	s10, 0x38(a0)
   12636: 00158493     	addi	s1, a1, 0x1
   1263a: 14fd         	addi	s1, s1, -0x1
   1263c: c881         	beqz	s1, 0x1264c <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x1ac>
   1263e: 020d3603     	ld	a2, 0x20(s10)
   12642: 8562         	mv	a0, s8
   12644: 85de         	mv	a1, s7
   12646: 9602         	jalr	a2
   12648: d96d         	beqz	a0, 0x1263a <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x19a>
   1264a: b781         	j	0x1258a <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xea>
   1264c: 8562         	mv	a0, s8
   1264e: 85ea         	mv	a1, s10
   12650: 8656         	mv	a2, s5
   12652: 86da         	mv	a3, s6
   12654: 8752         	mv	a4, s4
   12656: 00000097     	auipc	ra, 0x0
   1265a: 06e080e7     	jalr	0x6e(ra) <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h7ccdd3b8ffc8bb9dE>
   1265e: 85aa         	mv	a1, a0
   12660: 4505         	li	a0, 0x1
   12662: f58d         	bnez	a1, 0x1258c <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xec>
   12664: 018d3683     	ld	a3, 0x18(s10)
   12668: 8562         	mv	a0, s8
   1266a: 85ca         	mv	a1, s2
   1266c: 864e         	mv	a2, s3
   1266e: 9682         	jalr	a3
   12670: 85aa         	mv	a1, a0
   12672: 4505         	li	a0, 0x1
   12674: fd81         	bnez	a1, 0x1258c <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xec>
   12676: 41900933     	neg	s2, s9
   1267a: 59fd         	li	s3, -0x1
   1267c: 54fd         	li	s1, -0x1
   1267e: 00990533     	add	a0, s2, s1
   12682: 03350e63     	beq	a0, s3, 0x126be <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x21e>
   12686: 020d3603     	ld	a2, 0x20(s10)
   1268a: 8562         	mv	a0, s8
   1268c: 85de         	mv	a1, s7
   1268e: 9602         	jalr	a2
   12690: 0485         	addi	s1, s1, 0x1
   12692: d575         	beqz	a0, 0x1267e <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0x1de>
   12694: 0194b533     	sltu	a0, s1, s9
   12698: bdd5         	j	0x1258c <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xec>
   1269a: 018d3683     	ld	a3, 0x18(s10)
   1269e: 855e         	mv	a0, s7
   126a0: 85ca         	mv	a1, s2
   126a2: 864e         	mv	a2, s3
   126a4: 9682         	jalr	a3
   126a6: 85aa         	mv	a1, a0
   126a8: 4505         	li	a0, 0x1
   126aa: ee0591e3     	bnez	a1, 0x1258c <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xec>
   126ae: 4501         	li	a0, 0x0
   126b0: 034da023     	sw	s4, 0x20(s11)
   126b4: f9043583     	ld	a1, -0x70(s0)
   126b8: 02bd8423     	sb	a1, 0x28(s11)
   126bc: bdc1         	j	0x1258c <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xec>
   126be: 019cb533     	sltu	a0, s9, s9
   126c2: b5e9         	j	0x1258c <_ZN4core3fmt9Formatter12pad_integral17he6f1e3750a6f6147E+0xec>

00000000000126c4 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h7ccdd3b8ffc8bb9dE>:
   126c4: 7179         	addi	sp, sp, -0x30
   126c6: f406         	sd	ra, 0x28(sp)
   126c8: f022         	sd	s0, 0x20(sp)
   126ca: ec26         	sd	s1, 0x18(sp)
   126cc: e84a         	sd	s2, 0x10(sp)
   126ce: e44e         	sd	s3, 0x8(sp)
   126d0: e052         	sd	s4, 0x0(sp)
   126d2: 1800         	addi	s0, sp, 0x30
   126d4: 893a         	mv	s2, a4
   126d6: 8a36         	mv	s4, a3
   126d8: 89ae         	mv	s3, a1
   126da: 001105b7     	lui	a1, 0x110
   126de: 00b60c63     	beq	a2, a1, 0x126f6 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h7ccdd3b8ffc8bb9dE+0x32>
   126e2: 0209b683     	ld	a3, 0x20(s3)
   126e6: 84aa         	mv	s1, a0
   126e8: 85b2         	mv	a1, a2
   126ea: 9682         	jalr	a3
   126ec: 85aa         	mv	a1, a0
   126ee: 8526         	mv	a0, s1
   126f0: c199         	beqz	a1, 0x126f6 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h7ccdd3b8ffc8bb9dE+0x32>
   126f2: 4505         	li	a0, 0x1
   126f4: a005         	j	0x12714 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h7ccdd3b8ffc8bb9dE+0x50>
   126f6: 000a0e63     	beqz	s4, 0x12712 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h7ccdd3b8ffc8bb9dE+0x4e>
   126fa: 0189b783     	ld	a5, 0x18(s3)
   126fe: 85d2         	mv	a1, s4
   12700: 864a         	mv	a2, s2
   12702: 70a2         	ld	ra, 0x28(sp)
   12704: 7402         	ld	s0, 0x20(sp)
   12706: 64e2         	ld	s1, 0x18(sp)
   12708: 6942         	ld	s2, 0x10(sp)
   1270a: 69a2         	ld	s3, 0x8(sp)
   1270c: 6a02         	ld	s4, 0x0(sp)
   1270e: 6145         	addi	sp, sp, 0x30
   12710: 8782         	jr	a5
   12712: 4501         	li	a0, 0x0
   12714: 70a2         	ld	ra, 0x28(sp)
   12716: 7402         	ld	s0, 0x20(sp)
   12718: 64e2         	ld	s1, 0x18(sp)
   1271a: 6942         	ld	s2, 0x10(sp)
   1271c: 69a2         	ld	s3, 0x8(sp)
   1271e: 6a02         	ld	s4, 0x0(sp)
   12720: 6145         	addi	sp, sp, 0x30
   12722: 8082         	ret

0000000000012724 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE>:
   12724: 715d         	addi	sp, sp, -0x50
   12726: e486         	sd	ra, 0x48(sp)
   12728: e0a2         	sd	s0, 0x40(sp)
   1272a: fc26         	sd	s1, 0x38(sp)
   1272c: f84a         	sd	s2, 0x30(sp)
   1272e: f44e         	sd	s3, 0x28(sp)
   12730: f052         	sd	s4, 0x20(sp)
   12732: ec56         	sd	s5, 0x18(sp)
   12734: e85a         	sd	s6, 0x10(sp)
   12736: e45e         	sd	s7, 0x8(sp)
   12738: 0880         	addi	s0, sp, 0x50
   1273a: 8932         	mv	s2, a2
   1273c: 6110         	ld	a2, 0x0(a0)
   1273e: 6914         	ld	a3, 0x10(a0)
   12740: 00d66733     	or	a4, a2, a3
   12744: 89ae         	mv	s3, a1
   12746: 10070163     	beqz	a4, 0x12848 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x124>
   1274a: 8a85         	andi	a3, a3, 0x1
   1274c: cad1         	beqz	a3, 0x127e0 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xbc>
   1274e: 6d18         	ld	a4, 0x18(a0)
   12750: 012986b3     	add	a3, s3, s2
   12754: 4581         	li	a1, 0x0
   12756: c721         	beqz	a4, 0x1279e <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x7a>
   12758: 0e000893     	li	a7, 0xe0
   1275c: 0f000813     	li	a6, 0xf0
   12760: 84ce         	mv	s1, s3
   12762: a809         	j	0x12774 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x50>
   12764: 00148793     	addi	a5, s1, 0x1
   12768: 8c8d         	sub	s1, s1, a1
   1276a: 177d         	addi	a4, a4, -0x1
   1276c: 409785b3     	sub	a1, a5, s1
   12770: 84be         	mv	s1, a5
   12772: c71d         	beqz	a4, 0x127a0 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x7c>
   12774: 06d48663     	beq	s1, a3, 0x127e0 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xbc>
   12778: 00048783     	lb	a5, 0x0(s1)
   1277c: fe07d4e3     	bgez	a5, 0x12764 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x40>
   12780: 0ff7f793     	andi	a5, a5, 0xff
   12784: 0117e763     	bltu	a5, a7, 0x12792 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x6e>
   12788: 0107e863     	bltu	a5, a6, 0x12798 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x74>
   1278c: 00448793     	addi	a5, s1, 0x4
   12790: bfe1         	j	0x12768 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x44>
   12792: 00248793     	addi	a5, s1, 0x2
   12796: bfc9         	j	0x12768 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x44>
   12798: 00348793     	addi	a5, s1, 0x3
   1279c: b7f1         	j	0x12768 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x44>
   1279e: 87ce         	mv	a5, s3
   127a0: 04d78063     	beq	a5, a3, 0x127e0 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xbc>
   127a4: 00078683     	lb	a3, 0x0(a5)
   127a8: 0006d663     	bgez	a3, 0x127b4 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x90>
   127ac: 0ff6f693     	andi	a3, a3, 0xff
   127b0: 0e000713     	li	a4, 0xe0
   127b4: c18d         	beqz	a1, 0x127d6 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xb2>
   127b6: 0125fe63     	bgeu	a1, s2, 0x127d2 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xae>
   127ba: 00b986b3     	add	a3, s3, a1
   127be: 00068683     	lb	a3, 0x0(a3)
   127c2: fc000713     	li	a4, -0x40
   127c6: 00e6d863     	bge	a3, a4, 0x127d6 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xb2>
   127ca: 4681         	li	a3, 0x0
   127cc: 00001863     	bnez	zero, 0x127dc <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xb8>
   127d0: a801         	j	0x127e0 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xbc>
   127d2: ff259ce3     	bne	a1, s2, 0x127ca <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xa6>
   127d6: 86ce         	mv	a3, s3
   127d8: 00098463     	beqz	s3, 0x127e0 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xbc>
   127dc: 892e         	mv	s2, a1
   127de: 89b6         	mv	s3, a3
   127e0: c625         	beqz	a2, 0x12848 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x124>
   127e2: 6504         	ld	s1, 0x8(a0)
   127e4: 02000593     	li	a1, 0x20
   127e8: 04b97563     	bgeu	s2, a1, 0x12832 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x10e>
   127ec: 4581         	li	a1, 0x0
   127ee: 00090f63     	beqz	s2, 0x1280c <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xe8>
   127f2: 01298633     	add	a2, s3, s2
   127f6: 86ce         	mv	a3, s3
   127f8: 00068703     	lb	a4, 0x0(a3)
   127fc: 0685         	addi	a3, a3, 0x1
   127fe: fc072713     	slti	a4, a4, -0x40
   12802: 00174713     	xori	a4, a4, 0x1
   12806: 95ba         	add	a1, a1, a4
   12808: fec698e3     	bne	a3, a2, 0x127f8 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xd4>
   1280c: 0295fe63     	bgeu	a1, s1, 0x12848 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x124>
   12810: 02854603     	lbu	a2, 0x28(a0)
   12814: ffd60693     	addi	a3, a2, -0x3
   12818: 0016b693     	seqz	a3, a3
   1281c: 16fd         	addi	a3, a3, -0x1
   1281e: 8e75         	and	a2, a2, a3
   12820: 40b48ab3     	sub	s5, s1, a1
   12824: c639         	beqz	a2, 0x12872 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x14e>
   12826: 4585         	li	a1, 0x1
   12828: 04b61063     	bne	a2, a1, 0x12868 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x144>
   1282c: 8656         	mv	a2, s5
   1282e: 4a81         	li	s5, 0x0
   12830: a089         	j	0x12872 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x14e>
   12832: 8a2a         	mv	s4, a0
   12834: 854e         	mv	a0, s3
   12836: 85ca         	mv	a1, s2
   12838: 00000097     	auipc	ra, 0x0
   1283c: 510080e7     	jalr	0x510(ra) <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E>
   12840: 85aa         	mv	a1, a0
   12842: 8552         	mv	a0, s4
   12844: fc95e6e3     	bltu	a1, s1, 0x12810 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0xec>
   12848: 7d0c         	ld	a1, 0x38(a0)
   1284a: 7908         	ld	a0, 0x30(a0)
   1284c: 6d9c         	ld	a5, 0x18(a1)
   1284e: 85ce         	mv	a1, s3
   12850: 864a         	mv	a2, s2
   12852: 60a6         	ld	ra, 0x48(sp)
   12854: 6406         	ld	s0, 0x40(sp)
   12856: 74e2         	ld	s1, 0x38(sp)
   12858: 7942         	ld	s2, 0x30(sp)
   1285a: 79a2         	ld	s3, 0x28(sp)
   1285c: 7a02         	ld	s4, 0x20(sp)
   1285e: 6ae2         	ld	s5, 0x18(sp)
   12860: 6b42         	ld	s6, 0x10(sp)
   12862: 6ba2         	ld	s7, 0x8(sp)
   12864: 6161         	addi	sp, sp, 0x50
   12866: 8782         	jr	a5
   12868: 001ad613     	srli	a2, s5, 0x1
   1286c: 0a85         	addi	s5, s5, 0x1
   1286e: 001ada93     	srli	s5, s5, 0x1
   12872: 02052a03     	lw	s4, 0x20(a0)
   12876: 03053b03     	ld	s6, 0x30(a0)
   1287a: 03853b83     	ld	s7, 0x38(a0)
   1287e: 00160493     	addi	s1, a2, 0x1
   12882: 14fd         	addi	s1, s1, -0x1
   12884: c881         	beqz	s1, 0x12894 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x170>
   12886: 020bb603     	ld	a2, 0x20(s7)
   1288a: 855a         	mv	a0, s6
   1288c: 85d2         	mv	a1, s4
   1288e: 9602         	jalr	a2
   12890: d96d         	beqz	a0, 0x12882 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x15e>
   12892: a801         	j	0x128a2 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x17e>
   12894: 018bb683     	ld	a3, 0x18(s7)
   12898: 855a         	mv	a0, s6
   1289a: 85ce         	mv	a1, s3
   1289c: 864a         	mv	a2, s2
   1289e: 9682         	jalr	a3
   128a0: c119         	beqz	a0, 0x128a6 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x182>
   128a2: 4505         	li	a0, 0x1
   128a4: a025         	j	0x128cc <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x1a8>
   128a6: 41500933     	neg	s2, s5
   128aa: 59fd         	li	s3, -0x1
   128ac: 54fd         	li	s1, -0x1
   128ae: 00990533     	add	a0, s2, s1
   128b2: 01350a63     	beq	a0, s3, 0x128c6 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x1a2>
   128b6: 020bb603     	ld	a2, 0x20(s7)
   128ba: 855a         	mv	a0, s6
   128bc: 85d2         	mv	a1, s4
   128be: 9602         	jalr	a2
   128c0: 0485         	addi	s1, s1, 0x1
   128c2: d575         	beqz	a0, 0x128ae <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x18a>
   128c4: a011         	j	0x128c8 <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE+0x1a4>
   128c6: 84d6         	mv	s1, s5
   128c8: 0154b533     	sltu	a0, s1, s5
   128cc: 60a6         	ld	ra, 0x48(sp)
   128ce: 6406         	ld	s0, 0x40(sp)
   128d0: 74e2         	ld	s1, 0x38(sp)
   128d2: 7942         	ld	s2, 0x30(sp)
   128d4: 79a2         	ld	s3, 0x28(sp)
   128d6: 7a02         	ld	s4, 0x20(sp)
   128d8: 6ae2         	ld	s5, 0x18(sp)
   128da: 6b42         	ld	s6, 0x10(sp)
   128dc: 6ba2         	ld	s7, 0x8(sp)
   128de: 6161         	addi	sp, sp, 0x50
   128e0: 8082         	ret

00000000000128e2 <_ZN57_$LT$core..fmt..Formatter$u20$as$u20$core..fmt..Write$GT$9write_str17h8de15734ef83d9feE>:
   128e2: 1141         	addi	sp, sp, -0x10
   128e4: e406         	sd	ra, 0x8(sp)
   128e6: e022         	sd	s0, 0x0(sp)
   128e8: 0800         	addi	s0, sp, 0x10
   128ea: 7d14         	ld	a3, 0x38(a0)
   128ec: 7908         	ld	a0, 0x30(a0)
   128ee: 6e9c         	ld	a5, 0x18(a3)
   128f0: 60a2         	ld	ra, 0x8(sp)
   128f2: 6402         	ld	s0, 0x0(sp)
   128f4: 0141         	addi	sp, sp, 0x10
   128f6: 8782         	jr	a5

00000000000128f8 <_ZN4core3fmt9Formatter26debug_struct_field2_finish17h861956c1d160201cE>:
   128f8: 7159         	addi	sp, sp, -0x70
   128fa: f486         	sd	ra, 0x68(sp)
   128fc: f0a2         	sd	s0, 0x60(sp)
   128fe: eca6         	sd	s1, 0x58(sp)
   12900: e8ca         	sd	s2, 0x50(sp)
   12902: e4ce         	sd	s3, 0x48(sp)
   12904: e0d2         	sd	s4, 0x40(sp)
   12906: fc56         	sd	s5, 0x38(sp)
   12908: f85a         	sd	s6, 0x30(sp)
   1290a: f45e         	sd	s7, 0x28(sp)
   1290c: f062         	sd	s8, 0x20(sp)
   1290e: ec66         	sd	s9, 0x18(sp)
   12910: 1880         	addi	s0, sp, 0x70
   12912: 8946         	mv	s2, a7
   12914: 89c2         	mv	s3, a6
   12916: 8a3e         	mv	s4, a5
   12918: 8aba         	mv	s5, a4
   1291a: 8b36         	mv	s6, a3
   1291c: 84aa         	mv	s1, a0
   1291e: 7908         	ld	a0, 0x30(a0)
   12920: 7c94         	ld	a3, 0x38(s1)
   12922: 00043b83     	ld	s7, 0x0(s0)
   12926: 00843c03     	ld	s8, 0x8(s0)
   1292a: 01043c83     	ld	s9, 0x10(s0)
   1292e: 6e94         	ld	a3, 0x18(a3)
   12930: 9682         	jalr	a3
   12932: f8943c23     	sd	s1, -0x68(s0)
   12936: faa40023     	sb	a0, -0x60(s0)
   1293a: fa0400a3     	sb	zero, -0x5f(s0)
   1293e: f9840513     	addi	a0, s0, -0x68
   12942: 85da         	mv	a1, s6
   12944: 8656         	mv	a2, s5
   12946: 86d2         	mv	a3, s4
   12948: 874e         	mv	a4, s3
   1294a: fffff097     	auipc	ra, 0xfffff
   1294e: 7ca080e7     	jalr	0x7ca(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff50f4>
   12952: f9840513     	addi	a0, s0, -0x68
   12956: 85ca         	mv	a1, s2
   12958: 865e         	mv	a2, s7
   1295a: 86e2         	mv	a3, s8
   1295c: 8766         	mv	a4, s9
   1295e: fffff097     	auipc	ra, 0xfffff
   12962: 7b6080e7     	jalr	0x7b6(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff50f4>
   12966: fa044583     	lbu	a1, -0x60(s0)
   1296a: fa144603     	lbu	a2, -0x5f(s0)
   1296e: 00b66533     	or	a0, a2, a1
   12972: ca1d         	beqz	a2, 0x129a8 <.Lpcrel_hi573+0xc>
   12974: 8985         	andi	a1, a1, 0x1
   12976: e98d         	bnez	a1, 0x129a8 <.Lpcrel_hi573+0xc>
   12978: f9843503     	ld	a0, -0x68(s0)
   1297c: 02454583     	lbu	a1, 0x24(a0)
   12980: 8991         	andi	a1, a1, 0x4
   12982: e991         	bnez	a1, 0x12996 <.Lpcrel_hi572+0xc>
   12984: 7d0c         	ld	a1, 0x38(a0)
   12986: 7908         	ld	a0, 0x30(a0)
   12988: 6d94         	ld	a3, 0x18(a1)

000000000001298a <.Lpcrel_hi572>:
   1298a: 00002597     	auipc	a1, 0x2
   1298e: 29958593     	addi	a1, a1, 0x299
   12992: 4609         	li	a2, 0x2
   12994: a809         	j	0x129a6 <.Lpcrel_hi573+0xa>
   12996: 7d0c         	ld	a1, 0x38(a0)
   12998: 7908         	ld	a0, 0x30(a0)
   1299a: 6d94         	ld	a3, 0x18(a1)

000000000001299c <.Lpcrel_hi573>:
   1299c: 00002597     	auipc	a1, 0x2
   129a0: 28658593     	addi	a1, a1, 0x286
   129a4: 4605         	li	a2, 0x1
   129a6: 9682         	jalr	a3
   129a8: 8905         	andi	a0, a0, 0x1
   129aa: 70a6         	ld	ra, 0x68(sp)
   129ac: 7406         	ld	s0, 0x60(sp)
   129ae: 64e6         	ld	s1, 0x58(sp)
   129b0: 6946         	ld	s2, 0x50(sp)
   129b2: 69a6         	ld	s3, 0x48(sp)
   129b4: 6a06         	ld	s4, 0x40(sp)
   129b6: 7ae2         	ld	s5, 0x38(sp)
   129b8: 7b42         	ld	s6, 0x30(sp)
   129ba: 7ba2         	ld	s7, 0x28(sp)
   129bc: 7c02         	ld	s8, 0x20(sp)
   129be: 6ce2         	ld	s9, 0x18(sp)
   129c0: 6165         	addi	sp, sp, 0x70
   129c2: 8082         	ret

00000000000129c4 <_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hc5eacf3f24554cf9E>:
   129c4: 7171         	addi	sp, sp, -0xb0
   129c6: f506         	sd	ra, 0xa8(sp)
   129c8: f122         	sd	s0, 0xa0(sp)
   129ca: ed26         	sd	s1, 0x98(sp)
   129cc: e94a         	sd	s2, 0x90(sp)
   129ce: e54e         	sd	s3, 0x88(sp)
   129d0: e152         	sd	s4, 0x80(sp)
   129d2: fcd6         	sd	s5, 0x78(sp)
   129d4: f8da         	sd	s6, 0x70(sp)
   129d6: f4de         	sd	s7, 0x68(sp)
   129d8: f0e2         	sd	s8, 0x60(sp)
   129da: 1900         	addi	s0, sp, 0xb0
   129dc: 8aba         	mv	s5, a4
   129de: 8a36         	mv	s4, a3
   129e0: 8932         	mv	s2, a2
   129e2: 8b2a         	mv	s6, a0
   129e4: 03853b83     	ld	s7, 0x38(a0)
   129e8: 03053c03     	ld	s8, 0x30(a0)
   129ec: 018bb483     	ld	s1, 0x18(s7)
   129f0: 8562         	mv	a0, s8
   129f2: 9482         	jalr	s1
   129f4: 4985         	li	s3, 0x1
   129f6: cd11         	beqz	a0, 0x12a12 <_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hc5eacf3f24554cf9E+0x4e>
   129f8: 854e         	mv	a0, s3
   129fa: 70aa         	ld	ra, 0xa8(sp)
   129fc: 740a         	ld	s0, 0xa0(sp)
   129fe: 64ea         	ld	s1, 0x98(sp)
   12a00: 694a         	ld	s2, 0x90(sp)
   12a02: 69aa         	ld	s3, 0x88(sp)
   12a04: 6a0a         	ld	s4, 0x80(sp)
   12a06: 7ae6         	ld	s5, 0x78(sp)
   12a08: 7b46         	ld	s6, 0x70(sp)
   12a0a: 7ba6         	ld	s7, 0x68(sp)
   12a0c: 7c06         	ld	s8, 0x60(sp)
   12a0e: 614d         	addi	sp, sp, 0xb0
   12a10: 8082         	ret
   12a12: 024b4503     	lbu	a0, 0x24(s6)
   12a16: 8911         	andi	a0, a0, 0x4
   12a18: e10d         	bnez	a0, 0x12a3a <.Lpcrel_hi585>

0000000000012a1a <.Lpcrel_hi584>:
   12a1a: 00002517     	auipc	a0, 0x2
   12a1e: 20b50593     	addi	a1, a0, 0x20b
   12a22: 4605         	li	a2, 0x1
   12a24: 4985         	li	s3, 0x1
   12a26: 8562         	mv	a0, s8
   12a28: 9482         	jalr	s1
   12a2a: f579         	bnez	a0, 0x129f8 <_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hc5eacf3f24554cf9E+0x34>
   12a2c: 018ab603     	ld	a2, 0x18(s5)
   12a30: 8552         	mv	a0, s4
   12a32: 85da         	mv	a1, s6
   12a34: 9602         	jalr	a2
   12a36: f169         	bnez	a0, 0x129f8 <_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hc5eacf3f24554cf9E+0x34>
   12a38: a849         	j	0x12aca <.Lpcrel_hi587+0xe>

0000000000012a3a <.Lpcrel_hi585>:
   12a3a: 00002517     	auipc	a0, 0x2
   12a3e: 1ec50593     	addi	a1, a0, 0x1ec
   12a42: 4609         	li	a2, 0x2
   12a44: 8562         	mv	a0, s8
   12a46: 9482         	jalr	s1
   12a48: f945         	bnez	a0, 0x129f8 <_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hc5eacf3f24554cf9E+0x34>
   12a4a: 4985         	li	s3, 0x1
   12a4c: f6f40513     	addi	a0, s0, -0x91
   12a50: 000b3583     	ld	a1, 0x0(s6)
   12a54: 008b3603     	ld	a2, 0x8(s6)
   12a58: 010b3683     	ld	a3, 0x10(s6)
   12a5c: 018b3703     	ld	a4, 0x18(s6)
   12a60: 020b3783     	ld	a5, 0x20(s6)
   12a64: 028b3483     	ld	s1, 0x28(s6)
   12a68: f5843823     	sd	s8, -0xb0(s0)
   12a6c: f5743c23     	sd	s7, -0xa8(s0)
   12a70: f6a43023     	sd	a0, -0xa0(s0)
   12a74: f5040513     	addi	a0, s0, -0xb0
   12a78: f6b43823     	sd	a1, -0x90(s0)
   12a7c: f6c43c23     	sd	a2, -0x88(s0)
   12a80: f8d43023     	sd	a3, -0x80(s0)
   12a84: f8e43423     	sd	a4, -0x78(s0)

0000000000012a88 <.Lpcrel_hi586>:
   12a88: 00002597     	auipc	a1, 0x2
   12a8c: 018ab603     	ld	a2, 0x18(s5)
   12a90: f73407a3     	sb	s3, -0x91(s0)
   12a94: 16058593     	addi	a1, a1, 0x160
   12a98: f8f43823     	sd	a5, -0x70(s0)
   12a9c: f8943c23     	sd	s1, -0x68(s0)
   12aa0: faa43023     	sd	a0, -0x60(s0)
   12aa4: fab43423     	sd	a1, -0x58(s0)
   12aa8: f7040593     	addi	a1, s0, -0x90
   12aac: 8552         	mv	a0, s4
   12aae: 9602         	jalr	a2
   12ab0: f521         	bnez	a0, 0x129f8 <_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hc5eacf3f24554cf9E+0x34>
   12ab2: fa843583     	ld	a1, -0x58(s0)
   12ab6: fa043503     	ld	a0, -0x60(s0)
   12aba: 6d94         	ld	a3, 0x18(a1)

0000000000012abc <.Lpcrel_hi587>:
   12abc: 00002597     	auipc	a1, 0x2
   12ac0: 16458593     	addi	a1, a1, 0x164
   12ac4: 4609         	li	a2, 0x2
   12ac6: 9682         	jalr	a3
   12ac8: f905         	bnez	a0, 0x129f8 <_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hc5eacf3f24554cf9E+0x34>
   12aca: 02091363     	bnez	s2, 0x12af0 <.Lpcrel_hi589+0x10>
   12ace: 024b4503     	lbu	a0, 0x24(s6)
   12ad2: 8911         	andi	a0, a0, 0x4
   12ad4: ed11         	bnez	a0, 0x12af0 <.Lpcrel_hi589+0x10>
   12ad6: 038b3583     	ld	a1, 0x38(s6)
   12ada: 030b3503     	ld	a0, 0x30(s6)
   12ade: 6d94         	ld	a3, 0x18(a1)

0000000000012ae0 <.Lpcrel_hi589>:
   12ae0: 00002597     	auipc	a1, 0x2
   12ae4: 14858593     	addi	a1, a1, 0x148
   12ae8: 4605         	li	a2, 0x1
   12aea: 4985         	li	s3, 0x1
   12aec: 9682         	jalr	a3
   12aee: f509         	bnez	a0, 0x129f8 <_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hc5eacf3f24554cf9E+0x34>
   12af0: 038b3583     	ld	a1, 0x38(s6)
   12af4: 030b3503     	ld	a0, 0x30(s6)
   12af8: 6d94         	ld	a3, 0x18(a1)

0000000000012afa <.Lpcrel_hi588>:
   12afa: 00002597     	auipc	a1, 0x2
   12afe: f3558593     	addi	a1, a1, -0xcb
   12b02: 4605         	li	a2, 0x1
   12b04: 9682         	jalr	a3
   12b06: 89aa         	mv	s3, a0
   12b08: bdc5         	j	0x129f8 <_ZN4core3fmt9Formatter25debug_tuple_field1_finish17hc5eacf3f24554cf9E+0x34>

0000000000012b0a <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h67f5dc862fdd3cceE>:
   12b0a: 1141         	addi	sp, sp, -0x10
   12b0c: e406         	sd	ra, 0x8(sp)
   12b0e: e022         	sd	s0, 0x0(sp)
   12b10: 0800         	addi	s0, sp, 0x10
   12b12: 86ae         	mv	a3, a1
   12b14: 85aa         	mv	a1, a0
   12b16: 8532         	mv	a0, a2
   12b18: 8636         	mv	a2, a3
   12b1a: 60a2         	ld	ra, 0x8(sp)
   12b1c: 6402         	ld	s0, 0x0(sp)
   12b1e: 0141         	addi	sp, sp, 0x10
   12b20: 00000317     	auipc	t1, 0x0
   12b24: c0430067     	jr	-0x3fc(t1) <_ZN4core3fmt9Formatter3pad17h50a470842fd2f05eE>

0000000000012b28 <_ZN4core3str8converts9from_utf817h738c3b55a64ab805E>:
   12b28: 7159         	addi	sp, sp, -0x70
   12b2a: f486         	sd	ra, 0x68(sp)
   12b2c: f0a2         	sd	s0, 0x60(sp)
   12b2e: eca6         	sd	s1, 0x58(sp)
   12b30: e8ca         	sd	s2, 0x50(sp)
   12b32: e4ce         	sd	s3, 0x48(sp)
   12b34: e0d2         	sd	s4, 0x40(sp)
   12b36: fc56         	sd	s5, 0x38(sp)
   12b38: f85a         	sd	s6, 0x30(sp)
   12b3a: f45e         	sd	s7, 0x28(sp)
   12b3c: f062         	sd	s8, 0x20(sp)
   12b3e: ec66         	sd	s9, 0x18(sp)
   12b40: e86a         	sd	s10, 0x10(sp)
   12b42: e46e         	sd	s11, 0x8(sp)
   12b44: 1880         	addi	s0, sp, 0x70
   12b46: 1c060063     	beqz	a2, 0x12d06 <.Lpcrel_hi682+0x136>
   12b4a: 4681         	li	a3, 0x0
   12b4c: ff160713     	addi	a4, a2, -0xf
   12b50: 00758b93     	addi	s7, a1, 0x7
   12b54: 00858d13     	addi	s10, a1, 0x8
   12b58: 40c000b3     	neg	ra, a2

0000000000012b5c <.Lpcrel_hi681>:
   12b5c: 00002c17     	auipc	s8, 0x2
   12b60: 4811         	li	a6, 0x4
   12b62: 0f000893     	li	a7, 0xf0
   12b66: fbf00313     	li	t1, -0x41
   12b6a: 0f400393     	li	t2, 0xf4
   12b6e: f8f00e13     	li	t3, -0x71
   12b72: 4e89         	li	t4, 0x2
   12b74: fc000f13     	li	t5, -0x40
   12b78: 4f8d         	li	t6, 0x3
   12b7a: 0e000b13     	li	s6, 0xe0
   12b7e: 0a000913     	li	s2, 0xa0
   12b82: 0ed00993     	li	s3, 0xed
   12b86: f9f00a13     	li	s4, -0x61
   12b8a: 4ab1         	li	s5, 0xc
   12b8c: 00e637b3     	sltu	a5, a2, a4
   12b90: ff8bf493     	andi	s1, s7, -0x8
   12b94: 197c0c13     	addi	s8, s8, 0x197
   12b98: 17fd         	addi	a5, a5, -0x1
   12b9a: 40b48cb3     	sub	s9, s1, a1
   12b9e: 00e7f2b3     	and	t0, a5, a4
   12ba2: 4b85         	li	s7, 0x1
   12ba4: a021         	j	0x12bac <.Lpcrel_hi681+0x50>
   12ba6: 0685         	addi	a3, a3, 0x1
   12ba8: 14c6ff63     	bgeu	a3, a2, 0x12d06 <.Lpcrel_hi682+0x136>
   12bac: 00d58733     	add	a4, a1, a3
   12bb0: 00070703     	lb	a4, 0x0(a4)
   12bb4: 04074663     	bltz	a4, 0x12c00 <.Lpcrel_hi682+0x30>
   12bb8: 40dc873b     	subw	a4, s9, a3
   12bbc: 8b1d         	andi	a4, a4, 0x7
   12bbe: f765         	bnez	a4, 0x12ba6 <.Lpcrel_hi681+0x4a>
   12bc0: 0256f263     	bgeu	a3, t0, 0x12be4 <.Lpcrel_hi682+0x14>
   12bc4: 00d58733     	add	a4, a1, a3
   12bc8: 00dd07b3     	add	a5, s10, a3
   12bcc: 6318         	ld	a4, 0x0(a4)
   12bce: 639c         	ld	a5, 0x0(a5)

0000000000012bd0 <.Lpcrel_hi682>:
   12bd0: 00001497     	auipc	s1, 0x1
   12bd4: 4504b483     	ld	s1, 0x450(s1)
   12bd8: 8f5d         	or	a4, a4, a5
   12bda: 8f65         	and	a4, a4, s1
   12bdc: e701         	bnez	a4, 0x12be4 <.Lpcrel_hi682+0x14>
   12bde: 06c1         	addi	a3, a3, 0x10
   12be0: fe56e2e3     	bltu	a3, t0, 0x12bc4 <.Lpcrel_hi681+0x68>
   12be4: 08c6fa63     	bgeu	a3, a2, 0x12c78 <.Lpcrel_hi682+0xa8>
   12be8: 40d007b3     	neg	a5, a3
   12bec: 96ae         	add	a3, a3, a1
   12bee: 00068703     	lb	a4, 0x0(a3)
   12bf2: 08074163     	bltz	a4, 0x12c74 <.Lpcrel_hi682+0xa4>
   12bf6: 17fd         	addi	a5, a5, -0x1
   12bf8: 0685         	addi	a3, a3, 0x1
   12bfa: fef09ae3     	bne	ra, a5, 0x12bee <.Lpcrel_hi682+0x1e>
   12bfe: a221         	j	0x12d06 <.Lpcrel_hi682+0x136>
   12c00: 0ff77793     	andi	a5, a4, 0xff
   12c04: 00fc0733     	add	a4, s8, a5
   12c08: 00074703     	lbu	a4, 0x0(a4)
   12c0c: 05070363     	beq	a4, a6, 0x12c52 <.Lpcrel_hi682+0x82>
   12c10: 03f70063     	beq	a4, t6, 0x12c30 <.Lpcrel_hi682+0x60>
   12c14: 0fd71f63     	bne	a4, t4, 0x12d12 <.Lpcrel_hi682+0x142>
   12c18: 00168793     	addi	a5, a3, 0x1
   12c1c: 0ec7f963     	bgeu	a5, a2, 0x12d0e <.Lpcrel_hi682+0x13e>
   12c20: 00f58733     	add	a4, a1, a5
   12c24: 00070703     	lb	a4, 0x0(a4)
   12c28: 4d85         	li	s11, 0x1
   12c2a: 0ce35a63     	bge	t1, a4, 0x12cfe <.Lpcrel_hi682+0x12e>
   12c2e: a0fd         	j	0x12d1c <.Lpcrel_hi682+0x14c>
   12c30: 00168713     	addi	a4, a3, 0x1
   12c34: 0cc77d63     	bgeu	a4, a2, 0x12d0e <.Lpcrel_hi682+0x13e>
   12c38: 972e         	add	a4, a4, a1
   12c3a: 00074d83     	lbu	s11, 0x0(a4)
   12c3e: 05678063     	beq	a5, s6, 0x12c7e <.Lpcrel_hi682+0xae>
   12c42: 1de2         	slli	s11, s11, 0x38
   12c44: 05379963     	bne	a5, s3, 0x12c96 <.Lpcrel_hi682+0xc6>
   12c48: 438dd713     	srai	a4, s11, 0x38
   12c4c: 06ea5363     	bge	s4, a4, 0x12cb2 <.Lpcrel_hi682+0xe2>
   12c50: a0c9         	j	0x12d12 <.Lpcrel_hi682+0x142>
   12c52: 00168713     	addi	a4, a3, 0x1
   12c56: 0ac77c63     	bgeu	a4, a2, 0x12d0e <.Lpcrel_hi682+0x13e>
   12c5a: 972e         	add	a4, a4, a1
   12c5c: 00074d83     	lbu	s11, 0x0(a4)
   12c60: 03178463     	beq	a5, a7, 0x12c88 <.Lpcrel_hi682+0xb8>
   12c64: 1de2         	slli	s11, s11, 0x38
   12c66: 06779163     	bne	a5, t2, 0x12cc8 <.Lpcrel_hi682+0xf8>
   12c6a: 438dd713     	srai	a4, s11, 0x38
   12c6e: 06ee5563     	bge	t3, a4, 0x12cd8 <.Lpcrel_hi682+0x108>
   12c72: a045         	j	0x12d12 <.Lpcrel_hi682+0x142>
   12c74: 40f006b3     	neg	a3, a5
   12c78: f2c6eae3     	bltu	a3, a2, 0x12bac <.Lpcrel_hi681+0x50>
   12c7c: a069         	j	0x12d06 <.Lpcrel_hi682+0x136>
   12c7e: 0e0df713     	andi	a4, s11, 0xe0
   12c82: 03270863     	beq	a4, s2, 0x12cb2 <.Lpcrel_hi682+0xe2>
   12c86: a071         	j	0x12d12 <.Lpcrel_hi682+0x142>
   12c88: f70d8713     	addi	a4, s11, -0x90
   12c8c: 03000793     	li	a5, 0x30
   12c90: 04f76463     	bltu	a4, a5, 0x12cd8 <.Lpcrel_hi682+0x108>
   12c94: a8bd         	j	0x12d12 <.Lpcrel_hi682+0x142>
   12c96: f1f78713     	addi	a4, a5, -0xe1
   12c9a: 01576863     	bltu	a4, s5, 0x12caa <.Lpcrel_hi682+0xda>
   12c9e: 0fe7f713     	andi	a4, a5, 0xfe
   12ca2: 0ee00793     	li	a5, 0xee
   12ca6: 06f71663     	bne	a4, a5, 0x12d12 <.Lpcrel_hi682+0x142>
   12caa: 438dd713     	srai	a4, s11, 0x38
   12cae: 07e75263     	bge	a4, t5, 0x12d12 <.Lpcrel_hi682+0x142>
   12cb2: 00268793     	addi	a5, a3, 0x2
   12cb6: 04c7fc63     	bgeu	a5, a2, 0x12d0e <.Lpcrel_hi682+0x13e>
   12cba: 00f58733     	add	a4, a1, a5
   12cbe: 00070703     	lb	a4, 0x0(a4)
   12cc2: 02e35e63     	bge	t1, a4, 0x12cfe <.Lpcrel_hi682+0x12e>
   12cc6: a881         	j	0x12d16 <.Lpcrel_hi682+0x146>
   12cc8: f0f78713     	addi	a4, a5, -0xf1
   12ccc: 04eee363     	bltu	t4, a4, 0x12d12 <.Lpcrel_hi682+0x142>
   12cd0: 438dd713     	srai	a4, s11, 0x38
   12cd4: 03e75f63     	bge	a4, t5, 0x12d12 <.Lpcrel_hi682+0x142>
   12cd8: 00268713     	addi	a4, a3, 0x2
   12cdc: 02c77963     	bgeu	a4, a2, 0x12d0e <.Lpcrel_hi682+0x13e>
   12ce0: 972e         	add	a4, a4, a1
   12ce2: 00070703     	lb	a4, 0x0(a4)
   12ce6: 02e34863     	blt	t1, a4, 0x12d16 <.Lpcrel_hi682+0x146>
   12cea: 00368793     	addi	a5, a3, 0x3
   12cee: 02c7f063     	bgeu	a5, a2, 0x12d0e <.Lpcrel_hi682+0x13e>
   12cf2: 00f58733     	add	a4, a1, a5
   12cf6: 00070703     	lb	a4, 0x0(a4)
   12cfa: 02e34063     	blt	t1, a4, 0x12d1a <.Lpcrel_hi682+0x14a>
   12cfe: 00178693     	addi	a3, a5, 0x1
   12d02: eac6e5e3     	bltu	a3, a2, 0x12bac <.Lpcrel_hi681+0x50>
   12d06: 4681         	li	a3, 0x0
   12d08: e50c         	sd	a1, 0x8(a0)
   12d0a: e910         	sd	a2, 0x10(a0)
   12d0c: a831         	j	0x12d28 <.Lpcrel_hi682+0x158>
   12d0e: 4b81         	li	s7, 0x0
   12d10: a031         	j	0x12d1c <.Lpcrel_hi682+0x14c>
   12d12: 4d85         	li	s11, 0x1
   12d14: a021         	j	0x12d1c <.Lpcrel_hi682+0x14c>
   12d16: 4d89         	li	s11, 0x2
   12d18: a011         	j	0x12d1c <.Lpcrel_hi682+0x14c>
   12d1a: 4d8d         	li	s11, 0x3
   12d1c: e514         	sd	a3, 0x8(a0)
   12d1e: 01750823     	sb	s7, 0x10(a0)
   12d22: 01b508a3     	sb	s11, 0x11(a0)
   12d26: 4685         	li	a3, 0x1
   12d28: e114         	sd	a3, 0x0(a0)
   12d2a: 70a6         	ld	ra, 0x68(sp)
   12d2c: 7406         	ld	s0, 0x60(sp)
   12d2e: 64e6         	ld	s1, 0x58(sp)
   12d30: 6946         	ld	s2, 0x50(sp)
   12d32: 69a6         	ld	s3, 0x48(sp)
   12d34: 6a06         	ld	s4, 0x40(sp)
   12d36: 7ae2         	ld	s5, 0x38(sp)
   12d38: 7b42         	ld	s6, 0x30(sp)
   12d3a: 7ba2         	ld	s7, 0x28(sp)
   12d3c: 7c02         	ld	s8, 0x20(sp)
   12d3e: 6ce2         	ld	s9, 0x18(sp)
   12d40: 6d42         	ld	s10, 0x10(sp)
   12d42: 6da2         	ld	s11, 0x8(sp)
   12d44: 6165         	addi	sp, sp, 0x70
   12d46: 8082         	ret

0000000000012d48 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E>:
   12d48: 1101         	addi	sp, sp, -0x20
   12d4a: ec06         	sd	ra, 0x18(sp)
   12d4c: e822         	sd	s0, 0x10(sp)
   12d4e: e426         	sd	s1, 0x8(sp)
   12d50: e04a         	sd	s2, 0x0(sp)
   12d52: 1000         	addi	s0, sp, 0x20
   12d54: 862a         	mv	a2, a0
   12d56: 00750693     	addi	a3, a0, 0x7
   12d5a: 9ae1         	andi	a3, a3, -0x8
   12d5c: 40a687b3     	sub	a5, a3, a0
   12d60: 02f5f563     	bgeu	a1, a5, 0x12d8a <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x42>
   12d64: 4501         	li	a0, 0x0
   12d66: cd81         	beqz	a1, 0x12d7e <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x36>
   12d68: 95b2         	add	a1, a1, a2
   12d6a: 00060683     	lb	a3, 0x0(a2)
   12d6e: 0605         	addi	a2, a2, 0x1
   12d70: fc06a693     	slti	a3, a3, -0x40
   12d74: 0016c693     	xori	a3, a3, 0x1
   12d78: 9536         	add	a0, a0, a3
   12d7a: feb618e3     	bne	a2, a1, 0x12d6a <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x22>
   12d7e: 60e2         	ld	ra, 0x18(sp)
   12d80: 6442         	ld	s0, 0x10(sp)
   12d82: 64a2         	ld	s1, 0x8(sp)
   12d84: 6902         	ld	s2, 0x0(sp)
   12d86: 6105         	addi	sp, sp, 0x20
   12d88: 8082         	ret
   12d8a: 40f58733     	sub	a4, a1, a5
   12d8e: 00375813     	srli	a6, a4, 0x3
   12d92: fc0809e3     	beqz	a6, 0x12d64 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x1c>
   12d96: 97b2         	add	a5, a5, a2
   12d98: 00777893     	andi	a7, a4, 0x7
   12d9c: 4501         	li	a0, 0x0
   12d9e: 00c68c63     	beq	a3, a2, 0x12db6 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x6e>
   12da2: 00060583     	lb	a1, 0x0(a2)
   12da6: 0605         	addi	a2, a2, 0x1
   12da8: fc05a593     	slti	a1, a1, -0x40
   12dac: 0015c593     	xori	a1, a1, 0x1
   12db0: 952e         	add	a0, a0, a1
   12db2: fef618e3     	bne	a2, a5, 0x12da2 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x5a>
   12db6: 4581         	li	a1, 0x0
   12db8: 02088163     	beqz	a7, 0x12dda <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x92>
   12dbc: ff877613     	andi	a2, a4, -0x8
   12dc0: 96b2         	add	a3, a3, a2
   12dc2: 963e         	add	a2, a2, a5
   12dc4: 98b6         	add	a7, a7, a3
   12dc6: 00060683     	lb	a3, 0x0(a2)
   12dca: 0605         	addi	a2, a2, 0x1
   12dcc: fc06a693     	slti	a3, a3, -0x40
   12dd0: 0016c693     	xori	a3, a3, 0x1
   12dd4: 95b6         	add	a1, a1, a3
   12dd6: ff1618e3     	bne	a2, a7, 0x12dc6 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x7e>
   12dda: 01010637     	lui	a2, 0x1010
   12dde: 00ff06b7     	lui	a3, 0xff0
   12de2: 6741         	lui	a4, 0x10
   12de4: 952e         	add	a0, a0, a1
   12de6: 1016059b     	addiw	a1, a2, 0x101
   12dea: 0ff6831b     	addiw	t1, a3, 0xff
   12dee: 2705         	addiw	a4, a4, 0x1
   12df0: 02059693     	slli	a3, a1, 0x20
   12df4: 02031613     	slli	a2, t1, 0x20
   12df8: 00d58fb3     	add	t6, a1, a3
   12dfc: 02071293     	slli	t0, a4, 0x20
   12e00: 9332         	add	t1, t1, a2
   12e02: 92ba         	add	t0, t0, a4
   12e04: 4891         	li	a7, 0x4
   12e06: a01d         	j	0x12e2c <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0xe4>
   12e08: 010e07b3     	add	a5, t3, a6
   12e0c: 407e8833     	sub	a6, t4, t2
   12e10: 0033f593     	andi	a1, t2, 0x3
   12e14: 00697633     	and	a2, s2, t1
   12e18: 00895693     	srli	a3, s2, 0x8
   12e1c: 0066f6b3     	and	a3, a3, t1
   12e20: 9636         	add	a2, a2, a3
   12e22: 02560633     	mul	a2, a2, t0
   12e26: 9241         	srli	a2, a2, 0x30
   12e28: 9532         	add	a0, a0, a2
   12e2a: edbd         	bnez	a1, 0x12ea8 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x160>
   12e2c: f40809e3     	beqz	a6, 0x12d7e <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x36>
   12e30: 8ec2         	mv	t4, a6
   12e32: 8e3e         	mv	t3, a5
   12e34: 0c000593     	li	a1, 0xc0
   12e38: 83c2         	mv	t2, a6
   12e3a: 00b86463     	bltu	a6, a1, 0x12e42 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0xfa>
   12e3e: 0c000393     	li	t2, 0xc0
   12e42: 00339813     	slli	a6, t2, 0x3
   12e46: 4901         	li	s2, 0x0
   12e48: fd1ee0e3     	bltu	t4, a7, 0x12e08 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0xc0>
   12e4c: 7e087793     	andi	a5, a6, 0x7e0
   12e50: 00fe0f33     	add	t5, t3, a5
   12e54: 85f2         	mv	a1, t3
   12e56: 6198         	ld	a4, 0x0(a1)
   12e58: 659c         	ld	a5, 0x8(a1)
   12e5a: 6994         	ld	a3, 0x10(a1)
   12e5c: 6d84         	ld	s1, 0x18(a1)
   12e5e: fff74613     	not	a2, a4
   12e62: 8319         	srli	a4, a4, 0x6
   12e64: 821d         	srli	a2, a2, 0x7
   12e66: 8e59         	or	a2, a2, a4
   12e68: fff7c713     	not	a4, a5
   12e6c: 8399         	srli	a5, a5, 0x6
   12e6e: 831d         	srli	a4, a4, 0x7
   12e70: 8f5d         	or	a4, a4, a5
   12e72: fff6c793     	not	a5, a3
   12e76: 8299         	srli	a3, a3, 0x6
   12e78: 839d         	srli	a5, a5, 0x7
   12e7a: 8edd         	or	a3, a3, a5
   12e7c: fff4c793     	not	a5, s1
   12e80: 8099         	srli	s1, s1, 0x6
   12e82: 839d         	srli	a5, a5, 0x7
   12e84: 8fc5         	or	a5, a5, s1
   12e86: 01f67633     	and	a2, a2, t6
   12e8a: 964a         	add	a2, a2, s2
   12e8c: 01f77733     	and	a4, a4, t6
   12e90: 01f6f6b3     	and	a3, a3, t6
   12e94: 01f7f933     	and	s2, a5, t6
   12e98: 96ba         	add	a3, a3, a4
   12e9a: 9636         	add	a2, a2, a3
   12e9c: 02058593     	addi	a1, a1, 0x20
   12ea0: 9932         	add	s2, s2, a2
   12ea2: fbe59ae3     	bne	a1, t5, 0x12e56 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x10e>
   12ea6: b78d         	j	0x12e08 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0xc0>
   12ea8: 4581         	li	a1, 0x0
   12eaa: 0fc3f613     	andi	a2, t2, 0xfc
   12eae: 060e         	slli	a2, a2, 0x3
   12eb0: 9e32         	add	t3, t3, a2
   12eb2: 0c0eb613     	sltiu	a2, t4, 0xc0
   12eb6: 40c0063b     	negw	a2, a2
   12eba: 00cef633     	and	a2, t4, a2
   12ebe: 8a0d         	andi	a2, a2, 0x3
   12ec0: 060e         	slli	a2, a2, 0x3
   12ec2: 000e3683     	ld	a3, 0x0(t3)
   12ec6: 0e21         	addi	t3, t3, 0x8
   12ec8: fff6c713     	not	a4, a3
   12ecc: 8299         	srli	a3, a3, 0x6
   12ece: 831d         	srli	a4, a4, 0x7
   12ed0: 8ed9         	or	a3, a3, a4
   12ed2: 01f6f6b3     	and	a3, a3, t6
   12ed6: 1661         	addi	a2, a2, -0x8
   12ed8: 95b6         	add	a1, a1, a3
   12eda: f665         	bnez	a2, 0x12ec2 <_ZN4core3str5count14do_count_chars17hffff62c95ddaf229E+0x17a>
   12edc: 0065f633     	and	a2, a1, t1
   12ee0: 81a1         	srli	a1, a1, 0x8
   12ee2: 0065f5b3     	and	a1, a1, t1
   12ee6: 95b2         	add	a1, a1, a2
   12ee8: 025585b3     	mul	a1, a1, t0
   12eec: 91c1         	srli	a1, a1, 0x30
   12eee: 952e         	add	a0, a0, a1
   12ef0: 60e2         	ld	ra, 0x18(sp)
   12ef2: 6442         	ld	s0, 0x10(sp)
   12ef4: 64a2         	ld	s1, 0x8(sp)
   12ef6: 6902         	ld	s2, 0x0(sp)
   12ef8: 6105         	addi	sp, sp, 0x20
   12efa: 8082         	ret

0000000000012efc <_ZN73_$LT$core..num..nonzero..NonZero$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hec75d4021bc2f72cE>:
   12efc: 7175         	addi	sp, sp, -0x90
   12efe: e506         	sd	ra, 0x88(sp)
   12f00: e122         	sd	s0, 0x80(sp)
   12f02: 0900         	addi	s0, sp, 0x90
   12f04: 882e         	mv	a6, a1
   12f06: 0245e583     	lwu	a1, 0x24(a1)
   12f0a: 6108         	ld	a0, 0x0(a0)
   12f0c: 0105f613     	andi	a2, a1, 0x10
   12f10: ee09         	bnez	a2, 0x12f2a <_ZN73_$LT$core..num..nonzero..NonZero$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hec75d4021bc2f72cE+0x2e>
   12f12: 0205f593     	andi	a1, a1, 0x20
   12f16: edb1         	bnez	a1, 0x12f72 <.Lpcrel_hi913+0xc>
   12f18: 4585         	li	a1, 0x1
   12f1a: 8642         	mv	a2, a6
   12f1c: 60aa         	ld	ra, 0x88(sp)
   12f1e: 640a         	ld	s0, 0x80(sp)
   12f20: 6149         	addi	sp, sp, 0x90
   12f22: 00000317     	auipc	t1, 0x0
   12f26: 56230067     	jr	0x562(t1) <_ZN4core3fmt3num3imp21_$LT$impl$u20$u64$GT$4_fmt17hf735e6a3f81ca742E>
   12f2a: 4781         	li	a5, 0x0
   12f2c: fef40593     	addi	a1, s0, -0x11
   12f30: 4629         	li	a2, 0xa
   12f32: a809         	j	0x12f44 <_ZN73_$LT$core..num..nonzero..NonZero$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hec75d4021bc2f72cE+0x48>
   12f34: 05768693     	addi	a3, a3, 0x57
   12f38: 8111         	srli	a0, a0, 0x4
   12f3a: 00d58023     	sb	a3, 0x0(a1)
   12f3e: 0785         	addi	a5, a5, 0x1
   12f40: 15fd         	addi	a1, a1, -0x1
   12f42: cd09         	beqz	a0, 0x12f5c <_ZN73_$LT$core..num..nonzero..NonZero$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hec75d4021bc2f72cE+0x60>
   12f44: 00f57693     	andi	a3, a0, 0xf
   12f48: fec6f6e3     	bgeu	a3, a2, 0x12f34 <_ZN73_$LT$core..num..nonzero..NonZero$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hec75d4021bc2f72cE+0x38>
   12f4c: 03068693     	addi	a3, a3, 0x30
   12f50: 8111         	srli	a0, a0, 0x4
   12f52: 00d58023     	sb	a3, 0x0(a1)
   12f56: 0785         	addi	a5, a5, 0x1
   12f58: 15fd         	addi	a1, a1, -0x1
   12f5a: f56d         	bnez	a0, 0x12f44 <_ZN73_$LT$core..num..nonzero..NonZero$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hec75d4021bc2f72cE+0x48>
   12f5c: f7040513     	addi	a0, s0, -0x90
   12f60: 8d1d         	sub	a0, a0, a5
   12f62: 08050713     	addi	a4, a0, 0x80

0000000000012f66 <.Lpcrel_hi913>:
   12f66: 00002517     	auipc	a0, 0x2
   12f6a: 4585         	li	a1, 0x1
   12f6c: cc350613     	addi	a2, a0, -0x33d
   12f70: a0a1         	j	0x12fb8 <.Lpcrel_hi914+0xa>
   12f72: 4781         	li	a5, 0x0
   12f74: fef40593     	addi	a1, s0, -0x11
   12f78: 4629         	li	a2, 0xa
   12f7a: a809         	j	0x12f8c <.Lpcrel_hi913+0x26>
   12f7c: 03768693     	addi	a3, a3, 0x37
   12f80: 8111         	srli	a0, a0, 0x4
   12f82: 00d58023     	sb	a3, 0x0(a1)
   12f86: 0785         	addi	a5, a5, 0x1
   12f88: 15fd         	addi	a1, a1, -0x1
   12f8a: cd09         	beqz	a0, 0x12fa4 <.Lpcrel_hi913+0x3e>
   12f8c: 00f57693     	andi	a3, a0, 0xf
   12f90: fec6f6e3     	bgeu	a3, a2, 0x12f7c <.Lpcrel_hi913+0x16>
   12f94: 03068693     	addi	a3, a3, 0x30
   12f98: 8111         	srli	a0, a0, 0x4
   12f9a: 00d58023     	sb	a3, 0x0(a1)
   12f9e: 0785         	addi	a5, a5, 0x1
   12fa0: 15fd         	addi	a1, a1, -0x1
   12fa2: f56d         	bnez	a0, 0x12f8c <.Lpcrel_hi913+0x26>
   12fa4: f7040513     	addi	a0, s0, -0x90
   12fa8: 8d1d         	sub	a0, a0, a5
   12faa: 08050713     	addi	a4, a0, 0x80

0000000000012fae <.Lpcrel_hi914>:
   12fae: 00002517     	auipc	a0, 0x2
   12fb2: 4585         	li	a1, 0x1
   12fb4: c7b50613     	addi	a2, a0, -0x385
   12fb8: 4689         	li	a3, 0x2
   12fba: 8542         	mv	a0, a6
   12fbc: fffff097     	auipc	ra, 0xfffff
   12fc0: 4e4080e7     	jalr	0x4e4(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5480>
   12fc4: 60aa         	ld	ra, 0x88(sp)
   12fc6: 640a         	ld	s0, 0x80(sp)
   12fc8: 6149         	addi	sp, sp, 0x90
   12fca: 8082         	ret

0000000000012fcc <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17he7375797a8d2e315E>:
   12fcc: 7175         	addi	sp, sp, -0x90
   12fce: e506         	sd	ra, 0x88(sp)
   12fd0: e122         	sd	s0, 0x80(sp)
   12fd2: 0900         	addi	s0, sp, 0x90
   12fd4: 882e         	mv	a6, a1
   12fd6: 4781         	li	a5, 0x0
   12fd8: 00054503     	lbu	a0, 0x0(a0)
   12fdc: fef40593     	addi	a1, s0, -0x11
   12fe0: 4629         	li	a2, 0xa
   12fe2: a809         	j	0x12ff4 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17he7375797a8d2e315E+0x28>
   12fe4: 05768693     	addi	a3, a3, 0x57
   12fe8: 8111         	srli	a0, a0, 0x4
   12fea: 00d58023     	sb	a3, 0x0(a1)
   12fee: 0785         	addi	a5, a5, 0x1
   12ff0: 15fd         	addi	a1, a1, -0x1
   12ff2: cd09         	beqz	a0, 0x1300c <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17he7375797a8d2e315E+0x40>
   12ff4: 00f57693     	andi	a3, a0, 0xf
   12ff8: fec6f6e3     	bgeu	a3, a2, 0x12fe4 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17he7375797a8d2e315E+0x18>
   12ffc: 03068693     	addi	a3, a3, 0x30
   13000: 8111         	srli	a0, a0, 0x4
   13002: 00d58023     	sb	a3, 0x0(a1)
   13006: 0785         	addi	a5, a5, 0x1
   13008: 15fd         	addi	a1, a1, -0x1
   1300a: f56d         	bnez	a0, 0x12ff4 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17he7375797a8d2e315E+0x28>
   1300c: f7040513     	addi	a0, s0, -0x90
   13010: 8d1d         	sub	a0, a0, a5
   13012: 08050713     	addi	a4, a0, 0x80

0000000000013016 <.Lpcrel_hi1018>:
   13016: 00002517     	auipc	a0, 0x2
   1301a: 4585         	li	a1, 0x1
   1301c: c1350613     	addi	a2, a0, -0x3ed
   13020: 4689         	li	a3, 0x2
   13022: 8542         	mv	a0, a6
   13024: fffff097     	auipc	ra, 0xfffff
   13028: 47c080e7     	jalr	0x47c(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5480>
   1302c: 60aa         	ld	ra, 0x88(sp)
   1302e: 640a         	ld	s0, 0x80(sp)
   13030: 6149         	addi	sp, sp, 0x90
   13032: 8082         	ret

0000000000013034 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u8$GT$3fmt17h6087460a09305b13E>:
   13034: 7175         	addi	sp, sp, -0x90
   13036: e506         	sd	ra, 0x88(sp)
   13038: e122         	sd	s0, 0x80(sp)
   1303a: 0900         	addi	s0, sp, 0x90
   1303c: 882e         	mv	a6, a1
   1303e: 4781         	li	a5, 0x0
   13040: 00054503     	lbu	a0, 0x0(a0)
   13044: fef40593     	addi	a1, s0, -0x11
   13048: 4629         	li	a2, 0xa
   1304a: a809         	j	0x1305c <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u8$GT$3fmt17h6087460a09305b13E+0x28>
   1304c: 03768693     	addi	a3, a3, 0x37
   13050: 8111         	srli	a0, a0, 0x4
   13052: 00d58023     	sb	a3, 0x0(a1)
   13056: 0785         	addi	a5, a5, 0x1
   13058: 15fd         	addi	a1, a1, -0x1
   1305a: cd09         	beqz	a0, 0x13074 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u8$GT$3fmt17h6087460a09305b13E+0x40>
   1305c: 00f57693     	andi	a3, a0, 0xf
   13060: fec6f6e3     	bgeu	a3, a2, 0x1304c <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u8$GT$3fmt17h6087460a09305b13E+0x18>
   13064: 03068693     	addi	a3, a3, 0x30
   13068: 8111         	srli	a0, a0, 0x4
   1306a: 00d58023     	sb	a3, 0x0(a1)
   1306e: 0785         	addi	a5, a5, 0x1
   13070: 15fd         	addi	a1, a1, -0x1
   13072: f56d         	bnez	a0, 0x1305c <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u8$GT$3fmt17h6087460a09305b13E+0x28>
   13074: f7040513     	addi	a0, s0, -0x90
   13078: 8d1d         	sub	a0, a0, a5
   1307a: 08050713     	addi	a4, a0, 0x80

000000000001307e <.Lpcrel_hi1019>:
   1307e: 00002517     	auipc	a0, 0x2
   13082: 4585         	li	a1, 0x1
   13084: bab50613     	addi	a2, a0, -0x455
   13088: 4689         	li	a3, 0x2
   1308a: 8542         	mv	a0, a6
   1308c: fffff097     	auipc	ra, 0xfffff
   13090: 414080e7     	jalr	0x414(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5480>
   13094: 60aa         	ld	ra, 0x88(sp)
   13096: 640a         	ld	s0, 0x80(sp)
   13098: 6149         	addi	sp, sp, 0x90
   1309a: 8082         	ret

000000000001309c <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17hc43b8076fcefaebaE>:
   1309c: 7175         	addi	sp, sp, -0x90
   1309e: e506         	sd	ra, 0x88(sp)
   130a0: e122         	sd	s0, 0x80(sp)
   130a2: 0900         	addi	s0, sp, 0x90
   130a4: 882e         	mv	a6, a1
   130a6: 4781         	li	a5, 0x0
   130a8: 6108         	ld	a0, 0x0(a0)
   130aa: fef40593     	addi	a1, s0, -0x11
   130ae: 4629         	li	a2, 0xa
   130b0: a809         	j	0x130c2 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17hc43b8076fcefaebaE+0x26>
   130b2: 05768693     	addi	a3, a3, 0x57
   130b6: 8111         	srli	a0, a0, 0x4
   130b8: 00d58023     	sb	a3, 0x0(a1)
   130bc: 0785         	addi	a5, a5, 0x1
   130be: 15fd         	addi	a1, a1, -0x1
   130c0: cd09         	beqz	a0, 0x130da <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17hc43b8076fcefaebaE+0x3e>
   130c2: 00f57693     	andi	a3, a0, 0xf
   130c6: fec6f6e3     	bgeu	a3, a2, 0x130b2 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17hc43b8076fcefaebaE+0x16>
   130ca: 03068693     	addi	a3, a3, 0x30
   130ce: 8111         	srli	a0, a0, 0x4
   130d0: 00d58023     	sb	a3, 0x0(a1)
   130d4: 0785         	addi	a5, a5, 0x1
   130d6: 15fd         	addi	a1, a1, -0x1
   130d8: f56d         	bnez	a0, 0x130c2 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17hc43b8076fcefaebaE+0x26>
   130da: f7040513     	addi	a0, s0, -0x90
   130de: 8d1d         	sub	a0, a0, a5
   130e0: 08050713     	addi	a4, a0, 0x80

00000000000130e4 <.Lpcrel_hi1030>:
   130e4: 00002517     	auipc	a0, 0x2
   130e8: 4585         	li	a1, 0x1
   130ea: b4550613     	addi	a2, a0, -0x4bb
   130ee: 4689         	li	a3, 0x2
   130f0: 8542         	mv	a0, a6
   130f2: fffff097     	auipc	ra, 0xfffff
   130f6: 3ae080e7     	jalr	0x3ae(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5480>
   130fa: 60aa         	ld	ra, 0x88(sp)
   130fc: 640a         	ld	s0, 0x80(sp)
   130fe: 6149         	addi	sp, sp, 0x90
   13100: 8082         	ret

0000000000013102 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17hab96dee307365a25E>:
   13102: 7175         	addi	sp, sp, -0x90
   13104: e506         	sd	ra, 0x88(sp)
   13106: e122         	sd	s0, 0x80(sp)
   13108: 0900         	addi	s0, sp, 0x90
   1310a: 882e         	mv	a6, a1
   1310c: 4781         	li	a5, 0x0
   1310e: 6108         	ld	a0, 0x0(a0)
   13110: fef40593     	addi	a1, s0, -0x11
   13114: 4629         	li	a2, 0xa
   13116: a809         	j	0x13128 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17hab96dee307365a25E+0x26>
   13118: 03768693     	addi	a3, a3, 0x37
   1311c: 8111         	srli	a0, a0, 0x4
   1311e: 00d58023     	sb	a3, 0x0(a1)
   13122: 0785         	addi	a5, a5, 0x1
   13124: 15fd         	addi	a1, a1, -0x1
   13126: cd09         	beqz	a0, 0x13140 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17hab96dee307365a25E+0x3e>
   13128: 00f57693     	andi	a3, a0, 0xf
   1312c: fec6f6e3     	bgeu	a3, a2, 0x13118 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17hab96dee307365a25E+0x16>
   13130: 03068693     	addi	a3, a3, 0x30
   13134: 8111         	srli	a0, a0, 0x4
   13136: 00d58023     	sb	a3, 0x0(a1)
   1313a: 0785         	addi	a5, a5, 0x1
   1313c: 15fd         	addi	a1, a1, -0x1
   1313e: f56d         	bnez	a0, 0x13128 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17hab96dee307365a25E+0x26>
   13140: f7040513     	addi	a0, s0, -0x90
   13144: 8d1d         	sub	a0, a0, a5
   13146: 08050713     	addi	a4, a0, 0x80

000000000001314a <.Lpcrel_hi1031>:
   1314a: 00002517     	auipc	a0, 0x2
   1314e: 4585         	li	a1, 0x1
   13150: adf50613     	addi	a2, a0, -0x521
   13154: 4689         	li	a3, 0x2
   13156: 8542         	mv	a0, a6
   13158: fffff097     	auipc	ra, 0xfffff
   1315c: 348080e7     	jalr	0x348(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5480>
   13160: 60aa         	ld	ra, 0x88(sp)
   13162: 640a         	ld	s0, 0x80(sp)
   13164: 6149         	addi	sp, sp, 0x90
   13166: 8082         	ret

0000000000013168 <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hbf2fe6ff12e9de31E>:
   13168: 7175         	addi	sp, sp, -0x90
   1316a: e506         	sd	ra, 0x88(sp)
   1316c: e122         	sd	s0, 0x80(sp)
   1316e: 0900         	addi	s0, sp, 0x90
   13170: 882e         	mv	a6, a1
   13172: 0245e583     	lwu	a1, 0x24(a1)
   13176: 0105f613     	andi	a2, a1, 0x10
   1317a: ee11         	bnez	a2, 0x13196 <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hbf2fe6ff12e9de31E+0x2e>
   1317c: 0205f593     	andi	a1, a1, 0x20
   13180: e1b5         	bnez	a1, 0x131e4 <.Lpcrel_hi1046+0xc>
   13182: 4108         	lw	a0, 0x0(a0)
   13184: 4585         	li	a1, 0x1
   13186: 8642         	mv	a2, a6
   13188: 60aa         	ld	ra, 0x88(sp)
   1318a: 640a         	ld	s0, 0x80(sp)
   1318c: 6149         	addi	sp, sp, 0x90
   1318e: 00000317     	auipc	t1, 0x0
   13192: 16430067     	jr	0x164(t1) <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17h10762203357d058eE>
   13196: 4781         	li	a5, 0x0
   13198: 4108         	lw	a0, 0x0(a0)
   1319a: fef40593     	addi	a1, s0, -0x11
   1319e: 4629         	li	a2, 0xa
   131a0: a811         	j	0x131b4 <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hbf2fe6ff12e9de31E+0x4c>
   131a2: 05768693     	addi	a3, a3, 0x57
   131a6: 0045551b     	srliw	a0, a0, 0x4
   131aa: 00d58023     	sb	a3, 0x0(a1)
   131ae: 0785         	addi	a5, a5, 0x1
   131b0: 15fd         	addi	a1, a1, -0x1
   131b2: cd11         	beqz	a0, 0x131ce <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hbf2fe6ff12e9de31E+0x66>
   131b4: 00f57693     	andi	a3, a0, 0xf
   131b8: fec6f5e3     	bgeu	a3, a2, 0x131a2 <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hbf2fe6ff12e9de31E+0x3a>
   131bc: 03068693     	addi	a3, a3, 0x30
   131c0: 0045551b     	srliw	a0, a0, 0x4
   131c4: 00d58023     	sb	a3, 0x0(a1)
   131c8: 0785         	addi	a5, a5, 0x1
   131ca: 15fd         	addi	a1, a1, -0x1
   131cc: f565         	bnez	a0, 0x131b4 <_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hbf2fe6ff12e9de31E+0x4c>
   131ce: f7040513     	addi	a0, s0, -0x90
   131d2: 8d1d         	sub	a0, a0, a5
   131d4: 08050713     	addi	a4, a0, 0x80

00000000000131d8 <.Lpcrel_hi1046>:
   131d8: 00002517     	auipc	a0, 0x2
   131dc: 4585         	li	a1, 0x1
   131de: a5150613     	addi	a2, a0, -0x5af
   131e2: a0b9         	j	0x13230 <.Lpcrel_hi1047+0xa>
   131e4: 4781         	li	a5, 0x0
   131e6: 4108         	lw	a0, 0x0(a0)
   131e8: fef40593     	addi	a1, s0, -0x11
   131ec: 4629         	li	a2, 0xa
   131ee: a811         	j	0x13202 <.Lpcrel_hi1046+0x2a>
   131f0: 03768693     	addi	a3, a3, 0x37
   131f4: 0045551b     	srliw	a0, a0, 0x4
   131f8: 00d58023     	sb	a3, 0x0(a1)
   131fc: 0785         	addi	a5, a5, 0x1
   131fe: 15fd         	addi	a1, a1, -0x1
   13200: cd11         	beqz	a0, 0x1321c <.Lpcrel_hi1046+0x44>
   13202: 00f57693     	andi	a3, a0, 0xf
   13206: fec6f5e3     	bgeu	a3, a2, 0x131f0 <.Lpcrel_hi1046+0x18>
   1320a: 03068693     	addi	a3, a3, 0x30
   1320e: 0045551b     	srliw	a0, a0, 0x4
   13212: 00d58023     	sb	a3, 0x0(a1)
   13216: 0785         	addi	a5, a5, 0x1
   13218: 15fd         	addi	a1, a1, -0x1
   1321a: f565         	bnez	a0, 0x13202 <.Lpcrel_hi1046+0x2a>
   1321c: f7040513     	addi	a0, s0, -0x90
   13220: 8d1d         	sub	a0, a0, a5
   13222: 08050713     	addi	a4, a0, 0x80

0000000000013226 <.Lpcrel_hi1047>:
   13226: 00002517     	auipc	a0, 0x2
   1322a: 4585         	li	a1, 0x1
   1322c: a0350613     	addi	a2, a0, -0x5fd
   13230: 4689         	li	a3, 0x2
   13232: 8542         	mv	a0, a6
   13234: fffff097     	auipc	ra, 0xfffff
   13238: 26c080e7     	jalr	0x26c(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5480>
   1323c: 60aa         	ld	ra, 0x88(sp)
   1323e: 640a         	ld	s0, 0x80(sp)
   13240: 6149         	addi	sp, sp, 0x90
   13242: 8082         	ret

0000000000013244 <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17hd702446eeb002cb5E>:
   13244: 1101         	addi	sp, sp, -0x20
   13246: ec06         	sd	ra, 0x18(sp)
   13248: e822         	sd	s0, 0x10(sp)
   1324a: 1000         	addi	s0, sp, 0x20
   1324c: 86ae         	mv	a3, a1
   1324e: 00054583     	lbu	a1, 0x0(a0)
   13252: 4629         	li	a2, 0xa

0000000000013254 <.Lpcrel_hi1050>:
   13254: 00002517     	auipc	a0, 0x2
   13258: 9d750513     	addi	a0, a0, -0x629
   1325c: 02c5eb63     	bltu	a1, a2, 0x13292 <.Lpcrel_hi1050+0x3e>
   13260: 02900613     	li	a2, 0x29
   13264: 06400713     	li	a4, 0x64
   13268: 02c58633     	mul	a2, a1, a2
   1326c: 8231         	srli	a2, a2, 0xc
   1326e: 02e60733     	mul	a4, a2, a4
   13272: 40e5873b     	subw	a4, a1, a4
   13276: 1766         	slli	a4, a4, 0x39
   13278: 9361         	srli	a4, a4, 0x38
   1327a: 972a         	add	a4, a4, a0
   1327c: 00074783     	lbu	a5, 0x0(a4)
   13280: 00174703     	lbu	a4, 0x1(a4)
   13284: fef40723     	sb	a5, -0x12(s0)
   13288: fee407a3     	sb	a4, -0x11(s0)
   1328c: 4705         	li	a4, 0x1
   1328e: e589         	bnez	a1, 0x13298 <.Lpcrel_hi1050+0x44>
   13290: a029         	j	0x1329a <.Lpcrel_hi1050+0x46>
   13292: 470d         	li	a4, 0x3
   13294: 862e         	mv	a2, a1
   13296: c191         	beqz	a1, 0x1329a <.Lpcrel_hi1050+0x46>
   13298: ce11         	beqz	a2, 0x132b4 <.Lpcrel_hi1050+0x60>
   1329a: 0606         	slli	a2, a2, 0x1
   1329c: 0605         	addi	a2, a2, 0x1
   1329e: 0ff67593     	andi	a1, a2, 0xff
   132a2: 952e         	add	a0, a0, a1
   132a4: 00054503     	lbu	a0, 0x0(a0)
   132a8: 177d         	addi	a4, a4, -0x1
   132aa: fed40593     	addi	a1, s0, -0x13
   132ae: 95ba         	add	a1, a1, a4
   132b0: 00a58023     	sb	a0, 0x0(a1)
   132b4: 478d         	li	a5, 0x3
   132b6: fed40513     	addi	a0, s0, -0x13
   132ba: 8f99         	sub	a5, a5, a4
   132bc: 972a         	add	a4, a4, a0
   132be: 4585         	li	a1, 0x1
   132c0: 4605         	li	a2, 0x1
   132c2: 8536         	mv	a0, a3
   132c4: 4681         	li	a3, 0x0
   132c6: fffff097     	auipc	ra, 0xfffff
   132ca: 1da080e7     	jalr	0x1da(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5480>
   132ce: 60e2         	ld	ra, 0x18(sp)
   132d0: 6442         	ld	s0, 0x10(sp)
   132d2: 6105         	addi	sp, sp, 0x20
   132d4: 8082         	ret

00000000000132d6 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h18d0c25ff6798d06E>:
   132d6: 1141         	addi	sp, sp, -0x10
   132d8: e406         	sd	ra, 0x8(sp)
   132da: e022         	sd	s0, 0x0(sp)
   132dc: 0800         	addi	s0, sp, 0x10
   132de: 4108         	lw	a0, 0x0(a0)
   132e0: 862e         	mv	a2, a1
   132e2: 4585         	li	a1, 0x1
   132e4: 60a2         	ld	ra, 0x8(sp)
   132e6: 6402         	ld	s0, 0x0(sp)
   132e8: 0141         	addi	sp, sp, 0x10
   132ea: 00000317     	auipc	t1, 0x0
   132ee: 00830067     	jr	0x8(t1) <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17h10762203357d058eE>

00000000000132f2 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17h10762203357d058eE>:
   132f2: 7159         	addi	sp, sp, -0x70
   132f4: f486         	sd	ra, 0x68(sp)
   132f6: f0a2         	sd	s0, 0x60(sp)
   132f8: eca6         	sd	s1, 0x58(sp)
   132fa: e8ca         	sd	s2, 0x50(sp)
   132fc: e4ce         	sd	s3, 0x48(sp)
   132fe: e0d2         	sd	s4, 0x40(sp)
   13300: fc56         	sd	s5, 0x38(sp)
   13302: f85a         	sd	s6, 0x30(sp)
   13304: f45e         	sd	s7, 0x28(sp)
   13306: f062         	sd	s8, 0x20(sp)
   13308: ec66         	sd	s9, 0x18(sp)
   1330a: 1880         	addi	s0, sp, 0x70
   1330c: 8832         	mv	a6, a2
   1330e: 3e800693     	li	a3, 0x3e8

0000000000013312 <.Lpcrel_hi1053>:
   13312: 00002617     	auipc	a2, 0x2
   13316: 91960993     	addi	s3, a2, -0x6e7
   1331a: 0ad56963     	bltu	a0, a3, 0x133cc <.Lpcrel_hi1053+0xba>
   1331e: 4701         	li	a4, 0x0
   13320: fa440893     	addi	a7, s0, -0x5c
   13324: fa740293     	addi	t0, s0, -0x59
   13328: fa640313     	addi	t1, s0, -0x5a
   1332c: fa540393     	addi	t2, s0, -0x5b
   13330: d1b71eb7     	lui	t4, 0xd1b71
   13334: 6789         	lui	a5, 0x2
   13336: 6485         	lui	s1, 0x1
   13338: 06400e13     	li	t3, 0x64
   1333c: 009896b7     	lui	a3, 0x989
   13340: 759e8f93     	addi	t6, t4, 0x759
   13344: 71078e93     	addi	t4, a5, 0x710
   13348: 47b48f1b     	addiw	t5, s1, 0x47b
   1334c: 1f82         	slli	t6, t6, 0x20
   1334e: 67f6891b     	addiw	s2, a3, 0x67f
   13352: 8caa         	mv	s9, a0
   13354: 8c66         	mv	s8, s9
   13356: 020c9793     	slli	a5, s9, 0x20
   1335a: 00e88a33     	add	s4, a7, a4
   1335e: 00e38ab3     	add	s5, t2, a4
   13362: 00e30b33     	add	s6, t1, a4
   13366: 00e28bb3     	add	s7, t0, a4
   1336a: 03f7b7b3     	mulhu	a5, a5, t6
   1336e: 02d7dc93     	srli	s9, a5, 0x2d
   13372: 03dc86b3     	mul	a3, s9, t4
   13376: 40dc04bb     	subw	s1, s8, a3
   1337a: 03049693     	slli	a3, s1, 0x30
   1337e: 92c9         	srli	a3, a3, 0x32
   13380: 03e686b3     	mul	a3, a3, t5
   13384: 0106d613     	srli	a2, a3, 0x10
   13388: 82c5         	srli	a3, a3, 0x11
   1338a: 03c686b3     	mul	a3, a3, t3
   1338e: 7fe67613     	andi	a2, a2, 0x7fe
   13392: 9c95         	subw	s1, s1, a3
   13394: 964e         	add	a2, a2, s3
   13396: 14c6         	slli	s1, s1, 0x31
   13398: 90c1         	srli	s1, s1, 0x30
   1339a: 94ce         	add	s1, s1, s3
   1339c: 00064683     	lbu	a3, 0x0(a2)
   133a0: 00164603     	lbu	a2, 0x1(a2)
   133a4: 0004c783     	lbu	a5, 0x0(s1)
   133a8: 0014c483     	lbu	s1, 0x1(s1)
   133ac: 00da0023     	sb	a3, 0x0(s4)
   133b0: 00ca8023     	sb	a2, 0x0(s5)
   133b4: 00fb0023     	sb	a5, 0x0(s6)
   133b8: 009b8023     	sb	s1, 0x0(s7)
   133bc: 1771         	addi	a4, a4, -0x4
   133be: f9896be3     	bltu	s2, s8, 0x13354 <.Lpcrel_hi1053+0x42>
   133c2: 0729         	addi	a4, a4, 0xa
   133c4: 46a5         	li	a3, 0x9
   133c6: 0196e863     	bltu	a3, s9, 0x133d6 <.Lpcrel_hi1053+0xc4>
   133ca: a0b9         	j	0x13418 <.Lpcrel_hi1053+0x106>
   133cc: 4729         	li	a4, 0xa
   133ce: 8caa         	mv	s9, a0
   133d0: 46a5         	li	a3, 0x9
   133d2: 04a6f363     	bgeu	a3, a0, 0x13418 <.Lpcrel_hi1053+0x106>
   133d6: 030c9613     	slli	a2, s9, 0x30
   133da: 6685         	lui	a3, 0x1
   133dc: 06400893     	li	a7, 0x64
   133e0: f9e40293     	addi	t0, s0, -0x62
   133e4: 9249         	srli	a2, a2, 0x32
   133e6: 47b6869b     	addiw	a3, a3, 0x47b
   133ea: 00e284b3     	add	s1, t0, a4
   133ee: 02d60633     	mul	a2, a2, a3
   133f2: 8245         	srli	a2, a2, 0x11
   133f4: 031606b3     	mul	a3, a2, a7
   133f8: 40dc86bb     	subw	a3, s9, a3
   133fc: 16c6         	slli	a3, a3, 0x31
   133fe: 92c1         	srli	a3, a3, 0x30
   13400: 96ce         	add	a3, a3, s3
   13402: 0006c783     	lbu	a5, 0x0(a3)
   13406: 0016c683     	lbu	a3, 0x1(a3)
   1340a: 1779         	addi	a4, a4, -0x2
   1340c: 92ba         	add	t0, t0, a4
   1340e: 00f28023     	sb	a5, 0x0(t0)
   13412: fed48fa3     	sb	a3, -0x1(s1)
   13416: 8cb2         	mv	s9, a2
   13418: c119         	beqz	a0, 0x1341e <.Lpcrel_hi1053+0x10c>
   1341a: 000c8e63     	beqz	s9, 0x13436 <.Lpcrel_hi1053+0x124>
   1341e: 0c86         	slli	s9, s9, 0x1
   13420: 01ecf513     	andi	a0, s9, 0x1e
   13424: 954e         	add	a0, a0, s3
   13426: 00154503     	lbu	a0, 0x1(a0)
   1342a: 177d         	addi	a4, a4, -0x1
   1342c: f9e40613     	addi	a2, s0, -0x62
   13430: 963a         	add	a2, a2, a4
   13432: 00a60023     	sb	a0, 0x0(a2)
   13436: 47a9         	li	a5, 0xa
   13438: f9e40513     	addi	a0, s0, -0x62
   1343c: 8f99         	sub	a5, a5, a4
   1343e: 972a         	add	a4, a4, a0
   13440: 4605         	li	a2, 0x1
   13442: 8542         	mv	a0, a6
   13444: 4681         	li	a3, 0x0
   13446: fffff097     	auipc	ra, 0xfffff
   1344a: 05a080e7     	jalr	0x5a(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5480>
   1344e: 70a6         	ld	ra, 0x68(sp)
   13450: 7406         	ld	s0, 0x60(sp)
   13452: 64e6         	ld	s1, 0x58(sp)
   13454: 6946         	ld	s2, 0x50(sp)
   13456: 69a6         	ld	s3, 0x48(sp)
   13458: 6a06         	ld	s4, 0x40(sp)
   1345a: 7ae2         	ld	s5, 0x38(sp)
   1345c: 7b42         	ld	s6, 0x30(sp)
   1345e: 7ba2         	ld	s7, 0x28(sp)
   13460: 7c02         	ld	s8, 0x20(sp)
   13462: 6ce2         	ld	s9, 0x18(sp)
   13464: 6165         	addi	sp, sp, 0x70
   13466: 8082         	ret

0000000000013468 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17hd2799c607221fe30E>:
   13468: 1141         	addi	sp, sp, -0x10
   1346a: e406         	sd	ra, 0x8(sp)
   1346c: e022         	sd	s0, 0x0(sp)
   1346e: 0800         	addi	s0, sp, 0x10
   13470: 6108         	ld	a0, 0x0(a0)
   13472: 862e         	mv	a2, a1
   13474: 4585         	li	a1, 0x1
   13476: 60a2         	ld	ra, 0x8(sp)
   13478: 6402         	ld	s0, 0x0(sp)
   1347a: 0141         	addi	sp, sp, 0x10
   1347c: 00000317     	auipc	t1, 0x0
   13480: 00830067     	jr	0x8(t1) <_ZN4core3fmt3num3imp21_$LT$impl$u20$u64$GT$4_fmt17hf735e6a3f81ca742E>

0000000000013484 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u64$GT$4_fmt17hf735e6a3f81ca742E>:
   13484: 7139         	addi	sp, sp, -0x40
   13486: fc06         	sd	ra, 0x38(sp)
   13488: f822         	sd	s0, 0x30(sp)
   1348a: f426         	sd	s1, 0x28(sp)
   1348c: f04a         	sd	s2, 0x20(sp)
   1348e: ec4e         	sd	s3, 0x18(sp)
   13490: 0080         	addi	s0, sp, 0x40
   13492: 8832         	mv	a6, a2
   13494: 3e800693     	li	a3, 0x3e8

0000000000013498 <.Lpcrel_hi1054>:
   13498: 00001617     	auipc	a2, 0x1
   1349c: 79360f13     	addi	t5, a2, 0x793
   134a0: 10d56d63     	bltu	a0, a3, 0x135ba <.Lpcrel_hi1055+0x110>
   134a4: 4751         	li	a4, 0x14
   134a6: fd740893     	addi	a7, s0, -0x29

00000000000134aa <.Lpcrel_hi1055>:
   134aa: 00001697     	auipc	a3, 0x1
   134ae: 6309         	lui	t1, 0x2
   134b0: 6785         	lui	a5, 0x1
   134b2: b666b283     	ld	t0, -0x49a(a3)
   134b6: 71030313     	addi	t1, t1, 0x710
   134ba: 47b78e1b     	addiw	t3, a5, 0x47b
   134be: 06400393     	li	t2, 0x64
   134c2: 009896b7     	lui	a3, 0x989
   134c6: 67f68e9b     	addiw	t4, a3, 0x67f
   134ca: 892a         	mv	s2, a0
   134cc: 89ca         	mv	s3, s2
   134ce: ffc70f93     	addi	t6, a4, -0x4
   134d2: 02593633     	mulhu	a2, s2, t0
   134d6: 9746         	add	a4, a4, a7
   134d8: 00b65913     	srli	s2, a2, 0xb
   134dc: 026906b3     	mul	a3, s2, t1
   134e0: 40d986bb     	subw	a3, s3, a3
   134e4: 03069493     	slli	s1, a3, 0x30
   134e8: 90c9         	srli	s1, s1, 0x32
   134ea: 03c484b3     	mul	s1, s1, t3
   134ee: 0104d613     	srli	a2, s1, 0x10
   134f2: 80c5         	srli	s1, s1, 0x11
   134f4: 027484b3     	mul	s1, s1, t2
   134f8: 7fe67613     	andi	a2, a2, 0x7fe
   134fc: 9e85         	subw	a3, a3, s1
   134fe: 967a         	add	a2, a2, t5
   13500: 16c6         	slli	a3, a3, 0x31
   13502: 92c1         	srli	a3, a3, 0x30
   13504: 96fa         	add	a3, a3, t5
   13506: 00064483     	lbu	s1, 0x0(a2)
   1350a: 00164603     	lbu	a2, 0x1(a2)
   1350e: 0006c783     	lbu	a5, 0x0(a3)
   13512: 0016c683     	lbu	a3, 0x1(a3)
   13516: fe9704a3     	sb	s1, -0x17(a4)
   1351a: fec70523     	sb	a2, -0x16(a4)
   1351e: fef705a3     	sb	a5, -0x15(a4)
   13522: fed70623     	sb	a3, -0x14(a4)
   13526: 877e         	mv	a4, t6
   13528: fb3ee2e3     	bltu	t4, s3, 0x134cc <.Lpcrel_hi1055+0x22>
   1352c: 4725         	li	a4, 0x9
   1352e: 05277363     	bgeu	a4, s2, 0x13574 <.Lpcrel_hi1055+0xca>
   13532: 03091613     	slli	a2, s2, 0x30
   13536: 6685         	lui	a3, 0x1
   13538: 06400713     	li	a4, 0x64
   1353c: fc440493     	addi	s1, s0, -0x3c
   13540: 9249         	srli	a2, a2, 0x32
   13542: 47b6869b     	addiw	a3, a3, 0x47b
   13546: 01f487b3     	add	a5, s1, t6
   1354a: 02d60633     	mul	a2, a2, a3
   1354e: 8245         	srli	a2, a2, 0x11
   13550: 02e606b3     	mul	a3, a2, a4
   13554: 40d906bb     	subw	a3, s2, a3
   13558: 16c6         	slli	a3, a3, 0x31
   1355a: 92c1         	srli	a3, a3, 0x30
   1355c: 96fa         	add	a3, a3, t5
   1355e: 0006c703     	lbu	a4, 0x0(a3)
   13562: 0016c683     	lbu	a3, 0x1(a3)
   13566: 1ff9         	addi	t6, t6, -0x2
   13568: 94fe         	add	s1, s1, t6
   1356a: 00e48023     	sb	a4, 0x0(s1)
   1356e: fed78fa3     	sb	a3, -0x1(a5)
   13572: 8932         	mv	s2, a2
   13574: c119         	beqz	a0, 0x1357a <.Lpcrel_hi1055+0xd0>
   13576: 00090e63     	beqz	s2, 0x13592 <.Lpcrel_hi1055+0xe8>
   1357a: 0906         	slli	s2, s2, 0x1
   1357c: 01e97513     	andi	a0, s2, 0x1e
   13580: 957a         	add	a0, a0, t5
   13582: 00154503     	lbu	a0, 0x1(a0)
   13586: 1ffd         	addi	t6, t6, -0x1
   13588: fc440613     	addi	a2, s0, -0x3c
   1358c: 967e         	add	a2, a2, t6
   1358e: 00a60023     	sb	a0, 0x0(a2)
   13592: 4551         	li	a0, 0x14
   13594: fc440713     	addi	a4, s0, -0x3c
   13598: 41f507b3     	sub	a5, a0, t6
   1359c: 977e         	add	a4, a4, t6
   1359e: 4605         	li	a2, 0x1
   135a0: 8542         	mv	a0, a6
   135a2: 4681         	li	a3, 0x0
   135a4: fffff097     	auipc	ra, 0xfffff
   135a8: efc080e7     	jalr	-0x104(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5480>
   135ac: 70e2         	ld	ra, 0x38(sp)
   135ae: 7442         	ld	s0, 0x30(sp)
   135b0: 74a2         	ld	s1, 0x28(sp)
   135b2: 7902         	ld	s2, 0x20(sp)
   135b4: 69e2         	ld	s3, 0x18(sp)
   135b6: 6121         	addi	sp, sp, 0x40
   135b8: 8082         	ret
   135ba: 4fd1         	li	t6, 0x14
   135bc: 892a         	mv	s2, a0
   135be: 4725         	li	a4, 0x9
   135c0: f6a769e3     	bltu	a4, a0, 0x13532 <.Lpcrel_hi1055+0x88>
   135c4: bf45         	j	0x13574 <.Lpcrel_hi1055+0xca>

00000000000135c6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h09e1b8de69e66c0eE>:
   135c6: 7175         	addi	sp, sp, -0x90
   135c8: e506         	sd	ra, 0x88(sp)
   135ca: e122         	sd	s0, 0x80(sp)
   135cc: 0900         	addi	s0, sp, 0x90
   135ce: 882e         	mv	a6, a1
   135d0: 0245e583     	lwu	a1, 0x24(a1)
   135d4: 6108         	ld	a0, 0x0(a0)
   135d6: 0105f613     	andi	a2, a1, 0x10
   135da: ee11         	bnez	a2, 0x135f6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h09e1b8de69e66c0eE+0x30>
   135dc: 0205f593     	andi	a1, a1, 0x20
   135e0: e1a5         	bnez	a1, 0x13640 <.Lpcrel_hi1080+0xc>
   135e2: 6108         	ld	a0, 0x0(a0)
   135e4: 4585         	li	a1, 0x1
   135e6: 8642         	mv	a2, a6
   135e8: 60aa         	ld	ra, 0x88(sp)
   135ea: 640a         	ld	s0, 0x80(sp)
   135ec: 6149         	addi	sp, sp, 0x90
   135ee: 00000317     	auipc	t1, 0x0
   135f2: e9630067     	jr	-0x16a(t1) <_ZN4core3fmt3num3imp21_$LT$impl$u20$u64$GT$4_fmt17hf735e6a3f81ca742E>
   135f6: 4781         	li	a5, 0x0
   135f8: 6108         	ld	a0, 0x0(a0)
   135fa: fef40593     	addi	a1, s0, -0x11
   135fe: 4629         	li	a2, 0xa
   13600: a809         	j	0x13612 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h09e1b8de69e66c0eE+0x4c>
   13602: 05768693     	addi	a3, a3, 0x57
   13606: 8111         	srli	a0, a0, 0x4
   13608: 00d58023     	sb	a3, 0x0(a1)
   1360c: 0785         	addi	a5, a5, 0x1
   1360e: 15fd         	addi	a1, a1, -0x1
   13610: cd09         	beqz	a0, 0x1362a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h09e1b8de69e66c0eE+0x64>
   13612: 00f57693     	andi	a3, a0, 0xf
   13616: fec6f6e3     	bgeu	a3, a2, 0x13602 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h09e1b8de69e66c0eE+0x3c>
   1361a: 03068693     	addi	a3, a3, 0x30
   1361e: 8111         	srli	a0, a0, 0x4
   13620: 00d58023     	sb	a3, 0x0(a1)
   13624: 0785         	addi	a5, a5, 0x1
   13626: 15fd         	addi	a1, a1, -0x1
   13628: f56d         	bnez	a0, 0x13612 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h09e1b8de69e66c0eE+0x4c>
   1362a: f7040513     	addi	a0, s0, -0x90
   1362e: 8d1d         	sub	a0, a0, a5
   13630: 08050713     	addi	a4, a0, 0x80

0000000000013634 <.Lpcrel_hi1080>:
   13634: 00001517     	auipc	a0, 0x1
   13638: 4585         	li	a1, 0x1
   1363a: 5f550613     	addi	a2, a0, 0x5f5
   1363e: a0a9         	j	0x13688 <.Lpcrel_hi1081+0xa>
   13640: 4781         	li	a5, 0x0
   13642: 6108         	ld	a0, 0x0(a0)
   13644: fef40593     	addi	a1, s0, -0x11
   13648: 4629         	li	a2, 0xa
   1364a: a809         	j	0x1365c <.Lpcrel_hi1080+0x28>
   1364c: 03768693     	addi	a3, a3, 0x37
   13650: 8111         	srli	a0, a0, 0x4
   13652: 00d58023     	sb	a3, 0x0(a1)
   13656: 0785         	addi	a5, a5, 0x1
   13658: 15fd         	addi	a1, a1, -0x1
   1365a: cd09         	beqz	a0, 0x13674 <.Lpcrel_hi1080+0x40>
   1365c: 00f57693     	andi	a3, a0, 0xf
   13660: fec6f6e3     	bgeu	a3, a2, 0x1364c <.Lpcrel_hi1080+0x18>
   13664: 03068693     	addi	a3, a3, 0x30
   13668: 8111         	srli	a0, a0, 0x4
   1366a: 00d58023     	sb	a3, 0x0(a1)
   1366e: 0785         	addi	a5, a5, 0x1
   13670: 15fd         	addi	a1, a1, -0x1
   13672: f56d         	bnez	a0, 0x1365c <.Lpcrel_hi1080+0x28>
   13674: f7040513     	addi	a0, s0, -0x90
   13678: 8d1d         	sub	a0, a0, a5
   1367a: 08050713     	addi	a4, a0, 0x80

000000000001367e <.Lpcrel_hi1081>:
   1367e: 00001517     	auipc	a0, 0x1
   13682: 4585         	li	a1, 0x1
   13684: 5ab50613     	addi	a2, a0, 0x5ab
   13688: 4689         	li	a3, 0x2
   1368a: 8542         	mv	a0, a6
   1368c: fffff097     	auipc	ra, 0xfffff
   13690: e14080e7     	jalr	-0x1ec(ra) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5480>
   13694: 60aa         	ld	ra, 0x88(sp)
   13696: 640a         	ld	s0, 0x80(sp)
   13698: 6149         	addi	sp, sp, 0x90
   1369a: 8082         	ret

000000000001369c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h23d9fb4a483efb7dE>:
   1369c: 1141         	addi	sp, sp, -0x10
   1369e: e406         	sd	ra, 0x8(sp)
   136a0: e022         	sd	s0, 0x0(sp)
   136a2: 0800         	addi	s0, sp, 0x10
   136a4: 6510         	ld	a2, 0x8(a0)
   136a6: 6108         	ld	a0, 0x0(a0)
   136a8: 6e1c         	ld	a5, 0x18(a2)
   136aa: 60a2         	ld	ra, 0x8(sp)
   136ac: 6402         	ld	s0, 0x0(sp)
   136ae: 0141         	addi	sp, sp, 0x10
   136b0: 8782         	jr	a5

00000000000136b2 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hb89021b81dfe42abE>:
   136b2: 1141         	addi	sp, sp, -0x10
   136b4: e406         	sd	ra, 0x8(sp)
   136b6: e022         	sd	s0, 0x0(sp)
   136b8: 0800         	addi	s0, sp, 0x10
   136ba: 6114         	ld	a3, 0x0(a0)
   136bc: 6510         	ld	a2, 0x8(a0)
   136be: 852e         	mv	a0, a1
   136c0: 85b6         	mv	a1, a3
   136c2: 60a2         	ld	ra, 0x8(sp)
   136c4: 6402         	ld	s0, 0x0(sp)
   136c6: 0141         	addi	sp, sp, 0x10
   136c8: fffff317     	auipc	t1, 0xfffff
   136cc: 05c30067     	jr	0x5c(t1) <_ZN8user_lib4HEAP17hb9a58aee88e33566E.llvm.6561880552306615819+0xffff5704>

00000000000136d0 <memcpy>:
   136d0: 1141         	addi	sp, sp, -0x10
   136d2: e406         	sd	ra, 0x8(sp)
   136d4: e022         	sd	s0, 0x0(sp)
   136d6: 0800         	addi	s0, sp, 0x10
   136d8: 46c1         	li	a3, 0x10
   136da: 06d66163     	bltu	a2, a3, 0x1373c <memcpy+0x6c>
   136de: 40a006bb     	negw	a3, a0
   136e2: 0076f813     	andi	a6, a3, 0x7
   136e6: 01050333     	add	t1, a0, a6
   136ea: 00657d63     	bgeu	a0, t1, 0x13704 <memcpy+0x34>
   136ee: 87c2         	mv	a5, a6
   136f0: 86aa         	mv	a3, a0
   136f2: 872e         	mv	a4, a1
   136f4: 00074883     	lbu	a7, 0x0(a4)
   136f8: 17fd         	addi	a5, a5, -0x1
   136fa: 01168023     	sb	a7, 0x0(a3)
   136fe: 0685         	addi	a3, a3, 0x1
   13700: 0705         	addi	a4, a4, 0x1
   13702: fbed         	bnez	a5, 0x136f4 <memcpy+0x24>
   13704: 95c2         	add	a1, a1, a6
   13706: 410603b3     	sub	t2, a2, a6
   1370a: ff83f793     	andi	a5, t2, -0x8
   1370e: 0075f713     	andi	a4, a1, 0x7
   13712: 00f306b3     	add	a3, t1, a5
   13716: e721         	bnez	a4, 0x1375e <memcpy+0x8e>
   13718: 00d37a63     	bgeu	t1, a3, 0x1372c <memcpy+0x5c>
   1371c: 872e         	mv	a4, a1
   1371e: 6310         	ld	a2, 0x0(a4)
   13720: 00c33023     	sd	a2, 0x0(t1)
   13724: 0321         	addi	t1, t1, 0x8
   13726: 0721         	addi	a4, a4, 0x8
   13728: fed36be3     	bltu	t1, a3, 0x1371e <memcpy+0x4e>
   1372c: 95be         	add	a1, a1, a5
   1372e: 0073f613     	andi	a2, t2, 0x7
   13732: 00c68733     	add	a4, a3, a2
   13736: 00e6e863     	bltu	a3, a4, 0x13746 <memcpy+0x76>
   1373a: a831         	j	0x13756 <memcpy+0x86>
   1373c: 86aa         	mv	a3, a0
   1373e: 00c50733     	add	a4, a0, a2
   13742: 00e57a63     	bgeu	a0, a4, 0x13756 <memcpy+0x86>
   13746: 0005c703     	lbu	a4, 0x0(a1)
   1374a: 167d         	addi	a2, a2, -0x1
   1374c: 00e68023     	sb	a4, 0x0(a3)
   13750: 0685         	addi	a3, a3, 0x1
   13752: 0585         	addi	a1, a1, 0x1
   13754: fa6d         	bnez	a2, 0x13746 <memcpy+0x76>
   13756: 60a2         	ld	ra, 0x8(sp)
   13758: 6402         	ld	s0, 0x0(sp)
   1375a: 0141         	addi	sp, sp, 0x10
   1375c: 8082         	ret
   1375e: fcd377e3     	bgeu	t1, a3, 0x1372c <memcpy+0x5c>
   13762: 00359613     	slli	a2, a1, 0x3
   13766: ff85f293     	andi	t0, a1, -0x8
   1376a: 03867813     	andi	a6, a2, 0x38
   1376e: 0002b703     	ld	a4, 0x0(t0)
   13772: 40c0063b     	negw	a2, a2
   13776: 03867893     	andi	a7, a2, 0x38
   1377a: 02a1         	addi	t0, t0, 0x8
   1377c: 0002b603     	ld	a2, 0x0(t0)
   13780: 01075e33     	srl	t3, a4, a6
   13784: 01161733     	sll	a4, a2, a7
   13788: 01c76733     	or	a4, a4, t3
   1378c: 00e33023     	sd	a4, 0x0(t1)
   13790: 0321         	addi	t1, t1, 0x8
   13792: 02a1         	addi	t0, t0, 0x8
   13794: 8732         	mv	a4, a2
   13796: fed363e3     	bltu	t1, a3, 0x1377c <memcpy+0xac>
   1379a: bf49         	j	0x1372c <memcpy+0x5c>
