Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A893DBB3B
	for <lists+linux-clk@lfdr.de>; Fri, 30 Jul 2021 16:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239411AbhG3OuB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 30 Jul 2021 10:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239546AbhG3Otr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jul 2021 10:49:47 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1F5C061798
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 07:49:35 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id x14so13518066edr.12
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1JbUamQBQTeeK5FgvIv/xtu/RYU45rMZWaCOPLzo3D4=;
        b=r4nEdjAhktIKR3JHq/4i/7OL56PxGxvFITxQ2YHvG0hMvzdzChamM+0y7HGpkWbJ0S
         W+gaahiGEYZJUnwoDNHCjarA5xjhwRpvKFzpQyZDGaykdcbsRkh4558wVRz+Z6vpJs8C
         px0t8+H0rRgHvzTOo6hUMFbm6l8hJ1k37IG22v726mIIC9SUX9+Tu5sQW0Ln+zMk6csg
         mFMLPvdyYWuBUz+MzhlBRgy/0V7jyFjQScYnYv61AyqEXFA3IUpaHEn4xBpTgysWz5yS
         bmbfAZttptO2e72KrwJYsE4sdSw9ziBSCmW9nzXZwvJjEBIOz2XTBqIK2e8bPPNSEGIU
         MTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1JbUamQBQTeeK5FgvIv/xtu/RYU45rMZWaCOPLzo3D4=;
        b=R8Q8iWIDTOF+3KmetKJx08DWbbRU0NTK4JauEGFi/R/4+eOxd/TfNT5+tnlACBDy5z
         IfHAOR/sbu25kZopF1L+/kPUa6RrOtsXxLFhqRl7Ii5/DRoBC2FyoUy/j8NtvyW36+/w
         h1a8db3Cq6/COfzdH18QogQ9cnYL84/Z86F/hmyIjj72vEl7kd+ZZTVdp+IU4Jpq4i+T
         By+dAF+UBaAhaEJ3HcNTShx/spcj11UftaSfvNk6VRGgs3j+41ePLbIj6FkyYx+6//yz
         m9etVfEpl+e9a5Z+D0nCvbw1YCmQ/1o6tkjm8iUUGVn/7t/HX85tdc4POGe5Vr4pboJg
         1qeA==
X-Gm-Message-State: AOAM5324CqQx+Zpieg7pI4R1IYTpJ8bF4wyGEpnOv6v1H9DPPccxAfKf
        O8Lt81ZnDTN6mM8AzvTUmr9nmw==
X-Google-Smtp-Source: ABdhPJz42jwFfl72k417UQvTasfCAm8Hz1S5wW2zANurMaS3m2WAqU3tYXM2it7TQZzrU0ZmdahAYg==
X-Received: by 2002:a05:6402:278e:: with SMTP id b14mr3338823ede.277.1627656574578;
        Fri, 30 Jul 2021 07:49:34 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id og35sm647731ejc.28.2021.07.30.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:34 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 07/12] dt-bindings: serial: samsung: Add Exynos850 doc
Date:   Fri, 30 Jul 2021 17:49:17 +0300
Message-Id: <20210730144922.29111-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add compatible string for Exynos850 SoC.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index f064e5b76cf1..2940afb874b3 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -26,6 +26,7 @@ properties:
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
+          - samsung,exynos850-uart
 
   reg:
     maxItems: 1
-- 
2.30.2

