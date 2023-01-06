Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 747D76607D0
	for <lists+linux-clk@lfdr.de>; Fri,  6 Jan 2023 21:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236335AbjAFULN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Jan 2023 15:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236454AbjAFUKi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Jan 2023 15:10:38 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDE484084
        for <linux-clk@vger.kernel.org>; Fri,  6 Jan 2023 12:10:36 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bt23so3510058lfb.5
        for <linux-clk@vger.kernel.org>; Fri, 06 Jan 2023 12:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FiMYGHFGXrVpyzi7ZgB2e/VL6pJCok4vFhR2XZcqc4=;
        b=JUzKPY0rOxYEoScq+vCPBpGWxw46pFyDPKQzMPkVs3mMlV98UUZa6kx7/gMaMG1nx4
         ma3bhc2cxOf9nD4q+oHyPbrHbqEu+rzlc3S6xBk+JMMLHcKRy2aB6Pl/LG587gdW+WZx
         N9PtlTB9zTMvIlculJvg5wtc+7Ipg33Tygk45O++Rlsk3p3hBspLHFPAfsMlRKp+t9y1
         qTTy6+MEZLGT63c+slkIhlszjZTsqcHV0uHRz1ORhwQh9wOP/OwSDjzeKztxyUqfWxkQ
         77q0pXLfXK3vPW/DCKsyf7A9beCRk8quwWAB4yiuLSwWDpDkltOweudZFBqdeWy27BSZ
         6w8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FiMYGHFGXrVpyzi7ZgB2e/VL6pJCok4vFhR2XZcqc4=;
        b=BLq16B+hWr32SVRwMdzv1E+Bzp59SnFE/zlfV6zIEk6GSrbmBr+vxhf4sxBGQp8vUc
         nnbSC1ECnZdFaDurnzuZAZmZEtTdTmkemOH92No2ZPJFw0yGAm12J/GtYw76/ReR4TL5
         f9TLa1A4njl8mCczSmDQ3efSfoXHixvE63qKBY869Tod2Lz7H0z0okodsYAL9gLAokBi
         /g9j1jpGvmfgOc01kWsHYU1D5wC3ZySInsh2F66kyHhONWbjeKTzaMXrEYti0Nwwlg9h
         rM2uZC5FThJrs71K5xAlMic495fnMWPXuVtGsfAdPhw2ptyheSWgXI/AYN/N2pecuvEn
         khRw==
X-Gm-Message-State: AFqh2krZFbgNxbenrT2j/Keq3hpbWzWmZa1+Utbh3kBFaH2HXSKpmCDC
        n0iVSyxp0tGDvaLgev5c1Cv8AA==
X-Google-Smtp-Source: AMrXdXvhBuY8NLd4WpsgKBHFL7iB46rZozZNfykWp4gPNDsGWc2gdEE9G8snZXmrQHGyfVqoATHKRQ==
X-Received: by 2002:a05:6512:3a8f:b0:4c8:5f19:ccb8 with SMTP id q15-20020a0565123a8f00b004c85f19ccb8mr16963723lfu.48.1673035836413;
        Fri, 06 Jan 2023 12:10:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f14-20020a0565123b0e00b004b7033da2d7sm260875lfv.128.2023.01.06.12.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 12:10:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 07/11] dt-bindings: interconnect: qcom: Remove ipa-virt compatibles
Date:   Fri,  6 Jan 2023 22:10:24 +0200
Message-Id: <20230106201028.1809541-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106201028.1809541-1-dmitry.baryshkov@linaro.org>
References: <20230106201028.1809541-1-dmitry.baryshkov@linaro.org>
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

These interconnects are going to be modeled as clockks, not
interconnects. There are no other interconnects left on the virtual
SoC-ipa-virt NoCs, therefore remove the compatibles from the binding as
they're unused.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index a429a1ed1006..4e8d950c2832 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -58,7 +58,6 @@ properties:
       - qcom,sc8180x-config-noc
       - qcom,sc8180x-dc-noc
       - qcom,sc8180x-gem-noc
-      - qcom,sc8180x-ipa-virt
       - qcom,sc8180x-mc-virt
       - qcom,sc8180x-mmss-noc
       - qcom,sc8180x-qup-virt
@@ -96,7 +95,6 @@ properties:
       - qcom,sm8150-config-noc
       - qcom,sm8150-dc-noc
       - qcom,sm8150-gem-noc
-      - qcom,sm8150-ipa-virt
       - qcom,sm8150-mc-virt
       - qcom,sm8150-mmss-noc
       - qcom,sm8150-system-noc
@@ -106,7 +104,6 @@ properties:
       - qcom,sm8250-config-noc
       - qcom,sm8250-dc-noc
       - qcom,sm8250-gem-noc
-      - qcom,sm8250-ipa-virt
       - qcom,sm8250-mc-virt
       - qcom,sm8250-mmss-noc
       - qcom,sm8250-npu-noc
-- 
2.39.0

