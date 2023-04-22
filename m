Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4426EBBF4
	for <lists+linux-clk@lfdr.de>; Sun, 23 Apr 2023 00:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjDVWDf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 22 Apr 2023 18:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjDVWDa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Apr 2023 18:03:30 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB60268B;
        Sat, 22 Apr 2023 15:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1682200973; i=j.neuschaefer@gmx.net;
        bh=luFx0eEkb2gHUO5NT2NcbEdgFA4+PBEtYkQCReQjKTU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=nG98EC1TBH/nf1LdJ3pTodUgkpwhXhQgEN0npnJ9KvgYD2shs0Btu5tAxdqxBKWnd
         DGr0K0xANfttKiXLNJhr/7qvczxsGxCK13BIFPA7ZBSKBgs2ZV8u8W3KDhpQ/H1DNu
         ugpulBiMeHId2QUBbDnUiFvURKs/bPbLE+uNdArUPVn/+R/KvF4tJdDfkeHK6Mllxb
         e3QaNK6EcJeXOa676eDE+x4B0KK6xeP95moVV4pGQ0m0wcxX0cPH/4ZRgH6dG2X11v
         7JogFDIhCksJd3j5FC38YzXf4HeraqdhOs0vGcVzkrpLFdSYPEVE4mMu6q+BLTPnuh
         SH9sKUEjKU9Gw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1qMsHC3w90-0186wL; Sun, 23
 Apr 2023 00:02:53 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v7 2/2] clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
Date:   Sun, 23 Apr 2023 00:02:40 +0200
Message-Id: <20230422220240.322572-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422220240.322572-1-j.neuschaefer@gmx.net>
References: <20230422220240.322572-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D7KnbqU6dB59tqVSMj5Mbi6ZHfb2P+zuq7NwRkPho7n6g05XiGq
 oVMAFKAwPh8jCLX78OvhURaYDR6QfZFhhoCFb0dorU1DQIxv4Rn9M2DTxKIMJ4BteVzynjJ
 gPqwtIz5Lu0C68zqC9ZYB2iE2DlLqxYHJsTJm1nHdean3kJAib2JpDpoI0OGHlyIwqpLMTC
 BEuCtsMeFsbomqtw0y4fw==
UI-OutboundReport: notjunk:1;M01:P0:J5+wu8KoULI=;Qrj34xLJKtmdetJ2kWbOyhO6wcU
 wD53lKm4G4NyeBZvwFGKI4OpcTdqd05MR3GqLdaZ4Y3Jn0qB/FInE1qm0xg+Eryj68MfyZHph
 R1tPzCcPA/Pt7yNr0vINXGpWkNMSdlpqgDc0AFN/5+uICCToCbnzfrkEihYceSIoOQ1TTaCFJ
 efi1f7QXB72Gjk8XI/+Bgt9xdxqhjI8O/P+drLas9R0rWLcVgtO7v/xyc1Kg7x4Gc2Y+t4rA2
 CBTU2F0n0PXbQawchwCpVpac9uUbyTG6Ob4mraVxx3acwDN7KsnbbKc9OX/8zMwUPnudlqKNr
 PvGzjwU0fOv3ZpwAzDH1CFfnKrIx1ovi0sBHIagKM4AEnf1F+STK0vYSrGdu+p1vLZLWx0Gyr
 SALkGpzF0scqr7LCLH3IbMghUVh7C4Xw/SLMyvyWlGRM+WXzyr/BGSb//Z9xZkibw7fWwsHQv
 13COwY9FVNxgRBMGb/6Ellm5r9JhPNxy/HnVicNjd1fkXcgbsbOYEm9mvqClKu6L3aAemd2kb
 IbCMJygyrKhcNZpQWKysnnEsRmhMbVftrMXcsXC6J6xVLvhF8pKGcvTYIdJTKDjXNfmo2d6pY
 pJ//wgfiYxraeSAOgnNxVQcQilmMKzXRVwgwmEgWFuj4SXvTuEa47VEIXBvz4xNJk9hmhvLGI
 I3qXFb+HbC5q2/AnNTnHG3jJLvUI/DIeOhp+sgRU0+whUm2fYLCqgB/mqy6itjySFYgQU0qUk
 bV0lygsmFW/A8iSKoe879I/QVvRerIm+eHReoWVvX523ZynZ1KyP0PMUupIR9pltJu5brbvU+
 hJ/AATLkteg2nlnWrZ8cGELEznPQ4CaFphsE94taNGsvAplGnXfMEnWdOu5uMJftnJuEQXxiO
 dlwDfs8HwdNEcEGCI2dY0PJXh8eVWAjw0E6R0+7pIbKteYhO6oMFoU2aK/m7xI/7CpPLAUsiH
 66v0a9omajs8Fwtm4ScpRReh3Ok=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This driver implements the following features w.r.t. the clock and reset
