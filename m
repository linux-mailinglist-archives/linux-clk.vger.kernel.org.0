Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF7E68FB59
	for <lists+linux-clk@lfdr.de>; Thu,  9 Feb 2023 00:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbjBHXnP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 8 Feb 2023 18:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjBHXnG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 18:43:06 -0500
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D31B1C7CE
        for <linux-clk@vger.kernel.org>; Wed,  8 Feb 2023 15:43:04 -0800 (PST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-15ff0a1f735so570719fac.5
        for <linux-clk@vger.kernel.org>; Wed, 08 Feb 2023 15:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3TQijj1zNEkMgIbB33746rNlmKDxV7N66SIgj0jQUQ=;
        b=r4nQNOWBzVynaqZrRXOi+W5IJ7rgPu8UYjOMJ7CcciSMSGYOewBVZTIL4nbqb9znCz
         6Pplrqd+dG5YTCBaHulkQodV6zHxIhhhMDz2Fz/EhFW9o7sWHEXnyAwg/u8h28RvUY+3
         sfM+WZw7mX4NpYEmF/bPadKseepuZgDD7GhmNZOmGW5yl2wNphCUIwFeP459GjJ64iYs
         4gxIQo4hbJbz2Tfw31seJEcZ+ULccIWGT4v9Dpkbjb+kYFycCcaz+YpCXbOmrHexy2/m
         PrxddhxFE8PRZQ6c4R2aw1gsheQ8UhRjf57QNer5HeKy8Q9mPMP8hUpDxqpAx6LO4cFf
         Hhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3TQijj1zNEkMgIbB33746rNlmKDxV7N66SIgj0jQUQ=;
        b=ntcItk4PbHYxZ0sQu+pviEgZl1brvRsB7Y7MCmDICnX3rw5i4RfUkSJPJp30mmYkbk
         JBUdKBvzHe14o2JmNyQcdVU3c9tYV1p/1spWjADhq2TV3FSs3a2ZGQlUeE9eszUELhTs
         Mm+/KuschBu2dKVqFwJAiPtJv6AWl/bkPrgb6BoUcBRRDdhVSTfWtIER8JTLMI5Vgo3f
         /qoJZ9dbtiZGtGy2b3HMEzjdmKDnarIjFvi13B5xwLcchIajKRinCH3XPDoLaMD9UfSG
         Hl7XMW1pJN98Y+f4LTy8pjFXCePwoIDR6CFLGFPcCf7B3nxAIqpILILjn0FOYVBkC3QT
         YhyQ==
X-Gm-Message-State: AO0yUKWXQqVByaHhcsZLM9iyj8SWBoh1hWrE7YTVJ8OKc3shrVCDhtq8
        yyiLRgZQMkNEeHcgz9sheZM09A==
X-Google-Smtp-Source: AK7set+KUQwbpmWSnr7ihtxwIRu7Tt3YgvSh2JEZxfJuyvrzzID8ro6gA9F3R3pjxvhzTKPA15Z8wQ==
X-Received: by 2002:a05:6870:783:b0:15b:b523:3299 with SMTP id en3-20020a056870078300b0015bb5233299mr4714452oab.28.1675899783303;
        Wed, 08 Feb 2023 15:43:03 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id zf18-20020a0568716a9200b0016a629e1917sm3672069oab.52.2023.02.08.15.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 15:43:02 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] clk: samsung: Extract parent clock enabling to common function
Date:   Wed,  8 Feb 2023 17:43:12 -0600
Message-Id: <20230208234313.23863-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208234313.23863-1-semen.protsenko@linaro.org>
References: <20230208234313.23863-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Extract parent clock enabling from exynos_arm64_register_cmu() to
dedicated function.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Rebased on top of latest soc/for-next tree
  - Improved English in kernel doc comment
  - Added clk_prepare_enable() return value check
  - Added exynos_arm64_enable_bus_clk() check in
    exynos_arm64_register_cmu()
  - Changed the commit message to reflect code changes

 drivers/clk/samsung/clk-exynos-arm64.c | 51 ++++++++++++++++++--------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index b921b9a1134a..2aa3f0a5644e 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -56,6 +56,37 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
 	iounmap(reg_base);
 }
 
+/**
+ * exynos_arm64_enable_bus_clk - Enable parent clock of specified CMU
+ *
+ * @dev:	Device object; may be NULL if this function is not being
+ *		called from platform driver probe function
+ * @np:		CMU device tree node
+ * @cmu:	CMU data
+ *
+ * Keep CMU parent clock running (needed for CMU registers access).
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static int __init exynos_arm64_enable_bus_clk(struct device *dev,
+		struct device_node *np, const struct samsung_cmu_info *cmu)
+{
+	struct clk *parent_clk;
+
+	if (!cmu->clk_name)
+		return 0;
+
+	if (dev)
+		parent_clk = clk_get(dev, cmu->clk_name);
+	else
+		parent_clk = of_clk_get_by_name(np, cmu->clk_name);
+
+	if (IS_ERR(parent_clk))
+		return PTR_ERR(parent_clk);
+
+	return clk_prepare_enable(parent_clk);
+}
+
 /**
  * exynos_arm64_register_cmu - Register specified Exynos CMU domain
  * @dev:	Device object; may be NULL if this function is not being
@@ -72,23 +103,11 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
 void __init exynos_arm64_register_cmu(struct device *dev,
 		struct device_node *np, const struct samsung_cmu_info *cmu)
 {
-	/* Keep CMU parent clock running (needed for CMU registers access) */
-	if (cmu->clk_name) {
-		struct clk *parent_clk;
-
-		if (dev)
-			parent_clk = clk_get(dev, cmu->clk_name);
-		else
-			parent_clk = of_clk_get_by_name(np, cmu->clk_name);
-
-		if (IS_ERR(parent_clk)) {
-			pr_err("%s: could not find bus clock %s; err = %ld\n",
-			       __func__, cmu->clk_name, PTR_ERR(parent_clk));
-		} else {
-			clk_prepare_enable(parent_clk);
-		}
-	}
+	int err;
 
+	err = exynos_arm64_enable_bus_clk(dev, np, cmu);
+	if (err)
+		panic("%s: could not enable bus clock\n", __func__);
 	exynos_arm64_init_clocks(np, cmu->clk_regs, cmu->nr_clk_regs);
 	samsung_cmu_register_one(np, cmu);
 }
-- 
2.39.1

