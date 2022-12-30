Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202306576F2
	for <lists+linux-clk@lfdr.de>; Wed, 28 Dec 2022 14:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbiL1Ncy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 28 Dec 2022 08:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbiL1Ncs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:32:48 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A375FFAED
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:47 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id z26so23641366lfu.8
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptwbzrH/mwy7A+21HlgWY+l3mHpSh6bnpDwYSONm/BE=;
        b=oUr2S0xtFZwVtqGzid+T/6zozCl/6aU0c0tHwjV4K/UH/29O27tPUeI68yHGAvDeqT
         ruyTtDwo0DBDNcgt1PFnWey7pfNxwMjoo6ZBavhCQQVernIXfSb3uOiv7M7PBjTLh4EZ
         BmV7+l0/9CzvxTNZpLJGnl4lICL3+frv0ai6qzgNAQLUkuSKKgflQ6L2H7tj9PiWu7IQ
         5Xot4sCOpAyCXrGA6T6XaGD+AEdcNIMfkPJPBmZ/zBmIHiugo+ycapW8UprLFlzfN+Xe
         dqMgp5CnSN1R5fGBA2H9wQJv32JutqiFOwrfs1J9g6gq9BBCT+taid09tw4Hy+WUOE99
         MU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptwbzrH/mwy7A+21HlgWY+l3mHpSh6bnpDwYSONm/BE=;
        b=HqMJpEme5EIDSz6mrLenHphioubZbceNDRpa7Pmr88SJj/EFcxPVQlLPcVR68m2fOH
         LLR344y5RvBgxab6TVvDVpZVe8rGlNwEHbbZVKcq14exXvkVxb9xX6GF9w02UofeyF/q
         Pz6rLibBej0SuJXKGL515jQ7GS+dHPBQthNYYvrtLyo497KrQnE3IH5bL8iqhmlhQMWB
         R/obpRue+ougrqlas0z8Y+NXDgMkOnDv2bXUHenAGjj8oEc3ozKPmKlEaIlnyjsGTUje
         2ApWCfoVFKVQLDsacQO+zggQNb95cwv3GMxt9UoUbAarb6DP5J50pVYIQTF7Ksw5F9tw
         yx1Q==
X-Gm-Message-State: AFqh2kr+RLR3Lo3x0yMOMBNGyQWD2oKaF5a2pbLglRp0MG8y22N2Wf8i
        TU1rTRPAGJAxHrvXCWK+sT/VDA==
X-Google-Smtp-Source: AMrXdXsWqyinV9P7CjZOcND/sTJyeoYdBO53LGZl0vUAeUo/m2D4VaB63QJZyUXBn68GpNc8PQivKw==
X-Received: by 2002:a05:6512:31d1:b0:4b5:7925:8707 with SMTP id j17-20020a05651231d100b004b579258707mr8653750lfe.26.1672234366060;
        Wed, 28 Dec 2022 05:32:46 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:45 -0800 (PST)
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
Subject: [PATCH 01/16] dt-bindings: clock: qcom,gcc-msm8998: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 15:32:28 +0200
Message-Id: <20221228133243.3052132-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
index 2d5355cf9def..10a8ce6640a8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
@@ -25,7 +25,6 @@ properties:
       - description: Board XO source
       - description: Sleep clock source
       - description: Audio reference clock (Optional clock)
-      - description: PLL test clock source (Optional clock)
     minItems: 2
 
   clock-names:
@@ -33,7 +32,6 @@ properties:
       - const: xo
       - const: sleep_clk
       - const: aud_ref_clk # Optional clock
-      - const: core_bi_pll_test_se # Optional clock
     minItems: 2
 
 required:
@@ -57,11 +55,9 @@ examples:
       reg = <0x00100000 0xb0000>;
       clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
                <&sleep>,
-               <0>,
                <0>;
       clock-names = "xo",
                     "sleep_clk",
                     "aud_ref_clk",
-                    "core_bi_pll_test_se";
     };
 ...
-- 
2.35.1

