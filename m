Return-Path: <linux-clk+bounces-16392-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B49FD646
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 18:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09C717A2A80
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 17:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E181FA146;
	Fri, 27 Dec 2024 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HX6yKQUD"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A251F9F60
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318674; cv=none; b=IVQTC+n/f+ETOeZ9t8yMBoljtrfocZBqgB3h6AS431VeCo0yZCmjSq+xP1lufg3eH/PY1FULZGC0Skb7bTs672I06ZBPuG89hJ2m+/ORvnldfv0UKE6s9R4229CIZz1e8oGgxeBkIFCk+skJc9+j48iZRkANCyrCBLDVG0RVn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318674; c=relaxed/simple;
	bh=lHkkztafSbz+k5TquA34sqwlFvKuaziiJUz8NZVaka4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h40foSK9zWpi63GKnAyaGS3nMBqkvjrqKuXkrfTGhEntmts8qYrdSZJZxyhVAWZ/SG1CTT4ZNmDDMksnxdiRsSffdj4vjpbDIqZbrqYz+hh3VWHQfAkc+NC5bFbBOG4mxyZuwEIedS0fvQy2lLUzH9dXfif3mJ4qL/Zfl7sXqKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HX6yKQUD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaeecbb7309so523333266b.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 08:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318670; x=1735923470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqVeimmv4WZTQGhhHXNAuIU7VBj+PTgJUjWzRQrVodQ=;
        b=HX6yKQUDvNPjRRnJCBQJdR4pjKmA5hsyYA3LKd3NIXcufK2yhlyTyzj5P44tmTLB68
         d9MWZbr/ghJ9nu9kIBVDaFYxffSThjQB0KfpAykz5fhCBcXGriqfD4yO739J7+mCkVVP
         h+admg5IJWZbnvG6tgPQt/6ATrW+CgmKKpfJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318670; x=1735923470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqVeimmv4WZTQGhhHXNAuIU7VBj+PTgJUjWzRQrVodQ=;
        b=QnqdkCjTAjE0T0jWFJQc44P9JmyMqI6gM4dCKji5Ac9i0iRtlldwUpAxEAMUbGQTak
         t04E+AIdAjaTdaNZS0pVd3Yfc67EuV2cMlE6TJ3hGJQSRtISErxs73n6DE7Ls5CK5Ft0
         LLH8ZxftaKIJRp0YOnwlCEJnBKgLF66uIlkwLs+AHvBcDSiH8IlG6Md5QR/nYMFiWlAz
         d2ZgAykhPqOjViLpFJ/Dsf2Gkh5i/uAtW6UuXoJxI+wBz4zl2CSWmfXS5vnu76VftAbs
         jrBD2JmzE7rEqUqZSoKiP0Esiv2hDLbIqtxWh5IaVvRYbuITKU8YJvEpbmAnSGc2rE46
         t6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCU7NpdX6OWxejzbIaFaMktXPobNzh7LiId/f0HCYQcHru0v0BpBCOt4TsA0pO+DnAXzXjYitTiFuQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBHVZw8N2WoqekLs/rCEDOQty7fGWNzKAjE10QTm+X+W3FVY7W
	B0BVaP6dChbCKUGzYmvHzv4hktQJsE61hkiNv1L3kRS4kSNr0aSGlGu88LLepV0=
X-Gm-Gg: ASbGncsOGYZiMTdFrMWdQzSE/masde7cj/4RymqvAGiKFT126qLvhtT+5hUHQ2LcG6n
	/dITN/yqjgLPT6YSELt7QV9H8aOM3fDvG7Yp2QcCU1/yEEGXIt4ikzJWzHhYKNzR1+EwTxJhWvp
	I6giVy8Y92ohayVMM55VICMQHg+rg0nXFE6DZZsgy+0MKRBIiPS71hjQFkCGRoW1xe1c8m6ddkF
	Vd4cFz4NRpKPRzI59MA0sPkI6llm43OI0kYb9IKUExDzVAy7B6Sq7RzYbLxYChXY5+wTo+y4HxH
	48MUmLI96PQiB0uDgrY8Qw==
