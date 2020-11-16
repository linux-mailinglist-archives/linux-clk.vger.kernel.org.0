Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63F32B42AC
	for <lists+linux-clk@lfdr.de>; Mon, 16 Nov 2020 12:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729731AbgKPLUn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Nov 2020 06:20:43 -0500
Received: from muru.com ([72.249.23.125]:48538 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729735AbgKPLUm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:42 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2AFD6813D;
        Mon, 16 Nov 2020 11:20:47 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 17/17] ARM: OMAP2+: Drop legacy remaining legacy platform data for am4
Date:   Mon, 16 Nov 2020 13:19:39 +0200
Message-Id: <20201116111939.21405-18-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We can now drop the remaining legacy platform data as we are
probing devices with device tree data.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Kconfig                   |   1 -
 arch/arm/mach-omap2/Makefile                  |   5 +-
 arch/arm/mach-omap2/io.c                      |   1 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  52 -----
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  59 ------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 184 ------------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  81 --------
 7 files changed, 1 insertion(+), 382 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_43xx_data.c

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -78,7 +78,6 @@ config SOC_AM43XX
 	select HAVE_ARM_TWD
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
-	select OMAP_HWMOD
 	select OMAP_INTERCONNECT
 	select ARM_CPU_SUSPEND if PM
 
diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -23,7 +23,7 @@ obj-$(CONFIG_ARCH_OMAP3) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
 obj-$(CONFIG_ARCH_OMAP4) += $(hwmod-common) $(secure-common)
 obj-$(CONFIG_SOC_AM33XX) += $(secure-common)
 obj-$(CONFIG_SOC_OMAP5)  += $(hwmod-common) $(secure-common)
-obj-$(CONFIG_SOC_AM43XX) += $(hwmod-common) $(secure-common)
+obj-$(CONFIG_SOC_AM43XX) += $(secure-common)
 obj-$(CONFIG_SOC_DRA7XX) += $(hwmod-common) $(secure-common)
 
 ifneq ($(CONFIG_SND_SOC_OMAP_MCBSP),)
@@ -206,9 +206,6 @@ obj-$(CONFIG_SOC_OMAP2430)		+= omap_hwmod_2xxx_interconnect_data.o
 obj-$(CONFIG_SOC_OMAP2430)		+= omap_hwmod_2430_data.o
 obj-$(CONFIG_ARCH_OMAP3)		+= omap_hwmod_2xxx_3xxx_ipblock_data.o
 obj-$(CONFIG_ARCH_OMAP3)		+= omap_hwmod_3xxx_data.o
-obj-$(CONFIG_SOC_AM43XX)		+= omap_hwmod_43xx_data.o
-obj-$(CONFIG_SOC_AM43XX)		+= omap_hwmod_33xx_43xx_interconnect_data.o
-obj-$(CONFIG_SOC_AM43XX)		+= omap_hwmod_33xx_43xx_ipblock_data.o
 obj-$(CONFIG_SOC_TI81XX)		+= omap_hwmod_81xx_data.o
 obj-$(CONFIG_ARCH_OMAP4)		+= omap_hwmod_44xx_data.o
 obj-$(CONFIG_SOC_OMAP5)			+= omap_hwmod_54xx_data.o
diff --git a/arch/arm/mach-omap2/io.c b/arch/arm/mach-omap2/io.c
--- a/arch/arm/mach-omap2/io.c
+++ b/arch/arm/mach-omap2/io.c
@@ -588,7 +588,6 @@ void __init am43xx_init_early(void)
 	omap2_prcm_base_init();
 	am43xx_powerdomains_init();
 	am43xx_clockdomains_init();
-	am43xx_hwmod_init();
 	omap_hwmod_init_postsetup();
 	omap_l2_cache_init();
 	omap_clk_soc_init = am43xx_dt_clk_init;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