controller in the WPCM450 SoC:

- It calculates the rates for all clocks managed by the clock controller
- It leaves the clock tree mostly unchanged, except that it enables/
  disables clock gates based on usage.
- It exposes the reset lines managed by the controller using the
  Generic Reset Controller subsystem

NOTE: If the driver and the corresponding devicetree node are present,
      the driver will disable "unused" clocks. This is problem until
      the clock relations are properly declared in the devicetree (in a
      later patch). Until then, the clk_ignore_unused kernel parameter
      can be used as a workaround.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v7:
- Simplify error handling by not deallocating resources

v6:
- Enable RESET_SIMPLE based on ARCH_WPCM450, not ARCH_NPCM, as suggested b=
y Tomer Maimon

v5:
- https://lore.kernel.org/lkml/20221104161850.2889894-6-j.neuschaefer@gmx.=
net/
- Switch to using clk_parent_data

v4:
- https://lore.kernel.org/lkml/20220610072141.347795-6-j.neuschaefer@gmx.n=
et/
- Fix reset controller initialization

v3:
- https://lore.kernel.org/lkml/20220508194333.2170161-7-j.neuschaefer@gmx.=
net/
- Change reference clock name from "refclk" to "ref"
- Remove unused variable in return path of wpcm450_clk_register_pll
- Remove unused divisor tables

v2:
- https://lore.kernel.org/lkml/20220429172030.398011-7-j.neuschaefer@gmx.n=
et/
- no changes
=2D--
 drivers/clk/Makefile      |   1 +
 drivers/clk/clk-wpcm450.c | 374 ++++++++++++++++++++++++++++++++++++++
 drivers/reset/Kconfig     |   2 +-
 3 files changed, 376 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/clk-wpcm450.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a256..b58352d4d615d 100644
=2D-- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_COMMON_CLK_RS9_PCIE)	+=3D clk-renesas-pcie.=
o
 obj-$(CONFIG_COMMON_CLK_VC5)		+=3D clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_VC7)		+=3D clk-versaclock7.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+=3D clk-wm831x.o
+obj-$(CONFIG_ARCH_WPCM450)		+=3D clk-wpcm450.o
 obj-$(CONFIG_COMMON_CLK_XGENE)		+=3D clk-xgene.o

 # please keep this section sorted lexicographically by directory path nam=
e
diff --git a/drivers/clk/clk-wpcm450.c b/drivers/clk/clk-wpcm450.c
new file mode 100644
index 0000000000000..6f6d8a1ea3484
=2D-- /dev/null
+++ b/drivers/clk/clk-wpcm450.c
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton WPCM450 clock and reset controller driver.
+ *
+ * Copyright (C) 2022 Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/reset-controller.h>
+#include <linux/reset/reset-simple.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/nuvoton,wpcm450-clk.h>
+
+struct wpcm450_clk_pll {
+	struct clk_hw hw;
+	void __iomem *pllcon;
+	u8 flags;
+};
+
+#define to_wpcm450_clk_pll(_hw) container_of(_hw, struct wpcm450_clk_pll,=
 hw)
