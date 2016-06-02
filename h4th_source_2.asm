;  ZX81 - FORTH BY DAVID HUSBAND (C) 1983

;  CODED INTO 8K ROM 2764 OR EQUIVALENT 

; BETWEEN 0X0000 AND 0X7FFF

; CHARACTER TABLES ARE LAST 512 BYTES  1E00 - 1FFF  (64 CHARACTERS OF 8 BYTES EACH)




		ORG %0000
		
		
		out (%fd),a			;	.data:00000000	d3	fd
		ld sp,%fb80			;	.data:00000002	31	80 fb
		jp %0946			;	.data:00000005	c3	46 09
		
			
	; RST08	UPUSH		HL -> Parameter Stack
	
		dec iy				;	.data:00000008	fd	2b
		ld (iy+0),h			;	.data:0000000a	fd	74 00
		jr %004b			;	.data:0000000d	18	3c
		rst %38				;	.data:0000000f	ff
		
			
	; RST10	UPOP		Parameter Stack -> HL	
		
		ld l,(iy+0)			;	.data:00000010	fd	6e 00
		inc iy				;	.data:00000013	fd	23
		jr %0051			;	.data:00000015	18	3a
		rst %38				;	.data:00000017	ff	
			
	; RST18			
		push hl				;	.data:00000018	e5	
		push af				;	.data:00000019	f5	
		ld hl,%fc84			;	.data:0000001a	21	84 fc
		jp %0201			;	.data:0000001d	c3	01 02
			
	; RST20			
		push hl				;	.data:00000020	e5	
		ld hl,%fc84			;	.data:00000021	21	84 fc
		ld a,(hl)			;	.data:00000024	7e	
		jp %020b			;	.data:00000025	c3	0b 02
		
	; RST28			
		jp %200a			;	.data:00000028	c3	0a 20
		nop					;	.data:0000002b	0	
		nop					;	.data:0000002c	0	
		nop					;	.data:0000002d	0	
		nop					;	.data:0000002e	0	
		nop					;	.data:0000002f	0	
	
	; RST30			
		jp %200d			;	.data:00000030	c3	0d 20
		nop					;	.data:00000033	0	
		nop					;	.data:00000034	0	
		nop					;	.data:00000035	0	
		nop					;	.data:00000036	0	
		nop					;	.data:00000037	0	
	
	; RST38			
dec c			;	.data:00000038	0d	
jp nz,%0047		;	.data:00000039	c2	47 00
pop hl			;	.data:0000003c	e1	
dec b			;	.data:0000003d	5	
ret z			;	.data:0000003e	c8	
set 3,c			;	.data:0000003f	cb	d9
ld r,a			;	.data:00000041	ed	4f
ei			 	;	.data:00000043	fb	
nop				;	.data:00000044	0	
nop				;	.data:00000045	0	
jp (hl)			;	.data:00000046	e9	
pop de			;	.data:00000047	d1	
ret z			;	.data:00000048	c8	
jr %0041		;	.data:00000049	18	f6
dec iy			;	.data:0000004b	fd	2b
ld (iy+0),l		;	.data:0000004d	fd	75 00
ret				;	.data:00000050	c9

			
ld h,(iy+0)		;	.data:00000051	fd	66 00
inc iy			;	.data:00000054	fd	23
ret				;	.data:00000056	c9	
ld a,%ff		;	.data:00000057	3e	ff
ex af,af'		;	.data:00000059	8	
ld hl,%0098		;	.data:0000005a	21	98 00
ld (%fc80),hl	;	.data:0000005d	22	80 fc
pop hl			;	.data:00000060	e1	
ret				;	.data:00000061	c9	
			
nop			;	.data:00000062	0	
nop			;	.data:00000063	0	
nop			;	.data:00000064	0	
jp (hl)			;	.data:00000065	e9	
ex af,af'			;	.data:00000066	8	
dec a			;	.data:00000067	3d	
jr z,%006c			;	.data:00000068	28	2
ex af,af'			;	.data:0000006a	8	
ret			;	.data:0000006b	c9	
			
push hl			;	.data:0000006c	e5	
ld hl,(%fc80)			;	.data:0000006d	2a	80 fc
jp (hl)			;	.data:00000070	e9	
ld a,%4a			;	.data:00000071	3e	4a
ex af,af'			;	.data:00000073	8	
push af			;	.data:00000074	f5	
push bc			;	.data:00000075	c5	
push de			;	.data:00000076	d5	
ld bc,%1809			;	.data:00000077	1	09 18
ld hl,%0098			;	.data:0000007a	21	98 00
ld (%fc80),hl			;	.data:0000007d	22	80 fc
ld hl,(%fc6e)			;	.data:00000080	2a	6e fc
ld a,%ea			;	.data:00000083	3e	ea
halt			;	.data:00000085	76	
out (%fd),a			;	.data:00000086	d3	fd
call %0092			;	.data:00000088	cd	92 00
out (%fe),a			;	.data:0000008b	d3	fe
pop de			;	.data:0000008d	d1	
pop bc			;	.data:0000008e	c1	
pop af			;	.data:0000008f	f1	
pop hl			;	.data:00000090	e1	
ret			;	.data:00000091	c9	
		
ld r,a			;	.data:00000092	ed	4f
ld a,%dd			;	.data:00000094	3e	dd
ei			;	.data:00000096	fb	
halt			;	.data:00000097	76	
out (%fd),a			;	.data:00000098	d3	fd
in a,(%fe)			;	.data:0000009a	db	fe
ld a,%1e			;	.data:0000009c	3e	1e
ex af,af'			;	.data:0000009e	8	
ld hl,(%fc82)			;	.data:0000009f	2a	82 fc
ld (%fc80),hl			;	.data:000000a2	22	80 fc
push bc			;	.data:000000a5	c5	
push af			;	.data:000000a6	f5	
ld hl,%0000			;	.data:000000a7	21	00 00
ld bc,%fefe			;	.data:000000aa	1	fe fe
in a,(c)			;	.data:000000ad	ed	78
or %e0			;	.data:000000af	f6	e0
cpl			;	.data:000000b1	2f	
or a			;	.data:000000b2	b7	
jr z,%00b7			;	.data:000000b3	28	2
set 0,l			;	.data:000000b5	cb	c5
rrc l			;	.data:000000b7	cb	0d
or h			;	.data:000000b9	b4	
ld h,a			;	.data:000000ba	67	
rlc b			;	.data:000000bb	cb	0
jr c,%00ad			;	.data:000000bd	38	ee
ld a,l			;	.data:000000bf	7d	
and h			;	.data:000000c0	a4	
rrca			;	.data:000000c1	0f	
ld bc,%0800			;	.data:000000c2	1	00 08
jr nc,%00c9			;	.data:000000c5	30	2
set 6,c			;	.data:000000c7	cb	f1
srl h			;	.data:000000c9	cb	3c
srl l			;	.data:000000cb	cb	3d
ld a,h			;	.data:000000cd	7c	
neg			;	.data:000000ce	ed	44
and h			;	.data:000000d0	a4	
sub h			;	.data:000000d1	94	
jr nz,%00d9			;	.data:000000d2	20	5
ld a,l			;	.data:000000d4	7d	
neg			;	.data:000000d5	ed	44
and l			;	.data:000000d7	a5	
sub l			;	.data:000000d8	95	
jr nz,%00f4			;	.data:000000d9	20	19
rlc l			;	.data:000000db	cb	5
jr nc,%00e0			;	.data:000000dd	30	1
add a,b			;	.data:000000df	80	
djnz %00db			;	.data:000000e0	10	f9
add a,c			;	.data:000000e2	81	
ld c,a			;	.data:000000e3	4f	
ld b,%05			;	.data:000000e4	6	5
ld l,%08			;	.data:000000e6	2e	8
xor a			;	.data:000000e8	af	
add a,l			;	.data:000000e9	85	
rrc h			;	.data:000000ea	cb	0c
jr nc,%00f0			;	.data:000000ec	30	2
add a,c			;	.data:000000ee	81	
ld c,a			;	.data:000000ef	4f	
djnz %00e9			;	.data:000000f0	10	f7
jr %00fa			;	.data:000000f2	18	6
ld b,%22			;	.data:000000f4	6	22
djnz %00f6			;	.data:000000f6	10	fe
set 7,c			;	.data:000000f8	cb	f9
ld hl,%fcab			;	.data:000000fa	21	ab fc
ld a,c			;	.data:000000fd	79	
and %bf			;	.data:000000fe	e6	bf
out (%ff),a			;	.data:00000100	d3	ff
out (%fe),a			;	.data:00000102	d3	fe
jr nz,%0109			;	.data:00000104	20	3
ld (hl),a			;	.data:00000106	77	
jr %0119			;	.data:00000107	18	10
ld a,c			;	.data:00000109	79	
bit 7,(hl)			;	.data:0000010a	cb	7e
jr nz,%0119			;	.data:0000010c	20	0b
xor (hl)			;	.data:0000010e	ae	
jr z,%011e			;	.data:0000010f	28	0d
cp c			;	.data:00000111	b9	
jr nz,%0117			;	.data:00000112	20	3
ld (hl),c			;	.data:00000114	71	
jr %0119			;	.data:00000115	18	2
set 7,(hl)			;	.data:00000117	cb	fe
dec hl			;	.data:00000119	2b	
ld (hl),%03			;	.data:0000011a	36	3
jr %012e			;	.data:0000011c	18	10
dec hl			;	.data:0000011e	2b	
dec (hl)			;	.data:0000011f	35	
ld a,(hl)			;	.data:00000120	7e	
and %1f			;	.data:00000121	e6	1f
jr nz,%012e			;	.data:00000123	20	9
bit 5,(hl)			;	.data:00000125	cb	6e
jr z,%012b			;	.data:00000127	28	2
ld (hl),%24			;	.data:00000129	36	24
inc hl			;	.data:0000012b	23	
inc hl			;	.data:0000012c	23	
ld (hl),c			;	.data:0000012d	71	
ld hl,(%fc70)			;	.data:0000012e	2a	70 fc
push hl			;	.data:00000131	e5	
jr %0139			;	.data:00000132	18	5
ex (sp),ix			;	.data:00000134	dd	e3
pop ix			;	.data:00000136	dd	e1
pop hl			;	.data:00000138	e1	
push hl			;	.data:00000139	e5	
ld a,(hl)			;	.data:0000013a	7e	
inc hl			;	.data:0000013b	23	
ld h,(hl)			;	.data:0000013c	66	
ld l,a			;	.data:0000013d	6f	
xor a			;	.data:0000013e	af	
ex (sp),hl			;	.data:0000013f	e3	
cp h			;	.data:00000140	bc	
jr z,%0178			;	.data:00000141	28	35
inc hl			;	.data:00000143	23	
inc hl			;	.data:00000144	23	
ld bc,%04ff			;	.data:00000145	1	ff 04
push hl			;	.data:00000148	e5	
cp (hl)			;	.data:00000149	be	
jr nz,%016b			;	.data:0000014a	20	1f
inc hl			;	.data:0000014c	23	
djnz %0149			;	.data:0000014d	10	fa
ex (sp),ix			;	.data:0000014f	dd	e3
ld b,%04			;	.data:00000151	6	4
ld a,(ix+4)			;	.data:00000153	dd	7e 04
ld (ix+0),a			;	.data:00000156	dd	77 00
inc ix			;	.data:00000159	dd	23
djnz %0153			;	.data:0000015b	10	f6
inc c			;	.data:0000015d	0c	
jr z,%0136			;	.data:0000015e	28	d6
bit 6,(ix+4)			;	.data:00000160	dd	cb 04 76
jr nz,%0136			;	.data:00000164	20	d0
inc (ix+4)			;	.data:00000166	dd	34 04
jr %0136			;	.data:00000169	18	cb
pop hl			;	.data:0000016b	e1	
push hl			;	.data:0000016c	e5	
ld bc,%0400			;	.data:0000016d	1	00 04
inc (hl)			;	.data:00000170	34	
jr nz,%0134			;	.data:00000171	20	c1
inc hl			;	.data:00000173	23	
djnz %0170			;	.data:00000174	10	fa
jr %014f			;	.data:00000176	18	d7
pop hl			;	.data:00000178	e1	
pop hl			;	.data:00000179	e1	
push hl			;	.data:0000017a	e5	
ld a,(hl)			;	.data:0000017b	7e	
inc hl			;	.data:0000017c	23	
ld h,(hl)			;	.data:0000017d	66	
ld l,a			;	.data:0000017e	6f	
ex (sp),hl			;	.data:0000017f	e3	
ld a,l			;	.data:00000180	7d	
add a,%0a			;	.data:00000181	c6	0a
ld l,a			;	.data:00000183	6f	
ld a,%00			;	.data:00000184	3e	0
adc a,h			;	.data:00000186	8c	
ld h,a			;	.data:00000187	67	
or a			;	.data:00000188	b7	
jr z,%01db			;	.data:00000189	28	50
ld a,(hl)			;	.data:0000018b	7e	
bit 7,a			;	.data:0000018c	cb	7f
jr nz,%01db			;	.data:0000018e	20	4b
bit 6,a			;	.data:00000190	cb	77
jr nz,%0179			;	.data:00000192	20	e5
or a			;	.data:00000194	b7	
jr z,%0179			;	.data:00000195	28	e2
dec (hl)			;	.data:00000197	35	
set 7,(hl)			;	.data:00000198	cb	fe
push hl			;	.data:0000019a	e5	
push de			;	.data:0000019b	d5	
exx			;	.data:0000019c	d9	
push hl			;	.data:0000019d	e5	
push de			;	.data:0000019e	d5	
push bc			;	.data:0000019f	c5	
push ix			;	.data:000001a0	dd	e5
exx			;	.data:000001a2	d9	
inc hl			;	.data:000001a3	23	
ld a,(hl)			;	.data:000001a4	7e	
inc hl			;	.data:000001a5	23	
ld h,(hl)			;	.data:000001a6	66	
ld l,a			;	.data:000001a7	6f	
push hl			;	.data:000001a8	e5	
ld hl,%fcad			;	.data:000001a9	21	ad fc
bit 4,(hl)			;	.data:000001ac	cb	66
jr nz,%01b6			;	.data:000001ae	20	6
pop hl			;	.data:000001b0	e1	
call %0065			;	.data:000001b1	cd	65 00
jr %01cf			;	.data:000001b4	18	19
res 4,(hl)			;	.data:000001b6	cb	a6
set 5,(hl)			;	.data:000001b8	cb	ee
ex (sp),hl			;	.data:000001ba	e3	
ld (%fc96),sp			;	.data:000001bb	ed	73 96 fc
ld sp,(%fc94)			;	.data:000001bf	ed	7b 94 fc
call %0065			;	.data:000001c3	cd	65 00
ld sp,(%fc96)			;	.data:000001c6	ed	7b 96 fc
pop hl			;	.data:000001ca	e1	
res 5,(hl)			;	.data:000001cb	cb	ae
set 4,(hl)			;	.data:000001cd	cb	e6
pop ix			;	.data:000001cf	dd	e1
pop bc			;	.data:000001d1	c1	
pop de			;	.data:000001d2	d1	
pop hl			;	.data:000001d3	e1	
exx			;	.data:000001d4	d9	
pop de			;	.data:000001d5	d1	
pop hl			;	.data:000001d6	e1	
res 7,(hl)			;	.data:000001d7	cb	be
jr %018b			;	.data:000001d9	18	b0
pop hl			;	.data:000001db	e1	
ld hl,%fcac			;	.data:000001dc	21	ac fc
ld a,(hl)			;	.data:000001df	7e	
bit 7,a			;	.data:000001e0	cb	7f
jr nz,%01fd			;	.data:000001e2	20	19
set 7,(hl)			;	.data:000001e4	cb	fe
push hl			;	.data:000001e6	e5	
ld hl,%1d38			;	.data:000001e7	21	38 1d
add a,l			;	.data:000001ea	85	
ld l,a			;	.data:000001eb	6f	
ld a,(hl)			;	.data:000001ec	7e	
bit 7,a			;	.data:000001ed	cb	7f
jp nz,%094d			;	.data:000001ef	c2	4d 09
ld hl,(%fca6)			;	.data:000001f2	2a	a6 fc
call %0065			;	.data:000001f5	cd	65 00
pop hl			;	.data:000001f8	e1	
jr nc,%01fd			;	.data:000001f9	30	2
res 7,(hl)			;	.data:000001fb	cb	be
pop af			;	.data:000001fd	f1	
pop bc			;	.data:000001fe	c1	
pop hl			;	.data:000001ff	e1	
ret			;	.data:00000200	c9	
			
ld a,(hl)			;	.data:00000201	7e	
dec a			;	.data:00000202	3d	
or %c0			;	.data:00000203	f6	c0
ld (hl),a			;	.data:00000205	77	
ld l,a			;	.data:00000206	6f	
pop af			;	.data:00000207	f1	
ld (hl),a			;	.data:00000208	77	
pop hl			;	.data:00000209	e1	
ret			;	.data:0000020a	c9	
			
ld l,a			;	.data:0000020b	6f	
inc a			;	.data:0000020c	3c	
or %c0			;	.data:0000020d	f6	c0
ld (%fc84),a			;	.data:0000020f	32	84 fc
ld a,(hl)			;	.data:00000212	7e	
pop hl			;	.data:00000213	e1	
ret			;	.data:00000214	c9	
			
push hl			;	.data:00000215	e5	
push de			;	.data:00000216	d5	
push bc			;	.data:00000217	c5	
ex de,hl			;	.data:00000218	eb	
add hl,de			;	.data:00000219	19	
ld a,(hl)			;	.data:0000021a	7e	
ld (de),a			;	.data:0000021b	12	
inc de			;	.data:0000021c	13	
inc hl			;	.data:0000021d	23	
djnz %021a			;	.data:0000021e	10	fa
pop bc			;	.data:00000220	c1	
pop de			;	.data:00000221	d1	
pop hl			;	.data:00000222	e1	
ret			;	.data:00000223	c9	
			
push hl			;	.data:00000224	e5	
push bc			;	.data:00000225	c5	
ld (hl),a			;	.data:00000226	77	
inc hl			;	.data:00000227	23	
djnz %0226			;	.data:00000228	10	fc
pop bc			;	.data:0000022a	c1	
pop hl			;	.data:0000022b	e1	
ret			;	.data:0000022c	c9	
			
push af			;	.data:0000022d	f5	
ld a,(ix+1)			;	.data:0000022e	dd	7e 01
rrca			;	.data:00000231	0f	
rrca			;	.data:00000232	0f	
rrca			;	.data:00000233	0f	
ld h,a			;	.data:00000234	67	
and %e0			;	.data:00000235	e6	e0
or (ix+0)			;	.data:00000237	dd	b6 00
ld l,a			;	.data:0000023a	6f	
ld a,h			;	.data:0000023b	7c	
and %03			;	.data:0000023c	e6	3
ld h,a			;	.data:0000023e	67	
pop af			;	.data:0000023f	f1	
ret			;	.data:00000240	c9	
			
push ix			;	.data:00000241	dd	e5
push de			;	.data:00000243	d5	
ld de,%0002			;	.data:00000244	11	02 00
add ix,de			;	.data:00000247	dd	19
ex de,hl			;	.data:00000249	eb	
ld hl,(%fc6e)			;	.data:0000024a	2a	6e fc
ex de,hl			;	.data:0000024d	eb	
call %022d			;	.data:0000024e	cd	2d 02
add hl,de			;	.data:00000251	19	
pop de			;	.data:00000252	d1	
pop ix			;	.data:00000253	dd	e1
ret			;	.data:00000255	c9	
			
push de			;	.data:00000256	d5	
call %0241			;	.data:00000257	cd	41 02
ex de,hl			;	.data:0000025a	eb	
call %022d			;	.data:0000025b	cd	2d 02
add hl,de			;	.data:0000025e	19	
pop de			;	.data:0000025f	d1	
ret			;	.data:00000260	c9	
		
ld bc,%0000			;	.data:00000261	1	00 00
ld a,(ix+4)			;	.data:00000264	dd	7e 04
sub (ix+2)			;	.data:00000267	dd	96 02
ret c			;	.data:0000026a	d8	
ld b,a			;	.data:0000026b	47	
ld a,(ix+5)			;	.data:0000026c	dd	7e 05
sub (ix+3)			;	.data:0000026f	dd	96 03
ret c			;	.data:00000272	d8	
ld c,a			;	.data:00000273	4f	
inc b			;	.data:00000274	4	
inc c			;	.data:00000275	0c	
ret			;	.data:00000276	c9	
	
push af			;	.data:00000277	f5	
push hl			;	.data:00000278	e5	
call %0256			;	.data:00000279	cd	56 02
ld a,(hl)			;	.data:0000027c	7e	
xor %80			;	.data:0000027d	ee	80
ld (hl),a			;	.data:0000027f	77	
pop hl			;	.data:00000280	e1	
pop af			;	.data:00000281	f1	
ret			;	.data:00000282	c9	
		
call %0261			;	.data:00000283	cd	61 02
ret c			;	.data:00000286	d8	
call %0241			;	.data:00000287	cd	41 02
ld de,%0020			;	.data:0000028a	11	20 00
ld a,(ix+7)			;	.data:0000028d	dd	7e 07
call %0224			;	.data:00000290	cd	24 02
add hl,de			;	.data:00000293	19	
dec c			;	.data:00000294	0d	
jr nz,%0290			;	.data:00000295	20	f9
call %029f			;	.data:00000297	cd	9f 02
ld (ix+1),%00			;	.data:0000029a	dd	36 01 00
ret			;	.data:0000029e	c9	
		
ld (ix+0),%00			;	.data:0000029f	dd	36 00 00
ret			;	.data:000002a3	c9	
		
push hl			;	.data:000002a4	e5	
push de			;	.data:000002a5	d5	
push bc			;	.data:000002a6	c5	
call %0261			;	.data:000002a7	cd	61 02
jr c,%02c2			;	.data:000002aa	38	16
call %0241			;	.data:000002ac	cd	41 02
ld de,%0020			;	.data:000002af	11	20 00
dec c			;	.data:000002b2	0d	
jr z,%02bc			;	.data:000002b3	28	7
call %0215			;	.data:000002b5	cd	15 02
add hl,de			;	.data:000002b8	19	
dec c			;	.data:000002b9	0d	
jr nz,%02b5			;	.data:000002ba	20	f9
ld a,(ix+7)			;	.data:000002bc	dd	7e 07
call %0224			;	.data:000002bf	cd	24 02
pop bc			;	.data:000002c2	c1	
pop de			;	.data:000002c3	d1	
pop hl			;	.data:000002c4	e1	
ret			;	.data:000002c5	c9	
				
push hl			;	.data:000002c6	e5	
push de			;	.data:000002c7	d5	
push bc			;	.data:000002c8	c5	
call %0261			;	.data:000002c9	cd	61 02
jr c,%02df			;	.data:000002cc	38	11
ld a,(ix+1)			;	.data:000002ce	dd	7e 01
inc a			;	.data:000002d1	3c	
cp c			;	.data:000002d2	b9	
jr c,%02dc			;	.data:000002d3	38	7
dec c			;	.data:000002d5	0d	
ld a,c			;	.data:000002d6	79	
push af			;	.data:000002d7	f5	
call %02a4			;	.data:000002d8	cd	a4 02
pop af			;	.data:000002db	f1	
ld (ix+1),a			;	.data:000002dc	dd	77 01
pop bc			;	.data:000002df	c1	
pop de			;	.data:000002e0	d1	
pop hl			;	.data:000002e1	e1	
ret			;	.data:000002e2	c9	
			
push hl			;	.data:000002e3	e5	
push de			;	.data:000002e4	d5	
push bc			;	.data:000002e5	c5	
call %0261			;	.data:000002e6	cd	61 02
jr c,%02fb			;	.data:000002e9	38	10
ld a,(ix+0)			;	.data:000002eb	dd	7e 00
inc a			;	.data:000002ee	3c	
cp b			;	.data:000002ef	b8	
jr c,%02f8			;	.data:000002f0	38	6
call %029f			;	.data:000002f2	cd	9f 02
jp %02c9			;	.data:000002f5	c3	c9 02
ld (ix+0),a			;	.data:000002f8	dd	77 00
pop bc			;	.data:000002fb	c1	
pop de			;	.data:000002fc	d1	
pop hl			;	.data:000002fd	e1	
ret			;	.data:000002fe	c9	
			
ld a,(ix+1)			;	.data:000002ff	dd	7e 01
or a			;	.data:00000302	b7	
ret z			;	.data:00000303	c8	
dec (ix+1)			;	.data:00000304	dd	35 01
ret			;	.data:00000307	c9	
		
ld a,(ix+0)			;	.data:00000308	dd	7e 00
or a			;	.data:0000030b	b7	
ld b,a			;	.data:0000030c	47	
jr nz,%0317			;	.data:0000030d	20	8
call %02ff			;	.data:0000030f	cd	ff 02
nop			;	.data:00000312	0	
call %0261			;	.data:00000313	cd	61 02
ret c			;	.data:00000316	d8	
dec b			;	.data:00000317	5	
ld (ix+0),b			;	.data:00000318	dd	70 00
ret			;	.data:0000031b	c9	
		
call %0261			;	.data:0000031c	cd	61 02
dec c			;	.data:0000031f	0d	
ld (ix+1),c			;	.data:00000320	dd	71 01
ret			;	.data:00000323	c9	
			
push af			;	.data:00000324	f5	
push hl			;	.data:00000325	e5	
call %0256			;	.data:00000326	cd	56 02
ld a,(hl)			;	.data:00000329	7e	
and %3f			;	.data:0000032a	e6	3f
xor (ix+6)			;	.data:0000032c	dd	ae 06
ld (hl),a			;	.data:0000032f	77	
pop hl			;	.data:00000330	e1	
pop af			;	.data:00000331	f1	
ret			;	.data:00000332	c9	
			
push af			;	.data:00000333	f5	
push hl			;	.data:00000334	e5	
push de			;	.data:00000335	d5	
push bc			;	.data:00000336	c5	
call %0324			;	.data:00000337	cd	24 03
and %7f			;	.data:0000033a	e6	7f
cp %60			;	.data:0000033c	fe	60
jr c,%0342			;	.data:0000033e	38	2
add a,%e0			;	.data:00000340	c6	e0
cp %20			;	.data:00000342	fe	20
jr nc,%0357			;	.data:00000344	30	11
ld hl,%1cc0			;	.data:00000346	21	c0 1c
add a,a			;	.data:00000349	87	
add a,l			;	.data:0000034a	85	
ld l,a			;	.data:0000034b	6f	
call %0365			;	.data:0000034c	cd	65 03
call %0277			;	.data:0000034f	cd	77 02
pop bc			;	.data:00000352	c1	
pop de			;	.data:00000353	d1	
pop hl			;	.data:00000354	e1	
pop af			;	.data:00000355	f1	
ret			;	.data:00000356	c9	
			
add a,%e0			;	.data:00000357	c6	e0
call %0256			;	.data:00000359	cd	56 02
xor (ix+6)			;	.data:0000035c	dd	ae 06
ld (hl),a			;	.data:0000035f	77	
call %02e3			;	.data:00000360	cd	e3 02
jr %034f			;	.data:00000363	18	ea
ld a,(hl)			;	.data:00000365	7e	
inc hl			;	.data:00000366	23	
ld h,(hl)			;	.data:00000367	66	
ld l,a			;	.data:00000368	6f	
jp (hl)			;	.data:00000369	e9	
push hl			;	.data:0000036a	e5	
push de			;	.data:0000036b	d5	
push bc			;	.data:0000036c	c5	
push hl			;	.data:0000036d	e5	
or a			;	.data:0000036e	b7	
sbc hl,de			;	.data:0000036f	ed	52
jr nc,%037e			;	.data:00000371	30	0b
ex de,hl			;	.data:00000373	eb	
add hl,bc			;	.data:00000374	9	
ex de,hl			;	.data:00000375	eb	
pop hl			;	.data:00000376	e1	
add hl,bc			;	.data:00000377	9	
dec hl			;	.data:00000378	2b	
dec de			;	.data:00000379	1b	
lddr			;	.data:0000037a	ed	b8
jr %0381			;	.data:0000037c	18	3
pop hl			;	.data:0000037e	e1	
ldir			;	.data:0000037f	ed	b0
pop bc			;	.data:00000381	c1	
pop de			;	.data:00000382	d1	
pop hl			;	.data:00000383	e1	
ret			;	.data:00000384	c9	
			
call %0256			;	.data:00000385	cd	56 02
call %0261			;	.data:00000388	cd	61 02
ld a,b			;	.data:0000038b	78	
ld b,%00			;	.data:0000038c	6	0
sub (ix+0)			;	.data:0000038e	dd	96 00
dec a			;	.data:00000391	3d	
ld c,a			;	.data:00000392	4f	
jr z,%039b			;	.data:00000393	28	6
push hl			;	.data:00000395	e5	
pop de			;	.data:00000396	d1	
inc hl			;	.data:00000397	23	
call %036a			;	.data:00000398	cd	6a 03
ld a,c			;	.data:0000039b	79	
add a,e			;	.data:0000039c	83	
ld l,a			;	.data:0000039d	6f	
ld a,(ix+7)			;	.data:0000039e	dd	7e 07
ld (hl),a			;	.data:000003a1	77	
ret			;	.data:000003a2	c9	
			
ld a,(ix+3)			;	.data:000003a3	dd	7e 03
push af			;	.data:000003a6	f5	
add a,(ix+1)			;	.data:000003a7	dd	86 01
ld (ix+3),a			;	.data:000003aa	dd	77 03
call %02a4			;	.data:000003ad	cd	a4 02
pop af			;	.data:000003b0	f1	
ld (ix+3),a			;	.data:000003b1	dd	77 03
ret			;	.data:000003b4	c9	
			
push hl			;	.data:000003b5	e5	
ld hl,%fcad			;	.data:000003b6	21	ad fc
bit 0,(hl)			;	.data:000003b9	cb	46
pop hl			;	.data:000003bb	e1	
ret			;	.data:000003bc	c9	
		
