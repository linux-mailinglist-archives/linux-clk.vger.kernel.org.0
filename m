Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04C91BA778
	for <lists+linux-clk@lfdr.de>; Mon, 27 Apr 2020 17:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgD0PLe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Apr 2020 11:11:34 -0400
Received: from inva021.nxp.com ([92.121.34.21]:33276 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgD0PLe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 27 Apr 2020 11:11:34 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 687FC2010FF;
        Mon, 27 Apr 2020 17:11:29 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5C7DE2008B2;
        Mon, 27 Apr 2020 17:11:29 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id EA6B02030E;
        Mon, 27 Apr 2020 17:11:28 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH] clk: imx8mp: Set the correct parent for audio_root_clk
Date:   Mon, 27 Apr 2020 18:11:21 +0300
Message-Id: <1588000281-6594-1-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Instead of ipg_root, the parent needs to be ipg_audio_root.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk-imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 41469e2..dcdfc9d 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -727,7 +727,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_HDMI_ROOT] = imx_clk_hw_gate4("hdmi_root_clk", "hdmi_axi", ccm_base + 0x45f0, 0);
 	hws[IMX8MP_CLK_TSENSOR_ROOT] = imx_clk_hw_gate4("tsensor_root_clk", "ipg_root", ccm_base + 0x4620, 0);
 	hws[IMX8MP_CLK_VPU_ROOT] = imx_clk_hw_gate4("vpu_root_clk", "vpu_bus", ccm_base + 0x4630, 0);
-	hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate4("audio_root_clk", "ipg_root", ccm_base + 0x4650, 0);
+	hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate4("audio_root_clk", "ipg_audio_root", ccm_base + 0x4650, 0);
 
 	hws[IMX8MP_CLK_ARM] = imx_clk_hw_cpu("arm", "arm_a53_core",
 					     hws[IMX8MP_CLK_A53_CORE]->clk,
-- 
2.7.4