deleted file mode 100644
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/*
- *
- * Copyright (C) 2013 Texas Instruments Incorporated
- *
- * Data common for AM335x and AM43x
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- */
-
-#ifndef __ARCH_ARM_MACH_OMAP2_OMAP_HWMOD_33XX_43XX_COMMON_DATA_H
-#define __ARCH_ARM_MACH_OMAP2_OMAP_HWMOD_33XX_43XX_COMMON_DATA_H
-
-extern struct omap_hwmod_ocp_if am33xx_l3_main__l3_s;
-extern struct omap_hwmod_ocp_if am33xx_l3_s__l4_ls;
-extern struct omap_hwmod_ocp_if am33xx_l3_s__l4_wkup;
-extern struct omap_hwmod_ocp_if am33xx_l3_main__l3_instr;
-extern struct omap_hwmod_ocp_if am33xx_l3_s__l3_main;
-extern struct omap_hwmod_ocp_if am33xx_gfx__l3_main;
-extern struct omap_hwmod_ocp_if am33xx_l3_main__gfx;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer2;
-extern struct omap_hwmod_ocp_if am33xx_l3_main__ocmc;
-
-extern struct omap_hwmod am33xx_l3_main_hwmod;
-extern struct omap_hwmod am33xx_l3_s_hwmod;
-extern struct omap_hwmod am33xx_l3_instr_hwmod;
-extern struct omap_hwmod am33xx_l4_ls_hwmod;
-extern struct omap_hwmod am33xx_l4_wkup_hwmod;
-extern struct omap_hwmod am33xx_gfx_hwmod;
-extern struct omap_hwmod am33xx_prcm_hwmod;
-extern struct omap_hwmod am33xx_ocmcram_hwmod;
-extern struct omap_hwmod am33xx_smartreflex0_hwmod;
-extern struct omap_hwmod am33xx_smartreflex1_hwmod;
-
-extern struct omap_hwmod_class am33xx_emif_hwmod_class;
-extern struct omap_hwmod_class am33xx_l4_hwmod_class;
-extern struct omap_hwmod_class am33xx_wkup_m3_hwmod_class;
-extern struct omap_hwmod_class am33xx_control_hwmod_class;
-extern struct omap_hwmod_class am33xx_timer_hwmod_class;
-extern struct omap_hwmod_class am33xx_ehrpwm_hwmod_class;
-extern struct omap_hwmod_class am33xx_spi_hwmod_class;
-
-void omap_hwmod_am33xx_reg(void);
-void omap_hwmod_am43xx_reg(void);
-
-#endif
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
deleted file mode 100644
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ /dev/null
@@ -1,59 +0,0 @@
-/*
- *
- * Copyright (C) 2013 Texas Instruments Incorporated
- *
- * Interconnects common for AM335x and AM43x
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- */
-
-#include <linux/sizes.h>
-#include "omap_hwmod.h"
-#include "omap_hwmod_33xx_43xx_common_data.h"
-
-/* l3 main -> l3 s */
-struct omap_hwmod_ocp_if am33xx_l3_main__l3_s = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_l3_s_hwmod,
-	.clk		= "l3s_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3 s -> l4 per/ls */
-struct omap_hwmod_ocp_if am33xx_l3_s__l4_ls = {
-	.master		= &am33xx_l3_s_hwmod,
-	.slave		= &am33xx_l4_ls_hwmod,
-	.clk		= "l3s_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3 s -> l4 wkup */
-struct omap_hwmod_ocp_if am33xx_l3_s__l4_wkup = {
-	.master		= &am33xx_l3_s_hwmod,
-	.slave		= &am33xx_l4_wkup_hwmod,
-	.clk		= "l3s_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3 main -> l3 instr */
-struct omap_hwmod_ocp_if am33xx_l3_main__l3_instr = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_l3_instr_hwmod,
-	.clk		= "l3s_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3 s -> l3 main*/
-struct omap_hwmod_ocp_if am33xx_l3_s__l3_main = {
-	.master		= &am33xx_l3_s_hwmod,
-	.slave		= &am33xx_l3_main_hwmod,
-	.clk		= "l3s_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
deleted file mode 100644
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ /dev/null
@@ -1,184 +0,0 @@
-/*
- *
- * Copyright (C) 2013 Texas Instruments Incorporated
- *
- * Hwmod common for AM335x and AM43x
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- */
-
-#include <linux/types.h>
-
-#include "omap_hwmod.h"
-#include "cm33xx.h"
-#include "prm33xx.h"
-#include "omap_hwmod_33xx_43xx_common_data.h"
-#include "prcm43xx.h"
-#include "common.h"
-
-#define CLKCTRL(oh, clkctrl) ((oh).prcm.omap4.clkctrl_offs = (clkctrl))
-#define RSTCTRL(oh, rstctrl) ((oh).prcm.omap4.rstctrl_offs = (rstctrl))
-#define RSTST(oh, rstst) ((oh).prcm.omap4.rstst_offs = (rstst))
-
-/*
- * 'l3' class
- * instance(s): l3_main, l3_s, l3_instr
- */
-static struct omap_hwmod_class am33xx_l3_hwmod_class = {
-	.name		= "l3",
-};
-
-struct omap_hwmod am33xx_l3_main_hwmod = {
-	.name		= "l3_main",
-	.class		= &am33xx_l3_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "l3_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* l3_s */
-struct omap_hwmod am33xx_l3_s_hwmod = {
-	.name		= "l3_s",
-	.class		= &am33xx_l3_hwmod_class,
-	.clkdm_name	= "l3s_clkdm",
-};
-
-/* l3_instr */
-struct omap_hwmod am33xx_l3_instr_hwmod = {
-	.name		= "l3_instr",
-	.class		= &am33xx_l3_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "l3_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/*
- * 'l4' class
- * instance(s): l4_ls, l4_hs, l4_wkup, l4_fw
- */
-struct omap_hwmod_class am33xx_l4_hwmod_class = {
-	.name		= "l4",
-};
-
-/* l4_ls */
-struct omap_hwmod am33xx_l4_ls_hwmod = {
-	.name		= "l4_ls",
-	.class		= &am33xx_l4_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* l4_wkup */
-struct omap_hwmod am33xx_l4_wkup_hwmod = {
-	.name		= "l4_wkup",
-	.class		= &am33xx_l4_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/*
- * 'prcm' class
- * power and reset manager (whole prcm infrastructure)
- */
-static struct omap_hwmod_class am33xx_prcm_hwmod_class = {
-	.name	= "prcm",
-};
-
-/* prcm */
-struct omap_hwmod am33xx_prcm_hwmod = {
-	.name		= "prcm",
-	.class		= &am33xx_prcm_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-};
-
-/* 'smartreflex' class */
-static struct omap_hwmod_class am33xx_smartreflex_hwmod_class = {
-	.name		= "smartreflex",
-};
-
-/* smartreflex0 */
-struct omap_hwmod am33xx_smartreflex0_hwmod = {
-	.name		= "smartreflex0",
-	.class		= &am33xx_smartreflex_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.main_clk	= "smartreflex0_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* smartreflex1 */
-struct omap_hwmod am33xx_smartreflex1_hwmod = {
-	.name		= "smartreflex1",
-	.class		= &am33xx_smartreflex_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.main_clk	= "smartreflex1_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static void omap_hwmod_am33xx_clkctrl(void)
-{
-	CLKCTRL(am33xx_smartreflex0_hwmod,
-		AM33XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_smartreflex1_hwmod,
-		AM33XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_l4_ls_hwmod, AM33XX_CM_PER_L4LS_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_l4_wkup_hwmod, AM33XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_l3_main_hwmod, AM33XX_CM_PER_L3_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_l3_instr_hwmod , AM33XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
-}
-
-void omap_hwmod_am33xx_reg(void)
-{
-	omap_hwmod_am33xx_clkctrl();
-}
-
-static void omap_hwmod_am43xx_clkctrl(void)
-{
-	CLKCTRL(am33xx_smartreflex0_hwmod,
-		AM43XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_smartreflex1_hwmod,
-		AM43XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_l4_ls_hwmod, AM43XX_CM_PER_L4LS_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_l4_wkup_hwmod, AM43XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_l3_main_hwmod, AM43XX_CM_PER_L3_CLKCTRL_OFFSET);
-}
-
-void omap_hwmod_am43xx_reg(void)
-{
-	omap_hwmod_am43xx_clkctrl();
-}
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
deleted file mode 100644
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ /dev/null
@@ -1,81 +0,0 @@
-/*
- * Copyright (C) 2013 Texas Instruments Incorporated
- *
- * Hwmod present only in AM43x and those that differ other than register
- * offsets as compared to AM335x.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- */
-
-#include "omap_hwmod.h"
-#include "omap_hwmod_33xx_43xx_common_data.h"
-#include "prcm43xx.h"
-#include "omap_hwmod_common_data.h"
-
-/* IP blocks */
-static struct omap_hwmod am43xx_l4_hs_hwmod = {
-	.name		= "l4_hs",
-	.class		= &am33xx_l4_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "l4hs_gclk",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM43XX_CM_PER_L4HS_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* Interfaces */
-
-static struct omap_hwmod_ocp_if am43xx_l3_main__l4_hs = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am43xx_l4_hs_hwmod,
-	.clk		= "l3s_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_wkup__smartreflex0 = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am33xx_smartreflex0_hwmod,
-	.clk		= "sys_clkin_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_wkup__smartreflex1 = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am33xx_smartreflex1_hwmod,
-	.clk		= "sys_clkin_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
-	&am33xx_l3_s__l4_ls,
-	&am33xx_l3_s__l4_wkup,
-	&am43xx_l3_main__l4_hs,
-	&am33xx_l3_main__l3_s,
-	&am33xx_l3_main__l3_instr,
-	&am33xx_l3_s__l3_main,
-	&am43xx_l4_wkup__smartreflex0,
-	&am43xx_l4_wkup__smartreflex1,
-	NULL,
-};
-
-int __init am43xx_hwmod_init(void)
-{
-	int ret;
-
-	omap_hwmod_am43xx_reg();
-	omap_hwmod_init();
-	ret = omap_hwmod_register_links(am43xx_hwmod_ocp_ifs);
-
-	return ret;
-}
-- 
2.29.2
