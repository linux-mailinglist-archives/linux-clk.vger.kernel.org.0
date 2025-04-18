Return-Path: <linux-clk+bounces-20763-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE2A92FAF
	for <lists+linux-clk@lfdr.de>; Fri, 18 Apr 2025 04:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EFC78E3E41
	for <lists+linux-clk@lfdr.de>; Fri, 18 Apr 2025 02:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800FE267B1D;
	Fri, 18 Apr 2025 02:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuIGB6Qk"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E3267B0A;
	Fri, 18 Apr 2025 02:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744941828; cv=none; b=rPiMIN4kVnn/YmyTJrYQOTiQQlhSEh5spNxNg3ekh22b316/1VrYDhzRb9YxeOVHxhfx/ujmL6WyWux8m9Vm/Ivj+fnoJ6CfU/xtqoNHKMHA0/KH3uckZSzI9X/ixPwSXhqKa3woY/G4Ozmhgwy19BvPUk2GZCxZZ/Tqw2fgoU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744941828; c=relaxed/simple;
	bh=oFV/K7nb/DfOUf2KG5EktX/ExqzaexHOs2jE9tXPQn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+lKjw34vx8vqrs+pphGvJKxjoBW7PV/ta6q4/KYqaHMV11qntnzKJw2vqLdWptpnJ+96f1wMFyuqBI8tj1XEsQyQK5fQGQCPDhAsgV10vK/uiNZdpP6mLc7iOYsvgN0caXhxYUDQwZmjB5ZE8mYrRgsljBMTawmP+sHqWGEMEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuIGB6Qk; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4768f90bf36so12996191cf.0;
        Thu, 17 Apr 2025 19:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744941824; x=1745546624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f46pXV1CPbb98e+1xVuONuWlz41IOjAlpXW+EFXVmMI=;
        b=YuIGB6QkhqUzL+lxcQXv0Hr6yZIko3+FudwXzYPzCzo7eOHwWQQEJW/Kn3KIbsTSaU
         TVsvpTIyqNfspHUVkGWnIh/DONUESTEkBg2Zl5egK444N0pJkQNNU78PPRuqdXokUZQy
         GUq4jsfd+Dr0WVAB1zWtsMm3H+s8By7u/hzm1kaiiTxZ9cumWhW12x3rHKdj8dDC//eW
         qG27yZWwNLnYVfrSpZa6fPCAmkDHHQjXNnZklTPR+PLxFPyQhnsVbbNmt8Q1hOdOl/fL
         fNGB4sQ2gVJsxeyvRaPjGlMGo1tVZrxh5JFU7AR430cuh33+YWdm+xRNvj4GZ5eLgxYG
         Rz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744941824; x=1745546624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f46pXV1CPbb98e+1xVuONuWlz41IOjAlpXW+EFXVmMI=;
        b=CUr0MsuhP/Dh5kRWNg0mewgLbHfvEzO3oWSmjzMhppx73ZOnPHQEyV3AaeCLmvOR+g
         yhcC55CXTbj9+lJ8FGtShu2/TAbSBbj+PAzTm0HtcxJ0DtLYbM7ytDRvM29cGMHzfOfD
         /JzabB19HT3N0JxZ1vGc0MqFRITbtBFsyttZyQGoHpudwrCvWNXU91xRqnwgn7cToLNB
         t4ulqnWk+ooMI9h8f9dvD7aUYOdenuOnv8IkQNgwqaQVk0riPT53JLfMtrJp6PhkljSa
         mPJeimbZ9TQ/Do3cKIfGC6/gJpapHDjye6qXzC4QKK/oAH1+0m0tE7GmpvangFVvcuV4
         Tn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqzL2RliU1oEObm8pbdzZCBKNNe0DNi0yA09XBJKLO+32Pr1h8k68pw7Ae46g3VpwYVDl1XOqP@vger.kernel.org, AJvYcCV53n7JD9I6U2f1sArDkHsTMYEhI3F95Oyt0A0IS/3dmDI7m6WADHQ/N2TX/j8JHnZgI8yEM2UluZ9Cxy/X@vger.kernel.org, AJvYcCWEq98LKF/gk8eoM08yZvSVumNyYjofBjgPcRD3sPTOCA1oFnqAu5jSuGqgJUSz+MNsxsF5yxiQcH1z@vger.kernel.org
