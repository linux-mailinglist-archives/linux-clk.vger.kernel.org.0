Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F0DB3E93
	for <lists+linux-clk@lfdr.de>; Mon, 16 Sep 2019 18:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389742AbfIPQPQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Sep 2019 12:15:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44103 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389741AbfIPQPQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Sep 2019 12:15:16 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so254636pgl.11
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2019 09:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RtuYujDQbGoE383NaOTW8yNTTYMDfvcRIoYrv77xBo0=;
        b=Hj6QoIN6KZ6+DhiumykPCijqElZfOah/NzphYnS7V98SDfdJQfhOakb9NSOsbAz7ME
         9PmGP929SZ56sAB1fQ17iyymu1/w7wo0r8yJfKfzQwLPCelP2u+rV01jXg++B4kEGtVX
         nL9TljiPJiRSyfMXWTl1ZHFj45Z+zy1ID9LsuXayael/sHHLjGIw4w8hOycBpZ74Wtb2
         ga/10z3Bz5tHOmdC+oMWG3LFl8/UN24QIAemzNhxmSY01cbgc1ReYhF0dv9ykFP89zxD
         YHzeCDmMnOkqD57pJsZKTPpr3ye2+7dKPkFDkPnj8LiApv6XvKqiujop9pXqJbeWGip1
         SvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RtuYujDQbGoE383NaOTW8yNTTYMDfvcRIoYrv77xBo0=;
        b=K3S6a1yYvNj6LCrQEnmh3K3pkLmXDaQKEn3RcqzM/y+8IUcY6NPslQhbjiJkbTtYzn
         tFiQmeEypUCSrgrl1VDkrokryo9bR4k1ZAaFE5DfV441qUpdGFXCLapD8iMNg5C7XrQO
         vct1QWIN373ECOuizs63gaF1+/kLyBsJNakCZqxZU1u7FzJqjjSf3mIbZoyFQA73aS2N
         YyLxDMi2OwIsJeEGNIPhMM09h+w6c/z0/0Yuvr/QktQtIflg5OiZ4NUR/EqlnAw92I+I
         3L1Li+xdbPtpUTdLrnoi9wGAcXTsQO2t4Ht7Y7rvBQeqatyfP5V9lLSt/qB0ZrQ0grXO
         dpwg==
X-Gm-Message-State: APjAAAUMcBbMlKtDy/vUXQ/+R8WzzywmTFXwR/I93LqznhMgNygde5Vl
        Pf4rKG9wLYWagCYWw3kqfGqf
X-Google-Smtp-Source: APXvYqykGw2se+1YdEpdnu59uhuq+FCf/teB61ZdN3oz9apYHya31RXFapv1QdA8jAI3JZ65NhNx/g==
X-Received: by 2002:a63:10a:: with SMTP id 10mr57256448pgb.281.1568650515328;
        Mon, 16 Sep 2019 09:15:15 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:90b:91ce:94c2:ef93:5bd:cfe8])
        by smtp.gmail.com with ESMTPSA id h66sm614134pjb.0.2019.09.16.09.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 09:15:14 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 3/8] clk: Add clk_hw_unregister_composite helper function definition
Date:   Mon, 16 Sep 2019 21:44:42 +0530
Message-Id: <20190916161447.32715-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
References: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This function has been delcared but not defined anywhere. Hence, this
commit adds definition for it.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/clk-composite.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 4d579f9d20f6..ccca58a6d271 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -344,3 +344,14 @@ void clk_unregister_composite(struct clk *clk)
 	clk_unregister(clk);
 	kfree(composite);
 }
+
+void clk_hw_unregister_composite(struct clk_hw *hw)
+{
+	struct clk_composite *composite;
+
+	composite = to_clk_composite(hw);
+
+	clk_hw_unregister(hw);
+	kfree(composite);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_composite);
-- 
2.17.1

