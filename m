Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997404C22C5
	for <lists+linux-clk@lfdr.de>; Thu, 24 Feb 2022 04:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiBXD7r (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Feb 2022 22:59:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbiBXD7q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 22:59:46 -0500
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2020A25D26E
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 19:59:18 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2d74a0ff060so10543417b3.6
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 19:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=8iIlLAwaBqAvudF9srhKthrxATU08Z94U2yOQ10cisU=;
        b=T9pMgXEIf/nJSr8Zn/M6b37SxIciaOCWbdQDvlShSOvi9XZl4JM7gGRfHw6kIoJiqg
         yRnkOVY0mhtzy3/8Ezf+rA10pufrVURMXhzj98XhNCa++7xF4puY8xZohznTCP7jAHlB
         l5odb6JCfzmQixrt4KiUNbFbDdaWWLcGMtaTTvRl0+n807hOFKuIFUsfZ7hMcjaqtT+Y
         Vz9OuveHa+vzNFITed3dro/ZUCdTS90h4GvuSzmztsEYfeOJKiNyfJa21oUO6Tq3AhSM
         +k9bcfDwTErYFmy9SLOUGvPCB4fIrYiWKFFmE97Gc3tcBA2oT++AI1h0hYaA99ryDHGy
         GsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=8iIlLAwaBqAvudF9srhKthrxATU08Z94U2yOQ10cisU=;
        b=BbA+sSP965UQyhrJzEFSPRCTjnj4i1tVQzr3y86+q5UvFkIjuT5hnYdvjJDxz5V7DI
         LqWBFM0EXQyEdVsHBrT6IqWD2Y7ZGNrZqJMIrHmUTsR7SuJUnuoDsAoB+Cf3NbKElZPd
         0pu+BIifeg9SIpn56zIBVJnXmUW/fMyFu7YeJcCc7ZwNI5NNwHal8kQV5vruKRChs6vT
         BsDH4GAGDfet6RlCWx6JQjuOaMkdqXqXZ8c8SQ6ckw0KzCJ0Bj1jGHyvBn9MczRUkvqq
         8cXtuFCJtixV6KopYyQ32iE9JgLYERNWHPfoTB2LJ2eBj4c5uewdDxNHMx+Ff9ZPDevq
         gCNw==
X-Gm-Message-State: AOAM531GsMHVMd0q3WivO4I2iHXmVOnHvyx+L8tekm2HpzhZpXbBjLlD
        Lk0r2G6Lo+uJeA4EYgCjwW+Epp6NMg70IA==
X-Google-Smtp-Source: ABdhPJwOzmJ3S514/2/6X8DVnfyasdsfbxYiEAD9DZ8lGmsBsVs4zKR0X1aCaMdy8/mx53mqL+tEkEVphY0MYA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:be88:0:b0:620:e67:4302 with SMTP id
 i8-20020a25be88000000b006200e674302mr826567ybk.120.1645675157388; Wed, 23 Feb
 2022 19:59:17 -0800 (PST)
Date:   Thu, 24 Feb 2022 11:59:02 +0800
Message-Id: <20220224035902.1594253-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.473.g83b2b277ed-goog
Subject: [PATCH] clk: lan966x: Depend on CONFIG_IOMEM
From:   David Gow <davidgow@google.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Gow <davidgow@google.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The lan966x clk driver depends on IOMEM functions, in particular
devm_platform_ioremap_resource(), but doesn't state a formal dependency
on it in Kconfig.

Add such a dependency, which prevents this driver from being enabled
on UML configurations without IOMEM.

This fixes the following build failure:

/usr/bin/ld: drivers/clk/clk-lan966x.o: in function `lan966x_clk_probe':
clk-lan966x.c:(.text+0x294): undefined reference to `devm_platform_ioremap_resource'
/usr/bin/ld: clk-lan966x.c:(.text+0x3aa): undefined reference to `devm_ioremap_resource'
collect2: error: ld returned 1 exit status

Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/clk/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3cdf33470a75..7b5db8a9eb4f 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -231,6 +231,7 @@ config COMMON_CLK_GEMINI
 
 config COMMON_CLK_LAN966X
 	bool "Generic Clock Controller driver for LAN966X SoC"
+	depends on IOMEM
 	help
 	  This driver provides support for Generic Clock Controller(GCK) on
 	  LAN966X SoC. GCK generates and supplies clock to various peripherals
-- 
2.35.1.473.g83b2b277ed-goog

