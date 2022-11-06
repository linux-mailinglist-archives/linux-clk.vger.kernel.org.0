Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E538C61E315
	for <lists+linux-clk@lfdr.de>; Sun,  6 Nov 2022 16:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbiKFPqT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 6 Nov 2022 10:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiKFPqS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 6 Nov 2022 10:46:18 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DEA6D2EE
        for <linux-clk@vger.kernel.org>; Sun,  6 Nov 2022 07:46:17 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id bj12so24286526ejb.13
        for <linux-clk@vger.kernel.org>; Sun, 06 Nov 2022 07:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IESrdIGOIZAm+SZQoTxRhJ5XsZQ5NE5GBRmcNiJagyU=;
        b=F2cbbEOvg/pHLRp+l7YZGXVwAhe6m49SvHaqxvpPII2/ZU/hnCFzeTyOcT4rjzfRjC
         5Sufm6GvLr1SU6ugGLBIobRlxXsGPdKq5Fo/7HTy3oThl7o0HsUnCy7zv19liqqVz/LQ
         tt9CiBfEZIVR/6fuKdwAXIIj3lK2g8XuAqIYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IESrdIGOIZAm+SZQoTxRhJ5XsZQ5NE5GBRmcNiJagyU=;
        b=tcWjRs1y8R2WZj1YU9dF58z5Nt6rtOdaGfN8Vc+SanrEce7jQs2mFF0gHAm1CQOmTY
         FIk89aTC7rvffs6cshZK+BKu4rBryRq6bK9UNpr8qrSRhT+UCY1rmWY0aK+bDeMb7rxc
         kVYml6ScZRznuRh6/aJpcIE1uQ/rFnkogPOAn2UVE88B2gP30+3bSMKIhaBzVJ2Ba0yu
         xL5Qq+4Oasy4bfObdBpMLoC/UT1t6/83NKfGm01RNSJbT8HxtrSZfY+mHld+ZfLmk4dM
         LQO+kDHl6ts7mElDpzbijq1f/MohWMQMMpBqoGCwRh183DtkfbMAFeZT1PtovaVEUBeK
         01Og==
X-Gm-Message-State: ACrzQf25cJbUh74abZvlrzV/iFlFGzDeQyohZYmzBN0FwQvUk9yl4Tvo
        P9LG1iq5v4AzSEUTMyNfKcwXbw==
X-Google-Smtp-Source: AA0mqf4NwJutTjNjlc5CwEQu295TG49ixdJix/uHZHyLRtAfyvfT3OC1G/evCQM4vJFh4EtZwHv6yQ==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id s1-20020a17090699c100b006feb01d0134mr8027170ejn.598.1667749576127;
        Sun, 06 Nov 2022 07:46:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-95-232-76-31.retail.telecomitalia.it. [95.232.76.31])
        by smtp.gmail.com with ESMTPSA id kz20-20020a17090777d400b00772061034dbsm2204139ejc.182.2022.11.06.07.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 07:46:15 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     michael@amarulasolutions.com,
        Amarula patchwork <linux-amarula@amarulasolutions.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v3 1/2] clk: ti: add of_ti_clk_register() helper
Date:   Sun,  6 Nov 2022 16:46:11 +0100
Message-Id: <20221106154612.3474940-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
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

The ti_clk_register() function is always called with the parameter of
type struct device set to NULL, since the functions from which it is
called always have a parameter of type struct device_node. Adding this
helper will allow you to register a TI clock to the common clock
framework by taking advantage of the facilities provided by the
struct device_node type.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/ti/clk.c   | 30 ++++++++++++++++++++++++++++++
 drivers/clk/ti/clock.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 1dc2f15fb75b..e29b5c7c0dc8 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -560,6 +560,36 @@ int ti_clk_add_alias(struct device *dev, struct clk *clk, const char *con)
 	return 0;
 }
 
+/**
+ * of_ti_clk_register - register a TI clock to the common clock framework
+ * @node: device node for the clock
+ * @hw: hardware clock handle
+ * @con: connection ID for this clock
+ *
+ * Registers a TI clock to the common clock framework, and adds a clock
+ * alias for it. Returns a handle to the registered clock if successful,
+ * ERR_PTR value in failure.
+ */
+struct clk *of_ti_clk_register(struct device_node *node, struct clk_hw *hw,
+			       const char *con)
+{
+	struct clk *clk;
+	int ret;
+
+	ret = of_clk_hw_register(node, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	clk = hw->clk;
+	ret = ti_clk_add_alias(NULL, clk, con);
+	if (ret) {
+		clk_unregister(clk);
+		return ERR_PTR(ret);
+	}
+
+	return clk;
+}
+
 /**
  * ti_clk_register - register a TI clock to the common clock framework
  * @dev: device for this clock
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index 37ab53339a9b..a75fcf775de0 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -199,6 +199,8 @@ extern const struct omap_clkctrl_data dm816_clkctrl_data[];
 
 typedef void (*ti_of_clk_init_cb_t)(void *, struct device_node *);
 
+struct clk *of_ti_clk_register(struct device_node *node, struct clk_hw *hw,
+			       const char *con);
 struct clk *ti_clk_register(struct device *dev, struct clk_hw *hw,
 			    const char *con);
 struct clk *ti_clk_register_omap_hw(struct device *dev, struct clk_hw *hw,
-- 
2.32.0

