Return-Path: <linux-clk+bounces-10329-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7387C945F34
	for <lists+linux-clk@lfdr.de>; Fri,  2 Aug 2024 16:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB6251F23966
	for <lists+linux-clk@lfdr.de>; Fri,  2 Aug 2024 14:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C121E4F0D;
	Fri,  2 Aug 2024 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="x+lVNCQC"
X-Original-To: linux-clk@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE141E4EF2;
	Fri,  2 Aug 2024 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722608241; cv=none; b=r/3IQH3TmVPxvFJaXIB81Ls0YY0/i7Fe5BBlP79KI5o5KwUHCmbSd2yWdSu1wkHBnTmW3n7cU8TyketpqqweADeJsR3GARggQS9XGrj5AyiJITAws3hO/ZFcHWbBmBRAxKnHTSPBlwZlcZ/zgzHO7UeblEjbYj4kDVtvagaIapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722608241; c=relaxed/simple;
	bh=KFnhuXkmh63xz0Ct7CyMnJPyfhcbuV+s9frAzU7SU/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kvkt0hWAJrlRgWtTLGUhLPT3bhOk9024KNShR8kqNHEV/90Mph6HZcSI+O9n671Vuj+fEBIaRCkz5N6CkCWnc23GjCiqutCdPtuPPVNnRJ035RRItyZoeF0IW0XEdG2WSf4hhPglc49MaHKXZ6jw0217ZmiLz+n4ijEBvPui/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=x+lVNCQC; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722608237;
	bh=KFnhuXkmh63xz0Ct7CyMnJPyfhcbuV+s9frAzU7SU/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=x+lVNCQCOILlfvEHw2JOjyg8I5NwO+1tPBkRkMTiWuEXWAXA6b3OGohGBm7XEZUH+
	 NmDp6akVoWYdEs+vX39YJQxOqU+mThvHgRqg0hP9dxzIX89atJBeEYfBUGJZgdT8T3
	 4hxIEuxIrU5iOKH1AQW1IhqWnPywX9vFtqTKeebYENEFVtvDNKpoECYfHPgc3sFDDb
	 21ObIUMzeQdUm+GjteSNKuE8eKdwO3IVgIXhPAgseFiDg8MYXSa+gj1+Jmj4nT/lCt
	 0DXTuXF/YWNL3jxsmJ8Z67ILGlPdn3o1lTj2YoEa3w/ln0V5xnJ37Q729XbB3Tahkn
	 qsG5ixV4jkPUA==
Received: from trenzalore.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E3552378221A;
	Fri,  2 Aug 2024 14:17:14 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 2/3] clk: rockchip: Add dt-binding header for rk3576
Date: Fri,  2 Aug 2024 10:12:49 -0400
Message-ID: <20240802141816.288337-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240802141816.288337-1-detlev.casanova@collabora.com>
References: <20240802141816.288337-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Elaine Zhang <zhangqing@rock-chips.com>

Add the dt-bindings header for the rk3576, that gets shared between
the clock controller and the clock references in the dts.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../dt-bindings/clock/rockchip,rk3576-cru.h   | 1149 +++++++++++++++++
 1 file changed, 1149 insertions(+)
 create mode 100644 include/dt-bindings/clock/rockchip,rk3576-cru.h

