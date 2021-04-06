Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2DD355F5C
	for <lists+linux-clk@lfdr.de>; Wed,  7 Apr 2021 01:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242900AbhDFXT1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 6 Apr 2021 19:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245064AbhDFXTZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Apr 2021 19:19:25 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CF5C0613D7
        for <linux-clk@vger.kernel.org>; Tue,  6 Apr 2021 16:19:15 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j18so1569452lfg.5
        for <linux-clk@vger.kernel.org>; Tue, 06 Apr 2021 16:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AmYo6XqX++v95q1RyeTSve0yN0GdRgCTRXoSLrb50KY=;
        b=K9wFHrdtGCPomu0gWmIBmd5bbDUVz4j6Mxi5Pyah2VUcJRvwqotCpIihgEgf0gw2yK
         3NkbUl4cMiGA+ZPlAFJXpJ6SqpsISBJNywa3pH9N3rImp9YH+1pBhy5UGJfX4qCYih40
         9nmo5dmSXHvpOd7Bi/Lv1koNVritNxDbB8Wo1dP4GjDJpwt1AiE/vRfA/zDr59SPxzgx
         T7wfbZXAjoUxPkOUW46m7uverZBS1gl0vP93TZaX/VJqMEP606NewOWE14BD6DR39c86
         o33v0TKPJYBCccZ0VKEgfBikUeWiEc20zqObLapzD6AWgH5HmfnNqEApq6AFU07oUSvt
         THdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AmYo6XqX++v95q1RyeTSve0yN0GdRgCTRXoSLrb50KY=;
        b=jTE3VY/Ni5Z3+3/qFQrfKzR7oJueNsFh1fde1NaYJ4Ji+bXoyhA7UFPxcR2CtZS68a
         xJ7Nyg1eDC0ZyiNYOX5/2qpGWmcrKT8/dVARzqXZu3AUZfLTZiXGK9UJkeJD0VDoP/N5
         UJxN8baGwId1CpzEoAhAO3fPRsiArRcysi80yyu0Sg2nQ8zTgP9/fcUfXvkYiLEko90m
         v1K7FzTic8UiKC26O1QDUZ+Am2sbMP6+aIbZ2dSAWpicXs+IrpmP3ZHGfd3XrW+BxSSL
         HWClRD0PPw/M+4Prn6KJPrHJ3t2o7wUItnNH8O8g4WJL0LKx5oeKscj+gRIE/IlxZUS4
         P/Ag==
X-Gm-Message-State: AOAM533KyesH6U8mqB8kixOz9Ib0iqATlYDWrSUZEyKz5OPGyICLAQ7X
        g+YQ+61nE8QrFLnrBvNFQTd1ow==
X-Google-Smtp-Source: ABdhPJwIEnReP04XmwMtjnPC0ylokTrU9GuBGCC1yDbdLzEVIunZ2Ptedm1mmuAxgedD3MK8ARayCA==
X-Received: by 2002:a05:6512:3698:: with SMTP id d24mr357154lfs.217.1617751154337;
        Tue, 06 Apr 2021 16:19:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm2366565lja.48.2021.04.06.16.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 16:19:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: sdm845: add required clocks on the gcc
Date:   Wed,  7 Apr 2021 02:19:09 +0300
Message-Id: <20210406231909.3035267-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
References: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Specify input clocks to the SDM845's Global Clock Controller as required
by the bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..86f717d5bfb6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1061,6 +1061,16 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sdm845";
 			reg = <0 0x00100000 0 0x1f0000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <&pcie0_lane>,
+				 <&pcie1_lane>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk",
+				      "pcie_0_pipe_clk",
+				      "pcie_1_pipe_clk";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -2062,6 +2072,7 @@ pcie0_lane: lanes@1c06200 {
 				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
 				clock-names = "pipe0";
 
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clock-output-names = "pcie_0_pipe_clk";
 			};
@@ -2170,6 +2181,7 @@ pcie1_lane: lanes@1c06200 {
 				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
 				clock-names = "pipe0";
 
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clock-output-names = "pcie_1_pipe_clk";
 			};
-- 
2.30.2

