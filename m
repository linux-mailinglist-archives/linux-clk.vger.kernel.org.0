Return-Path: <linux-clk+bounces-5847-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A28A2575
	for <lists+linux-clk@lfdr.de>; Fri, 12 Apr 2024 07:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50E8E1C20A3F
	for <lists+linux-clk@lfdr.de>; Fri, 12 Apr 2024 05:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C00318050;
	Fri, 12 Apr 2024 05:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlSDkAe0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993091B96E;
	Fri, 12 Apr 2024 05:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712898697; cv=none; b=Ytqk+QRYCxLDbK4pBJz3rCwP7pW6QNpGWb/psUxtJnTY164bnejbQM5Toz8Qxs04HXwzobVFO0pQiBP3pO6gsxWSREr/e8QZtpE5+CqhIYJvzKJXRBahJD8P+eCrHWBUCbqReYCig3S7gdklxD9BK+ljujBSbth6CaOiURvPq0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712898697; c=relaxed/simple;
	bh=nFRMU6xTbrzOS51FDYFjCaA/OJfcz6/qg6Mj1TgIBms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJNdifQkwahUQ499Mi8A7VkNnUcIGfdh8ayOzcrnzmCKmaf28BuLB+Pl1CMIxwb7ZRjDo0/esURYog9z1IbyKCpSj1D4MkJx36SBVMPZDtj9hh186oB5HUsjF+Da4kM4WYrvNJo6LRftulG1rX3qU8O5FSO05znu21O1/7auT5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlSDkAe0; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5f415fd71f8so436175a12.3;
        Thu, 11 Apr 2024 22:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712898694; x=1713503494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8lUCW6/osKWYcttIWv//iPm23yYuW3M1dv6E9h9iCk=;
        b=QlSDkAe0r/mhPHWWi6CE7g+IOe5t0vHMsVVX2Jklk2K7sDEy1+viYAmLLNOIoU7ttZ
         6YU0jT8l2gtQ6baHV6SwaB4gF4mKjU+LuQugMK6d4l9YLgRN8mZqHb+TVUs+SF6aE2tP
         3uiLKik6k6nsqXG7+OP/hhJE66dFe5AQnccRdcAVaJbLKioemRC1fVBMlAztayodKKOk
         T7twBcIfIn/FCj4+/zT28M9Adye6IApP/TUJqDQ6O9pag2X2P4JinBr8OH1g3IZzMw+V
         r9lpyAFUW3rlrixKPtIqxEtRTOm6HnHIWYekvRgW4CtnW9cu152RPVtj1ur4yi+XEFvh
         bCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712898694; x=1713503494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8lUCW6/osKWYcttIWv//iPm23yYuW3M1dv6E9h9iCk=;
        b=O1TimZ+VeecoVhogR4atHpVB0wGMuldhYsE6fThcAOoMd8re56BVmEx3HG/mfCgpIJ
         tsY0J3blhxYvi1p0nBvMXmsQrdIfP0bENMqydx8wuWb3iIv/3alP3Ywst5MzlzJOuwnH
         zlDBXyrdOAFnanltia1vVqAnJh8T8IOsR6kWSz3vfg1XHLsUGa8uL9gkXiuvxSfml1cT
         hi+dRTPsyMUwfnLTcsq0aiaq4oRPxD17AqgCqWOL8B87LX0fkuCYcIZziVDSlLHcp6kj
         IuFMzQRSfgGTqSGIuddBZYprWm+ltU4jE/zYS1Q+tAusInleu+5oXx1p3DIEt1WPQoC5
         7t2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqCQAuBHK+WYrBSC2W0VBJ+p2381dtiZPsVs1DAm0Z/g//mgiKetIoaABatjBqsSwp9O9VdTU6N9bqcYurKLfLrjzYmuzjckFbmrUh