push hl			;	.data:000003bd	e5	
push de			;	.data:000003be	d5	
push bc			;	.data:000003bf	c5	
call %0261			;	.data:000003c0	cd	61 02
ld a,(ix+3)			;	.data:000003c3	dd	7e 03
push af			;	.data:000003c6	f5	
ld a,(ix+5)			;	.data:000003c7	dd	7e 05
ld (ix+3),a			;	.data:000003ca	dd	77 03
call %0241			;	.data:000003cd	cd	41 02
pop af			;	.data:000003d0	f1	
ld (ix+3),a			;	.data:000003d1	dd	77 03
ld de,%ffe0			;	.data:000003d4	11	e0 ff
jp %02b2			;	.data:000003d7	c3	b2 02
ld a,(ix+3)			;	.data:000003da	dd	7e 03
push af			;	.data:000003dd	f5	
add a,(ix+1)			;	.data:000003de	dd	86 01
ld (ix+3),a			;	.data:000003e1	dd	77 03
call %03bd			;	.data:000003e4	cd	bd 03
pop af			;	.data:000003e7	f1	
ld (ix+3),a			;	.data:000003e8	dd	77 03
jp %029f			;	.data:000003eb	c3	9f 02
call %03b5			;	.data:000003ee	cd	b5 03
ret z			;	.data:000003f1	c8	
call %029f			;	.data:000003f2	cd	9f 02
call %0256			;	.data:000003f5	cd	56 02
push hl			;	.data:000003f8	e5	
ld hl,(%fc6e)			;	.data:000003f9	2a	6e fc
ld de,%0200			;	.data:000003fc	11	00 02
add hl,de			;	.data:000003ff	19	
ex de,hl			;	.data:00000400	eb	
pop hl			;	.data:00000401	e1	
call %0261			;	.data:00000402	cd	61 02
ld c,b			;	.data:00000405	48	
ld b,%00			;	.data:00000406	6	0
call %036a			;	.data:00000408	cd	6a 03
ex de,hl			;	.data:0000040b	eb	
ld b,c			;	.data:0000040c	41	
call %0411			;	.data:0000040d	cd	11 04
ret			;	.data:00000410	c9	
			
push hl			;	.data:00000411	e5	
push bc			;	.data:00000412	c5	
ld a,(hl)			;	.data:00000413	7e	
xor %80			;	.data:00000414	ee	80
ld (hl),a			;	.data:00000416	77	
inc hl			;	.data:00000417	23	
djnz %0413			;	.data:00000418	10	f9
pop bc			;	.data:0000041a	c1	
pop hl			;	.data:0000041b	e1	
ret			;	.data:0000041c	c9	
			
call %03b5			;	.data:0000041d	cd	b5 03
ret z			;	.data:00000420	c8	
call %0261			;	.data:00000421	cd	61 02
ld hl,(%fc6e)			;	.data:00000424	2a	6e fc
ld de,%0200			;	.data:00000427	11	00 02
add hl,de			;	.data:0000042a	19	
call %0411			;	.data:0000042b	cd	11 04
ex de,hl			;	.data:0000042e	eb	
call %029f			;	.data:0000042f	cd	9f 02
call %0256			;	.data:00000432	cd	56 02
ex de,hl			;	.data:00000435	eb	
ld c,b			;	.data:00000436	48	
ld b,%00			;	.data:00000437	6	0
call %036a			;	.data:00000439	cd	6a 03
ld b,c			;	.data:0000043c	41	
call %0411			;	.data:0000043d	cd	11 04
ret			;	.data:00000440	c9	
		
call %03b5			;	.data:00000441	cd	b5 03
ret z			;	.data:00000444	c8	
call %03ee			;	.data:00000445	cd	ee 03
jp %03a3			;	.data:00000448	c3	a3 03
call %03b5			;	.data:0000044b	cd	b5 03
ret z			;	.data:0000044e	c8	
call %03da			;	.data:0000044f	cd	da 03
jp %041d			;	.data:00000452	c3	1d 04
push hl			;	.data:00000455	e5	
ld hl,%fcad			;	.data:00000456	21	ad fc
bit 0,(hl)			;	.data:00000459	cb	46
jr nz,%0478			;	.data:0000045b	20	1b
set 0,(hl)			;	.data:0000045d	cb	c6
bit 6,(hl)			;	.data:0000045f	cb	76
jr nz,%0476			;	.data:00000461	20	13
set 6,(hl)			;	.data:00000463	cb	f6
ld l,%b9			;	.data:00000465	2e	b9
ld (hl),%11			;	.data:00000467	36	11
ld a,%11			;	.data:00000469	3e	11
call %04cf			;	.data:0000046b	cd	cf 04
ld a,%0c			;	.data:0000046e	3e	0c
call %04cf			;	.data:00000470	cd	cf 04
call %0333			;	.data:00000473	cd	33 03
pop hl			;	.data:00000476	e1	
ret			;	.data:00000477	c9	
			
res 0,(hl)			;	.data:00000478	cb	86
pop hl			;	.data:0000047a	e1	
ret			;	.data:0000047b	c9	
			
push hl			;	.data:0000047c	e5	
ld hl,%fcad			;	.data:0000047d	21	ad fc
bit 7,(hl)			;	.data:00000480	cb	7e
set 7,(hl)			;	.data:00000482	cb	fe
jr z,%048b			;	.data:00000484	28	5
res 7,(hl)			;	.data:00000486	cb	be
call %0277			;	.data:00000488	cd	77 02
pop hl			;	.data:0000048b	e1	
ret			;	.data:0000048c	c9	
			
ld a,%1f			;	.data:0000048d	3e	1f
ld hl,(%fca6)			;	.data:0000048f	2a	a6 fc
jp (hl)			;	.data:00000492	e9	
push hl			;	.data:00000493	e5	
ld hl,%fcbe			;	.data:00000494	21	be fc
cp %1f			;	.data:00000497	fe	1f
jr z,%04ad			;	.data:00000499	28	12
bit 0,(hl)			;	.data:0000049b	cb	46
jr z,%04ad			;	.data:0000049d	28	0e
push hl			;	.data:0000049f	e5	
push af			;	.data:000004a0	f5	
ld l,a			;	.data:000004a1	6f	
ld h,%00			;	.data:000004a2	26	0
rst %08			;	.data:000004a4	cf	
ld hl,(%fc74)			;	.data:000004a5	2a	74 fc
call %0065			;	.data:000004a8	cd	65 00
pop af			;	.data:000004ab	f1	
pop hl			;	.data:000004ac	e1	
bit 1,(hl)			;	.data:000004ad	cb	4e
jr nz,%04bc			;	.data:000004af	20	0b
ld hl,%fcad			;	.data:000004b1	21	ad fc
cp %1e			;	.data:000004b4	fe	1e
jr z,%04bf			;	.data:000004b6	28	7
bit 2,(hl)			;	.data:000004b8	cb	56
set 2,(hl)			;	.data:000004ba	cb	d6
scf			;	.data:000004bc	37	
jr nz,%04cd			;	.data:000004bd	20	0e
push ix			;	.data:000004bf	dd	e5
ld ix,%fcb6			;	.data:000004c1	dd	21 b6 fc
call %0333			;	.data:000004c5	cd	33 03
pop ix			;	.data:000004c8	dd	e1
or a			;	.data:000004ca	b7	
res 2,(hl)			;	.data:000004cb	cb	96
pop hl			;	.data:000004cd	e1	
ret			;	.data:000004ce	c9	
			
push hl			;	.data:000004cf	e5	
ld hl,%fcad			;	.data:000004d0	21	ad fc
bit 0,(hl)			;	.data:000004d3	cb	46
scf			;	.data:000004d5	37	
jr nz,%04e0			;	.data:000004d6	20	8
ld hl,(%fca8)			;	.data:000004d8	2a	a8 fc
call %0065			;	.data:000004db	cd	65 00
pop hl			;	.data:000004de	e1	
ret			;	.data:000004df	c9	
			
bit 1,(hl)			;	.data:000004e0	cb	4e
set 1,(hl)			;	.data:000004e2	cb	ce
jr nz,%04de			;	.data:000004e4	20	f8
push ix			;	.data:000004e6	dd	e5
ld ix,%fcae			;	.data:000004e8	dd	21 ae fc
cp %20			;	.data:000004ec	fe	20
jr c,%04fa			;	.data:000004ee	38	0a
call %0511			;	.data:000004f0	cd	11 05
res 1,(hl)			;	.data:000004f3	cb	8e
pop ix			;	.data:000004f5	dd	e1
or a			;	.data:000004f7	b7	
jr %04de			;	.data:000004f8	18	e4
cp %0d			;	.data:000004fa	fe	0d
jr nz,%0508			;	.data:000004fc	20	0a
call %0333			;	.data:000004fe	cd	33 03
ld a,%0a			;	.data:00000501	3e	0a
call %0333			;	.data:00000503	cd	33 03
jr %04f3			;	.data:00000506	18	eb
cp %18			;	.data:00000508	fe	18
jr nz,%0503			;	.data:0000050a	20	f7
call %0539			;	.data:0000050c	cd	39 05
jr %04f3			;	.data:0000050f	18	e2
push hl			;	.data:00000511	e5	
push de			;	.data:00000512	d5	
push bc			;	.data:00000513	c5	
push af			;	.data:00000514	f5	
call %0324			;	.data:00000515	cd	24 03
call %0256			;	.data:00000518	cd	56 02
call %0261			;	.data:0000051b	cd	61 02
ld a,b			;	.data:0000051e	78	
ld b,%00			;	.data:0000051f	6	0
sub (ix+0)			;	.data:00000521	dd	96 00
dec a			;	.data:00000524	3d	
ld c,a			;	.data:00000525	4f	
jr z,%052e			;	.data:00000526	28	6
push hl			;	.data:00000528	e5	
pop de			;	.data:00000529	d1	
inc de			;	.data:0000052a	13	
call %036a			;	.data:0000052b	cd	6a 03
call %0277			;	.data:0000052e	cd	77 02
pop af			;	.data:00000531	f1	
call %0333			;	.data:00000532	cd	33 03
pop bc			;	.data:00000535	c1	
pop de			;	.data:00000536	d1	
pop hl			;	.data:00000537	e1	
ret			;	.data:00000538	c9	
			
push hl			;	.data:00000539	e5	
push de			;	.data:0000053a	d5	
push bc			;	.data:0000053b	c5	
call %0324			;	.data:0000053c	cd	24 03
call %029f			;	.data:0000053f	cd	9f 02
call %0256			;	.data:00000542	cd	56 02
call %0261			;	.data:00000545	cd	61 02
dec b			;	.data:00000548	5	
push hl			;	.data:00000549	e5	
ld a,b			;	.data:0000054a	78	
add a,l			;	.data:0000054b	85	
ld l,a			;	.data:0000054c	6f	
jr nc,%0550			;	.data:0000054d	30	1
inc h			;	.data:0000054f	24	
ld a,(hl)			;	.data:00000550	7e	
and %7f			;	.data:00000551	e6	7f
jr nz,%0568			;	.data:00000553	20	13
dec hl			;	.data:00000555	2b	
ld a,(hl)			;	.data:00000556	7e	
and %7f			;	.data:00000557	e6	7f
jr nz,%055d			;	.data:00000559	20	2
djnz %0555			;	.data:0000055b	10	f8
pop hl			;	.data:0000055d	e1	
call %0574			;	.data:0000055e	cd	74 05
ld a,%0d			;	.data:00000561	3e	0d
call %0581			;	.data:00000563	cd	81 05
jr %056d			;	.data:00000566	18	5
pop hl			;	.data:00000568	e1	
inc b			;	.data:00000569	4	
call %0574			;	.data:0000056a	cd	74 05
call %0277			;	.data:0000056d	cd	77 02
pop bc			;	.data:00000570	c1	
pop de			;	.data:00000571	d1	
pop hl			;	.data:00000572	e1	
ret			;	.data:00000573	c9	
			
xor a			;	.data:00000574	af	
cp b			;	.data:00000575	b8	
ret z			;	.data:00000576	c8	
ld a,(hl)			;	.data:00000577	7e	
add a,%20			;	.data:00000578	c6	20
call %0581			;	.data:0000057a	cd	81 05
inc hl			;	.data:0000057d	23	
djnz %0577			;	.data:0000057e	10	f7
ret			;	.data:00000580	c9	
			
push hl			;	.data:00000581	e5	
ld hl,(%fca8)			;	.data:00000582	2a	a8 fc
call %0065			;	.data:00000585	cd	65 00
pop hl			;	.data:00000588	e1	
ret			;	.data:00000589	c9	
				
call %03b5			;	.data:0000058a	cd	b5 03
ret nz			;	.data:0000058d	c0	
ld hl,%fca5			;	.data:0000058e	21	a5 fc
bit 1,(hl)			;	.data:00000591	cb	4e
res 1,(hl)			;	.data:00000593	cb	8e
ret z			;	.data:00000595	c8	
ld b,%0f			;	.data:00000596	6	0f
ld a,%1e			;	.data:00000598	3e	1e
call %05b5			;	.data:0000059a	cd	b5 05
ld a,%01			;	.data:0000059d	3e	1
call %04cf			;	.data:0000059f	cd	cf 04
ld a,%18			;	.data:000005a2	3e	18
call %04cf			;	.data:000005a4	cd	cf 04
ld a,%0a			;	.data:000005a7	3e	0a
call %05b5			;	.data:000005a9	cd	b5 05
djnz %05a2			;	.data:000005ac	10	f4
ld a,%18			;	.data:000005ae	3e	18
call %05b5			;	.data:000005b0	cd	b5 05
ld a,%1e			;	.data:000005b3	3e	1e
call %04cf			;	.data:000005b5	cd	cf 04
jp %08ef			;	.data:000005b8	c3	ef 08
push hl			;	.data:000005bb	e5	
push de			;	.data:000005bc	d5	
push bc			;	.data:000005bd	c5	
push ix			;	.data:000005be	dd	e5
ld hl,%fcad			;	.data:000005c0	21	ad fc
bit 5,(hl)			;	.data:000005c3	cb	6e
jr nz,%05e5			;	.data:000005c5	20	1e
set 5,(hl)			;	.data:000005c7	cb	ee
bit 4,(hl)			;	.data:000005c9	cb	66
jr z,%05d9			;	.data:000005cb	28	0c
res 4,(hl)			;	.data:000005cd	cb	a6
ld (%fc96),sp			;	.data:000005cf	ed	73 96 fc
ld sp,(%fc94)			;	.data:000005d3	ed	7b 94 fc
jr %05e3			;	.data:000005d7	18	0a
set 4,(hl)			;	.data:000005d9	cb	e6
ld (%fc94),sp			;	.data:000005db	ed	73 94 fc
ld sp,(%fc96)			;	.data:000005df	ed	7b 96 fc
res 5,(hl)			;	.data:000005e3	cb	ae
pop ix			;	.data:000005e5	dd	e1
pop bc			;	.data:000005e7	c1	
pop de			;	.data:000005e8	d1	
pop hl			;	.data:000005e9	e1	
ret			;	.data:000005ea	c9	
			
ld hl,%fcad			;	.data:000005eb	21	ad fc
res 4,(hl)			;	.data:000005ee	cb	a6
res 5,(hl)			;	.data:000005f0	cb	ae
ld hl,%0a1b			;	.data:000005f2	21	1b 0a
ld (%fc3e),hl			;	.data:000005f5	22	3e fc
ld hl,%fc36			;	.data:000005f8	21	36 fc
ld (%fc96),hl			;	.data:000005fb	22	96 fc
ret			;	.data:000005fe	c9	
			
cp %1e			;	.data:000005ff	fe	1e
jp z,%0493			;	.data:00000601	ca	93 04
set 7,a			;	.data:00000604	cb	ff
push hl			;	.data:00000606	e5	
ld hl,%fcad			;	.data:00000607	21	ad fc
bit 4,(hl)			;	.data:0000060a	cb	66
jr z,%061e			;	.data:0000060c	28	10
bit 3,(hl)			;	.data:0000060e	cb	5e
set 3,(hl)			;	.data:00000610	cb	de
jr nz,%061e			;	.data:00000612	20	0a
call %05bb			;	.data:00000614	cd	bb 05
res 3,(hl)			;	.data:00000617	cb	9e
or a			;	.data:00000619	b7	
bit 7,a			;	.data:0000061a	cb	7f
jr z,%061f			;	.data:0000061c	28	1
scf			;	.data:0000061e	37	
pop hl			;	.data:0000061f	e1	
ret			;	.data:00000620	c9	
			
ld a,(%fcad)			;	.data:00000621	3a	ad fc
bit 4,a			;	.data:00000624	cb	67
ret nz			;	.data:00000626	c0	
sbc a,a			;	.data:00000627	9f	
call %05bb			;	.data:00000628	cd	bb 05
ret			;	.data:0000062b	c9	
			
push hl			;	.data:0000062c	e5	
ld hl,%fca5			;	.data:0000062d	21	a5 fc
set 0,(hl)			;	.data:00000630	cb	c6
call %06da			;	.data:00000632	cd	da 06
pop hl			;	.data:00000635	e1	
ret			;	.data:00000636	c9	
			
push hl			;	.data:00000637	e5	
ld a,(hl)			;	.data:00000638	7e	
ld h,%00			;	.data:00000639	26	0
and %3f			;	.data:0000063b	e6	3f
ld l,a			;	.data:0000063d	6f	
rst %08			;	.data:0000063e	cf	
jr z,%0650			;	.data:0000063f	28	0f
pop hl			;	.data:00000641	e1	
push hl			;	.data:00000642	e5	
push bc			;	.data:00000643	c5	
ld b,a			;	.data:00000644	47	
add a,l			;	.data:00000645	85	
ld l,a			;	.data:00000646	6f	
jr nc,%064a			;	.data:00000647	30	1
inc h			;	.data:00000649	24	
ld a,(hl)			;	.data:0000064a	7e	
rst %18			;	.data:0000064b	df	
dec hl			;	.data:0000064c	2b	
djnz %064a			;	.data:0000064d	10	fb
pop bc			;	.data:0000064f	c1	
pop hl			;	.data:00000650	e1	
ret			;	.data:00000651	c9	
			
push af			;	.data:00000652	f5	
push hl			;	.data:00000653	e5	
rst %10			;	.data:00000654	d7	
ld a,l			;	.data:00000655	7d	
and %3f			;	.data:00000656	e6	3f
jr z,%0662			;	.data:00000658	28	8
ld l,a			;	.data:0000065a	6f	
rst %20			;	.data:0000065b	e7	
call %0493			;	.data:0000065c	cd	93 04
dec l			;	.data:0000065f	2d	
jr nz,%065b			;	.data:00000660	20	f9
pop hl			;	.data:00000662	e1	
pop af			;	.data:00000663	f1	
ret			;	.data:00000664	c9	
			
push af			;	.data:00000665	f5	
call %0637			;	.data:00000666	cd	37 06
call %0652			;	.data:00000669	cd	52 06
pop af			;	.data:0000066c	f1	
ret			;	.data:0000066d	c9	
			
push hl			;	.data:0000066e	e5	
ld hl,%1d60			;	.data:0000066f	21	60 1d
call %0665			;	.data:00000672	cd	65 06
pop hl			;	.data:00000675	e1	
ret			;	.data:00000676	c9	
		
and %7f			;	.data:00000677	e6	7f
cp %60			;	.data:00000679	fe	60
jr c,%067f			;	.data:0000067b	38	2
add a,%e0			;	.data:0000067d	c6	e0
add a,%d0			;	.data:0000067f	c6	d0
cp %10			;	.data:00000681	fe	10
ret c			;	.data:00000683	d8	
add a,%f9			;	.data:00000684	c6	f9
ret			;	.data:00000686	c9	
			
push af			;	.data:00000687	f5	
push hl			;	.data:00000688	e5	
push de			;	.data:00000689	d5	
ex de,hl			;	.data:0000068a	eb	
rst %10			;	.data:0000068b	d7	
ld a,l			;	.data:0000068c	7d	
and %3f			;	.data:0000068d	e6	3f
ld (de),a			;	.data:0000068f	12	
jr z,%0699			;	.data:00000690	28	7
ld l,a			;	.data:00000692	6f	
inc de			;	.data:00000693	13	
rst %20			;	.data:00000694	e7	
ld (de),a			;	.data:00000695	12	
dec l			;	.data:00000696	2d	
jr nz,%0693			;	.data:00000697	20	fa
pop de			;	.data:00000699	d1	
pop hl			;	.data:0000069a	e1	
pop af			;	.data:0000069b	f1	
ret			;	.data:0000069c	c9	

push hl			;	.data:0000069d	e5	
push de			;	.data:0000069e	d5	
push bc			;	.data:0000069f	c5	
rst %10			;	.data:000006a0	d7	
ex de,hl			;	.data:000006a1	eb	
rst %10			;	.data:000006a2	d7	
ld a,(hl)			;	.data:000006a3	7e	
inc hl			;	.data:000006a4	23	
jr %06b1			;	.data:000006a5	18	0a
push hl			;	.data:000006a7	e5	
push de			;	.data:000006a8	d5	
push bc			;	.data:000006a9	c5	
ex de,hl			;	.data:000006aa	eb	
rst %10			;	.data:000006ab	d7	
rst %08			;	.data:000006ac	cf	
ld a,l			;	.data:000006ad	7d	
ld hl,(%fc84)			;	.data:000006ae	2a	84 fc
and %3f			;	.data:000006b1	e6	3f
ld b,a			;	.data:000006b3	47	
ld a,(de)			;	.data:000006b4	1a	
and %3f			;	.data:000006b5	e6	3f
cp b			;	.data:000006b7	b8	
jr nz,%06c5			;	.data:000006b8	20	0b
or a			;	.data:000006ba	b7	
jr z,%06c5			;	.data:000006bb	28	8
inc de			;	.data:000006bd	13	
ld a,(de)			;	.data:000006be	1a	
cp (hl)			;	.data:000006bf	be	
jr nz,%06c5			;	.data:000006c0	20	3
inc hl			;	.data:000006c2	23	
djnz %06bd			;	.data:000006c3	10	f8
pop bc			;	.data:000006c5	c1	
pop de			;	.data:000006c6	d1	
pop hl			;	.data:000006c7	e1	
ret			;	.data:000006c8	c9	
			
push hl			;	.data:000006c9	e5	
ld hl,%1d66			;	.data:000006ca	21	66 1d
call %0665			;	.data:000006cd	cd	65 06
call %0493			;	.data:000006d0	cd	93 04
ld a,%20			;	.data:000006d3	3e	20
call %0493			;	.data:000006d5	cd	93 04
pop hl			;	.data:000006d8	e1	
ret			;	.data:000006d9	c9	
		
push hl			;	.data:000006da	e5	
ld hl,%1d34			;	.data:000006db	21	34 1d
call %0665			;	.data:000006de	cd	65 06
pop hl			;	.data:000006e1	e1	
ret			;	.data:000006e2	c9	
			
call %0782			;	.data:000006e3	cd	82 07
ld a,%55			;	.data:000006e6	3e	55
jp c,%0878			;	.data:000006e8	da	78 08
call %082a			;	.data:000006eb	cd	2a 08
jp %0d6b			;	.data:000006ee	c3	6b 0d
push hl			;	.data:000006f1	e5	
ld hl,%fcbf			;	.data:000006f2	21	bf fc
ld (hl),%00			;	.data:000006f5	36	0
or a			;	.data:000006f7	b7	
call %0621			;	.data:000006f8	cd	21 06
and %7f			;	.data:000006fb	e6	7f
cp %1e			;	.data:000006fd	fe	1e
jr c,%0717			;	.data:000006ff	38	16
call %0493			;	.data:00000701	cd	93 04
cp %20			;	.data:00000704	fe	20
jr z,%070d			;	.data:00000706	28	5
call nc,%0737			;	.data:00000708	d4	37 07
jr %06f7			;	.data:0000070b	18	ea
ld a,(hl)			;	.data:0000070d	7e	
or a			;	.data:0000070e	b7	
jr z,%06f7			;	.data:0000070f	28	e6
call %0637			;	.data:00000711	cd	37 06
pop hl			;	.data:00000714	e1	
or a			;	.data:00000715	b7	
ret			;	.data:00000716	c9	
			
cp %0d			;	.data:00000717	fe	0d
jr nz,%0720			;	.data:00000719	20	5
call %062c			;	.data:0000071b	cd	2c 06
jr %0711			;	.data:0000071e	18	f1
cp %1b			;	.data:00000720	fe	1b
jr z,%072e			;	.data:00000722	28	0a
call %0737			;	.data:00000724	cd	37 07
ld a,%2e			;	.data:00000727	3e	2e
call %0493			;	.data:00000729	cd	93 04
jr %06f7			;	.data:0000072c	18	c9
ld a,(hl)			;	.data:0000072e	7e	
or a			;	.data:0000072f	b7	
jr z,%06f7			;	.data:00000730	28	c5
dec (hl)			;	.data:00000732	35	
ld a,%08			;	.data:00000733	3e	8
jr %0729			;	.data:00000735	18	f2
push hl			;	.data:00000737	e5	
push af			;	.data:00000738	f5	
ld a,(hl)			;	.data:00000739	7e	
inc a			;	.data:0000073a	3c	
and %3f			;	.data:0000073b	e6	3f
ld (hl),a			;	.data:0000073d	77	
add a,l			;	.data:0000073e	85	
ld l,a			;	.data:0000073f	6f	
pop af			;	.data:00000740	f1	
ld (hl),a			;	.data:00000741	77	
pop hl			;	.data:00000742	e1	
ret			;	.data:00000743	c9	
			
ld hl,(%2008)			;	.data:00000744	2a	08 20
ld (%fc98),hl			;	.data:00000747	22	98 fc
ld hl,(%2006)			;	.data:0000074a	2a	06 20
ld (%fc8a),hl			;	.data:0000074d	22	8a fc
ld hl,(%2004)			;	.data:00000750	2a	04 20
ld (%fc88),hl			;	.data:00000753	22	88 fc
push hl			;	.data:00000756	e5	
ld hl,(%fc88)			;	.data:00000757	2a	88 fc
ld (%fc8c),hl			;	.data:0000075a	22	8c fc
ld hl,(%fc8a)			;	.data:0000075d	2a	8a fc
ld (%fc8e),hl			;	.data:00000760	22	8e fc
pop hl			;	.data:00000763	e1	
ret			;	.data:00000764	c9	
				
push hl			;	.data:00000765	e5	
ld hl,(%fc8c)			;	.data:00000766	2a	8c fc
ld (%fc88),hl			;	.data:00000769	22	88 fc
ld hl,(%fc8e)			;	.data:0000076c	2a	8e fc
ld (%fc8a),hl			;	.data:0000076f	22	8a fc
pop hl			;	.data:00000772	e1	
ret			;	.data:00000773	c9	
			
push de			;	.data:00000774	d5	
ex de,hl			;	.data:00000775	eb	
ld hl,(%fc88)			;	.data:00000776	2a	88 fc
or a			;	.data:00000779	b7	
sbc hl,de			;	.data:0000077a	ed	52
call %07c4			;	.data:0000077c	cd	c4 07
ex de,hl			;	.data:0000077f	eb	
pop de			;	.data:00000780	d1	
ret			;	.data:00000781	c9	
			
call %06f1			;	.data:00000782	cd	f1 06
ld hl,(%fc88)			;	.data:00000785	2a	88 fc
call %06a7			;	.data:00000788	cd	a7 06
ret z			;	.data:0000078b	c8	
call %0795			;	.data:0000078c	cd	95 07
xor a			;	.data:0000078f	af	
cp h			;	.data:00000790	bc	
jr nz,%0788			;	.data:00000791	20	f5
scf			;	.data:00000793	37	
ret			;	.data:00000794	c9	
			
push de			;	.data:00000795	d5	
ld d,h			;	.data:00000796	54	
ld e,l			;	.data:00000797	5d	
ld a,(de)			;	.data:00000798	1a	
and %3f			;	.data:00000799	e6	3f
add a,l			;	.data:0000079b	85	
ld l,a			;	.data:0000079c	6f	
jr nc,%07a0			;	.data:0000079d	30	1
inc h			;	.data:0000079f	24	
inc hl			;	.data:000007a0	23	
ld a,(hl)			;	.data:000007a1	7e	
inc hl			;	.data:000007a2	23	
ld h,(hl)			;	.data:000007a3	66	
ld l,a			;	.data:000007a4	6f	
add hl,de			;	.data:000007a5	19	
pop de			;	.data:000007a6	d1	
ret			;	.data:000007a7	c9	
			
ld hl,(%fc8a)			;	.data:000007a8	2a	8a fc
call %0d8d			;	.data:000007ab	cd	8d 0d
call %0687			;	.data:000007ae	cd	87 06
ex de,hl			;	.data:000007b1	eb	
rst %10			;	.data:000007b2	d7	
add hl,de			;	.data:000007b3	19	
inc hl			;	.data:000007b4	23	
ld (%fc8a),hl			;	.data:000007b5	22	8a fc
ret			;	.data:000007b8	c9	
			
push hl			;	.data:000007b9	e5	
ld hl,(%fc8a)			;	.data:000007ba	2a	8a fc
ld (hl),a			;	.data:000007bd	77	
inc hl			;	.data:000007be	23	
ld (%fc8a),hl			;	.data:000007bf	22	8a fc
pop hl			;	.data:000007c2	e1	
ret			;	.data:000007c3	c9	
			
push af			;	.data:000007c4	f5	
ld a,l			;	.data:000007c5	7d	
call %07b9			;	.data:000007c6	cd	b9 07
ld a,h			;	.data:000007c9	7c	
call %07b9			;	.data:000007ca	cd	b9 07
pop af			;	.data:000007cd	f1	
ret			;	.data:000007ce	c9	
			
ld a,%c3			;	.data:000007cf	3e	c3
jr %07d5			;	.data:000007d1	18	2
ld a,%cd			;	.data:000007d3	3e	cd
call %07b9			;	.data:000007d5	cd	b9 07
jp %07c4			;	.data:000007d8	c3	c4 07
ld a,%21			;	.data:000007db	3e	21
call %07d5			;	.data:000007dd	cd	d5 07
ld a,%cf			;	.data:000007e0	3e	cf
jp %07b9			;	.data:000007e2	c3	b9 07
ld a,%c9			;	.data:000007e5	3e	c9
jp %07b9			;	.data:000007e7	c3	b9 07
push hl			;	.data:000007ea	e5	
call %0785			;	.data:000007eb	cd	85 07
jr nc,%0805			;	.data:000007ee	30	15
ld hl,(%fc7a)			;	.data:000007f0	2a	7a fc
call %0065			;	.data:000007f3	cd	65 00
jr nc,%0803			;	.data:000007f6	30	0b
call %06da			;	.data:000007f8	cd	da 06
call %0652			;	.data:000007fb	cd	52 06
ld a,%55			;	.data:000007fe	3e	55
call %06c9			;	.data:00000800	cd	c9 06
pop hl			;	.data:00000803	e1	
ret			;	.data:00000804	c9	
			
call %0d6b			;	.data:00000805	cd	6b 0d
bit 7,(hl)			;	.data:00000808	cb	7e
push af			;	.data:0000080a	f5	
call %082a			;	.data:0000080b	cd	2a 08
pop af			;	.data:0000080e	f1	
jr nz,%0819			;	.data:0000080f	20	8
call %0065			;	.data:00000811	cd	65 00
call %0756			;	.data:00000814	cd	56 07
pop hl			;	.data:00000817	e1	
ret			;	.data:00000818	c9	
			
