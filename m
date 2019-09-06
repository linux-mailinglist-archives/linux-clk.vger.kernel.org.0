Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D15CAC2FC
	for <lists+linux-clk@lfdr.de>; Sat,  7 Sep 2019 01:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405224AbfIFXXw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Sep 2019 19:23:52 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39264 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390072AbfIFXXw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Sep 2019 19:23:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id q12so8739412wmj.4
        for <linux-clk@vger.kernel.org>; Fri, 06 Sep 2019 16:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mipkxs/K3VQhxvIuUjc7V8qspofVUAqg0yqG9RDRrhA=;
        b=JaPw67OAiUZvfpUlDcvnVfl7MJaj45DXVlS6fFKW0ZOB598Orgq1TgSx5pD4Y9OwwZ
         rrvF/2B0uWVCmZcS2sChE03AJt/7jHrRwR71TuCquzTiCown6sm3kCPV41jYriy51yoB
         k/vVV8l5S/NznpFNLRncX/ac1FPnSECemWAXiH6op/TUB4xTG7fd3CQffV4/YSTpxjrv
         sNnJqykGtElHGgjGjolLHPgCG7YCWFCA8iy5Hrf0wmRk41IohU6/3yIVDKar19CU3pNP
         ejiTyst6VrZX1jlt4TWh0bsUTmvORLoc1cvgflQ39VzVZ58ek1ShzuU3uLOX+s+fHop9
         1fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mipkxs/K3VQhxvIuUjc7V8qspofVUAqg0yqG9RDRrhA=;
        b=YmNUcL58wZHYcAGOI2CKPMD6y8y8LgE2objV1kFqW+Nzzurlb4J6pmMPEiTinzTPZr
         IuTUeZ1gJCda2f7mbtK9ikUiT9tng6uwjNcD0Kpk6lyfgYSuQ6aieT7KxNh1gRPrlghb
         m/shAXoCUyk1xFpCOUQxqnGv5QKlP9s9ACBin8+MYGROGVsuGbIKFScLz5EVCM0R56k6
         ASP3jC2fHg8HLo6y0gdh/n1RZE5Car5bKR8ynKVQ3zeAHVd2+tfVRtP4waEQIp5HQTfT
         nah6Z4ehfk8dSySu2qzInr58UAZcifq6nqN/W3U70sINJv+vQzapd2XSHkIp1/JcOoKS
         m6GQ==
X-Gm-Message-State: APjAAAUH0DmxxXsS7VvpZi8+lRo16QWF+ygO+E1nAvG34nrzEbx21DPc
        oIDIucIe0E2dt1/88hvWpwoWoA==
X-Google-Smtp-Source: APXvYqwqXkZWIKePDvL0sp5Ia/BhDsaQd11TDzBwPdj+Ow9E+ohcnQrkF5KKS1DAmx0ATOmylp+78Q==
X-Received: by 2002:a1c:a796:: with SMTP id q144mr9295015wme.15.1567812230476;
        Fri, 06 Sep 2019 16:23:50 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id q66sm9254919wme.39.2019.09.06.16.23.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 16:23:50 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: fix QCS404 TuringCC regmap
Date:   Sat,  7 Sep 2019 01:23:46 +0200
Message-Id: <20190906232346.8435-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The max register is 0x23004 as per the manual (the current
max_register that this commit is fixing is actually out of bounds).

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/clk/qcom/turingcc-qcs404.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/turingcc-qcs404.c b/drivers/clk/qcom/turingcc-qcs404.c
index aa859e6ec9bd..4cfbbf5bf4d9 100644
--- a/drivers/clk/qcom/turingcc-qcs404.c
+++ b/drivers/clk/qcom/turingcc-qcs404.c
@@ -96,7 +96,7 @@ static const struct regmap_config turingcc_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0x30000,
+	.max_register	= 0x23004,
 	.fast_io	= true,
 };
 
-- 
2.23.0

