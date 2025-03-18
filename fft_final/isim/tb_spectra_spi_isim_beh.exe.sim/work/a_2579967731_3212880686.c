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
static const char *ng0 = "/home/ise/Desktop/fft_direct/spi_v2.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_13554554585326073636_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2579967731_3212880686_p_0(char *t0)
{
    char t21[16];
    char t22[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t23;
    int t24;
    unsigned char t25;

LAB0:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_13554554585326073636_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5400);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 5512);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(34, ng0);
    t1 = (t0 + 5576);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(35, ng0);
    t1 = (t0 + 5640);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(36, ng0);
    t1 = (t0 + 5704);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)4;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(37, ng0);
    t1 = (t0 + 5768);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 2952U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t9 = (t4 == (unsigned char)2);
    if (t9 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t12 = (15 - 15);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 5704);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t17 = *((char **)t8);
    *((unsigned char *)t17) = t3;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(55, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t13 = (15 - 14);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t6 = ((IEEE_P_2592010699) + 4000);
    t7 = (t22 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 14;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t12 = (0 - 14);
    t23 = (t12 * -1);
    t23 = (t23 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t23;
    t5 = xsi_base_array_concat(t5, t21, t6, (char)97, t1, t22, (char)99, (unsigned char)2, (char)101);
    t23 = (15U + 1U);
    t3 = (16U != t23);
    if (t3 == 1)
        goto LAB17;

LAB18:    t8 = (t0 + 5832);
    t17 = (t8 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t5, 16U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t24 = (t12 + 1);
    t1 = (t0 + 5512);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t24;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t3 = (t12 == 15);
    if (t3 != 0)
        goto LAB19;

LAB21:
LAB20:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t3 = (t12 == 14);
    if (t3 != 0)
        goto LAB22;

LAB24:
LAB23:
LAB8:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t9 = *((unsigned char *)t2);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB31;

LAB32:    t4 = (unsigned char)0;

LAB33:    if (t4 == 1)
        goto LAB28;

LAB29:    t3 = (unsigned char)0;

LAB30:    if (t3 != 0)
        goto LAB25;

LAB27:
LAB26:    goto LAB3;

LAB7:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t10 = *((unsigned char *)t6);
    t11 = (t10 == (unsigned char)3);
    if (t11 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB15;

LAB16:
LAB11:    goto LAB8;

LAB10:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1512U);
    t7 = *((char **)t2);
    t12 = (15 - 15);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t2 = (t7 + t15);
    t16 = *((unsigned char *)t2);
    t8 = (t0 + 5704);
    t17 = (t8 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t16;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(42, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t13 = (15 - 14);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t6 = ((IEEE_P_2592010699) + 4000);
    t7 = (t22 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 14;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t12 = (0 - 14);
    t23 = (t12 * -1);
    t23 = (t23 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t23;
    t5 = xsi_base_array_concat(t5, t21, t6, (char)97, t1, t22, (char)99, (unsigned char)2, (char)101);
    t23 = (15U + 1U);
    t3 = (16U != t23);
    if (t3 == 1)
        goto LAB13;

LAB14:    t8 = (t0 + 5832);
    t17 = (t8 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t5, 16U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(43, ng0);
    t1 = (t0 + 5512);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 5576);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(45, ng0);
    t1 = (t0 + 5640);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB13:    xsi_size_not_matching(16U, t23, 0);
    goto LAB14;

LAB15:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 5704);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(48, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)2, 16U);
    t5 = (t0 + 5832);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t17 = *((char **)t8);
    memcpy(t17, t1, 16U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(49, ng0);
    t1 = (t0 + 5512);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 5576);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(51, ng0);
    t1 = (t0 + 5640);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB17:    xsi_size_not_matching(16U, t23, 0);
    goto LAB18;

LAB19:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 5576);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 5512);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB20;

LAB22:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 5640);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB23;

LAB25:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1512U);
    t7 = *((char **)t1);
    t1 = (t0 + 5832);
    t8 = (t1 + 56U);
    t17 = *((char **)t8);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t7, 16U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 5576);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 5640);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB26;

LAB28:    t1 = (t0 + 1672U);
    t6 = *((char **)t1);
    t16 = *((unsigned char *)t6);
    t25 = (t16 == (unsigned char)3);
    t3 = t25;
    goto LAB30;

LAB31:    t1 = (t0 + 2792U);
    t5 = *((char **)t1);
    t12 = *((int *)t5);
    t11 = (t12 == 15);
    t4 = t11;
    goto LAB33;

}

static void work_a_2579967731_3212880686_p_1(char *t0)
{
    char t14[16];
    char t15[16];
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
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    int t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    int t23;

LAB0:    xsi_set_current_line(77, ng0);
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
LAB3:    t1 = (t0 + 5416);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(78, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t5 = t1;
    memset(t5, (unsigned char)2, 16U);
    t6 = (t0 + 5896);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 5960);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2632U);
    t5 = *((char **)t2);
    t11 = (15 - 14);
    t12 = (t11 * 1U);
    t13 = (0 + t12);
    t2 = (t5 + t13);
    t6 = (t0 + 1352U);
    t7 = *((char **)t6);
    t4 = *((unsigned char *)t7);
    t8 = ((IEEE_P_2592010699) + 4000);
    t9 = (t15 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 14;
    t10 = (t9 + 4U);
    *((int *)t10) = 0;
    t10 = (t9 + 8U);
    *((int *)t10) = -1;
    t16 = (0 - 14);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t17;
    t6 = xsi_base_array_concat(t6, t14, t8, (char)97, t2, t15, (char)99, t4, (char)101);
    t17 = (15U + 1U);
    t18 = (16U != t17);
    if (t18 == 1)
        goto LAB7;

LAB8:    t10 = (t0 + 5896);
    t19 = (t10 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t6, 16U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t3 = (t16 == 15);
    if (t3 != 0)
        goto LAB9;

LAB11:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 5960);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB10:    goto LAB3;

LAB7:    xsi_size_not_matching(16U, t17, 0);
    goto LAB8;

LAB9:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 2632U);
    t5 = *((char **)t1);
    t11 = (15 - 14);
    t12 = (t11 * 1U);
    t13 = (0 + t12);
    t1 = (t5 + t13);
    t6 = (t0 + 1352U);
    t7 = *((char **)t6);
    t4 = *((unsigned char *)t7);
    t8 = ((IEEE_P_2592010699) + 4000);
    t9 = (t15 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 14;
    t10 = (t9 + 4U);
    *((int *)t10) = 0;
    t10 = (t9 + 8U);
    *((int *)t10) = -1;
    t23 = (0 - 14);
    t17 = (t23 * -1);
    t17 = (t17 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t17;
    t6 = xsi_base_array_concat(t6, t14, t8, (char)97, t1, t15, (char)99, t4, (char)101);
    t17 = (15U + 1U);
    t18 = (16U != t17);
    if (t18 == 1)
        goto LAB12;

LAB13:    t10 = (t0 + 6024);
    t19 = (t10 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t6, 16U);
    xsi_driver_first_trans_fast_port(t10);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 5960);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB10;

LAB12:    xsi_size_not_matching(16U, t17, 0);
    goto LAB13;

}

static void work_a_2579967731_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(91, ng0);

LAB3:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6088);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 5432);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2579967731_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2579967731_3212880686_p_0,(void *)work_a_2579967731_3212880686_p_1,(void *)work_a_2579967731_3212880686_p_2};
	xsi_register_didat("work_a_2579967731_3212880686", "isim/tb_spectra_spi_isim_beh.exe.sim/work/a_2579967731_3212880686.didat");
	xsi_register_executes(pe);
}