call %0065			;	.data:00000819	cd	65 00
call %07e5			;	.data:0000081c	cd	e5 07
ld hl,(%fc8e)			;	.data:0000081f	2a	8e fc
call %0065			;	.data:00000822	cd	65 00
call %0765			;	.data:00000825	cd	65 07
pop hl			;	.data:00000828	e1	
ret			;	.data:00000829	c9	
			
ld a,(hl)			;	.data:0000082a	7e	
and %3f			;	.data:0000082b	e6	3f
bit 6,(hl)			;	.data:0000082d	cb	76
jr z,%0833			;	.data:0000082f	28	2
add a,%02			;	.data:00000831	c6	2
add a,%03			;	.data:00000833	c6	3
add a,l			;	.data:00000835	85	
ld l,a			;	.data:00000836	6f	
ret nc			;	.data:00000837	d0	
inc h			;	.data:00000838	24	
ret			;	.data:00000839	c9	
				
ld a,(hl)			;	.data:0000083a	7e	
bit 6,a			;	.data:0000083b	cb	77
scf			;	.data:0000083d	37	
ret z			;	.data:0000083e	c8	
and %3f			;	.data:0000083f	e6	3f
add a,%03			;	.data:00000841	c6	3
add a,l			;	.data:00000843	85	
ld l,a			;	.data:00000844	6f	
jr nc,%0848			;	.data:00000845	30	1
inc h			;	.data:00000847	24	
ld a,(hl)			;	.data:00000848	7e	
inc hl			;	.data:00000849	23	
ld h,(hl)			;	.data:0000084a	66	
ld l,a			;	.data:0000084b	6f	
ret			;	.data:0000084c	c9	
		
push af			;	.data:0000084d	f5	
call %06da			;	.data:0000084e	cd	da 06
call %0d48			;	.data:00000851	cd	48 0d
call %0652			;	.data:00000854	cd	52 06
pop af			;	.data:00000857	f1	
jp %06c9			;	.data:00000858	c3	c9 06
call %0782			;	.data:0000085b	cd	82 07
ret c			;	.data:0000085e	d8	
ld a,%52			;	.data:0000085f	3e	52
call %084d			;	.data:00000861	cd	4d 08
or a			;	.data:00000864	b7	
ret			;	.data:00000865	c9	
				
ld hl,(%fc8a)			;	.data:00000866	2a	8a fc
push hl			;	.data:00000869	e5	
call %085b			;	.data:0000086a	cd	5b 08
call %07a8			;	.data:0000086d	cd	a8 07
pop hl			;	.data:00000870	e1	
call %0774			;	.data:00000871	cd	74 07
ld (%fc88),hl			;	.data:00000874	22	88 fc
ret			;	.data:00000877	c9	
			
call %084d			;	.data:00000878	cd	4d 08
jp %099a			;	.data:0000087b	c3	9a 09
call %07d3			;	.data:0000087e	cd	d3 07
call %0782			;	.data:00000881	cd	82 07
jr c,%089c			;	.data:00000884	38	16
call %0d6b			;	.data:00000886	cd	6b 0d
bit 7,(hl)			;	.data:00000889	cb	7e
push af			;	.data:0000088b	f5	
call %082a			;	.data:0000088c	cd	2a 08
pop af			;	.data:0000088f	f1	
jr z,%087e			;	.data:00000890	28	ec
ld de,%0878			;	.data:00000892	11	78 08
push de			;	.data:00000895	d5	
call %0065			;	.data:00000896	cd	65 00
pop de			;	.data:00000899	d1	
jr %0881			;	.data:0000089a	18	e5
rst %10			;	.data:0000089c	d7	
xor a			;	.data:0000089d	af	
or l			;	.data:0000089e	b5	
jr z,%0881			;	.data:0000089f	28	e0
rst %08			;	.data:000008a1	cf	
ld hl,(%fc7a)			;	.data:000008a2	2a	7a fc
call %0065			;	.data:000008a5	cd	65 00
call %08ad			;	.data:000008a8	cd	ad 08
jr %0881			;	.data:000008ab	18	d4
bit 7,a			;	.data:000008ad	cb	7f
ld a,%55			;	.data:000008af	3e	55
jp c,%0878			;	.data:000008b1	da	78 08
jr z,%08bb			;	.data:000008b4	28	5
rst %10			;	.data:000008b6	d7	
call %08bb			;	.data:000008b7	cd	bb 08
rst %08			;	.data:000008ba	cf	
push hl			;	.data:000008bb	e5	
rst %10			;	.data:000008bc	d7	
call %07db			;	.data:000008bd	cd	db 07
pop hl			;	.data:000008c0	e1	
ret			;	.data:000008c1	c9	
			
ld hl,%fcad			;	.data:000008c2	21	ad fc
ld a,(hl)			;	.data:000008c5	7e	
and %70			;	.data:000008c6	e6	70
ld (hl),a			;	.data:000008c8	77	
ld hl,%fca5			;	.data:000008c9	21	a5 fc
ld a,(hl)			;	.data:000008cc	7e	
and %c0			;	.data:000008cd	e6	c0
ld (hl),a			;	.data:000008cf	77	
ld hl,%fcbe			;	.data:000008d0	21	be fc
ld a,(hl)			;	.data:000008d3	7e	
and %fc			;	.data:000008d4	e6	fc
ld (hl),a			;	.data:000008d6	77	
ret			;	.data:000008d7	c9	
		
call %06f1			;	.data:000008d8	cd	f1 06
rst %10			;	.data:000008db	d7	
xor a			;	.data:000008dc	af	
cp l			;	.data:000008dd	bd	
jr z,%08e4			;	.data:000008de	28	4
rst %08			;	.data:000008e0	cf	
call %07ea			;	.data:000008e1	cd	ea 07
ld hl,%fca5			;	.data:000008e4	21	a5 fc
bit 0,(hl)			;	.data:000008e7	cb	46
res 0,(hl)			;	.data:000008e9	cb	86
call nz,%066e			;	.data:000008eb	c4	6e 06
ret			;	.data:000008ee	c9	
			
call %0910			;	.data:000008ef	cd	10 09
ret c			;	.data:000008f2	d8	
call %05ff			;	.data:000008f3	cd	ff 05
jr %08ef			;	.data:000008f6	18	f7
push hl			;	.data:000008f8	e5	
push af			;	.data:000008f9	f5	
ld hl,%fc7f			;	.data:000008fa	21	7f fc
ld a,(hl)			;	.data:000008fd	7e	
inc a			;	.data:000008fe	3c	
and %bf			;	.data:000008ff	e6	bf
ld (hl),a			;	.data:00000901	77	
ld l,a			;	.data:00000902	6f	
dec h			;	.data:00000903	25	
pop af			;	.data:00000904	f1	
ld (hl),a			;	.data:00000905	77	
or a			;	.data:00000906	b7	
pop hl			;	.data:00000907	e1	
ret			;	.data:00000908	c9	
			
ld hl,%fc7e			;	.data:00000909	21	7e fc
ld a,(hl)			;	.data:0000090c	7e	
inc hl			;	.data:0000090d	23	
cp (hl)			;	.data:0000090e	be	
ret			;	.data:0000090f	c9	
			
call %0909			;	.data:00000910	cd	09 09
scf			;	.data:00000913	37	
ret z			;	.data:00000914	c8	
dec hl			;	.data:00000915	2b	
inc a			;	.data:00000916	3c	
and %bf			;	.data:00000917	e6	bf
ld (hl),a			;	.data:00000919	77	
ld l,a			;	.data:0000091a	6f	
dec h			;	.data:0000091b	25	
ld a,(hl)			;	.data:0000091c	7e	
ret			;	.data:0000091d	c9	
			
add a,%90			;	.data:0000091e	c6	90
daa			;	.data:00000920	27	
adc a,%40			;	.data:00000921	ce	40
daa			;	.data:00000923	27	
ret			;	.data:00000924	c9	
				
ld hl,(%fc90)			;	.data:00000925	2a	90 fc
push iy			;	.data:00000928	fd	e5
pop de			;	.data:0000092a	d1	
or a			;	.data:0000092b	b7	
sbc hl,de			;	.data:0000092c	ed	52
ret nc			;	.data:0000092e	d0	
ld a,%53			;	.data:0000092f	3e	53
jp %0878			;	.data:00000931	c3	78 08
ld hl,%fca5			;	.data:00000934	21	a5 fc
bit 6,(hl)			;	.data:00000937	cb	76
ret nz			;	.data:00000939	c0	
ld hl,%0050			;	.data:0000093a	21	50 00
ld (%fc7c),hl			;	.data:0000093d	22	7c fc
call %1128			;	.data:00000940	cd	28 11
jp %106e			;	.data:00000943	c3	6e 10
ld a,%7f			;	.data:00000946	3e	7f
in a,(%fe)			;	.data:00000948	db	fe
rrca			;	.data:0000094a	0f	
jr nc,%0953			;	.data:0000094b	30	6
ld hl,%fc78			;	.data:0000094d	21	78 fc
inc (hl)			;	.data:00000950	34	
jr z,%099a			;	.data:00000951	28	47
out (%fd),a			;	.data:00000953	d3	fd
ld hl,%40ff			;	.data:00000955	21	ff 40
ld (hl),h			;	.data:00000958	74	
inc h			;	.data:00000959	24	
jr nz,%0958			;	.data:0000095a	20	fc
ld h,%40			;	.data:0000095c	26	40
ld a,(hl)			;	.data:0000095e	7e	
cp h			;	.data:0000095f	bc	
jr z,%0965			;	.data:00000960	28	3
inc h			;	.data:00000962	24	
jr nz,%095e			;	.data:00000963	20	f9
cpl			;	.data:00000965	2f	
ld h,a			;	.data:00000966	67	
inc hl			;	.data:00000967	23	
exx			;	.data:00000968	d9	
ld hl,%4000			;	.data:00000969	21	00 40
ld de,%0001			;	.data:0000096c	11	01 00
xor a			;	.data:0000096f	af	
ld (hl),a			;	.data:00000970	77	
add hl,de			;	.data:00000971	19	
jr nc,%0970			;	.data:00000972	30	fc
ld hl,%1da0			;	.data:00000974	21	a0 1d
ld de,%fc60			;	.data:00000977	11	60 fc
ld bc,%0060			;	.data:0000097a	1	60 00
ldir			;	.data:0000097d	ed	b0
exx			;	.data:0000097f	d9	
ld (%fc56),hl			;	.data:00000980	22	56 fc
ld a,%bf			;	.data:00000983	3e	bf
cp h			;	.data:00000985	bc	
jr nc,%0991			;	.data:00000986	30	9
ld hl,%bd00			;	.data:00000988	21	00 bd
ld (%fc6e),hl			;	.data:0000098b	22	6e fc
ld (%fc76),hl			;	.data:0000098e	22	76 fc
call %09ca			;	.data:00000991	cd	ca 09
ld hl,%1d00			;	.data:00000994	21	00 1d
call %0665			;	.data:00000997	cd	65 06
ld sp,%fb80			;	.data:0000099a	31	80 fb
ld hl,%fcc0			;	.data:0000099d	21	c0 fc
ld (%fc84),hl			;	.data:000009a0	22	84 fc
ld hl,%8080			;	.data:000009a3	21	80 80
ld (%fc7e),hl			;	.data:000009a6	22	7e fc
call %0934			;	.data:000009a9	cd	34 09
call %05eb			;	.data:000009ac	cd	eb 05
call %0765			;	.data:000009af	cd	65 07
call %08c2			;	.data:000009b2	cd	c2 08
ld iy,(%fc90)			;	.data:000009b5	fd	2a 90 fc
ld a,%1e			;	.data:000009b9	3e	1e
ld i,a			;	.data:000009bb	ed	47
out (%fe),a			;	.data:000009bd	d3	fe
ld a,(%fc40)			;	.data:000009bf	3a	40 fc
or a			;	.data:000009c2	b7	
jr nz,%0953			;	.data:000009c3	20	8e
call %08d8			;	.data:000009c5	cd	d8 08
jr %09c5			;	.data:000009c8	18	fb
ld hl,%2000			;	.data:000009ca	21	00 20
ld a,(hl)			;	.data:000009cd	7e	
cpl			;	.data:000009ce	2f	
ld (hl),a			;	.data:000009cf	77	
cp (hl)			;	.data:000009d0	be	
cpl			;	.data:000009d1	2f	
ld (hl),a			;	.data:000009d2	77	
jr nz,%0a0f			;	.data:000009d3	20	3a
push af			;	.data:000009d5	f5	
ld hl,%fc57			;	.data:000009d6	21	57 fc
ld a,%20			;	.data:000009d9	3e	20
ld (%fc6d),a			;	.data:000009db	32	6d fc
add a,(hl)			;	.data:000009de	86	
ld (hl),a			;	.data:000009df	77	
ld hl,%fca5			;	.data:000009e0	21	a5 fc
set 4,(hl)			;	.data:000009e3	cb	e6
pop af			;	.data:000009e5	f1	
xor %a5			;	.data:000009e6	ee	a5
jr z,%0a0c			;	.data:000009e8	28	22
dec a			;	.data:000009ea	3d	
jr nz,%09f4			;	.data:000009eb	20	7
call %0744			;	.data:000009ed	cd	44 07
ld hl,(%2002)			;	.data:000009f0	2a	02 20
jp (hl)			;	.data:000009f3	e9	
ld hl,%2000			;	.data:000009f4	21	00 20
ld (hl),%a5			;	.data:000009f7	36	a5
ld hl,%2010			;	.data:000009f9	21	10 20
ld (%fc8a),hl			;	.data:000009fc	22	8a fc
ld (%fc8e),hl			;	.data:000009ff	22	8e fc
call %1b70			;	.data:00000a02	cd	70 1b
ld hl,%19b4			;	.data:00000a05	21	b4 19
ld (%2002),hl			;	.data:00000a08	22	02 20
ret			;	.data:00000a0b	c9	
			
jp %0744			;	.data:00000a0c	c3	44 07
xor %a5			;	.data:00000a0f	ee	a5
jp z,%0750			;	.data:00000a11	ca	50 07
dec a			;	.data:00000a14	3d	
ret nz			;	.data:00000a15	c0	
call %0750			;	.data:00000a16	cd	50 07
jr %09f0			;	.data:00000a19	18	d5
call %0925			;	.data:00000a1b	cd	25 09
call %0910			;	.data:00000a1e	cd	10 09
call nc,%05ff			;	.data:00000a21	d4	ff 05
call %058a			;	.data:00000a24	cd	8a 05
ld hl,(%fc7c)			;	.data:00000a27	2a	7c fc
call %0065			;	.data:00000a2a	cd	65 00
ld hl,(%fc54)			;	.data:00000a2d	2a	54 fc
inc hl			;	.data:00000a30	23	
ld (%fc54),hl			;	.data:00000a31	22	54 fc
jr %0a1b			;	.data:00000a34	18	e5
push hl			;	.data:00000a36	e5	
push de			;	.data:00000a37	d5	
push bc			;	.data:00000a38	c5	
call %0d48			;	.data:00000a39	cd	48 0d
xor a			;	.data:00000a3c	af	
ld c,a			;	.data:00000a3d	4f	
rst %10			;	.data:00000a3e	d7	
or l			;	.data:00000a3f	b5	
jr z,%0a79			;	.data:00000a40	28	37
ld b,a			;	.data:00000a42	47	
ld h,c			;	.data:00000a43	61	
ld l,c			;	.data:00000a44	69	
ld d,c			;	.data:00000a45	51	
rst %08			;	.data:00000a46	cf	
rst %08			;	.data:00000a47	cf	
ld hl,(%fc86)			;	.data:00000a48	2a	86 fc
ex de,hl			;	.data:00000a4b	eb	
rst %20			;	.data:00000a4c	e7	
call %0677			;	.data:00000a4d	cd	77 06
cp e			;	.data:00000a50	bb	
jr nc,%0a7e			;	.data:00000a51	30	2b
ex de,hl			;	.data:00000a53	eb	
rst %08			;	.data:00000a54	cf	
ex de,hl			;	.data:00000a55	eb	
ld l,a			;	.data:00000a56	6f	
call %0c13			;	.data:00000a57	cd	13 0c
call %0cd6			;	.data:00000a5a	cd	d6 0c
rst %08			;	.data:00000a5d	cf	
call %0c13			;	.data:00000a5e	cd	13 0c
call %1305			;	.data:00000a61	cd	05 13
djnz %0a4c			;	.data:00000a64	10	e6
call %0b9b			;	.data:00000a66	cd	9b 0b
bit 0,c			;	.data:00000a69	cb	41
call nz,%0b2d			;	.data:00000a6b	c4	2d 0b
call %0d6b			;	.data:00000a6e	cd	6b 0d
bit 7,c			;	.data:00000a71	cb	79
ex de,hl			;	.data:00000a73	eb	
call nz,%0008			;	.data:00000a74	c4	08 00
ex de,hl			;	.data:00000a77	eb	
rst %08			;	.data:00000a78	cf	
ld a,c			;	.data:00000a79	79	
pop bc			;	.data:00000a7a	c1	
pop de			;	.data:00000a7b	d1	
pop hl			;	.data:00000a7c	e1	
ret			;	.data:00000a7d	c9	
				
cp %f7			;	.data:00000a7e	fe	f7
jr z,%0a90			;	.data:00000a80	28	0e
inc c			;	.data:00000a82	0c	
cp %f6			;	.data:00000a83	fe	f6
jr z,%0a92			;	.data:00000a85	28	0b
rst %18			;	.data:00000a87	df	
rst %20			;	.data:00000a88	e7	
djnz %0a88			;	.data:00000a89	10	fd
rst %10			;	.data:00000a8b	d7	
rst %10			;	.data:00000a8c	d7	
scf			;	.data:00000a8d	37	
jr %0a79			;	.data:00000a8e	18	e9
set 7,c			;	.data:00000a90	cb	f9
djnz %0a4c			;	.data:00000a92	10	b8
jr %0a66			;	.data:00000a94	18	d0
push hl			;	.data:00000a96	e5	
push de			;	.data:00000a97	d5	
push bc			;	.data:00000a98	c5	
xor a			;	.data:00000a99	af	
ld c,%01			;	.data:00000a9a	0e	1
call %0b9b			;	.data:00000a9c	cd	9b 0b
call %0b28			;	.data:00000a9f	cd	28 0b
push af			;	.data:00000aa2	f5	
call %0b39			;	.data:00000aa3	cd	39 0b
ld hl,(%fc86)			;	.data:00000aa6	2a	86 fc
rst %08			;	.data:00000aa9	cf	
call %0c13			;	.data:00000aaa	cd	13 0c
call %0cc5			;	.data:00000aad	cd	c5 0c
rst %10			;	.data:00000ab0	d7	
ld a,l			;	.data:00000ab1	7d	
rst %10			;	.data:00000ab2	d7	
call %091e			;	.data:00000ab3	cd	1e 09
rst %18			;	.data:00000ab6	df	
inc c			;	.data:00000ab7	0c	
call %0b9b			;	.data:00000ab8	cd	9b 0b
call %0d93			;	.data:00000abb	cd	93 0d
jr nz,%0aa3			;	.data:00000abe	20	e3
pop af			;	.data:00000ac0	f1	
rra			;	.data:00000ac1	1f	
jr nc,%0ac8			;	.data:00000ac2	30	4
ld a,%2d			;	.data:00000ac4	3e	2d
rst %18			;	.data:00000ac6	df	
inc c			;	.data:00000ac7	0c	
ld a,%20			;	.data:00000ac8	3e	20
rst %18			;	.data:00000aca	df	
ld h,%00			;	.data:00000acb	26	0
ld l,c			;	.data:00000acd	69	
rst %08			;	.data:00000ace	cf	
pop bc			;	.data:00000acf	c1	
pop de			;	.data:00000ad0	d1	
pop hl			;	.data:00000ad1	e1	
ret			;	.data:00000ad2	c9	
		
push hl			;	.data:00000ad3	e5	
push de			;	.data:00000ad4	d5	
push bc			;	.data:00000ad5	c5	
ld c,%01			;	.data:00000ad6	0e	1
rst %10			;	.data:00000ad8	d7	
call %0b19			;	.data:00000ad9	cd	19 0b
push af			;	.data:00000adc	f5	
rst %08			;	.data:00000add	cf	
ld hl,(%fc86)			;	.data:00000ade	2a	86 fc
rst %08			;	.data:00000ae1	cf	
call %0bf2			;	.data:00000ae2	cd	f2 0b
rst %10			;	.data:00000ae5	d7	
ld a,l			;	.data:00000ae6	7d	
call %091e			;	.data:00000ae7	cd	1e 09
rst %18			;	.data:00000aea	df	
inc c			;	.data:00000aeb	0c	
rst %10			;	.data:00000aec	d7	
call %0d98			;	.data:00000aed	cd	98 0d
jr nz,%0add			;	.data:00000af0	20	eb
pop af			;	.data:00000af2	f1	
jr z,%0ac8			;	.data:00000af3	28	d3
ld a,%2d			;	.data:00000af5	3e	2d
rst %18			;	.data:00000af7	df	
inc c			;	.data:00000af8	0c	
jr %0ac8			;	.data:00000af9	18	cd
ld (bc),a			;	.data:00000afb	2	
ld c,l			;	.data:00000afc	4d	
ld hl,(%0064)			;	.data:00000afd	2a	64 00
push hl			;	.data:00000b00	e5	
push de			;	.data:00000b01	d5	
xor a			;	.data:00000b02	af	
rst %10			;	.data:00000b03	d7	
call %0b19			;	.data:00000b04	cd	19 0b
ex de,hl			;	.data:00000b07	eb	
rst %10			;	.data:00000b08	d7	
call %0b19			;	.data:00000b09	cd	19 0b
call %0b3e			;	.data:00000b0c	cd	3e 0b
or a			;	.data:00000b0f	b7	
call po,%0b2d			;	.data:00000b10	e4	2d 0b
call %0b39			;	.data:00000b13	cd	39 0b
pop de			;	.data:00000b16	d1	
pop hl			;	.data:00000b17	e1	
ret			;	.data:00000b18	c9	
			
bit 7,h			;	.data:00000b19	cb	7c
ret z			;	.data:00000b1b	c8	
scf			;	.data:00000b1c	37	
rla			;	.data:00000b1d	17	
push de			;	.data:00000b1e	d5	
ld de,%0000			;	.data:00000b1f	11	00 00
or a			;	.data:00000b22	b7	
ex de,hl			;	.data:00000b23	eb	
sbc hl,de			;	.data:00000b24	ed	52
pop de			;	.data:00000b26	d1	
ret			;	.data:00000b27	c9	
			
bit 7,d			;	.data:00000b28	cb	7a
ret z			;	.data:00000b2a	c8	
scf			;	.data:00000b2b	37	
rla			;	.data:00000b2c	17	
call %0b1e			;	.data:00000b2d	cd	1e 0b
ex de,hl			;	.data:00000b30	eb	
jr nc,%0b34			;	.data:00000b31	30	1
inc hl			;	.data:00000b33	23	
call %0b1e			;	.data:00000b34	cd	1e 0b
ex de,hl			;	.data:00000b37	eb	
ret			;	.data:00000b38	c9	
			
ex de,hl			;	.data:00000b39	eb	
rst %08			;	.data:00000b3a	cf	
ex de,hl			;	.data:00000b3b	eb	
rst %08			;	.data:00000b3c	cf	
ret			;	.data:00000b3d	c9	
			
push ix			;	.data:00000b3e	dd	e5
push bc			;	.data:00000b40	c5	
ld ix,%0000			;	.data:00000b41	dd	21 00 00
ld b,%10			;	.data:00000b45	6	10
or a			;	.data:00000b47	b7	
jr %0b4c			;	.data:00000b48	18	2
add ix,ix			;	.data:00000b4a	dd	29
adc hl,hl			;	.data:00000b4c	ed	6a
jr nc,%0b55			;	.data:00000b4e	30	5
add ix,de			;	.data:00000b50	dd	19
jr nc,%0b55			;	.data:00000b52	30	1
inc hl			;	.data:00000b54	23	
djnz %0b4a			;	.data:00000b55	10	f3
push ix			;	.data:00000b57	dd	e5
pop de			;	.data:00000b59	d1	
ex de,hl			;	.data:00000b5a	eb	
pop bc			;	.data:00000b5b	c1	
pop ix			;	.data:00000b5c	dd	e1
ret			;	.data:00000b5e	c9	
				
ld bc,%0f2a			;	.data:00000b5f	1	2a 0f
nop			;	.data:00000b62	0	
push hl			;	.data:00000b63	e5	
call %0b00			;	.data:00000b64	cd	00 0b
rst %10			;	.data:00000b67	d7	
push hl			;	.data:00000b68	e5	
rst %10			;	.data:00000b69	d7	
pop hl			;	.data:00000b6a	e1	
rst %08			;	.data:00000b6b	cf	
pop hl			;	.data:00000b6c	e1	
ret			;	.data:00000b6d	c9	
			
ld (bc),a			;	.data:00000b6e	2	
ld c,l			;	.data:00000b6f	4d	
cpl			;	.data:00000b70	2f	
ld d,a			;	.data:00000b71	57	
nop			;	.data:00000b72	0	
push hl			;	.data:00000b73	e5	
push de			;	.data:00000b74	d5	
push bc			;	.data:00000b75	c5	
xor a			;	.data:00000b76	af	
rst %10			;	.data:00000b77	d7	
call %0b19			;	.data:00000b78	cd	19 0b
push hl			;	.data:00000b7b	e5	
pop bc			;	.data:00000b7c	c1	
call %0b9b			;	.data:00000b7d	cd	9b 0b
call %0b28			;	.data:00000b80	cd	28 0b
call %0ba0			;	.data:00000b83	cd	a0 0b
or a			;	.data:00000b86	b7	
jr z,%0b94			;	.data:00000b87	28	0b
inc a			;	.data:00000b89	3c	
rra			;	.data:00000b8a	1f	
call nc,%0b1e			;	.data:00000b8b	d4	1e 0b
ex de,hl			;	.data:00000b8e	eb	
rra			;	.data:00000b8f	1f	
call c,%0b1e			;	.data:00000b90	dc	1e 0b
ex de,hl			;	.data:00000b93	eb	
call %0b39			;	.data:00000b94	cd	39 0b
pop bc			;	.data:00000b97	c1	
pop de			;	.data:00000b98	d1	
pop hl			;	.data:00000b99	e1	
ret			;	.data:00000b9a	c9	
				
rst %10			;	.data:00000b9b	d7	
ex de,hl			;	.data:00000b9c	eb	
rst %10			;	.data:00000b9d	d7	
ex de,hl			;	.data:00000b9e	eb	
ret			;	.data:00000b9f	c9	
			
push ix			;	.data:00000ba0	dd	e5
push bc			;	.data:00000ba2	c5	
ld b,%11			;	.data:00000ba3	6	11
push hl			;	.data:00000ba5	e5	
ex de,hl			;	.data:00000ba6	eb	
pop ix			;	.data:00000ba7	dd	e1
pop de			;	.data:00000ba9	d1	
jr %0bb5			;	.data:00000baa	18	9
adc hl,hl			;	.data:00000bac	ed	6a
or a			;	.data:00000bae	b7	
sbc hl,de			;	.data:00000baf	ed	52
ccf			;	.data:00000bb1	3f	
jr c,%0bb9			;	.data:00000bb2	38	5
add hl,de			;	.data:00000bb4	19	
add ix,ix			;	.data:00000bb5	dd	29
jr %0bbd			;	.data:00000bb7	18	4
add ix,ix			;	.data:00000bb9	dd	29
inc ix			;	.data:00000bbb	dd	23
djnz %0bac			;	.data:00000bbd	10	ed
push ix			;	.data:00000bbf	dd	e5
pop de			;	.data:00000bc1	d1	
pop ix			;	.data:00000bc2	dd	e1
ret			;	.data:00000bc4	c9	
				
					; 05 */	"MOD
dec b			;	.data:00000bc5	5	
ld hl,(%4d2f)			;	.data:00000bc6	2a	2f 4d
ld c,a			;	.data:00000bc9	4f	
ld b,h			;	.data:00000bca	44	
ld de,%d700			;	.data:00000bcb	11	00 d7
call %0b00			;	.data:00000bce	cd	00 0b
rst %08			;	.data:00000bd1	cf	
call %0b73			;	.data:00000bd2	cd	73 0b
ret			;	.data:00000bd5	c9	
				
					; 02 */			
ld (bc),a			;	.data:00000bd6	2	
ld hl,(%0a2f)			;	.data:00000bd7	2a	2f 0a
nop			;	.data:00000bda	0	
call %0bcd			;	.data:00000bdb	cd	cd 0b
rst %10			;	.data:00000bde	d7	
ret			;	.data:00000bdf	c9	
				
					;01 /		"	"				"	;			
ld bc,%0b2f			;	.data:00000be0	1	2f 0b
nop			;	.data:00000be3	0	
push hl			;	.data:00000be4	e5	
call %0bf2			;	.data:00000be5	cd	f2 0b
rst %10			;	.data:00000be8	d7	
pop hl			;	.data:00000be9	e1	
ret			;	.data:00000bea	c9	
		
	; 04 /MOD						
inc b			;	.data:00000beb	4	
cpl			;	.data:00000bec	2f	
ld c,l			;	.data:00000bed	4d	
ld c,a			;	.data:00000bee	4f	
ld b,h			;	.data:00000bef	44	
ld (de),a			;	.data:00000bf0	12	
nop			;	.data:00000bf1	0	
push hl			;	.data:00000bf2	e5	
rst %10			;	.data:00000bf3	d7	
call %0c13			;	.data:00000bf4	cd	13 0c
rst %08			;	.data:00000bf7	cf	
call %0b73			;	.data:00000bf8	cd	73 0b
pop hl			;	.data:00000bfb	e1	
ret			;	.data:00000bfc	c9	
		;			
				; 03 MOD					"	;	"	"		
inc bc			;	.data:00000bfd	3	
ld c,l			;	.data:00000bfe	4d	
ld c,a			;	.data:00000bff	4f	
ld b,h			;	.data:00000c00	44	
rrca			;	.data:00000c01	0f	
nop			;	.data:00000c02	0	
call %0bf2			;	.data:00000c03	cd	f2 0b
call %0e41			;	.data:00000c06	cd	41 0e
jp %137a			;	.data:00000c09	c3	7a 13
			
