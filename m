Return-Path: <linux-clk+bounces-10601-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A51B894D098
	for <lists+linux-clk@lfdr.de>; Fri,  9 Aug 2024 14:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3024F1F215ED
	for <lists+linux-clk@lfdr.de>; Fri,  9 Aug 2024 12:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1CD194AF4;
	Fri,  9 Aug 2024 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="MR6Cokyo"
X-Original-To: linux-clk@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE9B194A57;
	Fri,  9 Aug 2024 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723208105; cv=pass; b=CUSaBUM7HwfOxEmJfAh9rAwCL63LD0P42/fKEy4ZG8zvbZ9mdjontskwOCcgnQnxoHDVU0s3NkikVL3eL45Bo8lCxLraRFGM1/6I0C683cu1Bt1LjgLBRI8xgOwmJ8Z6pTVBIfehnNCb82FbOfb6MUa080Z2obKR795eGdAwbzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723208105; c=relaxed/simple;
	bh=Gwvxmhkz/XuOB091neTtVlwiskyVTfNcrZ6CcTuIl7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAalV5tCGAH2bNnGZ7JGsiycgHX2o4GV1KkvnJTZCkezlisM8k27OnGHQU92SCUseNBdGyAC15DnXnsOV/k5W65jPtwNpq1MTfmP5RHxsW1kujIt/dNrLZK8XTaiQi3lA7mBVNQ1uCfHxEA/81l98/Bk4lHxv/vFku23nb86Q0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=MR6Cokyo; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723208080; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JOimK7OZFiVIyji85mUl5irvuuq7za5xHV+27SarBms5LmjD5EjODVD3L7HdEQh7sZZVvP/kbTpnZ+bISRL1OKmMDWrXKjFjWQ+2WZtrj9J1I6uSpAtrLn5jzJg6Hz2edkLqK4Q7/OCgMlttq8YRtbQN634guk7Kes1tA4K+gNA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723208080; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AkhRB6E1oCFRkddb5NVRF12R3cN5yeV5IRg9inC+XyU=; 
	b=A4fAae+dgXyNPHEZWo2ciEZ002UDFxmLMpJorqkXrf5ykDIyyLDVkTkBLLawQLYxdxPIW1CUut36B1J1xy8EhNSgoc6xkjP19SjMRC0FP6iTp00IEEoqMk20GPuejvHVbKTBrk+WR2AMDWmwlrXwC8L6AC7I1+f9n2302hme2As=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723208080;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AkhRB6E1oCFRkddb5NVRF12R3cN5yeV5IRg9inC+XyU=;
	b=MR6CokyoDPOUEXJiXL99zM3xAK9VOMK1H8M6XuWsQwujJwCclEqaapnsnayw5rUq
	z8gq2o1pOg4T1tN6aeiQcOKnmyStwkEVVl3ia+V/moknsMLxjMWXC2aA1nc08iwkF8l
	4Ur7pLhZwRbcUT1Na+DPEOILKA/p3oHUH27NO+b4=
Received: by mx.zohomail.com with SMTPS id 172320807767792.00643664061954;
	Fri, 9 Aug 2024 05:54:37 -0700 (PDT)
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
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: [PATCH v4 1/3] dt-bindings: reset: Add rk3576 reset definitions
Date: Fri,  9 Aug 2024 08:54:52 -0400
Message-ID: <20240809125553.3889-2-detlev.casanova@collabora.com>
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

Add reset ID defines for rk3576.

Compared to the downstream bindings this uses continous gapless
reset IDs starting at 1 instead of register offsets as IDs, as
introduced in the RK3588 bindings.
Thus all numbers are different between upstream and downstream,
but names are kept exactly the same.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../dt-bindings/reset/rockchip,rk3576-cru.h   | 564 ++++++++++++++++++
 1 file changed, 564 insertions(+)
 create mode 100644 include/dt-bindings/reset/rockchip,rk3576-cru.h

