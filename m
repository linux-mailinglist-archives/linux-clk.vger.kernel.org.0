Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E63A108F6C
	for <lists+linux-clk@lfdr.de>; Mon, 25 Nov 2019 14:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbfKYN7k (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 25 Nov 2019 08:59:40 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41550 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbfKYN7g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Nov 2019 08:59:36 -0500
Received: by mail-lf1-f65.google.com with SMTP id m30so9251048lfp.8
        for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2019 05:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4n0b7csmummMNxZyeaSszKbcnCZgkdyzjnJK7yDR57M=;
        b=k9ZRUQYDRGLuJPThscWn5IqxsfcWQDaQNqRK8f+eV8GDXkdsHk7cLxpS1kIb7q/TK9
         doPl76pMJCXckPDBFOzdRQr3C7Wi2JVgxyFnVsl7NOXHGiUQoa8fEXoybWLyMiJqjo8U
         s+pKy6+ty7tBmr8QqFWAzRuvPPvh9/EbUX8nXGO8HBjTHjiK6ciyITdid+9OZI7nLLQe
         1jjYyrsMn/ufrJQ4b5A36nNfwz4R/PxnMoNRUGPOUYogvGMIUnC53s5VZFGg2vON5xag
         tDndGeXXm/WjVSYKyWx9qXaO8zaMxqOaTVUNQhMmGG+vWczNUwpjQBAqquoO3sJ5m7gI
         n/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4n0b7csmummMNxZyeaSszKbcnCZgkdyzjnJK7yDR57M=;
        b=bTMAUQCoHfuKfm6Com6Qwyvfa6bv53r1WmZMpG9PUlwatWYuSUnbN3eCftJh+9sciJ
         lqzj5oxAZ1W7TPy0WsNgvJsPrGH2JMPst1K75BHJgSk6SmuoqeH7aWd5s1/A+1fHcxJ+
         Sm8DpZmF+rOWnWttkP9lNjeI9cYE/0xP8+vxa1SXPKb+HYd3IEAsa1SrJVvpfwrzZcOb
         y0O+vWyO23M2RQPUeKVJFfJjTfPQMifWwTXqImPwj1J7156HG/aPZAhFFQxpqlB0Tb8Z
         0ru5jx6UvZYfCZZislpmtceH2hWjMcLsEHEruqmMcXB3Qj4L8PDiHJkyTos/CNqQSsVs
         4IVQ==
X-Gm-Message-State: APjAAAUhuQUI6wWmuw2TzoZ/SoYHmNPpFER1jwhxJNav4wMqItDbVvhT
        yCbQWSKx+DcA2VHLphfMovEWkw==
X-Google-Smtp-Source: APXvYqyiHXeKNwXqDrb4oHFdRVQdKpRXMlAbnVYruSqWq4Q1yyx/xP5Xtz1cAP8usAyVBwZR4O49+w==
X-Received: by 2002:ac2:5305:: with SMTP id c5mr20326251lfh.55.1574690374722;
        Mon, 25 Nov 2019 05:59:34 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id s23sm4041871ljm.20.2019.11.25.05.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 05:59:34 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] clk: qcom: hfpll: use clk_parent_data to specify the parent
Date:   Mon, 25 Nov 2019 14:59:07 +0100
Message-Id: <20191125135910.679310-6-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125135910.679310-1-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

This permits extending the driver to other platforms without having to
modify its source code.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
Changes since v2:
-None

 drivers/clk/qcom/hfpll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index 225c675f6779..5ff7f5a60620 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -53,7 +53,6 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct clk_hfpll *h;
 	struct clk_init_data init = {
-		.parent_names = (const char *[]){ "xo" },
 		.num_parents = 1,
 		.ops = &clk_ops_hfpll,
 		/*
@@ -65,6 +64,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 		.flags = CLK_IGNORE_UNUSED,
 	};
 	int ret;
+	struct clk_parent_data pdata = { .index = 0 };
 
 	h = devm_kzalloc(dev, sizeof(*h), GFP_KERNEL);
 	if (!h)
@@ -83,6 +83,8 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 					  0, &init.name))
 		return -ENODEV;
 
+	init.parent_data = &pdata;
+
 	h->d = &hdata;
 	h->clkr.hw.init = &init;
 	spin_lock_init(&h->lock);
-- 
2.23.0

