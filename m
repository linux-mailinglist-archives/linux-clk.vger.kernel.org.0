Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2825EBC4D
	for <lists+linux-clk@lfdr.de>; Tue, 27 Sep 2022 09:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbiI0H5d (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 27 Sep 2022 03:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbiI0H43 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 03:56:29 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A35AC24B
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:56:03 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso8908926wma.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZivRzjlDS3OoPoRTHkJnPDZ3sM1VA8uv4BaZC71qcQ0=;
        b=Hi/PfgX466QUwnJFm9k1zLSql6rT5CjE01/66twod+tuTI0yOR+7txzfcYZltmqEZ2
         WoO0mSzSJd1QcUwCvajDOwo4a8WSQNbYEOyBSkj05F+VRuK4K0dO02+IkF237XmXwmAn
         +85jsxrHxNkLEupTOLl/Jc3C4eY4I8wuGPll1rk0VnFMl+Ud1v4y64X4QhbPPZ0qQh1S
         Aaj2P3F7oWm3WCyuuWWx48rT5Aia8r85PLVZcHB+xB84TXvMckzUKZHCzyhWkm53PwR9
         EPOMevwrP9mbDOyu2MYuq/PCpengknDNrhgzZCtHleE/MywmhhlAeErCxGDOsn9r05M3
         ELzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZivRzjlDS3OoPoRTHkJnPDZ3sM1VA8uv4BaZC71qcQ0=;
        b=lvI4K9KXj1OJPLFftWwcyDVUAidJYsUFgOcE21xUNxiXo8D6n/gMjWEWBzdR+tehO8
         EoJXznirMVQJOsdImwQUGp5MkDfG+hTSaozzgv4//F6DJO5kA15iiVvz9o+9YRWitwmD
         uRVzDKGkZ0+J2AEmeDPWuwrNaqB/TRYxmsN4jypAGDxaV8nGFwODrOOfqX8hvPj8e/iw
         XQPaK6FY8mf6L+73Bgb/IMA/yVTilIaKa2rzwIuEn4s12j2/xSn4Yxi6W6WNOF5Sw9Vb
         8LmigpI7fVADkuudNTTIo/35phZs19FTlmyjjUzdWMyvDE1kSZiRZCkzZha8qprG2Qrs
         Xoog==
X-Gm-Message-State: ACrzQf2q4MXT8fkxM1XVM+/Lm0kub1wfS+OSxjJBM2TWoInQ2nW5M2g1
        qjJobTZinZmbrlOgrUaLF5vKFA==
X-Google-Smtp-Source: AMsMyM5TTwj3ckRPTtCPXJIEkijaJ3Io02K7CqsJQYSUJEPJ6vwCKX0TepgfinUTDLaNDeXwwOLTHg==
X-Received: by 2002:a05:600c:4e94:b0:3b4:b416:46c3 with SMTP id f20-20020a05600c4e9400b003b4b41646c3mr1645457wmq.149.1664265362733;
        Tue, 27 Sep 2022 00:56:02 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8-20020adfdcc8000000b0022afbd02c69sm1076654wrm.56.2022.09.27.00.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 00:56:02 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, ardb@kernel.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 26/33] clk: rk3399: use proper crypto0 name
Date:   Tue, 27 Sep 2022 07:55:04 +0000
Message-Id: <20220927075511.3147847-27-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927075511.3147847-1-clabbe@baylibre.com>
References: <20220927075511.3147847-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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

