Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 472E7CB796
	for <lists+linux-clk@lfdr.de>; Fri,  4 Oct 2019 11:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbfJDJsg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Oct 2019 05:48:36 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41585 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbfJDJsc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Oct 2019 05:48:32 -0400
Received: by mail-lj1-f194.google.com with SMTP id f5so5821055ljg.8
        for <linux-clk@vger.kernel.org>; Fri, 04 Oct 2019 02:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zwueem1EPljcXnRaD27ju0e/9VU20MKGGmsIv6bb3i0=;
        b=b+mFR/U2BxINAX/eyE5WBsgp7vVFGbtCqpa+sBArULMdsFouNVX8qQQ9oIqtt/7PXO
         rLRaRYVJ9nZ/zHSApPl2quJdLSe1h5NKL6q6bqsIzy3T3yyyjoSnuR3+6keQH9p4L8Uc
         NxtA8F8AmmvvkW297Daepygynaz0Qd7NmPzhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zwueem1EPljcXnRaD27ju0e/9VU20MKGGmsIv6bb3i0=;
        b=jPZPbrO3WMtBHh9wK7TUbkpczNzKYVvmxQTWs1rUYQ3kPbAx7EUVeTF5JQeFgoW/at
         rDsA7Cuc6JD6RtvaOCcLFPl1YTngCgFwPQxruCjiqsrgDlqD3gs8Qotk6E430vOgDFPs
         TbMRMMBYGjoIdD4gf/2Dqa6hsx4HaxAhNjrf+5wPdfAGYBXUz14XdolM91iEXRpVU1pr
         w8IXSzdUHq2PgVbqqOkIWJx4t2rFonr90vD6OTXTVEvwyIjNyZvUXnIPgD4pScZagQVf
         TIiHWml9PdxguvCTc5L9Eje0z/4omt6aL3Gss2sjDoXKkUHabDz2jwDCqQts6wVff6Sy
         zfbw==
X-Gm-Message-State: APjAAAXWL3daN6l1/YKUOPu/ZAc5Wudh64rgQG8ckJz7jpj2o+Cq95k9
        7n5KhESqLa+onvKwApaIaLRUcA==
X-Google-Smtp-Source: APXvYqxTCTBrpEDR2lu1tIgV66peqc6OizLuq+XpAAIjRmrKavdVP3wIaE8w/80MGY4hLE1/npPqwQ==
X-Received: by 2002:a2e:4296:: with SMTP id h22mr9113125ljf.208.1570182509097;
        Fri, 04 Oct 2019 02:48:29 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id h12sm1116585ljg.24.2019.10.04.02.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 02:48:28 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mark clk_disable_unused() as __init
Date:   Fri,  4 Oct 2019 11:48:25 +0200
Message-Id: <20191004094826.8320-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_disable_unused is only called once, as a late_initcall, so reclaim
a bit of memory by marking it (and the functions and data it is the
sole user of) as __init/__initdata. This moves ~1900 bytes from .text
to .init.text for a imx_v6_v7_defconfig.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/clk/clk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 1c677d7f7f53..a81985285a3d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1187,7 +1187,7 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void clk_unprepare_unused_subtree(struct clk_core *core)
+static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 
@@ -1217,7 +1217,7 @@ static void clk_unprepare_unused_subtree(struct clk_core *core)
 	clk_pm_runtime_put(core);
 }
 
-static void clk_disable_unused_subtree(struct clk_core *core)
+static void __init clk_disable_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 	unsigned long flags;
@@ -1263,7 +1263,7 @@ static void clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
-static bool clk_ignore_unused;
+static bool clk_ignore_unused __initdata;
 static int __init clk_ignore_unused_setup(char *__unused)
 {
 	clk_ignore_unused = true;
@@ -1271,7 +1271,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int clk_disable_unused(void)
+static int __init clk_disable_unused(void)
 {
 	struct clk_core *core;
 
-- 
2.20.1

