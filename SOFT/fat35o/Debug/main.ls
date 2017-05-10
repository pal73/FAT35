   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2173                     	switch	.data
2174  0000               _b100Hz:
2175  0000 00            	dc.b	0
2176  0001               _b10Hz:
2177  0001 00            	dc.b	0
2178  0002               _b5Hz:
2179  0002 00            	dc.b	0
2180  0003               _b1Hz:
2181  0003 00            	dc.b	0
2182  0004               L3241_t0_cnt0:
2183  0004 00            	dc.b	0
2184  0005               L5241_t0_cnt1:
2185  0005 00            	dc.b	0
2186  0006               L7241_t0_cnt2:
2187  0006 00            	dc.b	0
2188  0007               L1341_t0_cnt3:
2189  0007 00            	dc.b	0
2256                     ; 23 long delay_ms(short in)
2256                     ; 24 {
2258                     	switch	.text
2259  0000               _delay_ms:
2261  0000 520c          	subw	sp,#12
2262       0000000c      OFST:	set	12
2265                     ; 27 i=((long)in)*100UL;
2267  0002 90ae0064      	ldw	y,#100
2268  0006 cd0000        	call	c_vmul
2270  0009 96            	ldw	x,sp
2271  000a 1c0005        	addw	x,#OFST-7
2272  000d cd0000        	call	c_rtol
2274                     ; 29 for(ii=0;ii<i;ii++)
2276  0010 ae0000        	ldw	x,#0
2277  0013 1f0b          	ldw	(OFST-1,sp),x
2278  0015 ae0000        	ldw	x,#0
2279  0018 1f09          	ldw	(OFST-3,sp),x
2281  001a 2012          	jra	L7741
2282  001c               L3741:
2283                     ; 31 		iii++;
2285  001c 96            	ldw	x,sp
2286  001d 1c0001        	addw	x,#OFST-11
2287  0020 a601          	ld	a,#1
2288  0022 cd0000        	call	c_lgadc
2290                     ; 29 for(ii=0;ii<i;ii++)
2292  0025 96            	ldw	x,sp
2293  0026 1c0009        	addw	x,#OFST-3
2294  0029 a601          	ld	a,#1
2295  002b cd0000        	call	c_lgadc
2297  002e               L7741:
2300  002e 9c            	rvf
2301  002f 96            	ldw	x,sp
2302  0030 1c0009        	addw	x,#OFST-3
2303  0033 cd0000        	call	c_ltor
2305  0036 96            	ldw	x,sp
2306  0037 1c0005        	addw	x,#OFST-7
2307  003a cd0000        	call	c_lcmp
2309  003d 2fdd          	jrslt	L3741
2310                     ; 34 }
2313  003f 5b0c          	addw	sp,#12
2314  0041 81            	ret
2337                     ; 38 void gpio_init(void){
2338                     	switch	.text
2339  0042               _gpio_init:
2343                     ; 39 	GPIOD->DDR&=~(1<<4);
2345  0042 72195011      	bres	20497,#4
2346                     ; 40 	GPIOD->CR1|=(1<<4);
2348  0046 72185012      	bset	20498,#4
2349                     ; 41 	GPIOD->CR2&=~(1<<4);
2351  004a 72195013      	bres	20499,#4
2352                     ; 43 	GPIOC->DDR|=(1<<5);
2354  004e 721a500c      	bset	20492,#5
2355                     ; 44 	GPIOC->CR1|=(1<<5);
2357  0052 721a500d      	bset	20493,#5
2358                     ; 45 	GPIOC->CR2&=~(1<<5);	
2360  0056 721b500e      	bres	20494,#5
2361                     ; 46 }
2364  005a 81            	ret
2387                     ; 50 void t2_init(void){
2388                     	switch	.text
2389  005b               _t2_init:
2393                     ; 51 	TIM2->PSCR = 0;
2395  005b 725f530e      	clr	21262
2396                     ; 52 	TIM2->ARRH= (u8)(AUTORELOAD2 >> 8);
2398  005f 35a8530f      	mov	21263,#168
2399                     ; 53 	TIM2->ARRL= (u8)(AUTORELOAD2);
2401  0063 35eb5310      	mov	21264,#235
2402                     ; 54 	TIM2->CCR1H= (u8)(AUTORELOAD2/2 >> 8);	
2404  0067 35545311      	mov	21265,#84
2405                     ; 55 	TIM2->CCR1L= (u8)(AUTORELOAD2/2);
2407  006b 35755312      	mov	21266,#117
2408                     ; 57 	TIM2->CCMR1= ((6<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE; //OC2 toggle mode, prelouded
2410  006f 35685307      	mov	21255,#104
2411                     ; 61 	TIM2->CCER1= TIM2_CCER1_CC1E; //OC1, OC2 output pins enabled
2413  0073 3501530a      	mov	21258,#1
2414                     ; 64 	TIM2->CR1=(TIM2_CR1_CEN | TIM2_CR1_ARPE);	
2416  0077 35815300      	mov	21248,#129
2417                     ; 66 }
2420  007b 81            	ret
2443                     ; 71 void t1_init(void){
2444                     	switch	.text
2445  007c               _t1_init:
2449                     ; 72 	TIM1->ARRH= (u8)(AUTORELOAD >> 8);			// init pulse period - auto reload register
2451  007c 35015262      	mov	21090,#1
2452                     ; 73 	TIM1->ARRL= (u8)(AUTORELOAD);
2454  0080 35b05263      	mov	21091,#176
2455                     ; 74 	TIM1->CCR1H= (u8)((AUTORELOAD/2) >> 8);	// init pulse wide (50% duty cycle) - compare register
2457  0084 725f5265      	clr	21093
2458                     ; 75 	TIM1->CCR1L= (u8)(AUTORELOAD/2);
2460  0088 35d85266      	mov	21094,#216
2461                     ; 76 	TIM1->CCR2H= (u8)((AUTORELOAD/2) >> 8);	// init pulse wide (50% duty cycle) - compare register
2463  008c 725f5267      	clr	21095
2464                     ; 77 	TIM1->CCR2L= (u8)(AUTORELOAD/2);
2466  0090 35d85268      	mov	21096,#216
2467                     ; 79 	TIM1->CCMR1= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
2469  0094 35685258      	mov	21080,#104
2470                     ; 80 	TIM1->CCMR2= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
2472  0098 35685259      	mov	21081,#104
2473                     ; 85 	TIM1->CCER1 = TIM1_CCER1_CC1E|TIM1_CCER1_CC2E;
2475  009c 3511525c      	mov	21084,#17
2476                     ; 89 	TIM1->BKR= 0x80;
2478  00a0 3580526d      	mov	21101,#128
2479                     ; 99 	TIM1->IER|= TIM1_IER_UIE;					// enable break interrupt
2481  00a4 72105254      	bset	21076,#0
2482                     ; 101 	TIM1->CR1|= TIM4_CR1_URS|TIM1_CR1_CEN| TIM1_CR1_ARPE;					// timer 1 enable
2484  00a8 c65250        	ld	a,21072
2485  00ab aa85          	or	a,#133
2486  00ad c75250        	ld	21072,a
2487                     ; 104 }
2490  00b0 81            	ret
2513                     ; 108 void spi_init(void){
2514                     	switch	.text
2515  00b1               _spi_init:
2519                     ; 109 	SPI->CR1= /*SPI_CR1_LSBFIRST |*/
2519                     ; 110 			SPI_CR1_SPE | 
2519                     ; 111 			( (3<< 2) & SPI_CR1_BR ) |
2519                     ; 112 			SPI_CR1_MSTR |
2519                     ; 113 			SPI_CR1_CPOL |
2519                     ; 114 			SPI_CR1_CPHA; 
2521  00b1 354f5200      	mov	20992,#79
2522                     ; 116 	SPI->CR2= SPI_CR2_SSM | SPI_CR2_SSI;
2524  00b5 35035201      	mov	20993,#3
2525                     ; 117 	SPI->ICR= 0;	
2527  00b9 725f5202      	clr	20994
2528                     ; 118 }
2531  00bd 81            	ret
2574                     ; 120 char spi(char in){
2575                     	switch	.text
2576  00be               _spi:
2578  00be 88            	push	a
2579  00bf 88            	push	a
2580       00000001      OFST:	set	1
2583  00c0               L7651:
2584                     ; 122 	while(!((SPI->SR)&SPI_SR_TXE));
2586  00c0 c65203        	ld	a,20995
2587  00c3 a502          	bcp	a,#2
2588  00c5 27f9          	jreq	L7651
2589                     ; 123 	SPI->DR=in;
2591  00c7 7b02          	ld	a,(OFST+1,sp)
2592  00c9 c75204        	ld	20996,a
2594  00cc               L7751:
2595                     ; 124 	while(!((SPI->SR)&SPI_SR_RXNE));
2597  00cc c65203        	ld	a,20995
2598  00cf a501          	bcp	a,#1
2599  00d1 27f9          	jreq	L7751
2600                     ; 125 	c=SPI->DR;	
2602  00d3 c65204        	ld	a,20996
2603  00d6 6b01          	ld	(OFST+0,sp),a
2604                     ; 126 	return c;
2606  00d8 7b01          	ld	a,(OFST+0,sp)
2609  00da 85            	popw	x
2610  00db 81            	ret
2633                     ; 130 void t4_init(void){
2634                     	switch	.text
2635  00dc               _t4_init:
2639                     ; 131 	TIM4->PSCR = 3;
2641  00dc 35035347      	mov	21319,#3
2642                     ; 132 	TIM4->ARR= 158;
2644  00e0 359e5348      	mov	21320,#158
2645                     ; 133 	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
2647  00e4 72105343      	bset	21315,#0
2648                     ; 135 	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
2650  00e8 35855340      	mov	21312,#133
2651                     ; 137 }
2654  00ec 81            	ret
2684                     ; 143 @far @interrupt void TIM1_Ovf_Interrupt (void) {
2686                     	switch	.text
2687  00ed               f_TIM1_Ovf_Interrupt:
2691                     ; 147 	if(!((GPIOD->IDR)&(1<<4)))	{
2693  00ed c65010        	ld	a,20496
2694  00f0 a510          	bcp	a,#16
2695  00f2 2641          	jrne	L3261
2696                     ; 148 		if(bIN_OLD){
2698  00f4 3d07          	tnz	_bIN_OLD
2699  00f6 271b          	jreq	L5261
2700                     ; 149 			if((one_cnt>20)&&(one_cnt<310)&&bREADY&&(!out_cnt))out_cnt=4000;
2702  00f8 be0a          	ldw	x,_one_cnt
2703  00fa a30015        	cpw	x,#21
2704  00fd 2514          	jrult	L5261
2706  00ff be0a          	ldw	x,_one_cnt
2707  0101 a30136        	cpw	x,#310
2708  0104 240d          	jruge	L5261
2710  0106 3d06          	tnz	_bREADY
2711  0108 2709          	jreq	L5261
2713  010a be00          	ldw	x,_out_cnt
2714  010c 2605          	jrne	L5261
2717  010e ae0fa0        	ldw	x,#4000
2718  0111 bf00          	ldw	_out_cnt,x
2719  0113               L5261:
2720                     ; 152 		if(zero_cnt<30000){
2722  0113 be08          	ldw	x,_zero_cnt
2723  0115 a37530        	cpw	x,#30000
2724  0118 240b          	jruge	L1361
2725                     ; 153 			zero_cnt++;
2727  011a be08          	ldw	x,_zero_cnt
2728  011c 1c0001        	addw	x,#1
2729  011f bf08          	ldw	_zero_cnt,x
2730                     ; 154 			bREADY=0;
2732  0121 3f06          	clr	_bREADY
2734  0123 2004          	jra	L3361
2735  0125               L1361:
2736                     ; 156 		else bREADY=1;
2738  0125 35010006      	mov	_bREADY,#1
2739  0129               L3361:
2740                     ; 157 		one_cnt=0;
2742  0129 5f            	clrw	x
2743  012a bf0a          	ldw	_one_cnt,x
2744                     ; 159 		opto_err_cnt=0;
2746  012c 5f            	clrw	x
2747  012d bf02          	ldw	_opto_err_cnt,x
2748                     ; 160 		bOPTO_ERR=0;
2750  012f 3f05          	clr	_bOPTO_ERR
2751                     ; 161 		bIN_OLD=0;
2753  0131 3f07          	clr	_bIN_OLD
2755  0133 202c          	jra	L5361
2756  0135               L3261:
2757                     ; 165 		if(one_cnt<30000){
2759  0135 be0a          	ldw	x,_one_cnt
2760  0137 a37530        	cpw	x,#30000
2761  013a 2407          	jruge	L7361
2762                     ; 166 			one_cnt++;
2764  013c be0a          	ldw	x,_one_cnt
2765  013e 1c0001        	addw	x,#1
2766  0141 bf0a          	ldw	_one_cnt,x
2767  0143               L7361:
2768                     ; 168 		zero_cnt=0;
2770  0143 5f            	clrw	x
2771  0144 bf08          	ldw	_zero_cnt,x
2772                     ; 170 		if((opto_err_cnt<5000)) {
2774  0146 9c            	rvf
2775  0147 be02          	ldw	x,_opto_err_cnt
2776  0149 a31388        	cpw	x,#5000
2777  014c 2e0b          	jrsge	L1461
2778                     ; 171 			bOPTO_ERR=0;
2780  014e 3f05          	clr	_bOPTO_ERR
2781                     ; 172 			opto_err_cnt++;
2783  0150 be02          	ldw	x,_opto_err_cnt
2784  0152 1c0001        	addw	x,#1
2785  0155 bf02          	ldw	_opto_err_cnt,x
2787  0157 2004          	jra	L3461
2788  0159               L1461:
2789                     ; 174 		else bOPTO_ERR=1; 
2791  0159 35010005      	mov	_bOPTO_ERR,#1
2792  015d               L3461:
2793                     ; 176 		bIN_OLD=1;
2795  015d 35010007      	mov	_bIN_OLD,#1
2796  0161               L5361:
2797                     ; 180 	if((bOPTO_ERR)||(out_cnt)){
2799  0161 3d05          	tnz	_bOPTO_ERR
2800  0163 2604          	jrne	L7461
2802  0165 be00          	ldw	x,_out_cnt
2803  0167 2711          	jreq	L5461
2804  0169               L7461:
2805                     ; 181 		TIM2->CCMR1= ((4<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE;	
2807  0169 35485307      	mov	21255,#72
2809  016d               L1561:
2810                     ; 184 	if(out_cnt)out_cnt--;
2812  016d be00          	ldw	x,_out_cnt
2813  016f 270f          	jreq	L3561
2816  0171 be00          	ldw	x,_out_cnt
2817  0173 1d0001        	subw	x,#1
2818  0176 bf00          	ldw	_out_cnt,x
2819  0178 2006          	jra	L3561
2820  017a               L5461:
2821                     ; 183 	else TIM2->CCMR1= ((6<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE;	
2823  017a 35685307      	mov	21255,#104
2824  017e 20ed          	jra	L1561
2825  0180               L3561:
2826                     ; 186 	TIM1->SR1&=~TIM1_SR1_UIF;			// disable break interrupt
2828  0180 72115255      	bres	21077,#0
2829                     ; 187 }
2832  0184 80            	iret
2862                     ; 190 @far @interrupt void TIM4_UPD_Interrupt (void) {
2863                     	switch	.text
2864  0185               f_TIM4_UPD_Interrupt:
2868                     ; 192 if(++t0_cnt0>=125){
2870  0185 725c0004      	inc	L3241_t0_cnt0
2871  0189 c60004        	ld	a,L3241_t0_cnt0
2872  018c a17d          	cp	a,#125
2873  018e 2549          	jrult	L5661
2874                     ; 193     		t0_cnt0=0;
2876  0190 725f0004      	clr	L3241_t0_cnt0
2877                     ; 194     		b100Hz=1;
2879  0194 35010000      	mov	_b100Hz,#1
2880                     ; 196 		if(++t0_cnt1>=10){
2882  0198 725c0005      	inc	L5241_t0_cnt1
2883  019c c60005        	ld	a,L5241_t0_cnt1
2884  019f a10a          	cp	a,#10
2885  01a1 2510          	jrult	L7661
2886                     ; 197 			t0_cnt1=0;
2888  01a3 725f0005      	clr	L5241_t0_cnt1
2889                     ; 198 			b10Hz=1;
2891  01a7 35010001      	mov	_b10Hz,#1
2892                     ; 199 			GPIOB->ODR^=0xff;
2894  01ab c65005        	ld	a,20485
2895  01ae a8ff          	xor	a,	#255
2896  01b0 c75005        	ld	20485,a
2897  01b3               L7661:
2898                     ; 202 		if(++t0_cnt2>=20){
2900  01b3 725c0006      	inc	L7241_t0_cnt2
2901  01b7 c60006        	ld	a,L7241_t0_cnt2
2902  01ba a114          	cp	a,#20
2903  01bc 2508          	jrult	L1761
2904                     ; 203 			t0_cnt2=0;
2906  01be 725f0006      	clr	L7241_t0_cnt2
2907                     ; 204 			b5Hz=1;
2909  01c2 35010002      	mov	_b5Hz,#1
2910  01c6               L1761:
2911                     ; 207 		if(++t0_cnt3>=100){
2913  01c6 725c0007      	inc	L1341_t0_cnt3
2914  01ca c60007        	ld	a,L1341_t0_cnt3
2915  01cd a164          	cp	a,#100
2916  01cf 2508          	jrult	L5661
2917                     ; 208 			t0_cnt3=0;
2919  01d1 725f0007      	clr	L1341_t0_cnt3
2920                     ; 209 			b1Hz=1;
2922  01d5 35010003      	mov	_b1Hz,#1
2923  01d9               L5661:
2924                     ; 228 		TIM4->SR1&=~TIM4_SR1_UIF;			// disable break interrupt
2926  01d9 72115344      	bres	21316,#0
2927                     ; 229 	return;
2930  01dd 80            	iret
2961                     ; 236 main(){
2963                     	switch	.text
2964  01de               _main:
2968                     ; 237 	CLK->CKDIVR=0;
2970  01de 725f50c6      	clr	20678
2971                     ; 239 	gpio_init();
2973  01e2 cd0042        	call	_gpio_init
2975                     ; 240 	t1_init();
2977  01e5 cd007c        	call	_t1_init
2979                     ; 241 	t2_init();
2981  01e8 cd005b        	call	_t2_init
2983                     ; 242 	t4_init();
2985  01eb cd00dc        	call	_t4_init
2987                     ; 244 	enableInterrupts();	
2990  01ee 9a            rim
2992  01ef               L5071:
2993                     ; 253 		if(b100Hz){
2995  01ef 725d0000      	tnz	_b100Hz
2996  01f3 2704          	jreq	L1171
2997                     ; 254 			b100Hz=0;
2999  01f5 725f0000      	clr	_b100Hz
3000  01f9               L1171:
3001                     ; 267 		if(b10Hz){
3003  01f9 725d0001      	tnz	_b10Hz
3004  01fd 2704          	jreq	L3171
3005                     ; 268 			b10Hz=0;
3007  01ff 725f0001      	clr	_b10Hz
3008  0203               L3171:
3009                     ; 272 		if(b5Hz){
3011  0203 725d0002      	tnz	_b5Hz
3012  0207 2704          	jreq	L5171
3013                     ; 273 			b5Hz=0;
3015  0209 725f0002      	clr	_b5Hz
3016  020d               L5171:
3017                     ; 277 		if(b1Hz){
3019  020d 725d0003      	tnz	_b1Hz
3020  0211 27dc          	jreq	L5071
3021                     ; 278 			b1Hz=0;
3023  0213 725f0003      	clr	_b1Hz
3024  0217 20d6          	jra	L5071
3239                     	xdef	_main
3240                     	xdef	f_TIM4_UPD_Interrupt
3241                     	xdef	f_TIM1_Ovf_Interrupt
3242                     	xdef	_t4_init
3243                     	xdef	_spi_init
3244                     	xdef	_t1_init
3245                     	xdef	_t2_init
3246                     	xdef	_gpio_init
3247                     	xdef	_delay_ms
3248                     .eeprom:	section	.data
3249  0000               _aaa:
3250  0000 00            	ds.b	1
3251                     	xdef	_aaa
3252                     	switch	.ubsct
3253  0000               _out_cnt:
3254  0000 0000          	ds.b	2
3255                     	xdef	_out_cnt
3256  0002               _opto_err_cnt:
3257  0002 0000          	ds.b	2
3258                     	xdef	_opto_err_cnt
3259  0004               _bTR:
3260  0004 00            	ds.b	1
3261                     	xdef	_bTR
3262  0005               _bOPTO_ERR:
3263  0005 00            	ds.b	1
3264                     	xdef	_bOPTO_ERR
3265  0006               _bREADY:
3266  0006 00            	ds.b	1
3267                     	xdef	_bREADY
3268  0007               _bIN_OLD:
3269  0007 00            	ds.b	1
3270                     	xdef	_bIN_OLD
3271  0008               _zero_cnt:
3272  0008 0000          	ds.b	2
3273                     	xdef	_zero_cnt
3274  000a               _one_cnt:
3275  000a 0000          	ds.b	2
3276                     	xdef	_one_cnt
3277                     	xdef	_spi
3278                     	switch	.bss
3279  0000               _rx_plazma:
3280  0000 00            	ds.b	1
3281                     	xdef	_rx_plazma
3282  0001               _bSTART:
3283  0001 00            	ds.b	1
3284                     	xdef	_bSTART
3285                     	xdef	_b1Hz
3286                     	xdef	_b5Hz
3287                     	xdef	_b10Hz
3288                     	xdef	_b100Hz
3289                     	xref.b	c_x
3290                     	xref.b	c_y
3310                     	xref	c_lcmp
3311                     	xref	c_ltor
3312                     	xref	c_lgadc
3313                     	xref	c_rtol
3314                     	xref	c_vmul
3315                     	end
