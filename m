Return-Path: <linux-clk+bounces-5119-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8026388F45B
	for <lists+linux-clk@lfdr.de>; Thu, 28 Mar 2024 02:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA6481F24D14
	for <lists+linux-clk@lfdr.de>; Thu, 28 Mar 2024 01:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3B8225CF;
	Thu, 28 Mar 2024 01:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="oPRffBx3"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B0BA2F;
	Thu, 28 Mar 2024 01:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711588201; cv=none; b=hQpoq88nzRKpseBONJ99ghPq1y+YWe2IenbcNczjzOQpN+84ApWoN2wk0tX2MXHPMF5jBYU5lZxlfKt1jYOANnzyytGxaQjHsn1gJ63ADp6huCbbr7MpcbiighumsR6Pd2CZdk07u3LdLYgEl81VpVU9fBZHo1NQu5sDuktkE9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711588201; c=relaxed/simple;
	bh=pX9cg8PWFFZxY90yuXhd2Sk9RgItIRCGIn5dby1LLvE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oFCqlVO2SJmc4zd3uHeN4QmVjapy/cXKvDjZSn2VrUGdqQtYujq3L6LANnZ8TRewfbqBAQgQanQbLvEaqBVzlPyxxqrhXECqMFr2IVIAc44UdWUfbL4iLBUYQQgDJ78ZIL5rYO5/ufO9+KELo45AAFSHV54tDJVQtbkQr4u9s+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=sberdevices.ru; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=oPRffBx3; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sberdevices.ru
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B609E120012;
	Thu, 28 Mar 2024 04:09:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B609E120012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711588190;
	bh=sRGfzM/5bmDJUDD0SgwIJ+72ZbLb/6kuGJ4cypSvv/4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=oPRffBx3+L7/UD0cDMI8UdszNMdUoNtunyRFfjcWhQTJ14PtH+O2IL6P4t33oEv6X
	 23f/D7Gkb+aGIVrHgL/vVn4cYfd38IEIpOZi7U5buZFLQiwlOJtnctyh6s2t8hFfFE
	 Lt3WNCEE91vYfZzvA0zTn9SBzQQyYKZUpKUimvcUHICvUEO4ujv/ex1qYWavJJrVLQ
	 QLgDpVa2oz7B6/48s/xrfVTFdY74oVn2Yh5JGZLXyfjC5L9aFH0L0teY1xAE1EvJmg
	 mEEI4KawV3cQVzT5xk4FFWJdqbE02fspisDAW0pIxUy68bfUskS9oMJcnEfIMk5PKS
	 cS/mS+90MX7YQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 04:09:50 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 04:09:47 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH v2 4/5] clk: meson: a1: add the audio clock controller driver
