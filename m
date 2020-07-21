Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01DF9227C9F
	for <lists+linux-clk@lfdr.de>; Tue, 21 Jul 2020 12:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgGUKNI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Jul 2020 06:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGUKNH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jul 2020 06:13:07 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC46C061794
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2020 03:13:06 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b6so20593771wrs.11
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2020 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/OxVowHa1fzTS8gxpWxPISoWUyhArDmXgs2hoChHUPc=;
        b=A6xv2xdqRRmjsJnH38u8wGV4i2qAIL7q6a0rbpYXygq+txew9VnMaadu8N2TcsQi7Y
         6nMIE/yX12FfnEv05wILXT4YUa9VDeTLZvLYQN0GgsWfdioW4h19cZTGo0lXPoTIfPyT
         4IidUIr/O71+cOtxrGb1FY/MNmrTTbF7ThDxjUSez2EJdSL4x9K/v1diaNOPqT6cnyFc
         iAEYZ5kb+UgWnxQdicnDwZiA8hmEPblKNdsPZArgp09sVibWaFksD98xgoHBdhg6QF0f
         57YbGxjwNQDwhTGjfVVcDPLDKDZ5jjC5TdYbAGhZv57oCsRhDaXknnEjtsLgKopI+fmu
         HA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/OxVowHa1fzTS8gxpWxPISoWUyhArDmXgs2hoChHUPc=;
        b=r6jIyCa2ZfCipQcRRPn5wYUnahyxTfE+Z++j2YKXR/yMnSDBe2uWH9PqYPzVU2CuMO
         sERVUXH8VNumdvCyMjpMwqjLGtpJWp4KlMpGfWjE3Rx/RT9wEDKiqbkRBI40+ZAbeklU
         +bW5D+Qn9/O5YtpiUi7bEjEobDRINuHSQ0dJ95OG4Z7mVFQ9MvULnhQeoG1bP5+B7GDM
         G/bOi9K55FCoSjXqifC0u2NnuyIDpqbJAFyFGQPL2LJj5FLM+Yvn1HLVkwAcTQVamNBB
         wN8ZXXQXnJmqrR5FTpC2ffIXpR7HMAHS8/DC+laek1nv5FVZESZpYrqT/ZTl25zoTCKS
         O0KQ==
X-Gm-Message-State: AOAM530bOcNeOZdOA4NbtTfwvd2aKyY5i9sw/DYLtu+xAKhwG4WgslOc
        iANRTPcBlIYmlAwR8qr8q9fvVYHSv8o=
X-Google-Smtp-Source: ABdhPJw+fh8anSweT6KXCWAMvVeosjJlXbgdhOWwmSRONVbvlwc51svaGRDnQBXR5UIfVdtGrqM76g==
X-Received: by 2002:adf:f44b:: with SMTP id f11mr14033056wrp.114.1595326385607;
        Tue, 21 Jul 2020 03:13:05 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id t3sm5546169wre.41.2020.07.21.03.13.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 03:13:05 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] dt-bindings: clock: Fix qcom,msm8996-apcc yaml syntax
Date:   Tue, 21 Jul 2020 12:18:34 +0200
Message-Id: <1595326714-20485-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix errors reported by dt_binding_check.
- Fix literal block scalar for dts example
- Fix schema identifier URI

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
index d673ede..a20cb10 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/clock/qcom,kryocc.yaml#
+$id: http://devicetree.org/schemas/clock/qcom,msm8996-apcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm clock controller for MSM8996 CPUs
@@ -46,11 +46,9 @@ required:
 additionalProperties: false
 
 examples:
-  # Example for msm8996
   - |
     kryocc: clock-controller@6400000 {
         compatible = "qcom,msm8996-apcc";
         reg = <0x6400000 0x90000>;
         #clock-cells = <1>;
-  };
-...
+    };
-- 
2.7.4

