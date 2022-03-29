Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785D74EB29C
	for <lists+linux-clk@lfdr.de>; Tue, 29 Mar 2022 19:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240161AbiC2RXU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 29 Mar 2022 13:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240140AbiC2RXL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 13:23:11 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BC117B888;
        Tue, 29 Mar 2022 10:21:28 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id y10so21463464edv.7;
        Tue, 29 Mar 2022 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dDljKMlrQpXPG4bey5SGoE0JOK5HNsmM3vJrv4DzHk8=;
        b=F84MM+21itZIJycDiuMdu8cRoM0/VPKjKnCR+vfPdlqUtCWtm6Q3RucKsQNyeQm7+7
         pPBvlm61hZrEC7MYk9WJBGdUG0B+9ZWDJ1xf9Cw/vsLtVezZVwVBogyPYTwmqE/XTN6w
         xrB1+lfWeav59NEx0oJV6Mj6ipRlFXcEkpN1h6x0bhSXal2k8iM0eq2TGtWmv2YD+Exp
         7kJU+ROGJ+BXQTmrSA1HnusBUsLY4u59eNjQ3KggdhxiBx4dxrtXLTznp+9Mo8tyCo8B
         63ZAaHUMLi83PGnA2cyIJwSNkhp0MF3+c8tbCJMiihf/TXXzBgPTuk5N+w78PjGTgu6G
         i1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dDljKMlrQpXPG4bey5SGoE0JOK5HNsmM3vJrv4DzHk8=;
        b=Cqiq4iilzeol3U17046o3XW/wpCmzytf73LZcKTCk0UN9fZYE0k4ZeEYsVzosNVbsK
         pxbGI/d/Fkag5+fJ7bDkwdCTRHEBwTC8KfD9Q3dTOKH20s6+H9t3vFoNerEntwag1sd3
         MXIN8hrcOY5pvcxfVOG+ZAbzxDcjuHmsJi2oQ7WJO+sJUhRLcVr4cHA6NvkBOGIxGZuR
         tqvTRSG5IqISk/oiWxNsQ06rNN5S4trqZCI05qLqmnMxX9sLCAaGYNJC5Pxmcj47qznV
         GtAEZDMFeTZv2W8q/jFZXx9qcJp3KSN4OpTumIg+rYInGmvU38bEZfakCXNUXyTyBUwJ
         xBZA==
X-Gm-Message-State: AOAM5302MAy5bWojieW1Bx0okRwbdZlHcvIR++yWkCgcXVh0yRz0tMEB
        nA6sh0kZb71JUWXjt+2AbM4=
X-Google-Smtp-Source: ABdhPJxdmdkWpa+4lJWyFKErAHt0mYImapWztvdk0WoAkPdzBBiUyPLu+re9OSf1A0Lpr9XMZtQHLQ==
X-Received: by 2002:a50:a41a:0:b0:419:d2b:8391 with SMTP id u26-20020a50a41a000000b004190d2b8391mr5948365edb.390.1648574486790;
        Tue, 29 Mar 2022 10:21:26 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id d4-20020a056402000400b00412d60fee38sm8707089edu.11.2022.03.29.10.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 10:21:26 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de, zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: clock: convert rockchip,rk3368-cru.txt to YAML
Date:   Tue, 29 Mar 2022 19:21:19 +0200
Message-Id: <20220329172120.30328-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Current dts files with RK3368 'cru' nodes are manually verified.
In order to automate this process rockchip,rk3368-cru.txt has to be
converted to YAML.

Changed:
  Add properties to fix notifications by clocks.yaml for example:
    clocks
    clock-names

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../bindings/clock/rockchip,rk3368-cru.txt    | 61 ---------------
 .../bindings/clock/rockchip,rk3368-cru.yaml   | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.txt
deleted file mode 100644
index 7c8bbcfed..000000000
--- a/Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-* Rockchip RK3368 Clock and Reset Unit
-
-The RK3368 clock controller generates and supplies clock to various
-controllers within the SoC and also implements a reset controller for SoC
-peripherals.
-
-Required Properties:
-
-- compatible: should be "rockchip,rk3368-cru"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- #clock-cells: should be 1.
-- #reset-cells: should be 1.
-
-Optional Properties:
-
-- rockchip,grf: phandle to the syscon managing the "general register files"
-  If missing, pll rates are not changeable, due to the missing pll lock status.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. All available clocks are defined as
-preprocessor macros in the dt-bindings/clock/rk3368-cru.h headers and can be
-used in device tree sources. Similar macros exist for the reset sources in
-these files.
-
-External clocks:
-
-There are several clocks that are generated outside the SoC. It is expected
-that they are defined using standard clock bindings with following
-clock-output-names:
- - "xin24m" - crystal input - required,
- - "xin32k" - rtc clock - optional,
- - "ext_i2s" - external I2S clock - optional,
- - "ext_gmac" - external GMAC clock - optional
- - "ext_hsadc" - external HSADC clock - optional,
- - "ext_isp" - external ISP clock - optional,
- - "ext_jtag" - external JTAG clock - optional
- - "ext_vip" - external VIP clock - optional,
- - "usbotg_out" - output clock of the pll in the otg phy
-
-Example: Clock controller node:
-
-	cru: clock-controller@ff760000 {
-		compatible = "rockchip,rk3368-cru";
-		reg = <0x0 0xff760000 0x0 0x1000>;
-		rockchip,grf = <&grf>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
-
-Example: UART controller node that consumes the clock generated by the clock
-  controller:
-
-	uart0: serial@10124000 {
-		compatible = "snps,dw-apb-uart";
-		reg = <0x10124000 0x400>;
-		interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-		reg-shift = <2>;
-		reg-io-width = <1>;
-		clocks = <&cru SCLK_UART0>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.yaml
new file mode 100644
index 000000000..adb678777
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,rk3368-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3368 Clock and Reset Unit (CRU)
+
+maintainers:
+  - Elaine Zhang <zhangqing@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The RK3368 clock controller generates and supplies clocks to various
+  controllers within the SoC and also implements a reset controller for SoC
+  peripherals.
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All available clocks are defined as
+  preprocessor macros in the dt-bindings/clock/rk3368-cru.h headers and can be
+  used in device tree sources. Similar macros exist for the reset sources in
+  these files.
+  There are several clocks that are generated outside the SoC. It is expected
+  that they are defined using standard clock bindings with following
+  clock-output-names:
+    - "xin24m"     - crystal input                          - required
+    - "xin32k"     - rtc clock                              - optional
+    - "ext_i2s"    - external I2S clock                     - optional
+    - "ext_gmac"   - external GMAC clock                    - optional
+    - "ext_hsadc"  - external HSADC clock                   - optional
+    - "ext_isp"    - external ISP clock                     - optional
+    - "ext_jtag"   - external JTAG clock                    - optional
+    - "ext_vip"    - external VIP clock                     - optional
+    - "usbotg_out" - output clock of the pll in the otg phy
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3368-cru
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xin24m
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon managing the "general register files" (GRF),
+      if missing pll rates are not changeable, due to the missing pll
+      lock status.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    cru: clock-controller@ff760000 {
+      compatible = "rockchip,rk3368-cru";
+      reg = <0xff760000 0x1000>;
+      rockchip,grf = <&grf>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
-- 
2.20.1

