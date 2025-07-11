Return-Path: <linux-clk+bounces-24628-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 449C3B01C7D
	for <lists+linux-clk@lfdr.de>; Fri, 11 Jul 2025 14:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FF7517B7E3
	for <lists+linux-clk@lfdr.de>; Fri, 11 Jul 2025 12:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4D82D3A7C;
	Fri, 11 Jul 2025 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWKEDGPz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C952D320E
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238685; cv=none; b=Me3x7SzxRu77lnng6xh4DZN2fvmKpqQ+wSQEuTXTul3E2a3arl+CH9OUPM9jF6Mapd+pUCs/NTgB37KIrcf2d1Ihlb6ai50hQJuIZTy+sKP/aFsL+3HmrzDgk1s8bS9Ouxtp5qZm7hAFxVUfIyC5zAYHKjn8jQ+jlMMPbE5qPqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238685; c=relaxed/simple;
	bh=5gV/Pwg1WP+ZZILJzt3fi0xEnri4ukNILoHO+6sJ6I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXL0sVikfW3NS2UydOdr2tAO652eAK50ODsVsbAXDcdmgj9dyR0Y+yk5BmEzT4tRO1Eg1Buc3LD2zgq4rwVNJawp2vBoKl92ZDAWOEQkLtrheZ8ChfcJl22FmNPNzbbfJvTUlJl1EK6MyZpZPWeqjkA5Uor4FsctzyvvsU4iXnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWKEDGPz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453643020bdso15834795e9.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238682; x=1752843482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkUr4CGEFUQkYRmGivVe3aB7iO026zPS12jaFJau+Cw=;
        b=UWKEDGPzs1KCdumbySFkJY2rMywXY+ytv9zT1AwvNa3ulXzbvSd/vgkzWHcdPSVlDB
         Fr81fyDZ/1dLUEh4IfCoIfqWYLBW8u7N9mKPixAwZ1OGgty6+zmfgyH7CI+W19h84wFI
         GJEwbkYgg8a1CKeVaqChp9FHqD5V07ezFWapOqIWbuOoh/Y7J6ZhGKsk93kH/0I84Dsq
         DdvwokETAf9PhEajdkCSybIVBZrvoemdfsQBxVOnWJBLPM40o0Nq1756hWmmqZUuhYQ6
         DMaX6i0rdmUQ+IW/LK1kKqZM4kcKUBnaOKonmkOCTbzkJ2lVY6Qld7KdLay/XokoyAx8
         tI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238682; x=1752843482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkUr4CGEFUQkYRmGivVe3aB7iO026zPS12jaFJau+Cw=;
        b=E5cb3asmJSlp4Ng8qdSW2x6CRQNnA+SYI1RnNjgbAv/02GNOAY8Q7AqpvVeERepwNq
         TXF16HR45RYVCEsS8SISU3HMOYofR3vBiAXF6psW11G/sx78jzip6UZGaeeGmdqRowZA
         o3f5o8Gph3eTiyEj7H6uyQcOCOBvUx9ItOAU/o0OxIzPCuWtWSuuWYxel/5sFxmY3fV8
         OPGVMBmqC6Q7DCqtOeh1c+jCQNUyl+t3IXVS3gK6U7Rco7N219TVwziA93Wr0nAfPOh9
         GL6AI7nUXhDkAwc7XHmi74fMbVcyeO42ZP0YfPfzfO7VrEaTbXyvxww5X+NK/aa1/a5+
         /GkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9p8lmJ+ruTGWG+0Va3/SBzyOfyCMNfoDM+yrr2oPiwHto8AP5MCjXKaQWZC3pLo/tVMk9iU/crYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TnKbIMziMruTCzNpAD4d/dZqEnFtdJdmvcLEN+ZaE7uLSvYK
	GNZIGNjgDzuCFsUUTIBgCJoG++1j3Rx8uN5yz8sHXIicGxJJIj81Pvf2VsnEDkGkki0=
X-Gm-Gg: ASbGncsUDxlepmQWtfMtZzYK4VUw3ueqsFlW7M53I2bSI1RtIqQUUNOjYQQS+L1ray7
	y+i16+SzA96RyOyBxO9RWugsvcCyAaZh1g6kiKbUlusMSS82Uc4W0zE0E//hTuvN2xEmJHA4UfH
	Qw1jDQzJGY7BXGzCoSLXPYULP49pxySvkrBXoad/nk02+yhILOAgMPmZo8XSLS1ksAyMBO1Hq+h
	Vmm8QbFRyK5VJA5hjYWZfX3Iyc+tdjyoULWkYlPcSKy6OYH4Yof/7E5FGGgaMdSL229fQ7NG3PZ
	JzlHw7vOBvTVOlMvXJB1oGRXE4wRu3ETgvXflZv9zk3i5VX+vqDseokLulFnMiohl3AL03Dy/ts
	+yNKZb5ob3o3q94p3prldhanc3MG3puvx+6dbq4rqqk1QHk0o8WddeJ65ycdw9ydp
