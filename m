Return-Path: <linux-clk+bounces-1386-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82044812B2D
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 10:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03C621F218E7
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 09:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84827286BC;
	Thu, 14 Dec 2023 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XTQLYjWN"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A2810F
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:11:30 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-58d1b767b2bso5124474eaf.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702545090; x=1703149890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSz/bHjwwlCoYKLoGELFqaslJ84OPxmUtiMSGQ7rw5w=;
        b=XTQLYjWNdgcQ8/lXSmRA0ZBBTxyxE3gbpqWTGG/vXpNQkxpAUdS8Hoe/gdiTm3r9VI
         nTs64WOBZ5J993BlJlWlZPxdZe7DX7PhkqLRd8VH7LDUpbvAs4e9nh/2oq+PBY4qNbCN
         2FoCXCeKuuuxaVu71HAH/WFCp3KKO7bSs8tBjfosDlxvb15Fnc7cTSqUIsLZKKIwAoze
         JkQtKFiA2fyhFCmSDfe1hIOJoOHR8NCnbcXuTWrm4WN1Petx+dDQJ686JJSj/yJcwYSH
         bwtFm7nMoMt+XlUE4WF6utBb9XC2DhquNd3JVplCMzUR36qON6xrtmBj7r+raRG3SSUm
         gM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545090; x=1703149890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSz/bHjwwlCoYKLoGELFqaslJ84OPxmUtiMSGQ7rw5w=;
        b=WA6jIp+C101MPLigb5dJHLP3uMXy1rQIQlv8+q1tbWULdWsqlUNQdeoJ4/iF4T00dP
         UZmrFpgMDqKaafWLKQUsmZEodj2jHeGDGJ6AONhK/wzSovZ12nK4MEWK8JO8mpgEjfPO
         bH2ohrPIVichvE8tVKCIoUG3L/8OG19AaE9gW0bx/TveflX/O8oyucmcp1XRKAf/0lDM
         5CkuckzWkPk2cxdq1W1HWbrTFWmQuklsW+YUiCaKLhnJVUVA5b8/nvog4bv3ofxI+fsQ
         pc2SZQJOCnxb/VuK04VLSULlx8Hf6tJ/0rvPCTtJcw9MAURMrDWCeqlf02PiCowIojL/
         TwEw==
X-Gm-Message-State: AOJu0YzTOMYK7yD9LYfU50gQcLhu0m49m0bYdpl9NLMyRTVfacoFOavS
	UGA0qWOJba4HGn/Aj2T/vCvt
X-Google-Smtp-Source: AGHT+IFUVL6JpWZGgVnmUsFb1wbwEnnw9CziVP9PAhqAu89DLKiGvOjnVwYt+11NDZPhiMjBcQeYqQ==
X-Received: by 2002:a05:6358:7504:b0:172:962c:cb2c with SMTP id k4-20020a056358750400b00172962ccb2cmr1593062rwg.14.1702545089664;
        Thu, 14 Dec 2023 01:11:29 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id qt13-20020a05620a8a0d00b0077d75164ef9sm5144119qkn.124.2023.12.14.01.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:11:29 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/16] phy: qcom-qmp-ufs: Switch to devm_clk_bulk_get_all() API
Date: Thu, 14 Dec 2023 14:40:47 +0530
Message-Id: <20231214091101.45713-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device drivers should just rely on the clocks provided by the devicetree
and enable/disable them based on the requirement. There is no need to
validate the clocks provided by devicetree in the driver. That's the job
of DT schema.

So let's switch to devm_clk_bulk_get_all() API that just gets the clocks
provided by devicetree and remove hardcoded clocks info.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 61 +++----------------------
 1 file changed, 7 insertions(+), 54 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 514fa14df634..174b105fda82 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -837,9 +837,6 @@ struct qmp_phy_cfg {
 	/* Additional sequence for HS G4 */
 	const struct qmp_phy_cfg_tbls tbls_hs_g4;
 
-	/* clock ids to be requested */
-	const char * const *clk_list;
-	int num_clks;
 	/* regulators to be requested */
 	const char * const *vreg_list;
 	int num_vregs;
@@ -865,6 +862,7 @@ struct qmp_ufs {
 	void __iomem *rx2;
 
 	struct clk_bulk_data *clks;
+	int num_clks;
 	struct regulator_bulk_data *vregs;
 	struct reset_control *ufs_reset;
 
@@ -897,20 +895,6 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }
 
-/* list of clocks required by phy */
-static const char * const msm8996_ufs_phy_clk_l[] = {
-	"ref",
-};
-
-/* the primary usb3 phy on sm8250 doesn't have a ref clock */
-static const char * const sm8450_ufs_phy_clk_l[] = {
-	"qref", "ref", "ref_aux",
-};
-
-static const char * const sdm845_ufs_phy_clk_l[] = {
-	"ref", "ref_aux",
-};
-
 /* list of regulators */
 static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
@@ -948,9 +932,6 @@ static const struct qmp_phy_cfg msm8996_ufsphy_cfg = {
 		.rx_num		= ARRAY_SIZE(msm8996_ufsphy_rx),
 	},
 
-	.clk_list		= msm8996_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(msm8996_ufs_phy_clk_l),
-
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 
@@ -986,8 +967,6 @@ static const struct qmp_phy_cfg sa8775p_ufsphy_cfg = {
 		.pcs		= sm8350_ufsphy_g4_pcs,
 		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_g4_pcs),
 	},
