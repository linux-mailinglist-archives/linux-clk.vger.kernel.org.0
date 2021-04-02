Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D46352562
	for <lists+linux-clk@lfdr.de>; Fri,  2 Apr 2021 04:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbhDBCVT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 1 Apr 2021 22:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233665AbhDBCVP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 22:21:15 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111B1C0613E6
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 19:21:15 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g8so5615262lfv.12
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 19:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dCFJAklUokvx3G+IzOXh/1EQ/pUoJjWKvsCg2z2tyJc=;
        b=yKCSwAzJsYllON1X4f0MZiVGNEe/p9kKBhwuyYntm/HtSj/0qZfovMHHGzawRQDL0+
         1ZAeSt3g+FAdNtRmKREyzL8dkL8cT/BUgkyTdLC/AqYvFWrhxUoYQPcanWdKREhUSoLG
         y9S7OzvhsBDtz/6TkQPJ0LNuX4XkwJsVDGqt5XdPEcvXL2EbR2PCo0Orcgx9agrnzt1G
         dBejI8EcV0bm1rYr6vAeVyiY7EBuDP2IO1XEIxKKY7ZvJ68Slj9xlwm0f0o/o/rw2x5U
         QBnapFANKERG8ISvV/tC+us3xrSRLQ3uYI7BoSQSCMDtsVihBLpkKCj6WtakJzi43tsJ
         Y3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dCFJAklUokvx3G+IzOXh/1EQ/pUoJjWKvsCg2z2tyJc=;
        b=RjIdRutEO6m3XIPzvP6ChJTIOYfiojOORlGYdqRLbsD3QgV/aD4HoRnMx/UssrDzf3
         XYLLqqXSHbWJIxgi0TMycuXC2EutmOsE580tujNcqUiAwH4DrKkWqqzcdz1op+9IYQ2m
         XnqKNPxjwY7npmUMOkxKEUgTwmu/r5lod5KZw+RZWKE4NuzfMXOUE650Sq+JrmTQRhfr
         6pIfgT17T54a+wGZnOwppCvSXyO5mgUjeB4gWZGNEVhN3J2H5XSeceFXNtCS7xM1qaZ2
         YCBWKvSo2UUKr5mvOPkwF6LtUHZWyPe/LPCMPc5xuppIcZ93ILN3YHxZyZb0XW59XFLk
         kE0w==
X-Gm-Message-State: AOAM533JWK3NZB/5Xd0HW13e8bjjVRHsHHHyNihHEIDJAN4/coQAY+4u
        B9KHt7KkDcq/glF1IdBbvS0gIg==
X-Google-Smtp-Source: ABdhPJzjkqgLUDT7lMZ0PDXyeY27rUSlmk6cbSF6Q79WLCppMnhcULGrpha9osGtU/dl74PiLqSYJA==
X-Received: by 2002:ac2:46d5:: with SMTP id p21mr7886931lfo.295.1617330073618;
        Thu, 01 Apr 2021 19:21:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 04/16] clk: qcom: gpucc-sc7180: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:20:56 +0300
Message-Id: <20210402022108.4183114-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sc7180.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 88a739b6fec3..d738251cba17 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -26,12 +26,9 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
-	P_GPU_CC_PLL1_OUT_EVEN,
 	P_GPU_CC_PLL1_OUT_MAIN,
-	P_GPU_CC_PLL1_OUT_ODD,
 };
 
 static const struct pll_vco fabia_vco[] = {
-- 
2.30.2

