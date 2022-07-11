Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE56E568C2F
	for <lists+linux-clk@lfdr.de>; Wed,  6 Jul 2022 17:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbiGFPEm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Jul 2022 11:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbiGFPEl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 11:04:41 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56B115FC3
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 08:04:39 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id n185so9000581wmn.4
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5MyzPstAwbNGZEWJRgSFYxiR0DFtAmFf/jRZizSuqcw=;
        b=mj3LRXQXQS6StvqGOZV6yugtZVTIN9JdnhqyAg3ppfci1KsgUElEnrP6nbBHrPtEwH
         mrP5sMNlNA8NxVxcnRABA1NRUhD6tmmG8o1G8UbZxJrTsmEBs+oVEbKLaRUVKskBQ8Ay
         T+jEJz0gUQ/D7w/xPBe/QXvhce2vHW7Sd7XIr7QeNt/CGXm9pQRtWamhPjXCToKddyfI
         uJwVqdYjhOVwW4IJqkP8W14Yxvig09hiY2IGXC8y20OKsLfA2AX4dv1vcLIz55wMYdMI
         SsMwVU9UoCjCyYe+P/pElj2uQgk8FU03unEzXaFpSaABvNO9suztWV8UXyBNg6t+AbI2
         T6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5MyzPstAwbNGZEWJRgSFYxiR0DFtAmFf/jRZizSuqcw=;
        b=WH5//lz2Vu23cmW2ie29RHwWCs6+2yIZ7sOBL+2s1EKQ8rPWiHhuWLQRiDSUG8T7Cu
         QY5Ak6DFFc5rSPWA0xf7sM6ZDXYYyO/Sk5jnegWwa532q27WZwh1j6maqiEUYjwXWCYm
         3QtvH34dERKE90dbyWDKgHQyOGaKZ+brE1jjRrXeIKaPhUaiyVlfIrIsxs1GtA+S0Z+Z
         Y3J6QmH6GhlrGHsFLD3Vhmz+aTkWgNkyDNnu5BqYe9tJSeLi0jf49BpwRM8qXjeU6jY+
         iIOX4Pvby6VfTNSnqr4URBrzQvuTI1vY9Md8GwfFFiVPzf/eqEW0LgPLz6aZN6ePkhI/
         z2zA==
X-Gm-Message-State: AJIora+1LxmT6fBKBvDYPKYd5DzEJ6W/vy1da3qUM7FQSsdEAu03ELM8
        ZZemlcS9UDgbbJc1R8cVv2+ePw==
X-Google-Smtp-Source: AGRyM1vRSbxrF6l5s5PgGpt/AcIUpDJ4zfIbM7qgB/EvfxI9fIb1abkeoPHVAf+lAIGKNfOmHV4Yew==
X-Received: by 2002:a1c:770c:0:b0:3a0:37ec:bbb9 with SMTP id t12-20020a1c770c000000b003a037ecbbb9mr46160208wmi.2.1657119878350;
        Wed, 06 Jul 2022 08:04:38 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v7-20020a1cac07000000b003a04e6410e0sm22443420wme.33.2022.07.06.08.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 08:04:37 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC 1/2] clk: Add generic sync_state callback for disabling unused clocks
Date:   Wed,  6 Jul 2022 18:04:10 +0300
Message-Id: <20220706150411.708213-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There are unused clocks that need to stay enabled on clk_disable_unused,
but rather should be disabled later on on sync_state. Provide a generic
sync_state callback for the clock providers that register such clocks.
Then, use the same mechanism as clk_disable_unused from that generic
callback, but pass the device to make sure only the clocks belonging to
the current clock provider get disabled, if unused. Also, during the
default clk_disable_unused, if the driver that registered the clock has
the generic clk_sync_state_disable_unused callback set for sync_state,
leave its clocks enabled.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/clk.c            | 67 +++++++++++++++++++++++++++---------
 include/linux/clk-provider.h |  1 +
 2 files changed, 52 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7fc191c15507..ea55806505c0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1218,19 +1218,31 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+static void clk_unprepare_unused_subtree(struct clk_core *core,
+						struct device *dev)
 {
 	struct clk_core *child;
 
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_unprepare_unused_subtree(child);
+		clk_unprepare_unused_subtree(child, dev);
+
+	if (dev && core->dev != dev)
+		return;
+
+	/*
+	 * clock will be unprepared on sync_state,
+	 * so leave as is on clk_disable_unused
+	 */
+	if (!dev && dev_has_sync_state(core->dev) &&
+		core->dev->driver->sync_state == clk_sync_state_disable_unused)
+		return;
 
 	if (core->prepare_count)
 		return;
 
-	if (core->flags & CLK_IGNORE_UNUSED)
+	if (!dev && core->flags & CLK_IGNORE_UNUSED)
 		return;
 
 	if (clk_pm_runtime_get(core))
@@ -1248,7 +1260,8 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	clk_pm_runtime_put(core);
 }
 
-static void __init clk_disable_unused_subtree(struct clk_core *core)
+static void clk_disable_unused_subtree(struct clk_core *core,
+					struct device *dev)
 {
 	struct clk_core *child;
 	unsigned long flags;
@@ -1256,7 +1269,18 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_disable_unused_subtree(child);
+		clk_disable_unused_subtree(child, dev);
+
+	if (dev && core->dev != dev)
+		return;
+
+	/*
+	 * clock will be disabled on sync_state,
+	 * so leave as is on clk_disable_unused
+	 */
+	if (!dev && dev_has_sync_state(core->dev) &&
+		core->dev->driver->sync_state == clk_sync_state_disable_unused)
+		return;
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_prepare_enable(core->parent);
@@ -1269,7 +1293,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	if (core->enable_count)
 		goto unlock_out;
 
-	if (core->flags & CLK_IGNORE_UNUSED)
+	if (!dev && core->flags & CLK_IGNORE_UNUSED)
 		goto unlock_out;
 
 	/*
@@ -1302,35 +1326,46 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+static void __clk_disable_unused(struct device *dev)
 {
 	struct clk_core *core;
 
-	if (clk_ignore_unused) {
-		pr_warn("clk: Not disabling unused clocks\n");
-		return 0;
-	}
-
 	clk_prepare_lock();
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	clk_prepare_unlock();
+}
+
+static int __init clk_disable_unused(void)
+{
+	if (clk_ignore_unused) {
+		pr_warn("clk: Not disabling unused clocks\n");
+		return 0;
+	}
+
+	__clk_disable_unused(NULL);
 
 	return 0;
 }
 late_initcall_sync(clk_disable_unused);
 
+void clk_sync_state_disable_unused(struct device *dev)
+{
+	__clk_disable_unused(dev);
+}
+EXPORT_SYMBOL_GPL(clk_sync_state_disable_unused);
+
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 72d937c03a3e..5d3ed2b14f2c 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -679,6 +679,7 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 		void __iomem *reg, u8 shift, u8 width,
 		u8 clk_divider_flags, const struct clk_div_table *table,
 		spinlock_t *lock);
+void clk_sync_state_disable_unused(struct device *dev);
 /**
  * clk_register_divider - register a divider clock with the clock framework
  * @dev: device registering this clock
-- 
2.34.3