-	.clk_list		= sm8450_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sm8450_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= ufsphy_v5_regs_layout,
@@ -1020,8 +999,6 @@ static const struct qmp_phy_cfg sc7280_ufsphy_cfg = {
 		.pcs            = sm8150_ufsphy_hs_g4_pcs,
 		.pcs_num        = ARRAY_SIZE(sm8150_ufsphy_hs_g4_pcs),
 	},
-	.clk_list               = sm8450_ufs_phy_clk_l,
-	.num_clks               = ARRAY_SIZE(sm8450_ufs_phy_clk_l),
 	.vreg_list              = qmp_phy_vreg_l,
 	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs                   = ufsphy_v4_regs_layout,
@@ -1054,8 +1031,6 @@ static const struct qmp_phy_cfg sc8280xp_ufsphy_cfg = {
 		.pcs		= sm8350_ufsphy_g4_pcs,
 		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_g4_pcs),
 	},
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= ufsphy_v5_regs_layout,
@@ -1080,8 +1055,6 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 		.serdes		= sdm845_ufsphy_hs_b_serdes,
 		.serdes_num	= ARRAY_SIZE(sdm845_ufsphy_hs_b_serdes),
 	},
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= ufsphy_v3_regs_layout,
@@ -1108,8 +1081,6 @@ static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
 		.serdes		= sm6115_ufsphy_hs_b_serdes,
 		.serdes_num	= ARRAY_SIZE(sm6115_ufsphy_hs_b_serdes),
 	},
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= ufsphy_v2_regs_layout,
@@ -1136,8 +1107,6 @@ static const struct qmp_phy_cfg sm7150_ufsphy_cfg = {
 		.serdes		= sdm845_ufsphy_hs_b_serdes,
 		.serdes_num	= ARRAY_SIZE(sdm845_ufsphy_hs_b_serdes),
 	},
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= ufsphy_v3_regs_layout,
@@ -1172,8 +1141,6 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 		.pcs		= sm8150_ufsphy_hs_g4_pcs,
 		.pcs_num	= ARRAY_SIZE(sm8150_ufsphy_hs_g4_pcs),
 	},
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= ufsphy_v4_regs_layout,
@@ -1206,8 +1173,6 @@ static const struct qmp_phy_cfg sm8250_ufsphy_cfg = {
 		.pcs		= sm8150_ufsphy_hs_g4_pcs,
 		.pcs_num	= ARRAY_SIZE(sm8150_ufsphy_hs_g4_pcs),
 	},
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= ufsphy_v4_regs_layout,
@@ -1240,8 +1205,6 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 		.pcs		= sm8350_ufsphy_g4_pcs,
 		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_g4_pcs),
 	},
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= ufsphy_v5_regs_layout,
@@ -1274,8 +1237,6 @@ static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
 		.pcs		= sm8350_ufsphy_g4_pcs,
 		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_g4_pcs),
 	},
-	.clk_list		= sm8450_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sm8450_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= ufsphy_v5_regs_layout,
@@ -1296,8 +1257,6 @@ static const struct qmp_phy_cfg sm8550_ufsphy_cfg = {
 		.pcs		= sm8550_ufsphy_pcs,
 		.pcs_num	= ARRAY_SIZE(sm8550_ufsphy_pcs),
 	},
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= ufsphy_v6_regs_layout,
@@ -1383,7 +1342,7 @@ static int qmp_ufs_com_init(struct qmp_ufs *qmp)
 		return ret;
 	}
 
-	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
+	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
 	if (ret)
 		goto err_disable_regulators;
 
@@ -1403,7 +1362,7 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
 
 	reset_control_assert(qmp->ufs_reset);
 
-	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -1573,19 +1532,13 @@ static int qmp_ufs_vreg_init(struct qmp_ufs *qmp)
 
 static int qmp_ufs_clk_init(struct qmp_ufs *qmp)
 {
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	struct device *dev = qmp->dev;
-	int num = cfg->num_clks;
-	int i;
 
-	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
-	if (!qmp->clks)
-		return -ENOMEM;
+	qmp->num_clks = devm_clk_bulk_get_all(dev, &qmp->clks);
+	if (qmp->num_clks < 0)
+		return qmp->num_clks;
 
-	for (i = 0; i < num; i++)
-		qmp->clks[i].id = cfg->clk_list[i];
-
-	return devm_clk_bulk_get(dev, num, qmp->clks);
+	return 0;
 }
 
 static void qmp_ufs_clk_release_provider(void *res)
-- 
2.25.1


