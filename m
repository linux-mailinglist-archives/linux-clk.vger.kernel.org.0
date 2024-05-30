Return-Path: <linux-clk+bounces-7475-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EF08D472E
	for <lists+linux-clk@lfdr.de>; Thu, 30 May 2024 10:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02285B239D6
	for <lists+linux-clk@lfdr.de>; Thu, 30 May 2024 08:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A37117B418;
	Thu, 30 May 2024 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cw68wj4f"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB4415ADBE
	for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058130; cv=none; b=hOGD60/B8Fbi9nlaWML+G97swOlh2MrMbbG67UEefyGbA2x66jUxXdU+armtbsCKuopyCwP4359XBFf7Se51JyObxq+PGUMLUdjQcepntpQZr1KtySrXULhHVOUMI6uSXHhoKjT53uIalnuFYUjx47O8OAvnYxlYyd9YQGajL8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058130; c=relaxed/simple;
	bh=W0SC8G/jIszLFajvIONxwU5d7chA4Rn7+xq+d1EhCkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BvrlW+Z1ACxwSK5HmWSQp53NHnllDYyWxjrD2KD6Fqhe6PBdYGXkbRs8L6QctVYnBZy0qrAVLZkvIgIuYNAwgRSEB+wX+72XLUp0sX6z+mCR3i8CFiuDqO/Jjw0WDQtkN0VS70Vwg/3Oq0DgzraV7fk+i/VaiR9qU/jm1f8KtiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cw68wj4f; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f4a52b9413so5285085ad.2
        for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 01:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058128; x=1717662928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAVvhQV9mDNvHBPovdoxXEWHQ5sjxf2IkeHwkDa/ZGA=;
        b=cw68wj4f0qe3saz8YN2G5D7+KLPqWMdo08VTikZMbU9+mnsgCGjRS5hRMOoyMc0CYP
         8wlQXMcR9XYO9N8yg4NJa3hWyTsbFMZHqmNr8tgzvgqEMMN3Rt4EEAhYSp3+erOnN4sH
         2yGzECjf+dunRy7SZe0zgN/uy5AECW0vC+I2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058128; x=1717662928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAVvhQV9mDNvHBPovdoxXEWHQ5sjxf2IkeHwkDa/ZGA=;
        b=YxTsHeJkNxAas0w1CrTfQMrgWDku/zDdrDp7ZuXTr5FLsckAk5EtBw7YinJT1XVQgf
         QfnL5UBBzW8U6Mg3hBQT9ViNfaepsHQyWSX7dTxyq0YMaVKEUPGG2Viib7zcoKdHhtEo
         AfQqI9AQcFdly5qAHHd8GJaomFceAP0QJnuiAhlTkw1FRZuw3KvQRa08XUeWDOen6os6
         xwhW8bFD7NKsefFaWiuQ5/QtTsJ+bEXutnqOz8NN6Uy2ljaKDWdxAs8VjX/1nCC+Z+a5
         tmgIQWa2iWi7HQ0I3n6wTBZaR8ds6AvAlvSgJ6lfXpUZmz3zUrU5bk89xZF0B7ED8F8y
         u3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd99zozKC+ZjR3Wnn9YlQEg/Z4wxwHvIf8MIquMrcRiwmQSWCwfO4WC1IvoYWQ6w+tLNt5abs0HNmvE0EZaqIHz1CkfN3Qi5bp
X-Gm-Message-State: AOJu0YysC6dZBo+yT+aR98O4eGtKkZsOkqqbtp5hbfQ025jUR9l9Kl+k
	1NBItL1D26pqd9Ros4fhpZQ2gizYtmq9gQJb7JmENoJCEMKTkLNxLOHJ7HZMfA==
X-Google-Smtp-Source: AGHT+IHoBbIOM5vNh6pT5ABfKxUt7FMpI6uVxEi+iIx5qDC7QCH2GBkDA8qTZy2Bcn1PQP+qDLEUiA==
X-Received: by 2002:a17:902:f70f:b0:1f4:9c26:d036 with SMTP id d9443c01a7336-1f6193ee9d9mr14442085ad.14.1717058127331;
        Thu, 30 May 2024 01:35:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] clk: mediatek: Add mt8173-mfgtop driver
Date: Thu, 30 May 2024 16:35:01 +0800
Message-ID: <20240530083513.4135052-3-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