+
+#define PLLCON_FBDV	GENMASK(24, 16)
+#define PLLCON_PRST	BIT(13)
+#define PLLCON_PWDEN	BIT(12)
+#define PLLCON_OTDV	GENMASK(10, 8)
+#define PLLCON_INDV	GENMASK(5, 0)
+
+static unsigned long wpcm450_clk_pll_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
+	unsigned long fbdv, indv, otdv;
+	u64 rate;
+	u32 pllcon;
+
+	if (parent_rate =3D=3D 0) {
+		pr_err("%s: parent rate is zero", __func__);
+		return 0;
+	}
+
+	pllcon =3D readl_relaxed(pll->pllcon);
+
+	indv =3D FIELD_GET(PLLCON_INDV, pllcon) + 1;
+	fbdv =3D FIELD_GET(PLLCON_FBDV, pllcon) + 1;
+	otdv =3D FIELD_GET(PLLCON_OTDV, pllcon) + 1;
+
+	rate =3D (u64)parent_rate * fbdv;
+	do_div(rate, indv * otdv);
+
+	return rate;
+}
+
+static int wpcm450_clk_pll_is_enabled(struct clk_hw *hw)
+{
+	struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
+	u32 pllcon;
+
+	pllcon =3D readl_relaxed(pll->pllcon);
+
+	return !(pllcon & PLLCON_PRST);
+}
+
+static void wpcm450_clk_pll_disable(struct clk_hw *hw)
+{
+	struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
+	u32 pllcon;
+
+	pllcon =3D readl_relaxed(pll->pllcon);
+	pllcon |=3D PLLCON_PRST | PLLCON_PWDEN;
+	writel(pllcon, pll->pllcon);
+}
+
+static const struct clk_ops wpcm450_clk_pll_ops =3D {
+	.recalc_rate =3D wpcm450_clk_pll_recalc_rate,
+	.is_enabled =3D wpcm450_clk_pll_is_enabled,
+	.disable =3D wpcm450_clk_pll_disable
+};
+
+static struct clk_hw *
+wpcm450_clk_register_pll(void __iomem *pllcon, const char *name,
+			 const struct clk_parent_data *parent, unsigned long flags)
+{
+	struct wpcm450_clk_pll *pll;
+	struct clk_init_data init =3D {};
+	int ret;
+
+	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	init.name =3D name;
+	init.ops =3D &wpcm450_clk_pll_ops;
+	init.parent_data =3D parent;
+	init.num_parents =3D 1;
+	init.flags =3D flags;
+
+	pll->pllcon =3D pllcon;
+	pll->hw.init =3D &init;
+
+	ret =3D clk_hw_register(NULL, &pll->hw);
+	if (ret) {
+		kfree(pll);
+		return ERR_PTR(ret);
+	}
+
+	return &pll->hw;
+}
+
+#define REG_CLKEN	0x00
+#define REG_CLKSEL	0x04
+#define REG_CLKDIV	0x08
+#define REG_PLLCON0	0x0c
+#define REG_PLLCON1	0x10
+#define REG_PMCON	0x14
+#define REG_IRQWAKECON	0x18
+#define REG_IRQWAKEFLAG	0x1c
+#define REG_IPSRST	0x20
+
+struct wpcm450_pll_data {
+	const char *name;
+	struct clk_parent_data parent;
+	unsigned int reg;
+	unsigned long flags;
+};
+
+static const struct wpcm450_pll_data pll_data[] =3D {
+	{ "pll0", { .name =3D "ref" }, REG_PLLCON0, 0 },
+	{ "pll1", { .name =3D "ref" }, REG_PLLCON1, 0 },
+};
+
+struct wpcm450_clksel_data {
+	const char *name;
+	const struct clk_parent_data *parents;
+	unsigned int num_parents;
+	const u32 *table;
+	int shift;
+	int width;
+	int index;
+	unsigned long flags;
+};
+
+static const u32 parent_table[] =3D { 0, 1, 2 };
+
+static const struct clk_parent_data default_parents[] =3D {
+	{ .name =3D "pll0" },
+	{ .name =3D "pll1" },
+	{ .name =3D "ref" },
+};
+
+static const struct clk_parent_data huart_parents[] =3D {
+	{ .name =3D "ref" },
+	{ .name =3D "refdiv2" },
+};
+
+static const struct wpcm450_clksel_data clksel_data[] =3D {
+	{ "cpusel", default_parents, ARRAY_SIZE(default_parents),
+		parent_table, 0, 2, -1, CLK_IS_CRITICAL },
+	{ "clkout", default_parents, ARRAY_SIZE(default_parents),
+		parent_table, 2, 2, -1, 0 },
+	{ "usbphy", default_parents, ARRAY_SIZE(default_parents),
+		parent_table, 6, 2, -1, 0 },
+	{ "uartsel", default_parents, ARRAY_SIZE(default_parents),
+		parent_table, 8, 2, WPCM450_CLK_USBPHY, 0 },
+	{ "huartsel", huart_parents, ARRAY_SIZE(huart_parents),
+		parent_table, 10, 1, -1, 0 },
+};
+
+static const struct clk_div_table div_fixed2[] =3D {
+	{ .val =3D 0, .div =3D 2 },
+	{ }
+};
+
+struct wpcm450_clkdiv_data {
+	const char *name;
+	struct clk_parent_data parent;
+	int div_flags;
+	const struct clk_div_table *table;
+	int shift;
+	int width;
+	unsigned long flags;
+};
+
+static struct wpcm450_clkdiv_data clkdiv_data_early[] =3D {
+	{ "refdiv2", { .name =3D "ref" }, 0, div_fixed2, 0, 0 },
+};
+
+static const struct wpcm450_clkdiv_data clkdiv_data[] =3D {
+	{ "cpu", { .name =3D "cpusel" }, 0, div_fixed2, 0, 0, CLK_IS_CRITICAL },
+	{ "adcdiv", { .name =3D "ref" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 28, 2, =
0 },
+	{ "apb", { .name =3D "ahb" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 26, 2, 0 }=
,
+	{ "ahb", { .name =3D "cpu" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 24, 2, 0 }=
,
+	{ "uart", { .name =3D "uartsel" }, 0, NULL, 16, 4, 0 },
+	{ "ahb3", { .name =3D "ahb" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 8, 2, 0 }=
,
+};
+
+struct wpcm450_clken_data {
+	const char *name;
+	struct clk_parent_data parent;
+	int bitnum;
+	unsigned long flags;
+};
+
+static const struct wpcm450_clken_data clken_data[] =3D {
+	{ "fiu", { .name =3D "ahb3" }, WPCM450_CLK_FIU, 0 },
+	{ "xbus", { .name =3D "ahb3" }, WPCM450_CLK_XBUS, 0 },
+	{ "kcs", { .name =3D "apb" }, WPCM450_CLK_KCS, 0 },
+	{ "shm", { .name =3D "ahb3" }, WPCM450_CLK_SHM, 0 },
+	{ "usb1", { .name =3D "ahb" }, WPCM450_CLK_USB1, 0 },
+	{ "emc0", { .name =3D "ahb" }, WPCM450_CLK_EMC0, 0 },
+	{ "emc1", { .name =3D "ahb" }, WPCM450_CLK_EMC1, 0 },
+	{ "usb0", { .name =3D "ahb" }, WPCM450_CLK_USB0, 0 },
+	{ "peci", { .name =3D "apb" }, WPCM450_CLK_PECI, 0 },
+	{ "aes", { .name =3D "apb" }, WPCM450_CLK_AES, 0 },
+	{ "uart0", { .name =3D "uart" }, WPCM450_CLK_UART0, 0 },
+	{ "uart1", { .name =3D "uart" }, WPCM450_CLK_UART1, 0 },
+	{ "smb2", { .name =3D "apb" }, WPCM450_CLK_SMB2, 0 },
+	{ "smb3", { .name =3D "apb" }, WPCM450_CLK_SMB3, 0 },
+	{ "smb4", { .name =3D "apb" }, WPCM450_CLK_SMB4, 0 },
+	{ "smb5", { .name =3D "apb" }, WPCM450_CLK_SMB5, 0 },
+	{ "huart", { .name =3D "huartsel" }, WPCM450_CLK_HUART, 0 },
+	{ "pwm", { .name =3D "apb" }, WPCM450_CLK_PWM, 0 },
+	{ "timer0", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER0, 0 },
+	{ "timer1", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER1, 0 },
+	{ "timer2", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER2, 0 },
+	{ "timer3", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER3, 0 },
+	{ "timer4", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER4, 0 },
+	{ "mft0", { .name =3D "apb" }, WPCM450_CLK_MFT0, 0 },
+	{ "mft1", { .name =3D "apb" }, WPCM450_CLK_MFT1, 0 },
+	{ "wdt", { .name =3D "refdiv2" }, WPCM450_CLK_WDT, 0 },
+	{ "adc", { .name =3D "adcdiv" }, WPCM450_CLK_ADC, 0 },
+	{ "sdio", { .name =3D "ahb" }, WPCM450_CLK_SDIO, 0 },
+	{ "sspi", { .name =3D "apb" }, WPCM450_CLK_SSPI, 0 },
+	{ "smb0", { .name =3D "apb" }, WPCM450_CLK_SMB0, 0 },
+	{ "smb1", { .name =3D "apb" }, WPCM450_CLK_SMB1, 0 },
+};
+
+static DEFINE_SPINLOCK(wpcm450_clk_lock);
+
+/*
+ * NOTE: Error handling is very rudimentary here. If the clock driver ini=
tial-
+ * ization fails, the system is probably in bigger trouble than what is c=
aused
+ * by a few leaked resources.
+ */
+
+static void __init wpcm450_clk_init(struct device_node *clk_np)
+{
+	struct clk_hw_onecell_data *clk_data;
+	static struct clk_hw **hws;
+	static struct clk_hw *hw;
+	void __iomem *clk_base;
+	int i, ret;
+	struct reset_simple_data *reset;
+
+	clk_base =3D of_iomap(clk_np, 0);
+	if (!clk_base) {
+		pr_err("%pOFP: failed to map registers\n", clk_np);
+		of_node_put(clk_np);
+		return;
+	}
+	of_node_put(clk_np);
+
+	clk_data =3D kzalloc(struct_size(clk_data, hws, WPCM450_NUM_CLKS), GFP_K=
ERNEL);
+	if (!clk_data)
+		return;
+
+	clk_data->num =3D WPCM450_NUM_CLKS;
+	hws =3D clk_data->hws;
+
+	for (i =3D 0; i < WPCM450_NUM_CLKS; i++)
+		hws[i] =3D ERR_PTR(-ENOENT);
+
+	// PLLs
+	for (i =3D 0; i < ARRAY_SIZE(pll_data); i++) {
+		const struct wpcm450_pll_data *data =3D &pll_data[i];
+
+		hw =3D wpcm450_clk_register_pll(clk_base + data->reg, data->name,
+					      &data->parent, data->flags);
+		if (IS_ERR(hw)) {
+			pr_info("Failed to register PLL: %pe", hw);
+			return;
+		}
+	}
+
+	// Early divisors (REF/2)
+	for (i =3D 0; i < ARRAY_SIZE(clkdiv_data_early); i++) {
+		const struct wpcm450_clkdiv_data *data =3D &clkdiv_data_early[i];
+
+		hw =3D clk_hw_register_divider_table_parent_data(NULL, data->name, &dat=
a->parent,
+							       data->flags, clk_base + REG_CLKDIV,
+							       data->shift, data->width,
+							       data->div_flags, data->table,
+							       &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register div table: %pe\n", hw);
+			return;
+		}
+	}
+
+	// Selects/muxes
+	for (i =3D 0; i < ARRAY_SIZE(clksel_data); i++) {
+		const struct wpcm450_clksel_data *data =3D &clksel_data[i];
+
+		hw =3D clk_hw_register_mux_parent_data(NULL, data->name, data->parents,
+						     data->num_parents, data->flags,
+						     clk_base + REG_CLKSEL, data->shift,
+						     data->width, 0,
+						     &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register mux: %pe\n", hw);
+			return;
+		}
+		if (data->index >=3D 0)
+			clk_data->hws[data->index] =3D hw;
+	}
+
+	// Divisors
+	for (i =3D 0; i < ARRAY_SIZE(clkdiv_data); i++) {
+		const struct wpcm450_clkdiv_data *data =3D &clkdiv_data[i];
+
+		hw =3D clk_hw_register_divider_table_parent_data(NULL, data->name, &dat=
a->parent,
+							       data->flags, clk_base + REG_CLKDIV,
+							       data->shift, data->width,
+							       data->div_flags, data->table,
+							       &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register divider: %pe\n", hw);
+			return;
+		}
+	}
+
+	// Enables/gates
+	for (i =3D 0; i < ARRAY_SIZE(clken_data); i++) {
+		const struct wpcm450_clken_data *data =3D &clken_data[i];
+
+		hw =3D clk_hw_register_gate_parent_data(NULL, data->name, &data->parent=
, data->flags,
+						      clk_base + REG_CLKEN, data->bitnum,
+						      data->flags, &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register gate: %pe\n", hw);
+			return;
+		}
+		clk_data->hws[data->bitnum] =3D hw;
+	}
+
+	ret =3D of_clk_add_hw_provider(clk_np, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		pr_err("Failed to add DT provider: %d\n", ret);
+
+	// Reset controller
+	reset =3D kzalloc(sizeof(*reset), GFP_KERNEL);
+	if (!reset)
+		return;
+	reset->rcdev.owner =3D THIS_MODULE;
+	reset->rcdev.nr_resets =3D WPCM450_NUM_RESETS;
+	reset->rcdev.ops =3D &reset_simple_ops;
+	reset->rcdev.of_node =3D clk_np;
+	reset->membase =3D clk_base + REG_IPSRST;
+	ret =3D reset_controller_register(&reset->rcdev);
+	if (ret)
+		pr_err("Failed to register reset controller: %d\n", ret);
+
+	of_node_put(clk_np);
+}
+
+CLK_OF_DECLARE(wpcm450_clk_init, "nuvoton,wpcm450-clk", wpcm450_clk_init)=
;
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 2a52c990d4fec..16e111d213560 100644
=2D-- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -208,7 +208,7 @@ config RESET_SCMI

 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST || EXPERT
-	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || AR=
CH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
+	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || AR=
CH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC || ARCH_WPC=
M450
 	depends on HAS_IOMEM
 	help
 	  This enables a simple reset controller driver for reset lines that
=2D-
2.39.2