inc b			;	.data:00000c0c	4	
ld d,e			;	.data:00000c0d	53	
dec l			;	.data:00000c0e	2d	
ld a,%44			;	.data:00000c0f	3e	44
ld d,%00			;	.data:00000c11	16	0
push de			;	.data:00000c13	d5	
push hl			;	.data:00000c14	e5	
rst %10			;	.data:00000c15	d7	
ld a,h			;	.data:00000c16	7c	
rla			;	.data:00000c17	17	
ex de,hl			;	.data:00000c18	eb	
sbc hl,hl			;	.data:00000c19	ed	62
ex de,hl			;	.data:00000c1b	eb	
call %0b39			;	.data:00000c1c	cd	39 0b
pop hl			;	.data:00000c1f	e1	
pop de			;	.data:00000c20	d1	
ret			;	.data:00000c21	c9	
			
					;Forth Word  03  ROT

DB %03,%52,%4F,%54
; inc bc			;	.data:00000c22	3	
; ld d,d			;	.data:00000c23	52	
; ld c,a			;	.data:00000c24	4f	
; ld d,h			;	.data:00000c25	54	
ld (de),a			;	.data:00000c26	12	
nop					;	.data:00000c27	0	
rst %10				;	.data:00000c28	d7	
ex de,hl			;	.data:00000c29	eb	
rst %10				;	.data:00000c2a	d7	
push hl				;	.data:00000c2b	e5	
rst %10				;	.data:00000c2c	d7	
ex (sp),hl			;	.data:00000c2d	e3	
rst %08			;	.data:00000c2e	cf	
ex de,hl			;	.data:00000c2f	eb	
rst %08			;	.data:00000c30	cf	
pop hl			;	.data:00000c31	e1	
rst %08			;	.data:00000c32	cf	
ret			;	.data:00000c33	c9	
				
				; 03 MD/	
inc bc			;	.data:00000c34	3	
ld c,l			;	.data:00000c35	4d	
ld b,h			;	.data:00000c36	44	
cpl			;	.data:00000c37	2f	
ld b,c			;	.data:00000c38	41	
nop			;	.data:00000c39	0	
push ix			;	.data:00000c3a	dd	e5
push hl			;	.data:00000c3c	e5	
push de			;	.data:00000c3d	d5	
push bc			;	.data:00000c3e	c5	
push iy			;	.data:00000c3f	fd	e5
pop de			;	.data:00000c41	d1	
ld hl,%0008			;	.data:00000c42	21	08 00
add hl,de			;	.data:00000c45	19	
push de			;	.data:00000c46	d5	
pop ix			;	.data:00000c47	dd	e1
ld bc,%2008			;	.data:00000c49	1	08 20
push bc			;	.data:00000c4c	c5	
push ix			;	.data:00000c4d	dd	e5
or a			;	.data:00000c4f	b7	
rl (ix+4)			;	.data:00000c50	dd	cb 04 16
inc ix			;	.data:00000c54	dd	23
dec c			;	.data:00000c56	0d	
jr nz,%0c50			;	.data:00000c57	20	f7
pop ix			;	.data:00000c59	dd	e1
call %12c3			;	.data:00000c5b	cd	c3 12
jr c,%0c67			;	.data:00000c5e	38	7
call %12e7			;	.data:00000c60	cd	e7 12
set 0,(ix+4)			;	.data:00000c63	dd	cb 04 c6
pop bc			;	.data:00000c67	c1	
djnz %0c4c			;	.data:00000c68	10	e2
pop bc			;	.data:00000c6a	c1	
pop de			;	.data:00000c6b	d1	
rst %10			;	.data:00000c6c	d7	
rst %10			;	.data:00000c6d	d7	
call %0da3			;	.data:00000c6e	cd	a3 0d
pop hl			;	.data:00000c71	e1	
pop ix			;	.data:00000c72	dd	e1
ret			;	.data:00000c74	c9	
	;		
				;03 MD*			
inc bc			;	.data:00000c75	3	
ld c,l			;	.data:00000c76	4d	
ld b,h			;	.data:00000c77	44	
ld hl,(%004b)			;	.data:00000c78	2a	4b 00
push ix			;	.data:00000c7b	dd	e5
push hl			;	.data:00000c7d	e5	
push de			;	.data:00000c7e	d5	
push bc			;	.data:00000c7f	c5	
push iy			;	.data:00000c80	fd	e5
rst %08			;	.data:00000c82	cf	
rst %08			;	.data:00000c83	cf	
ld bc,%0008			;	.data:00000c84	1	08 00
push iy			;	.data:00000c87	fd	e5
pop de			;	.data:00000c89	d1	
pop hl			;	.data:00000c8a	e1	
call %036a			;	.data:00000c8b	cd	6a 03
push de			;	.data:00000c8e	d5	
ld b,%04			;	.data:00000c8f	6	4
pop ix			;	.data:00000c91	dd	e1
ld (ix+8),%00			;	.data:00000c93	dd	36 08 00
inc hl			;	.data:00000c97	23	
inc ix			;	.data:00000c98	dd	23
djnz %0c93			;	.data:00000c9a	10	f7
ld bc,%2008			;	.data:00000c9c	1	08 20
push bc			;	.data:00000c9f	c5	
or a			;	.data:00000ca0	b7	
bit 0,(ix+0)			;	.data:00000ca1	dd	cb 00 46
call nz,%12d7			;	.data:00000ca5	c4	d7 12
ld b,c			;	.data:00000ca8	41	
push ix			;	.data:00000ca9	dd	e5
rr (ix+7)			;	.data:00000cab	dd	cb 07 1e
dec ix			;	.data:00000caf	dd	2b
djnz %0cab			;	.data:00000cb1	10	f8
pop ix			;	.data:00000cb3	dd	e1
pop bc			;	.data:00000cb5	c1	
djnz %0c9f			;	.data:00000cb6	10	e7
rst %10			;	.data:00000cb8	d7	
rst %10			;	.data:00000cb9	d7	
pop bc			;	.data:00000cba	c1	
pop de			;	.data:00000cbb	d1	
pop hl			;	.data:00000cbc	e1	
pop ix			;	.data:00000cbd	dd	e1
ret			;	.data:00000cbf	c9	
	
				; 02 D/		
ld (bc),a			;	.data:00000cc0	2	
ld b,h			;	.data:00000cc1	44	
cpl			;	.data:00000cc2	2f	
ld de,%cd00			;	.data:00000cc3	11	00 cd
sbc a,e			;	.data:00000cc6	9b	
dec bc			;	.data:00000cc7	0b	
call %0cfb			;	.data:00000cc8	cd	fb 0c
call %0b39			;	.data:00000ccb	cd	39 0b
jp %0c3a			;	.data:00000cce	c3	3a 0c
ld (bc),a			;	.data:00000cd1	2	
ld b,h			;	.data:00000cd2	44	
ld hl,(%0016)			;	.data:00000cd3	2a	16 00
push hl			;	.data:00000cd6	e5	
push de			;	.data:00000cd7	d5	
call %0c7b			;	.data:00000cd8	cd	7b 0c
call %0b9b			;	.data:00000cdb	cd	9b 0b
call %0cef			;	.data:00000cde	cd	ef 0c
call %0b39			;	.data:00000ce1	cd	39 0b
pop de			;	.data:00000ce4	d1	
pop hl			;	.data:00000ce5	e1	
ret			;	.data:00000ce6	c9	
	
	            ; 05 2DROP
dec b			;	.data:00000ce7	5	
ld (%5244),a			;	.data:00000ce8	32	44 52
ld c,a			;	.data:00000ceb	4f	
ld d,b			;	.data:00000cec	50	
dec c			;	.data:00000ced	0d	
nop			;	.data:00000cee	0	
push hl			;	.data:00000cef	e5	
rst %10			;	.data:00000cf0	d7	
rst %10			;	.data:00000cf1	d7	
pop hl			;	.data:00000cf2	e1	
ret			;	.data:00000cf3	c9	
		
				; 04 D-			
inc b			;	.data:00000cf4	4	
ld b,h			;	.data:00000cf5	44	
dec l			;	.data:00000cf6	2d	
ld a,%51			;	.data:00000cf7	3e	51
rra			;	.data:00000cf9	1f	
nop			;	.data:00000cfa	0	
push hl			;	.data:00000cfb	e5	
push de			;	.data:00000cfc	d5	
call %0b9b			;	.data:00000cfd	cd	9b 0b
call %0b39			;	.data:00000d00	cd	39 0b
push iy			;	.data:00000d03	fd	e5
call %0b39			;	.data:00000d05	cd	39 0b
pop hl			;	.data:00000d08	e1	
push hl			;	.data:00000d09	e5	
rl d			;	.data:00000d0a	cb	12
pop de			;	.data:00000d0c	d1	
call %12e7			;	.data:00000d0d	cd	e7 12
pop de			;	.data:00000d10	d1	
pop hl			;	.data:00000d11	e1	
ret			;	.data:00000d12	c9	
	;		
				; 01 +	
ld bc,%0e2b			;	.data:00000d13	1	2b 0e
nop			;	.data:00000d16	0	
push hl			;	.data:00000d17	e5	
push de			;	.data:00000d18	d5	
rst %10			;	.data:00000d19	d7	
ex de,hl			;	.data:00000d1a	eb	
rst %10			;	.data:00000d1b	d7	
add hl,de			;	.data:00000d1c	19	
rst %08			;	.data:00000d1d	cf	
pop de			;	.data:00000d1e	d1	
pop hl			;	.data:00000d1f	e1	
ret			;	.data:00000d20	c9	

				; 01 -			
ld bc,%102d			;	.data:00000d21	1	2d 10
nop			;	.data:00000d24	0	
push hl			;	.data:00000d25	e5	
push de			;	.data:00000d26	d5	
rst %10			;	.data:00000d27	d7	
ex de,hl			;	.data:00000d28	eb	
rst %10			;	.data:00000d29	d7	
or a			;	.data:00000d2a	b7	
sbc hl,de			;	.data:00000d2b	ed	52
rst %08			;	.data:00000d2d	cf	
pop de			;	.data:00000d2e	d1	
pop hl			;	.data:00000d2f	e1	
ret			;	.data:00000d30	c9


	
					; Forth Word 05 MINUS
				
DB %05,%4D,%49,%4e,%55,%53

; dec b				;	.data:00000d31	5	
; ld c,l			;	.data:00000d32	4d	
; ld c,c			;	.data:00000d33	49	
; ld c,(hl)			;	.data:00000d34	4e	
; ld d,l			;	.data:00000d35	55	
; ld d,e			;	.data:00000d36	53	
djnz %0d39			;	.data:00000d37	10	0
push hl				;	.data:00000d39	e5	
rst %10				;	.data:00000d3a	d7	
call %0b1e			;	.data:00000d3b	cd	1e 0b
rst %08				;	.data:00000d3e	cf	
pop hl				;	.data:00000d3f	e1	
ret					;	.data:00000d40	c9	


		
; Forth Word  04 CDUP
	
DB %04,%43,%44,%55,%50
DB %22,%00	
 
push af			;	.data:00000d48	f5		
push hl			;	.data:00000d49	e5	
rst %10			;	.data:00000d4a	d7	
rst %08			;	.data:00000d4b	cf	
rst %08			;	.data:00000d4c	cf	
ld a,l			;	.data:00000d4d	7d	
and %3f			;	.data:00000d4e	e6	3f
jr z,%0d60		;	.data:00000d50	28	0e
push bc			;	.data:00000d52	c5	
ld b,a			;	.data:00000d53	47	
ld hl,(%fc84)	;	.data:00000d54	2a	84 fc
dec a			;	.data:00000d57	3d	
add a,l			;	.data:00000d58	85	
ld l,a			;	.data:00000d59	6f	
ld a,(hl)		;	.data:00000d5a	7e	
rst %18			;	.data:00000d5b	df	
dec hl			;	.data:00000d5c	2b	
djnz %0d5a		;	.data:00000d5d	10	fb
pop bc			;	.data:00000d5f	c1	
pop hl			;	.data:00000d60	e1	
pop af			;	.data:00000d61	f1	
ret				;	.data:00000d62	c9	

	
; Forth Word  05 CDROP
		
DB	%05,%43,%44,%52,%4F,%50
DB  %16,%00

push hl			;	.data:00000d6b	e5	
rst %10			;	.data:00000d6c	d7	
ld a,l			;	.data:00000d6d	7d	
and %3f			;	.data:00000d6e	e6	3f
jr z,%0d77			;	.data:00000d70	28	5
ld l,a			;	.data:00000d72	6f	
rst %20			;	.data:00000d73	e7	
dec l			;	.data:00000d74	2d	
jr nz,%0d73			;	.data:00000d75	20	fc
pop hl			;	.data:00000d77	e1	
ret			;	.data:00000d78	c9	
	
; Forth Word 04 ?DUP

DB %04,%3F,%44,%55,%50
DB %0E,%00

rst %10			;	.data:00000d80	d7	
rst %08			;	.data:00000d81	cf	
ld a,l			;	.data:00000d82	7d	
or h			;	.data:00000d83	b4	
ret z			;	.data:00000d84	c8	
rst %08			;	.data:00000d85	cf	
ret				;	.data:00000d86	c9	
	
; Forth Word 03 DUP	

DB %03,%44,%55,%50
DB %14,%00
	
push hl			;	.data:00000d8d	e5	
rst %10			;	.data:00000d8e	d7	
rst %08			;	.data:00000d8f	cf	
rst %08			;	.data:00000d90	cf	
pop hl			;	.data:00000d91	e1	
ret				;	.data:00000d92	c9	
		
ld a,l			;	.data:00000d93	7d	
or h			;	.data:00000d94	b4	
or e			;	.data:00000d95	b3	
or d			;	.data:00000d96	b2	
ret				;	.data:00000d97	c9	
			
ld a,l			;	.data:00000d98	7d	
or h			;	.data:00000d99	b4	
ret				;	.data:00000d9a	c9	
			
				; 05 	DSWAP	
dec b			;	.data:00000d9b	5	
ld b,h			;	.data:00000d9c	44	
ld d,e			;	.data:00000d9d	53	
ld d,a			;	.data:00000d9e	57	
ld b,c			;	.data:00000d9f	41	
ld d,b			;	.data:00000da0	50	
ld hl,%e500		;	.data:00000da1	21	00 e5
push de			;	.data:00000da4	d5	
push bc			;	.data:00000da5	c5	
rst %10			;	.data:00000da6	d7	
push hl			;	.data:00000da7	e5	
rst %10			;	.data:00000da8	d7	
push hl			;	.data:00000da9	e5	
rst %10			;	.data:00000daa	d7	
push hl			;	.data:00000dab	e5	
rst %10			;	.data:00000dac	d7	
pop bc			;	.data:00000dad	c1	
pop de			;	.data:00000dae	d1	
ex de,hl		;	.data:00000daf	eb	
rst %08			;	.data:00000db0	cf	
pop hl			;	.data:00000db1	e1	
rst %08			;	.data:00000db2	cf	
ex de,hl		;	.data:00000db3	eb	
rst %08			;	.data:00000db4	cf	
push bc			;	.data:00000db5	c5	
pop hl			;	.data:00000db6	e1	
rst %08			;	.data:00000db7	cf	
pop bc			;	.data:00000db8	c1	
pop de			;	.data:00000db9	d1	
pop hl			;	.data:00000dba	e1	
ret				;	.data:00000dbb	c9	
			
add a,d			;	.data:00000dbc	82	
ld b,h			;	.data:00000dbd	44	
ld c,a			;	.data:00000dbe	4f	
ld hl,%2100			;	.data:00000dbf	21	00 21
adc a,%0d			;	.data:00000dc2	ce	0d
call %07d3			;	.data:00000dc4	cd	d3 07
ld hl,(%fc8a)			;	.data:00000dc7	2a	8a fc
push hl			;	.data:00000dca	e5	
call %0881			;	.data:00000dcb	cd	81 08
pop de			;	.data:00000dce	d1	
ld bc,%8000			;	.data:00000dcf	1	00 80
call %0e41			;	.data:00000dd2	cd	41 0e
rst %10			;	.data:00000dd5	d7	
add hl,bc			;	.data:00000dd6	9	
push hl			;	.data:00000dd7	e5	
rst %10			;	.data:00000dd8	d7	
add hl,bc			;	.data:00000dd9	9	
push hl			;	.data:00000dda	e5	
ex de,hl			;	.data:00000ddb	eb	
jp (hl)			;	.data:00000ddc	e9	
add a,l			;	.data:00000ddd	85	
dec hl			;	.data:00000dde	2b	
ld c,h			;	.data:00000ddf	4c	
ld c,a			;	.data:00000de0	4f	
ld c,a			;	.data:00000de1	4f	
ld d,b			;	.data:00000de2	50	
jr z,%0de5			;	.data:00000de3	28	0
pop hl			;	.data:00000de5	e1	
pop hl			;	.data:00000de6	e1	
pop hl			;	.data:00000de7	e1	
ld hl,%0dee			;	.data:00000de8	21	ee 0d
jp %0e12			;	.data:00000deb	c3	12 0e
pop bc			;	.data:00000dee	c1	
pop de			;	.data:00000def	d1	
rst %10			;	.data:00000df0	d7	
bit 7,h			;	.data:00000df1	cb	7c
jr nz,%0dff			;	.data:00000df3	20	0a
add hl,de			;	.data:00000df5	19	
ex de,hl			;	.data:00000df6	eb	
pop hl			;	.data:00000df7	e1	
push hl			;	.data:00000df8	e5	
push de			;	.data:00000df9	d5	
scf			;	.data:00000dfa	37	
sbc hl,de			;	.data:00000dfb	ed	52
push bc			;	.data:00000dfd	c5	
ret			;	.data:00000dfe	c9	
			
add hl,de			;	.data:00000dff	19	
pop de			;	.data:00000e00	d1	
push de			;	.data:00000e01	d5	
push hl			;	.data:00000e02	e5	
jr %0dfa			;	.data:00000e03	18	f5
add a,h			;	.data:00000e05	84	
ld c,h			;	.data:00000e06	4c	
ld c,a			;	.data:00000e07	4f	
ld c,a			;	.data:00000e08	4f	
ld d,b			;	.data:00000e09	50	
daa			;	.data:00000e0a	27	
nop			;	.data:00000e0b	0	
pop hl			;	.data:00000e0c	e1	
pop hl			;	.data:00000e0d	e1	
pop hl			;	.data:00000e0e	e1	
ld hl,%0e21			;	.data:00000e0f	21	21 0e
call %07d3			;	.data:00000e12	cd	d3 07
pop hl			;	.data:00000e15	e1	
ld a,%d2			;	.data:00000e16	3e	d2
call %07d5			;	.data:00000e18	cd	d5 07
ld hl,%e1e1			;	.data:00000e1b	21	e1 e1
jp %07c4			;	.data:00000e1e	c3	c4 07
pop de			;	.data:00000e21	d1	
pop bc			;	.data:00000e22	c1	
pop hl			;	.data:00000e23	e1	
push hl			;	.data:00000e24	e5	
inc bc			;	.data:00000e25	3	
push bc			;	.data:00000e26	c5	
scf			;	.data:00000e27	37	
sbc hl,bc			;	.data:00000e28	ed	42
ex de,hl			;	.data:00000e2a	eb	
jp (hl)			;	.data:00000e2b	e9	
	
				; 05 LEAVE
		
dec b			;	.data:00000e2c	5	
ld c,h			;	.data:00000e2d	4c	
ld b,l			;	.data:00000e2e	45	
ld b,c			;	.data:00000e2f	41	
ld d,(hl)			;	.data:00000e30	56	
ld b,l			;	.data:00000e31	45	
ld c,%00			;	.data:00000e32	0e	0
pop hl			;	.data:00000e34	e1	
pop de			;	.data:00000e35	d1	
pop bc			;	.data:00000e36	c1	
push de			;	.data:00000e37	d5	
push de			;	.data:00000e38	d5	
jp (hl)			;	.data:00000e39	e9	
	;		
				; 04 SWAP
inc b			;	.data:00000e3a	4	
ld d,e			;	.data:00000e3b	53	
ld d,a			;	.data:00000e3c	57	
ld b,c			;	.data:00000e3d	41	
ld d,b			;	.data:00000e3e	50	
inc de			;	.data:00000e3f	13	
nop				;	.data:00000e40	0	
push hl			;	.data:00000e41	e5	
push de			;	.data:00000e42	d5	
rst %10			;	.data:00000e43	d7	
ex de,hl		;	.data:00000e44	eb	
rst %10			;	.data:00000e45	d7	
ex de,hl		;	.data:00000e46	eb	
rst %08			;	.data:00000e47	cf	
ex de,hl		;	.data:00000e48	eb	
rst %08			;	.data:00000e49	cf	
pop de			;	.data:00000e4a	d1	
pop hl			;	.data:00000e4b	e1	
ret				;	.data:00000e4c	c9	
			
ld bc,%0927		;	.data:00000e4d	1	27 09
nop				;	.data:00000e50	0	
call %06e3		;	.data:00000e51	cd	e3 06
rst %08			;	.data:00000e54	cf	
ret				;	.data:00000e55	c9	
			
ld bc,%0e3a			;	.data:00000e56	1	3a 0e
nop				;	.data:00000e59	0	
call %0866			;	.data:00000e5a	cd	66 08
ld hl,%0878			;	.data:00000e5d	21	78 08
push hl			;	.data:00000e60	e5	
call %0881			;	.data:00000e61	cd	81 08
add a,c			;	.data:00000e64	81	
dec sp			;	.data:00000e65	3b	
inc c			;	.data:00000e66	0c	
nop			;	.data:00000e67	0	
call %07e5			;	.data:00000e68	cd	e5 07
pop hl			;	.data:00000e6b	e1	
pop hl			;	.data:00000e6c	e1	
pop hl			;	.data:00000e6d	e1	
pop hl			;	.data:00000e6e	e1	
ret			;	.data:00000e6f	c9	
				
add a,d			;	.data:00000e70	82	
dec sp			;	.data:00000e71	3b	
ld b,e			;	.data:00000e72	43	
rlca			;	.data:00000e73	7	
nop			;	.data:00000e74	0	
jr %0e6d			;	.data:00000e75	18	f6
ld bc,%0a2e			;	.data:00000e77	1	2e 0a
nop			;	.data:00000e7a	0	
call %0ad3			;	.data:00000e7b	cd	d3 0a
jp %0652			;	.data:00000e7e	c3	52 06
ld (bc),a			;	.data:00000e81	2	
ld b,h			;	.data:00000e82	44	
ld l,%0b			;	.data:00000e83	2e	0b
nop			;	.data:00000e85	0	
call %0a96			;	.data:00000e86	cd	96 0a
jp %0652			;	.data:00000e89	c3	52 06
ld bc,%0e49			;	.data:00000e8c	1	49 0e
nop			;	.data:00000e8f	0	
pop de			;	.data:00000e90	d1	
pop hl			;	.data:00000e91	e1	
push hl			;	.data:00000e92	e5	
push de			;	.data:00000e93	d5	
ld de,%8000			;	.data:00000e94	11	00 80
add hl,de			;	.data:00000e97	19	
rst %08			;	.data:00000e98	cf	
ret			;	.data:00000e99	c9	
			
ld bc,%0e4a			;	.data:00000e9a	1	4a 0e
nop					;	.data:00000e9d	0	
ld hl,%0006			;	.data:00000e9e	21	06 00
add hl,sp			;	.data:00000ea1	39	
ld a,(hl)			;	.data:00000ea2	7e	
inc hl				;	.data:00000ea3	23	
ld h,(hl)			;	.data:00000ea4	66	
ld l,a				;	.data:00000ea5	6f	
jr %0e94			;	.data:00000ea6	18	ec

; Forth Word 02 NI

 DB %02,%4E,%49
 DB %0C,00
 
	
rst %10				;	.data:00000ead	d7	
add hl,hl			;	.data:00000eae	29	
inc hl			;		.data:00000eaf	23	
add hl,hl			;	.data:00000eb0	29	
add hl,sp			;	.data:00000eb1	39	
jr %0ea2			;	.data:00000eb2	18	ee
	
; Forth Word 04 PICK						

DB %04,%50,%49,%43,%4B
DB %13,%00
	
push iy				;	.data:00000ebb	fd	e5
rst %10				;	.data:00000ebd	d7	
add hl,hl			;	.data:00000ebe	29	
pop de				;	.data:00000ebf	d1	
add hl,de			;	.data:00000ec0	19	
ld e,(hl)			;	.data:00000ec1	5e	
inc hl				;	.data:00000ec2	23	
ld d,(hl)			;	.data:00000ec3	56	
ex de,hl			;	.data:00000ec4	eb	
rst %08				;	.data:00000ec5	cf	
ret					;	.data:00000ec6	c9	


; Forth Word 02 CR

DB %02,%43,%52
DB %08,00
				
jp %06da			;	.data:00000ecc	c3	da 06

			
; Forth Word 04 EMIT						

DB %04,%45,%4D,%49,%54
DB %0c,%00

rst %10			;	.data:00000ed6	d7	
ld a,l			;	.data:00000ed7	7d	
jp %0493		;	.data:00000ed8	c3	93 04
			
; Forth Word 01  !	Store

DB %01,%21
DB %0c,%00

rst %10			;	.data:00000edf	d7	
ex de,hl		;	.data:00000ee0	eb	
rst %10			;	.data:00000ee1	d7	
ex de,hl		;	.data:00000ee2	eb	
ld (hl),e		;	.data:00000ee3	73	
inc hl			;	.data:00000ee4	23	
ld (hl),d		;	.data:00000ee5	72	
ret			    ;	.data:00000ee6	c9	


	;		
; Forth Word 01 @	Fetch

DB %01,%40
DB %0b,%00

rst %10			;	.data:00000eeb	d7	
ld e,(hl)		;	.data:00000eec	5e	
inc hl			;	.data:00000eed	23	
ld d,(hl)		;	.data:00000eee	56	
ex de,hl		;	.data:00000eef	eb	
rst %08			;	.data:00000ef0	cf	
ret			    ;	.data:00000ef1	c9	



; Forth Word 02 SP	Space


DB %02,%53,%50
DB %0a,%00
	
ld a,%20			;	.data:00000ef7	3e	20
jp %0493			;	.data:00000ef9	c3	93 04


	;		
; Forth Word 07 <BUILDS

DB %07,%3C,%42,%55,%29,%4C,%44,%53
DB %17,%00


call %0866			;	.data:00000f06	cd	66 08
call %07d3			;	.data:00000f09	cd	d3 07
ld hl,(%fc8a)		;	.data:00000f0c	2a	8a fc
dec hl			    ;	.data:00000f0f	2b	
dec hl				;	.data:00000f10	2b	
ex (sp),hl			;	.data:00000f11	e3	
jp (hl)				;	.data:00000f12	e9	


; Forth Word 05  DOES>


DB %85,%44,%4F,%45,%53,%3E
DB %1A,%00

	
ld hl,%0f27			;	.data:00000f1b	21	27 0f
call %07d3			;	.data:00000f1e	cd	d3 07
ld hl,%cfe1			;	.data:00000f21	21	e1 cf
jp %07c4			;	.data:00000f24	c3	c4 07
pop de				;	.data:00000f27	d1	
pop hl				;	.data:00000f28	e1	
ld (hl),e			;	.data:00000f29	73	
inc hl				;	.data:00000f2a	23	
ld (hl),d			;	.data:00000f2b	72	
ret					;	.data:00000f2c	c9	
	


; Forth Word 05  ALLOT


DB %05,%41,%4C,%4C,%4F,%54
DB %12,%00

	
ld hl,(%fc8a)		;	.data:00000f35	2a	8a fc
ex de,hl			;	.data:00000f38	eb	
rst %10			    ;	.data:00000f39	d7	
add hl,de			;	.data:00000f3a	19	
ld (%fc8a),hl		;	.data:00000f3b	22	8a fc
ret			        ;	.data:00000f3e	c9	
	;		
	; 04 CODE						
add a,h			;	.data:00000f3f	84	
ld b,e			;	.data:00000f40	43	
ld c,a			;	.data:00000f41	4f	
ld b,h			;	.data:00000f42	44	
ld b,l			;	.data:00000f43	45	
ld a,(%cd00)			;	.data:00000f44	3a	00 cd
ld a,a			;	.data:00000f47	7f	
rrca			;	.data:00000f48	0f	
jr %0f4e			;	.data:00000f49	18	3
call %07d3			;	.data:00000f4b	cd	d3 07
call %0782			;	.data:00000f4e	cd	82 07
jr c,%0f69			;	.data:00000f51	38	16
call %0d6b			;	.data:00000f53	cd	6b 0d
bit 7,(hl)			;	.data:00000f56	cb	7e
push af			;	.data:00000f58	f5	
call %082a			;	.data:00000f59	cd	2a 08
pop af			;	.data:00000f5c	f1	
jr z,%0f4b			;	.data:00000f5d	28	ec
ld de,%0878			;	.data:00000f5f	11	78 08
push de			;	.data:00000f62	d5	
call %0065			;	.data:00000f63	cd	65 00
pop de			;	.data:00000f66	d1	
jr %0f4e			;	.data:00000f67	18	e5
call %0a36			;	.data:00000f69	cd	36 0a
ld a,%48			;	.data:00000f6c	3e	48
jp c,%0878			;	.data:00000f6e	da	78 08
rst %10			;	.data:00000f71	d7	
ld a,l			;	.data:00000f72	7d	
call %07b9			;	.data:00000f73	cd	b9 07
jp %0f4e			;	.data:00000f76	c3	4e 0f
	;		
	; 03  HEX						
inc bc			;	.data:00000f79	3	
ld c,b			;	.data:00000f7a	48	
ld b,l			;	.data:00000f7b	45	
ld e,b			;	.data:00000f7c	58	
dec c			;	.data:00000f7d	0d	
nop			;	.data:00000f7e	0	
ld hl,%0010			;	.data:00000f7f	21	10 00
ld (%fc86),hl			;	.data:00000f82	22	86 fc
ret			;	.data:00000f85	c9	
	;		
	; 03 AND					"	;	"	"		
inc bc			;	.data:00000f86	3	
ld b,c			;	.data:00000f87	41	
ld c,(hl)			;	.data:00000f88	4e	
ld b,h			;	.data:00000f89	44	
ld de,%d700			;	.data:00000f8a	11	00 d7
ex de,hl			;	.data:00000f8d	eb	
rst %10			;	.data:00000f8e	d7	
ld a,l			;	.data:00000f8f	7d	
and e			;	.data:00000f90	a3	
ld l,a			;	.data:00000f91	6f	
ld a,h			;	.data:00000f92	7c	
and d			;	.data:00000f93	a2	
ld h,a			;	.data:00000f94	67	
rst %08			;	.data:00000f95	cf	
ret				;	.data:00000f96	c9



