Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A407234C4C
	for <lists+linux-clk@lfdr.de>; Fri, 31 Jul 2020 22:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbgGaUae (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 31 Jul 2020 16:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbgGaUae (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Jul 2020 16:30:34 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A522C06174A
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2020 13:30:34 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d4so16613259pgk.4
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2020 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=weGaEUbWXhtvDsUwxI7WD59tut0B9ynJovlJxJPSr30=;
        b=DOMtOUbNIcUNnrO3luj2ZzSjClPQQp8fILqZhF9gYORl1w5I1GZP41crTq/7BfpBUq
         Hs6dY69mopbkiT/kmkfKf1o7gC26CYMKrr3qw3YRgtAFZGV9Bviv44lSgiBR5/GoULmb
         Zxz0QAKU7LETCyK+hpPPHS55c4FRj8dBzjZ/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=weGaEUbWXhtvDsUwxI7WD59tut0B9ynJovlJxJPSr30=;
        b=hvMuuK+xXObohF+0sJ7+hP4F6MkWjG16OYBnxC9H7t+ylWWCyVLTEbd4NdY/j2Msfc
         OvWzc2ZXgcIHq/sXKBGPKivnysrfLVz1K/nEmmsbRycrpoGE/ATB/4CZPZ1W1ari5FKE
         xjpdvWxeHkXvsGBcKgTDjBmQkZdYhlxaUmAKct6s8mbz4kPAltmOiXK91bTvoH8JFasa
         38IOrbibips/lVRiFC88RtJ3vroez21vVmposWxB61HHkWV/m1AZtN18l8ECFdsxVA56
         bn+1YEb9Ff7Or65ieSVWRny5oh16oeM1/hDyUcl8XTrz0bSDtf1kWViR7EiCUK6Tmzww
         9hqw==
X-Gm-Message-State: AOAM531qqRsE1beX49bkqROx9xNB4Whg/Nh3kahv4BPf03spt8IgEqag
        anFil7yb0sp1+SdRd2bp8ZoB+g==
X-Google-Smtp-Source: ABdhPJx0V0bNap1eBuKoNNVtaRrVjctEyShWlRkYXMw241ck/GG/AhTKOG2YQFjq/njQ6XWUcSSI4g==
X-Received: by 2002:a63:d62:: with SMTP id 34mr1677877pgn.179.1596227433581;
        Fri, 31 Jul 2020 13:30:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id c132sm11050449pfb.112.2020.07.31.13.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:30:33 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Fix YAML schemas for LPASS clocks on SC7180
Date:   Fri, 31 Jul 2020 13:30:10 -0700
Message-Id: <20200731133006.1.Iee81b115f5be50d6d69500fe1bda11bba6e16143@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The YAML schemas that landed forgot one clock: "bi_tcxo".  Presumably
the bindings were developed against the v4 version of the driver and
when the ".name" was removed in v5 of the driver things broke.

While touching this, add the needed includes in each example.  I
believe both examples are supposed to be independent of each other.

Let's fix the bindings.

Fixes: 381cc6f97cda ("dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7180")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
index a838250b33e7..c54172fbf29f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
@@ -25,10 +25,12 @@ properties:
   clocks:
     items:
       - description: gcc_lpass_sway clock from GCC
+      - description: Board XO source
 
   clock-names:
     items:
       - const: iface
+      - const: bi_tcxo
 
   power-domains:
     maxItems: 1
@@ -77,24 +79,28 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
     #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
     clock-controller@63000000 {
       compatible = "qcom,sc7180-lpasshm";
       reg = <0x63000000 0x28>;
-      clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
-      clock-names = "iface";
+      clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>, <&rpmhcc RPMH_CXO_CLK>;
+      clock-names = "iface", "bi_tcxo";
       #clock-cells = <1>;
       #power-domain-cells = <1>;
     };
 
   - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
     clock-controller@62d00000 {
       compatible = "qcom,sc7180-lpasscorecc";
       reg = <0x62d00000 0x50000>, <0x62780000 0x30000>;
       reg-names = "lpass_core_cc", "lpass_audio_cc";
-      clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
-      clock-names = "iface";
+      clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>, <&rpmhcc RPMH_CXO_CLK>;
+      clock-names = "iface", "bi_tcxo";
       power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
       #clock-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.28.0.163.g6104cc2f0b6-goog

