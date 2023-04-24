Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3936ECBDC
	for <lists+linux-clk@lfdr.de>; Mon, 24 Apr 2023 14:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbjDXMOH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 24 Apr 2023 08:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbjDXMOG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2023 08:14:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A9546BD
        for <linux-clk@vger.kernel.org>; Mon, 24 Apr 2023 05:14:04 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4efe9a98736so1987133e87.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Apr 2023 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1682338443; x=1684930443;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X71BZlzH90rNXlr22ACggW+3L7xadD0OTppCpzd2JQ8=;
        b=LuKlJ1GsF4/Tm3XEdWCx1kDw43SLE8w98Y2BhJfs1wCcIo4QWQrp7Y3KkUQj0YaCA2
         AHRWo0FI+4mJ00cZXqs6cvsAv8XNDKUXTYHrVMMDGVQRfflQuaxWNZRSscKwv33LhL96
         lUcxDwbOrGwBoDrYVrM9Rj1DkDrTWB+kBi/a81GPt3KXNKmvlCLQpQXuYdMEmILmOW6U
         epZNSIexP0zGjHM2iS2S7TIdE2fBgthFGczavpU5IOJW2pPKNKAPpP34Blsm8Z1CoJiT
         dkRbKV5L4Dr04/Y/zsaP4v0+4uieOYV3c18hEaT15Emakr0Ark5ktNhw0bveSy7xaFQ9
         3zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682338443; x=1684930443;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X71BZlzH90rNXlr22ACggW+3L7xadD0OTppCpzd2JQ8=;
        b=P5uvfliuKvou9fP+B+tCe0mvHA4rjOmkJB5UwQgkkIBRwNziE6AOQ4Pm4BYt/BPDh1
         u6pyeQFDhOS4wsOLSBeHf2TkrCs3toDTvq7nnKMtWIPV8EfIc6qR0bJvnqhyGxeuYmwz
         o1qKrw3z0Fk/b3IbnByDDV8KuTM81UQRUBTqg7mWe1e+MHC8mdqvzd/qHPOCEY6572iy
         SxdmClbWVOVWc6CxGXIFoM2Dlcy9ucrpykLXS4nyKpgTKks4Pl5JBCFI4nZkZNpBwdKB
         CFiHKRfpREY5lvMHt3/ZpPi/c/GsbCbDxokz5tewV2jcVPdCUEy4RozSkI9T9Xi1FU9C
         93WQ==
X-Gm-Message-State: AAQBX9fQc3jr1e5vb7oh9xadnn3+YA9H7YIhgzeOAUbbaWZjk0yM2OFc
        APJHamp8huzQPtU/3zW11RvYGA==
X-Google-Smtp-Source: AKy350ZIKHke2Bo4P+2J1KIAdimioXIF5VL+jfMeT4TVxnIYW3hRTri+yaxbnDftQxPFIzCtbx/e7g==
X-Received: by 2002:ac2:5443:0:b0:4ea:f8f0:545f with SMTP id d3-20020ac25443000000b004eaf8f0545fmr3385023lfn.52.1682338443057;
        Mon, 24 Apr 2023 05:14:03 -0700 (PDT)
Received: from mantas-MS-7994.8devices.com ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id x23-20020a2e7c17000000b002a5f554d263sm1732382ljc.46.2023.04.24.05.14.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2023 05:14:02 -0700 (PDT)
From:   Mantas Pucka <mantas@8devices.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Mantas Pucka <mantas@8devices.com>
Subject: [PATCH 2/3] dt-bindings: mmc: sdhci-msm: add IPQ6018 compatible
Date:   Mon, 24 Apr 2023 15:13:31 +0300
Message-Id: <1682338412-15420-2-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682338412-15420-1-git-send-email-mantas@8devices.com>
References: <1682338412-15420-1-git-send-email-mantas@8devices.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

IPQ6018 has a sdhci-msm compatible MMC controller. Add the appropriate
compatible to the documentation.

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 4f2d9e8127dd..5ad846b724f3 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - qcom,ipq5018-sdhci
               - qcom,ipq5332-sdhci
+              - qcom,ipq6018-sdhci
               - qcom,ipq9574-sdhci
               - qcom,qcm2290-sdhci
               - qcom,qcs404-sdhci
-- 
2.7.4

