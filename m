Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66CDE6A739F
	for <lists+linux-clk@lfdr.de>; Wed,  1 Mar 2023 19:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjCASi3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 1 Mar 2023 13:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjCASi2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 13:38:28 -0500
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC782D67;
        Wed,  1 Mar 2023 10:38:26 -0800 (PST)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
        by mx.sberdevices.ru (Postfix) with ESMTP id 210825FD7D;
        Wed,  1 Mar 2023 21:38:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
        s=mail; t=1677695904;
        bh=yL115kgbMbWkaM7U3vr5gbAogShZkMVE274c2zrjsaw=;
        h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
        b=B3GDlAxX8Fs0S7XHDLfatTT3BcPKn0wRa/4y7aAg9QeGwz3fZR5e1H4k9ps6yQ5LV
         x4RwIYW0I/IAbmHpno3M7bZ/duCnM3THJAKWOC9NlFBQXtJfrRxwvdpA1yd5nGToOv
         whtpmV/yMaQJRFA2L2FBlUzbfHXZeEjIZ2pTdgzRV3eKBlwJ1Ily2MRcfCD6YViagU
         esvX+ny6Oyo52F7+F1sPsC98yUqNGMGBO/FnoPQAkEFsR+kpcFZfAJDQs+Ta/I/WcG
         kc6EVXmnR7/t0Wt7TcyVvAsc7PZWh+sFc8UixkW6OpzHvxvMb23u5lJvzoKasGuVWD
         QcJlseolgnLZg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
        by mx.sberdevices.ru (Postfix) with ESMTP;
        Wed,  1 Mar 2023 21:38:24 +0300 (MSK)
From:   Dmitry Rokosov <ddrokosov@sberdevices.ru>
To:     <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC:     <jian.hu@amlogic.com>, <kernel@sberdevices.ru>,
        <rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v9 5/5] dt-bindings: clock: meson: add A1 Peripherals clock controller bindings
Date:   Wed, 1 Mar 2023 21:37:59 +0300
Message-ID: <20230301183759.16163-6-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/01 14:15:00 #20905952
X-KSMG-AntiVirus-Status: Clean, skipped
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the documentation for Amlogic A1 Peripherals clock driver,
and A1 Peripherals clock controller bindings.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++++
 include/dt-bindings/clock/a1-clkc.h           | 102 ++++++++++++++++++
 2 files changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
 create mode 100644 include/dt-bindings/clock/a1-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
