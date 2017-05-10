   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
6826                     	switch	.data
6827  0000               _b1000Hz:
6828  0000 00            	dc.b	0
6829  0001               _b100Hz:
6830  0001 00            	dc.b	0
6831  0002               _b10Hz:
6832  0002 00            	dc.b	0
6833  0003               _b5Hz:
6834  0003 00            	dc.b	0
6835  0004               _b2Hz:
6836  0004 00            	dc.b	0
6837  0005               _b1Hz:
6838  0005 00            	dc.b	0
6839  0006               _t0_cnt0:
6840  0006 00            	dc.b	0
6841  0007               _t0_cnt1:
6842  0007 00            	dc.b	0
6843  0008               _t0_cnt2:
6844  0008 00            	dc.b	0
6845  0009               _t0_cnt3:
6846  0009 00            	dc.b	0
6847  000a               _t0_cnt4:
6848  000a 00            	dc.b	0
6869                     	bsct
6870  0000               _but_cnt:
6871  0000 00            	dc.b	0
6872  0001               _rel_out_cnt:
6873  0001 0000          	dc.w	0
6874  0003               _bZATVOR:
6875  0003 00            	dc.b	0
6876  0004               _ind_out:
6877  0004 ff            	dc.b	255
6878  0005 ff            	dc.b	255
6879  0006 ff            	dc.b	255
6880  0007 ff            	dc.b	255
6881  0008 ff            	dc.b	255
6882  0009 ff            	dc.b	255
6883  000a ff            	dc.b	255
6884                     .const:	section	.text
6885  0000               _DIGISYM:
6886  0000 81            	dc.b	129
6887  0001 f3            	dc.b	243
6888  0002 49            	dc.b	73
6889  0003 61            	dc.b	97
6890  0004 33            	dc.b	51
6891  0005 25            	dc.b	37
6892  0006 05            	dc.b	5
6893  0007 f1            	dc.b	241
6894  0008 01            	dc.b	1
6895  0009 21            	dc.b	33
6896  000a 11            	dc.b	17
6897  000b 07            	dc.b	7
6898  000c 8d            	dc.b	141
6899  000d 43            	dc.b	67
6900  000e 07            	dc.b	7
6901  000f 0f            	dc.b	15
6902  0010 ff            	dc.b	255
6903  0011 ff            	dc.b	255
6904  0012 ff            	dc.b	255
6905  0013 ff            	dc.b	255
6906  0014 ff            	dc.b	255
6907  0015 fd            	dc.b	253
6908  0016 fb            	dc.b	251
6909  0017 f7            	dc.b	247
6910  0018 ef            	dc.b	239
6911  0019 df            	dc.b	223
6912  001a bf            	dc.b	191
6913  001b 7f            	dc.b	127
6914  001c 0000          	ds.b	2
6915                     	bsct
6916  000b               _ind_on_cnt:
6917  000b 0000          	dc.w	0
6918  000d               _ind_on_cnt1:
6919  000d 0000          	dc.w	0
6920  000f               _bERR:
6921  000f 01            	dc.b	1
6922  0010               _wrk_stat:
6923  0010 00            	dc.b	0
6924  0011               _plazma_ibatton1:
6925  0011 01            	dc.b	1
6926  0012               _plazma_ibatton2:
6927  0012 02            	dc.b	2
6977                     	switch	.const
6978  001e               L6:
6979  001e 0000000a      	dc.l	10
6980                     ; 110 void bin2bcd_long(unsigned long in) {
6981                     	scross	off
6982                     	switch	.text
6983  0000               _bin2bcd_long:
6985  0000 88            	push	a
6986       00000001      OFST:	set	1
6989                     ; 113 for(i=0;i<10;i++)
6991  0001 0f01          	clr	(OFST+0,sp)
6992  0003               L3545:
6993                     ; 115 	dig[i]=in%10L;
6995  0003 96            	ldw	x,sp
6996  0004 1c0004        	addw	x,#OFST+3
6997  0007 cd0000        	call	c_ltor
6999  000a ae001e        	ldw	x,#L6
7000  000d cd0000        	call	c_lumd
7002  0010 7b01          	ld	a,(OFST+0,sp)
7003  0012 5f            	clrw	x
7004  0013 97            	ld	xl,a
7005  0014 b603          	ld	a,c_lreg+3
7006  0016 e714          	ld	(_dig,x),a
7007                     ; 116 	in/=10L;
7009  0018 96            	ldw	x,sp
7010  0019 1c0004        	addw	x,#OFST+3
7011  001c cd0000        	call	c_ltor
7013  001f ae001e        	ldw	x,#L6
7014  0022 cd0000        	call	c_ludv
7016  0025 96            	ldw	x,sp
7017  0026 1c0004        	addw	x,#OFST+3
7018  0029 cd0000        	call	c_rtol
7020                     ; 113 for(i=0;i<10;i++)
7022  002c 0c01          	inc	(OFST+0,sp)
7025  002e 7b01          	ld	a,(OFST+0,sp)
7026  0030 a10a          	cp	a,#10
7027  0032 25cf          	jrult	L3545
7028                     ; 118 }
7031  0034 84            	pop	a
7032  0035 81            	ret
7076                     ; 120 void bin2bcd_int(unsigned short in) {
7077                     	switch	.text
7078  0036               _bin2bcd_int:
7080  0036 89            	pushw	x
7081  0037 88            	push	a
7082       00000001      OFST:	set	1
7085                     ; 122 char i=5;
7087                     ; 124 for(i=0;i<5;i++)
7089  0038 0f01          	clr	(OFST+0,sp)
7090  003a               L3055:
7091                     ; 126 	dig[i]=in%10;
7093  003a 1e02          	ldw	x,(OFST+1,sp)
7094  003c 90ae000a      	ldw	y,#10
7095  0040 65            	divw	x,y
7096  0041 51            	exgw	x,y
7097  0042 7b01          	ld	a,(OFST+0,sp)
7098  0044 905f          	clrw	y
7099  0046 9097          	ld	yl,a
7100  0048 01            	rrwa	x,a
7101  0049 90e714        	ld	(_dig,y),a
7102  004c 02            	rlwa	x,a
7103                     ; 127 	in/=10;
7105  004d 1e02          	ldw	x,(OFST+1,sp)
7106  004f 90ae000a      	ldw	y,#10
7107  0053 65            	divw	x,y
7108  0054 1f02          	ldw	(OFST+1,sp),x
7109                     ; 124 for(i=0;i<5;i++)
7111  0056 0c01          	inc	(OFST+0,sp)
7114  0058 7b01          	ld	a,(OFST+0,sp)
7115  005a a105          	cp	a,#5
7116  005c 25dc          	jrult	L3055
7117                     ; 129 }
7120  005e 5b03          	addw	sp,#3
7121  0060 81            	ret
7158                     ; 131 void bcd2ind(void) {
7159                     	switch	.text
7160  0061               _bcd2ind:
7162  0061 88            	push	a
7163       00000001      OFST:	set	1
7166                     ; 134 for (i=4;i>0;i--)
7168  0062 a604          	ld	a,#4
7169  0064 6b01          	ld	(OFST+0,sp),a
7170  0066               L7255:
7171                     ; 136 	ind_out_[i-1]=DIGISYM[dig[i-1]];
7173  0066 7b01          	ld	a,(OFST+0,sp)
7174  0068 5f            	clrw	x
7175  0069 97            	ld	xl,a
7176  006a 5a            	decw	x
7177  006b 7b01          	ld	a,(OFST+0,sp)
7178  006d 905f          	clrw	y
7179  006f 9097          	ld	yl,a
7180  0071 905a          	decw	y
7181  0073 90e614        	ld	a,(_dig,y)
7182  0076 905f          	clrw	y
7183  0078 9097          	ld	yl,a
7184  007a 90d60000      	ld	a,(_DIGISYM,y)
7185  007e e70a          	ld	(_ind_out_,x),a
7186                     ; 134 for (i=4;i>0;i--)
7188  0080 0a01          	dec	(OFST+0,sp)
7191  0082 0d01          	tnz	(OFST+0,sp)
7192  0084 26e0          	jrne	L7255
7193                     ; 138 }
7196  0086 84            	pop	a
7197  0087 81            	ret
7235                     ; 140 void bcd2ind_zero() {
7236                     	switch	.text
7237  0088               _bcd2ind_zero:
7239  0088 88            	push	a
7240       00000001      OFST:	set	1
7243                     ; 142 zero_on=1;
7245  0089 35010013      	mov	_zero_on,#1
7246                     ; 143 for (i=4;i>0;i--)
7248  008d a604          	ld	a,#4
7249  008f 6b01          	ld	(OFST+0,sp),a
7250  0091               L3555:
7251                     ; 145 	if(zero_on&&(!dig[i-1])&&(i-1))
7253  0091 3d13          	tnz	_zero_on
7254  0093 271e          	jreq	L1655
7256  0095 7b01          	ld	a,(OFST+0,sp)
7257  0097 5f            	clrw	x
7258  0098 97            	ld	xl,a
7259  0099 5a            	decw	x
7260  009a 6d14          	tnz	(_dig,x)
7261  009c 2615          	jrne	L1655
7263  009e 7b01          	ld	a,(OFST+0,sp)
7264  00a0 5f            	clrw	x
7265  00a1 97            	ld	xl,a
7266  00a2 5a            	decw	x
7267  00a3 a30000        	cpw	x,#0
7268  00a6 270b          	jreq	L1655
7269                     ; 147 		ind_out_[i-1]=0b11111111;
7271  00a8 7b01          	ld	a,(OFST+0,sp)
7272  00aa 5f            	clrw	x
7273  00ab 97            	ld	xl,a
7274  00ac 5a            	decw	x
7275  00ad a6ff          	ld	a,#255
7276  00af e70a          	ld	(_ind_out_,x),a
7278  00b1 201c          	jra	L3655
7279  00b3               L1655:
7280                     ; 151 		ind_out_[i-1]=DIGISYM[dig[i-1]];
7282  00b3 7b01          	ld	a,(OFST+0,sp)
7283  00b5 5f            	clrw	x
7284  00b6 97            	ld	xl,a
7285  00b7 5a            	decw	x
7286  00b8 7b01          	ld	a,(OFST+0,sp)
7287  00ba 905f          	clrw	y
7288  00bc 9097          	ld	yl,a
7289  00be 905a          	decw	y
7290  00c0 90e614        	ld	a,(_dig,y)
7291  00c3 905f          	clrw	y
7292  00c5 9097          	ld	yl,a
7293  00c7 90d60000      	ld	a,(_DIGISYM,y)
7294  00cb e70a          	ld	(_ind_out_,x),a
7295                     ; 152 		zero_on=0;
7297  00cd 3f13          	clr	_zero_on
7298  00cf               L3655:
7299                     ; 143 for (i=4;i>0;i--)
7301  00cf 0a01          	dec	(OFST+0,sp)
7304  00d1 0d01          	tnz	(OFST+0,sp)
7305  00d3 26bc          	jrne	L3555
7306                     ; 155 }
7309  00d5 84            	pop	a
7310  00d6 81            	ret
7346                     ; 157 void long2ind(unsigned long in) {
7347                     	switch	.text
7348  00d7               _long2ind:
7350       00000000      OFST:	set	0
7353                     ; 159 bin2bcd_long(in);
7355  00d7 1e05          	ldw	x,(OFST+5,sp)
7356  00d9 89            	pushw	x
7357  00da 1e05          	ldw	x,(OFST+5,sp)
7358  00dc 89            	pushw	x
7359  00dd cd0000        	call	_bin2bcd_long
7361  00e0 5b04          	addw	sp,#4
7362                     ; 160 bcd2ind_zero();
7364  00e2 ada4          	call	_bcd2ind_zero
7366                     ; 162 }
7369  00e4 81            	ret
7466                     ; 164 void int2ind_slkuf(unsigned short in, char start, char len, char komma, char unzero, char fl) {
7467                     	switch	.text
7468  00e5               _int2ind_slkuf:
7470  00e5 89            	pushw	x
7471  00e6 88            	push	a
7472       00000001      OFST:	set	1
7475                     ; 167 	bin2bcd_int(in);
7477  00e7 cd0036        	call	_bin2bcd_int
7479                     ; 168 	if(unzero)bcd2ind_zero();
7481  00ea 0d09          	tnz	(OFST+8,sp)
7482  00ec 2704          	jreq	L1565
7485  00ee ad98          	call	_bcd2ind_zero
7488  00f0 2003          	jra	L3565
7489  00f2               L1565:
7490                     ; 169 	else bcd2ind();
7492  00f2 cd0061        	call	_bcd2ind
7494  00f5               L3565:
7495                     ; 170 	if(komma)ind_out_[komma]&=0b11111110; 
7497  00f5 0d08          	tnz	(OFST+7,sp)
7498  00f7 270a          	jreq	L5565
7501  00f9 7b08          	ld	a,(OFST+7,sp)
7502  00fb 5f            	clrw	x
7503  00fc 97            	ld	xl,a
7504  00fd e60a          	ld	a,(_ind_out_,x)
7505  00ff a4fe          	and	a,#254
7506  0101 e70a          	ld	(_ind_out_,x),a
7507  0103               L5565:
7508                     ; 171 	if(((fl==1)&&(bFL1)) ||
7508                     ; 172 	   ((fl==2)&&(bFL2)) ||
7508                     ; 173 	   ((fl==5)&&(bFL5))) {
7510  0103 7b0a          	ld	a,(OFST+9,sp)
7511  0105 a101          	cp	a,#1
7512  0107 2604          	jrne	L3665
7514  0109 3d10          	tnz	_bFL1
7515  010b 2614          	jrne	L1665
7516  010d               L3665:
7518  010d 7b0a          	ld	a,(OFST+9,sp)
7519  010f a102          	cp	a,#2
7520  0111 2604          	jrne	L7665
7522  0113 3d11          	tnz	_bFL2
7523  0115 260a          	jrne	L1665
7524  0117               L7665:
7526  0117 7b0a          	ld	a,(OFST+9,sp)
7527  0119 a105          	cp	a,#5
7528  011b 2618          	jrne	L7565
7530  011d 3d12          	tnz	_bFL5
7531  011f 2714          	jreq	L7565
7532  0121               L1665:
7533                     ; 174 		for(i=0;i<len;i++) {
7535  0121 0f01          	clr	(OFST+0,sp)
7537  0123 200a          	jra	L5765
7538  0125               L1765:
7539                     ; 175 			ind_out_[i]=DIGISYM[17];
7541  0125 7b01          	ld	a,(OFST+0,sp)
7542  0127 5f            	clrw	x
7543  0128 97            	ld	xl,a
7544  0129 a6ff          	ld	a,#255
7545  012b e70a          	ld	(_ind_out_,x),a
7546                     ; 174 		for(i=0;i<len;i++) {
7548  012d 0c01          	inc	(OFST+0,sp)
7549  012f               L5765:
7552  012f 7b01          	ld	a,(OFST+0,sp)
7553  0131 1107          	cp	a,(OFST+6,sp)
7554  0133 25f0          	jrult	L1765
7555  0135               L7565:
7556                     ; 179 	for(i=0;i<len;i++) {
7558  0135 0f01          	clr	(OFST+0,sp)
7560  0137 2016          	jra	L5075
7561  0139               L1075:
7562                     ; 180 		ind_out[start+i]=ind_out_[i];
7564  0139 7b06          	ld	a,(OFST+5,sp)
7565  013b 5f            	clrw	x
7566  013c 1b01          	add	a,(OFST+0,sp)
7567  013e 2401          	jrnc	L22
7568  0140 5c            	incw	x
7569  0141               L22:
7570  0141 02            	rlwa	x,a
7571  0142 7b01          	ld	a,(OFST+0,sp)
7572  0144 905f          	clrw	y
7573  0146 9097          	ld	yl,a
7574  0148 90e60a        	ld	a,(_ind_out_,y)
7575  014b e704          	ld	(_ind_out,x),a
7576                     ; 179 	for(i=0;i<len;i++) {
7578  014d 0c01          	inc	(OFST+0,sp)
7579  014f               L5075:
7582  014f 7b01          	ld	a,(OFST+0,sp)
7583  0151 1107          	cp	a,(OFST+6,sp)
7584  0153 25e4          	jrult	L1075
7585                     ; 184 }
7588  0155 5b03          	addw	sp,#3
7589  0157 81            	ret
7647                     ; 186 void char2indh_sf(unsigned char in, char start, char fl) {
7648                     	switch	.text
7649  0158               _char2indh_sf:
7651  0158 89            	pushw	x
7652       00000000      OFST:	set	0
7655                     ; 189 	ind_out_[0]=DIGISYM[in%16];
7657  0159 9e            	ld	a,xh
7658  015a a40f          	and	a,#15
7659  015c 5f            	clrw	x
7660  015d 97            	ld	xl,a
7661  015e d60000        	ld	a,(_DIGISYM,x)
7662  0161 b70a          	ld	_ind_out_,a
7663                     ; 190 	ind_out_[1]=DIGISYM[in/16];
7665  0163 7b01          	ld	a,(OFST+1,sp)
7666  0165 4e            	swap	a
7667  0166 a40f          	and	a,#15
7668  0168 5f            	clrw	x
7669  0169 97            	ld	xl,a
7670  016a d60000        	ld	a,(_DIGISYM,x)
7671  016d b70b          	ld	_ind_out_+1,a
7672                     ; 192 	if(((fl==1)&&(bFL1)) ||
7672                     ; 193 	   ((fl==2)&&(bFL2)) ||
7672                     ; 194 	   ((fl==5)&&(bFL5))) {
7674  016f 7b05          	ld	a,(OFST+5,sp)
7675  0171 a101          	cp	a,#1
7676  0173 2604          	jrne	L3475
7678  0175 3d10          	tnz	_bFL1
7679  0177 2614          	jrne	L1475
7680  0179               L3475:
7682  0179 7b05          	ld	a,(OFST+5,sp)
7683  017b a102          	cp	a,#2
7684  017d 2604          	jrne	L7475
7686  017f 3d11          	tnz	_bFL2
7687  0181 260a          	jrne	L1475
7688  0183               L7475:
7690  0183 7b05          	ld	a,(OFST+5,sp)
7691  0185 a105          	cp	a,#5
7692  0187 260c          	jrne	L7375
7694  0189 3d12          	tnz	_bFL5
7695  018b 2708          	jreq	L7375
7696  018d               L1475:
7697                     ; 195 		ind_out_[0]=DIGISYM[17];
7699  018d 35ff000a      	mov	_ind_out_,#255
7700                     ; 196 		ind_out_[1]=DIGISYM[17];
7702  0191 35ff000b      	mov	_ind_out_+1,#255
7703  0195               L7375:
7704                     ; 200 	ind_out[start]=ind_out_[0];
7706  0195 7b02          	ld	a,(OFST+2,sp)
7707  0197 5f            	clrw	x
7708  0198 97            	ld	xl,a
7709  0199 b60a          	ld	a,_ind_out_
7710  019b e704          	ld	(_ind_out,x),a
7711                     ; 201 	ind_out[start+1]=ind_out_[1];
7713  019d 7b02          	ld	a,(OFST+2,sp)
7714  019f 5f            	clrw	x
7715  01a0 97            	ld	xl,a
7716  01a1 b60b          	ld	a,_ind_out_+1
7717  01a3 e705          	ld	(_ind_out+1,x),a
7718                     ; 205 }
7721  01a5 85            	popw	x
7722  01a6 81            	ret
7764                     ; 207 void ind_hndl(void) {
7765                     	switch	.text
7766  01a7               _ind_hndl:
7768  01a7 89            	pushw	x
7769       00000002      OFST:	set	2
7772                     ; 209 	if(ind==iMn) {
7774  01a8 3d55          	tnz	_ind
7775  01aa 2628          	jrne	L1675
7776                     ; 210 		int2ind_slkuf(cnt_bFIRE_,0,3,0,1,0);
7778  01ac 4b00          	push	#0
7779  01ae 4b01          	push	#1
7780  01b0 4b00          	push	#0
7781  01b2 4b03          	push	#3
7782  01b4 4b00          	push	#0
7783  01b6 be21          	ldw	x,_cnt_bFIRE_
7784  01b8 cd00e5        	call	_int2ind_slkuf
7786  01bb 5b05          	addw	sp,#5
7787                     ; 211 		int2ind_slkuf(bFIRE_,3,1,0,1,0);
7789  01bd 4b00          	push	#0
7790  01bf 4b01          	push	#1
7791  01c1 4b00          	push	#0
7792  01c3 4b01          	push	#1
7793  01c5 4b03          	push	#3
7794  01c7 b628          	ld	a,_bFIRE_
7795  01c9 5f            	clrw	x
7796  01ca 97            	ld	xl,a
7797  01cb cd00e5        	call	_int2ind_slkuf
7799  01ce 5b05          	addw	sp,#5
7801  01d0 ac1d051d      	jpf	L3675
7802  01d4               L1675:
7803                     ; 219 	else if(ind==iBtn) {
7805  01d4 b655          	ld	a,_ind
7806  01d6 a101          	cp	a,#1
7807  01d8 2616          	jrne	L5675
7808                     ; 220 		int2ind_slkuf(321,0,3,0,1,0);
7810  01da 4b00          	push	#0
7811  01dc 4b01          	push	#1
7812  01de 4b00          	push	#0
7813  01e0 4b03          	push	#3
7814  01e2 4b00          	push	#0
7815  01e4 ae0141        	ldw	x,#321
7816  01e7 cd00e5        	call	_int2ind_slkuf
7818  01ea 5b05          	addw	sp,#5
7820  01ec ac1d051d      	jpf	L3675
7821  01f0               L5675:
7822                     ; 223 	else if(ind==iWait) {
7824  01f0 b655          	ld	a,_ind
7825  01f2 a102          	cp	a,#2
7826  01f4 2677          	jrne	L1775
7827                     ; 224 		ind_ind_cnt++;
7829  01f6 3c07          	inc	_ind_ind_cnt
7830                     ; 225 		if(ind_ind_cnt>50)ind_ind_cnt=0;
7832  01f8 b607          	ld	a,_ind_ind_cnt
7833  01fa a133          	cp	a,#51
7834  01fc 2502          	jrult	L3775
7837  01fe 3f07          	clr	_ind_ind_cnt
7838  0200               L3775:
7839                     ; 227 		if(ind_ind_cnt<18) {
7841  0200 b607          	ld	a,_ind_ind_cnt
7842  0202 a112          	cp	a,#18
7843  0204 243a          	jruge	L5775
7844                     ; 228 			ind_out[0]=DIGISYM[21+(ind_ind_cnt%6)];
7846  0206 b607          	ld	a,_ind_ind_cnt
7847  0208 5f            	clrw	x
7848  0209 97            	ld	xl,a
7849  020a a606          	ld	a,#6
7850  020c cd0000        	call	c_smodx
7852  020f d60015        	ld	a,(_DIGISYM+21,x)
7853  0212 b704          	ld	_ind_out,a
7854                     ; 229 			ind_out[1]=DIGISYM[21+(ind_ind_cnt%6)];
7856  0214 b607          	ld	a,_ind_ind_cnt
7857  0216 5f            	clrw	x
7858  0217 97            	ld	xl,a
7859  0218 a606          	ld	a,#6
7860  021a cd0000        	call	c_smodx
7862  021d d60015        	ld	a,(_DIGISYM+21,x)
7863  0220 b705          	ld	_ind_out+1,a
7864                     ; 230 			ind_out[2]=DIGISYM[21+(ind_ind_cnt%6)];
7866  0222 b607          	ld	a,_ind_ind_cnt
7867  0224 5f            	clrw	x
7868  0225 97            	ld	xl,a
7869  0226 a606          	ld	a,#6
7870  0228 cd0000        	call	c_smodx
7872  022b d60015        	ld	a,(_DIGISYM+21,x)
7873  022e b706          	ld	_ind_out+2,a
7874                     ; 231 			ind_out[3]=DIGISYM[21+(ind_ind_cnt%6)];
7876  0230 b607          	ld	a,_ind_ind_cnt
7877  0232 5f            	clrw	x
7878  0233 97            	ld	xl,a
7879  0234 a606          	ld	a,#6
7880  0236 cd0000        	call	c_smodx
7882  0239 d60015        	ld	a,(_DIGISYM+21,x)
7883  023c b707          	ld	_ind_out+3,a
7885  023e 2012          	jra	L7775
7886  0240               L5775:
7887                     ; 234 			int2ind_slkuf(EE_BONUS_SIGMA,0,4,0,1,2);
7889  0240 4b02          	push	#2
7890  0242 4b01          	push	#1
7891  0244 4b00          	push	#0
7892  0246 4b04          	push	#4
7893  0248 4b00          	push	#0
7894  024a ce4030        	ldw	x,_EE_BONUS_SIGMA
7895  024d cd00e5        	call	_int2ind_slkuf
7897  0250 5b05          	addw	sp,#5
7898  0252               L7775:
7899                     ; 236 		if(bERR){
7901  0252 3d0f          	tnz	_bERR
7902  0254 2603          	jrne	L43
7903  0256 cc051d        	jp	L3675
7904  0259               L43:
7905                     ; 237 			ind_out[0]=0b01011111;
7907  0259 355f0004      	mov	_ind_out,#95
7908                     ; 238 			ind_out[1]=0b01011111;
7910  025d 355f0005      	mov	_ind_out+1,#95
7911                     ; 239 			ind_out[2]=0b00001101;
7913  0261 350d0006      	mov	_ind_out+2,#13
7914                     ; 240 			ind_out[3]=0b11111111;
7916  0265 35ff0007      	mov	_ind_out+3,#255
7917  0269 ac1d051d      	jpf	L3675
7918  026d               L1775:
7919                     ; 247 	else if(ind==iWait1) {
7921  026d b655          	ld	a,_ind
7922  026f a10c          	cp	a,#12
7923  0271 263a          	jrne	L5006
7924                     ; 248 		ind_ind_cnt++;
7926  0273 3c07          	inc	_ind_ind_cnt
7927                     ; 249 		if(ind_ind_cnt==3)ind_ind_cnt++;
7929  0275 b607          	ld	a,_ind_ind_cnt
7930  0277 a103          	cp	a,#3
7931  0279 2602          	jrne	L7006
7934  027b 3c07          	inc	_ind_ind_cnt
7935  027d               L7006:
7936                     ; 250 		if(ind_ind_cnt>4)ind_ind_cnt=0;
7938  027d b607          	ld	a,_ind_ind_cnt
7939  027f a105          	cp	a,#5
7940  0281 2502          	jrult	L1106
7943  0283 3f07          	clr	_ind_ind_cnt
7944  0285               L1106:
7945                     ; 252 		ind_out[0]=DIGISYM[23+(ind_ind_cnt)];
7947  0285 b607          	ld	a,_ind_ind_cnt
7948  0287 5f            	clrw	x
7949  0288 97            	ld	xl,a
7950  0289 d60017        	ld	a,(_DIGISYM+23,x)
7951  028c b704          	ld	_ind_out,a
7952                     ; 253 		ind_out[1]=DIGISYM[23+(ind_ind_cnt)];
7954  028e b607          	ld	a,_ind_ind_cnt
7955  0290 5f            	clrw	x
7956  0291 97            	ld	xl,a
7957  0292 d60017        	ld	a,(_DIGISYM+23,x)
7958  0295 b705          	ld	_ind_out+1,a
7959                     ; 254 		ind_out[2]=DIGISYM[23+(ind_ind_cnt)];
7961  0297 b607          	ld	a,_ind_ind_cnt
7962  0299 5f            	clrw	x
7963  029a 97            	ld	xl,a
7964  029b d60017        	ld	a,(_DIGISYM+23,x)
7965  029e b706          	ld	_ind_out+2,a
7966                     ; 255 		ind_out[3]=DIGISYM[23+(ind_ind_cnt)];
7968  02a0 b607          	ld	a,_ind_ind_cnt
7969  02a2 5f            	clrw	x
7970  02a3 97            	ld	xl,a
7971  02a4 d60017        	ld	a,(_DIGISYM+23,x)
7972  02a7 b707          	ld	_ind_out+3,a
7974  02a9 ac1d051d      	jpf	L3675
7975  02ad               L5006:
7976                     ; 258 	else if(ind==iWait2) {
7978  02ad b655          	ld	a,_ind
7979  02af a10d          	cp	a,#13
7980  02b1 2628          	jrne	L5106
7981                     ; 259 		int2ind_slkuf(11,2,2,0,0,0);
7983  02b3 4b00          	push	#0
7984  02b5 4b00          	push	#0
7985  02b7 4b00          	push	#0
7986  02b9 4b02          	push	#2
7987  02bb 4b02          	push	#2
7988  02bd ae000b        	ldw	x,#11
7989  02c0 cd00e5        	call	_int2ind_slkuf
7991  02c3 5b05          	addw	sp,#5
7992                     ; 260 		int2ind_slkuf(EE_FISK_CNT1,0,2,0,0,0);
7994  02c5 4b00          	push	#0
7995  02c7 4b00          	push	#0
7996  02c9 4b00          	push	#0
7997  02cb 4b02          	push	#2
7998  02cd 4b00          	push	#0
7999  02cf ce4108        	ldw	x,_EE_FISK_CNT1
8000  02d2 cd00e5        	call	_int2ind_slkuf
8002  02d5 5b05          	addw	sp,#5
8004  02d7 ac1d051d      	jpf	L3675
8005  02db               L5106:
8006                     ; 263 	else if(ind==iSet) {
8008  02db b655          	ld	a,_ind
8009  02dd a103          	cp	a,#3
8010  02df 2703cc037e    	jrne	L1206
8011                     ; 264 		int2ind_slkuf(sub_ind+1,3,1,0,1,5);
8013  02e4 4b05          	push	#5
8014  02e6 4b01          	push	#1
8015  02e8 4b00          	push	#0
8016  02ea 4b01          	push	#1
8017  02ec 4b03          	push	#3
8018  02ee b653          	ld	a,_sub_ind
8019  02f0 5f            	clrw	x
8020  02f1 97            	ld	xl,a
8021  02f2 5c            	incw	x
8022  02f3 cd00e5        	call	_int2ind_slkuf
8024  02f6 5b05          	addw	sp,#5
8025                     ; 265 		if(sub_ind==0) {
8027  02f8 3d53          	tnz	_sub_ind
8028  02fa 2616          	jrne	L3206
8029                     ; 266 			int2ind_slkuf(888,0,3,0,1,0);
8031  02fc 4b00          	push	#0
8032  02fe 4b01          	push	#1
8033  0300 4b00          	push	#0
8034  0302 4b03          	push	#3
8035  0304 4b00          	push	#0
8036  0306 ae0378        	ldw	x,#888
8037  0309 cd00e5        	call	_int2ind_slkuf
8039  030c 5b05          	addw	sp,#5
8041  030e ac1d051d      	jpf	L3675
8042  0312               L3206:
8043                     ; 268 		else if(sub_ind==1) {
8045  0312 b653          	ld	a,_sub_ind
8046  0314 a101          	cp	a,#1
8047  0316 2616          	jrne	L7206
8048                     ; 269 			int2ind_slkuf(EE_PNEVMO_TIME,0,3,0,1,0);
8050  0318 4b00          	push	#0
8051  031a 4b01          	push	#1
8052  031c 4b00          	push	#0
8053  031e 4b03          	push	#3
8054  0320 4b00          	push	#0
8055  0322 ce4050        	ldw	x,_EE_PNEVMO_TIME
8056  0325 cd00e5        	call	_int2ind_slkuf
8058  0328 5b05          	addw	sp,#5
8060  032a ac1d051d      	jpf	L3675
8061  032e               L7206:
8062                     ; 271 		else if(sub_ind==2) {
8064  032e b653          	ld	a,_sub_ind
8065  0330 a102          	cp	a,#2
8066  0332 2616          	jrne	L3306
8067                     ; 272 			int2ind_slkuf(EE_NUM_OF_BALLS,0,3,0,1,0);
8069  0334 4b00          	push	#0
8070  0336 4b01          	push	#1
8071  0338 4b00          	push	#0
8072  033a 4b03          	push	#3
8073  033c 4b00          	push	#0
8074  033e ce4060        	ldw	x,_EE_NUM_OF_BALLS
8075  0341 cd00e5        	call	_int2ind_slkuf
8077  0344 5b05          	addw	sp,#5
8079  0346 ac1d051d      	jpf	L3675
8080  034a               L3306:
8081                     ; 274 		else if(sub_ind==3) {
8083  034a b653          	ld	a,_sub_ind
8084  034c a103          	cp	a,#3
8085  034e 260f          	jrne	L7306
8086                     ; 275 			char2indh_sf((char)EE_WRK_BUTTON,0,0);
8088  0350 4b00          	push	#0
8089  0352 5f            	clrw	x
8090  0353 c64023        	ld	a,_EE_WRK_BUTTON+3
8091  0356 95            	ld	xh,a
8092  0357 cd0158        	call	_char2indh_sf
8094  035a 84            	pop	a
8096  035b ac1d051d      	jpf	L3675
8097  035f               L7306:
8098                     ; 277 		else if(sub_ind==4) {
8100  035f b653          	ld	a,_sub_ind
8101  0361 a104          	cp	a,#4
8102  0363 2703          	jreq	L63
8103  0365 cc051d        	jp	L3675
8104  0368               L63:
8105                     ; 278 			int2ind_slkuf(999,0,3,0,1,0);
8107  0368 4b00          	push	#0
8108  036a 4b01          	push	#1
8109  036c 4b00          	push	#0
8110  036e 4b03          	push	#3
8111  0370 4b00          	push	#0
8112  0372 ae03e7        	ldw	x,#999
8113  0375 cd00e5        	call	_int2ind_slkuf
8115  0378 5b05          	addw	sp,#5
8116  037a ac1d051d      	jpf	L3675
8117  037e               L1206:
8118                     ; 283 	else if(ind==iWrk) {
8120  037e b655          	ld	a,_ind
8121  0380 a104          	cp	a,#4
8122  0382 262d          	jrne	L7406
8123                     ; 285 		int2ind_slkuf(EE_BONUS_SIGMA,0,4,0,1,0);
8125  0384 4b00          	push	#0
8126  0386 4b01          	push	#1
8127  0388 4b00          	push	#0
8128  038a 4b04          	push	#4
8129  038c 4b00          	push	#0
8130  038e ce4030        	ldw	x,_EE_BONUS_SIGMA
8131  0391 cd00e5        	call	_int2ind_slkuf
8133  0394 5b05          	addw	sp,#5
8134                     ; 287 		if(bERR){
8136  0396 3d0f          	tnz	_bERR
8137  0398 2603          	jrne	L04
8138  039a cc051d        	jp	L3675
8139  039d               L04:
8140                     ; 288 			ind_out[0]=0b01011111;
8142  039d 355f0004      	mov	_ind_out,#95
8143                     ; 289 			ind_out[1]=0b01011111;
8145  03a1 355f0005      	mov	_ind_out+1,#95
8146                     ; 290 			ind_out[2]=0b00001101;
8148  03a5 350d0006      	mov	_ind_out+2,#13
8149                     ; 291 			ind_out[3]=0b11111111;
8151  03a9 35ff0007      	mov	_ind_out+3,#255
8152  03ad ac1d051d      	jpf	L3675
8153  03b1               L7406:
8154                     ; 295 	else if(ind==iFin) {
8156  03b1 b655          	ld	a,_ind
8157  03b3 a105          	cp	a,#5
8158  03b5 2640          	jrne	L5506
8159                     ; 296 		if(fin_ind_cnt)fin_ind_cnt--;
8161  03b7 3d52          	tnz	_fin_ind_cnt
8162  03b9 2702          	jreq	L7506
8165  03bb 3a52          	dec	_fin_ind_cnt
8166  03bd               L7506:
8167                     ; 297 		if(!fin_ind_cnt) {
8169  03bd 3d52          	tnz	_fin_ind_cnt
8170  03bf 2606          	jrne	L1606
8171                     ; 298 			ind=iWait;
8173  03c1 35020055      	mov	_ind,#2
8174                     ; 299 			ind_ind_cnt=0;
8176  03c5 3f07          	clr	_ind_ind_cnt
8177  03c7               L1606:
8178                     ; 301 		if(fin_ind_cnt&0b00000100) {
8180  03c7 b652          	ld	a,_fin_ind_cnt
8181  03c9 a504          	bcp	a,#4
8182  03cb 2716          	jreq	L3606
8183                     ; 302 			int2ind_slkuf(EE_BONUS_SIGMA,0,4,0,1,0);
8185  03cd 4b00          	push	#0
8186  03cf 4b01          	push	#1
8187  03d1 4b00          	push	#0
8188  03d3 4b04          	push	#4
8189  03d5 4b00          	push	#0
8190  03d7 ce4030        	ldw	x,_EE_BONUS_SIGMA
8191  03da cd00e5        	call	_int2ind_slkuf
8193  03dd 5b05          	addw	sp,#5
8195  03df ac1d051d      	jpf	L3675
8196  03e3               L3606:
8197                     ; 305 			ind_out[0]=DIGISYM[17];
8199  03e3 35ff0004      	mov	_ind_out,#255
8200                     ; 306 			ind_out[1]=DIGISYM[17];
8202  03e7 35ff0005      	mov	_ind_out+1,#255
8203                     ; 307 			ind_out[2]=DIGISYM[17];
8205  03eb 35ff0006      	mov	_ind_out+2,#255
8206                     ; 308 			ind_out[3]=DIGISYM[17];
8208  03ef 35ff0007      	mov	_ind_out+3,#255
8209  03f3 ac1d051d      	jpf	L3675
8210  03f7               L5506:
8211                     ; 312 	else if(ind==iFisk) {
8213  03f7 b655          	ld	a,_ind
8214  03f9 a106          	cp	a,#6
8215  03fb 2624          	jrne	L1706
8216                     ; 313 		if(fin_ind_cnt)fin_ind_cnt--;
8218  03fd 3d52          	tnz	_fin_ind_cnt
8219  03ff 2702          	jreq	L3706
8222  0401 3a52          	dec	_fin_ind_cnt
8223  0403               L3706:
8224                     ; 314 		if(!fin_ind_cnt) {
8226  0403 3d52          	tnz	_fin_ind_cnt
8227  0405 2604          	jrne	L5706
8228                     ; 315 			ind=iSet;
8230  0407 35030055      	mov	_ind,#3
8231  040b               L5706:
8232                     ; 317 		int2ind_slkuf(EE_FISK_CNT,0,4,0,1,0);
8234  040b 4b00          	push	#0
8235  040d 4b01          	push	#1
8236  040f 4b00          	push	#0
8237  0411 4b04          	push	#4
8238  0413 4b00          	push	#0
8239  0415 ce4100        	ldw	x,_EE_FISK_CNT
8240  0418 cd00e5        	call	_int2ind_slkuf
8242  041b 5b05          	addw	sp,#5
8244  041d ac1d051d      	jpf	L3675
8245  0421               L1706:
8246                     ; 320 	else if(ind==iFisk1) {
8248  0421 b655          	ld	a,_ind
8249  0423 a10e          	cp	a,#14
8250  0425 2624          	jrne	L1016
8251                     ; 321 		if(fin_ind_cnt)fin_ind_cnt--;
8253  0427 3d52          	tnz	_fin_ind_cnt
8254  0429 2702          	jreq	L3016
8257  042b 3a52          	dec	_fin_ind_cnt
8258  042d               L3016:
8259                     ; 322 		if(!fin_ind_cnt) {
8261  042d 3d52          	tnz	_fin_ind_cnt
8262  042f 2604          	jrne	L5016
8263                     ; 323 			ind=iSet;
8265  0431 35030055      	mov	_ind,#3
8266  0435               L5016:
8267                     ; 325 		int2ind_slkuf(EE_FISK_CNT1,0,4,0,1,0);
8269  0435 4b00          	push	#0
8270  0437 4b01          	push	#1
8271  0439 4b00          	push	#0
8272  043b 4b04          	push	#4
8273  043d 4b00          	push	#0
8274  043f ce4108        	ldw	x,_EE_FISK_CNT1
8275  0442 cd00e5        	call	_int2ind_slkuf
8277  0445 5b05          	addw	sp,#5
8279  0447 ac1d051d      	jpf	L3675
8280  044b               L1016:
8281                     ; 328 	else if(ind==iDeb) {
8283  044b b655          	ld	a,_ind
8284  044d a107          	cp	a,#7
8285  044f 2617          	jrne	L1116
8286                     ; 329 		int2ind_slkuf(target_plazma,0,3,0,1,0);
8288  0451 4b00          	push	#0
8289  0453 4b01          	push	#1
8290  0455 4b00          	push	#0
8291  0457 4b03          	push	#3
8292  0459 4b00          	push	#0
8293  045b b606          	ld	a,_target_plazma
8294  045d 5f            	clrw	x
8295  045e 97            	ld	xl,a
8296  045f cd00e5        	call	_int2ind_slkuf
8298  0462 5b05          	addw	sp,#5
8300  0464 ac1d051d      	jpf	L3675
8301  0468               L1116:
8302                     ; 332 	else if(ind==iSerNum) {
8304  0468 b655          	ld	a,_ind
8305  046a a108          	cp	a,#8
8306  046c 2616          	jrne	L5116
8307                     ; 333 		int2ind_slkuf(SERIAL_NUMBER,0,4,0,0,0);
8309  046e 4b00          	push	#0
8310  0470 4b00          	push	#0
8311  0472 4b00          	push	#0
8312  0474 4b04          	push	#4
8313  0476 4b00          	push	#0
8314  0478 ae049f        	ldw	x,#1183
8315  047b cd00e5        	call	_int2ind_slkuf
8317  047e 5b05          	addw	sp,#5
8319  0480 ac1d051d      	jpf	L3675
8320  0484               L5116:
8321                     ; 336 	else if(ind==iMnBut) {
8323  0484 b655          	ld	a,_ind
8324  0486 a109          	cp	a,#9
8325  0488 262d          	jrne	L1216
8326                     ; 337 		ind_ind_cnt++;
8328  048a 3c07          	inc	_ind_ind_cnt
8329                     ; 338 		if(ind_ind_cnt>8)ind_ind_cnt=0;
8331  048c b607          	ld	a,_ind_ind_cnt
8332  048e a109          	cp	a,#9
8333  0490 2502          	jrult	L3216
8336  0492 3f07          	clr	_ind_ind_cnt
8337  0494               L3216:
8338                     ; 340 		ind_out[0]=DIGISYM[20];
8340  0494 35ff0004      	mov	_ind_out,#255
8341                     ; 341 		ind_out[1]=DIGISYM[20];
8343  0498 35ff0005      	mov	_ind_out+1,#255
8344                     ; 342 		ind_out[2]=DIGISYM[20];
8346  049c 35ff0006      	mov	_ind_out+2,#255
8347                     ; 343 		ind_out[3]=DIGISYM[20];
8349  04a0 35ff0007      	mov	_ind_out+3,#255
8350                     ; 345 		ind_out[3-(ind_ind_cnt/2)]=DIGISYM[24];
8352  04a4 b607          	ld	a,_ind_ind_cnt
8353  04a6 44            	srl	a
8354  04a7 5f            	clrw	x
8355  04a8 97            	ld	xl,a
8356  04a9 1f01          	ldw	(OFST-1,sp),x
8357  04ab ae0003        	ldw	x,#3
8358  04ae 72f001        	subw	x,(OFST-1,sp)
8359  04b1 a6ef          	ld	a,#239
8360  04b3 e704          	ld	(_ind_out,x),a
8362  04b5 2066          	jra	L3675
8363  04b7               L1216:
8364                     ; 348 	else if(ind==iMnButPrl) {
8366  04b7 b655          	ld	a,_ind
8367  04b9 a10a          	cp	a,#10
8368  04bb 264a          	jrne	L7216
8369                     ; 352 		ind_out[0]=DIGISYM[27];
8371  04bd 357f0004      	mov	_ind_out,#127
8372                     ; 353 		ind_out[1]=DIGISYM[27];
8374  04c1 357f0005      	mov	_ind_out+1,#127
8375                     ; 354 		ind_out[2]=DIGISYM[27];
8377  04c5 357f0006      	mov	_ind_out+2,#127
8378                     ; 355 		ind_out[3]=DIGISYM[27];
8380  04c9 357f0007      	mov	_ind_out+3,#127
8381                     ; 356 		if(bFL5) {
8383  04cd 3d12          	tnz	_bFL5
8384  04cf 2710          	jreq	L1316
8385                     ; 357 			ind_out[0]=DIGISYM[20];
8387  04d1 35ff0004      	mov	_ind_out,#255
8388                     ; 358 			ind_out[1]=DIGISYM[20];
8390  04d5 35ff0005      	mov	_ind_out+1,#255
8391                     ; 359 			ind_out[2]=DIGISYM[20];
8393  04d9 35ff0006      	mov	_ind_out+2,#255
8394                     ; 360 			ind_out[3]=DIGISYM[20];
8396  04dd 35ff0007      	mov	_ind_out+3,#255
8397  04e1               L1316:
8398                     ; 363 		ind_out[3-sub_ind]=DIGISYM[27];
8400  04e1 a600          	ld	a,#0
8401  04e3 97            	ld	xl,a
8402  04e4 a603          	ld	a,#3
8403  04e6 b053          	sub	a,_sub_ind
8404  04e8 2401          	jrnc	L03
8405  04ea 5a            	decw	x
8406  04eb               L03:
8407  04eb 02            	rlwa	x,a
8408  04ec a67f          	ld	a,#127
8409  04ee e704          	ld	(_ind_out,x),a
8410                     ; 364 		if(ind_ind_cnt) {
8412  04f0 3d07          	tnz	_ind_ind_cnt
8413  04f2 2729          	jreq	L3675
8414                     ; 365 			ind_ind_cnt--;
8416  04f4 3a07          	dec	_ind_ind_cnt
8417                     ; 366 			ind_out[3-sub_ind]=DIGISYM[20];
8419  04f6 a600          	ld	a,#0
8420  04f8 97            	ld	xl,a
8421  04f9 a603          	ld	a,#3
8422  04fb b053          	sub	a,_sub_ind
8423  04fd 2401          	jrnc	L23
8424  04ff 5a            	decw	x
8425  0500               L23:
8426  0500 02            	rlwa	x,a
8427  0501 a6ff          	ld	a,#255
8428  0503 e704          	ld	(_ind_out,x),a
8429  0505 2016          	jra	L3675
8430  0507               L7216:
8431                     ; 374 	else if(ind==iDnd) {
8433  0507 b655          	ld	a,_ind
8434  0509 a10b          	cp	a,#11
8435  050b 2610          	jrne	L3675
8436                     ; 375 		ind_out[0]=0b01000011;
8438  050d 35430004      	mov	_ind_out,#67
8439                     ; 376 		ind_out[1]=0b00010001;
8441  0511 35110005      	mov	_ind_out+1,#17
8442                     ; 377 		ind_out[2]=0b00000111;
8444  0515 35070006      	mov	_ind_out+2,#7
8445                     ; 378 		ind_out[3]=0b11111111;
8447  0519 35ff0007      	mov	_ind_out+3,#255
8448  051d               L3675:
8449                     ; 380 }
8452  051d 85            	popw	x
8453  051e 81            	ret
8497                     ; 382 void but_an(void) {
8498                     	switch	.text
8499  051f               _but_an:
8503                     ; 383 	if(bKEY || bFIRE || bFIRE_ || bFIRE1) {
8505  051f 3d2a          	tnz	_bKEY
8506  0521 260f          	jrne	L3516
8508  0523 3d29          	tnz	_bFIRE
8509  0525 260b          	jrne	L3516
8511  0527 3d28          	tnz	_bFIRE_
8512  0529 2607          	jrne	L3516
8514  052b 3d27          	tnz	_bFIRE1
8515  052d 2603          	jrne	L44
8516  052f cc06df        	jp	L1516
8517  0532               L44:
8518  0532               L3516:
8519                     ; 384 		if(ind==iMn) {
8521  0532 3d55          	tnz	_ind
8522  0534 2629          	jrne	L1616
8523                     ; 385 			if(bFIRE) {
8525  0536 3d29          	tnz	_bFIRE
8526  0538 270a          	jreq	L3616
8527                     ; 386 				sub_ind++;
8529  053a 3c53          	inc	_sub_ind
8530                     ; 387 				if(sub_ind>=4)sub_ind=0;
8532  053c b653          	ld	a,_sub_ind
8533  053e a104          	cp	a,#4
8534  0540 2502          	jrult	L3616
8537  0542 3f53          	clr	_sub_ind
8538  0544               L3616:
8539                     ; 389 			if(bKEY) {
8541  0544 3d2a          	tnz	_bKEY
8542  0546 2603          	jrne	L64
8543  0548 cc06df        	jp	L1516
8544  054b               L64:
8545                     ; 390 				ee_plazma=0xabcd;
8547  054b aeabcd        	ldw	x,#43981
8548  054e bf02          	ldw	c_lreg+2,x
8549  0550 ae0000        	ldw	x,#0
8550  0553 bf00          	ldw	c_lreg,x
8551  0555 ae0000        	ldw	x,#_ee_plazma
8552  0558 cd0000        	call	c_eewrl
8554  055b acdf06df      	jpf	L1516
8555  055f               L1616:
8556                     ; 394 		else if(ind==iSet) {
8558  055f b655          	ld	a,_ind
8559  0561 a103          	cp	a,#3
8560  0563 2703          	jreq	L05
8561  0565 cc0617        	jp	L3716
8562  0568               L05:
8563                     ; 395 			if( (sub_ind==0) && (bFIRE) ) {
8565  0568 3d53          	tnz	_sub_ind
8566  056a 2610          	jrne	L5716
8568  056c 3d29          	tnz	_bFIRE
8569  056e 270c          	jreq	L5716
8570                     ; 396 				ind=iFisk;
8572  0570 35060055      	mov	_ind,#6
8573                     ; 397 				fin_ind_cnt=30;
8575  0574 351e0052      	mov	_fin_ind_cnt,#30
8577  0578 acdf06df      	jpf	L1516
8578  057c               L5716:
8579                     ; 399 			else if( (sub_ind==1) && (bFIRE) ) {
8581  057c b653          	ld	a,_sub_ind
8582  057e a101          	cp	a,#1
8583  0580 2642          	jrne	L1026
8585  0582 3d29          	tnz	_bFIRE
8586  0584 273e          	jreq	L1026
8587                     ; 400 				EE_PNEVMO_TIME = ((EE_PNEVMO_TIME/20)+1)*20;
8589  0586 ce4050        	ldw	x,_EE_PNEVMO_TIME
8590  0589 a614          	ld	a,#20
8591  058b cd0000        	call	c_sdivx
8593  058e 90ae0014      	ldw	y,#20
8594  0592 cd0000        	call	c_imul
8596  0595 1c0014        	addw	x,#20
8597  0598 89            	pushw	x
8598  0599 ae4050        	ldw	x,#_EE_PNEVMO_TIME
8599  059c cd0000        	call	c_eewrw
8601  059f 85            	popw	x
8602                     ; 401 				if( (EE_PNEVMO_TIME>200) || (EE_PNEVMO_TIME<20) ) EE_PNEVMO_TIME=20;
8604  05a0 9c            	rvf
8605  05a1 ce4050        	ldw	x,_EE_PNEVMO_TIME
8606  05a4 a300c9        	cpw	x,#201
8607  05a7 2e0c          	jrsge	L5026
8609  05a9 9c            	rvf
8610  05aa ce4050        	ldw	x,_EE_PNEVMO_TIME
8611  05ad a30014        	cpw	x,#20
8612  05b0 2f03          	jrslt	L25
8613  05b2 cc06df        	jp	L1516
8614  05b5               L25:
8615  05b5               L5026:
8618  05b5 ae0014        	ldw	x,#20
8619  05b8 89            	pushw	x
8620  05b9 ae4050        	ldw	x,#_EE_PNEVMO_TIME
8621  05bc cd0000        	call	c_eewrw
8623  05bf 85            	popw	x
8624  05c0 acdf06df      	jpf	L1516
8625  05c4               L1026:
8626                     ; 404 			else if( (sub_ind==2) && (bFIRE) ) {
8628  05c4 b653          	ld	a,_sub_ind
8629  05c6 a102          	cp	a,#2
8630  05c8 2631          	jrne	L1126
8632  05ca 3d29          	tnz	_bFIRE
8633  05cc 272d          	jreq	L1126
8634                     ; 405 				EE_NUM_OF_BALLS++;
8636  05ce ce4060        	ldw	x,_EE_NUM_OF_BALLS
8637  05d1 1c0001        	addw	x,#1
8638  05d4 cf4060        	ldw	_EE_NUM_OF_BALLS,x
8639                     ; 406 				if( (EE_NUM_OF_BALLS>30) || (EE_NUM_OF_BALLS<1) ) EE_NUM_OF_BALLS=1;
8641  05d7 9c            	rvf
8642  05d8 ce4060        	ldw	x,_EE_NUM_OF_BALLS
8643  05db a3001f        	cpw	x,#31
8644  05de 2e0c          	jrsge	L5126
8646  05e0 9c            	rvf
8647  05e1 ce4060        	ldw	x,_EE_NUM_OF_BALLS
8648  05e4 a30001        	cpw	x,#1
8649  05e7 2f03          	jrslt	L45
8650  05e9 cc06df        	jp	L1516
8651  05ec               L45:
8652  05ec               L5126:
8655  05ec ae0001        	ldw	x,#1
8656  05ef 89            	pushw	x
8657  05f0 ae4060        	ldw	x,#_EE_NUM_OF_BALLS
8658  05f3 cd0000        	call	c_eewrw
8660  05f6 85            	popw	x
8661  05f7 acdf06df      	jpf	L1516
8662  05fb               L1126:
8663                     ; 408 			else if( (sub_ind==4) && (bFIRE) ) {
8665  05fb b653          	ld	a,_sub_ind
8666  05fd a104          	cp	a,#4
8667  05ff 2703          	jreq	L65
8668  0601 cc06df        	jp	L1516
8669  0604               L65:
8671  0604 3d29          	tnz	_bFIRE
8672  0606 2603          	jrne	L06
8673  0608 cc06df        	jp	L1516
8674  060b               L06:
8675                     ; 409 				ind=iFisk1;
8677  060b 350e0055      	mov	_ind,#14
8678                     ; 410 				fin_ind_cnt=30;
8680  060f 351e0052      	mov	_fin_ind_cnt,#30
8681  0613 acdf06df      	jpf	L1516
8682  0617               L3716:
8683                     ; 416 		else if(ind==iWait1) {
8685  0617 b655          	ld	a,_ind
8686  0619 a10c          	cp	a,#12
8687  061b 261e          	jrne	L5226
8688                     ; 417 			if(bFIRE) {
8690  061d 3d29          	tnz	_bFIRE
8691  061f 2603          	jrne	L26
8692  0621 cc06df        	jp	L1516
8693  0624               L26:
8694                     ; 418 				ind=iWrk;
8696  0624 35040055      	mov	_ind,#4
8697                     ; 419 				wrk_stat=wsON;
8699  0628 35010010      	mov	_wrk_stat,#1
8700                     ; 420 				wrk_cnt=120;
8702  062c ae0078        	ldw	x,#120
8703  062f bf4d          	ldw	_wrk_cnt,x
8704                     ; 421 				ret_cnt=0;
8706  0631 5f            	clrw	x
8707  0632 bf50          	ldw	_ret_cnt,x
8708                     ; 422 				ret_cnt1=0;
8710  0634 5f            	clrw	x
8711  0635 bf08          	ldw	_ret_cnt1,x
8712  0637 acdf06df      	jpf	L1516
8713  063b               L5226:
8714                     ; 426 		else if((wrk_stat==wsON) && (!bERR)&&(!not_fire_cnt)) {
8716  063b b610          	ld	a,_wrk_stat
8717  063d a101          	cp	a,#1
8718  063f 2625          	jrne	L3326
8720  0641 3d0f          	tnz	_bERR
8721  0643 2621          	jrne	L3326
8723  0645 be02          	ldw	x,_not_fire_cnt
8724  0647 261d          	jrne	L3326
8725                     ; 427 			if(bFIRE) {
8727  0649 3d29          	tnz	_bFIRE
8728  064b 2603          	jrne	L46
8729  064d cc06df        	jp	L1516
8730  0650               L46:
8731                     ; 428 				rele_cnt=EE_PNEVMO_TIME;
8733  0650 ce4050        	ldw	x,_EE_PNEVMO_TIME
8734  0653 bf35          	ldw	_rele_cnt,x
8735                     ; 429 				wrk_cnt=120;
8737  0655 ae0078        	ldw	x,#120
8738  0658 bf4d          	ldw	_wrk_cnt,x
8739                     ; 430 				fire_cnt=1500;
8741  065a ae05dc        	ldw	x,#1500
8742  065d bf37          	ldw	_fire_cnt,x
8743                     ; 431 				not_fire_cnt=1000;
8745  065f ae03e8        	ldw	x,#1000
8746  0662 bf02          	ldw	_not_fire_cnt,x
8747  0664 2079          	jra	L1516
8748  0666               L3326:
8749                     ; 435 		else if(ind==iMnButPrl) {/*
8751  0666 b655          	ld	a,_ind
8752  0668 a10a          	cp	a,#10
8753  066a 2673          	jrne	L1516
8754                     ; 450 			if(bFIRE_) {
8756  066c 3d28          	tnz	_bFIRE_
8757  066e 272f          	jreq	L3426
8758                     ; 451 				if(sub_ind<3) {
8760  0670 b653          	ld	a,_sub_ind
8761  0672 a103          	cp	a,#3
8762  0674 2404          	jruge	L5426
8763                     ; 452 					sub_ind++;
8765  0676 3c53          	inc	_sub_ind
8767  0678 2065          	jra	L1516
8768  067a               L5426:
8769                     ; 455 					if(parol_sigma==SERIAL_NUMBER) {
8771  067a be1f          	ldw	x,_parol_sigma
8772  067c a3049f        	cpw	x,#1183
8773  067f 260f          	jrne	L1526
8774                     ; 456 						ind=iMnBut;
8776  0681 35090055      	mov	_ind,#9
8777                     ; 457 						ret_ind=iWait;
8779  0685 35020054      	mov	_ret_ind,#2
8780                     ; 458 						ret_cnt=100;
8782  0689 ae0064        	ldw	x,#100
8783  068c bf50          	ldw	_ret_cnt,x
8785  068e 204f          	jra	L1516
8786  0690               L1526:
8787                     ; 461 						ind=iDnd;
8789  0690 350b0055      	mov	_ind,#11
8790                     ; 462 						ret_ind=iWait;
8792  0694 35020054      	mov	_ret_ind,#2
8793                     ; 463 						ret_cnt=30;
8795  0698 ae001e        	ldw	x,#30
8796  069b bf50          	ldw	_ret_cnt,x
8797  069d 2040          	jra	L1516
8798  069f               L3426:
8799                     ; 467 			else if(bFIRE1) {
8801  069f 3d27          	tnz	_bFIRE1
8802  06a1 273c          	jreq	L1516
8803                     ; 468 				ind_ind_cnt=10;
8805  06a3 350a0007      	mov	_ind_ind_cnt,#10
8806                     ; 470 				if(sub_ind==0) {
8808  06a7 3d53          	tnz	_sub_ind
8809  06a9 2609          	jrne	L1626
8810                     ; 471 					parol_sigma+=1000;
8812  06ab be1f          	ldw	x,_parol_sigma
8813  06ad 1c03e8        	addw	x,#1000
8814  06b0 bf1f          	ldw	_parol_sigma,x
8816  06b2 202b          	jra	L1516
8817  06b4               L1626:
8818                     ; 473 				else if(sub_ind==1) {
8820  06b4 b653          	ld	a,_sub_ind
8821  06b6 a101          	cp	a,#1
8822  06b8 2609          	jrne	L5626
8823                     ; 474 					parol_sigma+=100;
8825  06ba be1f          	ldw	x,_parol_sigma
8826  06bc 1c0064        	addw	x,#100
8827  06bf bf1f          	ldw	_parol_sigma,x
8829  06c1 201c          	jra	L1516
8830  06c3               L5626:
8831                     ; 476 				else if(sub_ind==2) {
8833  06c3 b653          	ld	a,_sub_ind
8834  06c5 a102          	cp	a,#2
8835  06c7 2609          	jrne	L1726
8836                     ; 477 					parol_sigma+=10;
8838  06c9 be1f          	ldw	x,_parol_sigma
8839  06cb 1c000a        	addw	x,#10
8840  06ce bf1f          	ldw	_parol_sigma,x
8842  06d0 200d          	jra	L1516
8843  06d2               L1726:
8844                     ; 479 				else if(sub_ind==3) {
8846  06d2 b653          	ld	a,_sub_ind
8847  06d4 a103          	cp	a,#3
8848  06d6 2607          	jrne	L1516
8849                     ; 480 					parol_sigma+=1;
8851  06d8 be1f          	ldw	x,_parol_sigma
8852  06da 1c0001        	addw	x,#1
8853  06dd bf1f          	ldw	_parol_sigma,x
8854  06df               L1516:
8855                     ; 488 	bKEY=0;
8857  06df 3f2a          	clr	_bKEY
8858                     ; 489 	bFIRE=0;
8860  06e1 3f29          	clr	_bFIRE
8861                     ; 490 	bFIRE_=0;
8863  06e3 3f28          	clr	_bFIRE_
8864                     ; 491 	bFIRE1=0;
8866  06e5 3f27          	clr	_bFIRE1
8867                     ; 492 }
8870  06e7 81            	ret
8920                     ; 494 void in_button(void) {
8921                     	switch	.text
8922  06e8               _in_button:
8924  06e8 5204          	subw	sp,#4
8925       00000004      OFST:	set	4
8928                     ; 497 	if(/* (!(GPIOB->IDR&(1<<5))) /*&&*/ (!(GPIOD->IDR&(1<<5)))) {
8930  06ea c65010        	ld	a,20496
8931  06ed a520          	bcp	a,#32
8932  06ef 2647          	jrne	L1236
8933                     ; 498 		for(i=0;i<10000;i++) {
8935  06f1 5f            	clrw	x
8936  06f2 1f01          	ldw	(OFST-3,sp),x
8937  06f4               L3236:
8938                     ; 499 			for(ii=0;ii<1000;ii++) {
8940  06f4 5f            	clrw	x
8941  06f5 1f03          	ldw	(OFST-1,sp),x
8942  06f7               L1336:
8943                     ; 500 				__nop();
8946  06f7 9d            nop
8948                     ; 499 			for(ii=0;ii<1000;ii++) {
8950  06f8 1e03          	ldw	x,(OFST-1,sp)
8951  06fa 1c0001        	addw	x,#1
8952  06fd 1f03          	ldw	(OFST-1,sp),x
8955  06ff 9c            	rvf
8956  0700 1e03          	ldw	x,(OFST-1,sp)
8957  0702 a303e8        	cpw	x,#1000
8958  0705 2ff0          	jrslt	L1336
8959                     ; 502 			if( /*(GPIOB->IDR&(1<<5)) || */(GPIOD->IDR&(1<<5)) ) break;
8961  0707 c65010        	ld	a,20496
8962  070a a520          	bcp	a,#32
8963  070c 260f          	jrne	L7236
8966                     ; 498 		for(i=0;i<10000;i++) {
8968  070e 1e01          	ldw	x,(OFST-3,sp)
8969  0710 1c0001        	addw	x,#1
8970  0713 1f01          	ldw	(OFST-3,sp),x
8973  0715 9c            	rvf
8974  0716 1e01          	ldw	x,(OFST-3,sp)
8975  0718 a32710        	cpw	x,#10000
8976  071b 2fd7          	jrslt	L3236
8977  071d               L7236:
8978                     ; 504 		if(i==10000) {
8980  071d 1e01          	ldw	x,(OFST-3,sp)
8981  071f a32710        	cpw	x,#10000
8982  0722 2618          	jrne	L3436
8983                     ; 505 			ind=iMnButPrl;
8985  0724 350a0055      	mov	_ind,#10
8986                     ; 506 			sub_ind=0;
8988  0728 3f53          	clr	_sub_ind
8989                     ; 507 			bFIRE_=0;
8991  072a 3f28          	clr	_bFIRE_
8992                     ; 508 			cnt_bFIRE_=0;
8994  072c 5f            	clrw	x
8995  072d bf21          	ldw	_cnt_bFIRE_,x
8996                     ; 509 			bFIRE_BLOCK=1;
8998  072f 35010026      	mov	_bFIRE_BLOCK,#1
8999                     ; 510 			parol_sigma=0;
9001  0733 5f            	clrw	x
9002  0734 bf1f          	ldw	_parol_sigma,x
9003  0736 2004          	jra	L3436
9004  0738               L1236:
9005                     ; 514 		ind=iWait;
9007  0738 35020055      	mov	_ind,#2
9008  073c               L3436:
9009                     ; 516 }
9012  073c 5b04          	addw	sp,#4
9013  073e 81            	ret
9045                     ; 518 void opto_drv (void) {
9046                     	switch	.text
9047  073f               _opto_drv:
9051                     ; 519 	if((GPIOD->IDR)&(1<<1)) {
9053  073f c65010        	ld	a,20496
9054  0742 a502          	bcp	a,#2
9055  0744 274c          	jreq	L5536
9056                     ; 520 		if(!bLINE_OLD)connect_cnt=1000;
9058  0746 3d33          	tnz	_bLINE_OLD
9059  0748 2605          	jrne	L7536
9062  074a ae03e8        	ldw	x,#1000
9063  074d bf2d          	ldw	_connect_cnt,x
9064  074f               L7536:
9065                     ; 522 		if(!bIN_OLD) {
9067  074f 3d34          	tnz	_bIN_OLD
9068  0751 2632          	jrne	L1636
9069                     ; 523 			if((zero_cnt>80)&&(zero_cnt<150))	{
9071  0753 be2f          	ldw	x,_zero_cnt
9072  0755 a30051        	cpw	x,#81
9073  0758 252b          	jrult	L1636
9075  075a be2f          	ldw	x,_zero_cnt
9076  075c a30096        	cpw	x,#150
9077  075f 2424          	jruge	L1636
9078                     ; 524 				plazma_SS++;
9080  0761 be00          	ldw	x,_plazma_SS
9081  0763 1c0001        	addw	x,#1
9082  0766 bf00          	ldw	_plazma_SS,x
9083                     ; 525 				if((wrk_stat==wsON)&&(!bERR)) {
9085  0768 b610          	ld	a,_wrk_stat
9086  076a a101          	cp	a,#1
9087  076c 2617          	jrne	L1636
9089  076e 3d0f          	tnz	_bERR
9090  0770 2613          	jrne	L1636
9091                     ; 526 					opto_cnt=1500;
9093  0772 ae05dc        	ldw	x,#1500
9094  0775 bf04          	ldw	_opto_cnt,x
9095                     ; 527 					if(EE_REMAIN_BALLS) {
9097  0777 ce4040        	ldw	x,_EE_REMAIN_BALLS
9098  077a 2709          	jreq	L1636
9099                     ; 528 						EE_REMAIN_BALLS--;
9101  077c ce4040        	ldw	x,_EE_REMAIN_BALLS
9102  077f 1d0001        	subw	x,#1
9103  0782 cf4040        	ldw	_EE_REMAIN_BALLS,x
9104  0785               L1636:
9105                     ; 533 		zero_cnt=0;
9107  0785 5f            	clrw	x
9108  0786 bf2f          	ldw	_zero_cnt,x
9109                     ; 535 		bLINE_OLD=1;
9111  0788 35010033      	mov	_bLINE_OLD,#1
9112                     ; 536 		bIN_OLD=1;
9114  078c 35010034      	mov	_bIN_OLD,#1
9116  0790 201b          	jra	L1736
9117  0792               L5536:
9118                     ; 539 		if(bLINE_OLD)connect_cnt=1500;
9120  0792 3d33          	tnz	_bLINE_OLD
9121  0794 2705          	jreq	L3736
9124  0796 ae05dc        	ldw	x,#1500
9125  0799 bf2d          	ldw	_connect_cnt,x
9126  079b               L3736:
9127                     ; 540 		if(zero_cnt<30000) {
9129  079b be2f          	ldw	x,_zero_cnt
9130  079d a37530        	cpw	x,#30000
9131  07a0 2407          	jruge	L5736
9132                     ; 541 			zero_cnt++;
9134  07a2 be2f          	ldw	x,_zero_cnt
9135  07a4 1c0001        	addw	x,#1
9136  07a7 bf2f          	ldw	_zero_cnt,x
9137  07a9               L5736:
9138                     ; 544 	bLINE_OLD=0;	
9140  07a9 3f33          	clr	_bLINE_OLD
9141                     ; 545 	bIN_OLD=0;
9143  07ab 3f34          	clr	_bIN_OLD
9144  07ad               L1736:
9145                     ; 548 	GPIOD->DDR&=~(1<<1);	
9147  07ad 72135011      	bres	20497,#1
9148                     ; 549 	GPIOD->CR1|=(1<<1);
9150  07b1 72125012      	bset	20498,#1
9151                     ; 550 	GPIOD->CR2&=~(1<<1);
9153  07b5 72135013      	bres	20499,#1
9154                     ; 552 	if(connect_cnt) {
9156  07b9 be2d          	ldw	x,_connect_cnt
9157  07bb 270b          	jreq	L7736
9158                     ; 553 		connect_cnt--;
9160  07bd be2d          	ldw	x,_connect_cnt
9161  07bf 1d0001        	subw	x,#1
9162  07c2 bf2d          	ldw	_connect_cnt,x
9163                     ; 554 		bERR=0;
9165  07c4 3f0f          	clr	_bERR
9167  07c6 2004          	jra	L1046
9168  07c8               L7736:
9169                     ; 556 	else bERR=1;
9171  07c8 3501000f      	mov	_bERR,#1
9172  07cc               L1046:
9173                     ; 557 }
9176  07cc 81            	ret
9220                     ; 559 void target_drv (void) {
9221                     	switch	.text
9222  07cd               _target_drv:
9224  07cd 5203          	subw	sp,#3
9225       00000003      OFST:	set	3
9228                     ; 562 	GPIOD->DDR&=~((1<<2)|(1<<3)|(1<<4));	
9230  07cf c65011        	ld	a,20497
9231  07d2 a4e3          	and	a,#227
9232  07d4 c75011        	ld	20497,a
9233                     ; 563 	GPIOD->CR1|=((1<<2)|(1<<3)|(1<<4));
9235  07d7 c65012        	ld	a,20498
9236  07da aa1c          	or	a,#28
9237  07dc c75012        	ld	20498,a
9238                     ; 564 	GPIOD->CR2&=~((1<<2)|(1<<3)|(1<<4));
9240  07df c65013        	ld	a,20499
9241  07e2 a4e3          	and	a,#227
9242  07e4 c75013        	ld	20499,a
9243                     ; 566 	target_plazma=(GPIOD->IDR); 
9245  07e7 5550100006    	mov	_target_plazma,20496
9246                     ; 568 	for(i=0;i<3;i++) {
9248  07ec 0f03          	clr	(OFST+0,sp)
9249  07ee               L1246:
9250                     ; 569 		if(!((GPIOD->IDR)&(1<<(4-i)))) {
9252  07ee c65010        	ld	a,20496
9253  07f1 5f            	clrw	x
9254  07f2 97            	ld	xl,a
9255  07f3 1f01          	ldw	(OFST-2,sp),x
9256  07f5 ae0001        	ldw	x,#1
9257  07f8 a604          	ld	a,#4
9258  07fa 1003          	sub	a,(OFST+0,sp)
9259  07fc 4d            	tnz	a
9260  07fd 2704          	jreq	L47
9261  07ff               L67:
9262  07ff 58            	sllw	x
9263  0800 4a            	dec	a
9264  0801 26fc          	jrne	L67
9265  0803               L47:
9266  0803 01            	rrwa	x,a
9267  0804 1402          	and	a,(OFST-1,sp)
9268  0806 01            	rrwa	x,a
9269  0807 1401          	and	a,(OFST-2,sp)
9270  0809 01            	rrwa	x,a
9271  080a a30000        	cpw	x,#0
9272  080d 267a          	jrne	L7246
9273                     ; 570 			if(target_cnt[i]<1000) target_cnt[i]++;
9275  080f 9c            	rvf
9276  0810 7b03          	ld	a,(OFST+0,sp)
9277  0812 5f            	clrw	x
9278  0813 97            	ld	xl,a
9279  0814 58            	sllw	x
9280  0815 9093          	ldw	y,x
9281  0817 90ee45        	ldw	y,(_target_cnt,y)
9282  081a 90a303e8      	cpw	y,#1000
9283  081e 2e0f          	jrsge	L1346
9286  0820 7b03          	ld	a,(OFST+0,sp)
9287  0822 5f            	clrw	x
9288  0823 97            	ld	xl,a
9289  0824 58            	sllw	x
9290  0825 9093          	ldw	y,x
9291  0827 ee45          	ldw	x,(_target_cnt,x)
9292  0829 1c0001        	addw	x,#1
9293  082c 90ef45        	ldw	(_target_cnt,y),x
9294  082f               L1346:
9295                     ; 571 			if((target_cnt[i]==5)&& (!target_cnt_off[i])) {
9297  082f 7b03          	ld	a,(OFST+0,sp)
9298  0831 5f            	clrw	x
9299  0832 97            	ld	xl,a
9300  0833 58            	sllw	x
9301  0834 9093          	ldw	y,x
9302  0836 90ee45        	ldw	y,(_target_cnt,y)
9303  0839 90a30005      	cpw	y,#5
9304  083d 266d          	jrne	L7446
9306  083f 7b03          	ld	a,(OFST+0,sp)
9307  0841 5f            	clrw	x
9308  0842 97            	ld	xl,a
9309  0843 58            	sllw	x
9310  0844 e63e          	ld	a,(_target_cnt_off+1,x)
9311  0846 ea3d          	or	a,(_target_cnt_off,x)
9312  0848 2662          	jrne	L7446
9313                     ; 572 				target_on[i]=1;
9315  084a 7b03          	ld	a,(OFST+0,sp)
9316  084c 5f            	clrw	x
9317  084d 97            	ld	xl,a
9318  084e a601          	ld	a,#1
9319  0850 e739          	ld	(_target_on,x),a
9320                     ; 573 				if(i==0)
9322  0852 0d03          	tnz	(OFST+0,sp)
9323  0854 2608          	jrne	L5346
9324                     ; 575 					target_cnt[1]=0;
9326  0856 5f            	clrw	x
9327  0857 bf47          	ldw	_target_cnt+2,x
9328                     ; 576 					target_cnt[2]=0;					
9330  0859 5f            	clrw	x
9331  085a bf49          	ldw	_target_cnt+4,x
9333  085c 201a          	jra	L7346
9334  085e               L5346:
9335                     ; 578 				else if(i==1)
9337  085e 7b03          	ld	a,(OFST+0,sp)
9338  0860 a101          	cp	a,#1
9339  0862 2608          	jrne	L1446
9340                     ; 580 					target_cnt[0]=0;
9342  0864 5f            	clrw	x
9343  0865 bf45          	ldw	_target_cnt,x
9344                     ; 581 					target_cnt[2]=0;					
9346  0867 5f            	clrw	x
9347  0868 bf49          	ldw	_target_cnt+4,x
9349  086a 200c          	jra	L7346
9350  086c               L1446:
9351                     ; 583 				else if(i==2)
9353  086c 7b03          	ld	a,(OFST+0,sp)
9354  086e a102          	cp	a,#2
9355  0870 2606          	jrne	L7346
9356                     ; 585 					target_cnt[0]=0;
9358  0872 5f            	clrw	x
9359  0873 bf45          	ldw	_target_cnt,x
9360                     ; 586 					target_cnt[1]=0;					
9362  0875 5f            	clrw	x
9363  0876 bf47          	ldw	_target_cnt+2,x
9364  0878               L7346:
9365                     ; 590 				target_cnt_off[0]=1000;
9367  0878 ae03e8        	ldw	x,#1000
9368  087b bf3d          	ldw	_target_cnt_off,x
9369                     ; 591 				target_cnt_off[1]=1000;
9371  087d ae03e8        	ldw	x,#1000
9372  0880 bf3f          	ldw	_target_cnt_off+2,x
9373                     ; 592 				target_cnt_off[2]=1000;
9375  0882 ae03e8        	ldw	x,#1000
9376  0885 bf41          	ldw	_target_cnt_off+4,x
9377  0887 2023          	jra	L7446
9378  0889               L7246:
9379                     ; 596 			target_cnt[i]=0;
9381  0889 7b03          	ld	a,(OFST+0,sp)
9382  088b 5f            	clrw	x
9383  088c 97            	ld	xl,a
9384  088d 58            	sllw	x
9385  088e 905f          	clrw	y
9386  0890 ef45          	ldw	(_target_cnt,x),y
9387                     ; 597 			if(target_cnt_off[i])target_cnt_off[i]--;
9389  0892 7b03          	ld	a,(OFST+0,sp)
9390  0894 5f            	clrw	x
9391  0895 97            	ld	xl,a
9392  0896 58            	sllw	x
9393  0897 e63e          	ld	a,(_target_cnt_off+1,x)
9394  0899 ea3d          	or	a,(_target_cnt_off,x)
9395  089b 270f          	jreq	L7446
9398  089d 7b03          	ld	a,(OFST+0,sp)
9399  089f 5f            	clrw	x
9400  08a0 97            	ld	xl,a
9401  08a1 58            	sllw	x
9402  08a2 9093          	ldw	y,x
9403  08a4 ee3d          	ldw	x,(_target_cnt_off,x)
9404  08a6 1d0001        	subw	x,#1
9405  08a9 90ef3d        	ldw	(_target_cnt_off,y),x
9406  08ac               L7446:
9407                     ; 568 	for(i=0;i<3;i++) {
9409  08ac 0c03          	inc	(OFST+0,sp)
9412  08ae 7b03          	ld	a,(OFST+0,sp)
9413  08b0 a103          	cp	a,#3
9414  08b2 2403          	jruge	L001
9415  08b4 cc07ee        	jp	L1246
9416  08b7               L001:
9417                     ; 601 	if(opto_cnt) opto_cnt--;
9419  08b7 be04          	ldw	x,_opto_cnt
9420  08b9 2707          	jreq	L3546
9423  08bb be04          	ldw	x,_opto_cnt
9424  08bd 1d0001        	subw	x,#1
9425  08c0 bf04          	ldw	_opto_cnt,x
9426  08c2               L3546:
9427                     ; 603 	if(fire_cnt) {
9429  08c2 be37          	ldw	x,_fire_cnt
9430  08c4 271a          	jreq	L5546
9431                     ; 604 		fire_cnt--;
9433  08c6 be37          	ldw	x,_fire_cnt
9434  08c8 1d0001        	subw	x,#1
9435  08cb bf37          	ldw	_fire_cnt,x
9436                     ; 605 		if(!fire_cnt) {
9438  08cd be37          	ldw	x,_fire_cnt
9439  08cf 260f          	jrne	L5546
9440                     ; 606 			if(EE_REMAIN_BALLS==0) {
9442  08d1 ce4040        	ldw	x,_EE_REMAIN_BALLS
9443  08d4 260a          	jrne	L5546
9444                     ; 607 			wrk_stat=wsOFF;
9446  08d6 3f10          	clr	_wrk_stat
9447                     ; 608 			ind=iFin;
9449  08d8 35050055      	mov	_ind,#5
9450                     ; 609 			fin_ind_cnt=40;
9452  08dc 35280052      	mov	_fin_ind_cnt,#40
9453  08e0               L5546:
9454                     ; 613 }
9457  08e0 5b03          	addw	sp,#3
9458  08e2 81            	ret
9486                     ; 615 void target_an (void) {
9487                     	switch	.text
9488  08e3               _target_an:
9492                     ; 616 	if((wrk_stat==wsON) && (fire_cnt) && (opto_cnt)){
9494  08e3 b610          	ld	a,_wrk_stat
9495  08e5 a101          	cp	a,#1
9496  08e7 2633          	jrne	L3746
9498  08e9 be37          	ldw	x,_fire_cnt
9499  08eb 272f          	jreq	L3746
9501  08ed be04          	ldw	x,_opto_cnt
9502  08ef 272b          	jreq	L3746
9503                     ; 617 		if(target_on[0]) EE_BONUS_SIGMA+=5;
9505  08f1 3d39          	tnz	_target_on
9506  08f3 270b          	jreq	L5746
9509  08f5 ce4030        	ldw	x,_EE_BONUS_SIGMA
9510  08f8 1c0005        	addw	x,#5
9511  08fb cf4030        	ldw	_EE_BONUS_SIGMA,x
9513  08fe 201c          	jra	L3746
9514  0900               L5746:
9515                     ; 618 		else if(target_on[1]) EE_BONUS_SIGMA+=10;
9517  0900 3d3a          	tnz	_target_on+1
9518  0902 270b          	jreq	L1056
9521  0904 ce4030        	ldw	x,_EE_BONUS_SIGMA
9522  0907 1c000a        	addw	x,#10
9523  090a cf4030        	ldw	_EE_BONUS_SIGMA,x
9525  090d 200d          	jra	L3746
9526  090f               L1056:
9527                     ; 619 		else if(target_on[2]) EE_BONUS_SIGMA+=20;
9529  090f 3d3b          	tnz	_target_on+2
9530  0911 2709          	jreq	L3746
9533  0913 ce4030        	ldw	x,_EE_BONUS_SIGMA
9534  0916 1c0014        	addw	x,#20
9535  0919 cf4030        	ldw	_EE_BONUS_SIGMA,x
9536  091c               L3746:
9537                     ; 621 	target_on[0]=0;
9539  091c 3f39          	clr	_target_on
9540                     ; 622 	target_on[1]=0;
9542  091e 3f3a          	clr	_target_on+1
9543                     ; 623 	target_on[2]=0;
9545  0920 3f3b          	clr	_target_on+2
9546                     ; 624 }
9549  0922 81            	ret
9573                     ; 626 void rele_drv (void) {
9574                     	switch	.text
9575  0923               _rele_drv:
9579                     ; 628 	GPIOD->DDR|=(1<<6);	
9581  0923 721c5011      	bset	20497,#6
9582                     ; 629 	GPIOD->CR1|=(1<<6);
9584  0927 721c5012      	bset	20498,#6
9585                     ; 630 	GPIOD->CR2&=~(1<<6);
9587  092b 721d5013      	bres	20499,#6
9588                     ; 632 	if(rele_cnt){
9590  092f be35          	ldw	x,_rele_cnt
9591  0931 270d          	jreq	L7156
9592                     ; 633 		rele_cnt--;
9594  0933 be35          	ldw	x,_rele_cnt
9595  0935 1d0001        	subw	x,#1
9596  0938 bf35          	ldw	_rele_cnt,x
9597                     ; 634 		GPIOD->ODR|=(1<<6);
9599  093a 721c500f      	bset	20495,#6
9601  093e 2004          	jra	L1256
9602  0940               L7156:
9603                     ; 636 	else GPIOD->ODR&=~(1<<6);
9605  0940 721d500f      	bres	20495,#6
9606  0944               L1256:
9607                     ; 637 }
9610  0944 81            	ret
9639                     ; 639 void wrk_hndl (void) {
9640                     	switch	.text
9641  0945               _wrk_hndl:
9645                     ; 640 	if(wrk_cnt) {
9647  0945 be4d          	ldw	x,_wrk_cnt
9648  0947 272b          	jreq	L3356
9649                     ; 641 		wrk_cnt--;
9651  0949 be4d          	ldw	x,_wrk_cnt
9652  094b 1d0001        	subw	x,#1
9653  094e bf4d          	ldw	_wrk_cnt,x
9654                     ; 642 		if(wrk_cnt==0) {
9656  0950 be4d          	ldw	x,_wrk_cnt
9657  0952 2620          	jrne	L3356
9658                     ; 643 			wrk_stat=wsOFF;
9660  0954 3f10          	clr	_wrk_stat
9661                     ; 644 			if(EE_REMAIN_BALLS==EE_NUM_OF_BALLS)EE_FISK_CNT--;
9663  0956 ce4040        	ldw	x,_EE_REMAIN_BALLS
9664  0959 c34060        	cpw	x,_EE_NUM_OF_BALLS
9665  095c 2609          	jrne	L7356
9668  095e ce4100        	ldw	x,_EE_FISK_CNT
9669  0961 1d0001        	subw	x,#1
9670  0964 cf4100        	ldw	_EE_FISK_CNT,x
9671  0967               L7356:
9672                     ; 645 			EE_REMAIN_BALLS=0;
9674  0967 5f            	clrw	x
9675  0968 89            	pushw	x
9676  0969 ae4040        	ldw	x,#_EE_REMAIN_BALLS
9677  096c cd0000        	call	c_eewrw
9679  096f 85            	popw	x
9680                     ; 646 			ind=iWait;
9682  0970 35020055      	mov	_ind,#2
9683  0974               L3356:
9684                     ; 649 }
9687  0974 81            	ret
9748                     ; 651 long delay_ms(short in) {
9749                     	switch	.text
9750  0975               _delay_ms:
9752  0975 520c          	subw	sp,#12
9753       0000000c      OFST:	set	12
9756                     ; 654 i=((long)in)*100UL;
9758  0977 90ae0064      	ldw	y,#100
9759  097b cd0000        	call	c_vmul
9761  097e 96            	ldw	x,sp
9762  097f 1c0005        	addw	x,#OFST-7
9763  0982 cd0000        	call	c_rtol
9765                     ; 656 for(ii=0;ii<i;ii++)
9767  0985 ae0000        	ldw	x,#0
9768  0988 1f0b          	ldw	(OFST-1,sp),x
9769  098a ae0000        	ldw	x,#0
9770  098d 1f09          	ldw	(OFST-3,sp),x
9772  098f 2012          	jra	L7756
9773  0991               L3756:
9774                     ; 658 		iii++;
9776  0991 96            	ldw	x,sp
9777  0992 1c0001        	addw	x,#OFST-11
9778  0995 a601          	ld	a,#1
9779  0997 cd0000        	call	c_lgadc
9781                     ; 656 for(ii=0;ii<i;ii++)
9783  099a 96            	ldw	x,sp
9784  099b 1c0009        	addw	x,#OFST-3
9785  099e a601          	ld	a,#1
9786  09a0 cd0000        	call	c_lgadc
9788  09a3               L7756:
9791  09a3 9c            	rvf
9792  09a4 96            	ldw	x,sp
9793  09a5 1c0009        	addw	x,#OFST-3
9794  09a8 cd0000        	call	c_ltor
9796  09ab 96            	ldw	x,sp
9797  09ac 1c0005        	addw	x,#OFST-7
9798  09af cd0000        	call	c_lcmp
9800  09b2 2fdd          	jrslt	L3756
9801                     ; 661 }
9804  09b4 5b0c          	addw	sp,#12
9805  09b6 81            	ret
9828                     ; 663 void gpio_init(void){
9829                     	switch	.text
9830  09b7               _gpio_init:
9834                     ; 665 	GPIOB->CR1&=~((1<<0)|(1<<1)|(1<<2)|(1<<3));
9836  09b7 c65008        	ld	a,20488
9837  09ba a4f0          	and	a,#240
9838  09bc c75008        	ld	20488,a
9839                     ; 666 	GPIOB->CR2&=~((1<<0)|(1<<1)|(1<<2)|(1<<3));
9841  09bf c65009        	ld	a,20489
9842  09c2 a4f0          	and	a,#240
9843  09c4 c75009        	ld	20489,a
9844                     ; 667 	GPIOB->DDR|=((1<<0)|(1<<1)|(1<<2)|(1<<3));
9846  09c7 c65007        	ld	a,20487
9847  09ca aa0f          	or	a,#15
9848  09cc c75007        	ld	20487,a
9849                     ; 670 	GPIOC->CR1&=~0xfe;
9851  09cf c6500d        	ld	a,20493
9852  09d2 a401          	and	a,#1
9853  09d4 c7500d        	ld	20493,a
9854                     ; 671 	GPIOC->CR2&=~0xfe;
9856  09d7 c6500e        	ld	a,20494
9857  09da a401          	and	a,#1
9858  09dc c7500e        	ld	20494,a
9859                     ; 672 	GPIOC->DDR|=0xfe;
9861  09df c6500c        	ld	a,20492
9862  09e2 aafe          	or	a,#254
9863  09e4 c7500c        	ld	20492,a
9864                     ; 673 	GPIOD->CR1&=~0x01;
9866  09e7 72115012      	bres	20498,#0
9867                     ; 674 	GPIOD->CR2&=~0x01;
9869  09eb 72115013      	bres	20499,#0
9870                     ; 675 	GPIOD->DDR|=0x01;	
9872  09ef 72105011      	bset	20497,#0
9873                     ; 677 	GPIOD->DDR&=~(1<<5);	
9875  09f3 721b5011      	bres	20497,#5
9876                     ; 678 	GPIOD->CR1|=(1<<5);
9878  09f7 721a5012      	bset	20498,#5
9879                     ; 679 	GPIOD->CR2&=~(1<<5);
9881  09fb 721b5013      	bres	20499,#5
9882                     ; 681 	GPIOB->DDR&=~(1<<5);	
9884  09ff 721b5007      	bres	20487,#5
9885                     ; 682 	GPIOB->CR1|=(1<<5);
9887  0a03 721a5008      	bset	20488,#5
9888                     ; 683 	GPIOB->CR2&=~(1<<5);
9890  0a07 721b5009      	bres	20489,#5
9891                     ; 685 	GPIOB->ODR|=0x0f;
9893  0a0b c65005        	ld	a,20485
9894  0a0e aa0f          	or	a,#15
9895  0a10 c75005        	ld	20485,a
9896                     ; 686 }
9899  0a13 81            	ret
9922                     ; 688 void t2_init(void){
9923                     	switch	.text
9924  0a14               _t2_init:
9928                     ; 689 	TIM2->PSCR = 0;
9930  0a14 725f530e      	clr	21262
9931                     ; 690 	TIM2->ARRH= 0x02;
9933  0a18 3502530f      	mov	21263,#2
9934                     ; 691 	TIM2->ARRL= 0x00;
9936  0a1c 725f5310      	clr	21264
9937                     ; 692 	TIM2->CCR1H= 0x00;	
9939  0a20 725f5311      	clr	21265
9940                     ; 693 	TIM2->CCR1L= 100;
9942  0a24 35645312      	mov	21266,#100
9943                     ; 694 	TIM2->CCR2H= 0x00;	
9945  0a28 725f5313      	clr	21267
9946                     ; 695 	TIM2->CCR2L= 200;
9948  0a2c 35c85314      	mov	21268,#200
9949                     ; 696 	TIM2->CCR3H= 0x00;	
9951  0a30 725f5315      	clr	21269
9952                     ; 697 	TIM2->CCR3L= 200;
9954  0a34 35c85316      	mov	21270,#200
9955                     ; 700 	TIM2->CCMR2= ((7<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE; //OC2 toggle mode, prelouded
9957  0a38 35785308      	mov	21256,#120
9958                     ; 706 	TIM2->CR1=(TIM2_CR1_CEN | TIM2_CR1_ARPE);	
9960  0a3c 35815300      	mov	21248,#129
9961                     ; 708 }
9964  0a40 81            	ret
9987                     ; 711 void t1_init(void){
9988                     	switch	.text
9989  0a41               _t1_init:
9993                     ; 712 	TIM1->ARRH= (u8)(AUTORELOAD >> 8);			// init pulse period - auto reload register
9995  0a41 35015262      	mov	21090,#1
9996                     ; 713 	TIM1->ARRL= (u8)(AUTORELOAD);
9998  0a45 35a55263      	mov	21091,#165
9999                     ; 714 	TIM1->CCR1H= (u8)((AUTORELOAD/4) >> 8);	// init pulse wide (50% duty cycle) - compare register
10001  0a49 725f5265      	clr	21093
10002                     ; 715 	TIM1->CCR1L= (u8)(AUTORELOAD/4);
10004  0a4d 35695266      	mov	21094,#105
10005                     ; 716 	TIM1->CCR2H= (u8)((AUTORELOAD/8) >> 8);	// init pulse wide (50% duty cycle) - compare register
10007  0a51 725f5267      	clr	21095
10008                     ; 717 	TIM1->CCR2L= (u8)(AUTORELOAD/8);
10010  0a55 35345268      	mov	21096,#52
10011                     ; 719 	TIM1->CCR3H= (u8)((AUTORELOAD/8) >> 8);	// init pulse wide (50% duty cycle) - compare register
10013  0a59 725f5269      	clr	21097
10014                     ; 720 	TIM1->CCR3L= (u8)(AUTORELOAD/8);
10016  0a5d 3534526a      	mov	21098,#52
10017                     ; 722 	TIM1->CCR4H= (u8)((AUTORELOAD/8) >> 8);	// init pulse wide (50% duty cycle) - compare register
10019  0a61 725f526b      	clr	21099
10020                     ; 723 	TIM1->CCR4L= (u8)(AUTORELOAD/8);
10022  0a65 3534526c      	mov	21100,#52
10023                     ; 726 	TIM1->CCMR1= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
10025  0a69 35685258      	mov	21080,#104
10026                     ; 727 	TIM1->CCMR2= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
10028  0a6d 35685259      	mov	21081,#104
10029                     ; 728 	TIM1->CCMR3= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
10031  0a71 3568525a      	mov	21082,#104
10032                     ; 729 	TIM1->CCMR4= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
10034  0a75 3568525b      	mov	21083,#104
10035                     ; 733 	TIM1->CCER1 = 0xff;//TIM1_CCER1_CC2E|TIM1_CCER1_CC1E|TIM1_CCER1_CC2P|TIM1_CCER1_CC1P;	// OC1 enable output pin
10037  0a79 35ff525c      	mov	21084,#255
10038                     ; 735 	TIM1->CCER2 = 0xff;
10040  0a7d 35ff525d      	mov	21085,#255
10041                     ; 736 	TIM1->BKR= 0x80;
10043  0a81 3580526d      	mov	21101,#128
10044                     ; 737 	TIM1->IER|= TIM1_IER_UIE;					// enable break interrupt
10046  0a85 72105254      	bset	21076,#0
10047                     ; 739 	TIM1->CR1= TIM4_CR1_URS|TIM1_CR1_CEN| TIM1_CR1_ARPE;					// timer 1 enable
10049  0a89 35855250      	mov	21072,#133
10050                     ; 742 }
10053  0a8d 81            	ret
10076                     ; 744 void spi_init(void){
10077                     	switch	.text
10078  0a8e               _spi_init:
10082                     ; 745 	SPI->CR1= /*SPI_CR1_LSBFIRST |*/
10082                     ; 746 			SPI_CR1_SPE | 
10082                     ; 747 			( (3<< 2) & SPI_CR1_BR ) |
10082                     ; 748 			SPI_CR1_MSTR |
10082                     ; 749 			SPI_CR1_CPOL |
10082                     ; 750 			SPI_CR1_CPHA; 
10084  0a8e 354f5200      	mov	20992,#79
10085                     ; 752 	SPI->CR2= SPI_CR2_SSM | SPI_CR2_SSI;
10087  0a92 35035201      	mov	20993,#3
10088                     ; 753 	SPI->ICR= 0;	
10090  0a96 725f5202      	clr	20994
10091                     ; 754 }
10094  0a9a 81            	ret
10137                     ; 756 char spi(char in){
10138                     	switch	.text
10139  0a9b               _spi:
10141  0a9b 88            	push	a
10142  0a9c 88            	push	a
10143       00000001      OFST:	set	1
10146  0a9d               L7666:
10147                     ; 758 	while(!((SPI->SR)&SPI_SR_TXE));
10149  0a9d c65203        	ld	a,20995
10150  0aa0 a502          	bcp	a,#2
10151  0aa2 27f9          	jreq	L7666
10152                     ; 759 	SPI->DR=in;
10154  0aa4 7b02          	ld	a,(OFST+1,sp)
10155  0aa6 c75204        	ld	20996,a
10157  0aa9               L7766:
10158                     ; 760 	while(!((SPI->SR)&SPI_SR_RXNE));
10160  0aa9 c65203        	ld	a,20995
10161  0aac a501          	bcp	a,#1
10162  0aae 27f9          	jreq	L7766
10163                     ; 761 	c=SPI->DR;	
10165  0ab0 c65204        	ld	a,20996
10166  0ab3 6b01          	ld	(OFST+0,sp),a
10167                     ; 762 	return c;
10169  0ab5 7b01          	ld	a,(OFST+0,sp)
10172  0ab7 85            	popw	x
10173  0ab8 81            	ret
10196                     ; 765 void t4_init(void){
10197                     	switch	.text
10198  0ab9               _t4_init:
10202                     ; 766 	TIM4->PSCR = 7;
10204  0ab9 35075347      	mov	21319,#7
10205                     ; 767 	TIM4->ARR= 123;
10207  0abd 357b5348      	mov	21320,#123
10208                     ; 768 	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
10210  0ac1 72105343      	bset	21315,#0
10211                     ; 770 	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
10213  0ac5 35855340      	mov	21312,#133
10214                     ; 772 }
10217  0ac9 81            	ret
10269                     ; 777 @far @interrupt void TIM4_UPD_Interrupt (void) {
10271                     	switch	.text
10272  0aca               f_TIM4_UPD_Interrupt:
10276                     ; 779 	ind_cnt++;
10278  0aca 3c1e          	inc	_ind_cnt
10279                     ; 780 	if(ind_cnt>=10)ind_cnt=0;
10281  0acc b61e          	ld	a,_ind_cnt
10282  0ace a10a          	cp	a,#10
10283  0ad0 2502          	jrult	L3276
10286  0ad2 3f1e          	clr	_ind_cnt
10287  0ad4               L3276:
10288                     ; 781 	GPIOB->ODR|=0x0f;
10290  0ad4 c65005        	ld	a,20485
10291  0ad7 aa0f          	or	a,#15
10292  0ad9 c75005        	ld	20485,a
10293                     ; 782 	if(ind_cnt<4){
10295  0adc b61e          	ld	a,_ind_cnt
10296  0ade a104          	cp	a,#4
10297  0ae0 244a          	jruge	L5276
10298                     ; 783 		GPIOC->ODR|=0xfe;
10300  0ae2 c6500a        	ld	a,20490
10301  0ae5 aafe          	or	a,#254
10302  0ae7 c7500a        	ld	20490,a
10303                     ; 784 		GPIOD->ODR|=0x01;
10305  0aea 7210500f      	bset	20495,#0
10306                     ; 785 		GPIOC->ODR&=ind_out[3-ind_cnt]|0x01;
10308  0aee a600          	ld	a,#0
10309  0af0 97            	ld	xl,a
10310  0af1 a603          	ld	a,#3
10311  0af3 b01e          	sub	a,_ind_cnt
10312  0af5 2401          	jrnc	L031
10313  0af7 5a            	decw	x
10314  0af8               L031:
10315  0af8 02            	rlwa	x,a
10316  0af9 e604          	ld	a,(_ind_out,x)
10317  0afb aa01          	or	a,#1
10318  0afd c4500a        	and	a,20490
10319  0b00 c7500a        	ld	20490,a
10320                     ; 786 		GPIOD->ODR&=ind_out[3-ind_cnt]|0xfe;
10322  0b03 a600          	ld	a,#0
10323  0b05 97            	ld	xl,a
10324  0b06 a603          	ld	a,#3
10325  0b08 b01e          	sub	a,_ind_cnt
10326  0b0a 2401          	jrnc	L231
10327  0b0c 5a            	decw	x
10328  0b0d               L231:
10329  0b0d 02            	rlwa	x,a
10330  0b0e e604          	ld	a,(_ind_out,x)
10331  0b10 aafe          	or	a,#254
10332  0b12 c4500f        	and	a,20495
10333  0b15 c7500f        	ld	20495,a
10334                     ; 788 		GPIOB->ODR&=~(1<<ind_cnt);
10336  0b18 b61e          	ld	a,_ind_cnt
10337  0b1a 5f            	clrw	x
10338  0b1b 97            	ld	xl,a
10339  0b1c a601          	ld	a,#1
10340  0b1e 5d            	tnzw	x
10341  0b1f 2704          	jreq	L431
10342  0b21               L631:
10343  0b21 48            	sll	a
10344  0b22 5a            	decw	x
10345  0b23 26fc          	jrne	L631
10346  0b25               L431:
10347  0b25 43            	cpl	a
10348  0b26 c45005        	and	a,20485
10349  0b29 c75005        	ld	20485,a
10350  0b2c               L5276:
10351                     ; 791 	b1000Hz=1;
10353  0b2c 35010000      	mov	_b1000Hz,#1
10354                     ; 792 	if(++t0_cnt0>=10){
10356  0b30 725c0006      	inc	_t0_cnt0
10357  0b34 c60006        	ld	a,_t0_cnt0
10358  0b37 a10a          	cp	a,#10
10359  0b39 2575          	jrult	L7276
10360                     ; 793     		t0_cnt0=0;
10362  0b3b 725f0006      	clr	_t0_cnt0
10363                     ; 794     		b100Hz=1;
10365  0b3f 35010001      	mov	_b100Hz,#1
10366                     ; 796 		if(++t0_cnt1>=10){
10368  0b43 725c0007      	inc	_t0_cnt1
10369  0b47 c60007        	ld	a,_t0_cnt1
10370  0b4a a10a          	cp	a,#10
10371  0b4c 2508          	jrult	L1376
10372                     ; 797 			t0_cnt1=0;
10374  0b4e 725f0007      	clr	_t0_cnt1
10375                     ; 798 			b10Hz=1;
10377  0b52 35010002      	mov	_b10Hz,#1
10378  0b56               L1376:
10379                     ; 802 		if(++t0_cnt2>=20){
10381  0b56 725c0008      	inc	_t0_cnt2
10382  0b5a c60008        	ld	a,_t0_cnt2
10383  0b5d a114          	cp	a,#20
10384  0b5f 2513          	jrult	L3376
10385                     ; 803 			t0_cnt2=0;
10387  0b61 725f0008      	clr	_t0_cnt2
10388                     ; 804 			b5Hz=1;
10390  0b65 35010003      	mov	_b5Hz,#1
10391                     ; 805 			bFL5=!bFL5;
10393  0b69 3d12          	tnz	_bFL5
10394  0b6b 2604          	jrne	L041
10395  0b6d a601          	ld	a,#1
10396  0b6f 2001          	jra	L241
10397  0b71               L041:
10398  0b71 4f            	clr	a
10399  0b72               L241:
10400  0b72 b712          	ld	_bFL5,a
10401  0b74               L3376:
10402                     ; 808 		if(++t0_cnt3>=50){
10404  0b74 725c0009      	inc	_t0_cnt3
10405  0b78 c60009        	ld	a,_t0_cnt3
10406  0b7b a132          	cp	a,#50
10407  0b7d 2513          	jrult	L5376
10408                     ; 809 			t0_cnt3=0;
10410  0b7f 725f0009      	clr	_t0_cnt3
10411                     ; 810 			b2Hz=1;
10413  0b83 35010004      	mov	_b2Hz,#1
10414                     ; 811 			bFL2=!bFL2;		
10416  0b87 3d11          	tnz	_bFL2
10417  0b89 2604          	jrne	L441
10418  0b8b a601          	ld	a,#1
10419  0b8d 2001          	jra	L641
10420  0b8f               L441:
10421  0b8f 4f            	clr	a
10422  0b90               L641:
10423  0b90 b711          	ld	_bFL2,a
10424  0b92               L5376:
10425                     ; 814 		if(++t0_cnt4>=100){
10427  0b92 725c000a      	inc	_t0_cnt4
10428  0b96 c6000a        	ld	a,_t0_cnt4
10429  0b99 a164          	cp	a,#100
10430  0b9b 2513          	jrult	L7276
10431                     ; 815 			t0_cnt4=0;
10433  0b9d 725f000a      	clr	_t0_cnt4
10434                     ; 816 			b1Hz=1;
10436  0ba1 35010005      	mov	_b1Hz,#1
10437                     ; 817 			bFL1=!bFL1;
10439  0ba5 3d10          	tnz	_bFL1
10440  0ba7 2604          	jrne	L051
10441  0ba9 a601          	ld	a,#1
10442  0bab 2001          	jra	L251
10443  0bad               L051:
10444  0bad 4f            	clr	a
10445  0bae               L251:
10446  0bae b710          	ld	_bFL1,a
10447  0bb0               L7276:
10448                     ; 821 	if(!(GPIOB->IDR&(1<<5))) {
10450  0bb0 c65006        	ld	a,20486
10451  0bb3 a520          	bcp	a,#32
10452  0bb5 2613          	jrne	L1476
10453                     ; 822 		/*EE_PLAZMA=t0_cnt1;//*/ind_on_cnt=50;
10455  0bb7 ae0032        	ldw	x,#50
10456  0bba bf0b          	ldw	_ind_on_cnt,x
10457                     ; 823 		if(!cnt_bKEY) {
10459  0bbc 3d25          	tnz	_cnt_bKEY
10460  0bbe 2610          	jrne	L5476
10461                     ; 824 			bKEY=1;
10463  0bc0 3501002a      	mov	_bKEY,#1
10464                     ; 825 			cnt_bKEY=50;
10466  0bc4 35320025      	mov	_cnt_bKEY,#50
10467  0bc8 2006          	jra	L5476
10468  0bca               L1476:
10469                     ; 829 		if(cnt_bKEY)cnt_bKEY--;
10471  0bca 3d25          	tnz	_cnt_bKEY
10472  0bcc 2702          	jreq	L5476
10475  0bce 3a25          	dec	_cnt_bKEY
10476  0bd0               L5476:
10477                     ; 832 	if(zatvor_cnt) zatvor_cnt--;
10479  0bd0 be2b          	ldw	x,_zatvor_cnt
10480  0bd2 2707          	jreq	L1576
10483  0bd4 be2b          	ldw	x,_zatvor_cnt
10484  0bd6 1d0001        	subw	x,#1
10485  0bd9 bf2b          	ldw	_zatvor_cnt,x
10486  0bdb               L1576:
10487                     ; 834 	if(!(GPIOD->IDR&(1<<5))) {
10489  0bdb c65010        	ld	a,20496
10490  0bde a520          	bcp	a,#32
10491  0be0 260e          	jrne	L3576
10492                     ; 835 		if(!cnt_bFIRE) {
10494  0be2 3d24          	tnz	_cnt_bFIRE
10495  0be4 2614          	jrne	L7576
10496                     ; 836 			bFIRE=1;
10498  0be6 35010029      	mov	_bFIRE,#1
10499                     ; 837 			cnt_bFIRE=50;
10501  0bea 35320024      	mov	_cnt_bFIRE,#50
10502  0bee 200a          	jra	L7576
10503  0bf0               L3576:
10504                     ; 841 		if(cnt_bFIRE)cnt_bFIRE--;
10506  0bf0 3d24          	tnz	_cnt_bFIRE
10507  0bf2 2702          	jreq	L1676
10510  0bf4 3a24          	dec	_cnt_bFIRE
10511  0bf6               L1676:
10512                     ; 842 		bZATVOR=0;
10514  0bf6 3f03          	clr	_bZATVOR
10515                     ; 843 		but_cnt=0;
10517  0bf8 3f00          	clr	_but_cnt
10518  0bfa               L7576:
10519                     ; 846 	if(!(GPIOD->IDR&(1<<5))) {
10521  0bfa c65010        	ld	a,20496
10522  0bfd a520          	bcp	a,#32
10523  0bff 261c          	jrne	L3676
10524                     ; 847 		cnt_bFIRE_++;
10526  0c01 be21          	ldw	x,_cnt_bFIRE_
10527  0c03 1c0001        	addw	x,#1
10528  0c06 bf21          	ldw	_cnt_bFIRE_,x
10529                     ; 848 		if(cnt_bFIRE_>2000) {
10531  0c08 9c            	rvf
10532  0c09 be21          	ldw	x,_cnt_bFIRE_
10533  0c0b a307d1        	cpw	x,#2001
10534  0c0e 2f10          	jrslt	L7676
10535                     ; 849 			bFIRE_=1;
10537  0c10 35010028      	mov	_bFIRE_,#1
10538                     ; 850 			bFIRE_BLOCK=1;
10540  0c14 35010026      	mov	_bFIRE_BLOCK,#1
10541                     ; 851 			cnt_bFIRE_=0;
10543  0c18 5f            	clrw	x
10544  0c19 bf21          	ldw	_cnt_bFIRE_,x
10545  0c1b 2003          	jra	L7676
10546  0c1d               L3676:
10547                     ; 856 		cnt_bFIRE_=0;
10549  0c1d 5f            	clrw	x
10550  0c1e bf21          	ldw	_cnt_bFIRE_,x
10551  0c20               L7676:
10552                     ; 859 	if((!(GPIOD->IDR&(1<<5))) && (!bFIRE_BLOCK)) {
10554  0c20 c65010        	ld	a,20496
10555  0c23 a520          	bcp	a,#32
10556  0c25 2612          	jrne	L1776
10558  0c27 3d26          	tnz	_bFIRE_BLOCK
10559  0c29 260e          	jrne	L1776
10560                     ; 860 		cnt_bFIRE1++;
10562  0c2b 3c23          	inc	_cnt_bFIRE1
10563                     ; 861 		if(cnt_bFIRE1>=50) {
10565  0c2d b623          	ld	a,_cnt_bFIRE1
10566  0c2f a132          	cp	a,#50
10567  0c31 2512          	jrult	L5776
10568                     ; 862 			cnt_bFIRE1=50;
10570  0c33 35320023      	mov	_cnt_bFIRE1,#50
10571  0c37 200c          	jra	L5776
10572  0c39               L1776:
10573                     ; 866 		if(cnt_bFIRE1>=50) {
10575  0c39 b623          	ld	a,_cnt_bFIRE1
10576  0c3b a132          	cp	a,#50
10577  0c3d 2506          	jrult	L5776
10578                     ; 867 			bFIRE1=1;
10580  0c3f 35010027      	mov	_bFIRE1,#1
10581                     ; 868 			cnt_bFIRE1=0;
10583  0c43 3f23          	clr	_cnt_bFIRE1
10584  0c45               L5776:
10585                     ; 873 	if(GPIOD->IDR&(1<<5)) bFIRE_BLOCK=0;
10587  0c45 c65010        	ld	a,20496
10588  0c48 a520          	bcp	a,#32
10589  0c4a 2702          	jreq	L1007
10592  0c4c 3f26          	clr	_bFIRE_BLOCK
10593  0c4e               L1007:
10594                     ; 875 	TIM4->SR1&=~TIM4_SR1_UIF;			// disable break interrupt
10596  0c4e 72115344      	bres	21316,#0
10597                     ; 876 	return;
10600  0c52 80            	iret
10622                     ; 879 @far @interrupt void TIM1_Ovf_Interrupt (void) {
10623                     	switch	.text
10624  0c53               f_TIM1_Ovf_Interrupt:
10628                     ; 880 	GPIOD->ODR^=(1<<3)|(1<<4);
10630  0c53 c6500f        	ld	a,20495
10631  0c56 a818          	xor	a,	#24
10632  0c58 c7500f        	ld	20495,a
10633                     ; 881 	TIM1->SR1&=~TIM1_SR1_UIF;			
10635  0c5b 72115255      	bres	21077,#0
10636                     ; 882 }
10639  0c5f 80            	iret
10688                     ; 887 main(){
10690                     	switch	.text
10691  0c60               _main:
10695                     ; 888 	CLK->CKDIVR=0;
10697  0c60 725f50c6      	clr	20678
10698                     ; 890 	gpio_init();
10700  0c64 cd09b7        	call	_gpio_init
10702                     ; 894 	FLASH_DUKR=0xae;
10704  0c67 35ae5064      	mov	_FLASH_DUKR,#174
10705                     ; 895 	FLASH_DUKR=0x56;	
10707  0c6b 35565064      	mov	_FLASH_DUKR,#86
10708                     ; 939 	if(EE_REMAIN_BALLS) {
10710  0c6f ce4040        	ldw	x,_EE_REMAIN_BALLS
10711  0c72 270f          	jreq	L3207
10712                     ; 943 		ind=iWait1;
10714  0c74 350c0055      	mov	_ind,#12
10715                     ; 944 		ret_ind=iWait2;
10717  0c78 350d0054      	mov	_ret_ind,#13
10718                     ; 945 		ret_cnt1=1200;
10720  0c7c ae04b0        	ldw	x,#1200
10721  0c7f bf08          	ldw	_ret_cnt1,x
10723  0c81 2003          	jra	L5207
10724  0c83               L3207:
10725                     ; 947 	else in_button();
10727  0c83 cd06e8        	call	_in_button
10729  0c86               L5207:
10730                     ; 952 	t4_init();
10732  0c86 cd0ab9        	call	_t4_init
10734                     ; 953 	enableInterrupts();	
10737  0c89 9a            rim
10739  0c8a               L7207:
10740                     ; 957 		if(b1000Hz){
10742  0c8a 725d0000      	tnz	_b1000Hz
10743  0c8e 271b          	jreq	L3307
10744                     ; 958 			b1000Hz=0;
10746  0c90 725f0000      	clr	_b1000Hz
10747                     ; 959 			opto_drv();
10749  0c94 cd073f        	call	_opto_drv
10751                     ; 960 			target_drv();
10753  0c97 cd07cd        	call	_target_drv
10755                     ; 961 			target_an();
10757  0c9a cd08e3        	call	_target_an
10759                     ; 962 			rele_drv();
10761  0c9d cd0923        	call	_rele_drv
10763                     ; 963 			if(not_fire_cnt)not_fire_cnt--;
10765  0ca0 be02          	ldw	x,_not_fire_cnt
10766  0ca2 2707          	jreq	L3307
10769  0ca4 be02          	ldw	x,_not_fire_cnt
10770  0ca6 1d0001        	subw	x,#1
10771  0ca9 bf02          	ldw	_not_fire_cnt,x
10772  0cab               L3307:
10773                     ; 966 		if(b100Hz){
10775  0cab 725d0001      	tnz	_b100Hz
10776  0caf 270d          	jreq	L7307
10777                     ; 967 			b100Hz=0;
10779  0cb1 725f0001      	clr	_b100Hz
10780                     ; 969 			ibatton_drv();
10782  0cb5 cd0000        	call	_ibatton_drv
10784                     ; 970 			ibatton_an();
10786  0cb8 cd0000        	call	_ibatton_an
10788                     ; 971 			but_an();
10790  0cbb cd051f        	call	_but_an
10792  0cbe               L7307:
10793                     ; 974 		if(b10Hz){
10795  0cbe 725d0002      	tnz	_b10Hz
10796  0cc2 2753          	jreq	L1407
10797                     ; 975 			b10Hz=0;
10799  0cc4 725f0002      	clr	_b10Hz
10800                     ; 978 			ind_hndl();
10802  0cc8 cd01a7        	call	_ind_hndl
10804                     ; 979 			if(ret_cnt){
10806  0ccb be50          	ldw	x,_ret_cnt
10807  0ccd 270e          	jreq	L3407
10808                     ; 980 				ret_cnt--;
10810  0ccf be50          	ldw	x,_ret_cnt
10811  0cd1 1d0001        	subw	x,#1
10812  0cd4 bf50          	ldw	_ret_cnt,x
10813                     ; 981 				if(ret_cnt==0){
10815  0cd6 be50          	ldw	x,_ret_cnt
10816  0cd8 2603          	jrne	L3407
10817                     ; 982 					ind=ret_ind;
10819  0cda 455455        	mov	_ind,_ret_ind
10820  0cdd               L3407:
10821                     ; 985 			if(ret_cnt1){
10823  0cdd be08          	ldw	x,_ret_cnt1
10824  0cdf 2736          	jreq	L1407
10825                     ; 986 				ret_cnt1--;
10827  0ce1 be08          	ldw	x,_ret_cnt1
10828  0ce3 1d0001        	subw	x,#1
10829  0ce6 bf08          	ldw	_ret_cnt1,x
10830                     ; 987 				if(ret_cnt1==0){
10832  0ce8 be08          	ldw	x,_ret_cnt1
10833  0cea 262b          	jrne	L1407
10834                     ; 988 					ind=iWait2;
10836  0cec 350d0055      	mov	_ind,#13
10837                     ; 989 					EE_FISK_CNT1++;
10839  0cf0 ce4108        	ldw	x,_EE_FISK_CNT1
10840  0cf3 1c0001        	addw	x,#1
10841  0cf6 cf4108        	ldw	_EE_FISK_CNT1,x
10842                     ; 990 					if(EE_FISK_CNT1>=100)EE_FISK_CNT1=0;
10844  0cf9 9c            	rvf
10845  0cfa ce4108        	ldw	x,_EE_FISK_CNT1
10846  0cfd a30064        	cpw	x,#100
10847  0d00 2f09          	jrslt	L3507
10850  0d02 5f            	clrw	x
10851  0d03 89            	pushw	x
10852  0d04 ae4108        	ldw	x,#_EE_FISK_CNT1
10853  0d07 cd0000        	call	c_eewrw
10855  0d0a 85            	popw	x
10856  0d0b               L3507:
10857                     ; 991 					EE_REMAIN_BALLS=0;
10859  0d0b 5f            	clrw	x
10860  0d0c 89            	pushw	x
10861  0d0d ae4040        	ldw	x,#_EE_REMAIN_BALLS
10862  0d10 cd0000        	call	c_eewrw
10864  0d13 85            	popw	x
10865                     ; 992 					ret_cnt=0;
10867  0d14 5f            	clrw	x
10868  0d15 bf50          	ldw	_ret_cnt,x
10869  0d17               L1407:
10870                     ; 998 		if(b5Hz){
10872  0d17 725d0003      	tnz	_b5Hz
10873  0d1b 2704          	jreq	L5507
10874                     ; 999 			b5Hz=0;
10876  0d1d 725f0003      	clr	_b5Hz
10877  0d21               L5507:
10878                     ; 1003 		if(b2Hz){
10880  0d21 725d0004      	tnz	_b2Hz
10881  0d25 2704          	jreq	L7507
10882                     ; 1004 			b2Hz=0;
10884  0d27 725f0004      	clr	_b2Hz
10885  0d2b               L7507:
10886                     ; 1008 		if(b1Hz){
10888  0d2b 725d0005      	tnz	_b1Hz
10889  0d2f 2603          	jrne	L061
10890  0d31 cc0c8a        	jp	L7207
10891  0d34               L061:
10892                     ; 1009 			b1Hz=0;
10894  0d34 725f0005      	clr	_b1Hz
10895                     ; 1011 			wrk_hndl();
10897  0d38 cd0945        	call	_wrk_hndl
10899  0d3b ac8a0c8a      	jpf	L7207
11878                     	xdef	_main
11879                     	xdef	f_TIM1_Ovf_Interrupt
11880                     	xdef	_t1_init
11881                     	xdef	_wrk_hndl
11882                     	xdef	_rele_drv
11883                     	xdef	_target_an
11884                     	xdef	_target_drv
11885                     	xdef	_opto_drv
11886                     	xdef	_in_button
11887                     	xdef	_but_an
11888                     	xdef	_ind_hndl
11889                     	xdef	_int2ind_slkuf
11890                     	xdef	_bcd2ind
11891                     	xdef	_long2ind
11892                     	xdef	_bcd2ind_zero
11893                     	xdef	_bin2bcd_int
11894                     	xdef	_bin2bcd_long
11895                     	switch	.ubsct
11896  0000               _plazma_SS:
11897  0000 0000          	ds.b	2
11898                     	xdef	_plazma_SS
11899  0002               _not_fire_cnt:
11900  0002 0000          	ds.b	2
11901                     	xdef	_not_fire_cnt
11902  0004               _opto_cnt:
11903  0004 0000          	ds.b	2
11904                     	xdef	_opto_cnt
11905  0006               _target_plazma:
11906  0006 00            	ds.b	1
11907                     	xdef	_target_plazma
11908  0007               _ind_ind_cnt:
11909  0007 00            	ds.b	1
11910                     	xdef	_ind_ind_cnt
11911  0008               _ret_cnt1:
11912  0008 0000          	ds.b	2
11913                     	xdef	_ret_cnt1
11914  000a               _ind_out_:
11915  000a 0000000000    	ds.b	5
11916                     	xdef	_ind_out_
11917  000f               _bFL_:
11918  000f 00            	ds.b	1
11919                     	xdef	_bFL_
11920  0010               _bFL1:
11921  0010 00            	ds.b	1
11922                     	xdef	_bFL1
11923  0011               _bFL2:
11924  0011 00            	ds.b	1
11925                     	xdef	_bFL2
11926  0012               _bFL5:
11927  0012 00            	ds.b	1
11928                     	xdef	_bFL5
11929                     	xdef	_bERR
11930                     	xdef	_ind_on_cnt1
11931                     	xdef	_ind_on_cnt
11932  0013               _zero_on:
11933  0013 00            	ds.b	1
11934                     	xdef	_zero_on
11935  0014               _dig:
11936  0014 000000000000  	ds.b	10
11937                     	xdef	_dig
11938                     	xdef	_DIGISYM
11939                     	xdef	_ind_out
11940  001e               _ind_cnt:
11941  001e 00            	ds.b	1
11942                     	xdef	_ind_cnt
11943  001f               _parol_sigma:
11944  001f 0000          	ds.b	2
11945                     	xdef	_parol_sigma
11946  0021               _cnt_bFIRE_:
11947  0021 0000          	ds.b	2
11948                     	xdef	_cnt_bFIRE_
11949  0023               _cnt_bFIRE1:
11950  0023 00            	ds.b	1
11951                     	xdef	_cnt_bFIRE1
11952  0024               _cnt_bFIRE:
11953  0024 00            	ds.b	1
11954                     	xdef	_cnt_bFIRE
11955  0025               _cnt_bKEY:
11956  0025 00            	ds.b	1
11957                     	xdef	_cnt_bKEY
11958  0026               _bFIRE_BLOCK:
11959  0026 00            	ds.b	1
11960                     	xdef	_bFIRE_BLOCK
11961  0027               _bFIRE1:
11962  0027 00            	ds.b	1
11963                     	xdef	_bFIRE1
11964  0028               _bFIRE_:
11965  0028 00            	ds.b	1
11966                     	xdef	_bFIRE_
11967  0029               _bFIRE:
11968  0029 00            	ds.b	1
11969                     	xdef	_bFIRE
11970  002a               _bKEY:
11971  002a 00            	ds.b	1
11972                     	xdef	_bKEY
11973  002b               _zatvor_cnt:
11974  002b 0000          	ds.b	2
11975                     	xdef	_zatvor_cnt
11976                     	xdef	_bZATVOR
11977                     	xdef	_rel_out_cnt
11978                     	xdef	_but_cnt
11979                     .eeprom:	section	.data
11980  0000               _ee_plazma:
11981  0000 00000000      	ds.b	4
11982                     	xdef	_ee_plazma
11983  0004               _ee_dumm:
11984  0004 000000000000  	ds.b	10
11985                     	xdef	_ee_dumm
11986                     	xdef	_t0_cnt4
11987                     	xdef	_b2Hz
11988                     	xdef	_b1000Hz
11989                     	xdef	f_TIM4_UPD_Interrupt
11990                     	xdef	_t4_init
11991                     	xdef	_spi_init
11992                     	xdef	_t2_init
11993                     	xdef	_gpio_init
11994                     	xdef	_delay_ms
11995                     	xdef	_spi
11996                     	xdef	_char2indh_sf
11997                     	xdef	_plazma_ibatton2
11998                     	xdef	_plazma_ibatton1
11999                     	switch	.ubsct
12000  002d               _connect_cnt:
12001  002d 0000          	ds.b	2
12002                     	xdef	_connect_cnt
12003  002f               _zero_cnt:
12004  002f 0000          	ds.b	2
12005                     	xdef	_zero_cnt
12006  0031               _one_cnt:
12007  0031 0000          	ds.b	2
12008                     	xdef	_one_cnt
12009  0033               _bLINE_OLD:
12010  0033 00            	ds.b	1
12011                     	xdef	_bLINE_OLD
12012  0034               _bIN_OLD:
12013  0034 00            	ds.b	1
12014                     	xdef	_bIN_OLD
12015  0035               _rele_cnt:
12016  0035 0000          	ds.b	2
12017                     	xdef	_rele_cnt
12018  0037               _fire_cnt:
12019  0037 0000          	ds.b	2
12020                     	xdef	_fire_cnt
12021  0039               _target_on:
12022  0039 00000000      	ds.b	4
12023                     	xdef	_target_on
12024  003d               _target_cnt_off:
12025  003d 000000000000  	ds.b	8
12026                     	xdef	_target_cnt_off
12027  0045               _target_cnt:
12028  0045 000000000000  	ds.b	8
12029                     	xdef	_target_cnt
12030  004d               _wrk_cnt:
12031  004d 0000          	ds.b	2
12032                     	xdef	_wrk_cnt
12033                     	xdef	_wrk_stat
12034                     	switch	.bss
12035  0000               _rx_plazma:
12036  0000 00            	ds.b	1
12037                     	xdef	_rx_plazma
12038                     	switch	.ubsct
12039  004f               _i_ser_num_cnt:
12040  004f 00            	ds.b	1
12041                     	xdef	_i_ser_num_cnt
12042  0050               _ret_cnt:
12043  0050 0000          	ds.b	2
12044                     	xdef	_ret_cnt
12045  0052               _fin_ind_cnt:
12046  0052 00            	ds.b	1
12047                     	xdef	_fin_ind_cnt
12048  0053               _sub_ind:
12049  0053 00            	ds.b	1
12050                     	xdef	_sub_ind
12051  0054               _ret_ind:
12052  0054 00            	ds.b	1
12053                     	xdef	_ret_ind
12054  0055               _ind:
12055  0055 00            	ds.b	1
12056                     	xdef	_ind
12057                     	switch	.bss
12058  0001               _bSTART:
12059  0001 00            	ds.b	1
12060                     	xdef	_bSTART
12061                     	xdef	_t0_cnt3
12062                     	xdef	_t0_cnt2
12063                     	xdef	_t0_cnt1
12064                     	xdef	_t0_cnt0
12065                     	xdef	_b1Hz
12066                     	xdef	_b5Hz
12067                     	xdef	_b10Hz
12068                     	xdef	_b100Hz
12069                     	xref	_ibatton_an
12070                     	xref	_ibatton_drv
12071                     	xref.b	c_lreg
12072                     	xref.b	c_x
12073                     	xref.b	c_y
12093                     	xref	c_lcmp
12094                     	xref	c_lgadc
12095                     	xref	c_vmul
12096                     	xref	c_eewrw
12097                     	xref	c_imul
12098                     	xref	c_sdivx
12099                     	xref	c_eewrl
12100                     	xref	c_smodx
12101                     	xref	c_rtol
12102                     	xref	c_ludv
12103                     	xref	c_lumd
12104                     	xref	c_ltor
12105                     	end
