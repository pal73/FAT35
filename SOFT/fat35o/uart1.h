#define TX_BUFFER_SIZE 80
#define RX_BUFFER_SIZE 80

 extern char UIB[80];
//extern char UOB[40];
@near extern char bOUT_FREE;
extern char tx_buffer[TX_BUFFER_SIZE];
@near extern unsigned char tx_wr_index,tx_rd_index,tx_counter;
@near extern char bRXIN;
extern char flag;
extern char rx_buffer[RX_BUFFER_SIZE];
@near extern unsigned char rx_wr_index,rx_rd_index,rx_counter;
@near extern char rx_buffer_overflow;

//-----------------------------------------------
void uart_init (void);
//-----------------------------------------------
void uart_out (char num,char data0,char data1,char data2,char data3,char data4,char data5);
//-----------------------------------------------
void uart_out_adr (char *ptr, char len);
//-----------------------------------------------
void putchar(char c);
//-----------------------------------------------
#ifdef _COSMIC_
@far @interrupt void UARTTxInterrupt (void);
#else
void UARTTxInterrupt (void) interrupt 20 ;
#endif
//-----------------------------------------------
#ifdef _COSMIC_
@far @interrupt void UARTRxInterrupt (void);
#else
void UARTRxInterrupt (void) interrupt 21;
#endif
//-----------------------------------------------
void uart_in(void);
//-----------------------------------------------
void uart_in_an(void);
//-----------------------------------------------
void uart_out_adr_block (unsigned long adress,char *ptr, char len);
