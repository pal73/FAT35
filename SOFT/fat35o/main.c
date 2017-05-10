#include "stm8s.h"
#include "cmd.c"
#include <iostm8s103.h>


@near bool b100Hz=0,b10Hz=0,b5Hz=0,b1Hz=0;
@near static char t0_cnt0=0,t0_cnt1=0,t0_cnt2=0,t0_cnt3=0;

@near bool bSTART;
@near char rx_plazma;
//char tx_buffer[30]={1,2,3,4,5,6,7,8};
char spi(char in);

unsigned short one_cnt,zero_cnt;
bool bIN_OLD,bREADY,bOPTO_ERR,bTR; 
signed short int opto_err_cnt;
short out_cnt;


@eeprom char aaa;

//-----------------------------------------------
long delay_ms(short in)
{
long i,ii,iii;

i=((long)in)*100UL;

for(ii=0;ii<i;ii++)
	{
		iii++;
	}

}


//-----------------------------------------------
void gpio_init(void){
	GPIOD->DDR&=~(1<<4);
	GPIOD->CR1|=(1<<4);
	GPIOD->CR2&=~(1<<4);
	
	GPIOC->DDR|=(1<<5);
	GPIOC->CR1|=(1<<5);
	GPIOC->CR2&=~(1<<5);	
}

