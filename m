Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9140B3E8C
	for <lists+linux-clk@lfdr.de>; Mon, 16 Sep 2019 18:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389760AbfIPQPI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Sep 2019 12:15:08 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36060 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389703AbfIPQPG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Sep 2019 12:15:06 -0400
Received: by mail-pf1-f193.google.com with SMTP id y22so194677pfr.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2019 09:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=70nxwZafCYlFjcUnZixCqBC0Lk3FuIHCQ+uw4WwvqpE=;
        b=A1ugiOOPB7IojLFg9zG7Z22Pk5Hy1X6F1BvfvZbhB4LvJPypy+NTg/ATLcqMSTnN29
         cvS5V6/R4wanwOaOkFhUCdel4TZ/BNMZSNfWvTHyUtWJwqprpL/CXF1cbtGl6P5Ijj1f
         FHctexMt1/Bo9pShonbRxtdHV3xU0Lahg4ss4Xufa7DfP1GfsKtHF0CAUK6TcXS7LOBl
         tHZEDtDJcffi/YKAr5jdQXuCIia6TqGCeFAzAwh2R9lXiq8rdjJ0I1cwH/E86NMPEj/r
         PFSYcus9YyaJVpMdVPF4T60PAWtBxTdiN73uiyQOGe1IDLySZX7+7PnOFxraTdxunT75
         ctoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=70nxwZafCYlFjcUnZixCqBC0Lk3FuIHCQ+uw4WwvqpE=;
        b=q1pLEtL0XL6YUbqKShaKMIrOn7JP4k50z0p7v5Mn17KXuKPSDOC6JnhBd/uehcfQYh
         mShzyQE5x8CUyMqDO0NNR1ESML/2xWd93vbV9RkUqZngz+mN5UeHMcEZ2QSvD5c+gZK6
         b0qOvQ3hfDwD65i5XjVM/eu4QB9RT6EWUl0NXIkfkCvMn9iaFFl2CITcJcOOROI7vnE8
         I4ETGOwh6F9kechEvILiVZOSFMpgPUO+Ue9xbOb3gx1bgm6jmClLVONQ9GOteiKzgys5
         NpM7bsUEqb6oZh9ljdR8pUdN7o2z/bB7uFhAPH5g1BAreAv9IMu4h3i9Gfw1M0E95yDW
         HI5w==
X-Gm-Message-State: APjAAAV1hG2hl9uOjLUMNVLjn68o5+aX0QbasKBBdLE7OzK3eX/IB/SW
        DNPq1lgkU8p5HYIKXRDpbvSX
X-Google-Smtp-Source: APXvYqxSax50pawR6i4u56ziysZ9sLdFtdyKBhaZ6zTz4KztldaLEtes3ldaJLB33hc0GcJBWrSOkQ==
X-Received: by 2002:a17:90a:db04:: with SMTP id g4mr502843pjv.51.1568650506251;
        Mon, 16 Sep 2019 09:15:06 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:90b:91ce:94c2:ef93:5bd:cfe8])
        by smtp.gmail.com with ESMTPSA id h66sm614134pjb.0.2019.09.16.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 09:15:05 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 1/8] clk: Zero init clk_init_data in helpers
Date:   Mon, 16 Sep 2019 21:44:40 +0530
Message-Id: <20190916161447.32715-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
References: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk_init_data struct needs to be initialized to zero for the new
parent_map implementation to work correctly. Otherwise, the member which
is available first will get processed.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/clk-composite.c  | 2 +-
 drivers/clk/clk-divider.c    | 2 +-
 drivers/clk/clk-fixed-rate.c | 2 +-
 drivers/clk/clk-gate.c       | 2 +-
 drivers/clk/clk-mux.c        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index b06038b8f658..4d579f9d20f6 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -208,7 +208,7 @@ struct clk_hw *clk_hw_register_composite(struct device *dev, const char *name,
 			unsigned long flags)
 {
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = { NULL };
 	struct clk_composite *composite;
 	struct clk_ops *clk_composite_ops;
 	int ret;
diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 3f9ff78c4a2a..65dd8137f9ec 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -471,7 +471,7 @@ static struct clk_hw *_register_divider(struct device *dev, const char *name,
 {
 	struct clk_divider *div;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = { NULL };
 	int ret;
 
 	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index a7e4aef7a376..746c3ecdc5b3 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -58,7 +58,7 @@ struct clk_hw *clk_hw_register_fixed_rate_with_accuracy(struct device *dev,
 {
 	struct clk_fixed_rate *fixed;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = { NULL };
 	int ret;
 
 	/* allocate fixed-rate clock */
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 1b99fc962745..8ed83ec730cb 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -141,7 +141,7 @@ struct clk_hw *clk_hw_register_gate(struct device *dev, const char *name,
 {
 	struct clk_gate *gate;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = { NULL };
 	int ret;
 
 	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 66e91f740508..2caa6b2a9ee5 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -153,7 +153,7 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 {
 	struct clk_mux *mux;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = { NULL };
 	u8 width = 0;
 	int ret;
 
-- 
2.17.1

