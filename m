Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A35D645039
	for <lists+linux-clk@lfdr.de>; Wed,  7 Dec 2022 01:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiLGAPe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 6 Dec 2022 19:15:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiLGAP0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 19:15:26 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D544D5E9
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 16:15:18 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id cf42so20438793lfb.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 16:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXWCcgyuxb4JgpfKW7ku4WXMqbrRsTauiJ6fzFvhB7A=;
        b=T5+bB3WF6yRsY6GpelrElR6cpszyIyAo3NKqV+tRPFIOFn5t56jULctW/drN2//oXX
         wj9w0BVi90ZjU15gs7iBqQ9wMUEiafCQlQvtQY9xaO1eQ9+IofmjizqF/o1tcGZmyDBU
         0NbiY0YaF7SCYmXU5DHjGXBAulG77oB6i4q7/D+XbFfBsx3ioG5btNtgFeKO0o1To/Ar
         8nhgCVqCvZDuDkkndX2m/5Dk0ncZmiN3jQ700goQep/pi9JgyKWC9K0eJgMnlwLLx03b
         k958YptFbnZBLGjhx01EiO4T7neMwvgVHYPZFW6oqDu1S9d+paseWld9ugA2rYSFqogB
         gRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXWCcgyuxb4JgpfKW7ku4WXMqbrRsTauiJ6fzFvhB7A=;
        b=05AFWsXynwWiwownuuRPKwlt/t7jPJNYgk8zEyhpkkqfeqZQHA+Z9j7CRlWkY25BWw
         yzOIWfc9EaLckPixzY3Hc+lHqsUsuSlxJmlR8XcOiM3BTV3yBaDtQdXjOBWfhqAbsUc/
         LBzClZRyMyxadlClTgzzD2k7uqLlFF8ve9dQrP9hzkLGsefR5sM7FB1tWNK6emNp+rvU
         QqJuQVn20ZMp2sRyyIg2IkmWCnx7Qtdo44EM9R1Mm5dV8Xi1VuE7kWrqZl9FYVB5EFgY
         D5LCDONVKMDTrE7ayMp60wLUcp3NzHtGKyG3bVR+W+pD1fVFHYFE/oGmjIGa+LxP0j7A
         jf6A==
X-Gm-Message-State: ANoB5pk77zCdG1DgDv3M8Ka8V5Mef4i7a15rOabIKmm3vF+1oec/GqIG
        It2q6rIjyQNLWAaiPG/+LjEFcg==
X-Google-Smtp-Source: AA0mqf4r576tUpIrV4bl5FnlSLXlP8vwHhzaJ9k8xAOeE0SO9hwpXU8dnKQnjZsn38XPhyV5ivkJYQ==
X-Received: by 2002:a05:6512:3d05:b0:4a2:4f6d:7963 with SMTP id d5-20020a0565123d0500b004a24f6d7963mr33129455lfv.638.1670372116976;
        Tue, 06 Dec 2022 16:15:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 17/18] clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
Date:   Wed,  7 Dec 2022 02:15:02 +0200
Message-Id: <20221207001503.93790-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add special macro for the clocks of QCOM_SMD_RPM_BUS_CLK type. Use it to
insert the _bus_N part into the clock symbol name. The system (and
userspace) name of these clocks remains intact.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 252 +++++++++++++++++----------------
 1 file changed, 131 insertions(+), 121 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 4db92d2d91b8..b8e649a6a76c 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -25,13 +25,14 @@
 #define QCOM_RPM_SMD_KEY_STATE				0x54415453
 #define QCOM_RPM_SCALING_ENABLE_ID			0x2
 
-#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, key)      \
-	static struct clk_smd_rpm _platform##_##_active;		      \
-	static struct clk_smd_rpm _platform##_##_name = {		      \
+#define __DEFINE_CLK_SMD_RPM_PREFIX(_platform, _prefix, _name, _active,	      \
+				    type, r_id, key)			      \
+	static struct clk_smd_rpm _platform##_##_prefix##_active;	      \
+	static struct clk_smd_rpm _platform##_##_prefix##_name = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.rpm_key = (key),					      \
-		.peer = &_platform##_##_active,				      \
+		.peer = &_platform##_##_prefix##_active,		      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_ops,			      \
@@ -43,12 +44,12 @@
 			.num_parents = 1,				      \
 		},							      \
 	};								      \
-	static struct clk_smd_rpm _platform##_##_active = {		      \
+	static struct clk_smd_rpm _platform##_##_prefix##_active = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.active_only = true,					      \
 		.rpm_key = (key),					      \
