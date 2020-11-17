Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07F72B6471
	for <lists+linux-clk@lfdr.de>; Tue, 17 Nov 2020 14:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387732AbgKQNr0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Nov 2020 08:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387728AbgKQNrY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Nov 2020 08:47:24 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D34C061A47
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2020 05:47:24 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id d28so20299328qka.11
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2020 05:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H9iD0vb59nEfd0VuYA1RFQfZKltqvw1+ddifT0t8kKQ=;
        b=xNK2Dv0l/RS6jOxorOPlj4wF5Hm9Kcn7P3JHnJx5slQTGiKq12OhEu+qhyEOErdJrX
         r8W6lPr8C1hJTJB2I/ZbVk5aXKQAZeeid7tFVdhxEEaQgIm4EKzktFnMbPYnbAZzLMJV
         R+EHgazzvJT+Sln0/q2Tc6mBjWdqQBV/P9HW0uP0vP4q20NXnOQG6QsRqK18D5KURi/j
         KadLP6sU4ITKWQJNdLj00TPPMUQ+VTqC8B//eO0dcoccI0GAqxcF7EZEdOEqpTcQrWmn
         c/0ULiqzsBXaaLqflVUpUwWklJUmLthVs9ORrZ+3M/Tb/zrogNaKjNiaR0nta/JDuO+r
         O2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H9iD0vb59nEfd0VuYA1RFQfZKltqvw1+ddifT0t8kKQ=;
        b=p7i7lw9cdqBfw6cRITVJVQacznwK8kftbVz//Uq+pS1ojCMwro2luNS9hiUl8n3zX3
         AzHh5GhUHk+qp98qb8RrW7rbCMI96848ZDcwZ1V/k+b6Q8B5dnrn5ooG1tAR1sas8u56
         1cSbK/OXMlvCU2MyaS3cerRN4HceXNKFX+oKFq1qW06JELjXelqfsNkMYh/NaL2SWLRu
         ckHWqhEll5c2nRyUFqTiE1Kr6oneYCfNvUlpLse6hUMw33lN/kEcyCYvq6G14tgAxva1
         o9aryyRpicuDT8AqQ9bggiP0oUXVj2dQ1Y4wfY06/qhBKzdD3f/r8jL0Q6GjKAsMs/OS
         4cdg==
X-Gm-Message-State: AOAM5303qCMxRNw3SZ6BRvIt360xR4yZPKgJcMFNaUm0XbWc4yc3mZgb
        HjS31EmUGXI/OfboUhBUlPFsxQ==
X-Google-Smtp-Source: ABdhPJyptcWBVT5M2++jj9hPPhmMcL9cKttwWytv2NLfLJoew0OcWZWypoNx+gJzkYTRIn3Tq13U9Q==
X-Received: by 2002:a37:b782:: with SMTP id h124mr20237761qkf.169.1605620843333;
        Tue, 17 Nov 2020 05:47:23 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id t133sm14607355qke.82.2020.11.17.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 05:47:22 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 6/6] devicetree:bindings:crypto: Extend qcom-qce binding to add support for crypto engine version 5.4
Date:   Tue, 17 Nov 2020 08:47:14 -0500
Message-Id: <20201117134714.3456446-7-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117134714.3456446-1-thara.gopinath@linaro.org>
References: <20201117134714.3456446-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add compatible string to support v5.4 crypto engine.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
index fdd53b184ba8..ed1ede9c0acc 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
@@ -2,7 +2,9 @@ Qualcomm crypto engine driver
 
 Required properties:
 
-- compatible  : should be "qcom,crypto-v5.1"
+- compatible  : should be
+		"qcom,crypto-v5.1" for ipq6018
+		"qcom,crypto-v5.4" for sdm845
 - reg         : specifies base physical address and size of the registers map
 - clocks      : phandle to clock-controller plus clock-specifier pair
 - clock-names : "iface" clocks register interface
-- 
2.25.1

