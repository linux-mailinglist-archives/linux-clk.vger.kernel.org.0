Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3C58519F4D
	for <lists+linux-clk@lfdr.de>; Wed,  4 May 2022 14:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347471AbiEDMbL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 4 May 2022 08:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349445AbiEDMbK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 May 2022 08:31:10 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B59626AE1
        for <linux-clk@vger.kernel.org>; Wed,  4 May 2022 05:27:34 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g23so1487312edy.13
        for <linux-clk@vger.kernel.org>; Wed, 04 May 2022 05:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fJgKFMAN9XJcQFXSIBW4zb7s2vD8f3jyjsxvG6sAqRM=;
        b=aJZprpLOg4Q7URVW5jrhkvvYRKTRJ0WJvFHRSp0e/jKAhS6/clUxjaaM7+B1zgJR8x
         S17FYIBh7thE163yPel2PMtUA8mQlaEeUMk3/rXEJRSNndkhzQnHafDQroXkbu9ZjJO7
         VyNmJLUMG0HifB8uIJkPPWDcWbXlBtt6zLr3GOT6NFWlTByaHgmFGUjQM7dzoy0lRgsI
         2cl+t29f3jA4eQBviaYAzfr5+rdZi8wNtxhK6C8Wl5FX4hUDdnJU6t0ExEG+4r6DZ8OP
         rl8QuAErnLKE1o2FgWu0mf9TUNVaB1+ZqJ81x0L2J7pwAR34W6x5Xs+LeiBOZbNO2Cyf
         seiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fJgKFMAN9XJcQFXSIBW4zb7s2vD8f3jyjsxvG6sAqRM=;
        b=10eeFSXYZGe9tZsojSxuOr1BKi5ltWBvYIgNPBGHn/2d6m5IQn86z/+JlbGExCxx9e
         rL3Jhtq6CxuJRiwkO9O8SWaYW7Jb1EqS3LFWd6ypvgAdsg8+edFbJ+jrSZr4Kg7cHH8d
         89tCEUfFoytcCTFj8eyfCevCbJQzVl8bdcKVMb75EbinclJ+U9fsHUcEvLEbcZ2XpDQB
         JNhs9uIy9Fd0TH1WaB3VNU+0NZPa746TjrjvdogrfdNi76ZzDf3QFfikZ0Dj+f90XNCk
         QBc8f5B/bnnLtKXZ6amk1/GVjm54Fjag/FW5cg+xKvej+lFZzd2nSqW1Nm04GPJB+tXW
         Y+xA==
X-Gm-Message-State: AOAM530r5tpZ45trs+W0swBFqC30fGUgxVHo6SD+fg39X6Lc/+BG/df1
        t1tzMPD0Sfe7u+mcQRfbxboThQ==
X-Google-Smtp-Source: ABdhPJxTYHD9YTyrH51GmC8O/lzpaoP2eGs3uQ7+LAkDPt9RTm65JWxBa7AG+7/PdLC/nR55FcdDpw==
X-Received: by 2002:a05:6402:42c8:b0:427:d087:29 with SMTP id i8-20020a05640242c800b00427d0870029mr12569999edc.53.1651667252790;
        Wed, 04 May 2022 05:27:32 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id mm30-20020a170906cc5e00b006f3ef214e06sm5675557ejb.108.2022.05.04.05.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 05:27:32 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v3 1/6] arm64: dts: qcom: sm8350: Replace integers with rpmpd defines
Date:   Wed,  4 May 2022 14:27:20 +0200
Message-Id: <20220504122725.179262-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220504122725.179262-1-robert.foss@linaro.org>
References: <20220504122725.179262-1-robert.foss@linaro.org>
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

Replace &rpmhpd power domain integers with their respective defines
in order to improve legibility.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c0137bdcf94b..52428b6df64e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1656,8 +1656,8 @@ mpss: remoteproc@4080000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 0>,
-					<&rpmhpd 12>;
+			power-domains = <&rpmhpd SM8350_CX>,
+					<&rpmhpd SM8350_MSS>;
 			power-domain-names = "cx", "mss";
 
 			interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>;
@@ -2167,8 +2167,8 @@ slpi: remoteproc@5c00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 4>,
-					<&rpmhpd 5>;
+			power-domains = <&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
 			power-domain-names = "lcx", "lmx";
 
 			memory-region = <&pil_slpi_mem>;
@@ -2235,8 +2235,8 @@ cdsp: remoteproc@98900000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 0>,
-					<&rpmhpd 10>;
+			power-domains = <&rpmhpd SM8350_CX>,
+					<&rpmhpd SM8350_MXC>;
 			power-domain-names = "cx", "mxc";
 
 			interconnects = <&compute_noc MASTER_CDSP_PROC &mc_virt SLAVE_EBI1>;
@@ -2540,8 +2540,8 @@ adsp: remoteproc@17300000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 4>,
-					<&rpmhpd 5>;
+			power-domains = <&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
 			power-domain-names = "lcx", "lmx";
 
 			memory-region = <&pil_adsp_mem>;
-- 
2.34.1

