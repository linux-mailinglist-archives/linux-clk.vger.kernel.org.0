Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDAD5A97EC
	for <lists+linux-clk@lfdr.de>; Thu,  1 Sep 2022 15:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbiIAM64 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 1 Sep 2022 08:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233642AbiIAM6N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 08:58:13 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727885FBB
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 05:57:33 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id n17so22244086wrm.4
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5JnoAw4X1z7bCscIjsjfjSMoE54Bwt7ulA7ZsyJ5jyg=;
        b=tuupKdXS6ZDyT9dibu24u3ydXvQkCsphFGu19lBsiAKGKBkErbWlL04bWscmWbV4i8
         VmmxJHxjPIhNTrGcTY6yppBUtNlDU7i6zlyvj4Tk3an+75hRz0Xh8xKpMKDJFXWQxtii
         b+uAI+mweDCx3BOMIXFGgfUY+NadFyYST4l5hvXl3Uc3ONdEg+UurOT0JhA2IHdUXOVA
         kUi/apzYc1LE+85CYrrgDmpPRK+JDD8AW80Q/FuhDNtsWuu+XBeYWzYov0jJ+gUgymd7
         azhfEGwLkkz5a4fCBIozKSJnWjn880ZeiqoZ5ihw0V2wcmF/juYqJ8i6+fXztfUu8hjY
         E73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5JnoAw4X1z7bCscIjsjfjSMoE54Bwt7ulA7ZsyJ5jyg=;
        b=gxSvKKMYtLl+Kec713VQvgBJUehMS//p3SInlrRrtWAUlghU/o3PRtEBoBxM9x9tXA
         I6EEtjfEL5ZsFVgtPaE8e1XqGKJfyje/lqzaXgvUXRFoq4AzEZ6SqpZxhKxO7qZzmcrA
         8k49x5P5Akyj/RdMfn8EghoPo04PDDf5pGgQL6+uvjCFsotIqwDKo5FL6SFbce9N01sy
         d7f21VyXoT7X8iN2T1leMTOA1/h56GNZZi6IpFSb8xRwUnoJF158i6moSQafp3MiSFnh
         giX2vC5cVzjgXQaKQl93GCkSgC70fDXFOcmZtZSRSaq5zSZ8XK+/T0CArAnvddHVZJCo
         FvBA==
X-Gm-Message-State: ACgBeo13rc4+KfUdq6mnwtwpm3db95CSjNm/SMgfov25CijDH+FZ3VaE
        gcAFPCiT9ulqJCTmgkCEPDr1Lg==
X-Google-Smtp-Source: AA6agR7VQFD7bsUaUpzjN20zRJwbycuUHHgikSZzJiO1QDajtpVf4ad0oH0zPMuPAEiQEjMxiGrQGw==
X-Received: by 2002:a5d:648b:0:b0:222:cc32:c292 with SMTP id o11-20020a5d648b000000b00222cc32c292mr14088396wri.463.1662037051241;
        Thu, 01 Sep 2022 05:57:31 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v5-20020a5d59c5000000b002257fd37877sm15556709wry.6.2022.09.01.05.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 05:57:30 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, ardb@kernel.org,
        davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v9 14/33] crypto: rockchip: handle reset also in PM
Date:   Thu,  1 Sep 2022 12:56:51 +0000
Message-Id: <20220901125710.3733083-15-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901125710.3733083-1-clabbe@baylibre.com>
References: <20220901125710.3733083-1-clabbe@baylibre.com>
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

reset could be handled by PM functions.
We keep the initial reset pulse to be sure the hw is a know device state
after probe.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index d9258b9e71b3..399829ef92e0 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -74,14 +74,23 @@ static int rk_crypto_pm_suspend(struct device *dev)
 	struct rk_crypto_info *rkdev = dev_get_drvdata(dev);
 
 	rk_crypto_disable_clk(rkdev);
+	reset_control_assert(rkdev->rst);
+
 	return 0;
 }
 
 static int rk_crypto_pm_resume(struct device *dev)
 {
 	struct rk_crypto_info *rkdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = rk_crypto_enable_clk(rkdev);
+	if (ret)
+		return ret;
+
+	reset_control_deassert(rkdev->rst);
+	return 0;
 
-	return rk_crypto_enable_clk(rkdev);
 }
 
 static const struct dev_pm_ops rk_crypto_pm_ops = {
@@ -222,13 +231,6 @@ static void rk_crypto_unregister(void)
 	}
 }
 
-static void rk_crypto_action(void *data)
-{
-	struct rk_crypto_info *crypto_info = data;
-
-	reset_control_assert(crypto_info->rst);
-}
-
 static const struct of_device_id crypto_of_id_table[] = {
 	{ .compatible = "rockchip,rk3288-crypto" },
 	{}
@@ -258,10 +260,6 @@ static int rk_crypto_probe(struct platform_device *pdev)
 	usleep_range(10, 20);
 	reset_control_deassert(crypto_info->rst);
 
-	err = devm_add_action_or_reset(dev, rk_crypto_action, crypto_info);
-	if (err)
-		goto err_crypto;
-
 	crypto_info->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(crypto_info->reg)) {
 		err = PTR_ERR(crypto_info->reg);
-- 
2.35.1