#define AUTORELOAD2	8000000*100/18500
//-----------------------------------------------
void t2_init(void){
	TIM2->PSCR = 0;
	TIM2->ARRH= (u8)(AUTORELOAD2 >> 8);
	TIM2->ARRL= (u8)(AUTORELOAD2);
	TIM2->CCR1H= (u8)(AUTORELOAD2/2 >> 8);	
	TIM2->CCR1L= (u8)(AUTORELOAD2/2);
	
	TIM2->CCMR1= ((6<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE; //OC2 toggle mode, prelouded
	///TIM2->CCMR2= ((7<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE; //OC2 toggle mode, prelouded
	///TIM2->CCMR3= ((7<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE; //OC2 toggle mode, prelouded
	/*TIM2->CCER2= TIM2_CCER2_CC3E | TIM2_CCER2_CC3P; //OC1, OC2 output pins enabled*/
	TIM2->CCER1= TIM2_CCER1_CC1E; //OC1, OC2 output pins enabled
	///TIM2->CCER2= TIM2_CCER2_CC3E | TIM2_CCER2_CC3P; //OC1, OC2 output pins enabled
	
	TIM2->CR1=(TIM2_CR1_CEN | TIM2_CR1_ARPE);	
	
}

#define AUTORELOAD	8000000/18500

//-----------------------------------------------
void t1_init(void){
	TIM1->ARRH= (u8)(AUTORELOAD >> 8);			// init pulse period - auto reload register
	TIM1->ARRL= (u8)(AUTORELOAD);
	TIM1->CCR1H= (u8)((AUTORELOAD/2) >> 8);	// init pulse wide (50% duty cycle) - compare register
	TIM1->CCR1L= (u8)(AUTORELOAD/2);
	TIM1->CCR2H= (u8)((AUTORELOAD/2) >> 8);	// init pulse wide (50% duty cycle) - compare register
	TIM1->CCR2L= (u8)(AUTORELOAD/2);

	TIM1->CCMR1= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
	TIM1->CCMR2= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
//	TIM1->CCMR3= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
//	TIM1->CCMR4= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1


	TIM1->CCER1 = TIM1_CCER1_CC1E|TIM1_CCER1_CC2E;
	//TIM1->CCER1 = 0xff;//TIM1_CCER1_CC2E|TIM1_CCER1_CC1E|TIM1_CCER1_CC2P|TIM1_CCER1_CC1P;	// OC1 enable output pin
	//TIM1->BKR|= TIM1_BKR_AOE | TIM1_BKR_OSSR | TIM1_BKR_BKE;	// break and automatic output control modes enable
	//TIM1->CCER2 = 0xff;
	TIM1->BKR= 0x80;

///TIM1->CCMR1= ((7<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
	///TIM1->CCMR2= ((7<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE;	// OC1 PWM output compare mode 1
	
	
	//TIM1->CCER1 = TIM1_CCER1_CC1E;
	///TIM1->CCER1 = 0xff;//TIM1_CCER1_CC2E|TIM1_CCER1_CC1E|TIM1_CCER1_CC2P|TIM1_CCER1_CC1P;	// OC1 enable output pin
	//TIM1->BKR|= TIM1_BKR_AOE | TIM1_BKR_OSSR | TIM1_BKR_BKE;	// break and automatic output control modes enable
	///TIM1->CCER2 = 0xff;
	TIM1->IER|= TIM1_IER_UIE;					// enable break interrupt
	
	TIM1->CR1|= TIM4_CR1_URS|TIM1_CR1_CEN| TIM1_CR1_ARPE;					// timer 1 enable
	
	
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
	TIM4->PSCR = 3;
	TIM4->ARR= 158;
	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
	
	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
	
}

//***********************************************
//***********************************************
//***********************************************
//***********************************************
@far @interrupt void TIM1_Ovf_Interrupt (void) {

//GPIOC->ODR^=(1<<5);

	if(!((GPIOD->IDR)&(1<<4)))	{
		if(bIN_OLD){
			if((one_cnt>20)&&(one_cnt<310)&&bREADY&&(!out_cnt))out_cnt=4000;
		}
	
		if(zero_cnt<30000){
			zero_cnt++;
			bREADY=0;
		}
		else bREADY=1;
		one_cnt=0;
	
		opto_err_cnt=0;
		bOPTO_ERR=0;
		bIN_OLD=0;
	}
	
	else {
		if(one_cnt<30000){
			one_cnt++;
		}
		zero_cnt=0;
		
		if((opto_err_cnt<5000)) {
			bOPTO_ERR=0;
			opto_err_cnt++;
		}
		else bOPTO_ERR=1; 
	
		bIN_OLD=1;
			
	}
	
	if((bOPTO_ERR)||(out_cnt)){
		TIM2->CCMR1= ((4<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE;	
		}
	else TIM2->CCMR1= ((6<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE;	
	if(out_cnt)out_cnt--;

	TIM1->SR1&=~TIM1_SR1_UIF;			// disable break interrupt
}

//***********************************************
@far @interrupt void TIM4_UPD_Interrupt (void) {

if(++t0_cnt0>=125){
    		t0_cnt0=0;
    		b100Hz=1;

		if(++t0_cnt1>=10){
			t0_cnt1=0;
			b10Hz=1;
			GPIOB->ODR^=0xff;
		}
		
		if(++t0_cnt2>=20){
			t0_cnt2=0;
			b5Hz=1;
		}
		
		if(++t0_cnt3>=100){
			t0_cnt3=0;
			b1Hz=1;
		}
	}

	



	
/*	if(bi)
		{
		bi=0;
		}
	else 
		{
		bi=1;
		}*/

		//switch_LED_on;					// NO - switch LEDs on
		TIM4->SR1&=~TIM4_SR1_UIF;			// disable break interrupt
	return;
}

//===============================================
//===============================================
//===============================================
//===============================================
main(){
	CLK->CKDIVR=0;

	gpio_init();
	t1_init();
	t2_init();
	t4_init();

	enableInterrupts();	
	//rx_plazma=aaa;


	
	while (1){
		
	
		
		if(b100Hz){
			b100Hz=0;
			//GPIOC->ODR^=(1<<7);
			
/*						bTR=!bTR;
		
		if(bTR){
		TIM2->CCMR1= ((4<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE;	
		}
		else TIM2->CCMR1= ((6<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE;*/

			
      	}  
      	
		if(b10Hz){
			b10Hz=0;
			//DF_status_read();
      	}
      	 
		if(b5Hz){
			b5Hz=0;
			
		}
      	      	
		if(b1Hz){
			b1Hz=0;
      	//bOPTO_ERR=0;
		//out_cnt=0;
		//TIM2->CCMR1= ((6<<4) & TIM2_CCMR_OCM) | TIM2_CCMR_OCxPE;
		}      	     	      
	}
}