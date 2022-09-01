Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBFB25A97C5
	for <lists+linux-clk@lfdr.de>; Thu,  1 Sep 2022 15:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbiIAM7k (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 1 Sep 2022 08:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbiIAM6m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 08:58:42 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEFE8E9BA
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 05:57:46 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id ay12so8967556wmb.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 05:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ZivRzjlDS3OoPoRTHkJnPDZ3sM1VA8uv4BaZC71qcQ0=;
        b=JUOjcJrXCvz6wzFCa8+Wzyv/V0GHWb+sL7kNBLuUIJtJAJOKGjnFFQKcySGMQ5H3O7
         cRhh0Pd0hVq9NecVfEwjwXLB77l7qWn4NM+h2uX8m/BO3qnqQZQwiwoDANaOzd8h0wXS
         yRgaboq1hrCTgAgYzFv2nzkg8Sb5hzErhg6KMY6XoP5+nprg5Xlae+/0kdDEFqwvnfwi
         lLSIO2QZkY7xNyBsz9WFcUJjskTCvrG56a+KDdvfS6mj13EwisptFsOs8HhjdSkJ/pou
         8QhLzrIdxxx185LvTsU2AL/aTJAtq23k6qDmHCb7Jgm/SvWWW7KpblB4qVS0LWQHtVaw
         7rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ZivRzjlDS3OoPoRTHkJnPDZ3sM1VA8uv4BaZC71qcQ0=;
        b=Sg9e5TBJa9ifrZhM45rqu+ANpCGDV7Pv0bVnK0IZAckxvOt26tmHT7OTiQ1Fh9HdKw
         w9C+4LjGZc2rNeQYpyjlmZyvYI4zVEHQYEIfv++Y1q1/IvFYysauZEiJ8TfcL7tUuK/T
         FmKnhFjR8MlJVfNmOZpi+/RayyCgV033nOMypPn3vSkTR5zowvCElH8jU40lGUzVnXHy
         2EASN4sxszbQJRk471i9Pe1OmV4knE7/lgoTkZE58S4HSTrQU3gXYYwOFQJDfVPPnuVC
         MTEdOdJB3LSQGDjayw9vRoDG8Wniv2IeMOSq41a/s4va77hDbDK3RnE6oGTbmAEYNlk/
         vD2g==
X-Gm-Message-State: ACgBeo00yLIRiBoPtYcgWPg0h+oXh8BoHqqwTt0m3kUb1VSlT/PEoc4C
        FrpfQoYENtBTbuFHrX8dAFojrQ==
X-Google-Smtp-Source: AA6agR74/atGg96SzWY6lVxvFky5stzl1E8pNTmDRh7Z6GASkeKyTR8c9FZ8sNqrg98Ax6xhl3MCgQ==
X-Received: by 2002:a05:600c:4f53:b0:3a6:9d3c:47e9 with SMTP id m19-20020a05600c4f5300b003a69d3c47e9mr5267668wmq.116.1662037063750;
        Thu, 01 Sep 2022 05:57:43 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v5-20020a5d59c5000000b002257fd37877sm15556709wry.6.2022.09.01.05.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 05:57:43 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, ardb@kernel.org,
        davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 26/33] clk: rk3399: use proper crypto0 name
Date:   Thu,  1 Sep 2022 12:57:03 +0000
Message-Id: <20220901125710.3733083-27-clabbe@baylibre.com>
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

RK3399 has 2 crypto instance, named crypto0 and crypto1 in the TRM.
Only reset for crypto1 is correctly named, but crypto0 is not.
Since nobody use them , add a 0 to be consistent with the TRM and crypto1 entries.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 include/dt-bindings/clock/rk3399-cru.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/rk3399-cru.h b/include/dt-bindings/clock/rk3399-cru.h
index 44e0a319f077..39169d94a44e 100644
--- a/include/dt-bindings/clock/rk3399-cru.h
+++ b/include/dt-bindings/clock/rk3399-cru.h
@@ -547,8 +547,8 @@
 #define SRST_H_PERILP0			171
 #define SRST_H_PERILP0_NOC		172
 #define SRST_ROM			173
-#define SRST_CRYPTO_S			174
-#define SRST_CRYPTO_M			175
+#define SRST_CRYPTO0_S			174
+#define SRST_CRYPTO0_M			175
 
 /* cru_softrst_con11 */
 #define SRST_P_DCF			176
@@ -556,7 +556,7 @@
 #define SRST_CM0S			178
 #define SRST_CM0S_DBG			179
 #define SRST_CM0S_PO			180
-#define SRST_CRYPTO			181
+#define SRST_CRYPTO0			181
 #define SRST_P_PERILP1_SGRF		182
 #define SRST_P_PERILP1_GRF		183
 #define SRST_CRYPTO1_S			184
-- 
2.35.1