Date: Thu, 28 Mar 2024 04:08:30 +0300
Message-ID: <20240328010831.884487-5-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184457 [Mar 27 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 13 0.3.13 9d58e50253d512f89cb08f71c87c671a2d0a1bca, {Tracking_smtp_not_equal_from}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;100.64.160.123:7.1.2;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/27 22:31:00 #24479773
X-KSMG-AntiVirus-Status: Clean, skipped

This controller provides clocks and reset functionality for audio
peripherals on Amlogic A1 SoC family.

The driver is almost identical to 'axg-audio', however it would be better
to keep it separate due to following reasons:

 - significant amount of bits has another definition. I will bring there
   a mess of new defines with A1_ suffixes.

 - registers of this controller are located in two separate regions. It
   will give a lot of complications for 'axg-audio' to support this.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 drivers/clk/meson/Kconfig    |  13 +
 drivers/clk/meson/Makefile   |   1 +
 drivers/clk/meson/a1-audio.c | 624 +++++++++++++++++++++++++++++++++++
 drivers/clk/meson/a1-audio.h |  45 +++
 4 files changed, 683 insertions(+)
 create mode 100644 drivers/clk/meson/a1-audio.c
 create mode 100644 drivers/clk/meson/a1-audio.h

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index d6a2fa5f7e88..80c4a18c83d2 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -133,6 +133,19 @@ config COMMON_CLK_A1_PERIPHERALS
 	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
 	  controller to work.
 
+config COMMON_CLK_A1_AUDIO
+	tristate "Amlogic A1 SoC Audio clock controller support"
+	depends on ARM64
+	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
+	select COMMON_CLK_MESON_PHASE
+	select COMMON_CLK_MESON_SCLK_DIV
+	select COMMON_CLK_MESON_AUDIO_RSTC
+	help
+	  Support for the Audio clock controller on Amlogic A113L based
+	  device, A1 SoC Family. Say Y if you want A1 Audio clock controller
+	  to work.
+
 config COMMON_CLK_G12A
 	tristate "G12 and SM1 SoC clock controllers support"
 	depends on ARM64
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 88d94921a4dc..4968fc7ad555 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
 obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
 obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
 obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
+obj-$(CONFIG_COMMON_CLK_A1_AUDIO) += a1-audio.o
 obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
 obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
diff --git a/drivers/clk/meson/a1-audio.c b/drivers/clk/meson/a1-audio.c
new file mode 100644
index 000000000000..bd2b6dde75d4
--- /dev/null
+++ b/drivers/clk/meson/a1-audio.c
@@ -0,0 +1,624 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
+ *
+ * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/init.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+
+#include "meson-clkc-utils.h"
+#include "meson-audio-rstc.h"
+#include "meson-audio.h"
+#include "clk-regmap.h"
+#include "clk-phase.h"
+#include "sclk-div.h"
+#include "a1-audio.h"
+
+static const struct clk_parent_data a1_pclk_pdata[] = {
+	{ .fw_name = "pclk" },
+};
+
+#define AUD_PCLK_GATE(_name, _reg, _bit) {				\
+	.data = &(struct clk_regmap_gate_data){				\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = "aud_"#_name,					\
+		.ops = &clk_regmap_gate_ops,				\
+		.parent_data = a1_pclk_pdata,				\
+		.num_parents = 1,					\
+	},								\
+}
+
+struct clk_regmap aud_ddr_arb =
+	AUD_PCLK_GATE(ddr_arb, AUDIO_CLK_GATE_EN0, 0);
+struct clk_regmap aud_tdmin_a =
+	AUD_PCLK_GATE(tdmin_a, AUDIO_CLK_GATE_EN0, 1);
+struct clk_regmap aud_tdmin_b =
+	AUD_PCLK_GATE(tdmin_b, AUDIO_CLK_GATE_EN0, 2);
+struct clk_regmap aud_tdmin_lb =
+	AUD_PCLK_GATE(tdmin_lb, AUDIO_CLK_GATE_EN0, 3);
+struct clk_regmap aud_loopback =
+	AUD_PCLK_GATE(loopback, AUDIO_CLK_GATE_EN0, 4);
+struct clk_regmap aud_tdmout_a =
+	AUD_PCLK_GATE(tdmout_a, AUDIO_CLK_GATE_EN0, 5);
+struct clk_regmap aud_tdmout_b =
+	AUD_PCLK_GATE(tdmout_b, AUDIO_CLK_GATE_EN0, 6);
+struct clk_regmap aud_frddr_a =
+	AUD_PCLK_GATE(frddr_a, AUDIO_CLK_GATE_EN0, 7);
+struct clk_regmap aud_frddr_b =
+	AUD_PCLK_GATE(frddr_b, AUDIO_CLK_GATE_EN0, 8);
+struct clk_regmap aud_toddr_a =
+	AUD_PCLK_GATE(toddr_a, AUDIO_CLK_GATE_EN0, 9);
+struct clk_regmap aud_toddr_b =
+	AUD_PCLK_GATE(toddr_b, AUDIO_CLK_GATE_EN0, 10);
+struct clk_regmap aud_spdifin =
+	AUD_PCLK_GATE(spdifin, AUDIO_CLK_GATE_EN0, 11);
+struct clk_regmap aud_resample =
+	AUD_PCLK_GATE(resample, AUDIO_CLK_GATE_EN0, 12);
+struct clk_regmap aud_eqdrc =
+	AUD_PCLK_GATE(eqdrc, AUDIO_CLK_GATE_EN0, 13);
+struct clk_regmap aud_audiolocker =
+	AUD_PCLK_GATE(audiolocker, AUDIO_CLK_GATE_EN0, 14);
+
+struct clk_regmap aud2_ddr_arb =
+	AUD_PCLK_GATE(2_ddr_arb, AUDIO2_CLK_GATE_EN0, 0);
+struct clk_regmap aud2_pdm =
+	AUD_PCLK_GATE(2_pdm, AUDIO2_CLK_GATE_EN0, 1);
+struct clk_regmap aud2_tdmin_vad =
+	AUD_PCLK_GATE(2_tdmin_vad, AUDIO2_CLK_GATE_EN0, 2);
+struct clk_regmap aud2_toddr_vad =
+	AUD_PCLK_GATE(2_toddr_vad, AUDIO2_CLK_GATE_EN0, 3);
+struct clk_regmap aud2_vad =
+	AUD_PCLK_GATE(2_vad, AUDIO2_CLK_GATE_EN0, 4);
+struct clk_regmap aud2_audiotop =
+	AUD_PCLK_GATE(2_audiotop, AUDIO2_CLK_GATE_EN0, 7);
+
+static const struct clk_parent_data a1_mst_pdata[] = {
+	{ .fw_name = "dds_in" },
+	{ .fw_name = "fclk_div2" },
+	{ .fw_name = "fclk_div3" },
+	{ .fw_name = "hifi_pll" },
+	{ .fw_name = "xtal" },
+};
+
+#define AUD_MST_MCLK_MUX(_name, _reg)					\
+	AUD_MUX(_name##_sel, _reg, 0x7, 24, CLK_MUX_ROUND_CLOSEST,	\
+		a1_mst_pdata, 0)
+#define AUD_MST_MCLK_DIV(_name, _reg)					\
+	AUD_DIV(_name##_div, _reg, 0, 16, CLK_DIVIDER_ROUND_CLOSEST,	\
+		aud_##_name##_sel, CLK_SET_RATE_PARENT)
+#define AUD_MST_MCLK_GATE(_name, _reg)					\
+	AUD_GATE(_name, _reg, 31, aud_##_name##_div,			\
+		 CLK_SET_RATE_PARENT)
+
+struct clk_regmap aud_mst_a_mclk_mux =
+	AUD_MST_MCLK_MUX(mst_a_mclk, AUDIO_MCLK_A_CTRL);
+struct clk_regmap aud_mst_a_mclk_div =
+	AUD_MST_MCLK_DIV(mst_a_mclk, AUDIO_MCLK_A_CTRL);
+struct clk_regmap aud_mst_a_mclk =
+	AUD_MST_MCLK_GATE(mst_a_mclk, AUDIO_MCLK_A_CTRL);
+
+struct clk_regmap aud_mst_b_mclk_mux =
+	AUD_MST_MCLK_MUX(mst_b_mclk, AUDIO_MCLK_B_CTRL);
+struct clk_regmap aud_mst_b_mclk_div =
+	AUD_MST_MCLK_DIV(mst_b_mclk, AUDIO_MCLK_B_CTRL);
+struct clk_regmap aud_mst_b_mclk =
+	AUD_MST_MCLK_GATE(mst_b_mclk, AUDIO_MCLK_B_CTRL);
+
+struct clk_regmap aud_mst_c_mclk_mux =
+	AUD_MST_MCLK_MUX(mst_c_mclk, AUDIO_MCLK_C_CTRL);
+struct clk_regmap aud_mst_c_mclk_div =
+	AUD_MST_MCLK_DIV(mst_c_mclk, AUDIO_MCLK_C_CTRL);
+struct clk_regmap aud_mst_c_mclk =
+	AUD_MST_MCLK_GATE(mst_c_mclk, AUDIO_MCLK_C_CTRL);
+
+struct clk_regmap aud_mst_d_mclk_mux =
+	AUD_MST_MCLK_MUX(mst_d_mclk, AUDIO_MCLK_D_CTRL);
+struct clk_regmap aud_mst_d_mclk_div =
+	AUD_MST_MCLK_DIV(mst_d_mclk, AUDIO_MCLK_D_CTRL);
+struct clk_regmap aud_mst_d_mclk =
+	AUD_MST_MCLK_GATE(mst_d_mclk, AUDIO_MCLK_D_CTRL);
+
+struct clk_regmap aud_spdifin_clk_mux =
+	AUD_MST_MCLK_MUX(spdifin_clk, AUDIO_CLK_SPDIFIN_CTRL);
+struct clk_regmap aud_spdifin_clk_div =
+	AUD_MST_MCLK_DIV(spdifin_clk, AUDIO_CLK_SPDIFIN_CTRL);
+struct clk_regmap aud_spdifin_clk =
+	AUD_MST_MCLK_GATE(spdifin_clk, AUDIO_CLK_SPDIFIN_CTRL);
+
+struct clk_regmap aud_eqdrc_clk_mux =
+	AUD_MST_MCLK_MUX(eqdrc_clk, AUDIO_CLK_EQDRC_CTRL);
+struct clk_regmap aud_eqdrc_clk_div =
+	AUD_MST_MCLK_DIV(eqdrc_clk, AUDIO_CLK_EQDRC_CTRL);
+struct clk_regmap aud_eqdrc_clk =
+	AUD_MST_MCLK_GATE(eqdrc_clk, AUDIO_CLK_EQDRC_CTRL);
+
+struct clk_regmap aud_resample_clk_mux =
+	AUD_MUX(resample_clk_sel, AUDIO_CLK_RESAMPLE_CTRL, 0xf, 24,
+		CLK_MUX_ROUND_CLOSEST, a1_mst_pdata, CLK_SET_RATE_PARENT);
+struct clk_regmap aud_resample_clk_div =
+	AUD_DIV(resample_clk_div, AUDIO_CLK_RESAMPLE_CTRL, 0, 8,
+		CLK_DIVIDER_ROUND_CLOSEST, resample_clk_sel, CLK_SET_RATE_PARENT);
+struct clk_regmap aud_resample_clk =
+	AUD_GATE(resample_clk, AUDIO_CLK_RESAMPLE_CTRL, 31,
+		 resample_clk_div, CLK_SET_RATE_PARENT);
+
+struct clk_regmap aud_locker_in_clk_mux =
+	AUD_MUX(locker_in_clk_sel, AUDIO_CLK_LOCKER_CTRL, 0xf, 8,
+		CLK_MUX_ROUND_CLOSEST, a1_mst_pdata, CLK_SET_RATE_PARENT);
+struct clk_regmap aud_locker_in_clk_div =
+	AUD_DIV(locker_in_clk_div, AUDIO_CLK_LOCKER_CTRL, 0, 8,
+		CLK_DIVIDER_ROUND_CLOSEST, locker_in_clk_sel, CLK_SET_RATE_PARENT);
+struct clk_regmap aud_locker_in_clk =
+	AUD_GATE(locker_in_clk, AUDIO_CLK_LOCKER_CTRL, 15,
+		 locker_in_clk_div, CLK_SET_RATE_PARENT);
+
+struct clk_regmap aud_locker_out_clk_mux =
+	AUD_MUX(locker_out_clk_sel, AUDIO_CLK_LOCKER_CTRL, 0xf, 24,
+		CLK_MUX_ROUND_CLOSEST, a1_mst_pdata, CLK_SET_RATE_PARENT);
+struct clk_regmap aud_locker_out_clk_div =
+	AUD_DIV(locker_out_clk_div, AUDIO_CLK_LOCKER_CTRL, 16, 8,
+		CLK_DIVIDER_ROUND_CLOSEST, locker_out_clk_sel, CLK_SET_RATE_PARENT);
+struct clk_regmap aud_locker_out_clk =
+	AUD_GATE(locker_out_clk, AUDIO_CLK_LOCKER_CTRL, 31,
+		 locker_out_clk_div, CLK_SET_RATE_PARENT);
+
+struct clk_regmap aud2_vad_mclk_mux =
+	AUD_MST_MCLK_MUX(2_vad_mclk, AUDIO2_MCLK_VAD_CTRL);
+struct clk_regmap aud2_vad_mclk_div =
+	AUD_MST_MCLK_DIV(2_vad_mclk, AUDIO2_MCLK_VAD_CTRL);
+struct clk_regmap aud2_vad_mclk =
+	AUD_MST_MCLK_GATE(2_vad_mclk, AUDIO2_MCLK_VAD_CTRL);
+
+struct clk_regmap aud2_vad_clk_mux =
+	AUD_MST_MCLK_MUX(2_vad_clk, AUDIO2_CLK_VAD_CTRL);
+struct clk_regmap aud2_vad_clk_div =
+	AUD_MST_MCLK_DIV(2_vad_clk, AUDIO2_CLK_VAD_CTRL);
+struct clk_regmap aud2_vad_clk =
+	AUD_MST_MCLK_GATE(2_vad_clk, AUDIO2_CLK_VAD_CTRL);
+
+struct clk_regmap aud2_pdm_dclk_mux =
+	AUD_MST_MCLK_MUX(2_pdm_dclk, AUDIO2_CLK_PDMIN_CTRL0);
+struct clk_regmap aud2_pdm_dclk_div =
+	AUD_MST_MCLK_DIV(2_pdm_dclk, AUDIO2_CLK_PDMIN_CTRL0);
+struct clk_regmap aud2_pdm_dclk =
+	AUD_MST_MCLK_GATE(2_pdm_dclk, AUDIO2_CLK_PDMIN_CTRL0);
+
+struct clk_regmap aud2_pdm_sysclk_mux =
+	AUD_MST_MCLK_MUX(2_pdm_sysclk, AUDIO2_CLK_PDMIN_CTRL1);
+struct clk_regmap aud2_pdm_sysclk_div =
+	AUD_MST_MCLK_DIV(2_pdm_sysclk, AUDIO2_CLK_PDMIN_CTRL1);
+struct clk_regmap aud2_pdm_sysclk =
+	AUD_MST_MCLK_GATE(2_pdm_sysclk, AUDIO2_CLK_PDMIN_CTRL1);
+
+#define AUD_MST_SCLK_PRE_EN(_name, _reg, _pname)			\
+	AUD_GATE(_name##_pre_en, _reg, 31,				\
+		 aud_##_pname, 0)
+#define AUD_MST_SCLK_DIV(_name, _reg)					\
+	AUD_SCLK_DIV(_name##_div, _reg, 20, 10, 0, 0,			\
+		     aud_##_name##_pre_en, CLK_SET_RATE_PARENT)
+#define AUD_MST_SCLK_POST_EN(_name, _reg)				\
+	AUD_GATE(_name##_post_en, _reg, 30,				\
+		 aud_##_name##_div, CLK_SET_RATE_PARENT)
+#define AUD_MST_SCLK(_name, _reg)					\
+	AUD_TRIPHASE(_name, _reg, 1, 0, 2, 4,				\
+		     aud_##_name##_post_en, CLK_SET_RATE_PARENT)
+
+struct clk_regmap aud_mst_a_sclk_pre_en =
+	AUD_MST_SCLK_PRE_EN(mst_a_sclk, AUDIO_MST_A_SCLK_CTRL0, mst_a_mclk);
+struct clk_regmap aud_mst_a_sclk_div =
+	AUD_MST_SCLK_DIV(mst_a_sclk, AUDIO_MST_A_SCLK_CTRL0);
+struct clk_regmap aud_mst_a_sclk_post_en =
+	AUD_MST_SCLK_POST_EN(mst_a_sclk, AUDIO_MST_A_SCLK_CTRL0);
+struct clk_regmap aud_mst_a_sclk =
+	AUD_MST_SCLK(mst_a_sclk, AUDIO_MST_A_SCLK_CTRL1);
+
+struct clk_regmap aud_mst_b_sclk_pre_en =
+	AUD_MST_SCLK_PRE_EN(mst_b_sclk, AUDIO_MST_B_SCLK_CTRL0, mst_b_mclk);
+struct clk_regmap aud_mst_b_sclk_div =
+	AUD_MST_SCLK_DIV(mst_b_sclk, AUDIO_MST_B_SCLK_CTRL0);
+struct clk_regmap aud_mst_b_sclk_post_en =
+	AUD_MST_SCLK_POST_EN(mst_b_sclk, AUDIO_MST_B_SCLK_CTRL0);
+struct clk_regmap aud_mst_b_sclk =
+	AUD_MST_SCLK(mst_b_sclk, AUDIO_MST_B_SCLK_CTRL1);
+
+struct clk_regmap aud_mst_c_sclk_pre_en =
+	AUD_MST_SCLK_PRE_EN(mst_c_sclk, AUDIO_MST_C_SCLK_CTRL0, mst_c_mclk);
+struct clk_regmap aud_mst_c_sclk_div =
+	AUD_MST_SCLK_DIV(mst_c_sclk, AUDIO_MST_C_SCLK_CTRL0);
+struct clk_regmap aud_mst_c_sclk_post_en =
+	AUD_MST_SCLK_POST_EN(mst_c_sclk, AUDIO_MST_C_SCLK_CTRL0);
+struct clk_regmap aud_mst_c_sclk =
+	AUD_MST_SCLK(mst_c_sclk, AUDIO_MST_C_SCLK_CTRL1);
+
+struct clk_regmap aud_mst_d_sclk_pre_en =
+	AUD_MST_SCLK_PRE_EN(mst_d_sclk, AUDIO_MST_D_SCLK_CTRL0, mst_d_mclk);
+struct clk_regmap aud_mst_d_sclk_div =
+	AUD_MST_SCLK_DIV(mst_d_sclk, AUDIO_MST_D_SCLK_CTRL0);
+struct clk_regmap aud_mst_d_sclk_post_en =
+	AUD_MST_SCLK_POST_EN(mst_d_sclk, AUDIO_MST_D_SCLK_CTRL0);
+struct clk_regmap aud_mst_d_sclk =
+	AUD_MST_SCLK(mst_d_sclk, AUDIO_MST_D_SCLK_CTRL1);
+
+#define AUD_MST_LRCLK_DIV(_name, _reg, _pname)				\
+	AUD_SCLK_DIV(_name##_div, _reg, 0, 10, 10, 10,			\
+		     aud_##_pname, 0)
+#define AUD_MST_LRCLK(_name, _reg)					\
+	AUD_TRIPHASE(_name, _reg, 1, 1, 3, 5,				\
+		     aud_##_name##_div, CLK_SET_RATE_PARENT)
+
+struct clk_regmap aud_mst_a_lrclk_div =
+	AUD_MST_LRCLK_DIV(mst_a_lrclk, AUDIO_MST_A_SCLK_CTRL0, mst_a_sclk_post_en);
+struct clk_regmap aud_mst_a_lrclk =
+	AUD_MST_LRCLK(mst_a_lrclk, AUDIO_MST_A_SCLK_CTRL1);
+
+struct clk_regmap aud_mst_b_lrclk_div =
+	AUD_MST_LRCLK_DIV(mst_b_lrclk, AUDIO_MST_B_SCLK_CTRL0, mst_b_sclk_post_en);
+struct clk_regmap aud_mst_b_lrclk =
+	AUD_MST_LRCLK(mst_b_lrclk, AUDIO_MST_B_SCLK_CTRL1);
+
+struct clk_regmap aud_mst_c_lrclk_div =
+	AUD_MST_LRCLK_DIV(mst_c_lrclk, AUDIO_MST_C_SCLK_CTRL0, mst_c_sclk_post_en);
+struct clk_regmap aud_mst_c_lrclk =
+	AUD_MST_LRCLK(mst_c_lrclk, AUDIO_MST_C_SCLK_CTRL1);
+
+struct clk_regmap aud_mst_d_lrclk_div =
+	AUD_MST_LRCLK_DIV(mst_d_lrclk, AUDIO_MST_D_SCLK_CTRL0, mst_d_sclk_post_en);
+struct clk_regmap aud_mst_d_lrclk =
+	AUD_MST_LRCLK(mst_d_lrclk, AUDIO_MST_D_SCLK_CTRL1);
+
+static const struct clk_parent_data a1_mst_sclk_pdata[] = {
+	{ .hw = &aud_mst_a_sclk.hw, .index = -1 },
+	{ .hw = &aud_mst_b_sclk.hw, .index = -1 },
+	{ .hw = &aud_mst_c_sclk.hw, .index = -1 },
+	{ .hw = &aud_mst_d_sclk.hw, .index = -1 },
+	{ .fw_name = "slv_sclk0" },
+	{ .fw_name = "slv_sclk1" },
+	{ .fw_name = "slv_sclk2" },
+	{ .fw_name = "slv_sclk3" },
+	{ .fw_name = "slv_sclk4" },
+	{ .fw_name = "slv_sclk5" },
+	{ .fw_name = "slv_sclk6" },
+	{ .fw_name = "slv_sclk7" },
+	{ .fw_name = "slv_sclk8" },
+	{ .fw_name = "slv_sclk9" },
+};
+
+static const struct clk_parent_data a1_mst_lrclk_pdata[] = {
+	{ .hw = &aud_mst_a_lrclk.hw, .index = -1 },
+	{ .hw = &aud_mst_b_lrclk.hw, .index = -1 },
+	{ .hw = &aud_mst_c_lrclk.hw, .index = -1 },
+	{ .hw = &aud_mst_d_lrclk.hw, .index = -1 },
+	{ .fw_name = "slv_lrclk0" },
+	{ .fw_name = "slv_lrclk1" },
+	{ .fw_name = "slv_lrclk2" },
+	{ .fw_name = "slv_lrclk3" },
+	{ .fw_name = "slv_lrclk4" },
+	{ .fw_name = "slv_lrclk5" },
+	{ .fw_name = "slv_lrclk6" },
+	{ .fw_name = "slv_lrclk7" },
+	{ .fw_name = "slv_lrclk8" },
+	{ .fw_name = "slv_lrclk9" },
+};
+
+#define AUD_TDM_SCLK_MUX(_name, _reg)					\
+	AUD_MUX(_name##_sel, _reg, 0xf, 24,				\
+		CLK_MUX_ROUND_CLOSEST, a1_mst_sclk_pdata, 0)
+#define AUD_TDM_SCLK_PRE_EN(_name, _reg)				\
+	AUD_GATE(_name##_pre_en, _reg, 31,				\
+		 aud_##_name##_sel, CLK_SET_RATE_PARENT)
+#define AUD_TDM_SCLK_POST_EN(_name, _reg)				\
+	AUD_GATE(_name##_post_en, _reg, 30,				\
+		 aud_##_name##_pre_en, CLK_SET_RATE_PARENT)
+#define AUD_TDM_SCLK_WS(_name, _reg)					\
+	AUD_SCLK_WS(_name, _reg, 1, 29, 28,				\
+		    aud_##_name##_post_en,				\
+		    CLK_DUTY_CYCLE_PARENT | CLK_SET_RATE_PARENT)
+
+#define AUD_TDM_LRLCK(_name, _reg)					\
+	AUD_MUX(_name, _reg, 0xf, 20,					\
+		CLK_MUX_ROUND_CLOSEST, a1_mst_lrclk_pdata,		\
+		CLK_SET_RATE_PARENT)
+
+struct clk_regmap aud_tdmin_a_sclk_mux =
+	AUD_TDM_SCLK_MUX(tdmin_a_sclk, AUDIO_CLK_TDMIN_A_CTRL);
+struct clk_regmap aud_tdmin_a_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(tdmin_a_sclk, AUDIO_CLK_TDMIN_A_CTRL);
+struct clk_regmap aud_tdmin_a_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(tdmin_a_sclk, AUDIO_CLK_TDMIN_A_CTRL);
+struct clk_regmap aud_tdmin_a_sclk =
+	AUD_TDM_SCLK_WS(tdmin_a_sclk, AUDIO_CLK_TDMIN_A_CTRL);
+struct clk_regmap aud_tdmin_a_lrclk =
+	AUD_TDM_LRLCK(tdmin_a_lrclk, AUDIO_CLK_TDMIN_A_CTRL);
+
+struct clk_regmap aud_tdmin_b_sclk_mux =
+	AUD_TDM_SCLK_MUX(tdmin_b_sclk, AUDIO_CLK_TDMIN_B_CTRL);
+struct clk_regmap aud_tdmin_b_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(tdmin_b_sclk, AUDIO_CLK_TDMIN_B_CTRL);
+struct clk_regmap aud_tdmin_b_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(tdmin_b_sclk, AUDIO_CLK_TDMIN_B_CTRL);
+struct clk_regmap aud_tdmin_b_sclk =
+	AUD_TDM_SCLK_WS(tdmin_b_sclk, AUDIO_CLK_TDMIN_B_CTRL);
+struct clk_regmap aud_tdmin_b_lrclk =
+	AUD_TDM_LRLCK(tdmin_b_lrclk, AUDIO_CLK_TDMIN_B_CTRL);
+
+struct clk_regmap aud_tdmin_lb_sclk_mux =
+	AUD_TDM_SCLK_MUX(tdmin_lb_sclk, AUDIO_CLK_TDMIN_LB_CTRL);
+struct clk_regmap aud_tdmin_lb_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(tdmin_lb_sclk, AUDIO_CLK_TDMIN_LB_CTRL);
+struct clk_regmap aud_tdmin_lb_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(tdmin_lb_sclk, AUDIO_CLK_TDMIN_LB_CTRL);
+struct clk_regmap aud_tdmin_lb_sclk =
+	AUD_TDM_SCLK_WS(tdmin_lb_sclk, AUDIO_CLK_TDMIN_LB_CTRL);
+struct clk_regmap aud_tdmin_lb_lrclk =
+	AUD_TDM_LRLCK(tdmin_lb_lrclk, AUDIO_CLK_TDMIN_LB_CTRL);
+
+struct clk_regmap aud_tdmout_a_sclk_mux =
+	AUD_TDM_SCLK_MUX(tdmout_a_sclk, AUDIO_CLK_TDMOUT_A_CTRL);
+struct clk_regmap aud_tdmout_a_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(tdmout_a_sclk, AUDIO_CLK_TDMOUT_A_CTRL);
+struct clk_regmap aud_tdmout_a_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(tdmout_a_sclk, AUDIO_CLK_TDMOUT_A_CTRL);
+struct clk_regmap aud_tdmout_a_sclk =
+	AUD_TDM_SCLK_WS(tdmout_a_sclk, AUDIO_CLK_TDMOUT_A_CTRL);
+struct clk_regmap aud_tdmout_a_lrclk =
+	AUD_TDM_LRLCK(tdmout_a_lrclk, AUDIO_CLK_TDMOUT_A_CTRL);
+
+struct clk_regmap aud_tdmout_b_sclk_mux =
+	AUD_TDM_SCLK_MUX(tdmout_b_sclk, AUDIO_CLK_TDMOUT_B_CTRL);
+struct clk_regmap aud_tdmout_b_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(tdmout_b_sclk, AUDIO_CLK_TDMOUT_B_CTRL);
+struct clk_regmap aud_tdmout_b_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(tdmout_b_sclk, AUDIO_CLK_TDMOUT_B_CTRL);
+struct clk_regmap aud_tdmout_b_sclk =
+	AUD_TDM_SCLK_WS(tdmout_b_sclk, AUDIO_CLK_TDMOUT_B_CTRL);
+struct clk_regmap aud_tdmout_b_lrclk =
+	AUD_TDM_LRLCK(tdmout_b_lrclk, AUDIO_CLK_TDMOUT_B_CTRL);
+
+static struct clk_hw *a1_audio_hw_clks[] = {
+	[AUD_CLKID_DDR_ARB]		= &aud_ddr_arb.hw,
+	[AUD_CLKID_TDMIN_A]		= &aud_tdmin_a.hw,
+	[AUD_CLKID_TDMIN_B]		= &aud_tdmin_b.hw,
+	[AUD_CLKID_TDMIN_LB]		= &aud_tdmin_lb.hw,
+	[AUD_CLKID_LOOPBACK]		= &aud_loopback.hw,
+	[AUD_CLKID_TDMOUT_A]		= &aud_tdmout_a.hw,
+	[AUD_CLKID_TDMOUT_B]		= &aud_tdmout_b.hw,
+	[AUD_CLKID_FRDDR_A]		= &aud_frddr_a.hw,
+	[AUD_CLKID_FRDDR_B]		= &aud_frddr_b.hw,
+	[AUD_CLKID_TODDR_A]		= &aud_toddr_a.hw,
+	[AUD_CLKID_TODDR_B]		= &aud_toddr_b.hw,
+	[AUD_CLKID_SPDIFIN]		= &aud_spdifin.hw,
+	[AUD_CLKID_RESAMPLE]		= &aud_resample.hw,
+	[AUD_CLKID_EQDRC]		= &aud_eqdrc.hw,
+	[AUD_CLKID_LOCKER]		= &aud_audiolocker.hw,
+	[AUD_CLKID_MST_A_MCLK_SEL]	= &aud_mst_a_mclk_mux.hw,
+	[AUD_CLKID_MST_A_MCLK_DIV]	= &aud_mst_a_mclk_div.hw,
+	[AUD_CLKID_MST_A_MCLK]		= &aud_mst_a_mclk.hw,
+	[AUD_CLKID_MST_B_MCLK_SEL]	= &aud_mst_b_mclk_mux.hw,
+	[AUD_CLKID_MST_B_MCLK_DIV]	= &aud_mst_b_mclk_div.hw,
+	[AUD_CLKID_MST_B_MCLK]		= &aud_mst_b_mclk.hw,
+	[AUD_CLKID_MST_C_MCLK_SEL]	= &aud_mst_c_mclk_mux.hw,
+	[AUD_CLKID_MST_C_MCLK_DIV]	= &aud_mst_c_mclk_div.hw,
+	[AUD_CLKID_MST_C_MCLK]		= &aud_mst_c_mclk.hw,
+	[AUD_CLKID_MST_D_MCLK_SEL]	= &aud_mst_d_mclk_mux.hw,
+	[AUD_CLKID_MST_D_MCLK_DIV]	= &aud_mst_d_mclk_div.hw,
+	[AUD_CLKID_MST_D_MCLK]		= &aud_mst_d_mclk.hw,
+	[AUD_CLKID_RESAMPLE_CLK_SEL]	= &aud_resample_clk_mux.hw,
+	[AUD_CLKID_RESAMPLE_CLK_DIV]	= &aud_resample_clk_div.hw,
+	[AUD_CLKID_RESAMPLE_CLK]	= &aud_resample_clk.hw,
+	[AUD_CLKID_LOCKER_IN_CLK_SEL]	= &aud_locker_in_clk_mux.hw,
+	[AUD_CLKID_LOCKER_IN_CLK_DIV]	= &aud_locker_in_clk_div.hw,
+	[AUD_CLKID_LOCKER_IN_CLK]	= &aud_locker_in_clk.hw,
+	[AUD_CLKID_LOCKER_OUT_CLK_SEL]	= &aud_locker_out_clk_mux.hw,
+	[AUD_CLKID_LOCKER_OUT_CLK_DIV]	= &aud_locker_out_clk_div.hw,
+	[AUD_CLKID_LOCKER_OUT_CLK]	= &aud_locker_out_clk.hw,
+	[AUD_CLKID_SPDIFIN_CLK_SEL]	= &aud_spdifin_clk_mux.hw,
+	[AUD_CLKID_SPDIFIN_CLK_DIV]	= &aud_spdifin_clk_div.hw,
+	[AUD_CLKID_SPDIFIN_CLK]		= &aud_spdifin_clk.hw,
+	[AUD_CLKID_EQDRC_CLK_SEL]	= &aud_eqdrc_clk_mux.hw,
+	[AUD_CLKID_EQDRC_CLK_DIV]	= &aud_eqdrc_clk_div.hw,
+	[AUD_CLKID_EQDRC_CLK]		= &aud_eqdrc_clk.hw,
+	[AUD_CLKID_MST_A_SCLK_PRE_EN]	= &aud_mst_a_sclk_pre_en.hw,
+	[AUD_CLKID_MST_A_SCLK_DIV]	= &aud_mst_a_sclk_div.hw,
+	[AUD_CLKID_MST_A_SCLK_POST_EN]	= &aud_mst_a_sclk_post_en.hw,
+	[AUD_CLKID_MST_A_SCLK]		= &aud_mst_a_sclk.hw,
+	[AUD_CLKID_MST_B_SCLK_PRE_EN]	= &aud_mst_b_sclk_pre_en.hw,
+	[AUD_CLKID_MST_B_SCLK_DIV]	= &aud_mst_b_sclk_div.hw,
+	[AUD_CLKID_MST_B_SCLK_POST_EN]	= &aud_mst_b_sclk_post_en.hw,
+	[AUD_CLKID_MST_B_SCLK]		= &aud_mst_b_sclk.hw,
+	[AUD_CLKID_MST_C_SCLK_PRE_EN]	= &aud_mst_c_sclk_pre_en.hw,
+	[AUD_CLKID_MST_C_SCLK_DIV]	= &aud_mst_c_sclk_div.hw,
+	[AUD_CLKID_MST_C_SCLK_POST_EN]	= &aud_mst_c_sclk_post_en.hw,
+	[AUD_CLKID_MST_C_SCLK]		= &aud_mst_c_sclk.hw,
+	[AUD_CLKID_MST_D_SCLK_PRE_EN]	= &aud_mst_d_sclk_pre_en.hw,
+	[AUD_CLKID_MST_D_SCLK_DIV]	= &aud_mst_d_sclk_div.hw,
+	[AUD_CLKID_MST_D_SCLK_POST_EN]	= &aud_mst_d_sclk_post_en.hw,
+	[AUD_CLKID_MST_D_SCLK]		= &aud_mst_d_sclk.hw,
+	[AUD_CLKID_MST_A_LRCLK_DIV]	= &aud_mst_a_lrclk_div.hw,
+	[AUD_CLKID_MST_A_LRCLK]		= &aud_mst_a_lrclk.hw,
+	[AUD_CLKID_MST_B_LRCLK_DIV]	= &aud_mst_b_lrclk_div.hw,
+	[AUD_CLKID_MST_B_LRCLK]		= &aud_mst_b_lrclk.hw,
+	[AUD_CLKID_MST_C_LRCLK_DIV]	= &aud_mst_c_lrclk_div.hw,
+	[AUD_CLKID_MST_C_LRCLK]		= &aud_mst_c_lrclk.hw,
+	[AUD_CLKID_MST_D_LRCLK_DIV]	= &aud_mst_d_lrclk_div.hw,
+	[AUD_CLKID_MST_D_LRCLK]		= &aud_mst_d_lrclk.hw,
+	[AUD_CLKID_TDMIN_A_SCLK_SEL]	= &aud_tdmin_a_sclk_mux.hw,
+	[AUD_CLKID_TDMIN_A_SCLK_PRE_EN]	= &aud_tdmin_a_sclk_pre_en.hw,
+	[AUD_CLKID_TDMIN_A_SCLK_POST_EN] = &aud_tdmin_a_sclk_post_en.hw,
+	[AUD_CLKID_TDMIN_A_SCLK]	= &aud_tdmin_a_sclk.hw,
+	[AUD_CLKID_TDMIN_A_LRCLK]	= &aud_tdmin_a_lrclk.hw,
+	[AUD_CLKID_TDMIN_B_SCLK_SEL]	= &aud_tdmin_b_sclk_mux.hw,
+	[AUD_CLKID_TDMIN_B_SCLK_PRE_EN]	= &aud_tdmin_b_sclk_pre_en.hw,
+	[AUD_CLKID_TDMIN_B_SCLK_POST_EN] = &aud_tdmin_b_sclk_post_en.hw,
+	[AUD_CLKID_TDMIN_B_SCLK]	= &aud_tdmin_b_sclk.hw,
+	[AUD_CLKID_TDMIN_B_LRCLK]	= &aud_tdmin_b_lrclk.hw,
+	[AUD_CLKID_TDMIN_LB_SCLK_SEL]	= &aud_tdmin_lb_sclk_mux.hw,
+	[AUD_CLKID_TDMIN_LB_SCLK_PRE_EN] = &aud_tdmin_lb_sclk_pre_en.hw,
+	[AUD_CLKID_TDMIN_LB_SCLK_POST_EN] = &aud_tdmin_lb_sclk_post_en.hw,
+	[AUD_CLKID_TDMIN_LB_SCLK]	= &aud_tdmin_lb_sclk.hw,
+	[AUD_CLKID_TDMIN_LB_LRCLK]	= &aud_tdmin_lb_lrclk.hw,
+	[AUD_CLKID_TDMOUT_A_SCLK_SEL]	= &aud_tdmout_a_sclk_mux.hw,
+	[AUD_CLKID_TDMOUT_A_SCLK_PRE_EN] = &aud_tdmout_a_sclk_pre_en.hw,
+	[AUD_CLKID_TDMOUT_A_SCLK_POST_EN] = &aud_tdmout_a_sclk_post_en.hw,
+	[AUD_CLKID_TDMOUT_A_SCLK]	= &aud_tdmout_a_sclk.hw,
+	[AUD_CLKID_TDMOUT_A_LRCLK]	= &aud_tdmout_a_lrclk.hw,
+	[AUD_CLKID_TDMOUT_B_SCLK_SEL]	= &aud_tdmout_b_sclk_mux.hw,
+	[AUD_CLKID_TDMOUT_B_SCLK_PRE_EN] = &aud_tdmout_b_sclk_pre_en.hw,
+	[AUD_CLKID_TDMOUT_B_SCLK_POST_EN] = &aud_tdmout_b_sclk_post_en.hw,
+	[AUD_CLKID_TDMOUT_B_SCLK]	= &aud_tdmout_b_sclk.hw,
+	[AUD_CLKID_TDMOUT_B_LRCLK]	= &aud_tdmout_b_lrclk.hw,
+};
+
+static struct clk_hw *a1_audio2_hw_clks[] = {
+	[AUD2_CLKID_DDR_ARB]		= &aud2_ddr_arb.hw,
+	[AUD2_CLKID_PDM]		= &aud2_pdm.hw,
+	[AUD2_CLKID_TDMIN_VAD]		= &aud2_tdmin_vad.hw,
+	[AUD2_CLKID_TODDR_VAD]		= &aud2_toddr_vad.hw,
+	[AUD2_CLKID_VAD]		= &aud2_vad.hw,
+	[AUD2_CLKID_AUDIOTOP]		= &aud2_audiotop.hw,
+	[AUD2_CLKID_VAD_MCLK_SEL]	= &aud2_vad_mclk_mux.hw,
+	[AUD2_CLKID_VAD_MCLK_DIV]	= &aud2_vad_mclk_div.hw,
+	[AUD2_CLKID_VAD_MCLK]		= &aud2_vad_mclk.hw,
+	[AUD2_CLKID_VAD_CLK_SEL]	= &aud2_vad_clk_mux.hw,
+	[AUD2_CLKID_VAD_CLK_DIV]	= &aud2_vad_clk_div.hw,
+	[AUD2_CLKID_VAD_CLK]		= &aud2_vad_clk.hw,
+	[AUD2_CLKID_PDM_DCLK_SEL]	= &aud2_pdm_dclk_mux.hw,
+	[AUD2_CLKID_PDM_DCLK_DIV]	= &aud2_pdm_dclk_div.hw,
+	[AUD2_CLKID_PDM_DCLK]		= &aud2_pdm_dclk.hw,
+	[AUD2_CLKID_PDM_SYSCLK_SEL]	= &aud2_pdm_sysclk_mux.hw,
+	[AUD2_CLKID_PDM_SYSCLK_DIV]	= &aud2_pdm_sysclk_div.hw,
+	[AUD2_CLKID_PDM_SYSCLK]		= &aud2_pdm_sysclk.hw,
+};
+
+static int a1_register_clk(struct platform_device *pdev, struct regmap *map,
+			   struct clk_hw *hw)
+{
+	struct clk_regmap *clk = container_of(hw, struct clk_regmap, hw);
+
+	if (!hw)
+		return 0;
+
+	clk->map = map;
+
+	return devm_clk_hw_register(&pdev->dev, hw);
+}
+
+struct a1_audio_data {
+	struct meson_clk_hw_data hw_clks;
+	int core_clkid;
+	const char *core_fwname;
+	unsigned int reset_offset;
+	unsigned int reset_num;
+};
+
+static const struct regmap_config a1_audio_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int a1_audio_clkc_probe(struct platform_device *pdev)
+{
+	const struct a1_audio_data *data;
+	struct regmap *map;
+	void __iomem *base;
+	struct clk *clk;
+	unsigned int i;
+	int ret;
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -EINVAL;
+
+	if (data->core_fwname) {
+		clk = devm_clk_get_enabled(&pdev->dev, data->core_fwname);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+	}
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	map = devm_regmap_init_mmio(&pdev->dev, base, &a1_audio_regmap_cfg);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	for (i = 0; i < data->hw_clks.num; i++) {
+		struct clk_hw *hw = data->hw_clks.hws[i];
+
+		ret = a1_register_clk(pdev, map, hw);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, meson_clk_hw_get,
+					  (void *)&data->hw_clks);
+	if (ret)
+		return ret;
+
+	if (!data->reset_num)
+		return 0;
+
+	return meson_audio_rstc_register(&pdev->dev, map, data->reset_offset,
+					 data->reset_num);
+}
+
+struct a1_audio_data a1_audio_data = {
+	.hw_clks = {
+		.hws = a1_audio_hw_clks,
+		.num = ARRAY_SIZE(a1_audio_hw_clks),
+	},
+	.core_fwname = "core",
+	.reset_offset = AUDIO_SW_RESET0,
+	.reset_num = 32,
+};
+
+struct a1_audio_data a1_audio2_data = {
+	.hw_clks = {
+		.hws = a1_audio2_hw_clks,
+		.num = ARRAY_SIZE(a1_audio2_hw_clks),
+	},
+};
+
+static const struct of_device_id a1_audio_clkc_match_table[] = {
+	{
+		.compatible = "amlogic,a1-audio-clkc",
+		.data = &a1_audio_data,
+	},
+	{
+		.compatible = "amlogic,a1-audio2-clkc",
+		.data = &a1_audio2_data,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, a1_audio_clkc_match_table);
+
+static struct platform_driver a1_audio_clkc_driver = {
+	.probe = a1_audio_clkc_probe,
+	.driver = {
+		.name = "a1-audio-clkc",
+		.of_match_table = a1_audio_clkc_match_table,
+	},
+};
+module_platform_driver(a1_audio_clkc_driver);
+
+MODULE_DESCRIPTION("Amlogic A1 Audio Clock driver");
+MODULE_AUTHOR("Jan Dakinevich <jan.dakinevich@salutedevices.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/a1-audio.h b/drivers/clk/meson/a1-audio.h
new file mode 100644
index 000000000000..9ea9da21ff9b
--- /dev/null
+++ b/drivers/clk/meson/a1-audio.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
+ *
+ * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
+ */
+
+#ifndef __A1_AUDIO_H
+#define __A1_AUDIO_H
+
+#define AUDIO_CLK_GATE_EN0	0x000
+#define AUDIO_MCLK_A_CTRL	0x008
+#define AUDIO_MCLK_B_CTRL	0x00c
+#define AUDIO_MCLK_C_CTRL	0x010
+#define AUDIO_MCLK_D_CTRL	0x014
+#define AUDIO_MCLK_E_CTRL	0x018
+#define AUDIO_MCLK_F_CTRL	0x01c
+#define AUDIO_SW_RESET0		0x028
+#define AUDIO_MST_A_SCLK_CTRL0	0x040
+#define AUDIO_MST_A_SCLK_CTRL1	0x044
+#define AUDIO_MST_B_SCLK_CTRL0	0x048
+#define AUDIO_MST_B_SCLK_CTRL1	0x04c
+#define AUDIO_MST_C_SCLK_CTRL0	0x050
+#define AUDIO_MST_C_SCLK_CTRL1	0x054
+#define AUDIO_MST_D_SCLK_CTRL0	0x058
+#define AUDIO_MST_D_SCLK_CTRL1	0x05c
+#define AUDIO_CLK_TDMIN_A_CTRL	0x080
+#define AUDIO_CLK_TDMIN_B_CTRL	0x084
+#define AUDIO_CLK_TDMIN_LB_CTRL	0x08c
+#define AUDIO_CLK_TDMOUT_A_CTRL	0x090
+#define AUDIO_CLK_TDMOUT_B_CTRL	0x094
+#define AUDIO_CLK_SPDIFIN_CTRL	0x09c
+#define AUDIO_CLK_RESAMPLE_CTRL	0x0a4
+#define AUDIO_CLK_LOCKER_CTRL	0x0a8
+#define AUDIO_CLK_EQDRC_CTRL	0x0c0
+
+#define AUDIO2_CLK_GATE_EN0	0x00c
+#define AUDIO2_MCLK_VAD_CTRL	0x040
+#define AUDIO2_CLK_VAD_CTRL	0x044
+#define AUDIO2_CLK_PDMIN_CTRL0	0x058
+#define AUDIO2_CLK_PDMIN_CTRL1	0x05c
+
+#include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
+
+#endif /* __A1_AUDIO_H */
-- 
2.34.1


