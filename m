Return-Path: <linux-clk+bounces-6308-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 640638AF881
	for <lists+linux-clk@lfdr.de>; Tue, 23 Apr 2024 22:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D78E11F22434
	for <lists+linux-clk@lfdr.de>; Tue, 23 Apr 2024 20:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127D91487D0;
	Tue, 23 Apr 2024 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r72RSS1Z"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4916C1474CD
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 20:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905438; cv=none; b=Bbgdua56t6eLyEXh8Bk/BlqqlYKUHFR5bUXM34aXnw8raTbP+JUwpnXzvlDP7Syj6LcbHX8EMPGB0eIaxCFH0qQXjyCd0De5V1JZgJk13aUdor6D+XCSHoftmaTMbVjydTe/OYH+GX3ChURjiHye18duIWqUBeh0Fj/gvn3W3S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905438; c=relaxed/simple;
	bh=4voZEqu5pgxJWhQLFpUlGAoqVh0UMmPaxzuFWEaIxYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Be6oTQf0PCwq3DXu/ze6XrIZJHsdbbR6C2txxDjv7LqUU3LtbyK1gtdUOR7FVrYxh453+qszT5z+xbXGSrbRx283UhsHUfqQl+0X1g+RyFq34EBr+MaRrMzBV2zITPwwO76t8gXG7F45AJBre7xqZBdEGw3VNGj+njLwGIt4qtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r72RSS1Z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41a1d2a7b81so1445825e9.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 13:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905434; x=1714510234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wg6doAvmwMbN07RQYwiVhFUbCIPMhfuvbRuHOazCfig=;
        b=r72RSS1Znis4Z0uJncY7i3WTnOfJS2UzkLal/y/nnkV9NEiXlxx3oRUcw9PYr4X5oa
         jhlLLm2MD/tT0rscSlWjHKLolKmH8619b2gsvkye10OK/FPGuZeC1A4sA27rFx9rGQxL
         tqIT/Ufl5zTnN7LA0YMnFxIVZMUFk6R0NvRCHRol3IopQpEU/7Ao7yzsR8f1+AH+Qg2U
         CTW5CZo1xfP4FW3cwAKsdb2vrZlC2NOu7teMHJZuILAPj6MGIUMGlUX19eIxW1a5Q8tc
         leo/dSeTPRWKdUCHiBjq6vtXHstC33rzx9mT5egddLCxf+ClgEYPr88XUWdm7vf/e7rE
         3B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905434; x=1714510234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wg6doAvmwMbN07RQYwiVhFUbCIPMhfuvbRuHOazCfig=;
        b=wEbWvqWzVhSQq3XNACM4CDbkdacrVS5SPvJHZ8DptjSOg1vpJNN6hx/jachPuCLj89
         kcDhmfFufiMfGdtxm2qtzgVzG2IKiBwAXmFDHPVxkXG2BK3mIMevQq6hegN2XOOxiZfv
         I+GQFGkgCyEeAzu59KeEMPQNaPFNhoJ8gx80NkdLVMPlU5Dym8ybcIDkY0kVvp/7an3w
         BSr+j+tZO51xD9A75yOyDynlBjeoayfrX4P/WVgNn0Afe9ZD+MnFtL7Jo7RrYGD+BGwF
         yui1+tQBCnHKL34bKE1TkcadQp48EZxbau5Zy6kD7vs6kqT0FVL0YE96sUK08fcYFZ5m
         ZSHg==
X-Forwarded-Encrypted: i=1; AJvYcCUEtc4ykhZmvjpol5kr/L1eSsrsysjzrzUqegz7vv9CdCO1gXEMu8IHMnt2RywnvxTOgHHN/tdsqgIAsCcOVYkmz1L2CRsi2e7p
X-Gm-Message-State: AOJu0YypIGehOpJGM4PeGOLzMC0iYMa1PDxfFxWHQ1357Bh+3n/AH5S7
	YGG4KzfP5bRHf7NACjTUdBjt3hyI8CM4J7p83lZHwNy3pVTxqN2AuyeuPr7WTh0=
X-Google-Smtp-Source: AGHT+IHpTD8Cr6M+2NTSC2u68tqVshhxaSxl/CWxXXjFa2PJ/gU0r5d93Exaf3DmIOCu8zZKCPtSxA==
X-Received: by 2002:a05:600c:4f06:b0:418:d3f4:677b with SMTP id l6-20020a05600c4f0600b00418d3f4677bmr347958wmq.17.1713905433802;
        Tue, 23 Apr 2024 13:50:33 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:33 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	James.Bottomley@HansenPartnership.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 11/14] scsi: ufs: host: ufs-exynos: add some pa_dbg_ register offsets into drvdata
Date: Tue, 23 Apr 2024 21:50:03 +0100
Message-ID: <20240423205006.1785138-12-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240423205006.1785138-1-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows these registers to be at different offsets or not
exist at all on some SoCs variants.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Will McVicker <willmcvicker@google.com>
---
 drivers/ufs/host/ufs-exynos.c | 38 ++++++++++++++++++++++++-----------
 drivers/ufs/host/ufs-exynos.h |  6 +++++-
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 66093a905986..c086630a96e8 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -308,8 +308,9 @@ static int exynosauto_ufs_post_pwr_change(struct exynos_ufs *ufs,
 
 static int exynos7_ufs_pre_link(struct exynos_ufs *ufs)
 {
+	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
+	u32 val = attr->pa_dbg_opt_suite1_val;
 	struct ufs_hba *hba = ufs->hba;
-	u32 val = ufs->drv_data->uic_attr->pa_dbg_option_suite;
 	int i;
 
 	exynos_ufs_enable_ov_tm(hba);
@@ -326,12 +327,13 @@ static int exynos7_ufs_pre_link(struct exynos_ufs *ufs)
 			UIC_ARG_MIB_SEL(TX_HIBERN8_CONTROL, i), 0x0);
 	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_TXPHY_CFGUPDT), 0x1);
 	udelay(1);