-		.peer = &_platform##_##_name,				      \
+		.peer = &_platform##_##_prefix##_name,			      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_ops,			      \
@@ -61,6 +62,10 @@
 		},							      \
 	}
 
+#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, key)      \
+	__DEFINE_CLK_SMD_RPM_PREFIX(_platform, /* empty */, _name, _active,   \
+				    type, r_id, key)
+
 #define __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, _prefix, _name, _active,\
 					   type, r_id, r, key)		      \
 	static struct clk_smd_rpm _platform##_##_prefix##_active;	      \
@@ -109,6 +114,11 @@
 		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk,   \
 		type, r_id, QCOM_RPM_SMD_KEY_RATE)
 
+#define DEFINE_CLK_SMD_RPM_BUS(_platform, _name, r_id)			      \
+		__DEFINE_CLK_SMD_RPM_PREFIX(_platform, bus_##r_id##_,	      \
+		_name##_clk, _name##_a_clk, QCOM_SMD_RPM_BUS_CLK, r_id,	      \
+		QCOM_RPM_SMD_KEY_RATE)
+
 #define DEFINE_CLK_SMD_RPM_CLK_SRC(_platform, _name, type, r_id)	      \
 		__DEFINE_CLK_SMD_RPM(_platform,				      \
 		_name##_clk_src, _name##_a_clk_src,			      \
@@ -442,15 +452,15 @@ DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
 DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2);
 
-DEFINE_CLK_SMD_RPM(msm8916, pcnoc, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8916, snoc, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8974, cnoc, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb, QCOM_SMD_RPM_BUS_CLK, 3);
-DEFINE_CLK_SMD_RPM(sm6125, snoc_periph, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6125, cnoc, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM(sm6125, snoc, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass, QCOM_SMD_RPM_BUS_CLK, 5);
+DEFINE_CLK_SMD_RPM_BUS(msm8916, pcnoc, 0);
+DEFINE_CLK_SMD_RPM_BUS(msm8916, snoc, 1);
+DEFINE_CLK_SMD_RPM_BUS(msm8936, sysmmnoc, 2);
+DEFINE_CLK_SMD_RPM_BUS(msm8974, cnoc, 2);
+DEFINE_CLK_SMD_RPM_BUS(msm8974, mmssnoc_ahb, 3);
+DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc_periph, 0);
+DEFINE_CLK_SMD_RPM_BUS(sm6125, cnoc, 1);
+DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc, 2);
+DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc_lpass, 5);
 
 DEFINE_CLK_SMD_RPM(msm8916, bimc, QCOM_SMD_RPM_MEM_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc, QCOM_SMD_RPM_MEM_CLK, 1);
@@ -500,10 +510,10 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, 12, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, 13, 19200000);
 
 static struct clk_smd_rpm *msm8909_clks[] = {
-	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
+	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
 	[RPM_SMD_QPIC_CLK]		= &qcs404_qpic_clk,
@@ -534,10 +544,10 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8909 = {
 };
 
 static struct clk_smd_rpm *msm8916_clks[] = {
-	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
+	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
@@ -566,14 +576,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
 };
 
 static struct clk_smd_rpm *msm8936_clks[] = {
-	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
+	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
-	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_sysmmnoc_clk,
-	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_sysmmnoc_a_clk,
+	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_bus_2_sysmmnoc_clk,
+	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_bus_2_sysmmnoc_a_clk,
 	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
 	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
@@ -600,14 +610,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
 };
 
 static struct clk_smd_rpm *msm8974_clks[] = {
-	[RPM_SMD_PNOC_CLK]		= &msm8916_pcnoc_clk,
-	[RPM_SMD_PNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK]		= &msm8974_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK]		= &msm8974_cnoc_a_clk,
-	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_mmssnoc_ahb_clk,
-	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_mmssnoc_ahb_a_clk,
+	[RPM_SMD_PNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK]		= &msm8974_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK]		= &msm8974_bus_2_cnoc_a_clk,
+	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_bus_3_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_bus_3_mmssnoc_ahb_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
 	[RPM_SMD_GFX3D_CLK_SRC]		= &msm8974_gfx3d_clk_src,
 	[RPM_SMD_GFX3D_A_CLK_SRC]	= &msm8974_gfx3d_a_clk_src,
@@ -652,14 +662,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
 static struct clk_smd_rpm *msm8976_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_PCNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_SYSMMNOC_CLK]	= &msm8936_sysmmnoc_clk,
-	[RPM_SMD_SYSMMNOC_A_CLK] = &msm8936_sysmmnoc_a_clk,
+	[RPM_SMD_SYSMMNOC_CLK]	= &msm8936_bus_2_sysmmnoc_clk,
+	[RPM_SMD_SYSMMNOC_A_CLK] = &msm8936_bus_2_sysmmnoc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
 	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
