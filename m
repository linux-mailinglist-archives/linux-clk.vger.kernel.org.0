Return-Path: <linux-clk+bounces-12582-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337398B2F3
	for <lists+linux-clk@lfdr.de>; Tue,  1 Oct 2024 06:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D3A91F23CF6
	for <lists+linux-clk@lfdr.de>; Tue,  1 Oct 2024 04:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B321B533B;
	Tue,  1 Oct 2024 04:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Symtdxai"
X-Original-To: linux-clk@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2205F1B5326;
	Tue,  1 Oct 2024 04:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727756743; cv=none; b=XMstfMDds0AHQ+LOIyDdCNKn+TglRsD9CeOFywtNSQ7OSSnsSSNfElYKyhSaX52R5v1noI7jvLBMZcjGLiO5RbInjEGM4hN571IKSpLasVgsOp/kIPDuc82CTIoWl8HnQG/Iy5qeqB57GHmakdINtF/nzIj2KfmAinZyoZPOquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727756743; c=relaxed/simple;
	bh=HWD6B2FwS6vV97o62BmUuy3CASxt4hNCIMzcSVrNeBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tC7TApQX875CoFoHoAqf9vyWpif5hfyl/X+eVxM16PiRT7FTn2H9zxitnxgcmMyUUGrgXgx3hMvaIqqL6+FEMescUCRxFPbUYF5DKm+f+tDs2GTDCJon3Jh8j6ffYig0wV8l5YqFjX6YK07AjbAlcryadefbcVD0y6pxb3DRkqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Symtdxai; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5A13C23D82;
	Tue,  1 Oct 2024 06:25:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmpSJTWIq1dL; Tue,  1 Oct 2024 06:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1727756738; bh=HWD6B2FwS6vV97o62BmUuy3CASxt4hNCIMzcSVrNeBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Symtdxaic0ugR+2AokFbZtqu3vJ1Fp8EnPtfGIJDBIu5nJIeHQZzcCeLpDoTnzaMl
	 ORZkczOoFh9LR2nsMe6tMfNOW3h3UVuRKMcO+m8b5IjqQmN0HVok3Ei41yyrWIGwEt
	 twnU5GCQuiN1ZF1ahyBfupYQb3e2oDcGAxxjJrqDKWNddE3iYFwcpH0u0NBTseQ5I+
	 1k2c2oQdvF6qsVvIVIi89yJ3l9UlqHYu8u5ec6Vt7KtOP0UjjGs6pVIHzsZwY7amMJ
	 NLjuV8dxWQ90lT2qs3+y12+gxTYaksPxWWODsslIt/VX/gZTsgLZWFvh2lQ0mGWJS9
	 1wcj8alxpZ+Ig==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Celeste Liu <CoelacanthusHex@gmail.com>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 1/8] dt-bindings: clock: Add clock ID definition for Rockchip RK3528
Date: Tue,  1 Oct 2024 04:23:55 +0000
Message-ID: <20241001042401.31903-3-ziyao@disroot.org>
In-Reply-To: <20241001042401.31903-2-ziyao@disroot.org>
References: <20241001042401.31903-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two types of clocks in RK3528 SoC, CRU-managed and
SCMI-managed. They are assigned independent clock IDs.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
 1 file changed, 453 insertions(+)
 create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h