; Forth Word 02 OR	

DB %02,%4F,%52
DB %10,%00


rst %10			;	.data:00000f9c	d7	
ex de,hl		;	.data:00000f9d	eb	
rst %10			;	.data:00000f9e	d7	
ld a,l			;	.data:00000f9f	7d	
or e			;	.data:00000fa0	b3	
ld l,a			;	.data:00000fa1	6f	
ld a,h			;	.data:00000fa2	7c	
or d			;	.data:00000fa3	b2	
ld h,a			;	.data:00000fa4	67	
rst %08			;	.data:00000fa5	cf	
ret			    ;	.data:00000fa6	c9	
		


; Forth Word  03  XOR


DB %03,%58,%4F,%52
DB %11,%00

rst %10			;	.data:00000fad	d7	
ex de,hl		;	.data:00000fae	eb	
rst %10			;	.data:00000faf	d7	
ld a,l			;	.data:00000fb0	7d	
xor e			;	.data:00000fb1	ab	
ld l,a			;	.data:00000fb2	6f	
ld a,h			;	.data:00000fb3	7c	
xor d			;	.data:00000fb4	aa	
ld h,a			;	.data:00000fb5	67	
rst %08			;	.data:00000fb6	cf	
ret				;	.data:00000fb7	c9	



; Forth Word  04 2VAR

DB %04,%32,%56,%41,%52
DB %0E,00

call %0fd1		;	.data:00000fbf	cd	d1 0f
rst %10			;	.data:00000fc2	d7	
jp %07c4		;	.data:00000fc3	c3	c4 07

	;		
; Forth Word  08 VARIABLE

DB %08,%56,%41,%52,%49,%41,%42,%4C,%45
DB %1B,00	

call %0866		;	.data:00000fd1	cd	66 08
ld hl,%0fde		;	.data:00000fd4	21	de 0f
call %07d3		;	.data:00000fd7	cd	d3 07
rst %10			;	.data:00000fda	d7	
jp %07c4		;	.data:00000fdb	c3	c4 07
pop hl			;	.data:00000fde	e1	
rst %08			;	.data:00000fdf	cf	
ret			    ;	.data:00000fe0	c9	
			
; Forth Word 04 TASK

DB %04,%54,%41,%53,%4B
DB %48,%00
	
call %0866		;	.data:00000fe8	cd	66 08
ld hl,(%fc88)	;	.data:00000feb	2a	88 fc
set 6,(hl)		;	.data:00000fee	cb	f6
ld hl,(%fc8a)	;	.data:00000ff0	2a	8a fc
ld de,%0005		;	.data:00000ff3	11	05 00
add hl,de		;	.data:00000ff6	19	
push hl			;	.data:00000ff7	e5	
call %07c4		;	.data:00000ff8	cd	c4 07
ld hl,%1190		;	.data:00000ffb	21	90 11
call %07d3		;	.data:00000ffe	cd	d3 07
ld hl,%000d		;	.data:00001001	21	0d 00
rst %08			;	.data:00001004	cf	
call %0f35		;	.data:00001005	cd	35 0f
ld bc,%0b00		;	.data:00001008	1	00 0b
pop hl			;	.data:0000100b	e1	
push hl			;	.data:0000100c	e5	
ld (hl),c		;	.data:0000100d	71	
inc hl			;	.data:0000100e	23	
djnz %100d		;	.data:0000100f	10	fc
ex de,hl		;	.data:00001011	eb	
call %06e3		;	.data:00001012	cd	e3 06
ex de,hl		;	.data:00001015	eb	
ld (hl),e		;	.data:00001016	73	
inc hl			;	.data:00001017	23	
ld (hl),d		;	.data:00001018	72	
pop de			;	.data:00001019	d1	
ld hl,(%fc92)	;	.data:0000101a	2a	92 fc
out (%fd),a		;	.data:0000101d	d3	fd
ld (hl),e		;	.data:0000101f	73	
inc hl			;	.data:00001020	23	
ld (hl),d		;	.data:00001021	72	
out (%fe),a		;	.data:00001022	d3	fe
ex de,hl		;	.data:00001024	eb	
ld (%fc92),hl	;	.data:00001025	22	92 fc
ret				;	.data:00001028	c9




; Forth Word 04 AUTO

DB %04,%41,%55,%54,%4F
DB %2b,%00

	
ld hl,%fca5		;	.data:00001030	21	a5 fc
res 7,(hl)		;	.data:00001033	cb	be
ret				;	.data:00001035	c9	
	;		
	;		
ld hl,%fca5		;	.data:00001036	21	a5 fc
bit 7,(hl)		;	.data:00001039	cb	7e
ret nz			;	.data:0000103b	c0	
ld de,%0000		;	.data:0000103c	11	00 00
ld hl,(%fc54)	;	.data:0000103f	2a	54 fc
ex de,hl		;	.data:00001042	eb	
ld (%fc54),hl	;	.data:00001043	22	54 fc
ex de,hl		;	.data:00001046	eb	
call %0d98		;	.data:00001047	cd	98 0d
jr z,%1060		;	.data:0000104a	28	14
ld de,%0100		;	.data:0000104c	11	00 01
sbc hl,de		;	.data:0000104f	ed	52
jr nc,%1073		;	.data:00001051	30	20
ret			    ;	.data:00001053	c9	


; Forth Word 04 FAST

DB %04,%46,%41,%53,%54
DB %13,%00
	
ld hl,%fca5		;	.data:0000105b	21	a5 fc
set 7,(hl)		;	.data:0000105e	cb	fe
ld hl,%0057		;	.data:00001060	21	57 00
ld (%fc82),hl	;	.data:00001063	22	82 fc
ret			    ;	.data:00001066	c9	


; Forth Word 04 SLOW

DB %04,%53,%4C,%4F,%57
DB %13,%00
	
ld hl,%fca5			;	.data:0000106e	21	a5 fc
set 7,(hl)			;	.data:00001071	cb	fe
ld hl,%0071			;	.data:00001073	21	71 00
ld (%fc82),hl		;	.data:00001076	22	82 fc
ret			        ;	.data:00001079	c9	

	;		
; Forth Word 02 D@

DB  %02,%44,%40
DB  %21,%00

push ix			;	.data:0000107d	dd e5	
rst %10			;	.data:00001081	d7	
push hl			;	.data:00001082	e5	
pop ix			;	.data:00001083	dd	e1
call %108e		;	.data:00001085	cd	8e 10
call %0b39		;	.data:00001088	cd	39 0b
pop ix			;	.data:0000108b	dd	e1
ret			    ;	.data:0000108d	c9


			
ld l,(ix+0)			;	.data:0000108e	dd	6e 00
ld h,(ix+1)			;	.data:00001091	dd	66 01
ld e,(ix+2)			;	.data:00001094	dd	5e 02
ld d,(ix+3)			;	.data:00001097	dd	56 03
ret					;	.data:0000109a	c9	


; Forth Word 02 D!

DB  %02,%44,%21
DB  %21,%00
push ix			;	.data:000010a0	dd	e5
rst %10			;	.data:000010a2	d7	
push hl			;	.data:000010a3	e5	
pop ix			;	.data:000010a4	dd	e1
call %0b9b		;	.data:000010a6	cd	9b 0b
call %10af		;	.data:000010a9	cd	af 10
pop ix			;	.data:000010ac	dd	e1
ret			    ;	.data:000010ae	c9	
	;		
	;		
ld (ix+0),l			;	.data:000010af	dd	75 00
ld (ix+1),h			;	.data:000010b2	dd	74 01
ld (ix+2),e			;	.data:000010b5	dd	73 02
ld (ix+3),d			;	.data:000010b8	dd	72 03
ret					;	.data:000010bb	c9	


; Forth Word 02 D!

DB  %82,%49,%46
DB  %1f,%00

ld hl,%10d7			;	.data:000010c1	21	d7 10
call %07d3			;	.data:000010c4	cd	d3 07
ld hl,(%fc8a)		;	.data:000010c7	2a	8a fc
inc hl			    ;	.data:000010ca	23	
push hl				;	.data:000010cb	e5	
ld a,%ca			;	.data:000010cc	3e	ca
call %07d5			;	.data:000010ce	cd	d5 07
call %0881			;	.data:000010d1	cd	81 08
jp %0878			;	.data:000010d4	c3	78 08
rst %10				;	.data:000010d7	d7	
jp %0d98			;	.data:000010d8	c3	98 0d


; Forth Word 04  ELSE


DB  %84,%45,%4c,%53,%45
DB  %1e,%00

pop hl				;	.data:000010e2	e1	
pop hl				;	.data:000010e3	e1	
pop hl				;	.data:000010e4	e1	
pop de				;	.data:000010e5	d1	
call %07cf			;	.data:000010e6	cd	cf 07
ld hl,(%fc8a)		;	.data:000010e9	2a	8a fc
ex de,hl			;	.data:000010ec	eb	
ld (hl),e			;	.data:000010ed	73	
inc hl				;	.data:000010ee	23	
ld (hl),d			;	.data:000010ef	72	
dec de				;	.data:000010f0	1b	
dec de				;	.data:000010f1	1b	
push de				;	.data:000010f2	d5	
call %0881			;	.data:000010f3	cd	81 08
jp %0878			;	.data:000010f6	c3	78 08


		
; Forth Word 04  THEN


DB  %84,%54,%48,%45,%4E
DB  %13,%00

pop hl			;	.data:00001100	e1	
pop hl			;	.data:00001101	e1	
pop hl			;	.data:00001102	e1	
pop de			;	.data:00001103	d1	
ld hl,(%fc8a)	;	.data:00001104	2a	8a fc
ex de,hl		;	.data:00001107	eb	
ld (hl),e		;	.data:00001108	73	
inc hl			;	.data:00001109	23	
ld (hl),d		;	.data:0000110a	72	
ret				;	.data:0000110b	c9




; Forth Word 03 REV

DB  %03,%52,%45,%56
DB  %15,%00	
	
ld de,%0006			;	.data:00001112	11	06 00
rst %10				;	.data:00001115	d7	
add hl,de			;	.data:00001116	19	
ld a,%80			;	.data:00001117	3e	80
xor (hl)			;	.data:00001119	ae	
ld (hl),a			;	.data:0000111a	77	
inc hl				;	.data:0000111b	23	
ld a,%80			;	.data:0000111c	3e	80
xor (hl)			;	.data:0000111e	ae	
ld (hl),a			;	.data:0000111f	77	
ret					;	.data:00001120	c9	




; Forth Word 04 LOCK

DB  %04,%4C,%4F,%43,%4B
DB  %11,%00		

ld hl, (%fc98)		;	.data:00001128	2a 98 fc	
ld de,%000a			;	.data:0000112b	11 0a 00
add hl,de			;	.data:0000112e	19	
set 7,(hl)			;	.data:0000112f	cb	fe
ret					;	.data:00001131	c9	


; Forth Word 06 UNLOCK

DB  %06,%55,%4E,%4C,%4F,%43,%4B
DB  %13,%00		
	
ld hl,(%fc98)		;	.data:0000113b	2a	98 fc
ld de,%000a			;	.data:0000113e	11	0a 00
add hl,de			;	.data:00001141	19	
res 7,(hl)			;	.data:00001142	cb	be
ret					;	.data:00001144	c9	


; Forth Word 04 STOP

DB  %04,%53,%54,%4F,%50
DB  %0E,%00		

ld hl,%0003			;	.data:0000114c	21	03 00
rst %08				;	.data:0000114f	cf	
rst %08				;	.data:00001150	cf	
rst %08				;	.data:00001151	cf	
ret					;	.data:00001152	c9	


; Forth Word 05 START

DB  %05,%53,%54,%41,%52,%54
DB  %0F,%00		

ld hl,%0004		;	.data:0000115b	21	04 00
rst %08			;	.data:0000115e	cf	
rst %08			;	.data:0000115f	cf	
rst %08			;	.data:00001160	cf	
ret			 	;	.data:00001161	c9	


; Forth Word 02 IN

DB  %02,%49,%4E
DB  %0A,%00
	
ld hl,%0000		;	.data:00001167	21	00 00
rst %08			;	.data:0000116a	cf	
ret				;	.data:0000116b	c9	


; Forth Word 05 EVERY

DB  %05,%45,%56,%45,%52,%59
DB  %0D,%00	
	
ld hl,%0001		;	.data:00001174	21	01 00
rst %08			;	.data:00001177	cf	
ret				;	.data:00001178	c9


; Forth Word 02 AT

DB  %02,%41,%54
DB  %0A,%00	
	
ld hl,%0002		;	.data:0000117e	21	02 00
rst %08			;	.data:00001181	cf	
ret				;	.data:00001182	c9


; Forth Word 03 RUN

DB  %03,%52,%55,%4E
DB  %72,%00
	
ld hl,%0005		;	.data:00001189	21	05 00
rst %08			;	.data:0000118c	cf	
rst %08			;	.data:0000118d	cf	
rst %08			;	.data:0000118e	cf	
ret				;	.data:0000118f	c9	
	;		
	;		
ex (sp),ix		;	.data:00001190	dd	e3
call %0b9b		;	.data:00001192	cd	9b 0b
call %0b2d		;	.data:00001195	cd	2d 0b
push de			;	.data:00001198	d5	
push hl			;	.data:00001199	e5	
rst %10			;	.data:0000119a	d7	
ld de,%fffa		;	.data:0000119b	11	fa ff
add hl,de		;	.data:0000119e	19	
jr c,%11a9		;	.data:0000119f	38	8
add hl,hl		;	.data:000011a1	29	
ld de,%11ba		;	.data:000011a2	11	ba 11
add hl,de		;	.data:000011a5	19	
jp %0365		;	.data:000011a6	c3	65 03
pop hl			;	.data:000011a9	e1	
pop hl			;	.data:000011aa	e1	
pop ix			;	.data:000011ab	dd	e1
ret				;	.data:000011ad	c9	
	;		
	;		
jp nz,%ce11		;	.data:000011ae	c2	11 ce
ld de,%12a8		;	.data:000011b1	11	a8 12
push de			;	.data:000011b4	d5	
ld de,%11de		;	.data:000011b5	11	de 11
rst %20			;	.data:000011b8	e7	
ld de,%fdd3		;	.data:000011b9	11	d3 fd
call %10af		;	.data:000011bc	cd	af 10
out (%fe),a		;	.data:000011bf	d3	fe
ret				;	.data:000011c1	c9	
	;		
	;		
inc ix			;	.data:000011c2	dd	23
inc ix			;	.data:000011c4	dd	23
pop hl			;	.data:000011c6	e1	
pop de			;	.data:000011c7	d1	
call %11ba		;	.data:000011c8	cd	ba 11
pop ix			;	.data:000011cb	dd	e1
ret				;	.data:000011cd	c9	
	;		
	;		
ld de,%0006		;	.data:000011ce	11	06 00
add ix,de		;	.data:000011d1	dd	19
jr %11c6		;	.data:000011d3	18	f1
pop hl			;	.data:000011d5	e1	
pop hl			;	.data:000011d6	e1	
set 6,(ix+10)	;	.data:000011d7	dd	cb 0a f6
pop ix			;	.data:000011db	dd	e1
ret				;	.data:000011dd	c9	
	;		
	;		
pop hl			;	.data:000011de	e1	
pop hl			;	.data:000011df	e1	
ld (ix+10),%00	;	.data:000011e0	dd	36 0a 00
pop ix			;	.data:000011e4	dd	e1
ret				;	.data:000011e6	c9	
pop hl			;	.data:000011e7	e1	
pop hl			;	.data:000011e8	e1	
bit 6,(ix+10)	;	.data:000011e9	dd	cb 0a 76
jr nz,%11f2		;	.data:000011ed	20	3
inc (ix+10)		;	.data:000011ef	dd	34 0a
pop ix			;	.data:000011f2	dd	e1
ret				;	.data:000011f4	c9	


; Forth Word 02 TT

DB  %02,%54,%54
DB  %08,%00	
	
jp %0c13		;	.data:000011fa	c3	13 0c
	

; Forth Word 02 TS

DB  %02,%54,%53
DB  %0C,%00	
	
ld hl,%0032			;	.data:00001202	21	32 00
rst %08				;	.data:00001205	cf	
jp %0b00			;	.data:00001206	c3	00 0b


; Forth Word 02 TM

DB  %02,%54,%4D
DB  %0C,%00	
	
ld hl,%0bb8			;	.data:0000120e	21	b8 0b
rst %08				;	.data:00001211	cf	
jp %0b00			;	.data:00001212	c3	00 0b


; Forth Word 02 TH

DB  %02,%54,%48
DB  %14,%00			
	
call %0c13			;	.data:0000121a	cd	13 0c
ld de,%0002			;	.data:0000121d	11	02 00
ld hl,%bf20			;	.data:00001220	21	20 bf
call %0b39			;	.data:00001223	cd	39 0b
jp %0cd6			;	.data:00001226	c3	d6 0c


; Forth Word 02 TH

DB  %02,%54,%44
DB  %10,%00			

call %0c13			;	.data:0000122e	cd	13 0c
ld de,%0041			;	.data:00001231	11	41 00
ld hl,%eb00			;	.data:00001234	21	00 eb
jr %1223			;	.data:00001237	18	ea


; Forth Word 02 TW

DB  %02,%54,%57
DB  %10,%00			

call %0c13			;	.data:0000123e	cd	13 0c
ld de,%01cd			;	.data:00001241	11	cd 01
ld hl,%6d00			;	.data:00001244	21	00 6d
jr %1223			;	.data:00001247	18	da


; Forth Word 02 TY

DB  %02,%54,%59
DB  %10,%00			

call %0c13			;	.data:0000124e	cd	13 0c
ld de,%5dfc			;	.data:00001251	11	fc 5d
ld hl,%0f00			;	.data:00001254	21	00 0f
jr %1223			;	.data:00001257	18	ca


; Forth Word 04 CASE

DB  %84,%43,%41,%53,%45
DB  %A7,%00		
	
ld hl,%128b			;	.data:00001260	21	8b 12
call %07d3			;	.data:00001263	cd	d3 07
ld hl,(%fc8a)		;	.data:00001266	2a	8a fc
push hl				;	.data:00001269	e5	
call %07c4			;	.data:0000126a	cd	c4 07
ld de,%0e68			;	.data:0000126d	11	68 0e
call %06e3			;	.data:00001270	cd	e3 06
call %12a2			;	.data:00001273	cd	a2 12
jr z,%127d			;	.data:00001276	28	5
call %07c4			;	.data:00001278	cd	c4 07
jr %1270			;	.data:0000127b	18	f3
ld hl,(%fc8a)		;	.data:0000127d	2a	8a fc
dec hl				;	.data:00001280	2b	
dec hl				;	.data:00001281	2b	
pop de				;	.data:00001282	d1	
or a				;	.data:00001283	b7	
sbc hl,de			;	.data:00001284	ed	52
ex de,hl			;	.data:00001286	eb	
ld (hl),e			;	.data:00001287	73	
inc hl				;	.data:00001288	23	
ld (hl),d			;	.data:00001289	72	
ret					;	.data:0000128a	c9	
	;		
	;		
pop hl				;	.data:0000128b	e1	
ld e,(hl)			;	.data:0000128c	5e	
inc hl				;	.data:0000128d	23	
ld d,(hl)			;	.data:0000128e	56	
inc hl				;	.data:0000128f	23	
push hl				;	.data:00001290	e5	
add hl,de			;	.data:00001291	19	
ex (sp),hl			;	.data:00001292	e3	
push hl				;	.data:00001293	e5	
rst %10				;	.data:00001294	d7	
add hl,hl			;	.data:00001295	29	
call %12a2			;	.data:00001296	cd	a2 12
jr nc,%12a0			;	.data:00001299	30	5
pop de				;	.data:0000129b	d1	
add hl,de			;	.data:0000129c	19	
jp %0365			;	.data:0000129d	c3	65 03
pop hl				;	.data:000012a0	e1	
ret					;	.data:000012a1	c9	
	;		
	;		
push hl				;	.data:000012a2	e5	
or a				;	.data:000012a3	b7	
sbc hl,de			;	.data:000012a4	ed	52
pop hl				;	.data:000012a6	e1	
ret					;	.data:000012a7	c9	
	;		
	;		
ld hl,%0000			;	.data:000012a8	21	00 00
add hl,sp			;	.data:000012ab	39	
ld de,%fc5c			;	.data:000012ac	11	5c fc
or a				;	.data:000012af	b7	
call %12d7			;	.data:000012b0	cd	d7 12
jp nc,%11c2			;	.data:000012b3	d2	c2 11
call %12e7			;	.data:000012b6	cd	e7 12
ld e,%68			;	.data:000012b9	1e	68
call %12e7			;	.data:000012bb	cd	e7 12
jr %12ac			;	.data:000012be	18	ec
call %12f8			;	.data:000012c0	cd	f8 12
push hl				;	.data:000012c3	e5	
push de				;	.data:000012c4	d5	
ld bc,%0004			;	.data:000012c5	1	04 00
add hl,bc			;	.data:000012c8	9	
ex de,hl			;	.data:000012c9	eb	
add hl,bc			;	.data:000012ca	9	
ld b,c				;	.data:000012cb	41	
dec hl				;	.data:000012cc	2b	
dec de				;	.data:000012cd	1b	
ld a,(de)			;	.data:000012ce	1a	
cp (hl)				;	.data:000012cf	be	
jr nz,%12d4			;	.data:000012d0	20	2
djnz %12cc			;	.data:000012d2	10	f8
pop de				;	.data:000012d4	d1	
pop hl				;	.data:000012d5	e1	
ret					;	.data:000012d6	c9	
	;		
	;		
push hl				;	.data:000012d7	e5	
push de				;	.data:000012d8	d5	
push bc				;	.data:000012d9	c5	
ld b,%04			;	.data:000012da	6	4
ld a,(de)			;	.data:000012dc	1a	
adc a,(hl)			;	.data:000012dd	8e	
ld (hl),a			;	.data:000012de	77	
inc hl				;	.data:000012df	23	
inc de				;	.data:000012e0	13	
djnz %12dc			;	.data:000012e1	10	f9
pop bc				;	.data:000012e3	c1	
pop de				;	.data:000012e4	d1	
pop hl				;	.data:000012e5	e1	
ret					;	.data:000012e6	c9	
	;		
	;		
push hl				;	.data:000012e7	e5	
push de				;	.data:000012e8	d5	
push bc				;	.data:000012e9	c5	
ld b,%04			;	.data:000012ea	6	4
ex de,hl			;	.data:000012ec	eb	
ld a,(de)			;	.data:000012ed	1a	
sbc a,(hl)			;	.data:000012ee	9e	
ld (de),a			;	.data:000012ef	12	
inc hl				;	.data:000012f0	23	
inc de				;	.data:000012f1	13	
djnz %12ed			;	.data:000012f2	10	f9
pop bc				;	.data:000012f4	c1	
pop de				;	.data:000012f5	d1	
pop hl				;	.data:000012f6	e1	
ret					;	.data:000012f7	c9	
	;		
	;		
push iy				;	.data:000012f8	fd	e5
pop de				;	.data:000012fa	d1	
ld hl,%0004			;	.data:000012fb	21	04 00
add hl,de			;	.data:000012fe	19	
ret					;	.data:000012ff	c9	




; Forth Word 02 D+

DB  %02,%44,%2B
DB  %12,%00		
	
push hl				;	.data:00001305	e5	
push de				;	.data:00001306	d5	
call %12f8			;	.data:00001307	cd	f8 12
call %12d7			;	.data:0000130a	cd	d7 12
rst %10				;	.data:0000130d	d7	
rst %10				;	.data:0000130e	d7	
pop de				;	.data:0000130f	d1	
pop hl				;	.data:00001310	e1	
ret				;	.data:00001311	c9	


; Forth Word 02 D-

DB  %02,%44,%2D
DB  %12,%00		
				
push hl			;	.data:00001317	e5	
push de			;	.data:00001318	d5	
call %12f8		;	.data:00001319	cd	f8 12
call %12e7		;	.data:0000131c	cd	e7 12
rst %10			;	.data:0000131f	d7	
rst %10			;	.data:00001320	d7	
pop de			;	.data:00001321	d1	
pop hl			;	.data:00001322	e1	
ret				;	.data:00001323	c9	


; Forth Word 03 CLS

DB  %03,%43,%4C,%53
DB  %0B,%00		
		
ld a,%0c			;	.data:0000132a	3e	0c
jp %0493			;	.data:0000132c	c3	93 04


; Forth Word 03 ABS

DB  %03,%41,%42,%53
DB  %0C,%00	


rst %10			;	.data:00001335	d7	
call %0b19		;	.data:00001336	cd	19 0b
rst %08			;	.data:00001339	cf	
ret				;	.data:0000133a	c9	


; Forth Word 06 DMINUS

DB  %06,%44,%4D,%49,%4E,%55,%53
DB  %12,%00		
				
call %0b9b			;	.data:00001344	cd	9b 0b
call %0b2d			;	.data:00001347	cd	2d 0b
jp %0b39			;	.data:0000134a	c3	39 0b

; Forth Word 04 DABS

DB  %04,%44,%41,%42,%53
DB  %10,%00							

call %0b9b			;	.data:00001354	cd	9b 0b
call %0b28			;	.data:00001357	cd	28 0b
jp %0b39			;	.data:0000135a	c3	39 0b


; Forth Word 02 C@

DB  %02,%43,%40
DB  %0B,%00	
	
rst %10				;	.data:00001362	d7	
ld l,(hl)			;	.data:00001363	6e	
ld h,%00			;	.data:00001364	26	0
rst %08				;	.data:00001366	cf	
ret					;	.data:00001367	c9	


; Forth Word 02 C!

DB  %02,%43,%21
DB  %0B,%00		

rst %10				;	.data:0000136d	d7	
ex de,hl			;	.data:0000136e	eb	
rst %10				;	.data:0000136f	d7	
ld a,l				;	.data:00001370	7d	
ld (de),a			;	.data:00001371	12	
ret					;	.data:00001372	c9

; Forth Word 04 DROP

DB  %04,%44,%52,%4F,%50
DB  %09,%00
	
rst %10				;	.data:0000137a	d7	
ret					;	.data:0000137b	c9


; Forth Word 06 BLANKS


DB  %06,%42,%4C,%41,%4E,%4B,%53
DB  %0F,%00	
	
rst %10			;	.data:00001385	d7	
ex de,hl		;	.data:00001386	eb	
ld c,%00		;	.data:00001387	0e	0
jr %1396		;	.data:00001389	18	0b


; Forth Word 04 FILL

DB  %04,%46,%49,%4C,%4C
DB  %14,%00
	
rst %10			;	.data:00001392	d7	
ld c,l			;	.data:00001393	4d	
rst %10			;	.data:00001394	d7	
ex de,hl		;	.data:00001395	eb	
rst %10			;	.data:00001396	d7	
ld (hl),c		;	.data:00001397	71	
inc hl			;	.data:00001398	23	
dec de			;	.data:00001399	1b	
ld a,e			;	.data:0000139a	7b	
or d			;	.data:0000139b	b2	
jr nz,%1397		;	.data:0000139c	20	f9
ret				;	.data:0000139e	c9	


; Forth Word 04 COPY

DB  %04,%43,%4F,%50,%59
DB  %0D,%00
	
ld hl,%0200		;	.data:000013a6	21	00 02
push hl			;	.data:000013a9	e5	
jr %13b6		;	.data:000013aa	18	0a


; Forth Word 04 MOVE

DB  %04,%4D,%4F,%56,%45
DB  %43,%00	
	
rst %10			;	.data:000013b3	d7	
add hl,hl		;	.data:000013b4	29	
push hl			;	.data:000013b5	e5	
rst %10			;	.data:000013b6	d7	
ex de,hl		;	.data:000013b7	eb	
rst %10			;	.data:000013b8	d7	
pop bc			;	.data:000013b9	c1	
jp %036a		;	.data:000013ba	c3	6a 03
call %13d2		;	.data:000013bd	cd	d2 13
call %0909		;	.data:000013c0	cd	09 09
call z,%048d	;	.data:000013c3	cc	8d 04
call %18fa		;	.data:000013c6	cd	fa 18
call %1036		;	.data:000013c9	cd	36 10
ld hl,%fc78		;	.data:000013cc	21	78 fc
ld (hl),%ff		;	.data:000013cf	36	ff
ret				;	.data:000013d1	c9	
	;		
	;		
push hl			;	.data:000013d2	e5	
push de			;	.data:000013d3	d5	
ld hl,%fc58		;	.data:000013d4	21	58 fc
ld de,%fc60		;	.data:000013d7	11	60 fc
call %12d7		;	.data:000013da	cd	d7 12
ld l,%5c		;	.data:000013dd	2e	5c
ld e,%64		;	.data:000013df	1e	64
call %12d7		;	.data:000013e1	cd	d7 12
ld e,%68		;	.data:000013e4	1e	68
call %12c3		;	.data:000013e6	cd	c3 12
call nc,%12e7	;	.data:000013e9	d4	e7 12
pop de			;	.data:000013ec	d1	
pop hl			;	.data:000013ed	e1	
ret				;	.data:000013ee	c9


; Forth Word 06 SCREEN

DB  %06,%53,%43,%52,%45,%45,%4E
DB  %2C,%00
	
call %0866		;	.data:000013f8	cd	66 08
ld hl,%0fde		;	.data:000013fb	21	de 0f
call %07d3		;	.data:000013fe	cd	d3 07
ld hl,%0000		;	.data:00001401	21	00 00
push hl			;	.data:00001404	e5	
call %07c4		;	.data:00001405	cd	c4 07
rst %10			;	.data:00001408	d7	
ld d,l			;	.data:00001409	55	
rst %10			;	.data:0000140a	d7	
ld e,l			;	.data:0000140b	5d	
rst %10			;	.data:0000140c	d7	
ld a,l			;	.data:0000140d	7d	
rst %10			;	.data:0000140e	d7	
ld h,a			;	.data:0000140f	67	
call %07c4		;	.data:00001410	cd	c4 07
ex de,hl		;	.data:00001413	eb	
call %07c4		;	.data:00001414	cd	c4 07
pop hl			;	.data:00001417	e1	
jp %07c4		;	.data:00001418	c3	c4 07



; Forth Word 02 .C

DB  %02,%2E,%43
DB  %11,%00	

push ix			;	.data:00001420	d7 e5	
ex (sp),ix		;	.data:00001422	dd	e3
rst %10			;	.data:00001424	d7	
ld a,l			;	.data:00001425	7d	
call %0333		;	.data:00001426	cd	33 03
pop ix			;	.data:00001429	dd	e1
ret				;	.data:0000142b	c9


