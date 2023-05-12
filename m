Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16DC66FFE02
	for <lists+linux-clk@lfdr.de>; Fri, 12 May 2023 02:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239691AbjELAcq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 11 May 2023 20:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239619AbjELAco (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 20:32:44 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F96459E8
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:39 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f13c577e36so10410691e87.1
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851559; x=1686443559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhWJCvsiOM+PbnYgsNzdrZ31BrHJ3YrqzSWfh68CWBg=;
        b=oOICufZb/myAzXdjpGcjdkexRD/RJ1hRY4YbUWRzEMTKb4kSvExw32iKAcypLd5Z0F
         qvCwoszG9WDS2/Sdq0lbfvAmnyHrURe/3xCvpDUQSAV0Iuwbm92EL1qpHshPJIZDoKcX
         /jrMTQy7ek5A5pK+N5+pC74JV9en3XqpTZR0GO9Nm5S88CrGwbSlKdA1UUI/PR0xMuKw
         yKGq99PmBGwwdORg+0fE+63msegSXhZ4Buu3Rg7i2ar4EKrGtLRMkBGLk9oYI0/IhZR9
         qJLhyFv2AFH8HqD4/GBejXs9aRMFZEopWVOZGH/BkmyOmRk7R8doCthrupAYd4zvYl4d
         oA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851559; x=1686443559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhWJCvsiOM+PbnYgsNzdrZ31BrHJ3YrqzSWfh68CWBg=;
        b=fNZRUFa7h7UhoJHuP5ZcZAfYHcd0HLK8tHDxVn/N5ba7inlf5BLCJUTQh2lIUIIcuU
         rpkobPnoSzReI7U2jW7wzFpKpjkFVx20j5FiqK6GqKJLRloaabrdvLP4FmrZD9X6QxOL
         omrP/t53B5vOq9aC2CcwgFiEa8YD9MSOpBkI1GA4W3KQHvR6DsLCTqmJNISoVPaVNBY3
         +7b+0udD8Ss4dFb/JdgpivQ74JASn+4C1j6iF6GZ0V/FRh+AQ8u6g3yx+p492ILqq/zV
         qalHSHsoRvJunf8ocWpfh6wMGMXfxtKR4HmDYgfat9TjYt+q2yz0vSP27h+SJkizRqq4
         95Pw==
X-Gm-Message-State: AC+VfDzeALUOM0zPOgiIX9M+eXCCsFM7zDBZjp61Ai/VfC7Y2KzrpqYm
        kUyhttdd4/h5Di2nElh06PbSrQ==
X-Google-Smtp-Source: ACHHUZ7i+WdERWxL6xNwlrYNpnpFYdyBYvMlgqFqW6qoDXPmWogyM+3W3y6F+wboGLBqDn5SwAL8gQ==
X-Received: by 2002:ac2:511e:0:b0:4eb:c4e:bd87 with SMTP id q30-20020ac2511e000000b004eb0c4ebd87mr3211134lfb.58.1683851558945;
        Thu, 11 May 2023 17:32:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 10/10] ARM: dts: qcom-mdm9615: specify gcc clocks
Date:   Fri, 12 May 2023 03:32:30 +0300
Message-Id: <20230512003230.3043284-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fully specify the clocks used by the GCC on the mdm9615 platform.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 556abe90cf5b..fc4f52f9e9f7 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-mdm9615.h>
+#include <dt-bindings/clock/qcom,lcc-msm8960.h>
 #include <dt-bindings/reset/qcom,gcc-mdm9615.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
@@ -106,6 +107,8 @@ gcc: clock-controller@900000 {
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
+			clocks = <&cxo_board>,
+				 <&lcc PLL4>;
 		};
 
 		lcc: clock-controller@28000000 {
-- 
2.39.2

