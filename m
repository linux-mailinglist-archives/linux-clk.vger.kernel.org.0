Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6F4459BE78
	for <lists+linux-clk@lfdr.de>; Mon, 22 Aug 2022 13:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbiHVLaF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Aug 2022 07:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbiHVLaD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 07:30:03 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7D933356;
        Mon, 22 Aug 2022 04:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661167801; x=1692703801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ap/1d32G3ShqZ7cg6OHV5ynvTs9QgXyyswkhAL2axUo=;
  b=1kbHGwTFODEW1bx6kn0w496/a01+dnnZ9/S0hCiPkIo98BptHbqPhsSu
   LJ9F0gx4iMOUv7vCC+vKKZZQ2En5qgYFfWTcCFTXGe0PRAEKWi+dys2Qv
   u0bAF/yp7FksPmraKocNpmcnVA8wPnAdeSszfyskdsxkMbNPHF+cGlksI
   FuPyCHp9wdffGzmnGOfbbWLoA6EisSDu59Y+8tbvZo90+25TNcjTCg0OE
   L+DoO+iTZKnDQG0SXYI9hVjlg8ArLucgfGau1HymZcDKhrljzvyXr++D6
   tunXIPUFrz2BFi3Pup4Teg4vtOlQCPj48HIu+0kPZRN9U1uypTlxU6gM9
   w==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="110092118"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 04:30:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 04:29:59 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 22 Aug 2022 04:29:57 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Hugh Breslin <hugh.breslin@microchip.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 2/6] dt-bindings: clk: document PolarFire SoC fabric clocks
Date:   Mon, 22 Aug 2022 12:29:25 +0100
Message-ID: <20220822112928.2727437-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220822112928.2727437-1-conor.dooley@microchip.com>
References: <20220822112928.2727437-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On PolarFire SoC there are 4 PLL/DLL blocks, located in each of the
ordinal corners of the chip, which our documentation refers to as
"Clock Conditioning Circuitry". PolarFire SoC is an FPGA, these are
highly configurable & many of the input clocks are optional.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs-ccc.yaml    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
new file mode 100644
index 000000000000..eae291688f3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire SoC Fabric Clock Conditioning Circuitry
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  Microchip PolarFire SoC has 4 Clock Conditioning Circuitry blocks. Each of
+  these blocks contains two PLLs and 2 DLLs & are located in the four corners of
+  the FPGA. For more information see "PolarFire SoC FPGA Clocking Resources" at:
+  https://onlinedocs.microchip.com/pr/GUID-8F0CC4C0-0317-4262-89CA-CE7773ED1931-en-US-1/index.html
+
+properties:
+  compatible:
+    const: microchip,mpfs-ccc
+
+  reg:
+    items:
+      - description: PLL0's control registers
+      - description: PLL1's control registers
+      - description: DLL0's control registers
+      - description: DLL1's control registers
+
+  clocks:
+    description:
+      The CCC PLL's have two input clocks. It is required that even if the input
+      clocks are identical that both are provided.
+    minItems: 2
+    items:
+      - description: PLL0's refclk0
+      - description: PLL0's refclk1
+      - description: PLL1's refclk0
+      - description: PLL1's refclk1
+      - description: DLL0's refclk
+      - description: DLL1's refclk
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: pll0_ref0
+      - const: pll0_ref1
+      - const: pll1_ref0
+      - const: pll1_ref1
+      - const: dll0_ref
+      - const: dll1_ref
+
+  '#clock-cells':
+    const: 1
+    description: |
+      The clock consumer should specify the desired clock by having the clock
+      ID in its "clocks" phandle cell.
+      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
+      PolarFire clock IDs.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-output-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@38100000 {
+        compatible = "microchip,mpfs-ccc";
+        reg = <0x38010000 0x1000>, <0x38020000 0x1000>,
+              <0x39010000 0x1000>, <0x39020000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>,
+                  <&refclk_ccc>, <&refclk_ccc>;
+        clock-names = "pll0_ref0", "pll0_ref1", "pll1_ref0", "pll1_ref1",
+                      "dll0_ref", "dll1_ref";
+    };
-- 
2.36.1

