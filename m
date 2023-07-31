Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D67EF7693C2
	for <lists+linux-clk@lfdr.de>; Mon, 31 Jul 2023 12:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbjGaKy4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 31 Jul 2023 06:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbjGaKyQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 06:54:16 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69B22D57
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 03:52:47 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe216edaf7so3400388e87.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 03:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690800766; x=1691405566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZQ93ryTVkLJ674HaEi8fy9NL3vC9KyVwveDa7EddrM=;
        b=MsqQUvfrtNqZ5II/f5svt2u0ySACeiUS9XYQtsAsGUZySRfiJD0s+0sgpknWz8dscw
         WCVUe33x0CiBH7ewBDEfh9b6EA40YGVEy7H2v4+i2IRkEZrQ5e33K2lUijpns3l3PMO7
         CwSgmc9bC338f6XWJdEZidnQQSFEsKbnWj+FnysFD+q3jprPfeTmn6bYEcsZbGUV2lyB
         Z3knz2dr7O6tntLHz3Qgi46dLyjg+P0VNHINLgs3ozRfgjEDTmOXYkcU3ubW/i3NE+y4
         N6hEr+FUgy3x/DP6Wl3op8SrfSCatnPmuKMj/FST+bTblllhA7f0XRggUk198Pq3J52d
         m4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690800766; x=1691405566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZQ93ryTVkLJ674HaEi8fy9NL3vC9KyVwveDa7EddrM=;
        b=DgaiDgvplvTBxf8QT3N6yCEw8yH14GRZtKQps2YK3zdcyLet9I/3g0kXTAt06pjAkC
         xChfqWL9lR78O9Us40AONkFin7X+Liw73pN8dvoG5owhdk/ZW9y0Xnj4gGs70eu8TXUB
         9LTzjztd7L0bom8+nmHppkRpBhMpQKTvKVN525nRljzT8lmnL6BYlB72wuUw+UQmnGiN
         EwCQfBbun18J4wP8M7d6I6HseKEwqEd3AYKd5w3p0DNl454ww09THX7mHgX2PevvSW7d
         pjVCe/s4RwFR1ODQuN97XNF00PpLUc+3IZMFq3tENtpw8xTXK8t3X4cFRRpoj8nlkhe7
         nt4g==
X-Gm-Message-State: ABy/qLaBal7X9csGundhQsjfCnd0DMs4J5u9zXo0RlAhout3lxoscE9G
        ojck9dZ04knp7XLRaptg8+cbf1xZPNHcx8DFDfI2qg==
X-Google-Smtp-Source: APBJJlG9ZpRzL8xKJZrOwMUg0AbfAdrM5vY3AiRIQUjs9voIAPHH6UDJNNK3T536pQ1uBzhjAJhAKw==
X-Received: by 2002:a05:6512:1112:b0:4fd:d254:edc6 with SMTP id l18-20020a056512111200b004fdd254edc6mr4175359lfg.26.1690800766121;
        Mon, 31 Jul 2023 03:52:46 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id p13-20020a05651238cd00b004fdc7ec5cbesm2016936lft.300.2023.07.31.03.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:52:45 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 31 Jul 2023 12:52:25 +0200
Subject: [PATCH v2 09/10] interconnect: qcom: msm8996: Set AB/IB
 coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v2-9-8c91c6c76076@linaro.org>
References: <20230726-topic-icc_coeff-v2-0-8c91c6c76076@linaro.org>
In-Reply-To: <20230726-topic-icc_coeff-v2-0-8c91c6c76076@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690800744; l=1682;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6Ylk54qLtCUKuTX9FA4QTRZGSUqgBkVW+4oTAnkFbFA=;
 b=QqlrfcFyRm49fh+DqszMLlo9ZzbFieubybDoExsW8pLPB+iO7aAof5Q59ifWrH/igEHa85MqN
 BdhDwfQ0hc6A1ZL+3GfLDx8RAMw7ZdGIt384BJ7lP1C4TbxJrNcr4dN
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some buses and nodes need additional manual adjustments atop the usual
calculations. Fill in the missing coefficients.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/msm8996.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
index 88683dfa468f..b73566c9b21f 100644
--- a/drivers/interconnect/qcom/msm8996.c
+++ b/drivers/interconnect/qcom/msm8996.c
@@ -448,6 +448,7 @@ static struct qcom_icc_node mas_mdp_p0 = {
 	.name = "mas_mdp_p0",
 	.id = MSM8996_MASTER_MDP_PORT0,
 	.buswidth = 32,
+	.ib_coeff = 25,
 	.mas_rpm_id = 8,
 	.slv_rpm_id = -1,
 	.qos.ap_owned = true,
@@ -463,6 +464,7 @@ static struct qcom_icc_node mas_mdp_p1 = {
 	.name = "mas_mdp_p1",
 	.id = MSM8996_MASTER_MDP_PORT1,
 	.buswidth = 32,
+	.ib_coeff = 25,
 	.mas_rpm_id = 61,
 	.slv_rpm_id = -1,
 	.qos.ap_owned = true,
@@ -1889,7 +1891,8 @@ static const struct qcom_icc_desc msm8996_bimc = {
 	.nodes = bimc_nodes,
 	.num_nodes = ARRAY_SIZE(bimc_nodes),
 	.bus_clk_desc = &bimc_clk,
-	.regmap_cfg = &msm8996_bimc_regmap_config
+	.regmap_cfg = &msm8996_bimc_regmap_config,
+	.ab_coeff = 154,
 };
 
 static struct qcom_icc_node * const cnoc_nodes[] = {
@@ -2004,7 +2007,8 @@ static const struct qcom_icc_desc msm8996_mnoc = {
 	.bus_clk_desc = &mmaxi_0_clk,
 	.intf_clocks = mm_intf_clocks,
 	.num_intf_clocks = ARRAY_SIZE(mm_intf_clocks),
-	.regmap_cfg = &msm8996_mnoc_regmap_config
+	.regmap_cfg = &msm8996_mnoc_regmap_config,
+	.ab_coeff = 154,
 };
 
 static struct qcom_icc_node * const pnoc_nodes[] = {

-- 
2.41.0

