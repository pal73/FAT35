   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
6854                     	switch	.data
6855  0000               _b1000Hz:
6856  0000 00            	dc.b	0
6857  0001               _b100Hz:
6858  0001 00            	dc.b	0
6859  0002               _b10Hz:
6860  0002 00            	dc.b	0
6861  0003               _b5Hz:
6862  0003 00            	dc.b	0
6863  0004               _b2Hz:
6864  0004 00            	dc.b	0
6865  0005               _b1Hz:
6866  0005 00            	dc.b	0
6867  0006               _t0_cnt0:
6868  0006 00            	dc.b	0
6869  0007               _t0_cnt1:
6870  0007 00            	dc.b	0
6871  0008               _t0_cnt2:
6872  0008 00            	dc.b	0
6873  0009               _t0_cnt3:
6874  0009 00            	dc.b	0
6875  000a               _t0_cnt4:
6876  000a 00            	dc.b	0
6897                     	bsct
6898  0000               _but_cnt:
6899  0000 00            	dc.b	0
6900  0001               _rel_out_cnt:
6901  0001 0000          	dc.w	0
6902  0003               _bZATVOR:
6903  0003 00            	dc.b	0
6904  0004               _ind_out:
6905  0004 ff            	dc.b	255
6906  0005 ff            	dc.b	255
6907  0006 ff            	dc.b	255
6908  0007 ff            	dc.b	255
6909  0008 ff            	dc.b	255
6910  0009 ff            	dc.b	255
6911  000a ff            	dc.b	255
6912                     .const:	section	.text
6913  0000               _DIGISYM:
6914  0000 81            	dc.b	129
6915  0001 f3            	dc.b	243
6916  0002 49            	dc.b	73
6917  0003 61            	dc.b	97
6918  0004 33            	dc.b	51
6919  0005 25            	dc.b	37
6920  0006 05            	dc.b	5
6921  0007 f1            	dc.b	241
6922  0008 01            	dc.b	1
6923  0009 21            	dc.b	33
6924  000a 11            	dc.b	17
6925  000b 07            	dc.b	7
6926  000c 8d            	dc.b	141
6927  000d 43            	dc.b	67
6928  000e 07            	dc.b	7
6929  000f 0f            	dc.b	15
6930  0010 ff            	dc.b	255
6931  0011 ff            	dc.b	255
6932  0012 ff            	dc.b	255
6933  0013 ff            	dc.b	255
6934  0014 ff            	dc.b	255
6935  0015 fd            	dc.b	253
6936  0016 fb            	dc.b	251
6937  0017 f7            	dc.b	247
6938  0018 ef            	dc.b	239
6939  0019 df            	dc.b	223
6940  001a bf            	dc.b	191
6941  001b 7f            	dc.b	127
6942  001c 0000          	ds.b	2
6943                     	bsct
6944  000b               _ind_on_cnt:
6945  000b 0000          	dc.w	0
6946  000d               _ind_on_cnt1:
6947  000d 0000          	dc.w	0
6948  000f               _bERR:
6949  000f 01            	dc.b	1
6950  0010               _wrk_stat:
6951  0010 00            	dc.b	0
6952  0011               _plazma_ibatton1:
6953  0011 01            	dc.b	1
6954  0012               _plazma_ibatton2:
6955  0012 02            	dc.b	2
6956                     	switch	.data
6957  000b               _tx_buffer:
6958  000b 00            	dc.b	0
6959  000c 000000000000  	ds.b	79
6960  005b               _rx_buffer:
6961  005b 00            	dc.b	0
6962  005c 000000000000  	ds.b	99
6963                     	bsct
6964  0013               _plazma:
6965  0013 04d2          	dc.w	1234
6966  0015 023e          	dc.w	574
6967  0017 0059          	dc.w	89
6968  0019 0000          	dc.w	0
6969  001b ffff          	dc.w	-1
7019                     	switch	.const
7020  001e               L6:
7021  001e 0000000a      	dc.l	10
7022                     ; 129 void bin2bcd_long(unsigned long in) {
7023                     	scross	off
7024                     	switch	.text
7025  0000               _bin2bcd_long:
7027  0000 88            	push	a
7028       00000001      OFST:	set	1
7031                     ; 132 for(i=0;i<10;i++)
7033  0001 0f01          	clr	(OFST+0,sp)
7034  0003               L5645:
7035                     ; 134 	dig[i]=in%10L;
7037  0003 96            	ldw	x,sp
7038  0004 1c0004        	addw	x,#OFST+3
7039  0007 cd0000        	call	c_ltor
7041  000a ae001e        	ldw	x,#L6
7042  000d cd0000        	call	c_lumd
7044  0010 7b01          	ld	a,(OFST+0,sp)
7045  0012 5f            	clrw	x
7046  0013 97            	ld	xl,a
7047  0014 b603          	ld	a,c_lreg+3
7048  0016 e721          	ld	(_dig,x),a
7049                     ; 135 	in/=10L;
7051  0018 96            	ldw	x,sp
7052  0019 1c0004        	addw	x,#OFST+3
7053  001c cd0000        	call	c_ltor
7055  001f ae001e        	ldw	x,#L6
7056  0022 cd0000        	call	c_ludv
7058  0025 96            	ldw	x,sp
7059  0026 1c0004        	addw	x,#OFST+3
7060  0029 cd0000        	call	c_rtol
7062                     ; 132 for(i=0;i<10;i++)
7064  002c 0c01          	inc	(OFST+0,sp)
7067  002e 7b01          	ld	a,(OFST+0,sp)
7068  0030 a10a          	cp	a,#10
7069  0032 25cf          	jrult	L5645
7070                     ; 137 }
7073  0034 84            	pop	a
7074  0035 81            	ret
7118                     ; 140 void bin2bcd_int(unsigned short in) {
7119                     	switch	.text
7120  0036               _bin2bcd_int:
7122  0036 89            	pushw	x
7123  0037 88            	push	a
7124       00000001      OFST:	set	1
7127                     ; 142 char i=5;
7129                     ; 144 for(i=0;i<5;i++)
7131  0038 0f01          	clr	(OFST+0,sp)
7132  003a               L5155:
7133                     ; 146 	dig[i]=in%10;
7135  003a 1e02          	ldw	x,(OFST+1,sp)
7136  003c 90ae000a      	ldw	y,#10
7137  0040 65            	divw	x,y
7138  0041 51            	exgw	x,y
7139  0042 7b01          	ld	a,(OFST+0,sp)
7140  0044 905f          	clrw	y
7141  0046 9097          	ld	yl,a
7142  0048 01            	rrwa	x,a
7143  0049 90e721        	ld	(_dig,y),a
7144  004c 02            	rlwa	x,a
7145                     ; 147 	in/=10;
7147  004d 1e02          	ldw	x,(OFST+1,sp)
7148  004f 90ae000a      	ldw	y,#10
7149  0053 65            	divw	x,y
7150  0054 1f02          	ldw	(OFST+1,sp),x
7151                     ; 144 for(i=0;i<5;i++)
7153  0056 0c01          	inc	(OFST+0,sp)
7156  0058 7b01          	ld	a,(OFST+0,sp)
7157  005a a105          	cp	a,#5
7158  005c 25dc          	jrult	L5155
7159                     ; 149 }
7162  005e 5b03          	addw	sp,#3
7163  0060 81            	ret
7200                     ; 152 void bcd2ind(void) {
7201                     	switch	.text
7202  0061               _bcd2ind:
7204  0061 88            	push	a
7205       00000001      OFST:	set	1
7208                     ; 155 for (i=4;i>0;i--)
7210  0062 a604          	ld	a,#4
7211  0064 6b01          	ld	(OFST+0,sp),a
7212  0066               L1455:
7213                     ; 157 	ind_out_[i-1]=DIGISYM[dig[i-1]];
7215  0066 7b01          	ld	a,(OFST+0,sp)
7216  0068 5f            	clrw	x
7217  0069 97            	ld	xl,a
7218  006a 5a            	decw	x
7219  006b 7b01          	ld	a,(OFST+0,sp)
7220  006d 905f          	clrw	y
7221  006f 9097          	ld	yl,a
7222  0071 905a          	decw	y
7223  0073 90e621        	ld	a,(_dig,y)
7224  0076 905f          	clrw	y
7225  0078 9097          	ld	yl,a
7226  007a 90d60000      	ld	a,(_DIGISYM,y)
7227  007e e717          	ld	(_ind_out_,x),a
7228                     ; 155 for (i=4;i>0;i--)
7230  0080 0a01          	dec	(OFST+0,sp)
7233  0082 0d01          	tnz	(OFST+0,sp)
7234  0084 26e0          	jrne	L1455
7235                     ; 159 }
7238  0086 84            	pop	a
7239  0087 81            	ret
7277                     ; 161 void bcd2ind_zero() {
7278                     	switch	.text
7279  0088               _bcd2ind_zero:
7281  0088 88            	push	a
7282       00000001      OFST:	set	1
7285                     ; 163 zero_on=1;
7287  0089 35010020      	mov	_zero_on,#1
7288                     ; 164 for (i=4;i>0;i--)
7290  008d a604          	ld	a,#4
7291  008f 6b01          	ld	(OFST+0,sp),a
7292  0091               L5655:
7293                     ; 166 	if(zero_on&&(!dig[i-1])&&(i-1))
7295  0091 3d20          	tnz	_zero_on
7296  0093 271e          	jreq	L3755
7298  0095 7b01          	ld	a,(OFST+0,sp)
7299  0097 5f            	clrw	x
7300  0098 97            	ld	xl,a
7301  0099 5a            	decw	x
7302  009a 6d21          	tnz	(_dig,x)
7303  009c 2615          	jrne	L3755
7305  009e 7b01          	ld	a,(OFST+0,sp)
7306  00a0 5f            	clrw	x
7307  00a1 97            	ld	xl,a
7308  00a2 5a            	decw	x
7309  00a3 a30000        	cpw	x,#0
7310  00a6 270b          	jreq	L3755
7311                     ; 168 		ind_out_[i-1]=0b11111111;
7313  00a8 7b01          	ld	a,(OFST+0,sp)
7314  00aa 5f            	clrw	x
7315  00ab 97            	ld	xl,a
7316  00ac 5a            	decw	x
7317  00ad a6ff          	ld	a,#255
7318  00af e717          	ld	(_ind_out_,x),a
7320  00b1 201c          	jra	L5755
7321  00b3               L3755:
7322                     ; 172 		ind_out_[i-1]=DIGISYM[dig[i-1]];
7324  00b3 7b01          	ld	a,(OFST+0,sp)
7325  00b5 5f            	clrw	x
7326  00b6 97            	ld	xl,a
7327  00b7 5a            	decw	x
7328  00b8 7b01          	ld	a,(OFST+0,sp)
7329  00ba 905f          	clrw	y
7330  00bc 9097          	ld	yl,a
7331  00be 905a          	decw	y
7332  00c0 90e621        	ld	a,(_dig,y)
7333  00c3 905f          	clrw	y
7334  00c5 9097          	ld	yl,a
7335  00c7 90d60000      	ld	a,(_DIGISYM,y)
7336  00cb e717          	ld	(_ind_out_,x),a
7337                     ; 173 		zero_on=0;
7339  00cd 3f20          	clr	_zero_on
7340  00cf               L5755:
7341                     ; 164 for (i=4;i>0;i--)
7343  00cf 0a01          	dec	(OFST+0,sp)
7346  00d1 0d01          	tnz	(OFST+0,sp)
7347  00d3 26bc          	jrne	L5655
7348                     ; 176 }
7351  00d5 84            	pop	a
7352  00d6 81            	ret
7388                     ; 178 void long2ind(unsigned long in) {
7389                     	switch	.text
7390  00d7               _long2ind:
7392       00000000      OFST:	set	0
7395                     ; 180 bin2bcd_long(in);
7397  00d7 1e05          	ldw	x,(OFST+5,sp)
7398  00d9 89            	pushw	x
7399  00da 1e05          	ldw	x,(OFST+5,sp)
7400  00dc 89            	pushw	x
7401  00dd cd0000        	call	_bin2bcd_long
7403  00e0 5b04          	addw	sp,#4
7404                     ; 181 bcd2ind_zero();
7406  00e2 ada4          	call	_bcd2ind_zero
7408                     ; 183 }
7411  00e4 81            	ret
7508                     ; 185 void int2ind_slkuf(unsigned short in, char start, char len, char komma, char unzero, char fl) {
7509                     	switch	.text
7510  00e5               _int2ind_slkuf:
7512  00e5 89            	pushw	x
7513  00e6 88            	push	a
7514       00000001      OFST:	set	1
7517                     ; 188 	bin2bcd_int(in);
7519  00e7 cd0036        	call	_bin2bcd_int
7521                     ; 189 	if(unzero)bcd2ind_zero();
7523  00ea 0d09          	tnz	(OFST+8,sp)
7524  00ec 2704          	jreq	L3665
7527  00ee ad98          	call	_bcd2ind_zero
7530  00f0 2003          	jra	L5665
7531  00f2               L3665:
7532                     ; 190 	else bcd2ind();
7534  00f2 cd0061        	call	_bcd2ind
7536  00f5               L5665:
7537                     ; 191 	if(komma)ind_out_[komma]&=0b11111110; 
7539  00f5 0d08          	tnz	(OFST+7,sp)
7540  00f7 270a          	jreq	L7665
7543  00f9 7b08          	ld	a,(OFST+7,sp)
7544  00fb 5f            	clrw	x
7545  00fc 97            	ld	xl,a
7546  00fd e617          	ld	a,(_ind_out_,x)
7547  00ff a4fe          	and	a,#254
7548  0101 e717          	ld	(_ind_out_,x),a
7549  0103               L7665:
7550                     ; 192 	if(((fl==1)&&(bFL1)) ||
7550                     ; 193 	   ((fl==2)&&(bFL2)) ||
7550                     ; 194 	   ((fl==5)&&(bFL5))) {
7552  0103 7b0a          	ld	a,(OFST+9,sp)
7553  0105 a101          	cp	a,#1
7554  0107 2604          	jrne	L5765
7556  0109 3d1d          	tnz	_bFL1
7557  010b 2614          	jrne	L3765
7558  010d               L5765:
7560  010d 7b0a          	ld	a,(OFST+9,sp)
7561  010f a102          	cp	a,#2
7562  0111 2604          	jrne	L1075
7564  0113 3d1e          	tnz	_bFL2
7565  0115 260a          	jrne	L3765
7566  0117               L1075:
7568  0117 7b0a          	ld	a,(OFST+9,sp)
7569  0119 a105          	cp	a,#5
7570  011b 2618          	jrne	L1765
7572  011d 3d1f          	tnz	_bFL5
7573  011f 2714          	jreq	L1765
7574  0121               L3765:
7575                     ; 195 		for(i=0;i<len;i++) {
7577  0121 0f01          	clr	(OFST+0,sp)
7579  0123 200a          	jra	L7075
7580  0125               L3075:
7581                     ; 196 			ind_out_[i]=DIGISYM[17];
7583  0125 7b01          	ld	a,(OFST+0,sp)
7584  0127 5f            	clrw	x
7585  0128 97            	ld	xl,a
7586  0129 a6ff          	ld	a,#255
7587  012b e717          	ld	(_ind_out_,x),a
7588                     ; 195 		for(i=0;i<len;i++) {
7590  012d 0c01          	inc	(OFST+0,sp)
7591  012f               L7075:
7594  012f 7b01          	ld	a,(OFST+0,sp)
7595  0131 1107          	cp	a,(OFST+6,sp)
7596  0133 25f0          	jrult	L3075
7597  0135               L1765:
7598                     ; 200 	for(i=0;i<len;i++) {
7600  0135 0f01          	clr	(OFST+0,sp)
7602  0137 2016          	jra	L7175
7603  0139               L3175:
7604                     ; 201 		ind_out[start+i]=ind_out_[i];
7606  0139 7b06          	ld	a,(OFST+5,sp)
7607  013b 5f            	clrw	x
7608  013c 1b01          	add	a,(OFST+0,sp)
7609  013e 2401          	jrnc	L22
7610  0140 5c            	incw	x
7611  0141               L22:
7612  0141 02            	rlwa	x,a
7613  0142 7b01          	ld	a,(OFST+0,sp)
7614  0144 905f          	clrw	y
7615  0146 9097          	ld	yl,a
7616  0148 90e617        	ld	a,(_ind_out_,y)
7617  014b e704          	ld	(_ind_out,x),a
7618                     ; 200 	for(i=0;i<len;i++) {
7620  014d 0c01          	inc	(OFST+0,sp)
7621  014f               L7175:
7624  014f 7b01          	ld	a,(OFST+0,sp)
7625  0151 1107          	cp	a,(OFST+6,sp)
7626  0153 25e4          	jrult	L3175
7627                     ; 205 }
7630  0155 5b03          	addw	sp,#3
7631  0157 81            	ret
7689                     ; 207 void char2indh_sf(unsigned char in, char start, char fl) {
7690                     	switch	.text
7691  0158               _char2indh_sf:
7693  0158 89            	pushw	x
7694       00000000      OFST:	set	0
7697                     ; 210 	ind_out_[0]=DIGISYM[in%16];
7699  0159 9e            	ld	a,xh
7700  015a a40f          	and	a,#15
7701  015c 5f            	clrw	x
7702  015d 97            	ld	xl,a
7703  015e d60000        	ld	a,(_DIGISYM,x)
7704  0161 b717          	ld	_ind_out_,a
7705                     ; 211 	ind_out_[1]=DIGISYM[in/16];
7707  0163 7b01          	ld	a,(OFST+1,sp)
7708  0165 4e            	swap	a
7709  0166 a40f          	and	a,#15
7710  0168 5f            	clrw	x
7711  0169 97            	ld	xl,a
7712  016a d60000        	ld	a,(_DIGISYM,x)
7713  016d b718          	ld	_ind_out_+1,a
7714                     ; 213 	if(((fl==1)&&(bFL1)) ||
7714                     ; 214 	   ((fl==2)&&(bFL2)) ||
7714                     ; 215 	   ((fl==5)&&(bFL5))) {
7716  016f 7b05          	ld	a,(OFST+5,sp)
7717  0171 a101          	cp	a,#1
7718  0173 2604          	jrne	L5575
7720  0175 3d1d          	tnz	_bFL1
7721  0177 2614          	jrne	L3575
7722  0179               L5575:
7724  0179 7b05          	ld	a,(OFST+5,sp)
7725  017b a102          	cp	a,#2
7726  017d 2604          	jrne	L1675
7728  017f 3d1e          	tnz	_bFL2
7729  0181 260a          	jrne	L3575
7730  0183               L1675:
7732  0183 7b05          	ld	a,(OFST+5,sp)
7733  0185 a105          	cp	a,#5
7734  0187 260c          	jrne	L1575
7736  0189 3d1f          	tnz	_bFL5
7737  018b 2708          	jreq	L1575
7738  018d               L3575:
7739                     ; 216 		ind_out_[0]=DIGISYM[17];
7741  018d 35ff0017      	mov	_ind_out_,#255
7742                     ; 217 		ind_out_[1]=DIGISYM[17];
7744  0191 35ff0018      	mov	_ind_out_+1,#255
7745  0195               L1575:
7746                     ; 221 	ind_out[start]=ind_out_[0];
7748  0195 7b02          	ld	a,(OFST+2,sp)
7749  0197 5f            	clrw	x
7750  0198 97            	ld	xl,a
7751  0199 b617          	ld	a,_ind_out_
7752  019b e704          	ld	(_ind_out,x),a
7753                     ; 222 	ind_out[start+1]=ind_out_[1];
7755  019d 7b02          	ld	a,(OFST+2,sp)
7756  019f 5f            	clrw	x
7757  01a0 97            	ld	xl,a
7758  01a1 b618          	ld	a,_ind_out_+1
7759  01a3 e705          	ld	(_ind_out+1,x),a
7760                     ; 226 }
7763  01a5 85            	popw	x
7764  01a6 81            	ret
7806                     ; 228 void ind_hndl(void) {
7807                     	switch	.text
7808  01a7               _ind_hndl:
7810  01a7 89            	pushw	x
7811       00000002      OFST:	set	2
7814                     ; 230 	if(ind==iMn) {
7816  01a8 3d62          	tnz	_ind
7817  01aa 2628          	jrne	L3775
7818                     ; 231 		int2ind_slkuf(cnt_bFIRE_,0,3,0,1,0);
7820  01ac 4b00          	push	#0
7821  01ae 4b01          	push	#1
7822  01b0 4b00          	push	#0
7823  01b2 4b03          	push	#3
7824  01b4 4b00          	push	#0
7825  01b6 be2e          	ldw	x,_cnt_bFIRE_
7826  01b8 cd00e5        	call	_int2ind_slkuf
7828  01bb 5b05          	addw	sp,#5
7829                     ; 232 		int2ind_slkuf(bFIRE_,3,1,0,1,0);
7831  01bd 4b00          	push	#0
7832  01bf 4b01          	push	#1
7833  01c1 4b00          	push	#0
7834  01c3 4b01          	push	#1
7835  01c5 4b03          	push	#3
7836  01c7 b635          	ld	a,_bFIRE_
7837  01c9 5f            	clrw	x
7838  01ca 97            	ld	xl,a
7839  01cb cd00e5        	call	_int2ind_slkuf
7841  01ce 5b05          	addw	sp,#5
7843  01d0 ac1d051d      	jpf	L5775
7844  01d4               L3775:
7845                     ; 240 	else if(ind==iBtn) {
7847  01d4 b662          	ld	a,_ind
7848  01d6 a101          	cp	a,#1
7849  01d8 2616          	jrne	L7775
7850                     ; 241 		int2ind_slkuf(321,0,3,0,1,0);
7852  01da 4b00          	push	#0
7853  01dc 4b01          	push	#1
7854  01de 4b00          	push	#0
7855  01e0 4b03          	push	#3
7856  01e2 4b00          	push	#0
7857  01e4 ae0141        	ldw	x,#321
7858  01e7 cd00e5        	call	_int2ind_slkuf
7860  01ea 5b05          	addw	sp,#5
7862  01ec ac1d051d      	jpf	L5775
7863  01f0               L7775:
7864                     ; 244 	else if(ind==iWait) {
7866  01f0 b662          	ld	a,_ind
7867  01f2 a102          	cp	a,#2
7868  01f4 2677          	jrne	L3006
7869                     ; 245 		ind_ind_cnt++;
7871  01f6 3c14          	inc	_ind_ind_cnt
7872                     ; 246 		if(ind_ind_cnt>50)ind_ind_cnt=0;
7874  01f8 b614          	ld	a,_ind_ind_cnt
7875  01fa a133          	cp	a,#51
7876  01fc 2502          	jrult	L5006
7879  01fe 3f14          	clr	_ind_ind_cnt
7880  0200               L5006:
7881                     ; 248 		if(ind_ind_cnt<18) {
7883  0200 b614          	ld	a,_ind_ind_cnt
7884  0202 a112          	cp	a,#18
7885  0204 243a          	jruge	L7006
7886                     ; 249 			ind_out[0]=DIGISYM[21+(ind_ind_cnt%6)];
7888  0206 b614          	ld	a,_ind_ind_cnt
7889  0208 5f            	clrw	x
7890  0209 97            	ld	xl,a
7891  020a a606          	ld	a,#6
7892  020c cd0000        	call	c_smodx
7894  020f d60015        	ld	a,(_DIGISYM+21,x)
7895  0212 b704          	ld	_ind_out,a
7896                     ; 250 			ind_out[1]=DIGISYM[21+(ind_ind_cnt%6)];
7898  0214 b614          	ld	a,_ind_ind_cnt
7899  0216 5f            	clrw	x
7900  0217 97            	ld	xl,a
7901  0218 a606          	ld	a,#6
7902  021a cd0000        	call	c_smodx
7904  021d d60015        	ld	a,(_DIGISYM+21,x)
7905  0220 b705          	ld	_ind_out+1,a
7906                     ; 251 			ind_out[2]=DIGISYM[21+(ind_ind_cnt%6)];
7908  0222 b614          	ld	a,_ind_ind_cnt
7909  0224 5f            	clrw	x
7910  0225 97            	ld	xl,a
7911  0226 a606          	ld	a,#6
7912  0228 cd0000        	call	c_smodx
7914  022b d60015        	ld	a,(_DIGISYM+21,x)
7915  022e b706          	ld	_ind_out+2,a
7916                     ; 252 			ind_out[3]=DIGISYM[21+(ind_ind_cnt%6)];
7918  0230 b614          	ld	a,_ind_ind_cnt
7919  0232 5f            	clrw	x
7920  0233 97            	ld	xl,a
7921  0234 a606          	ld	a,#6
7922  0236 cd0000        	call	c_smodx
7924  0239 d60015        	ld	a,(_DIGISYM+21,x)
7925  023c b707          	ld	_ind_out+3,a
7927  023e 2012          	jra	L1106
7928  0240               L7006:
7929                     ; 255 			int2ind_slkuf(EE_BONUS_SIGMA,0,4,0,1,2);
7931  0240 4b02          	push	#2
7932  0242 4b01          	push	#1
7933  0244 4b00          	push	#0
7934  0246 4b04          	push	#4
7935  0248 4b00          	push	#0
7936  024a ce4030        	ldw	x,_EE_BONUS_SIGMA
7937  024d cd00e5        	call	_int2ind_slkuf
7939  0250 5b05          	addw	sp,#5
7940  0252               L1106:
7941                     ; 257 		if(bERR){
7943  0252 3d0f          	tnz	_bERR
7944  0254 2603          	jrne	L43
7945  0256 cc051d        	jp	L5775
7946  0259               L43:
7947                     ; 258 			ind_out[0]=0b01011111;
7949  0259 355f0004      	mov	_ind_out,#95
7950                     ; 259 			ind_out[1]=0b01011111;
7952  025d 355f0005      	mov	_ind_out+1,#95
7953                     ; 260 			ind_out[2]=0b00001101;
7955  0261 350d0006      	mov	_ind_out+2,#13
7956                     ; 261 			ind_out[3]=0b11111111;
7958  0265 35ff0007      	mov	_ind_out+3,#255
7959  0269 ac1d051d      	jpf	L5775
7960  026d               L3006:
7961                     ; 268 	else if(ind==iWait1) {
7963  026d b662          	ld	a,_ind
7964  026f a10c          	cp	a,#12
7965  0271 263a          	jrne	L7106
7966                     ; 269 		ind_ind_cnt++;
7968  0273 3c14          	inc	_ind_ind_cnt
7969                     ; 270 		if(ind_ind_cnt==3)ind_ind_cnt++;
7971  0275 b614          	ld	a,_ind_ind_cnt
7972  0277 a103          	cp	a,#3
7973  0279 2602          	jrne	L1206
7976  027b 3c14          	inc	_ind_ind_cnt
7977  027d               L1206:
7978                     ; 271 		if(ind_ind_cnt>4)ind_ind_cnt=0;
7980  027d b614          	ld	a,_ind_ind_cnt
7981  027f a105          	cp	a,#5
7982  0281 2502          	jrult	L3206
7985  0283 3f14          	clr	_ind_ind_cnt
7986  0285               L3206:
7987                     ; 273 		ind_out[0]=DIGISYM[23+(ind_ind_cnt)];
7989  0285 b614          	ld	a,_ind_ind_cnt
7990  0287 5f            	clrw	x
7991  0288 97            	ld	xl,a
7992  0289 d60017        	ld	a,(_DIGISYM+23,x)
7993  028c b704          	ld	_ind_out,a
7994                     ; 274 		ind_out[1]=DIGISYM[23+(ind_ind_cnt)];
7996  028e b614          	ld	a,_ind_ind_cnt
7997  0290 5f            	clrw	x
7998  0291 97            	ld	xl,a
7999  0292 d60017        	ld	a,(_DIGISYM+23,x)
8000  0295 b705          	ld	_ind_out+1,a
8001                     ; 275 		ind_out[2]=DIGISYM[23+(ind_ind_cnt)];
8003  0297 b614          	ld	a,_ind_ind_cnt
8004  0299 5f            	clrw	x
8005  029a 97            	ld	xl,a
8006  029b d60017        	ld	a,(_DIGISYM+23,x)
8007  029e b706          	ld	_ind_out+2,a
8008                     ; 276 		ind_out[3]=DIGISYM[23+(ind_ind_cnt)];
8010  02a0 b614          	ld	a,_ind_ind_cnt
8011  02a2 5f            	clrw	x
8012  02a3 97            	ld	xl,a
8013  02a4 d60017        	ld	a,(_DIGISYM+23,x)
8014  02a7 b707          	ld	_ind_out+3,a
8016  02a9 ac1d051d      	jpf	L5775
8017  02ad               L7106:
8018                     ; 279 	else if(ind==iWait2) {
8020  02ad b662          	ld	a,_ind
8021  02af a10d          	cp	a,#13
8022  02b1 2628          	jrne	L7206
8023                     ; 280 		int2ind_slkuf(11,2,2,0,0,0);
8025  02b3 4b00          	push	#0
8026  02b5 4b00          	push	#0
8027  02b7 4b00          	push	#0
8028  02b9 4b02          	push	#2
8029  02bb 4b02          	push	#2
8030  02bd ae000b        	ldw	x,#11
8031  02c0 cd00e5        	call	_int2ind_slkuf
8033  02c3 5b05          	addw	sp,#5
8034                     ; 281 		int2ind_slkuf(EE_FISK_CNT1,0,2,0,0,0);
8036  02c5 4b00          	push	#0
8037  02c7 4b00          	push	#0
8038  02c9 4b00          	push	#0
8039  02cb 4b02          	push	#2
8040  02cd 4b00          	push	#0
8041  02cf ce4108        	ldw	x,_EE_FISK_CNT1
8042  02d2 cd00e5        	call	_int2ind_slkuf
8044  02d5 5b05          	addw	sp,#5
8046  02d7 ac1d051d      	jpf	L5775
8047  02db               L7206:
8048                     ; 284 	else if(ind==iSet) {
8050  02db b662          	ld	a,_ind
8051  02dd a103          	cp	a,#3
8052  02df 2703cc037e    	jrne	L3306
8053                     ; 285 		int2ind_slkuf(sub_ind+1,3,1,0,1,5);
8055  02e4 4b05          	push	#5
8056  02e6 4b01          	push	#1
8057  02e8 4b00          	push	#0
8058  02ea 4b01          	push	#1
8059  02ec 4b03          	push	#3
8060  02ee b660          	ld	a,_sub_ind
8061  02f0 5f            	clrw	x
8062  02f1 97            	ld	xl,a
8063  02f2 5c            	incw	x
8064  02f3 cd00e5        	call	_int2ind_slkuf
8066  02f6 5b05          	addw	sp,#5
8067                     ; 286 		if(sub_ind==0) {
8069  02f8 3d60          	tnz	_sub_ind
8070  02fa 2616          	jrne	L5306
8071                     ; 287 			int2ind_slkuf(888,0,3,0,1,0);
8073  02fc 4b00          	push	#0
8074  02fe 4b01          	push	#1
8075  0300 4b00          	push	#0
8076  0302 4b03          	push	#3
8077  0304 4b00          	push	#0
8078  0306 ae0378        	ldw	x,#888
8079  0309 cd00e5        	call	_int2ind_slkuf
8081  030c 5b05          	addw	sp,#5
8083  030e ac1d051d      	jpf	L5775
8084  0312               L5306:
8085                     ; 289 		else if(sub_ind==1) {
8087  0312 b660          	ld	a,_sub_ind
8088  0314 a101          	cp	a,#1
8089  0316 2616          	jrne	L1406
8090                     ; 290 			int2ind_slkuf(EE_PNEVMO_TIME,0,3,0,1,0);
8092  0318 4b00          	push	#0
8093  031a 4b01          	push	#1
8094  031c 4b00          	push	#0
8095  031e 4b03          	push	#3
8096  0320 4b00          	push	#0
8097  0322 ce4050        	ldw	x,_EE_PNEVMO_TIME
8098  0325 cd00e5        	call	_int2ind_slkuf
8100  0328 5b05          	addw	sp,#5
8102  032a ac1d051d      	jpf	L5775
8103  032e               L1406:
8104                     ; 292 		else if(sub_ind==2) {
8106  032e b660          	ld	a,_sub_ind
8107  0330 a102          	cp	a,#2
8108  0332 2616          	jrne	L5406
8109                     ; 293 			int2ind_slkuf(EE_NUM_OF_BALLS,0,3,0,1,0);
8111  0334 4b00          	push	#0
8112  0336 4b01          	push	#1
8113  0338 4b00          	push	#0
8114  033a 4b03          	push	#3
8115  033c 4b00          	push	#0
8116  033e ce4060        	ldw	x,_EE_NUM_OF_BALLS
8117  0341 cd00e5        	call	_int2ind_slkuf
8119  0344 5b05          	addw	sp,#5
8121  0346 ac1d051d      	jpf	L5775
8122  034a               L5406:
8123                     ; 295 		else if(sub_ind==3) {
8125  034a b660          	ld	a,_sub_ind
8126  034c a103          	cp	a,#3
8127  034e 260f          	jrne	L1506
8128                     ; 296 			char2indh_sf((char)EE_WRK_BUTTON,0,0);
8130  0350 4b00          	push	#0
8131  0352 5f            	clrw	x
8132  0353 c64023        	ld	a,_EE_WRK_BUTTON+3
8133  0356 95            	ld	xh,a
8134  0357 cd0158        	call	_char2indh_sf
8136  035a 84            	pop	a
8138  035b ac1d051d      	jpf	L5775
8139  035f               L1506:
8140                     ; 298 		else if(sub_ind==4) {
8142  035f b660          	ld	a,_sub_ind
8143  0361 a104          	cp	a,#4
8144  0363 2703          	jreq	L63
8145  0365 cc051d        	jp	L5775
8146  0368               L63:
8147                     ; 299 			int2ind_slkuf(999,0,3,0,1,0);
8149  0368 4b00          	push	#0
8150  036a 4b01          	push	#1
8151  036c 4b00          	push	#0
8152  036e 4b03          	push	#3
8153  0370 4b00          	push	#0
8154  0372 ae03e7        	ldw	x,#999
8155  0375 cd00e5        	call	_int2ind_slkuf
8157  0378 5b05          	addw	sp,#5
8158  037a ac1d051d      	jpf	L5775
8159  037e               L3306:
8160                     ; 304 	else if(ind==iWrk) {
8162  037e b662          	ld	a,_ind
8163  0380 a104          	cp	a,#4
8164  0382 262d          	jrne	L1606
8165                     ; 306 		int2ind_slkuf(EE_BONUS_SIGMA,0,4,0,1,0);
8167  0384 4b00          	push	#0
8168  0386 4b01          	push	#1
8169  0388 4b00          	push	#0
8170  038a 4b04          	push	#4
8171  038c 4b00          	push	#0
8172  038e ce4030        	ldw	x,_EE_BONUS_SIGMA
8173  0391 cd00e5        	call	_int2ind_slkuf
8175  0394 5b05          	addw	sp,#5
8176                     ; 308 		if(bERR){
8178  0396 3d0f          	tnz	_bERR
8179  0398 2603          	jrne	L04
8180  039a cc051d        	jp	L5775
8181  039d               L04:
8182                     ; 309 			ind_out[0]=0b01011111;
8184  039d 355f0004      	mov	_ind_out,#95
8185                     ; 310 			ind_out[1]=0b01011111;
8187  03a1 355f0005      	mov	_ind_out+1,#95
8188                     ; 311 			ind_out[2]=0b00001101;
8190  03a5 350d0006      	mov	_ind_out+2,#13
8191                     ; 312 			ind_out[3]=0b11111111;
8193  03a9 35ff0007      	mov	_ind_out+3,#255
8194  03ad ac1d051d      	jpf	L5775
8195  03b1               L1606:
8196                     ; 316 	else if(ind==iFin) {
8198  03b1 b662          	ld	a,_ind
8199  03b3 a105          	cp	a,#5
8200  03b5 2640          	jrne	L7606
8201                     ; 317 		if(fin_ind_cnt)fin_ind_cnt--;
8203  03b7 3d5f          	tnz	_fin_ind_cnt
8204  03b9 2702          	jreq	L1706
8207  03bb 3a5f          	dec	_fin_ind_cnt
8208  03bd               L1706:
8209                     ; 318 		if(!fin_ind_cnt) {
8211  03bd 3d5f          	tnz	_fin_ind_cnt
8212  03bf 2606          	jrne	L3706
8213                     ; 319 			ind=iWait;
8215  03c1 35020062      	mov	_ind,#2
8216                     ; 320 			ind_ind_cnt=0;
8218  03c5 3f14          	clr	_ind_ind_cnt
8219  03c7               L3706:
8220                     ; 322 		if(fin_ind_cnt&0b00000100) {
8222  03c7 b65f          	ld	a,_fin_ind_cnt
8223  03c9 a504          	bcp	a,#4
8224  03cb 2716          	jreq	L5706
8225                     ; 323 			int2ind_slkuf(EE_BONUS_SIGMA,0,4,0,1,0);
8227  03cd 4b00          	push	#0
8228  03cf 4b01          	push	#1
8229  03d1 4b00          	push	#0
8230  03d3 4b04          	push	#4
8231  03d5 4b00          	push	#0
8232  03d7 ce4030        	ldw	x,_EE_BONUS_SIGMA
8233  03da cd00e5        	call	_int2ind_slkuf
8235  03dd 5b05          	addw	sp,#5
8237  03df ac1d051d      	jpf	L5775
8238  03e3               L5706:
8239                     ; 326 			ind_out[0]=DIGISYM[17];
8241  03e3 35ff0004      	mov	_ind_out,#255
8242                     ; 327 			ind_out[1]=DIGISYM[17];
8244  03e7 35ff0005      	mov	_ind_out+1,#255
8245                     ; 328 			ind_out[2]=DIGISYM[17];
8247  03eb 35ff0006      	mov	_ind_out+2,#255
8248                     ; 329 			ind_out[3]=DIGISYM[17];
8250  03ef 35ff0007      	mov	_ind_out+3,#255
8251  03f3 ac1d051d      	jpf	L5775
8252  03f7               L7606:
8253                     ; 333 	else if(ind==iFisk) {
8255  03f7 b662          	ld	a,_ind
8256  03f9 a106          	cp	a,#6
8257  03fb 2624          	jrne	L3016
8258                     ; 334 		if(fin_ind_cnt)fin_ind_cnt--;
8260  03fd 3d5f          	tnz	_fin_ind_cnt
8261  03ff 2702          	jreq	L5016
8264  0401 3a5f          	dec	_fin_ind_cnt
8265  0403               L5016:
8266                     ; 335 		if(!fin_ind_cnt) {
8268  0403 3d5f          	tnz	_fin_ind_cnt
8269  0405 2604          	jrne	L7016
8270                     ; 336 			ind=iSet;
8272  0407 35030062      	mov	_ind,#3
8273  040b               L7016:
8274                     ; 338 		int2ind_slkuf(EE_FISK_CNT,0,4,0,1,0);
8276  040b 4b00          	push	#0
8277  040d 4b01          	push	#1
8278  040f 4b00          	push	#0
8279  0411 4b04          	push	#4
8280  0413 4b00          	push	#0
8281  0415 ce4100        	ldw	x,_EE_FISK_CNT
8282  0418 cd00e5        	call	_int2ind_slkuf
8284  041b 5b05          	addw	sp,#5
8286  041d ac1d051d      	jpf	L5775
8287  0421               L3016:
8288                     ; 341 	else if(ind==iFisk1) {
8290  0421 b662          	ld	a,_ind
8291  0423 a10e          	cp	a,#14
8292  0425 2624          	jrne	L3116
8293                     ; 342 		if(fin_ind_cnt)fin_ind_cnt--;
8295  0427 3d5f          	tnz	_fin_ind_cnt
8296  0429 2702          	jreq	L5116
8299  042b 3a5f          	dec	_fin_ind_cnt
8300  042d               L5116:
8301                     ; 343 		if(!fin_ind_cnt) {
8303  042d 3d5f          	tnz	_fin_ind_cnt
8304  042f 2604          	jrne	L7116
8305                     ; 344 			ind=iSet;
8307  0431 35030062      	mov	_ind,#3
8308  0435               L7116:
8309                     ; 346 		int2ind_slkuf(EE_FISK_CNT1,0,4,0,1,0);
8311  0435 4b00          	push	#0
8312  0437 4b01          	push	#1
8313  0439 4b00          	push	#0
8314  043b 4b04          	push	#4
8315  043d 4b00          	push	#0
8316  043f ce4108        	ldw	x,_EE_FISK_CNT1
8317  0442 cd00e5        	call	_int2ind_slkuf
8319  0445 5b05          	addw	sp,#5
8321  0447 ac1d051d      	jpf	L5775
8322  044b               L3116:
8323                     ; 349 	else if(ind==iDeb) {
8325  044b b662          	ld	a,_ind
8326  044d a107          	cp	a,#7
8327  044f 2617          	jrne	L3216
8328                     ; 350 		int2ind_slkuf(target_plazma,0,3,0,1,0);
8330  0451 4b00          	push	#0
8331  0453 4b01          	push	#1
8332  0455 4b00          	push	#0
8333  0457 4b03          	push	#3
8334  0459 4b00          	push	#0
8335  045b b613          	ld	a,_target_plazma
8336  045d 5f            	clrw	x
8337  045e 97            	ld	xl,a
8338  045f cd00e5        	call	_int2ind_slkuf
8340  0462 5b05          	addw	sp,#5
8342  0464 ac1d051d      	jpf	L5775
8343  0468               L3216:
8344                     ; 353 	else if(ind==iSerNum) {
8346  0468 b662          	ld	a,_ind
8347  046a a108          	cp	a,#8
8348  046c 2616          	jrne	L7216
8349                     ; 354 		int2ind_slkuf(SERIAL_NUMBER,0,4,0,0,0);
8351  046e 4b00          	push	#0
8352  0470 4b00          	push	#0
8353  0472 4b00          	push	#0
8354  0474 4b04          	push	#4
8355  0476 4b00          	push	#0
8356  0478 ae049f        	ldw	x,#1183
8357  047b cd00e5        	call	_int2ind_slkuf
8359  047e 5b05          	addw	sp,#5
8361  0480 ac1d051d      	jpf	L5775
8362  0484               L7216:
8363                     ; 357 	else if(ind==iMnBut) {
8365  0484 b662          	ld	a,_ind
8366  0486 a109          	cp	a,#9
8367  0488 262d          	jrne	L3316
8368                     ; 358 		ind_ind_cnt++;
8370  048a 3c14          	inc	_ind_ind_cnt
8371                     ; 359 		if(ind_ind_cnt>8)ind_ind_cnt=0;
8373  048c b614          	ld	a,_ind_ind_cnt
8374  048e a109          	cp	a,#9
8375  0490 2502          	jrult	L5316
8378  0492 3f14          	clr	_ind_ind_cnt
8379  0494               L5316:
8380                     ; 361 		ind_out[0]=DIGISYM[20];
8382  0494 35ff0004      	mov	_ind_out,#255
8383                     ; 362 		ind_out[1]=DIGISYM[20];
8385  0498 35ff0005      	mov	_ind_out+1,#255
8386                     ; 363 		ind_out[2]=DIGISYM[20];
8388  049c 35ff0006      	mov	_ind_out+2,#255
8389                     ; 364 		ind_out[3]=DIGISYM[20];
8391  04a0 35ff0007      	mov	_ind_out+3,#255
8392                     ; 366 		ind_out[3-(ind_ind_cnt/2)]=DIGISYM[24];
8394  04a4 b614          	ld	a,_ind_ind_cnt
8395  04a6 44            	srl	a
8396  04a7 5f            	clrw	x
8397  04a8 97            	ld	xl,a
8398  04a9 1f01          	ldw	(OFST-1,sp),x
8399  04ab ae0003        	ldw	x,#3
8400  04ae 72f001        	subw	x,(OFST-1,sp)
8401  04b1 a6ef          	ld	a,#239
8402  04b3 e704          	ld	(_ind_out,x),a
8404  04b5 2066          	jra	L5775
8405  04b7               L3316:
8406                     ; 369 	else if(ind==iMnButPrl) {
8408  04b7 b662          	ld	a,_ind
8409  04b9 a10a          	cp	a,#10
8410  04bb 264a          	jrne	L1416
8411                     ; 373 		ind_out[0]=DIGISYM[27];
8413  04bd 357f0004      	mov	_ind_out,#127
8414                     ; 374 		ind_out[1]=DIGISYM[27];
8416  04c1 357f0005      	mov	_ind_out+1,#127
8417                     ; 375 		ind_out[2]=DIGISYM[27];
8419  04c5 357f0006      	mov	_ind_out+2,#127
8420                     ; 376 		ind_out[3]=DIGISYM[27];
8422  04c9 357f0007      	mov	_ind_out+3,#127
8423                     ; 377 		if(bFL5) {
8425  04cd 3d1f          	tnz	_bFL5
8426  04cf 2710          	jreq	L3416
8427                     ; 378 			ind_out[0]=DIGISYM[20];
8429  04d1 35ff0004      	mov	_ind_out,#255
8430                     ; 379 			ind_out[1]=DIGISYM[20];
8432  04d5 35ff0005      	mov	_ind_out+1,#255
8433                     ; 380 			ind_out[2]=DIGISYM[20];
8435  04d9 35ff0006      	mov	_ind_out+2,#255
8436                     ; 381 			ind_out[3]=DIGISYM[20];
8438  04dd 35ff0007      	mov	_ind_out+3,#255
8439  04e1               L3416:
8440                     ; 384 		ind_out[3-sub_ind]=DIGISYM[27];
8442  04e1 a600          	ld	a,#0
8443  04e3 97            	ld	xl,a
8444  04e4 a603          	ld	a,#3
8445  04e6 b060          	sub	a,_sub_ind
8446  04e8 2401          	jrnc	L03
8447  04ea 5a            	decw	x
8448  04eb               L03:
8449  04eb 02            	rlwa	x,a
8450  04ec a67f          	ld	a,#127
8451  04ee e704          	ld	(_ind_out,x),a
8452                     ; 385 		if(ind_ind_cnt) {
8454  04f0 3d14          	tnz	_ind_ind_cnt
8455  04f2 2729          	jreq	L5775
8456                     ; 386 			ind_ind_cnt--;
8458  04f4 3a14          	dec	_ind_ind_cnt
8459                     ; 387 			ind_out[3-sub_ind]=DIGISYM[20];
8461  04f6 a600          	ld	a,#0
8462  04f8 97            	ld	xl,a
8463  04f9 a603          	ld	a,#3
8464  04fb b060          	sub	a,_sub_ind
8465  04fd 2401          	jrnc	L23
8466  04ff 5a            	decw	x
8467  0500               L23:
8468  0500 02            	rlwa	x,a
8469  0501 a6ff          	ld	a,#255
8470  0503 e704          	ld	(_ind_out,x),a
8471  0505 2016          	jra	L5775
8472  0507               L1416:
8473                     ; 395 	else if(ind==iDnd) {
8475  0507 b662          	ld	a,_ind
8476  0509 a10b          	cp	a,#11
8477  050b 2610          	jrne	L5775
8478                     ; 396 		ind_out[0]=0b01000011;
8480  050d 35430004      	mov	_ind_out,#67
8481                     ; 397 		ind_out[1]=0b00010001;
8483  0511 35110005      	mov	_ind_out+1,#17
8484                     ; 398 		ind_out[2]=0b00000111;
8486  0515 35070006      	mov	_ind_out+2,#7
8487                     ; 399 		ind_out[3]=0b11111111;
8489  0519 35ff0007      	mov	_ind_out+3,#255
8490  051d               L5775:
8491                     ; 401 }
8494  051d 85            	popw	x
8495  051e 81            	ret
8539                     ; 403 void but_an(void) {
8540                     	switch	.text
8541  051f               _but_an:
8545                     ; 404 	if(bKEY || bFIRE || bFIRE_ || bFIRE1) {
8547  051f 3d37          	tnz	_bKEY
8548  0521 260f          	jrne	L5616
8550  0523 3d36          	tnz	_bFIRE
8551  0525 260b          	jrne	L5616
8553  0527 3d35          	tnz	_bFIRE_
8554  0529 2607          	jrne	L5616
8556  052b 3d34          	tnz	_bFIRE1
8557  052d 2603          	jrne	L44
8558  052f cc06df        	jp	L3616
8559  0532               L44:
8560  0532               L5616:
8561                     ; 405 		if(ind==iMn) {
8563  0532 3d62          	tnz	_ind
8564  0534 2629          	jrne	L3716
8565                     ; 406 			if(bFIRE) {
8567  0536 3d36          	tnz	_bFIRE
8568  0538 270a          	jreq	L5716
8569                     ; 407 				sub_ind++;
8571  053a 3c60          	inc	_sub_ind
8572                     ; 408 				if(sub_ind>=4)sub_ind=0;
8574  053c b660          	ld	a,_sub_ind
8575  053e a104          	cp	a,#4
8576  0540 2502          	jrult	L5716
8579  0542 3f60          	clr	_sub_ind
8580  0544               L5716:
8581                     ; 410 			if(bKEY) {
8583  0544 3d37          	tnz	_bKEY
8584  0546 2603          	jrne	L64
8585  0548 cc06df        	jp	L3616
8586  054b               L64:
8587                     ; 411 				ee_plazma=0xabcd;
8589  054b aeabcd        	ldw	x,#43981
8590  054e bf02          	ldw	c_lreg+2,x
8591  0550 ae0000        	ldw	x,#0
8592  0553 bf00          	ldw	c_lreg,x
8593  0555 ae0000        	ldw	x,#_ee_plazma
8594  0558 cd0000        	call	c_eewrl
8596  055b acdf06df      	jpf	L3616
8597  055f               L3716:
8598                     ; 415 		else if(ind==iSet) {
8600  055f b662          	ld	a,_ind
8601  0561 a103          	cp	a,#3
8602  0563 2703          	jreq	L05
8603  0565 cc0617        	jp	L5026
8604  0568               L05:
8605                     ; 416 			if( (sub_ind==0) && (bFIRE) ) {
8607  0568 3d60          	tnz	_sub_ind
8608  056a 2610          	jrne	L7026
8610  056c 3d36          	tnz	_bFIRE
8611  056e 270c          	jreq	L7026
8612                     ; 417 				ind=iFisk;
8614  0570 35060062      	mov	_ind,#6
8615                     ; 418 				fin_ind_cnt=30;
8617  0574 351e005f      	mov	_fin_ind_cnt,#30
8619  0578 acdf06df      	jpf	L3616
8620  057c               L7026:
8621                     ; 420 			else if( (sub_ind==1) && (bFIRE) ) {
8623  057c b660          	ld	a,_sub_ind
8624  057e a101          	cp	a,#1
8625  0580 2642          	jrne	L3126
8627  0582 3d36          	tnz	_bFIRE
8628  0584 273e          	jreq	L3126
8629                     ; 421 				EE_PNEVMO_TIME = ((EE_PNEVMO_TIME/20)+1)*20;
8631  0586 ce4050        	ldw	x,_EE_PNEVMO_TIME
8632  0589 a614          	ld	a,#20
8633  058b cd0000        	call	c_sdivx
8635  058e 90ae0014      	ldw	y,#20
8636  0592 cd0000        	call	c_imul
8638  0595 1c0014        	addw	x,#20
8639  0598 89            	pushw	x
8640  0599 ae4050        	ldw	x,#_EE_PNEVMO_TIME
8641  059c cd0000        	call	c_eewrw
8643  059f 85            	popw	x
8644                     ; 422 				if( (EE_PNEVMO_TIME>200) || (EE_PNEVMO_TIME<20) ) EE_PNEVMO_TIME=20;
8646  05a0 9c            	rvf
8647  05a1 ce4050        	ldw	x,_EE_PNEVMO_TIME
8648  05a4 a300c9        	cpw	x,#201
8649  05a7 2e0c          	jrsge	L7126
8651  05a9 9c            	rvf
8652  05aa ce4050        	ldw	x,_EE_PNEVMO_TIME
8653  05ad a30014        	cpw	x,#20
8654  05b0 2f03          	jrslt	L25
8655  05b2 cc06df        	jp	L3616
8656  05b5               L25:
8657  05b5               L7126:
8660  05b5 ae0014        	ldw	x,#20
8661  05b8 89            	pushw	x
8662  05b9 ae4050        	ldw	x,#_EE_PNEVMO_TIME
8663  05bc cd0000        	call	c_eewrw
8665  05bf 85            	popw	x
8666  05c0 acdf06df      	jpf	L3616
8667  05c4               L3126:
8668                     ; 425 			else if( (sub_ind==2) && (bFIRE) ) {
8670  05c4 b660          	ld	a,_sub_ind
8671  05c6 a102          	cp	a,#2
8672  05c8 2631          	jrne	L3226
8674  05ca 3d36          	tnz	_bFIRE
8675  05cc 272d          	jreq	L3226
8676                     ; 426 				EE_NUM_OF_BALLS++;
8678  05ce ce4060        	ldw	x,_EE_NUM_OF_BALLS
8679  05d1 1c0001        	addw	x,#1
8680  05d4 cf4060        	ldw	_EE_NUM_OF_BALLS,x
8681                     ; 427 				if( (EE_NUM_OF_BALLS>30) || (EE_NUM_OF_BALLS<1) ) EE_NUM_OF_BALLS=1;
8683  05d7 9c            	rvf
8684  05d8 ce4060        	ldw	x,_EE_NUM_OF_BALLS
8685  05db a3001f        	cpw	x,#31
8686  05de 2e0c          	jrsge	L7226
8688  05e0 9c            	rvf
8689  05e1 ce4060        	ldw	x,_EE_NUM_OF_BALLS
8690  05e4 a30001        	cpw	x,#1
8691  05e7 2f03          	jrslt	L45
8692  05e9 cc06df        	jp	L3616
8693  05ec               L45:
8694  05ec               L7226:
8697  05ec ae0001        	ldw	x,#1
8698  05ef 89            	pushw	x
8699  05f0 ae4060        	ldw	x,#_EE_NUM_OF_BALLS
8700  05f3 cd0000        	call	c_eewrw
8702  05f6 85            	popw	x
8703  05f7 acdf06df      	jpf	L3616
8704  05fb               L3226:
8705                     ; 429 			else if( (sub_ind==4) && (bFIRE) ) {
8707  05fb b660          	ld	a,_sub_ind
8708  05fd a104          	cp	a,#4
8709  05ff 2703          	jreq	L65
8710  0601 cc06df        	jp	L3616
8711  0604               L65:
8713  0604 3d36          	tnz	_bFIRE
8714  0606 2603          	jrne	L06
8715  0608 cc06df        	jp	L3616
8716  060b               L06:
8717                     ; 430 				ind=iFisk1;
8719  060b 350e0062      	mov	_ind,#14
8720                     ; 431 				fin_ind_cnt=30;
8722  060f 351e005f      	mov	_fin_ind_cnt,#30
8723  0613 acdf06df      	jpf	L3616
8724  0617               L5026:
8725                     ; 437 		else if(ind==iWait1) {
8727  0617 b662          	ld	a,_ind
8728  0619 a10c          	cp	a,#12
8729  061b 261e          	jrne	L7326
8730                     ; 438 			if(bFIRE) {
8732  061d 3d36          	tnz	_bFIRE
8733  061f 2603          	jrne	L26
8734  0621 cc06df        	jp	L3616
8735  0624               L26:
8736                     ; 439 				ind=iWrk;
8738  0624 35040062      	mov	_ind,#4
8739                     ; 440 				wrk_stat=wsON;
8741  0628 35010010      	mov	_wrk_stat,#1
8742                     ; 441 				wrk_cnt=120;
8744  062c ae0078        	ldw	x,#120
8745  062f bf5a          	ldw	_wrk_cnt,x
8746                     ; 442 				ret_cnt=0;
8748  0631 5f            	clrw	x
8749  0632 bf5d          	ldw	_ret_cnt,x
8750                     ; 443 				ret_cnt1=0;
8752  0634 5f            	clrw	x
8753  0635 bf15          	ldw	_ret_cnt1,x
8754  0637 acdf06df      	jpf	L3616
8755  063b               L7326:
8756                     ; 447 		else if((wrk_stat==wsON) && (!bERR)&&(!not_fire_cnt)) {
8758  063b b610          	ld	a,_wrk_stat
8759  063d a101          	cp	a,#1
8760  063f 2625          	jrne	L5426
8762  0641 3d0f          	tnz	_bERR
8763  0643 2621          	jrne	L5426
8765  0645 be0f          	ldw	x,_not_fire_cnt
8766  0647 261d          	jrne	L5426
8767                     ; 448 			if(bFIRE) {
8769  0649 3d36          	tnz	_bFIRE
8770  064b 2603          	jrne	L46
8771  064d cc06df        	jp	L3616
8772  0650               L46:
8773                     ; 449 				rele_cnt=EE_PNEVMO_TIME;
8775  0650 ce4050        	ldw	x,_EE_PNEVMO_TIME
8776  0653 bf42          	ldw	_rele_cnt,x
8777                     ; 450 				wrk_cnt=120;
8779  0655 ae0078        	ldw	x,#120
8780  0658 bf5a          	ldw	_wrk_cnt,x
8781                     ; 451 				fire_cnt=1500;
8783  065a ae05dc        	ldw	x,#1500
8784  065d bf44          	ldw	_fire_cnt,x
8785                     ; 452 				not_fire_cnt=1000;
8787  065f ae03e8        	ldw	x,#1000
8788  0662 bf0f          	ldw	_not_fire_cnt,x
8789  0664 2079          	jra	L3616
8790  0666               L5426:
8791                     ; 456 		else if(ind==iMnButPrl) {/*
8793  0666 b662          	ld	a,_ind
8794  0668 a10a          	cp	a,#10
8795  066a 2673          	jrne	L3616
8796                     ; 471 			if(bFIRE_) {
8798  066c 3d35          	tnz	_bFIRE_
8799  066e 272f          	jreq	L5526
8800                     ; 472 				if(sub_ind<3) {
8802  0670 b660          	ld	a,_sub_ind
8803  0672 a103          	cp	a,#3
8804  0674 2404          	jruge	L7526
8805                     ; 473 					sub_ind++;
8807  0676 3c60          	inc	_sub_ind
8809  0678 2065          	jra	L3616
8810  067a               L7526:
8811                     ; 476 					if(parol_sigma==SERIAL_NUMBER) {
8813  067a be2c          	ldw	x,_parol_sigma
8814  067c a3049f        	cpw	x,#1183
8815  067f 260f          	jrne	L3626
8816                     ; 477 						ind=iMnBut;
8818  0681 35090062      	mov	_ind,#9
8819                     ; 478 						ret_ind=iWait;
8821  0685 35020061      	mov	_ret_ind,#2
8822                     ; 479 						ret_cnt=100;
8824  0689 ae0064        	ldw	x,#100
8825  068c bf5d          	ldw	_ret_cnt,x
8827  068e 204f          	jra	L3616
8828  0690               L3626:
8829                     ; 482 						ind=iDnd;
8831  0690 350b0062      	mov	_ind,#11
8832                     ; 483 						ret_ind=iWait;
8834  0694 35020061      	mov	_ret_ind,#2
8835                     ; 484 						ret_cnt=30;
8837  0698 ae001e        	ldw	x,#30
8838  069b bf5d          	ldw	_ret_cnt,x
8839  069d 2040          	jra	L3616
8840  069f               L5526:
8841                     ; 488 			else if(bFIRE1) {
8843  069f 3d34          	tnz	_bFIRE1
8844  06a1 273c          	jreq	L3616
8845                     ; 489 				ind_ind_cnt=10;
8847  06a3 350a0014      	mov	_ind_ind_cnt,#10
8848                     ; 491 				if(sub_ind==0) {
8850  06a7 3d60          	tnz	_sub_ind
8851  06a9 2609          	jrne	L3726
8852                     ; 492 					parol_sigma+=1000;
8854  06ab be2c          	ldw	x,_parol_sigma
8855  06ad 1c03e8        	addw	x,#1000
8856  06b0 bf2c          	ldw	_parol_sigma,x
8858  06b2 202b          	jra	L3616
8859  06b4               L3726:
8860                     ; 494 				else if(sub_ind==1) {
8862  06b4 b660          	ld	a,_sub_ind
8863  06b6 a101          	cp	a,#1
8864  06b8 2609          	jrne	L7726
8865                     ; 495 					parol_sigma+=100;
8867  06ba be2c          	ldw	x,_parol_sigma
8868  06bc 1c0064        	addw	x,#100
8869  06bf bf2c          	ldw	_parol_sigma,x
8871  06c1 201c          	jra	L3616
8872  06c3               L7726:
8873                     ; 497 				else if(sub_ind==2) {
8875  06c3 b660          	ld	a,_sub_ind
8876  06c5 a102          	cp	a,#2
8877  06c7 2609          	jrne	L3036
8878                     ; 498 					parol_sigma+=10;
8880  06c9 be2c          	ldw	x,_parol_sigma
8881  06cb 1c000a        	addw	x,#10
8882  06ce bf2c          	ldw	_parol_sigma,x
8884  06d0 200d          	jra	L3616
8885  06d2               L3036:
8886                     ; 500 				else if(sub_ind==3) {
8888  06d2 b660          	ld	a,_sub_ind
8889  06d4 a103          	cp	a,#3
8890  06d6 2607          	jrne	L3616
8891                     ; 501 					parol_sigma+=1;
8893  06d8 be2c          	ldw	x,_parol_sigma
8894  06da 1c0001        	addw	x,#1
8895  06dd bf2c          	ldw	_parol_sigma,x
8896  06df               L3616:
8897                     ; 509 	bKEY=0;
8899  06df 3f37          	clr	_bKEY
8900                     ; 510 	bFIRE=0;
8902  06e1 3f36          	clr	_bFIRE
8903                     ; 511 	bFIRE_=0;
8905  06e3 3f35          	clr	_bFIRE_
8906                     ; 512 	bFIRE1=0;
8908  06e5 3f34          	clr	_bFIRE1
8909                     ; 513 }
8912  06e7 81            	ret
8949                     ; 516 void putchar(char c)
8949                     ; 517 {
8950                     	switch	.text
8951  06e8               _putchar:
8953  06e8 88            	push	a
8954       00000000      OFST:	set	0
8957  06e9               L1336:
8958                     ; 518 while (tx_counter == TX_BUFFER_SIZE);
8960  06e9 c60000        	ld	a,_tx_counter
8961  06ec a150          	cp	a,#80
8962  06ee 27f9          	jreq	L1336
8963                     ; 520 if (tx_counter || ((UART1->SR & UART1_SR_TXE)==0))
8965  06f0 725d0000      	tnz	_tx_counter
8966  06f4 2607          	jrne	L7336
8968  06f6 c65230        	ld	a,21040
8969  06f9 a580          	bcp	a,#128
8970  06fb 2620          	jrne	L5336
8971  06fd               L7336:
8972                     ; 522    tx_buffer[tx_wr_index]=c;
8974  06fd 5f            	clrw	x
8975  06fe b60c          	ld	a,_tx_wr_index
8976  0700 2a01          	jrpl	L07
8977  0702 53            	cplw	x
8978  0703               L07:
8979  0703 97            	ld	xl,a
8980  0704 7b01          	ld	a,(OFST+1,sp)
8981  0706 d7000b        	ld	(_tx_buffer,x),a
8982                     ; 523    if (++tx_wr_index == TX_BUFFER_SIZE) tx_wr_index=0;
8984  0709 3c0c          	inc	_tx_wr_index
8985  070b b60c          	ld	a,_tx_wr_index
8986  070d a150          	cp	a,#80
8987  070f 2602          	jrne	L1436
8990  0711 3f0c          	clr	_tx_wr_index
8991  0713               L1436:
8992                     ; 524    ++tx_counter;
8994  0713 725c0000      	inc	_tx_counter
8996  0717               L3436:
8997                     ; 528 UART1->CR2|= UART1_CR2_TIEN;
8999  0717 721e5235      	bset	21045,#7
9000                     ; 530 }
9003  071b 84            	pop	a
9004  071c 81            	ret
9005  071d               L5336:
9006                     ; 526 else UART1->DR=c;
9008  071d 7b01          	ld	a,(OFST+1,sp)
9009  071f c75231        	ld	21041,a
9010  0722 20f3          	jra	L3436
9033                     ; 533 void uart_init (void){
9034                     	switch	.text
9035  0724               _uart_init:
9039                     ; 534 	GPIOD->DDR|=(1<<5);
9041  0724 721a5011      	bset	20497,#5
9042                     ; 535 	GPIOD->CR1|=(1<<5);
9044  0728 721a5012      	bset	20498,#5
9045                     ; 536 	GPIOD->CR2|=(1<<5);
9047  072c 721a5013      	bset	20499,#5
9048                     ; 539 	GPIOD->DDR&=~(1<<6);
9050  0730 721d5011      	bres	20497,#6
9051                     ; 540 	GPIOD->CR1&=~(1<<6);
9053  0734 721d5012      	bres	20498,#6
9054                     ; 541 	GPIOD->CR2&=~(1<<6);
9056  0738 721d5013      	bres	20499,#6
9057                     ; 544 	UART1->CR1&=~UART1_CR1_M;					
9059  073c 72195234      	bres	21044,#4
9060                     ; 545 	UART1->CR3|= (0<<4) & UART1_CR3_STOP;	
9062  0740 c65236        	ld	a,21046
9063                     ; 546 	UART1->BRR2= 0x03;//0x01;
9065  0743 35035233      	mov	21043,#3
9066                     ; 547 	UART1->BRR1= 0x68;//0x1a;
9068  0747 35685232      	mov	21042,#104
9069                     ; 548 	UART1->CR2|= UART1_CR2_TEN | UART3_CR2_REN | UART3_CR2_RIEN;	
9071  074b c65235        	ld	a,21045
9072  074e aa2c          	or	a,#44
9073  0750 c75235        	ld	21045,a
9074                     ; 549 }
9077  0753 81            	ret
9100                     ; 552 void uart_in(void)
9100                     ; 553 {
9101                     	switch	.text
9102  0754               _uart_in:
9106                     ; 555 }
9109  0754 81            	ret
9159                     ; 558 void in_button(void) {
9160                     	switch	.text
9161  0755               _in_button:
9163  0755 5204          	subw	sp,#4
9164       00000004      OFST:	set	4
9167                     ; 561 	if(/* (!(GPIOB->IDR&(1<<5))) /*&&*/ (!(GPIOD->IDR&(1<<5)))) {
9169  0757 c65010        	ld	a,20496
9170  075a a520          	bcp	a,#32
9171  075c 2647          	jrne	L7046
9172                     ; 562 		for(i=0;i<10000;i++) {
9174  075e 5f            	clrw	x
9175  075f 1f01          	ldw	(OFST-3,sp),x
9176  0761               L1146:
9177                     ; 563 			for(ii=0;ii<1000;ii++) {
9179  0761 5f            	clrw	x
9180  0762 1f03          	ldw	(OFST-1,sp),x
9181  0764               L7146:
9182                     ; 564 				__nop();
9185  0764 9d            nop
9187                     ; 563 			for(ii=0;ii<1000;ii++) {
9189  0765 1e03          	ldw	x,(OFST-1,sp)
9190  0767 1c0001        	addw	x,#1
9191  076a 1f03          	ldw	(OFST-1,sp),x
9194  076c 9c            	rvf
9195  076d 1e03          	ldw	x,(OFST-1,sp)
9196  076f a303e8        	cpw	x,#1000
9197  0772 2ff0          	jrslt	L7146
9198                     ; 566 			if( /*(GPIOB->IDR&(1<<5)) || */(GPIOD->IDR&(1<<5)) ) break;
9200  0774 c65010        	ld	a,20496
9201  0777 a520          	bcp	a,#32
9202  0779 260f          	jrne	L5146
9205                     ; 562 		for(i=0;i<10000;i++) {
9207  077b 1e01          	ldw	x,(OFST-3,sp)
9208  077d 1c0001        	addw	x,#1
9209  0780 1f01          	ldw	(OFST-3,sp),x
9212  0782 9c            	rvf
9213  0783 1e01          	ldw	x,(OFST-3,sp)
9214  0785 a32710        	cpw	x,#10000
9215  0788 2fd7          	jrslt	L1146
9216  078a               L5146:
9217                     ; 568 		if(i==10000) {
9219  078a 1e01          	ldw	x,(OFST-3,sp)
9220  078c a32710        	cpw	x,#10000
9221  078f 2618          	jrne	L1346
9222                     ; 569 			ind=iMnButPrl;
9224  0791 350a0062      	mov	_ind,#10
9225                     ; 570 			sub_ind=0;
9227  0795 3f60          	clr	_sub_ind
9228                     ; 571 			bFIRE_=0;
9230  0797 3f35          	clr	_bFIRE_
9231                     ; 572 			cnt_bFIRE_=0;
9233  0799 5f            	clrw	x
9234  079a bf2e          	ldw	_cnt_bFIRE_,x
9235                     ; 573 			bFIRE_BLOCK=1;
9237  079c 35010033      	mov	_bFIRE_BLOCK,#1
9238                     ; 574 			parol_sigma=0;
9240  07a0 5f            	clrw	x
9241  07a1 bf2c          	ldw	_parol_sigma,x
9242  07a3 2004          	jra	L1346
9243  07a5               L7046:
9244                     ; 578 		ind=iWait;
9246  07a5 35020062      	mov	_ind,#2
9247  07a9               L1346:
9248                     ; 580 }
9251  07a9 5b04          	addw	sp,#4
9252  07ab 81            	ret
9284                     ; 582 void opto_drv (void) {
9285                     	switch	.text
9286  07ac               _opto_drv:
9290                     ; 583 	if((GPIOD->IDR)&(1<<1)) {
9292  07ac c65010        	ld	a,20496
9293  07af a502          	bcp	a,#2
9294  07b1 274c          	jreq	L3446
9295                     ; 584 		if(!bLINE_OLD)connect_cnt=1000;
9297  07b3 3d40          	tnz	_bLINE_OLD
9298  07b5 2605          	jrne	L5446
9301  07b7 ae03e8        	ldw	x,#1000
9302  07ba bf3a          	ldw	_connect_cnt,x
9303  07bc               L5446:
9304                     ; 586 		if(!bIN_OLD) {
9306  07bc 3d41          	tnz	_bIN_OLD
9307  07be 2632          	jrne	L7446
9308                     ; 587 			if((zero_cnt>80)&&(zero_cnt<150))	{
9310  07c0 be3c          	ldw	x,_zero_cnt
9311  07c2 a30051        	cpw	x,#81
9312  07c5 252b          	jrult	L7446
9314  07c7 be3c          	ldw	x,_zero_cnt
9315  07c9 a30096        	cpw	x,#150
9316  07cc 2424          	jruge	L7446
9317                     ; 588 				plazma_SS++;
9319  07ce be0d          	ldw	x,_plazma_SS
9320  07d0 1c0001        	addw	x,#1
9321  07d3 bf0d          	ldw	_plazma_SS,x
9322                     ; 589 				if((wrk_stat==wsON)&&(!bERR)) {
9324  07d5 b610          	ld	a,_wrk_stat
9325  07d7 a101          	cp	a,#1
9326  07d9 2617          	jrne	L7446
9328  07db 3d0f          	tnz	_bERR
9329  07dd 2613          	jrne	L7446
9330                     ; 590 					opto_cnt=1500;
9332  07df ae05dc        	ldw	x,#1500
9333  07e2 bf11          	ldw	_opto_cnt,x
9334                     ; 591 					if(EE_REMAIN_BALLS) {
9336  07e4 ce4040        	ldw	x,_EE_REMAIN_BALLS
9337  07e7 2709          	jreq	L7446
9338                     ; 592 						EE_REMAIN_BALLS--;
9340  07e9 ce4040        	ldw	x,_EE_REMAIN_BALLS
9341  07ec 1d0001        	subw	x,#1
9342  07ef cf4040        	ldw	_EE_REMAIN_BALLS,x
9343  07f2               L7446:
9344                     ; 597 		zero_cnt=0;
9346  07f2 5f            	clrw	x
9347  07f3 bf3c          	ldw	_zero_cnt,x
9348                     ; 599 		bLINE_OLD=1;
9350  07f5 35010040      	mov	_bLINE_OLD,#1
9351                     ; 600 		bIN_OLD=1;
9353  07f9 35010041      	mov	_bIN_OLD,#1
9355  07fd 201b          	jra	L7546
9356  07ff               L3446:
9357                     ; 603 		if(bLINE_OLD)connect_cnt=1500;
9359  07ff 3d40          	tnz	_bLINE_OLD
9360  0801 2705          	jreq	L1646
9363  0803 ae05dc        	ldw	x,#1500
9364  0806 bf3a          	ldw	_connect_cnt,x
9365  0808               L1646:
9366                     ; 604 		if(zero_cnt<30000) {
9368  0808 be3c          	ldw	x,_zero_cnt
9369  080a a37530        	cpw	x,#30000
9370  080d 2407          	jruge	L3646
9371                     ; 605 			zero_cnt++;
9373  080f be3c          	ldw	x,_zero_cnt
9374  0811 1c0001        	addw	x,#1
9375  0814 bf3c          	ldw	_zero_cnt,x
9376  0816               L3646:
9377                     ; 608 	bLINE_OLD=0;	
9379  0816 3f40          	clr	_bLINE_OLD
9380                     ; 609 	bIN_OLD=0;
9382  0818 3f41          	clr	_bIN_OLD
9383  081a               L7546:
9384                     ; 612 	GPIOD->DDR&=~(1<<1);	
9386  081a 72135011      	bres	20497,#1
9387                     ; 613 	GPIOD->CR1|=(1<<1);
9389  081e 72125012      	bset	20498,#1
9390                     ; 614 	GPIOD->CR2&=~(1<<1);
9392  0822 72135013      	bres	20499,#1
9393                     ; 616 	if(connect_cnt) {
9395  0826 be3a          	ldw	x,_connect_cnt
9396  0828 270b          	jreq	L5646
9397                     ; 617 		connect_cnt--;
9399  082a be3a          	ldw	x,_connect_cnt
9400  082c 1d0001        	subw	x,#1
9401  082f bf3a          	ldw	_connect_cnt,x
9402                     ; 618 		bERR=0;
9404  0831 3f0f          	clr	_bERR
9406  0833 2004          	jra	L7646
9407  0835               L5646:
9408                     ; 620 	else bERR=1;
9410  0835 3501000f      	mov	_bERR,#1
9411  0839               L7646:
9412                     ; 621 }
9415  0839 81            	ret
9459                     ; 623 void target_drv (void) {
9460                     	switch	.text
9461  083a               _target_drv:
9463  083a 5203          	subw	sp,#3
9464       00000003      OFST:	set	3
9467                     ; 626 	GPIOD->DDR&=~((1<<2)|(1<<3)|(1<<4));	
9469  083c c65011        	ld	a,20497
9470  083f a4e3          	and	a,#227
9471  0841 c75011        	ld	20497,a
9472                     ; 627 	GPIOD->CR1|=((1<<2)|(1<<3)|(1<<4));
9474  0844 c65012        	ld	a,20498
9475  0847 aa1c          	or	a,#28
9476  0849 c75012        	ld	20498,a
9477                     ; 628 	GPIOD->CR2&=~((1<<2)|(1<<3)|(1<<4));
9479  084c c65013        	ld	a,20499
9480  084f a4e3          	and	a,#227
9481  0851 c75013        	ld	20499,a
9482                     ; 630 	target_plazma=(GPIOD->IDR); 
9484  0854 5550100013    	mov	_target_plazma,20496
9485                     ; 632 	for(i=0;i<3;i++) {
9487  0859 0f03          	clr	(OFST+0,sp)
9488  085b               L7056:
9489                     ; 633 		if(!((GPIOD->IDR)&(1<<(4-i)))) {
9491  085b c65010        	ld	a,20496
9492  085e 5f            	clrw	x
9493  085f 97            	ld	xl,a
9494  0860 1f01          	ldw	(OFST-2,sp),x
9495  0862 ae0001        	ldw	x,#1
9496  0865 a604          	ld	a,#4
9497  0867 1003          	sub	a,(OFST+0,sp)
9498  0869 4d            	tnz	a
9499  086a 2704          	jreq	L401
9500  086c               L601:
9501  086c 58            	sllw	x
9502  086d 4a            	dec	a
9503  086e 26fc          	jrne	L601
9504  0870               L401:
9505  0870 01            	rrwa	x,a
9506  0871 1402          	and	a,(OFST-1,sp)
9507  0873 01            	rrwa	x,a
9508  0874 1401          	and	a,(OFST-2,sp)
9509  0876 01            	rrwa	x,a
9510  0877 a30000        	cpw	x,#0
9511  087a 267a          	jrne	L5156
9512                     ; 634 			if(target_cnt[i]<1000) target_cnt[i]++;
9514  087c 9c            	rvf
9515  087d 7b03          	ld	a,(OFST+0,sp)
9516  087f 5f            	clrw	x
9517  0880 97            	ld	xl,a
9518  0881 58            	sllw	x
9519  0882 9093          	ldw	y,x
9520  0884 90ee52        	ldw	y,(_target_cnt,y)
9521  0887 90a303e8      	cpw	y,#1000
9522  088b 2e0f          	jrsge	L7156
9525  088d 7b03          	ld	a,(OFST+0,sp)
9526  088f 5f            	clrw	x
9527  0890 97            	ld	xl,a
9528  0891 58            	sllw	x
9529  0892 9093          	ldw	y,x
9530  0894 ee52          	ldw	x,(_target_cnt,x)
9531  0896 1c0001        	addw	x,#1
9532  0899 90ef52        	ldw	(_target_cnt,y),x
9533  089c               L7156:
9534                     ; 635 			if((target_cnt[i]==5)&& (!target_cnt_off[i])) {
9536  089c 7b03          	ld	a,(OFST+0,sp)
9537  089e 5f            	clrw	x
9538  089f 97            	ld	xl,a
9539  08a0 58            	sllw	x
9540  08a1 9093          	ldw	y,x
9541  08a3 90ee52        	ldw	y,(_target_cnt,y)
9542  08a6 90a30005      	cpw	y,#5
9543  08aa 266d          	jrne	L5356
9545  08ac 7b03          	ld	a,(OFST+0,sp)
9546  08ae 5f            	clrw	x
9547  08af 97            	ld	xl,a
9548  08b0 58            	sllw	x
9549  08b1 e64b          	ld	a,(_target_cnt_off+1,x)
9550  08b3 ea4a          	or	a,(_target_cnt_off,x)
9551  08b5 2662          	jrne	L5356
9552                     ; 636 				target_on[i]=1;
9554  08b7 7b03          	ld	a,(OFST+0,sp)
9555  08b9 5f            	clrw	x
9556  08ba 97            	ld	xl,a
9557  08bb a601          	ld	a,#1
9558  08bd e746          	ld	(_target_on,x),a
9559                     ; 637 				if(i==0)
9561  08bf 0d03          	tnz	(OFST+0,sp)
9562  08c1 2608          	jrne	L3256
9563                     ; 639 					target_cnt[1]=0;
9565  08c3 5f            	clrw	x
9566  08c4 bf54          	ldw	_target_cnt+2,x
9567                     ; 640 					target_cnt[2]=0;					
9569  08c6 5f            	clrw	x
9570  08c7 bf56          	ldw	_target_cnt+4,x
9572  08c9 201a          	jra	L5256
9573  08cb               L3256:
9574                     ; 642 				else if(i==1)
9576  08cb 7b03          	ld	a,(OFST+0,sp)
9577  08cd a101          	cp	a,#1
9578  08cf 2608          	jrne	L7256
9579                     ; 644 					target_cnt[0]=0;
9581  08d1 5f            	clrw	x
9582  08d2 bf52          	ldw	_target_cnt,x
9583                     ; 645 					target_cnt[2]=0;					
9585  08d4 5f            	clrw	x
9586  08d5 bf56          	ldw	_target_cnt+4,x
9588  08d7 200c          	jra	L5256
9589  08d9               L7256:
9590                     ; 647 				else if(i==2)
9592  08d9 7b03          	ld	a,(OFST+0,sp)
9593  08db a102          	cp	a,#2
9594  08dd 2606          	jrne	L5256
9595                     ; 649 					target_cnt[0]=0;
9597  08df 5f            	clrw	x
9598  08e0 bf52          	ldw	_target_cnt,x
9599                     ; 650 					target_cnt[1]=0;					
9601  08e2 5f            	clrw	x
9602  08e3 bf54          	ldw	_target_cnt+2,x
9603  08e5               L5256:
9604                     ; 654 				target_cnt_off[0]=1000;
9606  08e5 ae03e8        	ldw	x,#1000
9607  08e8 bf4a          	ldw	_target_cnt_off,x
9608                     ; 655 				target_cnt_off[1]=1000;
9610  08ea ae03e8        	ldw	x,#1000
9611  08ed bf4c          	ldw	_target_cnt_off+2,x
9612                     ; 656 				target_cnt_off[2]=1000;
9614  08ef ae03e8        	ldw	x,#1000
9615  08f2 bf4e          	ldw	_target_cnt_off+4,x
9616  08f4 2023          	jra	L5356
9617  08f6               L5156:
9618                     ; 660 			target_cnt[i]=0;
9620  08f6 7b03          	ld	a,(OFST+0,sp)
9621  08f8 5f            	clrw	x
9622  08f9 97            	ld	xl,a
9623  08fa 58            	sllw	x
9624  08fb 905f          	clrw	y
9625  08fd ef52          	ldw	(_target_cnt,x),y
9626                     ; 661 			if(target_cnt_off[i])target_cnt_off[i]--;
9628  08ff 7b03          	ld	a,(OFST+0,sp)
9629  0901 5f            	clrw	x
9630  0902 97            	ld	xl,a
9631  0903 58            	sllw	x
9632  0904 e64b          	ld	a,(_target_cnt_off+1,x)
9633  0906 ea4a          	or	a,(_target_cnt_off,x)
9634  0908 270f          	jreq	L5356
9637  090a 7b03          	ld	a,(OFST+0,sp)
9638  090c 5f            	clrw	x
9639  090d 97            	ld	xl,a
9640  090e 58            	sllw	x
9641  090f 9093          	ldw	y,x
9642  0911 ee4a          	ldw	x,(_target_cnt_off,x)
9643  0913 1d0001        	subw	x,#1
9644  0916 90ef4a        	ldw	(_target_cnt_off,y),x
9645  0919               L5356:
9646                     ; 632 	for(i=0;i<3;i++) {
9648  0919 0c03          	inc	(OFST+0,sp)
9651  091b 7b03          	ld	a,(OFST+0,sp)
9652  091d a103          	cp	a,#3
9653  091f 2403          	jruge	L011
9654  0921 cc085b        	jp	L7056
9655  0924               L011:
9656                     ; 665 	if(opto_cnt) opto_cnt--;
9658  0924 be11          	ldw	x,_opto_cnt
9659  0926 2707          	jreq	L1456
9662  0928 be11          	ldw	x,_opto_cnt
9663  092a 1d0001        	subw	x,#1
9664  092d bf11          	ldw	_opto_cnt,x
9665  092f               L1456:
9666                     ; 667 	if(fire_cnt) {
9668  092f be44          	ldw	x,_fire_cnt
9669  0931 271a          	jreq	L3456
9670                     ; 668 		fire_cnt--;
9672  0933 be44          	ldw	x,_fire_cnt
9673  0935 1d0001        	subw	x,#1
9674  0938 bf44          	ldw	_fire_cnt,x
9675                     ; 669 		if(!fire_cnt) {
9677  093a be44          	ldw	x,_fire_cnt
9678  093c 260f          	jrne	L3456
9679                     ; 670 			if(EE_REMAIN_BALLS==0) {
9681  093e ce4040        	ldw	x,_EE_REMAIN_BALLS
9682  0941 260a          	jrne	L3456
9683                     ; 671 			wrk_stat=wsOFF;
9685  0943 3f10          	clr	_wrk_stat
9686                     ; 672 			ind=iFin;
9688  0945 35050062      	mov	_ind,#5
9689                     ; 673 			fin_ind_cnt=40;
9691  0949 3528005f      	mov	_fin_ind_cnt,#40
9692  094d               L3456:
9693                     ; 677 }
9696  094d 5b03          	addw	sp,#3
9697  094f 81            	ret
9725                     ; 679 void target_an (void) {
9726                     	switch	.text
9727  0950               _target_an:
9731                     ; 680 	if((wrk_stat==wsON) && (fire_cnt) && (opto_cnt)){
9733  0950 b610          	ld	a,_wrk_stat
9734  0952 a101          	cp	a,#1
9735  0954 2633          	jrne	L1656
9737  0956 be44          	ldw	x,_fire_cnt
9738  0958 272f          	jreq	L1656
9740  095a be11          	ldw	x,_opto_cnt
9741  095c 272b          	jreq	L1656
9742                     ; 681 		if(target_on[0]) EE_BONUS_SIGMA+=5;
9744  095e 3d46          	tnz	_target_on
9745  0960 270b          	jreq	L3656
9748  0962 ce4030        	ldw	x,_EE_BONUS_SIGMA
9749  0965 1c0005        	addw	x,#5
9750  0968 cf4030        	ldw	_EE_BONUS_SIGMA,x
9752  096b 201c          	jra	L1656
9753  096d               L3656:
9754                     ; 682 		else if(target_on[1]) EE_BONUS_SIGMA+=10;
9756  096d 3d47          	tnz	_target_on+1
9757  096f 270b          	jreq	L7656
9760  0971 ce4030        	ldw	x,_EE_BONUS_SIGMA
9761  0974 1c000a        	addw	x,#10
9762  0977 cf4030        	ldw	_EE_BONUS_SIGMA,x
9764  097a 200d          	jra	L1656
9765  097c               L7656:
9766                     ; 683 		else if(target_on[2]) EE_BONUS_SIGMA+=20;
9768  097c 3d48          	tnz	_target_on+2
9769  097e 2709          	jreq	L1656
9772  0980 ce4030        	ldw	x,_EE_BONUS_SIGMA
9773  0983 1c0014        	addw	x,#20
9774  0986 cf4030        	ldw	_EE_BONUS_SIGMA,x
9775  0989               L1656:
9776                     ; 685 	target_on[0]=0;
9778  0989 3f46          	clr	_target_on
9779                     ; 686 	target_on[1]=0;
9781  098b 3f47          	clr	_target_on+1
9782                     ; 687 	target_on[2]=0;
9784  098d 3f48          	clr	_target_on+2
9785                     ; 688 }
9788  098f 81            	ret
9812                     ; 690 void rele_drv (void) {
9813                     	switch	.text
9814  0990               _rele_drv:
9818                     ; 705 GPIOB->DDR|=(1<<4);	
9820  0990 72185007      	bset	20487,#4
9821                     ; 706 GPIOB->CR1|=(1<<4);
9823  0994 72185008      	bset	20488,#4
9824                     ; 707 GPIOB->CR2&=~(1<<4);
9826  0998 72195009      	bres	20489,#4
9827                     ; 709 if(rele_cnt)
9829  099c be42          	ldw	x,_rele_cnt
9830  099e 270d          	jreq	L5066
9831                     ; 711 	rele_cnt--;
9833  09a0 be42          	ldw	x,_rele_cnt
9834  09a2 1d0001        	subw	x,#1
9835  09a5 bf42          	ldw	_rele_cnt,x
9836                     ; 712 	GPIOB->ODR|=(1<<4);
9838  09a7 72185005      	bset	20485,#4
9840  09ab 2004          	jra	L7066
9841  09ad               L5066:
9842                     ; 714 else GPIOB->ODR&=~(1<<4);
9844  09ad 72195005      	bres	20485,#4
9845  09b1               L7066:
9846                     ; 716 }
9849  09b1 81            	ret
9878                     ; 718 void wrk_hndl (void) {
9879                     	switch	.text
9880  09b2               _wrk_hndl:
9884                     ; 719 	if(wrk_cnt) {
9886  09b2 be5a          	ldw	x,_wrk_cnt
9887  09b4 272b          	jreq	L1266
9888                     ; 720 		wrk_cnt--;
9890  09b6 be5a          	ldw	x,_wrk_cnt
9891  09b8 1d0001        	subw	x,#1
9892  09bb bf5a          	ldw	_wrk_cnt,x
9893                     ; 721 		if(wrk_cnt==0) {
9895  09bd be5a          	ldw	x,_wrk_cnt
9896  09bf 2620          	jrne	L1266
9897                     ; 722 			wrk_stat=wsOFF;
9899  09c1 3f10          	clr	_wrk_stat
9900                     ; 723 			if(EE_REMAIN_BALLS==EE_NUM_OF_BALLS)EE_FISK_CNT--;
9902  09c3 ce4040        	ldw	x,_EE_REMAIN_BALLS
9903  09c6 c34060        	cpw	x,_EE_NUM_OF_BALLS
9904  09c9 2609          	jrne	L5266
9907  09cb ce4100        	ldw	x,_EE_FISK_CNT
9908  09ce 1d0001        	subw	x,#1
9909  09d1 cf4100        	ldw	_EE_FISK_CNT,x
9910  09d4               L5266:
9911                     ; 724 			EE_REMAIN_BALLS=0;
9913  09d4 5f            	clrw	x
9914  09d5 89            	pushw	x
9915  09d6 ae4040        	ldw	x,#_EE_REMAIN_BALLS
9916  09d9 cd0000        	call	c_eewrw
9918  09dc 85            	popw	x
9919                     ; 725 			ind=iWait;
9921  09dd 35020062      	mov	_ind,#2
9922  09e1               L1266:
9923                     ; 728 }
9926  09e1 81            	ret
9987                     ; 730 long delay_ms(short in) {
9988                     	switch	.text
9989  09e2               _delay_ms:
9991  09e2 520c          	subw	sp,#12
9992       0000000c      OFST:	set	12
9995                     ; 733 i=((long)in)*100UL;
9997  09e4 90ae0064      	ldw	y,#100
9998  09e8 cd0000        	call	c_vmul
10000  09eb 96            	ldw	x,sp
10001  09ec 1c0005        	addw	x,#OFST-7
10002  09ef cd0000        	call	c_rtol
10004                     ; 735 for(ii=0;ii<i;ii++)
10006  09f2 ae0000        	ldw	x,#0
10007  09f5 1f0b          	ldw	(OFST-1,sp),x
10008  09f7 ae0000        	ldw	x,#0
10009  09fa 1f09          	ldw	(OFST-3,sp),x
10011  09fc 2012          	jra	L5666
10012  09fe               L1666:
10013                     ; 737 		iii++;
10015  09fe 96            	ldw	x,sp
10016  09ff 1c0001        	addw	x,#OFST-11
10017  0a02 a601          	ld	a,#1
10018  0a04 cd0000        	call	c_lgadc
10020                     ; 735 for(ii=0;ii<i;ii++)
10022  0a07 96            	ldw	x,sp
10023  0a08 1c0009        	addw	x,#OFST-3
10024  0a0b a601          	ld	a,#1
10025  0a0d cd0000        	call	c_lgadc
10027  0a10               L5666:
10030  0a10 9c            	rvf
10031  0a11 96            	ldw	x,sp
10032  0a12 1c0009        	addw	x,#OFST-3
10033  0a15 cd0000        	call	c_ltor
10035  0a18 96            	ldw	x,sp
10036  0a19 1c0005        	addw	x,#OFST-7
10037  0a1c cd0000        	call	c_lcmp
10039  0a1f 2fdd          	jrslt	L1666
10040                     ; 740 }
10043  0a21 5b0c          	addw	sp,#12
10044  0a23 81            	ret
10067                     ; 742 void gpio_init(void){
10068                     	switch	.text
10069  0a24               _gpio_init:
10073                     ; 744 	GPIOB->CR1&=~((1<<0)|(1<<1)|(1<<2)|(1<<3));
10075  0a24 c65008        	ld	a,20488
10076  0a27 a4f0          	and	a,#240
10077  0a29 c75008        	ld	20488,a
10078                     ; 745 	GPIOB->CR2&=~((1<<0)|(1<<1)|(1<<2)|(1<<3));
10080  0a2c c65009        	ld	a,20489
10081  0a2f a4f0          	and	a,#240
10082  0a31 c75009        	ld	20489,a
10083                     ; 746 	GPIOB->DDR|=((1<<0)|(1<<1)|(1<<2)|(1<<3));
10085  0a34 c65007        	ld	a,20487
10086  0a37 aa0f          	or	a,#15
10087  0a39 c75007        	ld	20487,a
10088                     ; 749 	GPIOC->CR1&=~0xfe;
10090  0a3c c6500d        	ld	a,20493
10091  0a3f a401          	and	a,#1
10092  0a41 c7500d        	ld	20493,a
10093                     ; 750 	GPIOC->CR2&=~0xfe;
10095  0a44 c6500e        	ld	a,20494
10096  0a47 a401          	and	a,#1
10097  0a49 c7500e        	ld	20494,a
10098                     ; 751 	GPIOC->DDR|=0xfe;
10100  0a4c c6500c        	ld	a,20492
10101  0a4f aafe          	or	a,#254
10102  0a51 c7500c        	ld	20492,a
10103                     ; 752 	GPIOD->CR1&=~0x01;
10105  0a54 72115012      	bres	20498,#0
10106                     ; 753 	GPIOD->CR2&=~0x01;
10108  0a58 72115013      	bres	20499,#0
10109                     ; 754 	GPIOD->DDR|=0x01;	
10111  0a5c 72105011      	bset	20497,#0
10112                     ; 758 	GPIOB->DDR&=~(1<<5);	
10114  0a60 721b5007      	bres	20487,#5
10115                     ; 759 	GPIOB->CR1|=(1<<5);
10117  0a64 721a5008      	bset	20488,#5
10118                     ; 760 	GPIOB->CR2&=~(1<<5);
10120  0a68 721b5009      	bres	20489,#5
10121                     ; 773 	GPIOB->DDR&=~(1<<5);	
10123  0a6c 721b5007      	bres	20487,#5
10124                     ; 774 	GPIOB->CR1|=(1<<5);
10126  0a70 721a5008      	bset	20488,#5
10127                     ; 775 	GPIOB->CR2&=~(1<<5);
10129  0a74 721b5009      	bres	20489,#5
10130                     ; 777 	GPIOB->ODR|=0x0f;
10132  0a78 c65005        	ld	a,20485
10133  0a7b aa0f          	or	a,#15
10134  0a7d c75005        	ld	20485,a
10135                     ; 778 }
10138  0a80 81            	ret
10161                     ; 780 void t2_init(void){
10162                     	switch	.text
10163  0a81               _t2_init:
10167                     ; 781 	TIM2->PSCR = 0;
10169  0a81 725f530e      	clr	21262
10170                     ; 782 	TIM2->ARRH= 0x02;
10172  0a85 3502530f      	mov	21263,#2
10173                     ; 783 	TIM2->ARRL= 0x00;
10175  0a89 725f5310      	clr	21264
10176                     ; 784 	TIM2->CCR1H= 0x00;	
10178  0a8d 725f5311      	clr	21265
10179                     ; 785 	TIM2->CCR1L= 100;
10181  0a91 35645312      	mov	21266,#100
10182                     ; 786 	TIM2->CCR2H= 0x00;	
10184  0a95 725f5313      	clr	21267
10185                     ; 787 	TIM2->CCR2L= 200;
10187  0a99 35c85314      	mov	21268,#200
10188                     ; 788 	TIM2->CCR3H= 0x00;	
10190  0a9d 725f5315      	clr	21269
10191                     ; 789 	TIM2->CCR3L= 200;
10193  0aa1 35c85316      	mov	21270,#200
10194                     ; 792 	TIM2->CCMR2= ((7<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE; //OC2 toggle mode, prelouded
10196  0aa5 35785308      	mov	21256,#120
10197                     ; 798 	TIM2->CR1=(TIM2_CR1_CEN | TIM2_CR1_ARPE);	
10199  0aa9 35815300      	mov	21248,#129
10200                     ; 800 }
10203  0aad 81            	ret
10226                     ; 803 void t1_init(void){
10227                     	switch	.text
10228  0aae               _t1_init:
10232                     ; 804 	TIM1->ARRH= (u8)(AUTORELOAD >> 8);			// init pulse period - auto reload register
10234  0aae 35015262      	mov	21090,#1
10235                     ; 805 	TIM1->ARRL= (u8)(AUTORELOAD);
10237  0ab2 35a55263      	mov	21091,#165
10238                     ; 806 	TIM1->CCR1H= (u8)((AUTORELOAD/4) >> 8);	// init pulse wide (50% duty cycle) - compare register
10240  0ab6 725f5265      	clr	21093
10241                     ; 807 	TIM1->CCR1L= (u8)(AUTORELOAD/4);
10243  0aba 35695266      	mov	21094,#105
10244                     ; 808 	TIM1->CCR2H= (u8)((AUTORELOAD/8) >> 8);	// init pulse wide (50% duty cycle) - compare register
10246  0abe 725f5267      	clr	21095
10247                     ; 809 	TIM1->CCR2L= (u8)(AUTORELOAD/8);
10249  0ac2 35345268      	mov	21096,#52
10250                     ; 811 	TIM1->CCR3H= (u8)((AUTORELOAD/8) >> 8);	// init pulse wide (50% duty cycle) - compare register
10252  0ac6 725f5269      	clr	21097
10253                     ; 812 	TIM1->CCR3L= (u8)(AUTORELOAD/8);
10255  0aca 3534526a      	mov	21098,#52
10256                     ; 814 	TIM1->CCR4H= (u8)((AUTORELOAD/8) >> 8);	// init pulse wide (50% duty cycle) - compare register
10258  0ace 725f526b      	clr	21099
10259                     ; 815 	TIM1->CCR4L= (u8)(AUTORELOAD/8);
10261  0ad2 3534526c      	mov	21100,#52
10262                     ; 818 	TIM1->CCMR1= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
10264  0ad6 35685258      	mov	21080,#104
10265                     ; 819 	TIM1->CCMR2= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
10267  0ada 35685259      	mov	21081,#104
10268                     ; 820 	TIM1->CCMR3= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
10270  0ade 3568525a      	mov	21082,#104
10271                     ; 821 	TIM1->CCMR4= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
10273  0ae2 3568525b      	mov	21083,#104
10274                     ; 825 	TIM1->CCER1 = 0xff;//TIM1_CCER1_CC2E|TIM1_CCER1_CC1E|TIM1_CCER1_CC2P|TIM1_CCER1_CC1P;	// OC1 enable output pin
10276  0ae6 35ff525c      	mov	21084,#255
10277                     ; 827 	TIM1->CCER2 = 0xff;
10279  0aea 35ff525d      	mov	21085,#255
10280                     ; 828 	TIM1->BKR= 0x80;
10282  0aee 3580526d      	mov	21101,#128
10283                     ; 829 	TIM1->IER|= TIM1_IER_UIE;					// enable break interrupt
10285  0af2 72105254      	bset	21076,#0
10286                     ; 831 	TIM1->CR1= TIM4_CR1_URS|TIM1_CR1_CEN| TIM1_CR1_ARPE;					// timer 1 enable
10288  0af6 35855250      	mov	21072,#133
10289                     ; 834 }
10292  0afa 81            	ret
10315                     ; 836 void spi_init(void){
10316                     	switch	.text
10317  0afb               _spi_init:
10321                     ; 837 	SPI->CR1= /*SPI_CR1_LSBFIRST |*/
10321                     ; 838 			SPI_CR1_SPE | 
10321                     ; 839 			( (3<< 2) & SPI_CR1_BR ) |
10321                     ; 840 			SPI_CR1_MSTR |
10321                     ; 841 			SPI_CR1_CPOL |
10321                     ; 842 			SPI_CR1_CPHA; 
10323  0afb 354f5200      	mov	20992,#79
10324                     ; 844 	SPI->CR2= SPI_CR2_SSM | SPI_CR2_SSI;
10326  0aff 35035201      	mov	20993,#3
10327                     ; 845 	SPI->ICR= 0;	
10329  0b03 725f5202      	clr	20994
10330                     ; 846 }
10333  0b07 81            	ret
10376                     ; 848 char spi(char in){
10377                     	switch	.text
10378  0b08               _spi:
10380  0b08 88            	push	a
10381  0b09 88            	push	a
10382       00000001      OFST:	set	1
10385  0b0a               L5576:
10386                     ; 850 	while(!((SPI->SR)&SPI_SR_TXE));
10388  0b0a c65203        	ld	a,20995
10389  0b0d a502          	bcp	a,#2
10390  0b0f 27f9          	jreq	L5576
10391                     ; 851 	SPI->DR=in;
10393  0b11 7b02          	ld	a,(OFST+1,sp)
10394  0b13 c75204        	ld	20996,a
10396  0b16               L5676:
10397                     ; 852 	while(!((SPI->SR)&SPI_SR_RXNE));
10399  0b16 c65203        	ld	a,20995
10400  0b19 a501          	bcp	a,#1
10401  0b1b 27f9          	jreq	L5676
10402                     ; 853 	c=SPI->DR;	
10404  0b1d c65204        	ld	a,20996
10405  0b20 6b01          	ld	(OFST+0,sp),a
10406                     ; 854 	return c;
10408  0b22 7b01          	ld	a,(OFST+0,sp)
10411  0b24 85            	popw	x
10412  0b25 81            	ret
10435                     ; 857 void t4_init(void){
10436                     	switch	.text
10437  0b26               _t4_init:
10441                     ; 858 	TIM4->PSCR = 7;
10443  0b26 35075347      	mov	21319,#7
10444                     ; 859 	TIM4->ARR= 123;
10446  0b2a 357b5348      	mov	21320,#123
10447                     ; 860 	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
10449  0b2e 72105343      	bset	21315,#0
10450                     ; 862 	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
10452  0b32 35855340      	mov	21312,#133
10453                     ; 864 }
10456  0b36 81            	ret
10508                     ; 869 @far @interrupt void TIM4_UPD_Interrupt (void) {
10510                     	switch	.text
10511  0b37               f_TIM4_UPD_Interrupt:
10515                     ; 871 	ind_cnt++;
10517  0b37 3c2b          	inc	_ind_cnt
10518                     ; 872 	if(ind_cnt>=10)ind_cnt=0;
10520  0b39 b62b          	ld	a,_ind_cnt
10521  0b3b a10a          	cp	a,#10
10522  0b3d 2502          	jrult	L1107
10525  0b3f 3f2b          	clr	_ind_cnt
10526  0b41               L1107:
10527                     ; 873 	GPIOB->ODR|=0x0f;
10529  0b41 c65005        	ld	a,20485
10530  0b44 aa0f          	or	a,#15
10531  0b46 c75005        	ld	20485,a
10532                     ; 874 	if(ind_cnt<4){
10534  0b49 b62b          	ld	a,_ind_cnt
10535  0b4b a104          	cp	a,#4
10536  0b4d 244a          	jruge	L3107
10537                     ; 875 		GPIOC->ODR|=0xfe;
10539  0b4f c6500a        	ld	a,20490
10540  0b52 aafe          	or	a,#254
10541  0b54 c7500a        	ld	20490,a
10542                     ; 876 		GPIOD->ODR|=0x01;
10544  0b57 7210500f      	bset	20495,#0
10545                     ; 877 		GPIOC->ODR&=ind_out[3-ind_cnt]|0x01;
10547  0b5b a600          	ld	a,#0
10548  0b5d 97            	ld	xl,a
10549  0b5e a603          	ld	a,#3
10550  0b60 b02b          	sub	a,_ind_cnt
10551  0b62 2401          	jrnc	L041
10552  0b64 5a            	decw	x
10553  0b65               L041:
10554  0b65 02            	rlwa	x,a
10555  0b66 e604          	ld	a,(_ind_out,x)
10556  0b68 aa01          	or	a,#1
10557  0b6a c4500a        	and	a,20490
10558  0b6d c7500a        	ld	20490,a
10559                     ; 878 		GPIOD->ODR&=ind_out[3-ind_cnt]|0xfe;
10561  0b70 a600          	ld	a,#0
10562  0b72 97            	ld	xl,a
10563  0b73 a603          	ld	a,#3
10564  0b75 b02b          	sub	a,_ind_cnt
10565  0b77 2401          	jrnc	L241
10566  0b79 5a            	decw	x
10567  0b7a               L241:
10568  0b7a 02            	rlwa	x,a
10569  0b7b e604          	ld	a,(_ind_out,x)
10570  0b7d aafe          	or	a,#254
10571  0b7f c4500f        	and	a,20495
10572  0b82 c7500f        	ld	20495,a
10573                     ; 880 		GPIOB->ODR&=~(1<<ind_cnt);
10575  0b85 b62b          	ld	a,_ind_cnt
10576  0b87 5f            	clrw	x
10577  0b88 97            	ld	xl,a
10578  0b89 a601          	ld	a,#1
10579  0b8b 5d            	tnzw	x
10580  0b8c 2704          	jreq	L441
10581  0b8e               L641:
10582  0b8e 48            	sll	a
10583  0b8f 5a            	decw	x
10584  0b90 26fc          	jrne	L641
10585  0b92               L441:
10586  0b92 43            	cpl	a
10587  0b93 c45005        	and	a,20485
10588  0b96 c75005        	ld	20485,a
10589  0b99               L3107:
10590                     ; 883 	b1000Hz=1;
10592  0b99 35010000      	mov	_b1000Hz,#1
10593                     ; 884 	if(++t0_cnt0>=10){
10595  0b9d 725c0006      	inc	_t0_cnt0
10596  0ba1 c60006        	ld	a,_t0_cnt0
10597  0ba4 a10a          	cp	a,#10
10598  0ba6 2575          	jrult	L5107
10599                     ; 885     		t0_cnt0=0;
10601  0ba8 725f0006      	clr	_t0_cnt0
10602                     ; 886     		b100Hz=1;
10604  0bac 35010001      	mov	_b100Hz,#1
10605                     ; 888 		if(++t0_cnt1>=10){
10607  0bb0 725c0007      	inc	_t0_cnt1
10608  0bb4 c60007        	ld	a,_t0_cnt1
10609  0bb7 a10a          	cp	a,#10
10610  0bb9 2508          	jrult	L7107
10611                     ; 889 			t0_cnt1=0;
10613  0bbb 725f0007      	clr	_t0_cnt1
10614                     ; 890 			b10Hz=1;
10616  0bbf 35010002      	mov	_b10Hz,#1
10617  0bc3               L7107:
10618                     ; 894 		if(++t0_cnt2>=20){
10620  0bc3 725c0008      	inc	_t0_cnt2
10621  0bc7 c60008        	ld	a,_t0_cnt2
10622  0bca a114          	cp	a,#20
10623  0bcc 2513          	jrult	L1207
10624                     ; 895 			t0_cnt2=0;
10626  0bce 725f0008      	clr	_t0_cnt2
10627                     ; 896 			b5Hz=1;
10629  0bd2 35010003      	mov	_b5Hz,#1
10630                     ; 897 			bFL5=!bFL5;
10632  0bd6 3d1f          	tnz	_bFL5
10633  0bd8 2604          	jrne	L051
10634  0bda a601          	ld	a,#1
10635  0bdc 2001          	jra	L251
10636  0bde               L051:
10637  0bde 4f            	clr	a
10638  0bdf               L251:
10639  0bdf b71f          	ld	_bFL5,a
10640  0be1               L1207:
10641                     ; 900 		if(++t0_cnt3>=50){
10643  0be1 725c0009      	inc	_t0_cnt3
10644  0be5 c60009        	ld	a,_t0_cnt3
10645  0be8 a132          	cp	a,#50
10646  0bea 2513          	jrult	L3207
10647                     ; 901 			t0_cnt3=0;
10649  0bec 725f0009      	clr	_t0_cnt3
10650                     ; 902 			b2Hz=1;
10652  0bf0 35010004      	mov	_b2Hz,#1
10653                     ; 903 			bFL2=!bFL2;		
10655  0bf4 3d1e          	tnz	_bFL2
10656  0bf6 2604          	jrne	L451
10657  0bf8 a601          	ld	a,#1
10658  0bfa 2001          	jra	L651
10659  0bfc               L451:
10660  0bfc 4f            	clr	a
10661  0bfd               L651:
10662  0bfd b71e          	ld	_bFL2,a
10663  0bff               L3207:
10664                     ; 906 		if(++t0_cnt4>=100){
10666  0bff 725c000a      	inc	_t0_cnt4
10667  0c03 c6000a        	ld	a,_t0_cnt4
10668  0c06 a164          	cp	a,#100
10669  0c08 2513          	jrult	L5107
10670                     ; 907 			t0_cnt4=0;
10672  0c0a 725f000a      	clr	_t0_cnt4
10673                     ; 908 			b1Hz=1;
10675  0c0e 35010005      	mov	_b1Hz,#1
10676                     ; 909 			bFL1=!bFL1;
10678  0c12 3d1d          	tnz	_bFL1
10679  0c14 2604          	jrne	L061
10680  0c16 a601          	ld	a,#1
10681  0c18 2001          	jra	L261
10682  0c1a               L061:
10683  0c1a 4f            	clr	a
10684  0c1b               L261:
10685  0c1b b71d          	ld	_bFL1,a
10686  0c1d               L5107:
10687                     ; 913 	if(!(GPIOB->IDR&(1<<5))) {
10689  0c1d c65006        	ld	a,20486
10690  0c20 a520          	bcp	a,#32
10691  0c22 2613          	jrne	L7207
10692                     ; 914 		/*EE_PLAZMA=t0_cnt1;//*/ind_on_cnt=50;
10694  0c24 ae0032        	ldw	x,#50
10695  0c27 bf0b          	ldw	_ind_on_cnt,x
10696                     ; 915 		if(!cnt_bKEY) {
10698  0c29 3d32          	tnz	_cnt_bKEY
10699  0c2b 2610          	jrne	L3307
10700                     ; 916 			bKEY=1;
10702  0c2d 35010037      	mov	_bKEY,#1
10703                     ; 917 			cnt_bKEY=50;
10705  0c31 35320032      	mov	_cnt_bKEY,#50
10706  0c35 2006          	jra	L3307
10707  0c37               L7207:
10708                     ; 921 		if(cnt_bKEY)cnt_bKEY--;
10710  0c37 3d32          	tnz	_cnt_bKEY
10711  0c39 2702          	jreq	L3307
10714  0c3b 3a32          	dec	_cnt_bKEY
10715  0c3d               L3307:
10716                     ; 924 	if(zatvor_cnt) zatvor_cnt--;
10718  0c3d be38          	ldw	x,_zatvor_cnt
10719  0c3f 2707          	jreq	L7307
10722  0c41 be38          	ldw	x,_zatvor_cnt
10723  0c43 1d0001        	subw	x,#1
10724  0c46 bf38          	ldw	_zatvor_cnt,x
10725  0c48               L7307:
10726                     ; 930 if(!(GPIOB->IDR&(1<<5))) 
10728  0c48 c65006        	ld	a,20486
10729  0c4b a520          	bcp	a,#32
10730  0c4d 260e          	jrne	L1407
10731                     ; 933 	if(!cnt_bFIRE) 
10733  0c4f 3d31          	tnz	_cnt_bFIRE
10734  0c51 2614          	jrne	L5407
10735                     ; 935 		bFIRE=1;
10737  0c53 35010036      	mov	_bFIRE,#1
10738                     ; 936 		cnt_bFIRE=50;
10740  0c57 35320031      	mov	_cnt_bFIRE,#50
10741  0c5b 200a          	jra	L5407
10742  0c5d               L1407:
10743                     ; 941 	if(cnt_bFIRE)cnt_bFIRE--;
10745  0c5d 3d31          	tnz	_cnt_bFIRE
10746  0c5f 2702          	jreq	L7407
10749  0c61 3a31          	dec	_cnt_bFIRE
10750  0c63               L7407:
10751                     ; 942 	bZATVOR=0;
10753  0c63 3f03          	clr	_bZATVOR
10754                     ; 943 	but_cnt=0;
10756  0c65 3f00          	clr	_but_cnt
10757  0c67               L5407:
10758                     ; 950 if(!(GPIOB->IDR&(1<<5))) 
10760  0c67 c65006        	ld	a,20486
10761  0c6a a520          	bcp	a,#32
10762  0c6c 261c          	jrne	L1507
10763                     ; 953 	cnt_bFIRE_++;
10765  0c6e be2e          	ldw	x,_cnt_bFIRE_
10766  0c70 1c0001        	addw	x,#1
10767  0c73 bf2e          	ldw	_cnt_bFIRE_,x
10768                     ; 954 	if(cnt_bFIRE_>2000) 
10770  0c75 9c            	rvf
10771  0c76 be2e          	ldw	x,_cnt_bFIRE_
10772  0c78 a307d1        	cpw	x,#2001
10773  0c7b 2f10          	jrslt	L5507
10774                     ; 956 		bFIRE_=1;
10776  0c7d 35010035      	mov	_bFIRE_,#1
10777                     ; 957 		bFIRE_BLOCK=1;
10779  0c81 35010033      	mov	_bFIRE_BLOCK,#1
10780                     ; 958 		cnt_bFIRE_=0;
10782  0c85 5f            	clrw	x
10783  0c86 bf2e          	ldw	_cnt_bFIRE_,x
10784  0c88 2003          	jra	L5507
10785  0c8a               L1507:
10786                     ; 963 	cnt_bFIRE_=0;
10788  0c8a 5f            	clrw	x
10789  0c8b bf2e          	ldw	_cnt_bFIRE_,x
10790  0c8d               L5507:
10791                     ; 970 if((!(GPIOB->IDR&(1<<5)))&& (!bFIRE_BLOCK)) 
10793  0c8d c65006        	ld	a,20486
10794  0c90 a520          	bcp	a,#32
10795  0c92 2612          	jrne	L7507
10797  0c94 3d33          	tnz	_bFIRE_BLOCK
10798  0c96 260e          	jrne	L7507
10799                     ; 973 	cnt_bFIRE1++;
10801  0c98 3c30          	inc	_cnt_bFIRE1
10802                     ; 974 	if(cnt_bFIRE1>=50) 
10804  0c9a b630          	ld	a,_cnt_bFIRE1
10805  0c9c a132          	cp	a,#50
10806  0c9e 2512          	jrult	L3607
10807                     ; 976 		cnt_bFIRE1=50;
10809  0ca0 35320030      	mov	_cnt_bFIRE1,#50
10810  0ca4 200c          	jra	L3607
10811  0ca6               L7507:
10812                     ; 981 	if(cnt_bFIRE1>=50) 
10814  0ca6 b630          	ld	a,_cnt_bFIRE1
10815  0ca8 a132          	cp	a,#50
10816  0caa 2506          	jrult	L3607
10817                     ; 983 		bFIRE1=1;
10819  0cac 35010034      	mov	_bFIRE1,#1
10820                     ; 984 		cnt_bFIRE1=0;
10822  0cb0 3f30          	clr	_cnt_bFIRE1
10823  0cb2               L3607:
10824                     ; 992 if(GPIOB->IDR&(1<<5)) bFIRE_BLOCK=0;
10826  0cb2 c65006        	ld	a,20486
10827  0cb5 a520          	bcp	a,#32
10828  0cb7 2702          	jreq	L7607
10831  0cb9 3f33          	clr	_bFIRE_BLOCK
10832  0cbb               L7607:
10833                     ; 995 TIM4->SR1&=~TIM4_SR1_UIF;			// disable break interrupt
10835  0cbb 72115344      	bres	21316,#0
10836                     ; 996 return;
10839  0cbf 80            	iret
10861                     ; 999 @far @interrupt void TIM1_Ovf_Interrupt (void) {
10862                     	switch	.text
10863  0cc0               f_TIM1_Ovf_Interrupt:
10867                     ; 1000 	GPIOD->ODR^=(1<<3)|(1<<4);
10869  0cc0 c6500f        	ld	a,20495
10870  0cc3 a818          	xor	a,	#24
10871  0cc5 c7500f        	ld	20495,a
10872                     ; 1001 	TIM1->SR1&=~TIM1_SR1_UIF;			
10874  0cc8 72115255      	bres	21077,#0
10875                     ; 1002 }
10878  0ccc 80            	iret
10904                     ; 1005 @far @interrupt void UARTTxInterrupt (void) {
10905                     	switch	.text
10906  0ccd               f_UARTTxInterrupt:
10910                     ; 1007 	if (tx_counter){
10912  0ccd 725d0000      	tnz	_tx_counter
10913  0cd1 271d          	jreq	L1117
10914                     ; 1008 		--tx_counter;
10916  0cd3 725a0000      	dec	_tx_counter
10917                     ; 1009 		UART1->DR=tx_buffer[tx_rd_index];
10919  0cd7 5f            	clrw	x
10920  0cd8 b60b          	ld	a,_tx_rd_index
10921  0cda 2a01          	jrpl	L071
10922  0cdc 53            	cplw	x
10923  0cdd               L071:
10924  0cdd 97            	ld	xl,a
10925  0cde d6000b        	ld	a,(_tx_buffer,x)
10926  0ce1 c75231        	ld	21041,a
10927                     ; 1010 		if (++tx_rd_index == TX_BUFFER_SIZE) tx_rd_index=0;
10929  0ce4 3c0b          	inc	_tx_rd_index
10930  0ce6 b60b          	ld	a,_tx_rd_index
10931  0ce8 a150          	cp	a,#80
10932  0cea 260c          	jrne	L5117
10935  0cec 3f0b          	clr	_tx_rd_index
10936  0cee 2008          	jra	L5117
10937  0cf0               L1117:
10938                     ; 1013 		bOUT_FREE=1;
10940  0cf0 35010004      	mov	_bOUT_FREE,#1
10941                     ; 1014 		UART1->CR2&= ~UART1_CR2_TIEN;
10943  0cf4 721f5235      	bres	21045,#7
10944  0cf8               L5117:
10945                     ; 1016 }
10948  0cf8 80            	iret
10977                     ; 1019 @far @interrupt void UARTRxInterrupt (void) {
10978                     	switch	.text
10979  0cf9               f_UARTRxInterrupt:
10983                     ; 1024 	rx_status=UART1->SR;
10985  0cf9 5552300003    	mov	_rx_status,21040
10986                     ; 1025 	rx_data=UART1->DR;
10988  0cfe 5552310002    	mov	_rx_data,21041
10989                     ; 1027 	if (rx_status & (UART1_SR_RXNE)){
10991  0d03 b603          	ld	a,_rx_status
10992  0d05 a520          	bcp	a,#32
10993  0d07 272d          	jreq	L7217
10994                     ; 1028 		rx_buffer[rx_wr_index]=rx_data;
10996  0d09 be07          	ldw	x,_rx_wr_index
10997  0d0b b602          	ld	a,_rx_data
10998  0d0d d7005b        	ld	(_rx_buffer,x),a
10999                     ; 1029 		bRXIN=1;
11001  0d10 35010001      	mov	_bRXIN,#1
11002                     ; 1030 		if (++rx_wr_index == RX_BUFFER_SIZE) rx_wr_index=0;
11004  0d14 be07          	ldw	x,_rx_wr_index
11005  0d16 1c0001        	addw	x,#1
11006  0d19 bf07          	ldw	_rx_wr_index,x
11007  0d1b a30064        	cpw	x,#100
11008  0d1e 2603          	jrne	L1317
11011  0d20 5f            	clrw	x
11012  0d21 bf07          	ldw	_rx_wr_index,x
11013  0d23               L1317:
11014                     ; 1031 		if (++rx_counter == RX_BUFFER_SIZE){
11016  0d23 be09          	ldw	x,_rx_counter
11017  0d25 1c0001        	addw	x,#1
11018  0d28 bf09          	ldw	_rx_counter,x
11019  0d2a a30064        	cpw	x,#100
11020  0d2d 2607          	jrne	L7217
11021                     ; 1032 			rx_counter=0;
11023  0d2f 5f            	clrw	x
11024  0d30 bf09          	ldw	_rx_counter,x
11025                     ; 1033 			rx_buffer_overflow=1;
11027  0d32 35010000      	mov	_rx_buffer_overflow,#1
11028  0d36               L7217:
11029                     ; 1036 }
11032  0d36 80            	iret
11099                     ; 1042 main(){
11101                     	switch	.text
11102  0d37               _main:
11104  0d37 89            	pushw	x
11105       00000002      OFST:	set	2
11108                     ; 1043 	CLK->CKDIVR=0;
11110  0d38 725f50c6      	clr	20678
11111                     ; 1045 	gpio_init();
11113  0d3c cd0a24        	call	_gpio_init
11115                     ; 1049 	FLASH_DUKR=0xae;
11117  0d3f 35ae5064      	mov	_FLASH_DUKR,#174
11118                     ; 1050 	FLASH_DUKR=0x56;	
11120  0d43 35565064      	mov	_FLASH_DUKR,#86
11121                     ; 1094 	if(EE_REMAIN_BALLS) {
11123  0d47 ce4040        	ldw	x,_EE_REMAIN_BALLS
11124  0d4a 270f          	jreq	L3517
11125                     ; 1098 		ind=iWait1;
11127  0d4c 350c0062      	mov	_ind,#12
11128                     ; 1099 		ret_ind=iWait2;
11130  0d50 350d0061      	mov	_ret_ind,#13
11131                     ; 1100 		ret_cnt1=1200;
11133  0d54 ae04b0        	ldw	x,#1200
11134  0d57 bf15          	ldw	_ret_cnt1,x
11136  0d59 2003          	jra	L5517
11137  0d5b               L3517:
11138                     ; 1102 	else in_button();
11140  0d5b cd0755        	call	_in_button
11142  0d5e               L5517:
11143                     ; 1107 	t4_init();
11145  0d5e cd0b26        	call	_t4_init
11147                     ; 1108 	enableInterrupts();	
11150  0d61 9a            rim
11152                     ; 1111 uart_init();
11155  0d62 cd0724        	call	_uart_init
11157  0d65               L7517:
11158                     ; 1117 	if(bRXIN)	
11160  0d65 3d01          	tnz	_bRXIN
11161  0d67 2705          	jreq	L3617
11162                     ; 1119 		bRXIN=0;
11164  0d69 3f01          	clr	_bRXIN
11165                     ; 1121 		uart_in();
11167  0d6b cd0754        	call	_uart_in
11169  0d6e               L3617:
11170                     ; 1124 	if(b1000Hz)
11172  0d6e 725d0000      	tnz	_b1000Hz
11173  0d72 271b          	jreq	L5617
11174                     ; 1126 		b1000Hz=0;
11176  0d74 725f0000      	clr	_b1000Hz
11177                     ; 1127 		opto_drv();
11179  0d78 cd07ac        	call	_opto_drv
11181                     ; 1128 		target_drv();
11183  0d7b cd083a        	call	_target_drv
11185                     ; 1129 		target_an();
11187  0d7e cd0950        	call	_target_an
11189                     ; 1130 		rele_drv();
11191  0d81 cd0990        	call	_rele_drv
11193                     ; 1131 		if(not_fire_cnt)not_fire_cnt--;
11195  0d84 be0f          	ldw	x,_not_fire_cnt
11196  0d86 2707          	jreq	L5617
11199  0d88 be0f          	ldw	x,_not_fire_cnt
11200  0d8a 1d0001        	subw	x,#1
11201  0d8d bf0f          	ldw	_not_fire_cnt,x
11202  0d8f               L5617:
11203                     ; 1134 	if(b100Hz)
11205  0d8f 725d0001      	tnz	_b100Hz
11206  0d93 270d          	jreq	L1717
11207                     ; 1136 		b100Hz=0;
11209  0d95 725f0001      	clr	_b100Hz
11210                     ; 1138 		ibatton_drv();
11212  0d99 cd0000        	call	_ibatton_drv
11214                     ; 1139 		ibatton_an();
11216  0d9c cd0000        	call	_ibatton_an
11218                     ; 1140 		but_an();
11220  0d9f cd051f        	call	_but_an
11222  0da2               L1717:
11223                     ; 1143 	if(b10Hz)
11225  0da2 725d0002      	tnz	_b10Hz
11226  0da6 2753          	jreq	L3717
11227                     ; 1145 		b10Hz=0;
11229  0da8 725f0002      	clr	_b10Hz
11230                     ; 1148 		ind_hndl();
11232  0dac cd01a7        	call	_ind_hndl
11234                     ; 1149 		if(ret_cnt)
11236  0daf be5d          	ldw	x,_ret_cnt
11237  0db1 270e          	jreq	L5717
11238                     ; 1151 			ret_cnt--;
11240  0db3 be5d          	ldw	x,_ret_cnt
11241  0db5 1d0001        	subw	x,#1
11242  0db8 bf5d          	ldw	_ret_cnt,x
11243                     ; 1152 			if(ret_cnt==0)
11245  0dba be5d          	ldw	x,_ret_cnt
11246  0dbc 2603          	jrne	L5717
11247                     ; 1154 				ind=ret_ind;
11249  0dbe 456162        	mov	_ind,_ret_ind
11250  0dc1               L5717:
11251                     ; 1157 		if(ret_cnt1)
11253  0dc1 be15          	ldw	x,_ret_cnt1
11254  0dc3 2736          	jreq	L3717
11255                     ; 1159 			ret_cnt1--;
11257  0dc5 be15          	ldw	x,_ret_cnt1
11258  0dc7 1d0001        	subw	x,#1
11259  0dca bf15          	ldw	_ret_cnt1,x
11260                     ; 1160 			if(ret_cnt1==0)
11262  0dcc be15          	ldw	x,_ret_cnt1
11263  0dce 262b          	jrne	L3717
11264                     ; 1162 				ind=iWait2;
11266  0dd0 350d0062      	mov	_ind,#13
11267                     ; 1163 				EE_FISK_CNT1++;
11269  0dd4 ce4108        	ldw	x,_EE_FISK_CNT1
11270  0dd7 1c0001        	addw	x,#1
11271  0dda cf4108        	ldw	_EE_FISK_CNT1,x
11272                     ; 1164 				if(EE_FISK_CNT1>=100)EE_FISK_CNT1=0;
11274  0ddd 9c            	rvf
11275  0dde ce4108        	ldw	x,_EE_FISK_CNT1
11276  0de1 a30064        	cpw	x,#100
11277  0de4 2f09          	jrslt	L5027
11280  0de6 5f            	clrw	x
11281  0de7 89            	pushw	x
11282  0de8 ae4108        	ldw	x,#_EE_FISK_CNT1
11283  0deb cd0000        	call	c_eewrw
11285  0dee 85            	popw	x
11286  0def               L5027:
11287                     ; 1165 				EE_REMAIN_BALLS=0;
11289  0def 5f            	clrw	x
11290  0df0 89            	pushw	x
11291  0df1 ae4040        	ldw	x,#_EE_REMAIN_BALLS
11292  0df4 cd0000        	call	c_eewrw
11294  0df7 85            	popw	x
11295                     ; 1166 				ret_cnt=0;
11297  0df8 5f            	clrw	x
11298  0df9 bf5d          	ldw	_ret_cnt,x
11299  0dfb               L3717:
11300                     ; 1172 	if(b5Hz)
11302  0dfb 725d0003      	tnz	_b5Hz
11303  0dff 2704          	jreq	L7027
11304                     ; 1174 		b5Hz=0;
11306  0e01 725f0003      	clr	_b5Hz
11307  0e05               L7027:
11308                     ; 1178 	if(b2Hz)
11310  0e05 725d0004      	tnz	_b2Hz
11311  0e09 2704          	jreq	L1127
11312                     ; 1180 		b2Hz=0;
11314  0e0b 725f0004      	clr	_b2Hz
11315  0e0f               L1127:
11316                     ; 1184 	if(b1Hz)
11318  0e0f 725d0005      	tnz	_b1Hz
11319  0e13 2603          	jrne	L002
11320  0e15 cc0d65        	jp	L7517
11321  0e18               L002:
11322                     ; 1187 		b1Hz=0;
11324  0e18 725f0005      	clr	_b1Hz
11325                     ; 1192 		uart_buff="Hello %d,%d,%d,%d,%x\r\n";
11327  0e1c ae0022        	ldw	x,#L5127
11328  0e1f 1f01          	ldw	(OFST-1,sp),x
11329                     ; 1193 		printf(uart_buff,SERIAL_NUMBER,EE_FISK_CNT,plazma[2],plazma[3]++,plazma[4]);
11331  0e21 be1b          	ldw	x,_plazma+8
11332  0e23 89            	pushw	x
11333  0e24 be19          	ldw	x,_plazma+6
11334  0e26 3c1a          	inc	_plazma+7
11335  0e28 2602          	jrne	L671
11336  0e2a 3c19          	inc	_plazma+6
11337  0e2c               L671:
11338  0e2c 89            	pushw	x
11339  0e2d be17          	ldw	x,_plazma+4
11340  0e2f 89            	pushw	x
11341  0e30 ce4100        	ldw	x,_EE_FISK_CNT
11342  0e33 89            	pushw	x
11343  0e34 ae049f        	ldw	x,#1183
11344  0e37 89            	pushw	x
11345  0e38 1e0b          	ldw	x,(OFST+9,sp)
11346  0e3a cd0000        	call	_printf
11348  0e3d 5b0a          	addw	sp,#10
11349                     ; 1196 		wrk_hndl();
11351  0e3f cd09b2        	call	_wrk_hndl
11353  0e42 ac650d65      	jpf	L7517
12485                     	xdef	_main
12486                     	xdef	f_UARTRxInterrupt
12487                     	xdef	f_UARTTxInterrupt
12488                     	xdef	f_TIM1_Ovf_Interrupt
12489                     	xdef	_t1_init
12490                     	xdef	_wrk_hndl
12491                     	xdef	_rele_drv
12492                     	xdef	_target_an
12493                     	xdef	_target_drv
12494                     	xdef	_opto_drv
12495                     	xdef	_in_button
12496                     	xdef	_uart_in
12497                     	xdef	_uart_init
12498                     	xdef	_putchar
12499                     	xdef	_but_an
12500                     	xdef	_ind_hndl
12501                     	xdef	_int2ind_slkuf
12502                     	xdef	_bcd2ind
12503                     	xdef	_long2ind
12504                     	xdef	_bcd2ind_zero
12505                     	xdef	_bin2bcd_int
12506                     	xdef	_bin2bcd_long
12507                     	xdef	_plazma
12508                     	switch	.ubsct
12509  0000               _rx_buffer_overflow:
12510  0000 00            	ds.b	1
12511                     	xdef	_rx_buffer_overflow
12512  0001               _bRXIN:
12513  0001 00            	ds.b	1
12514                     	xdef	_bRXIN
12515  0002               _rx_data:
12516  0002 00            	ds.b	1
12517                     	xdef	_rx_data
12518  0003               _rx_status:
12519  0003 00            	ds.b	1
12520                     	xdef	_rx_status
12521  0004               _bOUT_FREE:
12522  0004 00            	ds.b	1
12523                     	xdef	_bOUT_FREE
12524  0005               _rx_rd_index:
12525  0005 0000          	ds.b	2
12526                     	xdef	_rx_rd_index
12527  0007               _rx_wr_index:
12528  0007 0000          	ds.b	2
12529                     	xdef	_rx_wr_index
12530  0009               _rx_counter:
12531  0009 0000          	ds.b	2
12532                     	xdef	_rx_counter
12533                     	xdef	_rx_buffer
12534  000b               _tx_rd_index:
12535  000b 00            	ds.b	1
12536                     	xdef	_tx_rd_index
12537  000c               _tx_wr_index:
12538  000c 00            	ds.b	1
12539                     	xdef	_tx_wr_index
12540                     	switch	.bss
12541  0000               _tx_counter:
12542  0000 00            	ds.b	1
12543                     	xdef	_tx_counter
12544                     	xdef	_tx_buffer
12545                     	switch	.ubsct
12546  000d               _plazma_SS:
12547  000d 0000          	ds.b	2
12548                     	xdef	_plazma_SS
12549  000f               _not_fire_cnt:
12550  000f 0000          	ds.b	2
12551                     	xdef	_not_fire_cnt
12552  0011               _opto_cnt:
12553  0011 0000          	ds.b	2
12554                     	xdef	_opto_cnt
12555  0013               _target_plazma:
12556  0013 00            	ds.b	1
12557                     	xdef	_target_plazma
12558  0014               _ind_ind_cnt:
12559  0014 00            	ds.b	1
12560                     	xdef	_ind_ind_cnt
12561  0015               _ret_cnt1:
12562  0015 0000          	ds.b	2
12563                     	xdef	_ret_cnt1
12564  0017               _ind_out_:
12565  0017 0000000000    	ds.b	5
12566                     	xdef	_ind_out_
12567  001c               _bFL_:
12568  001c 00            	ds.b	1
12569                     	xdef	_bFL_
12570  001d               _bFL1:
12571  001d 00            	ds.b	1
12572                     	xdef	_bFL1
12573  001e               _bFL2:
12574  001e 00            	ds.b	1
12575                     	xdef	_bFL2
12576  001f               _bFL5:
12577  001f 00            	ds.b	1
12578                     	xdef	_bFL5
12579                     	xdef	_bERR
12580                     	xdef	_ind_on_cnt1
12581                     	xdef	_ind_on_cnt
12582  0020               _zero_on:
12583  0020 00            	ds.b	1
12584                     	xdef	_zero_on
12585  0021               _dig:
12586  0021 000000000000  	ds.b	10
12587                     	xdef	_dig
12588                     	xdef	_DIGISYM
12589                     	xdef	_ind_out
12590  002b               _ind_cnt:
12591  002b 00            	ds.b	1
12592                     	xdef	_ind_cnt
12593  002c               _parol_sigma:
12594  002c 0000          	ds.b	2
12595                     	xdef	_parol_sigma
12596  002e               _cnt_bFIRE_:
12597  002e 0000          	ds.b	2
12598                     	xdef	_cnt_bFIRE_
12599  0030               _cnt_bFIRE1:
12600  0030 00            	ds.b	1
12601                     	xdef	_cnt_bFIRE1
12602  0031               _cnt_bFIRE:
12603  0031 00            	ds.b	1
12604                     	xdef	_cnt_bFIRE
12605  0032               _cnt_bKEY:
12606  0032 00            	ds.b	1
12607                     	xdef	_cnt_bKEY
12608  0033               _bFIRE_BLOCK:
12609  0033 00            	ds.b	1
12610                     	xdef	_bFIRE_BLOCK
12611  0034               _bFIRE1:
12612  0034 00            	ds.b	1
12613                     	xdef	_bFIRE1
12614  0035               _bFIRE_:
12615  0035 00            	ds.b	1
12616                     	xdef	_bFIRE_
12617  0036               _bFIRE:
12618  0036 00            	ds.b	1
12619                     	xdef	_bFIRE
12620  0037               _bKEY:
12621  0037 00            	ds.b	1
12622                     	xdef	_bKEY
12623  0038               _zatvor_cnt:
12624  0038 0000          	ds.b	2
12625                     	xdef	_zatvor_cnt
12626                     	xdef	_bZATVOR
12627                     	xdef	_rel_out_cnt
12628                     	xdef	_but_cnt
12629                     .eeprom:	section	.data
12630  0000               _ee_plazma:
12631  0000 00000000      	ds.b	4
12632                     	xdef	_ee_plazma
12633  0004               _ee_dumm:
12634  0004 000000000000  	ds.b	10
12635                     	xdef	_ee_dumm
12636                     	xdef	_t0_cnt4
12637                     	xdef	_b2Hz
12638                     	xdef	_b1000Hz
12639                     	xref	_printf
12640                     	xdef	f_TIM4_UPD_Interrupt
12641                     	xdef	_t4_init
12642                     	xdef	_spi_init
12643                     	xdef	_t2_init
12644                     	xdef	_gpio_init
12645                     	xdef	_delay_ms
12646                     	xdef	_spi
12647                     	xdef	_char2indh_sf
12648                     	xdef	_plazma_ibatton2
12649                     	xdef	_plazma_ibatton1
12650                     	switch	.ubsct
12651  003a               _connect_cnt:
12652  003a 0000          	ds.b	2
12653                     	xdef	_connect_cnt
12654  003c               _zero_cnt:
12655  003c 0000          	ds.b	2
12656                     	xdef	_zero_cnt
12657  003e               _one_cnt:
12658  003e 0000          	ds.b	2
12659                     	xdef	_one_cnt
12660  0040               _bLINE_OLD:
12661  0040 00            	ds.b	1
12662                     	xdef	_bLINE_OLD
12663  0041               _bIN_OLD:
12664  0041 00            	ds.b	1
12665                     	xdef	_bIN_OLD
12666  0042               _rele_cnt:
12667  0042 0000          	ds.b	2
12668                     	xdef	_rele_cnt
12669  0044               _fire_cnt:
12670  0044 0000          	ds.b	2
12671                     	xdef	_fire_cnt
12672  0046               _target_on:
12673  0046 00000000      	ds.b	4
12674                     	xdef	_target_on
12675  004a               _target_cnt_off:
12676  004a 000000000000  	ds.b	8
12677                     	xdef	_target_cnt_off
12678  0052               _target_cnt:
12679  0052 000000000000  	ds.b	8
12680                     	xdef	_target_cnt
12681  005a               _wrk_cnt:
12682  005a 0000          	ds.b	2
12683                     	xdef	_wrk_cnt
12684                     	xdef	_wrk_stat
12685                     	switch	.bss
12686  0001               _rx_plazma:
12687  0001 00            	ds.b	1
12688                     	xdef	_rx_plazma
12689                     	switch	.ubsct
12690  005c               _i_ser_num_cnt:
12691  005c 00            	ds.b	1
12692                     	xdef	_i_ser_num_cnt
12693  005d               _ret_cnt:
12694  005d 0000          	ds.b	2
12695                     	xdef	_ret_cnt
12696  005f               _fin_ind_cnt:
12697  005f 00            	ds.b	1
12698                     	xdef	_fin_ind_cnt
12699  0060               _sub_ind:
12700  0060 00            	ds.b	1
12701                     	xdef	_sub_ind
12702  0061               _ret_ind:
12703  0061 00            	ds.b	1
12704                     	xdef	_ret_ind
12705  0062               _ind:
12706  0062 00            	ds.b	1
12707                     	xdef	_ind
12708                     	switch	.bss
12709  0002               _bSTART:
12710  0002 00            	ds.b	1
12711                     	xdef	_bSTART
12712                     	xdef	_t0_cnt3
12713                     	xdef	_t0_cnt2
12714                     	xdef	_t0_cnt1
12715                     	xdef	_t0_cnt0
12716                     	xdef	_b1Hz
12717                     	xdef	_b5Hz
12718                     	xdef	_b10Hz
12719                     	xdef	_b100Hz
12720                     	xref	_ibatton_an
12721                     	xref	_ibatton_drv
12722                     	switch	.const
12723  0022               L5127:
12724  0022 48656c6c6f20  	dc.b	"Hello %d,%d,%d,%d,"
12725  0034 25780d        	dc.b	"%x",13
12726  0037 0a00          	dc.b	10,0
12727                     	xref.b	c_lreg
12728                     	xref.b	c_x
12729                     	xref.b	c_y
12749                     	xref	c_lcmp
12750                     	xref	c_lgadc
12751                     	xref	c_vmul
12752                     	xref	c_eewrw
12753                     	xref	c_imul
12754                     	xref	c_sdivx
12755                     	xref	c_eewrl
12756                     	xref	c_smodx
12757                     	xref	c_rtol
12758                     	xref	c_ludv
12759                     	xref	c_lumd
12760                     	xref	c_ltor
12761                     	end