X-Google-Smtp-Source: AGHT+IGMBpnlGikPmpGKg++zC6Od+Um6DwUlXgprVezsE5PQma85Jl5+kWSFv3yoDVQKRaCYRyKbAg==
X-Received: by 2002:a17:907:6d26:b0:aa6:256a:40a7 with SMTP id a640c23a62f3a-aac2ad81a59mr2107196066b.22.1735318669986;
        Fri, 27 Dec 2024 08:57:49 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v7 16/23] clk: imx: add support for i.MX8MN anatop clock driver
Date: Fri, 27 Dec 2024 17:56:19 +0100
Message-ID: <20241227165719.3902388-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support NXP i.MX8M anatop PLL module which generates PLLs to CCM root.
By doing so, we also simplify the CCM driver code. The changes are
backward compatible.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- Update the code based on the changes made to the
  imx8m_anatop_get_clk_hw():
  - Rename imx8m_anatop_get_clk_hw to imx_anatop_get_clk_hw
  - Add device_node type parameter
- Call of_parse_phandle() to get the anatop's device node.

Changes in v6:
- Define IMX8MN_ANATOP_CLK_END inside the driver after it has ben
  removed from include/dt-bindings/clock/imx8mn-clock.h.

Changes in v4:
- New

 drivers/clk/imx/Makefile            |   2 +-
 drivers/clk/imx/clk-imx8mn-anatop.c | 283 ++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx8mn.c        | 186 ++++++++----------
 3 files changed, 367 insertions(+), 104 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 03f2b2a1ab63..f0f1d01c68f8 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -26,7 +26,7 @@ mxc-clk-objs += clk-gpr-mux.o
 obj-$(CONFIG_MXC_CLK) += mxc-clk.o
 
 obj-$(CONFIG_CLK_IMX8MM) += clk-imx8mm.o
-obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn.o
+obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn-anatop.o clk-imx8mn.o
 obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o clk-imx8mp-audiomix.o
 obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
 
