#include "stm8s.h"
#include "cmd.c"
#include <iostm8s103.h>
#include "ibatton.h"
#include "main.h"
#include <stdio.h>

//#pragma section @eeprom [aaa]

@near bool b1000Hz=0,b100Hz=0,b10Hz=0,b5Hz=0,b2Hz=0,b1Hz=0;
@near char t0_cnt0=0,t0_cnt1=0,t0_cnt2=0,t0_cnt3=0,t0_cnt4=0;

@near bool bSTART;
@near char rx_plazma;
//char tx_buffer[30]={1,2,3,4,5,6,7,8};
char spi(char in);

#define FORGSM




@eeprom long EE_MAIN_BUTTON 		@0x4010;
@eeprom long EE_WRK_BUTTON 		@0x4020;
@eeprom short EE_BONUS_SIGMA 		@0x4030;
@eeprom short EE_REMAIN_BALLS		@0x4040;
@eeprom short EE_PNEVMO_TIME 		@0x4050;
@eeprom short EE_NUM_OF_BALLS 	@0x4060;
@eeprom short EE_TARGET_BONUS[5] 	@0x4070;
@eeprom short EE_FISK_CNT 		@0x4100;
@eeprom short EE_FISK_CNT1 		@0x4108;
//@eeprom int EE_WRK_BUTTON;
//@eeprom char EE_PLAZMA;
@eeprom @near char ee_dumm[10];
@eeprom @near long ee_plazma;

signed char but_cnt=0;
signed short rel_out_cnt=0; 
/*@eeprom signed short EE_PNEVMO_TIME;*/
char bZATVOR=0;
short zatvor_cnt;
bool bKEY,bFIRE,bFIRE_,bFIRE1,bFIRE_BLOCK;
char cnt_bKEY,cnt_bFIRE,cnt_bFIRE1;
short cnt_bFIRE_;
short parol_sigma;
//-----------------------------------------------
//Индикация
char ind_cnt;
char ind_out[7]={0b11111111,0b11111111,0b11111111,0b11111111,0b11111111,0b11111111,0b11111111};
const char DIGISYM[30]={	0b10000001,0b11110011,0b01001001,0b01100001,0b00110011,0b00100101,0b00000101,0b11110001,0b00000001,0b00100001,
					0b00010001,0b00000111,0b10001101,0b01000011,0b00000111,0b00001111,0b11111111,0b11111111,0b11111111,0b11111111,
					0b11111111,0b11111101,0b11111011,0b11110111,0b11101111,0b11011111,0b10111111,0b01111111};
char dig[10];
bool zero_on;
unsigned short ind_on_cnt=0,ind_on_cnt1=0; 
bool bERR=1;
bool bFL5,bFL2,bFL1,bFL_;
char ind_out_[5];
enum_ind ind,ret_ind;
char sub_ind;
char fin_ind_cnt;
short ret_cnt,ret_cnt1;
char i_ser_num_cnt;
char ind_ind_cnt;
char target_plazma;

//-----------------------------------------------
//Управление процессом
enum_wrk_stat wrk_stat=wsOFF;
short wrk_cnt;


//-----------------------------------------------
//Опрос мишеней
signed short target_cnt[4];
signed short target_cnt_off[4];
signed char target_on[4];
short fire_cnt;
short opto_cnt;
short not_fire_cnt;

//-----------------------------------------------
//Управление реле
signed short rele_cnt;

//-----------------------------------------------
//Опрос оптобарьера
bool bIN_OLD; 
bool bLINE_OLD;
unsigned short one_cnt,zero_cnt;
signed short connect_cnt;

char plazma_ibatton1=1;
char plazma_ibatton2=2;

//-----------------------------------------------
//Отладка
signed short plazma_SS;

#define TX_BUFFER_SIZE	80
#define RX_BUFFER_SIZE	100

@near char tx_buffer[TX_BUFFER_SIZE]={0};
@near signed char tx_counter;
signed char tx_wr_index,tx_rd_index;
@near char rx_buffer[RX_BUFFER_SIZE]={0};
signed short rx_counter;
signed short rx_wr_index,rx_rd_index;
char bOUT_FREE;
char rx_status;
char rx_data;
char bRXIN;
char rx_buffer_overflow;
//@near char UIB[40];

signed short plazma[5]={1234,574,89,0,-1};
//-----------------------------------------------
void bin2bcd_long(unsigned long in);
//-----------------------------------------------
void bin2bcd_int(unsigned short in);
//-----------------------------------------------
void bcd2ind_zero(void);
//-----------------------------------------------
void long2ind(unsigned long in);
//-----------------------------------------------
void bcd2ind(void);

