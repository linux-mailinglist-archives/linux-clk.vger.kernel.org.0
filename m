Return-Path: <linux-clk+bounces-16431-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 669CA9FDF2B
	for <lists+linux-clk@lfdr.de>; Sun, 29 Dec 2024 14:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3B973A1838
	for <lists+linux-clk@lfdr.de>; Sun, 29 Dec 2024 13:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4B418BBA8;
	Sun, 29 Dec 2024 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcGea+if"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5660518A922;
	Sun, 29 Dec 2024 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735480439; cv=none; b=OlU82glUBFospvG1sSEbZSccN8xD1BEk0Mfj6aHQkLQIGqOE3Zzkw/fdMh1eCgKusmGacplJXTKGH8Lk7x4Rs3K1DU3oZLXnK1X1U6yVxZnwaXoFYTKHRYhE91n8w++B+lDg8Mv19z0RiAM6eC4fRMnytkt66omniawz/E+gi8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735480439; c=relaxed/simple;
	bh=qPqP3V/5iqL/CvfRc4wTABvDdPB8RgGiYiU9JVupGpY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CH7wgdTqXWOu/gE+v96OWEp8/43rFon3/9eI+ryy4sc0Q3q1CMLAI3Z8kTERQdPNiZFVsFqsZVOWLMcz+uxFzD69A1ZOwP4ISlZtXla23U4qKcFEZs0L7wW/6O+Cq1Icnkzssqcua9wQ6jG786kFnaSY5slB0g8aQGgK7r9Vr0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcGea+if; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5315CC4CEE0;
	Sun, 29 Dec 2024 13:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735480438;
	bh=qPqP3V/5iqL/CvfRc4wTABvDdPB8RgGiYiU9JVupGpY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jcGea+ifNSOWHPDbNlKFsbOV1AKEMgUCHX7hJ4suIxIy1EAnga4HmY1uykDSWQYjY
	 nY1+K9jLljAGQyNiN7AjTVYhq9v8cq19EDwaQ7KK0NQmT37lcNSm9zbxIPa+Uzd+AZ
	 mYWwWpMvg7P2RaDsJ38kCMIP2CWyTkZnYpn/VOXRulgBOu+l6RbmG+4+sPbwr5HX3p
	 ax0DRApqjqro7BXnvxFeLBZxiSdwEJD3oBJB0oe+RmlKYf2VTqbheYRPdeyUlYW8PN
	 eUXbq1qluebHj9qYthb6m6RSzmjOhkUnKCr1LEYDuKnV7o4ay4BNDVWSRvfN77xGOg
	 w1ae7PogsBSXA==
From: akemnade@kernel.org
To: Tero Kristo <kristo@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	devicetree@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: ti: Convert gate.txt to json-schema
Date: Sun, 29 Dec 2024 14:53:50 +0100
Message-Id: <20241229135351.5014-2-akemnade@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241229135351.5014-1-akemnade@kernel.org>
References: <20241229135351.5014-1-akemnade@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Kemnade <andreas@kemnade.info>

Convert the OMAP gate clock device tree binding to json-schema.
Specify the creator of the original binding as a maintainer.
Choose GPL-only license because original binding was also GPL.
Clean up the examples during conversion to meet modern standards and
remove examples with no additional value.
Due to usage in code and existing devicetree binding, add the
ti,set-rate-parent property.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../devicetree/bindings/clock/ti/gate.txt     | 105 ---------------
 .../bindings/clock/ti/ti,gate-clock.yaml      | 123 ++++++++++++++++++
 2 files changed, 123 insertions(+), 105 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/gate.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/gate.txt b/Documentation/devicetree/bindings/clock/ti/gate.txt
