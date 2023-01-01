Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84DC065AAD9
	for <lists+linux-clk@lfdr.de>; Sun,  1 Jan 2023 18:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbjAAR55 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 1 Jan 2023 12:57:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjAAR5z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 Jan 2023 12:57:55 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F8A2DC8
        for <linux-clk@vger.kernel.org>; Sun,  1 Jan 2023 09:57:53 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id jo4so62252985ejb.7
        for <linux-clk@vger.kernel.org>; Sun, 01 Jan 2023 09:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzWgtinayzWqOkE2ijmFHmqOXIKDSib2Is7Zd5a35gQ=;
        b=EM/uGHg2iYqIbRUhx0y9T0X9TCSTDyC4lib+zCHiZaCDLXVtUn4+nGN6OCYp+Zq0Zu
         wQYz67wT2i0DIFarnzNY3xkk/gfFjvP6BjiDenOX+PeFdg5f6ocLZ0RLtt52kWyEx7KK
         3hkBMVPRt1+K+/cTaZM30hxlJ2KUehDqTEJIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzWgtinayzWqOkE2ijmFHmqOXIKDSib2Is7Zd5a35gQ=;
        b=nneczhS9S3HymiNwPw1uaPqquehGOa73y6dPZbJa+coKbgeNR5TAtqdyN9QhKPrZLf
         TJTiW8oEzNPlPBYM8pHOBu5bzZ6M4oDx18h54oBSR8cZ4nY0tqpty0qk/mldqEBknXQL
         XsChaEwG5YA5wE7bxH7g3uuChkQczuI65M3SCbmbL5NVYMpIRcSLoPcXn3FefRidtmxh
         ybGtYX3U5v7pBYiAhkF8LB0Ie8Wx0ebRAhFhbB4qzJ5c6H+DAbkQZ14lUaCJ4iDocX5x
         WuGW4j7GtuzR8ZxlYzmILSyGRPup3FubCiOnrgNvuTQTlR0rYQlSGWzVdDl9qi+WfXE1
         iu6w==
X-Gm-Message-State: AFqh2kr1Rz8Nl2CC9ymxC1y8Y9CFx1HQ76rTcV+o+5qox4ceUzs1poWR
        GLzQm6z6G2p41N86LdJZUUWulQ==
X-Google-Smtp-Source: AMrXdXtXQXtP+JRZ2PCIzEppWci1rqIph2WNNWQGjgW1m5qyvhjqMjB2g1RBlEZ/fryZ0lH5A+bnYA==
X-Received: by 2002:a17:906:38d9:b0:84b:8885:9868 with SMTP id r25-20020a17090638d900b0084b88859868mr31536688ejd.58.1672595872816;
        Sun, 01 Jan 2023 09:57:52 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-80-180-23-57.retail.telecomitalia.it. [80.180.23.57])
        by smtp.gmail.com with ESMTPSA id q2-20020a1709063d4200b0082ddfb47d06sm12273018ejf.148.2023.01.01.09.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:57:52 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     angelo@amarulasolutions.com, michael@amarulasolutions.com,
        tommaso.merciai@amarulasolutions.com,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-amarula@amarulasolutions.com, anthony@amarulasolutions.com,
        jagan@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [RFC PATCH v2 04/11] clk: imx8mn: add mux driver
Date:   Sun,  1 Jan 2023 18:57:33 +0100
Message-Id: <20230101175740.1010258-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230101175740.1010258-1-dario.binacchi@amarulasolutions.com>
References: <20230101175740.1010258-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patch adds support for imx8mn mux clocks to be initialized directly
from the device tree. Currently all i.MX mux clocks are initialized by
legacy code with hardwired parameters. This approach has generated setup
functions with unclear names:

git grep "#define imx_clk_hw_mux" drivers/clk/imx/clk.h
drivers/clk/imx/clk.h:#define imx_clk_hw_mux2(name, reg, shift, width, parents, num_parents) \
drivers/clk/imx/clk.h:#define imx_clk_hw_mux(name, reg, shift, width, parents, num_parents) \
drivers/clk/imx/clk.h:#define imx_clk_hw_mux_flags(name, reg, shift, width, parents, num_parents, flags) \
drivers/clk/imx/clk.h:#define imx_clk_hw_mux_ldb(name, reg, shift, width, parents, num_parents) \
drivers/clk/imx/clk.h:#define imx_clk_hw_mux2_flags(name, reg, shift, width, parents, num_parents, flags) \