X-Google-Smtp-Source: AGHT+IGcQTpuyD1+OjKXfLSy343mJnTIdFl+2rVUM9fSCtV0mrtcrWkbOJTUTiN4BGnL3emlOBR7CQ==
X-Received: by 2002:a05:6000:4412:b0:3a6:d145:e2cc with SMTP id ffacd0b85a97d-3b5f187e927mr2077584f8f.15.1752238682076;
        Fri, 11 Jul 2025 05:58:02 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:57:54 +0100
Subject: [PATCH v7 02/15] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8032;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=5gV/Pwg1WP+ZZILJzt3fi0xEnri4ukNILoHO+6sJ6I4=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpSlGQ68k1c1n3/pDUm2g4dycogVyIVjOB6y
 1NLaf0nYJ+JAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUgAKCRAicTuzoY3I
 Om82EACBuKGAY/JgbJMmDmVaH2Rh8pL8YMvj9ofNzHmskTZtDg689vihLFJd0La1Jue4cufIwbJ
 ANlYFJSFB4faOegzSJx903gPuxv9i4FeC/NcpgN9b0u7OL/n8r4N7XOkXfjtzp4R48CoR6UoBUL
 UoxgGSbYQ/6MjAixE/oHDa4eLtc8kr3smvviYE0O7PXcbfwbpyy7qmQc8bcqFJdqB83yqwUi3Wx
 HCSpOmrOQFTlalutJbSdIHroTvH344929cMXtxv8F4MgOoh5zUL+reKft8PI049vpviCYE0iUe2
 AXGm6+2QmvTankttf106TgXTsxlp//iRg5m1S/tnPD8f7CvxQkGWgpbwbQ3S6sANZHHgFOpSBNo
 COcp6l52FkLBX/uN5e0BoVjIn1GGBxHTlKfR9vdsjjb0PSmi30vDtBzkHKH5E2tUPvxytqi/9Se
 +Y/iLF2wxYy4zSexSvLaV8H27w/zTXqDbBobmdwbJ1qEqrEqXO8BzdcqmTSxS/3QInbyJpkfN3a
 CBSOgEP54Xw16hKHQ2RcNQ9b2R9jSHZY0WVvwDNu4fSfZ3bZOXKb3VESMVwPFirkvEgxunzXApq
 3f4Z7Jxpk6kXsdlVKtRHiZjDH2NSYMFg0lwWoRvGC4FkSOy6TtAF5VkL1JPqin3g81UcWtosFLN
 G6IS7HvHR36DIHw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

We currently do not have an upstream user of the x1e CAMSS schema which
allows us to make this the first platform to treat the CSI PHYs as separate
devices in much the same way as we treat the CCI block as separate devices.

Convert the embedded CSIPHY node data to simple phys = <> removing all of
the PHY specific stuff previously embedded.

I gave some serious thought to making the Test Pattern Generators TPGs into
PHY nodes also but, unlike the CSIPHYs the TPGs have no dedicated external
pins nor regulators.

The CSIPHYs OTOH have dedicated in-fact generally unmuxed pins on Qualcomm
SoCs and each CSIPHY has its own set of input power rails usually 0p8 and
1p2.

Instead of defining the CSIPHYs as children of the CAMSS block, we take the
same approach as the CCI/I2C bus dedicated to CAMSS and define the CSIPHYs
as their own nodes.

Remove the embedded CSIPHY specific data and give CAMSS regular,
bog-standard phys = <>;

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 80 +++++-----------------
 1 file changed, 16 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2438e08b894f4a3dc577cee4ab85184a3d7232b0..c130733887e39afe51f3d2df2a5c943c6fc2ca9f 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -17,7 +17,7 @@ properties:
     const: qcom,x1e80100-camss
 
   reg:
-    maxItems: 17
+    maxItems: 13
 
   reg-names:
     items:
@@ -27,10 +27,6 @@ properties:
       - const: csid2
       - const: csid_lite0
       - const: csid_lite1
-      - const: csiphy0
-      - const: csiphy1
-      - const: csiphy2
-      - const: csiphy4
       - const: csitpg0
       - const: csitpg1
       - const: csitpg2
@@ -40,7 +36,7 @@ properties:
       - const: vfe_lite1
 
   clocks:
-    maxItems: 29
+    maxItems: 21
 
   clock-names:
     items:
