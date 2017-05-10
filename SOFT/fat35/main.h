
#define SERIAL_NUMBER	1183


#define MY_BUTTON		0x06E84cd6UL

#define __nop() _asm("nop")


@near extern bool b100Hz,b10Hz,b5Hz,b1Hz;
@near extern char t0_cnt0,t0_cnt1,t0_cnt2,t0_cnt3;
@near extern long file_lengt;
@near extern unsigned short file_lengt_in_pages,current_page,last_page,current_byte_in_buffer;
@near extern bool bSTART;
@near extern char buff[256];
typedef enum {iMn,iBtn,iWait,iSet,iWrk,iFin,iFisk,iDeb,iSerNum,iMnBut,iMnButPrl,iDnd,iWait1,iWait2,iFisk1} enum_ind;
extern enum_ind ind,ret_ind;
extern char sub_ind;
extern char fin_ind_cnt;
extern short ret_cnt;
extern char i_ser_num_cnt;

@near extern char rx_plazma;

//-----------------------------------------------
//”правление процессом
typedef enum {wsOFF,wsON} enum_wrk_stat;
extern enum_wrk_stat wrk_stat;
extern short wrk_cnt;

//-----------------------------------------------
//ќпрос мишеней
extern signed short target_cnt[4];
extern signed short target_cnt_off[4];
extern signed char target_on[4];
extern short fire_cnt;

//-----------------------------------------------
//”правление реле
extern signed short rele_cnt;

//-----------------------------------------------
//ќпрос оптобарьера
extern bool bIN_OLD; 
extern bool bLINE_OLD;
extern unsigned short one_cnt,zero_cnt;
extern signed short connect_cnt; 

extern char plazma_ibatton1;
extern char plazma_ibatton2;

@eeprom extern long EE_MAIN_BUTTON;
@eeprom extern long EE_WRK_BUTTON;
@eeprom extern short EE_BONUS_SIGMA;
@eeprom extern short EE_REMAIN_BALLS;
@eeprom extern short EE_PNEVMO_TIME;
@eeprom extern short EE_NUM_OF_BALLS;
@eeprom extern short EE_TARGET_BONUS[5];
@eeprom extern short EE_FISK_CNT;
@eeprom extern short EE_FISK_CNT1;

///extern @eeprom char tyu;

void char2indh_sf(unsigned char in, char start, char fl);
char spi(char in);
long delay_ms(short in);
long DF_mf_dev_read(void);
void DF_memo_to_256(void);
char DF_status_read(void);
void DF_page_to_buffer(unsigned page_addr);
void DF_buffer_to_page_er(unsigned page_addr);
void DF_buffer_read(unsigned buff_addr,unsigned len, char* adr);
void DF_buffer_write(unsigned buff_addr,unsigned len, char* adr);
void DF_buffer_to_page(unsigned page_addr);
void gpio_init(void);
void t2_init(void);
void spi_init(void);
char spi(char in);
void t4_init(void);
char index_offset (signed char index,signed char offset);
char control_check(char index);

@far @interrupt void TIM4_UPD_Interrupt (void);

