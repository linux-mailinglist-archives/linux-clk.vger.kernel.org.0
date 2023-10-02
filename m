Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D69E7B59B9
	for <lists+linux-clk@lfdr.de>; Mon,  2 Oct 2023 20:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjJBSJf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 2 Oct 2023 14:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238745AbjJBSJd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Oct 2023 14:09:33 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C89C6
        for <linux-clk@vger.kernel.org>; Mon,  2 Oct 2023 11:09:30 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7741c2fae49so7038785a.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Oct 2023 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696270170; x=1696874970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/9udtHJxdUnIEfNuTeE6b1Yaqw4dJt+yBS5HPABR3I=;
        b=FXjpC1BfcbSAxOKwAOkJi1e5KiObsmqRyrZ1O755PF3BlijVsKtrR3kQOThxz/+a0k
         mVXmmmtNfc6ENPieANrBm/FwXLpuoi5mRikMgUENjRRlhiL43fcH+n7VWd+duBxzSCrj
         FKBb14j83CS2CamlUZBvccctthw1Aumqi1TEW2AyGYnuza60Qk2bzLWt3lIDmT8n7T3J
         ejMhEBkw/KrCOpdQmW4VVdx5xUpGKhOEFxsoufcQlzxlaqj9+P19GGQO0jEkXpc3UYgN
         E5Z+FXfq/OT/a1BkePzRvxfI9NZ7lJHqSiTv90gh7P1q/b9Q5PwtkYSqgYZMsVqDpBvd
         YAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696270170; x=1696874970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/9udtHJxdUnIEfNuTeE6b1Yaqw4dJt+yBS5HPABR3I=;
        b=Qddxb6oW4nYTKQ088y50CJyWvcU8VlGGtTXcKQnkDEP71bMWGXvtBIHYWz7pgtYwKX
         2VvfrnMXtb0UczxPTZN4U+XZWkxt67rwdX8YfvepYDqr08U+f4JPM43bV1te4fd4rtXy
         ncKXtqZnJq3yKTdTPPHbI+hgn4wLEyX9SeetlEdXnmP/D8DhbcrE6VwQKetg+5libEeN
         WGbo6oVe+HEA+sa81TUCPFV9LytW1sCMB1UGRcwaObyajev9O4wGwydE+g5PTSHGPVUB
         BTBdL0qRmg53uZTRMMM6DC3PqOQheC+wfh8knK1eDb25h5ZUTwluhNnPP+xty1rJwDgg
         ZKEA==
X-Gm-Message-State: AOJu0YwdZl5QOV/OQrospJMYEmUQTksFapR7yRy5sDinZdQzz7hy4IKK
        FiipdDPeSJDycVZx3G/xPPYi6Q==
X-Google-Smtp-Source: AGHT+IGwixskDpdw9/a1WqqdPBN+k/f7EbXZs8t1/jSWdyRBC7cYwnhvEjFKQCihuGojDRTAfr1XbA==
X-Received: by 2002:a05:620a:b5a:b0:770:9bd2:b3be with SMTP id x26-20020a05620a0b5a00b007709bd2b3bemr11139670qkg.5.1696270170028;
        Mon, 02 Oct 2023 11:09:30 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
        by smtp.gmail.com with ESMTPSA id w15-20020ae9e50f000000b0077423f849c3sm7390255qkf.24.2023.10.02.11.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 11:09:29 -0700 (PDT)
From:   Ben Wolsieffer <ben.wolsieffer@hefring.com>
To:     linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [PATCH 1/2] clk: stm32: initialize syscon after clocks are registered
Date:   Mon,  2 Oct 2023 14:08:53 -0400
Message-ID: <20231002180854.1603452-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002180854.1603452-1-ben.wolsieffer@hefring.com>
References: <20231002180854.1603452-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The stm32-power-config syscon (PWR peripheral) is used in this driver
and the STM32 RTC driver to enable write access to backup domain
registers. The syscon's clock has a gate controlled by this clock
driver, but this clock is currently not registered in the device tree.
This only happens to work currently because all relevant clock setup and
RTC initialization happens before clk_disabled_unused(). After this
point, all syscon register writes are ignored.

If we simply add the syscon clock in the device tree, we end up with a
circular dependency because the clock has not been registered at the
point this driver requests the syscon.

This patch avoids this circular dependency by moving the syscon lookup
after the clocks are registered. This does appear to create a possible
race condition where someone could attempt to perform an operation on a
backup domain clock before the syscon has been initialized. This would
result in the operation having no effect because backup domain writes
could not be enabled. I'm not sure if this is a problem or if there is
a way to avoid it.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/clk/clk-stm32f4.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 07c13ebe327d..a88e762d2b5e 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -1697,12 +1697,6 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 		return;
 	}
 
-	pdrm = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
-	if (IS_ERR(pdrm)) {
-		pdrm = NULL;
-		pr_warn("%s: Unable to get syscfg\n", __func__);
-	}
-
 	match = of_match_node(stm32f4_of_match, np);
 	if (WARN_ON(!match))
 		return;
@@ -1894,6 +1888,12 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 
 	of_clk_add_hw_provider(np, stm32f4_rcc_lookup_clk, NULL);
 
+	pdrm = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
+	if (IS_ERR(pdrm)) {
+		pdrm = NULL;
+		pr_warn("%s: Unable to get syscfg\n", __func__);
+	}
+
 	return;
 fail:
 	kfree(clks);
-- 
2.42.0

