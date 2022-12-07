Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2F71645028
	for <lists+linux-clk@lfdr.de>; Wed,  7 Dec 2022 01:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiLGAP0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 6 Dec 2022 19:15:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiLGAPU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 19:15:20 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD014B994
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 16:15:10 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id f20so5919972lja.4
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 16:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mk6Xk2qoGgC+MIBTq/7jSBPxUXyxRi1BegT2NWitd8=;
        b=jx3hO6dYaD9KdoOL85iM6lZJflwQzfcWRCJWEtOa24yEQNuwDxMddtqpMWFVhDIkSS
         quDS9dMtXfqfEjrE9tZYVmNrS5gCq1TxfT0wO+fplzT4imGZZu8wm3b1A0gBKu7wgUQB
         mJQQnP3d3qP9crZsfzKr7sEVbw3q5SDrfd001Cy/rt0JD1FTEg6Dc3ivCNtD0LJ2Su/i
         6y2ujoQp2JHe/8/7q9tRo0YRYSljZOXgPnWsea7DSUTBlbDq0QaGsCTUBJAgPz1KVQy7
         dbZB6N8T0Ue75ldxJOU0JWnsQkbjhKeII3Li1p7NYHNikuII8r7OStyl2pgY1T26+rWs
         0aKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mk6Xk2qoGgC+MIBTq/7jSBPxUXyxRi1BegT2NWitd8=;
        b=AUNqwsl3L3CMXhDKvQD6MfF7OT2ScBvXmMY6t6WAIiGhrSOzWxgitRS2/ybmb+iKON
         9UtdHnUWZmVOhJWn0mtW2WB2uARDxXBMAi482TeG0GFC6NmNQ6rSdjh2KjUCFIogo/BD
         PzODYEUJbgqy3UUGu4CbftsAM+4jymO0wI58OYaqy/8JFrfgjio69jd961Nfok5/REHn
         pPSALt5kVs3AwpwlpRn0ELxsV/kJ6whP/MKRfhE0PxHDaDB+2O5QyUrwAAjzz01hs4nt
         nxzLm8zAIQxCQd112qNNH3e1iDaTysazRl2GyHhLv0Qu7jZilN7DiN9PGPvRQ4IsUQ+v
         WN1Q==
X-Gm-Message-State: ANoB5pnuh4iW1kESTs6RVJacbJPupRanPkSzuDfGGldC/jSqGindBlz3
        SnDMvRbW+fIbW3MfZGtm3GgCEA==
X-Google-Smtp-Source: AA0mqf4eEtjYmxd17omNapWuRZSahlpYX7yQXvmcFIK0IGvBxxA76J8fmNJbLDlLoyJRDl881k/cug==
X-Received: by 2002:a2e:8085:0:b0:279:d45f:cebb with SMTP id i5-20020a2e8085000000b00279d45fcebbmr7631938ljg.525.1670372110062;
        Tue, 06 Dec 2022 16:15:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 08/18] clk: qcom: smd-rpm: add XO_BUFFER clock for each XO_BUFFER_PINCTRL clock
Date:   Wed,  7 Dec 2022 02:14:53 +0200
Message-Id: <20221207001503.93790-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For each XO_BUFFER_PINCTRL there is a corresponding XO_BUFFER clock.
Add them automatically to drop the duplication between the clock
definitions.

Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 47 +++++++++++++---------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 024665438b62..f9d8382cd274 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -124,7 +124,10 @@
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active,	      \
 					     r_id, r)			      \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
+		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active,	      \
+					     r_id, r);			      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
+		_active##_pin,						      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
 		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
 
@@ -419,14 +422,10 @@ DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8916, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
 DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk1, bb_clk1_a, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk2, bb_clk2_a, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, rf_clk1, rf_clk1_a, 4, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, rf_clk2, rf_clk2_a, 5, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1_pin, bb_clk1_a_pin, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2_pin, bb_clk2_a_pin, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1_pin, rf_clk1_a_pin, 4, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2_pin, rf_clk2_a_pin, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, bb_clk1_a, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, bb_clk2_a, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1, rf_clk1_a, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, rf_clk2_a, 5, 19200000);
 
 static struct clk_smd_rpm *msm8909_clks[] = {
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
@@ -534,19 +533,14 @@ DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
 DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
 DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d0, cxo_d0_a, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d1, cxo_d1_a, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0_pin, cxo_d0_a_pin, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1_pin, cxo_d1_a_pin, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0_pin, cxo_a0_a_pin, 4, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1_pin, cxo_a1_a_pin, 5, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2_pin, cxo_a2_a_pin, 6, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, cxo_d0_a, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, cxo_d1_a, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
 
 static struct clk_smd_rpm *msm8974_clks[] = {
 	[RPM_SMD_PNOC_CLK]		= &msm8916_pcnoc_clk,
@@ -635,8 +629,7 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 };
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
 
 DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
@@ -852,18 +845,14 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 	.num_clks = ARRAY_SIZE(qcs404_clks),
 };
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1_pin, ln_bb_clk1_a_pin, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2_pin, ln_bb_clk2_a_pin, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin, 3, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
 DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
 		   QCOM_SMD_RPM_AGGR_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk,
 		   QCOM_SMD_RPM_AGGR_CLK, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, rf_clk3_a, 6, 19200000);
 
 static struct clk_smd_rpm *msm8998_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-- 
2.35.1

