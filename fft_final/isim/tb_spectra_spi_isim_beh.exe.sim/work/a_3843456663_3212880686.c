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
static const char *ng0 = "/home/ise/Desktop/fft_direct/tb_spectra_spi.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3972351953;
extern char *IEEE_P_3499444699;

unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );
char *ieee_p_3499444699_sub_17544701978858283880_3536714472(char *, char *, int , int );
double ieee_p_3972351953_sub_310529332173218681_2984157535(char *, double );


static void work_a_3843456663_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(95, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 7600);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);

LAB2:    t9 = (t0 + 7504);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3843456663_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 6192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 3888U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 6000);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t6 = *((unsigned char *)t3);
    t7 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t6);
    t2 = (t0 + 7664);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t7;
    xsi_driver_first_trans_fast(t2);
    goto LAB2;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

}

static void work_a_3843456663_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 6440U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 3888U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 64);
    t2 = (t0 + 6248);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t6 = *((unsigned char *)t3);
    t7 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t6);
    t2 = (t0 + 7728);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t7;
    xsi_driver_first_trans_fast(t2);
    goto LAB2;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

}

static void work_a_3843456663_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 6688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 3888U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 64);
    t2 = (t0 + 6496);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t6 = *((unsigned char *)t3);
    t7 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t6);
    t2 = (t0 + 7792);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t7;
    xsi_driver_first_trans_fast(t2);
    goto LAB2;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

}

static void work_a_3843456663_3212880686_p_4(char *t0)
{
    char t36[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int t8;
    int t9;
    int t10;
    int t11;
    double t12;
    double t13;
    double t14;
    char *t15;
    int t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    double t22;
    double t23;
    char *t24;
    int t25;
    double t26;
    char *t27;
    char *t28;
    int t29;
    double t30;
    double t31;
    double t32;
    char *t33;
    unsigned char t34;
    unsigned char t35;

LAB0:    t1 = (t0 + 6936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 7856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(126, ng0);
    t7 = (100 * 1000LL);
    t2 = (t0 + 6744);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 7856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 7920);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 4128U);
    t3 = *((char **)t2);
    t8 = *((int *)t3);
    t9 = (t8 - 1);
    t2 = (t0 + 12332);
    *((int *)t2) = 0;
    t4 = (t0 + 12336);
    *((int *)t4) = t9;
    t10 = 0;
    t11 = t9;

LAB8:    if (t10 <= t11)
        goto LAB9;

LAB11:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 8048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(148, ng0);

LAB31:    *((char **)t1) = &&LAB32;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(131, ng0);
    t5 = (t0 + 4848U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    *((double *)t5) = 0.0000000000000000;
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 12340);
    *((int *)t2) = 0;
    t3 = (t0 + 12344);
    *((int *)t3) = 7;
    t8 = 0;
    t9 = 7;

LAB12:    if (t8 <= t9)
        goto LAB13;

LAB15:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 4848U);
    t3 = *((char **)t2);
    t12 = *((double *)t3);
    t13 = (t12 / 8.0000000000000000);
    t2 = (t0 + 4848U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    *((double *)t2) = t13;
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 4848U);
    t3 = *((char **)t2);
    t12 = *((double *)t3);
    t13 = (t12 * 32767.000000000000);
    t34 = (t13 >= 0);
    if (t34 == 1)
        goto LAB17;

LAB18:    t22 = (t13 - 0.50000000000000000);
    t8 = ((int)(t22));

LAB19:    t2 = (t0 + 4968U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    *((int *)t2) = t8;
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 4968U);
    t3 = *((char **)t2);
    t8 = *((int *)t3);
    t2 = ieee_p_3499444699_sub_17544701978858283880_3536714472(IEEE_P_3499444699, t36, t8, 16);
    t4 = (t36 + 12U);
    t18 = *((unsigned int *)t4);
    t18 = (t18 * 1U);
    t34 = (16U != t18);
    if (t34 == 1)
        goto LAB22;

