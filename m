Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED895A97AA
	for <lists+linux-clk@lfdr.de>; Thu,  1 Sep 2022 15:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbiIAM64 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 1 Sep 2022 08:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233800AbiIAM6O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 08:58:14 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB8F857EA
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 05:57:34 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m3-20020a05600c3b0300b003a5e0557150so3156883wms.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 05:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qYOSVQA00qKQWFxzKb0fHdJciS5yaHqqvfwattGS0xE=;
        b=2+iF+D6WVvOVPhWmt3VhXPhVo7vs9Qa0FFtQAOBo4PE8DZfXZz7lh8WxymFJ4+QRbQ
         2WSmKTBwOuAYnUOdNqFfGewU7fEoUCPoJMJZxBhc8SOIb/d3fnHSWFMP7SbmTy6pqXuc
         2GkKXnmUKealcrZReOi+Hx/Fsirdh4ERmfZP0k2rx02TOG2PreRG+NDG/uGsdipUERG7
         aJcUVISOxFJbnHd2IhHLAwawZW3IgV6UY1qiyF+Tm6FfLNxIFxhbTh+7AvCta+2MkYuj
         3jHFjxj55W9hSdZNyIbD+4Z6BPCtUosTXaM7CdKP0+K3izjb05pD4lkB+8qoXTLuPR9l
         uudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qYOSVQA00qKQWFxzKb0fHdJciS5yaHqqvfwattGS0xE=;
        b=2BUecbnbmPCSZ4A2oSiQZ79egSxU6Us2gyX3sVb5dy6Bgs3Qdl843zQYTQfZnsIdn1
         4YfNZkYLVunYJcT3DoszMbCz1BjSTCNRSVVxidDcjfOMuJy2JF8WB2Uz4tSvDz5TxUJe
         q2DxRi1pzZAtB/H4I2zqNh1a8LlH1UzLNrSNYHX35tW1sajBuF5qSkaGOEraoQcTdBSS
         IgheUh0HKO+5Pn0BpSaptdVGv7z1YH9lOL+OTU3252cWLPX92frDN+SseSEDxZInTvNN
         DN3APKcyFpn5fMG5wzxRxUa/Uc30JbVQSMk0Vh7Yo09OKig+4rWBwtmoEIwtRlM8Xe+B
         Bulg==
X-Gm-Message-State: ACgBeo3yO0m9pNuv+bwshFLmJxh5aIioJvKVu2Q9TBroKmsjU18qvjhi
        x/TMuNnXZAlXvq9JcOJ/FwBfAg==
X-Google-Smtp-Source: AA6agR4kbiHdLlaGGwQg6Xh12lZinJ19XjKY2Eji3lirOvZkAHqrjDhtM5Ma1oLDbWcu3DdQz/iaQw==
X-Received: by 2002:a05:600c:a199:b0:3a5:dddf:ac6d with SMTP id id25-20020a05600ca19900b003a5dddfac6dmr5066111wmb.44.1662037053356;
        Thu, 01 Sep 2022 05:57:33 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v5-20020a5d59c5000000b002257fd37877sm15556709wry.6.2022.09.01.05.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 05:57:32 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, ardb@kernel.org,
        davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>,
        John Keeping <john@metanate.com>
Subject: [PATCH v9 16/33] crypto: rockchip: add myself as maintainer
Date:   Thu,  1 Sep 2022 12:56:53 +0000
Message-Id: <20220901125710.3733083-17-clabbe@baylibre.com>
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

Nobody is set as maintainer of rockchip crypto, I propose to do it as I
have already reworked lot of this code.

Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41762df1be0c..399d2bb08a4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17626,6 +17626,13 @@ F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
 F:	drivers/hid/hid-roccat*
 F:	include/linux/hid-roccat*
 
+ROCKCHIP CRYPTO DRIVERS
+M:	Corentin Labbe <clabbe@baylibre.com>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/crypto/rockchip,rk3288-crypto.yaml
+F:	drivers/crypto/rockchip/
+
 ROCKCHIP I2S TDM DRIVER
 M:	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
 L:	linux-rockchip@lists.infradead.org
-- 
2.35.1