//-----------------------------------------------
void bin2bcd_long(unsigned long in) {
char i;

for(i=0;i<10;i++)
	{
	dig[i]=in%10L;
	in/=10L;
	}
}
//-----------------------------------------------
void bin2bcd_int(unsigned short in) {

char i=5;

for(i=0;i<5;i++)
	{
	dig[i]=in%10;
	in/=10;
	}
}
//-----------------------------------------------
void bcd2ind(void) {
char i;

for (i=4;i>0;i--)
	{
	ind_out_[i-1]=DIGISYM[dig[i-1]];
	}
}
//-----------------------------------------------
void bcd2ind_zero() {
char i;
zero_on=1;
for (i=4;i>0;i--)
	{
	if(zero_on&&(!dig[i-1])&&(i-1))
		{
		ind_out_[i-1]=0b11111111;
		}
	else
		{
		ind_out_[i-1]=DIGISYM[dig[i-1]];
		zero_on=0;
		}
	}
}
//-----------------------------------------------
void long2ind(unsigned long in) {

bin2bcd_long(in);
bcd2ind_zero();

}
//-----------------------------------------------
void int2ind_slkuf(unsigned short in, char start, char len, char komma, char unzero, char fl) {
	char i;

	bin2bcd_int(in);
	if(unzero)bcd2ind_zero();
	else bcd2ind();
	if(komma)ind_out_[komma]&=0b11111110; 
	if(((fl==1)&&(bFL1)) ||
	   ((fl==2)&&(bFL2)) ||
	   ((fl==5)&&(bFL5))) {
		for(i=0;i<len;i++) {
			ind_out_[i]=DIGISYM[17];
		}
	}

	for(i=0;i<len;i++) {
		ind_out[start+i]=ind_out_[i];
	}


}
//-----------------------------------------------
void char2indh_sf(unsigned char in, char start, char fl) {
	char i;

	ind_out_[0]=DIGISYM[in%16];
	ind_out_[1]=DIGISYM[in/16];
	
	if(((fl==1)&&(bFL1)) ||
	   ((fl==2)&&(bFL2)) ||
	   ((fl==5)&&(bFL5))) {
		ind_out_[0]=DIGISYM[17];
		ind_out_[1]=DIGISYM[17];
	}

	
	ind_out[start]=ind_out_[0];
	ind_out[start+1]=ind_out_[1];



}
//-----------------------------------------------
void ind_hndl(void) {
	
	if(ind==iMn) {
		int2ind_slkuf(cnt_bFIRE_,0,3,0,1,0);
		int2ind_slkuf(bFIRE_,3,1,0,1,0);
		/*int2ind_slkuf(target_on[0],0,1,0,1,0);
		int2ind_slkuf(target_on[1],1,1,0,1,0);
		int2ind_slkuf(target_on[2],2,1,0,1,0);
		int2ind_slkuf(target_on[3],3,1,0,1,0);
		//int2ind_slkuf(GPIOD->IDR,0,3,0,1,0);*/
	}
	
	else if(ind==iBtn) {
		int2ind_slkuf(321,0,3,0,1,0);
	}
	
	else if(ind==iWait) {
		ind_ind_cnt++;
		if(ind_ind_cnt>50)ind_ind_cnt=0;
		
		if(ind_ind_cnt<18) {
			ind_out[0]=DIGISYM[21+(ind_ind_cnt%6)];
			ind_out[1]=DIGISYM[21+(ind_ind_cnt%6)];
			ind_out[2]=DIGISYM[21+(ind_ind_cnt%6)];
			ind_out[3]=DIGISYM[21+(ind_ind_cnt%6)];
		}
		else {
			int2ind_slkuf(EE_BONUS_SIGMA,0,4,0,1,2);
		}
		if(bERR){
			ind_out[0]=0b01011111;
			ind_out[1]=0b01011111;
			ind_out[2]=0b00001101;
			ind_out[3]=0b11111111;
		}
		
		//int2ind_slkuf(plazma_ibatton1,3,1,0,1,0);
		//int2ind_slkuf(plazma_ibatton2,0,3,0,1,0);
	}
	
	else if(ind==iWait1) {
		ind_ind_cnt++;
		if(ind_ind_cnt==3)ind_ind_cnt++;
		if(ind_ind_cnt>4)ind_ind_cnt=0;
		
		ind_out[0]=DIGISYM[23+(ind_ind_cnt)];
		ind_out[1]=DIGISYM[23+(ind_ind_cnt)];
		ind_out[2]=DIGISYM[23+(ind_ind_cnt)];
		ind_out[3]=DIGISYM[23+(ind_ind_cnt)];
	}
	
	else if(ind==iWait2) {
		int2ind_slkuf(11,2,2,0,0,0);
		int2ind_slkuf(EE_FISK_CNT1,0,2,0,0,0);
	}	
	
	else if(ind==iSet) {
		int2ind_slkuf(sub_ind+1,3,1,0,1,5);
		if(sub_ind==0) {
			int2ind_slkuf(888,0,3,0,1,0);
		}
		else if(sub_ind==1) {
			int2ind_slkuf(EE_PNEVMO_TIME,0,3,0,1,0);
		}
		else if(sub_ind==2) {
			int2ind_slkuf(EE_NUM_OF_BALLS,0,3,0,1,0);
		}		
		else if(sub_ind==3) {
			char2indh_sf((char)EE_WRK_BUTTON,0,0);
		}
		else if(sub_ind==4) {
			int2ind_slkuf(999,0,3,0,1,0);
		}
		
	}

	else if(ind==iWrk) {
		//int2ind_slkuf(EE_REMAIN_BALLS,0,2,0,1,0);
		int2ind_slkuf(EE_BONUS_SIGMA,0,4,0,1,0);
		
		if(bERR){
			ind_out[0]=0b01011111;
			ind_out[1]=0b01011111;
			ind_out[2]=0b00001101;
			ind_out[3]=0b11111111;
		}
	}
	
	else if(ind==iFin) {
		if(fin_ind_cnt)fin_ind_cnt--;
		if(!fin_ind_cnt) {
			ind=iWait;
			ind_ind_cnt=0;
		}
		if(fin_ind_cnt&0b00000100) {
			int2ind_slkuf(EE_BONUS_SIGMA,0,4,0,1,0);
		}
		else {
			ind_out[0]=DIGISYM[17];
			ind_out[1]=DIGISYM[17];
			ind_out[2]=DIGISYM[17];
			ind_out[3]=DIGISYM[17];
		}
	}
	
	else if(ind==iFisk) {
		if(fin_ind_cnt)fin_ind_cnt--;
		if(!fin_ind_cnt) {
			ind=iSet;
		}
		int2ind_slkuf(EE_FISK_CNT,0,4,0,1,0);

	}
	else if(ind==iFisk1) {
		if(fin_ind_cnt)fin_ind_cnt--;
		if(!fin_ind_cnt) {
			ind=iSet;
		}
		int2ind_slkuf(EE_FISK_CNT1,0,4,0,1,0);

	}	
	else if(ind==iDeb) {
		int2ind_slkuf(target_plazma,0,3,0,1,0);
	}

	else if(ind==iSerNum) {
		int2ind_slkuf(SERIAL_NUMBER,0,4,0,0,0);
	}
	
	else if(ind==iMnBut) {
		ind_ind_cnt++;
		if(ind_ind_cnt>8)ind_ind_cnt=0;
		
		ind_out[0]=DIGISYM[20];
		ind_out[1]=DIGISYM[20];
		ind_out[2]=DIGISYM[20];
		ind_out[3]=DIGISYM[20];
		
		ind_out[3-(ind_ind_cnt/2)]=DIGISYM[24];
	}	
		
	else if(ind==iMnButPrl) {
		//ind_ind_cnt++;
		//if(ind_ind_cnt>8)ind_ind_cnt=0;

		ind_out[0]=DIGISYM[27];
		ind_out[1]=DIGISYM[27];
		ind_out[2]=DIGISYM[27];
		ind_out[3]=DIGISYM[27];
		if(bFL5) {
			ind_out[0]=DIGISYM[20];
			ind_out[1]=DIGISYM[20];
			ind_out[2]=DIGISYM[20];
			ind_out[3]=DIGISYM[20];
		}
		
		ind_out[3-sub_ind]=DIGISYM[27];
		if(ind_ind_cnt) {
			ind_ind_cnt--;
			ind_out[3-sub_ind]=DIGISYM[20];
		}	
		//ind_out[3-(ind_ind_cnt/2)]=DIGISYM[24];
		/*int2ind_slkuf(sub_ind,3,1,0,0,0);
		int2ind_slkuf(bFIRE1,0,1,0,0,0);
		int2ind_slkuf(bFIRE_BLOCK,1,1,0,0,0);
		int2ind_slkuf(cnt_bFIRE1/10,2,1,0,0,0);*/
	}
	else if(ind==iDnd) {
		ind_out[0]=0b01000011;
		ind_out[1]=0b00010001;
		ind_out[2]=0b00000111;
		ind_out[3]=0b11111111;
	}		
}
//-----------------------------------------------
void but_an(void) {
	if(bKEY || bFIRE || bFIRE_ || bFIRE1) {
		if(ind==iMn) {
			if(bFIRE) {
				sub_ind++;
				if(sub_ind>=4)sub_ind=0;
			}
			if(bKEY) {
				ee_plazma=0xabcd;
			}
		}
		
		else if(ind==iSet) {
			if( (sub_ind==0) && (bFIRE) ) {
				ind=iFisk;
				fin_ind_cnt=30;
			}			
			else if( (sub_ind==1) && (bFIRE) ) {
				EE_PNEVMO_TIME = ((EE_PNEVMO_TIME/20)+1)*20;
				if( (EE_PNEVMO_TIME>200) || (EE_PNEVMO_TIME<20) ) EE_PNEVMO_TIME=20;
			}
			
			else if( (sub_ind==2) && (bFIRE) ) {
				EE_NUM_OF_BALLS++;
				if( (EE_NUM_OF_BALLS>30) || (EE_NUM_OF_BALLS<1) ) EE_NUM_OF_BALLS=1;
			}
			else if( (sub_ind==4) && (bFIRE) ) {
				ind=iFisk1;
				fin_ind_cnt=30;
			}			

			 
		}

		else if(ind==iWait1) {
			if(bFIRE) {
				ind=iWrk;
				wrk_stat=wsON;
				wrk_cnt=120;
				ret_cnt=0;
				ret_cnt1=0;
			}			
		}

		else if((wrk_stat==wsON) && (!bERR)&&(!not_fire_cnt)) {
			if(bFIRE) {
				rele_cnt=EE_PNEVMO_TIME;
				wrk_cnt=120;
				fire_cnt=1500;
				not_fire_cnt=1000;
			}
		}

		else if(ind==iMnButPrl) {/*
			if( (sub_ind==0) && (bFIRE) ) {
				EE_PNEVMO_TIME = ((EE_PNEVMO_TIME/20)+1)*20;
				if( (EE_PNEVMO_TIME>200) || (EE_PNEVMO_TIME<20) ) EE_PNEVMO_TIME=20;
			}
			
			else if( (sub_ind==1) && (bFIRE) ) {
				EE_NUM_OF_BALLS++;
				if( (EE_NUM_OF_BALLS>30) || (EE_NUM_OF_BALLS<1) ) EE_NUM_OF_BALLS=1;
			}
			
			else if( (sub_ind==3) && (bFIRE) ) {
				ind=iFisk;
				fin_ind_cnt=30;
			}*/
			if(bFIRE_) {
				if(sub_ind<3) {
					sub_ind++;
				}
				else {
					if(parol_sigma==SERIAL_NUMBER) {
						ind=iMnBut;
						ret_ind=iWait;
						ret_cnt=100;
					}
					else {
						ind=iDnd;
						ret_ind=iWait;
						ret_cnt=30;
					}
				}
			}	
			else if(bFIRE1) {
				ind_ind_cnt=10;
				
				if(sub_ind==0) {
					parol_sigma+=1000;
				}
				else if(sub_ind==1) {
					parol_sigma+=100;
				}
				else if(sub_ind==2) {
					parol_sigma+=10;
				}
				else if(sub_ind==3) {
					parol_sigma+=1;
				}

			}
					
		}
		
	}
	bKEY=0;
	bFIRE=0;
	bFIRE_=0;
	bFIRE1=0;
}

