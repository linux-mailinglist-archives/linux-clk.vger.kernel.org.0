Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4FC3BC681
	for <lists+linux-clk@lfdr.de>; Tue,  6 Jul 2021 08:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhGFGXR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 6 Jul 2021 02:23:17 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:41141 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230364AbhGFGXQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jul 2021 02:23:16 -0400
X-UUID: d101d26c904e40b7b13c3a6ec760d8e1-20210706
X-UUID: d101d26c904e40b7b13c3a6ec760d8e1-20210706
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 171387483; Tue, 06 Jul 2021 14:20:34 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 14:20:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Jul 2021 14:20:33 +0800
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
Subject: [v13 09/21] clk: mediatek: Add MT8192 basic clocks support
Date:   Tue, 6 Jul 2021 14:19:08 +0800
Message-ID: <20210706061920.16013-10-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210706061920.16013-1-chun-jie.chen@mediatek.com>
References: <20210706061920.16013-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MT8192 basic clock providers, include topckgen, apmixedsys,
infracfg and pericfg.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig      |    8 +
 drivers/clk/mediatek/Makefile     |    1 +
 drivers/clk/mediatek/clk-mt8192.c | 1326 +++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mux.c    |    9 +-
 drivers/clk/mediatek/clk-mux.h    |   18 +-
 5 files changed, 1358 insertions(+), 4 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8192.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 886e2d9fced5..6075b48377d5 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -500,6 +500,14 @@ config COMMON_CLK_MT8183_VENCSYS
 	help
 	  This driver supports MediaTek MT8183 vencsys clocks.
 