-	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_OPTION_SUITE), val | (1 << 12));
+	ufshcd_dme_set(hba, UIC_ARG_MIB(attr->pa_dbg_opt_suite1_off),
+					val | (1 << 12));
 	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_SKIP_RESET_PHY), 0x1);
 	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_SKIP_LINE_RESET), 0x1);
 	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_LINE_RESET_REQ), 0x1);
 	udelay(1600);
-	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_OPTION_SUITE), val);
+	ufshcd_dme_set(hba, UIC_ARG_MIB(attr->pa_dbg_opt_suite1_off), val);
 
 	return 0;
 }
@@ -923,14 +925,19 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 
 static void exynos_ufs_config_unipro(struct exynos_ufs *ufs)
 {
+	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
 	struct ufs_hba *hba = ufs->hba;
 
-	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_CLK_PERIOD),
-		DIV_ROUND_UP(NSEC_PER_SEC, ufs->mclk_rate));
+	if (attr->pa_dbg_clk_period_off)
+		ufshcd_dme_set(hba, UIC_ARG_MIB(attr->pa_dbg_clk_period_off),
+			       DIV_ROUND_UP(NSEC_PER_SEC, ufs->mclk_rate));
+
 	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXTRAILINGCLOCKS),
 			ufs->drv_data->uic_attr->tx_trailingclks);
-	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_OPTION_SUITE),
-			ufs->drv_data->uic_attr->pa_dbg_option_suite);
+
+	if (attr->pa_dbg_opt_suite1_off)
+		ufshcd_dme_set(hba, UIC_ARG_MIB(attr->pa_dbg_opt_suite1_off),
+			       attr->pa_dbg_opt_suite1_val);
 }
 
 static void exynos_ufs_config_intr(struct exynos_ufs *ufs, u32 errs, u8 index)
@@ -1488,10 +1495,11 @@ static int exynosauto_ufs_vh_init(struct ufs_hba *hba)
 
 static int fsd_ufs_pre_link(struct exynos_ufs *ufs)
 {
-	int i;
+	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
 	struct ufs_hba *hba = ufs->hba;
+	int i;
 
-	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_CLK_PERIOD),
+	ufshcd_dme_set(hba, UIC_ARG_MIB(attr->pa_dbg_clk_period_off),
 		       DIV_ROUND_UP(NSEC_PER_SEC,  ufs->mclk_rate));
 	ufshcd_dme_set(hba, UIC_ARG_MIB(0x201), 0x12);
 	ufshcd_dme_set(hba, UIC_ARG_MIB(0x200), 0x40);
@@ -1515,7 +1523,9 @@ static int fsd_ufs_pre_link(struct exynos_ufs *ufs)
 
 	ufshcd_dme_set(hba, UIC_ARG_MIB(0x200), 0x0);
 	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_AUTOMODE_THLD), 0x4E20);
-	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_DBG_OPTION_SUITE), 0x2e820183);
+
+	ufshcd_dme_set(hba, UIC_ARG_MIB(attr->pa_dbg_opt_suite1_off),
+		       0x2e820183);
 	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0x0);
 
 	exynos_ufs_establish_connt(ufs);
@@ -1651,7 +1661,9 @@ static struct exynos_ufs_uic_attr exynos7_uic_attr = {
 	.rx_hs_g1_prep_sync_len_cap	= PREP_LEN(0xf),
 	.rx_hs_g2_prep_sync_len_cap	= PREP_LEN(0xf),
 	.rx_hs_g3_prep_sync_len_cap	= PREP_LEN(0xf),
-	.pa_dbg_option_suite		= 0x30103,
+	.pa_dbg_clk_period_off		= PA_DBG_CLK_PERIOD,
+	.pa_dbg_opt_suite1_val		= 0x30103,
+	.pa_dbg_opt_suite1_off		= PA_DBG_OPTION_SUITE,
 };
 
 static const struct exynos_ufs_drv_data exynosauto_ufs_drvs = {
@@ -1725,7 +1737,9 @@ static struct exynos_ufs_uic_attr fsd_uic_attr = {
 	.rx_hs_g1_prep_sync_len_cap	= PREP_LEN(0xf),
 	.rx_hs_g2_prep_sync_len_cap	= PREP_LEN(0xf),
 	.rx_hs_g3_prep_sync_len_cap	= PREP_LEN(0xf),
-	.pa_dbg_option_suite		= 0x2E820183,
+	.pa_dbg_clk_period_off		= PA_DBG_CLK_PERIOD,
+	.pa_dbg_opt_suite1_val		= 0x2E820183,
+	.pa_dbg_opt_suite1_off		= PA_DBG_OPTION_SUITE,
 };
 
 static const struct exynos_ufs_drv_data fsd_ufs_drvs = {
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index 7acc13914100..f30423223474 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -145,7 +145,11 @@ struct exynos_ufs_uic_attr {
 	/* Common Attributes */
 	unsigned int cmn_pwm_clk_ctrl;
 	/* Internal Attributes */
-	unsigned int pa_dbg_option_suite;
+	unsigned int pa_dbg_clk_period_off;
+	unsigned int pa_dbg_opt_suite1_val;
+	unsigned int pa_dbg_opt_suite1_off;
+	unsigned int pa_dbg_opt_suite2_val;
+	unsigned int pa_dbg_opt_suite2_off;
 	/* Changeable Attributes */
 	unsigned int rx_adv_fine_gran_sup_en;
 	unsigned int rx_adv_fine_gran_step;
-- 
2.44.0.769.g3c40516874-goog


