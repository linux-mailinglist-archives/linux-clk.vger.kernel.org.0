Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F13C77CE75
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jul 2019 22:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730510AbfGaU35 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 31 Jul 2019 16:29:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43903 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730778AbfGaU34 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Jul 2019 16:29:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id p13so71050115wru.10
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2019 13:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8QWLof1O3nhMlU7i5ZCEmG2qQ6v7dulP8/K2lF3I37g=;
        b=HTbhzaNqyovbAnQuDvhDg8INCa+ZqREMmYKvP/IP7VZmoIHoXZy9+yTfOKfonIc8K1
         lvYdcgIs6Y4hxtwJ3+zfFeWuoEgmdV8OJva7TSClx+z9y+u7rAMAX1P+PA62gJTihcbn
         DDWniV2DuXQBfhuZHEDcys3J4Kw4MFc0nWUoESe3dK8/S6gqVZo115EJUyjCYcow+/Iq
         Yp1v7weDG0Mfyec3xJW8ZHlOhDf1eE3vX98vvHoouFPb0R47RAY26b7S1sPUFDmM5NZ0
         Ywi+FjkWEv9MTPfQyPAjCqeFX0ZA+ZTDNTKHNRK6EW4tilAx70huWyjwV2CO36weuwCw
         tLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8QWLof1O3nhMlU7i5ZCEmG2qQ6v7dulP8/K2lF3I37g=;
        b=eNEMn4QqJYvQA08qBufbbCIly7gTR0falS4+YAvWTLhMqlISRKAF+wx9pz+8TE+uHf
         lSfll431QnHIs2RFqOvFTxMo8aDxXsKCymFqM8kP94ESpis2qOemklYhGSV2PnwHiVUX
         0IEnZSw55PKMp3SbruWK/LRGZpEDf7mSAW72svLmxsD8YKiJ8yJfCTavF9CiOsICCitl
         rV97csujirPe6ztE0TI+09yjZhNnJtjgJ2b+NFD2clLmMutDl5XRBmkxcZPZdI9xvf/R
         BTII/ZeAEIq7/R9IGmdOhQWXRyi3+AV4lFQoWNsRmIbbizPGO74pBcpPpVt66co3KTwn
         xbcw==
X-Gm-Message-State: APjAAAWx7hu2mhFO/GUnXYhLt0GYWLbKxO/ibrecHNY9iSm1qa7R402A
        JQac3FB/4P9UDxWjlV7AmXp4ZA==
X-Google-Smtp-Source: APXvYqx3tHzOXqkGAVmST3DAPob5FWvERg2GNMlAJyDGVUw68lh98g0y9MMruSZQqYSjX2eMZe3jmQ==
X-Received: by 2002:adf:e442:: with SMTP id t2mr1361399wrm.286.1564604994823;
        Wed, 31 Jul 2019 13:29:54 -0700 (PDT)
Received: from localhost.localdomain (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id i18sm91905591wrp.91.2019.07.31.13.29.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 13:29:54 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v4 11/13] arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
Date:   Wed, 31 Jul 2019 22:29:27 +0200
Message-Id: <20190731202929.16443-12-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
References: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Specify the clocks that feed the APCS mux/divider instead of using
default hardcoded values in the source code.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3714099306b7..5b7d6258e9bf 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -857,6 +857,9 @@
 			compatible = "qcom,qcs404-apcs-apps-global", "syscon";
 			reg = <0x0b011000 0x1000>;
 			#mbox-cells = <1>;
+			clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
+			clock-names = "aux", "pll";
+			#clock-cells = <0>;
 		};
 
 		apcs_hfpll: clock-controller@b016000 {
-- 
2.22.0

