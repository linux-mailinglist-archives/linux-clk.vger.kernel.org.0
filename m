Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A23265F0F0B
	for <lists+linux-clk@lfdr.de>; Fri, 30 Sep 2022 17:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbiI3PjH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 30 Sep 2022 11:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbiI3PjF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 11:39:05 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED68157FC4;
        Fri, 30 Sep 2022 08:39:03 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-096-057-200.ewe-ip-backbone.de [91.96.57.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 850B266022E8;
        Fri, 30 Sep 2022 16:39:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1664552341;
        bh=UGM5qXIRDohg3SXNEESE+H9zBtfRDpzLVSqauU5ZdqY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MMSt4brfMlIaG5Wt/Qs68aaAuvOowmRURIRpHZLB0pBXKWq2Kh2R2yVGshZUHQmjg
         vRvxpqqmhDRMXNwtZgIfCWQJvNCwxG+kvJvQI2yvxWLhU329Ue/SUwHRI9gI9oErfF
         M8elbarOfsC1y7kKZAO4O0mOBW165qTDiMzCW9piS7QhFq/T6FBdKuPBeIOAyTxdx3
         rZjv7SaeEtyBnPXNGal7Hj3cL39n0JgQl0eMZupksjrsEl1PX0w9oWigG3hxUAEIjk
         NeJGqCEDDSqAmEEEDViQ7xNjE8C3LncPEqREn568VgE4rqs8B5v9nMsw/ODQiVoKED
         UP9f6F1Ff2Pmg==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 030F2480143; Fri, 30 Sep 2022 17:38:59 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com, Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCHv2 1/9] dt-bindings: clock: add rk3588 clock definitions
Date:   Fri, 30 Sep 2022 17:38:49 +0200
Message-Id: <20220930153857.299396-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930153857.299396-1-sebastian.reichel@collabora.com>
References: <20220930153857.299396-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock ID defines for rk3588.

Compared to the downstream bindings written by Elaine, this uses
continous gapless clock IDs starting at 0. Thus all numbers are
different between downstream and upstream, but I kept exactly the
same names.

Co-Developed-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../dt-bindings/clock/rockchip,rk3588-cru.h   | 766 ++++++++++++++++++
 1 file changed, 766 insertions(+)
 create mode 100644 include/dt-bindings/clock/rockchip,rk3588-cru.h

diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/include/dt-bindings/clock/rockchip,rk3588-cru.h
new file mode 100644
index 000000000000..b5616bca7b44
--- /dev/null
+++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
@@ -0,0 +1,766 @@
+/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
+/*
+ * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
+ * Copyright (c) 2022 Collabora Ltd.
+ *
+ * Author: Elaine Zhang <zhangqing@rock-chips.com>
+ * Author: Sebastian Reichel <sebastian.reichel@collabora.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3588_H
+#define _DT_BINDINGS_CLK_ROCKCHIP_RK3588_H
+
+/* cru-clocks indices */
+
+#define PLL_B0PLL			0
+#define PLL_B1PLL			1
+#define PLL_LPLL			2
+#define PLL_V0PLL			3
+#define PLL_AUPLL			4
+#define PLL_CPLL			5
+#define PLL_GPLL			6
+#define PLL_NPLL			7
+#define PLL_PPLL			8
+#define ARMCLK_L			9
+#define ARMCLK_B01			10
+#define ARMCLK_B23			11
+#define PCLK_BIGCORE0_ROOT		12
+#define PCLK_BIGCORE0_PVTM		13
+#define PCLK_BIGCORE1_ROOT		14
+#define PCLK_BIGCORE1_PVTM		15
+#define PCLK_DSU_S_ROOT			16
+#define PCLK_DSU_ROOT			17
+#define PCLK_DSU_NS_ROOT		18
+#define PCLK_LITCORE_PVTM		19
+#define PCLK_DBG			20
+#define PCLK_DSU			21
+#define PCLK_S_DAPLITE			22
+#define PCLK_M_DAPLITE			23
+#define MBIST_MCLK_PDM1			24
+#define MBIST_CLK_ACDCDIG		25
+#define HCLK_I2S2_2CH			26
+#define HCLK_I2S3_2CH			27
+#define CLK_I2S2_2CH_SRC		28
+#define CLK_I2S2_2CH_FRAC		29
+#define CLK_I2S2_2CH			30
+#define MCLK_I2S2_2CH			31
+#define I2S2_2CH_MCLKOUT		32
+#define CLK_DAC_ACDCDIG			33
+#define CLK_I2S3_2CH_SRC		34
+#define CLK_I2S3_2CH_FRAC		35
+#define CLK_I2S3_2CH			36
+#define MCLK_I2S3_2CH			37
+#define I2S3_2CH_MCLKOUT		38
+#define PCLK_ACDCDIG			39
+#define HCLK_I2S0_8CH			40
+#define CLK_I2S0_8CH_TX_SRC		41
+#define CLK_I2S0_8CH_TX_FRAC		42
+#define MCLK_I2S0_8CH_TX		43
+#define CLK_I2S0_8CH_TX			44
+#define CLK_I2S0_8CH_RX_SRC		45
+#define CLK_I2S0_8CH_RX_FRAC		46
+#define MCLK_I2S0_8CH_RX		47
+#define CLK_I2S0_8CH_RX			48
+#define I2S0_8CH_MCLKOUT		49
+#define HCLK_PDM1			50
+#define MCLK_PDM1			51
+#define HCLK_AUDIO_ROOT			52
+#define PCLK_AUDIO_ROOT			53
+#define HCLK_SPDIF0			54
+#define CLK_SPDIF0_SRC			55
+#define CLK_SPDIF0_FRAC			56
+#define MCLK_SPDIF0			57
+#define CLK_SPDIF0			58
+#define CLK_SPDIF1			59
+#define HCLK_SPDIF1			60
+#define CLK_SPDIF1_SRC			61
+#define CLK_SPDIF1_FRAC			62
+#define MCLK_SPDIF1			63
+#define ACLK_AV1_ROOT			64
+#define ACLK_AV1			65
+#define PCLK_AV1_ROOT			66
+#define PCLK_AV1			67
+#define PCLK_MAILBOX0			68
+#define PCLK_MAILBOX1			69
+#define PCLK_MAILBOX2			70
+#define PCLK_PMU2			71
+#define PCLK_PMUCM0_INTMUX		72
+#define PCLK_DDRCM0_INTMUX		73
+#define PCLK_TOP			74
+#define PCLK_PWM1			75
+#define CLK_PWM1			76
+#define CLK_PWM1_CAPTURE		77
+#define PCLK_PWM2			78
+#define CLK_PWM2			79
+#define CLK_PWM2_CAPTURE		80
+#define PCLK_PWM3			81
+#define CLK_PWM3			82
+#define CLK_PWM3_CAPTURE		83
+#define PCLK_BUSTIMER0			84
+#define PCLK_BUSTIMER1			85
+#define CLK_BUS_TIMER_ROOT		86
+#define CLK_BUSTIMER0			87
+#define CLK_BUSTIMER1			88
+#define CLK_BUSTIMER2			89
+#define CLK_BUSTIMER3			90
+#define CLK_BUSTIMER4			91
+#define CLK_BUSTIMER5			92
+#define CLK_BUSTIMER6			93
+#define CLK_BUSTIMER7			94
+#define CLK_BUSTIMER8			95
+#define CLK_BUSTIMER9			96
+#define CLK_BUSTIMER10			97
+#define CLK_BUSTIMER11			98
+#define PCLK_WDT0			99
+#define TCLK_WDT0			100
+#define PCLK_CAN0			101
+#define CLK_CAN0			102
+#define PCLK_CAN1			103
+#define CLK_CAN1			104
+#define PCLK_CAN2			105
+#define CLK_CAN2			106
+#define ACLK_DECOM			107
+#define PCLK_DECOM			108
+#define DCLK_DECOM			109
+#define ACLK_DMAC0			110
+#define ACLK_DMAC1			111
+#define ACLK_DMAC2			112
+#define ACLK_BUS_ROOT			113
+#define ACLK_GIC			114
+#define PCLK_GPIO1			115
+#define DBCLK_GPIO1			116
+#define PCLK_GPIO2			117
+#define DBCLK_GPIO2			118
+#define PCLK_GPIO3			119
+#define DBCLK_GPIO3			120
+#define PCLK_GPIO4			121
+#define DBCLK_GPIO4			122
+#define PCLK_I2C1			123
+#define PCLK_I2C2			124
+#define PCLK_I2C3			125
+#define PCLK_I2C4			126
+#define PCLK_I2C5			127
+#define PCLK_I2C6			128
+#define PCLK_I2C7			129
+#define PCLK_I2C8			130
+#define CLK_I2C1			131
+#define CLK_I2C2			132
+#define CLK_I2C3			133
+#define CLK_I2C4			134
+#define CLK_I2C5			135
+#define CLK_I2C6			136
+#define CLK_I2C7			137
+#define CLK_I2C8			138
+#define PCLK_OTPC_NS			139
+#define CLK_OTPC_NS			140
+#define CLK_OTPC_ARB			141
+#define CLK_OTPC_AUTO_RD_G		142
+#define CLK_OTP_PHY_G			143
+#define PCLK_SARADC			144
+#define CLK_SARADC			145
+#define PCLK_SPI0			146
+#define PCLK_SPI1			147
+#define PCLK_SPI2			148
+#define PCLK_SPI3			149
+#define PCLK_SPI4			150
+#define CLK_SPI0			151
+#define CLK_SPI1			152
+#define CLK_SPI2			153
+#define CLK_SPI3			154
+#define CLK_SPI4			155
+#define ACLK_SPINLOCK			156
+#define PCLK_TSADC			157
+#define CLK_TSADC			158
+#define PCLK_UART1			159
+#define PCLK_UART2			160
+#define PCLK_UART3			161
+#define PCLK_UART4			162
+#define PCLK_UART5			163
+#define PCLK_UART6			164
+#define PCLK_UART7			165
+#define PCLK_UART8			166
+#define PCLK_UART9			167
+#define CLK_UART1_SRC			168
+#define CLK_UART1_FRAC			169
+#define CLK_UART1			170
+#define SCLK_UART1			171
+#define CLK_UART2_SRC			172
+#define CLK_UART2_FRAC			173
+#define CLK_UART2			174
+#define SCLK_UART2			175
+#define CLK_UART3_SRC			176
+#define CLK_UART3_FRAC			177
+#define CLK_UART3			178
+#define SCLK_UART3			179
+#define CLK_UART4_SRC			180
+#define CLK_UART4_FRAC			181
+#define CLK_UART4			182
+#define SCLK_UART4			183
+#define CLK_UART5_SRC			184
+#define CLK_UART5_FRAC			185
+#define CLK_UART5			186
+#define SCLK_UART5			187
+#define CLK_UART6_SRC			188
+#define CLK_UART6_FRAC			189
+#define CLK_UART6			190
+#define SCLK_UART6			191
+#define CLK_UART7_SRC			192
+#define CLK_UART7_FRAC			193
+#define CLK_UART7			194
+#define SCLK_UART7			195
+#define CLK_UART8_SRC			196
+#define CLK_UART8_FRAC			197
+#define CLK_UART8			198
+#define SCLK_UART8			199
+#define CLK_UART9_SRC			200
+#define CLK_UART9_FRAC			201
+#define CLK_UART9			202
+#define SCLK_UART9			203
+#define ACLK_CENTER_ROOT		204
+#define ACLK_CENTER_LOW_ROOT		205
+#define HCLK_CENTER_ROOT		206
+#define PCLK_CENTER_ROOT		207
+#define ACLK_DMA2DDR			208
+#define ACLK_DDR_SHAREMEM		209
+#define ACLK_CENTER_S200_ROOT		210
+#define ACLK_CENTER_S400_ROOT		211
+#define FCLK_DDR_CM0_CORE		212
+#define CLK_DDR_TIMER_ROOT		213
+#define CLK_DDR_TIMER0			214
+#define CLK_DDR_TIMER1			215
+#define TCLK_WDT_DDR			216
+#define CLK_DDR_CM0_RTC			217
+#define PCLK_WDT			218
+#define PCLK_TIMER			219
+#define PCLK_DMA2DDR			220
+#define PCLK_SHAREMEM			221
+#define CLK_50M_SRC			222
+#define CLK_100M_SRC			223
+#define CLK_150M_SRC			224
+#define CLK_200M_SRC			225
+#define CLK_250M_SRC			226
+#define CLK_300M_SRC			227
+#define CLK_350M_SRC			228
+#define CLK_400M_SRC			229
+#define CLK_450M_SRC			230
+#define CLK_500M_SRC			231
+#define CLK_600M_SRC			232
+#define CLK_650M_SRC			233
+#define CLK_700M_SRC			234
+#define CLK_800M_SRC			235
+#define CLK_1000M_SRC			236
+#define CLK_1200M_SRC			237
+#define ACLK_TOP_M300_ROOT		238
+#define ACLK_TOP_M500_ROOT		239
+#define ACLK_TOP_M400_ROOT		240
+#define ACLK_TOP_S200_ROOT		241
+#define ACLK_TOP_S400_ROOT		242
+#define CLK_MIPI_CAMARAOUT_M0		243
+#define CLK_MIPI_CAMARAOUT_M1		244
+#define CLK_MIPI_CAMARAOUT_M2		245
+#define CLK_MIPI_CAMARAOUT_M3		246
+#define CLK_MIPI_CAMARAOUT_M4		247
+#define MCLK_GMAC0_OUT			248
+#define REFCLKO25M_ETH0_OUT		249
+#define REFCLKO25M_ETH1_OUT		250
+#define CLK_CIFOUT_OUT			251
+#define PCLK_MIPI_DCPHY0		252
+#define PCLK_MIPI_DCPHY1		253
+#define PCLK_CSIPHY0			254
+#define PCLK_CSIPHY1			255
+#define ACLK_TOP_ROOT			256
+#define PCLK_TOP_ROOT			257
+#define ACLK_LOW_TOP_ROOT		258
+#define PCLK_CRU			259
+#define PCLK_GPU_ROOT			260
+#define CLK_GPU_SRC			261
+#define CLK_GPU				262
+#define CLK_GPU_COREGROUP		263
+#define CLK_GPU_STACKS			264
+#define PCLK_GPU_PVTM			265
+#define CLK_GPU_PVTM			266
+#define CLK_CORE_GPU_PVTM		267
+#define PCLK_GPU_GRF			268
+#define ACLK_ISP1_ROOT			269
+#define HCLK_ISP1_ROOT			270
+#define CLK_ISP1_CORE			271
+#define CLK_ISP1_CORE_MARVIN		272
+#define CLK_ISP1_CORE_VICAP		273
+#define ACLK_ISP1			274
+#define HCLK_ISP1			275
+#define ACLK_NPU1			276
+#define HCLK_NPU1			277
+#define ACLK_NPU2			278
+#define HCLK_NPU2			279
+#define HCLK_NPU_CM0_ROOT		280
+#define FCLK_NPU_CM0_CORE		281
+#define CLK_NPU_CM0_RTC			282
+#define PCLK_NPU_PVTM			283
+#define PCLK_NPU_GRF			284
+#define CLK_NPU_PVTM			285
+#define CLK_CORE_NPU_PVTM		286
+#define ACLK_NPU0			287
+#define HCLK_NPU0			288
+#define HCLK_NPU_ROOT			289
+#define CLK_NPU_DSU0			290
+#define PCLK_NPU_ROOT			291
+#define PCLK_NPU_TIMER			292
+#define CLK_NPUTIMER_ROOT		293
+#define CLK_NPUTIMER0			294
+#define CLK_NPUTIMER1			295
+#define PCLK_NPU_WDT			296
+#define TCLK_NPU_WDT			297
+#define HCLK_EMMC			298
+#define ACLK_EMMC			299
+#define CCLK_EMMC			300
+#define BCLK_EMMC			301
+#define TMCLK_EMMC			302
+#define SCLK_SFC			303
+#define HCLK_SFC			304
+#define HCLK_SFC_XIP			305
+#define HCLK_NVM_ROOT			306
+#define ACLK_NVM_ROOT			307
+#define CLK_GMAC0_PTP_REF		308
+#define CLK_GMAC1_PTP_REF		309
+#define CLK_GMAC_125M			310
+#define CLK_GMAC_50M			311
+#define ACLK_PHP_GIC_ITS		312
+#define ACLK_MMU_PCIE			313
+#define ACLK_MMU_PHP			314
+#define ACLK_PCIE_4L_DBI		315
+#define ACLK_PCIE_2L_DBI		316
+#define ACLK_PCIE_1L0_DBI		317
+#define ACLK_PCIE_1L1_DBI		318
+#define ACLK_PCIE_1L2_DBI		319
+#define ACLK_PCIE_4L_MSTR		320
+#define ACLK_PCIE_2L_MSTR		321
+#define ACLK_PCIE_1L0_MSTR		322
+#define ACLK_PCIE_1L1_MSTR		323
+#define ACLK_PCIE_1L2_MSTR		324
+#define ACLK_PCIE_4L_SLV		325
+#define ACLK_PCIE_2L_SLV		326
+#define ACLK_PCIE_1L0_SLV		327
+#define ACLK_PCIE_1L1_SLV		328
+#define ACLK_PCIE_1L2_SLV		329
+#define PCLK_PCIE_4L			330
+#define PCLK_PCIE_2L			331
+#define PCLK_PCIE_1L0			332
+#define PCLK_PCIE_1L1			333
+#define PCLK_PCIE_1L2			334
+#define CLK_PCIE_AUX0			335
+#define CLK_PCIE_AUX1			336
+#define CLK_PCIE_AUX2			337
+#define CLK_PCIE_AUX3			338
+#define CLK_PCIE_AUX4			339
+#define CLK_PIPEPHY0_REF		340
+#define CLK_PIPEPHY1_REF		341
+#define CLK_PIPEPHY2_REF		342
+#define PCLK_PHP_ROOT			343
+#define PCLK_GMAC0			344
+#define PCLK_GMAC1			345
+#define ACLK_PCIE_ROOT			346
+#define ACLK_PHP_ROOT			347
+#define ACLK_PCIE_BRIDGE		348
+#define ACLK_GMAC0			349
+#define ACLK_GMAC1			350
+#define CLK_PMALIVE0			351
+#define CLK_PMALIVE1			352
+#define CLK_PMALIVE2			353
+#define ACLK_SATA0			354
+#define ACLK_SATA1			355
+#define ACLK_SATA2			356
+#define CLK_RXOOB0			357
+#define CLK_RXOOB1			358
+#define CLK_RXOOB2			359
+#define ACLK_USB3OTG2			360
+#define SUSPEND_CLK_USB3OTG2		361
+#define REF_CLK_USB3OTG2		362
+#define CLK_UTMI_OTG2			363
+#define CLK_PIPEPHY0_PIPE_G		364
+#define CLK_PIPEPHY1_PIPE_G		365
+#define CLK_PIPEPHY2_PIPE_G		366
+#define CLK_PIPEPHY0_PIPE_ASIC_G	367
+#define CLK_PIPEPHY1_PIPE_ASIC_G	368
+#define CLK_PIPEPHY2_PIPE_ASIC_G	369
+#define CLK_PIPEPHY2_PIPE_U3_G		370
+#define CLK_PCIE1L2_PIPE		371
+#define CLK_PCIE4L_PIPE			372
+#define CLK_PCIE2L_PIPE			373
+#define PCLK_PCIE_COMBO_PIPE_PHY0	374
+#define PCLK_PCIE_COMBO_PIPE_PHY1	375
+#define PCLK_PCIE_COMBO_PIPE_PHY2	376
+#define PCLK_PCIE_COMBO_PIPE_PHY	377
+#define HCLK_RGA3_1			378
+#define ACLK_RGA3_1			379
+#define CLK_RGA3_1_CORE			380
+#define ACLK_RGA3_ROOT			381
+#define HCLK_RGA3_ROOT			382
+#define ACLK_RKVDEC_CCU			383
+#define HCLK_RKVDEC0			384
+#define ACLK_RKVDEC0			385
+#define CLK_RKVDEC0_CA			386
+#define CLK_RKVDEC0_HEVC_CA		387
+#define CLK_RKVDEC0_CORE		388
+#define HCLK_RKVDEC1			389
+#define ACLK_RKVDEC1			390
+#define CLK_RKVDEC1_CA			391
+#define CLK_RKVDEC1_HEVC_CA		392
+#define CLK_RKVDEC1_CORE		393
+#define HCLK_SDIO			394
+#define CCLK_SRC_SDIO			395
+#define ACLK_USB_ROOT			396
+#define HCLK_USB_ROOT			397
+#define HCLK_HOST0			398
+#define HCLK_HOST_ARB0			399
+#define HCLK_HOST1			400
+#define HCLK_HOST_ARB1			401
+#define ACLK_USB3OTG0			402
+#define SUSPEND_CLK_USB3OTG0		403
+#define REF_CLK_USB3OTG0		404
+#define ACLK_USB3OTG1			405
+#define SUSPEND_CLK_USB3OTG1		406
+#define REF_CLK_USB3OTG1		407
+#define UTMI_OHCI_CLK48_HOST0		408
+#define UTMI_OHCI_CLK48_HOST1		409
+#define HCLK_IEP2P0			410
+#define ACLK_IEP2P0			411
+#define CLK_IEP2P0_CORE			412
+#define ACLK_JPEG_ENCODER0		413
+#define HCLK_JPEG_ENCODER0		414
+#define ACLK_JPEG_ENCODER1		415
+#define HCLK_JPEG_ENCODER1		416
+#define ACLK_JPEG_ENCODER2		417
+#define HCLK_JPEG_ENCODER2		418
+#define ACLK_JPEG_ENCODER3		419
+#define HCLK_JPEG_ENCODER3		420
+#define ACLK_JPEG_DECODER		421
+#define HCLK_JPEG_DECODER		422
+#define HCLK_RGA2			423
+#define ACLK_RGA2			424
+#define CLK_RGA2_CORE			425
+#define HCLK_RGA3_0			426
+#define ACLK_RGA3_0			427
+#define CLK_RGA3_0_CORE			428
+#define ACLK_VDPU_ROOT			429
+#define ACLK_VDPU_LOW_ROOT		430
+#define HCLK_VDPU_ROOT			431
+#define ACLK_JPEG_DECODER_ROOT		432
+#define ACLK_VPU			433
+#define HCLK_VPU			434
+#define HCLK_RKVENC0_ROOT		435
+#define ACLK_RKVENC0_ROOT		436
+#define HCLK_RKVENC0			437
+#define ACLK_RKVENC0			438
+#define CLK_RKVENC0_CORE		439
+#define HCLK_RKVENC1_ROOT		440
+#define ACLK_RKVENC1_ROOT		441
+#define HCLK_RKVENC1			442
+#define ACLK_RKVENC1			443
+#define CLK_RKVENC1_CORE		444
+#define ICLK_CSIHOST01			445
+#define ICLK_CSIHOST0			446
+#define ICLK_CSIHOST1			447
+#define PCLK_CSI_HOST_0			448
+#define PCLK_CSI_HOST_1			449
+#define PCLK_CSI_HOST_2			450
+#define PCLK_CSI_HOST_3			451
+#define PCLK_CSI_HOST_4			452
+#define PCLK_CSI_HOST_5			453
+#define ACLK_FISHEYE0			454
+#define HCLK_FISHEYE0			455
+#define CLK_FISHEYE0_CORE		456
+#define ACLK_FISHEYE1			457
+#define HCLK_FISHEYE1			458
+#define CLK_FISHEYE1_CORE		459
+#define CLK_ISP0_CORE			460
+#define CLK_ISP0_CORE_MARVIN		461
+#define CLK_ISP0_CORE_VICAP		462
+#define ACLK_ISP0			463
+#define HCLK_ISP0			464
+#define ACLK_VI_ROOT			465
+#define HCLK_VI_ROOT			466
+#define PCLK_VI_ROOT			467
+#define DCLK_VICAP			468
+#define ACLK_VICAP			469
+#define HCLK_VICAP			470
+#define PCLK_DP0			471
+#define PCLK_DP1			472
+#define PCLK_S_DP0			473
+#define PCLK_S_DP1			474
+#define CLK_DP0				475
+#define CLK_DP1				476
+#define HCLK_HDCP_KEY0			477
+#define ACLK_HDCP0			478
+#define HCLK_HDCP0			479
+#define PCLK_HDCP0			480
+#define HCLK_I2S4_8CH			481
+#define ACLK_TRNG0			482
+#define PCLK_TRNG0			483
+#define ACLK_VO0_ROOT			484
+#define HCLK_VO0_ROOT			485
+#define HCLK_VO0_S_ROOT			486
+#define PCLK_VO0_ROOT			487
+#define PCLK_VO0_S_ROOT			488
+#define PCLK_VO0GRF			489
+#define CLK_I2S4_8CH_TX_SRC		490
+#define CLK_I2S4_8CH_TX_FRAC		491
+#define MCLK_I2S4_8CH_TX		492
+#define CLK_I2S4_8CH_TX			493
+#define HCLK_I2S8_8CH			494
+#define CLK_I2S8_8CH_TX_SRC		495
+#define CLK_I2S8_8CH_TX_FRAC		496
+#define MCLK_I2S8_8CH_TX		497
+#define CLK_I2S8_8CH_TX			498
+#define HCLK_SPDIF2_DP0			499
+#define CLK_SPDIF2_DP0_SRC		500
+#define CLK_SPDIF2_DP0_FRAC		501
+#define MCLK_SPDIF2_DP0			502
+#define CLK_SPDIF2_DP0			503
+#define MCLK_SPDIF2			504
+#define HCLK_SPDIF5_DP1			505
+#define CLK_SPDIF5_DP1_SRC		506
+#define CLK_SPDIF5_DP1_FRAC		507
+#define MCLK_SPDIF5_DP1			508
+#define CLK_SPDIF5_DP1			509
+#define MCLK_SPDIF5			510
+#define PCLK_EDP0			511
+#define CLK_EDP0_24M			512
+#define CLK_EDP0_200M			513
+#define PCLK_EDP1			514
+#define CLK_EDP1_24M			515
+#define CLK_EDP1_200M			516
+#define HCLK_HDCP_KEY1			517
+#define ACLK_HDCP1			518
+#define HCLK_HDCP1			519
+#define PCLK_HDCP1			520
+#define ACLK_HDMIRX			521
+#define PCLK_HDMIRX			522
+#define CLK_HDMIRX_REF			523
+#define CLK_HDMIRX_AUD_SRC		524
+#define CLK_HDMIRX_AUD_FRAC		525
+#define CLK_HDMIRX_AUD			526
+#define CLK_HDMIRX_AUD_P_MUX		527
+#define PCLK_HDMITX0			528
+#define CLK_HDMITX0_EARC		529
+#define CLK_HDMITX0_REF			530
+#define PCLK_HDMITX1			531
+#define CLK_HDMITX1_EARC		532
+#define CLK_HDMITX1_REF			533
+#define CLK_HDMITRX_REFSRC		534
+#define ACLK_TRNG1			535
+#define PCLK_TRNG1			536
+#define ACLK_HDCP1_ROOT			537
+#define ACLK_HDMIRX_ROOT		538
+#define HCLK_VO1_ROOT			539
+#define HCLK_VO1_S_ROOT			540
+#define PCLK_VO1_ROOT			541
+#define PCLK_VO1_S_ROOT			542
+#define PCLK_S_EDP0			543
+#define PCLK_S_EDP1			544
+#define PCLK_S_HDMIRX			545
+#define HCLK_I2S10_8CH			546
+#define CLK_I2S10_8CH_RX_SRC		547
+#define CLK_I2S10_8CH_RX_FRAC		548
+#define CLK_I2S10_8CH_RX		549
+#define MCLK_I2S10_8CH_RX		550
+#define HCLK_I2S7_8CH			551
+#define CLK_I2S7_8CH_RX_SRC		552
+#define CLK_I2S7_8CH_RX_FRAC		553
+#define CLK_I2S7_8CH_RX			554
+#define MCLK_I2S7_8CH_RX		555
+#define HCLK_I2S9_8CH			556
+#define CLK_I2S9_8CH_RX_SRC		557
+#define CLK_I2S9_8CH_RX_FRAC		558
+#define CLK_I2S9_8CH_RX			559
+#define MCLK_I2S9_8CH_RX		560
+#define CLK_I2S5_8CH_TX_SRC		561
+#define CLK_I2S5_8CH_TX_FRAC		562
+#define CLK_I2S5_8CH_TX			563
+#define MCLK_I2S5_8CH_TX		564
+#define HCLK_I2S5_8CH			565
+#define CLK_I2S6_8CH_TX_SRC		566
+#define CLK_I2S6_8CH_TX_FRAC		567
+#define CLK_I2S6_8CH_TX			568
+#define MCLK_I2S6_8CH_TX		569
+#define CLK_I2S6_8CH_RX_SRC		570
+#define CLK_I2S6_8CH_RX_FRAC		571
+#define CLK_I2S6_8CH_RX			572
+#define MCLK_I2S6_8CH_RX		573
+#define I2S6_8CH_MCLKOUT		574
+#define HCLK_I2S6_8CH			575
+#define HCLK_SPDIF3			576
+#define CLK_SPDIF3_SRC			577
+#define CLK_SPDIF3_FRAC			578
+#define CLK_SPDIF3			579
+#define MCLK_SPDIF3			580
+#define HCLK_SPDIF4			581
+#define CLK_SPDIF4_SRC			582
+#define CLK_SPDIF4_FRAC			583
+#define CLK_SPDIF4			584
+#define MCLK_SPDIF4			585
+#define HCLK_SPDIFRX0			586
+#define MCLK_SPDIFRX0			587
+#define HCLK_SPDIFRX1			588
+#define MCLK_SPDIFRX1			589
+#define HCLK_SPDIFRX2			590
+#define MCLK_SPDIFRX2			591
+#define ACLK_VO1USB_TOP_ROOT		592
+#define HCLK_VO1USB_TOP_ROOT		593
+#define CLK_HDMIHDP0			594
+#define CLK_HDMIHDP1			595
+#define PCLK_HDPTX0			596
+#define PCLK_HDPTX1			597
+#define PCLK_USBDPPHY0			598
+#define PCLK_USBDPPHY1			599
+#define ACLK_VOP_ROOT			600
+#define ACLK_VOP_LOW_ROOT		601
+#define HCLK_VOP_ROOT			602
+#define PCLK_VOP_ROOT			603
+#define HCLK_VOP			604
+#define ACLK_VOP			605
+#define DCLK_VOP0_SRC			606
+#define DCLK_VOP1_SRC			607
+#define DCLK_VOP2_SRC			608
+#define DCLK_VOP0			609
+#define DCLK_VOP1			610
+#define DCLK_VOP2			611
+#define DCLK_VOP3			612
+#define PCLK_DSIHOST0			613
+#define PCLK_DSIHOST1			614
+#define CLK_DSIHOST0			615
+#define CLK_DSIHOST1			616
+#define CLK_VOP_PMU			617
+#define ACLK_VOP_DOBY			618
+#define ACLK_VOP_SUB_SRC		619
+#define CLK_USBDP_PHY0_IMMORTAL		620
+#define CLK_USBDP_PHY1_IMMORTAL		621
+#define CLK_PMU0			622
+#define PCLK_PMU0			623
+#define PCLK_PMU0IOC			624
+#define PCLK_GPIO0			625
+#define DBCLK_GPIO0			626
+#define PCLK_I2C0			627
+#define CLK_I2C0			628
+#define HCLK_I2S1_8CH			629
+#define CLK_I2S1_8CH_TX_SRC		630
+#define CLK_I2S1_8CH_TX_FRAC		631
+#define CLK_I2S1_8CH_TX			632
+#define MCLK_I2S1_8CH_TX		633
+#define CLK_I2S1_8CH_RX_SRC		634
+#define CLK_I2S1_8CH_RX_FRAC		635
+#define CLK_I2S1_8CH_RX			636
+#define MCLK_I2S1_8CH_RX		637
+#define I2S1_8CH_MCLKOUT		638
+#define CLK_PMU1_50M_SRC		639
+#define CLK_PMU1_100M_SRC		640
+#define CLK_PMU1_200M_SRC		641
+#define CLK_PMU1_300M_SRC		642
+#define CLK_PMU1_400M_SRC		643
+#define HCLK_PMU1_ROOT			644
+#define PCLK_PMU1_ROOT			645
+#define PCLK_PMU0_ROOT			646
+#define HCLK_PMU_CM0_ROOT		647
+#define PCLK_PMU1			648
+#define CLK_DDR_FAIL_SAFE		649
+#define CLK_PMU1			650
+#define HCLK_PDM0			651
+#define MCLK_PDM0			652
+#define HCLK_VAD			653
+#define FCLK_PMU_CM0_CORE		654
+#define CLK_PMU_CM0_RTC			655
+#define PCLK_PMU1_IOC			656
+#define PCLK_PMU1PWM			657
+#define CLK_PMU1PWM			658
+#define CLK_PMU1PWM_CAPTURE		659
+#define PCLK_PMU1TIMER			660
+#define CLK_PMU1TIMER_ROOT		661
+#define CLK_PMU1TIMER0			662
+#define CLK_PMU1TIMER1			663
+#define CLK_UART0_SRC			664
+#define CLK_UART0_FRAC			665
+#define CLK_UART0			666
+#define SCLK_UART0			667
+#define PCLK_UART0			668
+#define PCLK_PMU1WDT			669
+#define TCLK_PMU1WDT			670
+#define CLK_CR_PARA			671
+#define CLK_USB2PHY_HDPTXRXPHY_REF	672
+#define CLK_USBDPPHY_MIPIDCPPHY_REF	673
+#define CLK_REF_PIPE_PHY0_OSC_SRC	674
+#define CLK_REF_PIPE_PHY1_OSC_SRC	675
+#define CLK_REF_PIPE_PHY2_OSC_SRC	676
+#define CLK_REF_PIPE_PHY0_PLL_SRC	677
+#define CLK_REF_PIPE_PHY1_PLL_SRC	678
+#define CLK_REF_PIPE_PHY2_PLL_SRC	679
+#define CLK_REF_PIPE_PHY0		680
+#define CLK_REF_PIPE_PHY1		681
+#define CLK_REF_PIPE_PHY2		682
+#define SCLK_SDIO_DRV			683
+#define SCLK_SDIO_SAMPLE		684
+#define SCLK_SDMMC_DRV			685
+#define SCLK_SDMMC_SAMPLE		686
+#define CLK_PCIE1L0_PIPE		687
+#define CLK_PCIE1L1_PIPE		688
+#define CLK_BIGCORE0_PVTM		689
+#define CLK_CORE_BIGCORE0_PVTM		690
+#define CLK_BIGCORE1_PVTM		691
+#define CLK_CORE_BIGCORE1_PVTM		692
+#define CLK_LITCORE_PVTM		693
+#define CLK_CORE_LITCORE_PVTM		694
+#define CLK_AUX16M_0			695
+#define CLK_AUX16M_1			696
+#define CLK_PHY0_REF_ALT_P		697
+#define CLK_PHY0_REF_ALT_M		698
+#define CLK_PHY1_REF_ALT_P		699
+#define CLK_PHY1_REF_ALT_M		700
+#define ACLK_ISP1_PRE			701
+#define HCLK_ISP1_PRE			702
+#define HCLK_NVM			703
+#define ACLK_USB			704
+#define HCLK_USB			705
+#define ACLK_JPEG_DECODER_PRE		706
+#define ACLK_VDPU_LOW_PRE		707
+#define ACLK_RKVENC1_PRE		708
+#define HCLK_RKVENC1_PRE		709
+#define HCLK_RKVDEC0_PRE		710
+#define ACLK_RKVDEC0_PRE		711
+#define HCLK_RKVDEC1_PRE		712
+#define ACLK_RKVDEC1_PRE		713
+#define ACLK_HDCP0_PRE			714
+#define HCLK_VO0			715
+#define ACLK_HDCP1_PRE			716
+#define HCLK_VO1			717
+#define ACLK_AV1_PRE			718
+#define PCLK_AV1_PRE			719
+#define HCLK_SDIO_PRE			720
+
+#define CLK_NR_CLKS			(HCLK_SDIO_PRE + 1)
+
+/* scmi-clocks indices */
+
+#define SCMI_CLK_CPUL			0
+#define SCMI_CLK_DSU			1
+#define SCMI_CLK_CPUB01			2
+#define SCMI_CLK_CPUB23			3
+#define SCMI_CLK_DDR			4
+#define SCMI_CLK_GPU			5
+#define SCMI_CLK_NPU			6
+#define SCMI_CLK_SBUS			7
+#define SCMI_PCLK_SBUS			8
+#define SCMI_CCLK_SD			9
+#define SCMI_DCLK_SD			10
+#define SCMI_ACLK_SECURE_NS		11
+#define SCMI_HCLK_SECURE_NS		12
+#define SCMI_TCLK_WDT			13
+#define SCMI_KEYLADDER_CORE		14
+#define SCMI_KEYLADDER_RNG		15
+#define SCMI_ACLK_SECURE_S		16
+#define SCMI_HCLK_SECURE_S		17
+#define SCMI_PCLK_SECURE_S		18
+#define SCMI_CRYPTO_RNG			19
+#define SCMI_CRYPTO_CORE		20
+#define SCMI_CRYPTO_PKA			21
+#define SCMI_SPLL			22
+#define SCMI_HCLK_SD			23
+
+#endif
-- 
2.35.1

