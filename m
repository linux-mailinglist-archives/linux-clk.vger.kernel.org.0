Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D1A3F2ACD
	for <lists+linux-clk@lfdr.de>; Fri, 20 Aug 2021 13:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239307AbhHTLRb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 Aug 2021 07:17:31 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:39538 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S239271AbhHTLRa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Aug 2021 07:17:30 -0400
X-UUID: 52ea745eef6b4113a268087d53dbbe3c-20210820
X-UUID: 52ea745eef6b4113a268087d53dbbe3c-20210820
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1833602732; Fri, 20 Aug 2021 19:16:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 19:16:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 19:16:46 +0800
From:   Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [v2 02/24] clk: mediatek: Add dt-bindings of MT8195 clocks
Date:   Fri, 20 Aug 2021 19:14:42 +0800
Message-ID: <20210820111504.350-3-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210820111504.350-1-chun-jie.chen@mediatek.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MT8195 clock dt-bindings, include topckgen, apmixedsys,
infracfg_ao, pericfg_ao and subsystem clocks.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 include/dt-bindings/clock/mt8195-clk.h | 864 +++++++++++++++++++++++++
 1 file changed, 864 insertions(+)
 create mode 100644 include/dt-bindings/clock/mt8195-clk.h

diff --git a/include/dt-bindings/clock/mt8195-clk.h b/include/dt-bindings/clock/mt8195-clk.h
new file mode 100644
index 000000000000..95cf812a0b37
--- /dev/null
+++ b/include/dt-bindings/clock/mt8195-clk.h
@@ -0,0 +1,864 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MT8195_H
+#define _DT_BINDINGS_CLK_MT8195_H
+
+/* TOPCKGEN */
+
+#define CLK_TOP_AXI			0
+#define CLK_TOP_SPM			1
+#define CLK_TOP_SCP			2
+#define CLK_TOP_BUS_AXIMEM		3
+#define CLK_TOP_VPP			4
+#define CLK_TOP_ETHDR			5
+#define CLK_TOP_IPE			6
+#define CLK_TOP_CAM			7
+#define CLK_TOP_CCU			8
+#define CLK_TOP_IMG			9
+#define CLK_TOP_CAMTM			10
+#define CLK_TOP_DSP			11
+#define CLK_TOP_DSP1			12
+#define CLK_TOP_DSP2			13
+#define CLK_TOP_DSP3			14
+#define CLK_TOP_DSP4			15
+#define CLK_TOP_DSP5			16
+#define CLK_TOP_DSP6			17
+#define CLK_TOP_DSP7			18
+#define CLK_TOP_IPU_IF			19
+#define CLK_TOP_MFG_CORE_TMP		20
+#define CLK_TOP_CAMTG			21
+#define CLK_TOP_CAMTG2			22
+#define CLK_TOP_CAMTG3			23
+#define CLK_TOP_CAMTG4			24
+#define CLK_TOP_CAMTG5			25
+#define CLK_TOP_UART			26
+#define CLK_TOP_SPI			27
+#define CLK_TOP_SPIS			28
+#define CLK_TOP_MSDC50_0_HCLK		29
+#define CLK_TOP_MSDC50_0		30
+#define CLK_TOP_MSDC30_1		31
+#define CLK_TOP_MSDC30_2		32
+#define CLK_TOP_INTDIR			33
+#define CLK_TOP_AUD_INTBUS		34
+#define CLK_TOP_AUDIO_H			35
+#define CLK_TOP_PWRAP_ULPOSC		36
+#define CLK_TOP_ATB			37
+#define CLK_TOP_PWRMCU			38
+#define CLK_TOP_DP			39
+#define CLK_TOP_EDP			40
+#define CLK_TOP_DPI			41
+#define CLK_TOP_DISP_PWM0		42
+#define CLK_TOP_DISP_PWM1		43
+#define CLK_TOP_USB_TOP			44
+#define CLK_TOP_SSUSB_XHCI		45
+#define CLK_TOP_USB_TOP_1P		46
+#define CLK_TOP_SSUSB_XHCI_1P		47
+#define CLK_TOP_USB_TOP_2P		48
+#define CLK_TOP_SSUSB_XHCI_2P		49
+#define CLK_TOP_USB_TOP_3P		50
+#define CLK_TOP_SSUSB_XHCI_3P		51
+#define CLK_TOP_I2C			52
+#define CLK_TOP_SENINF			53
+#define CLK_TOP_SENINF1			54
+#define CLK_TOP_SENINF2			55
+#define CLK_TOP_SENINF3			56
+#define CLK_TOP_GCPU			57
+#define CLK_TOP_DXCC			58
+#define CLK_TOP_DPMAIF_MAIN		59
+#define CLK_TOP_AES_UFSFDE		60
+#define CLK_TOP_UFS			61
+#define CLK_TOP_UFS_TICK1US		62
+#define CLK_TOP_UFS_MP_SAP_CFG		63
+#define CLK_TOP_VENC			64
+#define CLK_TOP_VDEC			65
+#define CLK_TOP_PWM			66
+#define CLK_TOP_MCUPM			67
+#define CLK_TOP_SPMI_P_MST		68
+#define CLK_TOP_SPMI_M_MST		69
+#define CLK_TOP_DVFSRC			70
+#define CLK_TOP_TL			71
+#define CLK_TOP_TL_P1			72
+#define CLK_TOP_AES_MSDCFDE		73
+#define CLK_TOP_DSI_OCC			74
+#define CLK_TOP_WPE_VPP			75
+#define CLK_TOP_HDCP			76
+#define CLK_TOP_HDCP_24M		77
+#define CLK_TOP_HD20_DACR_REF_CLK	78
+#define CLK_TOP_HD20_HDCP_CCLK		79
+#define CLK_TOP_HDMI_XTAL		80
+#define CLK_TOP_HDMI_APB		81
+#define CLK_TOP_SNPS_ETH_250M		82
+#define CLK_TOP_SNPS_ETH_62P4M_PTP	83
+#define CLK_TOP_SNPS_ETH_50M_RMII	84
+#define CLK_TOP_DGI_OUT			85
+#define CLK_TOP_NNA0			86
+#define CLK_TOP_NNA1			87
+#define CLK_TOP_ADSP			88
+#define CLK_TOP_ASM_H			89
+#define CLK_TOP_ASM_M			90
+#define CLK_TOP_ASM_L			91
+#define CLK_TOP_APLL1			92
+#define CLK_TOP_APLL2			93
+#define CLK_TOP_APLL3			94
+#define CLK_TOP_APLL4			95
+#define CLK_TOP_APLL5			96
+#define CLK_TOP_I2SO1_MCK		97
+#define CLK_TOP_I2SO2_MCK		98
+#define CLK_TOP_I2SI1_MCK		99
+#define CLK_TOP_I2SI2_MCK		100
+#define CLK_TOP_DPTX_MCK		101
+#define CLK_TOP_AUD_IEC_CLK		102
+#define CLK_TOP_A1SYS_HP		103
+#define CLK_TOP_A2SYS_HF		104
+#define CLK_TOP_A3SYS_HF		105
+#define CLK_TOP_A4SYS_HF		106
+#define CLK_TOP_SPINFI_BCLK		107
+#define CLK_TOP_NFI1X			108
+#define CLK_TOP_ECC			109
+#define CLK_TOP_AUDIO_LOCAL_BUS		110
+#define CLK_TOP_SPINOR			111
+#define CLK_TOP_DVIO_DGI_REF		112
+#define CLK_TOP_ULPOSC			113
+#define CLK_TOP_ULPOSC_CORE		114
+#define CLK_TOP_SRCK			115
+#define CLK_TOP_MFG_CK_FAST_REF		116
+#define CLK_TOP_CLK26M_D2		117
+#define CLK_TOP_CLK26M_D52		118
+#define CLK_TOP_IN_DGI			119
+#define CLK_TOP_IN_DGI_D2		120
+#define CLK_TOP_IN_DGI_D4		121
+#define CLK_TOP_IN_DGI_D6		122
+#define CLK_TOP_IN_DGI_D8		123
+#define CLK_TOP_MAINPLL_D3		124
+#define CLK_TOP_MAINPLL_D4		125
+#define CLK_TOP_MAINPLL_D4_D2		126
+#define CLK_TOP_MAINPLL_D4_D4		127
+#define CLK_TOP_MAINPLL_D4_D8		128
+#define CLK_TOP_MAINPLL_D5		129
+#define CLK_TOP_MAINPLL_D5_D2		130
+#define CLK_TOP_MAINPLL_D5_D4		131
+#define CLK_TOP_MAINPLL_D5_D8		132
+#define CLK_TOP_MAINPLL_D6		133
+#define CLK_TOP_MAINPLL_D6_D2		134
+#define CLK_TOP_MAINPLL_D6_D4		135
+#define CLK_TOP_MAINPLL_D6_D8		136
+#define CLK_TOP_MAINPLL_D7		137
+#define CLK_TOP_MAINPLL_D7_D2		138
+#define CLK_TOP_MAINPLL_D7_D4		139
+#define CLK_TOP_MAINPLL_D7_D8		140
+#define CLK_TOP_MAINPLL_D9		141
+#define CLK_TOP_UNIVPLL_D2		142
+#define CLK_TOP_UNIVPLL_D3		143
+#define CLK_TOP_UNIVPLL_D4		144
+#define CLK_TOP_UNIVPLL_D4_D2		145
+#define CLK_TOP_UNIVPLL_D4_D4		146
+#define CLK_TOP_UNIVPLL_D4_D8		147
+#define CLK_TOP_UNIVPLL_D5		148
+#define CLK_TOP_UNIVPLL_D5_D2		149
+#define CLK_TOP_UNIVPLL_D5_D4		150
+#define CLK_TOP_UNIVPLL_D5_D8		151
+#define CLK_TOP_UNIVPLL_D6		152
+#define CLK_TOP_UNIVPLL_D6_D2		153
+#define CLK_TOP_UNIVPLL_D6_D4		154
+#define CLK_TOP_UNIVPLL_D6_D8		155
+#define CLK_TOP_UNIVPLL_D6_D16		156
+#define CLK_TOP_UNIVPLL_D7		157
+#define CLK_TOP_UNIVPLL_192M		158
+#define CLK_TOP_UNIVPLL_192M_D4		159
+#define CLK_TOP_UNIVPLL_192M_D8		160
+#define CLK_TOP_UNIVPLL_192M_D16	161
+#define CLK_TOP_UNIVPLL_192M_D32	162
+#define CLK_TOP_APLL1_D3		163
+#define CLK_TOP_APLL1_D4		164
+#define CLK_TOP_APLL2_D3		165
+#define CLK_TOP_APLL2_D4		166
+#define CLK_TOP_APLL3_D4		167
+#define CLK_TOP_APLL4_D4		168
+#define CLK_TOP_APLL5_D4		169
+#define CLK_TOP_HDMIRX_APLL_D3		170
+#define CLK_TOP_HDMIRX_APLL_D4		171
+#define CLK_TOP_HDMIRX_APLL_D6		172
+#define CLK_TOP_MMPLL_D4		173
+#define CLK_TOP_MMPLL_D4_D2		174
+#define CLK_TOP_MMPLL_D4_D4		175
+#define CLK_TOP_MMPLL_D5		176
+#define CLK_TOP_MMPLL_D5_D2		177
+#define CLK_TOP_MMPLL_D5_D4		178
+#define CLK_TOP_MMPLL_D6		179
+#define CLK_TOP_MMPLL_D6_D2		180
+#define CLK_TOP_MMPLL_D7		181
+#define CLK_TOP_MMPLL_D9		182
+#define CLK_TOP_TVDPLL1_D2		183
+#define CLK_TOP_TVDPLL1_D4		184
+#define CLK_TOP_TVDPLL1_D8		185
+#define CLK_TOP_TVDPLL1_D16		186
+#define CLK_TOP_TVDPLL2_D2		187
+#define CLK_TOP_TVDPLL2_D4		188
+#define CLK_TOP_TVDPLL2_D8		189
+#define CLK_TOP_TVDPLL2_D16		190
+#define CLK_TOP_MSDCPLL_D2		191
+#define CLK_TOP_MSDCPLL_D4		192
+#define CLK_TOP_MSDCPLL_D16		193
+#define CLK_TOP_ETHPLL_D2		194
+#define CLK_TOP_ETHPLL_D8		195
+#define CLK_TOP_ETHPLL_D10		196
+#define CLK_TOP_DGIPLL_D2		197
+#define CLK_TOP_ULPOSC1			198
+#define CLK_TOP_ULPOSC1_D2		199
+#define CLK_TOP_ULPOSC1_D4		200
+#define CLK_TOP_ULPOSC1_D7		201
+#define CLK_TOP_ULPOSC1_D8		202
+#define CLK_TOP_ULPOSC1_D10		203
+#define CLK_TOP_ULPOSC1_D16		204
+#define CLK_TOP_ULPOSC2			205
+#define CLK_TOP_ADSPPLL_D2		206
+#define CLK_TOP_ADSPPLL_D4		207
+#define CLK_TOP_ADSPPLL_D8		208
+#define CLK_TOP_MEM_466M		209
+#define CLK_TOP_MPHONE_SLAVE_B		210
+#define CLK_TOP_PEXTP_PIPE		211
+#define CLK_TOP_UFS_RX_SYMBOL		212
+#define CLK_TOP_UFS_TX_SYMBOL		213
+#define CLK_TOP_SSUSB_U3PHY_P1_P_P0	214
+#define CLK_TOP_UFS_RX_SYMBOL1		215
+#define CLK_TOP_FPC			216
+#define CLK_TOP_HDMIRX_P		217
+#define CLK_TOP_APLL12_DIV0		218
+#define CLK_TOP_APLL12_DIV1		219
+#define CLK_TOP_APLL12_DIV2		220
+#define CLK_TOP_APLL12_DIV3		221
+#define CLK_TOP_APLL12_DIV4		222
+#define CLK_TOP_APLL12_DIV9		223
+#define CLK_TOP_CFG_VPP0		224
+#define CLK_TOP_CFG_VPP1		225
+#define CLK_TOP_CFG_VDO0		226
+#define CLK_TOP_CFG_VDO1		227
+#define CLK_TOP_CFG_UNIPLL_SES		228
+#define CLK_TOP_CFG_26M_VPP0		229
+#define CLK_TOP_CFG_26M_VPP1		230
+#define CLK_TOP_CFG_26M_AUD		231
+#define CLK_TOP_CFG_AXI_EAST		232
+#define CLK_TOP_CFG_AXI_EAST_NORTH	233
+#define CLK_TOP_CFG_AXI_NORTH		234
+#define CLK_TOP_CFG_AXI_SOUTH		235
+#define CLK_TOP_CFG_EXT_TEST		236
+#define CLK_TOP_SSUSB_REF		237
+#define CLK_TOP_SSUSB_PHY_REF		238
+#define CLK_TOP_SSUSB_P1_REF		239
+#define CLK_TOP_SSUSB_PHY_P1_REF	240
+#define CLK_TOP_SSUSB_P2_REF		241
+#define CLK_TOP_SSUSB_PHY_P2_REF	242
+#define CLK_TOP_SSUSB_P3_REF		243
+#define CLK_TOP_SSUSB_PHY_P3_REF	244
+#define CLK_TOP_NR_CLK			245
+
+/* INFRACFG_AO */
+
+#define CLK_INFRA_AO_PMIC_TMR		0
+#define CLK_INFRA_AO_PMIC_AP		1
+#define CLK_INFRA_AO_PMIC_MD		2
+#define CLK_INFRA_AO_PMIC_CONN		3
+#define CLK_INFRA_AO_SEJ		4
+#define CLK_INFRA_AO_APXGPT		5
+#define CLK_INFRA_AO_GCE		6
+#define CLK_INFRA_AO_GCE2		7
+#define CLK_INFRA_AO_THERM		8
+#define CLK_INFRA_AO_PWM_H		9
+#define CLK_INFRA_AO_PWM1		10
+#define CLK_INFRA_AO_PWM2		11
+#define CLK_INFRA_AO_PWM3		12
+#define CLK_INFRA_AO_PWM4		13
+#define CLK_INFRA_AO_PWM		14
+#define CLK_INFRA_AO_UART0		15
+#define CLK_INFRA_AO_UART1		16
+#define CLK_INFRA_AO_UART2		17
+#define CLK_INFRA_AO_UART3		18
+#define CLK_INFRA_AO_UART4		19
+#define CLK_INFRA_AO_GCE_26M		20
+#define CLK_INFRA_AO_CQ_DMA_FPC		21
+#define CLK_INFRA_AO_UART5		22
+#define CLK_INFRA_AO_HDMI_26M		23
+#define CLK_INFRA_AO_SPI0		24
+#define CLK_INFRA_AO_MSDC0		25
+#define CLK_INFRA_AO_MSDC1		26
+#define CLK_INFRA_AO_CG1_MSDC2		27
+#define CLK_INFRA_AO_MSDC0_SRC		28
+#define CLK_INFRA_AO_TRNG		29
+#define CLK_INFRA_AO_AUXADC		30
+#define CLK_INFRA_AO_CPUM		31
+#define CLK_INFRA_AO_HDMI_32K		32
+#define CLK_INFRA_AO_CEC_66M_H		33
+#define CLK_INFRA_AO_IRRX		34
+#define CLK_INFRA_AO_PCIE_TL_26M	35
+#define CLK_INFRA_AO_MSDC1_SRC		36
+#define CLK_INFRA_AO_CEC_66M_B		37
+#define CLK_INFRA_AO_PCIE_TL_96M	38
+#define CLK_INFRA_AO_DEVICE_APC		39
+#define CLK_INFRA_AO_ECC_66M_H		40
+#define CLK_INFRA_AO_DEBUGSYS		41
+#define CLK_INFRA_AO_AUDIO		42
+#define CLK_INFRA_AO_PCIE_TL_32K	43
+#define CLK_INFRA_AO_DBG_TRACE		44
+#define CLK_INFRA_AO_DRAMC_F26M		45
+#define CLK_INFRA_AO_IRTX		46
+#define CLK_INFRA_AO_SSUSB		47
+#define CLK_INFRA_AO_DISP_PWM		48
+#define CLK_INFRA_AO_CLDMA_B		49
+#define CLK_INFRA_AO_AUDIO_26M_B	50
+#define CLK_INFRA_AO_SPI1		51
+#define CLK_INFRA_AO_SPI2		52
+#define CLK_INFRA_AO_SPI3		53
+#define CLK_INFRA_AO_UNIPRO_SYS		54
+#define CLK_INFRA_AO_UNIPRO_TICK	55
+#define CLK_INFRA_AO_UFS_MP_SAP_B	56
+#define CLK_INFRA_AO_PWRMCU		57
+#define CLK_INFRA_AO_PWRMCU_BUS_H	58
+#define CLK_INFRA_AO_APDMA_B		59
+#define CLK_INFRA_AO_SPI4		60
+#define CLK_INFRA_AO_SPI5		61
+#define CLK_INFRA_AO_CQ_DMA		62
+#define CLK_INFRA_AO_AES_UFSFDE		63
+#define CLK_INFRA_AO_AES		64
+#define CLK_INFRA_AO_UFS_TICK		65
+#define CLK_INFRA_AO_SSUSB_XHCI		66
+#define CLK_INFRA_AO_MSDC0_SELF		67
+#define CLK_INFRA_AO_MSDC1_SELF		68
+#define CLK_INFRA_AO_MSDC2_SELF		69
+#define CLK_INFRA_AO_I2S_DMA		70
+#define CLK_INFRA_AO_AP_MSDC0		71
+#define CLK_INFRA_AO_MD_MSDC0		72
+#define CLK_INFRA_AO_CG3_MSDC2		73
+#define CLK_INFRA_AO_GCPU		74
+#define CLK_INFRA_AO_PCIE_PERI_26M	75
+#define CLK_INFRA_AO_GCPU_66M_B		76
+#define CLK_INFRA_AO_GCPU_133M_B	77
+#define CLK_INFRA_AO_DISP_PWM1		78
+#define CLK_INFRA_AO_FBIST2FPC		79
+#define CLK_INFRA_AO_DEVICE_APC_SYNC	80
+#define CLK_INFRA_AO_PCIE_P1_PERI_26M	81
+#define CLK_INFRA_AO_SPIS0		82
+#define CLK_INFRA_AO_SPIS1		83
+#define CLK_INFRA_AO_133M_M_PERI	84
+#define CLK_INFRA_AO_66M_M_PERI		85
+#define CLK_INFRA_AO_PCIE_PL_P_250M_P0	86
+#define CLK_INFRA_AO_PCIE_PL_P_250M_P1	87
+#define CLK_INFRA_AO_PCIE_P1_TL_96M	88
+#define CLK_INFRA_AO_AES_MSDCFDE_0P	89
+#define CLK_INFRA_AO_UFS_TX_SYMBOL	90
+#define CLK_INFRA_AO_UFS_RX_SYMBOL	91
+#define CLK_INFRA_AO_UFS_RX_SYMBOL1	92
+#define CLK_INFRA_AO_PERI_UFS_MEM_SUB	93
+#define CLK_INFRA_AO_NR_CLK		94
+
+/* APMIXEDSYS */
+
+#define CLK_APMIXED_NNAPLL		0
+#define CLK_APMIXED_RESPLL		1
+#define CLK_APMIXED_ETHPLL		2
+#define CLK_APMIXED_MSDCPLL		3
+#define CLK_APMIXED_TVDPLL1		4
+#define CLK_APMIXED_TVDPLL2		5
+#define CLK_APMIXED_MMPLL		6
+#define CLK_APMIXED_MAINPLL		7
+#define CLK_APMIXED_VDECPLL		8
+#define CLK_APMIXED_IMGPLL		9
+#define CLK_APMIXED_UNIVPLL		10
+#define CLK_APMIXED_HDMIPLL1		11
+#define CLK_APMIXED_HDMIPLL2		12
+#define CLK_APMIXED_HDMIRX_APLL		13
+#define CLK_APMIXED_USB1PLL		14
+#define CLK_APMIXED_ADSPPLL		15
+#define CLK_APMIXED_APLL1		16
+#define CLK_APMIXED_APLL2		17
+#define CLK_APMIXED_APLL3		18
+#define CLK_APMIXED_APLL4		19
+#define CLK_APMIXED_APLL5		20
+#define CLK_APMIXED_MFGPLL		21
+#define CLK_APMIXED_DGIPLL		22
+#define CLK_APMIXED_PLL_SSUSB26M	23
+#define CLK_APMIXED_NR_CLK		24
+
+/* SCP_ADSP */
+
+#define CLK_SCP_ADSP_AUDIODSP		0
+#define CLK_SCP_ADSP_NR_CLK		1
+
+/* PERICFG_AO */
+
+#define CLK_PERI_AO_ETHERNET		0
+#define CLK_PERI_AO_ETHERNET_BUS	1
+#define CLK_PERI_AO_FLASHIF_BUS		2
+#define CLK_PERI_AO_FLASHIF_FLASH	3
+#define CLK_PERI_AO_SSUSB_1P_BUS	4
+#define CLK_PERI_AO_SSUSB_1P_XHCI	5
+#define CLK_PERI_AO_SSUSB_2P_BUS	6
+#define CLK_PERI_AO_SSUSB_2P_XHCI	7
+#define CLK_PERI_AO_SSUSB_3P_BUS	8
+#define CLK_PERI_AO_SSUSB_3P_XHCI	9
+#define CLK_PERI_AO_SPINFI		10
+#define CLK_PERI_AO_ETHERNET_MAC	11
+#define CLK_PERI_AO_NFI_H		12
+#define CLK_PERI_AO_FNFI1X		13
+#define CLK_PERI_AO_PCIE_P0_MEM		14
+#define CLK_PERI_AO_PCIE_P1_MEM		15
+#define CLK_PERI_AO_NR_CLK		16
+
+/* IMP_IIC_WRAP_S */
+
+#define CLK_IMP_IIC_WRAP_S_I2C5		0
+#define CLK_IMP_IIC_WRAP_S_I2C6		1
+#define CLK_IMP_IIC_WRAP_S_I2C7		2
+#define CLK_IMP_IIC_WRAP_S_NR_CLK	3
+
+/* IMP_IIC_WRAP_W */
+
+#define CLK_IMP_IIC_WRAP_W_I2C0		0
+#define CLK_IMP_IIC_WRAP_W_I2C1		1
+#define CLK_IMP_IIC_WRAP_W_I2C2		2
+#define CLK_IMP_IIC_WRAP_W_I2C3		3
+#define CLK_IMP_IIC_WRAP_W_I2C4		4
+#define CLK_IMP_IIC_WRAP_W_NR_CLK	5
+
+/* MFGCFG */
+
+#define CLK_MFG_BG3D			0
+#define CLK_MFG_NR_CLK			1
+
+/* VPPSYS0 */
+
+#define CLK_VPP0_MDP_FG				0
+#define CLK_VPP0_STITCH				1
+#define CLK_VPP0_PADDING			2
+#define CLK_VPP0_MDP_TCC			3
+#define CLK_VPP0_WARP0_ASYNC_TX			4
+#define CLK_VPP0_WARP1_ASYNC_TX			5
+#define CLK_VPP0_MUTEX				6
+#define CLK_VPP0_VPP02VPP1_RELAY		7
+#define CLK_VPP0_VPP12VPP0_ASYNC		8
+#define CLK_VPP0_MMSYSRAM_TOP			9
+#define CLK_VPP0_MDP_AAL			10
+#define CLK_VPP0_MDP_RSZ			11
+#define CLK_VPP0_SMI_COMMON			12
+#define CLK_VPP0_GALS_VDO0_LARB0		13
+#define CLK_VPP0_GALS_VDO0_LARB1		14
+#define CLK_VPP0_GALS_VENCSYS			15
+#define CLK_VPP0_GALS_VENCSYS_CORE1		16
+#define CLK_VPP0_GALS_INFRA			17
+#define CLK_VPP0_GALS_CAMSYS			18
+#define CLK_VPP0_GALS_VPP1_LARB5		19
+#define CLK_VPP0_GALS_VPP1_LARB6		20
+#define CLK_VPP0_SMI_REORDER			21
+#define CLK_VPP0_SMI_IOMMU			22
+#define CLK_VPP0_GALS_IMGSYS_CAMSYS		23
+#define CLK_VPP0_MDP_RDMA			24
+#define CLK_VPP0_MDP_WROT			25
+#define CLK_VPP0_GALS_EMI0_EMI1			26
+#define CLK_VPP0_SMI_SUB_COMMON_REORDER		27
+#define CLK_VPP0_SMI_RSI			28
+#define CLK_VPP0_SMI_COMMON_LARB4		29
+#define CLK_VPP0_GALS_VDEC_VDEC_CORE1		30
+#define CLK_VPP0_GALS_VPP1_WPE			31
+#define CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1	32
+#define CLK_VPP0_FAKE_ENG			33
+#define CLK_VPP0_MDP_HDR			34
+#define CLK_VPP0_MDP_TDSHP			35
+#define CLK_VPP0_MDP_COLOR			36
+#define CLK_VPP0_MDP_OVL			37
+#define CLK_VPP0_WARP0_RELAY			38
+#define CLK_VPP0_WARP0_MDP_DL_ASYNC		39
+#define CLK_VPP0_WARP1_RELAY			40
+#define CLK_VPP0_WARP1_MDP_DL_ASYNC		41
+#define CLK_VPP0_NR_CLK				42
+
+/* WPESYS */
+
+#define CLK_WPE_VPP0			0
+#define CLK_WPE_VPP1			1
+#define CLK_WPE_SMI_LARB7		2
+#define CLK_WPE_SMI_LARB8		3
+#define CLK_WPE_EVENT_TX		4
+#define CLK_WPE_SMI_LARB7_P		5
+#define CLK_WPE_SMI_LARB8_P		6
+#define CLK_WPE_NR_CLK			7
+
+/* WPESYS_VPP0 */
+
+#define CLK_WPE_VPP0_VECI		0
+#define CLK_WPE_VPP0_VEC2I		1
+#define CLK_WPE_VPP0_VEC3I		2
+#define CLK_WPE_VPP0_WPEO		3
+#define CLK_WPE_VPP0_MSKO		4
+#define CLK_WPE_VPP0_VGEN		5
+#define CLK_WPE_VPP0_EXT		6
+#define CLK_WPE_VPP0_VFC		7
+#define CLK_WPE_VPP0_CACH0_TOP		8
+#define CLK_WPE_VPP0_CACH0_DMA		9
+#define CLK_WPE_VPP0_CACH1_TOP		10
+#define CLK_WPE_VPP0_CACH1_DMA		11
+#define CLK_WPE_VPP0_CACH2_TOP		12
+#define CLK_WPE_VPP0_CACH2_DMA		13
+#define CLK_WPE_VPP0_CACH3_TOP		14
+#define CLK_WPE_VPP0_CACH3_DMA		15
+#define CLK_WPE_VPP0_PSP		16
+#define CLK_WPE_VPP0_PSP2		17
+#define CLK_WPE_VPP0_SYNC		18
+#define CLK_WPE_VPP0_C24		19
+#define CLK_WPE_VPP0_MDP_CROP		20
+#define CLK_WPE_VPP0_ISP_CROP		21
+#define CLK_WPE_VPP0_TOP		22
+#define CLK_WPE_VPP0_NR_CLK		23
+
+/* WPESYS_VPP1 */
+
+#define CLK_WPE_VPP1_VECI		0
+#define CLK_WPE_VPP1_VEC2I		1
+#define CLK_WPE_VPP1_VEC3I		2
+#define CLK_WPE_VPP1_WPEO		3
+#define CLK_WPE_VPP1_MSKO		4
+#define CLK_WPE_VPP1_VGEN		5
+#define CLK_WPE_VPP1_EXT		6
+#define CLK_WPE_VPP1_VFC		7
+#define CLK_WPE_VPP1_CACH0_TOP		8
+#define CLK_WPE_VPP1_CACH0_DMA		9
+#define CLK_WPE_VPP1_CACH1_TOP		10
+#define CLK_WPE_VPP1_CACH1_DMA		11
+#define CLK_WPE_VPP1_CACH2_TOP		12
+#define CLK_WPE_VPP1_CACH2_DMA		13
+#define CLK_WPE_VPP1_CACH3_TOP		14
+#define CLK_WPE_VPP1_CACH3_DMA		15
+#define CLK_WPE_VPP1_PSP		16
+#define CLK_WPE_VPP1_PSP2		17
+#define CLK_WPE_VPP1_SYNC		18
+#define CLK_WPE_VPP1_C24		19
+#define CLK_WPE_VPP1_MDP_CROP		20
+#define CLK_WPE_VPP1_ISP_CROP		21
+#define CLK_WPE_VPP1_TOP		22
+#define CLK_WPE_VPP1_NR_CLK		23
+
+/* VPPSYS1 */
+
+#define CLK_VPP1_SVPP1_MDP_OVL		0
+#define CLK_VPP1_SVPP1_MDP_TCC		1
+#define CLK_VPP1_SVPP1_MDP_WROT		2
+#define CLK_VPP1_SVPP1_VPP_PAD		3
+#define CLK_VPP1_SVPP2_MDP_WROT		4
+#define CLK_VPP1_SVPP2_VPP_PAD		5
+#define CLK_VPP1_SVPP3_MDP_WROT		6
+#define CLK_VPP1_SVPP3_VPP_PAD		7
+#define CLK_VPP1_SVPP1_MDP_RDMA		8
+#define CLK_VPP1_SVPP1_MDP_FG		9
+#define CLK_VPP1_SVPP2_MDP_RDMA		10
+#define CLK_VPP1_SVPP2_MDP_FG		11
+#define CLK_VPP1_SVPP3_MDP_RDMA		12
+#define CLK_VPP1_SVPP3_MDP_FG		13
+#define CLK_VPP1_VPP_SPLIT		14
+#define CLK_VPP1_SVPP2_VDO0_DL_RELAY	15
+#define CLK_VPP1_SVPP1_MDP_TDSHP	16
+#define CLK_VPP1_SVPP1_MDP_COLOR	17
+#define CLK_VPP1_SVPP3_VDO1_DL_RELAY	18
+#define CLK_VPP1_SVPP2_VPP_MERGE	19
+#define CLK_VPP1_SVPP2_MDP_COLOR	20
+#define CLK_VPP1_VPPSYS1_GALS		21
+#define CLK_VPP1_SVPP3_VPP_MERGE	22
+#define CLK_VPP1_SVPP3_MDP_COLOR	23
+#define CLK_VPP1_VPPSYS1_LARB		24
+#define CLK_VPP1_SVPP1_MDP_RSZ		25
+#define CLK_VPP1_SVPP1_MDP_HDR		26
+#define CLK_VPP1_SVPP1_MDP_AAL		27
+#define CLK_VPP1_SVPP2_MDP_HDR		28
+#define CLK_VPP1_SVPP2_MDP_AAL		29
+#define CLK_VPP1_DL_ASYNC		30
+#define CLK_VPP1_LARB5_FAKE_ENG		31
+#define CLK_VPP1_SVPP3_MDP_HDR		32
+#define CLK_VPP1_SVPP3_MDP_AAL		33
+#define CLK_VPP1_SVPP2_VDO1_DL_RELAY	34
+#define CLK_VPP1_LARB6_FAKE_ENG		35
+#define CLK_VPP1_SVPP2_MDP_RSZ		36
+#define CLK_VPP1_SVPP3_MDP_RSZ		37
+#define CLK_VPP1_SVPP3_VDO0_DL_RELAY	38
+#define CLK_VPP1_DISP_MUTEX		39
+#define CLK_VPP1_SVPP2_MDP_TDSHP	40
+#define CLK_VPP1_SVPP3_MDP_TDSHP	41
+#define CLK_VPP1_VPP0_DL1_RELAY		42
+#define CLK_VPP1_HDMI_META		43
+#define CLK_VPP1_VPP_SPLIT_HDMI		44
+#define CLK_VPP1_DGI_IN			45
+#define CLK_VPP1_DGI_OUT		46
+#define CLK_VPP1_VPP_SPLIT_DGI		47
+#define CLK_VPP1_VPP0_DL_ASYNC		48
+#define CLK_VPP1_VPP0_DL_RELAY		49
+#define CLK_VPP1_VPP_SPLIT_26M		50
+#define CLK_VPP1_NR_CLK			51
+
+/* IMGSYS */
+
+#define CLK_IMG_LARB9			0
+#define CLK_IMG_TRAW0			1
+#define CLK_IMG_TRAW1			2
+#define CLK_IMG_TRAW2			3
+#define CLK_IMG_TRAW3			4
+#define CLK_IMG_DIP0			5
+#define CLK_IMG_WPE0			6
+#define CLK_IMG_IPE			7
+#define CLK_IMG_DIP1			8
+#define CLK_IMG_WPE1			9
+#define CLK_IMG_GALS			10
+#define CLK_IMG_NR_CLK			11
+
+/* IMGSYS1_DIP_TOP */
+
+#define CLK_IMG1_DIP_TOP_LARB10		0
+#define CLK_IMG1_DIP_TOP_DIP_TOP	1
+#define CLK_IMG1_DIP_TOP_NR_CLK		2
+
+/* IMGSYS1_DIP_NR */
+
+#define CLK_IMG1_DIP_NR_RESERVE		0
+#define CLK_IMG1_DIP_NR_DIP_NR		1
+#define CLK_IMG1_DIP_NR_NR_CLK		2
+
+/* IMGSYS1_WPE */
+
+#define CLK_IMG1_WPE_LARB11		0
+#define CLK_IMG1_WPE_WPE		1
+#define CLK_IMG1_WPE_NR_CLK		2
+
+/* IPESYS */
+
+#define CLK_IPE_DPE			0
+#define CLK_IPE_FDVT			1
+#define CLK_IPE_ME			2
+#define CLK_IPE_TOP			3
+#define CLK_IPE_SMI_LARB12		4
+#define CLK_IPE_NR_CLK			5
+
+/* CAMSYS */
+
+#define CLK_CAM_LARB13			0
+#define CLK_CAM_LARB14			1
+#define CLK_CAM_MAIN_CAM		2
+#define CLK_CAM_MAIN_CAMTG		3
+#define CLK_CAM_SENINF			4
+#define CLK_CAM_GCAMSVA			5
+#define CLK_CAM_GCAMSVB			6
+#define CLK_CAM_GCAMSVC			7
+#define CLK_CAM_SCAMSA			8
+#define CLK_CAM_SCAMSB			9
+#define CLK_CAM_CAMSV_TOP		10
+#define CLK_CAM_CAMSV_CQ		11
+#define CLK_CAM_ADL			12
+#define CLK_CAM_ASG			13
+#define CLK_CAM_PDA			14
+#define CLK_CAM_FAKE_ENG		15
+#define CLK_CAM_MAIN_MRAW0		16
+#define CLK_CAM_MAIN_MRAW1		17
+#define CLK_CAM_MAIN_MRAW2		18
+#define CLK_CAM_MAIN_MRAW3		19
+#define CLK_CAM_CAM2MM0_GALS		20
+#define CLK_CAM_CAM2MM1_GALS		21
+#define CLK_CAM_CAM2SYS_GALS		22
+#define CLK_CAM_NR_CLK			23
+
+/* CAMSYS_RAWA */
+
+#define CLK_CAM_RAWA_LARBX		0
+#define CLK_CAM_RAWA_CAM		1
+#define CLK_CAM_RAWA_CAMTG		2
+#define CLK_CAM_RAWA_NR_CLK		3
+
+/* CAMSYS_YUVA */
+
+#define CLK_CAM_YUVA_LARBX		0
+#define CLK_CAM_YUVA_CAM		1
+#define CLK_CAM_YUVA_CAMTG		2
+#define CLK_CAM_YUVA_NR_CLK		3
+
+/* CAMSYS_RAWB */
+
+#define CLK_CAM_RAWB_LARBX		0
+#define CLK_CAM_RAWB_CAM		1
+#define CLK_CAM_RAWB_CAMTG		2
+#define CLK_CAM_RAWB_NR_CLK		3
+
+/* CAMSYS_YUVB */
+
+#define CLK_CAM_YUVB_LARBX		0
+#define CLK_CAM_YUVB_CAM		1
+#define CLK_CAM_YUVB_CAMTG		2
+#define CLK_CAM_YUVB_NR_CLK		3
+
+/* CAMSYS_MRAW */
+
+#define CLK_CAM_MRAW_LARBX		0
+#define CLK_CAM_MRAW_CAMTG		1
+#define CLK_CAM_MRAW_MRAW0		2
+#define CLK_CAM_MRAW_MRAW1		3
+#define CLK_CAM_MRAW_MRAW2		4
+#define CLK_CAM_MRAW_MRAW3		5
+#define CLK_CAM_MRAW_NR_CLK		6
+
+/* CCUSYS */
+
+#define CLK_CCU_LARB18			0
+#define CLK_CCU_AHB			1
+#define CLK_CCU_CCU0			2
+#define CLK_CCU_CCU1			3
+#define CLK_CCU_NR_CLK			4
+
+/* VDECSYS_SOC */
+
+#define CLK_VDEC_SOC_LARB1		0
+#define CLK_VDEC_SOC_LAT		1
+#define CLK_VDEC_SOC_VDEC		2
+#define CLK_VDEC_SOC_NR_CLK		3
+
+/* VDECSYS */
+
+#define CLK_VDEC_LARB1			0
+#define CLK_VDEC_LAT			1
+#define CLK_VDEC_VDEC			2
+#define CLK_VDEC_NR_CLK			3
+
+/* VDECSYS_CORE1 */
+
+#define CLK_VDEC_CORE1_LARB1		0
+#define CLK_VDEC_CORE1_LAT		1
+#define CLK_VDEC_CORE1_VDEC		2
+#define CLK_VDEC_CORE1_NR_CLK		3
+
+/* APUSYS_PLL */
+
+#define CLK_APUSYS_PLL_APUPLL		0
+#define CLK_APUSYS_PLL_NPUPLL		1
+#define CLK_APUSYS_PLL_APUPLL1		2
+#define CLK_APUSYS_PLL_APUPLL2		3
+#define CLK_APUSYS_PLL_NR_CLK		4
+
+/* VENCSYS */
+
+#define CLK_VENC_LARB			0
+#define CLK_VENC_VENC			1
+#define CLK_VENC_JPGENC			2
+#define CLK_VENC_JPGDEC			3
+#define CLK_VENC_JPGDEC_C1		4
+#define CLK_VENC_GALS			5
+#define CLK_VENC_NR_CLK			6
+
+/* VENCSYS_CORE1 */
+
+#define CLK_VENC_CORE1_LARB		0
+#define CLK_VENC_CORE1_VENC		1
+#define CLK_VENC_CORE1_JPGENC		2
+#define CLK_VENC_CORE1_JPGDEC		3
+#define CLK_VENC_CORE1_JPGDEC_C1	4
+#define CLK_VENC_CORE1_GALS		5
+#define CLK_VENC_CORE1_NR_CLK		6
+
+/* VDOSYS0 */
+
+#define CLK_VDO0_DISP_OVL0		0
+#define CLK_VDO0_DISP_COLOR0		1
+#define CLK_VDO0_DISP_COLOR1		2
+#define CLK_VDO0_DISP_CCORR0		3
+#define CLK_VDO0_DISP_CCORR1		4
+#define CLK_VDO0_DISP_AAL0		5
+#define CLK_VDO0_DISP_AAL1		6
+#define CLK_VDO0_DISP_GAMMA0		7
+#define CLK_VDO0_DISP_GAMMA1		8
+#define CLK_VDO0_DISP_DITHER0		9
+#define CLK_VDO0_DISP_DITHER1		10
+#define CLK_VDO0_DISP_OVL1		11
+#define CLK_VDO0_DISP_WDMA0		12
+#define CLK_VDO0_DISP_WDMA1		13
+#define CLK_VDO0_DISP_RDMA0		14
+#define CLK_VDO0_DISP_RDMA1		15
+#define CLK_VDO0_DSI0			16
+#define CLK_VDO0_DSI1			17
+#define CLK_VDO0_DSC_WRAP0		18
+#define CLK_VDO0_VPP_MERGE0		19
+#define CLK_VDO0_DP_INTF0		20
+#define CLK_VDO0_DISP_MUTEX0		21
+#define CLK_VDO0_DISP_IL_ROT0		22
+#define CLK_VDO0_APB_BUS		23
+#define CLK_VDO0_FAKE_ENG0		24
+#define CLK_VDO0_FAKE_ENG1		25
+#define CLK_VDO0_DL_ASYNC0		26
+#define CLK_VDO0_DL_ASYNC1		27
+#define CLK_VDO0_DL_ASYNC2		28
+#define CLK_VDO0_DL_ASYNC3		29
+#define CLK_VDO0_DL_ASYNC4		30
+#define CLK_VDO0_DISP_MONITOR0		31
+#define CLK_VDO0_DISP_MONITOR1		32
+#define CLK_VDO0_DISP_MONITOR2		33
+#define CLK_VDO0_DISP_MONITOR3		34
+#define CLK_VDO0_DISP_MONITOR4		35
+#define CLK_VDO0_SMI_GALS		36
+#define CLK_VDO0_SMI_COMMON		37
+#define CLK_VDO0_SMI_EMI		38
+#define CLK_VDO0_SMI_IOMMU		39
+#define CLK_VDO0_SMI_LARB		40
+#define CLK_VDO0_SMI_RSI		41
+#define CLK_VDO0_DSI0_DSI		42
+#define CLK_VDO0_DSI1_DSI		43
+#define CLK_VDO0_DP_INTF0_DP_INTF	44
+#define CLK_VDO0_NR_CLK			45
+
+/* VDOSYS1 */
+
+#define CLK_VDO1_SMI_LARB2			0
+#define CLK_VDO1_SMI_LARB3			1
+#define CLK_VDO1_GALS				2
+#define CLK_VDO1_FAKE_ENG0			3
+#define CLK_VDO1_FAKE_ENG			4
+#define CLK_VDO1_MDP_RDMA0			5
+#define CLK_VDO1_MDP_RDMA1			6
+#define CLK_VDO1_MDP_RDMA2			7
+#define CLK_VDO1_MDP_RDMA3			8
+#define CLK_VDO1_VPP_MERGE0			9
+#define CLK_VDO1_VPP_MERGE1			10
+#define CLK_VDO1_VPP_MERGE2			11
+#define CLK_VDO1_VPP_MERGE3			12
+#define CLK_VDO1_VPP_MERGE4			13
+#define CLK_VDO1_VPP2_TO_VDO1_DL_ASYNC		14
+#define CLK_VDO1_VPP3_TO_VDO1_DL_ASYNC		15
+#define CLK_VDO1_DISP_MUTEX			16
+#define CLK_VDO1_MDP_RDMA4			17
+#define CLK_VDO1_MDP_RDMA5			18
+#define CLK_VDO1_MDP_RDMA6			19
+#define CLK_VDO1_MDP_RDMA7			20
+#define CLK_VDO1_DP_INTF0_MM			21
+#define CLK_VDO1_DPI0_MM			22
+#define CLK_VDO1_DPI1_MM			23
+#define CLK_VDO1_DISP_MONITOR			24
+#define CLK_VDO1_MERGE0_DL_ASYNC		25
+#define CLK_VDO1_MERGE1_DL_ASYNC		26
+#define CLK_VDO1_MERGE2_DL_ASYNC		27
+#define CLK_VDO1_MERGE3_DL_ASYNC		28
+#define CLK_VDO1_MERGE4_DL_ASYNC		29
+#define CLK_VDO1_VDO0_DSC_TO_VDO1_DL_ASYNC	30
+#define CLK_VDO1_VDO0_MERGE_TO_VDO1_DL_ASYNC	31
+#define CLK_VDO1_HDR_VDO_FE0			32
+#define CLK_VDO1_HDR_GFX_FE0			33
+#define CLK_VDO1_HDR_VDO_BE			34
+#define CLK_VDO1_HDR_VDO_FE1			35
+#define CLK_VDO1_HDR_GFX_FE1			36
+#define CLK_VDO1_DISP_MIXER			37
+#define CLK_VDO1_HDR_VDO_FE0_DL_ASYNC		38
+#define CLK_VDO1_HDR_VDO_FE1_DL_ASYNC		39
+#define CLK_VDO1_HDR_GFX_FE0_DL_ASYNC		40
+#define CLK_VDO1_HDR_GFX_FE1_DL_ASYNC		41
+#define CLK_VDO1_HDR_VDO_BE_DL_ASYNC		42
+#define CLK_VDO1_DPI0				43
+#define CLK_VDO1_DISP_MONITOR_DPI0		44
+#define CLK_VDO1_DPI1				45
+#define CLK_VDO1_DISP_MONITOR_DPI1		46
+#define CLK_VDO1_DPINTF				47
+#define CLK_VDO1_DISP_MONITOR_DPINTF		48
+#define CLK_VDO1_26M_SLOW			49
+#define CLK_VDO1_NR_CLK				50
+
+#endif /* _DT_BINDINGS_CLK_MT8195_H */
-- 
2.18.0

