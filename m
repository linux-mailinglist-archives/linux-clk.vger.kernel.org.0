Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED45033F035
	for <lists+linux-clk@lfdr.de>; Wed, 17 Mar 2021 13:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhCQMWv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 17 Mar 2021 08:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbhCQMW3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 08:22:29 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5A4C061760
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:29 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id y1so2847085ljm.10
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NDXHpCb5h3W3+zF4OjuQq512OaSqWRquW+9LthWR0MA=;
        b=nCrhBwAm2BprqYZMkZcuI0Tvkm2pXt6L9RkXQgIimyrTd7n9oMzmrmYeMM3UfW/GVc
         WbBMIVquy6y/cSJVe7JcDHoJYjiprjlwq/QjvYTC9aY6uhoQcR3+69sVQCNTKv4pqFbe
         lsTwJ47MtzevxMdZef1gNoJnwrPTBpNxtImx87geNz6pFPlpJ/M9fJ4gZptiLD9kOagA
         8irXSCLtfa2VodbIpwAS/uiCGRMp6I0fYLbMBbOnaJCZXinf2epqAEBbdA2YlzKWGSqU
         IJMGz52S8DT6jGqVQsbKBt6Buaj4FX6qL4TWxhy/raw4rBhhEcJjv9G3Wj9HjJDl9XfW
         ukEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NDXHpCb5h3W3+zF4OjuQq512OaSqWRquW+9LthWR0MA=;
        b=pCXzkpmyJXQfr+IjjKQujbgL0m2y2+C7PAvyNyuNutbwTLFDMmq0/hYr2QkFPIyQMg
         tNW+QsRb4HmMDOuLf9Zw7hFBj/U5sXeD/RpNzxHHjoUo4jMNxnoKpMckRlDZXzS961Im
         4hijE8vuTVPsGHOj3aCNNqeKTkaPJaMUPKR4xFwCS7wJb5KCOGerPu1zdp58FXBXP/1/
         U0I9Z4vU++QKyZgvaGC66oERm32aWPLpt41AVYSuv7oJZs8wxyVgRhyupHxPq6zoX9uY
         X9fMT8uMVtV8joR4EWaum1RjUyGU5ju502+YNxBHlMhQzsn8p2cNnirWhWZNkzEWFqy/
         y3qA==
X-Gm-Message-State: AOAM533agopWYP+PaRpw1lYzHBwWtOoJw+o5l5qyGzDBHBDlryYnollY
        p9Q3dQXi2qDftOWSAK2mAbph6g==
X-Google-Smtp-Source: ABdhPJzAJAOo2CmwNi980V03PmEbnDOLlS2b52cFEP3rGfKGpR+ItiPc5LdxkIVqcF7hhup9kNYfig==
X-Received: by 2002:a2e:9195:: with SMTP id f21mr2171243ljg.160.1615983747616;
        Wed, 17 Mar 2021 05:22:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 7/8] clk: qcom: videocc-sm8150: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:20 +0300
Message-Id: <20210317122221.439105-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
References: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8150.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index 3087e2ec8fd4..de09e5456555 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -20,8 +20,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL0_OUT_ODD,
-- 
2.30.2

