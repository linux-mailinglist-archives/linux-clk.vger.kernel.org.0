Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0714EFAC0
	for <lists+linux-clk@lfdr.de>; Fri,  1 Apr 2022 22:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236493AbiDAUMe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 1 Apr 2022 16:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236618AbiDAUMd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Apr 2022 16:12:33 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC55214FB2
        for <linux-clk@vger.kernel.org>; Fri,  1 Apr 2022 13:10:43 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id bh17so8100413ejb.8
        for <linux-clk@vger.kernel.org>; Fri, 01 Apr 2022 13:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pkwzjXMnjNgWxqs20PZ0mplmA/H3MgK2N5/k8AKmLx0=;
        b=V+/9jQI5zfBoclaOwLPMGwOPs1FFrDSKx64gDd1j83ojIzTog27eURaTd+CzSQo2jh
         KruB/mfjTWgyJQHExdPTiSGkkdcXv/GhKKhIS8W3KP65rs27L3BE17APso1wuezIZIOn
         PwqpXoA1HQCD0bb+1YnEipAWEx0R3NPzUzptQ+PJKcjddd//GrDQFrtQMnsu0JljFTFg
         B0eK/7b5N9FVm+QPHefT5Ef2YTv9xM5QTS3A5O74oZjboHlUf/uN7SB+Atgj+IcsFW4i
         mDLZZQD6NO+xEXCWQCViahZMUoS9Hmi28DUygYj0UzDwE/qwgH4sl1pmnRmdivUTdN6q
         TC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pkwzjXMnjNgWxqs20PZ0mplmA/H3MgK2N5/k8AKmLx0=;
        b=O/JVbOjcGbCU8cVd3Lr+wNzO+Iea+bP8WrP9DaP/vGb7B2nbOEBI6B5g0on8jzbl2U
         Du2oYIe0QSSsFC8nMDBnyeHsRTmJql00vxwF5+cWHGOROgUS+cOeMDUUU3SvzgV1V9O7
         2+h3hKqqcmyMOp6NV9ASg8/QxvqW4+4DsvmE+FXtolgrRclPOEfGe4fSgxRoaj73M018
         XIBAcATPWRr5XXNoetDzVQWjjw75vt14RfrfwMb7Ei4bKmaL6YGmX0K5VrnoezRoXC1t
         ZRT15jzH9pMstbxFvQrXIm8Dnqn7sWVQxsxtwKIK49heNVjzsFGavETl1alOh2voDf8a
         oXeg==
X-Gm-Message-State: AOAM530jpsVdC015VIRIcS6LV10Zo67bmN10OhSQdoOX3JKZSP73G30j
        4Fak+N1R+cbjJ8Sg7RvBX5J23A==
X-Google-Smtp-Source: ABdhPJwQ/ABFj/W3fzrdT9VhNb8LJJVC2+tfUrwvjRBOC2UN9gfrT2+tv9p/6BrSIMz1IWvYWASqBw==
X-Received: by 2002:a17:907:3d87:b0:6e0:bef:c3cb with SMTP id he7-20020a1709073d8700b006e00befc3cbmr1236863ejc.503.1648843842154;
        Fri, 01 Apr 2022 13:10:42 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bx5-20020a0564020b4500b00418fca53406sm1509041edb.27.2022.04.01.13.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 13:10:41 -0700 (PDT)
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
Subject: [PATCH 01/10] arm64: dts: qcom: msm8953: do not use underscore in node name
Date:   Fri,  1 Apr 2022 22:10:26 +0200
Message-Id: <20220401201035.189106-2-krzysztof.kozlowski@linaro.org>
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

Align RPM requests node with DT schema by using hyphen instead of
underscore.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 431228faacdd..aca13760bb75 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -321,7 +321,7 @@ rpm {
 			qcom,ipc = <&apcs 8 0>;
 			qcom,smd-edge = <15>;
 
-			rpm_requests: rpm_requests {
+			rpm_requests: rpm-requests {
 				compatible = "qcom,rpm-msm8953";
 				qcom,smd-channels = "rpm_requests";
 
-- 
2.32.0

