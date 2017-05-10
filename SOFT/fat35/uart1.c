#include "stm8s.h"
#include "uart1.h"
#include "cmd.c"
#include "main.h"

char UIB[80]={0,0,0,0,0,0,0,0,0,0};
//char UOB[40]={0};
@near char bOUT_FREE=0;

@near unsigned char tx_wr_index=0,tx_rd_index=0,tx_counter=0;
char tx_buffer[TX_BUFFER_SIZE]={0};
@near char bRXIN=0;
char flag=0;
char rx_buffer[RX_BUFFER_SIZE]={0};
@near unsigned char rx_wr_index=0,rx_rd_index=0,rx_counter=0;
@near char rx_buffer_overflow=0;


//-----------------------------------------------
void uart_init (void){
	UART1->CR1&=~UART1_CR1_M;					
	UART1->CR3|= (0<<4) & UART1_CR3_STOP;	
	//9600
	//UART1->BRR2= 0x03;
	//UART1->BRR1= 0x68;
	//38400
	UART1->BRR2= 0x01;
	UART1->BRR1= 0x1A;
	UART1->CR2|= UART1_CR2_TEN | UART1_CR2_REN | UART1_CR2_RIEN;	
}

//-----------------------------------------------
void uart_out (char num,char data0,char data1,char data2,char data3,char data4,char data5){
	char i=0,t=0;

	i=num;
	
	t^=data0;
	putchar(data0);
	i--;
	
	if(i){
		t^=data1;
		putchar(data1);
		i--;
	}

	if(i){
		t^=data2;
		putchar(data2);
		i--;
	}

	if(i){
		t^=data3;
		putchar(data3);
		i--;
	}
	
	if(i){
		t^=data4;
		putchar(data4);
		i--;
	}

	if(i){
		t^=data5;
		putchar(data5);
		i--;
	}

	putchar(num);
	t^=num;
	putchar(t);
	putchar(0x0a);
	bOUT_FREE=0;	
 	
}

//-----------------------------------------------
void uart_out_adr (char *ptr, char len)
{
char i11=0,temp11=0,t=0;
t=0;
temp11=0;


for(i11=0;i11<len;i11++)
	{
	temp11=ptr[i11];
	t^=temp11;
	putchar(temp11);
	}
	
putchar(len);
t^=len;
putchar(t);

putchar(0x0a);
	
bOUT_FREE=0;
	   
}