X-Gm-Message-State: AOJu0YyavTZxboxHLtClj85BBAeHrGnFgQR3oGNSWifg6m2FQvuPS10c
	186DOfnm56gA+fF0nGrz+wZYCLT8R6UlkEQAzTTUyvQ9kKPozSC8FkxH7hcA
X-Google-Smtp-Source: AGHT+IEVLmU9vFuS48EaURASJcy1mMlp1gR9ddy3cNHA32KDC8xi4LBEMYC51l4qEPy62nO00Cl8cw==
X-Received: by 2002:a17:90b:3d8:b0:2a2:399c:a859 with SMTP id go24-20020a17090b03d800b002a2399ca859mr1581025pjb.35.1712898694268;
        Thu, 11 Apr 2024 22:11:34 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([104.28.213.200])
        by smtp.gmail.com with ESMTPSA id fh16-20020a17090b035000b002a53b9cf356sm3734902pjb.0.2024.04.11.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 22:11:33 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Yang <mmyangfl@gmail.com>
Subject: [PATCH v9 01/13] clk: hisilicon: Add helper functions for platform driver
Date: Fri, 12 Apr 2024 13:10:30 +0800
Message-ID: <20240412051041.90376-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240412051041.90376-2-mmyangfl@gmail.com>
References: <20240412051041.90376-2-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Helper functions extract common operations on platform drivers.

During migration to devm APIs, (virtual) fixed clocks were found hard on
devm APIs, since they often depended by crucial peripherals, thus require
early initialization before device probing, and cannot use devm APIs.

One solution to this problem is to add a "fixed-clock" node to device tree,
independent to clock device, and make those peripherals depend on that.
However, there is also some devices that do use fixed clocks provided by
drivers, for example clk-hi3660.c .

To simplify codes, we migrate clocks of other types to devm APIs, while
keep fixed clocks self-managed, alongside with struct hisi_clock_data, and
remove devm-managed hisi_clock_data.

hisi_clk_alloc() will be removed in the following patch.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/clk/hisilicon/clk.c   | 157 ++++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk.h   |  46 +++++++++-
 drivers/clk/hisilicon/crg.h   |   5 ++
 drivers/clk/hisilicon/reset.c |  42 +++++++++
 4 files changed, 248 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 09368fd32bef..e50115f8e236 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -88,6 +88,25 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(hisi_clk_init);
 
+void hisi_clk_free(struct device_node *np, struct hisi_clock_data *data)
+{
+	if (data->clks) {
+		if (data->clks->fixed_rate_clks_num)
+			hisi_clk_unregister_fixed_rate(data->clks->fixed_rate_clks,
+						       data->clks->fixed_rate_clks_num,
+						       data);
+		if (data->clks->fixed_factor_clks_num)
+			hisi_clk_unregister_fixed_factor(data->clks->fixed_factor_clks,
+							 data->clks->fixed_factor_clks_num,
+							 data);
+	}
+
+	of_clk_del_provider(np);
+	kfree(data->clk_data.clks);
+	kfree(data);
+}
+EXPORT_SYMBOL_GPL(hisi_clk_free);
+
 int hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *clks,
 					 int nums, struct hisi_clock_data *data)
 {
@@ -341,3 +360,141 @@ void __init hi6220_clk_register_divider(const struct hi6220_divider_clock *clks,
 		data->clk_data.clks[clks[i].id] = clk;
 	}
 }
