Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBF2372949
	for <lists+linux-clk@lfdr.de>; Tue,  4 May 2021 13:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhEDLB3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 4 May 2021 07:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhEDLBN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 May 2021 07:01:13 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BFFC061763
        for <linux-clk@vger.kernel.org>; Tue,  4 May 2021 04:00:18 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id x188so4992082pfd.7
        for <linux-clk@vger.kernel.org>; Tue, 04 May 2021 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vEh7zwdmOqzz+rJcxXSAwcExQpnY0trAqavM2fyHl9I=;
        b=kyg/bynLvk0jET8a+V5hi4Gvf86iFQo8DVyd0B15ckMGCf9xETbjcI2IBy11aPABOw
         buKcGfKotWyiKb3dWMlHj9J0RaQfH/b9UGO9b6lUYCIhSK8FFBnxzYYA+lT8IH1aId7F
         NtlMVBPTyIj7W/bP2WiZRYcQdCaEJMKhxPLeGfWSl5DpiTF75lCSwaJft6TMD4+bYdSj
         5tPYh+9ija08bz2mycQyKBIdLjJoS5LKXzE/wX5gaKNjBQVRAgnd21f436uhlcW2S9Tt
         UhAaK13x1mH2mlnjVPqCC8iPwNeTquaRQp/VF7k90FY79FKfkhHXosxZLrNZleIXSyEy
         ozDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vEh7zwdmOqzz+rJcxXSAwcExQpnY0trAqavM2fyHl9I=;
        b=ss07y0TW4RqJL+RZGlnt/or4bd+XXuSyuQGO8t8EG5bi5KSxzUV1vSsecEy35et/rb
         pg1FCQx8I+Qd5jOWjw7aL0KCTk+cR9H6XVGXQ1+8+usUkGQEr4JBbYswjjUly2ErFO/7
         4W2Igf4JH/8zbyqWejM2T9Id/VOjN75ALeUIeOW/iHk2fYyF97GW9r9Jn1zGzhFxl3Dw
         SG4Kqwt6zIjFYm1LJekCxv0eluYQSTkOQiyl50vmZd8h75LmQUzliNMcIQD74VbwDTwQ
         P5YwcRtb/aIb6G0965pQtekT1i/M7EdRD3yajYxVkWYEps+O5nh7OpocwHDIqndxBfTM
         kw4Q==
X-Gm-Message-State: AOAM532kGgGIDpiERsblRpWux1do/dBbb3zydPQAhWNkcbesFrbiMzxW
        GhYrRG5MV9CjItPIjoSPxk1Z3A==
X-Google-Smtp-Source: ABdhPJxrORUPctm64X7uKK0XRL2WvytiVqXGSwUmzPYSv++RL5cDleKp7rWm0/bin5yug/JC9u1j+w==
X-Received: by 2002:a65:4485:: with SMTP id l5mr22501162pgq.209.1620126018073;
        Tue, 04 May 2021 04:00:18 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id k17sm11762529pfa.68.2021.05.04.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 04:00:17 -0700 (PDT)
From:   Greentime Hu <greentime.hu@sifive.com>
To:     greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
        erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
        robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
        sboyd@kernel.org, lorenzo.pieralisi@arm.com,
        p.zabel@pengutronix.de, alex.dewar90@gmail.com,
        khilman@baylibre.com, hayashi.kunihiko@socionext.com,
        vidyas@nvidia.com, jh80.chung@samsung.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v6 1/6] clk: sifive: Add pcie_aux clock in prci driver for PCIe driver
Date:   Tue,  4 May 2021 18:59:35 +0800
Message-Id: <20210504105940.100004-2-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504105940.100004-1-greentime.hu@sifive.com>
References: <20210504105940.100004-1-greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We add pcie_aux clock in this patch so that pcie driver can use
clk_prepare_enable() and clk_disable_unprepare() to enable and disable
pcie_aux clock.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/sifive/fu740-prci.c               | 11 +++++
 drivers/clk/sifive/fu740-prci.h               |  2 +-
 drivers/clk/sifive/sifive-prci.c              | 41 +++++++++++++++++++
 drivers/clk/sifive/sifive-prci.h              |  9 ++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  1 +
 5 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
index 764d1097aa51..53f6e00a03b9 100644
--- a/drivers/clk/sifive/fu740-prci.c
+++ b/drivers/clk/sifive/fu740-prci.c
@@ -72,6 +72,12 @@ static const struct clk_ops sifive_fu740_prci_hfpclkplldiv_clk_ops = {
 	.recalc_rate = sifive_prci_hfpclkplldiv_recalc_rate,
 };
 
