Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891221C9783
	for <lists+linux-clk@lfdr.de>; Thu,  7 May 2020 19:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbgEGRX7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 7 May 2020 13:23:59 -0400
Received: from muru.com ([72.249.23.125]:53272 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728143AbgEGRX6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 7 May 2020 13:23:58 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BD3A3817C;
        Thu,  7 May 2020 17:24:43 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Rob Herring <robh@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 07/14] ARM: dts: Configure system timers for am437x
Date:   Thu,  7 May 2020 10:23:23 -0700
Message-Id: <20200507172330.18679-8-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507172330.18679-1-tony@atomide.com>
References: <20200507172330.18679-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We can now init system timers using the dmtimer and 32k counter
based on only devicetree data and drivers/clocksource timers.
Let's configure the clocksource and clockevent, and drop the old
unused platform data.

As we're just dropping platform data, and the early platform data
init is based on the custom ti,hwmods property, we want to drop
both the platform data and ti,hwmods property in a single patch.

Since the dmtimer can use both 32k clock and system clock as the
source, let's also configure the SoC specific default values. The
board specific dts files can reconfigure these with assigned-clocks
and assigned-clock-parents as needed.

Cc: devicetree@vger.kernel.org
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi                 | 20 +++++++
 arch/arm/boot/dts/am437x-l4.dtsi              |  7 +--
 arch/arm/mach-omap2/board-generic.c           |  2 +-
 .../omap_hwmod_33xx_43xx_common_data.h        |  2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  8 ---
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 60 -------------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    | 45 --------------
 7 files changed, 23 insertions(+), 121 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -553,3 +553,23 @@ prm_device: prm@4000 {
 		#reset-cells = <1>;
 	};
 };
+
+/* Preferred always-on timer for clocksource */
+&timer1_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		assigned-clocks = <&timer1_fck>;
+		assigned-clock-parents = <&sys_clkin_ck>;
+	};
+};
+
+/* Preferred timer for clockevent */
+&timer2_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		assigned-clocks = <&timer2_fck>;
+		assigned-clock-parents = <&sys_clkin_ck>;
+	};
+};
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -328,9 +328,8 @@ scm_clockdomains: clockdomains {
 			};
 		};
 