//-----------------------------------------------
void putchar(char c)
{
while (tx_counter == TX_BUFFER_SIZE);
///#asm("cli")
if (tx_counter || ((UART1->SR & UART1_SR_TXE)==0))
   {
   tx_buffer[tx_wr_index]=c;
   if (++tx_wr_index == TX_BUFFER_SIZE) tx_wr_index=0;
   ++tx_counter;
   }
else UART1->DR=c;

UART1->CR2|= UART1_CR2_TIEN;
///#asm("sei")
}

//-----------------------------------------------
void uart_init (void){
	GPIOD->DDR|=(1<<5);
	GPIOD->CR1|=(1<<5);
	GPIOD->CR2|=(1<<5);
	//GPIOD->ODR|=(1<<5);	

	GPIOD->DDR&=~(1<<6);
	GPIOD->CR1&=~(1<<6);
	GPIOD->CR2&=~(1<<6);
	//GPIOD->ODR|=(1<<6);	
	
	UART1->CR1&=~UART1_CR1_M;					
	UART1->CR3|= (0<<4) & UART1_CR3_STOP;	
	UART1->BRR2= 0x03;//0x01;
	UART1->BRR1= 0x68;//0x1a;
	UART1->CR2|= UART1_CR2_TEN | UART3_CR2_REN | UART3_CR2_RIEN;	
}

