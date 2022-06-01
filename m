Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24D2253A553
	for <lists+linux-clk@lfdr.de>; Wed,  1 Jun 2022 14:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353097AbiFAMog (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 1 Jun 2022 08:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353068AbiFAMof (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Jun 2022 08:44:35 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470AF43EC4
        for <linux-clk@vger.kernel.org>; Wed,  1 Jun 2022 05:44:25 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id q1so3489261ejz.9
        for <linux-clk@vger.kernel.org>; Wed, 01 Jun 2022 05:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JeSI4uQxR2QJYLMBJ1DqLjl1fY9poS8Q+KM6xI9FOz4=;
        b=whJ2LInpsfW99ZDLn3m+Dy9M8JouyCJLhDt0YhwGRTPVaak0kyIfkTLVY/BBRqa3RF
         ZXbAA0n5J5BA/9IWNrQTvBX0kV/pV+MlKOKBc8d8uA+8CpRPqCvwbl+Qpp0Cqc7xSTM0
         4YtQ9m9ZRgmrlLJeAlWEvmrpUuiG4xKXUk51CMiU8aBQecEORzPctNgLpR6PGPwCk02D
         ktOAfDgZesbUjCXo5G2gUDWdNV/LLNuq1vl4WrnXLx3+yvVlpNP1AV8+sTm0KS/CBv9r
         wBH9ABa2beMZkgSiI54oRkRFGe1HHLjQmkvyhbQZOcIqLVTRUL/KrdiucvUhz38r1MQR
         H0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JeSI4uQxR2QJYLMBJ1DqLjl1fY9poS8Q+KM6xI9FOz4=;
        b=ZdWGxf53aSSa79D9R0Wj4XYgbharhzgaTSUHm61Z5EXd3h4Xc+KAQNuBRMJ2aNvh53
         YWOrosnSRNyOe4pLYY0/dzghEqSM5eGd2nhBM24hovt+9SpRQszkJiujmBF5NJgbJYxP
         KdsxxRwcH59MZxXlD54HwyuEClj9sM+04nNI3zZXmZu52SW+LskXCynu1n2OBlWQnDcJ
         KrtAGUw3nWMyk8I1SY9LVZ41xL2gl2EE+YP2oba5R172XFnlaA/H2+5zkJV6x0JzmU2E
         Jr9lYUg9pb9jIikoeEB8u8puSOcNI/EbXC1MR0pJswbB51T58w9igJFH0RC1NPHKt80F
         QSfw==
X-Gm-Message-State: AOAM531/uX2vbpenAOpwhJgWQe8mi91DzFDYlQhnp/WbWg5aI5rZIU7C
        0QE8bK+e13zS2qjn6aMnBfoT0vpTL+hopw==
X-Google-Smtp-Source: ABdhPJxvXRS4kVxzbQ09uBJ+jQPMMkzD3EsuPOg/u8HkzuJoP5NP2piSzB7RfCX28DjXEr56FtW7zA==
X-Received: by 2002:a17:907:9810:b0:6fe:90ca:e730 with SMTP id ji16-20020a170907981000b006fe90cae730mr56531133ejc.549.1654087463739;
        Wed, 01 Jun 2022 05:44:23 -0700 (PDT)
Received: from prec5560.. ([176.74.57.19])
        by smtp.gmail.com with ESMTPSA id j10-20020a170906830a00b006f3ef214dc0sm682055ejx.38.2022.06.01.05.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:44:23 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, robert.foss@linaro.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 6/6] arm64: dts: qcom: sm8350: Add DISPCC node
Date:   Wed,  1 Jun 2022 14:42:50 +0200
Message-Id: <20220601124250.60968-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601124250.60968-1-robert.foss@linaro.org>
References: <20220601124250.60968-1-robert.foss@linaro.org>
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

Add the dispcc clock-controller DT node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2
 - Remove interconnect include - Bjorn

Changes since v3
 - Switch from .fw_name to .index


 arch/arm64/boot/dts/qcom/sm8350.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 52428b6df64e..df0f3dd38f0f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dispcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2525,6 +2526,30 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			power-domains = <&rpmhpd SM8350_MMCX>;
+			power-domain-names = "mmcx";
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8350-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.34.1

