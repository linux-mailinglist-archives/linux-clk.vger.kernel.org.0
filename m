Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30004506695
	for <lists+linux-clk@lfdr.de>; Tue, 19 Apr 2022 10:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239279AbiDSIPr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 19 Apr 2022 04:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349742AbiDSIPq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 04:15:46 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A483B2981F
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 01:13:04 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id z16so7888741pfh.3
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 01:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9UGfUGNG7X7pDsugCO6c2wWlLkIg3A+ba1SS8g2x2V8=;
        b=kE8h371r7KC1WaB3ptxODLKDwE0ME5VqByHNlLGRopQPgn2hRU94zG31+kIXMHFiWH
         sK2EgH2cU6NQzQ9myTtIxaTanQSuTrC4/Yt4PkcmH7iYRm8WPWkbhB9rxnHwSlUzi/Mh
         cTo1xx5oc5nXSEpwafQUqpsyUwugP+wJC5S2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9UGfUGNG7X7pDsugCO6c2wWlLkIg3A+ba1SS8g2x2V8=;
        b=VxnUvZbu8HjXJY4p7WyOAmRCy27uG0zvtogXvSgUdTF8RJ5fQO3haf6TIT77ymy7eB
         9yunSmMdpZT/KnP6R129gHqxbhboOKEDALPcU1I9SmCVkzEQpS/Hhkd5J4VIsd3yBBI2
         r2stSg882CZlGFH1wAr+haL08Jugbnfovoli1baKrdUCzlSubOGoN/PyO9NCgTZXg3EF
         FBao4fzGZa3HzcGZUElpLdZm/I5YBZsQL+p4s2Emnr4twpfcBLiY9wlSFdOH0rHnn6vD
         C1004+ZFre+HVaqy+yG7X+ItJ4d6v09ugdyhxW49VEghUUIl8dc3FODg9rMASas2jFBa
         doIg==
X-Gm-Message-State: AOAM531kDCxsww6wHUFc0KPB/QMkK7ZHtJSEKkv4DUcqQyMxvFgxpiSr
        rBP5rt0FfW+R0w7otXyrLxy/lB2Pf70XIA==
X-Google-Smtp-Source: ABdhPJwFAqU0I4hg06PcLzrE0VtXM7yjQUzD3S0oIMtis8FukDJaRIF7kf/NYED/Wq9Kyzv6atT9sw==
X-Received: by 2002:a05:6a00:cd2:b0:50a:7685:8055 with SMTP id b18-20020a056a000cd200b0050a76858055mr9021699pfv.37.1650355984158;
        Tue, 19 Apr 2022 01:13:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:33f6:f1e6:3e21:a253])
        by smtp.gmail.com with ESMTPSA id n13-20020a654ccd000000b0039db6f73e9dsm15767448pgt.28.2022.04.19.01.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 01:13:03 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/7] clk: mediatek: apmixed: Drop error message from clk_register() failure
Date:   Tue, 19 Apr 2022 16:12:41 +0800
Message-Id: <20220419081246.2546159-3-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220419081246.2546159-1-wenst@chromium.org>
References: <20220419081246.2546159-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

mtk_clk_register_ref2usb_tx() prints an error message if clk_register()
fails. It doesn't if kzalloc() fails though. The caller would then tack
on its own error message to handle this.

Also, All other clk registration functions in the MediaTek clk library
leave the error message printing to the bulk registration functions,
while the helpers that register individual clks just return error codes.

Drop the error message that is printed when clk_register() fails in
mtk_clk_register_ref2usb_tx() to make its behavior consistent both
across its failure modes, and with the rest of the driver library.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-apmixed.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index a29339cc26c4..06400c043fe7 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -91,10 +91,8 @@ struct clk * __init mtk_clk_register_ref2usb_tx(const char *name,
 
 	clk = clk_register(NULL, &tx->hw);
 
-	if (IS_ERR(clk)) {
-		pr_err("Failed to register clk %s: %pe\n", name, clk);
+	if (IS_ERR(clk))
 		kfree(tx);
-	}
 
 	return clk;
 }
-- 
2.36.0.rc0.470.gd361397f0d-goog

