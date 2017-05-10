   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
6873                     .const:	section	.text
6874  0000               L6:
6875  0000 06e84cd6      	dc.l	115887318
6876                     ; 19 void ibatton_an(void) {
6877                     	scross	off
6878                     	switch	.text
6879  0000               _ibatton_an:
6883                     ; 20 	if(ibatton_n || ibatton_n_)
6885  0000 3d05          	tnz	_ibatton_n
6886  0002 2604          	jrne	L3445
6888  0004 3d04          	tnz	_ibatton_n_
6889  0006 2705          	jreq	L1445
6890  0008               L3445:
6891                     ; 22 		plazma_ibatton1++;
6893  0008 3c00          	inc	_plazma_ibatton1
6894                     ; 23 		plazma_ibatton2=(char)ibatton;
6896  000a 450900        	mov	_plazma_ibatton2,_ibatton+3
6897  000d               L1445:
6898                     ; 70 	if(ibatton_n && (ibatton==EE_WRK_BUTTON))ibatton_plazma[1]++;
6900  000d 3d05          	tnz	_ibatton_n
6901  000f 2710          	jreq	L5445
6903  0011 ae0006        	ldw	x,#_ibatton
6904  0014 cd0000        	call	c_ltor
6906  0017 ae0000        	ldw	x,#_EE_WRK_BUTTON
6907  001a cd0000        	call	c_lcmp
6909  001d 2602          	jrne	L5445
6912  001f 3c03          	inc	_ibatton_plazma+1
6913  0021               L5445:
6914                     ; 71 	if(ibatton_n || ibatton_n_) {
6916  0021 3d05          	tnz	_ibatton_n
6917  0023 2607          	jrne	L1545
6919  0025 3d04          	tnz	_ibatton_n_
6920  0027 2603          	jrne	L01
6921  0029 cc0194        	jp	L7445
6922  002c               L01:
6923  002c               L1545:
6924                     ; 73 		if((ind==iMnBut) && (ibatton_n_)) {
6926  002c b600          	ld	a,_ind
6927  002e a109          	cp	a,#9
6928  0030 2638          	jrne	L3545
6930  0032 3d04          	tnz	_ibatton_n_
6931  0034 2734          	jreq	L3545
6932                     ; 74 			FLASH_DUKR=0xae;
6934  0036 35ae5064      	mov	_FLASH_DUKR,#174
6935                     ; 75 			FLASH_DUKR=0x56;
6937  003a 35565064      	mov	_FLASH_DUKR,#86
6938                     ; 76 			EE_MAIN_BUTTON=ibatton;
6940  003e ae0006        	ldw	x,#_ibatton
6941  0041 cd0000        	call	c_ltor
6943  0044 ae0000        	ldw	x,#_EE_MAIN_BUTTON
6944  0047 cd0000        	call	c_eewrl
6946                     ; 77 			EE_WRK_BUTTON=0;
6948  004a ae0000        	ldw	x,#0
6949  004d bf02          	ldw	c_lreg+2,x
6950  004f ae0000        	ldw	x,#0
6951  0052 bf00          	ldw	c_lreg,x
6952  0054 ae0000        	ldw	x,#_EE_WRK_BUTTON
6953  0057 cd0000        	call	c_eewrl
6955                     ; 78 			FLASH_DUKR=0x56;
6957  005a 35565064      	mov	_FLASH_DUKR,#86
6958                     ; 79 			FLASH_DUKR=0xae;
6960  005e 35ae5064      	mov	_FLASH_DUKR,#174
6961                     ; 80 			ind=iWait;
6963  0062 35020000      	mov	_ind,#2
6965  0066 ac940194      	jpf	L7445
6966  006a               L3545:
6967                     ; 83 		else if((ind==iWait) || (ind==iWait2)) {
6969  006a b600          	ld	a,_ind
6970  006c a102          	cp	a,#2
6971  006e 2709          	jreq	L1645
6973  0070 b600          	ld	a,_ind
6974  0072 a10d          	cp	a,#13
6975  0074 2703          	jreq	L21
6976  0076 cc0132        	jp	L7545
6977  0079               L21:
6978  0079               L1645:
6979                     ; 84 			if( (ibatton_n_) && (ibatton==EE_MAIN_BUTTON) ) {
6981  0079 3d04          	tnz	_ibatton_n_
6982  007b 2714          	jreq	L3645
6984  007d ae0006        	ldw	x,#_ibatton
6985  0080 cd0000        	call	c_ltor
6987  0083 ae0000        	ldw	x,#_EE_MAIN_BUTTON
6988  0086 cd0000        	call	c_lcmp
6990  0089 2606          	jrne	L3645
6991                     ; 85 				ind=iSet;
6993  008b 35030000      	mov	_ind,#3
6994                     ; 86 				sub_ind=0;
6996  008f 3f00          	clr	_sub_ind
6997  0091               L3645:
6998                     ; 88 			if( (ibatton==EE_WRK_BUTTON) && ((ibatton_n) || (ibatton_n_)) ) {
7000  0091 ae0006        	ldw	x,#_ibatton
7001  0094 cd0000        	call	c_ltor
7003  0097 ae0000        	ldw	x,#_EE_WRK_BUTTON
7004  009a cd0000        	call	c_lcmp
7006  009d 2632          	jrne	L5645
7008  009f 3d05          	tnz	_ibatton_n
7009  00a1 2604          	jrne	L7645
7011  00a3 3d04          	tnz	_ibatton_n_
7012  00a5 272a          	jreq	L5645
7013  00a7               L7645:
7014                     ; 89 				ind=iWrk;
7016  00a7 35040000      	mov	_ind,#4
7017                     ; 90 				wrk_stat=wsON;
7019  00ab 35010000      	mov	_wrk_stat,#1
7020                     ; 91 				wrk_cnt=120;
7022  00af ae0078        	ldw	x,#120
7023  00b2 bf00          	ldw	_wrk_cnt,x
7024                     ; 92 				EE_REMAIN_BALLS=EE_NUM_OF_BALLS;
7026  00b4 ce0000        	ldw	x,_EE_NUM_OF_BALLS
7027  00b7 89            	pushw	x
7028  00b8 ae0000        	ldw	x,#_EE_REMAIN_BALLS
7029  00bb cd0000        	call	c_eewrw
7031  00be 85            	popw	x
7032                     ; 93 				EE_BONUS_SIGMA=0;
7034  00bf 5f            	clrw	x
7035  00c0 89            	pushw	x
7036  00c1 ae0000        	ldw	x,#_EE_BONUS_SIGMA
7037  00c4 cd0000        	call	c_eewrw
7039  00c7 85            	popw	x
7040                     ; 94 				EE_FISK_CNT++;
7042  00c8 ce0000        	ldw	x,_EE_FISK_CNT
7043  00cb 1c0001        	addw	x,#1
7044  00ce cf0000        	ldw	_EE_FISK_CNT,x
7045  00d1               L5645:
7046                     ; 96 			if( (ibatton_n_) && (ibatton==MY_BUTTON) ) {
7048  00d1 3d04          	tnz	_ibatton_n_
7049  00d3 271d          	jreq	L1745
7051  00d5 ae0006        	ldw	x,#_ibatton
7052  00d8 cd0000        	call	c_ltor
7054  00db ae0000        	ldw	x,#L6
7055  00de cd0000        	call	c_lcmp
7057  00e1 260f          	jrne	L1745
7058                     ; 97 				ind=iSerNum;
7060  00e3 35080000      	mov	_ind,#8
7061                     ; 98 				sub_ind=0;
7063  00e7 3f00          	clr	_sub_ind
7064                     ; 99 				ret_cnt=50;
7066  00e9 ae0032        	ldw	x,#50
7067  00ec bf00          	ldw	_ret_cnt,x
7068                     ; 100 				ret_ind=iWait;
7070  00ee 35020000      	mov	_ret_ind,#2
7071  00f2               L1745:
7072                     ; 103 			if( (ibatton_n) && ( (ibatton!=EE_MAIN_BUTTON) || (ibatton!=EE_WRK_BUTTON) ) ) {
7074  00f2 3d05          	tnz	_ibatton_n
7075  00f4 2603          	jrne	L41
7076  00f6 cc0194        	jp	L7445
7077  00f9               L41:
7079  00f9 ae0006        	ldw	x,#_ibatton
7080  00fc cd0000        	call	c_ltor
7082  00ff ae0000        	ldw	x,#_EE_MAIN_BUTTON
7083  0102 cd0000        	call	c_lcmp
7085  0105 2610          	jrne	L5745
7087  0107 ae0006        	ldw	x,#_ibatton
7088  010a cd0000        	call	c_ltor
7090  010d ae0000        	ldw	x,#_EE_WRK_BUTTON
7091  0110 cd0000        	call	c_lcmp
7093  0113 2602          	jrne	L61
7094  0115 207d          	jp	L7445
7095  0117               L61:
7096  0117               L5745:
7097                     ; 104 				i_ser_num_cnt++;
7099  0117 3c00          	inc	_i_ser_num_cnt
7100                     ; 105 				if(i_ser_num_cnt>=25) {
7102  0119 b600          	ld	a,_i_ser_num_cnt
7103  011b a119          	cp	a,#25
7104  011d 2575          	jrult	L7445
7105                     ; 106 					i_ser_num_cnt=0;
7107  011f 3f00          	clr	_i_ser_num_cnt
7108                     ; 107 					ind=iSerNum;
7110  0121 35080000      	mov	_ind,#8
7111                     ; 108 					sub_ind=0;
7113  0125 3f00          	clr	_sub_ind
7114                     ; 109 					ret_cnt=50;
7116  0127 ae0032        	ldw	x,#50
7117  012a bf00          	ldw	_ret_cnt,x
7118                     ; 110 					ret_ind=iWait;
7120  012c 35020000      	mov	_ret_ind,#2
7121  0130 2062          	jra	L7445
7122  0132               L7545:
7123                     ; 116 		else if(ind==iSet) {
7125  0132 b600          	ld	a,_ind
7126  0134 a103          	cp	a,#3
7127  0136 265c          	jrne	L7445
7128                     ; 117 			if( (ibatton_n_) && (ibatton==EE_MAIN_BUTTON) ) {
7130  0138 3d04          	tnz	_ibatton_n_
7131  013a 2716          	jreq	L5055
7133  013c ae0006        	ldw	x,#_ibatton
7134  013f cd0000        	call	c_ltor
7136  0142 ae0000        	ldw	x,#_EE_MAIN_BUTTON
7137  0145 cd0000        	call	c_lcmp
7139  0148 2608          	jrne	L5055
7140                     ; 118 				ind=iWait;
7142  014a 35020000      	mov	_ind,#2
7143                     ; 119 				sub_ind=0;
7145  014e 3f00          	clr	_sub_ind
7147  0150 2042          	jra	L7445
7148  0152               L5055:
7149                     ; 122 			else if( (ibatton_n) && (ibatton==EE_MAIN_BUTTON) ) {
7151  0152 3d05          	tnz	_ibatton_n
7152  0154 271a          	jreq	L1155
7154  0156 ae0006        	ldw	x,#_ibatton
7155  0159 cd0000        	call	c_ltor
7157  015c ae0000        	ldw	x,#_EE_MAIN_BUTTON
7158  015f cd0000        	call	c_lcmp
7160  0162 260c          	jrne	L1155
7161                     ; 123 				sub_ind++;
7163  0164 3c00          	inc	_sub_ind
7164                     ; 124 				if(sub_ind>=5)sub_ind=0;
7166  0166 b600          	ld	a,_sub_ind
7167  0168 a105          	cp	a,#5
7168  016a 2528          	jrult	L7445
7171  016c 3f00          	clr	_sub_ind
7172  016e 2024          	jra	L7445
7173  0170               L1155:
7174                     ; 127 			else if( (sub_ind==3) && (ibatton_n_) && (ibatton!=EE_MAIN_BUTTON) ) {
7176  0170 b600          	ld	a,_sub_ind
7177  0172 a103          	cp	a,#3
7178  0174 261e          	jrne	L7445
7180  0176 3d04          	tnz	_ibatton_n_
7181  0178 271a          	jreq	L7445
7183  017a ae0006        	ldw	x,#_ibatton
7184  017d cd0000        	call	c_ltor
7186  0180 ae0000        	ldw	x,#_EE_MAIN_BUTTON
7187  0183 cd0000        	call	c_lcmp
7189  0186 270c          	jreq	L7445
7190                     ; 128 				EE_WRK_BUTTON=ibatton;
7192  0188 ae0006        	ldw	x,#_ibatton
7193  018b cd0000        	call	c_ltor
7195  018e ae0000        	ldw	x,#_EE_WRK_BUTTON
7196  0191 cd0000        	call	c_eewrl
7198  0194               L7445:
7199                     ; 144 ibatton_n=0;
7201  0194 3f05          	clr	_ibatton_n
7202                     ; 145 ibatton_n_=0;
7204  0196 3f04          	clr	_ibatton_n_
7205                     ; 146 }
7208  0198 81            	ret
7242                     ; 148 void ibatton_drv(void) {
7243                     	switch	.text
7244  0199               _ibatton_drv:
7246  0199 5208          	subw	sp,#8
7247       00000008      OFST:	set	8
7250                     ; 149 if(ibatton_not_ready_cnt)ibatton_not_ready_cnt--;
7252  019b be00          	ldw	x,_ibatton_not_ready_cnt
7253  019d 270b          	jreq	L1355
7256  019f be00          	ldw	x,_ibatton_not_ready_cnt
7257  01a1 1d0001        	subw	x,#1
7258  01a4 bf00          	ldw	_ibatton_not_ready_cnt,x
7260  01a6 ac9c029c      	jpf	L3355
7261  01aa               L1355:
7262                     ; 150 else if(ibatton_polling())
7264  01aa cd029f        	call	_ibatton_polling
7266  01ad 4d            	tnz	a
7267  01ae 2603          	jrne	L22
7268  01b0 cc0268        	jp	L5355
7269  01b3               L22:
7270                     ; 153 	ibatton_read_rom();
7272  01b3 cd0333        	call	_ibatton_read_rom
7274                     ; 179 	ibatton_new=res[1] + (((long)res[2])*256UL) + (((long)res[3])*256UL*256UL) + (((long)res[4])*256UL*256UL*256UL);
7276  01b6 b618          	ld	a,_res+4
7277  01b8 b703          	ld	c_lreg+3,a
7278  01ba 3f02          	clr	c_lreg+2
7279  01bc 3f01          	clr	c_lreg+1
7280  01be 3f00          	clr	c_lreg
7281  01c0 a618          	ld	a,#24
7282  01c2 cd0000        	call	c_llsh
7284  01c5 96            	ldw	x,sp
7285  01c6 1c0005        	addw	x,#OFST-3
7286  01c9 cd0000        	call	c_rtol
7288  01cc b617          	ld	a,_res+3
7289  01ce b703          	ld	c_lreg+3,a
7290  01d0 3f02          	clr	c_lreg+2
7291  01d2 3f01          	clr	c_lreg+1
7292  01d4 3f00          	clr	c_lreg
7293  01d6 a610          	ld	a,#16
7294  01d8 cd0000        	call	c_llsh
7296  01db 96            	ldw	x,sp
7297  01dc 1c0001        	addw	x,#OFST-7
7298  01df cd0000        	call	c_rtol
7300  01e2 b616          	ld	a,_res+2
7301  01e4 5f            	clrw	x
7302  01e5 97            	ld	xl,a
7303  01e6 90ae0100      	ldw	y,#256
7304  01ea cd0000        	call	c_umul
7306  01ed b615          	ld	a,_res+1
7307  01ef cd0000        	call	c_ladc
7309  01f2 96            	ldw	x,sp
7310  01f3 1c0001        	addw	x,#OFST-7
7311  01f6 cd0000        	call	c_ladd
7313  01f9 96            	ldw	x,sp
7314  01fa 1c0005        	addw	x,#OFST-3
7315  01fd cd0000        	call	c_ladd
7317  0200 ae000e        	ldw	x,#_ibatton_new
7318  0203 cd0000        	call	c_rtol
7320                     ; 185 	if((ibatton_new!=0xffffffff)&&(ibatton_new!=0x00000000))
7322  0206 ae000e        	ldw	x,#_ibatton_new
7323  0209 cd0000        	call	c_lzmp
7325  020c 2733          	jreq	L7355
7326                     ; 187 		if(ibatton_new==ibatton_old)
7328  020e ae000e        	ldw	x,#_ibatton_new
7329  0211 cd0000        	call	c_ltor
7331  0214 ae000a        	ldw	x,#_ibatton_old
7332  0217 cd0000        	call	c_lcmp
7334  021a 2642          	jrne	L5455
7335                     ; 189 			ibatton_repeat_cnt++;
7337  021c be12          	ldw	x,_ibatton_repeat_cnt
7338  021e 1c0001        	addw	x,#1
7339  0221 bf12          	ldw	_ibatton_repeat_cnt,x
7340                     ; 190 			if(ibatton_repeat_cnt>=300)
7342  0223 9c            	rvf
7343  0224 be12          	ldw	x,_ibatton_repeat_cnt
7344  0226 a3012c        	cpw	x,#300
7345  0229 2f33          	jrslt	L5455
7346                     ; 192 				ibatton=ibatton_new;
7348  022b be10          	ldw	x,_ibatton_new+2
7349  022d bf08          	ldw	_ibatton+2,x
7350  022f be0e          	ldw	x,_ibatton_new
7351  0231 bf06          	ldw	_ibatton,x
7352                     ; 193 				ibatton_n_=1;
7354  0233 35010004      	mov	_ibatton_n_,#1
7355                     ; 194 				ibatton_repeat_cnt=0;
7357  0237 5f            	clrw	x
7358  0238 bf12          	ldw	_ibatton_repeat_cnt,x
7359                     ; 195 				ibatton_not_ready_cnt=100;
7361  023a ae0064        	ldw	x,#100
7362  023d bf00          	ldw	_ibatton_not_ready_cnt,x
7363  023f 201d          	jra	L5455
7364  0241               L7355:
7365                     ; 199 	 else if((ibatton_repeat_cnt)&&(ibatton_repeat_cnt<100))
7367  0241 be12          	ldw	x,_ibatton_repeat_cnt
7368  0243 2719          	jreq	L5455
7370  0245 9c            	rvf
7371  0246 be12          	ldw	x,_ibatton_repeat_cnt
7372  0248 a30064        	cpw	x,#100
7373  024b 2e11          	jrsge	L5455
7374                     ; 201 		ibatton=ibatton_old;
7376  024d be0c          	ldw	x,_ibatton_old+2
7377  024f bf08          	ldw	_ibatton+2,x
7378  0251 be0a          	ldw	x,_ibatton_old
7379  0253 bf06          	ldw	_ibatton,x
7380                     ; 202 		ibatton_n=1;
7382  0255 35010005      	mov	_ibatton_n,#1
7383                     ; 203 		ibatton_not_ready_cnt=50;
7385  0259 ae0032        	ldw	x,#50
7386  025c bf00          	ldw	_ibatton_not_ready_cnt,x
7387  025e               L5455:
7388                     ; 206 	ibatton_old=ibatton_new;
7390  025e be10          	ldw	x,_ibatton_new+2
7391  0260 bf0c          	ldw	_ibatton_old+2,x
7392  0262 be0e          	ldw	x,_ibatton_new
7393  0264 bf0a          	ldw	_ibatton_old,x
7395  0266 2034          	jra	L3355
7396  0268               L5355:
7397                     ; 210 	if((ibatton_repeat_cnt)&&(ibatton_repeat_cnt<100)&&(ibatton_new!=0xffffffff)&&(ibatton_new!=0x00000000))
7399  0268 be12          	ldw	x,_ibatton_repeat_cnt
7400  026a 2723          	jreq	L3555
7402  026c 9c            	rvf
7403  026d be12          	ldw	x,_ibatton_repeat_cnt
7404  026f a30064        	cpw	x,#100
7405  0272 2e1b          	jrsge	L3555
7407  0274 ae000e        	ldw	x,#_ibatton_new
7408  0277 cd0000        	call	c_lzmp
7410  027a 2713          	jreq	L3555
7411                     ; 212 		ibatton=ibatton_new;
7413  027c be10          	ldw	x,_ibatton_new+2
7414  027e bf08          	ldw	_ibatton+2,x
7415  0280 be0e          	ldw	x,_ibatton_new
7416  0282 bf06          	ldw	_ibatton,x
7417                     ; 213 		ibatton_n=1;
7419  0284 35010005      	mov	_ibatton_n,#1
7420                     ; 214 		ibatton_not_ready_cnt=50;
7422  0288 ae0032        	ldw	x,#50
7423  028b bf00          	ldw	_ibatton_not_ready_cnt,x
7424                     ; 216 		ibatton_plazma[0]++;
7426  028d 3c02          	inc	_ibatton_plazma
7427  028f               L3555:
7428                     ; 219 	ibatton_repeat_cnt=0;
7430  028f 5f            	clrw	x
7431  0290 bf12          	ldw	_ibatton_repeat_cnt,x
7432                     ; 220 	ibatton_new=0;
7434  0292 ae0000        	ldw	x,#0
7435  0295 bf10          	ldw	_ibatton_new+2,x
7436  0297 ae0000        	ldw	x,#0
7437  029a bf0e          	ldw	_ibatton_new,x
7438  029c               L3355:
7439                     ; 222 }
7442  029c 5b08          	addw	sp,#8
7443  029e 81            	ret
7522                     ; 225 char ibatton_polling(void)
7522                     ; 226 {
7523                     	switch	.text
7524  029f               _ibatton_polling:
7526  029f 5204          	subw	sp,#4
7527       00000004      OFST:	set	4
7530                     ; 228 GPIOF->CR1&=~(1<<4);
7532  02a1 7219501c      	bres	20508,#4
7533                     ; 229 GPIOF->CR2&=~(1<<4);
7535  02a5 7219501d      	bres	20509,#4
7536                     ; 230 GPIOF->DDR|=(1<<4);
7538  02a9 7218501b      	bset	20507,#4
7539                     ; 233 GPIOF->ODR&=~(1<<4);
7541  02ad 72195019      	bres	20505,#4
7542                     ; 236 for(i=0;i<600;i++)
7544  02b1 5f            	clrw	x
7545  02b2 1f03          	ldw	(OFST-1,sp),x
7546  02b4               L7165:
7547                     ; 238 	__nop();
7550  02b4 9d            nop
7552                     ; 236 for(i=0;i<600;i++)
7554  02b5 1e03          	ldw	x,(OFST-1,sp)
7555  02b7 1c0001        	addw	x,#1
7556  02ba 1f03          	ldw	(OFST-1,sp),x
7559  02bc 9c            	rvf
7560  02bd 1e03          	ldw	x,(OFST-1,sp)
7561  02bf a30258        	cpw	x,#600
7562  02c2 2ff0          	jrslt	L7165
7563                     ; 240 GPIOF->ODR|=(1<<4);
7565  02c4 72185019      	bset	20505,#4
7566                     ; 243 for(i=0;i<15;i++)
7568  02c8 5f            	clrw	x
7569  02c9 1f03          	ldw	(OFST-1,sp),x
7570  02cb               L5265:
7571                     ; 245 	__nop();
7574  02cb 9d            nop
7576                     ; 243 for(i=0;i<15;i++)
7578  02cc 1e03          	ldw	x,(OFST-1,sp)
7579  02ce 1c0001        	addw	x,#1
7580  02d1 1f03          	ldw	(OFST-1,sp),x
7583  02d3 9c            	rvf
7584  02d4 1e03          	ldw	x,(OFST-1,sp)
7585  02d6 a3000f        	cpw	x,#15
7586  02d9 2ff0          	jrslt	L5265
7587                     ; 249 for(i=0;i<20;i++)
7589  02db 5f            	clrw	x
7590  02dc 1f03          	ldw	(OFST-1,sp),x
7591  02de               L3365:
7592                     ; 251 	__nop();
7595  02de 9d            nop
7597                     ; 252 	__nop();
7600  02df 9d            nop
7602                     ; 253 	__nop();
7605  02e0 9d            nop
7607                     ; 254 	if(!(GPIOF->IDR&(1<<4)))goto ibatton_polling_lbl_000;
7609  02e1 c6501a        	ld	a,20506
7610  02e4 a510          	bcp	a,#16
7611  02e6 2711          	jreq	L5555
7614                     ; 249 for(i=0;i<20;i++)
7616  02e8 1e03          	ldw	x,(OFST-1,sp)
7617  02ea 1c0001        	addw	x,#1
7618  02ed 1f03          	ldw	(OFST-1,sp),x
7621  02ef 9c            	rvf
7622  02f0 1e03          	ldw	x,(OFST-1,sp)
7623  02f2 a30014        	cpw	x,#20
7624  02f5 2fe7          	jrslt	L3365
7625                     ; 256 goto ibatton_polling_lbl_zero_exit;
7627  02f7 2036          	jra	L3655
7628  02f9               L5555:
7629                     ; 258 ibatton_polling_lbl_000:
7629                     ; 259 
7629                     ; 260 //измеряем длительность ответного импульса не дольше 300мкс
7629                     ; 261 for(i=0;i<220;i++)
7631  02f9 5f            	clrw	x
7632  02fa 1f03          	ldw	(OFST-1,sp),x
7633  02fc               L3465:
7634                     ; 263 	if(GPIOF->IDR&(1<<4))
7636  02fc c6501a        	ld	a,20506
7637  02ff a510          	bcp	a,#16
7638  0301 2704          	jreq	L1565
7639                     ; 265 		__nop();
7642  0303 9d            nop
7644                     ; 266 		__nop();
7647  0304 9d            nop
7649                     ; 267 		num_out=10;
7651                     ; 268 		goto ibatton_polling_lbl_001;	//continue;
7653  0305 2011          	jra	L7555
7654  0307               L1565:
7655                     ; 261 for(i=0;i<220;i++)
7657  0307 1e03          	ldw	x,(OFST-1,sp)
7658  0309 1c0001        	addw	x,#1
7659  030c 1f03          	ldw	(OFST-1,sp),x
7662  030e 9c            	rvf
7663  030f 1e03          	ldw	x,(OFST-1,sp)
7664  0311 a300dc        	cpw	x,#220
7665  0314 2fe6          	jrslt	L3465
7666                     ; 271 num_out=5;
7668                     ; 272 goto ibatton_polling_lbl_zero_exit;
7670  0316 2017          	jra	L3655
7671  0318               L7555:
7672                     ; 274 ibatton_polling_lbl_001:
7672                     ; 275 //выдержка 15мкс
7672                     ; 276 for(i=0;i<30;i++)
7674  0318 5f            	clrw	x
7675  0319 1f03          	ldw	(OFST-1,sp),x
7676  031b               L3565:
7677                     ; 278 	__nop();
7680  031b 9d            nop
7682                     ; 276 for(i=0;i<30;i++)
7684  031c 1e03          	ldw	x,(OFST-1,sp)
7685  031e 1c0001        	addw	x,#1
7686  0321 1f03          	ldw	(OFST-1,sp),x
7689  0323 9c            	rvf
7690  0324 1e03          	ldw	x,(OFST-1,sp)
7691  0326 a3001e        	cpw	x,#30
7692  0329 2ff0          	jrslt	L3565
7693  032b               L1655:
7694                     ; 280 ibatton_polling_lbl_success_exit:
7694                     ; 281 /*SET_REG(IO0DIR,0,19,1);
7694                     ; 282 for(i=0;i<800;i++)
7694                     ; 283 	{
7694                     ; 284 	__nop();
7694                     ; 285 	}
7694                     ; 286 SET_REG(IO0DIR,1,19,1);
7694                     ; 287 for(i=0;i<800;i++)
7694                     ; 288 	{
7694                     ; 289 	__nop();
7694                     ; 290 	}
7694                     ; 291 SET_REG(IO0DIR,0,19,1);*/
7694                     ; 292 return 1;
7696  032b a601          	ld	a,#1
7698  032d 2001          	jra	L62
7699  032f               L3655:
7700                     ; 293 ibatton_polling_lbl_zero_exit:
7700                     ; 294 /*SET_REG(IO0DIR,0,19,1);
7700                     ; 295 for(i=0;i<800;i++)
7700                     ; 296 	{
7700                     ; 297 	__nop();
7700                     ; 298 	}
7700                     ; 299 SET_REG(IO0DIR,1,19,1);
7700                     ; 300 for(i=0;i<160;i++)
7700                     ; 301 	{
7700                     ; 302 	__nop();
7700                     ; 303 	}
7700                     ; 304 SET_REG(IO0DIR,0,19,1); */
7700                     ; 305 return 0;
7702  032f 4f            	clr	a
7704  0330               L62:
7706  0330 5b04          	addw	sp,#4
7707  0332 81            	ret
7733                     ; 332 char ibatton_read_rom(void)
7733                     ; 333 {
7734                     	switch	.text
7735  0333               _ibatton_read_rom:
7739                     ; 334 ibatton_send_byte(0x0f);
7741  0333 a60f          	ld	a,#15
7742  0335 cd03e7        	call	_ibatton_send_byte
7744                     ; 336 res[0]=ibatton_read_byte();
7746  0338 cd0404        	call	_ibatton_read_byte
7748  033b b714          	ld	_res,a
7749                     ; 337 res[1]=ibatton_read_byte();
7751  033d cd0404        	call	_ibatton_read_byte
7753  0340 b715          	ld	_res+1,a
7754                     ; 338 res[2]=ibatton_read_byte();
7756  0342 cd0404        	call	_ibatton_read_byte
7758  0345 b716          	ld	_res+2,a
7759                     ; 339 res[3]=ibatton_read_byte();
7761  0347 cd0404        	call	_ibatton_read_byte
7763  034a b717          	ld	_res+3,a
7764                     ; 340 res[4]=ibatton_read_byte();
7766  034c cd0404        	call	_ibatton_read_byte
7768  034f b718          	ld	_res+4,a
7769                     ; 341 res[5]=ibatton_read_byte();
7771  0351 cd0404        	call	_ibatton_read_byte
7773  0354 b719          	ld	_res+5,a
7774                     ; 342 res[6]=ibatton_read_byte();
7776  0356 cd0404        	call	_ibatton_read_byte
7778  0359 b71a          	ld	_res+6,a
7779                     ; 343 res[7]=ibatton_read_byte();
7781  035b cd0404        	call	_ibatton_read_byte
7783  035e b71b          	ld	_res+7,a
7784                     ; 345 if((res[5]==0xff)||(res[6]==0xff))
7786  0360 b619          	ld	a,_res+5
7787  0362 a1ff          	cp	a,#255
7788  0364 2706          	jreq	L3765
7790  0366 b61a          	ld	a,_res+6
7791  0368 a1ff          	cp	a,#255
7792  036a 2610          	jrne	L1765
7793  036c               L3765:
7794                     ; 347   res[0]=0;
7796  036c 3f14          	clr	_res
7797                     ; 348 res[1]=0;
7799  036e 3f15          	clr	_res+1
7800                     ; 349 res[2]=0;
7802  0370 3f16          	clr	_res+2
7803                     ; 350 res[3]=0;
7805  0372 3f17          	clr	_res+3
7806                     ; 351 res[4]=0;
7808  0374 3f18          	clr	_res+4
7809                     ; 352 res[5]=0;
7811  0376 3f19          	clr	_res+5
7812                     ; 353 res[6]=0;
7814  0378 3f1a          	clr	_res+6
7815                     ; 354 res[7]=0;  
7817  037a 3f1b          	clr	_res+7
7818  037c               L1765:
7819                     ; 356 }
7822  037c 81            	ret
7858                     ; 360 char ibatton_w1ts(void)
7858                     ; 361 {
7859                     	switch	.text
7860  037d               _ibatton_w1ts:
7862  037d 89            	pushw	x
7863       00000002      OFST:	set	2
7866                     ; 363 GPIOF->DDR|=(1<<4);
7868  037e 7218501b      	bset	20507,#4
7869                     ; 364 GPIOF->ODR&=~(1<<4);
7871  0382 72195019      	bres	20505,#4
7872                     ; 367 for(i=0;i<10;i++)
7874  0386 5f            	clrw	x
7875  0387 1f01          	ldw	(OFST-1,sp),x
7876  0389               L3175:
7877                     ; 369 	__nop();
7880  0389 9d            nop
7882                     ; 367 for(i=0;i<10;i++)
7884  038a 1e01          	ldw	x,(OFST-1,sp)
7885  038c 1c0001        	addw	x,#1
7886  038f 1f01          	ldw	(OFST-1,sp),x
7889  0391 9c            	rvf
7890  0392 1e01          	ldw	x,(OFST-1,sp)
7891  0394 a3000a        	cpw	x,#10
7892  0397 2ff0          	jrslt	L3175
7893                     ; 371 GPIOF->ODR|=(1<<4);
7895  0399 72185019      	bset	20505,#4
7896                     ; 374 for(i=0;i<90;i++)
7898  039d 5f            	clrw	x
7899  039e 1f01          	ldw	(OFST-1,sp),x
7900  03a0               L1275:
7901                     ; 376 	__nop();
7904  03a0 9d            nop
7906                     ; 374 for(i=0;i<90;i++)
7908  03a1 1e01          	ldw	x,(OFST-1,sp)
7909  03a3 1c0001        	addw	x,#1
7910  03a6 1f01          	ldw	(OFST-1,sp),x
7913  03a8 9c            	rvf
7914  03a9 1e01          	ldw	x,(OFST-1,sp)
7915  03ab a3005a        	cpw	x,#90
7916  03ae 2ff0          	jrslt	L1275
7917                     ; 378 }
7920  03b0 85            	popw	x
7921  03b1 81            	ret
7957                     ; 381 char ibatton_w0ts(void)
7957                     ; 382 {
7958                     	switch	.text
7959  03b2               _ibatton_w0ts:
7961  03b2 89            	pushw	x
7962       00000002      OFST:	set	2
7965                     ; 384 GPIOF->DDR|=(1<<4);
7967  03b3 7218501b      	bset	20507,#4
7968                     ; 385 GPIOF->ODR&=~(1<<4);
7970  03b7 72195019      	bres	20505,#4
7971                     ; 388 for(i=0;i<90;i++)
7973  03bb 5f            	clrw	x
7974  03bc 1f01          	ldw	(OFST-1,sp),x
7975  03be               L5475:
7976                     ; 390 	__nop();
7979  03be 9d            nop
7981                     ; 388 for(i=0;i<90;i++)
7983  03bf 1e01          	ldw	x,(OFST-1,sp)
7984  03c1 1c0001        	addw	x,#1
7985  03c4 1f01          	ldw	(OFST-1,sp),x
7988  03c6 9c            	rvf
7989  03c7 1e01          	ldw	x,(OFST-1,sp)
7990  03c9 a3005a        	cpw	x,#90
7991  03cc 2ff0          	jrslt	L5475
7992                     ; 392 GPIOF->ODR|=(1<<4);
7994  03ce 72185019      	bset	20505,#4
7995                     ; 395 for(i=0;i<10;i++)
7997  03d2 5f            	clrw	x
7998  03d3 1f01          	ldw	(OFST-1,sp),x
7999  03d5               L3575:
8000                     ; 397 	__nop();
8003  03d5 9d            nop
8005                     ; 395 for(i=0;i<10;i++)
8007  03d6 1e01          	ldw	x,(OFST-1,sp)
8008  03d8 1c0001        	addw	x,#1
8009  03db 1f01          	ldw	(OFST-1,sp),x
8012  03dd 9c            	rvf
8013  03de 1e01          	ldw	x,(OFST-1,sp)
8014  03e0 a3000a        	cpw	x,#10
8015  03e3 2ff0          	jrslt	L3575
8016                     ; 399 }
8019  03e5 85            	popw	x
8020  03e6 81            	ret
8074                     ; 402 void ibatton_send_byte(char in)
8074                     ; 403 {
8075                     	switch	.text
8076  03e7               _ibatton_send_byte:
8078  03e7 89            	pushw	x
8079       00000002      OFST:	set	2
8082                     ; 405 ii=in;
8084  03e8 6b02          	ld	(OFST+0,sp),a
8085                     ; 407 for(i=0;i<8;i++)
8087  03ea 0f01          	clr	(OFST-1,sp)
8088  03ec               L7006:
8089                     ; 409 	if(ii&0x01)ibatton_w1ts();
8091  03ec 7b02          	ld	a,(OFST+0,sp)
8092  03ee a501          	bcp	a,#1
8093  03f0 2704          	jreq	L5106
8096  03f2 ad89          	call	_ibatton_w1ts
8099  03f4 2002          	jra	L7106
8100  03f6               L5106:
8101                     ; 410 	else ibatton_w0ts();
8103  03f6 adba          	call	_ibatton_w0ts
8105  03f8               L7106:
8106                     ; 411 	ii>>=1;
8108  03f8 0402          	srl	(OFST+0,sp)
8109                     ; 407 for(i=0;i<8;i++)
8111  03fa 0c01          	inc	(OFST-1,sp)
8114  03fc 7b01          	ld	a,(OFST-1,sp)
8115  03fe a108          	cp	a,#8
8116  0400 25ea          	jrult	L7006
8117                     ; 413 }
8120  0402 85            	popw	x
8121  0403 81            	ret
8165                     ; 416 char ibatton_read_byte(void)
8165                     ; 417 {
8166                     	switch	.text
8167  0404               _ibatton_read_byte:
8169  0404 89            	pushw	x
8170       00000002      OFST:	set	2
8173                     ; 419 ii=0;
8175  0405 0f02          	clr	(OFST+0,sp)
8176                     ; 421 for(i=0;i<8;i++)
8178  0407 0f01          	clr	(OFST-1,sp)
8179  0409               L3406:
8180                     ; 423 	ii>>=1;
8182  0409 0402          	srl	(OFST+0,sp)
8183                     ; 424 	if(ibatton_rts())ii|=0x80;
8185  040b ad1d          	call	_ibatton_rts
8187  040d 4d            	tnz	a
8188  040e 2708          	jreq	L1506
8191  0410 7b02          	ld	a,(OFST+0,sp)
8192  0412 aa80          	or	a,#128
8193  0414 6b02          	ld	(OFST+0,sp),a
8195  0416 2006          	jra	L3506
8196  0418               L1506:
8197                     ; 425 	else ii&=0x7f;
8199  0418 7b02          	ld	a,(OFST+0,sp)
8200  041a a47f          	and	a,#127
8201  041c 6b02          	ld	(OFST+0,sp),a
8202  041e               L3506:
8203                     ; 421 for(i=0;i<8;i++)
8205  041e 0c01          	inc	(OFST-1,sp)
8208  0420 7b01          	ld	a,(OFST-1,sp)
8209  0422 a108          	cp	a,#8
8210  0424 25e3          	jrult	L3406
8211                     ; 427 return ii;
8213  0426 7b02          	ld	a,(OFST+0,sp)
8216  0428 85            	popw	x
8217  0429 81            	ret
8263                     ; 431 char ibatton_rts(void)
8263                     ; 432 {
8264                     	switch	.text
8265  042a               _ibatton_rts:
8267  042a 5204          	subw	sp,#4
8268       00000004      OFST:	set	4
8271                     ; 435 GPIOF->DDR|=(1<<4);
8273  042c 7218501b      	bset	20507,#4
8274                     ; 436 GPIOF->ODR&=~(1<<4);
8276  0430 72195019      	bres	20505,#4
8277                     ; 439 for(i=0;i<2;i++)
8279  0434 5f            	clrw	x
8280  0435 1f03          	ldw	(OFST-1,sp),x
8281  0437               L7706:
8282                     ; 441 	__nop();
8285  0437 9d            nop
8287                     ; 439 for(i=0;i<2;i++)
8289  0438 1e03          	ldw	x,(OFST-1,sp)
8290  043a 1c0001        	addw	x,#1
8291  043d 1f03          	ldw	(OFST-1,sp),x
8294  043f 9c            	rvf
8295  0440 1e03          	ldw	x,(OFST-1,sp)
8296  0442 a30002        	cpw	x,#2
8297  0445 2ff0          	jrslt	L7706
8298                     ; 444 GPIOF->ODR|=(1<<4);
8300  0447 72185019      	bset	20505,#4
8301                     ; 446 for(i=0;i<10;i++)
8303  044b 5f            	clrw	x
8304  044c 1f03          	ldw	(OFST-1,sp),x
8305  044e               L5016:
8306                     ; 448 	__nop();
8309  044e 9d            nop
8311                     ; 446 for(i=0;i<10;i++)
8313  044f 1e03          	ldw	x,(OFST-1,sp)
8314  0451 1c0001        	addw	x,#1
8315  0454 1f03          	ldw	(OFST-1,sp),x
8318  0456 9c            	rvf
8319  0457 1e03          	ldw	x,(OFST-1,sp)
8320  0459 a3000a        	cpw	x,#10
8321  045c 2ff0          	jrslt	L5016
8322                     ; 450 if(GPIOF->IDR&(1<<4))	ii=1;
8324  045e c6501a        	ld	a,20506
8325  0461 a510          	bcp	a,#16
8326  0463 2707          	jreq	L3116
8329  0465 ae0001        	ldw	x,#1
8330  0468 1f01          	ldw	(OFST-3,sp),x
8332  046a 2003          	jra	L5116
8333  046c               L3116:
8334                     ; 451 else ii=0;
8336  046c 5f            	clrw	x
8337  046d 1f01          	ldw	(OFST-3,sp),x
8338  046f               L5116:
8339                     ; 454 for(i=0;i<50;i++)
8341  046f 5f            	clrw	x
8342  0470 1f03          	ldw	(OFST-1,sp),x
8343  0472               L7116:
8344                     ; 456 	__nop();
8347  0472 9d            nop
8349                     ; 454 for(i=0;i<50;i++)
8351  0473 1e03          	ldw	x,(OFST-1,sp)
8352  0475 1c0001        	addw	x,#1
8353  0478 1f03          	ldw	(OFST-1,sp),x
8356  047a 9c            	rvf
8357  047b 1e03          	ldw	x,(OFST-1,sp)
8358  047d a30032        	cpw	x,#50
8359  0480 2ff0          	jrslt	L7116
8360                     ; 458 return ii;
8362  0482 7b02          	ld	a,(OFST-2,sp)
8365  0484 5b04          	addw	sp,#4
8366  0486 81            	ret
8473                     	switch	.ubsct
8474  0000               _ibatton_not_ready_cnt:
8475  0000 0000          	ds.b	2
8476                     	xdef	_ibatton_not_ready_cnt
8477                     	xref	_EE_FISK_CNT
8478                     	xref	_EE_NUM_OF_BALLS
8479                     	xref	_EE_REMAIN_BALLS
8480                     	xref	_EE_BONUS_SIGMA
8481                     	xref	_EE_WRK_BUTTON
8482                     	xref	_EE_MAIN_BUTTON
8483                     	xref.b	_plazma_ibatton2
8484                     	xref.b	_plazma_ibatton1
8485                     	xref.b	_wrk_cnt
8486                     	xref.b	_wrk_stat
8487                     	xref.b	_i_ser_num_cnt
8488                     	xref.b	_ret_cnt
8489                     	xref.b	_sub_ind
8490                     	xref.b	_ret_ind
8491                     	xref.b	_ind
8492                     	xdef	_ibatton_read_byte
8493                     	xdef	_ibatton_send_byte
8494                     	xdef	_ibatton_rts
8495                     	xdef	_ibatton_w0ts
8496                     	xdef	_ibatton_w1ts
8497                     	xdef	_ibatton_read_rom
8498                     	xdef	_ibatton_polling
8499                     	xdef	_ibatton_an
8500                     	xdef	_ibatton_drv
8501  0002               _ibatton_plazma:
8502  0002 0000          	ds.b	2
8503                     	xdef	_ibatton_plazma
8504  0004               _ibatton_n_:
8505  0004 00            	ds.b	1
8506                     	xdef	_ibatton_n_
8507  0005               _ibatton_n:
8508  0005 00            	ds.b	1
8509                     	xdef	_ibatton_n
8510  0006               _ibatton:
8511  0006 00000000      	ds.b	4
8512                     	xdef	_ibatton
8513  000a               _ibatton_old:
8514  000a 00000000      	ds.b	4
8515                     	xdef	_ibatton_old
8516  000e               _ibatton_new:
8517  000e 00000000      	ds.b	4
8518                     	xdef	_ibatton_new
8519  0012               _ibatton_repeat_cnt:
8520  0012 0000          	ds.b	2
8521                     	xdef	_ibatton_repeat_cnt
8522  0014               _res:
8523  0014 000000000000  	ds.b	8
8524                     	xdef	_res
8525                     	xref.b	c_lreg
8526                     	xref.b	c_x
8527                     	xref.b	c_y
8547                     	xref	c_lzmp
8548                     	xref	c_ladd
8549                     	xref	c_rtol
8550                     	xref	c_llsh
8551                     	xref	c_ladc
8552                     	xref	c_umul
8553                     	xref	c_eewrw
8554                     	xref	c_eewrl
8555                     	xref	c_lcmp
8556                     	xref	c_ltor
8557                     	end
