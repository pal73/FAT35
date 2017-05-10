extern char res[8];
extern short ibatton_repeat_cnt;
extern long ibatton_new,ibatton_old,ibatton;
extern char ibatton_n,ibatton_n_;
extern char ibatton_plazma[2];
 
 void ibatton_drv(void);
void ibatton_an(void);
 char ibatton_polling(void);
 char ibatton_read_rom(void);
 char ibatton_w1ts(void);
 char ibatton_w0ts(void);
 char ibatton_rts(void);
 void ibatton_send_byte(char in);
 char ibatton_read_byte(void);