Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBADB150F78
	for <lists+linux-clk@lfdr.de>; Mon,  3 Feb 2020 19:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbgBCScb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 3 Feb 2020 13:32:31 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43002 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730016AbgBCScb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Feb 2020 13:32:31 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so8002154pfz.9
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2020 10:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5g1BX8oYOcgjo9pux5M5p2bLE7s9j8ECvjIyZHRTnQY=;
        b=jH9/4kluz76UNEEinon0dfMka4SAYZN1IDWt64qfM1HpWCST1rVre8ZLTVnySBrQE4
         r06F3cdXarrfXJbeH+c55smVRxDpXbI+4b0M3jlK4YWF8O9dGC/4TQ97lsUlI5mgSZgr
         N0cMvp3/6MYuTIjeZSCD36rwx5ScKvjo8aXsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5g1BX8oYOcgjo9pux5M5p2bLE7s9j8ECvjIyZHRTnQY=;
        b=cEO21zMKytF2Pr62rfq0xghPxClqKXYEZt3jyCMaeb+14i7fIC0N64WpQqjBbmklco
         lRsVRRrVRnmYYVc5+6iy1o4K8S3h1UDpDS7sAx6gOXvHWR3BeQSRkp0qGQzfau1zWDcO
         gDQ7KfwV7oYGYXbrQwb4q3Qqr8hU4vrH7+vGXuEEczM+TqNzSgohTWq9uEoWxlvQ4OHt
         bpS0IAwqbLM7+LwbOAnvngW2uhdhFiWQ/0svyXwP/21suhAjdzKWiZbvyaxjmBwWv+qN
         pG50R4JVZ7yea0bA/XRmwlM9lStQ7Fm5kcrk2pVnSb8EgPZ+vrLWF+RwKr/m2c9uypFn
         UDoA==
X-Gm-Message-State: APjAAAXRm9b0aTmx1Rtr86wEyDJEpcAnGVMt2uZ64y0UCFdJuxTzMeRM
        NkGuM/MAT6eZLdNrtSD1QILf6A==
X-Google-Smtp-Source: APXvYqzTPiqHWb2iLW58b5qmzi+ONdPRjXdFJef+3ajjCtf9c5DeaPH9Qiwb5Hulf1bb3kru1zEZZA==
X-Received: by 2002:aa7:9567:: with SMTP id x7mr26097051pfq.133.1580754749735;
        Mon, 03 Feb 2020 10:32:29 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:29 -0800 (PST)
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
Subject: [PATCH v4 14/15] arm64: dts: qcom: sdm845: Add the missing clock on the videocc
Date:   Mon,  3 Feb 2020 10:31:47 -0800
Message-Id: <20200203103049.v4.14.Id0599319487f075808baba7cba02c4c3c486dc80@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We're transitioning over to requiring the Qualcomm Video Clock
Controller to specify all the input clocks.  Let's add the one input
clock for the videocc for sdm845.

NOTE: Until the Linux driver for sdm845's video is updated, this clock
will not actually be used in Linux.  It will continue to use global
clock names to match things up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4: None
Changes in v3:
- Unlike in v2, use internal name instead of purist name.

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...videocc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 35d7fcbda43c..3ad08d9deb54 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2607,6 +2607,8 @@ video-core1 {
 		videocc: clock-controller@ab00000 {
 			compatible = "qcom,sdm845-videocc";
 			reg = <0 0x0ab00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "bi_tcxo";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.25.0.341.g760bfbb309-goog

