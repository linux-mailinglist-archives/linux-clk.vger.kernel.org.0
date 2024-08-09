Return-Path: <linux-clk+bounces-10602-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D1394D09C
	for <lists+linux-clk@lfdr.de>; Fri,  9 Aug 2024 14:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E44001F21C32
	for <lists+linux-clk@lfdr.de>; Fri,  9 Aug 2024 12:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EF4194C7D;
	Fri,  9 Aug 2024 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="ROLLOXBA"
X-Original-To: linux-clk@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D97194C6B;
	Fri,  9 Aug 2024 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723208108; cv=pass; b=Xf4LsD9tTWYjmuA8m5ZEsXQ1zRvriBUQVmKY/LPOdOQpJL/ceinjUzboGGnJErHfOf5uLPO8ZtVPXR4jRoXRt/WsFPk2hNmtdMtqRaOIkryOscRuZUKLsL4Ugsnnt4FpSzwwzPzENRkoRX2G4/ZYe/BqbuU3ELMtlyLryR4FlAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723208108; c=relaxed/simple;
	bh=h62v8aZZcdbwCOqby/V46B5V3ltnaz6ReCauGC0eLGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQ+EcftbjIb8NA+I78qpFqM6DAXa6c7GICr4EKE3hdEA8Rb468WNnh5/aHG91GfxESMiKlKuXKEvUDdXV51oRqhVZgNhc+jXJhU++FZO7g34dAgzvukPjBZnSo6uWLwBfytElWfNpXiT8iQko6QMmM7vxzVb+NLgZRbr8kujb1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=ROLLOXBA; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723208080; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hf0WRLfqcO1XxVZe1mesYM/gDD6PyHgE+vnUkp6aNJ9CrYEpS1Q4b2MPFmwH7VsaVn+gJAPIO+MxSd/gky3TGrmkbqtF5KNzWjr4DOU05V9detVcxqECQL89cGgB0qvJpYZ2YydZsE5C12tQC6KK+7vfv9ufJojD/+2E0rpanjM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723208080; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u8wlXmGNVrmLCohK5EEllVYqtmobFf5KZOzip1yrwds=; 
	b=WXaDjlg+f4M3ptS+z4ddX/qTw3a2zffb6Dm6GsQtJhpHpwFiiAPyA098Uz6yCTd5lFdixgYod7+1o+qQL8wEoGWRDj2XiAFY3/09hiflaHuoyOA5F+cP6TpORh550VGju7xiA05XYyGHe2Pe7wuT8E69S5p5w+kaeJC5+PWO2Y0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723208080;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=u8wlXmGNVrmLCohK5EEllVYqtmobFf5KZOzip1yrwds=;
	b=ROLLOXBAvzbK0Ff+P2L2Iv/k7LdxAjvgQDYt/cCEo4a5ojFEGGP91tXEGJH0tPPc
	umZuTZt2bPNIsy9Ll/K6qoKO+CCNaDw46Dspsgj03pAfXDvjojcaeUftlLHqJAnIDAj
	iYsKwY4244ElTI4AFKfiN51HZw0VT8swhaSoypsU=
Received: by mx.zohomail.com with SMTPS id 1723208079428671.1456691865072;
	Fri, 9 Aug 2024 05:54:39 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v4 2/3] dt-bindings: clock: Add rk3576 clock definitions and documentation
Date: Fri,  9 Aug 2024 08:54:53 -0400
Message-ID: <20240809125553.3889-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240809125553.3889-1-detlev.casanova@collabora.com>
References: <20240809125553.3889-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add clock ID defines for rk3576.

Compared to the downstream bindings written by Elaine, this uses
continous gapless clock IDs starting at 1. Thus all numbers are
different between downstream and upstream, but names are kept
exactly the same.

