Return-Path: <linux-clk+bounces-13879-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD139B1BD5
	for <lists+linux-clk@lfdr.de>; Sun, 27 Oct 2024 02:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D7CC1C20B66
	for <lists+linux-clk@lfdr.de>; Sun, 27 Oct 2024 01:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F108161328;
	Sun, 27 Oct 2024 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n38HDmA7"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860281552E1
	for <linux-clk@vger.kernel.org>; Sun, 27 Oct 2024 01:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992318; cv=none; b=RhNIEpqfJndFuXyR5GbW2g156hiDZ7KWnslZi0WNennY9hOVhCkqOeNdAT6NTi98W0658EzG/LkXv3elUQ877c6k2w6/Ce3TXkT7XYLGjJ/2bJ8JziDMBnlkHrrNc8x8cKn8xEdFeIrsN8lnSS7/Auw89ofSwOIdSkXc2RcYIoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992318; c=relaxed/simple;
	bh=hTfCMdUah6rxaxbVsEG8Tz6lM1ESYtaXna8X0/4xwY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juSEo/QiytC4gBxPWDibXwQII4bbHZ+Af9UpgVWVsQdRKfO4Mv+YseP/HaFhoIs+CI4HVmHfd9v2qQpHhG2LtZ7NWGDzIB6KqIRZCJQBwVLnSTuycH0TV+O40aG5ipSTijcIFGje8UR70daRFZJbKNvhfh7OzoJhCrqx6Gc8YoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n38HDmA7; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so3774430e87.0
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 18:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992312; x=1730597112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWM+lU/6wApJOKZSKUkMIaY15yyfiLlDoNhAJunWAds=;
        b=n38HDmA7qYB7n6eyk1Jsuta+s2AeMfeOYXyAFPWh5dskm8w1Pwyrw+cue9ABGPgX77
         D7/ht7YMGQsZrS7IWrpwIA5bMHuVr1mHBbTHc1eDY1NjTiZpQmoqZBk5afwxFBVuRwCR
         E8zYa/9PvvPWTMD5hW//LVALSamCW/+6iW3GtAwvFpb+9odko4K054mrVpyyNxiTEc9K
         3/e4AvdeinrHvwEDqqcHs08sWuUSryucW2LnNRpn1kIu7OAc8uQyBq2vfNcLOYPxhGwV
         EgtYKdinImZoyyp/CI/oPvKP2mOeWPrNwd2TXEVq3IiK+0Ifis/uePzVg13AnJlMugb3
         N6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992312; x=1730597112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWM+lU/6wApJOKZSKUkMIaY15yyfiLlDoNhAJunWAds=;
        b=wliHueVEV1pvufYgCwXSlOzTfjvc05uY6l2+QaQSQ86e21ZN5QVUIR42vWkSv+5k34
         9Nnxy3LnuNQVRrNUJPvmsreBfVk8h+qDT9Rla3GFjeDcxKoibSCzMClfkVgaYIZsD+C0
         Xau5W4Q/ppOTwoXYXJSvdiF2sJ6PYXtVx2gSTYn7eZLMS4VNBksgFoBvysK+tSvHZQG9
         QkiD6NrHdhqW2Rh1urWvgfsIT5vAdLzxgXOtSEDJuqe0aAfn9WVbsRjBbQu3jZIl8e2w
         8vMmW7nJgRGEXnDbSM3YM+PEUWfaD36HXYZ8nWCG9KS/ArS97iwLuhZFYzSGnIn3+ENg
         PjLw==
X-Forwarded-Encrypted: i=1; AJvYcCVA0lZIe1bttcYky9BIH7QTE9PgM8LTZv3vGkvVR8XSKnGrdMMvPNaq7bwBtX37ka6GGYFiNd83IlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylYuUIwRyuCUiXqwV/txRZ+YY9jqwLx/Oaz49skx+LGCkkZfFH
	Z35h6Xf/8JMYvJ+h2ZS/gOXGkNLFDke0LgYjR/84p9P2Z6YraAauiEL18Vozek2uKOtHYRU5GDa
	1