X-Gm-Message-State: AOJu0YxGb7Z0eEWxIXlWNGqpWrgTjun77k6QGqF8qawkxAPT9MAw0n8e
	nIKSR/o0LNkKcR2f0Ybd0Nv4jSLJ8BEd4MVdVAyo1ZgQnIq43qET
X-Gm-Gg: ASbGncssW/vZXMMzG5sMlrPO6YJnN36y0ULSl10YpYYM0nEt0pZSkd7+PNYHBeV2ctv
	8PYAofJej+ZyZJfSSx9WbZoXqWBTMH1g2XotRZEMsESb/K+XLWR+HVVOwFQPwbEtPQkpphTb3oi
	6dU7euYV5zuJ3QFHm9ACGeX28GI/wP0OGBB3W2mPDIO8nVEZK+vU0Rt+qN5QIe0VJcwq5Ux+Izz
	wRNBlAK9EChH0/SNsEvv9TsiYpfyENqwIFxGEn+U0bMghv7k+Uk+C4YPqbsVVc1xJP6N0BLkp2H
	59GmaDCvM6GmTiLD
X-Google-Smtp-Source: AGHT+IEa3XTyou6B1UlAXh5StN8SBILf2f9ItYft5UReQN5f88/E9aTkI2S7eGlEvVuC9pFIa/pc3w==
X-Received: by 2002:a05:6214:1c4e:b0:6e4:3eb1:2bde with SMTP id 6a1803df08f44-6f2c456186emr25975196d6.19.1744941824079;
        Thu, 17 Apr 2025 19:03:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f2c2b32741sm5679966d6.62.2025.04.17.19.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:03:42 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 4/5] clk: sophgo: Add PLL clock controller support for SG2044 SoC
Date: Fri, 18 Apr 2025 10:03:23 +0800
Message-ID: <20250418020325.421257-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418020325.421257-1-inochiama@gmail.com>
References: <20250418020325.421257-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PLL clock driver and clock definition for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/sophgo/Kconfig          |  10 +
 drivers/clk/sophgo/Makefile         |   1 +
 drivers/clk/sophgo/clk-sg2044-pll.c | 628 ++++++++++++++++++++++++++++
 3 files changed, 639 insertions(+)
 create mode 100644 drivers/clk/sophgo/clk-sg2044-pll.c

diff --git a/drivers/clk/sophgo/Kconfig b/drivers/clk/sophgo/Kconfig
index 8b1367e3a95e..88e60677c7a9 100644
--- a/drivers/clk/sophgo/Kconfig
+++ b/drivers/clk/sophgo/Kconfig
@@ -37,3 +37,13 @@ config CLK_SOPHGO_SG2042_RPGATE
 	  This clock IP depends on SG2042 Clock Generator because it uses
 	  clock from Clock Generator IP as input.
 	  This driver provides Gate function for RP.
+
+config CLK_SOPHGO_SG2044_PLL
+	tristate "Sophgo SG2044 PLL clock controller support"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	select MFD_SYSCON
+	select REGMAP_MMIO
+	help
+	  This driver supports the PLL clock controller on the Sophgo
+	  SG2044 SoC. This controller requires 25M oscillator as input.
+	  This clock control provides PLL clocks on the SoC.
diff --git a/drivers/clk/sophgo/Makefile b/drivers/clk/sophgo/Makefile
index 53506845a044..4a6afa8bdc66 100644
--- a/drivers/clk/sophgo/Makefile
+++ b/drivers/clk/sophgo/Makefile
@@ -9,3 +9,4 @@ clk-sophgo-cv1800-y		+= clk-cv18xx-pll.o
 obj-$(CONFIG_CLK_SOPHGO_SG2042_CLKGEN)	+= clk-sg2042-clkgen.o
 obj-$(CONFIG_CLK_SOPHGO_SG2042_PLL)	+= clk-sg2042-pll.o
 obj-$(CONFIG_CLK_SOPHGO_SG2042_RPGATE)	+= clk-sg2042-rpgate.o