deleted file mode 100644
index a8e0335b006a..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/gate.txt
+++ /dev/null
@@ -1,105 +0,0 @@
-Binding for Texas Instruments gate clock.
-
-This binding uses the common clock binding[1]. This clock is
-quite much similar to the basic gate-clock [2], however,
-it supports a number of additional features. If no register
-is provided for this clock, the code assumes that a clockdomain
-will be controlled instead and the corresponding hw-ops for
-that is used.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
-[3] Documentation/devicetree/bindings/clock/ti/clockdomain.txt
-
-Required properties:
-- compatible : shall be one of:
-  "ti,gate-clock" - basic gate clock
-  "ti,wait-gate-clock" - gate clock which waits until clock is active before
-			 returning from clk_enable()
-  "ti,dss-gate-clock" - gate clock with DSS specific hardware handling
-  "ti,am35xx-gate-clock" - gate clock with AM35xx specific hardware handling
-  "ti,clkdm-gate-clock" - clockdomain gate clock, which derives its functional
-			  clock directly from a clockdomain, see [3] how
-			  to map clockdomains properly
-  "ti,hsdiv-gate-clock" - gate clock with OMAP36xx specific hardware handling,
-			  required for a hardware errata
-  "ti,composite-gate-clock" - composite gate clock, to be part of composite
-			      clock
-  "ti,composite-no-wait-gate-clock" - composite gate clock that does not wait
-				      for clock to be active before returning
-				      from clk_enable()
-- #clock-cells : from common clock binding; shall be set to 0
-- clocks : link to phandle of parent clock
-- reg : offset for register controlling adjustable gate, not needed for
-	ti,clkdm-gate-clock type
-
-Optional properties:
-- clock-output-names : from common clock binding.
-- ti,bit-shift : bit shift for programming the clock gate, invalid for
-		 ti,clkdm-gate-clock type
-- ti,set-bit-to-disable : inverts default gate programming. Setting the bit
-  gates the clock and clearing the bit ungates the clock.
-
-Examples:
-	mmchs2_fck: mmchs2_fck@48004a00 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&core_96m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <25>;
-	};
-
-	uart4_fck_am35xx: uart4_fck_am35xx {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_48m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <23>;
-	};
-
-	dss1_alwon_fck_3430es2: dss1_alwon_fck_3430es2@48004e00 {
-		#clock-cells = <0>;
-		compatible = "ti,dss-gate-clock";
-		clocks = <&dpll4_m4x2_ck>;
-		reg = <0x0e00>;
-		ti,bit-shift = <0>;
-	};
-
-	emac_ick: emac_ick@4800259c {
-		#clock-cells = <0>;
-		compatible = "ti,am35xx-gate-clock";
-		clocks = <&ipss_ick>;
-		reg = <0x059c>;
-		ti,bit-shift = <1>;
-	};
-
-	emu_src_ck: emu_src_ck {
-		#clock-cells = <0>;
-		compatible = "ti,clkdm-gate-clock";
-		clocks = <&emu_src_mux_ck>;
-	};
-
-	dpll4_m2x2_ck: dpll4_m2x2_ck@48004d00 {
-		#clock-cells = <0>;
-		compatible = "ti,hsdiv-gate-clock";
-		clocks = <&dpll4_m2x2_mul_ck>;
-		ti,bit-shift = <0x1b>;
-		reg = <0x0d00>;
-		ti,set-bit-to-disable;
-	};
-
-	vlynq_gate_fck: vlynq_gate_fck {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&core_ck>;
-		ti,bit-shift = <3>;
-		reg = <0x0200>;
-	};
-
-	sys_clkout2_src_gate: sys_clkout2_src_gate {
-		#clock-cells = <0>;
-		compatible = "ti,composite-no-wait-gate-clock";
-		clocks = <&core_ck>;
-		ti,bit-shift = <15>;
-		reg = <0x0070>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
new file mode 100644
index 000000000000..ef2f5d6bdb4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments gate clock
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+
+description: |
+  This clock is quite much similar to the basic gate-clock [1], however,
+  it supports a number of additional features. If no register
+  is provided for this clock, the code assumes that a clockdomain
+  will be controlled instead and the corresponding hw-ops for
+  that is used.
+
+  [1] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
+  [2] Documentation/devicetree/bindings/clock/ti/clockdomain.txt
+
+properties:
+  compatible:
+    enum:
+      - ti,gate-clock           # basic gate clock
+      - ti,wait-gate-clock      # gate clock which waits until clock is
+                                # active before returning from clk_enable()
+      - ti,dss-gate-clock       # gate clock with DSS specific hardware
+                                # handling
+      - ti,am35xx-gate-clock    # gate clock with AM35xx specific hardware
+                                # handling
+      - ti,clkdm-gate-clock     # clockdomain gate clock, which derives its
+                                # functional clock directly from a
+                                # clockdomain, see [2] how to map
+                                # clockdomains properly
+      - ti,hsdiv-gate-clock     # gate clock with OMAP36xx specific hardware
+                                # handling, required for a hardware errata
+      - ti,composite-gate-clock # composite gate clock, to be part of
+                                # composite clock
+      - ti,composite-no-wait-gate-clock # composite gate clock that does not
+                                        # wait for clock to be active before
+                                        # returning from clk_enable()
+  "#clock-cells":
+    const: 0
+
+  clocks: true
+
+  clock-output-names:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  ti,bit-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of bits to shift the bit-mask
+    maximum: 31
+    default: 0
+
+  ti,set-bit-to-disable:
+    type: boolean
+    description:
+      Inverts default gate programming. Setting the bit
+      gates the clock and clearing the bit ungates the clock.
+
+  ti,set-rate-parent:
+    type: boolean
+    description:
+      clk_set_rate is propagated to parent clock,
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,clkdm-gate-clock
+then:
+  properties:
+    reg: false
+  required:
+    - compatible
+    - "#clock-cells"
+    - clocks
+else:
+  required:
+    - compatible
+    - "#clock-cells"
+    - clocks
+    - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@a00 {
+        #clock-cells = <0>;
+        compatible = "ti,gate-clock";
+        clocks = <&core_96m_fck>;
+        reg = <0x0a00>;
+        ti,bit-shift = <25>;
+      };
+
+      clock-controller@d00 {
+        compatible = "ti,hsdiv-gate-clock";
+        reg = <0x0d00>;
+        #clock-cells = <0>;
+        clocks = <&dpll4_m2x2_mul_ck>;
+        ti,bit-shift = <0x1b>;
+        ti,set-bit-to-disable;
+      };
+    };
+
+  - |
+    clock-controller {
+      #clock-cells = <0>;
+      compatible = "ti,clkdm-gate-clock";
+      clocks = <&emu_src_mux_ck>;
+    };
+
-- 
2.39.5


