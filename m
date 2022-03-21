Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E814E3114
	for <lists+linux-clk@lfdr.de>; Mon, 21 Mar 2022 21:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352945AbiCUUJh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Mar 2022 16:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352913AbiCUUJV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 16:09:21 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA27103D81
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:07:51 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id t11so22242857wrm.5
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5/nH1g76OJr2xP0kEzxoO9d69o0mEYaKTMfwjCEna4k=;
        b=wpn2+3RRnKkURh7Cw42HtJCAMkGca4Slv7C6iuakbwLvTEXnNMZzVN751genrV/kWo
         iNcZG0du3r5XDwFHWSd8w7O00LHqepu20bQcqsweCcvcYBhGDae5z/Xdr241Qj2lGmhq
         kxDrXL1VHXyXj1f+MMtaEdWsHpDq43C4aIMqGefVUKLoxEtmTQn37vtUIQXvdjTKowFA
         m5DDXmT8VT0KQYHblOsC+briTj5e840IrbzIHWDHk5xnvZjOYfHZPRBha9ZcI1vFDl5V
         h0FOj9A6OR0AhE6Wh2Jt/fMphE1zTO6OUlvAZ+7AcUM3Y6oM7Z5xJ9zA++vv4HSW8bPW
         4yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5/nH1g76OJr2xP0kEzxoO9d69o0mEYaKTMfwjCEna4k=;
        b=2n6L+zS8b83JrpPXdmM1JuKjxJ2oGsL8NB/+CbBBzn00Ad+h6EgPFgGptJbiFAmo3F
         kf8p7WxpXeOx0ApuCN1/gjewkaXxe37TPxSbploaU+YbOja02I2b22JRQKHu0zNaAoOf
         9/WMjc4mYif9nvnXpcE5tBff9YWddKFQvi+pv4+xMRvXNIEOzpLXt1/yGUjksvxDXLmQ
         yP8QTnXjdbL/diDbBP7NRpEJw3yE7E/Po0ei1i0hFgjqzpv5CQSwTClrPlM50ICC4HHc
         WGGAV6lrkJPL4/o8JYUibvamEPgkzMGhlrxN5hCBTnpTCKvMsWwLJyTkRbVLTQiDh9Ln
         Dgqg==
X-Gm-Message-State: AOAM530GLZdmThS5cVm/TK1BHumpQ0gJCNUGx1BhrbuVOYG18LKAg8Al
        3c9741KWUkPub6pq4JPI6Qf82A==
X-Google-Smtp-Source: ABdhPJyclLZRRx/ILXop0mbVpOT4zhXti8FhJnghzlEFGMiCmx9/J4a7ey9jKBPCbiZ3XOVMesKP5w==
X-Received: by 2002:a5d:6746:0:b0:203:d6c1:9c5b with SMTP id l6-20020a5d6746000000b00203d6c19c5bmr19647521wrw.446.1647893270523;
        Mon, 21 Mar 2022 13:07:50 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a0560001ace00b00203da1fa749sm24426988wry.72.2022.03.21.13.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 13:07:50 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, krzk+dt@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 02/26] crypto: rockchip: do not use uninit variable
Date:   Mon, 21 Mar 2022 20:07:15 +0000
Message-Id: <20220321200739.3572792-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321200739.3572792-1-clabbe@baylibre.com>
References: <20220321200739.3572792-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

crypto_info->dev is not yet set, so use pdev-dev instead.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index 45cc5f766788..21d3f1458584 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -381,7 +381,7 @@ static int rk_crypto_probe(struct platform_device *pdev)
 			       "rk-crypto", pdev);
 
 	if (err) {
-		dev_err(crypto_info->dev, "irq request failed.\n");
+		dev_err(&pdev->dev, "irq request failed.\n");
 		goto err_crypto;
 	}
 
-- 
2.34.1

