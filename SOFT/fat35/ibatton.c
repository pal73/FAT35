#include "stm8s.h"
#include <iostm8s103.h>
#include "ibatton.h"
#include "main.h"
//#include "eeprom_map.h"

char ibatton_n,ibatton_n_;
char res[8];
short ibatton_repeat_cnt,ibatton_not_ready_cnt;
long ibatton_new,ibatton_old,ibatton;

char ibatton_plazma[2];

void uart_out (char num,char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7,char data8,char data9,char data10,char data11,char data12,char data13,char data14);
//extern const char ABCD[16];
extern @near char main_cnt;

//-----------------------------------------------
void ibatton_an(void) {
	if(ibatton_n || ibatton_n_)
		{
		plazma_ibatton1++;
		plazma_ibatton2=(char)ibatton;
		
	/*	if(ibatton_n)
		  {
		  uart_out (15,
			'n',
			'0'+ main_cnt/10,
			'0'+ main_cnt%10,
			' ',
			ABCD[((char)(ibatton>>24))/16],
			ABCD[((char)(ibatton>>24))%16],			
			' ',
			ABCD[((char)(ibatton>>16))/16],
			ABCD[((char)(ibatton>>16))%16],			
			' ',
			ABCD[((char)(ibatton>>8))/16],
			ABCD[((char)(ibatton>>8))%16],
			' ',
			ABCD[((char)(ibatton))/16],
			ABCD[((char)(ibatton))%16]
			);
			
	   }*/
	   
	/*	if(ibatton_n_)
		  {
		  uart_out (15,
			'N',
			'0'+ main_cnt/10,
			'0'+ main_cnt%10,
			' ',
			ABCD[((char)(ibatton>>24))/16],
			ABCD[((char)(ibatton>>24))%16],			
			' ',
			ABCD[((char)(ibatton>>16))/16],
			ABCD[((char)(ibatton>>16))%16],			
			' ',
			ABCD[((char)(ibatton>>8))/16],
			ABCD[((char)(ibatton>>8))%16],
			' ',
			ABCD[((char)(ibatton))/16],
			ABCD[((char)(ibatton))%16]
			);
			
	   }	   */
	}
//char plazma_ibatton2;
	if(ibatton_n && (ibatton==EE_WRK_BUTTON))ibatton_plazma[1]++;
	if(ibatton_n || ibatton_n_) {
		
		if((ind==iMnBut) && (ibatton_n_)) {
			FLASH_DUKR=0xae;
			FLASH_DUKR=0x56;
			EE_MAIN_BUTTON=ibatton;
			EE_WRK_BUTTON=0;
			FLASH_DUKR=0x56;
			FLASH_DUKR=0xae;
			ind=iWait;
		}
		
		else if((ind==iWait) || (ind==iWait2)) {
			if( (ibatton_n_) && (ibatton==EE_MAIN_BUTTON) ) {
				ind=iSet;
				sub_ind=0;
			}
			if( (ibatton==EE_WRK_BUTTON) && ((ibatton_n) || (ibatton_n_)) ) {
				ind=iWrk;
				wrk_stat=wsON;
				wrk_cnt=120;
				EE_REMAIN_BALLS=EE_NUM_OF_BALLS;
				EE_BONUS_SIGMA=0;
				EE_FISK_CNT++;
			}
			if( (ibatton_n_) && (ibatton==MY_BUTTON) ) {
				ind=iSerNum;
				sub_ind=0;
				ret_cnt=50;
				ret_ind=iWait;
			}	

			if( (ibatton_n) && ( (ibatton!=EE_MAIN_BUTTON) || (ibatton!=EE_WRK_BUTTON) ) ) {
				i_ser_num_cnt++;
				if(i_ser_num_cnt>=25) {
					i_ser_num_cnt=0;
					ind=iSerNum;
					sub_ind=0;
					ret_cnt=50;
					ret_ind=iWait;
				}
			}	
			
		}	
		
		else if(ind==iSet) {
			if( (ibatton_n_) && (ibatton==EE_MAIN_BUTTON) ) {
				ind=iWait;
				sub_ind=0;
			}			
			
			else if( (ibatton_n) && (ibatton==EE_MAIN_BUTTON) ) {
				sub_ind++;
				if(sub_ind>=5)sub_ind=0;
			}						

			else if( (sub_ind==3) && (ibatton_n_) && (ibatton!=EE_MAIN_BUTTON) ) {
				EE_WRK_BUTTON=ibatton;
			}

/*			else if( (sub_ind==3) && (bFIRE) ) {
				ind=iFisk;
				fin_ind_cnt=30;
			}*/			

		}		
	}
	
	




ibatton_n=0;
ibatton_n_=0;
}
//-----------------------------------------------
void ibatton_drv(void) {
if(ibatton_not_ready_cnt)ibatton_not_ready_cnt--;
else if(ibatton_polling())
	{
	//ibatton_repeat_cnt++;
	ibatton_read_rom();
	
	//if((res[5]!=0xff)&&(res[6]!=0xff))
	
	/*uart_out (15,
			'x',
			'0'+ main_cnt/10,
			'0'+ main_cnt%10,
			' ',
			ABCD[res[3]/16],
			ABCD[res[3]%16],			
			' ',
			ABCD[res[2]/16],
			ABCD[res[2]%16],			
			' ',
			ABCD[res[1]/16],
			ABCD[res[1]%16],
			' ',
			ABCD[res[0]/16],
			ABCD[res[0]%16]
			);*/
 
	
	
	
	
	ibatton_new=res[1] + (((long)res[2])*256UL) + (((long)res[3])*256UL*256UL) + (((long)res[4])*256UL*256UL*256UL);
/*	if((ibatton_new!=0xffffffff)&&(ibatton_new!=0x00000000)&&(!ibatton_repeat_cnt))
		{
		ibatton=ibatton_new;
		ibatton_n=1;
		}*/
	if((ibatton_new!=0xffffffff)&&(ibatton_new!=0x00000000))
		{
		if(ibatton_new==ibatton_old)
			 {
			ibatton_repeat_cnt++;
			if(ibatton_repeat_cnt>=300)
				{
				ibatton=ibatton_new;
				ibatton_n_=1;
				ibatton_repeat_cnt=0;
				ibatton_not_ready_cnt=100;
				}
			}
		}
	 else if((ibatton_repeat_cnt)&&(ibatton_repeat_cnt<100))
		{
		ibatton=ibatton_old;
		ibatton_n=1;
		ibatton_not_ready_cnt=50;
		}

	ibatton_old=ibatton_new;
	}
else
	{
	if((ibatton_repeat_cnt)&&(ibatton_repeat_cnt<100)&&(ibatton_new!=0xffffffff)&&(ibatton_new!=0x00000000))
		{
		ibatton=ibatton_new;
		ibatton_n=1;
		ibatton_not_ready_cnt=50;
		
		ibatton_plazma[0]++;
		}
	
	ibatton_repeat_cnt=0;
	ibatton_new=0;
	}
}