X-Google-Smtp-Source: AGHT+IEx9KR+JpigZ3UQIF9+w6Dqwp4NFa9t5tbKg4vbG90abGNm8oAw/YoCxfv7yyOL3j4wvZQX9g==
X-Received: by 2002:a05:6512:ea8:b0:539:fb30:1f75 with SMTP id 2adb3069b0e04-53b348e38e3mr1631108e87.24.1729992312259;
        Sat, 26 Oct 2024 18:25:12 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c901esm642356e87.219.2024.10.26.18.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:25:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:50 +0200
Subject: [PATCH v5 11/11] clk: qcom: add SAR2130P GPU Clock Controller
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-clocks-v5-11-ecad2a1432ba@linaro.org>
References: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
In-Reply-To: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15866;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QcqUOxgg/y4ZBn/2Y2/evEjo2y+rRARRfziAJnkVn7s=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZZjgTorYcuhiSB2as+xdCexFzt/yJTWeAF1l
 S/Td0F1lsWJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WYwAKCRAU23LtvoBl
 uMm9D/9eBOaaBC79ffErFCzmbBIYXnwPw0P99SwsYMX1Jnb1PZ1HkE6dgahQz2E3/erdJOi+gJ7
 j8Pg3qjImlZupJ2CiIwKqF0vuQXS1YBptqwjRdczEqEvpMQLU5G509jQVENU06vSOuwFVoh/GwV
 4nejfYX2PmUP9BYPlvnNWSf03Y2/AJOUj/2kUXpCOVV8XJKuRcsoz/VjLUbMAn7ZyBIb/18gpuM
 u4SjVEYYkIiwYa/I1AUNJQsfsVA5E1WbTygg9h+79gW0ETW1wIZXgseQK1VaxL/4GW0og1zqk3o
 uaLUb/SVTpY7EVDFrdILwcOYd98PKoGI1iXqtmT3PilWgi2x0rEpwnYywYdNLVjt9NFanPATW0y
 sEQvCqcxWa28p5hJ8tBT924j0mPIfrtocM1nbqZygs7Benq34nbkgZnzfVzYQfxnzVgUJB7Ua5+
 4iXJFQ0gY7p6RhoBPMEWZGD6vZTX+rE0OPW+whG2sx+ewyFiRaOuOfcppfRgNiLaT22Gy1Fwstw
 CQ24X65MAVLcdke6bi5Sg28rr0OuK850hciojnknth+jGA5DxUBUdWkF7UO/qOVh1RAIsr1B6QP
 z2ZuNVYd3ybkIj9b9vbA6HRy4e97jzwvvzRXwm4CIDUW3eohikpGKcJcBBHro945zrE12tgPY7q
 Ri4aRvv3qp+Aj9g==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Add support for the GPU Clock Controller as used on the SAR2130P and
SAR1130P platforms.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/Kconfig          |   9 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/gpucc-sar2130p.c | 502 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 512 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 77a4139d222ec7dea87d63b24896324973e4838b..678b1ebd9785be066fc202dd7865a6c6ff342465 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -574,6 +574,15 @@ config SAR_GCC_2130P
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, SDCC, etc.
 
+config SAR_GPUCC_2130P
+	tristate "SAR2130P Graphics clock controller"
+	select QCOM_GDSC
+	select SAR_GCC_2130P
+	help
+	  Support for the graphics clock controller on SAR2130P devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config SC_GCC_7180
 	tristate "SC7180 Global Clock Controller"
 	select QCOM_GDSC
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 992192ea231c0b10fe81982c175302a6b782e2fd..c581e65f173c81aafe385a53ea8a5c07a4c3e32e 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_SA_GCC_8775P) += gcc-sa8775p.o
 obj-$(CONFIG_SA_GPUCC_8775P) += gpucc-sa8775p.o
 obj-$(CONFIG_SA_VIDEOCC_8775P) += videocc-sa8775p.o
 obj-$(CONFIG_SAR_GCC_2130P) += gcc-sar2130p.o
+obj-$(CONFIG_SAR_GPUCC_2130P) += gpucc-sar2130p.o
 obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
 obj-$(CONFIG_SC_GCC_7280) += gcc-sc7280.o
 obj-$(CONFIG_SC_GCC_8180X) += gcc-sc8180x.o