LAB23:    t5 = (t0 + 7984);
    t6 = (t5 + 56U);
    t15 = *((char **)t6);
    t21 = (t15 + 56U);
    t24 = *((char **)t21);
    memcpy(t24, t2, 16U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 8048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 3888U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t2 = (t0 + 6744);
    xsi_process_wait(t2, t7);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB10:    t2 = (t0 + 12332);
    t10 = *((int *)t2);
    t3 = (t0 + 12336);
    t11 = *((int *)t3);
    if (t10 == t11)
        goto LAB11;

LAB28:    t8 = (t10 + 1);
    t10 = t8;
    t4 = (t0 + 12332);
    *((int *)t4) = t10;
    goto LAB8;

LAB13:    xsi_set_current_line(135, ng0);
    t4 = (t0 + 4848U);
    t5 = *((char **)t4);
    t12 = *((double *)t5);
    t4 = ((IEEE_P_3972351953) + 1408U);
    t6 = *((char **)t4);
    t13 = *((double *)t6);
    t14 = (2.0000000000000000 * t13);
    t4 = (t0 + 4248U);
    t15 = *((char **)t4);
    t4 = (t0 + 12340);
    t16 = *((int *)t4);
    t17 = (t16 - 0);
    t18 = (t17 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, *((int *)t4));
    t19 = (8U * t18);
    t20 = (0 + t19);
    t21 = (t15 + t20);
    t22 = *((double *)t21);
    t23 = (t14 * t22);
    t24 = (t0 + 12332);
    t25 = *((int *)t24);
    t26 = (t23 * (((double)(t25))));
    t27 = (t0 + 4008U);
    t28 = *((char **)t27);
    t29 = *((int *)t28);
    t30 = (t26 / (((double)(t29))));
    t31 = ieee_p_3972351953_sub_310529332173218681_2984157535(IEEE_P_3972351953, t30);
    t32 = (t12 + t31);
    t27 = (t0 + 4848U);
    t33 = *((char **)t27);
    t27 = (t33 + 0);
    *((double *)t27) = t32;

LAB14:    t2 = (t0 + 12340);
    t8 = *((int *)t2);
    t3 = (t0 + 12344);
    t9 = *((int *)t3);
    if (t8 == t9)
        goto LAB15;

LAB16:    t16 = (t8 + 1);
    t8 = t16;
    t4 = (t0 + 12340);
    *((int *)t4) = t8;
    goto LAB12;

LAB17:    t35 = (t13 >= 2147483647);
    if (t35 == 1)
        goto LAB20;

LAB21:    t14 = (t13 + 0.50000000000000000);
    t8 = ((int)(t14));
    goto LAB19;

LAB20:    t8 = 2147483647;
    goto LAB19;

LAB22:    xsi_size_not_matching(16U, t18, 0);
    goto LAB23;

LAB24:    goto LAB10;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB29:    goto LAB2;

LAB30:    goto LAB29;

LAB32:    goto LAB30;

}

static void work_a_3843456663_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(153, ng0);
    t1 = (t0 + 8112);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(154, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB5;

LAB6:    t6 = (unsigned char)0;

LAB7:    if (t6 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 7520);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(155, ng0);
    t1 = (t0 + 8112);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t9 = *((unsigned char *)t3);
    t10 = (t9 == (unsigned char)2);
    t6 = t10;
    goto LAB7;

}


extern void work_a_3843456663_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3843456663_3212880686_p_0,(void *)work_a_3843456663_3212880686_p_1,(void *)work_a_3843456663_3212880686_p_2,(void *)work_a_3843456663_3212880686_p_3,(void *)work_a_3843456663_3212880686_p_4,(void *)work_a_3843456663_3212880686_p_5};
	xsi_register_didat("work_a_3843456663_3212880686", "isim/tb_spectra_spi_isim_beh.exe.sim/work/a_3843456663_3212880686.didat");
	xsi_register_executes(pe);
}
