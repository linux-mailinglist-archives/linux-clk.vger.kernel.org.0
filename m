Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 263B86FCE3
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jul 2019 11:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbfGVJvS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Jul 2019 05:51:18 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50960 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729460AbfGVJvG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jul 2019 05:51:06 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so34504309wml.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2019 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+f39f/vO7ZpFkzWKsXEJhzhzg/ZN6DlIsY5Iay+VBRo=;
        b=htZvDSRmT6jMXiu+Kg9emxAFoSbpATwOwuK0cNLzVzaiGKLnsnOA2XmQ2RVHdUCUp5
         FdkcTS94h30us1MuHruEE+k/Id0U24bnRRRv58Q8nUy13EA8hTGTQK5E1xzz7YzZN4F3
         ieG/UO+1w3yzdvC2LVnQYulswKw3JEY8e4r8KZ96CHKTPL0yeYG1/hssSbiFPcug93iA
         JekJkwn/2ESSPsvCwKi5qdXqDkFKV+ps3uvjwo6gJrUIRezBoqAYxcZDqoGlIiQHqtbh
         b71qyRpzA5z/tY8lgHFXK5sAOXi2iv4Xhz96QUjaW6nMuOZVK6tymStWgS8qwYW/7fQS
         o5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+f39f/vO7ZpFkzWKsXEJhzhzg/ZN6DlIsY5Iay+VBRo=;
        b=BBFdTA9FCt1tDpYkNsA5uTe5py5lCyl5jVQc7yKcSb3BmRd8DoovI6KePCgcOyBaSf
         ttRsufpQXKSmOF9U9oYY3nFnEgDj1broK09N8lm/QUpIDZ63eCPJnfiRpiY2g6+Yxl+0
         /YFN8NiundbqLX+LD2QYwzcmd/TKQ6r8eQiKOIn+yc+s7r8IPcfft+WeUUUQ5o0KSxYA
         6JCxje/7bJgKc/BKIPK9fz7Zw+61eSnjSWLhI52jhVkhR9WlZ1aB+RAw0Z4jTw7SmVNu
         +LS49LdUi2zGzpwUO5LLGarwp3r17TVxSA9mbwKLFjgBDiDr73oqIe1vUqmYogLPAbbD
         Fl4A==
X-Gm-Message-State: APjAAAWuZGhwoW05i9QBC/23JH9EZXwcteIrh3Fv85irVI4SXYSaC/MP
        KmcXGydJL96epfPh6SFN4tkk+A==
X-Google-Smtp-Source: APXvYqwwj/UlXQVUKhMKbdQjX82TUkiVIMSZYM6b25puvxqYcGVmxB0FMrhP37zUSRCkIXwb7Mp1+w==
X-Received: by 2002:a1c:ef0c:: with SMTP id n12mr60072852wmh.132.1563789064707;
        Mon, 22 Jul 2019 02:51:04 -0700 (PDT)
Received: from pop-os.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o3sm31050738wrs.59.2019.07.22.02.51.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 02:51:04 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     khilman@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        baylibre-upstreaming@groups.io,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 4/4] clk: meson: remove ao input bypass clocks
Date:   Mon, 22 Jul 2019 11:50:53 +0200
Message-Id: <20190722095053.14104-5-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722095053.14104-1-amergnat@baylibre.com>
References: <20190722095053.14104-1-amergnat@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

During probe, bypass clocks (i.e. ao-in-xtal) are made from device-tree
inputs to provide input clocks which can be access through global name.
The cons of this method are the duplicated clocks, means more string
comparison.

Specify parent directly with device-tree clock name.

Function to regiter bypass clocks is removed.

Input parameters from meson aoclk data structure are deprecated and then
deleted since all aoclk files are migrated.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/meson/Kconfig       |  1 -
 drivers/clk/meson/meson-aoclk.c | 37 ---------------------------------
 drivers/clk/meson/meson-aoclk.h |  8 -------
 3 files changed, 46 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index ee0b84b6b329..178ee72ba4bc 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -33,7 +33,6 @@ config COMMON_CLK_MESON_VID_PLL_DIV
 config COMMON_CLK_MESON_AO_CLKC
 	tristate
 	select COMMON_CLK_MESON_REGMAP
-	select COMMON_CLK_MESON_INPUT
 	select RESET_CONTROLLER
 
 config COMMON_CLK_MESON_EE_CLKC
diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index b67951909e04..bf8bea675d24 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -17,8 +17,6 @@
 #include <linux/slab.h>
 #include "meson-aoclk.h"
 
-#include "clk-input.h"
-
 static int meson_aoclk_do_reset(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
@@ -33,37 +31,6 @@ static const struct reset_control_ops meson_aoclk_reset_ops = {
 	.reset = meson_aoclk_do_reset,
 };
 
-static int meson_aoclkc_register_inputs(struct device *dev,
-					struct meson_aoclk_data *data)
-{
-	struct clk_hw *hw;
-	char *str;
-	int i;
-
-	for (i = 0; i < data->num_inputs; i++) {
-		const struct meson_aoclk_input *in = &data->inputs[i];
-
-		str = kasprintf(GFP_KERNEL, "%s%s", data->input_prefix,
-				in->name);
-		if (!str)
-			return -ENOMEM;
-
-		hw = meson_clk_hw_register_input(dev, in->name, str, 0);
-		kfree(str);
-
-		if (IS_ERR(hw)) {
-			if (!in->required && PTR_ERR(hw) == -ENOENT)
-				continue;
-			else if (PTR_ERR(hw) != -EPROBE_DEFER)
-				dev_err(dev, "failed to register input %s\n",
-					in->name);
-			return PTR_ERR(hw);
-		}
-	}
-
-	return 0;
-}
-
 int meson_aoclkc_probe(struct platform_device *pdev)
 {
 	struct meson_aoclk_reset_controller *rstc;
@@ -86,10 +53,6 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	ret = meson_aoclkc_register_inputs(dev, data);
-	if (ret)
-		return ret;
-
 	/* Reset Controller */
 	rstc->data = data;
 	rstc->regmap = regmap;
diff --git a/drivers/clk/meson/meson-aoclk.h b/drivers/clk/meson/meson-aoclk.h
index 999cde3868f7..605b43855a69 100644
--- a/drivers/clk/meson/meson-aoclk.h
+++ b/drivers/clk/meson/meson-aoclk.h
@@ -18,20 +18,12 @@
 
 #include "clk-regmap.h"
 
-struct meson_aoclk_input {
-	const char *name;
-	bool required;
-};
-
 struct meson_aoclk_data {
 	const unsigned int			reset_reg;
 	const int				num_reset;
 	const unsigned int			*reset;
 	const int				num_clks;
 	struct clk_regmap			**clks;
-	const int				num_inputs;
-	const struct meson_aoclk_input		*inputs;
-	const char				*input_prefix;
 	const struct clk_hw_onecell_data	*hw_data;
 };
 
-- 
2.17.1