diff --git a/drivers/clk/qcom/gpucc-sar2130p.c b/drivers/clk/qcom/gpucc-sar2130p.c
new file mode 100644
index 0000000000000000000000000000000000000000..dd72b2a48c42da1e14fb1e87a7dcd5f17b1a43ad
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-sar2130p.c
@@ -0,0 +1,502 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sar2130p-gpucc.h>
+#include <dt-bindings/reset/qcom,sar2130p-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+/* 470MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x18,
+	.alpha = 0x7aaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 440MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll1_config = {
+	.l = 0x16,
+	.alpha = 0xeaaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll gpu_cc_pll1 = {
+	.offset = 0x1000,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_ff_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_ff_clk_src = {
+	.cmd_rcgr = 0x9474,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_ff_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_ff_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(220000000, P_GPU_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(550000000, P_GPU_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x9318,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x93ec,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_2,
+	.freq_tbl = ftbl_gpu_cc_ff_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_2),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x911c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x911c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_crc_ahb_clk = {
+	.halt_reg = 0x9120,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9120,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_crc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_ff_clk = {
+	.halt_reg = 0x914c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x914c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x913c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x913c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_aon_clk = {
+	.halt_reg = 0x9004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_aon_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x9144,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gmu_clk = {
+	.halt_reg = 0x90bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x93e8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x93e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_cx_int_clk = {
+	.halt_reg = 0x9148,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9148,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x9150,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9150,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_sleep_clk = {
+	.halt_reg = 0x9134,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cx_gdsc = {
+	.gdscr = 0x9108,
+	.gds_hw_ctrl = 0x953c,
+	.clk_dis_wait_val = 8,
+	.pd = {
+		.name = "gpu_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc gpu_gx_gdsc = {
+	.gdscr = 0x905c,
+	.clamp_io_ctrl = 0x9504,
+	.resets = (unsigned int []){ GPUCC_GPU_CC_GX_BCR,
+				     GPUCC_GPU_CC_ACD_BCR,
+				     GPUCC_GPU_CC_GX_ACD_IROOT_BCR },
+	.reset_count = 3,
+	.pd = {
+		.name = "gpu_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+};
+
+static struct clk_regmap *gpu_cc_sar2130p_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_FF_CLK] = &gpu_cc_cx_ff_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_FF_CLK_SRC] = &gpu_cc_ff_clk_src.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
+	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL1] = &gpu_cc_pll1.clkr,
+	[GPU_CC_SLEEP_CLK] = &gpu_cc_sleep_clk.clkr,
+};
+
+static const struct qcom_reset_map gpu_cc_sar2130p_resets[] = {
+	[GPUCC_GPU_CC_ACD_BCR] = { 0x9358 },
+	[GPUCC_GPU_CC_GX_ACD_IROOT_BCR] = { 0x958c },
+	[GPUCC_GPU_CC_GX_BCR] = { 0x9058 },
+};
+
+static struct gdsc *gpu_cc_sar2130p_gdscs[] = {
+	[GPU_CX_GDSC] = &gpu_cx_gdsc,
+	[GPU_GX_GDSC] = &gpu_gx_gdsc,
+};
+
+static const struct regmap_config gpu_cc_sar2130p_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xa000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc gpu_cc_sar2130p_desc = {
+	.config = &gpu_cc_sar2130p_regmap_config,
+	.clks = gpu_cc_sar2130p_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_sar2130p_clocks),
+	.resets = gpu_cc_sar2130p_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_sar2130p_resets),
+	.gdscs = gpu_cc_sar2130p_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_sar2130p_gdscs),
+};
+
+static const struct of_device_id gpu_cc_sar2130p_match_table[] = {
+	{ .compatible = "qcom,sar2130p-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_sar2130p_match_table);
+
+static int gpu_cc_sar2130p_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &gpu_cc_sar2130p_desc);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Couldn't map GPU_CC\n");
+
+	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+
+	/* Keep some clocks always-on */
+	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
+
+	return qcom_cc_really_probe(dev, &gpu_cc_sar2130p_desc, regmap);
+}
+
+static struct platform_driver gpu_cc_sar2130p_driver = {
+	.probe = gpu_cc_sar2130p_probe,
+	.driver = {
+		.name = "gpu_cc-sar2130p",
+		.of_match_table = gpu_cc_sar2130p_match_table,
+	},
+};
+module_platform_driver(gpu_cc_sar2130p_driver);
+
+MODULE_DESCRIPTION("QTI GPU_CC SAR2130P Driver");
+MODULE_LICENSE("GPL");

-- 
2.39.5


