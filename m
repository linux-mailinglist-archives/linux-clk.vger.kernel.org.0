Return-Path: <linux-clk+bounces-4081-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B279D862992
	for <lists+linux-clk@lfdr.de>; Sun, 25 Feb 2024 07:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 295F31F226AC
	for <lists+linux-clk@lfdr.de>; Sun, 25 Feb 2024 06:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F078FC15;
	Sun, 25 Feb 2024 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzUAEZTU"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF3A17732;
	Sun, 25 Feb 2024 06:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708844053; cv=none; b=RRq33JaZhjEx1k5jxWcww36lHCvS7K3u3wzd8JJgNrbiXxgnc86te9Ha+L7j9YJ4iaS+sZ8y7uq8ljl2cpp3xh6M6TC7MoMeP4q6VezZ+YJcbfmVzRHTadEzoOcPTagW31+/U6ZS2JuLH3aE1psurn482maF/DEFCBWvc8kDzvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708844053; c=relaxed/simple;
	bh=sUsxId8omUWt6VItISn+9wtugEUSV9QdgRKpKVM4kcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBz9TCJm8NlSbu1cyj4+6fDYCqbuJMX5nc1hXE9VG5IPnTcUF1t2UkYL17vb6CVBniGJzoqrNex8pPFR49IW6ZAKA//hbsJxv+wel/Kq+4M+QLej5Q4xhoaiVUsytqhIGT/l3NWL8UWn6YjbGEhgrVypKAcaJBrawS6e/a5mONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzUAEZTU; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d8ddbac4fbso1625050a12.0;
        Sat, 24 Feb 2024 22:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708844049; x=1709448849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En3DknAkSP9/TEBmSYUcWfYSvcRPGEKXevskEBxQJgo=;
        b=fzUAEZTUMledlPxI/7rOijtP3Jf3EOGF8J5d9PsAFgyw55krXCifF01+LJWRd3qIOT
         hCZ5q+OFWVwzXhlhUVeMJTOSM021E3DQ0LKjr4vKqSYR9XjeQYB4TpmfuFaJthi43qWL
         TZBql/5ijJvGP2KKOvNHaDc0x/Vr1S8h97Y9iyA4EcSjhOjTti21ETuXhLUMJmcXoC6a
         N/vqVcgWvbvtDU7K6zV9e976HmvFwKRcvPBpA26odGFLqfAM4E3k0bkoWwmN2Rvr0wfL
         r4XdlGBo2/ncnut3Leqa+SWO5B/WQas40LEtHRwWEhyW3wPN9JkifkfqaxCRoHad967T
         qNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708844049; x=1709448849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En3DknAkSP9/TEBmSYUcWfYSvcRPGEKXevskEBxQJgo=;
        b=T4Gu9a79Hupbu8HahryEQKCAyBPR3JfcqKS8jhEBBwq2XyT9O5Wm2pAB+FAV3fyxwz
         XsuV8D63ram3zKXLTVHswVH+DQs/rne62qqoxkgXuH2ZZk4IhM5fM27pzA1TRB8NahaK
         4jBbNRIKYO54rE0nCjHGH6vmAAUin3TNDk6E8Gpt3V04pIpfodrkDs++srClpYlLj42M
         9ofG0KByFYiK+VifAdFCa5lhA24cAgSlaux3zpoP6oYU7HiFEj3k1GcHAYfKsb21M8ZD
         A+UoKQj0HK1NhrFZghALNlrNu4BnTZ+LcNfdWjRdWZPrThpnmEuvyokQ4fOOXvR2jsbO
         L+8w==
X-Forwarded-Encrypted: i=1; AJvYcCX8WB4mQLodXcurYSOaJR5uGCR88lb85Y1iW2D7DZoazizsaQByByIfhkus36x766A/kGpnJJcj8OKbNo8DGRdBPxwaN0De8bF+DXu2
X-Gm-Message-State: AOJu0YwATQMxc5j1NUjOdnq/tJw4hguOsDsc8tuCakQfNufwVRuXVi53
	igTQ5hP7Z93Zsq1YwckSnsLNy9FIY5r7huTMNaCa9J07EecWNC6EKzPBlq9mbCGsyg==
X-Google-Smtp-Source: AGHT+IEPqS0zgB12S6yY8IZ2Y5Y3quE6a4GarAXp0xNyRKRyoHRjNxdxOiDrQYSzNFRtOO3IwCD7LQ==
X-Received: by 2002:a05:6a20:d70f:b0:1a0:d1e6:cf8a with SMTP id iz15-20020a056a20d70f00b001a0d1e6cf8amr5077910pzb.18.1708844049472;
        Sat, 24 Feb 2024 22:54:09 -0800 (PST)
Received: from localhost.localdomain ([171.218.176.26])
        by smtp.gmail.com with ESMTPSA id p18-20020a056a0026d200b006e45b910a98sm1930313pfw.6.2024.02.24.22.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 22:54:09 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Yang Xiwen <forbidden405@outlook.com>,
	David Yang <mmyangfl@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 13/13] clk: hisilicon: Migrate devm APIs
Date: Sun, 25 Feb 2024 14:52:28 +0800
Message-ID: <20240225065234.413687-14-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240225065234.413687-1-mmyangfl@gmail.com>
References: <20240225065234.413687-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Migrates devm APIs for HiSilicon clock drivers.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/clk/hisilicon/clk-hi3559a.c       |  29 +-
 drivers/clk/hisilicon/clk-hi3620.c        |  30 +-
 drivers/clk/hisilicon/clk-hi6220-stub.c   |   9 +-
 drivers/clk/hisilicon/clk-hi6220.c        |   4 +-
 drivers/clk/hisilicon/clk-hisi-phase.c    |  13 +-
 drivers/clk/hisilicon/clk-hix5hd2.c       |  15 +-
 drivers/clk/hisilicon/clk.c               | 430 +++++++---------------
 drivers/clk/hisilicon/clk.h               |  99 +++--
 drivers/clk/hisilicon/clkdivider-hi6220.c |  24 +-
 drivers/clk/hisilicon/clkgate-separated.c |  26 +-
 10 files changed, 267 insertions(+), 412 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3559a.c b/drivers/clk/hisilicon/clk-hi3559a.c
