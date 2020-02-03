Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3725E150F6F
	for <lists+linux-clk@lfdr.de>; Mon,  3 Feb 2020 19:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbgBCScX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 3 Feb 2020 13:32:23 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41407 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729889AbgBCScX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Feb 2020 13:32:23 -0500
Received: by mail-pl1-f196.google.com with SMTP id t14so6179080plr.8
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2020 10:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ufyh64dRjL554l+6oMW1t40PwX6Rqwwg9SWigyl7ov0=;
        b=Iu4R/LVC0EdNzIyoQUz8gWVzIe5lYDEVv9XEVVbybjxRJVKQ7hZwaKyA4L14iMiSgW
         /2t6buaCUEB1VtzaelRwCZ2alxHB5gKAaahP56T37tVRChyoQYXCoTiFlJ9sUFYYdnGc
         nSNb3yfhzRas7U/wZx/GdB/BOYXQoIse+lAyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ufyh64dRjL554l+6oMW1t40PwX6Rqwwg9SWigyl7ov0=;
        b=JRi+jqzT17403Husio0mHdfugO9mugh/7HUsxEGD/JmEbzE774zsObEukOBtJeJc3m
         1y/HwDMYOXuHpNdp1RRnygV7Vu4oV4ZkrJ4qG9yudSbFa9BxqDcCFT1vPfANUwvV1DE+
         3+tkGHKRXdoQBnNSchV2E6WWZ/0CuUNiW70dXX1xbjrXxBKtzf3kG3u84NpFxybkNDIP
         xTq1jyOb+TfVLA5uVbIlpXIzExCs//tXe+cSwcEQyWCMq+whsUtSw793G3lVGsHF55WT
         O6SxG9+A8fKyni8uJm4X+7WULDxnz2aFj241V/7JqB1Fe0qw0K2h9epyeQ7qXmjT3hVv
         wVGQ==
X-Gm-Message-State: APjAAAVedt2Mfx1wOQS24yBOfc5bsEy5zeCjwUfu5HwCfrCyFgEMOdAh
        je58FXqp8zXul269Bv/OoN55hw==
X-Google-Smtp-Source: APXvYqz6kUe+BL54L392u2mtnt3eimDhwtj6qe/DuiV7csWXSR1rYgvKL5qywrLDF2vuLi5/0hswWg==
X-Received: by 2002:a17:902:fe8b:: with SMTP id x11mr25461526plm.83.1580754742337;
        Mon, 03 Feb 2020 10:32:22 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:21 -0800 (PST)
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
Subject: [PATCH v4 08/15] arm64: dts: qcom: sdm845: Add missing clocks / fix names on the gpucc
Date:   Mon,  3 Feb 2020 10:31:41 -0800
Message-Id: <20200203103049.v4.8.If8596faf02408cef4bb9f52296b911eb9ba49287@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We're transitioning over to requiring the Qualcomm GPU Clock
Controller to specify all the input clocks.  Let's add them for
sdm845.

As part of this we've decided that the xo clock should be referred to
in the bindings as "bi_tcxo".  Change the dts.

NOTE: Until the Linux driver for sdm845's gpucc is updated, these
clocks will not actually be used in Linux.  It will continue to use
global clock names to match things up.  Of course, Linux didn't use
the old "xo" clock anyway.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4: None
Changes in v3:
- Unlike in v2, use internal name instead of purist name.

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...gpucc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0985813fee50..35d7fcbda43c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1903,8 +1903,12 @@ gpucc: clock-controller@5090000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
 		};
 
 		stm@6002000 {
-- 
2.25.0.341.g760bfbb309-goog