//-----------------------------------------------
char ibatton_polling(void)
{
short i,ii,num_out;
GPIOF->CR1&=~(1<<4);
GPIOF->CR2&=~(1<<4);
GPIOF->DDR|=(1<<4);


GPIOF->ODR&=~(1<<4);

//импульс сброса 600мкс
for(i=0;i<600;i++)
	{
	__nop();
	}
GPIOF->ODR|=(1<<4);

//выдержка 15мкс
for(i=0;i<15;i++)
	{
	__nop();
	}

//еще 45мкс ждем сигнала от таблетки
for(i=0;i<20;i++)
	{
	__nop();
	__nop();
	__nop();
	if(!(GPIOF->IDR&(1<<4)))goto ibatton_polling_lbl_000;
	}
goto ibatton_polling_lbl_zero_exit;

ibatton_polling_lbl_000:

//измеряем длительность ответного импульса не дольше 300мкс
for(i=0;i<220;i++)
	{
	if(GPIOF->IDR&(1<<4))
		{
		__nop();
		__nop();
		num_out=10;
		goto ibatton_polling_lbl_001;	//continue;
		}
	}
num_out=5;
goto ibatton_polling_lbl_zero_exit;

ibatton_polling_lbl_001:
//выдержка 15мкс
for(i=0;i<30;i++)
	{
	__nop();
	}
ibatton_polling_lbl_success_exit:
/*SET_REG(IO0DIR,0,19,1);
for(i=0;i<800;i++)
	{
	__nop();
	}
SET_REG(IO0DIR,1,19,1);
for(i=0;i<800;i++)
	{
	__nop();
	}
SET_REG(IO0DIR,0,19,1);*/
return 1;
ibatton_polling_lbl_zero_exit:
/*SET_REG(IO0DIR,0,19,1);
for(i=0;i<800;i++)
	{
	__nop();
	}
SET_REG(IO0DIR,1,19,1);
for(i=0;i<160;i++)
	{
	__nop();
	}
SET_REG(IO0DIR,0,19,1); */
return 0;


/*ibatton_polling_lbl_cnt_exit:
SET_REG(LPC_GPIO1->FIODIR,0,10,1);
for(i=0;i<1600;i++)
	{
	__nop();
	}
for(ii=0;ii<num_out;ii++)
	{
	SET_REG(LPC_GPIO1->FIODIR,1,10,1);
	for(i=0;i<160;i++)
		{
		__nop();
		}
	SET_REG(LPC_GPIO1->FIODIR,0,10,1);
	for(i=0;i<160;i++)
		{
		__nop();
		}
	}
return 0;*/

}