diff --git a/drivers/clk/imx/clk-imx8mn-anatop.c b/drivers/clk/imx/clk-imx8mn-anatop.c
new file mode 100644
index 000000000000..43101b0a758e
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8mn-anatop.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clk-imx8mn-anatop.c - NXP i.MX8MN anatop clock driver
+ *
+ * Copyright (c) 2022 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <dt-bindings/clock/imx8mn-clock.h>
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/of_platform.h>
+
+#include "clk.h"
+
+#define IMX8MN_ANATOP_CLK_END		IMX8MN_ANATOP_CLK_CLKOUT2
+
+static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
+static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
+static const char * const audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
+static const char * const video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
+static const char * const dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
+static const char * const gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
+static const char * const m7_alt_pll_bypass_sels[] = {"m7_alt_pll", "m7_alt_pll_ref_sel", };
+static const char * const arm_pll_bypass_sels[] = {"arm_pll", "arm_pll_ref_sel", };
+static const char * const sys_pll3_bypass_sels[] = {"sys_pll3", "sys_pll3_ref_sel", };
+static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
+					   "dummy", "dummy", "gpu_pll_out", "dummy",
+					   "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
+					   "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
+
+static struct clk_hw_onecell_data *clk_hw_data;
+static struct clk_hw **hws;
+
+static int imx8mn_anatop_clocks_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(dev, "failed to get base address\n");
+		return PTR_ERR(base);
+	}
+
+	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
+						    IMX8MN_ANATOP_CLK_END),
+				   GFP_KERNEL);
+	if (WARN_ON(!clk_hw_data))
+		return -ENOMEM;
+
+	clk_hw_data->num = IMX8MN_ANATOP_CLK_END;
+	hws = clk_hw_data->hws;
+
+	hws[IMX8MN_ANATOP_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
+	hws[IMX8MN_ANATOP_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
+	hws[IMX8MN_ANATOP_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
+
+	hws[IMX8MN_ANATOP_AUDIO_PLL1_REF_SEL] =
+		imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MN_ANATOP_AUDIO_PLL2_REF_SEL] =
+		imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MN_ANATOP_VIDEO_PLL_REF_SEL] =
+		imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MN_ANATOP_DRAM_PLL_REF_SEL] =
+		imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MN_ANATOP_GPU_PLL_REF_SEL] =
+		imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MN_ANATOP_M7_ALT_PLL_REF_SEL] =
+		imx_clk_hw_mux("m7_alt_pll_ref_sel", base + 0x74, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MN_ANATOP_ARM_PLL_REF_SEL] =
+		imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MN_ANATOP_SYS_PLL3_REF_SEL] =
+		imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+
+	hws[IMX8MN_ANATOP_AUDIO_PLL1] =
+		imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel",
+				   base, &imx_1443x_pll);
+	hws[IMX8MN_ANATOP_AUDIO_PLL2] =
+		imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel",
+				   base + 0x14, &imx_1443x_pll);
+	hws[IMX8MN_ANATOP_VIDEO_PLL] =
+		imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel",
+				   base + 0x28, &imx_1443x_pll);
+	hws[IMX8MN_ANATOP_DRAM_PLL] =
+		imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50,
+				   &imx_1443x_dram_pll);
+	hws[IMX8MN_ANATOP_GPU_PLL] =
+		imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64,
+				   &imx_1416x_pll);
+	hws[IMX8MN_ANATOP_M7_ALT_PLL] =
+		imx_clk_hw_pll14xx("m7_alt_pll", "m7_alt_pll_ref_sel",
+				   base + 0x74, &imx_1416x_pll);
+	hws[IMX8MN_ANATOP_ARM_PLL] =
+		imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", base + 0x84,
+				   &imx_1416x_pll);
+	hws[IMX8MN_ANATOP_SYS_PLL1] = imx_clk_hw_fixed("sys_pll1", 800000000);
+	hws[IMX8MN_ANATOP_SYS_PLL2] = imx_clk_hw_fixed("sys_pll2", 1000000000);
+	hws[IMX8MN_ANATOP_SYS_PLL3] =
+		imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel", base + 0x114,
+				   &imx_1416x_pll);
+
+	/* PLL bypass out */
+	hws[IMX8MN_ANATOP_AUDIO_PLL1_BYPASS] =
+		imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1,
+				     audio_pll1_bypass_sels,
+				     ARRAY_SIZE(audio_pll1_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MN_ANATOP_AUDIO_PLL2_BYPASS] =
+		imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14, 16, 1,
+				     audio_pll2_bypass_sels,
+				     ARRAY_SIZE(audio_pll2_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MN_ANATOP_VIDEO_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28, 16, 1,
+				     video_pll_bypass_sels,
+				     ARRAY_SIZE(video_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MN_ANATOP_DRAM_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50, 16, 1,
+				     dram_pll_bypass_sels,
+				     ARRAY_SIZE(dram_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MN_ANATOP_GPU_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64, 28, 1,
+				     gpu_pll_bypass_sels,
+				     ARRAY_SIZE(gpu_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MN_ANATOP_M7_ALT_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("m7_alt_pll_bypass", base + 0x74, 28, 1,
+				     m7_alt_pll_bypass_sels,
+				     ARRAY_SIZE(m7_alt_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MN_ANATOP_ARM_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("arm_pll_bypass", base + 0x84, 28, 1,
+				     arm_pll_bypass_sels,
+				     ARRAY_SIZE(arm_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MN_ANATOP_SYS_PLL3_BYPASS] =
+		imx_clk_hw_mux_flags("sys_pll3_bypass", base + 0x114, 28, 1,
+				     sys_pll3_bypass_sels,
+				     ARRAY_SIZE(sys_pll3_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+
+	/* PLL out gate */
+	hws[IMX8MN_ANATOP_AUDIO_PLL1_OUT] =
+		imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass",
+				base, 13);
+	hws[IMX8MN_ANATOP_AUDIO_PLL2_OUT] =
+		imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass",
+				base + 0x14, 13);
+	hws[IMX8MN_ANATOP_VIDEO_PLL_OUT] =
+		imx_clk_hw_gate("video_pll_out", "video_pll_bypass",
+				base + 0x28, 13);
+	hws[IMX8MN_ANATOP_DRAM_PLL_OUT] =
+		imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass",
+				base + 0x50, 13);
+	hws[IMX8MN_ANATOP_GPU_PLL_OUT] =
+		imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass",
+				base + 0x64, 11);
+	hws[IMX8MN_ANATOP_M7_ALT_PLL_OUT] =
+		imx_clk_hw_gate("m7_alt_pll_out", "m7_alt_pll_bypass",
+				base + 0x74, 11);
+	hws[IMX8MN_ANATOP_ARM_PLL_OUT] =
+		imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass",
+				base + 0x84, 11);
+	hws[IMX8MN_ANATOP_SYS_PLL3_OUT] =
+		imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass",
+				base + 0x114, 11);
+
+	/* SYS PLL1 fixed output */
+	hws[IMX8MN_ANATOP_SYS_PLL1_OUT] =
+		imx_clk_hw_gate("sys_pll1_out", "sys_pll1", base + 0x94, 11);
+	hws[IMX8MN_ANATOP_SYS_PLL1_40M] =
+		imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
+	hws[IMX8MN_ANATOP_SYS_PLL1_80M] =
+		imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
+	hws[IMX8MN_ANATOP_SYS_PLL1_100M] =
+		imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
+	hws[IMX8MN_ANATOP_SYS_PLL1_133M] =
+		imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
+	hws[IMX8MN_ANATOP_SYS_PLL1_160M] =
+		imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
+	hws[IMX8MN_ANATOP_SYS_PLL1_200M] =
+		imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
+	hws[IMX8MN_ANATOP_SYS_PLL1_266M] =
+		imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
+	hws[IMX8MN_ANATOP_SYS_PLL1_400M] =
+		imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
+	hws[IMX8MN_ANATOP_SYS_PLL1_800M] =
+		imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
+
+	/* SYS PLL2 fixed output */
+	hws[IMX8MN_ANATOP_SYS_PLL2_OUT] =
+		imx_clk_hw_gate("sys_pll2_out", "sys_pll2", base + 0x104, 11);
+	hws[IMX8MN_ANATOP_SYS_PLL2_50M] =
+		imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
+	hws[IMX8MN_ANATOP_SYS_PLL2_100M] =
+		imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
+	hws[IMX8MN_ANATOP_SYS_PLL2_125M] =
+		imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
+	hws[IMX8MN_ANATOP_SYS_PLL2_166M] =
+		imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
+	hws[IMX8MN_ANATOP_SYS_PLL2_200M] =
+		imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
+	hws[IMX8MN_ANATOP_SYS_PLL2_250M] =
+		imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
+	hws[IMX8MN_ANATOP_SYS_PLL2_333M] =
+		imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
+	hws[IMX8MN_ANATOP_SYS_PLL2_500M] =
+		imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
+	hws[IMX8MN_ANATOP_SYS_PLL2_1000M] =
+		imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
+
+	hws[IMX8MN_ANATOP_CLK_CLKOUT1_SEL] =
+		imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4,
+				clkout_sels, ARRAY_SIZE(clkout_sels));
+	hws[IMX8MN_ANATOP_CLK_CLKOUT1_DIV] =
+		imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128,
+				   0, 4);
+	hws[IMX8MN_ANATOP_CLK_CLKOUT1] =
+		imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
+	hws[IMX8MN_ANATOP_CLK_CLKOUT2_SEL] =
+		imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4,
+				clkout_sels, ARRAY_SIZE(clkout_sels));
+	hws[IMX8MN_ANATOP_CLK_CLKOUT2_DIV] =
+		imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128,
+				   16, 4);
+	hws[IMX8MN_ANATOP_CLK_CLKOUT2] =
+		imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
+
+	imx_check_clk_hws(hws, IMX8MN_ANATOP_CLK_END);
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	if (ret < 0) {
+		imx_unregister_hw_clocks(hws, IMX8MN_ANATOP_CLK_END);
+		return dev_err_probe(dev, ret,
+				     "failed to register anatop clock provider\n");
+	}
+
+	dev_info(dev, "NXP i.MX8MN anatop clock driver probed\n");
+	return 0;
+}
+
+static const struct of_device_id imx8mn_anatop_clk_of_match[] = {
+	{ .compatible = "fsl,imx8mn-anatop" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, imx8mn_anatop_clk_of_match);
+
+static struct platform_driver imx8mn_anatop_clk_driver = {
+	.probe = imx8mn_anatop_clocks_probe,
+	.driver = {
+		.name = "imx8mn-anatop",
+		/*
+		 * Disable bind attributes: clocks are not removed and
+		 * reloading the driver will crash or break devices.
+		 */
+		.suppress_bind_attrs = true,
+		.of_match_table = imx8mn_anatop_clk_of_match,
+	},
+};
+
+module_platform_driver(imx8mn_anatop_clk_driver);
+
+MODULE_AUTHOR("Dario Binacchi <dario.binacchi@amarulasolutions.com>");
+MODULE_DESCRIPTION("NXP i.MX8MN anatop clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index ab77e148e70c..984331372139 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -24,16 +24,6 @@ static u32 share_count_disp;
 static u32 share_count_pdm;
 static u32 share_count_nand;
 
-static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
-static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
-static const char * const audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
-static const char * const video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
-static const char * const dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
-static const char * const gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
-static const char * const m7_alt_pll_bypass_sels[] = {"m7_alt_pll", "m7_alt_pll_ref_sel", };
-static const char * const arm_pll_bypass_sels[] = {"arm_pll", "arm_pll_ref_sel", };
-static const char * const sys_pll3_bypass_sels[] = {"sys_pll3", "sys_pll3_ref_sel", };
-
 static const char * const imx8mn_a53_sels[] = {"osc_24m", "arm_pll_out", "sys_pll2_500m",
 					       "sys_pll2_1000m", "sys_pll1_800m", "sys_pll1_400m",
 					       "audio_pll1_out", "sys_pll3_out", };
@@ -308,21 +298,20 @@ static const char * const imx8mn_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sy
 						 "sys_pll2_166m", "sys_pll3_out", "audio_pll1_out",
 						 "video_pll_out", "osc_32k", };
 
-static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
-					   "dummy", "dummy", "gpu_pll_out", "dummy",
-					   "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
-					   "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
-
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
 
 static int imx8mn_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
+	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
 	int ret;
 
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (WARN_ON(IS_ERR(base)))
+		return PTR_ERR(base);
+
 	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
 					  IMX8MN_CLK_END), GFP_KERNEL);
 	if (WARN_ON(!clk_hw_data))
