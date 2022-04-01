Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF6974EFAEA
	for <lists+linux-clk@lfdr.de>; Fri,  1 Apr 2022 22:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351823AbiDAUNB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 1 Apr 2022 16:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351783AbiDAUMz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Apr 2022 16:12:55 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCC22228E1
        for <linux-clk@vger.kernel.org>; Fri,  1 Apr 2022 13:10:59 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id w25so4206869edi.11
        for <linux-clk@vger.kernel.org>; Fri, 01 Apr 2022 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AvfLRaJBW6E1M5nvBx02fvTqKdSpIJZJoIrrhvppE/c=;
        b=biZjMi8Gi9Wa+XAWZfKljcKy6CGsNOfMCuvMA1MN2UQ2gQ7qRM1zytyuuCisemvT4n
         eKVC3DRJur0w9NnJtl4JtehrItD1Z9STJe0cKv3h7Y9LFLg+fc/NSDp2+OcZdc3MORUc
         ArC2Tx3XIBcrbxS2UJjJT/ztOLXwdl536GAcdsgkXGy7JlRxiGNuVlNsB/bxLAQiP6RB
         SXBUBk7fUgmWbpC1zJkBjFOE0RkbJgdVnAPNFDRL18XYpILCww7uBZgyZTHV/xmFTMYm
         5T4I0hQpJ/sRm88tKr/wqceEgF5V02ZBoXGjS7RNcGf3wlIZ9uBWFfafyBVZTjIPUPJO
         DvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AvfLRaJBW6E1M5nvBx02fvTqKdSpIJZJoIrrhvppE/c=;
        b=zsgpk1cNOG1nCOcmLzrcXFxTTnoYgPCz1MTUdGc3gCtDxd7PDl1d2WTiovCZi97NcQ
         a0Vxu1H5oIPSk0sdX7Z7BWsUFEtI8z3uCvgSkF9a5XBRfvTsqfl3FZQ0MNR8ldcJfTBh
         XihXlbPMapjUGK02JdTad+pU0TZ2PmSz0vqvjUVlXNrkdDkjinhbce1+PK9m3MxLv9C/
         BF3ssOy28ovD0wRCDzKeKmnTJGKgW7jQqsC/noNleYm5sWIIxS5JEBQ63bjlfAg4DBOQ
         eKRDRQIcLnE9DJPQ9cXG3bw5gQ4vUGqKT7ru/EZfKTcg50E0f9Qf44xpUhnRflZwtFoj
         tdcQ==
X-Gm-Message-State: AOAM530yMPyiw1RteBv/2/v9B51camPUzcgBASW2OxjYZysfDvVnVCdN
        Kpir4tcupAMyxf6uichZH0lNeQ==
X-Google-Smtp-Source: ABdhPJzpUkQ6LrIZFlL2INaIFr88n0WL3JjUr/av2XB8sIX4zOzgm2+AQvyGZeA5W7bXKfcLuNLhBw==
X-Received: by 2002:a05:6402:14b:b0:418:d06e:5d38 with SMTP id s11-20020a056402014b00b00418d06e5d38mr22375521edu.90.1648843858064;
        Fri, 01 Apr 2022 13:10:58 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bx5-20020a0564020b4500b00418fca53406sm1509041edb.27.2022.04.01.13.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 13:10:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/10] dt-bindings: clock: qcom,rpmcc: add clocks property
Date:   Fri,  1 Apr 2022 22:10:35 +0200
Message-Id: <20220401201035.189106-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
References: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
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

The RPM clock controller receive input clock ("xo").  It is modelled on
only one chip - MSM8953.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index 6a492b1ebc7c..9d296b89a8d0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -48,6 +48,12 @@ properties:
   '#clock-cells':
     const: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xo
+
 required:
   - compatible
   - '#clock-cells'
-- 
2.32.0