//-----------------------------------------------
void uart_out_adr_block (unsigned long adress,char *ptr, char len)
{
char temp11,t,i11;	
t=0;
temp11=CMND;
t^=temp11;
putchar(temp11);

temp11=10;
t^=temp11;
putchar(temp11);

temp11=(char)adress;
t^=temp11;
putchar(temp11);

temp11=(char)(adress>>8);
t^=temp11;
putchar(temp11);

temp11=(char)(adress>>16);
t^=temp11;
putchar(temp11);

temp11=(char)(adress>>16);
t^=temp11;
putchar(temp11);


for(i11=0;i11<len;i11++)
	{
	temp11=ptr[i11];
	t^=temp11;
	putchar(temp11);
	}
	
temp11=(len+6);
t^=temp11;
putchar(temp11);

putchar(t);

putchar(0x0a);
	
bOUT_FREE=0;	   
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
#ifdef _COSMIC_
@far @interrupt void UARTTxInterrupt (void) {
#else
void UARTTxInterrupt (void) interrupt 17 {
#endif
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

//-----------------------------------------------
#ifdef _COSMIC_
@far @interrupt void UARTRxInterrupt (void) {
#else
void UARTRxInterrupt (void) interrupt 18 {
#endif

	char status=0,data=0;
	
	rx_plazma++;
	status=UART1->SR;
	data=UART1->DR;
	
	if (status & (UART1_SR_RXNE)){
		rx_buffer[rx_wr_index]=data;
		bRXIN=1;
		if (++rx_wr_index == RX_BUFFER_SIZE) rx_wr_index=0;
		if (++rx_counter == RX_BUFFER_SIZE){
			rx_counter=0;
			rx_buffer_overflow=1;
		}
	}
}

//-----------------------------------------------
void uart_in_an(void)
{
char temp_char,r1;

if(UIB[0]==CMND)
	{
	if(UIB[1]==1)
		{
		long temp_L;
		temp_L=DF_mf_dev_read();
		uart_out (6,CMND,1,aaa/**((char*)&temp_L)*/,*(((char*)&temp_L)+1),*(((char*)&temp_L)+2),*(((char*)&temp_L)+3));
		}  
		
	else if(UIB[1]==2)
		{
		char temp;
		temp=DF_status_read();
		uart_out (3,CMND,2,temp,0,0,0);    
		} 
		
	else if(UIB[1]==3)
		{
		char temp;
		DF_memo_to_256();
		uart_out (2,CMND,3,temp,0,0,0);    
		}				
		
	else if(UIB[1]==4)
		{
		char temp;
		DF_memo_to_256();
		uart_out (2,CMND,3,temp,0,0,0);    
		}				

	else if(UIB[1]==10)
		{
		char temp;
//		DF_page_to_buffer(2,0);
		
		if(UIB[2]==1)DF_buffer_read(0,256, buff);
	    /*	else if(UIB[2]==2)DF_buffer_read(2,0,256, buff);*/
		
	    //	buff[0]=0x55;
		
		uart_out_adr_block (0,buff,64);
		delay_ms(50);    
		uart_out_adr_block (64,&buff[64],64);
		delay_ms(50);    
		uart_out_adr_block (128,&buff[128],64);
		delay_ms(50);    
		uart_out_adr_block (192,&buff[192],64);
		delay_ms(50);    
		}				

	else if(UIB[1]==11)
		{
		char temp;
		unsigned i;
//		DF_page_to_buffer(2,0);
		
		for(i=0;i<256;i++)buff[i]=0;

		if(UIB[2]==1)DF_buffer_write(/*1,*/0,256, buff);
	    /*	else if(UIB[2]==2)DF_buffer_write(2,0,256, buff);*/
		}	
		
	else if(UIB[1]==12)
		{
		char temp;
		unsigned i;

		
		for(i=0;i<256;i++)buff[i]=0;
		
		if(UIB[3]==1)
			{
			buff[0]=0x00;
			buff[1]=0x11;
			buff[2]=0x22;
			buff[3]=0x33;
			buff[4]=0x44;
			buff[5]=0x55;
			buff[6]=0x66;
			buff[7]=0x77;
			buff[8]=0x88;
			buff[9]=0x99;
			buff[10]=0;
			buff[11]=0;
			}

		else if(UIB[3]==2)
			{
			buff[0]=0x00;
			buff[1]=0x10;
			buff[2]=0x20;
			buff[3]=0x30;
			buff[4]=0x40;
			buff[5]=0x50;
			buff[6]=0x60;
			buff[7]=0x70;
			buff[8]=0x80;
			buff[9]=0x90;
			buff[10]=0;
			buff[11]=0;
			}

		else if(UIB[3]==3)
			{
			buff[0]=0x98;
			buff[1]=0x87;
			buff[2]=0x76;
			buff[3]=0x65;
			buff[4]=0x54;
			buff[5]=0x43;
			buff[6]=0x32;
			buff[7]=0x21;
			buff[8]=0x10;
			buff[9]=0x00;
			buff[10]=0;
			buff[11]=0;
			}
		if(UIB[2]==1)DF_buffer_write(/*1,*/0,256, buff);
	    /*	else if(UIB[2]==2)DF_buffer_write(2,0,256, buff);*/
		}
		
	else if(UIB[1]==13)
		{
		char temp;
		unsigned i;
          		
		DF_page_to_buffer(/*UIB[2],*/UIB[3]);
			
		}					

	else if(UIB[1]==14)
		{
		char temp;
		unsigned i;
          		
		DF_buffer_to_page_er(UIB[3]);
			
		}	

	else if(UIB[1]==20)
		{
		char temp;
		unsigned i;
          		
		file_lengt=*((long*)&UIB[2]);
		file_lengt_in_pages=(unsigned short)(((unsigned short)UIB[3])+(((unsigned short)UIB[4])<<8));
		current_page=0;
		current_byte_in_buffer=0;
		
		uart_out (4,CMND,21,*((char*)&current_page),*(((char*)&current_page)+1),0,0);
			
		}
	else if(UIB[1]==21)
		{
		char temp;
		unsigned i;
          
          for(i=0;i<64;i++)
          	{
          	buff[current_byte_in_buffer+i]=UIB[2+i];
          	}                                       
          current_byte_in_buffer+=64;
          if(current_byte_in_buffer>=256)
          	{
          	
      /*    	for(i=0;i<256;i++)
          	{
          	buff[i]=(char)i;
          	}  */ 
          	
          	DF_buffer_write(/*//current_buffer*//*1,*/0,256,buff);
          	DF_buffer_to_page_er(/*///current_buffer*//*1,*/current_page);
			current_page++;
			if(current_page<file_lengt_in_pages)
				{ 
				delay_ms(50);
				uart_out (4,CMND,21,(char)current_page,(char)(current_page>>8),0,0);
				current_byte_in_buffer=0;
			    ///	if(current_buffer==1)current_buffer=2;
			    ///	else current_buffer=1;
				}
			else 
				{
				/// //EE_PAGE_LEN=current_page;
				}
          	}	
          		

			
		}
		
	else if(UIB[1]==30)
		{
		char temp;
		unsigned i;
          
     //     for(i=0;i<256;i++) buff[i]=20/*(char)i*/; 
/*          
          current_page=0;
          last_page=EE_PAGE_LEN-5;
          
          current_buffer_H=2;
          current_buffer_L=2;
          
          DF_page_to_buffer(current_buffer_H,current_page);
          delay_ms(10);
 		DF_buffer_read(current_buffer_L,0,128,buff);
 		delay_ms(10);
		DF_buffer_read(current_buffer_L,128,128,&buff[128]);         
          
          //for(i=0;i<100;i++) buff[i]=240; 
          
          play=1; */ 
          bSTART=1;
          		
/*		file_lengt=*((long*)&UIB[2]);
		file_lengt_in_pages=(unsigned)(file_lengt/256);
		
		current_byte_in_buffer=0;
		current_buffer=1;
		
		usart_out (4,CMND,21,*((char*)&current_page),*(((char*)&current_page)+1),0,0); */
			
		}								
	
	else if(UIB[1]==40)
		{
		char temp;
		unsigned i;
          
/*      
          DF_page_to_buffer(1,*((unsigned*)&UIB[2]));
          delay_ms(10);
 		DF_buffer_read(1,0,128,buff);
 		delay_ms(10);
		DF_buffer_read(1,128,128,&buff[128]);         
          
		usart_out_adr_block (0,buff,64);
		delay_ms(100);    
		usart_out_adr_block (64,&buff[64],64);
		delay_ms(100);    
		usart_out_adr_block (128,&buff[128],64);
		delay_ms(100);    
		usart_out_adr_block (192,&buff[192],64);
		delay_ms(100);    
          
          play=1;*/
		bSTART=1;	
		}								
	}	
}

//-----------------------------------------------
void uart_in(void)
{
char temp,i,count;
//#asm("cli")
if(rx_buffer_overflow)
	{
	rx_wr_index=0;
	rx_rd_index=0;
	rx_counter=0;
	rx_buffer_overflow=0;
	}    
	
if(rx_counter&&(rx_buffer[index_offset(rx_wr_index,-1)])==END)
	{
     temp=rx_buffer[index_offset(rx_wr_index,-3)];
    	if(temp<100) 
    		{
    		if(control_check(index_offset(rx_wr_index,-1)))
    			{
    			rx_rd_index=index_offset(rx_wr_index,-3-temp);
    			for(i=0;i<temp;i++)
				{
				UIB[i]=rx_buffer[index_offset(rx_rd_index,i)];
				} 
			rx_rd_index=rx_wr_index;
			rx_counter=0;
			uart_in_an();

    			}
 	
    		} 
    	}	

//#asm("sei")     
} 

