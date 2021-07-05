Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1CAD3BB5AE
	for <lists+linux-clk@lfdr.de>; Mon,  5 Jul 2021 05:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhGEDoI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 4 Jul 2021 23:44:08 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:47032 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229807AbhGEDoH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Jul 2021 23:44:07 -0400
X-UUID: e21c1f52686f4a33b435442e092e9e3f-20210705
X-UUID: e21c1f52686f4a33b435442e092e9e3f-20210705
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 255567539; Mon, 05 Jul 2021 11:41:29 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 11:41:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Jul 2021 11:41:27 +0800
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
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [v12 03/20] clk: mediatek: Add dt-bindings of MT8192 clocks
Date:   Mon, 5 Jul 2021 11:38:07 +0800
Message-ID: <20210705033824.1934-4-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
References: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MT8192 clock dt-bindings, include topckgen, apmixedsys,
infracfg, pericfg and subsystem clocks.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/mt8192-clk.h | 585 +++++++++++++++++++++++++
 1 file changed, 585 insertions(+)
 create mode 100644 include/dt-bindings/clock/mt8192-clk.h

diff --git a/include/dt-bindings/clock/mt8192-clk.h b/include/dt-bindings/clock/mt8192-clk.h
new file mode 100644
index 000000000000..5ab68f15a256
--- /dev/null
+++ b/include/dt-bindings/clock/mt8192-clk.h
@@ -0,0 +1,585 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MT8192_H
+#define _DT_BINDINGS_CLK_MT8192_H
+
+/* TOPCKGEN */
+
+#define CLK_TOP_AXI_SEL			0
+#define CLK_TOP_SPM_SEL			1
+#define CLK_TOP_SCP_SEL			2
+#define CLK_TOP_BUS_AXIMEM_SEL		3
+#define CLK_TOP_DISP_SEL		4
+#define CLK_TOP_MDP_SEL			5
+#define CLK_TOP_IMG1_SEL		6
+#define CLK_TOP_IMG2_SEL		7
+#define CLK_TOP_IPE_SEL			8
+#define CLK_TOP_DPE_SEL			9
+#define CLK_TOP_CAM_SEL			10
+#define CLK_TOP_CCU_SEL			11
+#define CLK_TOP_DSP7_SEL		12
+#define CLK_TOP_MFG_REF_SEL		13
+#define CLK_TOP_MFG_PLL_SEL		14
+#define CLK_TOP_CAMTG_SEL		15
+#define CLK_TOP_CAMTG2_SEL		16
+#define CLK_TOP_CAMTG3_SEL		17
+#define CLK_TOP_CAMTG4_SEL		18
+#define CLK_TOP_CAMTG5_SEL		19
+#define CLK_TOP_CAMTG6_SEL		20
+#define CLK_TOP_UART_SEL		21
+#define CLK_TOP_SPI_SEL			22
+#define CLK_TOP_MSDC50_0_H_SEL		23
+#define CLK_TOP_MSDC50_0_SEL		24
+#define CLK_TOP_MSDC30_1_SEL		25
+#define CLK_TOP_MSDC30_2_SEL		26
+#define CLK_TOP_AUDIO_SEL		27
+#define CLK_TOP_AUD_INTBUS_SEL		28
+#define CLK_TOP_PWRAP_ULPOSC_SEL	29
+#define CLK_TOP_ATB_SEL			30
+#define CLK_TOP_DPI_SEL			31
+#define CLK_TOP_SCAM_SEL		32
+#define CLK_TOP_DISP_PWM_SEL		33
+#define CLK_TOP_USB_TOP_SEL		34
+#define CLK_TOP_SSUSB_XHCI_SEL		35
+#define CLK_TOP_I2C_SEL			36
+#define CLK_TOP_SENINF_SEL		37
+#define CLK_TOP_SENINF1_SEL		38
+#define CLK_TOP_SENINF2_SEL		39
+#define CLK_TOP_SENINF3_SEL		40
+#define CLK_TOP_TL_SEL			41
+#define CLK_TOP_DXCC_SEL		42
+#define CLK_TOP_AUD_ENGEN1_SEL		43
+#define CLK_TOP_AUD_ENGEN2_SEL		44
+#define CLK_TOP_AES_UFSFDE_SEL		45
+#define CLK_TOP_UFS_SEL			46
+#define CLK_TOP_AUD_1_SEL		47
+#define CLK_TOP_AUD_2_SEL		48
+#define CLK_TOP_ADSP_SEL		49
+#define CLK_TOP_DPMAIF_MAIN_SEL		50
+#define CLK_TOP_VENC_SEL		51
+#define CLK_TOP_VDEC_SEL		52
+#define CLK_TOP_CAMTM_SEL		53
+#define CLK_TOP_PWM_SEL			54
+#define CLK_TOP_AUDIO_H_SEL		55
+#define CLK_TOP_SPMI_MST_SEL		56
+#define CLK_TOP_AES_MSDCFDE_SEL		57
+#define CLK_TOP_SFLASH_SEL		58
+#define CLK_TOP_APLL_I2S0_M_SEL		59
+#define CLK_TOP_APLL_I2S1_M_SEL		60
+#define CLK_TOP_APLL_I2S2_M_SEL		61
+#define CLK_TOP_APLL_I2S3_M_SEL		62
+#define CLK_TOP_APLL_I2S4_M_SEL		63
+#define CLK_TOP_APLL_I2S5_M_SEL		64
+#define CLK_TOP_APLL_I2S6_M_SEL		65
+#define CLK_TOP_APLL_I2S7_M_SEL		66
+#define CLK_TOP_APLL_I2S8_M_SEL		67
+#define CLK_TOP_APLL_I2S9_M_SEL		68
+#define CLK_TOP_MAINPLL_D3		69
+#define CLK_TOP_MAINPLL_D4		70
+#define CLK_TOP_MAINPLL_D4_D2		71
+#define CLK_TOP_MAINPLL_D4_D4		72
+#define CLK_TOP_MAINPLL_D4_D8		73
+#define CLK_TOP_MAINPLL_D4_D16		74
+#define CLK_TOP_MAINPLL_D5		75
+#define CLK_TOP_MAINPLL_D5_D2		76
+#define CLK_TOP_MAINPLL_D5_D4		77
+#define CLK_TOP_MAINPLL_D5_D8		78
+#define CLK_TOP_MAINPLL_D6		79
+#define CLK_TOP_MAINPLL_D6_D2		80
+#define CLK_TOP_MAINPLL_D6_D4		81
+#define CLK_TOP_MAINPLL_D7		82
+#define CLK_TOP_MAINPLL_D7_D2		83
+#define CLK_TOP_MAINPLL_D7_D4		84
+#define CLK_TOP_MAINPLL_D7_D8		85
+#define CLK_TOP_UNIVPLL_D3		86
+#define CLK_TOP_UNIVPLL_D4		87
+#define CLK_TOP_UNIVPLL_D4_D2		88
+#define CLK_TOP_UNIVPLL_D4_D4		89
+#define CLK_TOP_UNIVPLL_D4_D8		90
+#define CLK_TOP_UNIVPLL_D5		91
+#define CLK_TOP_UNIVPLL_D5_D2		92
+#define CLK_TOP_UNIVPLL_D5_D4		93
+#define CLK_TOP_UNIVPLL_D5_D8		94
+#define CLK_TOP_UNIVPLL_D6		95
+#define CLK_TOP_UNIVPLL_D6_D2		96
+#define CLK_TOP_UNIVPLL_D6_D4		97
+#define CLK_TOP_UNIVPLL_D6_D8		98
+#define CLK_TOP_UNIVPLL_D6_D16		99
+#define CLK_TOP_UNIVPLL_D7		100
+#define CLK_TOP_APLL1			101
+#define CLK_TOP_APLL1_D2		102
+#define CLK_TOP_APLL1_D4		103
+#define CLK_TOP_APLL1_D8		104
+#define CLK_TOP_APLL2			105
+#define CLK_TOP_APLL2_D2		106
+#define CLK_TOP_APLL2_D4		107
+#define CLK_TOP_APLL2_D8		108
+#define CLK_TOP_MMPLL_D4		109
+#define CLK_TOP_MMPLL_D4_D2		110
+#define CLK_TOP_MMPLL_D5		111
+#define CLK_TOP_MMPLL_D5_D2		112
+#define CLK_TOP_MMPLL_D6		113
+#define CLK_TOP_MMPLL_D6_D2		114
+#define CLK_TOP_MMPLL_D7		115
+#define CLK_TOP_MMPLL_D9		116
+#define CLK_TOP_APUPLL			117
+#define CLK_TOP_NPUPLL			118
+#define CLK_TOP_TVDPLL			119
+#define CLK_TOP_TVDPLL_D2		120
+#define CLK_TOP_TVDPLL_D4		121
+#define CLK_TOP_TVDPLL_D8		122
+#define CLK_TOP_TVDPLL_D16		123
+#define CLK_TOP_MSDCPLL			124
+#define CLK_TOP_MSDCPLL_D2		125
+#define CLK_TOP_MSDCPLL_D4		126
+#define CLK_TOP_ULPOSC			127
+#define CLK_TOP_OSC_D2			128
+#define CLK_TOP_OSC_D4			129
+#define CLK_TOP_OSC_D8			130
+#define CLK_TOP_OSC_D10			131
+#define CLK_TOP_OSC_D16			132
+#define CLK_TOP_OSC_D20			133
+#define CLK_TOP_CSW_F26M_D2		134
+#define CLK_TOP_ADSPPLL			135
+#define CLK_TOP_UNIVPLL_192M		136
+#define CLK_TOP_UNIVPLL_192M_D2		137
+#define CLK_TOP_UNIVPLL_192M_D4		138
+#define CLK_TOP_UNIVPLL_192M_D8		139
+#define CLK_TOP_UNIVPLL_192M_D16	140
+#define CLK_TOP_UNIVPLL_192M_D32	141
+#define CLK_TOP_APLL12_DIV0		142
+#define CLK_TOP_APLL12_DIV1		143
+#define CLK_TOP_APLL12_DIV2		144
+#define CLK_TOP_APLL12_DIV3		145
+#define CLK_TOP_APLL12_DIV4		146
+#define CLK_TOP_APLL12_DIVB		147
+#define CLK_TOP_APLL12_DIV5		148
+#define CLK_TOP_APLL12_DIV6		149
+#define CLK_TOP_APLL12_DIV7		150
+#define CLK_TOP_APLL12_DIV8		151
+#define CLK_TOP_APLL12_DIV9		152
+#define CLK_TOP_SSUSB_TOP_REF		153
+#define CLK_TOP_SSUSB_PHY_REF		154
+#define CLK_TOP_NR_CLK			155
+
+/* INFRACFG */
+
+#define CLK_INFRA_PMIC_TMR		0
+#define CLK_INFRA_PMIC_AP		1
+#define CLK_INFRA_PMIC_MD		2
+#define CLK_INFRA_PMIC_CONN		3
+#define CLK_INFRA_SCPSYS		4
+#define CLK_INFRA_SEJ			5
+#define CLK_INFRA_APXGPT		6
+#define CLK_INFRA_GCE			7
+#define CLK_INFRA_GCE2			8
+#define CLK_INFRA_THERM			9
+#define CLK_INFRA_I2C0			10
+#define CLK_INFRA_AP_DMA_PSEUDO		11
+#define CLK_INFRA_I2C2			12
+#define CLK_INFRA_I2C3			13
+#define CLK_INFRA_PWM_H			14
+#define CLK_INFRA_PWM1			15
+#define CLK_INFRA_PWM2			16
+#define CLK_INFRA_PWM3			17
+#define CLK_INFRA_PWM4			18
+#define CLK_INFRA_PWM			19
+#define CLK_INFRA_UART0			20
+#define CLK_INFRA_UART1			21
+#define CLK_INFRA_UART2			22
+#define CLK_INFRA_UART3			23
+#define CLK_INFRA_GCE_26M		24
+#define CLK_INFRA_CQ_DMA_FPC		25
+#define CLK_INFRA_BTIF			26
+#define CLK_INFRA_SPI0			27
+#define CLK_INFRA_MSDC0			28
+#define CLK_INFRA_MSDC1			29
+#define CLK_INFRA_MSDC2			30
+#define CLK_INFRA_MSDC0_SRC		31
+#define CLK_INFRA_GCPU			32
+#define CLK_INFRA_TRNG			33
+#define CLK_INFRA_AUXADC		34
+#define CLK_INFRA_CPUM			35
+#define CLK_INFRA_CCIF1_AP		36
+#define CLK_INFRA_CCIF1_MD		37
+#define CLK_INFRA_AUXADC_MD		38
+#define CLK_INFRA_PCIE_TL_26M		39
+#define CLK_INFRA_MSDC1_SRC		40
+#define CLK_INFRA_MSDC2_SRC		41
+#define CLK_INFRA_PCIE_TL_96M		42
+#define CLK_INFRA_PCIE_PL_P_250M	43
+#define CLK_INFRA_DEVICE_APC		44
+#define CLK_INFRA_CCIF_AP		45
+#define CLK_INFRA_DEBUGSYS		46
+#define CLK_INFRA_AUDIO			47
+#define CLK_INFRA_CCIF_MD		48
+#define CLK_INFRA_DXCC_SEC_CORE		49
+#define CLK_INFRA_DXCC_AO		50
+#define CLK_INFRA_DBG_TRACE		51
+#define CLK_INFRA_DEVMPU_B		52
+#define CLK_INFRA_DRAMC_F26M		53
+#define CLK_INFRA_IRTX			54
+#define CLK_INFRA_SSUSB			55
+#define CLK_INFRA_DISP_PWM		56
+#define CLK_INFRA_CLDMA_B		57
+#define CLK_INFRA_AUDIO_26M_B		58
+#define CLK_INFRA_MODEM_TEMP_SHARE	59
+#define CLK_INFRA_SPI1			60
+#define CLK_INFRA_I2C4			61
+#define CLK_INFRA_SPI2			62
+#define CLK_INFRA_SPI3			63
+#define CLK_INFRA_UNIPRO_SYS		64
+#define CLK_INFRA_UNIPRO_TICK		65
+#define CLK_INFRA_UFS_MP_SAP_B		66
+#define CLK_INFRA_MD32_B		67
+#define CLK_INFRA_UNIPRO_MBIST		68
+#define CLK_INFRA_I2C5			69
+#define CLK_INFRA_I2C5_ARBITER		70
+#define CLK_INFRA_I2C5_IMM		71
+#define CLK_INFRA_I2C1_ARBITER		72
+#define CLK_INFRA_I2C1_IMM		73
+#define CLK_INFRA_I2C2_ARBITER		74
+#define CLK_INFRA_I2C2_IMM		75
+#define CLK_INFRA_SPI4			76
+#define CLK_INFRA_SPI5			77
+#define CLK_INFRA_CQ_DMA		78
+#define CLK_INFRA_UFS			79
+#define CLK_INFRA_AES_UFSFDE		80
+#define CLK_INFRA_UFS_TICK		81
+#define CLK_INFRA_SSUSB_XHCI		82
+#define CLK_INFRA_MSDC0_SELF		83
+#define CLK_INFRA_MSDC1_SELF		84
+#define CLK_INFRA_MSDC2_SELF		85
+#define CLK_INFRA_UFS_AXI		86
+#define CLK_INFRA_I2C6			87
+#define CLK_INFRA_AP_MSDC0		88
+#define CLK_INFRA_MD_MSDC0		89
+#define CLK_INFRA_CCIF5_AP		90
+#define CLK_INFRA_CCIF5_MD		91
+#define CLK_INFRA_PCIE_TOP_H_133M	92
+#define CLK_INFRA_FLASHIF_TOP_H_133M	93
+#define CLK_INFRA_PCIE_PERI_26M		94
+#define CLK_INFRA_CCIF2_AP		95
+#define CLK_INFRA_CCIF2_MD		96
+#define CLK_INFRA_CCIF3_AP		97
+#define CLK_INFRA_CCIF3_MD		98
+#define CLK_INFRA_SEJ_F13M		99
+#define CLK_INFRA_AES			100
+#define CLK_INFRA_I2C7			101
+#define CLK_INFRA_I2C8			102
+#define CLK_INFRA_FBIST2FPC		103
+#define CLK_INFRA_DEVICE_APC_SYNC	104
+#define CLK_INFRA_DPMAIF_MAIN		105
+#define CLK_INFRA_PCIE_TL_32K		106
+#define CLK_INFRA_CCIF4_AP		107
+#define CLK_INFRA_CCIF4_MD		108
+#define CLK_INFRA_SPI6			109
+#define CLK_INFRA_SPI7			110
+#define CLK_INFRA_133M			111
+#define CLK_INFRA_66M			112
+#define CLK_INFRA_66M_PERI_BUS		113
+#define CLK_INFRA_FREE_DCM_133M		114
+#define CLK_INFRA_FREE_DCM_66M		115
+#define CLK_INFRA_PERI_BUS_DCM_133M	116
+#define CLK_INFRA_PERI_BUS_DCM_66M	117
+#define CLK_INFRA_FLASHIF_PERI_26M	118
+#define CLK_INFRA_FLASHIF_SFLASH	119
+#define CLK_INFRA_AP_DMA		120
+#define CLK_INFRA_NR_CLK		121
+
+/* PERICFG */
+
+#define CLK_PERI_PERIAXI		0
+#define CLK_PERI_NR_CLK			1
+
+/* APMIXEDSYS */
+
+#define CLK_APMIXED_MAINPLL		0
+#define CLK_APMIXED_UNIVPLL		1
+#define CLK_APMIXED_USBPLL		2
+#define CLK_APMIXED_MSDCPLL		3
+#define CLK_APMIXED_MMPLL		4
+#define CLK_APMIXED_ADSPPLL		5
+#define CLK_APMIXED_MFGPLL		6
+#define CLK_APMIXED_TVDPLL		7
+#define CLK_APMIXED_APLL1		8
+#define CLK_APMIXED_APLL2		9
+#define CLK_APMIXED_MIPID26M		10
+#define CLK_APMIXED_NR_CLK		11
+
+/* SCP_ADSP */
+
+#define CLK_SCP_ADSP_AUDIODSP		0
+#define CLK_SCP_ADSP_NR_CLK		1
+
+/* IMP_IIC_WRAP_C */
+
+#define CLK_IMP_IIC_WRAP_C_I2C10	0
+#define CLK_IMP_IIC_WRAP_C_I2C11	1
+#define CLK_IMP_IIC_WRAP_C_I2C12	2
+#define CLK_IMP_IIC_WRAP_C_I2C13	3
+#define CLK_IMP_IIC_WRAP_C_NR_CLK	4
+
+/* AUDSYS */
+
+#define CLK_AUD_AFE			0
+#define CLK_AUD_22M			1
+#define CLK_AUD_24M			2
+#define CLK_AUD_APLL2_TUNER		3
+#define CLK_AUD_APLL_TUNER		4
+#define CLK_AUD_TDM			5
+#define CLK_AUD_ADC			6
+#define CLK_AUD_DAC			7
+#define CLK_AUD_DAC_PREDIS		8
+#define CLK_AUD_TML			9
+#define CLK_AUD_NLE			10
+#define CLK_AUD_I2S1_B			11
+#define CLK_AUD_I2S2_B			12
+#define CLK_AUD_I2S3_B			13
+#define CLK_AUD_I2S4_B			14
+#define CLK_AUD_CONNSYS_I2S_ASRC	15
+#define CLK_AUD_GENERAL1_ASRC		16
+#define CLK_AUD_GENERAL2_ASRC		17
+#define CLK_AUD_DAC_HIRES		18
+#define CLK_AUD_ADC_HIRES		19
+#define CLK_AUD_ADC_HIRES_TML		20
+#define CLK_AUD_ADDA6_ADC		21
+#define CLK_AUD_ADDA6_ADC_HIRES		22
+#define CLK_AUD_3RD_DAC			23
+#define CLK_AUD_3RD_DAC_PREDIS		24
+#define CLK_AUD_3RD_DAC_TML		25
+#define CLK_AUD_3RD_DAC_HIRES		26
+#define CLK_AUD_I2S5_B			27
+#define CLK_AUD_I2S6_B			28
+#define CLK_AUD_I2S7_B			29
+#define CLK_AUD_I2S8_B			30
+#define CLK_AUD_I2S9_B			31
+#define CLK_AUD_NR_CLK			32
+
+/* IMP_IIC_WRAP_E */
+
+#define CLK_IMP_IIC_WRAP_E_I2C3		0
+#define CLK_IMP_IIC_WRAP_E_NR_CLK	1
+
+/* IMP_IIC_WRAP_S */
+
+#define CLK_IMP_IIC_WRAP_S_I2C7		0
+#define CLK_IMP_IIC_WRAP_S_I2C8		1
+#define CLK_IMP_IIC_WRAP_S_I2C9		2
+#define CLK_IMP_IIC_WRAP_S_NR_CLK	3
+
+/* IMP_IIC_WRAP_WS */
+
+#define CLK_IMP_IIC_WRAP_WS_I2C1	0
+#define CLK_IMP_IIC_WRAP_WS_I2C2	1
+#define CLK_IMP_IIC_WRAP_WS_I2C4	2
+#define CLK_IMP_IIC_WRAP_WS_NR_CLK	3
+
+/* IMP_IIC_WRAP_W */
+
+#define CLK_IMP_IIC_WRAP_W_I2C5		0
+#define CLK_IMP_IIC_WRAP_W_NR_CLK	1
+
+/* IMP_IIC_WRAP_N */
+
+#define CLK_IMP_IIC_WRAP_N_I2C0		0
+#define CLK_IMP_IIC_WRAP_N_I2C6		1
+#define CLK_IMP_IIC_WRAP_N_NR_CLK	2
+
+/* MSDC_TOP */
+
+#define CLK_MSDC_TOP_AES_0P		0
+#define CLK_MSDC_TOP_SRC_0P		1
+#define CLK_MSDC_TOP_SRC_1P		2
+#define CLK_MSDC_TOP_SRC_2P		3
+#define CLK_MSDC_TOP_P_MSDC0		4
+#define CLK_MSDC_TOP_P_MSDC1		5
+#define CLK_MSDC_TOP_P_MSDC2		6
+#define CLK_MSDC_TOP_P_CFG		7
+#define CLK_MSDC_TOP_AXI		8
+#define CLK_MSDC_TOP_H_MST_0P		9
+#define CLK_MSDC_TOP_H_MST_1P		10
+#define CLK_MSDC_TOP_H_MST_2P		11
+#define CLK_MSDC_TOP_MEM_OFF_DLY_26M	12
+#define CLK_MSDC_TOP_32K		13
+#define CLK_MSDC_TOP_AHB2AXI_BRG_AXI	14
+#define CLK_MSDC_TOP_NR_CLK		15
+
+/* MSDC */
+
+#define CLK_MSDC_AXI_WRAP		0
+#define CLK_MSDC_NR_CLK			1
+
+/* MFGCFG */
+
+#define CLK_MFG_BG3D			0
+#define CLK_MFG_NR_CLK			1
+
+/* MMSYS */
+
+#define CLK_MM_DISP_MUTEX0		0
+#define CLK_MM_DISP_CONFIG		1
+#define CLK_MM_DISP_OVL0		2
+#define CLK_MM_DISP_RDMA0		3
+#define CLK_MM_DISP_OVL0_2L		4
+#define CLK_MM_DISP_WDMA0		5
+#define CLK_MM_DISP_UFBC_WDMA0		6
+#define CLK_MM_DISP_RSZ0		7
+#define CLK_MM_DISP_AAL0		8
+#define CLK_MM_DISP_CCORR0		9
+#define CLK_MM_DISP_DITHER0		10
+#define CLK_MM_SMI_INFRA		11
+#define CLK_MM_DISP_GAMMA0		12
+#define CLK_MM_DISP_POSTMASK0		13
+#define CLK_MM_DISP_DSC_WRAP0		14
+#define CLK_MM_DSI0			15
+#define CLK_MM_DISP_COLOR0		16
+#define CLK_MM_SMI_COMMON		17
+#define CLK_MM_DISP_FAKE_ENG0		18
+#define CLK_MM_DISP_FAKE_ENG1		19
+#define CLK_MM_MDP_TDSHP4		20
+#define CLK_MM_MDP_RSZ4			21
+#define CLK_MM_MDP_AAL4			22
+#define CLK_MM_MDP_HDR4			23
+#define CLK_MM_MDP_RDMA4		24
+#define CLK_MM_MDP_COLOR4		25
+#define CLK_MM_DISP_Y2R0		26
+#define CLK_MM_SMI_GALS			27
+#define CLK_MM_DISP_OVL2_2L		28
+#define CLK_MM_DISP_RDMA4		29
+#define CLK_MM_DISP_DPI0		30
+#define CLK_MM_SMI_IOMMU		31
+#define CLK_MM_DSI_DSI0			32
+#define CLK_MM_DPI_DPI0			33
+#define CLK_MM_26MHZ			34
+#define CLK_MM_32KHZ			35
+#define CLK_MM_NR_CLK			36
+
+/* IMGSYS */
+
+#define CLK_IMG_LARB9			0
+#define CLK_IMG_LARB10			1
+#define CLK_IMG_DIP			2
+#define CLK_IMG_GALS			3
+#define CLK_IMG_NR_CLK			4
+
+/* IMGSYS2 */
+
+#define CLK_IMG2_LARB11			0
+#define CLK_IMG2_LARB12			1
+#define CLK_IMG2_MFB			2
+#define CLK_IMG2_WPE			3
+#define CLK_IMG2_MSS			4
+#define CLK_IMG2_GALS			5
+#define CLK_IMG2_NR_CLK			6
+
+/* VDECSYS_SOC */
+
+#define CLK_VDEC_SOC_LARB1		0
+#define CLK_VDEC_SOC_LAT		1
+#define CLK_VDEC_SOC_LAT_ACTIVE		2
+#define CLK_VDEC_SOC_VDEC		3
+#define CLK_VDEC_SOC_VDEC_ACTIVE	4
+#define CLK_VDEC_SOC_NR_CLK		5
+
+/* VDECSYS */
+
+#define CLK_VDEC_LARB1			0
+#define CLK_VDEC_LAT			1
+#define CLK_VDEC_LAT_ACTIVE		2
+#define CLK_VDEC_VDEC			3
+#define CLK_VDEC_ACTIVE			4
+#define CLK_VDEC_NR_CLK			5
+
+/* VENCSYS */
+
+#define CLK_VENC_SET0_LARB		0
+#define CLK_VENC_SET1_VENC		1
+#define CLK_VENC_SET2_JPGENC		2
+#define CLK_VENC_SET5_GALS		3
+#define CLK_VENC_NR_CLK			4
+
+/* CAMSYS */
+
+#define CLK_CAM_LARB13			0
+#define CLK_CAM_DFP_VAD			1
+#define CLK_CAM_LARB14			2
+#define CLK_CAM_CAM			3
+#define CLK_CAM_CAMTG			4
+#define CLK_CAM_SENINF			5
+#define CLK_CAM_CAMSV0			6
+#define CLK_CAM_CAMSV1			7
+#define CLK_CAM_CAMSV2			8
+#define CLK_CAM_CAMSV3			9
+#define CLK_CAM_CCU0			10
+#define CLK_CAM_CCU1			11
+#define CLK_CAM_MRAW0			12
+#define CLK_CAM_FAKE_ENG		13
+#define CLK_CAM_CCU_GALS		14
+#define CLK_CAM_CAM2MM_GALS		15
+#define CLK_CAM_NR_CLK			16
+
+/* CAMSYS_RAWA */
+
+#define CLK_CAM_RAWA_LARBX		0
+#define CLK_CAM_RAWA_CAM		1
+#define CLK_CAM_RAWA_CAMTG		2
+#define CLK_CAM_RAWA_NR_CLK		3
+
+/* CAMSYS_RAWB */
+
+#define CLK_CAM_RAWB_LARBX		0
+#define CLK_CAM_RAWB_CAM		1
+#define CLK_CAM_RAWB_CAMTG		2
+#define CLK_CAM_RAWB_NR_CLK		3
+
+/* CAMSYS_RAWC */
+
+#define CLK_CAM_RAWC_LARBX		0
+#define CLK_CAM_RAWC_CAM		1
+#define CLK_CAM_RAWC_CAMTG		2
+#define CLK_CAM_RAWC_NR_CLK		3
+
+/* IPESYS */
+
+#define CLK_IPE_LARB19			0
+#define CLK_IPE_LARB20			1
+#define CLK_IPE_SMI_SUBCOM		2
+#define CLK_IPE_FD			3
+#define CLK_IPE_FE			4
+#define CLK_IPE_RSC			5
+#define CLK_IPE_DPE			6
+#define CLK_IPE_GALS			7
+#define CLK_IPE_NR_CLK			8
+
+/* MDPSYS */
+
+#define CLK_MDP_RDMA0			0
+#define CLK_MDP_TDSHP0			1
+#define CLK_MDP_IMG_DL_ASYNC0		2
+#define CLK_MDP_IMG_DL_ASYNC1		3
+#define CLK_MDP_RDMA1			4
+#define CLK_MDP_TDSHP1			5
+#define CLK_MDP_SMI0			6
+#define CLK_MDP_APB_BUS			7
+#define CLK_MDP_WROT0			8
+#define CLK_MDP_RSZ0			9
+#define CLK_MDP_HDR0			10
+#define CLK_MDP_MUTEX0			11
+#define CLK_MDP_WROT1			12
+#define CLK_MDP_RSZ1			13
+#define CLK_MDP_HDR1			14
+#define CLK_MDP_FAKE_ENG0		15
+#define CLK_MDP_AAL0			16
+#define CLK_MDP_AAL1			17
+#define CLK_MDP_COLOR0			18
+#define CLK_MDP_COLOR1			19
+#define CLK_MDP_IMG_DL_RELAY0_ASYNC0	20
+#define CLK_MDP_IMG_DL_RELAY1_ASYNC1	21
+#define CLK_MDP_NR_CLK			22
+
+#endif /* _DT_BINDINGS_CLK_MT8192_H */
-- 
2.18.0

