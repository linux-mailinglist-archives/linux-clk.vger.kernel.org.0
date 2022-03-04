Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D190B4CD1EA
	for <lists+linux-clk@lfdr.de>; Fri,  4 Mar 2022 11:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239463AbiCDKEV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Mar 2022 05:04:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239456AbiCDKES (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2022 05:04:18 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F43519E002
        for <linux-clk@vger.kernel.org>; Fri,  4 Mar 2022 02:03:30 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id c1so7087668pgk.11
        for <linux-clk@vger.kernel.org>; Fri, 04 Mar 2022 02:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/wivmtaq/SOM50t59wI6fLzJlaXtHmkBr6jDahJcOY4=;
        b=bGsRhcabvtlSfwd8B3Hc862NImw4ysYnY4vIXQXnY8c0yLMXuW0PWOkCVaYH0JddgX
         7XaSpfnyNR176s48aOfJYFXy71qH1fJ3EKDwd49Xj3F5Y3iKd0WHgQkui2hDyZDse7VV
         HEq/JvcnB7tT50djw2mSzJSMbXst7GcASnJQwJe0mVpIA3Z6Ze0q1LfCirUuWD/0wUR0
         B2ngyyebL8s4qkERUEDqCqZ7Go8vt76ElCnjnfNliAbA6d175ipCZTEec27TjBdsgtxB
         1blU1E5FrL/PqUUV+WIHLFHThitCK4qGoqsxjnFgwJfsw1vMs+rpYR5QGKQJjZNGY8YF
         y+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/wivmtaq/SOM50t59wI6fLzJlaXtHmkBr6jDahJcOY4=;
        b=4lAMoSiKLlf+WfPN7+/MDeUqlc6KQlQFCOIP+duJNl+aoNgOQnMbpWyalT7JaEKCJn
         dDWSZRpNF/yufTodm0cgmQgzgCfbhzT8GS/AB2uoRFQDsLlOU3XAZZKx2HC7rwdamJiz
         XmiD29uPzUy4BHDkCKHH1Pc28vf+XerzpH9Swm7Mimcj26/egR+8vT+LzLCgHY9GDnBF
         PMQdzi4KqOBcEr9CAUYTV2k1YZxcVQlRLMfXDjVucyhyWiJZ5GJg3EF9qfTEqcf0pYr/
         TOT/EDIM2zOphd/GBT1d+NLbeZ6Ywxz/KIY2zBibrjC/vwEX3ixjdGnZxuucrzcfyQiS
         Hfsw==
X-Gm-Message-State: AOAM532acB55+E5SZg0Oo8rJohMsr68ofMpl1p1v6bH4Rs0jgEf2z5aW
        976soNARexWHM3amkTdFur2v1Q==
X-Google-Smtp-Source: ABdhPJyn7J5CnDAcxUu7niaATceQ6lk+NyKYqye5kYn0ltG7hPXizvd7T07ZbTlOO9WCND1NeREjGA==
X-Received: by 2002:a63:c61:0:b0:370:592b:3ad1 with SMTP id 33-20020a630c61000000b00370592b3ad1mr33584816pgm.240.1646388209553;
        Fri, 04 Mar 2022 02:03:29 -0800 (PST)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id j8-20020a056a00174800b004f26d3f5b03sm5461605pfc.39.2022.03.04.02.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 02:03:29 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 1/5] clk: sifive: duplicate the macro definitions for the time being
Date:   Fri,  4 Mar 2022 18:03:17 +0800
Message-Id: <8cfd57f01cfb59adb716eb13ca0c8250c246dcb2.1646388139.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646388139.git.zong.li@sifive.com>
References: <cover.1646388139.git.zong.li@sifive.com>
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

This is a temporary patch in whole patch set. We are going to change the
macro name in dt-binding, in order to avoid breaking the driver build
and git bisect, add these macro definitions for the time being, and we
will remove them later.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/clk/sifive/fu540-prci.c |  6 +++++-
 drivers/clk/sifive/fu740-prci.c | 11 ++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
index 29bab915003c..9e13119066eb 100644
--- a/drivers/clk/sifive/fu540-prci.c
+++ b/drivers/clk/sifive/fu540-prci.c
@@ -20,9 +20,13 @@
 
 #include <dt-bindings/clock/sifive-fu540-prci.h>
 
-#include "fu540-prci.h"
 #include "sifive-prci.h"
 
+#define PRCI_CLK_COREPLL	0
+#define PRCI_CLK_DDRPLL		1
+#define PRCI_CLK_GEMGXLPLL	2
+#define PRCI_CLK_TLCLK		3
+
 /* PRCI integration data for each WRPLL instance */
 
 static struct __prci_wrpll_data __prci_corepll_data = {
diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
index 53f6e00a03b9..7141a22d90e3 100644
--- a/drivers/clk/sifive/fu740-prci.c
+++ b/drivers/clk/sifive/fu740-prci.c
@@ -8,9 +8,18 @@
 
 #include <dt-bindings/clock/sifive-fu740-prci.h>
 
-#include "fu540-prci.h"
 #include "sifive-prci.h"
 
+#define PRCI_CLK_COREPLL	0
+#define PRCI_CLK_DDRPLL		1
+#define PRCI_CLK_GEMGXLPLL	2
+#define PRCI_CLK_DVFSCOREPLL	3
+#define PRCI_CLK_HFPCLKPLL	4
+#define PRCI_CLK_CLTXPLL	5
+#define PRCI_CLK_TLCLK		6
+#define PRCI_CLK_PCLK		7
+#define PRCI_CLK_PCIE_AUX	8
+
 /* PRCI integration data for each WRPLL instance */
 
 static struct __prci_wrpll_data __prci_corepll_data = {
-- 
2.31.1

