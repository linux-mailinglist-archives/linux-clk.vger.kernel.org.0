Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC8F86C2484
	for <lists+linux-clk@lfdr.de>; Mon, 20 Mar 2023 23:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjCTWSk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 Mar 2023 18:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjCTWS1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 18:18:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468982CFD7
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 15:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679350612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m8h1yVtGIRYCv86TmWwnywGAFGMc0IfZHGCd5EFi+qY=;
        b=e4GE4GXcRGtJPNTJgz2IbDYstZXbhfZmCjvLxjCFasa4StjvOkgstUbdd7R2REnCS9tjeI
        I9LbVpjApbKfjhYXqguue1hXRfn9mNAPq+XZQ0VLOyhgosrpY83I/lVuHj+HYji3w+bZiQ
        /oXGglQ93RSZyRYMbgjuJ18WGPb8Tdc=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-0ZeB_JJINteADZEb0qQisQ-1; Mon, 20 Mar 2023 18:16:51 -0400
X-MC-Unique: 0ZeB_JJINteADZEb0qQisQ-1
Received: by mail-oi1-f198.google.com with SMTP id z129-20020aca3387000000b0038710ae0033so1284633oiz.8
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 15:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679350610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8h1yVtGIRYCv86TmWwnywGAFGMc0IfZHGCd5EFi+qY=;
        b=phTLTRNvhNqvEAnFWx5aV2cE8DV9XC4JJ4+ZDsRwWxpbsYK5vg6TJH4HosEhrSFbBN
         Du4ug3+bEZavEeGirhpVyITp0vuIi/HDKOn7sTFyX+N0ePuDUb6bKF0n7a5gn7odN+UN
         bOaUKGWnaKzmiGFlz0ui/j/wSsVnn+IcCmlMeNf6Fyg0ORXfbBsdaGxpXnMqkYSMdKRT
         11hlT/LnTg8MpVfru31H/65VD0Fdv0Sn1LDTqWshGyYE0kQa6eXVeOjpXj4ihr9zd3ND
         fJkrkcWI3V6QEL50ZzlSIPvyyEvHWYPr05dypLm/lFcMiVU6JIYfsEZ02MJiDtkKrl1T
         ztAQ==
X-Gm-Message-State: AO0yUKW67GDhxXGecnWczD6IXJ346e/3V7Um0/lS9G2WI7qwf4vErTiB
        /uVhncCjn+46mCSvNixZW4fhmTT1LwF8U+trXYWPb/yCSqoBVYORVd2kYUzjOpsSK2RGEdcRqZz
        qW6ArYCutDsQsVL0sRPRY
X-Received: by 2002:a4a:5542:0:b0:53a:155b:374d with SMTP id e63-20020a4a5542000000b0053a155b374dmr685640oob.8.1679350610065;
        Mon, 20 Mar 2023 15:16:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set80mYX1kNXjhJjOyvPX8zlLH3S+WOhJullh4gLdq4GbTimB670heulSoes4VBClqR4z4JvI2g==
X-Received: by 2002:a4a:5542:0:b0:53a:155b:374d with SMTP id e63-20020a4a5542000000b0053a155b374dmr685637oob.8.1679350609842;
        Mon, 20 Mar 2023 15:16:49 -0700 (PDT)
Received: from halaney-x13s.redhat.com (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 15:16:49 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next v2 04/12] dt-bindings: net: qcom,ethqos: Add Qualcomm sc8280xp compatibles
Date:   Mon, 20 Mar 2023 17:16:09 -0500
Message-Id: <20230320221617.236323-5-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320221617.236323-1-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
Add a compatible for this.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
	* Alphabetical sorting (Krzysztof)

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 88234a2010b1..c60248e17e5a 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - qcom,qcs404-ethqos
       - qcom,sm8150-ethqos
+      - qcom,sc8280xp-ethqos
 
   reg:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 154955718246..126552febe7e 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -66,6 +66,7 @@ properties:
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
@@ -574,6 +575,7 @@ allOf:
               - ingenic,x1600-mac
               - ingenic,x1830-mac
               - ingenic,x2000-mac
+              - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
@@ -628,6 +630,7 @@ allOf:
               - ingenic,x1830-mac
               - ingenic,x2000-mac
               - qcom,qcs404-ethqos
+              - qcom,sc8280xp-ethqos
               - qcom,sm8150-ethqos
               - snps,dwmac-4.00
               - snps,dwmac-4.10a
-- 
2.39.2