@@ -331,99 +320,93 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	clk_hw_data->num = IMX8MN_CLK_END;
 	hws = clk_hw_data->hws;
 
-	hws[IMX8MN_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
-	hws[IMX8MN_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
-	hws[IMX8MN_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
+	anp = of_parse_phandle(np, "fsl,anatop", 0);
+	if (!anp) {
+		anp = of_find_compatible_node(NULL, NULL, "fsl,imx8mn-anatop");
+		if (!anp)
+			return dev_err_probe(dev, -ENODEV, "missing anatop\n");
+	}
+
+	of_node_put(anp);
+
+	hws[IMX8MN_CLK_DUMMY] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_DUMMY);
+	hws[IMX8MN_CLK_24M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_24M);
+	hws[IMX8MN_CLK_32K] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_32K);
 	hws[IMX8MN_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
 	hws[IMX8MN_CLK_EXT2] = imx_get_clk_hw_by_name(np, "clk_ext2");
 	hws[IMX8MN_CLK_EXT3] = imx_get_clk_hw_by_name(np, "clk_ext3");
 	hws[IMX8MN_CLK_EXT4] = imx_get_clk_hw_by_name(np, "clk_ext4");
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mn-anatop");
-	base = devm_of_iomap(dev, np, 0, NULL);
-	of_node_put(np);
-	if (WARN_ON(IS_ERR(base))) {
-		ret = PTR_ERR(base);
-		goto unregister_hws;
-	}
-
-	hws[IMX8MN_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MN_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MN_VIDEO_PLL_REF_SEL] = imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MN_DRAM_PLL_REF_SEL] = imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MN_GPU_PLL_REF_SEL] = imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MN_M7_ALT_PLL_REF_SEL] = imx_clk_hw_mux("m7_alt_pll_ref_sel", base + 0x74, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MN_ARM_PLL_REF_SEL] = imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-
-	hws[IMX8MN_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll);
-	hws[IMX8MN_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll);
-	hws[IMX8MN_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", base + 0x28, &imx_1443x_pll);
-	hws[IMX8MN_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll);
-	hws[IMX8MN_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64, &imx_1416x_pll);
-	hws[IMX8MN_M7_ALT_PLL] = imx_clk_hw_pll14xx("m7_alt_pll", "m7_alt_pll_ref_sel", base + 0x74, &imx_1416x_pll);
-	hws[IMX8MN_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", base + 0x84, &imx_1416x_pll);
-	hws[IMX8MN_SYS_PLL1] = imx_clk_hw_fixed("sys_pll1", 800000000);
-	hws[IMX8MN_SYS_PLL2] = imx_clk_hw_fixed("sys_pll2", 1000000000);
-	hws[IMX8MN_SYS_PLL3] = imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel", base + 0x114, &imx_1416x_pll);
+	hws[IMX8MN_AUDIO_PLL1_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL1_REF_SEL);
+	hws[IMX8MN_AUDIO_PLL2_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL2_REF_SEL);
+	hws[IMX8MN_VIDEO_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_VIDEO_PLL_REF_SEL);
+	hws[IMX8MN_DRAM_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_DRAM_PLL_REF_SEL);
+	hws[IMX8MN_GPU_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_GPU_PLL_REF_SEL);
+	hws[IMX8MN_M7_ALT_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_M7_ALT_PLL_REF_SEL);
+	hws[IMX8MN_ARM_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_ARM_PLL_REF_SEL);
+	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL3_REF_SEL);
+
+	hws[IMX8MN_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL1);
+	hws[IMX8MN_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL2);
+	hws[IMX8MN_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_VIDEO_PLL);
+	hws[IMX8MN_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_DRAM_PLL);
+	hws[IMX8MN_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_GPU_PLL);
+	hws[IMX8MN_M7_ALT_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_M7_ALT_PLL);
+	hws[IMX8MN_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_ARM_PLL);
+	hws[IMX8MN_SYS_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1);
+	hws[IMX8MN_SYS_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2);
+	hws[IMX8MN_SYS_PLL3] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL3);
 
 	/* PLL bypass out */
