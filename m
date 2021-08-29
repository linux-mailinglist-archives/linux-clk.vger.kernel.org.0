Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14393FACD6
	for <lists+linux-clk@lfdr.de>; Sun, 29 Aug 2021 17:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235713AbhH2PtF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 29 Aug 2021 11:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235727AbhH2Ps6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Aug 2021 11:48:58 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1F1C0613A3
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 08:48:05 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g13so25842666lfj.12
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2tYRoRbfa36+k6p6nVAHUWAv0P4p/PXeEpuMEWtjJY=;
        b=b/sjdFWIwdof9blUBT6l+IdD82KErjW9pYx8UFRrK/0f21VD94u9Ls01DgurhY736l
         pu0tOrMkOKcJ7W/vgAP+QfIpki0C9caj7ReC6vWpOy/qG+gOfyvbfBenmMmcf2KdoBOr
         N6mmeZygXGqX5LhvgPuuxOIkja09BRVlIlDq9TcXIQWiLuNJe16/PnnyN5lzYjI0JBki
         aoPnVucK/ZtwDgmJbfkk2txttLexBhEyXxNjLMPRBASv5KE0hqVh3zITKuN4s8WMbI07
         mex1R8DjaAh3jYZd2mjzQ7Q/pIQrxb2LCDEIJSJWBips7jyPFMlsg8jhfCaH+kMPzJtw
         rxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2tYRoRbfa36+k6p6nVAHUWAv0P4p/PXeEpuMEWtjJY=;
        b=n++8Fk32BvfGcGUx75TqWTICvg8qAioIM5gx9zyJC7+Oo4Wss1WYdERfcpHPZwPff/
         Ngqcg1c8jUOnDolYZgZdckCI6DiUJy+KWKN4legBH19IQ6+WaKnMBmqUAiF9M9E5FSbq
         +rA3V4uZ0QmL6IBFGlccFPCSbStwm3dL1/anw7itaPLbekEtJFjNVg3harFR2iiQMvd1
         oyAHWrRDHDixidpw5M7beDK1iBRoOXETA6HHfuQNFtFYXqtIgUcYfaOOPpso4tUy4EAK
         ZArD0W+YX3/2QtIxd+AvkH3XT1imamz9i1KbTkWTRpMoCWRQBay03WZbyuboOtxr0H/o
         OlYQ==
X-Gm-Message-State: AOAM531fWLrSClSRP/yNXv5OSFokAbPyTJrrVEO/I+GefKwYMApd/QY5
        BUf0lpiEeliUzbrRnUmPLSsHZA==
X-Google-Smtp-Source: ABdhPJzIf88LNHBf8C0/+tjAdSF0O924PxfSDYRaeiMse/6V6Lfd3ZpRpVF6id+oDMPWtHAJg1tQNw==
X-Received: by 2002:a05:6512:681:: with SMTP id t1mr13902317lfe.487.1630252084110;
        Sun, 29 Aug 2021 08:48:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y5sm1481243ljd.38.2021.08.29.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 08:48:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/8] arm64: dts: qcom: sm8250: remove mmcx regulator
Date:   Sun, 29 Aug 2021 18:47:55 +0300
Message-Id: <20210829154757.784699-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch dispcc and videocc into using MMCX domain directly. Drop the now
unused mmcx regulator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4798368b02ef..0d35449fda02 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -273,13 +273,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
-	mmcx_reg: mmcx-reg {
-		compatible = "regulator-fixed-domain";
-		power-domains = <&rpmhpd SM8250_MMCX>;
-		required-opps = <&rpmhpd_opp_low_svs>;
-		regulator-name = "MMCX";
-	};
-
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
@@ -2451,7 +2444,8 @@ videocc: clock-controller@abf0000 {
 			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>;
-			mmcx-supply = <&mmcx_reg>;
+			power-domains = <&rpmhpd SM8250_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -2720,7 +2714,8 @@ opp-358000000 {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8250-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
-			mmcx-supply = <&mmcx_reg>;
+			power-domains = <&rpmhpd SM8250_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&dsi0_phy 0>,
 				 <&dsi0_phy 1>,
-- 
2.33.0

