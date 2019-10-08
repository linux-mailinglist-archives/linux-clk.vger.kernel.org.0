Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEAACF417
	for <lists+linux-clk@lfdr.de>; Tue,  8 Oct 2019 09:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbfJHHmE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Oct 2019 03:42:04 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35515 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730362AbfJHHmB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Oct 2019 03:42:01 -0400
Received: by mail-pl1-f194.google.com with SMTP id c3so6630661plo.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Oct 2019 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=2fURBUxy7kUtYmeZp2XZ00W6cQyOn6QtabdpUGQ4D60=;
        b=eN9IOY1D4JQEhqeD44A6DLSptkIVd9EhQ/T4ofBMp9tMybypG0GD+jceTeEDFwcwV7
         pX90ySjQ5ypCgooLkJtxt3hhiI9btIxC2oZWRlJTA/XGY2xE465JEYP/jh6TVRHRbRei
         +iZFx52+vEmaikMY6Xd65ZTnvtPZZhVEITp09SG76jmRAi9ykhVh54pgk6wweIWH0A6k
         qZtrJhqn4zf9OSEs3ILwYWXfAdJ/tmC/KKvMP3qhdl5TIfCg2mwvzpbgxFFAB/Rklut/
         WC1HZnyvgj4kDwjviC8/NfJEL78LAc/JWbztrIUBvdsL14/6NBJ8/H6YV5r8icot/B+E
         9t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=2fURBUxy7kUtYmeZp2XZ00W6cQyOn6QtabdpUGQ4D60=;
        b=RD8nqQd+jQnuknBnzXNXFV5icmYWK/BmPh/ivaKRQfbm/I23uhSgChBKxHIqlWiDwU
         wyyFZfBD+2vASOuE0z1wbrocJCbdJYmpoIoelH7CNh+7A1cADfGcYXj7L+dhinfyAmL0
         OsGm5s1uWLi0tuCyDkdlY0BiCPl4GbL8rervuN7/XA2cvjUJbAn8iNqfLxZGpF9r/U8c
         OyNOP5oS6Qmp9PnmoOMPXFEXAAiFOh/m2L3XfQyV/Pz/+Xj582Q+OaF+69QT+8SygqsM
         vLko1O4ihKeQzUwdnZFnX9Bc2TTfVNhBWC4YBkZTGiBLAAXk9ldECa+haGgHQZ/8ks4N
         FLmw==
X-Gm-Message-State: APjAAAWYVzYrK6ExdvswCGPm8p5k32gNiNcH5AFw6F5/sVWNSF6y1uPO
        An94LfIIHqcV6MWjutzuqStQUg==
X-Google-Smtp-Source: APXvYqx4yx63wHZRg9innu1QmsE+S9mEbWtE9KI7zgBRFk/4iSCLPMEPKXa8fosu99z/4tYcXy5EOg==
X-Received: by 2002:a17:902:8c8d:: with SMTP id t13mr2644087plo.3.1570520519051;
        Tue, 08 Oct 2019 00:41:59 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id y8sm18231363pge.21.2019.10.08.00.41.56
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 08 Oct 2019 00:41:58 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] clk: sprd: Change to use devm_platform_ioremap_resource()
Date:   Tue,  8 Oct 2019 15:41:39 +0800
Message-Id: <841d26a2adb4bf3b4423f82a41dd3f1346413db6.1570520268.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1995139bee5248ff3e9d46dc715968f212cfc4cc.1570520268.git.baolin.wang@linaro.org>
References: <1995139bee5248ff3e9d46dc715968f212cfc4cc.1570520268.git.baolin.wang@linaro.org>
In-Reply-To: <1995139bee5248ff3e9d46dc715968f212cfc4cc.1570520268.git.baolin.wang@linaro.org>
References: <1995139bee5248ff3e9d46dc715968f212cfc4cc.1570520268.git.baolin.wang@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together, which can simpify the code.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
Changes from v1:
 - None.
---
 drivers/clk/sprd/common.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
index 7ad5ba2..c0af477 100644
--- a/drivers/clk/sprd/common.c
+++ b/drivers/clk/sprd/common.c
@@ -42,7 +42,6 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 	void __iomem *base;
 	struct device_node *node = pdev->dev.of_node;
 	struct regmap *regmap;
-	struct resource *res;
 
 	if (of_find_property(node, "sprd,syscon", NULL)) {
 		regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");
@@ -51,8 +50,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 			return PTR_ERR(regmap);
 		}
 	} else {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		base = devm_ioremap_resource(&pdev->dev, res);
+		base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 
-- 
1.7.9.5