-		target-module@31000 {			/* 0x44e31000, ap 24 40.0 */
+		timer1_target: target-module@31000 {	/* 0x44e31000, ap 24 40.0 */
 			compatible = "ti,sysc-omap2-timer", "ti,sysc";
-			ti,hwmods = "timer1";
 			reg = <0x31000 0x4>,
 			      <0x31010 0x4>,
 			      <0x31014 0x4>;
@@ -450,7 +449,6 @@ target-module@40000 {			/* 0x44e40000, ap 36 68.0 */
 
 		target-module@86000 {			/* 0x44e86000, ap 40 70.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "counter_32k";
 			reg = <0x86000 0x4>,
 			      <0x86004 0x4>;
 			reg-names = "rev", "sysc";
@@ -868,9 +866,8 @@ mcasp1: mcasp@0 {
 			};
 		};
 
-		target-module@40000 {			/* 0x48040000, ap 18 1e.0 */
+		timer2_target: target-module@40000 {	/* 0x48040000, ap 18 1e.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer2";
 			reg = <0x40000 0x4>,
 			      <0x40010 0x4>,
 			      <0x40014 0x4>;
diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
--- a/arch/arm/mach-omap2/board-generic.c
+++ b/arch/arm/mach-omap2/board-generic.c
@@ -308,7 +308,7 @@ DT_MACHINE_START(AM43_DT, "Generic AM43 (Flattened Device Tree)")
 	.init_late	= am43xx_init_late,
 	.init_irq	= omap_gic_of_init,
 	.init_machine	= omap_generic_init,
-	.init_time	= omap3_gptimer_timer_init,
+	.init_time	= omap_init_time_of,
 	.dt_compat	= am43_boards_compat,
 	.restart	= omap44xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -44,8 +44,6 @@ extern struct omap_hwmod am33xx_smartreflex0_hwmod;
 extern struct omap_hwmod am33xx_smartreflex1_hwmod;
 extern struct omap_hwmod am33xx_gpmc_hwmod;
 extern struct omap_hwmod am33xx_rtc_hwmod;
-extern struct omap_hwmod am33xx_timer1_hwmod;
-extern struct omap_hwmod am33xx_timer2_hwmod;
 
 extern struct omap_hwmod_class am33xx_emif_hwmod_class;
 extern struct omap_hwmod_class am33xx_l4_hwmod_class;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -106,14 +106,6 @@ struct omap_hwmod_ocp_if am33xx_l3_s__gpmc = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4 per -> timer2 */
-struct omap_hwmod_ocp_if am33xx_l4_ls__timer2 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_timer2_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3 main -> ocmc */
 struct omap_hwmod_ocp_if am33xx_l3_main__ocmc = {
 	.master		= &am33xx_l3_main_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -307,64 +307,6 @@ struct omap_hwmod am33xx_rtc_hwmod = {
 	},
 };
 
-/* 'timer 2-7' class */
-static struct omap_hwmod_class_sysconfig am33xx_timer_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
-			  SYSC_HAS_RESET_STATUS,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			  SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-struct omap_hwmod_class am33xx_timer_hwmod_class = {
-	.name		= "timer",
-	.sysc		= &am33xx_timer_sysc,
-};
-
-/* timer1 1ms */
-static struct omap_hwmod_class_sysconfig am33xx_timer1ms_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_CLOCKACTIVITY | SYSC_HAS_SIDLEMODE |
-			SYSC_HAS_SOFTRESET | SYSC_HAS_AUTOIDLE |
-			SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class am33xx_timer1ms_hwmod_class = {
-	.name		= "timer",
-	.sysc		= &am33xx_timer1ms_sysc,
-};
-
-struct omap_hwmod am33xx_timer1_hwmod = {
-	.name		= "timer1",
-	.class		= &am33xx_timer1ms_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.main_clk	= "timer1_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-struct omap_hwmod am33xx_timer2_hwmod = {
-	.name		= "timer2",
-	.class		= &am33xx_timer_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "timer2_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 static void omap_hwmod_am33xx_clkctrl(void)
 {
 	CLKCTRL(am33xx_smartreflex0_hwmod,
@@ -397,12 +339,10 @@ void omap_hwmod_am33xx_reg(void)
 
 static void omap_hwmod_am43xx_clkctrl(void)
 {
-	CLKCTRL(am33xx_timer2_hwmod, AM43XX_CM_PER_TIMER2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex0_hwmod,
 		AM43XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex1_hwmod,
 		AM43XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer1_hwmod, AM43XX_CM_WKUP_TIMER1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_rtc_hwmod, AM43XX_CM_RTC_RTC_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gpmc_hwmod, AM43XX_CM_PER_GPMC_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_ls_hwmod, AM43XX_CM_PER_L4LS_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -85,34 +85,6 @@ static struct omap_hwmod am43xx_control_hwmod = {
 	},
 };
 
-static struct omap_hwmod_class_sysconfig am43xx_synctimer_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x4,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class am43xx_synctimer_hwmod_class = {
-	.name	= "synctimer",
-	.sysc	= &am43xx_synctimer_sysc,
-};
-
-static struct omap_hwmod am43xx_synctimer_hwmod = {
-	.name		= "counter_32k",
-	.class		= &am43xx_synctimer_hwmod_class,
-	.clkdm_name	= "l4_wkup_aon_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE,
-	.main_clk	= "synctimer_32kclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = AM43XX_CM_WKUP_SYNCTIMER_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-
 static struct omap_hwmod_class_sysconfig am43xx_usb_otg_ss_sysc = {
 	.rev_offs	= 0x0000,
 	.sysc_offs	= 0x0010,
@@ -206,20 +178,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_wkup__control = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l4_wkup__timer1 = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am33xx_timer1_hwmod,
-	.clk		= "sys_clkin_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if am33xx_l4_wkup__synctimer = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am43xx_synctimer_hwmod,
-	.clk		= "sys_clkin_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if am43xx_l3_s__usbotgss0 = {
 	.master         = &am33xx_l3_s_hwmod,
 	.slave          = &am43xx_usb_otg_ss0_hwmod,
@@ -235,7 +193,6 @@ static struct omap_hwmod_ocp_if am43xx_l3_s__usbotgss1 = {
 };
 
 static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
-	&am33xx_l4_wkup__synctimer,
 	&am33xx_mpu__l3_main,
 	&am33xx_mpu__prcm,
 	&am33xx_l3_s__l4_ls,
@@ -252,8 +209,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l4_wkup__control,
 	&am43xx_l4_wkup__smartreflex0,
 	&am43xx_l4_wkup__smartreflex1,
-	&am43xx_l4_wkup__timer1,
-	&am33xx_l4_ls__timer2,
 	&am33xx_l3_s__gpmc,
 	&am33xx_l3_main__ocmc,
 	&am43xx_l3_s__usbotgss0,
-- 
2.26.2
