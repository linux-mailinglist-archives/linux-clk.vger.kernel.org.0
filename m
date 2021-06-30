Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE713B8ABD
	for <lists+linux-clk@lfdr.de>; Thu,  1 Jul 2021 01:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbhF3XCc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 30 Jun 2021 19:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbhF3XCc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 19:02:32 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C6BC0613A2
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 16:00:01 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id r16so5565123ljk.9
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 16:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k2pJB7kzaE3cwUXfHhNQ/snYVpRf0hIxIEPV1H568iM=;
        b=WQMWBbh5E7uFL+sdKynMR23K2epZrvv3d4qdbf6GF8N9TPFO3CTH0nNaPMpQr18zHI
         NchhLl8+kfXh/baqTNO1GQ4rAya8/b7DrXUKXQaEN3I5ypnoERDP8gc9GS6Sv2oTbBYX
         DaljhoS7YvfdC4yRH9Mq28F6CpU/ksYEadAkiTrFWciqbkP6YOLfgALE8w7PrzBOeU2T
         /N4Im75cLDoShtIRLMI8noQL+QMpYvvMUa9+i4NqG7vwPe599oMj9VB6F8K0/nodcTGC
         i5B53MoDqmG+Ut53PmgeiYGgw26akNXOD/Uxpn9NUkbuI2R//4vE1uUW7pFeycjMMEpS
         kAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k2pJB7kzaE3cwUXfHhNQ/snYVpRf0hIxIEPV1H568iM=;
        b=A6cBiHo7tOrLanty66IxLSLWx8ngtRcMWQlB1inUQFXm8w4IGGbg7EZDLGNaThm+Jm
         NlRFQhJd9dupUDp65TQGlFvd6rIy/ynU6WpW6Q9CeM2EX1Ci6AQJ+FgEsugRvMQuMVU3
         gLN4YOBWU8vvD0fkcZmjEqoITn4q6ly+vm9eCCA0yRjrDgpb9PfSU6RkVndXxZoWpBXd
         F4UbWf67uHk5H17zEsQzZQN9pQiV0Lc4urMUyVu3JgFHkt2Fc+o6rSpLUFdV971T2LuX
         IoTahPGOtmHn7G+1BZBGC7M4MzKRZFJHwm3rn82kVPQQM5mzFIyoAPsZ3XDAeBb2x3cm
         gUGg==
X-Gm-Message-State: AOAM531mk0QcvS3mkz6ovg+BVhRg7TapRUQtEEukV4ldFDDOYH9wExyS
        vFbUzFXRXmt9LF8pyOoSOqxOhQ==
X-Google-Smtp-Source: ABdhPJxkhDC+h4AoEfXwYVO2x0gOF0wkHRTyTcE08z0FVKoc2n7DoipLQRwfZA/ieNd0AL8GNgG3hg==
X-Received: by 2002:a2e:6d12:: with SMTP id i18mr9640228ljc.88.1625093999698;
        Wed, 30 Jun 2021 15:59:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm2324444ljn.125.2021.06.30.15.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 15:59:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 2/2] clk: qcom: fix domains cleanup in gdsc_unregister
Date:   Thu,  1 Jul 2021 01:59:52 +0300
Message-Id: <20210630225952.3337630-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org>
References: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Properly remove registered genpds. Also remove the provider before
breaking parent/child links, so that the system is consistent at remove
time.

Fixes: c2c7f0a47493 ("clk: qcom: gdsc: Add support for hierarchical power domains")
Fixes: 45dd0e55317c ("clk: qcom: Add support for GDSCs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 241186d9d08c..9e16f234ce6c 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -475,14 +475,26 @@ void gdsc_unregister(struct gdsc_desc *desc)
 	struct gdsc **scs = desc->scs;
 	size_t num = desc->num;
 
-	/* Remove subdomains */
+	/*
+	 * Remove provider first so that we can remove the genpds without
+	 * worrying about consumers getting them during the removal process.
+	 */
+	of_genpd_del_provider(dev->of_node);
+
+	/* Break subdomain relationship */
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
 	}
-	of_genpd_del_provider(dev->of_node);
+
+	/* And finally remove domains themselves */
+	for (i = 0; i < num; i++) {
+		if (!scs[i])
+			continue;
+		pm_genpd_remove(&scs[i]->pd);
+	}
 }
 
 /*
-- 
2.30.2

