Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0E3B568302
	for <lists+linux-clk@lfdr.de>; Wed,  6 Jul 2022 11:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbiGFJE6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Jul 2022 05:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbiGFJEn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 05:04:43 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A3AB77
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 02:04:38 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id f2so15686124wrr.6
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e93jdwU7lOD2x9pMhJTBQN+yJo5I1w/iWBnUD+AsvRI=;
        b=qYnjOSsve+CU60SZAGBBlF7DQsf40B4ppATy+M4RqiYsYCYGKKCqLRBjoS63bwkV7y
         UoyVME2BouYSVlzOVHR6OxKaX2DFxVDM9B9YIM7cfyB5gyZFOlQs8mYBZWEGlfHHsP2W
         X62q5fLEGO+E3EPkCFO9+yKEZCts36MY8GKJVxDvHnRxL9/yoNWSNyos37133Ntfdp58
         PBgsRy7ZvTDQwm47ks9TFgn1xoxX/K4tDresapBXPykl/Vcpn1a/l6OMpl2Pzvn1IN68
         PZvbv9fdH1jJvCr0lwZ+xqiAiH2Rfnzik628v8RTHB6oNElHz0aPV2wEA8WKUCWrDepD
         mzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e93jdwU7lOD2x9pMhJTBQN+yJo5I1w/iWBnUD+AsvRI=;
        b=E7pujq4rwKC3GeapnxZgSF1gbQE4yno+JAe9/4l+5928pv2HUNCYqLI6ZkBZsyMaEE
         vz3TsYmxi2XUs8dcGdzpyzsSHjhpbhf5L0nP7bDAtYwY5Ym3zDzJAWLiG2GGnOtnIxkL
         56n6c0XNcdPsIWs5AJ6fLd40oXHHx0TPYCO9HYzDqelmk4EHzjp4Tb7kI3/UZKTTsoUr
         wrZS6XCL25Rgs43ewFe0ikUK3YCzs6eKUqc6nOJ2u7ykSOjwJy6gAPqp49pz1KyLrGT/
         t9663k4JA5G0EDL1jGkQ3J/emH3+DpYoXvEPPs3bvw6xHyPppT7t9iUSOYnqU6Uc/LW8
         C1Ug==
X-Gm-Message-State: AJIora8bgMy68Cb0zd9gUdFJr2Eb/FR4WKkGMpl/6bIUgzW4gzX57ART
        MwTEa8vRuT5Mi55k3Mz0LsrCTw==
X-Google-Smtp-Source: AGRyM1sJ/Eew7H8iS7hX0nzquUCXkYxooD06C+J/SXSVN+r6E2DP9OY9XPMY7TacADQllOgs5bFVTw==
X-Received: by 2002:a5d:6e8d:0:b0:21d:7223:1e1b with SMTP id k13-20020a5d6e8d000000b0021d72231e1bmr7734511wrz.713.1657098277195;
        Wed, 06 Jul 2022 02:04:37 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v11-20020adfe28b000000b0021d6ef34b2asm5230223wri.51.2022.07.06.02.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:04:36 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        john@metanate.com, didi.debian@cknow.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v8 04/33] crypto: rockchip: fix privete/private typo
Date:   Wed,  6 Jul 2022 09:03:43 +0000
Message-Id: <20220706090412.806101-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706090412.806101-1-clabbe@baylibre.com>
References: <20220706090412.806101-1-clabbe@baylibre.com>
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

This fix a simple typo on private word.

Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.h b/drivers/crypto/rockchip/rk3288_crypto.h
index 2fa7131e4060..656d6795d400 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.h
+++ b/drivers/crypto/rockchip/rk3288_crypto.h
@@ -235,7 +235,7 @@ struct rk_ahash_ctx {
 	struct crypto_ahash		*fallback_tfm;
 };
 
-/* the privete variable of hash for fallback */
+/* the private variable of hash for fallback */
 struct rk_ahash_rctx {
 	struct ahash_request		fallback_req;
 	u32				mode;
-- 
2.35.1

