Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6069991252
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2019 20:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfHQShR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 17 Aug 2019 14:37:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37533 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbfHQShR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Aug 2019 14:37:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so3991876pgp.4
        for <linux-clk@vger.kernel.org>; Sat, 17 Aug 2019 11:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=70nxwZafCYlFjcUnZixCqBC0Lk3FuIHCQ+uw4WwvqpE=;
        b=ewzPkNyBhU4d9d5GhkPbSPGovE1vgDCdth74QZAq1r+/vMTb1o9o3DxSqMeS2tdFKA
         C1Sjun1kcy++u3Y0JYUo9na9qIphqFKJe8/Fsb4x2+5B3RDXKdMLlh/hbtP56sHGT5F9
         8o2aZSHCq4DbMoJJ0O00X3EZaW6mJO/yWmoZe2nofvuJNs633XHapwvEonzOkUw0lrHO
         S0MgAtpyfQmP7bqvgbiP8WPKaRHAmuREnzrttpIsrXNQuFzu9IXR+WH6sJxjwz0GSOyU
         XeZS6V4dYx4MipPyuMKzqpjDDqWnpwYZvh2TGBYsNLAn0kUhe2YDYgA9rCjhL9Jhsbdc
         8cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=70nxwZafCYlFjcUnZixCqBC0Lk3FuIHCQ+uw4WwvqpE=;
        b=brugCaxj6fOe81qoZ5D+nHFtet0VsbuF+3o+wKlt9sDpl+zPtYfnW2D+mErXwHuSjH
         2UYSR3fM03O+McVkxjz/dyvWUF7+H57AuEKKaKbm1iNeZg9TdangQ5+AyFySQWAmP+7x
         k2jBekmxxg+sXDFz4xj84siLqKobUhSqAr9QI/59Y5QxpNHYo1nmwq18st2TuepruD9S
         7x7V7LuaZ/aC+pUBGIbdEaO0nyTgLzE1QYYfkhuOl3Qx8sWmqBV8vD8sRQG1ctoKHUvV
         CKvyBv2+JN8sVWoNwNvJg/DIkaEEpuBVO8Pl6/tnhCGveiCjaY2kJR+ZJxqjIgJgeU4E
         uzsQ==
X-Gm-Message-State: APjAAAUzoEp9Tjau5rGDQdFetH0XPkoy652ZBkqd2BJovOkXnbKXJJUy
        WXqM4f2sCzL96RRRFWGyltUJ
X-Google-Smtp-Source: APXvYqwWNvpYuoAKFJIPuEaLE90pJKDy45SbYeGRmqxwMmb5psxMyRQAQGmgh+XC3kxow/1OOYyjLA==
X-Received: by 2002:a17:90a:2069:: with SMTP id n96mr12892621pjc.4.1566067036517;
        Sat, 17 Aug 2019 11:37:16 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:909:4559:9185:a772:a21d:70ac])
        by smtp.gmail.com with ESMTPSA id 33sm8588640pgy.22.2019.08.17.11.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 11:37:16 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 7/7] clk: Zero init clk_init_data in helpers
Date:   Sun, 18 Aug 2019 00:06:14 +0530
Message-Id: <20190817183614.8429-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190817183614.8429-1-manivannan.sadhasivam@linaro.org>
References: <20190817183614.8429-1-manivannan.sadhasivam@linaro.org>
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

