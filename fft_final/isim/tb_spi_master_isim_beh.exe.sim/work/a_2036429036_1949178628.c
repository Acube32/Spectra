/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
extern char *IEEE_P_2592010699;
static const char *ng1 = "/home/ise/Desktop/fft_direct/tb_spi_master.vhd";

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


void work_a_2036429036_1949178628_sub_15310425134914526866_1207921752(char *t0, char *t1, char *t2, char *t3, unsigned int t4, unsigned int t5, char *t6, char *t7, unsigned int t8, unsigned int t9, char *t10)
{
    char t12[24];
    char t13[16];
    char t18[16];
    char *t14;
    char *t15;
    int t16;
    unsigned int t17;
    char *t19;
    int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    unsigned char t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;

LAB0:    t14 = (t13 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 15;
    t15 = (t14 + 4U);
    *((int *)t15) = 0;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t16 = (0 - 15);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t17;
    t15 = (t18 + 0U);
    t19 = (t15 + 0U);
    *((int *)t19) = 15;
    t19 = (t15 + 4U);
    *((int *)t19) = 0;
    t19 = (t15 + 8U);
    *((int *)t19) = -1;
    t20 = (0 - 15);
    t17 = (t20 * -1);
    t17 = (t17 + 1);
    t19 = (t15 + 12U);
    *((unsigned int *)t19) = t17;
    t19 = (t12 + 4U);
    t21 = (t2 != 0);
    if (t21 == 1)
        goto LAB3;

LAB2:    t22 = (t12 + 12U);
    *((char **)t22) = t13;
    t23 = (t0 + 1312U);
    xsi_add_dynamic_wait(t1, t23, -1, -1);

LAB7:    t24 = (t1 + 224U);
    t24 = *((char **)t24);
    xsi_wp_set_status(t24, 1);
    t25 = (t1 + 88U);
    t26 = *((char **)t25);
    t27 = (t26 + 1888U);
    *((unsigned int *)t27) = 1U;
    t28 = (t1 + 88U);
    t29 = *((char **)t28);
    t30 = (t29 + 0U);
    getcontext(t30);
    t31 = (t1 + 88U);
    t32 = *((char **)t31);
    t33 = (t32 + 1888U);
    t17 = *((unsigned int *)t33);
    if (t17 == 1)
        goto LAB8;

LAB9:    t34 = (t1 + 88U);
    t35 = *((char **)t34);
    t36 = (t35 + 1888U);
    *((unsigned int *)t36) = 3U;

LAB5:
LAB6:    t37 = (t0 + 1312U);
    t38 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t37, 0U, 0U);
    if (t38 == 1)
        goto LAB4;
    else
        goto LAB7;

LAB3:    *((char **)t19) = t2;
    goto LAB2;

LAB4:    xsi_remove_dynamic_wait(t1, t23);
    t17 = (0 + t4);
    t14 = (t6 + 56U);
    t15 = *((char **)t14);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    t25 = (t18 + 12U);
    t39 = *((unsigned int *)t25);
    t39 = (t39 * 1U);
    memcpy(t24, t2, t39);
    t26 = (t18 + 12U);
    t40 = *((unsigned int *)t26);
    t41 = (1U * t40);
    xsi_driver_first_trans_delta(t6, t17, t41, 0LL);
    t17 = (0 + t8);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)3;
    xsi_driver_first_trans_delta(t10, t17, 1, 0LL);
    t14 = (t0 + 1312U);
    xsi_add_dynamic_wait(t1, t14, -1, -1);

LAB13:    t15 = (t1 + 224U);
    t15 = *((char **)t15);
    xsi_wp_set_status(t15, 1);
    t23 = (t1 + 88U);
    t24 = *((char **)t23);
    t25 = (t24 + 1888U);
    *((unsigned int *)t25) = 1U;
    t26 = (t1 + 88U);
    t27 = *((char **)t26);
    t28 = (t27 + 0U);
    getcontext(t28);
    t29 = (t1 + 88U);
    t30 = *((char **)t29);
    t31 = (t30 + 1888U);
    t17 = *((unsigned int *)t31);
    if (t17 == 1)
        goto LAB14;

LAB15:    t32 = (t1 + 88U);
    t33 = *((char **)t32);
    t34 = (t33 + 1888U);
    *((unsigned int *)t34) = 3U;

