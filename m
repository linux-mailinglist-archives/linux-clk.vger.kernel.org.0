Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D840073D414
	for <lists+linux-clk@lfdr.de>; Sun, 25 Jun 2023 22:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjFYU02 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 25 Jun 2023 16:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjFYU00 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Jun 2023 16:26:26 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472ABE7F
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:13 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b69e6d324aso6407191fa.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724771; x=1690316771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e22bJ5odjM+mKTro24WKxPv4ydhQmUrgsro1UZPvXrQ=;
        b=Zo7fl8m7cSpxTd+Uaa2MxLO5oWKlct8vRbtBKNav8TO6ZsEGLAIWmehBGY1a2oM5rO
         c+MTx2bWXXa3BtlD/1hZF9j524Em2hy3gA909+jjuyNz8h3HJoJV2o5tSr9JULopD4j5
         N/QHtStBuSsJAdh4aZ39qrKZb/nVnkjs9hVMGpz9GAu5Yh65fVYUNaUYmz2FeQLfFwPp
         js/zDyc+YVmvRRSwN4V3rnKwWI0/UR+rUL6TPAOQfhvfTo4x6qlNiSOttSbeCOpRDL2R
         5UsjTD+trtKmpTiqp2km+WYU9k7a21fCP/LkiRy2TJvgkxmiZNT8EW1/sWYc8K6AA8W7
         t/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724771; x=1690316771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e22bJ5odjM+mKTro24WKxPv4ydhQmUrgsro1UZPvXrQ=;
        b=IUZCy4kUPAww+gjicfExz0KsoZ4QZlnANa13JzPl6W1sMAgCxBnMTcI9VMewhKThK2
         1yUidUvSbDjb+iNSPy1kMQEJfJzFyH5p3nMZDjJok+jz/7fpxO/2cOf0R9RMqJec821U
         6Bl3lGQsayFm9r0Ps9qcCbe4oymegFOOJDfmWCGHSsi+3DguXEtMY0aeCs7ZnIN++Ukx
         6BjawL48fvQiGhBC3IrzKa7buCvCucoLa4VNmcDidrjSXopLkEHlIm9K0xlD8QYvnmnO
         ARNXXns1w0G++oU5y5+Ne7kfQR1AibYjwi3E8IdttzbAtdEpPcuQc+XyJJxf7v/19lk4
         Fkuw==
X-Gm-Message-State: AC+VfDz+2AaBiQThlv/5SH3Z5xbYgt1LWFy1jSkcLmygwbEK+iOgtqeE
        PblNsyEiRBLJ3PfY38pLwmV0Eg==
X-Google-Smtp-Source: ACHHUZ54rWODI2kWXKgGxg3+8huxLYpdqXLp90DRSLnjKscjuTRQ49vMHoRzFIpckOq7L4hZG+BwXA==
X-Received: by 2002:a05:6512:ad6:b0:4f9:cb8f:3182 with SMTP id n22-20020a0565120ad600b004f9cb8f3182mr1681727lfu.25.1687724771365;
        Sun, 25 Jun 2023 13:26:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:26:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 25/26] ARM: dts: qcom: ipq4019: drop 'regulator' property from SAW2 devices
Date:   Sun, 25 Jun 2023 23:25:46 +0300
Message-Id: <20230625202547.174647-26-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SAW2 device should describe the regulator constraints rather than
just declaring that it has the regulator.

Drop the 'regulator' property. If/when CPU voltage scaling is
implemented for this platform, proper regulator nodes show be added
instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index f0ef86fadc9d..ad3c922843c7 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -350,31 +350,26 @@ acc3: power-manager@b0b8000 {
 		saw0: regulator@b089000 {
 			compatible = "qcom,saw2";
 			reg = <0x0b089000 0x1000>, <0x0b009000 0x1000>;
-			regulator;
 		};
 
 		saw1: regulator@b099000 {
 			compatible = "qcom,saw2";
 			reg = <0x0b099000 0x1000>, <0x0b009000 0x1000>;
-			regulator;
 		};
 
 		saw2: regulator@b0a9000 {
 			compatible = "qcom,saw2";
 			reg = <0x0b0a9000 0x1000>, <0x0b009000 0x1000>;
-			regulator;
 		};
 
 		saw3: regulator@b0b9000 {
 			compatible = "qcom,saw2";
 			reg = <0x0b0b9000 0x1000>, <0x0b009000 0x1000>;
-			regulator;
 		};
 
 		saw_l2: regulator@b012000 {
 			compatible = "qcom,saw2";
 			reg = <0xb012000 0x1000>;
-			regulator;
 		};
 
 		blsp1_uart1: serial@78af000 {
-- 
2.39.2