+config COMMON_CLK_MT8192
+	bool "Clock driver for MediaTek MT8192"
+	depends on ARM64 || COMPILE_TEST
+	select COMMON_CLK_MEDIATEK
+	default ARM64
+	help
+	  This driver supports MediaTek MT8192 basic clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 3b0c2be73824..fcde42160720 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -67,5 +67,6 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MFGCFG) += clk-mt8183-mfgcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
+obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
new file mode 100644
index 000000000000..cbc7c6dbe0f4
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -0,0 +1,1326 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "clk-mtk.h"
+#include "clk-mux.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static DEFINE_SPINLOCK(mt8192_clk_lock);
+
+static const struct mtk_fixed_clk top_fixed_clks[] = {
+	FIXED_CLK(CLK_TOP_ULPOSC, "ulposc", NULL, 260000000),
+};
+
+static const struct mtk_fixed_factor top_early_divs[] = {
+	FACTOR(CLK_TOP_CSW_F26M_D2, "csw_f26m_d2", "clk26m", 1, 2),
+};
+
+static const struct mtk_fixed_factor top_divs[] = {
+	FACTOR(CLK_TOP_MAINPLL_D3, "mainpll_d3", "mainpll", 1, 3),
+	FACTOR(CLK_TOP_MAINPLL_D4, "mainpll_d4", "mainpll", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D4_D2, "mainpll_d4_d2", "mainpll_d4", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D4_D4, "mainpll_d4_d4", "mainpll_d4", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D4_D8, "mainpll_d4_d8", "mainpll_d4", 1, 8),
+	FACTOR(CLK_TOP_MAINPLL_D4_D16, "mainpll_d4_d16", "mainpll_d4", 1, 16),
+	FACTOR(CLK_TOP_MAINPLL_D5, "mainpll_d5", "mainpll", 1, 5),
+	FACTOR(CLK_TOP_MAINPLL_D5_D2, "mainpll_d5_d2", "mainpll_d5", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D5_D4, "mainpll_d5_d4", "mainpll_d5", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D5_D8, "mainpll_d5_d8", "mainpll_d5", 1, 8),
+	FACTOR(CLK_TOP_MAINPLL_D6, "mainpll_d6", "mainpll", 1, 6),
+	FACTOR(CLK_TOP_MAINPLL_D6_D2, "mainpll_d6_d2", "mainpll_d6", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D6_D4, "mainpll_d6_d4", "mainpll_d6", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D7, "mainpll_d7", "mainpll", 1, 7),
+	FACTOR(CLK_TOP_MAINPLL_D7_D2, "mainpll_d7_d2", "mainpll_d7", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D7_D4, "mainpll_d7_d4", "mainpll_d7", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D7_D8, "mainpll_d7_d8", "mainpll_d7", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3),
+	FACTOR(CLK_TOP_UNIVPLL_D4, "univpll_d4", "univpll", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D2, "univpll_d4_d2", "univpll_d4", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D4, "univpll_d4_d4", "univpll_d4", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D8, "univpll_d4_d8", "univpll_d4", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D2, "univpll_d5_d2", "univpll_d5", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D4, "univpll_d5_d4", "univpll_d5", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D8, "univpll_d5_d8", "univpll_d5", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D6, "univpll_d6", "univpll", 1, 6),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D2, "univpll_d6_d2", "univpll_d6", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D4, "univpll_d6_d4", "univpll_d6", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D8, "univpll_d6_d8", "univpll_d6", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D16, "univpll_d6_d16", "univpll_d6", 1, 16),
+	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7),
+	FACTOR(CLK_TOP_APLL1, "apll1_ck", "apll1", 1, 1),
+	FACTOR(CLK_TOP_APLL1_D2, "apll1_d2", "apll1", 1, 2),
+	FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "apll1", 1, 4),
+	FACTOR(CLK_TOP_APLL1_D8, "apll1_d8", "apll1", 1, 8),
+	FACTOR(CLK_TOP_APLL2, "apll2_ck", "apll2", 1, 1),
+	FACTOR(CLK_TOP_APLL2_D2, "apll2_d2", "apll2", 1, 2),
+	FACTOR(CLK_TOP_APLL2_D4, "apll2_d4", "apll2", 1, 4),
+	FACTOR(CLK_TOP_APLL2_D8, "apll2_d8", "apll2", 1, 8),
+	FACTOR(CLK_TOP_MMPLL_D4, "mmpll_d4", "mmpll", 1, 4),
+	FACTOR(CLK_TOP_MMPLL_D4_D2, "mmpll_d4_d2", "mmpll_d4", 1, 2),
+	FACTOR(CLK_TOP_MMPLL_D5, "mmpll_d5", "mmpll", 1, 5),
+	FACTOR(CLK_TOP_MMPLL_D5_D2, "mmpll_d5_d2", "mmpll_d5", 1, 2),
+	FACTOR(CLK_TOP_MMPLL_D6, "mmpll_d6", "mmpll", 1, 6),
+	FACTOR(CLK_TOP_MMPLL_D6_D2, "mmpll_d6_d2", "mmpll_d6", 1, 2),
+	FACTOR(CLK_TOP_MMPLL_D7, "mmpll_d7", "mmpll", 1, 7),
+	FACTOR(CLK_TOP_MMPLL_D9, "mmpll_d9", "mmpll", 1, 9),
+	FACTOR(CLK_TOP_APUPLL, "apupll_ck", "apupll", 1, 2),
+	FACTOR(CLK_TOP_NPUPLL, "npupll_ck", "npupll", 1, 1),
+	FACTOR(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1),
+	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll", 1, 4),
+	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll", 1, 8),
+	FACTOR(CLK_TOP_TVDPLL_D16, "tvdpll_d16", "tvdpll", 1, 16),
+	FACTOR(CLK_TOP_MSDCPLL, "msdcpll_ck", "msdcpll", 1, 1),
+	FACTOR(CLK_TOP_MSDCPLL_D2, "msdcpll_d2", "msdcpll", 1, 2),
+	FACTOR(CLK_TOP_MSDCPLL_D4, "msdcpll_d4", "msdcpll", 1, 4),
+	FACTOR(CLK_TOP_OSC_D2, "osc_d2", "ulposc", 1, 2),
+	FACTOR(CLK_TOP_OSC_D4, "osc_d4", "ulposc", 1, 4),
+	FACTOR(CLK_TOP_OSC_D8, "osc_d8", "ulposc", 1, 8),
+	FACTOR(CLK_TOP_OSC_D10, "osc_d10", "ulposc", 1, 10),
+	FACTOR(CLK_TOP_OSC_D16, "osc_d16", "ulposc", 1, 16),
+	FACTOR(CLK_TOP_OSC_D20, "osc_d20", "ulposc", 1, 20),
+	FACTOR(CLK_TOP_ADSPPLL, "adsppll_ck", "adsppll", 1, 1),
+	FACTOR(CLK_TOP_UNIVPLL_192M, "univpll_192m", "univpll", 1, 13),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D2, "univpll_192m_d2", "univpll_192m", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D4, "univpll_192m_d4", "univpll_192m", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D8, "univpll_192m_d8", "univpll_192m", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D16, "univpll_192m_d16", "univpll_192m", 1, 16),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D32, "univpll_192m_d32", "univpll_192m", 1, 32),
+};
+
+static const char * const axi_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d7_d2",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"mainpll_d6_d2",
+	"osc_d4"
+};
+
+static const char * const spm_parents[] = {
+	"clk26m",
+	"osc_d10",
+	"mainpll_d7_d4",
+	"clk32k"
+};
+
+static const char * const scp_parents[] = {
+	"clk26m",
+	"univpll_d5",
+	"mainpll_d6_d2",
+	"mainpll_d6",
+	"univpll_d6",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const bus_aximem_parents[] = {
+	"clk26m",
+	"mainpll_d7_d2",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"mainpll_d6"
+};
+
+static const char * const disp_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"univpll_d4_d2",
+	"mmpll_d7",
+	"univpll_d6",
+	"mainpll_d4",
+	"mmpll_d5_d2"
+};
+
+static const char * const mdp_parents[] = {
+	"clk26m",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"mainpll_d4_d2",
+	"mmpll_d4_d2",
+	"mainpll_d6",
+	"univpll_d6",
+	"mainpll_d4",
+	"tvdpll_ck",
+	"univpll_d4",
+	"mmpll_d5_d2"
+};
+
+static const char * const img1_parents[] = {
+	"clk26m",
+	"univpll_d4",
+	"tvdpll_ck",
+	"mainpll_d4",
+	"univpll_d5",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"mmpll_d4_d2",
+	"mainpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2"
+};
+
+static const char * const img2_parents[] = {
+	"clk26m",
+	"univpll_d4",
+	"tvdpll_ck",
+	"mainpll_d4",
+	"univpll_d5",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"mmpll_d4_d2",
+	"mainpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2"
+};
+
+static const char * const ipe_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2"
+};
+
+static const char * const dpe_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"univpll_d5_d2",
+	"mmpll_d6_d2"
+};
+
+static const char * const cam_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"univpll_d4",
+	"univpll_d5",
+	"univpll_d6",
+	"mmpll_d7",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"univpll_d6_d2"
+};
+
+static const char * const ccu_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"mainpll_d6",
+	"mmpll_d7",
+	"univpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2",
+	"univpll_d5",
+	"univpll_d6_d2"
+};
+
+static const char * const dsp7_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d6",
+	"mmpll_d6",
+	"univpll_d5",
+	"mmpll_d5",
+	"univpll_d4",
+	"mmpll_d4"
+};
+
+static const char * const mfg_ref_parents[] = {
+	"clk26m",
+	"clk26m",
+	"univpll_d6",
+	"mainpll_d5_d2"
+};
+
+static const char * const mfg_pll_parents[] = {
+	"mfg_ref_sel",
+	"mfgpll"
+};
+
+static const char * const camtg_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg2_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg3_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg4_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg5_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg6_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"csw_f26m_d2",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const uart_parents[] = {
+	"clk26m",
+	"univpll_d6_d8"
+};
+
+static const char * const spi_parents[] = {
+	"clk26m",
+	"mainpll_d5_d4",
+	"mainpll_d6_d4",
+	"msdcpll_d4"
+};
+
+static const char * const msdc50_0_h_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d6_d2"
+};
+
+static const char * const msdc50_0_parents[] = {
+	"clk26m",
+	"msdcpll_ck",
+	"msdcpll_d2",
+	"univpll_d4_d4",
+	"mainpll_d6_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const msdc30_1_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d6_d2",
+	"mainpll_d7_d2",
+	"msdcpll_d2"
+};
+
+static const char * const msdc30_2_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d6_d2",
+	"mainpll_d7_d2",
+	"msdcpll_d2"
+};
+
+static const char * const audio_parents[] = {
+	"clk26m",
+	"mainpll_d5_d8",
+	"mainpll_d7_d8",
+	"mainpll_d4_d16"
+};
+
+static const char * const aud_intbus_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d7_d4"
+};
+
+static const char * const pwrap_ulposc_parents[] = {
+	"osc_d10",
+	"clk26m",
+	"osc_d4",
+	"osc_d8",
+	"osc_d16"
+};
+
+static const char * const atb_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2"
+};
+
+static const char * const dpi_parents[] = {
+	"clk26m",
+	"tvdpll_d2",
+	"tvdpll_d4",
+	"tvdpll_d8",
+	"tvdpll_d16"
+};
+
+static const char * const scam_parents[] = {
+	"clk26m",
+	"mainpll_d5_d4"
+};
+
+static const char * const disp_pwm_parents[] = {
+	"clk26m",
+	"univpll_d6_d4",
+	"osc_d2",
+	"osc_d4",
+	"osc_d16"
+};
+
+static const char * const usb_top_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const ssusb_xhci_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const i2c_parents[] = {
+	"clk26m",
+	"mainpll_d4_d8",
+	"univpll_d5_d4"
+};
+
+static const char * const seninf_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const seninf1_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const seninf2_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const seninf3_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const tl_parents[] = {
+	"clk26m",
+	"univpll_192m_d2",
+	"mainpll_d6_d4"
+};
+
+static const char * const dxcc_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d4_d4",
+	"mainpll_d4_d8"
+};
+
+static const char * const aud_engen1_parents[] = {
+	"clk26m",
+	"apll1_d2",
+	"apll1_d4",
+	"apll1_d8"
+};
+
+static const char * const aud_engen2_parents[] = {
+	"clk26m",
+	"apll2_d2",
+	"apll2_d4",
+	"apll2_d8"
+};
+
+static const char * const aes_ufsfde_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mainpll_d4_d2",
+	"mainpll_d6",
+	"mainpll_d4_d4",
+	"univpll_d4_d2",
+	"univpll_d6"
+};
+
+static const char * const ufs_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d4_d8",
+	"univpll_d4_d4",
+	"mainpll_d6_d2",
+	"mainpll_d5_d2",
+	"msdcpll_d2"
+};
+
+static const char * const aud_1_parents[] = {
+	"clk26m",
+	"apll1_ck"
+};
+
+static const char * const aud_2_parents[] = {
+	"clk26m",
+	"apll2_ck"
+};
+
+static const char * const adsp_parents[] = {
+	"clk26m",
+	"mainpll_d6",
+	"mainpll_d5_d2",
+	"univpll_d4_d4",
+	"univpll_d4",
+	"univpll_d6",
+	"ulposc",
+	"adsppll_ck"
+};
+
+static const char * const dpmaif_main_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"mainpll_d6",
+	"mainpll_d4_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const venc_parents[] = {
+	"clk26m",
+	"mmpll_d7",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"univpll_d6",
+	"mmpll_d6",
+	"mainpll_d5_d2",
+	"mainpll_d6_d2",
+	"mmpll_d9",
+	"univpll_d4_d4",
+	"mainpll_d4",
+	"univpll_d4",
+	"univpll_d5",
+	"univpll_d5_d2",
+	"mainpll_d5"
+};
+
+static const char * const vdec_parents[] = {
+	"clk26m",
+	"univpll_192m_d2",
+	"univpll_d5_d4",
+	"mainpll_d5",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"mmpll_d7",
+	"mmpll_d6",
+	"univpll_d5",
+	"mainpll_d4",
+	"univpll_d4",
+	"univpll_d6"
+};
+
+static const char * const camtm_parents[] = {
+	"clk26m",
+	"univpll_d7",
+	"univpll_d6_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const pwm_parents[] = {
+	"clk26m",
+	"univpll_d4_d8"
+};
+
+static const char * const audio_h_parents[] = {
+	"clk26m",
+	"univpll_d7",
+	"apll1_ck",
+	"apll2_ck"
+};
+
+static const char * const spmi_mst_parents[] = {
+	"clk26m",
+	"csw_f26m_d2",
+	"osc_d8",
+	"osc_d10",
+	"osc_d16",
+	"osc_d20",
+	"clk32k"
+};
+
+static const char * const aes_msdcfde_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d6",
+	"mainpll_d4_d4",
+	"univpll_d4_d2",
+	"univpll_d6"
+};
+
+static const char * const sflash_parents[] = {
+	"clk26m",
+	"mainpll_d7_d8",
+	"univpll_d6_d8",
+	"univpll_d5_d8"
+};
+
+static const char * const apll_i2s0_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s1_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s2_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s3_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s4_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s5_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s6_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s7_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s8_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const char * const apll_i2s9_m_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+/*
+ * CRITICAL CLOCK:
+ * axi_sel is the main bus clock of whole SOC.
+ * spm_sel is the clock of the always-on co-processor.
+ * bus_aximem_sel is clock of the bus that access emi.
+ */
+static const struct mtk_mux top_mtk_muxes[] = {
+	/* CLK_CFG_0 */
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_AXI_SEL, "axi_sel",
+				   axi_parents, 0x010, 0x014, 0x018, 0, 3, 7, 0x004, 0,
+				   CLK_IS_CRITICAL),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SPM_SEL, "spm_sel",
+				   spm_parents, 0x010, 0x014, 0x018, 8, 2, 15, 0x004, 1,
+				   CLK_IS_CRITICAL),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SCP_SEL, "scp_sel",
+			     scp_parents, 0x010, 0x014, 0x018, 16, 3, 23, 0x004, 2),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_BUS_AXIMEM_SEL, "bus_aximem_sel",
+				   bus_aximem_parents, 0x010, 0x014, 0x018, 24, 3, 31, 0x004, 3,
+				   CLK_IS_CRITICAL),
+	/* CLK_CFG_1 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_SEL, "disp_sel",
+			     disp_parents, 0x020, 0x024, 0x028, 0, 4, 7, 0x004, 4),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MDP_SEL, "mdp_sel",
+			     mdp_parents, 0x020, 0x024, 0x028, 8, 4, 15, 0x004, 5),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IMG1_SEL, "img1_sel",
+			     img1_parents, 0x020, 0x024, 0x028, 16, 4, 23, 0x004, 6),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IMG2_SEL, "img2_sel",
+			     img2_parents, 0x020, 0x024, 0x028, 24, 4, 31, 0x004, 7),
+	/* CLK_CFG_2 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IPE_SEL, "ipe_sel",
+			     ipe_parents, 0x030, 0x034, 0x038, 0, 4, 7, 0x004, 8),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPE_SEL, "dpe_sel",
+			     dpe_parents, 0x030, 0x034, 0x038, 8, 3, 15, 0x004, 9),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAM_SEL, "cam_sel",
+			     cam_parents, 0x030, 0x034, 0x038, 16, 4, 23, 0x004, 10),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CCU_SEL, "ccu_sel",
+			     ccu_parents, 0x030, 0x034, 0x038, 24, 4, 31, 0x004, 11),
+	/* CLK_CFG_4 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP7_SEL, "dsp7_sel",
+			     dsp7_parents, 0x050, 0x054, 0x058, 0, 3, 7, 0x004, 16),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
+			     mfg_ref_parents, 0x050, 0x054, 0x058, 16, 2, 23, 0x004, 18),
+	MUX_CLR_SET_UPD(CLK_TOP_MFG_PLL_SEL, "mfg_pll_sel",
+			mfg_pll_parents, 0x050, 0x054, 0x058, 18, 1, -1, -1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG_SEL, "camtg_sel",
+			     camtg_parents, 0x050, 0x054, 0x058, 24, 3, 31, 0x004, 19),
+	/* CLK_CFG_5 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG2_SEL, "camtg2_sel",
+			     camtg2_parents, 0x060, 0x064, 0x068, 0, 3, 7, 0x004, 20),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG3_SEL, "camtg3_sel",
+			     camtg3_parents, 0x060, 0x064, 0x068, 8, 3, 15, 0x004, 21),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG4_SEL, "camtg4_sel",
+			     camtg4_parents, 0x060, 0x064, 0x068, 16, 3, 23, 0x004, 22),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG5_SEL, "camtg5_sel",
+			     camtg5_parents, 0x060, 0x064, 0x068, 24, 3, 31, 0x004, 23),
+	/* CLK_CFG_6 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG6_SEL, "camtg6_sel",
+			     camtg6_parents, 0x070, 0x074, 0x078, 0, 3, 7, 0x004, 24),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_UART_SEL, "uart_sel",
+			     uart_parents, 0x070, 0x074, 0x078, 8, 1, 15, 0x004, 25),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SPI_SEL, "spi_sel",
+			     spi_parents, 0x070, 0x074, 0x078, 16, 2, 23, 0x004, 26),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC50_0_H_SEL, "msdc50_0_h_sel",
+			     msdc50_0_h_parents, 0x070, 0x074, 0x078, 24, 2, 31, 0x004, 27),
+	/* CLK_CFG_7 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC50_0_SEL, "msdc50_0_sel",
+			     msdc50_0_parents, 0x080, 0x084, 0x088, 0, 3, 7, 0x004, 28),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC30_1_SEL, "msdc30_1_sel",
+			     msdc30_1_parents, 0x080, 0x084, 0x088, 8, 3, 15, 0x004, 29),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC30_2_SEL, "msdc30_2_sel",
+			     msdc30_2_parents, 0x080, 0x084, 0x088, 16, 3, 23, 0x004, 30),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUDIO_SEL, "audio_sel",
+			     audio_parents, 0x080, 0x084, 0x088, 24, 2, 31, 0x008, 0),
+	/* CLK_CFG_8 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_INTBUS_SEL, "aud_intbus_sel",
+			     aud_intbus_parents, 0x090, 0x094, 0x098, 0, 2, 7, 0x008, 1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_PWRAP_ULPOSC_SEL, "pwrap_ulposc_sel",
+			     pwrap_ulposc_parents, 0x090, 0x094, 0x098, 8, 3, 15, 0x008, 2),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ATB_SEL, "atb_sel",
+			     atb_parents, 0x090, 0x094, 0x098, 16, 2, 23, 0x008, 3),
+	/* CLK_CFG_9 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPI_SEL, "dpi_sel",
+			     dpi_parents, 0x0a0, 0x0a4, 0x0a8, 0, 3, 7, 0x008, 5),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SCAM_SEL, "scam_sel",
+			     scam_parents, 0x0a0, 0x0a4, 0x0a8, 8, 1, 15, 0x008, 6),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_PWM_SEL, "disp_pwm_sel",
+			     disp_pwm_parents, 0x0a0, 0x0a4, 0x0a8, 16, 3, 23, 0x008, 7),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_USB_TOP_SEL, "usb_top_sel",
+			     usb_top_parents, 0x0a0, 0x0a4, 0x0a8, 24, 2, 31, 0x008, 8),
+	/* CLK_CFG_10 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSUSB_XHCI_SEL, "ssusb_xhci_sel",
+			     ssusb_xhci_parents, 0x0b0, 0x0b4, 0x0b8, 0, 2, 7, 0x008, 9),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_I2C_SEL, "i2c_sel",
+			     i2c_parents, 0x0b0, 0x0b4, 0x0b8, 8, 2, 15, 0x008, 10),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF_SEL, "seninf_sel",
+			     seninf_parents, 0x0b0, 0x0b4, 0x0b8, 16, 3, 23, 0x008, 11),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF1_SEL, "seninf1_sel",
+			     seninf1_parents, 0x0b0, 0x0b4, 0x0b8, 24, 3, 31, 0x008, 12),
+	/* CLK_CFG_11 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF2_SEL, "seninf2_sel",
+			     seninf2_parents, 0x0c0, 0x0c4, 0x0c8, 0, 3, 7, 0x008, 13),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF3_SEL, "seninf3_sel",
+			     seninf3_parents, 0x0c0, 0x0c4, 0x0c8, 8, 3, 15, 0x008, 14),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_TL_SEL, "tl_sel",
+			     tl_parents, 0x0c0, 0x0c4, 0x0c8, 16, 2, 23, 0x008, 15),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DXCC_SEL, "dxcc_sel",
+			     dxcc_parents, 0x0c0, 0x0c4, 0x0c8, 24, 2, 31, 0x008, 16),
+	/* CLK_CFG_12 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_ENGEN1_SEL, "aud_engen1_sel",
+			     aud_engen1_parents, 0x0d0, 0x0d4, 0x0d8, 0, 2, 7, 0x008, 17),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_ENGEN2_SEL, "aud_engen2_sel",
+			     aud_engen2_parents, 0x0d0, 0x0d4, 0x0d8, 8, 2, 15, 0x008, 18),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AES_UFSFDE_SEL, "aes_ufsfde_sel",
+			     aes_ufsfde_parents, 0x0d0, 0x0d4, 0x0d8, 16, 3, 23, 0x008, 19),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_UFS_SEL, "ufs_sel",
+			     ufs_parents, 0x0d0, 0x0d4, 0x0d8, 24, 3, 31, 0x008, 20),
+	/* CLK_CFG_13 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_1_SEL, "aud_1_sel",
+			     aud_1_parents, 0x0e0, 0x0e4, 0x0e8, 0, 1, 7, 0x008, 21),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_2_SEL, "aud_2_sel",
+			     aud_2_parents, 0x0e0, 0x0e4, 0x0e8, 8, 1, 15, 0x008, 22),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ADSP_SEL, "adsp_sel",
+			     adsp_parents, 0x0e0, 0x0e4, 0x0e8, 16, 3, 23, 0x008, 23),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPMAIF_MAIN_SEL, "dpmaif_main_sel",
+			     dpmaif_main_parents, 0x0e0, 0x0e4, 0x0e8, 24, 3, 31, 0x008, 24),
+	/* CLK_CFG_14 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_VENC_SEL, "venc_sel",
+			     venc_parents, 0x0f0, 0x0f4, 0x0f8, 0, 4, 7, 0x008, 25),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_VDEC_SEL, "vdec_sel",
+			     vdec_parents, 0x0f0, 0x0f4, 0x0f8, 8, 4, 15, 0x008, 26),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTM_SEL, "camtm_sel",
+			     camtm_parents, 0x0f0, 0x0f4, 0x0f8, 16, 2, 23, 0x008, 27),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_PWM_SEL, "pwm_sel",
+			     pwm_parents, 0x0f0, 0x0f4, 0x0f8, 24, 1, 31, 0x008, 28),
+	/* CLK_CFG_15 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUDIO_H_SEL, "audio_h_sel",
+			     audio_h_parents, 0x100, 0x104, 0x108, 0, 2, 7, 0x008, 29),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SPMI_MST_SEL, "spmi_mst_sel",
+			     spmi_mst_parents, 0x100, 0x104, 0x108, 8, 3, 15, 0x008, 30),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AES_MSDCFDE_SEL, "aes_msdcfde_sel",
+			     aes_msdcfde_parents, 0x100, 0x104, 0x108, 24, 3, 31, 0x00c, 1),
+	/* CLK_CFG_16 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SFLASH_SEL, "sflash_sel",
+			     sflash_parents, 0x110, 0x114, 0x118, 8, 2, 15, 0x00c, 3),
+};
+
+static struct mtk_composite top_muxes[] = {
+	/* CLK_AUDDIV_0 */
+	MUX(CLK_TOP_APLL_I2S0_M_SEL, "apll_i2s0_m_sel", apll_i2s0_m_parents, 0x320, 16, 1),
+	MUX(CLK_TOP_APLL_I2S1_M_SEL, "apll_i2s1_m_sel", apll_i2s1_m_parents, 0x320, 17, 1),
+	MUX(CLK_TOP_APLL_I2S2_M_SEL, "apll_i2s2_m_sel", apll_i2s2_m_parents, 0x320, 18, 1),
+	MUX(CLK_TOP_APLL_I2S3_M_SEL, "apll_i2s3_m_sel", apll_i2s3_m_parents, 0x320, 19, 1),
+	MUX(CLK_TOP_APLL_I2S4_M_SEL, "apll_i2s4_m_sel", apll_i2s4_m_parents, 0x320, 20, 1),
+	MUX(CLK_TOP_APLL_I2S5_M_SEL, "apll_i2s5_m_sel", apll_i2s5_m_parents, 0x320, 21, 1),
+	MUX(CLK_TOP_APLL_I2S6_M_SEL, "apll_i2s6_m_sel", apll_i2s6_m_parents, 0x320, 22, 1),
+	MUX(CLK_TOP_APLL_I2S7_M_SEL, "apll_i2s7_m_sel", apll_i2s7_m_parents, 0x320, 23, 1),
+	MUX(CLK_TOP_APLL_I2S8_M_SEL, "apll_i2s8_m_sel", apll_i2s8_m_parents, 0x320, 24, 1),
+	MUX(CLK_TOP_APLL_I2S9_M_SEL, "apll_i2s9_m_sel", apll_i2s9_m_parents, 0x320, 25, 1),
+};
+
+static const struct mtk_composite top_adj_divs[] = {
+	DIV_GATE(CLK_TOP_APLL12_DIV0, "apll12_div0", "apll_i2s0_m_sel", 0x320, 0, 0x328, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_DIV1, "apll12_div1", "apll_i2s1_m_sel", 0x320, 1, 0x328, 8, 8),
+	DIV_GATE(CLK_TOP_APLL12_DIV2, "apll12_div2", "apll_i2s2_m_sel", 0x320, 2, 0x328, 8, 16),
+	DIV_GATE(CLK_TOP_APLL12_DIV3, "apll12_div3", "apll_i2s3_m_sel", 0x320, 3, 0x328, 8, 24),
+	DIV_GATE(CLK_TOP_APLL12_DIV4, "apll12_div4", "apll_i2s4_m_sel", 0x320, 4, 0x334, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_DIVB, "apll12_divb", "apll12_div4", 0x320, 5, 0x334, 8, 8),
+	DIV_GATE(CLK_TOP_APLL12_DIV5, "apll12_div5", "apll_i2s5_m_sel", 0x320, 6, 0x334, 8, 16),
+	DIV_GATE(CLK_TOP_APLL12_DIV6, "apll12_div6", "apll_i2s6_m_sel", 0x320, 7, 0x334, 8, 24),
+	DIV_GATE(CLK_TOP_APLL12_DIV7, "apll12_div7", "apll_i2s7_m_sel", 0x320, 8, 0x338, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_DIV8, "apll12_div8", "apll_i2s8_m_sel", 0x320, 9, 0x338, 8, 8),
+	DIV_GATE(CLK_TOP_APLL12_DIV9, "apll12_div9", "apll_i2s9_m_sel", 0x320, 10, 0x338, 8, 16),
+};
+
+static const struct mtk_gate_regs apmixed_cg_regs = {
+	.set_ofs = 0x14,
+	.clr_ofs = 0x14,
+	.sta_ofs = 0x14,
+};
+
+#define GATE_APMIXED(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &apmixed_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate apmixed_clks[] = {
+	GATE_APMIXED(CLK_APMIXED_MIPID26M, "mipid26m", "clk26m", 16),
+};
+
+static const struct mtk_gate_regs infra0_cg_regs = {
+	.set_ofs = 0x80,
+	.clr_ofs = 0x84,
+	.sta_ofs = 0x90,
+};
+
+static const struct mtk_gate_regs infra1_cg_regs = {
+	.set_ofs = 0x88,
+	.clr_ofs = 0x8c,
+	.sta_ofs = 0x94,
+};
+
+static const struct mtk_gate_regs infra2_cg_regs = {
+	.set_ofs = 0xa4,
+	.clr_ofs = 0xa8,
+	.sta_ofs = 0xac,
+};
+
+static const struct mtk_gate_regs infra3_cg_regs = {
+	.set_ofs = 0xc0,
+	.clr_ofs = 0xc4,
+	.sta_ofs = 0xc8,
+};
+
+static const struct mtk_gate_regs infra4_cg_regs = {
+	.set_ofs = 0xd0,
+	.clr_ofs = 0xd4,
+	.sta_ofs = 0xd8,
+};
+
+static const struct mtk_gate_regs infra5_cg_regs = {
+	.set_ofs = 0xe0,
+	.clr_ofs = 0xe4,
+	.sta_ofs = 0xe8,
+};
+
+#define GATE_INFRA0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &infra0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_INFRA1_FLAGS(_id, _name, _parent, _shift, _flag)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra1_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA1(_id, _name, _parent, _shift)	\
+	GATE_INFRA1_FLAGS(_id, _name, _parent, _shift, 0)
+
+#define GATE_INFRA2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &infra2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_INFRA3_FLAGS(_id, _name, _parent, _shift, _flag)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra3_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA3(_id, _name, _parent, _shift)	\
+	GATE_INFRA3_FLAGS(_id, _name, _parent, _shift, 0)
+
+#define GATE_INFRA4(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &infra4_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_INFRA5_FLAGS(_id, _name, _parent, _shift, _flag)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra5_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA5(_id, _name, _parent, _shift)	\
+	GATE_INFRA5_FLAGS(_id, _name, _parent, _shift, 0)
+
+/*
+ * CRITICAL CLOCK:
+ * infra_133m and infra_66m are main peripheral bus clocks of SOC.
+ * infra_device_apc and infra_device_apc_sync are for device access permission control module.
+ */
+static const struct mtk_gate infra_clks[] = {
+	/* INFRA0 */
+	GATE_INFRA0(CLK_INFRA_PMIC_TMR, "infra_pmic_tmr", "pwrap_ulposc_sel", 0),
+	GATE_INFRA0(CLK_INFRA_PMIC_AP, "infra_pmic_ap", "pwrap_ulposc_sel", 1),
+	GATE_INFRA0(CLK_INFRA_PMIC_MD, "infra_pmic_md", "pwrap_ulposc_sel", 2),
+	GATE_INFRA0(CLK_INFRA_PMIC_CONN, "infra_pmic_conn", "pwrap_ulposc_sel", 3),
+	GATE_INFRA0(CLK_INFRA_SCPSYS, "infra_scpsys", "scp_sel", 4),
+	GATE_INFRA0(CLK_INFRA_SEJ, "infra_sej", "axi_sel", 5),
+	GATE_INFRA0(CLK_INFRA_APXGPT, "infra_apxgpt", "axi_sel", 6),
+	GATE_INFRA0(CLK_INFRA_GCE, "infra_gce", "axi_sel", 8),
+	GATE_INFRA0(CLK_INFRA_GCE2, "infra_gce2", "axi_sel", 9),
+	GATE_INFRA0(CLK_INFRA_THERM, "infra_therm", "axi_sel", 10),
+	GATE_INFRA0(CLK_INFRA_I2C0, "infra_i2c0", "i2c_sel", 11),
+	GATE_INFRA0(CLK_INFRA_AP_DMA_PSEUDO, "infra_ap_dma_pseudo", "axi_sel", 12),
+	GATE_INFRA0(CLK_INFRA_I2C2, "infra_i2c2", "i2c_sel", 13),
+	GATE_INFRA0(CLK_INFRA_I2C3, "infra_i2c3", "i2c_sel", 14),
+	GATE_INFRA0(CLK_INFRA_PWM_H, "infra_pwm_h", "axi_sel", 15),
+	GATE_INFRA0(CLK_INFRA_PWM1, "infra_pwm1", "pwm_sel", 16),
+	GATE_INFRA0(CLK_INFRA_PWM2, "infra_pwm2", "pwm_sel", 17),
+	GATE_INFRA0(CLK_INFRA_PWM3, "infra_pwm3", "pwm_sel", 18),
+	GATE_INFRA0(CLK_INFRA_PWM4, "infra_pwm4", "pwm_sel", 19),
+	GATE_INFRA0(CLK_INFRA_PWM, "infra_pwm", "pwm_sel", 21),
+	GATE_INFRA0(CLK_INFRA_UART0, "infra_uart0", "uart_sel", 22),
+	GATE_INFRA0(CLK_INFRA_UART1, "infra_uart1", "uart_sel", 23),
+	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2", "uart_sel", 24),
+	GATE_INFRA0(CLK_INFRA_UART3, "infra_uart3", "uart_sel", 25),
+	GATE_INFRA0(CLK_INFRA_GCE_26M, "infra_gce_26m", "axi_sel", 27),
+	GATE_INFRA0(CLK_INFRA_CQ_DMA_FPC, "infra_cq_dma_fpc", "axi_sel", 28),
+	GATE_INFRA0(CLK_INFRA_BTIF, "infra_btif", "axi_sel", 31),
+	/* INFRA1 */
+	GATE_INFRA1(CLK_INFRA_SPI0, "infra_spi0", "spi_sel", 1),
+	GATE_INFRA1(CLK_INFRA_MSDC0, "infra_msdc0", "msdc50_0_h_sel", 2),
+	GATE_INFRA1(CLK_INFRA_MSDC1, "infra_msdc1", "msdc50_0_h_sel", 4),
+	GATE_INFRA1(CLK_INFRA_MSDC2, "infra_msdc2", "msdc50_0_h_sel", 5),
+	GATE_INFRA1(CLK_INFRA_MSDC0_SRC, "infra_msdc0_src", "msdc50_0_sel", 6),
+	GATE_INFRA1(CLK_INFRA_GCPU, "infra_gcpu", "axi_sel", 8),
+	GATE_INFRA1(CLK_INFRA_TRNG, "infra_trng", "axi_sel", 9),
+	GATE_INFRA1(CLK_INFRA_AUXADC, "infra_auxadc", "clk26m", 10),
+	GATE_INFRA1(CLK_INFRA_CPUM, "infra_cpum", "axi_sel", 11),
+	GATE_INFRA1(CLK_INFRA_CCIF1_AP, "infra_ccif1_ap", "axi_sel", 12),
+	GATE_INFRA1(CLK_INFRA_CCIF1_MD, "infra_ccif1_md", "axi_sel", 13),
+	GATE_INFRA1(CLK_INFRA_AUXADC_MD, "infra_auxadc_md", "clk26m", 14),
+	GATE_INFRA1(CLK_INFRA_PCIE_TL_26M, "infra_pcie_tl_26m", "axi_sel", 15),
+	GATE_INFRA1(CLK_INFRA_MSDC1_SRC, "infra_msdc1_src", "msdc30_1_sel", 16),
+	GATE_INFRA1(CLK_INFRA_MSDC2_SRC, "infra_msdc2_src", "msdc30_2_sel", 17),
+	GATE_INFRA1(CLK_INFRA_PCIE_TL_96M, "infra_pcie_tl_96m", "tl_sel", 18),
+	GATE_INFRA1(CLK_INFRA_PCIE_PL_P_250M, "infra_pcie_pl_p_250m", "axi_sel", 19),
+	GATE_INFRA1_FLAGS(CLK_INFRA_DEVICE_APC, "infra_device_apc", "axi_sel", 20, CLK_IS_CRITICAL),
+	GATE_INFRA1(CLK_INFRA_CCIF_AP, "infra_ccif_ap", "axi_sel", 23),
+	GATE_INFRA1(CLK_INFRA_DEBUGSYS, "infra_debugsys", "axi_sel", 24),
+	GATE_INFRA1(CLK_INFRA_AUDIO, "infra_audio", "axi_sel", 25),
+	GATE_INFRA1(CLK_INFRA_CCIF_MD, "infra_ccif_md", "axi_sel", 26),
+	GATE_INFRA1(CLK_INFRA_DXCC_SEC_CORE, "infra_dxcc_sec_core", "dxcc_sel", 27),
+	GATE_INFRA1(CLK_INFRA_DXCC_AO, "infra_dxcc_ao", "dxcc_sel", 28),
+	GATE_INFRA1(CLK_INFRA_DBG_TRACE, "infra_dbg_trace", "axi_sel", 29),
+	GATE_INFRA1(CLK_INFRA_DEVMPU_B, "infra_devmpu_b", "axi_sel", 30),
+	GATE_INFRA1(CLK_INFRA_DRAMC_F26M, "infra_dramc_f26m", "clk26m", 31),
+	/* INFRA2 */
+	GATE_INFRA2(CLK_INFRA_IRTX, "infra_irtx", "clk26m", 0),
+	GATE_INFRA2(CLK_INFRA_SSUSB, "infra_ssusb", "usb_top_sel", 1),
+	GATE_INFRA2(CLK_INFRA_DISP_PWM, "infra_disp_pwm", "axi_sel", 2),
+	GATE_INFRA2(CLK_INFRA_CLDMA_B, "infra_cldma_b", "axi_sel", 3),
+	GATE_INFRA2(CLK_INFRA_AUDIO_26M_B, "infra_audio_26m_b", "clk26m", 4),
+	GATE_INFRA2(CLK_INFRA_MODEM_TEMP_SHARE, "infra_modem_temp_share", "clk26m", 5),
+	GATE_INFRA2(CLK_INFRA_SPI1, "infra_spi1", "spi_sel", 6),
+	GATE_INFRA2(CLK_INFRA_I2C4, "infra_i2c4", "i2c_sel", 7),
+	GATE_INFRA2(CLK_INFRA_SPI2, "infra_spi2", "spi_sel", 9),
+	GATE_INFRA2(CLK_INFRA_SPI3, "infra_spi3", "spi_sel", 10),
+	GATE_INFRA2(CLK_INFRA_UNIPRO_SYS, "infra_unipro_sys", "ufs_sel", 11),
+	GATE_INFRA2(CLK_INFRA_UNIPRO_TICK, "infra_unipro_tick", "clk26m", 12),
+	GATE_INFRA2(CLK_INFRA_UFS_MP_SAP_B, "infra_ufs_mp_sap_b", "clk26m", 13),
+	GATE_INFRA2(CLK_INFRA_MD32_B, "infra_md32_b", "axi_sel", 14),
+	GATE_INFRA2(CLK_INFRA_UNIPRO_MBIST, "infra_unipro_mbist", "axi_sel", 16),
+	GATE_INFRA2(CLK_INFRA_I2C5, "infra_i2c5", "i2c_sel", 18),
+	GATE_INFRA2(CLK_INFRA_I2C5_ARBITER, "infra_i2c5_arbiter", "i2c_sel", 19),
+	GATE_INFRA2(CLK_INFRA_I2C5_IMM, "infra_i2c5_imm", "i2c_sel", 20),
+	GATE_INFRA2(CLK_INFRA_I2C1_ARBITER, "infra_i2c1_arbiter", "i2c_sel", 21),
+	GATE_INFRA2(CLK_INFRA_I2C1_IMM, "infra_i2c1_imm", "i2c_sel", 22),
+	GATE_INFRA2(CLK_INFRA_I2C2_ARBITER, "infra_i2c2_arbiter", "i2c_sel", 23),
+	GATE_INFRA2(CLK_INFRA_I2C2_IMM, "infra_i2c2_imm", "i2c_sel", 24),
+	GATE_INFRA2(CLK_INFRA_SPI4, "infra_spi4", "spi_sel", 25),
+	GATE_INFRA2(CLK_INFRA_SPI5, "infra_spi5", "spi_sel", 26),
+	GATE_INFRA2(CLK_INFRA_CQ_DMA, "infra_cq_dma", "axi_sel", 27),
+	GATE_INFRA2(CLK_INFRA_UFS, "infra_ufs", "ufs_sel", 28),
+	GATE_INFRA2(CLK_INFRA_AES_UFSFDE, "infra_aes_ufsfde", "aes_ufsfde_sel", 29),
+	GATE_INFRA2(CLK_INFRA_UFS_TICK, "infra_ufs_tick", "ufs_sel", 30),
+	GATE_INFRA2(CLK_INFRA_SSUSB_XHCI, "infra_ssusb_xhci", "ssusb_xhci_sel", 31),
+	/* INFRA3 */
+	GATE_INFRA3(CLK_INFRA_MSDC0_SELF, "infra_msdc0_self", "msdc50_0_sel", 0),
+	GATE_INFRA3(CLK_INFRA_MSDC1_SELF, "infra_msdc1_self", "msdc50_0_sel", 1),
+	GATE_INFRA3(CLK_INFRA_MSDC2_SELF, "infra_msdc2_self", "msdc50_0_sel", 2),
+	GATE_INFRA3(CLK_INFRA_UFS_AXI, "infra_ufs_axi", "axi_sel", 5),
+	GATE_INFRA3(CLK_INFRA_I2C6, "infra_i2c6", "i2c_sel", 6),
+	GATE_INFRA3(CLK_INFRA_AP_MSDC0, "infra_ap_msdc0", "msdc50_0_sel", 7),
+	GATE_INFRA3(CLK_INFRA_MD_MSDC0, "infra_md_msdc0", "msdc50_0_sel", 8),
+	GATE_INFRA3(CLK_INFRA_CCIF5_AP, "infra_ccif5_ap", "axi_sel", 9),
+	GATE_INFRA3(CLK_INFRA_CCIF5_MD, "infra_ccif5_md", "axi_sel", 10),
+	GATE_INFRA3(CLK_INFRA_PCIE_TOP_H_133M, "infra_pcie_top_h_133m", "axi_sel", 11),
+	GATE_INFRA3(CLK_INFRA_FLASHIF_TOP_H_133M, "infra_flashif_top_h_133m", "axi_sel", 14),
+	GATE_INFRA3(CLK_INFRA_PCIE_PERI_26M, "infra_pcie_peri_26m", "axi_sel", 15),
+	GATE_INFRA3(CLK_INFRA_CCIF2_AP, "infra_ccif2_ap", "axi_sel", 16),
+	GATE_INFRA3(CLK_INFRA_CCIF2_MD, "infra_ccif2_md", "axi_sel", 17),
+	GATE_INFRA3(CLK_INFRA_CCIF3_AP, "infra_ccif3_ap", "axi_sel", 18),
+	GATE_INFRA3(CLK_INFRA_CCIF3_MD, "infra_ccif3_md", "axi_sel", 19),
+	GATE_INFRA3(CLK_INFRA_SEJ_F13M, "infra_sej_f13m", "clk26m", 20),
+	GATE_INFRA3(CLK_INFRA_AES, "infra_aes", "axi_sel", 21),
+	GATE_INFRA3(CLK_INFRA_I2C7, "infra_i2c7", "i2c_sel", 22),
+	GATE_INFRA3(CLK_INFRA_I2C8, "infra_i2c8", "i2c_sel", 23),
+	GATE_INFRA3(CLK_INFRA_FBIST2FPC, "infra_fbist2fpc", "msdc50_0_sel", 24),
+	GATE_INFRA3_FLAGS(CLK_INFRA_DEVICE_APC_SYNC, "infra_device_apc_sync", "axi_sel", 25,
+			  CLK_IS_CRITICAL),
+	GATE_INFRA3(CLK_INFRA_DPMAIF_MAIN, "infra_dpmaif_main", "dpmaif_main_sel", 26),
+	GATE_INFRA3(CLK_INFRA_PCIE_TL_32K, "infra_pcie_tl_32k", "axi_sel", 27),
+	GATE_INFRA3(CLK_INFRA_CCIF4_AP, "infra_ccif4_ap", "axi_sel", 28),
+	GATE_INFRA3(CLK_INFRA_CCIF4_MD, "infra_ccif4_md", "axi_sel", 29),
+	GATE_INFRA3(CLK_INFRA_SPI6, "infra_spi6", "spi_sel", 30),
+	GATE_INFRA3(CLK_INFRA_SPI7, "infra_spi7", "spi_sel", 31),
+	/* INFRA4 */
+	GATE_INFRA4(CLK_INFRA_AP_DMA, "infra_ap_dma", "infra_ap_dma_pseudo", 31),
+	/* INFRA5 */
+	GATE_INFRA5_FLAGS(CLK_INFRA_133M, "infra_133m", "axi_sel", 0, CLK_IS_CRITICAL),
+	GATE_INFRA5_FLAGS(CLK_INFRA_66M, "infra_66m", "axi_sel", 1, CLK_IS_CRITICAL),
+	GATE_INFRA5(CLK_INFRA_66M_PERI_BUS, "infra_66m_peri_bus", "axi_sel", 2),
+	GATE_INFRA5(CLK_INFRA_FREE_DCM_133M, "infra_free_dcm_133m", "axi_sel", 3),
+	GATE_INFRA5(CLK_INFRA_FREE_DCM_66M, "infra_free_dcm_66m", "axi_sel", 4),
+	GATE_INFRA5(CLK_INFRA_PERI_BUS_DCM_133M, "infra_peri_bus_dcm_133m", "axi_sel", 5),
+	GATE_INFRA5(CLK_INFRA_PERI_BUS_DCM_66M, "infra_peri_bus_dcm_66m", "axi_sel", 6),
+	GATE_INFRA5(CLK_INFRA_FLASHIF_PERI_26M, "infra_flashif_peri_26m", "axi_sel", 30),
+	GATE_INFRA5(CLK_INFRA_FLASHIF_SFLASH, "infra_flashif_fsflash", "axi_sel", 31),
+};
+
+static const struct mtk_gate_regs peri_cg_regs = {
+	.set_ofs = 0x20c,
+	.clr_ofs = 0x20c,
+	.sta_ofs = 0x20c,
+};
+
+#define GATE_PERI(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &peri_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate peri_clks[] = {
+	GATE_PERI(CLK_PERI_PERIAXI, "peri_periaxi", "axi_sel", 31),
+};
+
+static const struct mtk_gate_regs top_cg_regs = {
+	.set_ofs = 0x150,
+	.clr_ofs = 0x150,
+	.sta_ofs = 0x150,
+};
+
+#define GATE_TOP(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &top_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate top_clks[] = {
+	GATE_TOP(CLK_TOP_SSUSB_TOP_REF, "ssusb_top_ref", "clk26m", 24),
+	GATE_TOP(CLK_TOP_SSUSB_PHY_REF, "ssusb_phy_ref", "clk26m", 25),
+};
+
+#define MT8192_PLL_FMAX		(3800UL * MHZ)
+#define MT8192_PLL_FMIN		(1500UL * MHZ)
+#define MT8192_INTEGER_BITS	8
+
+#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,		\
+			_rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,	\
+			_tuner_reg, _tuner_en_reg, _tuner_en_bit,	\
+			_pcw_reg, _pcw_shift, _pcw_chg_reg,		\
+			_en_reg, _pll_en_bit) {				\
+		.id = _id,						\
+		.name = _name,						\
+		.reg = _reg,						\
+		.pwr_reg = _pwr_reg,					\
+		.en_mask = _en_mask,					\
+		.flags = _flags,					\
+		.rst_bar_mask = _rst_bar_mask,				\
+		.fmax = MT8192_PLL_FMAX,				\
+		.fmin = MT8192_PLL_FMIN,				\
+		.pcwbits = _pcwbits,					\
+		.pcwibits = MT8192_INTEGER_BITS,			\
+		.pd_reg = _pd_reg,					\
+		.pd_shift = _pd_shift,					\
+		.tuner_reg = _tuner_reg,				\
+		.tuner_en_reg = _tuner_en_reg,				\
+		.tuner_en_bit = _tuner_en_bit,				\
+		.pcw_reg = _pcw_reg,					\
+		.pcw_shift = _pcw_shift,				\
+		.pcw_chg_reg = _pcw_chg_reg,				\
+		.en_reg = _en_reg,					\
+		.pll_en_bit = _pll_en_bit,				\
+	}
+
+#define PLL_B(_id, _name, _reg, _pwr_reg, _en_mask, _flags,		\
+			_rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,	\
+			_tuner_reg, _tuner_en_reg, _tuner_en_bit,	\
+			_pcw_reg, _pcw_shift)				\
+		PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,	\
+			_rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,	\
+			_tuner_reg, _tuner_en_reg, _tuner_en_bit,	\
+			_pcw_reg, _pcw_shift, 0, 0, 0)
+
+static const struct mtk_pll_data plls[] = {
+	PLL_B(CLK_APMIXED_MAINPLL, "mainpll", 0x0340, 0x034c, 0xff000000,
+	      HAVE_RST_BAR, BIT(23), 22, 0x0344, 24, 0, 0, 0, 0x0344, 0),
+	PLL_B(CLK_APMIXED_UNIVPLL, "univpll", 0x0308, 0x0314, 0xff000000,
+	      HAVE_RST_BAR, BIT(23), 22, 0x030c, 24, 0, 0, 0, 0x030c, 0),
+	PLL(CLK_APMIXED_USBPLL, "usbpll", 0x03c4, 0x03cc, 0x00000000,
+	    0, 0, 22, 0x03c4, 24, 0, 0, 0, 0x03c4, 0, 0x03c4, 0x03cc, 2),
+	PLL_B(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0350, 0x035c, 0x00000000,
+	      0, 0, 22, 0x0354, 24, 0, 0, 0, 0x0354, 0),
+	PLL_B(CLK_APMIXED_MMPLL, "mmpll", 0x0360, 0x036c, 0xff000000,
+	      HAVE_RST_BAR, BIT(23), 22, 0x0364, 24, 0, 0, 0, 0x0364, 0),
+	PLL_B(CLK_APMIXED_ADSPPLL, "adsppll", 0x0370, 0x037c, 0xff000000,
+	      HAVE_RST_BAR, BIT(23), 22, 0x0374, 24, 0, 0, 0, 0x0374, 0),
+	PLL_B(CLK_APMIXED_MFGPLL, "mfgpll", 0x0268, 0x0274, 0x00000000,
+	      0, 0, 22, 0x026c, 24, 0, 0, 0, 0x026c, 0),
+	PLL_B(CLK_APMIXED_TVDPLL, "tvdpll", 0x0380, 0x038c, 0x00000000,
+	      0, 0, 22, 0x0384, 24, 0, 0, 0, 0x0384, 0),
+	PLL_B(CLK_APMIXED_APLL1, "apll1", 0x0318, 0x0328, 0x00000000,
+	      0, 0, 32, 0x031c, 24, 0x0040, 0x000c, 0, 0x0320, 0),
+	PLL_B(CLK_APMIXED_APLL2, "apll2", 0x032c, 0x033c, 0x00000000,
+	      0, 0, 32, 0x0330, 24, 0, 0, 0, 0x0334, 0),
+};
+
+static struct clk_onecell_data *top_clk_data;
+
+static void clk_mt8192_top_init_early(struct device_node *node)
+{
+	int i;
+
+	top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	if (!top_clk_data)
+		return;
+
+	for (i = 0; i < CLK_TOP_NR_CLK; i++)
+		top_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
+
+	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
+
+	of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
+}
+
+CLK_OF_DECLARE_DRIVER(mt8192_topckgen, "mediatek,mt8192-topckgen",
+		      clk_mt8192_top_init_early);
+
+static int clk_mt8192_top_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
+	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
+	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node, &mt8192_clk_lock,
+			       top_clk_data);
+	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base, &mt8192_clk_lock,
+				    top_clk_data);
+	mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base, &mt8192_clk_lock,
+				    top_clk_data);
+	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
+}
+
+static int clk_mt8192_infra_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static int clk_mt8192_peri_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192[] = {
+	{
+		.compatible = "mediatek,mt8192-apmixedsys",
+		.data = clk_mt8192_apmixed_probe,
+	}, {
+		.compatible = "mediatek,mt8192-topckgen",
+		.data = clk_mt8192_top_probe,
+	}, {
+		.compatible = "mediatek,mt8192-infracfg",
+		.data = clk_mt8192_infra_probe,
+	}, {
+		.compatible = "mediatek,mt8192-pericfg",
+		.data = clk_mt8192_peri_probe,
+	}, {
+		/* sentinel */
+	}
+};
+
+static int clk_mt8192_probe(struct platform_device *pdev)
+{
+	int (*clk_probe)(struct platform_device *pdev);
+	int r;
+
+	clk_probe = of_device_get_match_data(&pdev->dev);
+	if (!clk_probe)
+		return -EINVAL;
+
+	r = clk_probe(pdev);
+	if (r)
+		dev_err(&pdev->dev, "could not register clock provider: %s: %d\n", pdev->name, r);
+
+	return r;
+}
+
+static struct platform_driver clk_mt8192_drv = {
+	.probe = clk_mt8192_probe,
+	.driver = {
+		.name = "clk-mt8192",
+		.of_match_table = of_match_clk_mt8192,
+	},
+};
+
+static int __init clk_mt8192_init(void)
+{
+	return platform_driver_register(&clk_mt8192_drv);
+}
+
+arch_initcall(clk_mt8192_init);
diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index e97d58db28cc..855b0a1f7eb9 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -116,7 +116,12 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 	return 0;
 }
 