; Forth Word 02 .W

DB  %02,%2E,%57
DB  %1a,%00	
	
push ix			;	.data:00001431	d7 e5	
ex (sp),ix		;	.data:00001433	dd	e3
rst %10			;	.data:00001435	d7	
ld a,l			;	.data:00001436	7d	
and %3f			;	.data:00001437	e6	3f
jr z,%1443		;	.data:00001439	28	8
ld l,a			;	.data:0000143b	6f	
rst %20			;	.data:0000143c	e7	
call %0333		;	.data:0000143d	cd	33 03
dec l			;	.data:00001440	2d	
jr nz,%143c		;	.data:00001441	20	f9
pop ix			;	.data:00001443	dd	e1
ret				;	.data:00001445	c9	



; Forth Word 01 #

DB  %01,%23
DB  %07,%00	

jp %0ad3			;	.data:0000144a	c3	d3 0a

; Forth Word 02 D#

DB  %02,%44,%23
DB  %08,%00	
	
jp %0a96			;	.data:00001452	c3	96 0a

; Forth Word 02 ED

DB  %02,%45,%44		
DB  %0A,%00

ld hl,%fcae			;	.data:0000145a	21	ae fc
rst %08				;	.data:0000145d	cf	
ret					;	.data:0000145e	c9	


; Forth Word 02 CO

DB  %02,%43,%4F		
DB  %0A,%00
	
ld hl,%fcb6			;	.data:00001464	21	b6 fc
rst %08				;	.data:00001467	cf	
ret					;	.data:00001468	c9	


; Forth Word 02 W@

DB  %02,%57,%40		
DB  %09,%00
	
rst %10				;	.data:0000146e	d7	
jp %0637			;	.data:0000146f	c3	37 06



; Forth Word 03 C>N

DB  %03,%43,%3E,%4E
DB  %18,%00	

ld de,%ffff		;	.data:00001478	11	ff ff
xor a			;	.data:0000147b	af	
rst %10			;	.data:0000147c	d7	
add hl,de		;	.data:0000147d	19	
jr c,%1483		;	.data:0000147e	38	3
inc hl			;	.data:00001480	23	
jr %1484		;	.data:00001481	18	1
rst %20			;	.data:00001483	e7	
rst %08			;	.data:00001484	cf	
ld h,%00		;	.data:00001485	26	0
ld l,a			;	.data:00001487	6f	
rst %08			;	.data:00001488	cf	
ret				;	.data:00001489	c9	

; Forth Word 03 N>C

DB  %03,%4E,%3E,%43
DB  %0D,%00	
	
rst %10			;	.data:00001490	d7	
ld a,l			;	.data:00001491	7d	
rst %18			;	.data:00001492	df	
rst %10			;	.data:00001493	d7	
inc hl			;	.data:00001494	23	
rst %08			;	.data:00001495	cf	
ret				;	.data:00001496	c9	


; Forth Word 01 "

DB  %081,%22
DB  %3b,%00	

ld hl,%14be			;	.data:0000149b	21	be 14
call %07d3			;	.data:0000149e	cd	d3 07
ld hl,(%fc8a)		;	.data:000014a1	2a	8a fc
ld a,%ff			;	.data:000014a4	3e	ff
call %07b9			;	.data:000014a6	cd	b9 07
inc (hl)			;	.data:000014a9	34	
or a				;	.data:000014aa	b7	
call %14c5			;	.data:000014ab	cd	c5 14
cp %22				;	.data:000014ae	fe	22
jr nz,%14a6			;	.data:000014b0	20	f4
ret					;	.data:000014b2	c9	
	;		
	;		
pop de				;	.data:000014b3	d1	
pop hl				;	.data:000014b4	e1	
push de				;	.data:000014b5	d5	
ld e,(hl)			;	.data:000014b6	5e	
ld d,%00			;	.data:000014b7	16	0
ex de,hl			;	.data:000014b9	eb	
add hl,de			;	.data:000014ba	19	
inc hl				;	.data:000014bb	23	
ex de,hl			;	.data:000014bc	eb	
ret					;	.data:000014bd	c9	
	;		
	;		
call %14b3			;	.data:000014be	cd	b3 14
push de				;	.data:000014c1	d5	
jp %0637			;	.data:000014c2	c3	37 06
call %0621			;	.data:000014c5	cd	21 06
and %7f				;	.data:000014c8	e6	7f
call %0493			;	.data:000014ca	cd	93 04
cp %1f				;	.data:000014cd	fe	1f
jr z,%14c5			;	.data:000014cf	28	f4
ret					;	.data:000014d1	c9	



; Forth Word 02 ."

DB  %82,%2E,%22
DB  %11,%00	

ld de,%2100			;	.data:000014d5	11	00 21              
call c,%1814		;	.data:000014d8	dc	14 18
jp nz,%b3cd			;	.data:000014db	c2	cd b3
inc d				;	.data:000014de	14	
push de				;	.data:000014df	d5	
jp %0665			;	.data:000014e0	c3	65 06


; Forth Word 06 ABORT

DB  %86,%41,%42,%4F,%52,%54,%22
DB  %86,%00
			
ld hl,%14f1			;	.data:000014ec	21	f1 14
jr %149e			;	.data:000014ef	18	ad
call %14b3			;	.data:000014f1	cd	b3 14
push de				;	.data:000014f4	d5	
push hl				;	.data:000014f5	e5	
rst %10				;	.data:000014f6	d7	
ld a,l				;	.data:000014f7	7d	
or h				;	.data:000014f8	b4	
pop hl				;	.data:000014f9	e1	
ret z				;	.data:000014fa	c8	
call %0665			;	.data:000014fb	cd	65 06
jp %099a			;	.data:000014fe	c3	9a 09
push af				;	.data:00001501	f5	
in a,(%fe)			;	.data:00001502	db	fe
ld a,%10			;	.data:00001504	3e	10
dec a				;	.data:00001506	3d	
jr nz,%1506			;	.data:00001507	20	fd
out (%ff),a			;	.data:00001509	d3	ff
ld a,%4b			;	.data:0000150b	3e	4b
dec a				;	.data:0000150d	3d	
jr nz,%150d			;	.data:0000150e	20	fd
pop af				;	.data:00001510	f1	
ret					;	.data:00001511	c9	
	;		
	;		
push bc				;	.data:00001512	c5	
ld b,%72			;	.data:00001513	6	72
djnz %1515			;	.data:00001515	10	fe
pop bc				;	.data:00001517	c1	
ret					;	.data:00001518	c9	
	;		
	;		
push af				;	.data:00001519	f5	
push bc				;	.data:0000151a	c5	
ld b,%0a			;	.data:0000151b	6	0a
ld a,(hl)			;	.data:0000151d	7e	
scf					;	.data:0000151e	37	
call %1501			;	.data:0000151f	cd	01 15
call c,%1501		;	.data:00001522	dc	01 15
call nc,%1512		;	.data:00001525	d4	12 15
add a,a				;	.data:00001528	87	
djnz %151f			;	.data:00001529	10	f4
pop bc				;	.data:0000152b	c1	
pop af				;	.data:0000152c	f1	
ret					;	.data:0000152d	c9	
	;		
	;		
push bc				;	.data:0000152e	c5	
push hl				;	.data:0000152f	e5	
ld hl,%153d			;	.data:00001530	21	3d 15
ld b,%7d			;	.data:00001533	6	7d
call %1519			;	.data:00001535	cd	19 15
djnz %1535			;	.data:00001538	10	fb
pop hl				;	.data:0000153a	e1	
pop bc				;	.data:0000153b	c1	
ret					;	.data:0000153c	c9	
	;		
	;		
nop					;	.data:0000153d	0	
and l				;	.data:0000153e	a5	
ld de,%0200			;	.data:0000153f	11	00 02
push bc				;	.data:00001542	c5	
push hl				;	.data:00001543	e5	
ld bc,%ffff			;	.data:00001544	1	ff ff
call %1519			;	.data:00001547	cd	19 15
inc hl				;	.data:0000154a	23	
ex de,hl			;	.data:0000154b	eb	
add hl,bc			;	.data:0000154c	9	
ex de,hl			;	.data:0000154d	eb	
jr c,%1547			;	.data:0000154e	38	f7
pop hl				;	.data:00001550	e1	
pop bc				;	.data:00001551	c1	
ret					;	.data:00001552	c9	
	;		
	;		
push hl				;	.data:00001553	e5	
ld hl,%153e			;	.data:00001554	21	3e 15
call %1519			;	.data:00001557	cd	19 15
pop hl				;	.data:0000155a	e1	
ret					;	.data:0000155b	c9	
	;		
	;		
push hl				;	.data:0000155c	e5	
ld hl,%fc52			;	.data:0000155d	21	52 fc
call %1519			;	.data:00001560	cd	19 15
inc hl				;	.data:00001563	23	
call %1519			;	.data:00001564	cd	19 15
pop hl				;	.data:00001567	e1	
ret					;	.data:00001568	c9	



; Forth Word 05 STORE

DB  %05,%53,%54,%4F,%52,%45
DB  %97,%00	


ld hl,%fcad			;	.data:00001571	21	ad fc
bit 6,(hl)			;	.data:00001574	cb	76
ret z				;	.data:00001576	c8	
rst %10				;	.data:00001577	d7	
ld (%fc52),hl		;	.data:00001578	22	52 fc
out (%fd),a			;	.data:0000157b	d3	fd
ld hl,(%fc76)		;	.data:0000157d	2a	76 fc
call %152e			;	.data:00001580	cd	2e 15
call %1553			;	.data:00001583	cd	53 15
call %155c			;	.data:00001586	cd	5c 15
call %153f			;	.data:00001589	cd	3f 15
call %152e			;	.data:0000158c	cd	2e 15
out (%fe),a			;	.data:0000158f	d3	fe
ret					;	.data:00001591	c9	
	;		
	;		
call %15a5			;	.data:00001592	cd	a5 15
jr c,%159c			;	.data:00001595	38	5
cp %a5				;	.data:00001597	fe	a5
jr nz,%1592			;	.data:00001599	20	f7
ret					;	.data:0000159b	c9	
	;		
	;		
ld a,%7f			;	.data:0000159c	3e	7f
in a,(%fe)			;	.data:0000159e	db	fe
rrca				;	.data:000015a0	0f	
ccf					;	.data:000015a1	3f	
jr nc,%1592			;	.data:000015a2	30	ee
ret					;	.data:000015a4	c9	
	;		
	;		
push de				;	.data:000015a5	d5	
push bc				;	.data:000015a6	c5	
ld e,%00			;	.data:000015a7	1e	0
ld bc,%0000			;	.data:000015a9	1	00 00
ld a,%7f			;	.data:000015ac	3e	7f
in a,(%fe)			;	.data:000015ae	db	fe
bit 0,a				;	.data:000015b0	cb	47
jr z,%15b9			;	.data:000015b2	28	5
rlca				;	.data:000015b4	7	
jr c,%15bd			;	.data:000015b5	38	6
djnz %15ac			;	.data:000015b7	10	f3
pop bc				;	.data:000015b9	c1	
pop de				;	.data:000015ba	d1	
scf					;	.data:000015bb	37	
ret					;	.data:000015bc	c9	
	;		
	;		
ld b,%3e			;	.data:000015bd	6	3e
djnz %15bf			;	.data:000015bf	10	fe
ld b,%25			;	.data:000015c1	6	25
in a,(%fe)			;	.data:000015c3	db	fe
rlca				;	.data:000015c5	7	
ld a,c				;	.data:000015c6	79	
adc a,%00			;	.data:000015c7	ce	0
ld c,a				;	.data:000015c9	4f	
djnz %15c3			;	.data:000015ca	10	f7
cp %04				;	.data:000015cc	fe	4
ccf					;	.data:000015ce	3f	
rl e				;	.data:000015cf	cb	13
jr nc,%15a9			;	.data:000015d1	30	d6
pop bc				;	.data:000015d3	c1	
ld a,e				;	.data:000015d4	7b	
pop de				;	.data:000015d5	d1	
or a				;	.data:000015d6	b7	
ret					;	.data:000015d7	c9	
	;		
	;		
ld b,%00			;	.data:000015d8	6	0
call %15dd			;	.data:000015da	cd	dd 15
ld (hl),%00			;	.data:000015dd	36	0
inc hl				;	.data:000015df	23	
djnz %15dd			;	.data:000015e0	10	fb
ret					;	.data:000015e2	c9	
	;		
	;		
push de				;	.data:000015e3	d5	
push hl				;	.data:000015e4	e5	
call %15a5			;	.data:000015e5	cd	a5 15
jr c,%15f2			;	.data:000015e8	38	8
ld (hl),a			;	.data:000015ea	77	
inc hl				;	.data:000015eb	23	
dec e				;	.data:000015ec	1d	
jr nz,%15e5			;	.data:000015ed	20	f6
dec d				;	.data:000015ef	15	
jr nz,%15e5			;	.data:000015f0	20	f3
pop hl				;	.data:000015f2	e1	
pop de				;	.data:000015f3	d1	
ret					;	.data:000015f4	c9	
	;		
	;		
ld b,%00			;	.data:000015f5	6	0
call %15fa			;	.data:000015f7	cd	fa 15
call %15a5			;	.data:000015fa	cd	a5 15
djnz %15fa			;	.data:000015fd	10	fb
ret					;	.data:000015ff	c9	



; Forth Word 04  LOAD

DB  %04,%4C,%4F,%41,%44
DB  %54,%00
	
ld hl,%fcad			;	.data:00001607	21	ad fc
bit 6,(hl)			;	.data:0000160a	cb	76
ret z				;	.data:0000160c	c8	
rst %10				;	.data:0000160d	d7	
ld (%fc52),hl		;	.data:0000160e	22	52 fc
out (%fd),a			;	.data:00001611	d3	fd
ld hl,(%fc76)		;	.data:00001613	2a	76 fc
push hl				;	.data:00001616	e5	
call %15d8			;	.data:00001617	cd	d8 15
call %1592			;	.data:0000161a	cd	92 15
jr c,%1651			;	.data:0000161d	38	32
call %15a5			;	.data:0000161f	cd	a5 15
ld l,a				;	.data:00001622	6f	
call %15a5			;	.data:00001623	cd	a5 15
ld h,a				;	.data:00001626	67	
or l				;	.data:00001627	b5	
jr nz,%162d			;	.data:00001628	20	3
ld (%fc52),hl		;	.data:0000162a	22	52 fc
ex de,hl			;	.data:0000162d	eb	
ld hl,(%fc52)		;	.data:0000162e	2a	52 fc
ld a,l				;	.data:00001631	7d	
or h				;	.data:00001632	b4	
jr nz,%163b			;	.data:00001633	20	6
ex de,hl			;	.data:00001635	eb	
ld (%fc52),hl		;	.data:00001636	22	52 fc
jr %163d			;	.data:00001639	18	2
sbc hl,de			;	.data:0000163b	ed	52
pop hl				;	.data:0000163d	e1	
jr nz,%164c			;	.data:0000163e	20	0c
ld de,%0200			;	.data:00001640	11	00 02
call %15e3			;	.data:00001643	cd	e3 15
call %168c			;	.data:00001646	cd	8c 16
out (%fe),a			;	.data:00001649	d3	fe
ret					;	.data:0000164b	c9	
	;		
	;		
call %15f5			;	.data:0000164c	cd	f5 15
jr %1611			;	.data:0000164f	18	c0
pop hl				;	.data:00001651	e1	
jr %1649			;	.data:00001652	18	f5
inc bc				;	.data:00001654	3	
dec l				;	.data:00001655	2d	
dec l				;	.data:00001656	2d	
ld a,%0b			;	.data:00001657	3e	0b
nop					;	.data:00001659	0	
call %166b			;	.data:0000165a	cd	6b 16
jr %1611			;	.data:0000165d	18	b2
inc bc				;	.data:0000165f	3	
inc a				;	.data:00001660	3c	
dec l				;	.data:00001661	2d	
dec l				;	.data:00001662	2d	
dec h				;	.data:00001663	25	
nop					;	.data:00001664	0	
call %166b			;	.data:00001665	cd	6b 16
jp %157b			;	.data:00001668	c3	7b 15
ld hl,(%fc52)		;	.data:0000166b	2a	52 fc
ld a,l				;	.data:0000166e	7d	
or h				;	.data:0000166f	b4	
ret z				;	.data:00001670	c8	
inc hl				;	.data:00001671	23	
ld (%fc52),hl		;	.data:00001672	22	52 fc
ret					;	.data:00001675	c9	
	;		
	;		
push hl				;	.data:00001676	e5	
push de				;	.data:00001677	d5	
ld a,h				;	.data:00001678	7c	
xor d				;	.data:00001679	aa	
bit 7,a				;	.data:0000167a	cb	7f
jr z,%167f			;	.data:0000167c	28	1
ex de,hl			;	.data:0000167e	eb	
sbc hl,de			;	.data:0000167f	ed	52
pop de				;	.data:00001681	d1	
pop hl				;	.data:00001682	e1	
ret					;	.data:00001683	c9	


; Forth Word 03 CPL

DB %03,%43,%50,%4C
DB %14,%00
	
jr %1692			;	.data:0000168a	18	6
ld hl,%fca5			;	.data:0000168c	21	a5 fc
bit 2,(hl)			;	.data:0000168f	cb	56
ret z				;	.data:00001691	c8	
ld hl,%fca5			;	.data:00001692	21	a5 fc
set 1,(hl)			;	.data:00001695	cb	ce
ret					;	.data:00001697	c9	

; Forth Word 03 CON

DB %03,%43,%4F,%4E
DB %0C,%00
	
ld hl,%fca5			;	.data:0000169e	21	a5 fc
set 2,(hl)			;	.data:000016a1	cb	d6
ret					;	.data:000016a3	c9	


; Forth Word 04 COFF

DB %04,%43,%4F,%46,%46
DB %0D,%00
	
ld hl,%fca5			;	.data:000016ab	21	a5 fc
res 2,(hl)			;	.data:000016ae	cb	96
ret					;	.data:000016b0	c9	
	;		

; Forth Word 01 >

DB %01,%3E
DB %11,%00
	
rst %10				;	.data:000016b5	d7	
ex de,hl			;	.data:000016b6	eb	
rst %10				;	.data:000016b7	d7	
ex de,hl			;	.data:000016b8	eb	
call %1676			;	.data:000016b9	cd	76 16
ccf					;	.data:000016bc	3f	
sbc hl,hl			;	.data:000016bd	ed	62
inc hl				;	.data:000016bf	23	
rst %08				;	.data:000016c0	cf	
ret					;	.data:000016c1	c9	
	;		
	;


; Forth Word 01 <

DB %01,%3C
DB %09,%00

rst %10				;	.data:000016c6	d7	
ex de,hl			;	.data:000016c7	eb	
rst %10				;	.data:000016c8	d7	
jr %16b9			;	.data:000016c9	18	ee


; Forth Word 01 =

DB %01,%3D
DB %0F,%00

rst %10				;	.data:000016cf	d7	
ex de,hl			;	.data:000016d0	eb	
rst %10				;	.data:000016d1	d7	
call %1676			;	.data:000016d2	cd	76 16
jr z,%16bd			;	.data:000016d5	28	e6
or a				;	.data:000016d7	b7	
jr %16bc			;	.data:000016d8	18	e2


; Forth Word 02 C=

DB %02,%43,%3D
DB %0B,%00

rst %10				;	.data:000016df	d7	
ld a,l				;	.data:000016e0	7d	
rst %10				;	.data:000016e1	d7	
cp l				;	.data:000016e2	bd	
jr %16d5			;	.data:000016e3	18	f0


; Forth Word 01 ?

DB %01,%3F
DB %0A,%00
	
call %0eeb			;	.data:000016e9	cd	eb 0e
jp %0e7b			;	.data:000016ec	c3	7b 0e
	;		
	;

; Forth Word 02 +!

DB %02,%2B, %21
DB %12,%00

rst %10				;	.data:000016f4	d7	
push hl				;	.data:000016f5	e5	
ld e,(hl)			;	.data:000016f6	5e	
inc hl				;	.data:000016f7	23	
ld d,(hl)			;	.data:000016f8	56	
rst %10				;	.data:000016f9	d7	
add hl,de			;	.data:000016fa	19	
ex de,hl			;	.data:000016fb	eb	
pop hl				;	.data:000016fc	e1	
ld (hl),e			;	.data:000016fd	73	
inc hl				;	.data:000016fe	23	
ld (hl),d			;	.data:000016ff	72	
ret					;	.data:00001700	c9


; Forth Word 02 +-

DB %02,%2B, %2d
DB %14,%00	
	
rst %10				;	.data:00001706	d7	
bit 7,h				;	.data:00001707	cb	7c
push af				;	.data:00001709	f5	
rst %10				;	.data:0000170a	d7	
call %0b19			;	.data:0000170b	cd	19 0b
pop af				;	.data:0000170e	f1	
ret z				;	.data:0000170f	c8	
call %0b1e			;	.data:00001710	cd	1e 0b
rst %08				;	.data:00001713	cf	
ret					;	.data:00001714	c9



; Forth Word 01 ,

DB %01,%2C
DB %08,%00
	
rst %10				;	.data:00001719	d7	
jp %07c4			;	.data:0000171a	c3	c4 07
	;		

; Forth Word 02 C,

DB %02,%43, %2C
DB %0A,%00	
	
rst %10			;	.data:00001722	d7	
ld a,l			;	.data:00001723	7d	
jp %07b9		;	.data:00001724	c3	b9 07


; Forth Word 03 SP@

DB %03,%53,%50,%40
DB %0B,%00
	
push iy			;	.data:0000172d	fd	e5
pop hl			;	.data:0000172f	e1	
rst %08			;	.data:00001730	cf	
ret				;	.data:00001731	c9	



; Forth Word  05 VLIST

DB %05,%56,%4c,%49,%53,%54
DB %1F,%00
	
ld hl,(%fc88)	;	.data:0000173a	2a	88 fc
ld de,%0008		;	.data:0000173d	11	08 00
call %0637		;	.data:00001740	cd	37 06
call %1758		;	.data:00001743	cd	58 17
call %0795		;	.data:00001746	cd	95 07
call %0652		;	.data:00001749	cd	52 06
xor a			;	.data:0000174c	af	
cp h			;	.data:0000174d	bc	
jr nz,%1740		;	.data:0000174e	20	f0
ret				;	.data:00001750	c9	



; Forth Word 02 W>

DB %02,%57, %3E
DB %20,%00		

rst %10			;	.data:00001756	d7	
ex de,hl		;	.data:00001757	eb	
push hl			;	.data:00001758	e5	
push de			;	.data:00001759	d5	
rst %10			;	.data:0000175a	d7	
call %1676		;	.data:0000175b	cd	76 16
jr nc,%176e		;	.data:0000175e	30	0e
ex de,hl		;	.data:00001760	eb	
rst %08			;	.data:00001761	cf	
ccf				;	.data:00001762	3f	
sbc hl,de		;	.data:00001763	ed	52
ld a,%20		;	.data:00001765	3e	20
rst %18			;	.data:00001767	df	
dec l			;	.data:00001768	2d	
jr nz,%1767		;	.data:00001769	20	fc
pop de			;	.data:0000176b	d1	
pop hl			;	.data:0000176c	e1	
ret				;	.data:0000176d	c9	
	;		
	;		
rst %08			;	.data:0000176e	cf	
jr %176b		;	.data:0000176f	18	fa



; Forth Word 03 IMM

DB %83,%49,%4D,%4D
DB %0C,%00		
	
ld hl,(%fc8e)	;	.data:00001777	2a	8e fc
set 7,(hl)		;	.data:0000177a	cb	fe
ret				;	.data:0000177c	c9


; Forth Word 07 INTEGER

DB %07,%49,%4E,%54,%45,%47,%45,%52
DB %38,%00

call %0866		;	.data:00001787	cd	66 08
ld hl,%1797		;	.data:0000178a	21	97 17
call %07d3		;	.data:0000178d	cd	d3 07
rst %10			;	.data:00001790	d7	
call %07c4		;	.data:00001791	cd	c4 07
jp %1777		;	.data:00001794	c3	77 17
ld hl,%fca5		;	.data:00001797	21	a5 fc
bit 5,(hl)		;	.data:0000179a	cb	6e
res 5,(hl)		;	.data:0000179c	cb	ae
pop hl			;	.data:0000179e	e1	
jr z,%17ab		;	.data:0000179f	28	0a
ld a,%d7		;	.data:000017a1	3e	d7
call %07b9		;	.data:000017a3	cd	b9 07
ld a,%22		;	.data:000017a6	3e	22
jp %07d5		;	.data:000017a8	c3	d5 07
ld a,%2a		;	.data:000017ab	3e	2a
call %07d5		;	.data:000017ad	cd	d5 07
ld a,%cf		;	.data:000017b0	3e	cf
jp %07b9		;	.data:000017b2	c3	b9 07



; Forth Word 02 TO

DB %82,%55, %4F
DB %0B,%00
	
ld hl,%fca5		;	.data:000017ba	21	a5 fc
set 5,(hl)		;	.data:000017bd	cb	ee
ret				;	.data:000017bf	c9


; Forth Word 05 BEGIN

DB %85,%42,%45,%47,%49,%4E
DB %0F, %00
	
ld hl,(%fc8a)	;	.data:000017c8	2a	8a fc
push hl			;	.data:000017cb	e5	
call %0881		;	.data:000017cc	cd	81 08


; Forth Word 05 AGAIN

DB %85,%41,%47,%49,%49,%4E
DB %0F, %00
	
pop hl			;	.data:000017d7	e1	
pop hl			;	.data:000017d8	e1	
pop hl			;	.data:000017d9	e1	
pop hl			;	.data:000017da	e1	
jp %07cf		;	.data:000017db	c3	cf 07


; Forth Word 05 WHILE

DB %85,%57,%48,%49,%4C,%45
DB %1E,%00

pop de			;	.data:000017e6	d1	
pop hl			;	.data:000017e7	e1	
pop hl			;	.data:000017e8	e1	
ld hl,%182b		;	.data:000017e9	21	2b 18
call %07d3		;	.data:000017ec	cd	d3 07
ld hl,(%fc8a)	;	.data:000017ef	2a	8a fc
ld a,%c2		;	.data:000017f2	3e	c2
call %07d5		;	.data:000017f4	cd	d5 07
inc hl			;	.data:000017f7	23	
push hl			;	.data:000017f8	e5	
push hl			;	.data:000017f9	e5	
ex de,hl		;	.data:000017fa	eb	
jp (hl)			;	.data:000017fb	e9	


; Forth Word  06 REPEAT	

DB %86,%52,%45,%50,%45,%41,%54
DB %18,%00

pop hl			;	.data:00001805	e1	
pop hl			;	.data:00001806	e1	
pop de			;	.data:00001807	d1	
pop hl			;	.data:00001808	e1	
call %07cf		;	.data:00001809	cd	cf 07
ld hl,(%fc8a)	;	.data:0000180c	2a	8a fc
ex de,hl		;	.data:0000180f	eb	
ld (hl),e		;	.data:00001810	73	
inc hl			;	.data:00001811	23	
ld (hl),d		;	.data:00001812	72	
ret				;	.data:00001813	c9


; Forth Word 05 UNTIL

DB %85,%55,%4E,%54,%49,%4C
DB %1D,%00	
	
pop hl			;	.data:0000181c	e1	
pop hl			;	.data:0000181d	e1	
pop hl			;	.data:0000181e	e1	
ld hl,%182b		;	.data:0000181f	21	2b 18
call %07d3		;	.data:00001822	cd	d3 07
pop hl			;	.data:00001825	e1	
ld a,%ca		;	.data:00001826	3e	ca
jp %07d5		;	.data:00001828	c3	d5 07
rst %10			;	.data:0000182b	d7	
xor a			;	.data:0000182c	af	
cp l			;	.data:0000182d	bd	
ret nz			;	.data:0000182e	c0	
cp h			;	.data:0000182f	bc	
ret				;	.data:00001830	c9


; Forth Word 03 KEY

DB %03,%4B,%45,%59
DB %19,%00
	
ld a,%1f		;	.data:00001837	3e	1f
call %0493		;	.data:00001839	cd	93 04
call %0621		;	.data:0000183c	cd	21 06
and %7f			;	.data:0000183f	e6	7f
cp %1f			;	.data:00001841	fe	1f
jr z,%1837		;	.data:00001843	28	f2
ld h,%00		;	.data:00001845	26	0
ld l,a			;	.data:00001847	6f	
rst %08			;	.data:00001848	cf	
ret				;	.data:00001849	c9



	;		