diff --git a/include/dt-bindings/reset/rockchip,rk3576-cru.h b/include/dt-bindings/reset/rockchip,rk3576-cru.h
new file mode 100644
index 0000000000000..8c968af4888d5
--- /dev/null
+++ b/include/dt-bindings/reset/rockchip,rk3576-cru.h
@@ -0,0 +1,564 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+* Copyright (c) 2023 Rockchip Electronics Co. Ltd.
+* Copyright (c) 2024 Collabora Ltd.
+*
+* Author: Elaine Zhang <zhangqing@rock-chips.com>
+* Author: Detlev Casanova <detlev.casanova@collabora.com>
+*/
+
+#ifndef _DT_BINDINGS_RESET_ROCKCHIP_RK3576_H
+#define _DT_BINDINGS_RESET_ROCKCHIP_RK3576_H
+
+#define SRST_A_TOP_BIU			0
+#define SRST_P_TOP_BIU			1
+#define SRST_A_TOP_MID_BIU		2
+#define SRST_A_SECURE_HIGH_BIU		3
+#define SRST_H_TOP_BIU			4
+
+#define SRST_H_VO0VOP_CHANNEL_BIU	5
+#define SRST_A_VO0VOP_CHANNEL_BIU	6
+
+#define SRST_BISRINTF			7
+
+#define SRST_H_AUDIO_BIU		8
+#define SRST_H_ASRC_2CH_0		9
+#define SRST_H_ASRC_2CH_1		10
+#define SRST_H_ASRC_4CH_0		11
+#define SRST_H_ASRC_4CH_1		12
+#define SRST_ASRC_2CH_0			13
+#define SRST_ASRC_2CH_1			14
+#define SRST_ASRC_4CH_0			15
+#define SRST_ASRC_4CH_1			16
+#define SRST_M_SAI0_8CH			17
+#define SRST_H_SAI0_8CH			18
+#define SRST_H_SPDIF_RX0		19
+#define SRST_M_SPDIF_RX0		20
+
+#define SRST_H_SPDIF_RX1		21
+#define SRST_M_SPDIF_RX1		22
+#define SRST_M_SAI1_8CH			23
+#define SRST_H_SAI1_8CH			24
+#define SRST_M_SAI2_2CH			25
+#define SRST_H_SAI2_2CH			26
+#define SRST_M_SAI3_2CH			27
+#define SRST_H_SAI3_2CH			28
+
+#define SRST_M_SAI4_2CH			29
+#define SRST_H_SAI4_2CH			30
+#define SRST_H_ACDCDIG_DSM		31
+#define SRST_M_ACDCDIG_DSM		32
+#define SRST_PDM1			33
+#define SRST_H_PDM1			34
+#define SRST_M_PDM1			35
+#define SRST_H_SPDIF_TX0		36
+#define SRST_M_SPDIF_TX0		37
+#define SRST_H_SPDIF_TX1		38
+#define SRST_M_SPDIF_TX1		39
+
+#define SRST_A_BUS_BIU			40
+#define SRST_P_BUS_BIU			41
+#define SRST_P_CRU			42
+#define SRST_H_CAN0			43
+#define SRST_CAN0			44
+#define SRST_H_CAN1			45
+#define SRST_CAN1			46
+#define SRST_P_INTMUX2BUS		47
+#define SRST_P_VCCIO_IOC		48
+#define SRST_H_BUS_BIU			49
+#define SRST_KEY_SHIFT			50
+
+#define SRST_P_I2C1			51
+#define SRST_P_I2C2			52
+#define SRST_P_I2C3			53
+#define SRST_P_I2C4			54
+#define SRST_P_I2C5			55
+#define SRST_P_I2C6			56
+#define SRST_P_I2C7			57
+#define SRST_P_I2C8			58
+#define SRST_P_I2C9			59
+#define SRST_P_WDT_BUSMCU		60
+#define SRST_T_WDT_BUSMCU		61
+#define SRST_A_GIC			62
+#define SRST_I2C1			63
+#define SRST_I2C2			64
+#define SRST_I2C3			65
+#define SRST_I2C4			66
+
+#define SRST_I2C5			67
+#define SRST_I2C6			68
+#define SRST_I2C7			69
+#define SRST_I2C8			70
+#define SRST_I2C9			71
+#define SRST_P_SARADC			72
+#define SRST_SARADC			73
+#define SRST_P_TSADC			74
+#define SRST_TSADC			75
+#define SRST_P_UART0			76
+#define SRST_P_UART2			77
+#define SRST_P_UART3			78
+#define SRST_P_UART4			79
+#define SRST_P_UART5			80
+#define SRST_P_UART6			81
+
+#define SRST_P_UART7			82
+#define SRST_P_UART8			83
+#define SRST_P_UART9			84
+#define SRST_P_UART10			85
+#define SRST_P_UART11			86
+#define SRST_S_UART0			87
+#define SRST_S_UART2			88
+#define SRST_S_UART3			89
+#define SRST_S_UART4			90
+#define SRST_S_UART5			91
+
+#define SRST_S_UART6			92
+#define SRST_S_UART7			93
+#define SRST_S_UART8			94
+#define SRST_S_UART9			95
+#define SRST_S_UART10			96
+#define SRST_S_UART11			97
+#define SRST_P_SPI0			98
+#define SRST_P_SPI1			99
+#define SRST_P_SPI2			100
+
+#define SRST_P_SPI3			101
+#define SRST_P_SPI4			102
+#define SRST_SPI0			103
+#define SRST_SPI1			104
+#define SRST_SPI2			105
+#define SRST_SPI3			106
+#define SRST_SPI4			107
+#define SRST_P_WDT0			108
+#define SRST_T_WDT0			109
+#define SRST_P_SYS_GRF			110
+#define SRST_P_PWM1			111
+#define SRST_PWM1			112
+
+#define SRST_P_BUSTIMER0		113
+#define SRST_P_BUSTIMER1		114
+#define SRST_TIMER0			115
+#define SRST_TIMER1			116
+#define SRST_TIMER2			117
+#define SRST_TIMER3			118
+#define SRST_TIMER4			119
+#define SRST_TIMER5			120
+#define SRST_P_BUSIOC			121
+#define SRST_P_MAILBOX0			122
+#define SRST_P_GPIO1			123
+
+#define SRST_GPIO1			124
+#define SRST_P_GPIO2			125
+#define SRST_GPIO2			126
+#define SRST_P_GPIO3			127
+#define SRST_GPIO3			128
+#define SRST_P_GPIO4			129
+#define SRST_GPIO4			130
+#define SRST_A_DECOM			131
+#define SRST_P_DECOM			132
+#define SRST_D_DECOM			133
+#define SRST_TIMER6			134
+#define SRST_TIMER7			135
+#define SRST_TIMER8			136
+#define SRST_TIMER9			137
+#define SRST_TIMER10			138
+
+#define SRST_TIMER11			139
+#define SRST_A_DMAC0			140
+#define SRST_A_DMAC1			141
+#define SRST_A_DMAC2			142
+#define SRST_A_SPINLOCK			143
+#define SRST_REF_PVTPLL_BUS		144
+#define SRST_H_I3C0			145
+#define SRST_H_I3C1			146
+#define SRST_H_BUS_CM0_BIU		147
+#define SRST_F_BUS_CM0_CORE		148
+#define SRST_T_BUS_CM0_JTAG		149
+
+#define SRST_P_INTMUX2PMU		150
+#define SRST_P_INTMUX2DDR		151
+#define SRST_P_PVTPLL_BUS		152
+#define SRST_P_PWM2			153
+#define SRST_PWM2			154
+#define SRST_FREQ_PWM1			155
+#define SRST_COUNTER_PWM1		156
+#define SRST_I3C0			157
+#define SRST_I3C1			158
+
+#define SRST_P_DDR_MON_CH0		159
+#define SRST_P_DDR_BIU			160
+#define SRST_P_DDR_UPCTL_CH0		161
+#define SRST_TM_DDR_MON_CH0		162
+#define SRST_A_DDR_BIU			163
+#define SRST_DFI_CH0			164
+#define SRST_DDR_MON_CH0		165
+#define SRST_P_DDR_HWLP_CH0		166
+#define SRST_P_DDR_MON_CH1		167
+#define SRST_P_DDR_HWLP_CH1		168
+
+#define SRST_P_DDR_UPCTL_CH1		169
+#define SRST_TM_DDR_MON_CH1		170
+#define SRST_DFI_CH1			171
+#define SRST_A_DDR01_MSCH0		172
+#define SRST_A_DDR01_MSCH1		173
+#define SRST_DDR_MON_CH1		174
+#define SRST_DDR_SCRAMBLE_CH0		175
+#define SRST_DDR_SCRAMBLE_CH1		176
+#define SRST_P_AHB2APB			177
+#define SRST_H_AHB2APB			178
+#define SRST_H_DDR_BIU			179
+#define SRST_F_DDR_CM0_CORE		180
+
+#define SRST_P_DDR01_MSCH0		181
+#define SRST_P_DDR01_MSCH1		182
+#define SRST_DDR_TIMER0			183
+#define SRST_DDR_TIMER1			184
+#define SRST_T_WDT_DDR			185
+#define SRST_P_WDT			186
+#define SRST_P_TIMER			187
+#define SRST_T_DDR_CM0_JTAG		188
+#define SRST_P_DDR_GRF			189
+
+#define SRST_DDR_UPCTL_CH0		190
+#define SRST_A_DDR_UPCTL_0_CH0		191
+#define SRST_A_DDR_UPCTL_1_CH0		192
+#define SRST_A_DDR_UPCTL_2_CH0		193
+#define SRST_A_DDR_UPCTL_3_CH0		194
+#define SRST_A_DDR_UPCTL_4_CH0		195
+
+#define SRST_DDR_UPCTL_CH1		196
+#define SRST_A_DDR_UPCTL_0_CH1		197
+#define SRST_A_DDR_UPCTL_1_CH1		198
+#define SRST_A_DDR_UPCTL_2_CH1		199
+#define SRST_A_DDR_UPCTL_3_CH1		200
+#define SRST_A_DDR_UPCTL_4_CH1		201
+
+#define SRST_REF_PVTPLL_DDR		202
+#define SRST_P_PVTPLL_DDR		203
+
+#define SRST_A_RKNN0			204
+#define SRST_A_RKNN0_BIU		205
+#define SRST_L_RKNN0_BIU		206
+
+#define SRST_A_RKNN1			207
+#define SRST_A_RKNN1_BIU		208
+#define SRST_L_RKNN1_BIU		209
+
+#define SRST_NPU_DAP			210
+#define SRST_L_NPUSUBSYS_BIU		211
+#define SRST_P_NPUTOP_BIU		212
+#define SRST_P_NPU_TIMER		213
+#define SRST_NPUTIMER0			214
+#define SRST_NPUTIMER1			215
+#define SRST_P_NPU_WDT			216
+#define SRST_T_NPU_WDT			217
+
+#define SRST_A_RKNN_CBUF		218
+#define SRST_A_RVCORE0			219
+#define SRST_P_NPU_GRF			220
+#define SRST_P_PVTPLL_NPU		221
+#define SRST_NPU_PVTPLL			222
+#define SRST_H_NPU_CM0_BIU		223
+#define SRST_F_NPU_CM0_CORE		224
+#define SRST_T_NPU_CM0_JTAG		225
+#define SRST_A_RKNNTOP_BIU		226
+#define SRST_H_RKNN_CBUF		227
+#define SRST_H_RKNNTOP_BIU		228
+
+#define SRST_H_NVM_BIU			229
+#define SRST_A_NVM_BIU			230
+#define SRST_S_FSPI			231
+#define SRST_H_FSPI			232
+#define SRST_C_EMMC			233
+#define SRST_H_EMMC			234
+#define SRST_A_EMMC			235
+#define SRST_B_EMMC			236
+#define SRST_T_EMMC			237
+
+#define SRST_P_GRF			238
+#define SRST_P_PHP_BIU			239
+#define SRST_A_PHP_BIU			240
+#define SRST_P_PCIE0			241
+#define SRST_PCIE0_POWER_UP		242
+
+#define SRST_A_USB3OTG1			243
+#define SRST_A_MMU0			244
+#define SRST_A_SLV_MMU0			245
+#define SRST_A_MMU1			246
+
+#define SRST_A_SLV_MMU1			247
+#define SRST_P_PCIE1			248
+#define SRST_PCIE1_POWER_UP		249
+
+#define SRST_RXOOB0			250
+#define SRST_RXOOB1			251
+#define SRST_PMALIVE0			252
+#define SRST_PMALIVE1			253
+#define SRST_A_SATA0			254
+#define SRST_A_SATA1			255
+#define SRST_ASIC1			256
+#define SRST_ASIC0			257
+
+#define SRST_P_CSIDPHY1			258
+#define SRST_SCAN_CSIDPHY1		259
+
+#define SRST_P_SDGMAC_GRF		260
+#define SRST_P_SDGMAC_BIU		261
+#define SRST_A_SDGMAC_BIU		262
+#define SRST_H_SDGMAC_BIU		263
+#define SRST_A_GMAC0			264
+#define SRST_A_GMAC1			265
+#define SRST_P_GMAC0			266
+#define SRST_P_GMAC1			267
+#define SRST_H_SDIO			268
+
+#define SRST_H_SDMMC0			269
+#define SRST_S_FSPI1			270
+#define SRST_H_FSPI1			271
+#define SRST_A_DSMC_BIU			272
+#define SRST_A_DSMC			273
+#define SRST_P_DSMC			274
+#define SRST_H_HSGPIO			275
+#define SRST_HSGPIO			276
+#define SRST_A_HSGPIO			277
+
+#define SRST_H_RKVDEC			278
+#define SRST_H_RKVDEC_BIU		279
+#define SRST_A_RKVDEC_BIU		280
+#define SRST_RKVDEC_HEVC_CA		281
+#define SRST_RKVDEC_CORE		282
+
+#define SRST_A_USB_BIU			283
+#define SRST_P_USBUFS_BIU		284
+#define SRST_A_USB3OTG0			285
+#define SRST_A_UFS_BIU			286
+#define SRST_A_MMU2			287
+#define SRST_A_SLV_MMU2			288
+#define SRST_A_UFS_SYS			289
+
+#define SRST_A_UFS			290
+#define SRST_P_USBUFS_GRF		291
+#define SRST_P_UFS_GRF			292
+
+#define SRST_H_VPU_BIU			293
+#define SRST_A_JPEG_BIU			294
+#define SRST_A_RGA_BIU			295
+#define SRST_A_VDPP_BIU			296
+#define SRST_A_EBC_BIU			297
+#define SRST_H_RGA2E_0			298
+#define SRST_A_RGA2E_0			299
+#define SRST_CORE_RGA2E_0		300
+
+#define SRST_A_JPEG			301
+#define SRST_H_JPEG			302
+#define SRST_H_VDPP			303
+#define SRST_A_VDPP			304
+#define SRST_CORE_VDPP			305
+#define SRST_H_RGA2E_1			306
+#define SRST_A_RGA2E_1			307
+#define SRST_CORE_RGA2E_1		308
+#define SRST_H_EBC			309
+#define SRST_A_EBC			310
+#define SRST_D_EBC			311
+
+#define SRST_H_VEPU0_BIU		312
+#define SRST_A_VEPU0_BIU		313
+#define SRST_H_VEPU0			314
+#define SRST_A_VEPU0			315
+#define SRST_VEPU0_CORE			316
+
+#define SRST_A_VI_BIU			317
+#define SRST_H_VI_BIU			318
+#define SRST_P_VI_BIU			319
+#define SRST_D_VICAP			320
+#define SRST_A_VICAP			321
+#define SRST_H_VICAP			322
+#define SRST_ISP0			323
+#define SRST_ISP0_VICAP			324
+
+#define SRST_CORE_VPSS			325
+#define SRST_P_CSI_HOST_0		326
+#define SRST_P_CSI_HOST_1		327
+#define SRST_P_CSI_HOST_2		328
+#define SRST_P_CSI_HOST_3		329
+#define SRST_P_CSI_HOST_4		330
+
+#define SRST_CIFIN			331
+#define SRST_VICAP_I0CLK		332
+#define SRST_VICAP_I1CLK		333
+#define SRST_VICAP_I2CLK		334
+#define SRST_VICAP_I3CLK		335
+#define SRST_VICAP_I4CLK		336
+
+#define SRST_A_VOP_BIU			337
+#define SRST_A_VOP2_BIU			338
+#define SRST_H_VOP_BIU			339
+#define SRST_P_VOP_BIU			340
+#define SRST_H_VOP			341
+#define SRST_A_VOP			342
+#define SRST_D_VP0			343
+
+#define SRST_D_VP1			344
+#define SRST_D_VP2			345
+#define SRST_P_VOP2_BIU			346
+#define SRST_P_VOPGRF			347
+
+#define SRST_H_VO0_BIU			348
+#define SRST_P_VO0_BIU			349
+#define SRST_A_HDCP0_BIU		350
+#define SRST_P_VO0_GRF			351
+#define SRST_A_HDCP0			352
+#define SRST_H_HDCP0			353
+#define SRST_HDCP0			354
+
+#define SRST_P_DSIHOST0			355
+#define SRST_DSIHOST0			356
+#define SRST_P_HDMITX0			357
+#define SRST_HDMITX0_REF		358
+#define SRST_P_EDP0			359
+#define SRST_EDP0_24M			360
+
+#define SRST_M_SAI5_8CH			361
+#define SRST_H_SAI5_8CH			362
+#define SRST_M_SAI6_8CH			363
+#define SRST_H_SAI6_8CH			364
+#define SRST_H_SPDIF_TX2		365
+#define SRST_M_SPDIF_TX2		366
+#define SRST_H_SPDIF_RX2		367
+#define SRST_M_SPDIF_RX2		368
+
+#define SRST_H_SAI8_8CH			369
+#define SRST_M_SAI8_8CH			370
+
+#define SRST_H_VO1_BIU			371
+#define SRST_P_VO1_BIU			372
+#define SRST_M_SAI7_8CH			373
+#define SRST_H_SAI7_8CH			374
+#define SRST_H_SPDIF_TX3		375
+#define SRST_H_SPDIF_TX4		376
+#define SRST_H_SPDIF_TX5		377
+#define SRST_M_SPDIF_TX3		378
+
+#define SRST_DP0			379
+#define SRST_P_VO1_GRF			380
+#define SRST_A_HDCP1_BIU		381
+#define SRST_A_HDCP1			382
+#define SRST_H_HDCP1			383
+#define SRST_HDCP1			384
+#define SRST_H_SAI9_8CH			385
+#define SRST_M_SAI9_8CH			386
+#define SRST_M_SPDIF_TX4		387
+#define SRST_M_SPDIF_TX5		388
+
+#define SRST_GPU			389
+#define SRST_A_S_GPU_BIU		390
+#define SRST_A_M0_GPU_BIU		391
+#define SRST_P_GPU_BIU			392
+#define SRST_P_GPU_GRF			393
+#define SRST_GPU_PVTPLL			394
+#define SRST_P_PVTPLL_GPU		395
+
+#define SRST_A_CENTER_BIU		396
+#define SRST_A_DMA2DDR			397
+#define SRST_A_DDR_SHAREMEM		398
+#define SRST_A_DDR_SHAREMEM_BIU		399
+#define SRST_H_CENTER_BIU		400
+#define SRST_P_CENTER_GRF		401
+#define SRST_P_DMA2DDR			402
+#define SRST_P_SHAREMEM			403
+#define SRST_P_CENTER_BIU		404
+
+#define SRST_LINKSYM_HDMITXPHY0		405
+
+#define SRST_DP0_PIXELCLK		406
+#define SRST_PHY_DP0_TX			407
+#define SRST_DP1_PIXELCLK		408
+#define SRST_DP2_PIXELCLK		409
+
+#define SRST_H_VEPU1_BIU		410
+#define SRST_A_VEPU1_BIU		411
+#define SRST_H_VEPU1			412
+#define SRST_A_VEPU1			413
+#define SRST_VEPU1_CORE			414
+
+#define SRST_P_PHPPHY_CRU		415
+#define SRST_P_APB2ASB_SLV_CHIP_TOP	416
+#define SRST_P_PCIE2_COMBOPHY0		417
+#define SRST_P_PCIE2_COMBOPHY0_GRF	418
+#define SRST_P_PCIE2_COMBOPHY1		419
+#define SRST_P_PCIE2_COMBOPHY1_GRF	420
+
+#define SRST_PCIE0_PIPE_PHY		421
+#define SRST_PCIE1_PIPE_PHY		422
+
+#define SRST_H_CRYPTO_NS		423
+#define SRST_H_TRNG_NS			424
+#define SRST_P_OTPC_NS			425
+#define SRST_OTPC_NS			426
+
+#define SRST_P_HDPTX_GRF		427
+#define SRST_P_HDPTX_APB		428
+#define SRST_P_MIPI_DCPHY		429
+#define SRST_P_DCPHY_GRF		430
+#define SRST_P_BOT0_APB2ASB		431
+#define SRST_P_BOT1_APB2ASB		432
+#define SRST_USB2DEBUG			433
+#define SRST_P_CSIPHY_GRF		434
+#define SRST_P_CSIPHY			435
+#define SRST_P_USBPHY_GRF_0		436
+#define SRST_P_USBPHY_GRF_1		437
+#define SRST_P_USBDP_GRF		438
+#define SRST_P_USBDPPHY			439
+#define SRST_USBDP_COMBO_PHY_INIT	440
+
+#define SRST_USBDP_COMBO_PHY_CMN	441
+#define SRST_USBDP_COMBO_PHY_LANE	442
+#define SRST_USBDP_COMBO_PHY_PCS	443
+#define SRST_M_MIPI_DCPHY		444
+#define SRST_S_MIPI_DCPHY		445
+#define SRST_SCAN_CSIPHY		446
+#define SRST_P_VCCIO6_IOC		447
+#define SRST_OTGPHY_0			448
+#define SRST_OTGPHY_1			449
+#define SRST_HDPTX_INIT			450
+#define SRST_HDPTX_CMN			451
+#define SRST_HDPTX_LANE			452
+#define SRST_HDMITXHPD			453
+
+#define SRST_MPHY_INIT			454
+#define SRST_P_MPHY_GRF			455
+#define SRST_P_VCCIO7_IOC		456
+
+#define SRST_H_PMU1_BIU			457
+#define SRST_P_PMU1_NIU			458
+#define SRST_H_PMU_CM0_BIU		459
+#define SRST_PMU_CM0_CORE		460
+#define SRST_PMU_CM0_JTAG		461
+
+#define SRST_P_CRU_PMU1			462
+#define SRST_P_PMU1_GRF			463
+#define SRST_P_PMU1_IOC			464
+#define SRST_P_PMU1WDT			465
+#define SRST_T_PMU1WDT			466
+#define SRST_P_PMUTIMER			467
+#define SRST_PMUTIMER0			468
+#define SRST_PMUTIMER1			469
+#define SRST_P_PMU1PWM			470
+#define SRST_PMU1PWM			471
+
+#define SRST_P_I2C0			472
+#define SRST_I2C0			473
+#define SRST_S_UART1			474
+#define SRST_P_UART1			475
+#define SRST_PDM0			476
+#define SRST_H_PDM0			477
+
+#define SRST_M_PDM0			478
+#define SRST_H_VAD			479
+
+#define SRST_P_PMU0GRF			480
+#define SRST_P_PMU0IOC			481
+#define SRST_P_GPIO0			482
+#define SRST_DB_GPIO0			483
+
+#endif
-- 
2.46.0


