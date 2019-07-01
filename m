Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9398125B97
	for <lists+linux-clk@lfdr.de>; Wed, 22 May 2019 03:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbfEVBPy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 May 2019 21:15:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43614 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbfEVBPx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 21:15:53 -0400
Received: by mail-pf1-f194.google.com with SMTP id c6so365780pfa.10
        for <linux-clk@vger.kernel.org>; Tue, 21 May 2019 18:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4R0Z1avkl5DcwArAEdYF5RKsOqx23+ElfNwQfhlhU8U=;
        b=N+QM6K+mnnUhvHa1pDTd4k5bms70Vaku4Jjp/BA2dHEnOKKOnLtyIKbS/22xAaO5WJ
         sqV6/CiZpmxKCDFjs1WN4GbfR+dwiBNCrkD/fGw1TgFbrIuB2fFGHlqzCOA16m6sgSts
         B7bFD7A12JdmPrjFhuEHpW6gIsDlHC52uzpG/x96Rsq4sBLNNDKBmaBNxpPNlPqIDhMH
         VdhqfkIvdXLUTSgi9+hjW9/+yJDhs303p/1dV1ki442GfeO0gj8pvyBcVXXbA2RqxvXI
         xOwYpHkDQD6docsy8KCY2NjXUrUPU/j/IdJMNHDkG3gYHfNPCIUo+2XJpvREn7X8+yy2
         Xo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4R0Z1avkl5DcwArAEdYF5RKsOqx23+ElfNwQfhlhU8U=;
        b=hBIVg0RMNvBG2iaE2iOy2epyy3vjHVRhKFEId2bGbjYa4ovKe+bZk+YpB/EbqDZ1q0
         NgUC8W8DhqYjZe/d5lql53k1VxCPQQjrkM4xtYU/52XWiyRvQoDB/Y9fn8MUIfoxh6MN
         3YRJSwsqcxEEIsuE8Ov0/jdfCo1xXZj1WDO+JZJYUylWCjzY9jdMQYO0aMsSpMokpJNA
         T/T7aqs/D+t6seWjth0U6OR9VG4hflrOCK2mMI50esFfozBiRnK7J6z9fEE6ijjNcnjJ
         ErlycNa7omdY0KnWUf01si8QWSWwotqeqPS8iHxYOF7pzknfvOj2THThmEZW+vJuDJHb
         3JDQ==
X-Gm-Message-State: APjAAAViJWoKZ51kJzCk1SfqHzQU1jlrUAooPUXEkTb8i3yZRVUuhtxO
        2RrweXyWHzmChv+uhfaz0hQPLw==
X-Google-Smtp-Source: APXvYqzbklwZKF6I8bdsKqHWeztOzDBBspaVQu25VOCc+BGlsekcn7V3hdflg1i8vRhnSKdoGmRD3Q==
X-Received: by 2002:a62:640e:: with SMTP id y14mr72010463pfb.109.1558487753226;
        Tue, 21 May 2019 18:15:53 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id e184sm31756061pfa.169.2019.05.21.18.15.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 18:15:52 -0700 (PDT)
From:   Chunyan Zhang <zhang.chunyan@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 3/3] clk: sprd: Add check the return value of sprd_clk_regmap_init()
Date:   Wed, 22 May 2019 09:15:04 +0800
Message-Id: <20190522011504.19342-5-zhang.chunyan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522011504.19342-1-zhang.chunyan@linaro.org>
References: <20190522011504.19342-1-zhang.chunyan@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

sprd_clk_regmap_init() doesn't always return success, adding check
for its return value should make the code more strong.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
---
 drivers/clk/sprd/sc9860-clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sprd/sc9860-clk.c b/drivers/clk/sprd/sc9860-clk.c
index 9980ab55271b..1ed45b4f2fe8 100644
--- a/drivers/clk/sprd/sc9860-clk.c
+++ b/drivers/clk/sprd/sc9860-clk.c
@@ -2031,7 +2031,9 @@ static int sc9860_clk_probe(struct platform_device *pdev)
 	}
 
 	desc = match->data;
-	sprd_clk_regmap_init(pdev, desc);
+	ret = sprd_clk_regmap_init(pdev, desc);
+	if (ret)
+		return ret;
 
 	return sprd_clk_probe(&pdev->dev, desc->hw_clks);
 }
-- 
2.17.1

