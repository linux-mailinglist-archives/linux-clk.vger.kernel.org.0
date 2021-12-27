Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2EE447FDA0
	for <lists+linux-clk@lfdr.de>; Mon, 27 Dec 2021 14:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237168AbhL0Ngk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Dec 2021 08:36:40 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54722
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236898AbhL0NgP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:36:15 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 29DC53FFDA
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640612174;
        bh=kkUdeG5ceHrjuSuIkqkE8YNWyxg2eHSHTjUTr9KxZzk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=gm5bSJsa2DGV+Mhjm2yc7yWjzUs/JfnDEcQNcRRReIkGMRReLYQyoLMstOJ7bbfQP
         Q2IOhTtJZhyafx21tB41GdvcpLk/6BsT4RufC6SdWYfLf09CFsasD/Zp5kUPoq3jo1
         waUWDGWiRlE9+m3ovuufn/Dxzk1WSiTbVci7um8RkEUlleI57A9wYsNV37mwmIIwUC
         hVdoRWT0SQKrWDf+3k4Xbxq38IuAOTkIY3ZqKLUE8SdtWOvrDDW7BF30U4Twy8otE3
         AYvpZBtdPgm3IJGPnV0HzruuW6EmzTaEQBoFlwgTePvEUiikRP3aMpC7Y0JWB/F/s4
         g9Sd63gDwhSyA==
Received: by mail-lj1-f199.google.com with SMTP id d12-20020a05651c088c00b0022d989d91caso4021136ljq.20
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kkUdeG5ceHrjuSuIkqkE8YNWyxg2eHSHTjUTr9KxZzk=;
        b=0pxm1VvHou6an564BvRLyr+FCa9Ncgv3kduFYa9BN/RTqp3fxpbDGDttAFD4YZsknq
         OZ5T23f8CMuiSWABRrIx8QBueu7WX8zStTP8QLd1ogknRT9/1nsd75JNr+yXDeznu6ah
         zLvsVk3FhD470kTpQ7P+O1nyoBVq8/tbcfUPNsfIuPOuqeZzwGH0yNnhJ+9V01N6/7j5
         w/XE3d13xv24PC2sbZupDY+dnG6w11mvXvO+oZRHmiFL5rS2kj3TqvtPiHYROYbueaY9
         3NZuZSNgyIiH+dRRgKGSz4cul2/xvXKWqB8b76+O4OmHaITfm5Fa9j5/L0LFW3s0bDLt
         TrUQ==
X-Gm-Message-State: AOAM5304G55hoYImTGC5hGMTstLfZUK8LAV+BnLDM+UeKSOQkcMaz10I
        NcdKbPYZVZbXMXSpzufrGKoVdYulxcpUC47L31LS4i9Agea4Gl6zZ1UeRP6GBrkO8HiUFrc7has
        G659KOUUdTNLd6EipfHiUzHJ0/O6SITeJ6Fo2og==
X-Received: by 2002:a05:651c:511:: with SMTP id o17mr8667369ljp.374.1640612173658;
        Mon, 27 Dec 2021 05:36:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfa+8FB77JaX0hFBrtXh+MFcMU59EojnWCqXY8eabSSi6JcvyGPGjrWdRPz/yX/6OB1oYZEA==
X-Received: by 2002:a05:651c:511:: with SMTP id o17mr8667351ljp.374.1640612173507;
        Mon, 27 Dec 2021 05:36:13 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g18sm800107ljj.124.2021.12.27.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:36:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 16/19] arm64: dts: stratix10: align regulator node names with dtschema
Date:   Mon, 27 Dec 2021 14:35:55 +0100
Message-Id: <20211227133558.135185-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The devicetree specification requires that node name should be generic.
The dtschema complains if name does not match pattern, so make the
0.33 V regulator node name more generic.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts      | 2 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
index 12392292c62c..5159cd5771dc 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
@@ -44,7 +44,7 @@ memory {
 		reg = <0 0 0 0>;
 	};
 
-	ref_033v: 033-v-ref {
+	ref_033v: regulator-v-ref {
 		compatible = "regulator-fixed";
 		regulator-name = "0.33V";
 		regulator-min-microvolt = <330000>;
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
index 2d53a06deab5..0ab676c639a1 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
@@ -44,7 +44,7 @@ memory {
 		reg = <0 0 0 0>;
 	};
 
-	ref_033v: 033-v-ref {
+	ref_033v: regulator-v-ref {
 		compatible = "regulator-fixed";
 		regulator-name = "0.33V";
 		regulator-min-microvolt = <330000>;
-- 
2.32.0