+obj-$(CONFIG_CLK_SOPHGO_SG2044_PLL)	+= clk-sg2044-pll.o
diff --git a/drivers/clk/sophgo/clk-sg2044-pll.c b/drivers/clk/sophgo/clk-sg2044-pll.c
new file mode 100644
index 000000000000..94c0f519ba6d
--- /dev/null
+++ b/drivers/clk/sophgo/clk-sg2044-pll.c
@@ -0,0 +1,628 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo SG2044 PLL clock controller driver
+ *
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/clock/sophgo,sg2044-pll.h>
+
+/* Low Control part */
+#define PLL_VCOSEL_MASK		GENMASK(17, 16)
+
+/* High Control part */
+#define PLL_FBDIV_MASK		GENMASK(11, 0)
+#define PLL_REFDIV_MASK		GENMASK(17, 12)
+#define PLL_POSTDIV1_MASK	GENMASK(20, 18)
+#define PLL_POSTDIV2_MASK	GENMASK(23, 21)
+
+#define PLL_CALIBRATE_EN	BIT(24)
+#define PLL_CALIBRATE_MASK	GENMASK(29, 27)
+#define PLL_CALIBRATE_DEFAULT	FIELD_PREP(PLL_CALIBRATE_MASK, 2)
+#define PLL_UPDATE_EN		BIT(30)
+
+#define PLL_HIGH_CTRL_MASK	\
+	(PLL_FBDIV_MASK | PLL_REFDIV_MASK | \
+	 PLL_POSTDIV1_MASK | PLL_POSTDIV2_MASK | \
+	 PLL_CALIBRATE_EN | PLL_CALIBRATE_MASK | \
+	 PLL_UPDATE_EN)
+
+#define PLL_HIGH_CTRL_OFFSET	4
+
+#define PLL_VCOSEL_1G6		0x2
+#define PLL_VCOSEL_2G4		0x3
+
+#define PLL_LIMIT_FOUTVCO	0
+#define PLL_LIMIT_FOUT		1
+#define PLL_LIMIT_REFDIV	2
+#define PLL_LIMIT_FBDIV		3
+#define PLL_LIMIT_POSTDIV1	4
+#define PLL_LIMIT_POSTDIV2	5
+
+#define for_each_pll_limit_range(_var, _limit) \
+	for (_var = (_limit)->min; _var <= (_limit)->max; _var++)
+
+struct sg2044_pll_limit {
+	u64 min;
+	u64 max;
+};
+
+struct sg2044_pll_internal {
+	u32 ctrl_offset;
+	u32 status_offset;
+	u32 enable_offset;
+
+	u8 status_lock_bit;
+	u8 status_updating_bit;
+	u8 enable_bit;
+
+	const struct sg2044_pll_limit *limits;
+};
+
+struct sg2044_clk_common {
+	struct clk_hw	hw;
+	struct regmap	*regmap;
+	spinlock_t	*lock;
+	unsigned int	id;
+};
+
+struct sg2044_pll {
+	struct sg2044_clk_common	common;
+	struct sg2044_pll_internal	pll;
+	unsigned int			syscon_offset;
+};
+
+struct sg2044_pll_desc_data {
+	struct sg2044_clk_common	* const *pll;
+	u16				num_pll;
+};
+
+#define SG2044_SYSCON_PLL_OFFSET	0x98
+
+struct sg2044_pll_ctrl {
+	spinlock_t			lock;
+	struct clk_hw_onecell_data	data;
+};
+
+#define hw_to_sg2044_clk_common(_hw)					\
+	container_of((_hw), struct sg2044_clk_common, hw)
+
+static inline bool sg2044_clk_fit_limit(u64 value,
+					const struct sg2044_pll_limit *limit)
+{
+	return value >= limit->min && value <= limit->max;
+}
+
+static inline struct sg2044_pll *hw_to_sg2044_pll(struct clk_hw *hw)
+{
+	return container_of(hw_to_sg2044_clk_common(hw),
+			    struct sg2044_pll, common);
+}
+
+static unsigned long sg2044_pll_calc_vco_rate(unsigned long parent_rate,
+					      unsigned long refdiv,
+					      unsigned long fbdiv)
+{
+	u64 numerator = parent_rate * fbdiv;
+
+	return div64_ul(numerator, refdiv);
+}
+
+static unsigned long sg2044_pll_calc_rate(unsigned long parent_rate,
+					  unsigned long refdiv,
+					  unsigned long fbdiv,
+					  unsigned long postdiv1,
+					  unsigned long postdiv2)
+{
+	u64 numerator, denominator;
+
+	numerator = parent_rate * fbdiv;
+	denominator = refdiv * (postdiv1 + 1) * (postdiv2 + 1);
+
+	return div64_u64(numerator, denominator);
+}
+
+static unsigned long sg2044_pll_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct sg2044_pll *pll = hw_to_sg2044_pll(hw);
+	u32 value;
+	int ret;
+
+	ret = regmap_read(pll->common.regmap,
+			  pll->syscon_offset + pll->pll.ctrl_offset + PLL_HIGH_CTRL_OFFSET,
+			  &value);
+	if (ret < 0)
+		return 0;
+
+	return sg2044_pll_calc_rate(parent_rate,
+				    FIELD_GET(PLL_REFDIV_MASK, value),
+				    FIELD_GET(PLL_FBDIV_MASK, value),
+				    FIELD_GET(PLL_POSTDIV1_MASK, value),
+				    FIELD_GET(PLL_POSTDIV2_MASK, value));
+}
+
+static bool pll_is_better_rate(unsigned long target, unsigned long now,
+			       unsigned long best)
+{
+	return abs_diff(target, now) < abs_diff(target, best);
+}
+
+static int sg2042_pll_compute_postdiv(const struct sg2044_pll_limit *limits,
+				      unsigned long target,
+				      unsigned long parent_rate,
+				      unsigned int refdiv,
+				      unsigned int fbdiv,
+				      unsigned int *postdiv1,
+				      unsigned int *postdiv2)
+{
+	unsigned int div1, div2;
+	unsigned long tmp, best_rate = 0;
+	unsigned int best_div1 = 0, best_div2 = 0;
+
+	for_each_pll_limit_range(div2, &limits[PLL_LIMIT_POSTDIV2]) {
+		for_each_pll_limit_range(div1, &limits[PLL_LIMIT_POSTDIV1]) {
+			tmp = sg2044_pll_calc_rate(parent_rate,
+						   refdiv, fbdiv,
+						   div1, div2);
+
+			if (tmp > target)
+				continue;
+
+			if (pll_is_better_rate(target, tmp, best_rate)) {
+				best_div1 = div1;
+				best_div2 = div2;
+				best_rate = tmp;
+
+				if (tmp == target)
+					goto find;
+			}
+		}
+	}
+
+find:
+	if (best_rate) {
+		*postdiv1 = best_div1;
+		*postdiv2 = best_div2;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int sg2044_compute_pll_setting(const struct sg2044_pll_limit *limits,
+				      unsigned long req_rate,
+				      unsigned long parent_rate,
+				      unsigned int *value)
+{
+	unsigned int refdiv, fbdiv, postdiv1, postdiv2;
+	unsigned int best_refdiv, best_fbdiv, best_postdiv1, best_postdiv2;
+	unsigned long tmp, best_rate = 0;
+	int ret;
+
+	for_each_pll_limit_range(fbdiv, &limits[PLL_LIMIT_FBDIV]) {
+		for_each_pll_limit_range(refdiv, &limits[PLL_LIMIT_REFDIV]) {
+			u64 vco = sg2044_pll_calc_vco_rate(parent_rate,
+							   refdiv, fbdiv);
+			if (!sg2044_clk_fit_limit(vco, &limits[PLL_LIMIT_FOUTVCO]))
+				continue;
+
+			ret = sg2042_pll_compute_postdiv(limits,
+							 req_rate, parent_rate,
+							 refdiv, fbdiv,
+							 &postdiv1, &postdiv2);
+			if (ret)
+				continue;
+
+			tmp = sg2044_pll_calc_rate(parent_rate,
+						   refdiv, fbdiv,
+						   postdiv1, postdiv2);
+
+			if (pll_is_better_rate(req_rate, tmp, best_rate)) {
+				best_refdiv = refdiv;
+				best_fbdiv = fbdiv;
+				best_postdiv1 = postdiv1;
+				best_postdiv2 = postdiv2;
+				best_rate = tmp;
+
+				if (tmp == req_rate)
+					goto find;
+			}
+		}
+	}
+
+find:
+	if (best_rate) {
+		*value = FIELD_PREP(PLL_REFDIV_MASK, best_refdiv) |
+			 FIELD_PREP(PLL_FBDIV_MASK, best_fbdiv) |
+			 FIELD_PREP(PLL_POSTDIV1_MASK, best_postdiv1) |
+			 FIELD_PREP(PLL_POSTDIV2_MASK, best_postdiv2);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int sg2044_pll_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	struct sg2044_pll *pll = hw_to_sg2044_pll(hw);
+	unsigned int value;
+	u64 target;
+	int ret;
+
+	target = clamp(req->rate, pll->pll.limits[PLL_LIMIT_FOUT].min,
+		       pll->pll.limits[PLL_LIMIT_FOUT].max);
+
+	ret = sg2044_compute_pll_setting(pll->pll.limits, target,
+					 req->best_parent_rate, &value);
+	if (ret < 0)
+		return ret;
+
+	req->rate = sg2044_pll_calc_rate(req->best_parent_rate,
+					 FIELD_GET(PLL_REFDIV_MASK, value),
+					 FIELD_GET(PLL_FBDIV_MASK, value),
+					 FIELD_GET(PLL_POSTDIV1_MASK, value),
+					 FIELD_GET(PLL_POSTDIV2_MASK, value));
+
+	return 0;
+}
+
+static int sg2044_pll_poll_update(struct sg2044_pll *pll)
+{
+	int ret;
+	unsigned int value;
+
+	ret = regmap_read_poll_timeout_atomic(pll->common.regmap,
+					      pll->syscon_offset + pll->pll.status_offset,
+					      value,
+					      (value & BIT(pll->pll.status_lock_bit)),
+					      1, 100000);
+	if (ret)
+		return ret;
+
+	return regmap_read_poll_timeout_atomic(pll->common.regmap,
+					       pll->syscon_offset + pll->pll.status_offset,
+					       value,
+					       (!(value & BIT(pll->pll.status_updating_bit))),
+					       1, 100000);
+}
+
+static int sg2044_pll_enable(struct sg2044_pll *pll, bool en)
+{
+	if (en) {
+		if (sg2044_pll_poll_update(pll) < 0)
+			pr_warn("%s: fail to lock pll\n", clk_hw_get_name(&pll->common.hw));
+
+		return regmap_set_bits(pll->common.regmap,
+				       pll->syscon_offset + pll->pll.enable_offset,
+				       BIT(pll->pll.enable_bit));
+	}
+
+	return regmap_clear_bits(pll->common.regmap,
+				 pll->syscon_offset + pll->pll.enable_offset,
+				 BIT(pll->pll.enable_bit));
+}
+
+static int sg2044_pll_update_vcosel(struct sg2044_pll *pll, u64 rate)
+{
+	unsigned int sel;
+
+	if (rate < U64_C(2400000000))
+		sel = PLL_VCOSEL_1G6;
+	else
+		sel = PLL_VCOSEL_2G4;
+
+	return regmap_write_bits(pll->common.regmap,
+				 pll->syscon_offset + pll->pll.ctrl_offset,
+				 PLL_VCOSEL_MASK,
+				 FIELD_PREP(PLL_VCOSEL_MASK, sel));
+}
+
+static int sg2044_pll_set_rate(struct clk_hw *hw,
+			       unsigned long rate, unsigned long parent_rate)
+{
+	struct sg2044_pll *pll = hw_to_sg2044_pll(hw);
+	unsigned int value;
+	u64 vco;
+	int ret;
+
+	ret = sg2044_compute_pll_setting(pll->pll.limits, rate,
+					 parent_rate, &value);
+	if (ret < 0)
+		return ret;
+
+	vco = sg2044_pll_calc_vco_rate(parent_rate,
+				       FIELD_GET(PLL_REFDIV_MASK, value),
+				       FIELD_GET(PLL_FBDIV_MASK, value));
+
+	value |= PLL_CALIBRATE_EN;
+	value |= PLL_CALIBRATE_DEFAULT;
+	value |= PLL_UPDATE_EN;
+
+	guard(spinlock_irqsave)(pll->common.lock);
+
+	ret = sg2044_pll_enable(pll, false);
+	if (ret)
+		return ret;
+
+	sg2044_pll_update_vcosel(pll, vco);
+
+	regmap_write_bits(pll->common.regmap,
+			  pll->syscon_offset + pll->pll.ctrl_offset +
+			  PLL_HIGH_CTRL_OFFSET,
+			  PLL_HIGH_CTRL_MASK, value);
+
+	sg2044_pll_enable(pll, true);
+
+	return ret;
+}
+
+static const struct clk_ops sg2044_pll_ops = {
+	.recalc_rate = sg2044_pll_recalc_rate,
+	.determine_rate = sg2044_pll_determine_rate,
+	.set_rate = sg2044_pll_set_rate,
+};
+
+static const struct clk_ops sg2044_pll_ro_ops = {
+	.recalc_rate = sg2044_pll_recalc_rate,
+};
+
+#define SG2044_CLK_COMMON_PDATA(_id, _name, _parents, _op, _flags)	\
+	{								\
+		.hw.init = CLK_HW_INIT_PARENTS_DATA(_name, _parents,	\
+						    _op, (_flags)),	\
+		.id = (_id),						\
+	}
+
+#define DEFINE_SG2044_PLL(_id, _name, _parent, _flags,			\
+			  _ctrl_offset,					\
+			  _status_offset, _status_lock_bit,		\
+			  _status_updating_bit,				\
+			  _enable_offset, _enable_bit,			\
+			  _limits)					\
+	struct sg2044_pll _name = {					\
+		.common	= SG2044_CLK_COMMON_PDATA(_id, #_name, _parent,	\
+						  &sg2044_pll_ops,	\
+						  (_flags)),		\
+		.pll = {						\
+			.ctrl_offset = (_ctrl_offset),			\
+			.status_offset = (_status_offset),		\
+			.enable_offset = (_enable_offset),		\
+			.status_lock_bit = (_status_lock_bit),		\
+			.status_updating_bit = (_status_updating_bit),	\
+			.enable_bit = (_enable_bit),			\
+			.limits = (_limits),				\
+		},							\
+	}
+
+#define DEFINE_SG2044_PLL_RO(_id, _name, _parent, _flags,		\
+			     _ctrl_offset,				\
+			     _status_offset, _status_lock_bit,		\
+			     _status_updating_bit,			\
+			     _enable_offset, _enable_bit,		\
+			     _limits)					\
+	struct sg2044_pll _name = {					\
+		.common	= SG2044_CLK_COMMON_PDATA(_id, #_name, _parent,	\
+						  &sg2044_pll_ro_ops,	\
+						  (_flags)),		\
+		.pll = {						\
+			.ctrl_offset = (_ctrl_offset),			\
+			.status_offset = (_status_offset),		\
+			.enable_offset = (_enable_offset),		\
+			.status_lock_bit = (_status_lock_bit),		\
+			.status_updating_bit = (_status_updating_bit),	\
+			.enable_bit = (_enable_bit),			\
+			.limits = (_limits),				\
+		},							\
+	}
+
+static const struct clk_parent_data osc_parents[] = {
+	{ .index = 0 },
+};
+
+static const struct sg2044_pll_limit pll_limits[] = {
+	[PLL_LIMIT_FOUTVCO] = {
+		.min = U64_C(1600000000),
+		.max = U64_C(3200000000),
+	},
+	[PLL_LIMIT_FOUT] = {
+		.min = U64_C(25000),
+		.max = U64_C(3200000000),
+	},
+	[PLL_LIMIT_REFDIV] = {
+		.min = U64_C(1),
+		.max = U64_C(63),
+	},
+	[PLL_LIMIT_FBDIV] = {
+		.min = U64_C(8),
+		.max = U64_C(1066),
+	},
+	[PLL_LIMIT_POSTDIV1] = {
+		.min = U64_C(0),
+		.max = U64_C(7),
+	},
+	[PLL_LIMIT_POSTDIV2] = {
+		.min = U64_C(0),
+		.max = U64_C(7),
+	},
+};
+
+static DEFINE_SG2044_PLL_RO(CLK_FPLL0, clk_fpll0, osc_parents, CLK_IS_CRITICAL,
+			    0x58, 0x00, 22, 6,
+			    0x04, 6, pll_limits);
+
+static DEFINE_SG2044_PLL_RO(CLK_FPLL1, clk_fpll1, osc_parents, CLK_IS_CRITICAL,
+			    0x60, 0x00, 23, 7,
+			    0x04, 7, pll_limits);
+
+static DEFINE_SG2044_PLL_RO(CLK_FPLL2, clk_fpll2, osc_parents, CLK_IS_CRITICAL,
+			    0x20, 0x08, 16, 0,
+			    0x0c, 0, pll_limits);
+
+static DEFINE_SG2044_PLL_RO(CLK_DPLL0, clk_dpll0, osc_parents, CLK_IS_CRITICAL,
+			    0x68, 0x00, 24, 8,
+			    0x04, 8, pll_limits);
+
+static DEFINE_SG2044_PLL_RO(CLK_DPLL1, clk_dpll1, osc_parents, CLK_IS_CRITICAL,
+			    0x70, 0x00, 25, 9,
+			    0x04, 9, pll_limits);
+
+static DEFINE_SG2044_PLL_RO(CLK_DPLL2, clk_dpll2, osc_parents, CLK_IS_CRITICAL,
+			    0x78, 0x00, 26, 10,
+			    0x04, 10, pll_limits);
+
+static DEFINE_SG2044_PLL_RO(CLK_DPLL3, clk_dpll3, osc_parents, CLK_IS_CRITICAL,
+			    0x80, 0x00, 27, 11,
+			    0x04, 11, pll_limits);
+
+static DEFINE_SG2044_PLL_RO(CLK_DPLL4, clk_dpll4, osc_parents, CLK_IS_CRITICAL,
+			    0x88, 0x00, 28, 12,
+			    0x04, 12, pll_limits);
+
+static DEFINE_SG2044_PLL_RO(CLK_DPLL5, clk_dpll5, osc_parents, CLK_IS_CRITICAL,
+			    0x90, 0x00, 29, 13,
+			    0x04, 13, pll_limits);
+
+static DEFINE_SG2044_PLL_RO(CLK_DPLL6, clk_dpll6, osc_parents, CLK_IS_CRITICAL,
+			    0x98, 0x00, 30, 14,
+			    0x04, 14, pll_limits);
+
+static DEFINE_SG2044_PLL_RO(CLK_DPLL7, clk_dpll7, osc_parents, CLK_IS_CRITICAL,
+			    0xa0, 0x00, 31, 15,
+			    0x04, 15, pll_limits);
+
+static DEFINE_SG2044_PLL(CLK_MPLL0, clk_mpll0, osc_parents, CLK_IS_CRITICAL,
+			 0x28, 0x00, 16, 0,
+			 0x04, 0, pll_limits);
+
+static DEFINE_SG2044_PLL(CLK_MPLL1, clk_mpll1, osc_parents, CLK_IS_CRITICAL,
+			 0x30, 0x00, 17, 1,
+			 0x04, 1, pll_limits);
+
+static DEFINE_SG2044_PLL(CLK_MPLL2, clk_mpll2, osc_parents, CLK_IS_CRITICAL,
+			 0x38, 0x00, 18, 2,
+			 0x04, 2, pll_limits);
+
+static DEFINE_SG2044_PLL(CLK_MPLL3, clk_mpll3, osc_parents, CLK_IS_CRITICAL,
+			 0x40, 0x00, 19, 3,
+			 0x04, 3, pll_limits);
+
+static DEFINE_SG2044_PLL(CLK_MPLL4, clk_mpll4, osc_parents, CLK_IS_CRITICAL,
+			 0x48, 0x00, 20, 4,
+			 0x04, 4, pll_limits);
+
+static DEFINE_SG2044_PLL(CLK_MPLL5, clk_mpll5, osc_parents, CLK_IS_CRITICAL,
+			 0x50, 0x00, 21, 5,
+			 0x04, 5, pll_limits);
+
+static struct sg2044_clk_common * const sg2044_pll_commons[] = {
+	&clk_fpll0.common,
+	&clk_fpll1.common,
+	&clk_fpll2.common,
+	&clk_dpll0.common,
+	&clk_dpll1.common,
+	&clk_dpll2.common,
+	&clk_dpll3.common,
+	&clk_dpll4.common,
+	&clk_dpll5.common,
+	&clk_dpll6.common,
+	&clk_dpll7.common,
+	&clk_mpll0.common,
+	&clk_mpll1.common,
+	&clk_mpll2.common,
+	&clk_mpll3.common,
+	&clk_mpll4.common,
+	&clk_mpll5.common,
+};
+
+static int sg2044_pll_init_ctrl(struct device *dev, struct regmap *regmap,
+				struct sg2044_pll_ctrl *ctrl,
+				const struct sg2044_pll_desc_data *desc)
+{
+	int ret, i;
+
+	spin_lock_init(&ctrl->lock);
+
+	for (i = 0; i < desc->num_pll; i++) {
+		struct sg2044_clk_common *common = desc->pll[i];
+		struct sg2044_pll *pll = hw_to_sg2044_pll(&common->hw);
+
+		common->lock = &ctrl->lock;
+		common->regmap = regmap;
+		pll->syscon_offset = SG2044_SYSCON_PLL_OFFSET;
+
+		ret = devm_clk_hw_register(dev, &common->hw);
+		if (ret)
+			return ret;
+
+		ctrl->data.hws[common->id] = &common->hw;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   &ctrl->data);
+}
+
+static int sg2044_pll_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sg2044_pll_ctrl *ctrl;
+	const struct sg2044_pll_desc_data *desc;
+	struct regmap *regmap;
+
+	regmap = device_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "fail to get the regmap for PLL\n");
+
+	desc = (const struct sg2044_pll_desc_data *)platform_get_device_id(pdev)->driver_data;
+	if (!desc)
+		return dev_err_probe(dev, -EINVAL, "no match data for platform\n");
+
+	ctrl = devm_kzalloc(dev, struct_size(ctrl, data.hws, desc->num_pll), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->data.num = desc->num_pll;
+
+	return sg2044_pll_init_ctrl(dev, regmap, ctrl, desc);
+}
+
+static const struct sg2044_pll_desc_data sg2044_pll_desc_data = {
+	.pll = sg2044_pll_commons,
+	.num_pll = ARRAY_SIZE(sg2044_pll_commons),
+};
+
+static const struct platform_device_id sg2044_pll_match[] = {
+	{ .name = "sg2044-pll",
+	  .driver_data = (unsigned long)&sg2044_pll_desc_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, sg2044_pll_match);
+
+static struct platform_driver sg2044_clk_driver = {
+	.probe = sg2044_pll_probe,
+	.driver = {
+		.name = "sg2044-pll",
+	},
+	.id_table = sg2044_pll_match,
+};
+module_platform_driver(sg2044_clk_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo SG2044 pll clock driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0


