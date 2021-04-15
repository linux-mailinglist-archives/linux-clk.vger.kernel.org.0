Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60D13601F6
	for <lists+linux-clk@lfdr.de>; Thu, 15 Apr 2021 07:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhDOFxU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 15 Apr 2021 01:53:20 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:59452 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230296AbhDOFxR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Apr 2021 01:53:17 -0400
X-UUID: 2ba8bfba7a6949e18e695d9be56cc462-20210415
X-UUID: 2ba8bfba7a6949e18e695d9be56cc462-20210415
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <flora.fu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 126229938; Thu, 15 Apr 2021 13:52:51 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 13:52:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Apr 2021 13:52:49 +0800
From:   Flora Fu <flora.fu@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Flora Fu <flora.fu@mediatek.com>,
        Pi-Cheng Chen <pi-cheng.chen@mediatek.com>,
        Chiawen Lee <chiawen.lee@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH v2 2/7] clk: mediatek: mt8192: Add APU clocks support
Date:   Thu, 15 Apr 2021 13:52:35 +0800
Message-ID: <1618465960-3013-3-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add APU clocks support on MT8192.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8192.c | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index bf6a2084a348..4eb61f006306 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -244,6 +244,65 @@ static const char * const ccu_parents[] = {
 	"univpll_d6_d2"
 };
 
+static const char * const dsp_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp1_parents[] = {
+	"clk26m",
+	"npupll_ck",
+	"mainpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mainpll_d3",
+	"univpll_d3",
+	"apupll_ck"
+};
+
+static const char * const dsp1_npupll_parents[] = {
+	"dsp1_sel",
+	"npupll_ck"
+};
+
+static const char * const dsp2_parents[] = {
+	"clk26m",
+	"npupll_ck",
+	"mainpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mainpll_d3",
+	"univpll_d3",
+	"apupll_ck"
+};
+
+static const char * const dsp2_npupll_parents[] = {
+	"dsp2_sel",
+	"npupll_ck"
+};
+
+static const char * const dsp5_parents[] = {
+	"clk26m",
+	"apupll_ck",
+	"univpll_d4_d2",
+	"mainpll_d4",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp5_apupll_parents[] = {
+	"dsp5_sel",
+	"apupll_ck"
+};
+
 static const char * const dsp7_parents[] = {
 	"clk26m",
 	"mainpll_d4_d2",
@@ -255,6 +314,17 @@ static const char * const dsp7_parents[] = {
 	"mmpll_d4"
 };
 
+static const char * const ipu_if_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"univpll_d5",
+	"mainpll_d4",
+	"tvdpll_ck",
+	"univpll_d4"
+};
+
 static const char * const mfg_ref_parents[] = {
 	"clk26m",
 	"clk26m",
@@ -734,9 +804,26 @@ static const struct mtk_mux top_mtk_muxes[] = {
 		cam_parents, 0x030, 0x034, 0x038, 16, 4, 23, 0x004, 10),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_CCU_SEL, "ccu_sel",
 		ccu_parents, 0x030, 0x034, 0x038, 24, 4, 31, 0x004, 11),
+	/* CLK_CFG_3 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP_SEL, "dsp_sel",
+		dsp_parents, 0x040, 0x044, 0x048, 0, 3, 7, 0x004, 12),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP1_SEL, "dsp1_sel",
+		dsp1_parents, 0x040, 0x044, 0x048, 8, 3, 15, 0x004, 13),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP1_NPUPLL_SEL, "dsp1_npupll_sel",
+		dsp1_npupll_parents, 0x040, 0x044, 0x048, 11, 1, -1, -1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP2_SEL, "dsp2_sel",
+		dsp2_parents, 0x040, 0x044, 0x048, 16, 3, 23, 0x004, 14),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP2_NPUPLL_SEL, "dsp2_npupll_sel",
+		dsp2_npupll_parents, 0x040, 0x044, 0x048, 19, 1, -1, -1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP5_SEL, "dsp5_sel",
+		dsp5_parents, 0x040, 0x044, 0x048, 24, 3, 31, 0x004, 15),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP5_APUPLL_SEL, "dsp5_apupll_sel",
+		dsp5_apupll_parents, 0x040, 0x044, 0x048, 27, 1, -1, -1),
 	/* CLK_CFG_4 */
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP7_SEL, "dsp7_sel",
 		dsp7_parents, 0x050, 0x054, 0x058, 0, 3, 7, 0x004, 16),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IPU_IF_SEL, "ipu_if_sel",
+		ipu_if_parents, 0x050, 0x054, 0x058, 8, 3, 15, 0x004, 17),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
 		mfg_ref_parents, 0x050, 0x054, 0x058, 16, 2, 23, 0x004, 18),
 	MUX_CLR_SET_UPD(CLK_TOP_MFG_PLL_SEL, "mfg_pll_sel",
@@ -1175,6 +1262,10 @@ static const struct mtk_pll_data plls[] = {
 		0, 0, 32, 0x031c, 24, 0x0040, 0x000c, 0, 0x0320, 0),
 	PLL_B(CLK_APMIXED_APLL2, "apll2", 0x032c, 0x033c, 0x00000000,
 		0, 0, 32, 0x0330, 24, 0, 0, 0, 0x0334, 0),
+	PLL_B(CLK_APMIXED_APUPLL, "apupll", 0x03a0, 0x03ac, 0xff000001,
+		HAVE_RST_BAR, BIT(23), 22, 0x03a4, 24, 0, 0, 0, 0x03a4, 0),
+	PLL_B(CLK_APMIXED_NPUPLL, "npupll", 0x03b4, 0x03c0, 0x00000001,
+		0, 0, 22, 0x03b8, 24, 0, 0, 0, 0x03b8, 0),
 };
 
 static struct clk_onecell_data *top_clk_data;
-- 
2.18.0