The clock gates are exposed as clocks provided by a clock controller,
while the power sequencing bits are exposed as one singular power domain.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig             |   9 +
 drivers/clk/mediatek/Makefile            |   1 +
 drivers/clk/mediatek/clk-mt8173-mfgtop.c | 240 +++++++++++++++++++++++
 3 files changed, 250 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 70a005e7e1b1..9e279c739f1c 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -500,6 +500,15 @@ config COMMON_CLK_MT8173_IMGSYS
 	help
 	  This driver supports MediaTek MT8173 imgsys clocks.
 
+config COMMON_CLK_MT8173_MFGTOP
+	tristate "Clock and power driver for MediaTek MT8173 mfgtop"
+	depends on COMMON_CLK_MT8173
+	default COMMON_CLK_MT8173
+	select PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS_OF
+	help
+	  This driver supports MediaTek MT8173 mfgtop clocks and power domain.
+
 config COMMON_CLK_MT8173_MMSYS
        tristate "Clock driver for MediaTek MT8173 mmsys"
        depends on COMMON_CLK_MT8173
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index eeccfa039896..fdd3a76e12a1 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_COMMON_CLK_MT8167_VDECSYS) += clk-mt8167-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8173) += clk-mt8173-apmixedsys.o clk-mt8173-infracfg.o \
 				   clk-mt8173-pericfg.o clk-mt8173-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT8173_IMGSYS) += clk-mt8173-img.o
+obj-$(CONFIG_COMMON_CLK_MT8173_MFGTOP) += clk-mt8173-mfgtop.o
 obj-$(CONFIG_COMMON_CLK_MT8173_MMSYS) += clk-mt8173-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8173_VDECSYS) += clk-mt8173-vdecsys.o
 obj-$(CONFIG_COMMON_CLK_MT8173_VENCSYS) += clk-mt8173-vencsys.o
diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
new file mode 100644
index 000000000000..85fa7a7453ed
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Google LLC
+ * Author: Chen-Yu Tsai <wenst@chromium.org>
+ *
+ * Based on driver in downstream ChromeOS v5.15 kernel.
+ *
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Chiawen Lee <chiawen.lee@mediatek.com>
+ */
+
+#include <dt-bindings/clock/mt8173-clk.h>
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs mfg_cg_regs = {
+	.sta_ofs = 0x0000,
+	.clr_ofs = 0x0008,
+	.set_ofs = 0x0004,
+};
+
+#define GATE_MFG(_id, _name, _parent, _shift, _flags)	\
+		GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
+
+/* TODO: The block actually has dividers for the core and mem clocks. */
+static const struct mtk_gate mfg_clks[] = {
+	GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RATE_PARENT),
+	GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RATE_PARENT),
+	GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PARENT),
+	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
+};
+
+static const struct mtk_clk_desc mfg_desc = {
+	.clks = mfg_clks,
+	.num_clks = ARRAY_SIZE(mfg_clks),
+};
+
+struct mt8173_mfgtop_data {
+	struct clk_hw_onecell_data *clk_data;
+	struct regmap *regmap;
+	struct generic_pm_domain genpd;
+	struct of_phandle_args parent_pd, child_pd;
+	struct clk *clk_26m;
+};
+
+static const struct of_device_id of_match_clk_mt8173_mfgtop[] = {
+	{ .compatible = "mediatek,mt8173-mfgtop", .data = &mfg_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_mfgtop);
+
+/* Delay count in clock cycles */
+#define MFG_ACTIVE_POWER_CON0	0x24
+ #define RST_B_DELAY_CNT	GENMASK(7, 0)	/* pwr_rst_b de-assert delay during power-up */
+ #define CLK_EN_DELAY_CNT	GENMASK(15, 8)	/* CLK_DIS deassert delay during power-up */
+ #define CLK_DIS_DELAY_CNT	GENMASK(23, 16)	/* CLK_DIS assert delay during power-down */
+
+#define MFG_ACTIVE_POWER_CON1	0x28
+ #define PWR_ON_S_DELAY_CNT	GENMASK(7, 0)	/* pwr_on_s assert delay during power-up */
+ #define ISO_DELAY_CNT		GENMASK(15, 8)	/* ISO assert delay during power-down */
+ #define ISOOFF_DELAY_CNT	GENMASK(23, 16)	/* ISO de-assert delay during power-up */
+ #define RST__DELAY_CNT		GENMASK(31, 24) /* pwr_rsb_b assert delay during power-down */
+
+static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
+{
+	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
+
+	/* drives internal power management */
+	clk_prepare_enable(data->clk_26m);
+
+	/* Power on/off delays for various signals */
+	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
+		     FIELD_PREP(RST_B_DELAY_CNT, 77) |
+		     FIELD_PREP(CLK_EN_DELAY_CNT, 61) |
+		     FIELD_PREP(CLK_DIS_DELAY_CNT, 60));
+	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON1,
+		     FIELD_PREP(PWR_ON_S_DELAY_CNT, 11) |
+		     FIELD_PREP(ISO_DELAY_CNT, 68) |
+		     FIELD_PREP(ISOOFF_DELAY_CNT, 69) |
+		     FIELD_PREP(RST__DELAY_CNT, 77));
+
+	/* Magic numbers related to core switch sequence and delays */
+	regmap_write(data->regmap, 0xe0, 0x7a710184);
+	regmap_write(data->regmap, 0xe4, 0x835f6856);
+	regmap_write(data->regmap, 0xe8, 0x002b0234);
+	regmap_write(data->regmap, 0xec, 0x80000000);
+	regmap_write(data->regmap, 0xa0, 0x08000000);
+
+	return 0;
+}
+
+static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
+{
+	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
+
+	/* Magic numbers related to core switch sequence and delays */
+	regmap_write(data->regmap, 0xec, 0);
+
+	/* drives internal power management */
+	clk_disable_unprepare(data->clk_26m);
+
+	return 0;
+}
+
+static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct mt8173_mfgtop_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, data);
+
+	data->clk_data = mtk_devm_alloc_clk_data(dev, ARRAY_SIZE(mfg_clks));
+	if (!data->clk_data)
+		return -ENOMEM;
+
+	/* MTK clock gates also uses regmap */
+	data->regmap = device_node_to_regmap(node);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap), "Failed to get regmap\n");
+
+	data->child_pd.np = node;
+	data->child_pd.args_count = 0;
+	ret = of_parse_phandle_with_args(node, "power-domains", "#power-domain-cells", 0,
+					 &data->parent_pd);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to parse power domain\n");
+
+	devm_pm_runtime_enable(dev);
+	/*
+	 * Do a pm_runtime_resume_and_get() to workaround a possible
+	 * deadlock between clk_register() and the genpd framework.
+	 */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to runtime resume device\n");
+		goto put_of_node;
+	}
+
+	ret = mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mfg_clks),
+				     data->clk_data);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register clock gates\n");
+		goto put_pm_runtime;
+	}
+
+	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
+	if (IS_ERR(data->clk_26m)) {
+		dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
+		goto unregister_clks;
+	}
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
+		goto put_26m_clk;
+	}
+
+	data->genpd.name = "mfg_apm";
+	data->genpd.power_on = clk_mt8173_mfgtop_power_on;
+	data->genpd.power_off = clk_mt8173_mfgtop_power_off;
+	ret = pm_genpd_init(&data->genpd, NULL, true);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add power domain\n");
+		goto del_clk_provider;
+	}
+
+	ret = of_genpd_add_provider_simple(node, &data->genpd);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add power domain OF provider\n");
+		goto remove_pd;
+	}
+
+	ret = of_genpd_add_subdomain(&data->parent_pd, &data->child_pd);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to link PM domains\n");
+		goto del_pd_provider;
+	}
+
+	pm_runtime_put(dev);
+	return 0;
+
+del_pd_provider:
+	of_genpd_del_provider(node);
+remove_pd:
+	pm_genpd_remove(&data->genpd);
+del_clk_provider:
+	of_clk_del_provider(node);
+put_26m_clk:
+	clk_put(data->clk_26m);
+unregister_clks:
+	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
+put_pm_runtime:
+	pm_runtime_put(dev);
+put_of_node:
+	of_node_put(data->parent_pd.np);
+	return ret;
+}
+
+static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
+{
+	struct mt8173_mfgtop_data *data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_genpd_remove_subdomain(&data->parent_pd, &data->child_pd);
+	of_genpd_del_provider(node);
+	pm_genpd_remove(&data->genpd);
+	of_clk_del_provider(node);
+	clk_put(data->clk_26m);
+	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
+}
+
+static struct platform_driver clk_mt8173_mfgtop_drv = {
+	.probe = clk_mt8173_mfgtop_probe,
+	.remove_new = clk_mt8173_mfgtop_remove,
+	.driver = {
+		.name = "clk-mt8173-mfgtop",
+		.of_match_table = of_match_clk_mt8173_mfgtop,
+	},
+};
+module_platform_driver(clk_mt8173_mfgtop_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8173 mfgtop clock driver");
+MODULE_LICENSE("GPL");
-- 
2.45.1.288.g0e0cd299f1-goog


