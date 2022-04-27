Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54D6511A2D
	for <lists+linux-clk@lfdr.de>; Wed, 27 Apr 2022 16:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234805AbiD0M5m (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 27 Apr 2022 08:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235001AbiD0M5k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Apr 2022 08:57:40 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3C34CD5C
        for <linux-clk@vger.kernel.org>; Wed, 27 Apr 2022 05:54:28 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 17so2529156lji.1
        for <linux-clk@vger.kernel.org>; Wed, 27 Apr 2022 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXxEWz9ph7hZzty+IVLu4r/Lu3ntcZ7V7lGeIzMptng=;
        b=mtAjNowVQ9n/EFJbwIJQ6sbdFhgI2en/9cAzsFkyLxT1sbdZmv1BA3folE3R/lFSSs
         6+W3C2GwZUyZ2RabA1E+ohNqP4XDzlk8FXLSyZb+fdy2kmLv2oSYGGeJRJqOGysILTZh
         p7ASRp48tutYf221ZZLNyy6Lphvm3yi69/zIDPavvGpJkpRXiEYz9oanN3BTLfsgDhud
         y2yw9s4s85wWXJDXR1fQKoU775G3G1dSwzBdv8rqcq0RTYO9F7+6iSWmv0zXhL0hPOcS
         4oz0/jtI1cd3RM6DICHosys9brC5Zuecqlm24dCxoU+IY2EWSBnRKCvlcMHrQwuDoDTj
         Qpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QXxEWz9ph7hZzty+IVLu4r/Lu3ntcZ7V7lGeIzMptng=;
        b=0E6H1lscEPN5VTTYOAzGgXFnsY+AgDfOb8qBpEqsQdQGFKzHfgDPCYJrQ85MAPRDoh
         w6oTWWubCQ3JJP24Q+QWuvoxtOjhuERXqkQ9e4Yis6QwooA+IhHLYYLviMO4lLRb1YL2
         YDqSeYK5diPfe+GAj2HvAe1QXrgdqjYQNIkGCkDSmAmydhAakMus0/94IWxgLSFPuGKa
         rXKcEV5Z9wq3pGUf7w+6E/rEpMS3Bz2PIVfxqUW6Rq6zJGPvysv95kqNS6zkAUV6rOfM
         N8LSR5pEcSHHwoq3xi8lfkLEGg7mX0xggUSl6KDUSyuU1Q4AbedH0cn5In0d5JnjAT6M
         kZBw==
X-Gm-Message-State: AOAM533VMF4NfHw3MteZoM25n0/ofZsLLr/gbzOHyo5IaXsXNITgIxxd
        rGprzL+tMyHdn8H2y1sdBxA3NA==
X-Google-Smtp-Source: ABdhPJw6GCQcueiJrs0LuzsaSrZ1o+jHcUI2unnjlEJjDUrT23/Wu3L5RAr5VR9SkK6CSAhe/l+EAQ==
X-Received: by 2002:a05:651c:b0a:b0:24d:d3fd:a30c with SMTP id b10-20020a05651c0b0a00b0024dd3fda30cmr17069225ljr.478.1651064066879;
        Wed, 27 Apr 2022 05:54:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r9-20020a2e94c9000000b0024b4c2a1346sm1827445ljh.123.2022.04.27.05.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 05:54:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        quic_tdas@quicinc.com
Subject: [PATCH v5 2/3] arm: dts: qcom-apq8064: create tsens device node
Date:   Wed, 27 Apr 2022 15:54:22 +0300
Message-Id: <20220427125423.3166138-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427125423.3166138-1-dmitry.baryshkov@linaro.org>
References: <20220427125423.3166138-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Create separate device node for thermal sensors on apq8064 platform.
Move related properties to the newly created device tree node.
This harmonizes apq8064 and ipq8064 device trees and allows gcc device
to be probed earlier by removing dependency on QFPROM nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index a1c8ae516d21..389191ca5a69 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -105,7 +105,7 @@ cpu0-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 7>;
+			thermal-sensors = <&tsens 7>;
 			coefficients = <1199 0>;
 
 			trips {
@@ -126,7 +126,7 @@ cpu1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 8>;
+			thermal-sensors = <&tsens 8>;
 			coefficients = <1132 0>;
 
 			trips {
@@ -147,7 +147,7 @@ cpu2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 9>;
+			thermal-sensors = <&tsens 9>;
 			coefficients = <1199 0>;
 
 			trips {
@@ -168,7 +168,7 @@ cpu3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 10>;
+			thermal-sensors = <&tsens 10>;
 			coefficients = <1132 0>;
 
 			trips {
@@ -810,14 +810,23 @@ tsens_backup: backup_calib {
 		};
 
 		gcc: clock-controller@900000 {
-			compatible = "qcom,gcc-apq8064";
+			compatible = "qcom,gcc-apq8064", "syscon";
 			reg = <0x00900000 0x4000>;
-			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
-			nvmem-cell-names = "calib", "calib_backup";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-			#thermal-sensor-cells = <1>;
+
+			tsens: thermal-sensor {
+				compatible = "qcom,msm8960-tsens";
+
+				nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+				nvmem-cell-names = "calib", "calib_backup";
+				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "uplow";
+
+				#qcom,sensors = <11>;
+				#thermal-sensor-cells = <1>;
+			};
 		};
 
 		lcc: clock-controller@28000000 {
-- 
2.35.1