-	hws[IMX8MN_AUDIO_PLL1_BYPASS] = imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MN_AUDIO_PLL2_BYPASS] = imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14, 16, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MN_VIDEO_PLL_BYPASS] = imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28, 16, 1, video_pll_bypass_sels, ARRAY_SIZE(video_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MN_DRAM_PLL_BYPASS] = imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50, 16, 1, dram_pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MN_GPU_PLL_BYPASS] = imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64, 28, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MN_M7_ALT_PLL_BYPASS] = imx_clk_hw_mux_flags("m7_alt_pll_bypass", base + 0x74, 28, 1, m7_alt_pll_bypass_sels, ARRAY_SIZE(m7_alt_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MN_ARM_PLL_BYPASS] = imx_clk_hw_mux_flags("arm_pll_bypass", base + 0x84, 28, 1, arm_pll_bypass_sels, ARRAY_SIZE(arm_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MN_SYS_PLL3_BYPASS] = imx_clk_hw_mux_flags("sys_pll3_bypass", base + 0x114, 28, 1, sys_pll3_bypass_sels, ARRAY_SIZE(sys_pll3_bypass_sels), CLK_SET_RATE_PARENT);
+	hws[IMX8MN_AUDIO_PLL1_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL1_BYPASS);
+	hws[IMX8MN_AUDIO_PLL2_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL2_BYPASS);
+	hws[IMX8MN_VIDEO_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_VIDEO_PLL_BYPASS);
+	hws[IMX8MN_DRAM_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_DRAM_PLL_BYPASS);
+	hws[IMX8MN_GPU_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_GPU_PLL_BYPASS);
+	hws[IMX8MN_M7_ALT_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_M7_ALT_PLL_BYPASS);
+	hws[IMX8MN_ARM_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_ARM_PLL_BYPASS);
+	hws[IMX8MN_SYS_PLL3_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL3_BYPASS);
 
 	/* PLL out gate */
-	hws[IMX8MN_AUDIO_PLL1_OUT] = imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", base, 13);
-	hws[IMX8MN_AUDIO_PLL2_OUT] = imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", base + 0x14, 13);
-	hws[IMX8MN_VIDEO_PLL_OUT] = imx_clk_hw_gate("video_pll_out", "video_pll_bypass", base + 0x28, 13);
-	hws[IMX8MN_DRAM_PLL_OUT] = imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", base + 0x50, 13);
-	hws[IMX8MN_GPU_PLL_OUT] = imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", base + 0x64, 11);
-	hws[IMX8MN_M7_ALT_PLL_OUT] = imx_clk_hw_gate("m7_alt_pll_out", "m7_alt_pll_bypass", base + 0x74, 11);
-	hws[IMX8MN_ARM_PLL_OUT] = imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass", base + 0x84, 11);
-	hws[IMX8MN_SYS_PLL3_OUT] = imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass", base + 0x114, 11);
+	hws[IMX8MN_AUDIO_PLL1_OUT] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL1_OUT);
+	hws[IMX8MN_AUDIO_PLL2_OUT] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL2_OUT);
+	hws[IMX8MN_VIDEO_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_VIDEO_PLL_OUT);
+	hws[IMX8MN_DRAM_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_DRAM_PLL_OUT);
+	hws[IMX8MN_GPU_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_GPU_PLL_OUT);
+	hws[IMX8MN_M7_ALT_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_M7_ALT_PLL_OUT);
+	hws[IMX8MN_ARM_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_ARM_PLL_OUT);
+	hws[IMX8MN_SYS_PLL3_OUT] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL3_OUT);
 
 	/* SYS PLL1 fixed output */