Also add documentation for the rk3576 CRU core.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../bindings/clock/rockchip,rk3576-cru.yaml   |  84 +++
 .../dt-bindings/clock/rockchip,rk3576-cru.h   | 592 ++++++++++++++++++
 2 files changed, 676 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3576-cru.yaml
 create mode 100644 include/dt-bindings/clock/rockchip,rk3576-cru.h

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3576-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3576-cru.yaml
new file mode 100644
index 0000000000000..d6fd17320e56a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3576-cru.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,rk3576-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip rk3576 Family Clock and Reset Control Module
+
+maintainers:
+  - Elaine Zhang <zhangqing@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The RK3576 clock controller generates the clock and also implements a reset
+  controller for SoC peripherals. For example it provides SCLK_UART2 and
+  PCLK_UART2, as well as SRST_P_UART2 and SRST_S_UART2 for the second UART
+  module.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3576-cru
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: xin24m
+      - const: xin32k
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: >
+      phandle to the syscon managing the "general register files". It is used
+      for GRF muxes, if missing any muxes present in the GRF will not be
+      available.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3576-cru.h>
+    clock-controller@27200000 {
+      compatible = "rockchip,rk3576-cru";
+      reg = <0xfd7c0000 0x5c000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      assigned-clocks =
+        <&cru CLK_AUDIO_FRAC_1_SRC>,
+        <&cru PLL_GPLL>, <&cru PLL_CPLL>,
+        <&cru PLL_AUPLL>, <&cru CLK_UART_FRAC_0>,
+        <&cru CLK_UART_FRAC_1>, <&cru CLK_UART_FRAC_2>,
+        <&cru CLK_AUDIO_FRAC_0>, <&cru CLK_AUDIO_FRAC_1>,
+        <&cru CLK_CPLL_DIV2>, <&cru CLK_CPLL_DIV4>,
+        <&cru CLK_CPLL_DIV10>, <&cru FCLK_DDR_CM0_CORE>,
+        <&cru ACLK_PHP_ROOT>;
+      assigned-clock-parents = <&cru PLL_AUPLL>;
+      assigned-clock-rates =
+        <0>,
+        <1188000000>, <1000000000>,
+        <786432000>, <18432000>,
+        <96000000>, <128000000>,
+        <45158400>, <49152000>,
+        <500000000>, <250000000>,
+        <100000000>, <500000000>,
+        <250000000>;
+      rockchip,grf = <&pmu0_grf>;
+    };
diff --git a/include/dt-bindings/clock/rockchip,rk3576-cru.h b/include/dt-bindings/clock/rockchip,rk3576-cru.h
new file mode 100644
index 0000000000000..ee3718452b77e
--- /dev/null
+++ b/include/dt-bindings/clock/rockchip,rk3576-cru.h
@@ -0,0 +1,592 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+* Copyright (c) 2023 Rockchip Electronics Co. Ltd.
+* Copyright (c) 2024 Collabora Ltd.
+*
+* Author: Elaine Zhang <zhangqing@rock-chips.com>
+* Author: Detlev Casanova <detlev.casanova@collabora.com>
+*/
+
+#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3576_H
+#define _DT_BINDINGS_CLK_ROCKCHIP_RK3576_H
+
+/* cru-clocks indices */
+
+/* cru plls */
+#define PLL_BPLL			0
+#define PLL_LPLL			1
+#define PLL_VPLL			2
+#define PLL_AUPLL			3
+#define PLL_CPLL			4
+#define PLL_GPLL			5
+#define PLL_PPLL			6
+#define ARMCLK_L			7
+#define ARMCLK_B			8
+
+/* cru clocks */
+#define CLK_CPLL_DIV20			9
+#define CLK_CPLL_DIV10			10
+#define CLK_GPLL_DIV8			11
+#define CLK_GPLL_DIV6			12
+#define CLK_CPLL_DIV4			13
+#define CLK_GPLL_DIV4			14
+#define CLK_SPLL_DIV2			15
+#define CLK_GPLL_DIV3			16
+#define CLK_CPLL_DIV2			17
+#define CLK_GPLL_DIV2			18
+#define CLK_SPLL_DIV1			19
+#define PCLK_TOP_ROOT			20
+#define ACLK_TOP			21
+#define HCLK_TOP			22
+#define CLK_AUDIO_FRAC_0		23
+#define CLK_AUDIO_FRAC_1		24
+#define CLK_AUDIO_FRAC_2		25
+#define CLK_AUDIO_FRAC_3		26
+#define CLK_UART_FRAC_0			27
+#define CLK_UART_FRAC_1			28
+#define CLK_UART_FRAC_2			29
+#define CLK_UART1_SRC_TOP		30
+#define CLK_AUDIO_INT_0			31
+#define CLK_AUDIO_INT_1			32
+#define CLK_AUDIO_INT_2			33
+#define CLK_PDM0_SRC_TOP		34
+#define CLK_PDM1_OUT			35
+#define CLK_GMAC0_125M_SRC		36
+#define CLK_GMAC1_125M_SRC		37
+#define LCLK_ASRC_SRC_0			38
+#define LCLK_ASRC_SRC_1			39
+#define REF_CLK0_OUT_PLL		40
+#define REF_CLK1_OUT_PLL		41
+#define REF_CLK2_OUT_PLL		42
+#define REFCLKO25M_GMAC0_OUT		43
+#define REFCLKO25M_GMAC1_OUT		44
+#define CLK_CIFOUT_OUT			45
+#define CLK_GMAC0_RMII_CRU		46
+#define CLK_GMAC1_RMII_CRU		47
+#define CLK_OTPC_AUTO_RD_G		48
+#define CLK_OTP_PHY_G			49
+#define CLK_MIPI_CAMERAOUT_M0		50
+#define CLK_MIPI_CAMERAOUT_M1		51
+#define CLK_MIPI_CAMERAOUT_M2		52
+#define MCLK_PDM0_SRC_TOP		53
+#define HCLK_AUDIO_ROOT			54
+#define HCLK_ASRC_2CH_0			55
+#define HCLK_ASRC_2CH_1			56
+#define HCLK_ASRC_4CH_0			57
+#define HCLK_ASRC_4CH_1			58
+#define CLK_ASRC_2CH_0			59
+#define CLK_ASRC_2CH_1			60
+#define CLK_ASRC_4CH_0			61
+#define CLK_ASRC_4CH_1			62
+#define MCLK_SAI0_8CH_SRC		63
+#define MCLK_SAI0_8CH			64
+#define HCLK_SAI0_8CH			65
+#define HCLK_SPDIF_RX0			66
+#define MCLK_SPDIF_RX0			67
+#define HCLK_SPDIF_RX1			68
+#define MCLK_SPDIF_RX1			69
+#define MCLK_SAI1_8CH_SRC		70
+#define MCLK_SAI1_8CH			71
+#define HCLK_SAI1_8CH			72
+#define MCLK_SAI2_2CH_SRC		73
+#define MCLK_SAI2_2CH			74
+#define HCLK_SAI2_2CH			75
+#define MCLK_SAI3_2CH_SRC		76
+#define MCLK_SAI3_2CH			77
+#define HCLK_SAI3_2CH			78
+#define MCLK_SAI4_2CH_SRC		79
+#define MCLK_SAI4_2CH			80
+#define HCLK_SAI4_2CH			81
+#define HCLK_ACDCDIG_DSM		82
+#define MCLK_ACDCDIG_DSM		83
+#define CLK_PDM1			84
+#define HCLK_PDM1			85
+#define MCLK_PDM1			86
+#define HCLK_SPDIF_TX0			87
+#define MCLK_SPDIF_TX0			88
+#define HCLK_SPDIF_TX1			89
+#define MCLK_SPDIF_TX1			90
+#define CLK_SAI1_MCLKOUT		91
+#define CLK_SAI2_MCLKOUT		92
+#define CLK_SAI3_MCLKOUT		93
+#define CLK_SAI4_MCLKOUT		94
+#define CLK_SAI0_MCLKOUT		95
+#define HCLK_BUS_ROOT			96
+#define PCLK_BUS_ROOT			97
+#define ACLK_BUS_ROOT			98
+#define HCLK_CAN0			99
+#define CLK_CAN0			100
+#define HCLK_CAN1			101
+#define CLK_CAN1			102
+#define CLK_KEY_SHIFT			103
+#define PCLK_I2C1			104
+#define PCLK_I2C2			105
+#define PCLK_I2C3			106
+#define PCLK_I2C4			107
+#define PCLK_I2C5			108
+#define PCLK_I2C6			109
+#define PCLK_I2C7			110
+#define PCLK_I2C8			111
+#define PCLK_I2C9			112
+#define PCLK_WDT_BUSMCU			113
+#define TCLK_WDT_BUSMCU			114
+#define ACLK_GIC			115
+#define CLK_I2C1			116
+#define CLK_I2C2			117
+#define CLK_I2C3			118
+#define CLK_I2C4			119
+#define CLK_I2C5			120
+#define CLK_I2C6			121
+#define CLK_I2C7			122
+#define CLK_I2C8			123
+#define CLK_I2C9			124
+#define PCLK_SARADC			125
+#define CLK_SARADC			126
+#define PCLK_TSADC			127
+#define CLK_TSADC			128
+#define PCLK_UART0			129
+#define PCLK_UART2			130
+#define PCLK_UART3			131
+#define PCLK_UART4			132
+#define PCLK_UART5			133
+#define PCLK_UART6			134
+#define PCLK_UART7			135
+#define PCLK_UART8			136
+#define PCLK_UART9			137
+#define PCLK_UART10			138
+#define PCLK_UART11			139
+#define SCLK_UART0			140
+#define SCLK_UART2			141
+#define SCLK_UART3			142
+#define SCLK_UART4			143
+#define SCLK_UART5			144
+#define SCLK_UART6			145
+#define SCLK_UART7			146
+#define SCLK_UART8			147
+#define SCLK_UART9			148
+#define SCLK_UART10			149
+#define SCLK_UART11			150
+#define PCLK_SPI0			151
+#define PCLK_SPI1			152
+#define PCLK_SPI2			153
+#define PCLK_SPI3			154
+#define PCLK_SPI4			155
+#define CLK_SPI0			156
+#define CLK_SPI1			157
+#define CLK_SPI2			158
+#define CLK_SPI3			159
+#define CLK_SPI4			160
+#define PCLK_WDT0			161
+#define TCLK_WDT0			162
+#define PCLK_PWM1			163
+#define CLK_PWM1			164
+#define CLK_OSC_PWM1			165
+#define CLK_RC_PWM1			166
+#define PCLK_BUSTIMER0			167
+#define PCLK_BUSTIMER1			168
+#define CLK_TIMER0_ROOT			169
+#define CLK_TIMER0			170
+#define CLK_TIMER1			171
+#define CLK_TIMER2			172
+#define CLK_TIMER3			173
+#define CLK_TIMER4			174
+#define CLK_TIMER5			175
+#define PCLK_MAILBOX0			176
+#define PCLK_GPIO1			177
+#define DBCLK_GPIO1			178
+#define PCLK_GPIO2			179
+#define DBCLK_GPIO2			180
+#define PCLK_GPIO3			181
+#define DBCLK_GPIO3			182
+#define PCLK_GPIO4			183
+#define DBCLK_GPIO4			184
+#define ACLK_DECOM			185
+#define PCLK_DECOM			186
+#define DCLK_DECOM			187
+#define CLK_TIMER1_ROOT			188
+#define CLK_TIMER6			189
+#define CLK_TIMER7			190
+#define CLK_TIMER8			191
+#define CLK_TIMER9			192
+#define CLK_TIMER10			193
+#define CLK_TIMER11			194
+#define ACLK_DMAC0			195
+#define ACLK_DMAC1			196
+#define ACLK_DMAC2			197
+#define ACLK_SPINLOCK			198
+#define HCLK_I3C0			199
+#define HCLK_I3C1			200
+#define HCLK_BUS_CM0_ROOT		201
+#define FCLK_BUS_CM0_CORE		202
+#define CLK_BUS_CM0_RTC			203
+#define PCLK_PMU2			204
+#define PCLK_PWM2			205
+#define CLK_PWM2			206
+#define CLK_RC_PWM2			207
+#define CLK_OSC_PWM2			208
+#define CLK_FREQ_PWM1			209
+#define CLK_COUNTER_PWM1		210
+#define SAI_SCLKIN_FREQ			211
+#define SAI_SCLKIN_COUNTER		212
+#define CLK_I3C0			213
+#define CLK_I3C1			214
+#define PCLK_CSIDPHY1			215
+#define PCLK_DDR_ROOT			216
+#define PCLK_DDR_MON_CH0		217
+#define TMCLK_DDR_MON_CH0		218
+#define ACLK_DDR_ROOT			219
+#define HCLK_DDR_ROOT			220
+#define FCLK_DDR_CM0_CORE		221
+#define CLK_DDR_TIMER_ROOT		222
+#define CLK_DDR_TIMER0			223
+#define CLK_DDR_TIMER1			224
+#define TCLK_WDT_DDR			225
+#define PCLK_WDT			226
+#define PCLK_TIMER			227
+#define CLK_DDR_CM0_RTC			228
+#define ACLK_RKNN0			229
+#define ACLK_RKNN1			230
+#define HCLK_RKNN_ROOT			231
+#define CLK_RKNN_DSU0			232
+#define PCLK_NPUTOP_ROOT		233
+#define PCLK_NPU_TIMER			234
+#define CLK_NPUTIMER_ROOT		235
+#define CLK_NPUTIMER0			236
+#define CLK_NPUTIMER1			237
+#define PCLK_NPU_WDT			238
+#define TCLK_NPU_WDT			239
+#define ACLK_RKNN_CBUF			240
+#define HCLK_NPU_CM0_ROOT		241
+#define FCLK_NPU_CM0_CORE		242
+#define CLK_NPU_CM0_RTC			243
+#define HCLK_RKNN_CBUF			244
+#define HCLK_NVM_ROOT			245
+#define ACLK_NVM_ROOT			246
+#define SCLK_FSPI_X2			247
+#define HCLK_FSPI			248
+#define CCLK_SRC_EMMC			249
+#define HCLK_EMMC			250
+#define ACLK_EMMC			251
+#define BCLK_EMMC			252
+#define TCLK_EMMC			253
+#define PCLK_PHP_ROOT			254
+#define ACLK_PHP_ROOT			255
+#define PCLK_PCIE0			256
+#define CLK_PCIE0_AUX			257
+#define ACLK_PCIE0_MST			258
+#define ACLK_PCIE0_SLV			259
+#define ACLK_PCIE0_DBI			260
+#define ACLK_USB3OTG1			261
+#define CLK_REF_USB3OTG1		262
+#define CLK_SUSPEND_USB3OTG1		263
+#define ACLK_MMU0			264
+#define ACLK_SLV_MMU0			265
+#define ACLK_MMU1			266
+#define ACLK_SLV_MMU1			267
+#define PCLK_PCIE1			268
+#define CLK_PCIE1_AUX			269
+#define ACLK_PCIE1_MST			270
+#define ACLK_PCIE1_SLV			271
+#define ACLK_PCIE1_DBI			272
+#define CLK_RXOOB0			273
+#define CLK_RXOOB1			274
+#define CLK_PMALIVE0			275
+#define CLK_PMALIVE1			276
+#define ACLK_SATA0			277
+#define ACLK_SATA1			278
+#define CLK_USB3OTG1_PIPE_PCLK		279
+#define CLK_USB3OTG1_UTMI		280
+#define CLK_USB3OTG0_PIPE_PCLK		281
+#define CLK_USB3OTG0_UTMI		282
+#define HCLK_SDGMAC_ROOT		283
+#define ACLK_SDGMAC_ROOT		284
+#define PCLK_SDGMAC_ROOT		285
+#define ACLK_GMAC0			286
+#define ACLK_GMAC1			287
+#define PCLK_GMAC0			288
+#define PCLK_GMAC1			289
+#define CCLK_SRC_SDIO			290
+#define HCLK_SDIO			291
+#define CLK_GMAC1_PTP_REF		292
+#define CLK_GMAC0_PTP_REF		293
+#define CLK_GMAC1_PTP_REF_SRC		294
+#define CLK_GMAC0_PTP_REF_SRC		295
+#define CCLK_SRC_SDMMC0			296
+#define HCLK_SDMMC0			297
+#define SCLK_FSPI1_X2			298
+#define HCLK_FSPI1			299
+#define ACLK_DSMC_ROOT			300
+#define ACLK_DSMC			301
+#define PCLK_DSMC			302
+#define CLK_DSMC_SYS			303
+#define HCLK_HSGPIO			304
+#define CLK_HSGPIO_TX			305
+#define CLK_HSGPIO_RX			306
+#define ACLK_HSGPIO			307
+#define PCLK_PHPPHY_ROOT		308
+#define PCLK_PCIE2_COMBOPHY0		309
+#define PCLK_PCIE2_COMBOPHY1		310
+#define CLK_PCIE_100M_SRC		311
+#define CLK_PCIE_100M_NDUTY_SRC		312
+#define CLK_REF_PCIE0_PHY		313
+#define CLK_REF_PCIE1_PHY		314
+#define CLK_REF_MPHY_26M		315
+#define HCLK_RKVDEC_ROOT		316
+#define ACLK_RKVDEC_ROOT		317
+#define HCLK_RKVDEC			318
+#define CLK_RKVDEC_HEVC_CA		319
+#define CLK_RKVDEC_CORE			320
+#define ACLK_UFS_ROOT			321
+#define ACLK_USB_ROOT			322
+#define PCLK_USB_ROOT			323
+#define ACLK_USB3OTG0			324
+#define CLK_REF_USB3OTG0		325
+#define CLK_SUSPEND_USB3OTG0		326
+#define ACLK_MMU2			327
+#define ACLK_SLV_MMU2			328
+#define ACLK_UFS_SYS			329
+#define ACLK_VPU_ROOT			330
+#define ACLK_VPU_MID_ROOT		331
+#define HCLK_VPU_ROOT			332
+#define ACLK_JPEG_ROOT			333
+#define ACLK_VPU_LOW_ROOT		334
+#define HCLK_RGA2E_0			335
+#define ACLK_RGA2E_0			336
+#define CLK_CORE_RGA2E_0		337
+#define ACLK_JPEG			338
+#define HCLK_JPEG			339
+#define HCLK_VDPP			340
+#define ACLK_VDPP			341
+#define CLK_CORE_VDPP			342
+#define HCLK_RGA2E_1			343
+#define ACLK_RGA2E_1			344
+#define CLK_CORE_RGA2E_1		345
+#define DCLK_EBC_FRAC_SRC		346
+#define HCLK_EBC			347
+#define ACLK_EBC			348
+#define DCLK_EBC			349
+#define HCLK_VEPU0_ROOT			350
+#define ACLK_VEPU0_ROOT			351
+#define HCLK_VEPU0			352
+#define ACLK_VEPU0			353
+#define CLK_VEPU0_CORE			354
+#define ACLK_VI_ROOT			355
+#define HCLK_VI_ROOT			356
+#define PCLK_VI_ROOT			357
+#define DCLK_VICAP			358
+#define ACLK_VICAP			359
+#define HCLK_VICAP			360
+#define CLK_ISP_CORE			361
+#define CLK_ISP_CORE_MARVIN		362
+#define CLK_ISP_CORE_VICAP		363
+#define ACLK_ISP			364
+#define HCLK_ISP			365
+#define ACLK_VPSS			366
+#define HCLK_VPSS			367
+#define CLK_CORE_VPSS			368
+#define PCLK_CSI_HOST_0			369
+#define PCLK_CSI_HOST_1			370
+#define PCLK_CSI_HOST_2			371
+#define PCLK_CSI_HOST_3			372
+#define PCLK_CSI_HOST_4			373
+#define ICLK_CSIHOST01			374
+#define ICLK_CSIHOST0			375
+#define CLK_ISP_PVTPLL_SRC		376
+#define ACLK_VI_ROOT_INTER		377
+#define CLK_VICAP_I0CLK			378
+#define CLK_VICAP_I1CLK			379
+#define CLK_VICAP_I2CLK			380
+#define CLK_VICAP_I3CLK			381
+#define CLK_VICAP_I4CLK			382
+#define ACLK_VOP_ROOT			383
+#define HCLK_VOP_ROOT			384
+#define PCLK_VOP_ROOT			385
+#define HCLK_VOP			386
+#define ACLK_VOP			387
+#define DCLK_VP0_SRC			388
+#define DCLK_VP1_SRC			389
+#define DCLK_VP2_SRC			390
+#define DCLK_VP0			391
+#define DCLK_VP1			392
+#define DCLK_VP2			393
+#define PCLK_VOPGRF			394
+#define ACLK_VO0_ROOT			395
+#define HCLK_VO0_ROOT			396
+#define PCLK_VO0_ROOT			397
+#define PCLK_VO0_GRF			398
+#define ACLK_HDCP0			399
+#define HCLK_HDCP0			400
+#define PCLK_HDCP0			401
+#define CLK_TRNG0_SKP			402
+#define PCLK_DSIHOST0			403
+#define CLK_DSIHOST0			404
+#define PCLK_HDMITX0			405
+#define CLK_HDMITX0_EARC		406
+#define CLK_HDMITX0_REF			407
+#define PCLK_EDP0			408
+#define CLK_EDP0_24M			409
+#define CLK_EDP0_200M			410
+#define MCLK_SAI5_8CH_SRC		411
+#define MCLK_SAI5_8CH			412
+#define HCLK_SAI5_8CH			413
+#define MCLK_SAI6_8CH_SRC		414
+#define MCLK_SAI6_8CH			415
+#define HCLK_SAI6_8CH			416
+#define HCLK_SPDIF_TX2			417
+#define MCLK_SPDIF_TX2			418
+#define HCLK_SPDIF_RX2			419
+#define MCLK_SPDIF_RX2			420
+#define HCLK_SAI8_8CH			421
+#define MCLK_SAI8_8CH_SRC		422
+#define MCLK_SAI8_8CH			423
+#define ACLK_VO1_ROOT			424
+#define HCLK_VO1_ROOT			425
+#define PCLK_VO1_ROOT			426
+#define MCLK_SAI7_8CH_SRC		427
+#define MCLK_SAI7_8CH			428
+#define HCLK_SAI7_8CH			429
+#define HCLK_SPDIF_TX3			430
+#define HCLK_SPDIF_TX4			431
+#define HCLK_SPDIF_TX5			432
+#define MCLK_SPDIF_TX3			433
+#define CLK_AUX16MHZ_0			434
+#define ACLK_DP0			435
+#define PCLK_DP0			436
+#define PCLK_VO1_GRF			437
+#define ACLK_HDCP1			438
+#define HCLK_HDCP1			439
+#define PCLK_HDCP1			440
+#define CLK_TRNG1_SKP			441
+#define HCLK_SAI9_8CH			442
+#define MCLK_SAI9_8CH_SRC		443
+#define MCLK_SAI9_8CH			444
+#define MCLK_SPDIF_TX4			445
+#define MCLK_SPDIF_TX5			446
+#define CLK_GPU_SRC_PRE			447
+#define CLK_GPU				448
+#define PCLK_GPU_ROOT			449
+#define ACLK_CENTER_ROOT		450
+#define ACLK_CENTER_LOW_ROOT		451
+#define HCLK_CENTER_ROOT		452
+#define PCLK_CENTER_ROOT		453
+#define ACLK_DMA2DDR			454
+#define ACLK_DDR_SHAREMEM		455
+#define PCLK_DMA2DDR			456
+#define PCLK_SHAREMEM			457
+#define HCLK_VEPU1_ROOT			458
+#define ACLK_VEPU1_ROOT			459
+#define HCLK_VEPU1			460
+#define ACLK_VEPU1			461
+#define CLK_VEPU1_CORE			462
+#define CLK_JDBCK_DAP			463
+#define PCLK_MIPI_DCPHY			464
+#define CLK_32K_USB2DEBUG		465
+#define PCLK_CSIDPHY			466
+#define PCLK_USBDPPHY			467
+#define CLK_PMUPHY_REF_SRC		468
+#define CLK_USBDP_COMBO_PHY_IMMORTAL	469
+#define CLK_HDMITXHPD			470
+#define PCLK_MPHY			471
+#define CLK_REF_OSC_MPHY		472
+#define CLK_REF_UFS_CLKOUT		473
+#define HCLK_PMU1_ROOT			474
+#define HCLK_PMU_CM0_ROOT		475
+#define CLK_200M_PMU_SRC		476
+#define CLK_100M_PMU_SRC		477
+#define CLK_50M_PMU_SRC			478
+#define FCLK_PMU_CM0_CORE		479
+#define CLK_PMU_CM0_RTC			480
+#define PCLK_PMU1			481
+#define CLK_PMU1			482
+#define PCLK_PMU1WDT			483
+#define TCLK_PMU1WDT			484
+#define PCLK_PMUTIMER			485
+#define CLK_PMUTIMER_ROOT		486
+#define CLK_PMUTIMER0			487
+#define CLK_PMUTIMER1			488
+#define PCLK_PMU1PWM			489
+#define CLK_PMU1PWM			490
+#define CLK_PMU1PWM_OSC			491
+#define PCLK_PMUPHY_ROOT		492
+#define PCLK_I2C0			493
+#define CLK_I2C0			494
+#define SCLK_UART1			495
+#define PCLK_UART1			496
+#define CLK_PMU1PWM_RC			497
+#define CLK_PDM0			498
+#define HCLK_PDM0			499
+#define MCLK_PDM0			500
+#define HCLK_VAD			501
+#define CLK_OSCCHK_PVTM			502
+#define CLK_PDM0_OUT			503
+#define CLK_HPTIMER_SRC			504
+#define PCLK_PMU0_ROOT			505
+#define PCLK_PMU0			506
+#define PCLK_GPIO0			507
+#define DBCLK_GPIO0			508
+#define CLK_OSC0_PMU1			509
+#define PCLK_PMU1_ROOT			510
+#define XIN_OSC0_DIV			511
+#define ACLK_USB			512
+#define ACLK_UFS			513
+#define ACLK_SDGMAC			514
+#define HCLK_SDGMAC			515
+#define PCLK_SDGMAC			516
+#define HCLK_VO1			517
+#define HCLK_VO0			518
+#define PCLK_CCI_ROOT			519
+#define ACLK_CCI_ROOT			520
+#define HCLK_VO0VOP_CHANNEL		521
+#define ACLK_VO0VOP_CHANNEL		522
+#define ACLK_TOP_MID			523
+#define ACLK_SECURE_HIGH		524
+#define CLK_USBPHY_REF_SRC		525
+#define CLK_PHY_REF_SRC			526
+#define CLK_CPLL_REF_SRC		527
+#define CLK_AUPLL_REF_SRC		528
+#define PCLK_SECURE_NS			529
+#define HCLK_SECURE_NS			530
+#define ACLK_SECURE_NS			531
+#define PCLK_OTPC_NS			532
+#define HCLK_CRYPTO_NS			533
+#define HCLK_TRNG_NS			534
+#define CLK_OTPC_NS			535
+#define SCLK_DSU			536
+#define SCLK_DDR			537
+#define ACLK_CRYPTO_NS			538
+#define CLK_PKA_CRYPTO_NS		539
+#define ACLK_RKVDEC_ROOT_BAK		540
+#define CLK_AUDIO_FRAC_0_SRC		541
+#define CLK_AUDIO_FRAC_1_SRC		542
+#define CLK_AUDIO_FRAC_2_SRC		543
+#define CLK_AUDIO_FRAC_3_SRC		544
+#define PCLK_HDPTX_APB			545
+
+/* secure clk */
+#define CLK_STIMER0_ROOT		546
+#define CLK_STIMER1_ROOT		547
+#define PCLK_SECURE_S			548
+#define HCLK_SECURE_S			549
+#define ACLK_SECURE_S			550
+#define CLK_PKA_CRYPTO_S		551
+#define HCLK_VO1_S			552
+#define PCLK_VO1_S			553
+#define HCLK_VO0_S			554
+#define PCLK_VO0_S			555
+#define PCLK_KLAD			556
+#define HCLK_CRYPTO_S			557
+#define HCLK_KLAD			558
+#define ACLK_CRYPTO_S			559
+#define HCLK_TRNG_S			560
+#define PCLK_OTPC_S			561
+#define CLK_OTPC_S			562
+#define PCLK_WDT_S			563
+#define TCLK_WDT_S			564
+#define PCLK_HDCP0_TRNG			565
+#define PCLK_HDCP1_TRNG			566
+#define HCLK_HDCP_KEY0			567
+#define HCLK_HDCP_KEY1			568
+#define PCLK_EDP_S			569
+#define ACLK_KLAD			570
+
+#endif
-- 
2.46.0


