Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66CAB7BFD6E
	for <lists+linux-clk@lfdr.de>; Tue, 10 Oct 2023 15:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbjJJN1T (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 10 Oct 2023 09:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbjJJN1R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Oct 2023 09:27:17 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403B2AC
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 06:27:15 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c3c8adb27so956803366b.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 06:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1696944433; x=1697549233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmAUYYBcb36g25xKg6f1IAceGYrAzqtlit3x/PXgwj0=;
        b=JfHkcD897XESjP4QmrvHbEhXsiCQODGXu/N1B59POCXS9H4+8uMEDBTaoW7YFcNbQ7
         X6+5bM/b8Hd3NcFQh3xL9JMav0VfEqhSU2NoX21oVQyjIaSdmkyP1hwxdRn/01wsvVla
         etiQyZ6PxUfNjU6l7GbLxQ2IEnLhjErzDk+iT08hgdndTx7ziCPXk0hrW9iy9IGA/Q0j
         uXVTH57npv3ilYjiAN13iuE7cwqI/5D3EZq6s0FkkrJaBRiEf9/QazqYpQEGbzsHSYUs
         /1Rfp4WT4GCrWjuV0+eewAIegV65cyY5dE6RIQgWLmk+BGbpgJ3OZuJ28NT4B6PdPWsJ
         CcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696944433; x=1697549233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmAUYYBcb36g25xKg6f1IAceGYrAzqtlit3x/PXgwj0=;
        b=ginV9owzzG5Vf+/ldQuX4ZmIhXl8AiY/g4i9nkt8br95r4jIGiLrrv+rVhyf0xH3na
         3emPp0fgpXLJs1O2dliSlseY/7My6kKFt7WEhCiAhLIsqgYeNUFDv17Inp/R844xydI/
         HE1c8BxhxrWXS/mZ4wbVkytvf9yMuf7cm1vHE05gcZ9F4ziy12y0jvcqkfuSN+ZhOXC1
         pR33XLzK1yjfAlIHWNl9zrLNyyzEynmzygqSDmobVWuL/fpQVeitot7QxkdtTIK0eQ2F
         MUER9+Ml/1/yrkteDwkoyScowKh8MnbmC0TqJB5CJJ5NBooI4EaEMVF4MvR8vxQzz9B5
         OFYQ==
X-Gm-Message-State: AOJu0YwfmlTfZ7Fyi/bOW+t2xcNaf7gDj4WJ99PKMZbHTMDH8MQ8Dh3v
        TUEiy78V//u0uSdi/oTMQ/G+8Q==
X-Google-Smtp-Source: AGHT+IE6SF7gBxQs3UVH8Wq2DgU5EpQQfF04+A3CJopBOk/P04fx5vV9navnUs5lTd1SNMEhx20jew==
X-Received: by 2002:a17:906:31cc:b0:9b2:b2f8:85dc with SMTP id f12-20020a17090631cc00b009b2b2f885dcmr15243889ejf.34.1696944433790;
        Tue, 10 Oct 2023 06:27:13 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.152])
        by smtp.gmail.com with ESMTPSA id i16-20020a1709064ed000b0099bd0b5a2bcsm8526578ejv.101.2023.10.10.06.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:27:13 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/6] arm64: dts: renesas: r9a08g045: Add nodes for SDHI1 and SDHI2
Date:   Tue, 10 Oct 2023 16:26:58 +0300
Message-Id: <20231010132701.1658737-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add DT nodes for SDHI1 and SDHI2 available on RZ/G3S (R9A08G045).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 7971e44a5a0a..534b728a8e14 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -118,6 +118,36 @@ sdhi0: mmc@11c00000  {
 			status = "disabled";
 		};
 
+		sdhi1: mmc@11c10000 {
+			compatible = "renesas,sdhi-r9a08g045", "renesas,rcar-gen3-sdhi";
+			reg = <0x0 0x11c10000 0 0x10000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_SDHI1_IMCLK>,
+				 <&cpg CPG_MOD R9A08G045_SDHI1_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G045_SDHI1_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G045_SDHI1_ACLK>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg R9A08G045_SDHI1_IXRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sdhi2: mmc@11c20000 {
+			compatible = "renesas,sdhi-r9a08g045", "renesas,rcar-gen3-sdhi";
+			reg = <0x0 0x11c20000 0 0x10000>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_SDHI2_IMCLK>,
+				 <&cpg CPG_MOD R9A08G045_SDHI2_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G045_SDHI2_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G045_SDHI2_ACLK>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg R9A08G045_SDHI2_IXRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@12400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.39.2

