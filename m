Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E47344DD0D0
	for <lists+linux-clk@lfdr.de>; Thu, 17 Mar 2022 23:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiCQWhX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 17 Mar 2022 18:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiCQWhW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Mar 2022 18:37:22 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED03F262402
        for <linux-clk@vger.kernel.org>; Thu, 17 Mar 2022 15:36:04 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r13so13660806ejd.5
        for <linux-clk@vger.kernel.org>; Thu, 17 Mar 2022 15:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wQ3zFfpd7aREXFgNk3LcUxheQc887/bs/gFwojIv5w=;
        b=bbmP/CH9YWdv5RN9DFGh3+DhWMX5vZKzWLaRzuRD69bBJbMDfp3A5+DuNauUlcKFN2
         xkDNTW2xf0JiXSzNzquWotsdP8NztbCh2MNuzkvg/ldIla36tA4Fhlk1dicLucSMoggz
         fhhxLvFurR5XjwRk+ZEYOxN3DdaI1BBOxsJ88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wQ3zFfpd7aREXFgNk3LcUxheQc887/bs/gFwojIv5w=;
        b=vsV8FQQHBc84Zv7us/jNUVcWAg524h9ahtAVtqbOkMIICE5TVS3nm+Mn27kQEQeypQ
         1h6a20vcnxbTWDGx5/DUWb8sGy7uly0rzViikl/2R3MHOC0gsuqcrFZQIitwyZtvwSHs
         1HDlTekIVYdjpm+Qa4Jlq7jAvc9jH+sVKZnaSvKDr3S8SAnRfcKAYHWiwH59m1l5jOhs
         uUXXK7fyarX3tIzniPUMtCGez2hjXX1X1Zndo1wN92vZI/tBbXM8CsPMidsbXI0pW6uG
         gKUCBgOdG+fL8dIQ4ZDNIzjhhJmydD9EUeEokMy8UEZkdvPwGmj7Nt4rg1rxw9R6fx+A
         CUWg==
X-Gm-Message-State: AOAM531BqK3nEmXXWASoRkUnahgk7w01PgyJAjDBeb9hmrZNp4KwVJSW
        wjzGvsLhMR1VPepWPiQBg8MSmg==
X-Google-Smtp-Source: ABdhPJwvcUtOkBafEEKnF/3EG0RSqIIckpy4W7SlIRZOyBnbssw7to5m/58/k2mkz+ZAdb5WP6KPNQ==
X-Received: by 2002:a17:907:2d10:b0:6db:e3f7:2cb2 with SMTP id gs16-20020a1709072d1000b006dbe3f72cb2mr6473181ejc.491.1647556563328;
        Thu, 17 Mar 2022 15:36:03 -0700 (PDT)
Received: from capella.. (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id ec21-20020a170906b6d500b006d170a3444csm2893669ejb.164.2022.03.17.15.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 15:36:02 -0700 (PDT)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: imx: add clock bindings for i.MX8MN GPT
Date:   Thu, 17 Mar 2022 23:35:58 +0100
Message-Id: <20220317223600.175894-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The i.MX8MN has a General Purpose Timer (GPT) just like the i.MX8MM,
which already has such bindings. Add the relevant bindings for the Nano
SoC too.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
v1->v2: no changes
---
 include/dt-bindings/clock/imx8mn-clock.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
index 01e8bab1d767..07b8a282c268 100644
--- a/include/dt-bindings/clock/imx8mn-clock.h
+++ b/include/dt-bindings/clock/imx8mn-clock.h
@@ -243,6 +243,20 @@
 
 #define IMX8MN_CLK_M7_CORE			221
 
-#define IMX8MN_CLK_END				222
+#define IMX8MN_CLK_GPT_3M			222
+#define IMX8MN_CLK_GPT1				223
+#define IMX8MN_CLK_GPT1_ROOT			224
+#define IMX8MN_CLK_GPT2				225
+#define IMX8MN_CLK_GPT2_ROOT			226
+#define IMX8MN_CLK_GPT3				227
+#define IMX8MN_CLK_GPT3_ROOT			228
+#define IMX8MN_CLK_GPT4				229
+#define IMX8MN_CLK_GPT4_ROOT			230
+#define IMX8MN_CLK_GPT5				231
+#define IMX8MN_CLK_GPT5_ROOT			232
+#define IMX8MN_CLK_GPT6				233
+#define IMX8MN_CLK_GPT6_ROOT			234
+
+#define IMX8MN_CLK_END				235
 
 #endif
-- 
2.35.1

