Return-Path: <linux-clk+bounces-28906-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F0BCCF96
	for <lists+linux-clk@lfdr.de>; Fri, 10 Oct 2025 14:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6EC31A66B84
	for <lists+linux-clk@lfdr.de>; Fri, 10 Oct 2025 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA49B2F3622;
	Fri, 10 Oct 2025 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wH5cq9Qr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1E42EF676
	for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760100411; cv=none; b=n6fbqQhzTB5SQlcsKkfP9s5gTUY5xzwGCFAOJGvyZb9iZaTdpNN9or+nF7lN/Eo2Vgt88aTXj7mnba24k74931EqvYB6HzmD8Px63cC66RQT5sn/hSSQJMcfpevcBhNpWiehD1Y3l5KyQ/IKvlDZr4AL5pYSMc1yRge0C41EXXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760100411; c=relaxed/simple;
	bh=WUOPaewEXUxz1AoJ6NXGQ9zCjuaJhlXKujpMsFiB5fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePDDKU20InyugOAG5lxp5QEMIpZ8rMKqb5jOJWOXtUoE7Ivl1dmAbw4ayHAaNQY7AvxQmjg8qGYOcLW0MblU+xiixlPi2Bv8L0+lzm0DCABSyDiHuzBgJPT8EyjGqn0TenGvf4b0vEeIzCGuRwBD8IYH9xWwQ1IAd8Z01WhDuoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wH5cq9Qr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso11744705e9.2
        for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 05:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100407; x=1760705207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAlEGGoIwwLS+tNt2iilinfrs+DKRYT+/rT/ksD4Tt4=;
        b=wH5cq9QrWs7r15VOlSbLBFIfdqVquh6HoI+h9nrerjGQClHwKTiCcVKIlu533yx6kD
         Do4SZYxLNlptSKn7ZQ7Ih0ECAZsFI7/ny25Hql5nhQtfOGqYGmEAvMJ7L007LplgqxW2
         4qyEvizTDufqK7DNUpQUe3Y8t/fqnBRZuLolnJEueIiuluaTKFep3imrw0+1Ys9sI+qG
         hHAsIY6XI+xz6gyHeOglnCIYLouYCUV36EBvKym3GEk6YJqUF70dZKcTrwpfmzprY+oK
         2evqiIy0VdffXUi//h8YifCVAawu9b/J6mDOmAu5yf6RXeTWADVlYyuhvSIM0YxQ8v9o
         6hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100407; x=1760705207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAlEGGoIwwLS+tNt2iilinfrs+DKRYT+/rT/ksD4Tt4=;
        b=nIeDL9XacFmS7Uky98vuDjwGFK65OM3z3VF6J4HO4Kd2d5xFItHOj7q/B5RCCG2zmt
         PdIpOf7ht+ckTN7LTl5drME9cKiGULtYYxsJ+oG+EHGwtcKzMHT6oRWhN2Dd0Z6JBSi+
         z+qEQvNCJ0XlMYOaCHp/sGhoom5vp2Iu74x0FGx8f6hYri8Jb4LhJ674jb3ranDHIfgY
         NWhrRxBGVkpaEdxFXPbfTHIO38mhP1PN9oDL6lo7bnTKAUGglhy1/7gsmjmtjsGtURwY
         JOlfJZAOJaZofS33i9czsjxT29cSG01z8oks5WZGxkAT3kZ5syHx+mVTB2V07ByXU3qG
         Qf2w==
X-Forwarded-Encrypted: i=1; AJvYcCUcubmEztffQ1phHZOYKEec8OfkFkFJ6GFfcxeKAvjfj/0gYSgi8h1GClhZHKVgAJhkIysTtG/Uq6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YySdRdEGWJZhwuJ/kn5apkA21oikNtFOMuifzY0WRC70iNHfg69
	suXE5OIjDDZEhH4JHCc2ARGrVvxEJ48cgN+T2GHk4lt9cEfFLlKhnbuaJL64dPCVkgc=
