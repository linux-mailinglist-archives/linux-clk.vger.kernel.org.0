Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D26A4BD362
	for <lists+linux-clk@lfdr.de>; Mon, 21 Feb 2022 03:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245627AbiBUB7j (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 20 Feb 2022 20:59:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245605AbiBUB7f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Feb 2022 20:59:35 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4428517DC;
        Sun, 20 Feb 2022 17:59:10 -0800 (PST)
X-UUID: 32c03bdbdd0249be9e49bbae713f4c55-20220221
X-UUID: 32c03bdbdd0249be9e49bbae713f4c55-20220221
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 456215764; Mon, 21 Feb 2022 09:59:05 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 21 Feb 2022 09:59:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 09:59:03 +0800
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
Subject: [PATCH v2 04/15] clk: mediatek: Add MT8186 infrastructure clock support
Date:   Mon, 21 Feb 2022 09:52:47 +0800
Message-ID: <20220221015258.913-5-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220221015258.913-1-chun-jie.chen@mediatek.com>
References: <20220221015258.913-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MT8186 infrastructure clock controller which provides
clock gate control for basic IP like pwm, uart, spi and so on.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Makefile              |   2 +-
 drivers/clk/mediatek/clk-mt8186-infra_ao.c | 216 +++++++++++++++++++++
 2 files changed, 217 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-infra_ao.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 5685de5254c7..657d43e33d3c 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -71,7 +71,7 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MFGCFG) += clk-mt8183-mfgcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
-obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o
+obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-infra_ao.c b/drivers/clk/mediatek/clk-mt8186-infra_ao.c
new file mode 100644
index 000000000000..2cc9cd52dbf3
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-infra_ao.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mt8186-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+static const struct mtk_gate_regs infra_ao0_cg_regs = {
+	.set_ofs = 0x80,
+	.clr_ofs = 0x84,
+	.sta_ofs = 0x90,
+};
+
+static const struct mtk_gate_regs infra_ao1_cg_regs = {
+	.set_ofs = 0x88,
+	.clr_ofs = 0x8c,
+	.sta_ofs = 0x94,
+};
+
+static const struct mtk_gate_regs infra_ao2_cg_regs = {
+	.set_ofs = 0xa4,
+	.clr_ofs = 0xa8,
+	.sta_ofs = 0xac,
+};
+
+static const struct mtk_gate_regs infra_ao3_cg_regs = {
+	.set_ofs = 0xc0,
+	.clr_ofs = 0xc4,
+	.sta_ofs = 0xc8,
+};
+
+#define GATE_INFRA_AO0_FLAGS(_id, _name, _parent, _shift, _flag)	\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao0_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA_AO0(_id, _name, _parent, _shift)			\
+	GATE_INFRA_AO0_FLAGS(_id, _name, _parent, _shift, 0)
+
+#define GATE_INFRA_AO1_FLAGS(_id, _name, _parent, _shift, _flag)	\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao1_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA_AO1(_id, _name, _parent, _shift)			\
+	GATE_INFRA_AO1_FLAGS(_id, _name, _parent, _shift, 0)
+
+#define GATE_INFRA_AO2_FLAGS(_id, _name, _parent, _shift, _flag)	\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao2_cg_regs, _shift, \
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA_AO2(_id, _name, _parent, _shift)			\
+	GATE_INFRA_AO2_FLAGS(_id, _name, _parent, _shift, 0)
+
+ #define GATE_INFRA_AO3_FLAGS(_id, _name, _parent, _shift, _flag)        \
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao3_cg_regs, _shift, \
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA_AO3(_id, _name, _parent, _shift)			\
+	GATE_INFRA_AO3_FLAGS(_id, _name, _parent, _shift, 0)
+
+static const struct mtk_gate infra_ao_clks[] = {
+	/* INFRA_AO0 */
+	GATE_INFRA_AO0(CLK_INFRA_AO_PMIC_TMR, "infra_ao_pmic_tmr", "top_pwrap_ulposc", 0),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PMIC_AP, "infra_ao_pmic_ap", "top_pwrap_ulposc", 1),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PMIC_MD, "infra_ao_pmic_md", "top_pwrap_ulposc", 2),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PMIC_CONN, "infra_ao_pmic_conn", "top_pwrap_ulposc", 3),
+	/* infra_ao_scp_core are main clock in always-on co-processor. */
+	GATE_INFRA_AO0_FLAGS(CLK_INFRA_AO_SCP_CORE,
+			     "infra_ao_scp_core", "top_scp", 4, CLK_IS_CRITICAL),
+	/* infra_ao_sej is main clock for secure engine with JTAG support */
+	GATE_INFRA_AO0_FLAGS(CLK_INFRA_AO_SEJ,
+			     "infra_ao_sej", "top_axi", 5, CLK_IS_CRITICAL),
+	GATE_INFRA_AO0(CLK_INFRA_AO_APXGPT, "infra_ao_apxgpt", "top_axi", 6),
+	GATE_INFRA_AO0(CLK_INFRA_AO_ICUSB, "infra_ao_icusb", "top_axi", 8),
+	GATE_INFRA_AO0(CLK_INFRA_AO_GCE, "infra_ao_gce", "top_axi", 9),
+	GATE_INFRA_AO0(CLK_INFRA_AO_THERM, "infra_ao_therm", "top_axi", 10),
+	GATE_INFRA_AO0(CLK_INFRA_AO_I2C_AP, "infra_ao_i2c_ap", "top_i2c", 11),
+	GATE_INFRA_AO0(CLK_INFRA_AO_I2C_CCU, "infra_ao_i2c_ccu", "top_i2c", 12),
+	GATE_INFRA_AO0(CLK_INFRA_AO_I2C_SSPM, "infra_ao_i2c_sspm", "top_i2c", 13),
+	GATE_INFRA_AO0(CLK_INFRA_AO_I2C_RSV, "infra_ao_i2c_rsv", "top_i2c", 14),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM_HCLK, "infra_ao_pwm_hclk", "top_axi", 15),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM1, "infra_ao_pwm1", "top_pwm", 16),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM2, "infra_ao_pwm2", "top_pwm", 17),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM3, "infra_ao_pwm3", "top_pwm", 18),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM4, "infra_ao_pwm4", "top_pwm", 19),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM5, "infra_ao_pwm5", "top_pwm", 20),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM, "infra_ao_pwm", "top_pwm", 21),
+	GATE_INFRA_AO0(CLK_INFRA_AO_UART0, "infra_ao_uart0", "top_uart", 22),
+	GATE_INFRA_AO0(CLK_INFRA_AO_UART1, "infra_ao_uart1", "top_uart", 23),
+	GATE_INFRA_AO0(CLK_INFRA_AO_UART2, "infra_ao_uart2", "top_uart", 24),
+	GATE_INFRA_AO0(CLK_INFRA_AO_GCE_26M, "infra_ao_gce_26m", "clk26m", 27),
+	GATE_INFRA_AO0(CLK_INFRA_AO_CQ_DMA_FPC, "infra_ao_dma", "top_axi", 28),
+	GATE_INFRA_AO0(CLK_INFRA_AO_BTIF, "infra_ao_btif", "top_axi", 31),
+	/* INFRA_AO1 */
+	GATE_INFRA_AO1(CLK_INFRA_AO_SPI0, "infra_ao_spi0", "top_spi", 1),
+	GATE_INFRA_AO1(CLK_INFRA_AO_MSDC0, "infra_ao_msdc0", "top_msdc5hclk", 2),
+	GATE_INFRA_AO1(CLK_INFRA_AO_MSDCFDE, "infra_ao_msdcfde", "top_aes_msdcfde", 3),
+	GATE_INFRA_AO1(CLK_INFRA_AO_MSDC1, "infra_ao_msdc1", "top_axi", 4),
+	/* infra_ao_dvfsrc is for internal DVFS usage, should not be handled by Linux */
+	GATE_INFRA_AO1_FLAGS(CLK_INFRA_AO_DVFSRC,
+			     "infra_ao_dvfsrc", "top_dvfsrc", 7, CLK_IS_CRITICAL),
+	GATE_INFRA_AO1(CLK_INFRA_AO_GCPU, "infra_ao_gcpu", "top_axi", 8),
+	GATE_INFRA_AO1(CLK_INFRA_AO_TRNG, "infra_ao_trng", "top_axi", 9),
+	GATE_INFRA_AO1(CLK_INFRA_AO_AUXADC, "infra_ao_auxadc", "clk26m", 10),
+	GATE_INFRA_AO1(CLK_INFRA_AO_CPUM, "infra_ao_cpum", "top_axi", 11),
+	GATE_INFRA_AO1(CLK_INFRA_AO_CCIF1_AP, "infra_ao_ccif1_ap", "top_axi", 12),
+	GATE_INFRA_AO1(CLK_INFRA_AO_CCIF1_MD, "infra_ao_ccif1_md", "top_axi", 13),
+	GATE_INFRA_AO1(CLK_INFRA_AO_AUXADC_MD, "infra_ao_auxadc_md", "clk26m", 14),
+	GATE_INFRA_AO1(CLK_INFRA_AO_AP_DMA, "infra_ao_ap_dma", "top_axi", 18),
+	GATE_INFRA_AO1(CLK_INFRA_AO_XIU, "infra_ao_xiu", "top_axi", 19),
+	/* infra_ao_device_apc is for device access permission control module */
+	GATE_INFRA_AO1_FLAGS(CLK_INFRA_AO_DEVICE_APC,
+			     "infra_ao_dapc", "top_axi", 20, CLK_IS_CRITICAL),
+	GATE_INFRA_AO1(CLK_INFRA_AO_CCIF_AP, "infra_ao_ccif_ap", "top_axi", 23),
+	GATE_INFRA_AO1(CLK_INFRA_AO_DEBUGTOP, "infra_ao_debugtop", "top_axi", 24),
+	GATE_INFRA_AO1(CLK_INFRA_AO_AUDIO, "infra_ao_audio", "top_axi", 25),
+	GATE_INFRA_AO1(CLK_INFRA_AO_CCIF_MD, "infra_ao_ccif_md", "top_axi", 26),
+	GATE_INFRA_AO1(CLK_INFRA_AO_DXCC_SEC_CORE, "infra_ao_secore", "top_dxcc", 27),
+	GATE_INFRA_AO1(CLK_INFRA_AO_DXCC_AO, "infra_ao_dxcc_ao", "top_dxcc", 28),
+	GATE_INFRA_AO1(CLK_INFRA_AO_IMP_IIC, "infra_ao_imp_iic", "top_axi", 29),
+	GATE_INFRA_AO1(CLK_INFRA_AO_DRAMC_F26M, "infra_ao_dramc26", "clk26m", 31),
+	/* INFRA_AO2 */
+	GATE_INFRA_AO2(CLK_INFRA_AO_RG_PWM_FBCLK6, "infra_ao_pwm_fbclk6", "clk26m", 0),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_HCLK, "infra_ao_ssusb_hclk", "top_axi", 1),
+	GATE_INFRA_AO2(CLK_INFRA_AO_DISP_PWM, "infra_ao_disp_pwm", "top_disp_pwm", 2),
+	GATE_INFRA_AO2(CLK_INFRA_AO_CLDMA_BCLK, "infra_ao_cldmabclk", "top_axi", 3),
+	GATE_INFRA_AO2(CLK_INFRA_AO_AUDIO_26M_BCLK, "infra_ao_audio26m", "clk26m", 4),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_P1_HCLK, "infra_ao_ssusb_p1_hclk", "top_axi", 5),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SPI1, "infra_ao_spi1", "top_spi", 6),
+	GATE_INFRA_AO2(CLK_INFRA_AO_I2C4, "infra_ao_i2c4", "top_i2c", 7),
+	GATE_INFRA_AO2(CLK_INFRA_AO_MODEM_TEMP_SHARE, "infra_ao_mdtemp", "clk26m", 8),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SPI2, "infra_ao_spi2", "top_spi", 9),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SPI3, "infra_ao_spi3", "top_spi", 10),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_REF, "infra_ao_ssusb_ref", "clk26m", 11),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_XHCI, "infra_ao_ssusb_xhci", "top_ssusb_xhci", 12),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_P1_REF, "infra_ao_ssusb_p1_ref", "clk26m", 13),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_P1_XHCI,
+		       "infra_ao_ssusb_p1_xhci", "top_ssusb_xhci_1p", 14),
+	/* infra_ao_sspm is main clock in co-processor, should not be closed in Linux. */
+	GATE_INFRA_AO2_FLAGS(CLK_INFRA_AO_SSPM, "infra_ao_sspm", "top_sspm", 15, CLK_IS_CRITICAL),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_P1_SYS,
+		       "infra_ao_ssusb_p1_sys", "top_ssusb_1p", 16),
+	GATE_INFRA_AO2(CLK_INFRA_AO_I2C5, "infra_ao_i2c5", "top_i2c", 18),
+	GATE_INFRA_AO2(CLK_INFRA_AO_I2C5_ARBITER, "infra_ao_i2c5a", "top_i2c", 19),
+	GATE_INFRA_AO2(CLK_INFRA_AO_I2C5_IMM, "infra_ao_i2c5_imm", "top_i2c", 20),
+	GATE_INFRA_AO2(CLK_INFRA_AO_I2C1_ARBITER, "infra_ao_i2c1a", "top_i2c", 21),
+	GATE_INFRA_AO2(CLK_INFRA_AO_I2C1_IMM, "infra_ao_i2c1_imm", "top_i2c", 22),
+	GATE_INFRA_AO2(CLK_INFRA_AO_I2C2_ARBITER, "infra_ao_i2c2a", "top_i2c", 23),
+	GATE_INFRA_AO2(CLK_INFRA_AO_I2C2_IMM, "infra_ao_i2c2_imm", "top_i2c", 24),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SPI4, "infra_ao_spi4", "top_spi", 25),
+	GATE_INFRA_AO2(CLK_INFRA_AO_SPI5, "infra_ao_spi5", "top_spi", 26),
+	GATE_INFRA_AO2(CLK_INFRA_AO_CQ_DMA, "infra_ao_cq_dma", "top_axi", 27),
+	GATE_INFRA_AO2(CLK_INFRA_AO_BIST2FPC, "infra_ao_bist2fpc", "f_bist2fpc_ck", 28),
+	/* INFRA_AO3 */
+	GATE_INFRA_AO3(CLK_INFRA_AO_MSDC0_SELF, "infra_ao_msdc0sf", "top_msdc50_0", 0),
+	GATE_INFRA_AO3(CLK_INFRA_AO_SPINOR, "infra_ao_spinor", "top_spinor", 1),
+	/*
+	 * infra_ao_sspm_26m/infra_ao_sspm_32k are main clocks in co-processor,
+	 * should not be closed in Linux.
+	 */
+	GATE_INFRA_AO3_FLAGS(CLK_INFRA_AO_SSPM_26M_SELF, "infra_ao_sspm_26m", "clk26m", 3,
+			     CLK_IS_CRITICAL),
+	GATE_INFRA_AO3_FLAGS(CLK_INFRA_AO_SSPM_32K_SELF, "infra_ao_sspm_32k", "clk32k", 4,
+			     CLK_IS_CRITICAL),
+	GATE_INFRA_AO3(CLK_INFRA_AO_I2C6, "infra_ao_i2c6", "top_i2c", 6),
+	GATE_INFRA_AO3(CLK_INFRA_AO_AP_MSDC0, "infra_ao_ap_msdc0", "top_axi", 7),
+	GATE_INFRA_AO3(CLK_INFRA_AO_MD_MSDC0, "infra_ao_md_msdc0", "top_axi", 8),
+	GATE_INFRA_AO3(CLK_INFRA_AO_MSDC0_SRC, "infra_ao_msdc0_clk", "top_msdc50_0", 9),
+	GATE_INFRA_AO3(CLK_INFRA_AO_MSDC1_SRC, "infra_ao_msdc1_clk", "top_msdc30_1", 10),
+	/* infra_ao_sej_f13m is main clock for secure engine with JTAG support */
+	GATE_INFRA_AO3_FLAGS(CLK_INFRA_AO_SEJ_F13M,
+			     "infra_ao_sej_f13m", "clk26m", 15, CLK_IS_CRITICAL),
+	/* infra_ao_aes_top0_bclk is for secure encryption */
+	GATE_INFRA_AO3_FLAGS(CLK_INFRA_AO_AES_TOP0_BCLK,
+			     "infra_ao_aes_top0_bclk", "top_axi", 16, CLK_IS_CRITICAL),
+	GATE_INFRA_AO3(CLK_INFRA_AO_MCU_PM_BCLK, "infra_ao_mcu_pm_bclk", "top_axi", 17),
+	GATE_INFRA_AO3(CLK_INFRA_AO_CCIF2_AP, "infra_ao_ccif2_ap", "top_axi", 18),
+	GATE_INFRA_AO3(CLK_INFRA_AO_CCIF2_MD, "infra_ao_ccif2_md", "top_axi", 19),
+	GATE_INFRA_AO3(CLK_INFRA_AO_CCIF3_AP, "infra_ao_ccif3_ap", "top_axi", 20),
+	GATE_INFRA_AO3(CLK_INFRA_AO_CCIF3_MD, "infra_ao_ccif3_md", "top_axi", 21),
+	GATE_INFRA_AO3(CLK_INFRA_AO_FADSP_26M, "infra_ao_fadsp_26m", "clk26m", 22),
+	GATE_INFRA_AO3(CLK_INFRA_AO_FADSP_32K, "infra_ao_fadsp_32k", "clk32k", 23),
+	GATE_INFRA_AO3(CLK_INFRA_AO_CCIF4_AP, "infra_ao_ccif4_ap", "top_axi", 24),
+	GATE_INFRA_AO3(CLK_INFRA_AO_CCIF4_MD, "infra_ao_ccif4_md", "top_axi", 25),
+	GATE_INFRA_AO3(CLK_INFRA_AO_FADSP, "infra_ao_fadsp", "top_audiodsp", 27),
+	GATE_INFRA_AO3(CLK_INFRA_AO_FLASHIF_133M, "infra_ao_flashif_133m", "top_axi", 28),
+	GATE_INFRA_AO3(CLK_INFRA_AO_FLASHIF_66M, "infra_ao_flashif_66m", "top_axi", 29),
+};
+
+static const struct mtk_clk_desc infra_ao_desc = {
+	.clks = infra_ao_clks,
+	.num_clks = ARRAY_SIZE(infra_ao_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8186_infra_ao[] = {
+	{
+		.compatible = "mediatek,mt8186-infracfg_ao",
+		.data = &infra_ao_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8186_infra_ao_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8186-infra-ao",
+		.of_match_table = of_match_clk_mt8186_infra_ao,
+	},
+};
+builtin_platform_driver(clk_mt8186_infra_ao_drv);
-- 
2.18.0

