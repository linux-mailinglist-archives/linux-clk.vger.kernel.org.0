Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E62F4761DA
	for <lists+linux-clk@lfdr.de>; Wed, 15 Dec 2021 20:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhLOThR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Dec 2021 14:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhLOThQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 14:37:16 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181DEC06173E
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 11:37:16 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 13so34806306ljj.11
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 11:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dpfak9IwmmtFH3h2NvKTM+0dnKvYjhEYViGpC1/Ong0=;
        b=ufI7SG8KSRDSTP+uYechuUxBs0VGZyLksb5GJ7mlbc+wIcGumyZhkjRIL5ZLnGrfrO
         Z+DWzJa1j3ayCB51aDNtvXSE3PPEDsJq3TfYrVHU9rPS7YMwwVqRS1B04OvaJ6JrwoLK
         UR61hudL43F2YmJHNH9c3JSwkLC5BCHw39Zjqen+lKVRUod+9EatiBCYqSNTzttYy0Bd
         mw88rQcjXHh6XFxvYUJTi+ZCD8fTixTGDC1WYKCeLFHgSwljRXbrWsY8wlO4Y2FnGN6g
         BXnzVO1chkrN2+KUS+CIXYlZ3sz2Q6rVU5kDMs5SDFM85nbwV9ylbnOOxpj6yJQfJZU2
         l7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dpfak9IwmmtFH3h2NvKTM+0dnKvYjhEYViGpC1/Ong0=;
        b=OClA05J6q08bzQe5dOV7B1hFHUpQAayicVkElIPQPTCPNQx5qjZChOv2l9dtPIcxFV
         E7TH2YCO0hbCkVg7TPV1AGeMDgMio3h6yeDKloYjy7we6sCj1DozLV9ui3UZ7BbhaR31
         dfhchJ4FVWjT1ltmMmKAD5qwNFl3jYQOygMCqTXA9dSF+isneuvTBbcqsnE8M7vR67Wi
         Gq0fQm0zo1/bIBAsR3CRu5PVtZ0VgepHAcECBnXmXdpXYAR5Jn2W+u9b3IhO4U+ljhhk
         nS/dKKF+UoNxfP2+n8ck1hQv1rG4lhhUq3xx941QY2KMWq9/sZx+Otb39XMwJ3HpLss+
         Bs5w==
X-Gm-Message-State: AOAM5315Ca2+8QBVavzruptOeI35FwPX4Vj6OKUWrNb6ELXYBGQimjF4
        Yh+xVRLKSgeLf4aUb5ihj9Y7Yg==
X-Google-Smtp-Source: ABdhPJzLoqiZRPoVY/RRnzMEBEQafeZiFCKLyvOnbpLUQQcPqMY4X5it+Qwcgov6iC/dzaJNKzL9og==
X-Received: by 2002:a2e:81c6:: with SMTP id s6mr11687895ljg.302.1639597034407;
        Wed, 15 Dec 2021 11:37:14 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 02/16] clk: qcom: gpucc-sdm660: get rid of the test clock
Date:   Wed, 15 Dec 2021 22:36:50 +0300
Message-Id: <20211215193704.2821775-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index d170353eccf6..8271696d21b4 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -29,7 +29,6 @@
 
 enum {
 	P_GPU_XO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_PLL0_PLL_OUT_MAIN,
-- 
2.33.0

