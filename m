Return-Path: <linux-clk+bounces-19071-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB7A54EEC
	for <lists+linux-clk@lfdr.de>; Thu,  6 Mar 2025 16:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59FB8175A4D
	for <lists+linux-clk@lfdr.de>; Thu,  6 Mar 2025 15:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56EC20F09C;
	Thu,  6 Mar 2025 15:25:53 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADAF20764A;
	Thu,  6 Mar 2025 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274753; cv=none; b=m0Adipqi2vyE+T10MGQZ7d4ln3CPv+R8STw07c6ftBu55Idz6Z1hZgTGulY7Z7y3gu9bVBgmxR3O91PQUWk5iwWsfhCZN/ZUgvZ29gSCSZ1ngnrLKRpr96aeDIlDD1R9ezVMhdXYGYIL2GfJrynWjr1LArJYhaouOHeOOLdlaMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274753; c=relaxed/simple;
	bh=ek2KnULJJhIppc1iWfFpePLW9/Ovr7E5JzOQDNE+EFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3h+zJFl8Wfc6L9eqcVoFKth79jipcziIFhuzZymWU/4oO1CGkmDHAb7hN50IM6e3NJ3mLvuBNG0q8PBcc7yWqOMhKwwdCdQJGp6731T2TEe6CVMsZXELSS8Ri1EyrdttKXxYNPAy4Y4k5BYCUBNfBMI1atiB/f5RN4O3TwWdDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: a2hzvrSvRI+wc2sssXRneA==
X-CSE-MsgGUID: az+CKRiVT4OqA/PkeayCLw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Mar 2025 00:25:50 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 52B2A4007213;
	Fri,  7 Mar 2025 00:25:47 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/13] dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
Date: Thu,  6 Mar 2025 16:24:36 +0100
Message-ID: <20250306152451.2356762-3-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v3->v4:
  - Handle maxItems and clocks names properly in schema. 
---
 .../bindings/clock/renesas,cpg-mssr.yaml      | 56 +++++++++++++------
 .../clock/renesas,r9a09g077-cpg-mssr.h        | 49 ++++++++++++++++
 2 files changed, 89 insertions(+), 16 deletions(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 77ce3615c65a..acbb555a064e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -52,9 +52,10 @@ properties:
       - renesas,r8a779f0-cpg-mssr # R-Car S4-8
       - renesas,r8a779g0-cpg-mssr # R-Car V4H
       - renesas,r8a779h0-cpg-mssr # R-Car V4M
+      - renesas,r9a09g077-cpg-mssr # RZ/T2H
 
   reg:
-    maxItems: 1
+    description: Registers base address
 
   clocks:
     minItems: 1
@@ -63,11 +64,6 @@ properties:
   clock-names:
     minItems: 1
     maxItems: 2
-    items:
-      enum:
-        - extal     # All
-        - extalr    # Most R-Car Gen3 and RZ/G2
-        - usb_extal # Most R-Car Gen2 and RZ/G1
 
   '#clock-cells':
     description: |
@@ -92,16 +88,6 @@ properties:
       the datasheet.
     const: 1
 
-if:
-  not:
-    properties:
-      compatible:
-        items:
-          enum:
-            - renesas,r7s9210-cpg-mssr
-then:
-  required:
-    - '#reset-cells'
 
 required:
   - compatible
@@ -113,6 +99,44 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-cpg-mssr
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: extal
+            - const: loco
+    else:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 1
+        clock-names:
+          items:
+            enum:
+              - extal     # All
+              - extalr    # Most R-Car Gen3 and RZ/G2
+              - usb_extal # Most R-Car Gen2 and RZ/G1
+
+  - if:
+      not:
+        properties:
+          compatible:
+            items:
+              enum:
+                - renesas,r7s9210-cpg-mssr
+    then:
+      required:
+        - '#reset-cells'
+
 examples:
   - |
     cpg: clock-controller@e6150000 {
diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
new file mode 100644
index 000000000000..27c9cdcdf7c8
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* R9A09G077 CPG Core Clocks */
+#define R9A09G077_CA55C0		0
+#define R9A09G077_CA55C1		1
+#define R9A09G077_CA55C2		2
+#define R9A09G077_CA55C3		3
+#define R9A09G077_SDHIHS		4
+#define R9A09G077_CLK_PLL1_ETH_PHY	5
+#define R9A09G077_CLK_OSC_ETH_PHY	6
+#define R9A09G077_CLK_ETHPHY		7
+#define R9A09G077_PCLKAH		8
+#define R9A09G077_PCLKAM		9
+#define R9A09G077_PCLKAL		10
+#define R9A09G077_CLK_SEL_ETH_PHY	11
+#define R9A09G077_DFI			12
+#define R9A09G077_PCLKH			13
+#define R9A09G077_PCLKM			14
+#define R9A09G077_PCLKL			15
+#define R9A09G077_PCLKGPTL		16
+#define R9A09G077_PCLKSHOST		17
+#define R9A09G077_PCLKRTC		18
+#define R9A09G077_USB			19
+#define R9A09G077_SPI0			20
+#define R9A09G077_SPI1			21
+#define R9A09G077_SPI2			22
+#define R9A09G077_SPI3			23
+#define R9A09G077_ETCLKA		24
+#define R9A09G077_ETCLKB		25
+#define R9A09G077_ETCLKC		26
+#define R9A09G077_ETCLKD		27
+#define R9A09G077_ETCLKE		28
+#define R9A09G077_ETHCLKE		29
+#define R9A09G077_ETHCLK_EXTAL		30
+#define R9A09G077_ETH_REFCLK		31
+#define R9A09G077_LCDC_CLKA		32
+#define R9A09G077_LCDC_CLKP		33
+#define R9A09G077_CA55			34
+#define R9A09G077_LCDC_CLKD		35
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
-- 
2.43.0


