Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1084E54B83A
	for <lists+linux-clk@lfdr.de>; Tue, 14 Jun 2022 20:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238037AbiFNSDA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Jun 2022 14:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237953AbiFNSC6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Jun 2022 14:02:58 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A3044A35;
        Tue, 14 Jun 2022 11:02:54 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 01252843B5;
        Tue, 14 Jun 2022 20:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655229772;
        bh=hN84EkYZ4dRO7ecBfqk7noG9PI1Fh6L3z6WkNM+SIO8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qi04wJK7m7eiTuZBt2wvqWb+GzDw4L+3kF3aYgGtkEfnEXuB6bNeWVnORBJSQ7Yz0
         7Ez2kTPGR7QXGt6tQVQtRXeB2K/GciARfLyKSlhtfKD7XF4yXGne+MRtVCzr9uVefr
         4jDGKBudf+nCSp9K+EFY7GnID8f3rzeaK6Izja6KSkJ1FRl4h2geMPAdC4e7ATpQvt
         HNg85rwUMK3RWFxjH69FOmaDzWKcb+0+Kr5Ka2jpfbwBTXoGQgVRQ8J5e5H7vj4TLR
         yPPyefNlEbQbCTPumZyxjkfKRXNWT72nIlKLsJMyqn/f4uyb1jKVqogkyAUXM1p9xy
         6XHI+56Xs04Og==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: [PATCH v2 2/4] dt-bindings: clock: imx8mp: Add audiomix block control
Date:   Tue, 14 Jun 2022 20:02:37 +0200
Message-Id: <20220614180239.778334-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614180239.778334-1-marex@denx.de>
References: <20220614180239.778334-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
series of clock gates and muxes. Add DT bindings for this IP.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-imx@nxp.com
To: linux-clk@vger.kernel.org
---
V2: No change
---
 .../bindings/clock/imx8mp-audiomix.yaml       | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml

diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
new file mode 100644
index 0000000000000..2d132259e0b36
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8MP AudioMIX Block Control Binding
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  NXP i.MX8M Plus AudioMIX is dedicated clock muxing and gating IP
+  used to control Audio related clock on the SoC.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-audio-blk-ctrl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    const: audio
+
+  clocks:
+    minItems: 7
+    maxItems: 7
+
+  clock-names:
+    items:
+      - const: audio_ahb
+      - const: sai1
+      - const: sai2
+      - const: sai3
+      - const: sai5
+      - const: sai6
+      - const: sai7
+
+  '#clock-cells':
+    const: 1
+    description:
+      The clock consumer should specify the desired clock by having the clock
+      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mp-clock.h
+      for the full list of i.MX8MP IMX8MP_CLK_AUDIOMIX_ clock IDs.
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - power-domain-names
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  # Clock Control Module node:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+
+    clock-controller@30e20000 {
+        #clock-cells = <1>;
+        compatible = "fsl,imx8mp-audio-blk-ctrl";
+        clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
+                 <&clk IMX8MP_CLK_SAI1>,
+                 <&clk IMX8MP_CLK_SAI2>,
+                 <&clk IMX8MP_CLK_SAI3>,
+                 <&clk IMX8MP_CLK_SAI5>,
+                 <&clk IMX8MP_CLK_SAI6>,
+                 <&clk IMX8MP_CLK_SAI7>;
+        clock-names = "audio_ahb",
+                      "sai1", "sai2", "sai3",
+                      "sai5", "sai6", "sai7";
+        power-domains = <&pgc_audio>;
+        power-domain-names = "audio";
+        reg = <0x30e20000 0x10000>;
+    };
+
+...
-- 
2.35.1