index 5d3b36c90886..15fe4c7ec0d2 100644
--- a/drivers/clk/hisilicon/clk-hi3559a.c
+++ b/drivers/clk/hisilicon/clk-hi3559a.c
@@ -457,17 +457,16 @@ hisi_clk_register_pll(struct device *dev, const void *clocks,
 {
 	const struct hi3559av100_pll_clock *clks = clocks;
 	void __iomem *base = data->base;
-	struct hi3559av100_clk_pll *p_clk = NULL;
-	struct clk *clk = NULL;
+	struct hi3559av100_clk_pll *p_clk;
 	struct clk_init_data init;
 	int i;
-
-	p_clk = devm_kzalloc(dev, sizeof(*p_clk) * num, GFP_KERNEL);
-
-	if (!p_clk)
-		return -ENOMEM;
+	int ret;
 
 	for (i = 0; i < num; i++) {
+		p_clk = devm_kzalloc(dev, sizeof(*p_clk), GFP_KERNEL);
+		if (!p_clk)
+			return -ENOMEM;
+
 		init.name = clks[i].name;
 		init.flags = 0;
 		init.parent_names =
@@ -490,16 +489,14 @@ hisi_clk_register_pll(struct device *dev, const void *clocks,
 		p_clk->refdiv_width = clks[i].refdiv_width;
 		p_clk->hw.init = &init;
 
-		clk = clk_register(NULL, &p_clk->hw);
-		if (IS_ERR(clk)) {
-			devm_kfree(dev, p_clk);
+		ret = devm_clk_hw_register(dev, &p_clk->hw);
+		if (ret) {
 			dev_err(dev, "%s: failed to register clock %s\n",
-			       __func__, clks[i].name);
-			return PTR_ERR(clk);
+				__func__, clks[i].name);
+			return ret;
 		}
 
-		data->clk_data.clks[clks[i].id] = clk;
-		p_clk++;
+		data->clk_data->hws[clks[i].id] = &p_clk->hw;
 	}
 
 	return 0;
@@ -628,7 +625,7 @@ static int hi3559av100_shub_default_clk_set(struct device *dev, struct hisi_cloc
 	void __iomem *crg_base;
 	unsigned int val;
 
-	crg_base = ioremap(CRG_BASE_ADDR, SZ_4K);
+	crg_base = devm_ioremap(dev, CRG_BASE_ADDR, SZ_4K);
 
 	/* SSP: 192M/2 */
 	val = readl_relaxed(crg_base + 0x20);
@@ -640,7 +637,7 @@ static int hi3559av100_shub_default_clk_set(struct device *dev, struct hisi_cloc
 	val |= (0x1 << 28);
 	writel_relaxed(val, crg_base + 0x1C);
 
-	iounmap(crg_base);
+	devm_iounmap(dev, crg_base);
 	crg_base = NULL;
 
 	return 0;
diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon/clk-hi3620.c
index 8832cdd6bd57..6b381f07d4c7 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -11,11 +11,10 @@
 
 #include <linux/kernel.h>
 #include <linux/clk-provider.h>
+#include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/slab.h>
+#include <linux/mod_devicetable.h>
 
 #include <dt-bindings/clock/hi3620-clock.h>
 
@@ -398,15 +397,15 @@ static const struct clk_ops clk_mmc_ops = {
 	.recalc_rate = mmc_clk_recalc_rate,
 };
 
-static struct clk *
+static struct clk_hw *
 clk_register_hisi_mmc(struct device *dev, const struct hisi_mmc_clock *mmc_clk,
 		      void __iomem *base)
 {
 	struct clk_mmc *mclk;
-	struct clk *clk;
 	struct clk_init_data init;
+	int ret;
 
-	mclk = kzalloc(sizeof(*mclk), GFP_KERNEL);
+	mclk = devm_kzalloc(dev, sizeof(*mclk), GFP_KERNEL);
 	if (!mclk)
 		return ERR_PTR(-ENOMEM);
 
@@ -430,26 +429,31 @@ clk_register_hisi_mmc(struct device *dev, const struct hisi_mmc_clock *mmc_clk,
 	mclk->sam_off = mmc_clk->sam_off;
 	mclk->sam_bits = mmc_clk->sam_bits;
 
-	clk = clk_register(NULL, &mclk->hw);
-	if (WARN_ON(IS_ERR(clk)))
-		kfree(mclk);
-	return clk;
+	ret = devm_clk_hw_register(dev, &mclk->hw);
+	if (ret) {
+		dev_err(dev, "%s: failed to register clock %s\n",
+			__func__, init.name);
+		return ERR_PTR(ret);
+	}
+
+	return &mclk->hw;
 }
 
 static int hisi_register_clk_mmc(struct device *dev, const void *clocks,
 				 size_t num, struct hisi_clock_data *data)
 {
 	const struct hisi_mmc_clock *clks = clocks;
+	int i;
 
-	for (int i = 0; i < num; i++) {
-		struct clk *clk = clk_register_hisi_mmc(dev, &clks[i], data->base);
+	for (i = 0; i < num; i++) {
+		struct clk_hw *clk = clk_register_hisi_mmc(dev, &clks[i], data->base);
 
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
 			return PTR_ERR(clk);
 		}
-		data->clk_data.clks[clks[i].id] = clk;
+		data->clk_data->hws[clks[i].id] = clk;
 	}
 
 	return 0;
diff --git a/drivers/clk/hisilicon/clk-hi6220-stub.c b/drivers/clk/hisilicon/clk-hi6220-stub.c
index a8319795ed1c..f194c2394638 100644
--- a/drivers/clk/hisilicon/clk-hi6220-stub.c
+++ b/drivers/clk/hisilicon/clk-hi6220-stub.c
@@ -195,7 +195,6 @@ static int hi6220_stub_clk_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct clk_init_data init;
 	struct hi6220_stub_clk *stub_clk;
-	struct clk *clk;
 	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
@@ -233,11 +232,11 @@ static int hi6220_stub_clk_probe(struct platform_device *pdev)
 	init.num_parents = 0;
 	init.flags = 0;
 
-	clk = devm_clk_register(dev, &stub_clk->hw);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = devm_clk_hw_register(dev, &stub_clk->hw);
+	if (ret)
+		return ret;
 
-	ret = of_clk_add_provider(np, of_clk_src_simple_get, clk);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &stub_clk->hw);
 	if (ret) {
 		dev_err(dev, "failed to register OF clock provider\n");
 		return ret;
diff --git a/drivers/clk/hisilicon/clk-hi6220.c b/drivers/clk/hisilicon/clk-hi6220.c
index 1b40d0d90229..bf8345ce7a8c 100644
--- a/drivers/clk/hisilicon/clk-hi6220.c
+++ b/drivers/clk/hisilicon/clk-hi6220.c
@@ -20,9 +20,7 @@ static int
 hi6220_clk_register_divider_stub(struct device *dev, const void *clks,
 				 size_t num, struct hisi_clock_data *data)
 {
-	/* INCOMPLETE PATCH */
-	hi6220_clk_register_divider(clks, num, data);
-	return 0;
+	return hi6220_clk_register_divider(dev, clks, num, data);
 }
 
 /* clocks in AO (always on) controller */
diff --git a/drivers/clk/hisilicon/clk-hisi-phase.c b/drivers/clk/hisilicon/clk-hisi-phase.c
index ba6afad66a2b..15a23dd6edb1 100644
--- a/drivers/clk/hisilicon/clk-hisi-phase.c
+++ b/drivers/clk/hisilicon/clk-hisi-phase.c
@@ -5,11 +5,11 @@
  * Simple HiSilicon phase clock implementation.
  */
 
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/slab.h>
 
 #include "clk.h"
 
@@ -90,12 +90,13 @@ static const struct clk_ops clk_phase_ops = {
 	.set_phase = hisi_clk_set_phase,
 };
 
-struct clk *clk_register_hisi_phase(struct device *dev,
+struct clk_hw *devm_clk_hw_register_hisi_phase(struct device *dev,
 		const struct hisi_phase_clock *clks,
 		void __iomem *base, spinlock_t *lock)
 {
 	struct clk_hisi_phase *phase;
 	struct clk_init_data init;
+	int ret;
 
 	phase = devm_kzalloc(dev, sizeof(struct clk_hisi_phase), GFP_KERNEL);
 	if (!phase)
@@ -116,6 +117,10 @@ struct clk *clk_register_hisi_phase(struct device *dev,
 	phase->phase_num = clks->phase_num;
 	phase->hw.init = &init;
 
-	return devm_clk_register(dev, &phase->hw);
+	ret = devm_clk_hw_register(dev, &phase->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &phase->hw;
 }
-EXPORT_SYMBOL_GPL(clk_register_hisi_phase);
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_hisi_phase);
diff --git a/drivers/clk/hisilicon/clk-hix5hd2.c b/drivers/clk/hisilicon/clk-hix5hd2.c
index 0a3f1320d0d5..66d4c232b28b 100644
--- a/drivers/clk/hisilicon/clk-hix5hd2.c
+++ b/drivers/clk/hisilicon/clk-hix5hd2.c
@@ -6,7 +6,7 @@
 
 #include <dt-bindings/clock/hix5hd2-clock.h>
 
-#include <linux/slab.h>
+#include <linux/device.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -260,13 +260,13 @@ hix5hd2_clk_register_complex(struct device *dev, const void *clocks, size_t num,
 	const struct hix5hd2_complex_clock *clks = clocks;
 	void __iomem *base = data->base;
 	int i;
+	int ret;
 
 	for (i = 0; i < num; i++) {
 		struct hix5hd2_clk_complex *p_clk;
-		struct clk *clk;
 		struct clk_init_data init;
 
-		p_clk = kzalloc(sizeof(*p_clk), GFP_KERNEL);
+		p_clk = devm_kzalloc(dev, sizeof(*p_clk), GFP_KERNEL);
 		if (!p_clk)
 			return -ENOMEM;
 
@@ -289,15 +289,14 @@ hix5hd2_clk_register_complex(struct device *dev, const void *clocks, size_t num,
 		p_clk->phy_rst_mask = clks[i].phy_rst_mask;
 		p_clk->hw.init = &init;
 
-		clk = clk_register(NULL, &p_clk->hw);
-		if (IS_ERR(clk)) {
-			kfree(p_clk);
+		ret = devm_clk_hw_register(dev, &p_clk->hw);
+		if (ret) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
-			return PTR_ERR(p_clk);
+			return ret;
 		}
 
-		data->clk_data.clks[clks[i].id] = clk;
+		data->clk_data->hws[clks[i].id] = &p_clk->hw;
 	}
 
 	return 0;
diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index e50115f8e236..53966db0781b 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2012-2013 Hisilicon Limited.
  * Copyright (c) 2012-2013 Linaro Limited.
+ * Copyright (c) 2023 David Yang
  *
  * Author: Haojian Zhuang <haojian.zhuang@linaro.org>
  *	   Xin Li <li.xin@linaro.org>
@@ -13,6 +14,8 @@
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -23,343 +26,214 @@
 
 static DEFINE_SPINLOCK(hisi_clk_lock);
 
-struct hisi_clock_data *hisi_clk_alloc(struct platform_device *pdev,
-						int nr_clks)
+struct hisi_clock_data *hisi_clk_init(struct device_node *np, size_t nr)
 {
-	struct hisi_clock_data *clk_data;
-	struct resource *res;
-	struct clk **clk_table;
-
-	clk_data = devm_kmalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
-	if (!clk_data)
-		return NULL;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return NULL;
-	clk_data->base = devm_ioremap(&pdev->dev,
-				res->start, resource_size(res));
-	if (!clk_data->base)
-		return NULL;
-
-	clk_table = devm_kmalloc_array(&pdev->dev, nr_clks,
-				       sizeof(*clk_table),
-				       GFP_KERNEL);
-	if (!clk_table)
-		return NULL;
-
-	clk_data->clk_data.clks = clk_table;
-	clk_data->clk_data.clk_num = nr_clks;
-
-	return clk_data;
-}
-EXPORT_SYMBOL_GPL(hisi_clk_alloc);
-
-struct hisi_clock_data *hisi_clk_init(struct device_node *np,
-					     int nr_clks)
-{
-	struct hisi_clock_data *clk_data;
-	struct clk **clk_table;
 	void __iomem *base;
+	struct hisi_clock_data *data;
+	int ret;
+	int i;
 
 	base = of_iomap(np, 0);
 	if (!base) {
 		pr_err("%s: failed to map clock registers\n", __func__);
-		goto err;
+		return NULL;
 	}
 
-	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
-	if (!clk_data)
-		goto err;
+	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
 
-	clk_data->base = base;
-	clk_table = kcalloc(nr_clks, sizeof(*clk_table), GFP_KERNEL);
-	if (!clk_table)
+	data->clk_data = kzalloc(sizeof(*data->clk_data) + nr * sizeof(data->clk_data->hws[0]),
+				 GFP_KERNEL);
+	if (!data->clk_data)
 		goto err_data;
 
-	clk_data->clk_data.clks = clk_table;
-	clk_data->clk_data.clk_num = nr_clks;
-	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data->clk_data);
-	return clk_data;
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, data->clk_data);
+	if (ret)
+		goto err_clk;
+
+	data->base = base;
+	data->clks = NULL;
+	data->clk_data->num = nr;
+	for (i = 0; i < nr; i++)
+		data->clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
+
+	return data;
+
+err_clk:
+	kfree(data->clk_data);
 err_data:
-	kfree(clk_data);
-err:
+	kfree(data);
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(hisi_clk_init);
 
+#define hisi_clk_unregister_fn(type) \
+static void hisi_clk_unregister_##type(struct hisi_clock_data *data) \
+{ \
+	for (int i = 0; i < data->clks->type##_clks_num; i++) { \
+		struct clk_hw *clk = data->clk_data->hws[data->clks->type##_clks[i].id]; \
+\
+		if (clk && !IS_ERR(clk)) \
+			clk_hw_unregister_##type(clk); \
+	} \
+}
+
+hisi_clk_unregister_fn(fixed_rate)
+hisi_clk_unregister_fn(fixed_factor)
+
 void hisi_clk_free(struct device_node *np, struct hisi_clock_data *data)
 {
 	if (data->clks) {
 		if (data->clks->fixed_rate_clks_num)
-			hisi_clk_unregister_fixed_rate(data->clks->fixed_rate_clks,
-						       data->clks->fixed_rate_clks_num,
-						       data);
+			hisi_clk_unregister_fixed_rate(data);
 		if (data->clks->fixed_factor_clks_num)
-			hisi_clk_unregister_fixed_factor(data->clks->fixed_factor_clks,
-							 data->clks->fixed_factor_clks_num,
-							 data);
+			hisi_clk_unregister_fixed_factor(data);
 	}
 
 	of_clk_del_provider(np);
-	kfree(data->clk_data.clks);
+	kfree(data->clk_data);
 	kfree(data);
 }
 EXPORT_SYMBOL_GPL(hisi_clk_free);
 
 int hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *clks,
-					 int nums, struct hisi_clock_data *data)
+				 size_t num, struct hisi_clock_data *data)
 {
-	struct clk *clk;
+	struct clk_hw *clk;
 	int i;
 
-	for (i = 0; i < nums; i++) {
-		clk = clk_register_fixed_rate(NULL, clks[i].name,
-					      clks[i].parent_name,
-					      clks[i].flags,
-					      clks[i].fixed_rate);
+	for (i = 0; i < num; i++) {
+		const struct hisi_fixed_rate_clock *p_clk = &clks[i];
+
+		clk = clk_hw_register_fixed_rate(NULL, p_clk->name, p_clk->parent_name,
+			p_clk->flags, p_clk->fixed_rate);
+
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
-			       __func__, clks[i].name);
+			       __func__, p_clk->name);
 			goto err;
 		}
-		data->clk_data.clks[clks[i].id] = clk;
+
+		data->clk_data->hws[p_clk->id] = clk;
 	}
 
 	return 0;
 
 err:
 	while (i--)
-		clk_unregister_fixed_rate(data->clk_data.clks[clks[i].id]);
-
+		clk_hw_unregister_fixed_rate(data->clk_data->hws[clks[i].id]);
 	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(hisi_clk_register_fixed_rate);
 
 int hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *clks,
-					   int nums,
-					   struct hisi_clock_data *data)
+				   size_t num, struct hisi_clock_data *data)
 {
-	struct clk *clk;
+	struct clk_hw *clk;
 	int i;
 
-	for (i = 0; i < nums; i++) {
-		clk = clk_register_fixed_factor(NULL, clks[i].name,
-						clks[i].parent_name,
-						clks[i].flags, clks[i].mult,
-						clks[i].div);
-		if (IS_ERR(clk)) {
-			pr_err("%s: failed to register clock %s\n",
-			       __func__, clks[i].name);
-			goto err;
-		}
-		data->clk_data.clks[clks[i].id] = clk;
-	}
-
-	return 0;
-
-err:
-	while (i--)
-		clk_unregister_fixed_factor(data->clk_data.clks[clks[i].id]);
-
-	return PTR_ERR(clk);
-}
-EXPORT_SYMBOL_GPL(hisi_clk_register_fixed_factor);
+	for (i = 0; i < num; i++) {
+		const struct hisi_fixed_factor_clock *p_clk = &clks[i];
 
-int hisi_clk_register_mux(const struct hisi_mux_clock *clks,
-				  int nums, struct hisi_clock_data *data)
-{
-	struct clk *clk;
-	void __iomem *base = data->base;
-	int i;
-
-	for (i = 0; i < nums; i++) {
-		u32 mask = BIT(clks[i].width) - 1;
+		clk = clk_hw_register_fixed_factor(NULL, p_clk->name, p_clk->parent_name,
+			p_clk->flags, p_clk->mult, p_clk->div);
 
-		clk = clk_register_mux_table(NULL, clks[i].name,
-					clks[i].parent_names,
-					clks[i].num_parents, clks[i].flags,
-					base + clks[i].offset, clks[i].shift,
-					mask, clks[i].mux_flags,
-					clks[i].table, &hisi_clk_lock);
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
-			       __func__, clks[i].name);
+			       __func__, p_clk->name);
 			goto err;
 		}
 
-		if (clks[i].alias)
-			clk_register_clkdev(clk, clks[i].alias, NULL);
-
-		data->clk_data.clks[clks[i].id] = clk;
+		data->clk_data->hws[p_clk->id] = clk;
 	}
 
 	return 0;
 
 err:
 	while (i--)
-		clk_unregister_mux(data->clk_data.clks[clks[i].id]);
-
+		clk_hw_unregister_fixed_rate(data->clk_data->hws[clks[i].id]);
 	return PTR_ERR(clk);
 }
-EXPORT_SYMBOL_GPL(hisi_clk_register_mux);
+EXPORT_SYMBOL_GPL(hisi_clk_register_fixed_factor);
+
+/*
+ * We ARE function creater. Commit message from checkpatch:
+ *   Avoid warning on macros that use argument concatenation as
+ *   those macros commonly create another function
+ */
+#define hisi_clk_register_fn(fn, type, stmt) \
+int fn(struct device *dev, const struct type *clks, \
+	size_t num, struct hisi_clock_data *data) \
+{ \
+	void __iomem *base = data->base; \
+\
+	for (int i = 0; i < num; i++) { \
+		const struct type *p_clk = &clks[i]; \
+		struct clk_hw *clk = stmt; \
+\
+		if (IS_ERR(clk)) { \
+			pr_err("%s: failed to register clock %s\n", \
+			       __func__, p_clk->name); \
+			return PTR_ERR(clk); \
+		} \
+\
+		if (p_clk->alias) \
+			clk_hw_register_clkdev(clk, p_clk->alias, NULL); \
+\
+		data->clk_data->hws[p_clk->id] = clk; \
+	} \
+\
+	return 0; \
+} \
+EXPORT_SYMBOL_GPL(fn);
+
+hisi_clk_register_fn(hisi_clk_register_mux, hisi_mux_clock,
+	__devm_clk_hw_register_mux(dev, NULL, p_clk->name,
+		p_clk->num_parents, p_clk->parent_names, NULL, NULL,
+		p_clk->flags, base + p_clk->offset, p_clk->shift, BIT(p_clk->width) - 1,
+		p_clk->mux_flags, p_clk->table, &hisi_clk_lock))
 
 int hisi_clk_register_phase(struct device *dev,
 			    const struct hisi_phase_clock *clks,
-			    int nums, struct hisi_clock_data *data)
+			    size_t num, struct hisi_clock_data *data)
 {
 	void __iomem *base = data->base;
-	struct clk *clk;
-	int i;
 
-	for (i = 0; i < nums; i++) {
-		clk = clk_register_hisi_phase(dev, &clks[i], base,
-					      &hisi_clk_lock);
+	for (int i = 0; i < num; i++) {
+		const struct hisi_phase_clock *p_clk = &clks[i];
+		struct clk_hw *clk = devm_clk_hw_register_hisi_phase(dev,
+			p_clk, base, &hisi_clk_lock);
+
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n", __func__,
-			       clks[i].name);
+			       p_clk->name);
 			return PTR_ERR(clk);
 		}
 
-		data->clk_data.clks[clks[i].id] = clk;
+		data->clk_data->hws[p_clk->id] = clk;
 	}
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(hisi_clk_register_phase);
 
-int hisi_clk_register_divider(const struct hisi_divider_clock *clks,
-				      int nums, struct hisi_clock_data *data)
-{
-	struct clk *clk;
-	void __iomem *base = data->base;
-	int i;
-
-	for (i = 0; i < nums; i++) {
-		clk = clk_register_divider_table(NULL, clks[i].name,
-						 clks[i].parent_name,
-						 clks[i].flags,
-						 base + clks[i].offset,
-						 clks[i].shift, clks[i].width,
-						 clks[i].div_flags,
-						 clks[i].table,
-						 &hisi_clk_lock);
-		if (IS_ERR(clk)) {
-			pr_err("%s: failed to register clock %s\n",
-			       __func__, clks[i].name);
-			goto err;
-		}
-
-		if (clks[i].alias)
-			clk_register_clkdev(clk, clks[i].alias, NULL);
-
-		data->clk_data.clks[clks[i].id] = clk;
-	}
-
-	return 0;
-
-err:
-	while (i--)
-		clk_unregister_divider(data->clk_data.clks[clks[i].id]);
-
-	return PTR_ERR(clk);
-}
-EXPORT_SYMBOL_GPL(hisi_clk_register_divider);
-
-int hisi_clk_register_gate(const struct hisi_gate_clock *clks,
-				       int nums, struct hisi_clock_data *data)
-{
-	struct clk *clk;
-	void __iomem *base = data->base;
-	int i;
-
-	for (i = 0; i < nums; i++) {
-		clk = clk_register_gate(NULL, clks[i].name,
-						clks[i].parent_name,
-						clks[i].flags,
-						base + clks[i].offset,
-						clks[i].bit_idx,
-						clks[i].gate_flags,
-						&hisi_clk_lock);
-		if (IS_ERR(clk)) {
-			pr_err("%s: failed to register clock %s\n",
-			       __func__, clks[i].name);
-			goto err;
-		}
-
-		if (clks[i].alias)
-			clk_register_clkdev(clk, clks[i].alias, NULL);
-
-		data->clk_data.clks[clks[i].id] = clk;
-	}
-
-	return 0;
-
-err:
-	while (i--)
-		clk_unregister_gate(data->clk_data.clks[clks[i].id]);
-
-	return PTR_ERR(clk);
-}
-EXPORT_SYMBOL_GPL(hisi_clk_register_gate);
-
-void hisi_clk_register_gate_sep(const struct hisi_gate_clock *clks,
-				       int nums, struct hisi_clock_data *data)
-{
-	struct clk *clk;
-	void __iomem *base = data->base;
-	int i;
-
-	for (i = 0; i < nums; i++) {
-		clk = hisi_register_clkgate_sep(NULL, clks[i].name,
-						clks[i].parent_name,
-						clks[i].flags,
-						base + clks[i].offset,
-						clks[i].bit_idx,
-						clks[i].gate_flags,
-						&hisi_clk_lock);
-		if (IS_ERR(clk)) {
-			pr_err("%s: failed to register clock %s\n",
-			       __func__, clks[i].name);
-			continue;
-		}
-
-		if (clks[i].alias)
-			clk_register_clkdev(clk, clks[i].alias, NULL);
-
-		data->clk_data.clks[clks[i].id] = clk;
-	}
-}
-EXPORT_SYMBOL_GPL(hisi_clk_register_gate_sep);
-
-void __init hi6220_clk_register_divider(const struct hi6220_divider_clock *clks,
-					int nums, struct hisi_clock_data *data)
-{
-	struct clk *clk;
-	void __iomem *base = data->base;
-	int i;
-
-	for (i = 0; i < nums; i++) {
-		clk = hi6220_register_clkdiv(NULL, clks[i].name,
-						clks[i].parent_name,
-						clks[i].flags,
-						base + clks[i].offset,
-						clks[i].shift,
-						clks[i].width,
-						clks[i].mask_bit,
-						&hisi_clk_lock);
-		if (IS_ERR(clk)) {
-			pr_err("%s: failed to register clock %s\n",
-			       __func__, clks[i].name);
-			continue;
-		}
-
-		if (clks[i].alias)
-			clk_register_clkdev(clk, clks[i].alias, NULL);
-
-		data->clk_data.clks[clks[i].id] = clk;
-	}
-}
+hisi_clk_register_fn(hisi_clk_register_divider, hisi_divider_clock,
+	devm_clk_hw_register_divider_table(dev, p_clk->name, p_clk->parent_name,
+		p_clk->flags, base + p_clk->offset, p_clk->shift, p_clk->width,
+		p_clk->div_flags, p_clk->table, &hisi_clk_lock))
+hisi_clk_register_fn(hisi_clk_register_gate, hisi_gate_clock,
+	devm_clk_hw_register_gate(dev, p_clk->name, p_clk->parent_name,
+		p_clk->flags, base + p_clk->offset, p_clk->bit_idx,
+		p_clk->gate_flags, &hisi_clk_lock))
+hisi_clk_register_fn(hisi_clk_register_gate_sep, hisi_gate_clock,
+	devm_clk_hw_register_hisi_gate_sep(dev, p_clk->name, p_clk->parent_name,
+		p_clk->flags, base + p_clk->offset, p_clk->bit_idx,
+		p_clk->gate_flags, &hisi_clk_lock))
+hisi_clk_register_fn(hi6220_clk_register_divider, hi6220_divider_clock,
+	devm_clk_hw_register_hi6220_divider(dev, p_clk->name, p_clk->parent_name,
+		p_clk->flags, base + p_clk->offset, p_clk->shift, p_clk->width,
+		p_clk->mask_bit, &hisi_clk_lock))
 
 static size_t hisi_clocks_get_nr(const struct hisi_clocks *clks)
 {
@@ -406,38 +280,20 @@ static int hisi_clk_register(struct device *dev, const struct hisi_clocks *clks,
 {
 	int ret;
 
-	if (clks->mux_clks_num) {
-		ret = hisi_clk_register_mux(clks->mux_clks,
-					    clks->mux_clks_num, data);
-		if (ret)
-			return ret;
-	}
-
-	if (clks->phase_clks_num) {
-		ret = hisi_clk_register_phase(dev, clks->phase_clks,
-					      clks->phase_clks_num, data);
-		if (ret)
-			return ret;
-	}
-
-	if (clks->divider_clks_num) {
-		ret = hisi_clk_register_divider(clks->divider_clks,
-						clks->divider_clks_num, data);
-		if (ret)
-			return ret;
-	}
-
-	if (clks->gate_clks_num) {
-		ret = hisi_clk_register_gate(clks->gate_clks,
-					     clks->gate_clks_num, data);
-		if (ret)
-			return ret;
-	}
-
-	if (clks->gate_sep_clks_num) {
-		hisi_clk_register_gate_sep(clks->gate_sep_clks,
-					   clks->gate_sep_clks_num, data);
-	}
+#define do_hisi_clk_register(type) do { \
+	if (clks->type##_clks_num) { \
+		ret = hisi_clk_register_##type(dev, clks->type##_clks, \
+					       clks->type##_clks_num, data); \
+		if (ret) \
+			return ret; \
+	} \
+} while (0)
+
+	do_hisi_clk_register(mux);
+	do_hisi_clk_register(phase);
+	do_hisi_clk_register(divider);
+	do_hisi_clk_register(gate);
+	do_hisi_clk_register(gate_sep);
 
 	if (clks->clk_register_customized && clks->customized_clks_num) {
 		ret = clks->clk_register_customized(dev, clks->customized_clks,
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 87b17e9b79a3..5a72d7ab5587 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2012-2013 Hisilicon Limited.
  * Copyright (c) 2012-2013 Linaro Limited.
+ * Copyright (c) 2023 David Yang
  *
  * Author: Haojian Zhuang <haojian.zhuang@linaro.org>
  *	   Xin Li <li.xin@linaro.org>
@@ -19,8 +20,18 @@
 struct platform_device;
 struct hisi_clocks;
 
+/*
+ * (Virtual) fixed clocks, often depended by crucial peripherals, require
+ * early initialization before device probing, thus cannot use devm APIs.
+ * Otherwise, kernel will defer those peripherals, causing boot failure.
+ *
+ * fixed_rate and fixed_factor clocks are driver-managed. They are freed by
+ * `hisi_clk_free` altogether.
+ *
+ * Other clocks are devm-managed.
+ */
 struct hisi_clock_data {
-	struct clk_onecell_data		clk_data;
+	struct clk_hw_onecell_data	*clk_data;
 	void __iomem			*base;
 	const struct hisi_clocks	*clks;
 };
@@ -138,57 +149,45 @@ struct hisi_clocks {
 				       size_t num, struct hisi_clock_data *data);
 };
 
-struct clk *hisi_register_clkgate_sep(struct device *, const char *,
-				const char *, unsigned long,
-				void __iomem *, u8,
-				u8, spinlock_t *);
-struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
-	const char *parent_name, unsigned long flags, void __iomem *reg,
-	u8 shift, u8 width, u32 mask_bit, spinlock_t *lock);
-
-struct hisi_clock_data *hisi_clk_alloc(struct platform_device *, int);
-struct hisi_clock_data *hisi_clk_init(struct device_node *, int);
-void hisi_clk_free(struct device_node *np, struct hisi_clock_data *data);
-int hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *,
-				int, struct hisi_clock_data *);
-int hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *,
-				int, struct hisi_clock_data *);
-int hisi_clk_register_mux(const struct hisi_mux_clock *, int,
-				struct hisi_clock_data *);
-struct clk *clk_register_hisi_phase(struct device *dev,
-				const struct hisi_phase_clock *clks,
+struct clk_hw *
+devm_clk_hw_register_hisi_phase(struct device *dev, const struct hisi_phase_clock *clks,
 				void __iomem *base, spinlock_t *lock);
+struct clk_hw *
+devm_clk_hw_register_hisi_gate_sep(struct device *dev, const char *name,
+				   const char *parent_name, unsigned long flags,
+				   void __iomem *reg, u8 bit_idx,
+				   u8 clk_gate_flags, spinlock_t *lock);
+struct clk_hw *
+devm_clk_hw_register_hi6220_divider(struct device *dev, const char *name,
+				    const char *parent_name, unsigned long flags,
+				    void __iomem *reg, u8 shift,
+				    u8 width, u32 mask_bit, spinlock_t *lock);
+
+struct hisi_clock_data *hisi_clk_init(struct device_node *np, size_t nr);
+void hisi_clk_free(struct device_node *np, struct hisi_clock_data *data);
+
+int hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *clks,
+				 size_t num, struct hisi_clock_data *data);
+int hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *clks,
+				   size_t num, struct hisi_clock_data *data);
+
+int hisi_clk_register_mux(struct device *dev, const struct hisi_mux_clock *clks,
+			  size_t num, struct hisi_clock_data *data);
 int hisi_clk_register_phase(struct device *dev,
-				const struct hisi_phase_clock *clks,
-				int nums, struct hisi_clock_data *data);
-int hisi_clk_register_divider(const struct hisi_divider_clock *,
-				int, struct hisi_clock_data *);
-int hisi_clk_register_gate(const struct hisi_gate_clock *,
-				int, struct hisi_clock_data *);
-void hisi_clk_register_gate_sep(const struct hisi_gate_clock *,
-				int, struct hisi_clock_data *);
-void hi6220_clk_register_divider(const struct hi6220_divider_clock *,
-				int, struct hisi_clock_data *);
-
-#define hisi_clk_unregister(type) \
-static inline \
-void hisi_clk_unregister_##type(const struct hisi_##type##_clock *clks, \
-				int nums, struct hisi_clock_data *data) \
-{ \
-	struct clk **clocks = data->clk_data.clks; \
-	int i; \
-	for (i = 0; i < nums; i++) { \
-		int id = clks[i].id; \
-		if (clocks[id])  \
-			clk_unregister_##type(clocks[id]); \
-	} \
-}
-
-hisi_clk_unregister(fixed_rate)
-hisi_clk_unregister(fixed_factor)
-hisi_clk_unregister(mux)
-hisi_clk_unregister(divider)
-hisi_clk_unregister(gate)
+			    const struct hisi_phase_clock *clks,
+			    size_t num, struct hisi_clock_data *data);
+int hisi_clk_register_divider(struct device *dev,
+			      const struct hisi_divider_clock *clks,
+			      size_t num, struct hisi_clock_data *data);
+int hisi_clk_register_gate(struct device *dev,
+			   const struct hisi_gate_clock *clks,
+			   size_t num, struct hisi_clock_data *data);
+int hisi_clk_register_gate_sep(struct device *dev,
+			       const struct hisi_gate_clock *clks,
+			       size_t num, struct hisi_clock_data *data);
+int hi6220_clk_register_divider(struct device *dev,
+				const struct hi6220_divider_clock *clks,
+				size_t num, struct hisi_clock_data *data);
 
 /* helper functions for platform driver */
 
