Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4FB6655FE2
	for <lists+linux-clk@lfdr.de>; Mon, 26 Dec 2022 05:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbiLZEWa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 25 Dec 2022 23:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbiLZEWL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Dec 2022 23:22:11 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B6C5593
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:06 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id z26so14684798lfu.8
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/K3RoFVEkUUUw0DjLS0gT74F0yinCMJe2iA2VdQ2lI=;
        b=atNI4M2yBuG99VOUYNrGxI77gagHmcuwTpqPUYjH0S7MqBQjtqbsY8kDIJRqMhbbls
         0QlGX5d4pIpK9fe870P2yJstUxrrtz50oAqtZyYboaihEKnL0Z58ep4iVJIRlxPSgKhx
         jk+yUPMxngfL76w4Ji4ZdU+WmHrQOXs2xq/wW/1Ve5/nDB+FWRHZbWBahG6zQqVonE0z
         O2/hpCBwKSr3wN04uA7lhI78o7GKpdcUB7PJmrHE6JAqKVTbHi4xvHVMh45BLE4bqoj6
         LcZafTWWCjgYzpZ+l9Qgtj5E/a3V+jJAqGLHKkJ+bFJ1pSk7y/905dG+S6w2bxGVc0aq
         rYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/K3RoFVEkUUUw0DjLS0gT74F0yinCMJe2iA2VdQ2lI=;
        b=mId47lEFxumNIKQdFLZZ9lkWp/0eL+8BsdHj5686z3AMAfQtYPPeInUQoQkrx29BNq
         mANESuzxU2brOHdbf1ruB5ECiNEFPmdCbcSEQ9HfS3vyI/9Ssfmoi3U8hrrIED77Wnen
         x8x/BHERYWFCux442KFlcfvm8YKtJmVlH9jHvGyPOmZbcL8Ev+pQp4H0IyGSTwarVBsB
         C6f8k/OdhbCROYHad0ylEHTvEjkevkQuv2IwVrH3DI2zGezlEEHakJ6SwMghig1zWKqc
         5sKDlRRDivJZtu68WVPVCM0R/9cfgyYoSdaDCqNP8kX6WZmJHAzyXQBftPlvlzTuGuud
         9a5g==
X-Gm-Message-State: AFqh2kpnj5eSPsrO7nLMLxwDsK2DbEsQQllYc+wUEqXeCloRrQLfuG4q
        mt8syiw6wKLE+l67FPja/DR72g==
X-Google-Smtp-Source: AMrXdXtgnAdvs6Bhe5nsUVzwTXoAOHs+6uPb0RY8k5M3CsSbbKB7Gp6wYIG5W3Oi9iSMkJ+zgDG+nQ==
X-Received: by 2002:a05:6512:3a8f:b0:4b5:8a01:570e with SMTP id q15-20020a0565123a8f00b004b58a01570emr5288504lfu.45.1672028525821;
        Sun, 25 Dec 2022 20:22:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:05 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH v2 15/16] arm64: dts: qcom: qcs404: add clocks to the gcc node
Date:   Mon, 26 Dec 2022 06:21:53 +0200
Message-Id: <20221226042154.2666748-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Populate the gcc node with the clocks and clock-names properties to
enable DT-based lookups for the parent clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index b72542631337..9206ab13977f 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -731,6 +731,13 @@ gcc: clock-controller@1800000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <&pcie_phy>,
+				 <0>,
+				 <0>,
+				 <0>;
+
 			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
 			assigned-clock-rates = <19200000>;
 		};
-- 
2.35.1

