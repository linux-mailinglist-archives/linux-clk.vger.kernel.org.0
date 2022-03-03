Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5A44CB986
	for <lists+linux-clk@lfdr.de>; Thu,  3 Mar 2022 09:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbiCCItv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Mar 2022 03:49:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbiCCItq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Mar 2022 03:49:46 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA8C167FAC
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 00:48:59 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id i1so3477898ila.7
        for <linux-clk@vger.kernel.org>; Thu, 03 Mar 2022 00:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=20eucF22WnDJBIef+XBNRtcVtRBLlgGa2MbsKG7djtE=;
        b=WRmS1nSKnowdulkfNW0XaOlwXV6i5MaLkYTLP6c/mA8ELeUYYD2/4UMUQz1hP5OwVH
         v+/ZhJ2DfoIVg307iUV9IE8nTm5d2utdmYHxRsFBz/aQY0ZwMmtMD+bs02YYTLtwcICf
         FRGI0ujPDvZVrCMJ8uVyIEPoFT2AJTAcXAuY8mso33l1KfVQGf9BZY+bnYzd6fp8ofOa
         QezsW/wYOs9AaelbwraR8KBXijUSuEVN9Ts9C5JDLdjTHrE9PvrI/Y+9uWoQh+jtWDFd
         zYWxZAiQxlb37/1TaMSbeJgOmqUgGK/8d9IELq7RytZeQyY7eXLltsnOBcTsshu3Nwkb
         RK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=20eucF22WnDJBIef+XBNRtcVtRBLlgGa2MbsKG7djtE=;
        b=2UHuYsU5Oap5w/cX9UPaDV+WOmXpxrHUkvIsdbpz2TQp6bg0BiTFPMueM3BSB4HlVy
         uHC9pqhrLyy8RAvu4Qr5DBbJHNtiETO2HlfIBW9LXGhSUGs2ev7CPthmxuEuTEcKxjZ+
         wSZcYv2jMXqbzN48/NHzxZYXATe41R3pnuviDGike4/uZrhatNeu/4yx+3Bb6pYCEhHu
         2zYHd5lJCobohAkAGkRjNYE5H00uZRGHqritHKiauml8FaqP+K46nC3EDkYZkEVczV00
         G5F0QSqmT9/TT/G0+nnqXpUwuRbN4xUeSSLRGPC5ix305d39GdQvKSJbhFWVswvMnonM
         3F5A==
X-Gm-Message-State: AOAM5311DA5m1/7bH92KuEzoZ+69Og5hW7g6vMjRPYg8/pHETARorVDx
        zqhFD5T0wssotdn4zy3ZnZFFfw==
X-Google-Smtp-Source: ABdhPJzTkoONlJPJvab6E5fmAv8yEhiOczk66QANB+yBCAJzPoaRlEd5eRfuL5uY1vnssHy4GG6Ysw==
X-Received: by 2002:a92:c8ca:0:b0:2c4:ff8b:98cb with SMTP id c10-20020a92c8ca000000b002c4ff8b98cbmr7537222ilq.183.1646297338443;
        Thu, 03 Mar 2022 00:48:58 -0800 (PST)
Received: from localhost.localdomain ([182.64.85.91])
        by smtp.gmail.com with ESMTPSA id m9-20020a923f09000000b002c2a1a3a888sm1480704ila.50.2022.03.03.00.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:48:58 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v3 4/6] clk: qcom: gcc-sm8150: Use ALWAYS_ON flag as a workaround for emac gdsc
Date:   Thu,  3 Mar 2022 14:18:22 +0530
Message-Id: <20220303084824.284946-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
References: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

emac GDSC currently has issues (seen on SA8155p-ADP) when its
turn'ed ON, once its already in OFF state. So when the 'eth'
interface is turned up, it fails (as RGMII CLK is unavailable,
which is gated by emac GDSC) with the following logs:

  qcom-ethqos 20000.ethernet eth0: PHY [stmmac-0:07] driver [Micrel
                                   KSZ9031 Gigabit PHY] (irq=150)
  <..snip..>
  qcom-ethqos 20000.ethernet: Failed to reset the dma
  qcom-ethqos 20000.ethernet eth0: stmmac_hw_setup: DMA engine
                                   initialization failed
  qcom-ethqos 20000.ethernet eth0: stmmac_open: Hw setup failed

So, use the 'ALWAYS_ON' flag as a workaround to describe emac GDSC
for now.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/clk/qcom/gcc-sm8150.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 08ba29e3a835..76485bff7240 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3454,7 +3454,13 @@ static struct gdsc emac_gdsc = {
 		.name = "emac_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR,
+	/*
+	 * FIXME: emac GDSC cannot resume after GDSC power off:
+	 * qcom-ethqos 20000.ethernet: Failed to reset the dma
+	 *
+	 * So use ALWAYS_ON flag as a workaround.
+	 */
+	.flags = ALWAYS_ON,
 };
 
 static struct gdsc usb30_prim_gdsc = {
-- 
2.35.1

