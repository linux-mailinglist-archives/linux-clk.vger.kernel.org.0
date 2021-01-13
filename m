Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D592F525F
	for <lists+linux-clk@lfdr.de>; Wed, 13 Jan 2021 19:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728395AbhAMSjC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 13 Jan 2021 13:39:02 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:35915 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbhAMSjB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jan 2021 13:39:01 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7EB3E20074;
        Wed, 13 Jan 2021 19:38:19 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 1/9] clk: qcom: gcc-sdm660: Mark MMSS NoC CFG AHB clock as critical
Date:   Wed, 13 Jan 2021 19:38:09 +0100
Message-Id: <20210113183817.447866-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Similarly to MSM8998, any access to the MMSS depends on this clock.
Gating it will crash the system when RPMCC inits mmssnoc_axi_rpm_clk.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/gcc-sdm660.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 31258795e7b8..3b7181d0ff71 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -1684,6 +1684,12 @@ static struct clk_branch gcc_mmss_noc_cfg_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mmss_noc_cfg_ahb_clk",
 			.ops = &clk_branch2_ops,
+			/*
+			 * Any access to mmss depends on this clock.
+			 * Gating this clock has been shown to crash the system
+			 * when mmssnoc_axi_rpm_clk is inited in rpmcc.
+			 */
+			.flags = CLK_IS_CRITICAL,
 		},
 	},
 };
-- 
2.29.2

