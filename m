Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD03433AD7B
	for <lists+linux-clk@lfdr.de>; Mon, 15 Mar 2021 09:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhCOIb4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 15 Mar 2021 04:31:56 -0400
Received: from inva021.nxp.com ([92.121.34.21]:51006 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229532AbhCOIb3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 15 Mar 2021 04:31:29 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 46E0C203140;
        Mon, 15 Mar 2021 09:31:27 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E2FB4201336;
        Mon, 15 Mar 2021 09:31:22 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5328D40291;
        Mon, 15 Mar 2021 09:31:17 +0100 (CET)
From:   Richard Zhu <hongxing.zhu@nxp.com>
To:     abel.vesa@nxp.com, shawnguo@kernel.org, ping.bai@nxp.com
Cc:     linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH] clk: imx8mq: Correct the pcie1 sels
Date:   Mon, 15 Mar 2021 16:17:48 +0800
Message-Id: <1615796268-9011-2-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615796268-9011-1-git-send-email-hongxing.zhu@nxp.com>
References: <1615796268-9011-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

- The sys2_pll_50m should be one of the clock sels of PCIE_AUX clock.
Change the sys2_pll_500m to sys2_pll_50m.
- Correct one mis-spell of the imx8mq_pcie1_ctrl_sels definition, from
"sys2_pll_250m" to "sys2_pll_333m".

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/clk/imx/clk-imx8mq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 4dd4ae9d022b..c66c196f396c 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -113,12 +113,12 @@ static const char * const imx8mq_disp_dtrc_sels[] = {"osc_25m", "vpu_pll_out", "
 static const char * const imx8mq_disp_dc8000_sels[] = {"osc_25m", "vpu_pll_out", "sys1_pll_800m", "sys2_pll_1000m", "sys1_pll_160m", "sys2_pll_100m", "sys3_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mq_pcie1_ctrl_sels[] = {"osc_25m", "sys2_pll_250m", "sys2_pll_200m", "sys1_pll_266m",
-					       "sys1_pll_800m", "sys2_pll_500m", "sys2_pll_250m", "sys3_pll_out", };
+					       "sys1_pll_800m", "sys2_pll_500m", "sys2_pll_333m", "sys3_pll_out", };
 
 static const char * const imx8mq_pcie1_phy_sels[] = {"osc_25m", "sys2_pll_100m", "sys2_pll_500m", "clk_ext1", "clk_ext2",
 					      "clk_ext3", "clk_ext4", };
 
-static const char * const imx8mq_pcie1_aux_sels[] = {"osc_25m", "sys2_pll_200m", "sys2_pll_500m", "sys3_pll_out",
+static const char * const imx8mq_pcie1_aux_sels[] = {"osc_25m", "sys2_pll_200m", "sys2_pll_50m", "sys3_pll_out",
 					      "sys2_pll_100m", "sys1_pll_80m", "sys1_pll_160m", "sys1_pll_200m", };
 
 static const char * const imx8mq_dc_pixel_sels[] = {"osc_25m", "video_pll1_out", "audio_pll2_out", "audio_pll1_out", "sys1_pll_800m", "sys2_pll_1000m", "sys3_pll_out", "clk_ext4", };
-- 
2.17.1