//-----------------------------------------------
void uart_in(void)
{

}

//-----------------------------------------------
void in_button(void) {
	short i,ii;

	if(/* (!(GPIOB->IDR&(1<<5))) /*&&*/ (!(GPIOD->IDR&(1<<5)))) {
		for(i=0;i<10000;i++) {
			for(ii=0;ii<1000;ii++) {
				__nop();
			}
			if( /*(GPIOB->IDR&(1<<5)) || */(GPIOD->IDR&(1<<5)) ) break;
		}
		if(i==10000) {
			ind=iMnButPrl;
			sub_ind=0;
			bFIRE_=0;
			cnt_bFIRE_=0;
			bFIRE_BLOCK=1;
			parol_sigma=0;
		}
	}
	else {
		ind=iWait;
	}
}
//-----------------------------------------------
void opto_drv (void) {
	if((GPIOD->IDR)&(1<<1)) {
		if(!bLINE_OLD)connect_cnt=1000;
	
		if(!bIN_OLD) {
			if((zero_cnt>80)&&(zero_cnt<150))	{
				plazma_SS++;
				if((wrk_stat==wsON)&&(!bERR)) {
					opto_cnt=1500;
					if(EE_REMAIN_BALLS) {
						EE_REMAIN_BALLS--;
					}
				}
			}
		}
		zero_cnt=0;
		
		bLINE_OLD=1;
		bIN_OLD=1;
	}
	else	{
		if(bLINE_OLD)connect_cnt=1500;
		if(zero_cnt<30000) {
			zero_cnt++;
		}

	bLINE_OLD=0;	
	bIN_OLD=0;
	}
	
	GPIOD->DDR&=~(1<<1);	
	GPIOD->CR1|=(1<<1);
	GPIOD->CR2&=~(1<<1);

	if(connect_cnt) {
		connect_cnt--;
		bERR=0;
	}
	else bERR=1;
}
//-----------------------------------------------
void target_drv (void) {
	char i;
	
	GPIOD->DDR&=~((1<<2)|(1<<3)|(1<<4));	
	GPIOD->CR1|=((1<<2)|(1<<3)|(1<<4));
	GPIOD->CR2&=~((1<<2)|(1<<3)|(1<<4));
	
	target_plazma=(GPIOD->IDR); 
	
	for(i=0;i<3;i++) {
		if(!((GPIOD->IDR)&(1<<(4-i)))) {
			if(target_cnt[i]<1000) target_cnt[i]++;
			if((target_cnt[i]==5)&& (!target_cnt_off[i])) {
				target_on[i]=1;
				if(i==0)
					{
					target_cnt[1]=0;
					target_cnt[2]=0;					
					}
				else if(i==1)
					{
					target_cnt[0]=0;
					target_cnt[2]=0;					
					}
				else if(i==2)
					{
					target_cnt[0]=0;
					target_cnt[1]=0;					
					}
					
					
				target_cnt_off[0]=1000;
				target_cnt_off[1]=1000;
				target_cnt_off[2]=1000;
			}
		}
		else {
			target_cnt[i]=0;
			if(target_cnt_off[i])target_cnt_off[i]--;
		}
	}
	
	if(opto_cnt) opto_cnt--;

	if(fire_cnt) {
		fire_cnt--;
		if(!fire_cnt) {
			if(EE_REMAIN_BALLS==0) {
			wrk_stat=wsOFF;
			ind=iFin;
			fin_ind_cnt=40;
			}
		}
	}	
}
//-----------------------------------------------
void target_an (void) {
	if((wrk_stat==wsON) && (fire_cnt) && (opto_cnt)){
		if(target_on[0]) EE_BONUS_SIGMA+=5;
		else if(target_on[1]) EE_BONUS_SIGMA+=10;
		else if(target_on[2]) EE_BONUS_SIGMA+=20;
	}
	target_on[0]=0;
	target_on[1]=0;
	target_on[2]=0;
}
//-----------------------------------------------
void rele_drv (void) {
#ifndef FORGSM	
GPIOD->DDR|=(1<<6);	
GPIOD->CR1|=(1<<6);
GPIOD->CR2&=~(1<<6);
	
if(rele_cnt)
	{
	rele_cnt--;
	GPIOD->ODR|=(1<<6);
	}
else GPIOD->ODR&=~(1<<6);
#endif

#ifdef FORGSM	
GPIOB->DDR|=(1<<4);	
GPIOB->CR1|=(1<<4);
GPIOB->CR2&=~(1<<4);
	
if(rele_cnt)
	{
	rele_cnt--;
	GPIOB->ODR|=(1<<4);
	}
else GPIOB->ODR&=~(1<<4);
#endif
}
//-----------------------------------------------
void wrk_hndl (void) {
	if(wrk_cnt) {
		wrk_cnt--;
		if(wrk_cnt==0) {
			wrk_stat=wsOFF;
			if(EE_REMAIN_BALLS==EE_NUM_OF_BALLS)EE_FISK_CNT--;
			EE_REMAIN_BALLS=0;
			ind=iWait;
		}
	}
}
//-----------------------------------------------
long delay_ms(short in) {
long i,ii,iii;

i=((long)in)*100UL;

for(ii=0;ii<i;ii++)
	{
		iii++;
	}

}
//-----------------------------------------------
void gpio_init(void){
	//Стробы индикации
	GPIOB->CR1&=~((1<<0)|(1<<1)|(1<<2)|(1<<3));
	GPIOB->CR2&=~((1<<0)|(1<<1)|(1<<2)|(1<<3));
	GPIOB->DDR|=((1<<0)|(1<<1)|(1<<2)|(1<<3));
	
	//Сегменты индикации
	GPIOC->CR1&=~0xfe;
	GPIOC->CR2&=~0xfe;
	GPIOC->DDR|=0xfe;
	GPIOD->CR1&=~0x01;
	GPIOD->CR2&=~0x01;
	GPIOD->DDR|=0x01;	

#ifdef FORGSM
//вход от гашетки на новом месте 
	GPIOB->DDR&=~(1<<5);	
	GPIOB->CR1|=(1<<5);
	GPIOB->CR2&=~(1<<5);
	
/*	для UARTa GPIOD->DDR&=~(1<<5);	
	GPIOD->CR1|=(1<<5);
	GPIOD->CR2&=~(1<<5);*/
#endif
#ifndef FORGSM
//вход от гашетки
	GPIOD->DDR&=~(1<<5);	
	GPIOD->CR1|=(1<<5);
	GPIOD->CR2&=~(1<<5);
#endif

	GPIOB->DDR&=~(1<<5);	
	GPIOB->CR1|=(1<<5);
	GPIOB->CR2&=~(1<<5);
	
	GPIOB->ODR|=0x0f;
}
//-----------------------------------------------
void t2_init(void){
	TIM2->PSCR = 0;
	TIM2->ARRH= 0x02;
	TIM2->ARRL= 0x00;
	TIM2->CCR1H= 0x00;	
	TIM2->CCR1L= 100;
	TIM2->CCR2H= 0x00;	
	TIM2->CCR2L= 200;
	TIM2->CCR3H= 0x00;	
	TIM2->CCR3L= 200;
	
	//TIM2->CCMR1= ((7<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE; //OC2 toggle mode, prelouded
	TIM2->CCMR2= ((7<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE; //OC2 toggle mode, prelouded
	//TIM2->CCMR3= ((7<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE; //OC2 toggle mode, prelouded
	/*TIM2->CCER2= TIM2_CCER2_CC3E | TIM2_CCER2_CC3P; //OC1, OC2 output pins enabled*/
	//TIM2->CCER1= 0xff;//TIM2_CCER2_CC3E | TIM2_CCER2_CC3P; //OC1, OC2 output pins enabled
	//TIM2->CCER2= TIM2_CCER2_CC3E | TIM2_CCER2_CC3P; //OC1, OC2 output pins enabled
	
	TIM2->CR1=(TIM2_CR1_CEN | TIM2_CR1_ARPE);	
	
}
#define AUTORELOAD	8000000/19000
//-----------------------------------------------
void t1_init(void){
	TIM1->ARRH= (u8)(AUTORELOAD >> 8);			// init pulse period - auto reload register
	TIM1->ARRL= (u8)(AUTORELOAD);
	TIM1->CCR1H= (u8)((AUTORELOAD/4) >> 8);	// init pulse wide (50% duty cycle) - compare register
	TIM1->CCR1L= (u8)(AUTORELOAD/4);
	TIM1->CCR2H= (u8)((AUTORELOAD/8) >> 8);	// init pulse wide (50% duty cycle) - compare register
	TIM1->CCR2L= (u8)(AUTORELOAD/8);

	TIM1->CCR3H= (u8)((AUTORELOAD/8) >> 8);	// init pulse wide (50% duty cycle) - compare register
	TIM1->CCR3L= (u8)(AUTORELOAD/8);

	TIM1->CCR4H= (u8)((AUTORELOAD/8) >> 8);	// init pulse wide (50% duty cycle) - compare register
	TIM1->CCR4L= (u8)(AUTORELOAD/8);


	TIM1->CCMR1= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
	TIM1->CCMR2= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
	TIM1->CCMR3= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
	TIM1->CCMR4= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1


	//TIM1->CCER1 = TIM1_CCER1_CC1E;
	TIM1->CCER1 = 0xff;//TIM1_CCER1_CC2E|TIM1_CCER1_CC1E|TIM1_CCER1_CC2P|TIM1_CCER1_CC1P;	// OC1 enable output pin
	//TIM1->BKR|= TIM1_BKR_AOE | TIM1_BKR_OSSR | TIM1_BKR_BKE;	// break and automatic output control modes enable
	TIM1->CCER2 = 0xff;
	TIM1->BKR= 0x80;
	TIM1->IER|= TIM1_IER_UIE;					// enable break interrupt
	//TIM1->CR2=5;
	TIM1->CR1= TIM4_CR1_URS|TIM1_CR1_CEN| TIM1_CR1_ARPE;					// timer 1 enable
	//TIM1->EGR=1<<6;
	
}
//-----------------------------------------------
void spi_init(void){
	SPI->CR1= /*SPI_CR1_LSBFIRST |*/
			SPI_CR1_SPE | 
			( (3<< 2) & SPI_CR1_BR ) |
			SPI_CR1_MSTR |
			SPI_CR1_CPOL |
			SPI_CR1_CPHA; 
			
	SPI->CR2= SPI_CR2_SSM | SPI_CR2_SSI;
	SPI->ICR= 0;	
}
//-----------------------------------------------
char spi(char in){
	char c;
	while(!((SPI->SR)&SPI_SR_TXE));
	SPI->DR=in;
	while(!((SPI->SR)&SPI_SR_RXNE));
	c=SPI->DR;	
	return c;
}
//-----------------------------------------------
void t4_init(void){
	TIM4->PSCR = 7;
	TIM4->ARR= 123;
	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
	
	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
	
}
//***********************************************
//***********************************************
//***********************************************
//***********************************************
@far @interrupt void TIM4_UPD_Interrupt (void) {

	ind_cnt++;
	if(ind_cnt>=10)ind_cnt=0;
	GPIOB->ODR|=0x0f;
	if(ind_cnt<4){
		GPIOC->ODR|=0xfe;
		GPIOD->ODR|=0x01;
		GPIOC->ODR&=ind_out[3-ind_cnt]|0x01;
		GPIOD->ODR&=ind_out[3-ind_cnt]|0xfe;
		
		GPIOB->ODR&=~(1<<ind_cnt);
	}
			
	b1000Hz=1;
	if(++t0_cnt0>=10){
    		t0_cnt0=0;
    		b100Hz=1;

		if(++t0_cnt1>=10){
			t0_cnt1=0;
			b10Hz=1;
			//GPIOB->ODR^=0xff;
		}
		
		if(++t0_cnt2>=20){
			t0_cnt2=0;
			b5Hz=1;
			bFL5=!bFL5;
		}

		if(++t0_cnt3>=50){
			t0_cnt3=0;
			b2Hz=1;
			bFL2=!bFL2;		
		}

		if(++t0_cnt4>=100){
			t0_cnt4=0;
			b1Hz=1;
			bFL1=!bFL1;
		}
	}

	if(!(GPIOB->IDR&(1<<5))) {
		/*EE_PLAZMA=t0_cnt1;//*/ind_on_cnt=50;
		if(!cnt_bKEY) {
			bKEY=1;
			cnt_bKEY=50;
		}
	}
	else {
		if(cnt_bKEY)cnt_bKEY--;
	}
	
	if(zatvor_cnt) zatvor_cnt--;

#ifndef FORGSM
if(!(GPIOD->IDR&(1<<5))) 
#endif
#ifdef FORGSM
if(!(GPIOB->IDR&(1<<5))) 
#endif
	{
	if(!cnt_bFIRE) 
		{
		bFIRE=1;
		cnt_bFIRE=50;
		}
	}                       
else 
	{
	if(cnt_bFIRE)cnt_bFIRE--;
	bZATVOR=0;
	but_cnt=0;
	}

#ifndef FORGSM
if(!(GPIOD->IDR&(1<<5))) 
#endif
#ifdef FORGSM
if(!(GPIOB->IDR&(1<<5))) 
#endif
	{
	cnt_bFIRE_++;
	if(cnt_bFIRE_>2000) 
		{
		bFIRE_=1;
		bFIRE_BLOCK=1;
		cnt_bFIRE_=0;
		}
	}                       
else 
	{
	cnt_bFIRE_=0;
	}

#ifndef FORGSM
if((!(GPIOD->IDR&(1<<5)))&& (!bFIRE_BLOCK)) 
#endif
#ifdef FORGSM
if((!(GPIOB->IDR&(1<<5)))&& (!bFIRE_BLOCK)) 
#endif
	{
	cnt_bFIRE1++;
	if(cnt_bFIRE1>=50) 
		{
		cnt_bFIRE1=50;
		}
	}                       
else 
	{
	if(cnt_bFIRE1>=50) 
		{
		bFIRE1=1;
		cnt_bFIRE1=0;
		}
	}

#ifndef FORGSM
if(GPIOD->IDR&(1<<5)) bFIRE_BLOCK=0;
#endif
#ifdef FORGSM
if(GPIOB->IDR&(1<<5)) bFIRE_BLOCK=0;
#endif 
	
TIM4->SR1&=~TIM4_SR1_UIF;			// disable break interrupt
return;
}
//***********************************************
@far @interrupt void TIM1_Ovf_Interrupt (void) {
	GPIOD->ODR^=(1<<3)|(1<<4);
	TIM1->SR1&=~TIM1_SR1_UIF;			
}

//***********************************************
@far @interrupt void UARTTxInterrupt (void) {

	if (tx_counter){
		--tx_counter;
		UART1->DR=tx_buffer[tx_rd_index];
		if (++tx_rd_index == TX_BUFFER_SIZE) tx_rd_index=0;
	}
	else {
		bOUT_FREE=1;
		UART1->CR2&= ~UART1_CR2_TIEN;
	}
}

//***********************************************
@far @interrupt void UARTRxInterrupt (void) {

	//char status=0,data=0;
	
	//GPIOD->ODR^=(1<<4);
	rx_status=UART1->SR;
	rx_data=UART1->DR;
	
	if (rx_status & (UART1_SR_RXNE)){
		rx_buffer[rx_wr_index]=rx_data;
		bRXIN=1;
		if (++rx_wr_index == RX_BUFFER_SIZE) rx_wr_index=0;
		if (++rx_counter == RX_BUFFER_SIZE){
			rx_counter=0;
			rx_buffer_overflow=1;
		}
	}
}

//===============================================
//===============================================
//===============================================
//===============================================
main(){
	CLK->CKDIVR=0;
	
	gpio_init();
	//_init();
	//t2_init();
	
	FLASH_DUKR=0xae;
	FLASH_DUKR=0x56;	

	//rx_plazma=aaa;
	
/*	GPIOC->CR1|=(1<<1);
	GPIOC->DDR|=(1<<1);
	GPIOC->ODR|=(1<<1);
		//GPIOC->CR2&=~(1<<5);
	GPIOC->CR1|=(1<<2);
	GPIOC->DDR|=(1<<2);
	GPIOC->ODR|=(1<<2);
	//GPIOC->CR2&=~(1<<2);
	GPIOC->CR1|=(1<<3);
	GPIOC->DDR|=(1<<3);
	GPIOC->ODR|=(1<<3);
	//GPIOC->CR2&=~(1<<3);
	GPIOC->CR1|=(1<<4);
	GPIOC->DDR|=(1<<4);
	GPIOC->ODR|=(1<<4);

	GPIOB->DDR|=(1<<0);
	GPIOB->CR1|=(1<<0);
	GPIOB->CR2&=~(1<<0);
	
	GPIOB->DDR|=(1<<1);
	GPIOB->CR1|=(1<<1);
	GPIOB->CR2&=~(1<<1);

	GPIOB->DDR|=(1<<2);
	GPIOB->CR1|=(1<<2);
	GPIOB->CR2&=~(1<<2);


	GPIOD->DDR|=(1<<3);
	GPIOD->CR1|=(1<<3);
	GPIOD->CR2&=~(1<<3);

	GPIOD->DDR|=(1<<4);
	GPIOD->CR1|=(1<<4);
	GPIOD->CR2&=~(1<<4);

GPIOF->CR1&=~(1<<4);
GPIOF->CR2&=~(1<<4);
GPIOF->DDR|=(1<<4);*/
	if(EE_REMAIN_BALLS) {
		//wrk_stat=wsON;
		//wrk_cnt=120;
		//ind=iWrk;
		ind=iWait1;
		ret_ind=iWait2;
		ret_cnt1=1200;
	}
	else in_button();
	//ind=iWait2;
	//ind=iMn;
	//ind=iDeb;
	
	t4_init();
	enableInterrupts();	

#ifdef FORGSM
uart_init();
#endif


while (1)
	{
	if(bRXIN)	
		{
		bRXIN=0;
			
		uart_in();
		}

	if(b1000Hz)
		{
		b1000Hz=0;
		opto_drv();
		target_drv();
		target_an();
		rele_drv();
		if(not_fire_cnt)not_fire_cnt--;
		}  	
		
	if(b100Hz)
		{
		b100Hz=0;
			
		ibatton_drv();
		ibatton_an();
		but_an();
		}  
      	
	if(b10Hz)
		{
		b10Hz=0;
			//DF_status_read();
			
		ind_hndl();
		if(ret_cnt)
			{
			ret_cnt--;
			if(ret_cnt==0)
				{
				ind=ret_ind;
				}
			}
		if(ret_cnt1)
			{
			ret_cnt1--;
			if(ret_cnt1==0)
				{
				ind=iWait2;
				EE_FISK_CNT1++;
				if(EE_FISK_CNT1>=100)EE_FISK_CNT1=0;
				EE_REMAIN_BALLS=0;
				ret_cnt=0;
				}
			}
			
		}
      	 
	if(b5Hz)
		{
		b5Hz=0;
		//GPIOF->ODR^=(1<<4);	
		}
		
	if(b2Hz)
		{
		b2Hz=0;
			
		}      

	if(b1Hz)
		{
		char *uart_buff;
		b1Hz=0;
		
		
		//putchar('A');
		
		uart_buff="Hello %d,%x,%d,%d,%x\r\n";
		//printf(uart_buff,plazma[0],plazma[1],plazma[2],plazma[3]++,plazma[4]);
		puts("Hello"+itoa(plazma[0]));
		
		wrk_hndl();
			
		}      	     	      
	}
}