diff --git a/drivers/clk/hisilicon/clkdivider-hi6220.c b/drivers/clk/hisilicon/clkdivider-hi6220.c
index 5348bafe694f..3c03b3e5b841 100644
--- a/drivers/clk/hisilicon/clkdivider-hi6220.c
+++ b/drivers/clk/hisilicon/clkdivider-hi6220.c
@@ -9,7 +9,7 @@
 
 #include <linux/kernel.h>
 #include <linux/clk-provider.h>
-#include <linux/slab.h>
+#include <linux/device.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/spinlock.h>
@@ -97,19 +97,19 @@ static const struct clk_ops hi6220_clkdiv_ops = {
 	.set_rate = hi6220_clkdiv_set_rate,
 };
 
-struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
+struct clk_hw *devm_clk_hw_register_hi6220_divider(struct device *dev, const char *name,
 	const char *parent_name, unsigned long flags, void __iomem *reg,
 	u8 shift, u8 width, u32 mask_bit, spinlock_t *lock)
 {
 	struct hi6220_clk_divider *div;
-	struct clk *clk;
 	struct clk_init_data init;
 	struct clk_div_table *table;
 	u32 max_div, min_div;
 	int i;
+	int ret;
 
 	/* allocate the divider */
-	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
 	if (!div)
 		return ERR_PTR(-ENOMEM);
 
@@ -117,11 +117,9 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
 	max_div = div_mask(width) + 1;
 	min_div = 1;
 
-	table = kcalloc(max_div + 1, sizeof(*table), GFP_KERNEL);
-	if (!table) {
-		kfree(div);
+	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
+	if (!table)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	for (i = 0; i < max_div; i++) {
 		table[i].div = min_div + i;
@@ -144,11 +142,9 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
 	div->table = table;
 
 	/* register the clock */
-	clk = clk_register(dev, &div->hw);
-	if (IS_ERR(clk)) {
-		kfree(table);
-		kfree(div);
-	}
+	ret = devm_clk_hw_register(dev, &div->hw);
+	if (ret)
+		return ERR_PTR(ret);
 
-	return clk;
+	return &div->hw;
 }
diff --git a/drivers/clk/hisilicon/clkgate-separated.c b/drivers/clk/hisilicon/clkgate-separated.c
index 90d858522967..dc64a8a0ab58 100644
--- a/drivers/clk/hisilicon/clkgate-separated.c
+++ b/drivers/clk/hisilicon/clkgate-separated.c
@@ -11,8 +11,8 @@
 
 #include <linux/kernel.h>
 #include <linux/clk-provider.h>
+#include <linux/device.h>
 #include <linux/io.h>
-#include <linux/slab.h>
 
 #include "clk.h"
 
@@ -80,17 +80,18 @@ static const struct clk_ops clkgate_separated_ops = {
 	.is_enabled	= clkgate_separated_is_enabled,
 };
 
-struct clk *hisi_register_clkgate_sep(struct device *dev, const char *name,
-				      const char *parent_name,
-				      unsigned long flags,
-				      void __iomem *reg, u8 bit_idx,
-				      u8 clk_gate_flags, spinlock_t *lock)
+struct clk_hw *
+devm_clk_hw_register_hisi_gate_sep(struct device *dev, const char *name,
+				   const char *parent_name,
+				   unsigned long flags,
+				   void __iomem *reg, u8 bit_idx,
+				   u8 clk_gate_flags, spinlock_t *lock)
 {
 	struct clkgate_separated *sclk;
-	struct clk *clk;
 	struct clk_init_data init;
+	int ret;
 
-	sclk = kzalloc(sizeof(*sclk), GFP_KERNEL);
+	sclk = devm_kzalloc(dev, sizeof(*sclk), GFP_KERNEL);
 	if (!sclk)
 		return ERR_PTR(-ENOMEM);
 
@@ -106,8 +107,9 @@ struct clk *hisi_register_clkgate_sep(struct device *dev, const char *name,
 	sclk->hw.init = &init;
 	sclk->lock = lock;
 
-	clk = clk_register(dev, &sclk->hw);
-	if (IS_ERR(clk))
-		kfree(sclk);
-	return clk;
+	ret = devm_clk_hw_register(dev, &sclk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &sclk->hw;
 }
-- 
2.43.0


