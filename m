Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150F65163BF
	for <lists+linux-clk@lfdr.de>; Sun,  1 May 2022 12:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244556AbiEAKjB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 1 May 2022 06:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345358AbiEAKi5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 May 2022 06:38:57 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5164CC4
        for <linux-clk@vger.kernel.org>; Sun,  1 May 2022 03:35:30 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id t5so3064694edw.11
        for <linux-clk@vger.kernel.org>; Sun, 01 May 2022 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dFahH59BOMsWXM1m1iMuw1dze5pfTvPM54N+hMTC96w=;
        b=ZsYViszJSPQ0CaaVe7LHbtreWvu+hh6wFyzUgYcImbRO85R79VjddFcvg0DqPTOWkf
         tvlxfeFeWOkVhyQ5hU0tBNHCTosWfD3K3cFecanf6FULBEbmYpTyTwNDnsRrfogyOTGs
         mslpIInD4bNHjYhMp/qTuqbsFTklUIk7S00yovxXgH27DrxXKvPpxGktacTFk6o2BveL
         KJkqJceYOD8EdwZEmVOioAEie2OTWtpuPYu1ChP6jJuKrPS/lmmKwtmZq+/dDXY0O7xG
         Nx4iDLqpROG9YOlBRrBD9JNbq2g/WzGFmNKwpJO9qIbyf7pK3Zur9res4k2PKyHXCbBI
         rNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dFahH59BOMsWXM1m1iMuw1dze5pfTvPM54N+hMTC96w=;
        b=sUtHAT5ZtDW60Nf/pFOAONf9nLkf9bTcx8WUZTacgAZl1xhYI6sEEWKrErZ051FSBP
         ngebD3riCMEaZZ9kEfWjarfeptm1bP2YRXIKzEWFsYXxtnOjgvZ4k5RnpZZYtEWdCDDP
         HdoY3zezDVfAh+My4mh+P/ydfutBlNmCKQ5wYACsK9NKi4jLrBt7AqzRwZEDw8e6zSJS
         e49OcQgh2pFMAaBpI7vAD8Jrcv3GuehFfrF0IiJts5a/5oK5DYGoZHQKZlKd4/iTya3S
         f9p9VS9WvzjQBER88GxpzMKTgH4Vqv4rwTs7onBTYjRPC7ewNVYqsSbAIq1q+IpOF8+r
         5eiA==
X-Gm-Message-State: AOAM531nmjrMR6BrFU/5wTHC0bnSorzsW1Bb0OJZe7NZ2LFlKXDTveLM
        EcPFtNx8h7mztXTH1I41A91EbA==
X-Google-Smtp-Source: ABdhPJwLmaRoTqZst6tN49r43f4yAahFJ0alIb3Z4IVETYNUR5niWASmJ/VJyCHQ859CysoQbtz/JQ==
X-Received: by 2002:aa7:da4a:0:b0:425:d676:9684 with SMTP id w10-20020aa7da4a000000b00425d6769684mr8236501eds.248.1651401329043;
        Sun, 01 May 2022 03:35:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zp1-20020a17090684e100b006f3ef214df1sm2464438ejb.87.2022.05.01.03.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 03:35:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/8] clk: qcom: alpha-pll: correct kerneldoc
Date:   Sun,  1 May 2022 12:35:13 +0200
Message-Id: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Correct kerneldoc warning:

  drivers/clk/qcom/clk-alpha-pll.c:1450:
    warning: expecting prototype for clk_lucid_pll_configure(). Prototype was for clk_trion_pll_configure() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4406cf609aae..969d98fca5df 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the lucid pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.32.0