; Forth Word 01 (

DB %81,%28
DB %0E,%00
	
call %14c5		;	.data:0000184e	cd	c5 14
and %7f			;	.data:00001851	e6	7f
cp %29			;	.data:00001853	fe	29
jr nz,%184e		;	.data:00001855	20	f7
ret				;	.data:00001857	c9	


; Forth Word 02 0< 

DB %02,%30,%3C
DB %0B,%00	
	
rst %10			;	.data:0000185d	d7	
rlc h			;	.data:0000185e	cb	4
jp %16bc		;	.data:00001860	c3	bc 16

; Forth Word 02 0> 

DB %02,%30,%3E
DB %0B,%00			

rst %10			;	.data:00001868	d7	
rlc h			;	.data:00001869	cb	4
jp %16bd		;	.data:0000186b	c3	bd 16


; Forth Word 02 0=

DB %02,%30,%3D
DB %0D,%00	
	
rst %10			;	.data:00001873	d7	
xor a			;	.data:00001874	af	
cp l			;	.data:00001875	bd	
jr c,%186b		;	.data:00001876	38	f3
cp h			;	.data:00001878	bc	
jr %186b		;	.data:00001879	18	f0


; Forth Word 02 2*

DB %02,%32,%2A
DB %09,%00		
	
rst %10			;	.data:00001880	d7	
add hl,hl			;	.data:00001881	29	
rst %08			;	.data:00001882	cf	
ret			;	.data:00001883	c9	


; Forth Word 02 2/

DB %02,%32,%2F
DB %0C,%00
	
rst %10			;	.data:00001889	d7	
sra h			;	.data:0000188a	cb	2c
rr l			;	.data:0000188c	cb	1d
rst %08			;	.data:0000188e	cf	
ret				;	.data:0000188f	c9	


; Forth Word 02 W!

DB %02,%57,%21
DB %09,%00

rst %10			;	.data:00001895	d7	
jp %0687		;	.data:00001896	c3	87 06




; Forth Word 04 EOFF

DB %04,%45,%4F,%46,%46
DB %16,%00					

ld hl,%fcad		;	.data:000018a0	21	ad fc
res 6,(hl)		;	.data:000018a3	cb	b6
ld l,%b9		;	.data:000018a5	2e	b9
ld a,(hl)		;	.data:000018a7	7e	
ld (hl),%00		;	.data:000018a8	36	0
ld l,%b7		;	.data:000018aa	2e	b7
add a,(hl)		;	.data:000018ac	86	
ld (hl),a		;	.data:000018ad	77	
ret				;	.data:000018ae	c9	



; Forth Word 04 BASE

DB %84,%42,%41,%53,%45
DB %0E,%00

ld hl,%fc86		;	.data:000018b6	21	86 fc
push hl			;	.data:000018b9	e5	
jp %1797		;	.data:000018ba	c3	97 17




; Forth Word 07 DECIMAL

DB %07,%44,%45,%43,%49,%4D,%41,%4C
DB %10,%00

ld hl,%fc86		;	.data:000018c7	21	86 fc
ld (hl),%0a		;	.data:000018ca	36	0a
ret				;	.data:000018cc	c9


; Forth Word 04 BACK

DB %04,%42,%41,%43,%4B
DB %0E,%00

call %06e3		;	.data:000018d4	cd	e3 06
ld (%fc7c),hl	;	.data:000018d7	22	7c fc
ret				;	.data:000018da	c9	


; Forth Word 03 MEM

DB %03,%4D,%45,%4D
DB %3D,%00

call %18e6		;	.data:000018e1	cd	e6 18
rst %08			;	.data:000018e4	cf	
ret				;	.data:000018e5	c9	
	;		
	;		
ld hl,(%fc8a)	;	.data:000018e6	2a	8a fc
ex de,hl		;	.data:000018e9	eb	
ld hl,(%fc56)	;	.data:000018ea	2a	56 fc
push iy			;	.data:000018ed	fd	e5
or a			;	.data:000018ef	b7	
sbc hl,de		;	.data:000018f0	ed	52
pop de			;	.data:000018f2	d1	
add hl,de		;	.data:000018f3	19	
ex de,hl		;	.data:000018f4	eb	
ld hl,(%fc6c)	;	.data:000018f5	2a	6c fc
add hl,de		;	.data:000018f8	19	
ret				;	.data:000018f9	c9	
	;		
	;		
ld hl,%fca5		;	.data:000018fa	21	a5 fc
bit 3,(hl)		;	.data:000018fd	cb	5e
ret nz			;	.data:000018ff	c0	
call %18e6		;	.data:00001900	cd	e6 18
ld de,%ffe0		;	.data:00001903	11	e0 ff
add hl,de		;	.data:00001906	19	
ex de,hl		;	.data:00001907	eb	
ld hl,(%fc56)	;	.data:00001908	2a	56 fc
sbc hl,de		;	.data:0000190b	ed	52
ret nc			;	.data:0000190d	d0	
ld hl,%fca5		;	.data:0000190e	21	a5 fc
set 3,(hl)		;	.data:00001911	cb	de
ld a,%4d		;	.data:00001913	3e	4d
jp %06c9		;	.data:00001915	c3	c9 06


; Forth Word 05 FENCE

DB %05,%46,%45,%4E,%43,%45
DB %1E,%00

call %1927		;	.data:00001920	cd	27 19
ld (%fc72),hl	;	.data:00001923	22	72 fc
ret				;	.data:00001926	c9	
	;		
	;		
call %0782		;	.data:00001927	cd	82 07
push af			;	.data:0000192a	f5	
call %0d6b		;	.data:0000192b	cd	6b 0d
pop af			;	.data:0000192e	f1	
ret nc			;	.data:0000192f	d0	
pop hl			;	.data:00001930	e1	
ld a,%55		;	.data:00001931	3e	55
jp %06c9		;	.data:00001933	c3	c9 06


; Forth Word 06 FORGET

DB %06,%4F,%52,%47,%45,%54,%4B
DB %3E,%00
	
call %1927			;	.data:0000193f	cd	27 19
ex de,hl			;	.data:00001942	eb	
ld hl,(%fc72)		;	.data:00001943	2a	72 fc
call %12a2			;	.data:00001946	cd	a2 12
ld a,%46			;	.data:00001949	3e	46
jp nc,%06c9			;	.data:0000194b	d2	c9 06
ld hl,(%fc7c)		;	.data:0000194e	2a	7c fc
call %12a2			;	.data:00001951	cd	a2 12
jr c,%195c			;	.data:00001954	38	6
ld hl,%19b4			;	.data:00001956	21	b4 19
ld (%fc7c),hl		;	.data:00001959	22	7c fc
ld hl,(%fc70)		;	.data:0000195c	2a	70 fc
push hl				;	.data:0000195f	e5	
pop bc				;	.data:00001960	c1	
ld (%fc92),hl		;	.data:00001961	22	92 fc
ld a,(hl)			;	.data:00001964	7e	
inc hl				;	.data:00001965	23	
ld h,(hl)			;	.data:00001966	66	
ld l,a				;	.data:00001967	6f	
or h				;	.data:00001968	b4	
jr z,%1974			;	.data:00001969	28	9
call %12a2			;	.data:0000196b	cd	a2 12
jr c,%195f			;	.data:0000196e	38	ef
xor a				;	.data:00001970	af	
ld (bc),a			;	.data:00001971	2	
inc bc				;	.data:00001972	3	
ld (bc),a			;	.data:00001973	2	
ex de,hl			;	.data:00001974	eb	
ld (%fc8e),hl		;	.data:00001975	22	8e fc
call %0795			;	.data:00001978	cd	95 07
ld (%fc8c),hl		;	.data:0000197b	22	8c fc
jp %0765			;	.data:0000197e	c3	65 07
	;		
	;


; Forth Word 04 TOFF

DB %04,%54,%4F,%46,%46
DB %0D,%00
	
ld hl,%fca5		;	.data:00001988	21	a5 fc
res 6,(hl)		;	.data:0000198b	cb	b6
ret				;	.data:0000198d	c9	
	;		
	;

; Forth Word 03 TON

DB %03,%54,%4F,%4E
DB %0C,%00
	
ld hl,%fca5		;	.data:00001994	21	a5 fc
set 6,(hl)		;	.data:00001997	cb	f6
ret				;	.data:00001999	c9	
	;		
	;


; Forth Word 04 WARM

DB %04,%57,%41,%52,%4D
DB %0A,%00
	
jp %099a		;	.data:000019a1	c3	9a 09


; Forth Word 04 COLD

DB %04,%43,%4F,%4C,%44
DB %0A,%00

jp %0953			;	.data:000019ab	c3	53 09



; Forth Word 03 NUL

DB %03,%4E,%55,%4C
DB %07,%00		
ret			;	.data:000019b4	c9	


; Forth Word 04 HERE

DB %04,%48,%45,%52,%45
DB %0C,%00
	
ld hl,(%fc8a)	;	.data:000019bc	2a	8a fc
rst %08			;	.data:000019bf	cf	
ret				;	.data:000019c0	c9


; Forth Word 01 H

DB %01,%48
DB %09,%00			
	
ld hl,%fc8a		;	.data:000019c5	21	8a fc
rst %08			;	.data:000019c8	cf	
ret				;	.data:000019c9	c9


; Forth Word 01 T

DB %01,%54
DB %09,%00	
	
ld hl,%fc88		;	.data:000019ce	21	88 fc
rst %08			;	.data:000019d1	cf	
ret				;	.data:000019d2	c9	
	

; Forth Word 02 S@

DB %02,%53, %40
DB %08,%00	
	
jp %06f1			;	.data:000019d8	c3	f1 06


; Forth Word 02 >#

DB %02,%3e, %23
DB %0B,%00	
	
call %0a36			;	.data:000019e0	cd	36 0a
jp %16bd			;	.data:000019e3	c3	bd 16


; Forth Word 03 .CO

DB %03,%2e,%43,%4F
DB %12,%00	
	
rst %10			;	.data:000019ec	d7	
xor a			;	.data:000019ed	af	
or l			;	.data:000019ee	b5	
ret z			;	.data:000019ef	c8	
rst %20			;	.data:000019f0	e7	
call %08f8		;	.data:000019f1	cd	f8 08
dec l			;	.data:000019f4	2d	
jr nz,%19f0		;	.data:000019f5	20	f9
ret				;	.data:000019f7	c9	


; Forth Word 04 .CPU

DB %04,%2E,%43,%50,%55
DB %0D,%00	
	
ld hl,%1d6e			;	.data:000019ff	21	6e 1d
jp %0665			;	.data:00001a02	c3	65 06


; Forth Word 02 U*

DB %02,%55,%2A
DB %0E,%00			

call %0b9b			;	.data:00001a0a	cd	9b 0b
call %0b3e			;	.data:00001a0d	cd	3e 0b
jp %0b39			;	.data:00001a10	c3	39 0b



; Forth Word 05 U/MOD

DB %05,%55,%2F,%4D,%4F,%44
DB %14,%00		
	
rst %10			;	.data:00001a1b	d7	
push hl			;	.data:00001a1c	e5	
pop bc			;	.data:00001a1d	c1	
call %0b9b		;	.data:00001a1e	cd	9b 0b
call %0ba0		;	.data:00001a21	cd	a0 0b
jp %0b39		;	.data:00001a24	c3	39 0b


; Forth Word 04 UMOD

DB %04,%55,%4D,%4F,%44
DB %0F,%00
	
call %1a1b		;	.data:00001a2e	cd	1b 1a
call %0e41		;	.data:00001a31	cd	41 0e
rst %10			;	.data:00001a34	d7	
ret				;	.data:00001a35	c9	

; Forth Word 02 U<

DB %02,%55,%3C
DB %0E,%00	

call %0b9b		;	.data:00001a3b	cd	9b 0b
or a			;	.data:00001a3e	b7	
sbc hl,de		;	.data:00001a3f	ed	52
jp %16bd		;	.data:00001a41	c3	bd 16


; Forth Word 03 MIN

DB %03,%4D,%49,%4E
DB %11,%00		
	
call %0b9b		;	.data:00001a4a	cd	9b 0b
sbc a,e			;	.data:00001a4b	9b	
dec bc			;	.data:00001a4c	0b	
call %1676		;	.data:00001a4d	cd	76 16
jr c,%1a53		;	.data:00001a50	38	1
ex de,hl		;	.data:00001a52	eb	
rst %08			;	.data:00001a53	cf	
ret				;	.data:00001a54	c9	


; Forth Word 03 MAX

DB %03,%4D,%41,%58
DB %0f,%00
	
call %0b9b			;	.data:00001a5b	cd	9b 0b
call %1676			;	.data:00001a5e	cd	76 16
ccf					;	.data:00001a61	3f	
jr %1a50			;	.data:00001a62	18	ec


; Forth Word 03 PAD

DB %03,%50,%41,%44
DB %0b,%00
	
ld hl,%fbc0			;	.data:00001a6a	21	c0 fb
rst %08				;	.data:00001a6d	cf	
ret					;	.data:00001a6e	c9	
	


; Forth Word 02 U#

DB %03,%55,%23
DB %10,%00

rst %10				;	.data:00001a74	d7	
ld de,%0000			;	.data:00001a75	11	00 00
ex de,hl			;	.data:00001a78	eb	
rst %08				;	.data:00001a79	cf	
ex de,hl			;	.data:00001a7a	eb	
rst %08				;	.data:00001a7b	cf	
jp %0a96			;	.data:00001a7c	c3	96 0a

; Forth Word 02 U.

DB %03,%55,%2E
DB %0B,%00
	
call %1a74			;	.data:00001a84	cd	74 1a
jp %0652			;	.data:00001a87	c3	52 06
	

; Forth Word 02 D=

DB %03,%44,%3D
DB %13,%00
	
call %12c0		;	.data:00001a8f	cd	c0 12
rst %10			;	.data:00001a92	d7	
rst %10			;	.data:00001a93	d7	
rst %10			;	.data:00001a94	d7	
rst %10			;	.data:00001a95	d7	
scf				;	.data:00001a96	37	
jr nz,%1a9a		;	.data:00001a97	20	1
ccf				;	.data:00001a99	3f	
jp %16bd		;	.data:00001a9a	c3	bd 16
	

; Forth Word 02 D0

DB %03,%44,%30
DB %0E,%00

call %0b9b		;	.data:00001aa3	cd	9b 0b
call %0d93		;	.data:00001aa6	cd	93 0d
jr %1a96		;	.data:00001aa9	18	eb


; Forth Word 04 DMIN

DB %04,%44,%4D,%49,%4E
DB %10,%00

call %12c0		;	.data:00001ab2	cd	c0 12
call nc,%0da3	;	.data:00001ab5	d4	a3 0d
rst %10			;	.data:00001ab8	d7	
rst %10			;	.data:00001ab9	d7	
ret				;	.data:00001aba	c9	



; Forth Word 04 DMAX

DB %04,%44,%4D,%41,%58
DB %10,%00

call %12c0		;	.data:00001ac2	cd	c0 12
call c,%0da3	;	.data:00001ac5	dc	a3 0d
rst %10			;	.data:00001ac8	d7	
rst %10			;	.data:00001ac9	d7	
ret				;	.data:00001aca	c9	




; Forth Word 02 W=

DB %03,%57,%3D
DB %0A,%00
	
call %069d			;	.data:00001ad0	cd	9d 06
jr %1a96			;	.data:00001ad3	18	c1



; Forth Word 02 S=

DB %03,%53,%3D
DB %0B,%00		
	
rst %10				;	.data:00001ada	d7	
call %06a7			;	.data:00001adb	cd	a7 06
jr %1a96			;	.data:00001ade	18	b6
	


; Forth Word 04 TIME

DB %04,%54,%49,%4D,%45
DB %0C,%00
	
ld hl,%fc5c		;	.data:00001ae7	21	5c fc
rst %08			;	.data:00001aea	cf	
ret				;	.data:00001aeb	c9	
	

; Forth Word 03 PER

DB %03,%50,%45,%52
DB %0B,%00
	
ld hl,%fc68		;	.data:00001af2	21	68 fc
rst %08			;	.data:00001af5	cf	
ret				;	.data:00001af6	c9	
	

; Forth Word 04 +ORG

DB %04,%2B,%4F,%52,%47
DB %0E,%00

ld de,%fc50		;	.data:00001afe	11	50 fc
rst %10			;	.data:00001b01	d7	
add hl,de		;	.data:00001b02	19	
rst %08			;	.data:00001b03	cf	
ret				;	.data:00001b04	c9


; Forth Word 03 BLK

DB %83,%42,%4c,%4b
DB %0D,%00	
	
ld hl,%fc76		;	.data:00001b0b	21	76 fc
push hl			;	.data:00001b0e	e5	
jp %1797		;	.data:00001b0f	c3	97 17


; Forth Word 04 PAGE

DB %84,%50,%41,%47,%45
DB %0C,%00
	
ld hl,%fc52		;	.data:00001b19	21	52 fc
jr %1b0e		;	.data:00001b1c	18	f0


; Forth Word 03 [_]

DB %83,%5B,%5F,%5D
DB %0C,%00
	
call %06e3			;	.data:00001b24	cd	e3 06
jp %07d3			;	.data:00001b27	c3	d3 07


; Forth Word 03 H>A

DB %03,%48,%3E,%41
DB %10,%00

rst %10			;	.data:00001b30	d7	
ld a,l			;	.data:00001b31	7d	
call %091e		;	.data:00001b32	cd	1e 09
ld h,%00		;	.data:00001b35	26	0
ld l,a			;	.data:00001b37	6f	
rst %08			;	.data:00001b38	cf	
ret				;	.data:00001b39	c9	



; Forth Word 03 A>H

DB %03,%41,%3E,%48
DB %10,%00

rst %10			;	.data:00001b40	d7	
ld a,l			;	.data:00001b41	7d	
call %0677		;	.data:00001b42	cd	77 06
ld h,%00		;	.data:00001b45	26	0
ld l,a			;	.data:00001b47	6f	
rst %08			;	.data:00001b48	cf	
ret				;	.data:00001b49	c9	


; Forth Word 04 HEAD

DB %04,%48,%45,%41,%44
DB %0A,%00
	
jp %0866			;	.data:00001b51	c3	66 08


; Forth Word 04 INIT

DB %04,%49,%4E,%49,%54
DB %13,%00

call %06e3			;	.data:00001b5b	cd	e3 06
ld (%2002),hl		;	.data:00001b5e	22	02 20
ld hl,%2000			;	.data:00001b61	21	00 20
ld (hl),%a4			;	.data:00001b64	36	a4
ret					;	.data:00001b66	c9


; Forth Word 06 UPDATE

DB %06,%55,%50,%44,%41,%54,%45
DB %1C,%00		
	
ld hl,(%fc8a)		;	.data:00001b70	2a	8a fc
ld (%2006),hl		;	.data:00001b73	22	06 20
ld hl,(%fc88)		;	.data:00001b76	2a	88 fc
ld (%2004),hl		;	.data:00001b79	22	04 20
ld hl,(%fc98)		;	.data:00001b7c	2a	98 fc
ld (%2008),hl		;	.data:00001b7f	22	08 20
ret					;	.data:00001b82	c9


; Forth Word 04 PAGE

DB %84,%46,%42,%55,%46
DB %0D,%00
	
ld hl,%fc6e			;	.data:00001b8a	21	6e fc
jp %1b0e			;	.data:00001b8d	c3	0e 1b


; Forth Word 04 PASS

DB %04,%50,%41,%53,%53
DB %0A,%00
	
jp %09a9			;	.data:00001b97	c3	a9 09


; Forth Word 04 OVER

DB %04,%4F,%56,%45,%52
DB %10,%00

rst %10			;	.data:00001ba1	d7	
ex de,hl		;	.data:00001ba2	eb	
rst %10			;	.data:00001ba3	d7	
rst %08			;	.data:00001ba4	cf	
ex de,hl		;	.data:00001ba5	eb	
rst %08			;	.data:00001ba6	cf	
ex de,hl		;	.data:00001ba7	eb	
rst %08			;	.data:00001ba8	cf	
ret				;	.data:00001ba9	c9	


; Forth Word 05 PRINT	

DB %05,%50,%52,%40,%4E,%54
DB %0F,%00
	
call %06e3		;	.data:00001bb2	cd	e3 06
ld (%fc74),hl	;	.data:00001bb5	22	74 fc
ret				;	.data:00001bb8	c9	


; Forth Word 01 P	

DB %01,%50
DB %0f,%00
	
ld hl,%fcbe		;	.data:00001bbd	21	be fc
bit 0,(hl)		;	.data:00001bc0	cb	46
res 0,(hl)		;	.data:00001bc2	cb	86
ret nz			;	.data:00001bc4	c0	
set 0,(hl)		;	.data:00001bc5	cb	c6
ret				;	.data:00001bc7	c9	



; Forth Word 04 PRTR

DB %04,%50,%52,%54,%52
DB %3C,%00
	
push hl			;	.data:00001bcf	e5	
rst %10			;	.data:00001bd0	d7	
ld a,l			;	.data:00001bd1	7d	
ld hl,%fbc0		;	.data:00001bd2	21	c0 fb
and %7f			;	.data:00001bd5	e6	7f
cp %60			;	.data:00001bd7	fe	60
jr c,%1bdd		;	.data:00001bd9	38	2
add a,%e0		;	.data:00001bdb	c6	e0
cp %20			;	.data:00001bdd	fe	20
jr nc,%1bf6		;	.data:00001bdf	30	15
cp %08			;	.data:00001be1	fe	8
jr nz,%1bec		;	.data:00001be3	20	7
xor a			;	.data:00001be5	af	
or (hl)			;	.data:00001be6	b6	
jr z,%1bea		;	.data:00001be7	28	1
dec (hl)		;	.data:00001be9	35	
pop hl			;	.data:00001bea	e1	
ret				;	.data:00001beb	c9	
	;		
	;		
cp %0d			;	.data:00001bec	fe	0d
jr z,%1bea		;	.data:00001bee	28	fa
cp %0a			;	.data:00001bf0	fe	0a
ld a,%2e		;	.data:00001bf2	3e	2e
jr z,%1bfd		;	.data:00001bf4	28	7
call %0737		;	.data:00001bf6	cd	37 07
bit 5,(hl)		;	.data:00001bf9	cb	6e
jr z,%1c02		;	.data:00001bfb	28	5
call %1c09		;	.data:00001bfd	cd	09 1c
ld (hl),%00		;	.data:00001c00	36	0
pop hl			;	.data:00001c02	e1	
ret				;	.data:00001c03	c9	


; Forth Word 02 .P

DB %02,%2e,%50
DB %8C,%00
	
xor a			;	.data:00001c09	af	
out (%fd),a		;	.data:00001c0a	d3	fd
out (%fb),a		;	.data:00001c0c	d3	fb
push de			;	.data:00001c0e	d5	
push hl			;	.data:00001c0f	e5	
ld hl,%fbc0		;	.data:00001c10	21	c0 fb
ld a,%1f		;	.data:00001c13	3e	1f
sub (hl)		;	.data:00001c15	96	
jr c,%1c26		;	.data:00001c16	38	0e
push hl			;	.data:00001c18	e5	
inc a			;	.data:00001c19	3c	
ld e,a			;	.data:00001c1a	5f	
ld a,(hl)		;	.data:00001c1b	7e	
inc hl			;	.data:00001c1c	23	
add a,l			;	.data:00001c1d	85	
ld l,a			;	.data:00001c1e	6f	
ld (hl),%20		;	.data:00001c1f	36	20
inc hl			;	.data:00001c21	23	
dec e			;	.data:00001c22	1d	
jr nz,%1c1f		;	.data:00001c23	20	fa
pop hl			;	.data:00001c25	e1	
inc hl			;	.data:00001c26	23	
ex de,hl		;	.data:00001c27	eb	
ld hl,(%fc90)	;	.data:00001c28	2a	90 fc
call %1c37		;	.data:00001c2b	cd	37 1c
pop hl			;	.data:00001c2e	e1	
pop de			;	.data:00001c2f	d1	
ld a,%04		;	.data:00001c30	3e	4
out (%fb),a		;	.data:00001c32	d3	fb
out (%fe),a		;	.data:00001c34	d3	fe
ret				;	.data:00001c36	c9	
	;		
	;		
push bc			;	.data:00001c37	c5	
ld c,%00		;	.data:00001c38	0e	0
push de			;	.data:00001c3a	d5	
push hl			;	.data:00001c3b	e5	
ld b,%20		;	.data:00001c3c	6	20
push hl			;	.data:00001c3e	e5	
ld h,%00		;	.data:00001c3f	26	0
ld a,(de)		;	.data:00001c41	1a	
sub %20			;	.data:00001c42	d6	20
and %3f			;	.data:00001c44	e6	3f
ld l,a			;	.data:00001c46	6f	
add hl,hl		;	.data:00001c47	29	
add hl,hl		;	.data:00001c48	29	
add hl,hl		;	.data:00001c49	29	
ld a,i			;	.data:00001c4a	ed	57
or h			;	.data:00001c4c	b4	
ld h,a			;	.data:00001c4d	67	
ld a,c			;	.data:00001c4e	79	
or l			;	.data:00001c4f	b5	
ld l,a			;	.data:00001c50	6f	
ld a,(hl)		;	.data:00001c51	7e	
pop hl			;	.data:00001c52	e1	
ld (hl),a		;	.data:00001c53	77	
inc hl			;	.data:00001c54	23	
inc de			;	.data:00001c55	13	
djnz %1c3e		;	.data:00001c56	10	e6
pop hl			;	.data:00001c58	e1	
ld a,c			;	.data:00001c59	79	
cp %06			;	.data:00001c5a	fe	6
sbc a,a			;	.data:00001c5c	9f	
inc a			;	.data:00001c5d	3c	
add a,a			;	.data:00001c5e	87	
ld e,a			;	.data:00001c5f	5f	
call %1c6b		;	.data:00001c60	cd	6b 1c
pop de			;	.data:00001c63	d1	
inc c			;	.data:00001c64	0c	
bit 3,c			;	.data:00001c65	cb	59
jr z,%1c3a		;	.data:00001c67	28	d1
pop bc			;	.data:00001c69	c1	
ret				;	.data:00001c6a	c9	
	;		
	;		
push hl			;	.data:00001c6b	e5	
push de			;	.data:00001c6c	d5	
push bc			;	.data:00001c6d	c5	
in a,(%fb)		;	.data:00001c6e	db	fb
rlca			;	.data:00001c70	7	
jr nc,%1c6e		;	.data:00001c71	30	fb
ld c,%20		;	.data:00001c73	0e	20
ld b,%08		;	.data:00001c75	6	8
ld d,(hl)		;	.data:00001c77	56	
inc hl			;	.data:00001c78	23	
in a,(%fb)		;	.data:00001c79	db	fb
rrca			;	.data:00001c7b	0f	
jr nc,%1c79		;	.data:00001c7c	30	fb
rlc d			;	.data:00001c7e	cb	2
ld a,e			;	.data:00001c80	7b	
jr nc,%1c85		;	.data:00001c81	30	2
or %80			;	.data:00001c83	f6	80
out (%fb),a		;	.data:00001c85	d3	fb
djnz %1c79		;	.data:00001c87	10	f0
dec c			;	.data:00001c89	0d	
jr nz,%1c75		;	.data:00001c8a	20	e9
pop bc			;	.data:00001c8c	c1	
pop de			;	.data:00001c8d	d1	
pop hl			;	.data:00001c8e	e1	
ret				;	.data:00001c8f	c9	
	;		
	;		
inc bc			;	.data:00001c90	3	
ld l,%43		;	.data:00001c91	2e	43
ld c,(hl)		;	.data:00001c93	4e	
add hl,bc		;	.data:00001c94	9	
nop				;	.data:00001c95	0	
jp %0652		;	.data:00001c96	c3	52 06
ld (bc),a		;	.data:00001c99	2	
ld b,h			;	.data:00001c9a	44	
ld a,%0a		;	.data:00001c9b	3e	0a
nop				;	.data:00001c9d	0	
call %0da3		;	.data:00001c9e	cd	a3 0d
jr %1ca8		;	.data:00001ca1	18	5
ld (bc),a		;	.data:00001ca3	2	
ld b,h			;   .data:00001ca4	44	
inc a			;	.data:00001ca5	3c	
ld e,l			;	.data:00001ca6	5d	
ex (sp),hl		;	.data:00001ca7	e3	
call %12c0		;	.data:00001ca8	cd	c0 12
rst %10			;	.data:00001cab	d7	
rst %10			;	.data:00001cac	d7	
rst %10			;	.data:00001cad	d7	
rst %10			;	.data:00001cae	d7	
ccf				;	.data:00001caf	3f	
jp %16bd		;	.data:00001cb0	c3	bd 16
nop				;	.data:00001cb3	0	
nop				;	.data:00001cb4	0	
nop				;	.data:00001cb5	0	
nop				;	.data:00001cb6	0	
nop				;	.data:00001cb7	0	
nop				;	.data:00001cb8	0	
nop				;	.data:00001cb9	0	
nop				;	.data:00001cba	0	
nop				;	.data:00001cbb	0	
nop				;	.data:00001cbc	0	
nop				;	.data:00001cbd	0	
nop				;	.data:00001cbe	0	
nop				;	.data:00001cbf	0	
ld d,b			;	.data:00001cc0	50	
nop				;	.data:00001cc1	0	
sub a			;	.data:00001cc2	97	
ld (bc),a		;	.data:00001cc3	2	
ld d,b			;	.data:00001cc4	50	
nop				;	.data:00001cc5	0	
ld d,b			;	.data:00001cc6	50	
nop				;	.data:00001cc7	0	
ld d,b			;	.data:00001cc8	50	
nop				;	.data:00001cc9	0	
ld d,b			;	.data:00001cca	50	
nop				;	.data:00001ccb	0	
ld d,b			;	.data:00001ccc	50	
nop				;	.data:00001ccd	0	
ld d,b			;	.data:00001cce	50	
nop				;	.data:00001ccf	0	
ex af,af'		;	.data:00001cd0	8	
inc bc			;	.data:00001cd1	3	
ex (sp),hl		;	.data:00001cd2	e3	
ld (bc),a		;	.data:00001cd3	2	
add a,%02		;	.data:00001cd4	c6	2
rst %38			;	.data:00001cd6	ff	
ld (bc),a		;	.data:00001cd7	2	
add a,e			;	.data:00001cd8	83	
ld (bc),a		;	.data:00001cd9	2	
sbc a,a			;	.data:00001cda	9f	
ld (bc),a		;	.data:00001cdb	2	
ld d,b			;	.data:00001cdc	50	
nop				;	.data:00001cdd	0	
ld d,b			;	.data:00001cde	50	
nop				;	.data:00001cdf	0	
ld d,b			;	.data:00001ce0	50	
nop				;	.data:00001ce1	0	
xor %03			;	.data:00001ce2	ee	3
dec e			;	.data:00001ce4	1d	
inc b			;	.data:00001ce5	4	
ld b,c			;	.data:00001ce6	41	
inc b			;	.data:00001ce7	4	
ld c,e			;	.data:00001ce8	4b	
inc b			;	.data:00001ce9	4	
ld d,b			;	.data:00001cea	50	
nop				;	.data:00001ceb	0	
ld d,b			;	.data:00001cec	50	
nop				;	.data:00001ced	0	
ld d,b			;	.data:00001cee	50	
nop				;	.data:00001cef	0	
ld d,b			;	.data:00001cf0	50	
nop				;	.data:00001cf1	0	
ld d,b			;	.data:00001cf2	50	
nop				;	.data:00001cf3	0	
and e			;	.data:00001cf4	a3	
inc bc			;	.data:00001cf5	3	
add a,l			;	.data:00001cf6	85	
inc bc			;	.data:00001cf7	3	
jp c,%bd03		;	.data:00001cf8	da	03 bd
inc bc			;	.data:00001cfb	3	
ld d,l			;	.data:00001cfc	55	
inc b			;	.data:00001cfd	4	
ld a,h			;	.data:00001cfe	7c	
inc b			;	.data:00001cff	4	
inc sp			;	.data:00001d00	33	
inc c			;	.data:00001d01	0c	
	;		
	;		
	DB  "ZX81-FORTH BY DAVID HUSBAND"	
	DB %0D,%0A				; CRLF	0D 0A
	DB "COPYRIGHT (C) 1983"
	DB %0D,%0A,%0A				; CRLF	0D 0A 0A
	;		

	;		
	;		
dec c			;	.data:00001d31	0d	
ld a,(bc)			;	.data:00001d32	0a	
ld a,(bc)			;	.data:00001d33	0a	
ld (bc),a			;	.data:00001d34	2	
dec c			;	.data:00001d35	0d	
ld a,(bc)			;	.data:00001d36	0a	
jr nz,%1d39			;	.data:00001d37	20	0
			

; KEYTABLE

DB  %41,%51,%31,%30,%50,%0D,%20,%5A,%53,%57
DB  %32,%39,%4F,%4C,%2E,%58,%44,%45,%33,%38
DB  %49,%4B,%4D,%43,%46,%52,%34,%37,%55,%4A
DB 	%4E,%56,%47,%54,%35,%36,%59,%48,%42,%05

DB %20,%4F,%4B							; OK
DB %0D,%0A,%07

DB %20,%45,%52,%52,%4F,%52,%20,%09   	; ERROR	
DB %0D,%0A
	
DB  %5A,%58,%2D,%5A,%38,%30,%20,%00  	; ZX-Z80


; inc c			;	.data:00001d79	0c	
; jr %1d9a		;	.data:00001d7a	18	1e
; dec de			;	.data:00001d7c	1b	
; ld (%8001),hl	;	.data:00001d7d	22	01 80
; ld a,(%2125)	;	.data:00001d80	3a	25 21
; inc d			;	.data:00001d83	14	
; inc e			;	.data:00001d84	1c	
; add hl,hl		;	.data:00001d85	29	
; dec a			;	.data:00001d86	3d	
; inc l			;	.data:00001d87	2c	
; dec sp			;	.data:00001d88	3b	
; daa				;	.data:00001d89	27	




; ld b,b			;	.data:00001d8a	40	
; ld de,%2809			;	.data:00001d8b	11	09 28
; dec hl			;	.data:00001d8e	2b	
; ld a,%3f			;	.data:00001d8f	3e	3f
; ld e,h			;	.data:00001d91	5c	
; ld e,e			;	.data:00001d92	5b	
; ld a,(de)			;	.data:00001d93	1a	
; dec bc			;	.data:00001d94	0b	
; inc h			;	.data:00001d95	24	
; dec l			;	.data:00001d96	2d	
; inc a			;	.data:00001d97	3c	
; cpl			;	.data:00001d98	2f	
; ld e,(hl)			;	.data:00001d99	5e	
; ld e,a			;	.data:00001d9a	5f	
; ex af,af'			;	.data:00001d9b	8	
; ld a,(bc)			;	.data:00001d9c	0a	
; ld e,l			;	.data:00001d9d	5d	
; inc hl			;	.data:00001d9e	23	
; ld hl,(%0000)			;	.data:00001d9f	2a	00 00
; nop			;	.data:00001da2	0	
; nop			;	.data:00001da3	0	
; rrca			;	.data:00001da4	0f	
; nop			;	.data:00001da5	0	
; nop			;	.data:00001da6	0	
; nop			;	.data:00001da7	0	
; nop			;	.data:00001da8	0	
; ld a,(de)			;	.data:00001da9	1a	
; ld c,a			;	.data:00001daa	4f	
; nop			;	.data:00001dab	0	
; nop			;	.data:00001dac	0	
; ld b,b			;	.data:00001dad	40	
; nop			;	.data:00001dae	0	
; defb %fd			;	.data:00001daf	fd	
; sbc a,b			;	.data:00001db0	98	
; call m,%2000			;	.data:00001db1	fc	00 20
; rst %08			;	.data:00001db4	cf	
; dec de			;	.data:00001db5	1b	
; nop			;	.data:00001db6	0	
; defb %fd			;	.data:00001db7	fd	
; rst %38			;	.data:00001db8	ff	
; nop			;	.data:00001db9	0	
; ld (hl),%0a			;	.data:00001dba	36	0a
; ld d,b			;	.data:00001dbc	50	
; nop			;	.data:00001dbd	0	
; add a,b			;	.data:00001dbe	80	
; add a,b			;	.data:00001dbf	80	
; sbc a,b			;	.data:00001dc0	98	
; nop			;	.data:00001dc1	0	
; ld (hl),c			;	.data:00001dc2	71	
; nop			;	.data:00001dc3	0	
; ret nz			;	.data:00001dc4	c0	
; call m,%000a			;	.data:00001dc5	fc	0a 00
; ei			;	.data:00001dc8	fb	
; ld a,(bc)			;	.data:00001dc9	0a	
; nop			;	.data:00001dca	0	
; ld b,b			;	.data:00001dcb	40	
; ei			;	.data:00001dcc	fb	
; ld a,(bc)			;	.data:00001dcd	0a	
; nop					;	.data:00001dce	0	
; ld b,b			;	.data:00001dcf	40	
; add a,b			;	.data:00001dd0	80	
; jp m,%fc98			;	.data:00001dd1	fa	98 fc
; nop			;	.data:00001dd4	0	
; nop			;	.data:00001dd5	0	
; ld (hl),%fc			;	.data:00001dd6	36	fc
; 	;		
; 	;		
; nop			;	.data:00001dd8	0	
; nop			;	.data:00001dd9	0	
; nop			;	.data:00001dda	0	
; nop			;	.data:00001ddb	0	
; nop			;	.data:00001ddc	0	
; nop			;	.data:00001ddd	0	
; 	;		
; 	;		
; pop af			;	.data:00001dde	f1	
; rst %38			;	.data:00001ddf	ff	
; rst %38			;	.data:00001de0	ff	
; rst %38			;	.data:00001de1	ff	
; nop			;	.data:00001de2	0	
; cp l			;	.data:00001de3	bd	
; inc de			;	.data:00001de4	13	
; nop			;	.data:00001de5	0	
; rst %08			;	.data:00001de6	cf	
; inc b			;	.data:00001de7	4	
; ret m			;	.data:00001de8	f8	
; ex af,af'			;	.data:00001de9	8	
; inc bc			;	.data:00001dea	3	
; nop			;	.data:00001deb	0	
; add a,b			;	.data:00001dec	80	
; add a,b			;	.data:00001ded	80	
; nop			;	.data:00001dee	0	
; nop			;	.data:00001def	0	
; nop			;	.data:00001df0	0	
; nop			;	.data:00001df1	0	
; rra			;	.data:00001df2	1f	
; rrca			;	.data:00001df3	0f	
; nop			;	.data:00001df4	0	
; nop			;	.data:00001df5	0	
; nop			;	.data:00001df6	0	
; nop			;	.data:00001df7	0	
; nop			;	.data:00001df8	0	
; nop			;	.data:00001df9	0	
; rra			;	.data:00001dfa	1f	
; rla			;	.data:00001dfb	17	
; nop			;	.data:00001dfc	0	
; nop			;	.data:00001dfd	0	
; nop			;	.data:00001dfe	0	
; rrca			;	.data:00001dff	0f	
; 	;		
; 	;		
; 	;		
; %1E00 - %1FFF  Character ROM  64 characters, 8 by 8  512 bytes table
; 			;			
; 	; 32 Space		
; nop			;	.data:00001e00	0	
; nop			;	.data:00001e01	0	
; nop			;	.data:00001e02	0	
; nop			;	.data:00001e03	0	
; nop			;	.data:00001e04	0	
; nop			;	.data:00001e05	0	
; nop			;	.data:00001e06	0	
; nop			;	.data:00001e07	0	
; nop			;	.data:00001e08	0	
; 	;		
; 	; 33 !	"	"					"	;			
; ex af,af'			;	.data:00001e09	8	
; ex af,af'			;	.data:00001e0a	8	
; ex af,af'			;	.data:00001e0b	8	
; ex af,af'			;	.data:00001e0c	8	
; nop			;	.data:00001e0d	0	
; ex af,af'			;	.data:00001e0e	8	
; nop			;	.data:00001e0f	0	
; nop			;	.data:00001e10	0	
; 	;		
; 	; 34 ""	"	"					"	;			
; ld (de),a			;	.data:00001e11	12	
; ld (de),a			;	.data:00001e12	12	
; nop			;	.data:00001e13	0	
; nop			;	.data:00001e14	0	
; nop			;	.data:00001e15	0	
; nop			;	.data:00001e16	0	
; nop			;	.data:00001e17	0	
; nop			;	.data:00001e18	0	
; 	;		
; 	; 35 #	"	"					"	;			
; inc h			;	.data:00001e19	24	
; ld a,(hl)			;	.data:00001e1a	7e	
; inc h			;	.data:00001e1b	24	
; inc h			;	.data:00001e1c	24	
; ld a,(hl)			;	.data:00001e1d	7e	
; inc h			;	.data:00001e1e	24	
; nop			;	.data:00001e1f	0	
; nop			;	.data:00001e20	0	
; 	;		
; 	; 36			"	"			"	;			
; ex af,af'			;	.data:00001e21	8	
; ld a,%48			;	.data:00001e22	3e	48
; inc a			;	.data:00001e24	3c	
; ld (de),a			;	.data:00001e25	12	
; ld a,h			;	.data:00001e26	7c	
; djnz %1e29			;	.data:00001e27	10	0
; 	;		
; 	; 37			"	"			"	;			
; ld h,d			;	.data:00001e29	62	
; ld h,h			;	.data:00001e2a	64	
; ex af,af'			;	.data:00001e2b	8	
; djnz %1e54			;	.data:00001e2c	10	26
; ld b,(hl)			;	.data:00001e2e	46	
; nop			;	.data:00001e2f	0	
; nop			;	.data:00001e30	0	
; 	;		
; 	; 38			"	"			"	;			
; jr %1e57			;	.data:00001e31	18	24
; jr %1e5d			;	.data:00001e33	18	28
; ld b,h			;	.data:00001e35	44	
; ld a,%02			;	.data:00001e36	3e	2
; nop			;	.data:00001e38	0	
; 	;		
; 	; 39			"	"			"	;			
; inc b			;	.data:00001e39	4	
; ex af,af'			;	.data:00001e3a	8	
; nop			;	.data:00001e3b	0	
; nop			;	.data:00001e3c	0	
; nop			;	.data:00001e3d	0	
; nop			;	.data:00001e3e	0	
; nop			;	.data:00001e3f	0	
; nop			;	.data:00001e40	0	
; 	;		
; 	; 40			"	"			"	;			
; inc b			;	.data:00001e41	4	
; ex af,af'			;	.data:00001e42	8	
; ex af,af'			;	.data:00001e43	8	
; ex af,af'			;	.data:00001e44	8	
; ex af,af'			;	.data:00001e45	8	
; inc b			;	.data:00001e46	4	
; nop			;	.data:00001e47	0	
; nop			;	.data:00001e48	0	
; 	;		
; 	; 41			"	"			"	;			
; jr nz,%1e5b			;	.data:00001e49	20	10
; djnz %1e5d			;	.data:00001e4b	10	10
; djnz %1e6f			;	.data:00001e4d	10	20
; nop			;	.data:00001e4f	0	
; nop			;	.data:00001e50	0	
; 	;		
; 	; 42			"	"			"	;			
; nop			;	.data:00001e51	0	
; ex af,af'			;	.data:00001e52	8	
; ld hl,(%2a1c)			;	.data:00001e53	2a	1c 2a
; ex af,af'			;	.data:00001e56	8	
; nop			;	.data:00001e57	0	
; nop			;	.data:00001e58	0	
; 	;		
; 	; 43			"	"			"	;			
; nop			;	.data:00001e59	0	
; ex af,af'			;	.data:00001e5a	8	
; ex af,af'			;	.data:00001e5b	8	
; ld a,%08			;	.data:00001e5c	3e	8
; ex af,af'			;	.data:00001e5e	8	
; nop			;	.data:00001e5f	0	
; nop			;	.data:00001e60	0	
; 	;		
; 	; 44			"	"			"	;			
; nop			;	.data:00001e61	0	
; nop			;	.data:00001e62	0	
; nop			;	.data:00001e63	0	
; ld b,%06			;	.data:00001e64	6	6
; ld (bc),a			;	.data:00001e66	2	
; nop			;	.data:00001e67	0	
; nop			;	.data:00001e68	0	
; 	;		
; 	; 45			"	"			"	;			
; nop			;	.data:00001e69	0	
; nop			;	.data:00001e6a	0	
; nop			;	.data:00001e6b	0	
; inc a			;	.data:00001e6c	3c	
; nop			;	.data:00001e6d	0	
; nop			;	.data:00001e6e	0	
; nop			;	.data:00001e6f	0	
; 	;		
; 	; 46			"	"			"	;			
; nop			;	.data:00001e70	0	
; nop			;	.data:00001e71	0	
; nop			;	.data:00001e72	0	
; nop			;	.data:00001e73	0	
; nop			;	.data:00001e74	0	
; ld b,%06			;	.data:00001e75	6	6
; nop			;	.data:00001e77	0	
; 	;		
; 	; 47			"	"			"	;			
; nop			;	.data:00001e78	0	
; inc b			;	.data:00001e79	4	
; inc b			;	.data:00001e7a	4	
; ex af,af'			;	.data:00001e7b	8	
; djnz %1e9e			;	.data:00001e7c	10	20
; jr nz,%1e80			;	.data:00001e7e	20	0
; 	;		
; 	; 48			"	"			"	;			
; nop			;	.data:00001e80	0	
; inc a			;	.data:00001e81	3c	
; ld b,(hl)			;	.data:00001e82	46	
; ld c,d			;	.data:00001e83	4a	
; ld d,d			;	.data:00001e84	52	
; ld h,d			;	.data:00001e85	62	
; inc a			;	.data:00001e86	3c	
; nop			;	.data:00001e87	0	
; 	;		
; 	;49				"	"		"	;			
; nop			;	.data:00001e88	0	
; inc b			;	.data:00001e89	4	
; inc c			;	.data:00001e8a	0c	
; inc b			;	.data:00001e8b	4	
; inc b			;	.data:00001e8c	4	
; inc b			;	.data:00001e8d	4	
; ld c,%00			;	.data:00001e8e	0e	0
; nop			;	.data:00001e90	0	
; inc a			;	.data:00001e91	3c	
; ld b,d			;	.data:00001e92	42	
; ld (bc),a			;	.data:00001e93	2	
; inc a			;	.data:00001e94	3c	
; ld b,b			;	.data:00001e95	40	
; ld a,(hl)			;	.data:00001e96	7e	
; nop			;	.data:00001e97	0	
; nop			;	.data:00001e98	0	
; inc a			;	.data:00001e99	3c	
; ld b,d			;	.data:00001e9a	42	
; inc b			;	.data:00001e9b	4	
; ld (bc),a			;	.data:00001e9c	2	
; ld b,d			;	.data:00001e9d	42	
; inc a			;	.data:00001e9e	3c	
; nop			;	.data:00001e9f	0	
; nop			;	.data:00001ea0	0	
; inc b			;	.data:00001ea1	4	
; inc c			;	.data:00001ea2	0c	
; inc d			;	.data:00001ea3	14	
; inc h			;	.data:00001ea4	24	
; ld a,(hl)			;	.data:00001ea5	7e	
; inc b			;	.data:00001ea6	4	
; nop			;	.data:00001ea7	0	
; nop			;	.data:00001ea8	0	
; ld a,(hl)			;	.data:00001ea9	7e	
; ld b,b			;	.data:00001eaa	40	
; ld a,h			;	.data:00001eab	7c	
; ld (bc),a			;	.data:00001eac	2	
; ld b,d			;	.data:00001ead	42	
; inc a			;	.data:00001eae	3c	
; nop			;	.data:00001eaf	0	
; nop			;	.data:00001eb0	0	
; inc a			;	.data:00001eb1	3c	
; ld b,b			;	.data:00001eb2	40	
; ld a,h			;	.data:00001eb3	7c	
; ld b,d			;	.data:00001eb4	42	
; ld b,d			;	.data:00001eb5	42	
; inc a			;	.data:00001eb6	3c	
; nop			;	.data:00001eb7	0	
; nop			;	.data:00001eb8	0	
; ld a,(hl)			;	.data:00001eb9	7e	
; ld (bc),a			;	.data:00001eba	2	
; inc b			;	.data:00001ebb	4	
; ex af,af'			;	.data:00001ebc	8	
; djnz %1edf			;	.data:00001ebd	10	20
; nop			;	.data:00001ebf	0	
; nop			;	.data:00001ec0	0	
; inc a			;	.data:00001ec1	3c	
; ld b,d			;	.data:00001ec2	42	
; inc a			;	.data:00001ec3	3c	
; ld b,d			;	.data:00001ec4	42	
; ld b,d			;	.data:00001ec5	42	
; inc a			;	.data:00001ec6	3c	
; nop			;	.data:00001ec7	0	
; nop			;	.data:00001ec8	0	
; inc a			;	.data:00001ec9	3c	
; ld b,d			;	.data:00001eca	42	
; ld b,d			;	.data:00001ecb	42	
; ld a,%02			;	.data:00001ecc	3e	2
; inc a			;	.data:00001ece	3c	
; nop			;	.data:00001ecf	0	
; nop			;	.data:00001ed0	0	
; ld b,%06			;	.data:00001ed1	6	6
; nop			;	.data:00001ed3	0	
; nop			;	.data:00001ed4	0	
; ld b,%06			;	.data:00001ed5	6	6
; nop			;	.data:00001ed7	0	
; nop			;	.data:00001ed8	0	
; ld b,%06			;	.data:00001ed9	6	6
; nop			;	.data:00001edb	0	
; ld b,%06			;	.data:00001edc	6	6
; ld (bc),a			;	.data:00001ede	2	
; nop			;	.data:00001edf	0	
; nop			;	.data:00001ee0	0	
; nop			;	.data:00001ee1	0	
; inc b			;	.data:00001ee2	4	
; ex af,af'			;	.data:00001ee3	8	
; djnz %1eee			;	.data:00001ee4	10	8
; inc b			;	.data:00001ee6	4	
; nop			;	.data:00001ee7	0	
; nop			;	.data:00001ee8	0	
; nop			;	.data:00001ee9	0	
; nop			;	.data:00001eea	0	
; inc a			;	.data:00001eeb	3c	
; nop			;	.data:00001eec	0	
; inc a			;	.data:00001eed	3c	
; nop			;	.data:00001eee	0	
; nop			;	.data:00001eef	0	
; nop			;	.data:00001ef0	0	
; nop			;	.data:00001ef1	0	
; djnz %1efc			;	.data:00001ef2	10	8
; inc b			;	.data:00001ef4	4	
; ex af,af'			;	.data:00001ef5	8	
; djnz %1ef8			;	.data:00001ef6	10	0
; nop			;	.data:00001ef8	0	
; inc a			;	.data:00001ef9	3c	
; ld b,d			;	.data:00001efa	42	
; ld (bc),a			;	.data:00001efb	2	
; inc c			;	.data:00001efc	0c	
; nop			;	.data:00001efd	0	
; ex af,af'			;	.data:00001efe	8	
; nop			;	.data:00001eff	0	
; nop			;	.data:00001f00	0	
; inc a			;	.data:00001f01	3c	
; ld b,d			;	.data:00001f02	42	
; ld e,h			;	.data:00001f03	5c	
; ld d,d			;	.data:00001f04	52	
; ld b,h			;	.data:00001f05	44	
; ld a,%00			;	.data:00001f06	3e	0
; nop			;	.data:00001f08	0	
; inc a			;	.data:00001f09	3c	
; ld b,d			;	.data:00001f0a	42	
; ld b,d			;	.data:00001f0b	42	
; ld a,(hl)			;	.data:00001f0c	7e	
; ld b,d			;	.data:00001f0d	42	
; ld b,d			;	.data:00001f0e	42	
; nop			;	.data:00001f0f	0	
; nop			;	.data:00001f10	0	
; ld a,h			;	.data:00001f11	7c	
; ld b,d			;	.data:00001f12	42	
; ld a,h			;	.data:00001f13	7c	
; ld b,d			;	.data:00001f14	42	
; ld b,d			;	.data:00001f15	42	
; ld a,h			;	.data:00001f16	7c	
; nop			;	.data:00001f17	0	
; nop			;	.data:00001f18	0	
; inc a			;	.data:00001f19	3c	
; ld b,d			;	.data:00001f1a	42	
; ld b,b			;	.data:00001f1b	40	
; ld b,b			;	.data:00001f1c	40	
; ld b,d			;	.data:00001f1d	42	
; inc a			;	.data:00001f1e	3c	
; nop			;	.data:00001f1f	0	
; nop			;	.data:00001f20	0	
; ld a,h			;	.data:00001f21	7c	
; ld b,d			;	.data:00001f22	42	
; ld b,d			;	.data:00001f23	42	
; ld b,d			;	.data:00001f24	42	
; ld b,d			;	.data:00001f25	42	
; ld a,h			;	.data:00001f26	7c	
; nop			;	.data:00001f27	0	
; nop			;	.data:00001f28	0	
; ld a,(hl)			;	.data:00001f29	7e	
; ld b,b			;	.data:00001f2a	40	
; ld a,h			;	.data:00001f2b	7c	
; ld b,b			;	.data:00001f2c	40	
; ld b,b			;	.data:00001f2d	40	
; ld a,(hl)			;	.data:00001f2e	7e	
; nop			;	.data:00001f2f	0	
; nop			;	.data:00001f30	0	
; ld a,(hl)			;	.data:00001f31	7e	
; ld b,b			;	.data:00001f32	40	
; ld a,h			;	.data:00001f33	7c	
; ld b,b			;	.data:00001f34	40	
; ld b,b			;	.data:00001f35	40	
; ld b,b			;	.data:00001f36	40	
; nop			;	.data:00001f37	0	
; nop			;	.data:00001f38	0	
; inc a			;	.data:00001f39	3c	
; ld b,d			;	.data:00001f3a	42	
; ld b,b			;	.data:00001f3b	40	
; ld b,(hl)			;	.data:00001f3c	46	
; ld b,d			;	.data:00001f3d	42	
; inc a			;	.data:00001f3e	3c	
; nop			;	.data:00001f3f	0	
; nop			;	.data:00001f40	0	
; ld b,d			;	.data:00001f41	42	
; ld b,d			;	.data:00001f42	42	
; ld a,(hl)			;	.data:00001f43	7e	
; ld b,d			;	.data:00001f44	42	
; ld b,d			;	.data:00001f45	42	
; ld b,d			;	.data:00001f46	42	
; nop			;	.data:00001f47	0	
; nop			;	.data:00001f48	0	
; inc e			;	.data:00001f49	1c	
; ex af,af'			;	.data:00001f4a	8	
; ex af,af'			;	.data:00001f4b	8	
; ex af,af'			;	.data:00001f4c	8	
; ex af,af'			;	.data:00001f4d	8	
; inc e			;	.data:00001f4e	1c	
; nop			;	.data:00001f4f	0	
; nop			;	.data:00001f50	0	
; ld (bc),a			;	.data:00001f51	2	
; ld (bc),a			;	.data:00001f52	2	
; ld (bc),a			;	.data:00001f53	2	
; ld (bc),a			;	.data:00001f54	2	
; ld b,d			;	.data:00001f55	42	
; inc a			;	.data:00001f56	3c	
; nop			;	.data:00001f57	0	
; nop			;	.data:00001f58	0	
; ld b,d			;	.data:00001f59	42	
; ld b,h			;	.data:00001f5a	44	
; ld a,b			;	.data:00001f5b	78	
; ld c,b			;	.data:00001f5c	48	
; ld b,h			;	.data:00001f5d	44	
; ld b,d			;	.data:00001f5e	42	
; nop			;	.data:00001f5f	0	
; nop			;	.data:00001f60	0	
; ld b,b			;	.data:00001f61	40	
; ld b,b			;	.data:00001f62	40	
; ld b,b			;	.data:00001f63	40	
; ld b,b			;	.data:00001f64	40	
; ld b,b			;	.data:00001f65	40	
; ld a,(hl)			;	.data:00001f66	7e	
; nop			;	.data:00001f67	0	
; nop			;	.data:00001f68	0	
; ld b,d			;	.data:00001f69	42	
; ld h,(hl)			;	.data:00001f6a	66	
; ld e,d			;	.data:00001f6b	5a	
; ld b,d			;	.data:00001f6c	42	
; ld b,d			;	.data:00001f6d	42	
; ld b,d			;	.data:00001f6e	42	
; nop			;	.data:00001f6f	0	
; nop			;	.data:00001f70	0	
; ld b,d			;	.data:00001f71	42	
; ld h,d			;	.data:00001f72	62	
; ld d,d			;	.data:00001f73	52	
; ld c,d			;	.data:00001f74	4a	
; ld b,(hl)			;	.data:00001f75	46	
; ld b,d			;	.data:00001f76	42	
; nop			;	.data:00001f77	0	
; nop			;	.data:00001f78	0	
; inc a			;	.data:00001f79	3c	
; ld b,d			;	.data:00001f7a	42	
; ld b,d			;	.data:00001f7b	42	
; ld b,d			;	.data:00001f7c	42	
; ld b,d			;	.data:00001f7d	42	
; inc a			;	.data:00001f7e	3c	
; nop			;	.data:00001f7f	0	
; nop			;	.data:00001f80	0	
; ld a,h			;	.data:00001f81	7c	
; ld b,d			;	.data:00001f82	42	
; ld b,d			;	.data:00001f83	42	
; ld a,h			;	.data:00001f84	7c	
; ld b,b			;	.data:00001f85	40	
; ld b,b			;	.data:00001f86	40	
; nop			;	.data:00001f87	0	
; nop			;	.data:00001f88	0	
; inc a			;	.data:00001f89	3c	
; ld b,d			;	.data:00001f8a	42	
; ld b,d			;	.data:00001f8b	42	
; ld b,d			;	.data:00001f8c	42	
; ld c,d			;	.data:00001f8d	4a	
; ld a,%00			;	.data:00001f8e	3e	0
; nop			;	.data:00001f90	0	
; ld a,h			;	.data:00001f91	7c	
; ld b,d			;	.data:00001f92	42	
; ld b,d			;	.data:00001f93	42	
; ld a,h			;	.data:00001f94	7c	
; ld b,h			;	.data:00001f95	44	
; ld b,d			;	.data:00001f96	42	
; nop			;	.data:00001f97	0	
; nop			;	.data:00001f98	0	
; inc a			;	.data:00001f99	3c	
; ld b,d			;	.data:00001f9a	42	
; jr nc,%1fa9			;	.data:00001f9b	30	0c
; ld b,d			;	.data:00001f9d	42	
; inc a			;	.data:00001f9e	3c	
; nop			;	.data:00001f9f	0	
; nop			;	.data:00001fa0	0	
; ld a,%08			;	.data:00001fa1	3e	8
; ex af,af'			;	.data:00001fa3	8	
; ex af,af'			;	.data:00001fa4	8	
; ex af,af'			;	.data:00001fa5	8	
; ex af,af'			;	.data:00001fa6	8	
; nop			;	.data:00001fa7	0	
; nop			;	.data:00001fa8	0	
; ld b,d			;	.data:00001fa9	42	
; ld b,d			;	.data:00001faa	42	
; ld b,d			;	.data:00001fab	42	
; ld b,d			;	.data:00001fac	42	
; ld b,d			;	.data:00001fad	42	
; inc a			;	.data:00001fae	3c	
; nop			;	.data:00001faf	0	
; 	;		
; 	;		
; nop			;	.data:00001fb0	0	
; ld b,d			;	.data:00001fb1	42	
; ld b,d			;	.data:00001fb2	42	
; ld b,d			;	.data:00001fb3	42	
; ld b,d			;	.data:00001fb4	42	
; inc h			;	.data:00001fb5	24	
; jr %1fb8			;	.data:00001fb6	18	0
; 	;		
; 	;		
; nop			;	.data:00001fb8	0	
; ld b,d			;	.data:00001fb9	42	
; ld b,d			;	.data:00001fba	42	
; ld b,d			;	.data:00001fbb	42	
; ld e,d			;	.data:00001fbc	5a	
; ld e,d			;	.data:00001fbd	5a	
; inc h			;	.data:00001fbe	24	
; nop			;	.data:00001fbf	0	
; 	;		
; 	;		
; nop			;	.data:00001fc0	0	
; ld b,d			;	.data:00001fc1	42	
; inc h			;	.data:00001fc2	24	
; jr %1fdd			;	.data:00001fc3	18	18
; inc h			;	.data:00001fc5	24	
; ld b,d			;	.data:00001fc6	42	
; nop			;	.data:00001fc7	0	
; 	;		
; 	;		
; nop			;	.data:00001fc8	0	
; ld b,d			;	.data:00001fc9	42	
; inc h			;	.data:00001fca	24	
; jr %1fd5			;	.data:00001fcb	18	8
; ex af,af'			;	.data:00001fcd	8	
; ex af,af'			;	.data:00001fce	8	
; nop			;	.data:00001fcf	0	
; 	;		
; 	;		
; nop			;	.data:00001fd0	0	
; ld a,(hl)			;	.data:00001fd1	7e	
; inc b			;	.data:00001fd2	4	
; ex af,af'			;	.data:00001fd3	8	
; djnz %1ff6			;	.data:00001fd4	10	20
; ld a,(hl)			;	.data:00001fd6	7e	
; nop			;	.data:00001fd7	0	
; 	;		
; 	;		
; nop			;	.data:00001fd8	0	
; inc c			;	.data:00001fd9	0c	
; ex af,af'			;	.data:00001fda	8	
; ex af,af'			;	.data:00001fdb	8	
; ex af,af'			;	.data:00001fdc	8	
; ex af,af'			;	.data:00001fdd	8	
; inc c			;	.data:00001fde	0c	
; nop			;	.data:00001fdf	0	
; 	;		
; 	;		
; nop			;	.data:00001fe0	0	
; jr nz,%2003			;	.data:00001fe1	20	20
; djnz %1fed			;	.data:00001fe3	10	8
; inc b			;	.data:00001fe5	4	
; inc b			;	.data:00001fe6	4	
; nop			;	.data:00001fe7	0	
; 	;		
; 	;		
; nop			;	.data:00001fe8	0	
; jr nc,%1ffb			;	.data:00001fe9	30	10
; djnz %1ffd			;	.data:00001feb	10	10
; djnz %201f			;	.data:00001fed	10	30
; nop			;	.data:00001fef	0	
; 	;		
; 	;		
; nop			;	.data:00001ff0	0	
; ex af,af'			;	.data:00001ff1	8	
; inc e			;	.data:00001ff2	1c	
; ex af,af'			;	.data:00001ff3	8	
; ex af,af'			;	.data:00001ff4	8	
; ex af,af'			;	.data:00001ff5	8	
; ex af,af'			;	.data:00001ff6	8	
; nop			;	.data:00001ff7	0	
; 	;		
; 	;		
; nop			;	.data:00001ff8	0	
; nop			;	.data:00001ff9	0	
; nop			;	.data:00001ffa	0	
; nop			;	.data:00001ffb	0	
; nop			;	.data:00001ffc	0	
; nop			;	.data:00001ffd	0	
; nop			;	.data:00001ffe	0	
; rst %38			;	.data:00001fff	ff	
