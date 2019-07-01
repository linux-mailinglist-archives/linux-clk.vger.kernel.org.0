Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1D3725B95
	for <lists+linux-clk@lfdr.de>; Wed, 22 May 2019 03:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbfEVBPv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 May 2019 21:15:51 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38653 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728261AbfEVBPv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 21:15:51 -0400
Received: by mail-pg1-f193.google.com with SMTP id v11so404879pgl.5
        for <linux-clk@vger.kernel.org>; Tue, 21 May 2019 18:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NTS1odQw+3K/o26m56A8dudsgiFBip3uvfuWtKKFHvU=;
        b=B3XhrGinnvN8sKjWn4ooBhJDwiBZy++xwD3PIwifiEQmGkn9dXEIXn56iDzEoxfVvj
         buXxk5oR6q/tDHs5OOaUOkRWM1sLkSX4JU0PyfPJCY/0ZHnvNjW+5t6L/klL89CpmkOU
         RskDCpXRp8Nb0ntd+sjYiNmTwpWddBd2/vc+Qss6vnBNh0rx9yQ1VlRU+ynGuu5CgZL9
         riuxQgdodNGLJ7JIcSjyTdkhtNXRSVa4DnyqinGH1zfrS2v3sYsMbbBF1l5tT5dXe7R0
         umoIlSFNx9D9SlsIIXLF4fISmz0vBqrgIOvMii2WHcJXQ3fqvIMmHOW5xZARBO3AlqvT
         jDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NTS1odQw+3K/o26m56A8dudsgiFBip3uvfuWtKKFHvU=;
        b=UbRRellT90mKPBI46Qj9GFWJ/nxijG7ftblnE/oegTEsJnVhle4BK+MPRNZDSvRIog
         MxiLMks/MIHrChlWq2vp8TKc/fTrP/Chiq2KLYUZ9mkX6zrBhKSRPOQ8kR7HrHjfW0yE
         7ULxWY9vD/eZ/OxATRTISWsK1ZouElkng+rGnnl+tJr1PTwiPZJ/HfWpVJ6qpBdXc+CQ
         c77yNuDnjL0Vzd74yvnxr5VqxdMi7QZEQWd0B6awhE4WWsqdkSw7oCDoRl3z6sWxBGfJ
         xh9yRkiQkPentU3rKjMyCR9KCqoQsqMFUJAF4HbqsRDAhzTNQCw3VyVErvvLM+7z2ziY
         tWKg==
X-Gm-Message-State: APjAAAXQpKmI6ayNE/bcPTa4Y1nIYWEIR4rzzAKPdsc3hmjlezZCiZ8f
        dzKFJTvmOQ5yI/3fdOnEI3lA6A==
X-Google-Smtp-Source: APXvYqwCHdfP9ydZV/hnCl50oxwldTytQuZ5sT/dbQl5TBOLCFSD6z2kQzBhyOjfPNocbs5fbF6ZXw==
X-Received: by 2002:a62:6585:: with SMTP id z127mr52504792pfb.179.1558487750638;
        Tue, 21 May 2019 18:15:50 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id e184sm31756061pfa.169.2019.05.21.18.15.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 18:15:49 -0700 (PDT)
From:   Chunyan Zhang <zhang.chunyan@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 3/3] clk: sprd: Add check for return value of sprd_clk_regmap_init()
Date:   Wed, 22 May 2019 09:15:03 +0800
Message-Id: <20190522011504.19342-4-zhang.chunyan@linaro.org>
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
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>
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