//-----------------------------------------------
char ibatton_read_rom(void)
{
ibatton_send_byte(0x0f);

res[0]=ibatton_read_byte();
res[1]=ibatton_read_byte();
res[2]=ibatton_read_byte();
res[3]=ibatton_read_byte();
res[4]=ibatton_read_byte();
res[5]=ibatton_read_byte();
res[6]=ibatton_read_byte();
res[7]=ibatton_read_byte();

if((res[5]==0xff)||(res[6]==0xff))
  {
  res[0]=0;
res[1]=0;
res[2]=0;
res[3]=0;
res[4]=0;
res[5]=0;
res[6]=0;
res[7]=0;  
  }
}


//-----------------------------------------------
char ibatton_w1ts(void)
{
short i,ii,num_out;
GPIOF->DDR|=(1<<4);
GPIOF->ODR&=~(1<<4);

//импульс 10мкс
for(i=0;i<10;i++)
	{
	__nop();
	}
GPIOF->ODR|=(1<<4);

//выдержка 90мкс
for(i=0;i<90;i++)
	{
	__nop();
	}
}

//-----------------------------------------------
char ibatton_w0ts(void)
{
short i,ii,num_out;
GPIOF->DDR|=(1<<4);
GPIOF->ODR&=~(1<<4);

//импульс 90мкс
for(i=0;i<90;i++)
	{
	__nop();
	}
GPIOF->ODR|=(1<<4);

//выдержка 10мкс
for(i=0;i<10;i++)
	{
	__nop();
	}
}

//-----------------------------------------------
void ibatton_send_byte(char in)
{
char i,ii;
ii=in;

for(i=0;i<8;i++)
	{
	if(ii&0x01)ibatton_w1ts();
	else ibatton_w0ts();
	ii>>=1;
	}
}

//-----------------------------------------------
char ibatton_read_byte(void)
{
char i,ii;
ii=0;

for(i=0;i<8;i++)
	{
	ii>>=1;
	if(ibatton_rts())ii|=0x80;
	else ii&=0x7f;
	}
return ii;
}

//-----------------------------------------------
char ibatton_rts(void)
{
short i,ii,num_out;

GPIOF->DDR|=(1<<4);
GPIOF->ODR&=~(1<<4);

//импульс 10мкс
for(i=0;i<2;i++)
	{
	__nop();
	}

GPIOF->ODR|=(1<<4);
//импульс 20мкс
for(i=0;i<10;i++)
	{
	__nop();
	}
if(GPIOF->IDR&(1<<4))	ii=1;
else ii=0;

//выдержка 30мкс
for(i=0;i<50;i++)
	{
	__nop();
	}
return ii;
}