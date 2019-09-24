Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA7BBC7F8
	for <lists+linux-clk@lfdr.de>; Tue, 24 Sep 2019 14:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395293AbfIXMkH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Sep 2019 08:40:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41184 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfIXMkH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Sep 2019 08:40:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id h7so1757914wrw.8
        for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2019 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rUdTMX0LV19a/cAOPF7U+URSV6+2wG5VEFj80ZdTTHM=;
        b=geVjrp9r/hIUNuo0vP2rVZicZuqtqycilc5JWitdZhYLvbk3F8QM87WCpD9Jv5WdL5
         5+bCNCqBRLoRuhkuItaW1xAw2Pl2b6KISeC1S3Et2HNOy1Ug9tLhRJDpqUAzly90H6dK
         BUEX5UYm6DCF1zZXitjjl89KDevLAoQHiYCFMg1k4bA7lEzLLeyM4IwzYEplmCgJxZWP
         WZywanPjVo6vKp7B+m08RfbvNZTb38PKNr8bbl+BK8kTMJGeu9MgKJiRhD4ee7DlO2Qx
         gPcgsPzeU0Stk7SI6VxqWolmR4aMBYFTjgK9KRcv8MC8IJQSBaJ2IPQ/fETSw+Ns75Qu
         ekFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rUdTMX0LV19a/cAOPF7U+URSV6+2wG5VEFj80ZdTTHM=;
        b=oatZB7X9J9vpkhWjvnz+VMPyQaAMQz/XbINf9/Qr6BxCng2AcGmR2r8dbZtIjYAQ6b
         c4YZjiePSqNEvEhFwlFWHdjPk+QdaUU/+P59kGn/is/kh+7pdPZ4tH9GAe37VCCcLQeS
         1ELO1SCq/42f4FPlzcwZ5opSNw7sW9sx/D5lYMzA8Kq2S/+I8peC6GUiwsGZEmTUa3ht
         FE1T+ATjOihWDHTbtzIHt+SHICT/3sMOqoDhw12on/ZKTvOwLmcjuY+ezKcVJIaAVzTl
         +EyCd/L/26/EIABsmfZ5ELPbyRfxbF+kWPOx9Fj8OFylC+9sE/UmoWQFvdyFN2WTYc/p
         gmCw==
X-Gm-Message-State: APjAAAWBX6KldHsb+RU5IGMGfbnSLsx+9VuO3SsT/gfrCgtwqlgIKKtk
        f5Vw2f6T7P+4z/65nCBm2VjHsw==
X-Google-Smtp-Source: APXvYqzwerfHRQEyJHbY5+rTHUqQNOr5JHizI7qufMfJPAK96VEw4y+E3DkhnHaBl6xc+Xjo3KdzGA==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr615084wru.286.1569328805014;
        Tue, 24 Sep 2019 05:40:05 -0700 (PDT)
Received: from starbuck.baylibre.local (uluru.liltaz.com. [163.172.81.188])
        by smtp.googlemail.com with ESMTPSA id u83sm2888165wme.0.2019.09.24.05.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 05:40:04 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] clk: actually call the clock init before any other callback of the clock
Date:   Tue, 24 Sep 2019 14:39:52 +0200
Message-Id: <20190924123954.31561-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924123954.31561-1-jbrunet@baylibre.com>
References: <20190924123954.31561-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

 __clk_init_parent() will call the .get_parent() callback of the clock
 so .init() must run before.

Fixes: 541debae0adf ("clk: call the clock init() callback before any other ops callback")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 1c677d7f7f53..232144cca6cf 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3294,6 +3294,21 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
+	/*
+	 * optional platform-specific magic
+	 *
+	 * The .init callback is not used by any of the basic clock types, but
+	 * exists for weird hardware that must perform initialization magic.
+	 * Please consider other ways of solving initialization problems before
+	 * using this callback, as its use is discouraged.
+	 *
+	 * If it exist, this callback should called before any other callback of
+	 * the clock
+	 */
+	if (core->ops->init)
+		core->ops->init(core->hw);
+
+
 	core->parent = __clk_init_parent(core);
 
 	/*
@@ -3318,17 +3333,6 @@ static int __clk_core_init(struct clk_core *core)
 		core->orphan = true;
 	}
 
-	/*
-	 * optional platform-specific magic
-	 *
-	 * The .init callback is not used by any of the basic clock types, but
-	 * exists for weird hardware that must perform initialization magic.
-	 * Please consider other ways of solving initialization problems before
-	 * using this callback, as its use is discouraged.
-	 */
-	if (core->ops->init)
-		core->ops->init(core->hw);
-
 	/*
 	 * Set clk's accuracy.  The preferred method is to use
 	 * .recalc_accuracy. For simple clocks and lazy developers the default
-- 
2.21.0