-	hws[IMX8MN_SYS_PLL1_OUT] = imx_clk_hw_gate("sys_pll1_out", "sys_pll1", base + 0x94, 11);
-	hws[IMX8MN_SYS_PLL1_40M] = imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
-	hws[IMX8MN_SYS_PLL1_80M] = imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
-	hws[IMX8MN_SYS_PLL1_100M] = imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
-	hws[IMX8MN_SYS_PLL1_133M] = imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
-	hws[IMX8MN_SYS_PLL1_160M] = imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
-	hws[IMX8MN_SYS_PLL1_200M] = imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
-	hws[IMX8MN_SYS_PLL1_266M] = imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
-	hws[IMX8MN_SYS_PLL1_400M] = imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
-	hws[IMX8MN_SYS_PLL1_800M] = imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
+	hws[IMX8MN_SYS_PLL1_OUT] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1_OUT);
+	hws[IMX8MN_SYS_PLL1_40M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1_40M);
+	hws[IMX8MN_SYS_PLL1_80M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1_80M);
+	hws[IMX8MN_SYS_PLL1_100M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1_100M);
+	hws[IMX8MN_SYS_PLL1_133M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1_133M);
+	hws[IMX8MN_SYS_PLL1_160M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1_160M);
+	hws[IMX8MN_SYS_PLL1_200M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1_200M);
+	hws[IMX8MN_SYS_PLL1_266M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1_266M);
+	hws[IMX8MN_SYS_PLL1_400M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1_400M);
+	hws[IMX8MN_SYS_PLL1_800M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL1_800M);
 
 	/* SYS PLL2 fixed output */