@@ -686,18 +696,18 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 static struct clk_smd_rpm *msm8992_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
-	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
+	[RPM_SMD_PNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
 	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
 	[RPM_SMD_OCMEMGX_A_CLK] = &msm8974_ocmemgx_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
 	[RPM_SMD_GFX3D_CLK_SRC] = &msm8974_gfx3d_clk_src,
 	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8974_gfx3d_a_clk_src,
-	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
 	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
 	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
 	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
@@ -716,8 +726,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
 	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
-	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
-	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
+	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_bus_3_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_bus_3_mmssnoc_ahb_a_clk,
 	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_branch_mss_cfg_ahb_clk,
 	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_branch_mss_cfg_ahb_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
@@ -744,18 +754,18 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
 static struct clk_smd_rpm *msm8994_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
-	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
+	[RPM_SMD_PNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
 	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
 	[RPM_SMD_OCMEMGX_A_CLK] = &msm8974_ocmemgx_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
 	[RPM_SMD_GFX3D_CLK_SRC] = &msm8974_gfx3d_clk_src,
 	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8974_gfx3d_a_clk_src,
-	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
 	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
 	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
 	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
@@ -774,8 +784,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
 	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
-	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
-	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
+	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_bus_3_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_bus_3_mmssnoc_ahb_a_clk,
 	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_branch_mss_cfg_ahb_clk,
 	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_branch_mss_cfg_ahb_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
@@ -802,12 +812,12 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
 };
 
 static struct clk_smd_rpm *msm8996_clks[] = {
-	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
+	[RPM_SMD_PCNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
@@ -856,10 +866,10 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
 static struct clk_smd_rpm *qcs404_clks[] = {
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
-	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
-	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_PNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
@@ -886,12 +896,12 @@ static struct clk_smd_rpm *msm8998_clks[] = {
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
+	[RPM_SMD_PCNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
@@ -944,12 +954,12 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 static struct clk_smd_rpm *sdm660_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
-	[RPM_SMD_CNOC_PERIPH_CLK] = &msm8916_pcnoc_clk,
-	[RPM_SMD_CNOC_PERIPH_A_CLK] = &msm8916_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
+	[RPM_SMD_CNOC_PERIPH_CLK] = &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_CNOC_PERIPH_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_MMSSNOC_AXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
@@ -990,8 +1000,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 static struct clk_smd_rpm *mdm9607_clks[] = {
 	[RPM_SMD_XO_CLK_SRC]		= &sdm660_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
+	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
 	[RPM_SMD_QPIC_CLK]		= &qcs404_qpic_clk,
@@ -1012,16 +1022,16 @@ static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
 static struct clk_smd_rpm *msm8953_clks[] = {
 	[RPM_SMD_XO_CLK_SRC]		= &sdm660_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
+	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
 	[RPM_SMD_IPA_CLK]		= &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK]		= &msm8976_ipa_a_clk,
-	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_sysmmnoc_clk,
-	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_sysmmnoc_a_clk,
+	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_bus_2_sysmmnoc_clk,
+	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_bus_2_sysmmnoc_a_clk,
 	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
 	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
@@ -1048,8 +1058,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8953 = {
 static struct clk_smd_rpm *sm6125_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
@@ -1058,8 +1068,8 @@ static struct clk_smd_rpm *sm6125_clks[] = {
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
 	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
@@ -1076,10 +1086,10 @@ static struct clk_smd_rpm *sm6125_clks[] = {
 	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
 	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
 	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
-	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
-	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
-	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
-	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
@@ -1091,8 +1101,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
 static struct clk_smd_rpm *sm6115_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
@@ -1101,8 +1111,8 @@ static struct clk_smd_rpm *sm6115_clks[] = {
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
 	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
@@ -1113,10 +1123,10 @@ static struct clk_smd_rpm *sm6115_clks[] = {
 	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
 	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
 	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
-	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
-	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
-	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
-	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
 	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
 	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
 	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
@@ -1131,14 +1141,14 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 static struct clk_smd_rpm *sm6375_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
-	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
@@ -1147,10 +1157,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
 	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
 	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
 	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
-	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
-	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
-	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
-	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
 	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
@@ -1168,8 +1178,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
@@ -1178,8 +1188,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_RF_CLK3] = &qcm2290_38m4_rf_clk3,
 	[RPM_SMD_RF_CLK3_A] = &qcm2290_38m4_rf_clk3_a,
-	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
@@ -1188,10 +1198,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
 	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
 	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
-	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
-	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
-	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
-	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
 	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
-- 
2.35.1

