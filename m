Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527EA43831A
	for <lists+linux-clk@lfdr.de>; Sat, 23 Oct 2021 12:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhJWKQf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 23 Oct 2021 06:16:35 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:53860 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230143AbhJWKQe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Oct 2021 06:16:34 -0400
X-UUID: 23bc75b1e61c40e39ed461a3222f993d-20211023
X-UUID: 23bc75b1e61c40e39ed461a3222f993d-20211023
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <flora.fu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2104480384; Sat, 23 Oct 2021 18:14:11 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 18:14:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 23 Oct 2021 18:14:09 +0800
From:   Flora Fu <flora.fu@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Flora Fu <flora.fu@mediatek.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v3 2/7] clk: mediatek: mt8192: Add APU clocks support
Date:   Sat, 23 Oct 2021 18:13:29 +0800
Message-ID: <20211023101334.27686-3-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023101334.27686-1-flora.fu@mediatek.com>
References: <20211023101334.27686-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add APU clocks support on MT8192.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>

---
 drivers/clk/mediatek/clk-mt8192.c | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index cbc7c6dbe0f4..7019caeb0358 100644
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
+			     dsp_parents, 0x040, 0x044, 0x048, 0, 3, 7, 0x004, 12),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP1_SEL, "dsp1_sel",
+			     dsp1_parents, 0x040, 0x044, 0x048, 8, 3, 15, 0x004, 13),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP1_NPUPLL_SEL, "dsp1_npupll_sel",
+			     dsp1_npupll_parents, 0x040, 0x044, 0x048, 11, 1, -1, -1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP2_SEL, "dsp2_sel",
+			     dsp2_parents, 0x040, 0x044, 0x048, 16, 3, 23, 0x004, 14),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP2_NPUPLL_SEL, "dsp2_npupll_sel",
+			     dsp2_npupll_parents, 0x040, 0x044, 0x048, 19, 1, -1, -1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP5_SEL, "dsp5_sel",
+			     dsp5_parents, 0x040, 0x044, 0x048, 24, 3, 31, 0x004, 15),
+	MUX_CLR_SET_UPD(CLK_TOP_DSP5_APUPLL_SEL, "dsp5_apupll_sel",
+			     dsp5_apupll_parents, 0x040, 0x044, 0x048, 27, 1, -1, -1),
 	/* CLK_CFG_4 */
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP7_SEL, "dsp7_sel",
 			     dsp7_parents, 0x050, 0x054, 0x058, 0, 3, 7, 0x004, 16),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IPU_IF_SEL, "ipu_if_sel",
+			     ipu_if_parents, 0x050, 0x054, 0x058, 8, 3, 15, 0x004, 17),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
 			     mfg_ref_parents, 0x050, 0x054, 0x058, 16, 2, 23, 0x004, 18),
 	MUX_CLR_SET_UPD(CLK_TOP_MFG_PLL_SEL, "mfg_pll_sel",
@@ -1175,6 +1262,10 @@ static const struct mtk_pll_data plls[] = {
 	      0, 0, 32, 0x031c, 24, 0x0040, 0x000c, 0, 0x0320, 0),
 	PLL_B(CLK_APMIXED_APLL2, "apll2", 0x032c, 0x033c, 0x00000000,
 	      0, 0, 32, 0x0330, 24, 0, 0, 0, 0x0334, 0),
+	PLL_B(CLK_APMIXED_APUPLL, "apupll", 0x03a0, 0x03ac, 0xff000001,
+	      HAVE_RST_BAR, BIT(23), 22, 0x03a4, 24, 0, 0, 0, 0x03a4, 0),
+	PLL_B(CLK_APMIXED_NPUPLL, "npupll", 0x03b4, 0x03c0, 0x00000001,
+	      0, 0, 22, 0x03b8, 24, 0, 0, 0, 0x03b8, 0),
 };
 
 static struct clk_onecell_data *top_clk_data;
-- 
2.18.0

