Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3886A53C6A7
	for <lists+linux-clk@lfdr.de>; Fri,  3 Jun 2022 10:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242676AbiFCIAj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 3 Jun 2022 04:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242693AbiFCIAg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jun 2022 04:00:36 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C9536B4B
        for <linux-clk@vger.kernel.org>; Fri,  3 Jun 2022 01:00:34 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u26so10682161lfd.8
        for <linux-clk@vger.kernel.org>; Fri, 03 Jun 2022 01:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OeCYqj1sETnV1TkCzUKXxUpL01AtczNgPuNEI88HkKc=;
        b=MZdzt5C7qaRtkCwwnjTZiniSdsKNl6FDgEtu98mzD777YavO0v3/gOOqhirTuYcdX6
         ZeSoeXrF/En6RlJHrDKpYfSdiaqhYgYrbQWQT1anpe2AtWGLVZQU6PuI4XdWOsD7sZHU
         qIyY241Dasi5XDGV8pPuM2fdOJvlUG4ewVmJKlIxO6Sh6WfYdPQphjaqv+OCaXBH5X1C
         2huRKd+r+CCnaptf5vdnsIe6m6OhWVbEUrWv+CyzAO158T/9e+0eUfGyn6sRS6h5VH09
         kC1+iBJ4gaABfQMufWCxKN5YyRh8RDWZn0L3VitWksbwnFZxI9wjpc8yoc1CKedLNfD2
         0wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OeCYqj1sETnV1TkCzUKXxUpL01AtczNgPuNEI88HkKc=;
        b=HsJOf2Czuw1q5EnZs5V7mdLWu4EZA+6gFfecPWQ6aJzsV3bGDTwKCeUbB9sNHm5ZTy
         RWUhrA26zhGp++HX74ZUIqC9e8gfmOE5PgWi3p5yty2npKbHHfwoPCYrzpBxkkyfdl75
         HzsgA8kSiJ84QacMkyFy2UlgtcuMkmlDwX4p59MG2mdG+Br5zmpoi0/9ILtN4R3Pup1C
         HVMgsNDhIRtdgBpp13GoLHPApbXnA5q5+9v4y5KNVrQHOVR36xsH5cBVCEqhu/mY8d2J
         B0f4iuxnPEHv47XVg7aTVtxLSttKZR5Pkp+et3m8yAiqEOhhYWlWl/NqsXtBerpTe7Am
         RVlw==
X-Gm-Message-State: AOAM533DcJieZVeM9APV5tBJ81b5ES5+8OSF78qAH8YWBUpTPte50JEC
        ThzqhdH6S7wnxApxkYvSRHoLcg==
X-Google-Smtp-Source: ABdhPJwHVqBWP24Bn5+K65KlwlkLv4eGH0osoEFRfeIw9uIqpRd/rXZdioEfNb8Fs36E8dQkAghGkQ==
X-Received: by 2002:a05:6512:29b:b0:479:2ac:84ae with SMTP id j27-20020a056512029b00b0047902ac84aemr5975551lfp.624.1654243232450;
        Fri, 03 Jun 2022 01:00:32 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id l13-20020a2e868d000000b0025582d66aebsm50356lji.70.2022.06.03.01.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:00:32 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v6 2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Fri,  3 Jun 2022 11:00:19 +0300
Message-Id: <20220603080019.2251764-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org>
References: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org>
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

The change adds description of QCOm SM8450 camera clock controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v5 to v6:
* rebased on top of linux-next.

Changes from v3 to v5:
* none.

Changes from v2 to v3:
* account a renamed header file.

Changes from v1 to v2:
* disabled camcc device tree node by default.

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7d08fad76371..fad813a21df5 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8450-camcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -2288,6 +2289,25 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8450-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			status = "disabled";
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			clock-names = "iface",
+				      "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk";
+			power-domains = <&rpmhpd SM8450_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-- 
2.33.0