+
+static size_t hisi_clocks_get_nr(const struct hisi_clocks *clks)
+{
+	if (clks->nr)
+		return clks->nr;
+
+	return clks->fixed_rate_clks_num + clks->fixed_factor_clks_num +
+		clks->mux_clks_num + clks->phase_clks_num +
+		clks->divider_clks_num + clks->gate_clks_num +
+		clks->gate_sep_clks_num + clks->customized_clks_num;
+}
+
+int hisi_clk_early_init(struct device_node *np, const struct hisi_clocks *clks)
+{
+	struct hisi_clock_data *data;
+	int ret;
+
+	data = hisi_clk_init(np, hisi_clocks_get_nr(clks));
+	if (!data)
+		return -ENOMEM;
+	data->clks = clks;
+
+	ret = hisi_clk_register_fixed_rate(clks->fixed_rate_clks,
+					   clks->fixed_rate_clks_num, data);
+	if (ret)
+		goto err;
+
+	ret = hisi_clk_register_fixed_factor(clks->fixed_factor_clks,
+					     clks->fixed_factor_clks_num, data);
+	if (ret)
+		goto err;
+
+	np->data = data;
+	return 0;
+
+err:
+	hisi_clk_free(np, data);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hisi_clk_early_init);
+
+static int hisi_clk_register(struct device *dev, const struct hisi_clocks *clks,
+			     struct hisi_clock_data *data)
+{
+	int ret;
+
+	if (clks->mux_clks_num) {
+		ret = hisi_clk_register_mux(clks->mux_clks,
+					    clks->mux_clks_num, data);
+		if (ret)
+			return ret;
+	}
+
+	if (clks->phase_clks_num) {
+		ret = hisi_clk_register_phase(dev, clks->phase_clks,
+					      clks->phase_clks_num, data);
+		if (ret)
+			return ret;
+	}
+
+	if (clks->divider_clks_num) {
+		ret = hisi_clk_register_divider(clks->divider_clks,
+						clks->divider_clks_num, data);
+		if (ret)
+			return ret;
+	}
+
+	if (clks->gate_clks_num) {
+		ret = hisi_clk_register_gate(clks->gate_clks,
+					     clks->gate_clks_num, data);
+		if (ret)
+			return ret;
+	}
+
+	if (clks->gate_sep_clks_num) {
+		hisi_clk_register_gate_sep(clks->gate_sep_clks,
+					   clks->gate_sep_clks_num, data);
+	}
+
+	if (clks->clk_register_customized && clks->customized_clks_num) {
+		ret = clks->clk_register_customized(dev, clks->customized_clks,
+						    clks->customized_clks_num, data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int hisi_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct hisi_clocks *clks;
+	struct hisi_clock_data *data;
+	int ret;
+
+	clks = of_device_get_match_data(dev);
+	if (!clks)
+		return -ENOENT;
+
+	if (!np->data) {
+		ret = hisi_clk_early_init(np, clks);
+		if (ret)
+			return ret;
+	}
+
+	data = np->data;
+	np->data = NULL;
+
+	if (clks->prologue) {
+		ret = clks->prologue(dev, data);
+		if (ret)
+			goto err;
+	}
+
+	ret = hisi_clk_register(dev, clks, data);
+	if (ret)
+		goto err;
+
+	platform_set_drvdata(pdev, data);
+	return 0;
+
+err:
+	hisi_clk_free(np, data);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hisi_clk_probe);
+
+void hisi_clk_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct hisi_clock_data *data = platform_get_drvdata(pdev);
+
+	hisi_clk_free(np, data);
+}
+EXPORT_SYMBOL_GPL(hisi_clk_remove);
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 7a9b42e1b027..87b17e9b79a3 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -17,10 +17,12 @@
 #include <linux/spinlock.h>
 
 struct platform_device;
+struct hisi_clocks;
 
 struct hisi_clock_data {
-	struct clk_onecell_data	clk_data;
-	void __iomem		*base;
+	struct clk_onecell_data		clk_data;
+	void __iomem			*base;
+	const struct hisi_clocks	*clks;
 };
 
 struct hisi_fixed_rate_clock {
@@ -103,6 +105,39 @@ struct hisi_gate_clock {
 	const char		*alias;
 };
 
+struct hisi_clocks {
+	/* if 0, sum all *_num */
+	size_t nr;
+
+	int (*prologue)(struct device *dev, struct hisi_clock_data *data);
+
+	const struct hisi_fixed_rate_clock *fixed_rate_clks;
+	size_t fixed_rate_clks_num;
+
+	const struct hisi_fixed_factor_clock *fixed_factor_clks;
+	size_t fixed_factor_clks_num;
+
+	const struct hisi_mux_clock *mux_clks;
+	size_t mux_clks_num;
+
+	const struct hisi_phase_clock *phase_clks;
+	size_t phase_clks_num;
+
+	const struct hisi_divider_clock *divider_clks;
+	size_t divider_clks_num;
+
+	const struct hisi_gate_clock *gate_clks;
+	size_t gate_clks_num;
+
+	const struct hisi_gate_clock *gate_sep_clks;
+	size_t gate_sep_clks_num;
+
+	const void *customized_clks;
+	size_t customized_clks_num;
+	int (*clk_register_customized)(struct device *dev, const void *clks,
+				       size_t num, struct hisi_clock_data *data);
+};
+
 struct clk *hisi_register_clkgate_sep(struct device *, const char *,
 				const char *, unsigned long,
 				void __iomem *, u8,
@@ -113,6 +148,7 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
 
 struct hisi_clock_data *hisi_clk_alloc(struct platform_device *, int);
 struct hisi_clock_data *hisi_clk_init(struct device_node *, int);
+void hisi_clk_free(struct device_node *np, struct hisi_clock_data *data);
 int hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *,
 				int, struct hisi_clock_data *);
 int hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *,
@@ -154,4 +190,10 @@ hisi_clk_unregister(mux)
 hisi_clk_unregister(divider)
 hisi_clk_unregister(gate)
 
+/* helper functions for platform driver */
+
+int hisi_clk_early_init(struct device_node *np, const struct hisi_clocks *clks);
+int hisi_clk_probe(struct platform_device *pdev);
+void hisi_clk_remove(struct platform_device *pdev);
+
 #endif	/* __HISI_CLK_H */
diff --git a/drivers/clk/hisilicon/crg.h b/drivers/clk/hisilicon/crg.h
index 803f6ba6d7a2..bd8e76b1f6d7 100644
--- a/drivers/clk/hisilicon/crg.h
+++ b/drivers/clk/hisilicon/crg.h
@@ -22,4 +22,9 @@ struct hisi_crg_dev {
 	const struct hisi_crg_funcs *funcs;
 };
 
+/* helper functions for platform driver */
+
+int hisi_crg_probe(struct platform_device *pdev);
+void hisi_crg_remove(struct platform_device *pdev);
+
 #endif	/* __HISI_CRG_H */
diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
index 93cee17db8b1..c7d4c9ea7183 100644
--- a/drivers/clk/hisilicon/reset.c
+++ b/drivers/clk/hisilicon/reset.c
@@ -6,11 +6,15 @@
  */
 
 #include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+
+#include "clk.h"
+#include "crg.h"
 #include "reset.h"
 
 #define	HISI_RESET_BIT_MASK	0x1f
@@ -116,3 +120,41 @@ void hisi_reset_exit(struct hisi_reset_controller *rstc)
 	reset_controller_unregister(&rstc->rcdev);
 }
 EXPORT_SYMBOL_GPL(hisi_reset_exit);
+
+int hisi_crg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct hisi_crg_dev *crg;
+	int ret;
+
+	crg = devm_kmalloc(dev, sizeof(*crg), GFP_KERNEL);
+	if (!crg)
+		return -ENOMEM;
+
+	ret = hisi_clk_probe(pdev);
+	if (ret)
+		return ret;
+
+	crg->rstc = hisi_reset_init(pdev);
+	if (!crg->rstc) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, crg);
+	return 0;
+
+err:
+	hisi_clk_remove(pdev);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hisi_crg_probe);
+
+void hisi_crg_remove(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
+
+	hisi_reset_exit(crg->rstc);
+	hisi_clk_remove(pdev);
+}
+EXPORT_SYMBOL_GPL(hisi_crg_remove);
-- 
2.43.0


