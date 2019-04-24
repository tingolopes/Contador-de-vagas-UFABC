   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 44 uint8_t ITC_GetCPUCC(void)
  42                     ; 45 {
  44                     	switch	.text
  45  0000               _ITC_GetCPUCC:
  49                     ; 47   _asm("push cc");
  52  0000 8a            push cc
  54                     ; 48   _asm("pop a");
  57  0001 84            pop a
  59                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  62  0002 81            	ret
  85                     ; 74 void ITC_DeInit(void)
  85                     ; 75 {
  86                     	switch	.text
  87  0003               _ITC_DeInit:
  91                     ; 76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  93  0003 35ff7f70      	mov	32624,#255
  94                     ; 77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  96  0007 35ff7f71      	mov	32625,#255
  97                     ; 78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  99  000b 35ff7f72      	mov	32626,#255
 100                     ; 79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 102  000f 35ff7f73      	mov	32627,#255
 103                     ; 80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 105  0013 35ff7f74      	mov	32628,#255
 106                     ; 81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 108  0017 35ff7f75      	mov	32629,#255
 109                     ; 82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 111  001b 35ff7f76      	mov	32630,#255
 112                     ; 83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 114  001f 35ff7f77      	mov	32631,#255
 115                     ; 84 }
 118  0023 81            	ret
 143                     ; 91 uint8_t ITC_GetSoftIntStatus(void)
 143                     ; 92 {
 144                     	switch	.text
 145  0024               _ITC_GetSoftIntStatus:
 149                     ; 93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 151  0024 adda          	call	_ITC_GetCPUCC
 153  0026 a428          	and	a,#40
 156  0028 81            	ret
 405                     .const:	section	.text
 406  0000               L22:
 407  0000 004c          	dc.w	L14
 408  0002 004c          	dc.w	L14
 409  0004 004c          	dc.w	L14
 410  0006 004c          	dc.w	L14
 411  0008 0055          	dc.w	L34
 412  000a 0055          	dc.w	L34
 413  000c 0055          	dc.w	L34
 414  000e 0055          	dc.w	L34
 415  0010 0089          	dc.w	L302
 416  0012 0089          	dc.w	L302
 417  0014 005e          	dc.w	L54
 418  0016 005e          	dc.w	L54
 419  0018 0067          	dc.w	L74
 420  001a 0067          	dc.w	L74
 421  001c 0067          	dc.w	L74
 422  001e 0067          	dc.w	L74
 423  0020 0070          	dc.w	L15
 424  0022 0070          	dc.w	L15
 425  0024 0070          	dc.w	L15
 426  0026 0070          	dc.w	L15
 427  0028 0089          	dc.w	L302
 428  002a 0089          	dc.w	L302
 429  002c 0079          	dc.w	L35
 430  002e 0079          	dc.w	L35
 431  0030 0082          	dc.w	L55
 432                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 432                     ; 102 {
 433                     	switch	.text
 434  0029               _ITC_GetSoftwarePriority:
 436  0029 88            	push	a
 437  002a 89            	pushw	x
 438       00000002      OFST:	set	2
 441                     ; 104     uint8_t Value = 0;
 443  002b 0f02          	clr	(OFST+0,sp)
 445                     ; 105     uint8_t Mask = 0;
 447                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 449                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 451  002d a403          	and	a,#3
 452  002f 48            	sll	a
 453  0030 5f            	clrw	x
 454  0031 97            	ld	xl,a
 455  0032 a603          	ld	a,#3
 456  0034 5d            	tnzw	x
 457  0035 2704          	jreq	L41
 458  0037               L61:
 459  0037 48            	sll	a
 460  0038 5a            	decw	x
 461  0039 26fc          	jrne	L61
 462  003b               L41:
 463  003b 6b01          	ld	(OFST-1,sp),a
 465                     ; 113     switch (IrqNum)
 467  003d 7b03          	ld	a,(OFST+1,sp)
 469                     ; 185     default:
 469                     ; 186         break;
 470  003f a119          	cp	a,#25
 471  0041 2407          	jruge	L02
 472  0043 5f            	clrw	x
 473  0044 97            	ld	xl,a
 474  0045 58            	sllw	x
 475  0046 de0000        	ldw	x,(L22,x)
 476  0049 fc            	jp	(x)
 477  004a               L02:
 478  004a 203d          	jra	L302
 479  004c               L14:
 480                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 480                     ; 116     case ITC_IRQ_AWU:
 480                     ; 117     case ITC_IRQ_CLK:
 480                     ; 118     case ITC_IRQ_PORTA:
 480                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 482  004c c67f70        	ld	a,32624
 483  004f 1401          	and	a,(OFST-1,sp)
 484  0051 6b02          	ld	(OFST+0,sp),a
 486                     ; 120         break;
 488  0053 2034          	jra	L302
 489  0055               L34:
 490                     ; 121     case ITC_IRQ_PORTB:
 490                     ; 122     case ITC_IRQ_PORTC:
 490                     ; 123     case ITC_IRQ_PORTD:
 490                     ; 124     case ITC_IRQ_PORTE:
 490                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 492  0055 c67f71        	ld	a,32625
 493  0058 1401          	and	a,(OFST-1,sp)
 494  005a 6b02          	ld	(OFST+0,sp),a
 496                     ; 126         break;
 498  005c 202b          	jra	L302
 499  005e               L54:
 500                     ; 136     case ITC_IRQ_SPI:
 500                     ; 137     case ITC_IRQ_TIM1_OVF:
 500                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 502  005e c67f72        	ld	a,32626
 503  0061 1401          	and	a,(OFST-1,sp)
 504  0063 6b02          	ld	(OFST+0,sp),a
 506                     ; 139         break;
 508  0065 2022          	jra	L302
 509  0067               L74:
 510                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 510                     ; 141 #ifdef STM8S903
 510                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 510                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 510                     ; 144 #else
 510                     ; 145     case ITC_IRQ_TIM2_OVF:
 510                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 510                     ; 147 #endif /*STM8S903*/
 510                     ; 148 
 510                     ; 149     case ITC_IRQ_TIM3_OVF:
 510                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 512  0067 c67f73        	ld	a,32627
 513  006a 1401          	and	a,(OFST-1,sp)
 514  006c 6b02          	ld	(OFST+0,sp),a
 516                     ; 151         break;
 518  006e 2019          	jra	L302
 519  0070               L15:
 520                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 520                     ; 153     case ITC_IRQ_UART1_TX:
 520                     ; 154     case ITC_IRQ_UART1_RX:
 520                     ; 155     case ITC_IRQ_I2C:
 520                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 522  0070 c67f74        	ld	a,32628
 523  0073 1401          	and	a,(OFST-1,sp)
 524  0075 6b02          	ld	(OFST+0,sp),a
 526                     ; 157         break;
 528  0077 2010          	jra	L302
 529  0079               L35:
 530                     ; 172     case ITC_IRQ_ADC1:
 530                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 530                     ; 174 
 530                     ; 175 #ifdef STM8S903
 530                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 530                     ; 177 #else
 530                     ; 178     case ITC_IRQ_TIM4_OVF:
 530                     ; 179 #endif /*STM8S903*/
 530                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 532  0079 c67f75        	ld	a,32629
 533  007c 1401          	and	a,(OFST-1,sp)
 534  007e 6b02          	ld	(OFST+0,sp),a
 536                     ; 181         break;
 538  0080 2007          	jra	L302
 539  0082               L55:
 540                     ; 182     case ITC_IRQ_EEPROM_EEC:
 540                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 542  0082 c67f76        	ld	a,32630
 543  0085 1401          	and	a,(OFST-1,sp)
 544  0087 6b02          	ld	(OFST+0,sp),a
 546                     ; 184         break;
 548  0089               L75:
 549                     ; 185     default:
 549                     ; 186         break;
 551  0089               L302:
 552                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 554  0089 7b03          	ld	a,(OFST+1,sp)
 555  008b a403          	and	a,#3
 556  008d 48            	sll	a
 557  008e 5f            	clrw	x
 558  008f 97            	ld	xl,a
 559  0090 7b02          	ld	a,(OFST+0,sp)
 560  0092 5d            	tnzw	x
 561  0093 2704          	jreq	L42
 562  0095               L62:
 563  0095 44            	srl	a
 564  0096 5a            	decw	x
 565  0097 26fc          	jrne	L62
 566  0099               L42:
 567  0099 6b02          	ld	(OFST+0,sp),a
 569                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 571  009b 7b02          	ld	a,(OFST+0,sp)
 574  009d 5b03          	addw	sp,#3
 575  009f 81            	ret
 639                     	switch	.const
 640  0032               L44:
 641  0032 00d5          	dc.w	L502
 642  0034 00d5          	dc.w	L502
 643  0036 00d5          	dc.w	L502
 644  0038 00d5          	dc.w	L502
 645  003a 00e7          	dc.w	L702
 646  003c 00e7          	dc.w	L702
 647  003e 00e7          	dc.w	L702
 648  0040 00e7          	dc.w	L702
 649  0042 0151          	dc.w	L162
 650  0044 0151          	dc.w	L162
 651  0046 00f9          	dc.w	L112
 652  0048 00f9          	dc.w	L112
 653  004a 010b          	dc.w	L312
 654  004c 010b          	dc.w	L312
 655  004e 010b          	dc.w	L312
 656  0050 010b          	dc.w	L312
 657  0052 011d          	dc.w	L512
 658  0054 011d          	dc.w	L512
 659  0056 011d          	dc.w	L512
 660  0058 011d          	dc.w	L512
 661  005a 0151          	dc.w	L162
 662  005c 0151          	dc.w	L162
 663  005e 012f          	dc.w	L712
 664  0060 012f          	dc.w	L712
 665  0062 0141          	dc.w	L122
 666                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 666                     ; 209 {
 667                     	switch	.text
 668  00a0               _ITC_SetSoftwarePriority:
 670  00a0 89            	pushw	x
 671  00a1 89            	pushw	x
 672       00000002      OFST:	set	2
 675                     ; 211     uint8_t Mask = 0;
 677                     ; 212     uint8_t NewPriority = 0;
 679                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 681                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 683                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 685                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 687  00a2 9e            	ld	a,xh
 688  00a3 a403          	and	a,#3
 689  00a5 48            	sll	a
 690  00a6 5f            	clrw	x
 691  00a7 97            	ld	xl,a
 692  00a8 a603          	ld	a,#3
 693  00aa 5d            	tnzw	x
 694  00ab 2704          	jreq	L23
 695  00ad               L43:
 696  00ad 48            	sll	a
 697  00ae 5a            	decw	x
 698  00af 26fc          	jrne	L43
 699  00b1               L23:
 700  00b1 43            	cpl	a
 701  00b2 6b01          	ld	(OFST-1,sp),a
 703                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 705  00b4 7b03          	ld	a,(OFST+1,sp)
 706  00b6 a403          	and	a,#3
 707  00b8 48            	sll	a
 708  00b9 5f            	clrw	x
 709  00ba 97            	ld	xl,a
 710  00bb 7b04          	ld	a,(OFST+2,sp)
 711  00bd 5d            	tnzw	x
 712  00be 2704          	jreq	L63
 713  00c0               L04:
 714  00c0 48            	sll	a
 715  00c1 5a            	decw	x
 716  00c2 26fc          	jrne	L04
 717  00c4               L63:
 718  00c4 6b02          	ld	(OFST+0,sp),a
 720                     ; 228     switch (IrqNum)
 722  00c6 7b03          	ld	a,(OFST+1,sp)
 724                     ; 314     default:
 724                     ; 315         break;
 725  00c8 a119          	cp	a,#25
 726  00ca 2407          	jruge	L24
 727  00cc 5f            	clrw	x
 728  00cd 97            	ld	xl,a
 729  00ce 58            	sllw	x
 730  00cf de0032        	ldw	x,(L44,x)
 731  00d2 fc            	jp	(x)
 732  00d3               L24:
 733  00d3 207c          	jra	L162
 734  00d5               L502:
 735                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 735                     ; 232     case ITC_IRQ_AWU:
 735                     ; 233     case ITC_IRQ_CLK:
 735                     ; 234     case ITC_IRQ_PORTA:
 735                     ; 235         ITC->ISPR1 &= Mask;
 737  00d5 c67f70        	ld	a,32624
 738  00d8 1401          	and	a,(OFST-1,sp)
 739  00da c77f70        	ld	32624,a
 740                     ; 236         ITC->ISPR1 |= NewPriority;
 742  00dd c67f70        	ld	a,32624
 743  00e0 1a02          	or	a,(OFST+0,sp)
 744  00e2 c77f70        	ld	32624,a
 745                     ; 237         break;
 747  00e5 206a          	jra	L162
 748  00e7               L702:
 749                     ; 239     case ITC_IRQ_PORTB:
 749                     ; 240     case ITC_IRQ_PORTC:
 749                     ; 241     case ITC_IRQ_PORTD:
 749                     ; 242     case ITC_IRQ_PORTE:
 749                     ; 243         ITC->ISPR2 &= Mask;
 751  00e7 c67f71        	ld	a,32625
 752  00ea 1401          	and	a,(OFST-1,sp)
 753  00ec c77f71        	ld	32625,a
 754                     ; 244         ITC->ISPR2 |= NewPriority;
 756  00ef c67f71        	ld	a,32625
 757  00f2 1a02          	or	a,(OFST+0,sp)
 758  00f4 c77f71        	ld	32625,a
 759                     ; 245         break;
 761  00f7 2058          	jra	L162
 762  00f9               L112:
 763                     ; 255     case ITC_IRQ_SPI:
 763                     ; 256     case ITC_IRQ_TIM1_OVF:
 763                     ; 257         ITC->ISPR3 &= Mask;
 765  00f9 c67f72        	ld	a,32626
 766  00fc 1401          	and	a,(OFST-1,sp)
 767  00fe c77f72        	ld	32626,a
 768                     ; 258         ITC->ISPR3 |= NewPriority;
 770  0101 c67f72        	ld	a,32626
 771  0104 1a02          	or	a,(OFST+0,sp)
 772  0106 c77f72        	ld	32626,a
 773                     ; 259         break;
 775  0109 2046          	jra	L162
 776  010b               L312:
 777                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 777                     ; 262 #ifdef STM8S903
 777                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 777                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 777                     ; 265 #else
 777                     ; 266     case ITC_IRQ_TIM2_OVF:
 777                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 777                     ; 268 #endif /*STM8S903*/
 777                     ; 269 
 777                     ; 270     case ITC_IRQ_TIM3_OVF:
 777                     ; 271         ITC->ISPR4 &= Mask;
 779  010b c67f73        	ld	a,32627
 780  010e 1401          	and	a,(OFST-1,sp)
 781  0110 c77f73        	ld	32627,a
 782                     ; 272         ITC->ISPR4 |= NewPriority;
 784  0113 c67f73        	ld	a,32627
 785  0116 1a02          	or	a,(OFST+0,sp)
 786  0118 c77f73        	ld	32627,a
 787                     ; 273         break;
 789  011b 2034          	jra	L162
 790  011d               L512:
 791                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 791                     ; 276     case ITC_IRQ_UART1_TX:
 791                     ; 277     case ITC_IRQ_UART1_RX:
 791                     ; 278     case ITC_IRQ_I2C:
 791                     ; 279         ITC->ISPR5 &= Mask;
 793  011d c67f74        	ld	a,32628
 794  0120 1401          	and	a,(OFST-1,sp)
 795  0122 c77f74        	ld	32628,a
 796                     ; 280         ITC->ISPR5 |= NewPriority;
 798  0125 c67f74        	ld	a,32628
 799  0128 1a02          	or	a,(OFST+0,sp)
 800  012a c77f74        	ld	32628,a
 801                     ; 281         break;
 803  012d 2022          	jra	L162
 804  012f               L712:
 805                     ; 297     case ITC_IRQ_ADC1:
 805                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 805                     ; 299 
 805                     ; 300 #ifdef STM8S903
 805                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 805                     ; 302 #else
 805                     ; 303     case ITC_IRQ_TIM4_OVF:
 805                     ; 304 #endif /*STM8S903*/
 805                     ; 305         ITC->ISPR6 &= Mask;
 807  012f c67f75        	ld	a,32629
 808  0132 1401          	and	a,(OFST-1,sp)
 809  0134 c77f75        	ld	32629,a
 810                     ; 306         ITC->ISPR6 |= NewPriority;
 812  0137 c67f75        	ld	a,32629
 813  013a 1a02          	or	a,(OFST+0,sp)
 814  013c c77f75        	ld	32629,a
 815                     ; 307         break;
 817  013f 2010          	jra	L162
 818  0141               L122:
 819                     ; 309     case ITC_IRQ_EEPROM_EEC:
 819                     ; 310         ITC->ISPR7 &= Mask;
 821  0141 c67f76        	ld	a,32630
 822  0144 1401          	and	a,(OFST-1,sp)
 823  0146 c77f76        	ld	32630,a
 824                     ; 311         ITC->ISPR7 |= NewPriority;
 826  0149 c67f76        	ld	a,32630
 827  014c 1a02          	or	a,(OFST+0,sp)
 828  014e c77f76        	ld	32630,a
 829                     ; 312         break;
 831  0151               L322:
 832                     ; 314     default:
 832                     ; 315         break;
 834  0151               L162:
 835                     ; 319 }
 838  0151 5b04          	addw	sp,#4
 839  0153 81            	ret
 852                     	xdef	_ITC_GetSoftwarePriority
 853                     	xdef	_ITC_SetSoftwarePriority
 854                     	xdef	_ITC_GetSoftIntStatus
 855                     	xdef	_ITC_DeInit
 856                     	xdef	_ITC_GetCPUCC
 875                     	end
