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
static const char *ng0 = "/home/ise/Desktop/fft_direct/comparator.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_3620187407_sub_970019341842465249_3965413181(char *, char *, char *, int );


static void work_a_2683404259_3212880686_p_0(char *t0)
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
    char *t10;
    int t11;
    int t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned char t24;
    char *t25;
    int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4680);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(32, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t5 = t1;
    memset(t5, (unsigned char)2, 8U);
    t6 = (t0 + 4792);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(33, ng0);
    t1 = (t0 + 4856);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 2312U);
    t5 = *((char **)t2);
    t11 = *((int *)t5);
    t4 = (t11 == 0);
    if (t4 != 0)
        goto LAB7;

LAB9:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t3 = (t11 == 8);
    if (t3 != 0)
        goto LAB10;

LAB11:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t12 = (t11 + 1);
    t1 = (t0 + 4920);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);

LAB8:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB12;

LAB14:
LAB13:    goto LAB3;

LAB7:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 4856);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB8;

LAB10:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 4920);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB12:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 7774);
    *((int *)t1) = 0;
    t5 = (t0 + 7778);
    *((int *)t5) = 7;
    t11 = 0;
    t12 = 7;

LAB15:    if (t11 <= t12)
        goto LAB16;

LAB18:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 7576U);
    t5 = (t0 + 2768U);
    t6 = *((char **)t5);
    t11 = (7 - 0);
    t15 = (t11 * 1);
    t16 = (4U * t15);
    t17 = (0 + t16);
    t5 = (t6 + t17);
    t12 = *((int *)t5);
    t3 = ieee_p_3620187407_sub_970019341842465249_3965413181(IEEE_P_3620187407, t2, t1, t12);
    if (t3 != 0)
        goto LAB26;

LAB28:
LAB27:    goto LAB13;

LAB16:    xsi_set_current_line(45, ng0);
    t6 = (t0 + 1672U);
    t7 = *((char **)t6);
    t6 = (t0 + 7576U);
    t8 = (t0 + 2768U);
    t9 = *((char **)t8);
    t8 = (t0 + 7774);
    t13 = *((int *)t8);
    t14 = (t13 - 0);
    t15 = (t14 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, *((int *)t8));
    t16 = (4U * t15);
    t17 = (0 + t16);
    t10 = (t9 + t17);
    t18 = *((int *)t10);
    t19 = ieee_p_3620187407_sub_970019341842465249_3965413181(IEEE_P_3620187407, t7, t6, t18);
    if (t19 != 0)
        goto LAB19;

LAB21:
LAB20:
LAB17:    t1 = (t0 + 7774);
    t11 = *((int *)t1);
    t2 = (t0 + 7778);
    t12 = *((int *)t2);
    if (t11 == t12)
        goto LAB18;

LAB25:    t13 = (t11 + 1);
    t11 = t13;
    t5 = (t0 + 7774);
    *((int *)t5) = t11;
    goto LAB15;

LAB19:    xsi_set_current_line(46, ng0);
    t20 = (t0 + 1512U);
    t21 = *((char **)t20);
    t20 = (t0 + 7560U);
    t22 = (t0 + 2888U);
    t23 = *((char **)t22);
    t22 = (t0 + 7656U);
    t24 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t21, t20, t23, t22);
    if (t24 != 0)
        goto LAB22;

LAB24:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 7774);
    t13 = *((int *)t1);
    t14 = (t13 - 7);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t2 = (t0 + 4792);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_delta(t2, t17, 1, 0LL);

LAB23:    goto LAB20;

LAB22:    xsi_set_current_line(47, ng0);
    t25 = (t0 + 7774);
    t26 = *((int *)t25);
    t27 = (t26 - 7);
    t28 = (t27 * -1);
    t29 = (1 * t28);
    t30 = (0U + t29);
    t31 = (t0 + 4792);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    *((unsigned char *)t35) = (unsigned char)3;
    xsi_driver_first_trans_delta(t31, t30, 1, 0LL);
    goto LAB23;

LAB26:    xsi_set_current_line(54, ng0);
    t7 = (t0 + 4856);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t20 = *((char **)t10);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(55, ng0);
    t1 = (t0 + 4920);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 1;
    xsi_driver_first_trans_fast(t1);
    goto LAB27;

}

static void work_a_2683404259_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(61, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 4984);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4696);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2683404259_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(62, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5048);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4712);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2683404259_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2683404259_3212880686_p_0,(void *)work_a_2683404259_3212880686_p_1,(void *)work_a_2683404259_3212880686_p_2};
	xsi_register_didat("work_a_2683404259_3212880686", "isim/tb_spectra_isim_beh.exe.sim/work/a_2683404259_3212880686.didat");
	xsi_register_executes(pe);
}