new file mode 100644
index 000000000000..3dc86e912dea
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson A/C serials Peripheral Clock Control Unit
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jian Hu <jian.hu@jian.hu.com>
+  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
+
+properties:
+  compatible:
+    const: amlogic,a1-clkc
+
+  '#clock-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input fixed pll div2
+      - description: input fixed pll div3
+      - description: input fixed pll div5
+      - description: input fixed pll div7
+      - description: input hifi pll
+      - description: input oscillator (usually at 24MHz)
+
+  clock-names:
+    items:
+      - const: fclk_div2
+      - const: fclk_div3
+      - const: fclk_div5
+      - const: fclk_div7
+      - const: hifi_pll
+      - const: xtal
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/a1-pll-clkc.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@800 {
+            compatible = "amlogic,a1-clkc";
+            reg = <0 0x800 0 0x104>;
+            #clock-cells = <1>;
+            clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+                     <&clkc_pll CLKID_FCLK_DIV3>,
+                     <&clkc_pll CLKID_FCLK_DIV5>,
+                     <&clkc_pll CLKID_FCLK_DIV7>,
+                     <&clkc_pll CLKID_HIFI_PLL>,
+                     <&xtal>;
+            clock-names = "fclk_div2", "fclk_div3",
+                          "fclk_div5", "fclk_div7",
+                          "hifi_pll", "xtal";
+        };
+    };
diff --git a/include/dt-bindings/clock/a1-clkc.h b/include/dt-bindings/clock/a1-clkc.h
new file mode 100644
index 000000000000..271eefb989f3
--- /dev/null
+++ b/include/dt-bindings/clock/a1-clkc.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
+ * Author: Jian Hu <jian.hu@amlogic.com>
+ *
+ * Copyright (c) 2023, SberDevices. All Rights Reserved.
+ * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
+ */
+
+#ifndef __A1_CLKC_H
+#define __A1_CLKC_H
+
+#define CLKID_FIXPLL_IN		1
+#define CLKID_USB_PHY_IN	2
+#define CLKID_USB_CTRL_IN	3
+#define CLKID_HIFIPLL_IN	4
+#define CLKID_SYSPLL_IN		5
+#define CLKID_DDS_IN		6
+#define CLKID_SYS		7
+#define CLKID_CLKTREE		8
+#define CLKID_RESET_CTRL	9
+#define CLKID_ANALOG_CTRL	10
+#define CLKID_PWR_CTRL		11
+#define CLKID_PAD_CTRL		12
+#define CLKID_SYS_CTRL		13
+#define CLKID_TEMP_SENSOR	14
+#define CLKID_AM2AXI_DIV	15
+#define CLKID_SPICC_B		16
+#define CLKID_SPICC_A		17
+#define CLKID_MSR		18
+#define CLKID_AUDIO		19
+#define CLKID_JTAG_CTRL		20
+#define CLKID_SARADC_EN		21
+#define CLKID_PWM_EF		22
+#define CLKID_PWM_CD		23
+#define CLKID_PWM_AB		24
+#define CLKID_CEC		25
+#define CLKID_I2C_S		26
+#define CLKID_IR_CTRL		27
+#define CLKID_I2C_M_D		28
+#define CLKID_I2C_M_C		29
+#define CLKID_I2C_M_B		30
+#define CLKID_I2C_M_A		31
+#define CLKID_ACODEC		32
+#define CLKID_OTP		33
+#define CLKID_SD_EMMC_A		34
+#define CLKID_USB_PHY		35
+#define CLKID_USB_CTRL		36
+#define CLKID_SYS_DSPB		37
+#define CLKID_SYS_DSPA		38
+#define CLKID_DMA		39
+#define CLKID_IRQ_CTRL		40
+#define CLKID_NIC		41
+#define CLKID_GIC		42
+#define CLKID_UART_C		43
+#define CLKID_UART_B		44
+#define CLKID_UART_A		45
+#define CLKID_SYS_PSRAM		46
+#define CLKID_RSA		47
+#define CLKID_CORESIGHT		48
+#define CLKID_AM2AXI_VAD	49
+#define CLKID_AUDIO_VAD		50
+#define CLKID_AXI_DMC		51
+#define CLKID_AXI_PSRAM		52
+#define CLKID_RAMB		53
+#define CLKID_RAMA		54
+#define CLKID_AXI_SPIFC		55
+#define CLKID_AXI_NIC		56
+#define CLKID_AXI_DMA		57
+#define CLKID_CPU_CTRL		58
+#define CLKID_ROM		59
+#define CLKID_PROC_I2C		60
+#define CLKID_DSPA_SEL		61
+#define CLKID_DSPB_SEL		62
+#define CLKID_DSPA_EN		63
+#define CLKID_DSPA_EN_NIC	64
+#define CLKID_DSPB_EN		65
+#define CLKID_DSPB_EN_NIC	66
+#define CLKID_RTC		67
+#define CLKID_CECA_32K		68
+#define CLKID_CECB_32K		69
+#define CLKID_24M		70
+#define CLKID_12M		71
+#define CLKID_FCLK_DIV2_DIVN	72
+#define CLKID_GEN		73
+#define CLKID_SARADC_SEL	74
+#define CLKID_SARADC		75
+#define CLKID_PWM_A		76
+#define CLKID_PWM_B		77
+#define CLKID_PWM_C		78
+#define CLKID_PWM_D		79
+#define CLKID_PWM_E		80
+#define CLKID_PWM_F		81
+#define CLKID_SPICC		82
+#define CLKID_TS		83
+#define CLKID_SPIFC		84
+#define CLKID_USB_BUS		85
+#define CLKID_SD_EMMC		86
+#define CLKID_PSRAM		87
+#define CLKID_DMC		88
+
+#endif /* __A1_CLKC_H */
-- 
2.36.0