-static const struct clk_ops mtk_mux_ops = {
+const struct clk_ops mtk_mux_clr_set_upd_ops = {
+	.get_parent = mtk_clk_mux_get_parent,
+	.set_parent = mtk_clk_mux_set_parent_setclr_lock,
+};
+
+const struct clk_ops mtk_mux_gate_clr_set_upd_ops  = {
 	.enable = mtk_clk_mux_enable_setclr,
 	.disable = mtk_clk_mux_disable_setclr,
 	.is_enabled = mtk_clk_mux_is_enabled,
@@ -140,7 +145,7 @@ static struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
 	init.flags = mux->flags | CLK_SET_RATE_PARENT;
 	init.parent_names = mux->parent_names;
 	init.num_parents = mux->num_parents;
-	init.ops = &mtk_mux_ops;
+	init.ops = mux->ops;
 
 	clk_mux->regmap = regmap;
 	clk_mux->data = mux;
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index f1946161ade1..27841d649118 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -33,12 +33,13 @@ struct mtk_mux {
 	u8 gate_shift;
 	s8 upd_shift;
 
+	const struct clk_ops *ops;
 	signed char num_parents;
 };
 
 #define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
-			_gate, _upd_ofs, _upd, _flags) {		\
+			_gate, _upd_ofs, _upd, _flags, _ops) {		\
 		.id = _id,						\
 		.name = _name,						\
 		.mux_ofs = _mux_ofs,					\
@@ -52,14 +53,19 @@ struct mtk_mux {
 		.parent_names = _parents,				\
 		.num_parents = ARRAY_SIZE(_parents),			\
 		.flags = _flags,					\
+		.ops = &_ops,						\
 	}
 
+extern const struct clk_ops mtk_mux_clr_set_upd_ops;
+extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
+
 #define MUX_GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
 			_gate, _upd_ofs, _upd, _flags)			\
 		GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
-			_gate, _upd_ofs, _upd, _flags)			\
+			_gate, _upd_ofs, _upd, _flags,			\
+			mtk_mux_gate_clr_set_upd_ops)
 
 #define MUX_GATE_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,		\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
@@ -69,6 +75,14 @@ struct mtk_mux {
 			_width, _gate, _upd_ofs, _upd,			\
 			CLK_SET_RATE_PARENT)
 
+#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,			\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			_upd_ofs, _upd)					\
+		GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,		\
+			mtk_mux_clr_set_upd_ops)
+
 int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			   int num, struct device_node *node,
 			   spinlock_t *lock,
-- 
2.18.0

