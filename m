Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5758B99CC0
	for <lists+linux-clk@lfdr.de>; Thu, 22 Aug 2019 19:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392510AbfHVRgj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 22 Aug 2019 13:36:39 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34303 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391578AbfHVRYt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Aug 2019 13:24:49 -0400
Received: by mail-pl1-f194.google.com with SMTP id d3so3857682plr.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2019 10:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=70nxwZafCYlFjcUnZixCqBC0Lk3FuIHCQ+uw4WwvqpE=;
        b=wjDlZAUyA+79EgPCGsEzncxofResf0ntanYurX8vDWxjInime4FmFm6ORYEgwqXo7z
         /0virIKbDYaQEaPcAP76VxXXkDOeaI3ZWvseBaGwlW07x2HlEzF8oa7tL2+Pt6itKZg6
         351N80qRTQsgtn8yNEhTokgA0L4COEYnf911oeXo9EsvSgFhzUxqDXjmMkHmjh1+abNx
         p0YC1ybNMoWamMUui+k2D/sepRVDNSOWX9OHZcpgfAJWJ5Mf9Jv5nQ3nUNmWifGjqXiQ
         +BbeGYZniUPpiMqKmd14A3vzc9e1I2CBSExLbMNDdvrFOhknPEbljs91QfSqDMwWGks6
         t7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=70nxwZafCYlFjcUnZixCqBC0Lk3FuIHCQ+uw4WwvqpE=;
        b=DLz4gLJKrbelXYTbtmOwLilvom+LIqOV0BV/MvR8kSpmwvkScU5e0yydeLZHmrHnV2
         uSB+mTF6FCkgBgeGj7KdiJO5RyHSgNXyUqDM3j6vfI0Rwq+tRfeBcMSxZiujw5+lH9yF
         K1TVMVcglXOrORo7TGpd3X7qCOFjMcKmY3BR6hZWu78ycTuKzA74NH90elCHYacCnKI7
         l9CfN0Fx6RZB9tPIhS3cnUhFYgsnU2GZkiZ/SHtisu3cyfgMqSeDNJGElIBaY79BWkLv
         LSFA/GvqKEDVCpPZfxRyaN/oNDVoohA7hsnjYucf1ObJnYIXd0a9FxVLgJMpE9IrCwYP
         uhzQ==
X-Gm-Message-State: APjAAAWARmISoiWf+qF3d2/4heUr39L8hpN4KbpEnlYIiLVJ3AaRTOCR
        4Y/qlN5ngWLMiqUX8NeWuE7A
X-Google-Smtp-Source: APXvYqyGPkXXQfTveOLHfKtvtOEU23e9V2exsqqblaUouTOQNZ/alWYRyrWpHuw/O2f7ZDi/ObIWbw==
X-Received: by 2002:a17:902:aa93:: with SMTP id d19mr41354972plr.148.1566494688626;
        Thu, 22 Aug 2019 10:24:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:71cc:5738:24ad:193e:4b59:8a76])
        by smtp.gmail.com with ESMTPSA id r12sm31705798pgb.73.2019.08.22.10.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 10:24:48 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 1/8] clk: Zero init clk_init_data in helpers
Date:   Thu, 22 Aug 2019 22:54:19 +0530
Message-Id: <20190822172426.25879-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
References: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
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

