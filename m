Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54AA4CAFC6
	for <lists+linux-clk@lfdr.de>; Wed,  2 Mar 2022 21:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242822AbiCBUbx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Mar 2022 15:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243439AbiCBUbw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 15:31:52 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EC8CA70C
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 12:31:08 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id c1so2580267pgk.11
        for <linux-clk@vger.kernel.org>; Wed, 02 Mar 2022 12:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fof9CkST4Iez9KEZB3PYpToF0QIXsHNFmiNSAPmb4CE=;
        b=LUc2b+x8uy79FN6FXxebtOwfW6uDP8L/9cHma41e7qYr36jg6bea9mHbomppVNpPuZ
         veQVmRXuHQHCriVuammB+JQXaocEmrDzKsR5wb1Ir7T0+Ssv4cIFMeY6iOcXxZJLTt2x
         bJaRTVhWSYpzXfOrDONeLVjMmDcBKgDmtVViLEfq8MJ1Lo65MJRnJDV9qjJZl/P+istH
         g6uMMz21Lvrh4pMrSnR/ftD5E+Djsi2B8HLC40zZVSL0q83PZsbbhfCaDrGIl/+m54DD
         rCBOgAIjMA7uOAJcZmNCGtUdSfYYUTcbi7RXx9s1NcJdv7sj8aFfeMJ/UV9zH+Lfn7Nj
         W16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fof9CkST4Iez9KEZB3PYpToF0QIXsHNFmiNSAPmb4CE=;
        b=s9EfN189EomHoM49i4YF3E8B+Vf+g2kxTSuR0aOabW0DSXsgaCPeP4843Ytxxh6wtY
         yZIMINhQUc0P4TvK/sScmJikhMtM7V54d5LjqU7tAMsnHz4lh2EzXO+CpAfoYsaq5BR3
         cPQuyBrZGRWmoMDmfb5M/+VL8dRvKn06Ye/Eu4sFm8rofih1owMZc3K8jV7XO23eULo3
         Jl8w6idfZOK8UC6tlnMnewWRrg2CiRJoENTH7brcWjpzNhneD9E2Fdl6iBDJ/mjjXHix
         WBP7kWveaT93o/d4OK7EoQijXj05RwXWNwuIdApGDwLuf8hVNnib1hcjOPguoLIKfxqI
         5A+Q==
X-Gm-Message-State: AOAM5307qspvrd4Nux9xD3gquq0NvytPZQLdwom3TSBL6MfPSFmPvhm2
        +TXTnW5MbTUBNlyY3HmbQCBnQQ==
X-Google-Smtp-Source: ABdhPJyAocijC2v/megqKfwgZ0Z20zOuPs9gqTlE4oD5vTbxpbv7iWe2hcxM2StvKONYylS/zcwpHA==
X-Received: by 2002:a05:6a00:1884:b0:4f3:ea49:1cbc with SMTP id x4-20020a056a00188400b004f3ea491cbcmr23981070pfh.27.1646253068158;
        Wed, 02 Mar 2022 12:31:08 -0800 (PST)
Received: from localhost.localdomain ([182.64.85.91])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090aa58100b001bcb7bad374sm5963410pjq.17.2022.03.02.12.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:31:07 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/7] dt-bindings: phy: qcom,qmp: Add SM8150 PCIe PHY bindings
Date:   Thu,  3 Mar 2022 02:00:40 +0530
Message-Id: <20220302203045.184500-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302203045.184500-1-bhupesh.sharma@linaro.org>
References: <20220302203045.184500-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the following two PCIe PHYs found on SM8150, to the QMP binding:

QMP GEN3x1 PHY - 1 lane
QMP GEN3x2 PHY - 2 lanes

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index e417cd667997..9e0f60e682c4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -38,6 +38,8 @@ properties:
       - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm6115-qmp-ufs-phy
+      - qcom,sm8150-qmp-gen3x1-pcie-phy
+      - qcom,sm8150-qmp-gen3x2-pcie-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8150-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
@@ -333,6 +335,8 @@ allOf:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
               - qcom,sdx55-qmp-pcie-phy
+              - qcom,sm8150-qmp-gen3x1-pcie-phy
+              - qcom,sm8150-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-gen3x1-pcie-phy
               - qcom,sm8250-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-modem-pcie-phy
-- 
2.35.1

