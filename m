Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA77B4BEAA1
	for <lists+linux-clk@lfdr.de>; Mon, 21 Feb 2022 20:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbiBUS1H (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Feb 2022 13:27:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbiBUSYZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 13:24:25 -0500
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id C45F3E11
        for <linux-clk@vger.kernel.org>; Mon, 21 Feb 2022 10:15:10 -0800 (PST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1645467310; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=WhphKfRy9g4NeVDixtg98cLVHh4lJkO88d2PT8ssf/A=; b=rn0lF1xzsYJ94CPz1cLDMluogSMLSn04qk5KfbAv4JUHYgg2Zvtgs4jpIXmQRNt2tADTn0y3
 SwkZCQ/Vv9Wv7F4rwBiCvGmszhoAC51d3oRFh8E1/sq11sowTQsCwGdVqzFC3Zdm/RJGbev7
 VZds+TCyXpdTKq76WJ7b3/r+Uew=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6213d64db360e81798bd660a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Feb 2022 18:13:33
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7EDF3C43618; Mon, 21 Feb 2022 18:13:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
Received: from hu-tdas-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27229C4360C;
        Mon, 21 Feb 2022 18:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 27229C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 1/2] clk: qcom: clk-rcg2: Update logic to calculate D value for RCG
Date:   Mon, 21 Feb 2022 23:43:21 +0530
Message-Id: <20220221181322.5486-1-tdas@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The display pixel clock has a requirement on certain newer platforms to
support M/N as (2/3) and the final D value calculated results in
underflow errors.
As the current implementation does not check for D value is within
the accepted range for a given M & N value. Update the logic to
calculate the final D value based on the range.

Fixes: 99cbd064b059f ("clk: qcom: Support display RCG clocks")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 [v2]
   * Update the if else check with clamp.
   * Typecast the f->m to u32.

 drivers/clk/qcom/clk-rcg2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index e1b1b426fae4..3a78a2a16cf8 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -264,7 +264,7 @@ static int clk_rcg2_determine_floor_rate(struct clk_hw *hw,

 static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 {
-	u32 cfg, mask;
+	u32 cfg, mask, d_val, not2d_val, n_minus_m;
 	struct clk_hw *hw = &rcg->clkr.hw;
 	int ret, index = qcom_find_src_index(hw, rcg->parent_map, f->src);

@@ -283,8 +283,17 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 		if (ret)
 			return ret;

+		/* Calculate 2d value */
+		d_val = f->n;
+
+		n_minus_m = f->n - f->m;
+		n_minus_m *= 2;
+
+		d_val = clamp(d_val, (u32)f->m, n_minus_m);
+		not2d_val = ~d_val & mask;
+
 		ret = regmap_update_bits(rcg->clkr.regmap,
-				RCG_D_OFFSET(rcg), mask, ~f->n);
+				RCG_D_OFFSET(rcg), mask, not2d_val);
 		if (ret)
 			return ret;
 	}
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

