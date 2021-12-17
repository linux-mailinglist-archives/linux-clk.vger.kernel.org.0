Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDB8478248
	for <lists+linux-clk@lfdr.de>; Fri, 17 Dec 2021 02:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbhLQBqZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Dec 2021 20:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbhLQBqW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 20:46:22 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15547C061751
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:46:21 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bi37so1502945lfb.5
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cxvNEtCPBXzjljfYxRKeW/Fan3oOoMNu2DZyjmhfjvA=;
        b=J2cmMX9yPq/Ya7mojZVUDevjq9DPnp9gmygKFrXo4+8Lbp6Y30nK3Os3dMx3BjYL4W
         ZUO5ZZURskVs7Oe6xseXFUyy3+Z3Ow4Lx06Z0guEYJUPZIz2Fjx+XoVgfQAT4mUs+8QR
         ppb0M7NixWLO3PffJ4j2H+ACbL5w7xEMO1yDIXyPm6WkDUk/gTNkcBbACPBjevtsf/7r
         rksTvt/RSOxmwSE8NaVdGllK28XKotYt99OfphVMts39W/m+DnSEj8KiDVgYZhJnAx4w
         kp4OJtae2qPnRaAtJs7VvTIoi/Rs/wiXNSTV6JWl/vpaVynTKV8BrLGGuZSXIJtleaxD
         WaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cxvNEtCPBXzjljfYxRKeW/Fan3oOoMNu2DZyjmhfjvA=;
        b=IbXveSr2WfqH+jZXPPsAc4IS12TwbqJWsrVEdMa+NEpoqFpXh5gIAvNA0VgsLa7EQY
         Szt+X3N9hdwHqU/VJhPRY1RkZivPYluCHb1SqvRi0ntFvbzqoEQ5WlRuDHefrLFncjyi
         6ch/EFHl48pIL/MaKGlJ+9Vs4dg0Ugi+joI3hoH7s95EckegUyWz4xYFmVKGmjeTfAcn
         FPhxPBX02AU9ZQGSRm6Q0jAnbFIpY6LUzxrUUplT+VVcTrXiGxtC4nDpExg/MkhOrRZY
         WU3yEZiIvywyUa5HSPiQ/USAHNZzScEjxNPHrx04nUw/J7dvQ9MAV69mlQ4TkO/z6mT0
         EBsw==
X-Gm-Message-State: AOAM532fLp3EscRO0BeT9kiofjYmDf7gUFKFjwnQUG/VJO6AeY9Uacpe
        HqZInTDApL9A5EoTIGs8u/v/ow==
X-Google-Smtp-Source: ABdhPJzAwjbT//kCiYNb9F5m6aaC2cNrCdyFupPxliFHi8QSIQiEBD1odDhPdbAaJERTspo4oW9jSA==
X-Received: by 2002:a05:6512:3b11:: with SMTP id f17mr845275lfv.374.1639705579331;
        Thu, 16 Dec 2021 17:46:19 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id r10sm1431021ljg.116.2021.12.16.17.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:46:18 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 3/7] dt-bindings: Add vendor prefix for WinLink
Date:   Fri, 17 Dec 2021 03:46:09 +0200
Message-Id: <20211217014613.15203-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217014613.15203-1-semen.protsenko@linaro.org>
References: <20211217014613.15203-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

WinLink Co., Ltd is a hardware design and manufacturing company based in
South Korea. Official web-site: [1].

[1] http://win-link.net/

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - (none)

Changes in v2:
  - Added Ack tag by Rob Herring

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4698213611db..25f94c723cbc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1328,6 +1328,8 @@ patternProperties:
     description: Wiligear, Ltd.
   "^winbond,.*":
     description: Winbond Electronics corp.
+  "^winlink,.*":
+    description: WinLink Co., Ltd
   "^winstar,.*":
     description: Winstar Display Corp.
   "^wits,.*":
-- 
2.30.2

