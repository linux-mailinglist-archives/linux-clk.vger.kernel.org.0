Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0BFBB3E95
	for <lists+linux-clk@lfdr.de>; Mon, 16 Sep 2019 18:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389788AbfIPQPV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Sep 2019 12:15:21 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34625 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389786AbfIPQPU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Sep 2019 12:15:20 -0400
Received: by mail-pl1-f196.google.com with SMTP id d3so113941plr.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2019 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=klfCMSt7jESV3x0ypDMgiUBLr/uboYQpHdjbWUnIcx4=;
        b=kqKUhGFnK7PiW1lIk2W46lvM6hutZ+vVtqkEC9+VB4hh8gIJezFH1gAWXKtNH22Y+g
         M9hqgqc0p/30fu2L0wM4SYlyWTfD+lyJ9wowRlRhwE0xvT+gJ2ldPJIyyOfaRfJYfehL
         W5j4r9nr0vpbP5mtCjsDLMrAwRRIJWTaPTajOAEn+NvhcZ9OSjStQXwx8NTUxGf1wIru
         Jkv+2Wkg/75q6BX5s1A0fu8VECiPPu6Rdw1h8Vo8Q5YahotRZVWnX8/AbHr9Z83xAUd8
         0bYKcEu3ayLob4xTgsh3q4gnUy1yKOrd55VkOtE2VvQSkGQMgwbKOu7J7Z5e1buN4SWs
         Kqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=klfCMSt7jESV3x0ypDMgiUBLr/uboYQpHdjbWUnIcx4=;
        b=dDK759I5iaGXk8NJngZ1dyiZk/7rBIVBVJFBhzXho2dDor5Z68JA34wtZFgdOVHENN
         DXSgTeK72y9WE+ElOlJisKOkmf0NOEA8+W+yBSI0s09tP5jBsttaROKBdqz3014lsJdD
         RBwW6qIX3h6B0f2UOIBfxW4bYOgkzN0OO7PJ0mmfALqEY5exBKiyJOofvBM/SH50ABrY
         PBKpEq1Szg9pQM0VKoD1aGoN8ymF07By8MACgOKsEUUZk99nifUpoDOO+d65ADwJ7xfC
         1bCrwYEsykfxVbNa1bMP5sh0DwYrRx0toR7c1fMDP0nOGFzbRymto6KUPYAfldXgf1VL
         3tsg==
X-Gm-Message-State: APjAAAVJ14ZDrGNolyfuQw6O4rIK5JrVVm88AhqwbOgki1sLK89Yi7FQ
        lqEHAQdmTa4oeq9fqK54GB0j
X-Google-Smtp-Source: APXvYqxjhtNhdJLtMMoSfB2eWfekEsCcYzrdYDoMUPMVee8IeUpFn+JrWkIOU5rzsDbuRSjYdtC9Tg==
X-Received: by 2002:a17:902:9347:: with SMTP id g7mr648639plp.0.1568650520121;
        Mon, 16 Sep 2019 09:15:20 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:90b:91ce:94c2:ef93:5bd:cfe8])
        by smtp.gmail.com with ESMTPSA id h66sm614134pjb.0.2019.09.16.09.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 09:15:19 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 4/8] dt-bindings: clock: Add devicetree binding for BM1880 SoC
Date:   Mon, 16 Sep 2019 21:44:43 +0530
Message-Id: <20190916161447.32715-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
References: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add YAML devicetree binding for Bitmain BM1880 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/clock/bitmain,bm1880-clk.yaml    | 76 +++++++++++++++++
 include/dt-bindings/clock/bm1880-clock.h      | 82 +++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
 create mode 100644 include/dt-bindings/clock/bm1880-clock.h

