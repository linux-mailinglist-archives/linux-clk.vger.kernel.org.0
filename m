Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE45E5F0F09
	for <lists+linux-clk@lfdr.de>; Fri, 30 Sep 2022 17:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbiI3PjG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 30 Sep 2022 11:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbiI3PjF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 11:39:05 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452671A0D25;
        Fri, 30 Sep 2022 08:39:03 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-096-057-200.ewe-ip-backbone.de [91.96.57.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FEB166022EA;
        Fri, 30 Sep 2022 16:39:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1664552341;
        bh=pZtN/rFYVOu6X4mJGT/96YjFltGFClQ67Jb9wueqxW4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i22Lmo5ipNDug1AXHkeU2mp9f5k9OblUgtp1zSa9tjC4jcUrfUJCwC9dA7Anb2Sa3
         hECYDYLaOWNTXMox4C8YvIvcl8WH28HX24hpbqzn8wfJpJX2GL5zAr0bNwEbAj28dl
         jZV0B9bodDTs16PchwivduJVrFoMivSxYZ7lcEmDWqWNOankM1qcX3ieKsaM8wb4FU
         5Ar8V4fsOhhMcRh+KKGhr2Pp3/FEvwz+brXoto5NN7kwSGIQuTCY0nhyRMLkjm5F3V
         mAEbVIwLeAsU4gET9oe59ijHMk6hwuA1s6uKLRtxbZ3LksLTQ3zGiP6hYzfB36eSsN
         lwjeEIvDXt2jQ==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 05B10480145; Fri, 30 Sep 2022 17:38:59 +0200 (CEST)
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
Subject: [PATCHv2 2/9] dt-bindings: reset: add rk3588 reset definitions
Date:   Fri, 30 Sep 2022 17:38:50 +0200
Message-Id: <20220930153857.299396-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930153857.299396-1-sebastian.reichel@collabora.com>
References: <20220930153857.299396-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add reset ID defines for rk3588.

Compared to the downstream bindings and previous rockchip
generations this uses continous gapless reset IDs starting
at 0 instead of register offsets as IDs. Thus all numbers
are different between upstream and downstream, but I kept
the names exactly the same.

Co-Developed-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../dt-bindings/reset/rockchip,rk3588-cru.h   | 754 ++++++++++++++++++
 1 file changed, 754 insertions(+)
 create mode 100644 include/dt-bindings/reset/rockchip,rk3588-cru.h

diff --git a/include/dt-bindings/reset/rockchip,rk3588-cru.h b/include/dt-bindings/reset/rockchip,rk3588-cru.h
new file mode 100644
index 000000000000..738e56aead93
--- /dev/null
+++ b/include/dt-bindings/reset/rockchip,rk3588-cru.h
@@ -0,0 +1,754 @@
+/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
+/*
+ * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
+ * Copyright (c) 2022 Collabora Ltd.
+ *
+ * Author: Elaine Zhang <zhangqing@rock-chips.com>
+ * Author: Sebastian Reichel <sebastian.reichel@collabora.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_ROCKCHIP_RK3588_H
+#define _DT_BINDINGS_RESET_ROCKCHIP_RK3588_H
+
+#define SRST_A_TOP_BIU			0
+#define SRST_P_TOP_BIU			1
+#define SRST_P_CSIPHY0			2
+#define SRST_CSIPHY0			3
+#define SRST_P_CSIPHY1			4
+#define SRST_CSIPHY1			5
+#define SRST_A_TOP_M500_BIU		6
+
+#define SRST_A_TOP_M400_BIU		7
+#define SRST_A_TOP_S200_BIU		8
+#define SRST_A_TOP_S400_BIU		9
+#define SRST_A_TOP_M300_BIU		10
+#define SRST_USBDP_COMBO_PHY0_INIT	11
+#define SRST_USBDP_COMBO_PHY0_CMN	12
+#define SRST_USBDP_COMBO_PHY0_LANE	13
+#define SRST_USBDP_COMBO_PHY0_PCS	14
+#define SRST_USBDP_COMBO_PHY1_INIT	15
+
+#define SRST_USBDP_COMBO_PHY1_CMN	16
+#define SRST_USBDP_COMBO_PHY1_LANE	17
+#define SRST_USBDP_COMBO_PHY1_PCS	18
+#define SRST_DCPHY0			19
+#define SRST_P_MIPI_DCPHY0		20
+#define SRST_P_MIPI_DCPHY0_GRF		21
+
+#define SRST_DCPHY1			22
+#define SRST_P_MIPI_DCPHY1		23
+#define SRST_P_MIPI_DCPHY1_GRF		24
+#define SRST_P_APB2ASB_SLV_CDPHY	25
+#define SRST_P_APB2ASB_SLV_CSIPHY	26
+#define SRST_P_APB2ASB_SLV_VCCIO3_5	27
+#define SRST_P_APB2ASB_SLV_VCCIO6	28
+#define SRST_P_APB2ASB_SLV_EMMCIO	29
+#define SRST_P_APB2ASB_SLV_IOC_TOP	30
+#define SRST_P_APB2ASB_SLV_IOC_RIGHT	31
+
+#define SRST_P_CRU			32
+#define SRST_A_CHANNEL_SECURE2VO1USB	33
+#define SRST_A_CHANNEL_SECURE2CENTER	34
+#define SRST_H_CHANNEL_SECURE2VO1USB	35
+#define SRST_H_CHANNEL_SECURE2CENTER	36
+
+#define SRST_P_CHANNEL_SECURE2VO1USB	37
+#define SRST_P_CHANNEL_SECURE2CENTER	38
+
+#define SRST_H_AUDIO_BIU		39
+#define SRST_P_AUDIO_BIU		40
+#define SRST_H_I2S0_8CH			41
+#define SRST_M_I2S0_8CH_TX		42
+#define SRST_M_I2S0_8CH_RX		43
+#define SRST_P_ACDCDIG			44
+#define SRST_H_I2S2_2CH			45
+#define SRST_H_I2S3_2CH			46
+
+#define SRST_M_I2S2_2CH			47
+#define SRST_M_I2S3_2CH			48
+#define SRST_DAC_ACDCDIG		49
+#define SRST_H_SPDIF0			50
+
+#define SRST_M_SPDIF0			51
+#define SRST_H_SPDIF1			52
+#define SRST_M_SPDIF1			53
+#define SRST_H_PDM1			54
+#define SRST_PDM1			55
+
+#define SRST_A_BUS_BIU			56
+#define SRST_P_BUS_BIU			57
+#define SRST_A_GIC			58
+#define SRST_A_GIC_DBG			59
+#define SRST_A_DMAC0			60
+#define SRST_A_DMAC1			61
+#define SRST_A_DMAC2			62
+#define SRST_P_I2C1			63
+#define SRST_P_I2C2			64
+#define SRST_P_I2C3			65
+#define SRST_P_I2C4			66
+#define SRST_P_I2C5			67
+#define SRST_P_I2C6			68
+#define SRST_P_I2C7			69
+#define SRST_P_I2C8			70
+
+#define SRST_I2C1			71
+#define SRST_I2C2			72
+#define SRST_I2C3			73
+#define SRST_I2C4			74
+#define SRST_I2C5			75
+#define SRST_I2C6			76
+#define SRST_I2C7			77
+#define SRST_I2C8			78
+#define SRST_P_CAN0			79
+#define SRST_CAN0			80
+#define SRST_P_CAN1			81
+#define SRST_CAN1			82
+#define SRST_P_CAN2			83
+#define SRST_CAN2			84
+#define SRST_P_SARADC			85
+
+#define SRST_P_TSADC			86
+#define SRST_TSADC			87
+#define SRST_P_UART1			88
+#define SRST_P_UART2			89
+#define SRST_P_UART3			90
+#define SRST_P_UART4			91
+#define SRST_P_UART5			92
+#define SRST_P_UART6			93
+#define SRST_P_UART7			94
+#define SRST_P_UART8			95
+#define SRST_P_UART9			96
+#define SRST_S_UART1			97
+
+#define SRST_S_UART2			98
+#define SRST_S_UART3			99
+#define SRST_S_UART4			100
+#define SRST_S_UART5			101
+#define SRST_S_UART6			102
+#define SRST_S_UART7			103
+
+#define SRST_S_UART8			104
+#define SRST_S_UART9			105
+#define SRST_P_SPI0			106
+#define SRST_P_SPI1			107
+#define SRST_P_SPI2			108
+#define SRST_P_SPI3			109
+#define SRST_P_SPI4			110
+#define SRST_SPI0			111
+#define SRST_SPI1			112
+#define SRST_SPI2			113
+#define SRST_SPI3			114
+#define SRST_SPI4			115
+
+#define SRST_P_WDT0			116
+#define SRST_T_WDT0			117
+#define SRST_P_SYS_GRF			118
+#define SRST_P_PWM1			119
+#define SRST_PWM1			120
+#define SRST_P_PWM2			121
+#define SRST_PWM2			122
+#define SRST_P_PWM3			123
+#define SRST_PWM3			124
+#define SRST_P_BUSTIMER0		125
+#define SRST_P_BUSTIMER1		126
+#define SRST_BUSTIMER0			127
+
+#define SRST_BUSTIMER1			128
+#define SRST_BUSTIMER2			129
+#define SRST_BUSTIMER3			130
+#define SRST_BUSTIMER4			131
+#define SRST_BUSTIMER5			132
+#define SRST_BUSTIMER6			133
+#define SRST_BUSTIMER7			134
+#define SRST_BUSTIMER8			135
+#define SRST_BUSTIMER9			136
+#define SRST_BUSTIMER10			137
+#define SRST_BUSTIMER11			138
+#define SRST_P_MAILBOX0			139
+#define SRST_P_MAILBOX1			140
+#define SRST_P_MAILBOX2			141
+#define SRST_P_GPIO1			142
+#define SRST_GPIO1			143
+
+#define SRST_P_GPIO2			144
+#define SRST_GPIO2			145
+#define SRST_P_GPIO3			146
+#define SRST_GPIO3			147
+#define SRST_P_GPIO4			148
+#define SRST_GPIO4			149
+#define SRST_A_DECOM			150
+#define SRST_P_DECOM			151
+#define SRST_D_DECOM			152
+#define SRST_P_TOP			153
+#define SRST_A_GICADB_GIC2CORE_BUS	154
+#define SRST_P_DFT2APB			155
+#define SRST_P_APB2ASB_MST_TOP		156
+#define SRST_P_APB2ASB_MST_CDPHY	157
+#define SRST_P_APB2ASB_MST_BOT_RIGHT	158
+
+#define SRST_P_APB2ASB_MST_IOC_TOP	159
+#define SRST_P_APB2ASB_MST_IOC_RIGHT	160
+#define SRST_P_APB2ASB_MST_CSIPHY	161
+#define SRST_P_APB2ASB_MST_VCCIO3_5	162
+#define SRST_P_APB2ASB_MST_VCCIO6	163
+#define SRST_P_APB2ASB_MST_EMMCIO	164
+#define SRST_A_SPINLOCK			165
+#define SRST_P_OTPC_NS			166
+#define SRST_OTPC_NS			167
+#define SRST_OTPC_ARB			168
+
+#define SRST_P_BUSIOC			169
+#define SRST_P_PMUCM0_INTMUX		170
+#define SRST_P_DDRCM0_INTMUX		171
+
+#define SRST_P_DDR_DFICTL_CH0		172
+#define SRST_P_DDR_MON_CH0		173
+#define SRST_P_DDR_STANDBY_CH0		174
+#define SRST_P_DDR_UPCTL_CH0		175
+#define SRST_TM_DDR_MON_CH0		176
+#define SRST_P_DDR_GRF_CH01		177
+#define SRST_DFI_CH0			178
+#define SRST_SBR_CH0			179
+#define SRST_DDR_UPCTL_CH0		180
+#define SRST_DDR_DFICTL_CH0		181
+#define SRST_DDR_MON_CH0		182
+#define SRST_DDR_STANDBY_CH0		183
+#define SRST_A_DDR_UPCTL_CH0		184
+#define SRST_P_DDR_DFICTL_CH1		185
+#define SRST_P_DDR_MON_CH1		186
+#define SRST_P_DDR_STANDBY_CH1		187
+
+#define SRST_P_DDR_UPCTL_CH1		188
+#define SRST_TM_DDR_MON_CH1		189
+#define SRST_DFI_CH1			190
+#define SRST_SBR_CH1			191
+#define SRST_DDR_UPCTL_CH1		192
+#define SRST_DDR_DFICTL_CH1		193
+#define SRST_DDR_MON_CH1		194
+#define SRST_DDR_STANDBY_CH1		195
+#define SRST_A_DDR_UPCTL_CH1		196
+#define SRST_A_DDR01_MSCH0		197
+#define SRST_A_DDR01_RS_MSCH0		198
+#define SRST_A_DDR01_FRS_MSCH0		199
+
+#define SRST_A_DDR01_SCRAMBLE0		200
+#define SRST_A_DDR01_FRS_SCRAMBLE0	201
+#define SRST_A_DDR01_MSCH1		202
+#define SRST_A_DDR01_RS_MSCH1		203
+#define SRST_A_DDR01_FRS_MSCH1		204
+#define SRST_A_DDR01_SCRAMBLE1		205
+#define SRST_A_DDR01_FRS_SCRAMBLE1	206
+#define SRST_P_DDR01_MSCH0		207
+#define SRST_P_DDR01_MSCH1		208
+
+#define SRST_P_DDR_DFICTL_CH2		209
+#define SRST_P_DDR_MON_CH2		210
+#define SRST_P_DDR_STANDBY_CH2		211
+#define SRST_P_DDR_UPCTL_CH2		212
+#define SRST_TM_DDR_MON_CH2		213
+#define SRST_P_DDR_GRF_CH23		214
+#define SRST_DFI_CH2			215
+#define SRST_SBR_CH2			216
+#define SRST_DDR_UPCTL_CH2		217
+#define SRST_DDR_DFICTL_CH2		218
+#define SRST_DDR_MON_CH2		219
+#define SRST_DDR_STANDBY_CH2		220
+#define SRST_A_DDR_UPCTL_CH2		221
+#define SRST_P_DDR_DFICTL_CH3		222
+#define SRST_P_DDR_MON_CH3		223
+#define SRST_P_DDR_STANDBY_CH3		224
+
+#define SRST_P_DDR_UPCTL_CH3		225
+#define SRST_TM_DDR_MON_CH3		226
+#define SRST_DFI_CH3			227
+#define SRST_SBR_CH3			228
+#define SRST_DDR_UPCTL_CH3		229
+#define SRST_DDR_DFICTL_CH3		230
+#define SRST_DDR_MON_CH3		231
+#define SRST_DDR_STANDBY_CH3		232
+#define SRST_A_DDR_UPCTL_CH3		233
+#define SRST_A_DDR23_MSCH2		234
+#define SRST_A_DDR23_RS_MSCH2		235
+#define SRST_A_DDR23_FRS_MSCH2		236
+
+#define SRST_A_DDR23_SCRAMBLE2		237
+#define SRST_A_DDR23_FRS_SCRAMBLE2	238
+#define SRST_A_DDR23_MSCH3		239
+#define SRST_A_DDR23_RS_MSCH3		240
+#define SRST_A_DDR23_FRS_MSCH3		241
+#define SRST_A_DDR23_SCRAMBLE3		242
+#define SRST_A_DDR23_FRS_SCRAMBLE3	243
+#define SRST_P_DDR23_MSCH2		244
+#define SRST_P_DDR23_MSCH3		245
+
+#define SRST_ISP1			246
+#define SRST_ISP1_VICAP			247
+#define SRST_A_ISP1_BIU			248
+#define SRST_H_ISP1_BIU			249
+
+#define SRST_A_RKNN1			250
+#define SRST_A_RKNN1_BIU		251
+#define SRST_H_RKNN1			252
+#define SRST_H_RKNN1_BIU		253
+
+#define SRST_A_RKNN2			254
+#define SRST_A_RKNN2_BIU		255
+#define SRST_H_RKNN2			256
+#define SRST_H_RKNN2_BIU		257
+
+#define SRST_A_RKNN_DSU0		258
+#define SRST_P_NPUTOP_BIU		259
+#define SRST_P_NPU_TIMER		260
+#define SRST_NPUTIMER0			261
+#define SRST_NPUTIMER1			262
+#define SRST_P_NPU_WDT			263
+#define SRST_T_NPU_WDT			264
+#define SRST_P_NPU_PVTM			265
+#define SRST_P_NPU_GRF			266
+#define SRST_NPU_PVTM			267
+
+#define SRST_NPU_PVTPLL			268
+#define SRST_H_NPU_CM0_BIU		269
+#define SRST_F_NPU_CM0_CORE		270
+#define SRST_T_NPU_CM0_JTAG		271
+#define SRST_A_RKNN0			272
+#define SRST_A_RKNN0_BIU		273
+#define SRST_H_RKNN0			274
+#define SRST_H_RKNN0_BIU		275
+
+#define SRST_H_NVM_BIU			276
+#define SRST_A_NVM_BIU			277
+#define SRST_H_EMMC			278
+#define SRST_A_EMMC			279
+#define SRST_C_EMMC			280
+#define SRST_B_EMMC			281
+#define SRST_T_EMMC			282
+#define SRST_S_SFC			283
+#define SRST_H_SFC			284
+#define SRST_H_SFC_XIP			285
+
+#define SRST_P_GRF			286
+#define SRST_P_DEC_BIU			287
+#define SRST_P_PHP_BIU			288
+#define SRST_A_PCIE_GRIDGE		289
+#define SRST_A_PHP_BIU			290
+#define SRST_A_GMAC0			291
+#define SRST_A_GMAC1			292
+#define SRST_A_PCIE_BIU			293
+#define SRST_PCIE0_POWER_UP		294
+#define SRST_PCIE1_POWER_UP		295
+#define SRST_PCIE2_POWER_UP		296
+
+#define SRST_PCIE3_POWER_UP		297
+#define SRST_PCIE4_POWER_UP		298
+#define SRST_P_PCIE0			299
+#define SRST_P_PCIE1			300
+#define SRST_P_PCIE2			301
+#define SRST_P_PCIE3			302
+
+#define SRST_P_PCIE4			303
+#define SRST_A_PHP_GIC_ITS		304
+#define SRST_A_MMU_PCIE			305
+#define SRST_A_MMU_PHP			306
+#define SRST_A_MMU_BIU			307
+
+#define SRST_A_USB3OTG2			308
+
+#define SRST_PMALIVE0			309
+#define SRST_PMALIVE1			310
+#define SRST_PMALIVE2			311
+#define SRST_A_SATA0			312
+#define SRST_A_SATA1			313
+#define SRST_A_SATA2			314
+#define SRST_RXOOB0			315
+#define SRST_RXOOB1			316
+#define SRST_RXOOB2			317
+#define SRST_ASIC0			318
+#define SRST_ASIC1			319
+#define SRST_ASIC2			320
+
+#define SRST_A_RKVDEC_CCU		321
+#define SRST_H_RKVDEC0			322
+#define SRST_A_RKVDEC0			323
+#define SRST_H_RKVDEC0_BIU		324
+#define SRST_A_RKVDEC0_BIU		325
+#define SRST_RKVDEC0_CA			326
+#define SRST_RKVDEC0_HEVC_CA		327
+#define SRST_RKVDEC0_CORE		328
+
+#define SRST_H_RKVDEC1			329
+#define SRST_A_RKVDEC1			330
+#define SRST_H_RKVDEC1_BIU		331
+#define SRST_A_RKVDEC1_BIU		332
+#define SRST_RKVDEC1_CA			333
+#define SRST_RKVDEC1_HEVC_CA		334
+#define SRST_RKVDEC1_CORE		335
+
+#define SRST_A_USB_BIU			336
+#define SRST_H_USB_BIU			337
+#define SRST_A_USB3OTG0			338
+#define SRST_A_USB3OTG1			339
+#define SRST_H_HOST0			340
+#define SRST_H_HOST_ARB0		341
+#define SRST_H_HOST1			342
+#define SRST_H_HOST_ARB1		343
+#define SRST_A_USB_GRF			344
+#define SRST_C_USB2P0_HOST0		345
+
+#define SRST_C_USB2P0_HOST1		346
+#define SRST_HOST_UTMI0			347
+#define SRST_HOST_UTMI1			348
+
+#define SRST_A_VDPU_BIU			349
+#define SRST_A_VDPU_LOW_BIU		350
+#define SRST_H_VDPU_BIU			351
+#define SRST_A_JPEG_DECODER_BIU		352
+#define SRST_A_VPU			353
+#define SRST_H_VPU			354
+#define SRST_A_JPEG_ENCODER0		355
+#define SRST_H_JPEG_ENCODER0		356
+#define SRST_A_JPEG_ENCODER1		357
+#define SRST_H_JPEG_ENCODER1		358
+#define SRST_A_JPEG_ENCODER2		359
+#define SRST_H_JPEG_ENCODER2		360
+
+#define SRST_A_JPEG_ENCODER3		361
+#define SRST_H_JPEG_ENCODER3		362
+#define SRST_A_JPEG_DECODER		363
+#define SRST_H_JPEG_DECODER		364
+#define SRST_H_IEP2P0			365
+#define SRST_A_IEP2P0			366
+#define SRST_IEP2P0_CORE		367
+#define SRST_H_RGA2			368
+#define SRST_A_RGA2			369
+#define SRST_RGA2_CORE			370
+#define SRST_H_RGA3_0			371
+#define SRST_A_RGA3_0			372
+#define SRST_RGA3_0_CORE		373
+
+#define SRST_H_RKVENC0_BIU		374
+#define SRST_A_RKVENC0_BIU		375
+#define SRST_H_RKVENC0			376
+#define SRST_A_RKVENC0			377
+#define SRST_RKVENC0_CORE		378
+
+#define SRST_H_RKVENC1_BIU		379
+#define SRST_A_RKVENC1_BIU		380
+#define SRST_H_RKVENC1			381
+#define SRST_A_RKVENC1			382
+#define SRST_RKVENC1_CORE		383
+
+#define SRST_A_VI_BIU			384
+#define SRST_H_VI_BIU			385
+#define SRST_P_VI_BIU			386
+#define SRST_D_VICAP			387
+#define SRST_A_VICAP			388
+#define SRST_H_VICAP			389
+#define SRST_ISP0			390
+#define SRST_ISP0_VICAP			391
+
+#define SRST_FISHEYE0			392
+#define SRST_FISHEYE1			393
+#define SRST_P_CSI_HOST_0		394
+#define SRST_P_CSI_HOST_1		395
+#define SRST_P_CSI_HOST_2		396
+#define SRST_P_CSI_HOST_3		397
+#define SRST_P_CSI_HOST_4		398
+#define SRST_P_CSI_HOST_5		399
+
+#define SRST_CSIHOST0_VICAP		400
+#define SRST_CSIHOST1_VICAP		401
+#define SRST_CSIHOST2_VICAP		402
+#define SRST_CSIHOST3_VICAP		403
+#define SRST_CSIHOST4_VICAP		404
+#define SRST_CSIHOST5_VICAP		405
+#define SRST_CIFIN			406
+
+#define SRST_A_VOP_BIU			407
+#define SRST_A_VOP_LOW_BIU		408
+#define SRST_H_VOP_BIU			409
+#define SRST_P_VOP_BIU			410
+#define SRST_H_VOP			411
+#define SRST_A_VOP			412
+#define SRST_D_VOP0			413
+#define SRST_D_VOP2HDMI_BRIDGE0		414
+#define SRST_D_VOP2HDMI_BRIDGE1		415
+
+#define SRST_D_VOP1			416
+#define SRST_D_VOP2			417
+#define SRST_D_VOP3			418
+#define SRST_P_VOPGRF			419
+#define SRST_P_DSIHOST0			420
+#define SRST_P_DSIHOST1			421
+#define SRST_DSIHOST0			422
+#define SRST_DSIHOST1			423
+#define SRST_VOP_PMU			424
+#define SRST_P_VOP_CHANNEL_BIU		425
+
+#define SRST_H_VO0_BIU			426
+#define SRST_H_VO0_S_BIU		427
+#define SRST_P_VO0_BIU			428
+#define SRST_P_VO0_S_BIU		429
+#define SRST_A_HDCP0_BIU		430
+#define SRST_P_VO0GRF			431
+#define SRST_H_HDCP_KEY0		432
+#define SRST_A_HDCP0			433
+#define SRST_H_HDCP0			434
+#define SRST_HDCP0			435
+
+#define SRST_P_TRNG0			436
+#define SRST_DP0			437
+#define SRST_DP1			438
+#define SRST_H_I2S4_8CH			439
+#define SRST_M_I2S4_8CH_TX		440
+#define SRST_H_I2S8_8CH			441
+
+#define SRST_M_I2S8_8CH_TX		442
+#define SRST_H_SPDIF2_DP0		443
+#define SRST_M_SPDIF2_DP0		444
+#define SRST_H_SPDIF5_DP1		445
+#define SRST_M_SPDIF5_DP1		446
+
+#define SRST_A_HDCP1_BIU		447
+#define SRST_A_VO1_BIU			448
+#define SRST_H_VOP1_BIU			449
+#define SRST_H_VOP1_S_BIU		450
+#define SRST_P_VOP1_BIU			451
+#define SRST_P_VO1GRF			452
+#define SRST_P_VO1_S_BIU		453
+
+#define SRST_H_I2S7_8CH			454
+#define SRST_M_I2S7_8CH_RX		455
+#define SRST_H_HDCP_KEY1		456
+#define SRST_A_HDCP1			457
+#define SRST_H_HDCP1			458
+#define SRST_HDCP1			459
+#define SRST_P_TRNG1			460
+#define SRST_P_HDMITX0			461
+
+#define SRST_HDMITX0_REF		462
+#define SRST_P_HDMITX1			463
+#define SRST_HDMITX1_REF		464
+#define SRST_A_HDMIRX			465
+#define SRST_P_HDMIRX			466
+#define SRST_HDMIRX_REF			467
+
+#define SRST_P_EDP0			468
+#define SRST_EDP0_24M			469
+#define SRST_P_EDP1			470
+#define SRST_EDP1_24M			471
+#define SRST_M_I2S5_8CH_TX		472
+#define SRST_H_I2S5_8CH			473
+#define SRST_M_I2S6_8CH_TX		474
+
+#define SRST_M_I2S6_8CH_RX		475
+#define SRST_H_I2S6_8CH			476
+#define SRST_H_SPDIF3			477
+#define SRST_M_SPDIF3			478
+#define SRST_H_SPDIF4			479
+#define SRST_M_SPDIF4			480
+#define SRST_H_SPDIFRX0			481
+#define SRST_M_SPDIFRX0			482
+#define SRST_H_SPDIFRX1			483
+#define SRST_M_SPDIFRX1			484
+
+#define SRST_H_SPDIFRX2			485
+#define SRST_M_SPDIFRX2			486
+#define SRST_LINKSYM_HDMITXPHY0		487
+#define SRST_LINKSYM_HDMITXPHY1		488
+#define SRST_VO1_BRIDGE0		489
+#define SRST_VO1_BRIDGE1		490
+
+#define SRST_H_I2S9_8CH			491
+#define SRST_M_I2S9_8CH_RX		492
+#define SRST_H_I2S10_8CH		493
+#define SRST_M_I2S10_8CH_RX		494
+#define SRST_P_S_HDMIRX			495
+
+#define SRST_GPU			496
+#define SRST_SYS_GPU			497
+#define SRST_A_S_GPU_BIU		498
+#define SRST_A_M0_GPU_BIU		499
+#define SRST_A_M1_GPU_BIU		500
+#define SRST_A_M2_GPU_BIU		501
+#define SRST_A_M3_GPU_BIU		502
+#define SRST_P_GPU_BIU			503
+#define SRST_P_GPU_PVTM			504
+
+#define SRST_GPU_PVTM			505
+#define SRST_P_GPU_GRF			506
+#define SRST_GPU_PVTPLL			507
+#define SRST_GPU_JTAG			508
+
+#define SRST_A_AV1_BIU			509
+#define SRST_A_AV1			510
+#define SRST_P_AV1_BIU			511
+#define SRST_P_AV1			512
+
+#define SRST_A_DDR_BIU			513
+#define SRST_A_DMA2DDR			514
+#define SRST_A_DDR_SHAREMEM		515
+#define SRST_A_DDR_SHAREMEM_BIU		516
+#define SRST_A_CENTER_S200_BIU		517
+#define SRST_A_CENTER_S400_BIU		518
+#define SRST_H_AHB2APB			519
+#define SRST_H_CENTER_BIU		520
+#define SRST_F_DDR_CM0_CORE		521
+
+#define SRST_DDR_TIMER0			522
+#define SRST_DDR_TIMER1			523
+#define SRST_T_WDT_DDR			524
+#define SRST_T_DDR_CM0_JTAG		525
+#define SRST_P_CENTER_GRF		526
+#define SRST_P_AHB2APB			527
+#define SRST_P_WDT			528
+#define SRST_P_TIMER			529
+#define SRST_P_DMA2DDR			530
+#define SRST_P_SHAREMEM			531
+#define SRST_P_CENTER_BIU		532
+#define SRST_P_CENTER_CHANNEL_BIU	533
+
+#define SRST_P_USBDPGRF0		534
+#define SRST_P_USBDPPHY0		535
+#define SRST_P_USBDPGRF1		536
+#define SRST_P_USBDPPHY1		537
+#define SRST_P_HDPTX0			538
+#define SRST_P_HDPTX1			539
+#define SRST_P_APB2ASB_SLV_BOT_RIGHT	540
+#define SRST_P_USB2PHY_U3_0_GRF0	541
+#define SRST_P_USB2PHY_U3_1_GRF0	542
+#define SRST_P_USB2PHY_U2_0_GRF0	543
+#define SRST_P_USB2PHY_U2_1_GRF0	544
+#define SRST_HDPTX0_ROPLL		545
+#define SRST_HDPTX0_LCPLL		546
+#define SRST_HDPTX0			547
+#define SRST_HDPTX1_ROPLL		548
+
+#define SRST_HDPTX1_LCPLL		549
+#define SRST_HDPTX1			550
+#define SRST_HDPTX0_HDMIRXPHY_SET	551
+#define SRST_USBDP_COMBO_PHY0		552
+#define SRST_USBDP_COMBO_PHY0_LCPLL	553
+#define SRST_USBDP_COMBO_PHY0_ROPLL	554
+#define SRST_USBDP_COMBO_PHY0_PCS_HS	555
+#define SRST_USBDP_COMBO_PHY1		556
+#define SRST_USBDP_COMBO_PHY1_LCPLL	557
+#define SRST_USBDP_COMBO_PHY1_ROPLL	558
+#define SRST_USBDP_COMBO_PHY1_PCS_HS	559
+#define SRST_HDMIHDP0			560
+#define SRST_HDMIHDP1			561
+
+#define SRST_A_VO1USB_TOP_BIU		562
+#define SRST_H_VO1USB_TOP_BIU		563
+
+#define SRST_H_SDIO_BIU			564
+#define SRST_H_SDIO			565
+#define SRST_SDIO			566
+
+#define SRST_H_RGA3_BIU			567
+#define SRST_A_RGA3_BIU			568
+#define SRST_H_RGA3_1			569
+#define SRST_A_RGA3_1			570
+#define SRST_RGA3_1_CORE		571
+
+#define SRST_REF_PIPE_PHY0		572
+#define SRST_REF_PIPE_PHY1		573
+#define SRST_REF_PIPE_PHY2		574
+
+#define SRST_P_PHPTOP_CRU		575
+#define SRST_P_PCIE2_GRF0		576
+#define SRST_P_PCIE2_GRF1		577
+#define SRST_P_PCIE2_GRF2		578
+#define SRST_P_PCIE2_PHY0		579
+#define SRST_P_PCIE2_PHY1		580
+#define SRST_P_PCIE2_PHY2		581
+#define SRST_P_PCIE3_PHY		582
+#define SRST_P_APB2ASB_SLV_CHIP_TOP	583
+#define SRST_PCIE30_PHY			584
+
+#define SRST_H_PMU1_BIU			585
+#define SRST_P_PMU1_BIU			586
+#define SRST_H_PMU_CM0_BIU		587
+#define SRST_F_PMU_CM0_CORE		588
+#define SRST_T_PMU1_CM0_JTAG		589
+
+#define SRST_DDR_FAIL_SAFE		590
+#define SRST_P_CRU_PMU1			591
+#define SRST_P_PMU1_GRF			592
+#define SRST_P_PMU1_IOC			593
+#define SRST_P_PMU1WDT			594
+#define SRST_T_PMU1WDT			595
+#define SRST_P_PMU1TIMER		596
+#define SRST_PMU1TIMER0			597
+#define SRST_PMU1TIMER1			598
+#define SRST_P_PMU1PWM			599
+#define SRST_PMU1PWM			600
+
+#define SRST_P_I2C0			601
+#define SRST_I2C0			602
+#define SRST_S_UART0			603
+#define SRST_P_UART0			604
+#define SRST_H_I2S1_8CH			605
+#define SRST_M_I2S1_8CH_TX		606
+#define SRST_M_I2S1_8CH_RX		607
+#define SRST_H_PDM0			608
+#define SRST_PDM0			609
+
+#define SRST_H_VAD			610
+#define SRST_HDPTX0_INIT		611
+#define SRST_HDPTX0_CMN			612
+#define SRST_HDPTX0_LANE		613
+#define SRST_HDPTX1_INIT		614
+
+#define SRST_HDPTX1_CMN			615
+#define SRST_HDPTX1_LANE		616
+#define SRST_M_MIPI_DCPHY0		617
+#define SRST_S_MIPI_DCPHY0		618
+#define SRST_M_MIPI_DCPHY1		619
+#define SRST_S_MIPI_DCPHY1		620
+#define SRST_OTGPHY_U3_0		621
+#define SRST_OTGPHY_U3_1		622
+#define SRST_OTGPHY_U2_0		623
+#define SRST_OTGPHY_U2_1		624
+
+#define SRST_P_PMU0GRF			625
+#define SRST_P_PMU0IOC			626
+#define SRST_P_GPIO0			627
+#define SRST_GPIO0			628
+
+#define SRST_A_SECURE_NS_BIU		629
+#define SRST_H_SECURE_NS_BIU		630
+#define SRST_A_SECURE_S_BIU		631
+#define SRST_H_SECURE_S_BIU		632
+#define SRST_P_SECURE_S_BIU		633
+#define SRST_CRYPTO_CORE		634
+
+#define SRST_CRYPTO_PKA			635
+#define SRST_CRYPTO_RNG			636
+#define SRST_A_CRYPTO			637
+#define SRST_H_CRYPTO			638
+#define SRST_KEYLADDER_CORE		639
+#define SRST_KEYLADDER_RNG		640
+#define SRST_A_KEYLADDER		641
+#define SRST_H_KEYLADDER		642
+#define SRST_P_OTPC_S			643
+#define SRST_OTPC_S			644
+#define SRST_WDT_S			645
+
+#define SRST_T_WDT_S			646
+#define SRST_H_BOOTROM			647
+#define SRST_A_DCF			648
+#define SRST_P_DCF			649
+#define SRST_H_BOOTROM_NS		650
+#define SRST_P_KEYLADDER		651
+#define SRST_H_TRNG_S			652
+
+#define SRST_H_TRNG_NS			653
+#define SRST_D_SDMMC_BUFFER		654
+#define SRST_H_SDMMC			655
+#define SRST_H_SDMMC_BUFFER		656
+#define SRST_SDMMC			657
+#define SRST_P_TRNG_CHK			658
+#define SRST_TRNG_S			659
+
+#endif
-- 
2.35.1

