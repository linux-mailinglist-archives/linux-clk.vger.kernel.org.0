Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18BCB7B33D4
	for <lists+linux-clk@lfdr.de>; Fri, 29 Sep 2023 15:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233467AbjI2Nj0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 29 Sep 2023 09:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233465AbjI2NjQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Sep 2023 09:39:16 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8D71FDF
        for <linux-clk@vger.kernel.org>; Fri, 29 Sep 2023 06:39:04 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53639fb0ba4so2559680a12.0
        for <linux-clk@vger.kernel.org>; Fri, 29 Sep 2023 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695994742; x=1696599542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdgVOGmpBJUAP+7HbxCX50FnlCzMd0lISLV1dlG15Qw=;
        b=SNBq/No0QLxGDx62K43Ki+cWsD0/lwGlPSM4vx1bs+P4ELLRQcdu82ap/oetm/Tdjx
         jHvpXJdu6Xc/mwIdLY0rlq4KUmEUo5RfHsUSO/JMT22NLC65Lv5RMeUpKyGiJ3l853yF
         aNgRhIqoS+XqVer0GwvoCkvzERqA2Oj3sJU8t5tMGh4fQXDzFLRG679gPGVpwxlt/Wez
         CPKVMYVNc4iquSimQx0vWwExdo0nHt97o6Hf+/nx/Fz19UoFmlQ1qYQeQ16kyxECUPXh
         1vDawGQEw25I1HV6ENQw88akiYWcqfV0549mq7M8oAb6flYAMGjmxJZAnoHo+Lc3kyD+
         Wqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994742; x=1696599542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdgVOGmpBJUAP+7HbxCX50FnlCzMd0lISLV1dlG15Qw=;
        b=weV4fQ59TVRrxAALBJH87CBhIm4Cm7ulDKw6ABuzYNHjFlzZ9rCkAlWOmMyTgpbZdJ
         TA9G7S1ep/i2u7jrdD6Kgk6nE/ymU7I51K5wXLMCRb4esKbJ68aq2aIBr/293Spwerrh
         pFSEtRExAvBASm4JCLOsqH7e2Q1rVyTJKT45d1QQCxcyCGYXl/jHWMvahAY/12BH2ShX
         WVg4VmEhIpCc+ny1UE1u7oBW8LAhcWsB8XyIPo+AT+kaGxuruSR6Hu9xUlDkB62/IwyB
         pe4JMcncU4+QhkEa2rg1s0kCJn7Aj8tX1BqywQXo90DmjxI5epxuY4H30sWu+Ixgd/kF
         jhIA==
X-Gm-Message-State: AOJu0YzS38eCuzP5TkbdNrLrE8HO+lzgNhgjfvN0XCgho07leGRKZxfE
        AcxlOZimq53xMvcRPkjwIVbRHQ==
X-Google-Smtp-Source: AGHT+IFY+3Mm0DDlSgieB7UJfN1LABvnlHZQG7ZgRzJ2xv3CXHJf+oTuJL/s+erxjFjfOkywa9am6w==
X-Received: by 2002:aa7:d6d2:0:b0:52f:6641:4ecd with SMTP id x18-20020aa7d6d2000000b0052f66414ecdmr3864911edr.37.1695994742112;
        Fri, 29 Sep 2023 06:39:02 -0700 (PDT)
Received: from [127.0.1.1] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id cx14-20020a05640222ae00b005362bcc089csm2215701edb.67.2023.09.29.06.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 06:39:01 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 29 Sep 2023 15:38:52 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Use the correct AHB clock
 for DISPSS1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-topic-8280_ahbdisp-v1-1-72bdc38309b9@linaro.org>
References: <20230929-topic-8280_ahbdisp-v1-0-72bdc38309b9@linaro.org>
In-Reply-To: <20230929-topic-8280_ahbdisp-v1-0-72bdc38309b9@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SC8280XP has two instances of the display subsystem. Make sure it uses
the correct clocks.

Fixes: 57d6ef683a15 ("arm64: dts: qcom: sc8280xp: Define some of the display blocks")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cad59af7ccef..92bcbb1770ea 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4562,7 +4562,7 @@ mdss1: display-subsystem@22000000 {
 			reg = <0 0x22000000 0 0x1000>;
 			reg-names = "mdss";
 
-			clocks = <&gcc GCC_DISP_AHB_CLK>,
+			clocks = <&gcc GCC_DISP1_AHB_CLK>,
 				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
 				 <&dispcc1 DISP_CC_MDSS_MDP_CLK>;
 			clock-names = "iface",
@@ -5002,7 +5002,7 @@ dispcc1: clock-controller@22100000 {
 			compatible = "qcom,sc8280xp-dispcc1";
 			reg = <0 0x22100000 0 0x20000>;
 
-			clocks = <&gcc GCC_DISP_AHB_CLK>,
+			clocks = <&gcc GCC_DISP1_AHB_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <0>,
 				 <&mdss1_dp0_phy 0>,

-- 
2.39.2