-	hws[IMX8MN_SYS_PLL2_OUT] = imx_clk_hw_gate("sys_pll2_out", "sys_pll2", base + 0x104, 11);
-	hws[IMX8MN_SYS_PLL2_50M] = imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
-	hws[IMX8MN_SYS_PLL2_100M] = imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
-	hws[IMX8MN_SYS_PLL2_125M] = imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
-	hws[IMX8MN_SYS_PLL2_166M] = imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
-	hws[IMX8MN_SYS_PLL2_200M] = imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
-	hws[IMX8MN_SYS_PLL2_250M] = imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
-	hws[IMX8MN_SYS_PLL2_333M] = imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
-	hws[IMX8MN_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
-	hws[IMX8MN_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
-
-	hws[IMX8MN_CLK_CLKOUT1_SEL] = imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
-	hws[IMX8MN_CLK_CLKOUT1_DIV] = imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128, 0, 4);
-	hws[IMX8MN_CLK_CLKOUT1] = imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
-	hws[IMX8MN_CLK_CLKOUT2_SEL] = imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
-	hws[IMX8MN_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128, 16, 4);
-	hws[IMX8MN_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
-
-	np = dev->of_node;
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (WARN_ON(IS_ERR(base))) {
-		ret = PTR_ERR(base);
-		goto unregister_hws;
-	}
+	hws[IMX8MN_SYS_PLL2_OUT] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2_OUT);
+	hws[IMX8MN_SYS_PLL2_50M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2_50M);
+	hws[IMX8MN_SYS_PLL2_100M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2_100M);
+	hws[IMX8MN_SYS_PLL2_125M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2_125M);
+	hws[IMX8MN_SYS_PLL2_166M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2_166M);
+	hws[IMX8MN_SYS_PLL2_200M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2_200M);
+	hws[IMX8MN_SYS_PLL2_250M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2_250M);
+	hws[IMX8MN_SYS_PLL2_333M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2_333M);
+	hws[IMX8MN_SYS_PLL2_500M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2_500M);
+	hws[IMX8MN_SYS_PLL2_1000M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL2_1000M);
+
+	hws[IMX8MN_CLK_CLKOUT1_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_CLKOUT1_SEL);
+	hws[IMX8MN_CLK_CLKOUT1_DIV] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_CLKOUT1_DIV);
+	hws[IMX8MN_CLK_CLKOUT1] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_CLKOUT1);
+	hws[IMX8MN_CLK_CLKOUT2_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_CLKOUT2_SEL);
+	hws[IMX8MN_CLK_CLKOUT2_DIV] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_CLKOUT2_DIV);
+	hws[IMX8MN_CLK_CLKOUT2] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_CLKOUT2);
 
 	/* CORE */
 	hws[IMX8MN_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mn_a53_sels, base + 0x8000);
@@ -599,18 +582,15 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 
 	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
 	if (ret < 0) {
-		dev_err(dev, "failed to register hws for i.MX8MN\n");
-		goto unregister_hws;
+		imx_unregister_hw_clocks(hws, IMX8MN_CLK_END);
+		return dev_err_probe(dev, ret,
+				     "failed to register hws for i.MX8MN\n");
 	}
 
 	imx_register_uart_clocks();
 
+	dev_info(dev, "NXP i.MX8MN ccm clock driver probed\n");
 	return 0;
-
-unregister_hws:
-	imx_unregister_hw_clocks(hws, IMX8MN_CLK_END);
-
-	return ret;
 }
 
 static const struct of_device_id imx8mn_clk_of_match[] = {
-- 
2.43.0


