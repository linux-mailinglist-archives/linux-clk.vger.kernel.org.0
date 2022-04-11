Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4B84FB4AB
	for <lists+linux-clk@lfdr.de>; Mon, 11 Apr 2022 09:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245362AbiDKH1g (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 11 Apr 2022 03:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245375AbiDKH1P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 03:27:15 -0400
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF6239BBD;
        Mon, 11 Apr 2022 00:24:52 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc26a.ng.seznam.cz (email-smtpc26a.ng.seznam.cz [10.23.18.36])
        id 121e7f2849102b4113b7b376;
        Mon, 11 Apr 2022 09:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1649661870; bh=Ul+MInATxbuhz7W4YePJzrEiLrSLE0zhdL7RZR0E814=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=QtPAgol3uD3JVWNvrIqd9juVx486ihQrKFmUZW4RKet3uITEPSyJ9SpeFfIjTzE7G
         tiJ9a3LNF0zr7ISVuH+o8irHVrf7NZ23D8d6Gxtx2UdXfSZa4pAjbqXHt+obdzaj2L
         gdZB2adMreyq8wheH4CecIS+Tuv42P9qoxH96KVw=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay18.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Mon, 11 Apr 2022 09:24:24 +0200 (CEST)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND v9 3/5] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
Date:   Mon, 11 Apr 2022 09:21:54 +0200
Message-Id: <20220411072156.24451-4-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411072156.24451-1-michael.srba@seznam.cz>
References: <20220411072156.24451-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <57563f87-f73c-4551-8f24-28c2da304adf>
X-szn-frgc: <0>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

Adds bindings for the AHB bus which exposes the SSC block in the global
address space. This bus (and the SSC block itself) is present on certain
qcom SoCs.

In typical configuration, this bus (as some of the clocks and registers
that we need to manipulate) is not accessible to the OS, and the
resources on this bus are indirectly accessed by communicating with a
hexagon CPU core residing in the SSC block. In this configuration, the
hypervisor is the one performing the bus initialization for the purposes
of bringing the haxagon CPU core out of reset.

However, it is possible to change the configuration, in which case this
binding serves to allow the OS to initialize the bus.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 CHANGES:
 - v2: fix issues caught by by dt-schema
 - v3: none
 - v4: address the issues pointed out in the review
 - v5: clarify type of additional properties; remove ssc_tlmm node for now
 - v6: none
 - v7: fix indentation, use imperative in commit message
 - v8: none
 - v9: fix typo in commit description; explain what SSC is in the 'decription' section of the binding
---
 .../bindings/bus/qcom,ssc-block-bus.yaml      | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml

diff --git a/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml b/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
new file mode 100644
index 000000000000..5b9705079015
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/qcom,ssc-block-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The AHB Bus Providing a Global View of the SSC Block on (some) qcom SoCs
+
+maintainers:
+  - Michael Srba <Michael.Srba@seznam.cz>
+
+description: |
+  This binding describes the dependencies (clocks, resets, power domains) which
+  need to be turned on in a sequence before communication over the AHB bus
+  becomes possible.
+
+  Additionally, the reg property is used to pass to the driver the location of
+  two sadly undocumented registers which need to be poked as part of the sequence.
+
+  The SSC (Snapdragon Sensor Core) block contains a gpio controller, i2c/spi/uart
+  controllers, a hexagon core, and a clock controller which provides clocks for
+  the above.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,msm8998-ssc-block-bus
+      - const: qcom,ssc-block-bus
+
+  reg:
+    description: |
+      Shall contain the addresses of the SSCAON_CONFIG0 and SSCAON_CONFIG1
+      registers
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: mpm_sscaon_config0
+      - const: mpm_sscaon_config1
+
+  '#address-cells':
+    enum: [ 1, 2 ]
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+  ranges: true
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: xo
+      - const: aggre2
+      - const: gcc_im_sleep
+      - const: aggre2_north
+      - const: ssc_xo
+      - const: ssc_ahbs
+
+  power-domains:
+    description: Power domain phandles for the ssc_cx and ssc_mx power domains
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: ssc_cx
+      - const: ssc_mx
+
+  resets:
+    description: |
+      Reset phandles for the ssc_reset and ssc_bcr resets (note: ssc_bcr is the
+      branch control register associated with the ssc_xo and ssc_ahbs clocks)
+    minItems: 2
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: ssc_reset
+      - const: ssc_bcr
+
+  qcom,halt-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: describes how to locate the ssc AXI halt register
+    items:
+      - items:
+          - description: Phandle reference to a syscon representing TCSR
+          - description: offset for the ssc AXI halt register
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+  - qcom,halt-regs
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        // devices under this node are physically located in the SSC block, connected to an ssc-internal bus;
+        ssc_ahb_slave: bus@10ac008 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            compatible = "qcom,msm8998-ssc-block-bus", "qcom,ssc-block-bus";
+            reg = <0x10ac008 0x4>, <0x10ac010 0x4>;
+            reg-names = "mpm_sscaon_config0", "mpm_sscaon_config1";
+
+            clocks = <&xo>,
+                     <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
+                     <&gcc GCC_IM_SLEEP>,
+                     <&gcc AGGRE2_SNOC_NORTH_AXI>,
+                     <&gcc SSC_XO>,
+                     <&gcc SSC_CNOC_AHBS_CLK>;
+            clock-names = "xo", "aggre2", "gcc_im_sleep", "aggre2_north", "ssc_xo", "ssc_ahbs";
+
+            resets = <&gcc GCC_SSC_RESET>, <&gcc GCC_SSC_BCR>;
+            reset-names = "ssc_reset", "ssc_bcr";
+
+            power-domains = <&rpmpd MSM8998_SSCCX>, <&rpmpd MSM8998_SSCMX>;
+            power-domain-names = "ssc_cx", "ssc_mx";
+
+            qcom,halt-regs = <&tcsr_mutex_regs 0x26000>;
+        };
+    };
-- 
2.35.1