diff --git a/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml b/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
new file mode 100644
index 000000000000..e63827399c1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/bitmain,bm1880-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bitmain BM1880 Clock Controller
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  The Bitmain BM1880 clock controller generates and supplies clock to
+  various peripherals within the SoC.
+
+  This binding uses common clock bindings
+  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+properties:
+  compatible:
+    const: bitmain,bm1880-clk
+
+  reg:
+    items:
+      - description: pll registers
+      - description: system registers
+
+  reg-names:
+    items:
+      - const: pll
+      - const: sys
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: osc
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  # Clock controller node:
+  - |
+    clk: clock-controller@e8 {
+        compatible = "bitmain,bm1880-clk";
+        reg = <0xe8 0x0c>, <0x800 0xb0>;
+        reg-names = "pll", "sys";
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+    };
+
+  # Example UART controller node that consumes clock generated by the clock controller:
+  - |
+    uart0: serial@58018000 {
+         compatible = "snps,dw-apb-uart";
+         reg = <0x0 0x58018000 0x0 0x2000>;
+         clocks = <&clk 45>, <&clk 46>;
+         clock-names = "baudclk", "apb_pclk";
+         interrupts = <0 9 4>;
+         reg-shift = <2>;
+         reg-io-width = <4>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/bm1880-clock.h b/include/dt-bindings/clock/bm1880-clock.h
new file mode 100644
index 000000000000..b46732361b25
--- /dev/null
+++ b/include/dt-bindings/clock/bm1880-clock.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Device Tree binding constants for Bitmain BM1880 SoC
+ *
+ * Copyright (c) 2019 Linaro Ltd.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_BM1880_H
+#define __DT_BINDINGS_CLOCK_BM1880_H
+
+#define BM1880_CLK_OSC			0
+#define BM1880_CLK_MPLL			1
+#define BM1880_CLK_SPLL			2
+#define BM1880_CLK_FPLL			3
+#define BM1880_CLK_DDRPLL		4
+#define BM1880_CLK_A53			5
+#define BM1880_CLK_50M_A53		6
+#define BM1880_CLK_AHB_ROM		7
+#define BM1880_CLK_AXI_SRAM		8
+#define BM1880_CLK_DDR_AXI		9
+#define BM1880_CLK_EFUSE		10
+#define BM1880_CLK_APB_EFUSE		11
+#define BM1880_CLK_AXI5_EMMC		12
+#define BM1880_CLK_EMMC			13
+#define BM1880_CLK_100K_EMMC		14
+#define BM1880_CLK_AXI5_SD		15
+#define BM1880_CLK_SD			16
+#define BM1880_CLK_100K_SD		17
+#define BM1880_CLK_500M_ETH0		18
+#define BM1880_CLK_AXI4_ETH0		19
+#define BM1880_CLK_500M_ETH1		20
+#define BM1880_CLK_AXI4_ETH1		21
+#define BM1880_CLK_AXI1_GDMA		22
+#define BM1880_CLK_APB_GPIO		23
+#define BM1880_CLK_APB_GPIO_INTR	24
+#define BM1880_CLK_GPIO_DB		25
+#define BM1880_CLK_AXI1_MINER		26
+#define BM1880_CLK_AHB_SF		27
+#define BM1880_CLK_SDMA_AXI		28
+#define BM1880_CLK_SDMA_AUD		29
+#define BM1880_CLK_APB_I2C		30
+#define BM1880_CLK_APB_WDT		31
+#define BM1880_CLK_APB_JPEG		32
+#define BM1880_CLK_JPEG_AXI		33
+#define BM1880_CLK_AXI5_NF		34
+#define BM1880_CLK_APB_NF		35
+#define BM1880_CLK_NF			36
+#define BM1880_CLK_APB_PWM		37
+#define BM1880_CLK_DIV_0_RV		38
+#define BM1880_CLK_DIV_1_RV		39
+#define BM1880_CLK_MUX_RV		40
+#define BM1880_CLK_RV			41
+#define BM1880_CLK_APB_SPI		42
+#define BM1880_CLK_TPU_AXI		43
+#define BM1880_CLK_DIV_UART_500M	44
+#define BM1880_CLK_UART_500M		45
+#define BM1880_CLK_APB_UART		46
+#define BM1880_CLK_APB_I2S		47
+#define BM1880_CLK_AXI4_USB		48
+#define BM1880_CLK_APB_USB		49
+#define BM1880_CLK_125M_USB		50
+#define BM1880_CLK_33K_USB		51
+#define BM1880_CLK_DIV_12M_USB		52
+#define BM1880_CLK_12M_USB		53
+#define BM1880_CLK_APB_VIDEO		54
+#define BM1880_CLK_VIDEO_AXI		55
+#define BM1880_CLK_VPP_AXI		56
+#define BM1880_CLK_APB_VPP		57
+#define BM1880_CLK_DIV_0_AXI1		58
+#define BM1880_CLK_DIV_1_AXI1		59
+#define BM1880_CLK_AXI1			60
+#define BM1880_CLK_AXI2			61
+#define BM1880_CLK_AXI3			62
+#define BM1880_CLK_AXI4			63
+#define BM1880_CLK_AXI5			64
+#define BM1880_CLK_DIV_0_AXI6		65
+#define BM1880_CLK_DIV_1_AXI6		66
+#define BM1880_CLK_MUX_AXI6		67
+#define BM1880_CLK_AXI6			68
+#define BM1880_NR_CLKS			69
+
+#endif /* __DT_BINDINGS_CLOCK_BM1880_H */
-- 
2.17.1