diff --git a/include/dt-bindings/clock/rockchip,rk3528-cru.h b/include/dt-bindings/clock/rockchip,rk3528-cru.h
new file mode 100644
index 000000000000..c90b25f57973
--- /dev/null
+++ b/include/dt-bindings/clock/rockchip,rk3528-cru.h
@@ -0,0 +1,453 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR MIT) */
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co. Ltd.
+ * Copyright (c) 2024 Yao Zi <ziyao@disroot.org>
+ * Author: Joseph Chen <chenjh@rock-chips.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3528_H
+#define _DT_BINDINGS_CLK_ROCKCHIP_RK3528_H
+
+/* cru-clocks indices */
+#define PLL_APLL                       1
+#define PLL_CPLL                       2
+#define PLL_GPLL                       3
+#define PLL_PPLL                       4
+#define PLL_DPLL                       5
+#define ARMCLK                         6
+#define XIN_OSC0_HALF                  8
+#define CLK_MATRIX_50M_SRC             9
+#define CLK_MATRIX_100M_SRC            10
+#define CLK_MATRIX_150M_SRC            11
+#define CLK_MATRIX_200M_SRC            12
+#define CLK_MATRIX_250M_SRC            13
+#define CLK_MATRIX_300M_SRC            14
+#define CLK_MATRIX_339M_SRC            15
+#define CLK_MATRIX_400M_SRC            16
+#define CLK_MATRIX_500M_SRC            17
+#define CLK_MATRIX_600M_SRC            18
+#define CLK_UART0_SRC                  19
+#define CLK_UART0_FRAC                 20
+#define SCLK_UART0                     21
+#define CLK_UART1_SRC                  22
+#define CLK_UART1_FRAC                 23
+#define SCLK_UART1                     24
+#define CLK_UART2_SRC                  25
+#define CLK_UART2_FRAC                 26
+#define SCLK_UART2                     27
+#define CLK_UART3_SRC                  28
+#define CLK_UART3_FRAC                 29
+#define SCLK_UART3                     30
+#define CLK_UART4_SRC                  31
+#define CLK_UART4_FRAC                 32
+#define SCLK_UART4                     33
+#define CLK_UART5_SRC                  34
+#define CLK_UART5_FRAC                 35
+#define SCLK_UART5                     36
+#define CLK_UART6_SRC                  37
+#define CLK_UART6_FRAC                 38
+#define SCLK_UART6                     39
+#define CLK_UART7_SRC                  40
+#define CLK_UART7_FRAC                 41
+#define SCLK_UART7                     42
+#define CLK_I2S0_2CH_SRC               43
+#define CLK_I2S0_2CH_FRAC              44
+#define MCLK_I2S0_2CH_SAI_SRC          45
+#define CLK_I2S3_8CH_SRC               46
+#define CLK_I2S3_8CH_FRAC              47
+#define MCLK_I2S3_8CH_SAI_SRC          48
+#define CLK_I2S1_8CH_SRC               49
+#define CLK_I2S1_8CH_FRAC              50
+#define MCLK_I2S1_8CH_SAI_SRC          51
+#define CLK_I2S2_2CH_SRC               52
+#define CLK_I2S2_2CH_FRAC              53
+#define MCLK_I2S2_2CH_SAI_SRC          54
+#define CLK_SPDIF_SRC                  55
+#define CLK_SPDIF_FRAC                 56
+#define MCLK_SPDIF_SRC                 57
+#define DCLK_VOP_SRC0                  58
+#define DCLK_VOP_SRC1                  59
+#define CLK_HSM                        60
+#define CLK_CORE_SRC_ACS               63
+#define CLK_CORE_SRC_PVTMUX            65
+#define CLK_CORE_SRC                   66
+#define CLK_CORE                       67
+#define ACLK_M_CORE_BIU                68
+#define CLK_CORE_PVTPLL_SRC            69
+#define PCLK_DBG                       70
+#define SWCLKTCK                       71
+#define CLK_SCANHS_CORE                72
+#define CLK_SCANHS_ACLKM_CORE          73
+#define CLK_SCANHS_PCLK_DBG            74
+#define CLK_SCANHS_PCLK_CPU_BIU        76
+#define PCLK_CPU_ROOT                  77
+#define PCLK_CORE_GRF                  78
+#define PCLK_DAPLITE_BIU               79
+#define PCLK_CPU_BIU                   80
+#define CLK_REF_PVTPLL_CORE            81
+#define ACLK_BUS_VOPGL_ROOT            85
+#define ACLK_BUS_VOPGL_BIU             86
+#define ACLK_BUS_H_ROOT                87
+#define ACLK_BUS_H_BIU                 88
+#define ACLK_BUS_ROOT                  89
+#define HCLK_BUS_ROOT                  90
+#define PCLK_BUS_ROOT                  91
+#define ACLK_BUS_M_ROOT                92
+#define ACLK_SYSMEM_BIU                93
+#define CLK_TIMER_ROOT                 95
+#define ACLK_BUS_BIU                   96
+#define HCLK_BUS_BIU                   97
+#define PCLK_BUS_BIU                   98
+#define PCLK_DFT2APB                   99
+#define PCLK_BUS_GRF                   100
+#define ACLK_BUS_M_BIU                 101
+#define ACLK_GIC                       102
+#define ACLK_SPINLOCK                  103
+#define ACLK_DMAC                      104
+#define PCLK_TIMER                     105
+#define CLK_TIMER0                     106
+#define CLK_TIMER1                     107
+#define CLK_TIMER2                     108
+#define CLK_TIMER3                     109
+#define CLK_TIMER4                     110
+#define CLK_TIMER5                     111
+#define PCLK_JDBCK_DAP                 112
+#define CLK_JDBCK_DAP                  113
+#define PCLK_WDT_NS                    114
+#define TCLK_WDT_NS                    115
+#define HCLK_TRNG_NS                   116
+#define PCLK_UART0                     117
+#define PCLK_DMA2DDR                   123
+#define ACLK_DMA2DDR                   124
+#define PCLK_PWM0                      126
+#define CLK_PWM0                       127
+#define CLK_CAPTURE_PWM0               128
+#define PCLK_PWM1                      129
+#define CLK_PWM1                       130
+#define CLK_CAPTURE_PWM1               131
+#define PCLK_SCR                       134
+#define ACLK_DCF                       135
+#define PCLK_INTMUX                    138
+#define CLK_PPLL_I                     141
+#define CLK_PPLL_MUX                   142
+#define CLK_PPLL_100M_MATRIX           143
+#define CLK_PPLL_50M_MATRIX            144
+#define CLK_REF_PCIE_INNER_PHY         145
+#define CLK_REF_PCIE_100M_PHY          146
+#define ACLK_VPU_L_ROOT                147
+#define CLK_GMAC1_VPU_25M              148
+#define CLK_PPLL_125M_MATRIX           149
+#define ACLK_VPU_ROOT                  150
+#define HCLK_VPU_ROOT                  151
+#define PCLK_VPU_ROOT                  152
+#define ACLK_VPU_BIU                   153
+#define HCLK_VPU_BIU                   154
+#define PCLK_VPU_BIU                   155
+#define ACLK_VPU                       156
+#define HCLK_VPU                       157
+#define PCLK_CRU_PCIE                  158
+#define PCLK_VPU_GRF                   159
+#define HCLK_SFC                       160
+#define SCLK_SFC                       161
+#define CCLK_SRC_EMMC                  163
+#define HCLK_EMMC                      164
+#define ACLK_EMMC                      165
+#define BCLK_EMMC                      166
+#define TCLK_EMMC                      167
+#define PCLK_GPIO1                     168
+#define DBCLK_GPIO1                    169
+#define ACLK_VPU_L_BIU                 172
+#define PCLK_VPU_IOC                   173
+#define HCLK_SAI_I2S0                  174
+#define MCLK_SAI_I2S0                  175
+#define HCLK_SAI_I2S2                  176
+#define MCLK_SAI_I2S2                  177
+#define PCLK_ACODEC                    178
+#define MCLK_ACODEC_TX                 179
+#define PCLK_GPIO3                     186
+#define DBCLK_GPIO3                    187
+#define PCLK_SPI1                      189
+#define CLK_SPI1                       190
+#define SCLK_IN_SPI1                   191
+#define PCLK_UART2                     192
+#define PCLK_UART5                     194
+#define PCLK_UART6                     196
+#define PCLK_UART7                     198
+#define PCLK_I2C3                      200
+#define CLK_I2C3                       201
+#define PCLK_I2C5                      202
+#define CLK_I2C5                       203
+#define PCLK_I2C6                      204
+#define CLK_I2C6                       205
+#define ACLK_MAC_VPU                   206
+#define PCLK_MAC_VPU                   207
+#define CLK_GMAC1_RMII_VPU             209
+#define CLK_GMAC1_SRC_VPU              210
+#define PCLK_PCIE                      215
+#define CLK_PCIE_AUX                   216
+#define ACLK_PCIE                      217
+#define HCLK_PCIE_SLV                  218
+#define HCLK_PCIE_DBI                  219
+#define PCLK_PCIE_PHY                  220
+#define PCLK_PIPE_GRF                  221
+#define CLK_PIPE_USB3OTG_COMBO         230
+#define CLK_UTMI_USB3OTG               232
+#define CLK_PCIE_PIPE_PHY              235
+#define CCLK_SRC_SDIO0                 240
+#define HCLK_SDIO0                     241
+#define CCLK_SRC_SDIO1                 244
+#define HCLK_SDIO1                     245
+#define CLK_TS_0                       246
+#define CLK_TS_1                       247
+#define PCLK_CAN2                      250
+#define CLK_CAN2                       251
+#define PCLK_CAN3                      252
+#define CLK_CAN3                       253
+#define PCLK_SARADC                    256
+#define CLK_SARADC                     257
+#define PCLK_TSADC                     258
+#define CLK_TSADC                      259
+#define CLK_TSADC_TSEN                 260
+#define ACLK_USB3OTG                   261
+#define CLK_REF_USB3OTG                262
+#define CLK_SUSPEND_USB3OTG            263
+#define ACLK_GPU_ROOT                  269
+#define PCLK_GPU_ROOT                  270
+#define ACLK_GPU_BIU                   271
+#define PCLK_GPU_BIU                   272
+#define ACLK_GPU                       273
+#define CLK_GPU_PVTPLL_SRC             274
+#define ACLK_GPU_MALI                  275
+#define HCLK_RKVENC_ROOT               281
+#define ACLK_RKVENC_ROOT               282
+#define PCLK_RKVENC_ROOT               283
+#define HCLK_RKVENC_BIU                284
+#define ACLK_RKVENC_BIU                285
+#define PCLK_RKVENC_BIU                286
+#define HCLK_RKVENC                    287
+#define ACLK_RKVENC                    288
+#define CLK_CORE_RKVENC                289
+#define HCLK_SAI_I2S1                  290
+#define MCLK_SAI_I2S1                  291
+#define PCLK_I2C1                      292
+#define CLK_I2C1                       293
+#define PCLK_I2C0                      294
+#define CLK_I2C0                       295
+#define CLK_UART_JTAG                  296
+#define PCLK_SPI0                      297
+#define CLK_SPI0                       298
+#define SCLK_IN_SPI0                   299
+#define PCLK_GPIO4                     300
+#define DBCLK_GPIO4                    301
+#define PCLK_RKVENC_IOC                302
+#define HCLK_SPDIF                     308
+#define MCLK_SPDIF                     309
+#define HCLK_PDM                       310
+#define MCLK_PDM                       311
+#define PCLK_UART1                     315
+#define PCLK_UART3                     317
+#define PCLK_RKVENC_GRF                319
+#define PCLK_CAN0                      320
+#define CLK_CAN0                       321
+#define PCLK_CAN1                      322
+#define CLK_CAN1                       323
+#define ACLK_VO_ROOT                   324
+#define HCLK_VO_ROOT                   325
+#define PCLK_VO_ROOT                   326
+#define ACLK_VO_BIU                    327
+#define HCLK_VO_BIU                    328
+#define PCLK_VO_BIU                    329
+#define HCLK_RGA2E                     330
+#define ACLK_RGA2E                     331
+#define CLK_CORE_RGA2E                 332
+#define HCLK_VDPP                      333
+#define ACLK_VDPP                      334
+#define CLK_CORE_VDPP                  335
+#define PCLK_VO_GRF                    336
+#define PCLK_CRU                       337
+#define ACLK_VOP_ROOT                  338
+#define ACLK_VOP_BIU                   339
+#define HCLK_VOP                       340
+#define DCLK_VOP0                      341
+#define DCLK_VOP1                      342
+#define ACLK_VOP                       343
+#define PCLK_HDMI                      344
+#define CLK_SFR_HDMI                   345
+#define CLK_CEC_HDMI                   346
+#define CLK_SPDIF_HDMI                 347
+#define CLK_HDMIPHY_TMDSSRC            348
+#define CLK_HDMIPHY_PREP               349
+#define PCLK_HDMIPHY                   352
+#define HCLK_HDCP_KEY                  354
+#define ACLK_HDCP                      355
+#define HCLK_HDCP                      356
+#define PCLK_HDCP                      357
+#define HCLK_CVBS                      358
+#define DCLK_CVBS                      359
+#define DCLK_4X_CVBS                   360
+#define ACLK_JPEG_DECODER              361
+#define HCLK_JPEG_DECODER              362
+#define ACLK_VO_L_ROOT                 375
+#define ACLK_VO_L_BIU                  376
+#define ACLK_MAC_VO                    377
+#define PCLK_MAC_VO                    378
+#define CLK_GMAC0_SRC                  379
+#define CLK_GMAC0_RMII_50M             380
+#define CLK_GMAC0_TX                   381
+#define CLK_GMAC0_RX                   382
+#define ACLK_JPEG_ROOT                 385
+#define ACLK_JPEG_BIU                  386
+#define HCLK_SAI_I2S3                  387
+#define MCLK_SAI_I2S3                  388
+#define CLK_MACPHY                     398
+#define PCLK_VCDCPHY                   399
+#define PCLK_GPIO2                     404
+#define DBCLK_GPIO2                    405
+#define PCLK_VO_IOC                    406
+#define CCLK_SRC_SDMMC0                407
+#define HCLK_SDMMC0                    408
+#define PCLK_OTPC_NS                   411
+#define CLK_SBPI_OTPC_NS               412
+#define CLK_USER_OTPC_NS               413
+#define CLK_HDMIHDP0                   415
+#define HCLK_USBHOST                   416
+#define HCLK_USBHOST_ARB               417
+#define CLK_USBHOST_OHCI               418
+#define CLK_USBHOST_UTMI               419
+#define PCLK_UART4                     420
+#define PCLK_I2C4                      422
+#define CLK_I2C4                       423
+#define PCLK_I2C7                      424
+#define CLK_I2C7                       425
+#define PCLK_USBPHY                    426
+#define CLK_REF_USBPHY                 427
+#define HCLK_RKVDEC_ROOT               433
+#define ACLK_RKVDEC_ROOT_NDFT          434
+#define PCLK_DDRPHY_CRU                435
+#define HCLK_RKVDEC_BIU                436
+#define ACLK_RKVDEC_BIU                437
+#define ACLK_RKVDEC                    439
+#define HCLK_RKVDEC                    440
+#define CLK_HEVC_CA_RKVDEC             441
+#define ACLK_RKVDEC_PVTMUX_ROOT        442
+#define CLK_RKVDEC_PVTPLL_SRC          443
+#define PCLK_DDR_ROOT                  449
+#define PCLK_DDR_BIU                   450
+#define PCLK_DDRC                      451
+#define PCLK_DDRMON                    452
+#define CLK_TIMER_DDRMON               453
+#define PCLK_MSCH_BIU                  454
+#define PCLK_DDR_GRF                   455
+#define PCLK_DDR_HWLP                  456
+#define PCLK_DDRPHY                    457
+#define CLK_MSCH_BIU                   463
+#define ACLK_DDR_UPCTL                 464
+#define CLK_DDR_UPCTL                  465
+#define CLK_DDRMON                     466
+#define ACLK_DDR_SCRAMBLE              467
+#define ACLK_SPLIT                     468
+#define CLK_DDRC_SRC                   470
+#define CLK_DDR_PHY                    471
+#define PCLK_OTPC_S                    472
+#define CLK_SBPI_OTPC_S                473
+#define CLK_USER_OTPC_S                474
+#define PCLK_KEYREADER                 475
+#define PCLK_BUS_SGRF                  476
+#define PCLK_STIMER                    477
+#define CLK_STIMER0                    478
+#define CLK_STIMER1                    479
+#define PCLK_WDT_S                     480
+#define TCLK_WDT_S                     481
+#define HCLK_TRNG_S                    482
+#define HCLK_BOOTROM                   486
+#define PCLK_DCF                       487
+#define ACLK_SYSMEM                    488
+#define HCLK_TSP                       489
+#define ACLK_TSP                       490
+#define CLK_CORE_TSP                   491
+#define CLK_OTPC_ARB                   492
+#define PCLK_OTP_MASK                  493
+#define CLK_PMC_OTP                    494
+#define PCLK_PMU_ROOT                  495
+#define HCLK_PMU_ROOT                  496
+#define PCLK_I2C2                      497
+#define CLK_I2C2                       498
+#define HCLK_PMU_BIU                   500
+#define PCLK_PMU_BIU                   501
+#define FCLK_MCU                       502
+#define RTC_CLK_MCU                    504
+#define PCLK_OSCCHK                    505
+#define CLK_PMU_MCU_JTAG               506
+#define PCLK_PMU                       508
+#define PCLK_GPIO0                     509
+#define DBCLK_GPIO0                    510
+#define XIN_OSC0_DIV                   511
+#define CLK_DEEPSLOW                   512
+#define CLK_DDR_FAIL_SAFE              513
+#define PCLK_PMU_HP_TIMER              514
+#define CLK_PMU_HP_TIMER               515
+#define CLK_PMU_32K_HP_TIMER           516
+#define PCLK_PMU_IOC                   517
+#define PCLK_PMU_CRU                   518
+#define PCLK_PMU_GRF                   519
+#define PCLK_PMU_WDT                   520
+#define TCLK_PMU_WDT                   521
+#define PCLK_PMU_MAILBOX               522
+#define PCLK_SCRKEYGEN                 524
+#define CLK_SCRKEYGEN                  525
+#define CLK_PVTM_OSCCHK                526
+#define CLK_REFOUT                     530
+#define CLK_PVTM_PMU                   532
+#define PCLK_PVTM_PMU                  533
+#define PCLK_PMU_SGRF                  534
+#define HCLK_PMU_SRAM                  535
+#define CLK_UART0                      536
+#define CLK_UART1                      537
+#define CLK_UART2                      538
+#define CLK_UART3                      539
+#define CLK_UART4                      540
+#define CLK_UART5                      541
+#define CLK_UART6                      542
+#define CLK_UART7                      543
+#define MCLK_I2S0_2CH_SAI_SRC_PRE      544
+#define MCLK_I2S1_8CH_SAI_SRC_PRE      545
+#define MCLK_I2S2_2CH_SAI_SRC_PRE      546
+#define MCLK_I2S3_8CH_SAI_SRC_PRE      547
+#define MCLK_SDPDIF_SRC_PRE            548
+
+/* scmi-clocks indices */
+#define SCMI_PCLK_KEYREADER            0
+#define SCMI_HCLK_KLAD                 1
+#define SCMI_PCLK_KLAD                 2
+#define SCMI_HCLK_TRNG_S               3
+#define SCMI_HCLK_CRYPTO_S             4
+#define SCMI_PCLK_WDT_S                5
+#define SCMI_TCLK_WDT_S                6
+#define SCMI_PCLK_STIMER               7
+#define SCMI_CLK_STIMER0               8
+#define SCMI_CLK_STIMER1               9
+#define SCMI_PCLK_OTP_MASK             10
+#define SCMI_PCLK_OTPC_S               11
+#define SCMI_CLK_SBPI_OTPC_S           12
+#define SCMI_CLK_USER_OTPC_S           13
+#define SCMI_CLK_PMC_OTP               14
+#define SCMI_CLK_OTPC_ARB              15
+#define SCMI_CLK_CORE_TSP              16
+#define SCMI_ACLK_TSP                  17
+#define SCMI_HCLK_TSP                  18
+#define SCMI_PCLK_DCF                  19
+#define SCMI_CLK_DDR                   20
+#define SCMI_CLK_CPU                   21
+#define SCMI_CLK_GPU                   22
+#define SCMI_CORE_CRYPTO               23
+#define SCMI_ACLK_CRYPTO               24
+#define SCMI_PKA_CRYPTO                25
+#define SCMI_HCLK_CRYPTO               26
+#define SCMI_CORE_CRYPTO_S             27
+#define SCMI_ACLK_CRYPTO_S             28
+#define SCMI_PKA_CRYPTO_S              29
+#define SCMI_CORE_KLAD                 30
+#define SCMI_ACLK_KLAD                 31
+#define SCMI_HCLK_TRNG                 32
+
+#endif // _DT_BINDINGS_CLK_ROCKCHIP_RK3528_H
-- 
2.46.0