LAB11:
LAB12:    t35 = (t0 + 1312U);
    t21 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t35, 0U, 0U);
    if (t21 == 1)
        goto LAB10;
    else
        goto LAB13;

LAB8:    xsi_saveStackAndSuspend(t1);
    goto LAB9;

LAB10:    xsi_remove_dynamic_wait(t1, t14);
    t17 = (0 + t8);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, t17, 1, 0LL);
    t14 = (t0 + 2112U);
    xsi_add_dynamic_wait(t1, t14, -1, -1);

LAB19:    t15 = (t1 + 224U);
    t15 = *((char **)t15);
    xsi_wp_set_status(t15, 1);
    t23 = (t1 + 88U);
    t24 = *((char **)t23);
    t25 = (t24 + 1888U);
    *((unsigned int *)t25) = 1U;
    t26 = (t1 + 88U);
    t27 = *((char **)t26);
    t28 = (t27 + 0U);
    getcontext(t28);
    t29 = (t1 + 88U);
    t30 = *((char **)t29);
    t31 = (t30 + 1888U);
    t17 = *((unsigned int *)t31);
    if (t17 == 1)
        goto LAB20;

LAB21:    t32 = (t1 + 88U);
    t33 = *((char **)t32);
    t34 = (t33 + 1888U);
    *((unsigned int *)t34) = 3U;

LAB17:
LAB18:    t35 = (t0 + 2112U);
    t21 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t35, 0U, 0U);
    if (t21 == 1)
        goto LAB16;
    else
        goto LAB19;

LAB14:    xsi_saveStackAndSuspend(t1);
    goto LAB15;

LAB16:    xsi_remove_dynamic_wait(t1, t14);

LAB1:    return;
LAB20:    xsi_saveStackAndSuspend(t1);
    goto LAB21;

}

static void work_a_2036429036_1949178628_p_0(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(46, ng1);

LAB3:    t1 = (2 * 1000LL);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t4);
    t2 = (t0 + 4512);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t10 = (t0 + 4512);
    xsi_driver_intertial_reject(t10, t1, t1);

LAB2:    t11 = (t0 + 4432);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2036429036_1949178628_p_1(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 4112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(72, ng1);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(73, ng1);
    t2 = (t0 + 4576);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(74, ng1);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t3);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(75, ng1);
    t2 = (t0 + 4576);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(78, ng1);
    t2 = (t0 + 3920);
    t4 = (t0 + 7176);
    t6 = (t0 + 1632U);
    t7 = (t0 + 4640);
    t8 = (t0 + 1792U);
    t9 = (t0 + 4704);
    work_a_2036429036_1949178628_sub_15310425134914526866_1207921752(t0, t2, t4, t6, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(82, ng1);
    t2 = (t0 + 3920);
    t4 = (t0 + 7192);
    t6 = (t0 + 1632U);
    t7 = (t0 + 4640);
    t8 = (t0 + 1792U);
    t9 = (t0 + 4704);
    work_a_2036429036_1949178628_sub_15310425134914526866_1207921752(t0, t2, t4, t6, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(85, ng1);
    t2 = (t0 + 3920);
    t4 = (t0 + 7208);
    t6 = (t0 + 1632U);
    t7 = (t0 + 4640);
    t8 = (t0 + 1792U);
    t9 = (t0 + 4704);
    work_a_2036429036_1949178628_sub_15310425134914526866_1207921752(t0, t2, t4, t6, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(87, ng1);
    t3 = (50 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t3);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(88, ng1);
    if ((unsigned char)0 == 0)
        goto LAB16;

LAB17:    goto LAB2;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    t2 = (t0 + 7224);
    xsi_report(t2, 13U, (unsigned char)3);
    goto LAB17;

}


extern void work_a_2036429036_1949178628_init()
{
	static char *pe[] = {(void *)work_a_2036429036_1949178628_p_0,(void *)work_a_2036429036_1949178628_p_1};
	static char *se[] = {(void *)work_a_2036429036_1949178628_sub_15310425134914526866_1207921752};
	xsi_register_didat("work_a_2036429036_1949178628", "isim/tb_spi_master_isim_beh.exe.sim/work/a_2036429036_1949178628.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