diff --git a/include/dt-bindings/clock/rockchip,rk3576-cru.h b/include/dt-bindings/clock/rockchip,rk3576-cru.h
new file mode 100644
index 0000000000000..19d25f082dc57
--- /dev/null
+++ b/include/dt-bindings/clock/rockchip,rk3576-cru.h
@@ -0,0 +1,1149 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2023 Rockchip Electronics Co. Ltd.
+ * Author: Elaine Zhang <zhangqing@rock-chips.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3576_H
+#define _DT_BINDINGS_CLK_ROCKCHIP_RK3576_H
+
+/* cru-clocks indices */
+
+/* cru plls */
+#define PLL_BPLL			1
+#define PLL_LPLL			3
+#define PLL_VPLL			4
+#define PLL_AUPLL			5
+#define PLL_CPLL			6
+#define PLL_GPLL			7
+#define PLL_PPLL			9
+#define ARMCLK_L			10
+#define ARMCLK_B			11
+
+/* cru clocks */
+#define CLK_CPLL_DIV20			15
+#define CLK_CPLL_DIV10			16
+#define CLK_GPLL_DIV8			17
+#define CLK_GPLL_DIV6			18
+#define CLK_CPLL_DIV4			19
+#define CLK_GPLL_DIV4			20
+#define CLK_SPLL_DIV2			21
+#define CLK_GPLL_DIV3			22
+#define CLK_CPLL_DIV2			23
+#define CLK_GPLL_DIV2			24
+#define CLK_SPLL_DIV1			25
+#define PCLK_TOP_ROOT			26
+#define ACLK_TOP			27
+#define HCLK_TOP			28
+#define CLK_AUDIO_FRAC_0		29
+#define CLK_AUDIO_FRAC_1		30
+#define CLK_AUDIO_FRAC_2		31
+#define CLK_AUDIO_FRAC_3		32
+#define CLK_UART_FRAC_0			33
+#define CLK_UART_FRAC_1			34
+#define CLK_UART_FRAC_2			35
+#define CLK_UART1_SRC_TOP		36
+#define CLK_AUDIO_INT_0			37
+#define CLK_AUDIO_INT_1			38
+#define CLK_AUDIO_INT_2			39
+#define CLK_PDM0_SRC_TOP		40
+#define CLK_PDM1_OUT			41
+#define CLK_GMAC0_125M_SRC		42
+#define CLK_GMAC1_125M_SRC		43
+#define LCLK_ASRC_SRC_0			44
+#define LCLK_ASRC_SRC_1			45
+#define REF_CLK0_OUT_PLL		46
+#define REF_CLK1_OUT_PLL		47
+#define REF_CLK2_OUT_PLL		48
+#define REFCLKO25M_GMAC0_OUT		49
+#define REFCLKO25M_GMAC1_OUT		50
+#define CLK_CIFOUT_OUT			51
+#define CLK_GMAC0_RMII_CRU		52
+#define CLK_GMAC1_RMII_CRU		53
+#define CLK_OTPC_AUTO_RD_G		54
+#define CLK_OTP_PHY_G			55
+#define CLK_MIPI_CAMERAOUT_M0		56
+#define CLK_MIPI_CAMERAOUT_M1		57
+#define CLK_MIPI_CAMERAOUT_M2		58
+#define MCLK_PDM0_SRC_TOP		59
+#define HCLK_AUDIO_ROOT			60
+#define HCLK_ASRC_2CH_0			61
+#define HCLK_ASRC_2CH_1			62
+#define HCLK_ASRC_4CH_0			63
+#define HCLK_ASRC_4CH_1			64
+#define CLK_ASRC_2CH_0			65
+#define CLK_ASRC_2CH_1			66
+#define CLK_ASRC_4CH_0			67
+#define CLK_ASRC_4CH_1			68
+#define MCLK_SAI0_8CH_SRC		69
+#define MCLK_SAI0_8CH			70
+#define HCLK_SAI0_8CH			71
+#define HCLK_SPDIF_RX0			72
+#define MCLK_SPDIF_RX0			73
+#define HCLK_SPDIF_RX1			74
+#define MCLK_SPDIF_RX1			75
+#define MCLK_SAI1_8CH_SRC		76
+#define MCLK_SAI1_8CH			77
+#define HCLK_SAI1_8CH			78
+#define MCLK_SAI2_2CH_SRC		79
+#define MCLK_SAI2_2CH			80
+#define HCLK_SAI2_2CH			81
+#define MCLK_SAI3_2CH_SRC		82
+#define MCLK_SAI3_2CH			83
+#define HCLK_SAI3_2CH			84
+#define MCLK_SAI4_2CH_SRC		85
+#define MCLK_SAI4_2CH			86
+#define HCLK_SAI4_2CH			87
+#define HCLK_ACDCDIG_DSM		88
+#define MCLK_ACDCDIG_DSM		89
+#define CLK_PDM1			90
+#define HCLK_PDM1			91
+#define MCLK_PDM1			92
+#define HCLK_SPDIF_TX0			93
+#define MCLK_SPDIF_TX0			94
+#define HCLK_SPDIF_TX1			95
+#define MCLK_SPDIF_TX1			96
+#define CLK_SAI1_MCLKOUT		97
+#define CLK_SAI2_MCLKOUT		98
+#define CLK_SAI3_MCLKOUT		99
+#define CLK_SAI4_MCLKOUT		100
+#define CLK_SAI0_MCLKOUT		101
+#define HCLK_BUS_ROOT			102
+#define PCLK_BUS_ROOT			103
+#define ACLK_BUS_ROOT			104
+#define HCLK_CAN0			105
+#define CLK_CAN0			106
+#define HCLK_CAN1			107
+#define CLK_CAN1			108
+#define CLK_KEY_SHIFT			109
+#define PCLK_I2C1			110
+#define PCLK_I2C2			111
+#define PCLK_I2C3			112
+#define PCLK_I2C4			113
+#define PCLK_I2C5			114
+#define PCLK_I2C6			115
+#define PCLK_I2C7			116
+#define PCLK_I2C8			117
+#define PCLK_I2C9			118
+#define PCLK_WDT_BUSMCU			119
+#define TCLK_WDT_BUSMCU			120
+#define ACLK_GIC			121
+#define CLK_I2C1			122
+#define CLK_I2C2			123
+#define CLK_I2C3			124
+#define CLK_I2C4			125
+#define CLK_I2C5			126
+#define CLK_I2C6			127
+#define CLK_I2C7			128
+#define CLK_I2C8			129
+#define CLK_I2C9			130
+#define PCLK_SARADC			131
+#define CLK_SARADC			132
+#define PCLK_TSADC			133
+#define CLK_TSADC			134
+#define PCLK_UART0			135
+#define PCLK_UART2			136
+#define PCLK_UART3			137
+#define PCLK_UART4			138
+#define PCLK_UART5			139
+#define PCLK_UART6			140
+#define PCLK_UART7			141
+#define PCLK_UART8			142
+#define PCLK_UART9			143
+#define PCLK_UART10			144
+#define PCLK_UART11			145
+#define SCLK_UART0			146
+#define SCLK_UART2			147
+#define SCLK_UART3			148
+#define SCLK_UART4			149
+#define SCLK_UART5			150
+#define SCLK_UART6			151
+#define SCLK_UART7			152
+#define SCLK_UART8			153
+#define SCLK_UART9			154
+#define SCLK_UART10			155
+#define SCLK_UART11			156
+#define PCLK_SPI0			157
+#define PCLK_SPI1			158
+#define PCLK_SPI2			159
+#define PCLK_SPI3			160
+#define PCLK_SPI4			161
+#define CLK_SPI0			162
+#define CLK_SPI1			163
+#define CLK_SPI2			164
+#define CLK_SPI3			165
+#define CLK_SPI4			166
+#define PCLK_WDT0			167
+#define TCLK_WDT0			168
+#define PCLK_PWM1			169
+#define CLK_PWM1			170
+#define CLK_OSC_PWM1			171
+#define CLK_RC_PWM1			172
+#define PCLK_BUSTIMER0			173
+#define PCLK_BUSTIMER1			174
+#define CLK_TIMER0_ROOT			175
+#define CLK_TIMER0			176
+#define CLK_TIMER1			177
+#define CLK_TIMER2			178
+#define CLK_TIMER3			179
+#define CLK_TIMER4			180
+#define CLK_TIMER5			181
+#define PCLK_MAILBOX0			182
+#define PCLK_GPIO1			183
+#define DBCLK_GPIO1			184
+#define PCLK_GPIO2			185
+#define DBCLK_GPIO2			186
+#define PCLK_GPIO3			187
+#define DBCLK_GPIO3			188
+#define PCLK_GPIO4			189
+#define DBCLK_GPIO4			190
+#define ACLK_DECOM			191
+#define PCLK_DECOM			192
+#define DCLK_DECOM			193
+#define CLK_TIMER1_ROOT			194
+#define CLK_TIMER6			195
+#define CLK_TIMER7			196
+#define CLK_TIMER8			197
+#define CLK_TIMER9			198
+#define CLK_TIMER10			199
+#define CLK_TIMER11			200
+#define ACLK_DMAC0			201
+#define ACLK_DMAC1			202
+#define ACLK_DMAC2			203
+#define ACLK_SPINLOCK			204
+#define HCLK_I3C0			205
+#define HCLK_I3C1			206
+#define HCLK_BUS_CM0_ROOT		207
+#define FCLK_BUS_CM0_CORE		208
+#define CLK_BUS_CM0_RTC			209
+#define PCLK_PMU2			210
+#define PCLK_PWM2			211
+#define CLK_PWM2			212
+#define CLK_RC_PWM2			213
+#define CLK_OSC_PWM2			214
+#define CLK_FREQ_PWM1			215
+#define CLK_COUNTER_PWM1		216
+#define SAI_SCLKIN_FREQ			217
+#define SAI_SCLKIN_COUNTER		218
+#define CLK_I3C0			219
+#define CLK_I3C1			220
+#define PCLK_CSIDPHY1			221
+#define PCLK_DDR_ROOT			222
+#define PCLK_DDR_MON_CH0		223
+#define TMCLK_DDR_MON_CH0		224
+#define ACLK_DDR_ROOT			225
+#define HCLK_DDR_ROOT			226
+#define FCLK_DDR_CM0_CORE		227
+#define CLK_DDR_TIMER_ROOT		228
+#define CLK_DDR_TIMER0			229
+#define CLK_DDR_TIMER1			230
+#define TCLK_WDT_DDR			231
+#define PCLK_WDT			232
+#define PCLK_TIMER			233
+#define CLK_DDR_CM0_RTC			234
+#define ACLK_RKNN0			235
+#define ACLK_RKNN1			236
+#define HCLK_RKNN_ROOT			237
+#define CLK_RKNN_DSU0			238
+#define PCLK_NPUTOP_ROOT		239
+#define PCLK_NPU_TIMER			240
+#define CLK_NPUTIMER_ROOT		241
+#define CLK_NPUTIMER0			242
+#define CLK_NPUTIMER1			243
+#define PCLK_NPU_WDT			244
+#define TCLK_NPU_WDT			245
+#define ACLK_RKNN_CBUF			246
+#define HCLK_NPU_CM0_ROOT		247
+#define FCLK_NPU_CM0_CORE		248
+#define CLK_NPU_CM0_RTC			249
+#define HCLK_RKNN_CBUF			250
+#define HCLK_NVM_ROOT			251
+#define ACLK_NVM_ROOT			252
+#define SCLK_FSPI_X2			253
+#define HCLK_FSPI			254
+#define CCLK_SRC_EMMC			255
+#define HCLK_EMMC			256
+#define ACLK_EMMC			257
+#define BCLK_EMMC			258
+#define TCLK_EMMC			259
+#define PCLK_PHP_ROOT			260
+#define ACLK_PHP_ROOT			261
+#define PCLK_PCIE0			262
+#define CLK_PCIE0_AUX			263
+#define ACLK_PCIE0_MST			264
+#define ACLK_PCIE0_SLV			265
+#define ACLK_PCIE0_DBI			266
+#define ACLK_USB3OTG1			267
+#define CLK_REF_USB3OTG1		268
+#define CLK_SUSPEND_USB3OTG1		269
+#define ACLK_MMU0			270
+#define ACLK_SLV_MMU0			271
+#define ACLK_MMU1			272
+#define ACLK_SLV_MMU1			273
+#define PCLK_PCIE1			275
+#define CLK_PCIE1_AUX			276
+#define ACLK_PCIE1_MST			277
+#define ACLK_PCIE1_SLV			278
+#define ACLK_PCIE1_DBI			279
+#define CLK_RXOOB0			280
+#define CLK_RXOOB1			281
+#define CLK_PMALIVE0			282
+#define CLK_PMALIVE1			283
+#define ACLK_SATA0			284
+#define ACLK_SATA1			285
+#define CLK_USB3OTG1_PIPE_PCLK		286
+#define CLK_USB3OTG1_UTMI		287
+#define CLK_USB3OTG0_PIPE_PCLK		288
+#define CLK_USB3OTG0_UTMI		289
+#define HCLK_SDGMAC_ROOT		290
+#define ACLK_SDGMAC_ROOT		291
+#define PCLK_SDGMAC_ROOT		292
+#define ACLK_GMAC0			293
+#define ACLK_GMAC1			294
+#define PCLK_GMAC0			295
+#define PCLK_GMAC1			296
+#define CCLK_SRC_SDIO			297
+#define HCLK_SDIO			298
+#define CLK_GMAC1_PTP_REF		299
+#define CLK_GMAC0_PTP_REF		300
+#define CLK_GMAC1_PTP_REF_SRC		301
+#define CLK_GMAC0_PTP_REF_SRC		302
+#define CCLK_SRC_SDMMC0			303
+#define HCLK_SDMMC0			304
+#define SCLK_FSPI1_X2			305
+#define HCLK_FSPI1			306
+#define ACLK_DSMC_ROOT			307
+#define ACLK_DSMC			308
+#define PCLK_DSMC			309
+#define CLK_DSMC_SYS			310
+#define HCLK_HSGPIO			311
+#define CLK_HSGPIO_TX			312
+#define CLK_HSGPIO_RX			313
+#define ACLK_HSGPIO			314
+#define PCLK_PHPPHY_ROOT		315
+#define PCLK_PCIE2_COMBOPHY0		316
+#define PCLK_PCIE2_COMBOPHY1		317
+#define CLK_PCIE_100M_SRC		318
+#define CLK_PCIE_100M_NDUTY_SRC		319
+#define CLK_REF_PCIE0_PHY		320
+#define CLK_REF_PCIE1_PHY		321
+#define CLK_REF_MPHY_26M		322
+#define HCLK_RKVDEC_ROOT		323
+#define ACLK_RKVDEC_ROOT		324
+#define HCLK_RKVDEC			325
+#define CLK_RKVDEC_HEVC_CA		326
+#define CLK_RKVDEC_CORE			327
+#define ACLK_UFS_ROOT			328
+#define ACLK_USB_ROOT			329
+#define PCLK_USB_ROOT			330
+#define ACLK_USB3OTG0			331
+#define CLK_REF_USB3OTG0		332
+#define CLK_SUSPEND_USB3OTG0		333
+#define ACLK_MMU2			334
+#define ACLK_SLV_MMU2			335
+#define ACLK_UFS_SYS			336
+#define ACLK_VPU_ROOT			337
+#define ACLK_VPU_MID_ROOT		338
+#define HCLK_VPU_ROOT			339
+#define ACLK_JPEG_ROOT			340
+#define ACLK_VPU_LOW_ROOT		341
+#define HCLK_RGA2E_0			342
+#define ACLK_RGA2E_0			343
+#define CLK_CORE_RGA2E_0		344
+#define ACLK_JPEG			345
+#define HCLK_JPEG			346
+#define HCLK_VDPP			347
+#define ACLK_VDPP			348
+#define CLK_CORE_VDPP			349
+#define HCLK_RGA2E_1			350
+#define ACLK_RGA2E_1			351
+#define CLK_CORE_RGA2E_1		352
+#define DCLK_EBC_FRAC_SRC		353
+#define HCLK_EBC			354
+#define ACLK_EBC			355
+#define DCLK_EBC			356
+#define HCLK_VEPU0_ROOT			357
+#define ACLK_VEPU0_ROOT			358
+#define HCLK_VEPU0			359
+#define ACLK_VEPU0			360
+#define CLK_VEPU0_CORE			361
+#define ACLK_VI_ROOT			362
+#define HCLK_VI_ROOT			363
+#define PCLK_VI_ROOT			364
+#define DCLK_VICAP			365
+#define ACLK_VICAP			366
+#define HCLK_VICAP			367
+#define CLK_ISP_CORE			368
+#define CLK_ISP_CORE_MARVIN		369
+#define CLK_ISP_CORE_VICAP		370
+#define ACLK_ISP			371
+#define HCLK_ISP			372
+#define ACLK_VPSS			373
+#define HCLK_VPSS			374
+#define CLK_CORE_VPSS			375
+#define PCLK_CSI_HOST_0			376
+#define PCLK_CSI_HOST_1			377
+#define PCLK_CSI_HOST_2			378
+#define PCLK_CSI_HOST_3			379
+#define PCLK_CSI_HOST_4			380
+#define ICLK_CSIHOST01			381
+#define ICLK_CSIHOST0			382
+#define CLK_ISP_PVTPLL_SRC		383
+#define ACLK_VI_ROOT_INTER		384
+#define CLK_VICAP_I0CLK			385
+#define CLK_VICAP_I1CLK			386
+#define CLK_VICAP_I2CLK			387
+#define CLK_VICAP_I3CLK			388
+#define CLK_VICAP_I4CLK			389
+#define ACLK_VOP_ROOT			390
+#define HCLK_VOP_ROOT			391
+#define PCLK_VOP_ROOT			392
+#define HCLK_VOP			393
+#define ACLK_VOP			394
+#define DCLK_VP0_SRC			395
+#define DCLK_VP1_SRC			396
+#define DCLK_VP2_SRC			397
+#define DCLK_VP0			398
+#define DCLK_VP1			400
+#define DCLK_VP2			401
+#define PCLK_VOPGRF			402
+#define ACLK_VO0_ROOT			403
+#define HCLK_VO0_ROOT			404
+#define PCLK_VO0_ROOT			405
+#define PCLK_VO0_GRF			406
+#define ACLK_HDCP0			407
+#define HCLK_HDCP0			408
+#define PCLK_HDCP0			409
+#define CLK_TRNG0_SKP			410
+#define PCLK_DSIHOST0			411
+#define CLK_DSIHOST0			412
+#define PCLK_HDMITX0			413
+#define CLK_HDMITX0_EARC		414
+#define CLK_HDMITX0_REF			415
+#define PCLK_EDP0			416
+#define CLK_EDP0_24M			417
+#define CLK_EDP0_200M			418
+#define MCLK_SAI5_8CH_SRC		419
+#define MCLK_SAI5_8CH			420
+#define HCLK_SAI5_8CH			421
+#define MCLK_SAI6_8CH_SRC		422
+#define MCLK_SAI6_8CH			423
+#define HCLK_SAI6_8CH			424
+#define HCLK_SPDIF_TX2			425
+#define MCLK_SPDIF_TX2			426
+#define HCLK_SPDIF_RX2			427
+#define MCLK_SPDIF_RX2			428
+#define HCLK_SAI8_8CH			429
+#define MCLK_SAI8_8CH_SRC		430
+#define MCLK_SAI8_8CH			431
+#define ACLK_VO1_ROOT			432
+#define HCLK_VO1_ROOT			433
+#define PCLK_VO1_ROOT			434
+#define MCLK_SAI7_8CH_SRC		435
+#define MCLK_SAI7_8CH			436
+#define HCLK_SAI7_8CH			437
+#define HCLK_SPDIF_TX3			438
+#define HCLK_SPDIF_TX4			439
+#define HCLK_SPDIF_TX5			440
+#define MCLK_SPDIF_TX3			441
+#define CLK_AUX16MHZ_0			442
+#define ACLK_DP0			443
+#define PCLK_DP0			444
+#define PCLK_VO1_GRF			445
+#define ACLK_HDCP1			446
+#define HCLK_HDCP1			447
+#define PCLK_HDCP1			448
+#define CLK_TRNG1_SKP			449
+#define HCLK_SAI9_8CH			450
+#define MCLK_SAI9_8CH_SRC		451
+#define MCLK_SAI9_8CH			452
+#define MCLK_SPDIF_TX4			453
+#define MCLK_SPDIF_TX5			454
+#define CLK_GPU_SRC_PRE			455
+#define CLK_GPU				456
+#define PCLK_GPU_ROOT			457
+#define ACLK_CENTER_ROOT		458
+#define ACLK_CENTER_LOW_ROOT		459
+#define HCLK_CENTER_ROOT		460
+#define PCLK_CENTER_ROOT		461
+#define ACLK_DMA2DDR			462
+#define ACLK_DDR_SHAREMEM		463
+#define PCLK_DMA2DDR			464
+#define PCLK_SHAREMEM			465
+#define HCLK_VEPU1_ROOT			466
+#define ACLK_VEPU1_ROOT			467
+#define HCLK_VEPU1			468
+#define ACLK_VEPU1			469
+#define CLK_VEPU1_CORE			470
+#define CLK_JDBCK_DAP			471
+#define PCLK_MIPI_DCPHY			472
+#define CLK_32K_USB2DEBUG		473
+#define PCLK_CSIDPHY			474
+#define PCLK_USBDPPHY			475
+#define CLK_PMUPHY_REF_SRC		476
+#define CLK_USBDP_COMBO_PHY_IMMORTAL	477
+#define CLK_HDMITXHPD			478
+#define PCLK_MPHY			479
+#define CLK_REF_OSC_MPHY		480
+#define CLK_REF_UFS_CLKOUT		481
+#define HCLK_PMU1_ROOT			482
+#define HCLK_PMU_CM0_ROOT		483
+#define CLK_200M_PMU_SRC		484
+#define CLK_100M_PMU_SRC		485
+#define CLK_50M_PMU_SRC			486
+#define FCLK_PMU_CM0_CORE		487
+#define CLK_PMU_CM0_RTC			488
+#define PCLK_PMU1			489
+#define CLK_PMU1			490
+#define PCLK_PMU1WDT			491
+#define TCLK_PMU1WDT			492
+#define PCLK_PMUTIMER			493
+#define CLK_PMUTIMER_ROOT		494
+#define CLK_PMUTIMER0			495
+#define CLK_PMUTIMER1			496
+#define PCLK_PMU1PWM			497
+#define CLK_PMU1PWM			498
+#define CLK_PMU1PWM_OSC			499
+#define PCLK_PMUPHY_ROOT		500
+#define PCLK_I2C0			501
+#define CLK_I2C0			502
+#define SCLK_UART1			503
+#define PCLK_UART1			504
+#define CLK_PMU1PWM_RC			505
+#define CLK_PDM0			506
+#define HCLK_PDM0			507
+#define MCLK_PDM0			508
+#define HCLK_VAD			509
+#define CLK_OSCCHK_PVTM			510
+#define CLK_PDM0_OUT			511
+#define CLK_HPTIMER_SRC			512
+#define PCLK_PMU0_ROOT			516
+#define PCLK_PMU0			517
+#define PCLK_GPIO0			518
+#define DBCLK_GPIO0			519
+#define CLK_OSC0_PMU1			520
+#define PCLK_PMU1_ROOT			521
+#define XIN_OSC0_DIV			522
+#define ACLK_USB			523
+#define ACLK_UFS			524
+#define ACLK_SDGMAC			525
+#define HCLK_SDGMAC			526
+#define PCLK_SDGMAC			527
+#define HCLK_VO1			528
+#define HCLK_VO0			529
+#define PCLK_CCI_ROOT			532
+#define ACLK_CCI_ROOT			533
+#define HCLK_VO0VOP_CHANNEL		534
+#define ACLK_VO0VOP_CHANNEL		535
+#define ACLK_TOP_MID			536
+#define ACLK_SECURE_HIGH		537
+#define CLK_USBPHY_REF_SRC		538
+#define CLK_PHY_REF_SRC			539
+#define CLK_CPLL_REF_SRC		540
+#define CLK_AUPLL_REF_SRC		541
+#define PCLK_SECURE_NS			542
+#define HCLK_SECURE_NS			543
+#define ACLK_SECURE_NS			544
+#define PCLK_OTPC_NS			545
+#define HCLK_CRYPTO_NS			546
+#define HCLK_TRNG_NS			547
+#define CLK_OTPC_NS			548
+#define SCLK_DSU			549
+#define SCLK_DDR			550
+#define ACLK_CRYPTO_NS			551
+#define CLK_PKA_CRYPTO_NS		552
+#define ACLK_RKVDEC_ROOT_BAK		553
+#define CLK_AUDIO_FRAC_0_SRC		554
+#define CLK_AUDIO_FRAC_1_SRC		555
+#define CLK_AUDIO_FRAC_2_SRC		556
+#define CLK_AUDIO_FRAC_3_SRC		557
+#define PCLK_HDPTX_APB			558
+
+/* secure clk */
+#define CLK_STIMER0_ROOT		600
+#define CLK_STIMER1_ROOT		601
+#define PCLK_SECURE_S			602
+#define HCLK_SECURE_S			603
+#define ACLK_SECURE_S			604
+#define CLK_PKA_CRYPTO_S		605
+#define HCLK_VO1_S			606
+#define PCLK_VO1_S			607
+#define HCLK_VO0_S			608
+#define PCLK_VO0_S			609
+#define PCLK_KLAD			610
+#define HCLK_CRYPTO_S			611
+#define HCLK_KLAD			612
+#define ACLK_CRYPTO_S			613
+#define HCLK_TRNG_S			614
+#define PCLK_OTPC_S			615
+#define CLK_OTPC_S			616
+#define PCLK_WDT_S			617
+#define TCLK_WDT_S			618
+#define PCLK_HDCP0_TRNG			619
+#define PCLK_HDCP1_TRNG			620
+#define HCLK_HDCP_KEY0			621
+#define HCLK_HDCP_KEY1			622
+#define PCLK_EDP_S			623
+#define ACLK_KLAD			624
+
+#define CLK_NR_CLKS			(ACLK_KLAD + 1)
+
+/********Name=SOFTRST_CON01,Offset=0xA04********/
+#define SRST_A_TOP_BIU			19
+#define SRST_P_TOP_BIU			21
+#define SRST_A_TOP_MID_BIU		22
+#define SRST_A_SECURE_HIGH_BIU		23
+#define SRST_H_TOP_BIU			30
+/********Name=SOFTRST_CON02,Offset=0xA08********/
+#define SRST_H_VO0VOP_CHANNEL_BIU	32
+#define SRST_A_VO0VOP_CHANNEL_BIU	33
+/********Name=SOFTRST_CON06,Offset=0xA18********/
+#define SRST_BISRINTF			98
+/********Name=SOFTRST_CON07,Offset=0xA1C********/
+#define SRST_H_AUDIO_BIU		114
+#define SRST_H_ASRC_2CH_0		115
+#define SRST_H_ASRC_2CH_1		116
+#define SRST_H_ASRC_4CH_0		117
+#define SRST_H_ASRC_4CH_1		118
+#define SRST_ASRC_2CH_0			119
+#define SRST_ASRC_2CH_1			120
+#define SRST_ASRC_4CH_0			121
+#define SRST_ASRC_4CH_1			122
+#define SRST_M_SAI0_8CH			124
+#define SRST_H_SAI0_8CH			125
+#define SRST_H_SPDIF_RX0		126
+#define SRST_M_SPDIF_RX0		127
+/********Name=SOFTRST_CON08,Offset=0xA20********/
+#define SRST_H_SPDIF_RX1		128
+#define SRST_M_SPDIF_RX1		129
+#define SRST_M_SAI1_8CH			133
+#define SRST_H_SAI1_8CH			134
+#define SRST_M_SAI2_2CH			136
+#define SRST_H_SAI2_2CH			138
+#define SRST_M_SAI3_2CH			140
+#define SRST_H_SAI3_2CH			142
+/********Name=SOFTRST_CON09,Offset=0xA24********/
+#define SRST_M_SAI4_2CH			144
+#define SRST_H_SAI4_2CH			146
+#define SRST_H_ACDCDIG_DSM		147
+#define SRST_M_ACDCDIG_DSM		148
+#define SRST_PDM1			149
+#define SRST_H_PDM1			151
+#define SRST_M_PDM1			152
+#define SRST_H_SPDIF_TX0		153
+#define SRST_M_SPDIF_TX0		154
+#define SRST_H_SPDIF_TX1		155
+#define SRST_M_SPDIF_TX1		156
+/********Name=SOFTRST_CON11,Offset=0xA2C********/
+#define SRST_A_BUS_BIU			179
+#define SRST_P_BUS_BIU			180
+#define SRST_P_CRU			181
+#define SRST_H_CAN0			182
+#define SRST_CAN0			183
+#define SRST_H_CAN1			184
+#define SRST_CAN1			185
+#define SRST_P_INTMUX2BUS		188
+#define SRST_P_VCCIO_IOC		189
+#define SRST_H_BUS_BIU			190
+#define SRST_KEY_SHIFT			191
+/********Name=SOFTRST_CON12,Offset=0xA30********/
+#define SRST_P_I2C1			192
+#define SRST_P_I2C2			193
+#define SRST_P_I2C3			194
+#define SRST_P_I2C4			195
+#define SRST_P_I2C5			196
+#define SRST_P_I2C6			197
+#define SRST_P_I2C7			198
+#define SRST_P_I2C8			199
+#define SRST_P_I2C9			200
+#define SRST_P_WDT_BUSMCU		201
+#define SRST_T_WDT_BUSMCU		202
+#define SRST_A_GIC			203
+#define SRST_I2C1			204
+#define SRST_I2C2			205
+#define SRST_I2C3			206
+#define SRST_I2C4			207
+/********Name=SOFTRST_CON13,Offset=0xA34********/
+#define SRST_I2C5			208
+#define SRST_I2C6			209
+#define SRST_I2C7			210
+#define SRST_I2C8			211
+#define SRST_I2C9			212
+#define SRST_P_SARADC			214
+#define SRST_SARADC			215
+#define SRST_P_TSADC			216
+#define SRST_TSADC			217
+#define SRST_P_UART0			218
+#define SRST_P_UART2			219
+#define SRST_P_UART3			220
+#define SRST_P_UART4			221
+#define SRST_P_UART5			222
+#define SRST_P_UART6			223
+/********Name=SOFTRST_CON14,Offset=0xA38********/
+#define SRST_P_UART7			224
+#define SRST_P_UART8			225
+#define SRST_P_UART9			226
+#define SRST_P_UART10			227
+#define SRST_P_UART11			228
+#define SRST_S_UART0			229
+#define SRST_S_UART2			230
+#define SRST_S_UART3			233
+#define SRST_S_UART4			236
+#define SRST_S_UART5			239
+/********Name=SOFTRST_CON15,Offset=0xA3C********/
+#define SRST_S_UART6			242
+#define SRST_S_UART7			245
+#define SRST_S_UART8			248
+#define SRST_S_UART9			249
+#define SRST_S_UART10			250
+#define SRST_S_UART11			251
+#define SRST_P_SPI0			253
+#define SRST_P_SPI1			254
+#define SRST_P_SPI2			255
+/********Name=SOFTRST_CON16,Offset=0xA40********/
+#define SRST_P_SPI3			256
+#define SRST_P_SPI4			257
+#define SRST_SPI0			258
+#define SRST_SPI1			259
+#define SRST_SPI2			260
+#define SRST_SPI3			261
+#define SRST_SPI4			262
+#define SRST_P_WDT0			263
+#define SRST_T_WDT0			264
+#define SRST_P_SYS_GRF			265
+#define SRST_P_PWM1			266
+#define SRST_PWM1			267
+
+/********Name=SOFTRST_CON17,Offset=0xA44********/
+#define SRST_P_BUSTIMER0		275
+#define SRST_P_BUSTIMER1		276
+#define SRST_TIMER0			278
+#define SRST_TIMER1			279
+#define SRST_TIMER2			280
+#define SRST_TIMER3			281
+#define SRST_TIMER4			282
+#define SRST_TIMER5			283
+#define SRST_P_BUSIOC			284
+#define SRST_P_MAILBOX0			285
+#define SRST_P_GPIO1			287
+/********Name=SOFTRST_CON18,Offset=0xA48********/
+#define SRST_GPIO1			288
+#define SRST_P_GPIO2			289
+#define SRST_GPIO2			290
+#define SRST_P_GPIO3			291
+#define SRST_GPIO3			292
+#define SRST_P_GPIO4			293
+#define SRST_GPIO4			294
+#define SRST_A_DECOM			295
+#define SRST_P_DECOM			296
+#define SRST_D_DECOM			297
+#define SRST_TIMER6			299
+#define SRST_TIMER7			300
+#define SRST_TIMER8			301
+#define SRST_TIMER9			302
+#define SRST_TIMER10			303
+/********Name=SOFTRST_CON19,Offset=0xA4C********/
+#define SRST_TIMER11			304
+#define SRST_A_DMAC0			305
+#define SRST_A_DMAC1			306
+#define SRST_A_DMAC2			307
+#define SRST_A_SPINLOCK			308
+#define SRST_REF_PVTPLL_BUS		309
+#define SRST_H_I3C0			311
+#define SRST_H_I3C1			313
+#define SRST_H_BUS_CM0_BIU		315
+#define SRST_F_BUS_CM0_CORE		316
+#define SRST_T_BUS_CM0_JTAG		317
+/********Name=SOFTRST_CON20,Offset=0xA50********/
+#define SRST_P_INTMUX2PMU		320
+#define SRST_P_INTMUX2DDR		321
+#define SRST_P_PVTPLL_BUS		323
+#define SRST_P_PWM2			324
+#define SRST_PWM2			325
+#define SRST_FREQ_PWM1			328
+#define SRST_COUNTER_PWM1		329
+#define SRST_I3C0			332
+#define SRST_I3C1			333
+/********Name=SOFTRST_CON21,Offset=0xA54********/
+#define SRST_P_DDR_MON_CH0		337
+#define SRST_P_DDR_BIU			338
+#define SRST_P_DDR_UPCTL_CH0		339
+#define SRST_TM_DDR_MON_CH0		340
+#define SRST_A_DDR_BIU			341
+#define SRST_DFI_CH0			342
+#define SRST_DDR_MON_CH0		346
+#define SRST_P_DDR_HWLP_CH0		349
+#define SRST_P_DDR_MON_CH1		350
+#define SRST_P_DDR_HWLP_CH1		351
+/********Name=SOFTRST_CON22,Offset=0xA58********/
+#define SRST_P_DDR_UPCTL_CH1		352
+#define SRST_TM_DDR_MON_CH1		353
+#define SRST_DFI_CH1			354
+#define SRST_A_DDR01_MSCH0		355
+#define SRST_A_DDR01_MSCH1		356
+#define SRST_DDR_MON_CH1		358
+#define SRST_DDR_SCRAMBLE_CH0		361
+#define SRST_DDR_SCRAMBLE_CH1		362
+#define SRST_P_AHB2APB			364
+#define SRST_H_AHB2APB			365
+#define SRST_H_DDR_BIU			366
+#define SRST_F_DDR_CM0_CORE		367
+/********Name=SOFTRST_CON23,Offset=0xA5C********/
+#define SRST_P_DDR01_MSCH0		369
+#define SRST_P_DDR01_MSCH1		370
+#define SRST_DDR_TIMER0			372
+#define SRST_DDR_TIMER1			373
+#define SRST_T_WDT_DDR			374
+#define SRST_P_WDT			375
+#define SRST_P_TIMER			376
+#define SRST_T_DDR_CM0_JTAG		377
+#define SRST_P_DDR_GRF			379
+/********Name=SOFTRST_CON25,Offset=0xA64********/
+#define SRST_DDR_UPCTL_CH0		401
+#define SRST_A_DDR_UPCTL_0_CH0		402
+#define SRST_A_DDR_UPCTL_1_CH0		403
+#define SRST_A_DDR_UPCTL_2_CH0		404
+#define SRST_A_DDR_UPCTL_3_CH0		405
+#define SRST_A_DDR_UPCTL_4_CH0		406
+/********Name=SOFTRST_CON26,Offset=0xA68********/
+#define SRST_DDR_UPCTL_CH1		417
+#define SRST_A_DDR_UPCTL_0_CH1		418
+#define SRST_A_DDR_UPCTL_1_CH1		419
+#define SRST_A_DDR_UPCTL_2_CH1		420
+#define SRST_A_DDR_UPCTL_3_CH1		421
+#define SRST_A_DDR_UPCTL_4_CH1		422
+/********Name=SOFTRST_CON27,Offset=0xA6C********/
+#define SRST_REF_PVTPLL_DDR		432
+#define SRST_P_PVTPLL_DDR		433
+
+/********Name=SOFTRST_CON28,Offset=0xA70********/
+#define SRST_A_RKNN0			457
+#define SRST_A_RKNN0_BIU		459
+#define SRST_L_RKNN0_BIU		460
+/********Name=SOFTRST_CON29,Offset=0xA74********/
+#define SRST_A_RKNN1			464
+#define SRST_A_RKNN1_BIU		466
+#define SRST_L_RKNN1_BIU		467
+/********Name=SOFTRST_CON31,Offset=0xA7C********/
+#define SRST_NPU_DAP			496
+#define SRST_L_NPUSUBSYS_BIU		497
+#define SRST_P_NPUTOP_BIU		505
+#define SRST_P_NPU_TIMER		506
+#define SRST_NPUTIMER0			508
+#define SRST_NPUTIMER1			509
+#define SRST_P_NPU_WDT			510
+#define SRST_T_NPU_WDT			511
+/********Name=SOFTRST_CON32,Offset=0xA80********/
+#define SRST_A_RKNN_CBUF		512
+#define SRST_A_RVCORE0			513
+#define SRST_P_NPU_GRF			514
+#define SRST_P_PVTPLL_NPU		515
+#define SRST_NPU_PVTPLL			516
+#define SRST_H_NPU_CM0_BIU		518
+#define SRST_F_NPU_CM0_CORE		519
+#define SRST_T_NPU_CM0_JTAG		520
+#define SRST_A_RKNNTOP_BIU		523
+#define SRST_H_RKNN_CBUF		524
+#define SRST_H_RKNNTOP_BIU		525
+/********Name=SOFTRST_CON33,Offset=0xA84********/
+#define SRST_H_NVM_BIU			530
+#define SRST_A_NVM_BIU			531
+#define SRST_S_FSPI			534
+#define SRST_H_FSPI			535
+#define SRST_C_EMMC			536
+#define SRST_H_EMMC			537
+#define SRST_A_EMMC			538
+#define SRST_B_EMMC			539
+#define SRST_T_EMMC			540
+/********Name=SOFTRST_CON34,Offset=0xA88********/
+#define SRST_P_GRF			545
+#define SRST_P_PHP_BIU			549
+#define SRST_A_PHP_BIU			553
+#define SRST_P_PCIE0			557
+#define SRST_PCIE0_POWER_UP		559
+/********Name=SOFTRST_CON35,Offset=0xA8C********/
+#define SRST_A_USB3OTG1			563
+#define SRST_A_MMU0			571
+#define SRST_A_SLV_MMU0			573
+#define SRST_A_MMU1			574
+/********Name=SOFTRST_CON36,Offset=0xA90********/
+#define SRST_A_SLV_MMU1			576
+#define SRST_P_PCIE1			583
+#define SRST_PCIE1_POWER_UP		585
+/********Name=SOFTRST_CON37,Offset=0xA94********/
+#define SRST_RXOOB0			592
+#define SRST_RXOOB1			593
+#define SRST_PMALIVE0			594
+#define SRST_PMALIVE1			595
+#define SRST_A_SATA0			596
+#define SRST_A_SATA1			597
+#define SRST_ASIC1			598
+#define SRST_ASIC0			599
+/********Name=SOFTRST_CON40,Offset=0xAA0********/
+#define SRST_P_CSIDPHY1			642
+#define SRST_SCAN_CSIDPHY1		643
+/********Name=SOFTRST_CON42,Offset=0xAA8********/
+#define SRST_P_SDGMAC_GRF		675
+#define SRST_P_SDGMAC_BIU		676
+#define SRST_A_SDGMAC_BIU		677
+#define SRST_H_SDGMAC_BIU		678
+#define SRST_A_GMAC0			679
+#define SRST_A_GMAC1			680
+#define SRST_P_GMAC0			681
+#define SRST_P_GMAC1			682
+#define SRST_H_SDIO			684
+/********Name=SOFTRST_CON43,Offset=0xAAC********/
+#define SRST_H_SDMMC0			690
+#define SRST_S_FSPI1			691
+#define SRST_H_FSPI1			692
+#define SRST_A_DSMC_BIU			694
+#define SRST_A_DSMC			695
+#define SRST_P_DSMC			696
+#define SRST_H_HSGPIO			698
+#define SRST_HSGPIO			699
+#define SRST_A_HSGPIO			701
+/********Name=SOFTRST_CON45,Offset=0xAB4********/
+#define SRST_H_RKVDEC			723
+#define SRST_H_RKVDEC_BIU		725
+#define SRST_A_RKVDEC_BIU		726
+#define SRST_RKVDEC_HEVC_CA		728
+#define SRST_RKVDEC_CORE		729
+/********Name=SOFTRST_CON47,Offset=0xABC********/
+#define SRST_A_USB_BIU			755
+#define SRST_P_USBUFS_BIU		756
+#define SRST_A_USB3OTG0			757
+#define SRST_A_UFS_BIU			762
+#define SRST_A_MMU2			764
+#define SRST_A_SLV_MMU2			765
+#define SRST_A_UFS_SYS			767
+/********Name=SOFTRST_CON48,Offset=0xAC0********/
+#define SRST_A_UFS			768
+#define SRST_P_USBUFS_GRF		769
+#define SRST_P_UFS_GRF			770
+/********Name=SOFTRST_CON49,Offset=0xAC4********/
+#define SRST_H_VPU_BIU			790
+#define SRST_A_JPEG_BIU			791
+#define SRST_A_RGA_BIU			794
+#define SRST_A_VDPP_BIU			795
+#define SRST_A_EBC_BIU			796
+#define SRST_H_RGA2E_0			797
+#define SRST_A_RGA2E_0			798
+#define SRST_CORE_RGA2E_0		799
+/********Name=SOFTRST_CON50,Offset=0xAC8********/
+#define SRST_A_JPEG			800
+#define SRST_H_JPEG			801
+#define SRST_H_VDPP			802
+#define SRST_A_VDPP			803
+#define SRST_CORE_VDPP			804
+#define SRST_H_RGA2E_1			805
+#define SRST_A_RGA2E_1			806
+#define SRST_CORE_RGA2E_1		807
+#define SRST_H_EBC			810
+#define SRST_A_EBC			811
+#define SRST_D_EBC			812
+/********Name=SOFTRST_CON51,Offset=0xACC********/
+#define SRST_H_VEPU0_BIU		818
+#define SRST_A_VEPU0_BIU		819
+#define SRST_H_VEPU0			820
+#define SRST_A_VEPU0			821
+#define SRST_VEPU0_CORE			822
+/********Name=SOFTRST_CON53,Offset=0xAD4********/
+#define SRST_A_VI_BIU			851
+#define SRST_H_VI_BIU			852
+#define SRST_P_VI_BIU			853
+#define SRST_D_VICAP			854
+#define SRST_A_VICAP			855
+#define SRST_H_VICAP			856
+#define SRST_ISP0			858
+#define SRST_ISP0_VICAP			859
+/********Name=SOFTRST_CON54,Offset=0xAD8********/
+#define SRST_CORE_VPSS			865
+#define SRST_P_CSI_HOST_0		868
+#define SRST_P_CSI_HOST_1		869
+#define SRST_P_CSI_HOST_2		870
+#define SRST_P_CSI_HOST_3		871
+#define SRST_P_CSI_HOST_4		872
+/********Name=SOFTRST_CON59,Offset=0xAEC********/
+#define SRST_CIFIN			944
+#define SRST_VICAP_I0CLK		945
+#define SRST_VICAP_I1CLK		946
+#define SRST_VICAP_I2CLK		947
+#define SRST_VICAP_I3CLK		948
+#define SRST_VICAP_I4CLK		949
+/********Name=SOFTRST_CON61,Offset=0xAF4********/
+#define SRST_A_VOP_BIU			980
+#define SRST_A_VOP2_BIU			981
+#define SRST_H_VOP_BIU			982
+#define SRST_P_VOP_BIU			983
+#define SRST_H_VOP			984
+#define SRST_A_VOP			985
+#define SRST_D_VP0			989
+/********Name=SOFTRST_CON62,Offset=0xAF8********/
+#define SRST_D_VP1			992
+#define SRST_D_VP2			993
+#define SRST_P_VOP2_BIU			994
+#define SRST_P_VOPGRF			995
+/********Name=SOFTRST_CON63,Offset=0xAFC********/
+#define SRST_H_VO0_BIU			1013
+#define SRST_P_VO0_BIU			1015
+#define SRST_A_HDCP0_BIU		1017
+#define SRST_P_VO0_GRF			1018
+#define SRST_A_HDCP0			1020
+#define SRST_H_HDCP0			1021
+#define SRST_HDCP0			1022
+/********Name=SOFTRST_CON64,Offset=0xB00********/
+#define SRST_P_DSIHOST0			1029
+#define SRST_DSIHOST0			1030
+#define SRST_P_HDMITX0			1031
+#define SRST_HDMITX0_REF		1033
+#define SRST_P_EDP0			1037
+#define SRST_EDP0_24M			1038
+/********Name=SOFTRST_CON65,Offset=0xB04********/
+#define SRST_M_SAI5_8CH			1044
+#define SRST_H_SAI5_8CH			1045
+#define SRST_M_SAI6_8CH			1048
+#define SRST_H_SAI6_8CH			1049
+#define SRST_H_SPDIF_TX2		1050
+#define SRST_M_SPDIF_TX2		1053
+#define SRST_H_SPDIF_RX2		1054
+#define SRST_M_SPDIF_RX2		1055
+/********Name=SOFTRST_CON66,Offset=0xB08********/
+#define SRST_H_SAI8_8CH			1056
+#define SRST_M_SAI8_8CH			1058
+/********Name=SOFTRST_CON67,Offset=0xB0C********/
+#define SRST_H_VO1_BIU			1077
+#define SRST_P_VO1_BIU			1078
+#define SRST_M_SAI7_8CH			1081
+#define SRST_H_SAI7_8CH			1082
+#define SRST_H_SPDIF_TX3		1083
+#define SRST_H_SPDIF_TX4		1084
+#define SRST_H_SPDIF_TX5		1085
+#define SRST_M_SPDIF_TX3		1086
+/********Name=SOFTRST_CON68,Offset=0xB10********/
+#define SRST_DP0			1088
+#define SRST_P_VO1_GRF			1090
+#define SRST_A_HDCP1_BIU		1091
+#define SRST_A_HDCP1			1092
+#define SRST_H_HDCP1			1093
+#define SRST_HDCP1			1094
+#define SRST_H_SAI9_8CH			1097
+#define SRST_M_SAI9_8CH			1099
+#define SRST_M_SPDIF_TX4		1100
+#define SRST_M_SPDIF_TX5		1101
+/********Name=SOFTRST_CON69,Offset=0xB14********/
+#define SRST_GPU			1107
+#define SRST_A_S_GPU_BIU		1110
+#define SRST_A_M0_GPU_BIU		1111
+#define SRST_P_GPU_BIU			1113
+#define SRST_P_GPU_GRF			1117
+#define SRST_GPU_PVTPLL			1118
+#define SRST_P_PVTPLL_GPU		1119
+/********Name=SOFTRST_CON72,Offset=0xB20********/
+#define SRST_A_CENTER_BIU		1156
+#define SRST_A_DMA2DDR			1157
+#define SRST_A_DDR_SHAREMEM		1158
+#define SRST_A_DDR_SHAREMEM_BIU		1159
+#define SRST_H_CENTER_BIU		1160
+#define SRST_P_CENTER_GRF		1161
+#define SRST_P_DMA2DDR			1162
+#define SRST_P_SHAREMEM			1163
+#define SRST_P_CENTER_BIU		1164
+/********Name=SOFTRST_CON75,Offset=0xB2C********/
+#define SRST_LINKSYM_HDMITXPHY0		1201
+/********Name=SOFTRST_CON78,Offset=0xB38********/
+#define SRST_DP0_PIXELCLK		1249
+#define SRST_PHY_DP0_TX			1250
+#define SRST_DP1_PIXELCLK		1251
+#define SRST_DP2_PIXELCLK		1252
+/********Name=SOFTRST_CON79,Offset=0xB3C********/
+#define SRST_H_VEPU1_BIU		1265
+#define SRST_A_VEPU1_BIU		1266
+#define SRST_H_VEPU1			1267
+#define SRST_A_VEPU1			1268
+#define SRST_VEPU1_CORE			1269
+
+/********Name=PHPPHYSOFTRST_CON00,Offset=0x8A00********/
+#define SRST_P_PHPPHY_CRU		131073
+#define SRST_P_APB2ASB_SLV_CHIP_TOP	131075
+#define SRST_P_PCIE2_COMBOPHY0		131077
+#define SRST_P_PCIE2_COMBOPHY0_GRF	131078
+#define SRST_P_PCIE2_COMBOPHY1		131079
+#define SRST_P_PCIE2_COMBOPHY1_GRF	131080
+/********Name=PHPPHYSOFTRST_CON01,Offset=0x8A04********/
+#define SRST_PCIE0_PIPE_PHY		131093
+#define SRST_PCIE1_PIPE_PHY		131096
+
+/********Name=SECURENSSOFTRST_CON00,Offset=0x10A00********/
+#define SRST_H_CRYPTO_NS		262147
+#define SRST_H_TRNG_NS			262148
+#define SRST_P_OTPC_NS			262152
+#define SRST_OTPC_NS			262153
+
+/********Name=PMU1SOFTRST_CON00,Offset=0x20A00********/
+#define SRST_P_HDPTX_GRF		524288
+#define SRST_P_HDPTX_APB		524289
+#define SRST_P_MIPI_DCPHY		524290
+#define SRST_P_DCPHY_GRF		524291
+#define SRST_P_BOT0_APB2ASB		524292
+#define SRST_P_BOT1_APB2ASB		524293
+#define SRST_USB2DEBUG			524294
+#define SRST_P_CSIPHY_GRF		524295
+#define SRST_P_CSIPHY			524296
+#define SRST_P_USBPHY_GRF_0		524297
+#define SRST_P_USBPHY_GRF_1		524298
+#define SRST_P_USBDP_GRF		524299
+#define SRST_P_USBDPPHY			524300
+#define SRST_USBDP_COMBO_PHY_INIT 524303
+/********Name=PMU1SOFTRST_CON01,Offset=0x20A04********/
+#define SRST_USBDP_COMBO_PHY_CMN	524304
+#define SRST_USBDP_COMBO_PHY_LANE	524305
+#define SRST_USBDP_COMBO_PHY_PCS	524306
+#define SRST_M_MIPI_DCPHY		524307
+#define SRST_S_MIPI_DCPHY		524308
+#define SRST_SCAN_CSIPHY		524309
+#define SRST_P_VCCIO6_IOC		524310
+#define SRST_OTGPHY_0			524311
+#define SRST_OTGPHY_1			524312
+#define SRST_HDPTX_INIT			524313
+#define SRST_HDPTX_CMN			524314
+#define SRST_HDPTX_LANE			524315
+#define SRST_HDMITXHPD			524317
+/********Name=PMU1SOFTRST_CON02,Offset=0x20A08********/
+#define SRST_MPHY_INIT			524320
+#define SRST_P_MPHY_GRF			524321
+#define SRST_P_VCCIO7_IOC		524323
+/********Name=PMU1SOFTRST_CON03,Offset=0x20A0C********/
+#define SRST_H_PMU1_BIU			524345
+#define SRST_P_PMU1_NIU			524346
+#define SRST_H_PMU_CM0_BIU		524347
+#define SRST_PMU_CM0_CORE		524348
+#define SRST_PMU_CM0_JTAG		524349
+/********Name=PMU1SOFTRST_CON04,Offset=0x20A10********/
+#define SRST_P_CRU_PMU1			524353
+#define SRST_P_PMU1_GRF			524355
+#define SRST_P_PMU1_IOC			524356
+#define SRST_P_PMU1WDT			524357
+#define SRST_T_PMU1WDT			524358
+#define SRST_P_PMUTIMER			524359
+#define SRST_PMUTIMER0			524361
+#define SRST_PMUTIMER1			524362
+#define SRST_P_PMU1PWM			524363
+#define SRST_PMU1PWM			524364
+/********Name=PMU1SOFTRST_CON05,Offset=0x20A14********/
+#define SRST_P_I2C0			524369
+#define SRST_I2C0			524371
+#define SRST_S_UART1			525373
+#define SRST_P_UART1			525374
+#define SRST_PDM0			524381
+#define SRST_H_PDM0			524383
+/********Name=PMU1SOFTRST_CON06,Offset=0xA18********/
+#define SRST_M_PDM0			524384
+#define SRST_H_VAD			524385
+/********Name=PMU1SOFTRST_CON07,Offset=0x20A1C********/
+#define SRST_P_PMU0GRF			524404
+#define SRST_P_PMU0IOC			524405
+#define SRST_P_GPIO0			524406
+#define SRST_DB_GPIO0			524407
+
+#define SRST_NR_RSTS			(SRST_DB_GPIO0 + 1)
+#endif
-- 
2.46.0


