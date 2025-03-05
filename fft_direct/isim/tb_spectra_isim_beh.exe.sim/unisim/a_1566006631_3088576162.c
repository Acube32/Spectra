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



static void unisim_a_1566006631_3088576162_p_0(char *t0)
{
    char t5[16];
    char t7[16];
    char t15[16];
    char t17[16];
    char *t1;
    char *t3;
    char *t4;
    char *t6;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    char *t12;
    char *t14;
    char *t16;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    unsigned char t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:
LAB3:    t1 = (t0 + 49047);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t6 = ((IEEE_P_2592010699) + 4000);
    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 1;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t10 = (1 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t9 = (t0 + 29896U);
    t3 = xsi_base_array_concat(t3, t5, t6, (char)97, t1, t7, (char)97, t4, t9, (char)101);
    t12 = (t0 + 49049);
    t16 = ((IEEE_P_2592010699) + 4000);
    t18 = (t17 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 0;
    t19 = (t18 + 4U);
    *((int *)t19) = 4;
    t19 = (t18 + 8U);
    *((int *)t19) = 1;
    t20 = (4 - 0);
    t11 = (t20 * 1);
    t11 = (t11 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t11;
    t14 = xsi_base_array_concat(t14, t15, t16, (char)97, t3, t5, (char)97, t12, t17, (char)101);
    t11 = (2U + 9U);
    t21 = (t11 + 5U);
    t22 = (16U != t21);
    if (t22 == 1)
        goto LAB5;

LAB6:    t19 = (t0 + 17544);
    t23 = (t19 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t14, 16U);
    xsi_driver_first_trans_fast(t19);

LAB2:    t27 = (t0 + 17416);
    *((int *)t27) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(16U, t21, 0);
    goto LAB6;

}

static void unisim_a_1566006631_3088576162_p_1(char *t0)
{
    char t5[16];
    char t7[16];
    char t15[16];
    char t17[16];
    char *t1;
    char *t3;
    char *t4;
    char *t6;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    char *t12;
    char *t14;
    char *t16;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    unsigned char t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:
LAB3:    t1 = (t0 + 49054);
    t3 = (t0 + 2632U);
    t4 = *((char **)t3);
    t6 = ((IEEE_P_2592010699) + 4000);
    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 1;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t10 = (1 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t9 = (t0 + 29928U);
    t3 = xsi_base_array_concat(t3, t5, t6, (char)97, t1, t7, (char)97, t4, t9, (char)101);
    t12 = (t0 + 49056);
    t16 = ((IEEE_P_2592010699) + 4000);
    t18 = (t17 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 0;
    t19 = (t18 + 4U);
    *((int *)t19) = 4;
    t19 = (t18 + 8U);
    *((int *)t19) = 1;
    t20 = (4 - 0);
    t11 = (t20 * 1);
    t11 = (t11 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t11;
    t14 = xsi_base_array_concat(t14, t15, t16, (char)97, t3, t5, (char)97, t12, t17, (char)101);
    t11 = (2U + 9U);
    t21 = (t11 + 5U);
    t22 = (16U != t21);
    if (t22 == 1)
        goto LAB5;

LAB6:    t19 = (t0 + 17608);
    t23 = (t19 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t14, 16U);
    xsi_driver_first_trans_fast(t19);

LAB2:    t27 = (t0 + 17432);
    *((int *)t27) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(16U, t21, 0);
    goto LAB6;

}

static void unisim_a_1566006631_3088576162_p_2(char *t0)
{
    char t4[16];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:
LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t5 = ((IEEE_P_2592010699) + 4000);
    t6 = (t0 + 29912U);
    t7 = (t0 + 29912U);
    t1 = xsi_base_array_concat(t1, t4, t5, (char)97, t2, t6, (char)97, t3, t7, (char)101);
    t8 = (4U + 4U);
    t9 = (8U != t8);
    if (t9 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 17672);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 8U);
    xsi_driver_first_trans_fast(t10);

LAB2:    t15 = (t0 + 17448);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t8, 0);
    goto LAB6;

}

static void unisim_a_1566006631_3088576162_p_3(char *t0)
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

LAB0:    t1 = (t0 + 14968U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t1 = (t0 + 5032U);
    t4 = *((char **)t1);
    t1 = (t0 + 17736);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 32U);
    xsi_driver_first_trans_delta(t1, 0U, 32U, t3);
    t9 = (t0 + 17736);
    xsi_driver_intertial_reject(t9, t3, t3);
    t1 = (t0 + 14968U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t1 = (t0 + 5192U);
    t4 = *((char **)t1);
    t1 = (t0 + 17800);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 4U);
    xsi_driver_first_trans_delta(t1, 0U, 4U, t3);
    t9 = (t0 + 17800);
    xsi_driver_intertial_reject(t9, t3, t3);
    t1 = (t0 + 17464);
    *((int *)t1) = 1;

LAB1:    return;
}


extern void unisim_a_1566006631_3088576162_init()
{
	static char *pe[] = {(void *)unisim_a_1566006631_3088576162_p_0,(void *)unisim_a_1566006631_3088576162_p_1,(void *)unisim_a_1566006631_3088576162_p_2,(void *)unisim_a_1566006631_3088576162_p_3};
	xsi_register_didat("unisim_a_1566006631_3088576162", "isim/tb_spectra_isim_beh.exe.sim/unisim/a_1566006631_3088576162.didat");
	xsi_register_executes(pe);
}