@@ -55,14 +51,6 @@ properties:
       - const: cphy_rx_clk_src
       - const: csid
       - const: csid_csiphy_rx
-      - const: csiphy0
-      - const: csiphy0_timer
-      - const: csiphy1
-      - const: csiphy1_timer
-      - const: csiphy2
-      - const: csiphy2_timer
-      - const: csiphy4
-      - const: csiphy4_timer
       - const: gcc_axi_hf
       - const: gcc_axi_sf
       - const: vfe0
@@ -75,7 +63,7 @@ properties:
       - const: vfe_lite_csid
 
   interrupts:
-    maxItems: 13
+    maxItems: 9
 
   interrupt-names:
     items:
@@ -84,15 +72,17 @@ properties:
       - const: csid2
       - const: csid_lite0
       - const: csid_lite1
-      - const: csiphy0
-      - const: csiphy1
-      - const: csiphy2
-      - const: csiphy4
       - const: vfe0
       - const: vfe1
       - const: vfe_lite0
       - const: vfe_lite1
 
+  phys:
+    maxItems: 4
+
+  phy-names:
+    maxItems: 4
+
   interconnects:
     maxItems: 4
 
@@ -118,14 +108,6 @@ properties:
       - const: ife1
       - const: top
 
-  vdd-csiphy-0p8-supply:
-    description:
-      Phandle to a 0.8V regulator supply to a PHY.
-
-  vdd-csiphy-1p2-supply:
-    description:
-      Phandle to 1.8V regulator supply to a PHY.
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -166,13 +148,13 @@ required:
   - clock-names
   - interrupts
   - interrupt-names
+  - phys
+  - phy-names
   - interconnects
   - interconnect-names
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false
@@ -199,10 +181,6 @@ examples:
                   <0 0x0acbb000 0 0x2000>,
                   <0 0x0acc6000 0 0x1000>,
                   <0 0x0acca000 0 0x1000>,
-                  <0 0x0ace4000 0 0x1000>,
-                  <0 0x0ace6000 0 0x1000>,
-                  <0 0x0ace8000 0 0x1000>,
-                  <0 0x0acec000 0 0x4000>,
                   <0 0x0acf6000 0 0x1000>,
                   <0 0x0acf7000 0 0x1000>,
                   <0 0x0acf8000 0 0x1000>,
@@ -217,10 +195,6 @@ examples:
                         "csid2",
                         "csid_lite0",
                         "csid_lite1",
-                        "csiphy0",
-                        "csiphy1",
-                        "csiphy2",
-                        "csiphy4",
                         "csitpg0",
                         "csitpg1",
                         "csitpg2",
@@ -240,14 +214,6 @@ examples:
                      <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
                      <&camcc CAM_CC_CSID_CLK>,
                      <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
-                     <&camcc CAM_CC_CSIPHY0_CLK>,
-                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
-                     <&camcc CAM_CC_CSIPHY1_CLK>,
-                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
-                     <&camcc CAM_CC_CSIPHY2_CLK>,
-                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
-                     <&camcc CAM_CC_CSIPHY4_CLK>,
-                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
                      <&gcc GCC_CAMERA_HF_AXI_CLK>,
                      <&gcc GCC_CAMERA_SF_AXI_CLK>,
                      <&camcc CAM_CC_IFE_0_CLK>,
@@ -270,14 +236,6 @@ examples:
                           "cphy_rx_clk_src",
                           "csid",
                           "csid_csiphy_rx",
-                          "csiphy0",
-                          "csiphy0_timer",
-                          "csiphy1",
-                          "csiphy1_timer",
-                          "csiphy2",
-                          "csiphy2_timer",
-                          "csiphy4",
-                          "csiphy4_timer",
                           "gcc_axi_hf",
                           "gcc_axi_sf",
                           "vfe0",
@@ -294,10 +252,6 @@ examples:
                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
@@ -308,15 +262,16 @@ examples:
                               "csid2",
                               "csid_lite0",
                               "csid_lite1",
-                              "csiphy0",
-                              "csiphy1",
-                              "csiphy2",
-                              "csiphy4",
                               "vfe0",
                               "vfe1",
                               "vfe_lite0",
                               "vfe_lite1";
 
+            phys = <&csiphy0>, <&csiphy1>,
+                   <&csiphy2>, <&csiphy4>;
+            phy-names = "csiphy0", "csiphy1",
+                        "csiphy2", "csiphy4";
+
             interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
                              &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
                             <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
@@ -348,9 +303,6 @@ examples:
                                  "ife1",
                                  "top";
 
-            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
-            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
-
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

-- 
2.49.0


