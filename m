Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBBA150F7D
	for <lists+linux-clk@lfdr.de>; Mon,  3 Feb 2020 19:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbgBCSce (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 3 Feb 2020 13:32:34 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43004 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbgBCScc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Feb 2020 13:32:32 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so8002194pfz.9
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2020 10:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GcQPmK/EL5PoNkrImo6wzmVbqHzRjqrCxX5jeH1GDVc=;
        b=Gi/MTaHsVWTX49DUKWopOV2+0N0eP8zKJ5xdlfwWhsT3f+OcxCe1lJktY9QLSZhIKz
         9GB+xpaVIkOlaGWNG9Hw/9IChuRDtoHU5mDGq+BoryAYgWQBAbqS5Ru3Utnyhl0avZZu
         0pr9cda/+qTDQotla82A6OnzXWzrW6dXE/Oz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GcQPmK/EL5PoNkrImo6wzmVbqHzRjqrCxX5jeH1GDVc=;
        b=e1EKc2LjimvdRzCOWqCgSytB7hJaFXSQp+jXGAJXk/ifHdxdg3rw9iCYxlRJx6eXTP
         AhGBj5Jq9qhuSkqoOTGp893J7IJXISr4d3M7ApodUHKi2Ju+KOF6mhhD0ZR5BZ3eTsg2
         Ta7Swl2Y6AfWPFeq1Oy+1PzPyzRGMmiu3HamG0W0JFzTg5HnbzV4oGQPLwJmln+dlATe
         MM21ysrzvzFxjK3kf8Sp32GCvXrAIX1IJSb2selq2RtqI+K35+gZC5wZhYI6rRtYBjCz
         NkTB/NccxJdIHs7Re8TAIBhh9wjYbeZgnJ2amnyYqNBLxSV0kC5/5B1oar9oLBleZjwP
         ql5g==
X-Gm-Message-State: APjAAAX0kPr/gk8FZqq7yOsSzQaUXNYDNZFd0r8J2OG3rGNzHrqEE4ks
        2ei0JRXBgMxoILKyrhHe8q1nzA==
X-Google-Smtp-Source: APXvYqxZZESrsKizk1ZwzzsrnzuSxnKXSwRiJMTS+PwoYXAq69qJ2bPEUC3EQesTffzVikG7ozabhg==
X-Received: by 2002:a63:6787:: with SMTP id b129mr26811249pgc.103.1580754750870;
        Mon, 03 Feb 2020 10:32:30 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:30 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 15/15] arm64: dts: sc7180: Add clock controller nodes
Date:   Mon,  3 Feb 2020 10:31:48 -0800
Message-Id: <20200203103049.v4.15.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

Add the display, video & graphics clock controller nodes supported on
SC7180.

NOTE: the dispcc needs input clocks from various PHYs that aren't in
the device tree yet.  For now we'll leave these stubbed out with <0>,
which is apparently the magic way to do this.  These clocks aren't
really "optional" and this stubbing out method is apparently the best
way to handle it.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4: None
Changes in v3:
- Added videocc include file.
- Unlike in v2, use internal name instead of purist name.

Changes in v2:
- Added includes
- Changed various parent names to match bindings / driver

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 47 ++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8011c5fe2a31..57ff5e0f7ae6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -5,8 +5,11 @@
  * Copyright (c) 2019, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dispcc-sc7180.h>
 #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,videocc-sc7180.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
@@ -1039,6 +1042,20 @@ pinmux {
 			};
 		};
 
+		gpucc: clock-controller@5090000 {
+			compatible = "qcom,sc7180-gpucc";
+			reg = <0 0x05090000 0 0x9000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		qspi: spi@88dc000 {
 			compatible = "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x600>;
@@ -1151,6 +1168,36 @@ usb_1_dwc3: dwc3@a600000 {
 			};
 		};
 
+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,sc7180-videocc";
+			reg = <0 0x0ab00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "bi_tcxo";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sc7180-dispcc";
+			reg = <0 0x0af00000 0 0x200000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "gcc_disp_gpll0_clk_src",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
2.25.0.341.g760bfbb309-goog