+static const struct clk_ops sifive_fu740_prci_pcie_aux_clk_ops = {
+	.enable = sifive_prci_pcie_aux_clock_enable,
+	.disable = sifive_prci_pcie_aux_clock_disable,
+	.is_enabled = sifive_prci_pcie_aux_clock_is_enabled,
+};
+
 /* List of clock controls provided by the PRCI */
 struct __prci_clock __prci_init_clocks_fu740[] = {
 	[PRCI_CLK_COREPLL] = {
@@ -120,4 +126,9 @@ struct __prci_clock __prci_init_clocks_fu740[] = {
 		.parent_name = "hfpclkpll",
 		.ops = &sifive_fu740_prci_hfpclkplldiv_clk_ops,
 	},
+	[PRCI_CLK_PCIE_AUX] = {
+		.name = "pcie_aux",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu740_prci_pcie_aux_clk_ops,
+	},
 };
diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
index 13ef971f7764..511a0bf7ba2b 100644
--- a/drivers/clk/sifive/fu740-prci.h
+++ b/drivers/clk/sifive/fu740-prci.h
@@ -9,7 +9,7 @@
 
 #include "sifive-prci.h"
 
-#define NUM_CLOCK_FU740	8
+#define NUM_CLOCK_FU740	9
 
 extern struct __prci_clock __prci_init_clocks_fu740[NUM_CLOCK_FU740];
 
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index 1490b01ce629..9997a3fa4a38 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -453,6 +453,47 @@ void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct __prci_data *pd)
 	r = __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET);	/* barrier */
 }
 
+/* PCIE AUX clock APIs for enable, disable. */
+int sifive_prci_pcie_aux_clock_is_enabled(struct clk_hw *hw)
+{
+	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
+	struct __prci_data *pd = pc->pd;
+	u32 r;
+
+	r = __prci_readl(pd, PRCI_PCIE_AUX_OFFSET);
+
+	if (r & PRCI_PCIE_AUX_EN_MASK)
+		return 1;
+	else
+		return 0;
+}
+
+int sifive_prci_pcie_aux_clock_enable(struct clk_hw *hw)
+{
+	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
+	struct __prci_data *pd = pc->pd;
+	u32 r __maybe_unused;
+
+	if (sifive_prci_pcie_aux_clock_is_enabled(hw))
+		return 0;
+
+	__prci_writel(1, PRCI_PCIE_AUX_OFFSET, pd);
+	r = __prci_readl(pd, PRCI_PCIE_AUX_OFFSET);	/* barrier */
+
+	return 0;
+}
+
+void sifive_prci_pcie_aux_clock_disable(struct clk_hw *hw)
+{
+	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
+	struct __prci_data *pd = pc->pd;
+	u32 r __maybe_unused;
+
+	__prci_writel(0, PRCI_PCIE_AUX_OFFSET, pd);
+	r = __prci_readl(pd, PRCI_PCIE_AUX_OFFSET);	/* barrier */
+
+}
+
 /**
  * __prci_register_clocks() - register clock controls in the PRCI
  * @dev: Linux struct device
diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
index dbdbd1722688..022c67cf053c 100644
--- a/drivers/clk/sifive/sifive-prci.h
+++ b/drivers/clk/sifive/sifive-prci.h
@@ -67,6 +67,11 @@
 #define PRCI_DDRPLLCFG1_CKE_SHIFT	31
 #define PRCI_DDRPLLCFG1_CKE_MASK	(0x1 << PRCI_DDRPLLCFG1_CKE_SHIFT)
 
+/* PCIEAUX */
+#define PRCI_PCIE_AUX_OFFSET		0x14
+#define PRCI_PCIE_AUX_EN_SHIFT		0
+#define PRCI_PCIE_AUX_EN_MASK		(0x1 << PRCI_PCIE_AUX_EN_SHIFT)
+
 /* GEMGXLPLLCFG0 */
 #define PRCI_GEMGXLPLLCFG0_OFFSET	0x1c
 #define PRCI_GEMGXLPLLCFG0_DIVR_SHIFT	0
@@ -296,4 +301,8 @@ unsigned long sifive_prci_tlclksel_recalc_rate(struct clk_hw *hw,
 unsigned long sifive_prci_hfpclkplldiv_recalc_rate(struct clk_hw *hw,
 						   unsigned long parent_rate);
 
+int sifive_prci_pcie_aux_clock_is_enabled(struct clk_hw *hw);
+int sifive_prci_pcie_aux_clock_enable(struct clk_hw *hw);
+void sifive_prci_pcie_aux_clock_disable(struct clk_hw *hw);
+
 #endif /* __SIFIVE_CLK_SIFIVE_PRCI_H */
diff --git a/include/dt-bindings/clock/sifive-fu740-prci.h b/include/dt-bindings/clock/sifive-fu740-prci.h
index cd7706ea5677..7899b7fee7db 100644
--- a/include/dt-bindings/clock/sifive-fu740-prci.h
+++ b/include/dt-bindings/clock/sifive-fu740-prci.h
@@ -19,5 +19,6 @@
 #define PRCI_CLK_CLTXPLL	       5
 #define PRCI_CLK_TLCLK		       6
 #define PRCI_CLK_PCLK		       7
+#define PRCI_CLK_PCIE_AUX	       8
 
 #endif	/* __DT_BINDINGS_CLOCK_SIFIVE_FU740_PRCI_H */
-- 
2.31.1

