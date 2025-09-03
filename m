Return-Path: <linux-clk+bounces-27155-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EF5B41123
	for <lists+linux-clk@lfdr.de>; Wed,  3 Sep 2025 02:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0011B61101
	for <lists+linux-clk@lfdr.de>; Wed,  3 Sep 2025 00:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EAA282EE;
	Wed,  3 Sep 2025 00:09:43 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736863209;
	Wed,  3 Sep 2025 00:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858183; cv=none; b=gTdlLU6DBuPBLzTjsvKOUEWZIAJYnbP7JLhzB3Lq0TVSWikGVQkQ0QvMsPyhF2C0arAtiUWvTxAQlqvrUXJubzaFFow7BQ/8USPHisPJXMhKxlV+9YEUxKT/OA38NzwPKQ9tDvNd/YF0pAoqvDOEZNAllFzaoSWp/sB11oBz3AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858183; c=relaxed/simple;
	bh=Y16uXCeoPpg0llX8yL3WzRcM9w6S487+udgkmb4ThNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOx1BG346i01L39A2zQhPXz9jHIsBMEReCZAnB1NKKPLi5yazeMzKh6YSHiw/6vaVFyqG1Sp7ZHEqurNHsrCMAaJBryqbZn6inZj/1o6+5oOzh7DWuvHaNNGN/1xJkxdGLt8FBi0OcDObkA/HibyXhmlsL1mMZtQOGtC5/UyHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DC51176A;
	Tue,  2 Sep 2025 17:09:32 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 168A43F63F;
	Tue,  2 Sep 2025 17:09:38 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [PATCH 1/5] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU CCU clock controller
Date: Wed,  3 Sep 2025 01:09:06 +0100
Message-ID: <20250903000910.4860-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250903000910.4860-1-andre.przywara@arm.com>
References: <20250903000910.4860-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are four clock controllers in the A523 SoC, but only three are
described in the DT binding so far.

Add a description for the CPU CCU, which provides separate clocks for
the two CPU clusters and the DSU interconnect.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../clock/allwinner,sun55i-a523-ccu.yaml      | 25 +++++++++++++++++++
 .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 ++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
index 1dbd92febc471..367d26800fd0d 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - allwinner,sun55i-a523-ccu
+      - allwinner,sun55i-a523-cpu-ccu
       - allwinner,sun55i-a523-mcu-ccu
       - allwinner,sun55i-a523-r-ccu
 
@@ -64,6 +65,30 @@ allOf:
             - const: iosc
             - const: losc-fanout
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun55i-a523-cpu-ccu
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: High Frequency Oscillator (usually at 24MHz)
+            - description: Low Frequency Oscillator (usually at 32kHz)
+            - description: Internal Oscillator
+            - description: Peripherals PLL 0 (1200 MHz output)
+            - description: Peripherals PLL 0 (600 MHz output)
+
+        clock-names:
+          items:
+            - const: hosc
+            - const: losc
+            - const: iosc
+            - const: pll-periph0-2x
+            - const: pll-periph0-600m
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
new file mode 100644
index 0000000000000..042f2310f64de
--- /dev/null
+++ b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 Arm Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
+#define _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
+
+#define CLK_CPU_L		7
+#define CLK_CPU_DSU		8
+#define CLK_CPU_B		9
+
+#endif /* _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_ */
-- 
2.46.3


