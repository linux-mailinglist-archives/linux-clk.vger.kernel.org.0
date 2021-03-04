Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502C432DCC3
	for <lists+linux-clk@lfdr.de>; Thu,  4 Mar 2021 23:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhCDWMz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 4 Mar 2021 17:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbhCDWMy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Mar 2021 17:12:54 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2530EC061764
        for <linux-clk@vger.kernel.org>; Thu,  4 Mar 2021 14:12:54 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id m9so8491157edd.5
        for <linux-clk@vger.kernel.org>; Thu, 04 Mar 2021 14:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UCo3mKQIbcpollGcJ9PYHtksoboB7Ro207jOYrCfzdo=;
        b=g1Zn6sewFIleBOXnOHM71n+XqDprG9IKVcU3vrwC/LmP7RiEYZWioiuOo6u8eay8rp
         1efpcjma6Y7hUyfQyOqliLwpMX7YVcRtMkHFwd4IttHF9G22LrA/mMggvqUZaqDgqmU1
         133cDV7S24kpbxsZu8wG18e2IJ81VwzKnsak4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UCo3mKQIbcpollGcJ9PYHtksoboB7Ro207jOYrCfzdo=;
        b=fFXssmaxyX/F3WAOJUH2kv/y2yENR7wLRgA/TtWVh/buRQF9UY0CF1djzPzjBr1nsF
         ZgXH+/bM2864pYN/4vHQ2MEBQ3bYsshUR7ZT8Ml9Sx9YQqAjgTzF8APPW13ZUqhXpKyQ
         esIxj0Pnwset7V2SaOagQ+XwlMTYkNKG6oUV4/3Wlk7Ubu7NrSggeesPBVg9UKEUFGC3
         HZh/s9sCKNcOazUCVTEnce+kh42GKQmigEK7mKO18DilLioN4ElZW5i+GSwXc68qtKjO
         vEVz+6TokO/Tk9Sy4FzoiLKeECz/l6IjS+Jf4yOlWy7m8es1YLBisSrETr7VF47Gk4Hv
         /yEw==
X-Gm-Message-State: AOAM5301lwtxZ7Fw4lCcmsHNIDEslLGG3qz85eck/25rKDRDiVV//hUC
        /USKDnzozJaZkeWjaB/2PTt/ow==
X-Google-Smtp-Source: ABdhPJzme5MAAWpf/zramDLF/Q+YNk0uNjfX+zRiBm3mY5cw1s0ZQPbrq+hYw2HTPbmIl+2U4okoLg==
X-Received: by 2002:aa7:cd8c:: with SMTP id x12mr6809476edv.355.1614895972903;
        Thu, 04 Mar 2021 14:12:52 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id q22sm362099ejy.5.2021.03.04.14.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 14:12:52 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 3/3] watchdog: gpio_wdt: implement support for optional "delay" clock
Date:   Thu,  4 Mar 2021 23:12:47 +0100
Message-Id: <20210304221247.488173-4-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304221247.488173-1-linux@rasmusvillemoes.dk>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <20210304221247.488173-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[DO NOT MERGE - see cover letter]

We have a board where the reset output from the ADM706S is split in
two: directly routed to an interrupt, and also to start a ripple
counter, which 64 ms later than pulls the SOC's reset pin. That ripple
counter only works if the RTC's 32kHz output is enabled, and since
linux by default disables unused clocks, that effectively renders the
watchdog useless.

Add driver support for an optional "delay" clock, as documented in the
preceding patch.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/watchdog/gpio_wdt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index 0923201ce874..f812c39bc1e8 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/gpio/consumer.h>
@@ -111,6 +112,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 	enum gpiod_flags gflags;
 	unsigned int hw_margin;
 	const char *algo;
+	struct clk *clk;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -164,6 +166,13 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 	if (priv->always_running)
 		gpio_wdt_start(&priv->wdd);
 
+	clk = devm_clk_get_optional(dev, "delay");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	ret = devm_clk_prepare_enable(dev, clk);
+	if (ret)
+		return ret;
+
 	return devm_watchdog_register_device(dev, &priv->wdd);
 }
 
-- 
2.29.2