So, let's start with this specific clock driver and hope that other
variants can be handled in the future, causing the legacy code to be
removed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/Makefile  |   1 +
 drivers/clk/imx/clk-mux.c | 258 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 259 insertions(+)
 create mode 100644 drivers/clk/imx/clk-mux.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 72e1f08d49dc..1cffc5bebbe1 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -15,6 +15,7 @@ mxc-clk-objs += clk-gate.o
 mxc-clk-objs += clk-gate2.o
 mxc-clk-objs += clk-gate-93.o
 mxc-clk-objs += clk-gate-exclusive.o
+mxc-clk-objs += clk-mux.o
 mxc-clk-objs += clk-pfd.o
 mxc-clk-objs += clk-pfdv2.o
 mxc-clk-objs += clk-pllv1.o
diff --git a/drivers/clk/imx/clk-mux.c b/drivers/clk/imx/clk-mux.c
new file mode 100644
index 000000000000..426738d25582
--- /dev/null
+++ b/drivers/clk/imx/clk-mux.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Amarula Solutions
+ *
+ * Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/regmap.h>
+
+#include "clk.h"
+
+#undef pr_fmt
+#define pr_fmt(fmt) "%s: " fmt, __func__
+
+#define to_clk_imx_mux(_hw) container_of(_hw, struct clk_imx_mux, hw)
+
+struct clk_imx_mux {
+	struct clk_hw hw;
+	struct imx_clk_reg reg;
+	u32 mask;
+	u8 shift;
+	u8 saved_parent;
+};
+
+static int imx_clk_mux_write(const struct imx_clk_reg *reg, u32 val)
+{
+	int ret = 0;
+
+	if (reg->base) {
+		writel(val, reg->base + reg->offset);
+	} else if (reg->regmap) {
+		ret = regmap_write(reg->regmap, reg->offset, val);
+	} else {
+		pr_err("memory address not set\n");
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+static int imx_clk_mux_read(const struct imx_clk_reg *reg, u32 *val)
+{
+	int ret = 0;
+
+	if (reg->base) {
+		*val = readl(reg->base + reg->offset);
+	} else if (reg->regmap) {
+		ret = regmap_read(reg->regmap, reg->offset, val);
+	} else {
+		pr_err("memory address not set\n");
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+static u8 imx_clk_mux_get_parent(struct clk_hw *hw)
+{
+
+	struct clk_imx_mux *mux = to_clk_imx_mux(hw);
+	int num_parents = clk_hw_get_num_parents(hw);
+	unsigned int val;
+	int ret;
+
+	ret = imx_clk_mux_read(&mux->reg, &val);
+	if (ret)
+		return ret;
+
+	val = (val >> mux->shift) && mux->mask;
+
+	if (val >= num_parents)
+		return -EINVAL;
+
+	return val;
+}
+
+static int imx_clk_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_imx_mux *mux = to_clk_imx_mux(hw);
+	unsigned int val;
+	int ret;
+
+	ret = imx_clk_mux_read(&mux->reg, &val);
+	if (ret)
+		return ret;
+
+	val &= ~(mux->mask << mux->shift);
+	val |= index << mux->shift;
+	return imx_clk_mux_write(&mux->reg, val);
+}
+
+/**
+ * imx_clk_mux_save_context - Save the parent selcted in the mux
+ * @hw: pointer  struct clk_hw
+ *
+ * Save the parent mux value.
+ */
+static int imx_clk_mux_save_context(struct clk_hw *hw)
+{
+	struct clk_imx_mux *mux = to_clk_imx_mux(hw);
+
+	mux->saved_parent = imx_clk_mux_get_parent(hw);
+	return 0;
+}
+
+/**
+ * imx_clk_mux_restore_context - Restore the parent in the mux
+ * @hw: pointer  struct clk_hw
+ *
+ * Restore the saved parent mux value.
+ */
+static void imx_clk_mux_restore_context(struct clk_hw *hw)
+{
+	struct clk_imx_mux *mux = to_clk_imx_mux(hw);
+
+	imx_clk_mux_set_parent(hw, mux->saved_parent);
+}
+
+const struct clk_ops imx_clk_mux_ops = {
+	.get_parent = imx_clk_mux_get_parent,
+	.set_parent = imx_clk_mux_set_parent,
+	.determine_rate = __clk_mux_determine_rate,
+	.save_context = imx_clk_mux_save_context,
+	.restore_context = imx_clk_mux_restore_context,
+};
+
+static void imx_clk_hw_unregister_mux(struct clk_hw *hw)
+{
+	struct clk_imx_mux *mux = to_clk_imx_mux(hw);
+
+	clk_hw_unregister(hw);
+	kfree(mux);
+}
+
+static struct clk_hw *imx_clk_hw_register_mux(struct device_node *node,
+					      const char *name,
+					      const char * const *parent_names,
+					      u8 num_parents,
+					      unsigned long flags,
+					      struct imx_clk_reg *reg, u8 shift,
+					      u32 mask)
+{
+	struct clk_init_data init = { NULL };
+	struct clk_imx_mux *mux;
+	struct clk_hw *hw;
+
+	int ret;
+
+	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.flags = flags;
+	init.ops = &imx_clk_mux_ops;
+	init.parent_names = parent_names;
+	init.num_parents = num_parents;
+
+	/* struct clk_mux assignments */
+	memcpy(&mux->reg, reg, sizeof(*reg));
+	mux->hw.init = &init;
+
+	hw = &mux->hw;
+	ret = of_clk_hw_register(node, hw);
+	if (ret) {
+		kfree(mux);
+		return ERR_PTR(ret);
+	}
+
+	return hw;
+}
+
+/**
+ * of_imx_mux_clk_setup() - Setup function for imx mux clock
+ * @node:	device node for the clock
+ */
+static void __init of_imx_mux_clk_setup(struct device_node *node)
+{
+	struct clk_hw *hw;
+	unsigned int num_parents;
+	const char **parent_names;
+	const char *name = node->name;
+	struct imx_clk_reg reg = {};
+	u32 shift = 0;
+	u32 flags = CLK_SET_RATE_NO_REPARENT;
+	u32 val;
+	u32 mask;
+
+	reg.regmap = syscon_regmap_lookup_by_phandle(node, "fsl,anatop");
+	if (!IS_ERR(reg.regmap)) {
+		if (of_property_read_u32_index(node, "fsl,anatop", 1, &val)) {
+			pr_err("missing register offset for %pOFn\n", node);
+			return;
+		}
+
+		reg.offset = val;
+	} else {
+		reg.base = of_iomap(node, 0);
+		if (IS_ERR(reg.base)) {
+			pr_err("failed to get register address for %pOFn\n",
+			       node);
+			return;
+		}
+	}
+
+	num_parents = of_clk_get_parent_count(node);
+	if (num_parents < 2) {
+		pr_err("%pOFn must have parents\n", node);
+		return;
+	}
+
+	parent_names = kzalloc((sizeof(char *) * num_parents), GFP_KERNEL);
+	if (!parent_names)
+		return;
+
+	of_clk_parent_fill(node, parent_names, num_parents);
+
+	of_property_read_u32(node, "fsl,bit-shift", &shift);
+
+	if (of_property_read_bool(node, "fsl,is-critical"))
+		flags |= CLK_IS_CRITICAL;
+
+	if (of_property_read_bool(node, "fsl,ops-parent-enable"))
+		flags |= CLK_OPS_PARENT_ENABLE;
+
+	if (of_property_read_bool(node, "fsl,set-rate-parent"))
+		flags |= CLK_SET_RATE_PARENT;
+
+	/* Generate bit-mask based on parent info */
+	mask = num_parents - 1;
+	mask = (1 << fls(mask)) - 1;
+
+	of_property_read_string(node, "clock-output-names", &name);
+
+	hw = imx_clk_hw_register_mux(node, name, parent_names, num_parents,
+				     flags, &reg, shift, mask);
+	if (IS_ERR(hw))
+		goto free_parent_names;
+
+	if (of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw)) {
+		imx_clk_hw_unregister_mux(hw);
+		goto free_parent_names;
+	}
+
+	pr_debug("name: %s, offset: 0x%x, shift: %d, mask: 0x%x\n", name,
+		 reg.offset, shift, mask);
+
+free_parent_names:
+	kfree(parent_names);
+}
+CLK_OF_DECLARE(fsl_imx8mn_mux_clk, "fsl,imx8mn-mux-clock",
+	       of_imx_mux_clk_setup);
-- 
2.32.0