X-Gm-Gg: ASbGncuSEIrdL8JP9to1k5FkwGttdFh0WvJMdR7t+T/wj5j4WUct4vZGvW6f+20F22n
	gJBCot7qPMPnKNknmkBVbeULJFOBtcrFLiHDKtFQjbBzq8OxsGPJ7SBBI4GzO16ua1TRXLhaWtF
	Ltl/AvxvMdrTcq5fVu0SeLEKSpFDqipV6PbUTsKg4qg9iH4QBI7jv4iNtvLGcXWSzBL/ZjcRDiB
	czbmGaJy3vAqLa/EEkP7rQpJDvB+h8eoxi4YrmZXsQfXq2O0xpkOlfvVtgkIKuEbNg3pb0Hexfn
	5/K8YsUaKVOb0ExIpg0EgSrBBmdQjqghtm1tHlTb9a24nlCqDVSEVr1llr4PXV2eOxTAW0U0cz6
	zSdBza9utKE08nSMzZZXOAoSg+0+bJ6GUZHlWbiWV+eQ1tYglr2vA37uPjh7ls+ren8ASgHQebc
	oQ9JEq6PeGwff/09RCYAaICg==
X-Google-Smtp-Source: AGHT+IGuI2G+Ae3XpP1MAn3JfPl3PWFrf8R525ep2U5Hm4R+0mx8g5Lnp7ZF1uVZR6Qd868Jax78JA==
X-Received: by 2002:a05:600c:8505:b0:46e:67c8:729f with SMTP id 5b1f17b1804b1-46fa9a9447cmr76851325e9.7.1760100407426;
        Fri, 10 Oct 2025 05:46:47 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:46 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:34 +0000
Subject: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100401; l=7194;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=WUOPaewEXUxz1AoJ6NXGQ9zCjuaJhlXKujpMsFiB5fI=;
 b=BanjhtC7fgNjpy0sgYOx2hwH230uKAsCpatoQx+xvu1n80CRbIq0YU4T5O6Mx0kMVbVRBX0ub
 M8hXBqCff5zB8P8HnSUfWxh3XsBlLFCNADZbVT8yMkXZR+KKkPOOCRs
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the Exynos ACPM clock driver. It provides support for clocks that
are controlled by firmware that implements the ACPM interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 drivers/clk/samsung/Kconfig    |  10 +++
 drivers/clk/samsung/Makefile   |   1 +
 drivers/clk/samsung/clk-acpm.c | 185 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
 	  status of the certains clocks from SoC, but it could also be tied to
 	  other devices as an input clock.
 
+config EXYNOS_ACPM_CLK
+	tristate "Clock driver controlled via ACPM interface"
+	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
+	help
+	  This driver provides support for clocks that are controlled by
+	  firmware that implements the ACPM interface.
+
+	  This driver uses the ACPM interface to interact with the firmware
+	  providing all the clock controlls.
+
 config TESLA_FSD_COMMON_CLK
 	bool "Tesla FSD clock controller support" if COMPILE_TEST
 	depends on COMMON_CLK_SAMSUNG
diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index ef464f434740f96623f9df62f94e2903e14e2226..f3657f2e1b98c6f431ab1f04c2d2a44fe317261b 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos990.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov920.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
+obj-$(CONFIG_EXYNOS_ACPM_CLK)		+= clk-acpm.o
 obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
 obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
 obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+= clk-fsd.o
diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
new file mode 100644
index 0000000000000000000000000000000000000000..b90809ce3f882c489114c9d7299417d7fe373749
--- /dev/null
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Samsung Exynos ACPM protocol based clock driver.
+ *
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/device/devres.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+struct acpm_clk {
+	u32 id;
+	struct clk_hw hw;
+	unsigned int mbox_chan_id;
+	const struct acpm_handle *handle;
+};
+
+struct acpm_clk_variant {
+	const char *name;
+};
+
+struct acpm_clk_driver_data {
+	const struct acpm_clk_variant *clks;
+	unsigned int nr_clks;
+	unsigned int mbox_chan_id;
+};
+
+#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
+
+#define ACPM_CLK(cname)					\
+	{						\
+		.name		= cname,		\
+	}
+
+static const struct acpm_clk_variant gs101_acpm_clks[] = {
+	ACPM_CLK("mif"),
+	ACPM_CLK("int"),
+	ACPM_CLK("cpucl0"),
+	ACPM_CLK("cpucl1"),
+	ACPM_CLK("cpucl2"),
+	ACPM_CLK("g3d"),
+	ACPM_CLK("g3dl2"),
+	ACPM_CLK("tpu"),
+	ACPM_CLK("intcam"),
+	ACPM_CLK("tnr"),
+	ACPM_CLK("cam"),
+	ACPM_CLK("mfc"),
+	ACPM_CLK("disp"),
+	ACPM_CLK("bo"),
+};
+
+static const struct acpm_clk_driver_data acpm_clk_gs101 = {
+	.clks = gs101_acpm_clks,
+	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
+	.mbox_chan_id = 0,
+};
+
+static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
+					clk->mbox_chan_id, clk->id);
+}
+
+static int acpm_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	/*
+	 * We can't figure out what rate it will be, so just return the
+	 * rate back to the caller. acpm_clk_recalc_rate() will be called
+	 * after the rate is set and we'll know what rate the clock is
+	 * running at then.
+	 */
+	return 0;
+}
+
+static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
+					clk->mbox_chan_id, clk->id, rate);
+}
+
+static const struct clk_ops acpm_clk_ops = {
+	.recalc_rate = acpm_clk_recalc_rate,
+	.determine_rate = acpm_clk_determine_rate,
+	.set_rate = acpm_clk_set_rate,
+};
+
+static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
+			     const char *name)
+{
+	struct clk_init_data init = {};
+
+	init.name = name;
+	init.ops = &acpm_clk_ops;
+	aclk->hw.init = &init;
+
+	return devm_clk_hw_register(dev, &aclk->hw);
+}
+
+static int acpm_clk_probe(struct platform_device *pdev)
+{
+	const struct acpm_handle *acpm_handle;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **hws;
+	struct device *dev = &pdev->dev;
+	struct acpm_clk *aclks;
+	unsigned int mbox_chan_id;
+	int i, err, count;
+
+	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
+	if (IS_ERR(acpm_handle))
+		return dev_err_probe(dev, PTR_ERR(acpm_handle),
+				     "Failed to get acpm handle\n");
+
+	count = acpm_clk_gs101.nr_clks;
+	mbox_chan_id = acpm_clk_gs101.mbox_chan_id;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = count;
+	hws = clk_data->hws;
+
+	aclks = devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
+	if (!aclks)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		struct acpm_clk *aclk = &aclks[i];
+
+		/*
+		 * The code assumes the clock IDs start from zero,
+		 * are sequential and do not have gaps.
+		 */
+		aclk->id = i;
+		aclk->handle = acpm_handle;
+		aclk->mbox_chan_id = mbox_chan_id;
+
+		hws[i] = &aclk->hw;
+
+		err = acpm_clk_register(dev, aclk,
+					acpm_clk_gs101.clks[i].name);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "Failed to register clock\n");
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   clk_data);
+}
+
+static const struct platform_device_id acpm_clk_id[] = {
+	{ "gs101-acpm-clk" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, acpm_clk_id);
+
+static struct platform_driver acpm_clk_driver = {
+	.driver	= {
+		.name = "acpm-clocks",
+	},
+	.probe = acpm_clk_probe,
+	.id_table = acpm_clk_id,
+};
+module_platform_driver(acpm_clk_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM clock driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0.740.g6adb054d12-goog


