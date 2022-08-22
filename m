Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2755859C2BA
	for <lists+linux-clk@lfdr.de>; Mon, 22 Aug 2022 17:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236506AbiHVP2f (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Aug 2022 11:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236584AbiHVP2T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 11:28:19 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5063F6580
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 08:27:31 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id n7so13672072wrv.4
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dtAS93OmXPOAcXAxzaEqhxkL2dBzcreXYkF96DkLZWg=;
        b=MjPpzDSsN43ju2unOiTJT9J2eAgq3/9vt+YzJGpZIfARZO6sO1radYH4jR1zSeE9Qg
         lR8v66uNnHmd+YF6ZQsWHnIGuKTETBDGXYrJycjuFXJTsAKtAnxFn5/PcANuIWrBPtD7
         /0ag+DsmQk6Pstim2LaQ/xxwuJFg5VTg+T9wvSGDo+DG5KjNbcbb4U5Wj75aScf9t6yu
         l9WvRBKAavGEo2cCxPVHuINgFDQBMF9hVgBnffb8MbHSOfugQr6ywBemSXgDuXqQTMB2
         oXncWWa+A5nxrAMkZMNy2oYvNBTmRt6Mb//02n/RFVadwVGoUGPCqHzxP6MUIgPIjmZH
         Zd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dtAS93OmXPOAcXAxzaEqhxkL2dBzcreXYkF96DkLZWg=;
        b=nQMm+NxEs4AzOFwm1x59cZ6RZib4d66zgDrNW07v0HvoncIAOOgN4RIcwmP+zfkWGm
         475mDk1kP/AsXsG1D8F/dgQhWTKaeglxbSF/5GshLB7nQJp2itDorr8MmHtWE/BQVdSX
         BUECuSG15kutAmwZ16IUkSbys0I5Hq9yy/sPR2U5h0AofQKF0KCafccVzRZG9+1gJZO3
         v9SQFOXOmF6VqWJhjsog+5NkOZTAJJm7QDzWkKMggHnO8rJwuDsdvj+wEzwUEYtiuoED
         rrxEnLrJLBCg7EpbDKh8FqLXs2L7OYc6CJ34HtFrf5FOTpcPHVs9KpEa3mEJHj/ZziBJ
         QzHw==
X-Gm-Message-State: ACgBeo16N9aczdyklVrcYFoQAlM5AUWMvDI+ysgtadCTfAOc2KuvguN2
        2k9rwBkDU8LkdBlWJ/1PAM7oAw==
X-Google-Smtp-Source: AA6agR6HU7QHnCUzUpHHlnYEQ+DWxB82mXAwj+M6DvHAUfk+HnzUQOfKDCQ5ErkbmDr6cUEMB+xNtA==
X-Received: by 2002:a5d:6f0f:0:b0:225:5589:576f with SMTP id ay15-20020a5d6f0f000000b002255589576fmr3786048wrb.607.1661182049854;
        Mon, 22 Aug 2022 08:27:29 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdb92000000b0021eaf4138aesm14492011wri.108.2022.08.22.08.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:29 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fabien Parent <parent.f@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 1/4] dt-bindings: clock: mediatek: add bindings for MT8365 SoC
Date:   Mon, 22 Aug 2022 17:26:49 +0200
Message-Id: <20220822152652.3499972-2-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822152652.3499972-1-msp@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Fabien Parent <fparent@baylibre.com>

Add the clock bindings for the MediaTek MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes in v4:
    - Remove unnecessary quotes from $id and $schema
    - Add myself as maintainer
    - Dual-licensed mediatek,mt8365-clk.h

 .../bindings/clock/mediatek,mt8365-clock.yaml |  42 ++
 .../clock/mediatek,mt8365-sys-clock.yaml      |  47 +++
 .../dt-bindings/clock/mediatek,mt8365-clk.h   | 373 ++++++++++++++++++
 3 files changed, 462 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
 create mode 100644 include/dt-bindings/clock/mediatek,mt8365-clk.h

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
new file mode 100644
index 000000000000..b327ecb4e524
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt8365-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Functional Clock Controller for MT8365
+
+maintainers:
+  - Markus Schneider-Pargmann <msp@baylibre.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8365-apu
+          - mediatek,mt8365-imgsys
+          - mediatek,mt8365-mfgcfg
+          - mediatek,mt8365-vdecsys
+          - mediatek,mt8365-vencsys
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    apu: clock-controller@19020000 {
+        compatible = "mediatek,mt8365-apu", "syscon";
+        reg = <0x19020000 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
new file mode 100644
index 000000000000..643f84660c8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt8365-sys-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek System Clock Controller for MT8365
+
+maintainers:
+  - Markus Schneider-Pargmann <msp@baylibre.com>
+
+description:
+  The apmixedsys module provides most of PLLs which generated from SoC 26m.
+  The topckgen provides dividers and muxes which provides the clock source to other IP blocks.
+  The infracfg_ao and pericfg_ao provides clock gate in peripheral and infrastructure IP blocks.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8365-topckgen
+          - mediatek,mt8365-infracfg
+          - mediatek,mt8365-apmixedsys
+          - mediatek,mt8365-pericfg
+          - mediatek,mt8365-mcucfg
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    topckgen: clock-controller@10000000 {
+        compatible = "mediatek,mt8365-topckgen", "syscon";
+        reg = <0x10000000 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/mediatek,mt8365-clk.h b/include/dt-bindings/clock/mediatek,mt8365-clk.h
new file mode 100644
index 000000000000..f9aff1775810
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt8365-clk.h
@@ -0,0 +1,373 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef _DT_BINDINGS_CLK_MT8365_H
+#define _DT_BINDINGS_CLK_MT8365_H
+
+/* TOPCKGEN */
+#define CLK_TOP_CLK_NULL		0
+#define CLK_TOP_I2S0_BCK		1
+#define CLK_TOP_DSI0_LNTC_DSICK		2
+#define CLK_TOP_VPLL_DPIX		3
+#define CLK_TOP_LVDSTX_CLKDIG_CTS	4
+#define CLK_TOP_MFGPLL			5
+#define CLK_TOP_SYSPLL_D2		6
+#define CLK_TOP_SYSPLL1_D2		7
+#define CLK_TOP_SYSPLL1_D4		8
+#define CLK_TOP_SYSPLL1_D8		9
+#define CLK_TOP_SYSPLL1_D16		10
+#define CLK_TOP_SYSPLL_D3		11
+#define CLK_TOP_SYSPLL2_D2		12
+#define CLK_TOP_SYSPLL2_D4		13
+#define CLK_TOP_SYSPLL2_D8		14
+#define CLK_TOP_SYSPLL_D5		15
+#define CLK_TOP_SYSPLL3_D2		16
+#define CLK_TOP_SYSPLL3_D4		17
+#define CLK_TOP_SYSPLL_D7		18
+#define CLK_TOP_SYSPLL4_D2		19
+#define CLK_TOP_SYSPLL4_D4		20
+#define CLK_TOP_UNIVPLL			21
+#define CLK_TOP_UNIVPLL_D2		22
+#define CLK_TOP_UNIVPLL1_D2		23
+#define CLK_TOP_UNIVPLL1_D4		24
+#define CLK_TOP_UNIVPLL_D3		25
+#define CLK_TOP_UNIVPLL2_D2		26
+#define CLK_TOP_UNIVPLL2_D4		27
+#define CLK_TOP_UNIVPLL2_D8		28
+#define CLK_TOP_UNIVPLL2_D32		29
+#define CLK_TOP_UNIVPLL_D5		30
+#define CLK_TOP_UNIVPLL3_D2		31
+#define CLK_TOP_UNIVPLL3_D4		32
+#define CLK_TOP_MMPLL			33
+#define CLK_TOP_MMPLL_D2		34
+#define CLK_TOP_LVDSPLL_D2		35
+#define CLK_TOP_LVDSPLL_D4		36
+#define CLK_TOP_LVDSPLL_D8		37
+#define CLK_TOP_LVDSPLL_D16		38
+#define CLK_TOP_USB20_192M		39
+#define CLK_TOP_USB20_192M_D4		40
+#define CLK_TOP_USB20_192M_D8		41
+#define CLK_TOP_USB20_192M_D16		42
+#define CLK_TOP_USB20_192M_D32		43
+#define CLK_TOP_APLL1			44
+#define CLK_TOP_APLL1_D2		45
+#define CLK_TOP_APLL1_D4		46
+#define CLK_TOP_APLL1_D8		47
+#define CLK_TOP_APLL2			48
+#define CLK_TOP_APLL2_D2		49
+#define CLK_TOP_APLL2_D4		50
+#define CLK_TOP_APLL2_D8		51
+#define CLK_TOP_SYS_26M_D2		52
+#define CLK_TOP_MSDCPLL			53
+#define CLK_TOP_MSDCPLL_D2		54
+#define CLK_TOP_DSPPLL			55
+#define CLK_TOP_DSPPLL_D2		56
+#define CLK_TOP_DSPPLL_D4		57
+#define CLK_TOP_DSPPLL_D8		58
+#define CLK_TOP_APUPLL			59
+#define CLK_TOP_CLK26M_D52		60
+#define CLK_TOP_AXI_SEL			61
+#define CLK_TOP_MEM_SEL			62
+#define CLK_TOP_MM_SEL			63
+#define CLK_TOP_SCP_SEL			64
+#define CLK_TOP_MFG_SEL			65
+#define CLK_TOP_ATB_SEL			66
+#define CLK_TOP_CAMTG_SEL		67
+#define CLK_TOP_CAMTG1_SEL		68
+#define CLK_TOP_UART_SEL		69
+#define CLK_TOP_SPI_SEL			70
+#define CLK_TOP_MSDC50_0_HC_SEL		71
+#define CLK_TOP_MSDC2_2_HC_SEL		72
+#define CLK_TOP_MSDC50_0_SEL		73
+#define CLK_TOP_MSDC50_2_SEL		74
+#define CLK_TOP_MSDC30_1_SEL		75
+#define CLK_TOP_AUDIO_SEL		76
+#define CLK_TOP_AUD_INTBUS_SEL		77
+#define CLK_TOP_AUD_1_SEL		78
+#define CLK_TOP_AUD_2_SEL		79
+#define CLK_TOP_AUD_ENGEN1_SEL		80
+#define CLK_TOP_AUD_ENGEN2_SEL		81
+#define CLK_TOP_AUD_SPDIF_SEL		82
+#define CLK_TOP_DISP_PWM_SEL		83
+#define CLK_TOP_DXCC_SEL		84
+#define CLK_TOP_SSUSB_SYS_SEL		85
+#define CLK_TOP_SSUSB_XHCI_SEL		86
+#define CLK_TOP_SPM_SEL			87
+#define CLK_TOP_I2C_SEL			88
+#define CLK_TOP_PWM_SEL			89
+#define CLK_TOP_SENIF_SEL		90
+#define CLK_TOP_AES_FDE_SEL		91
+#define CLK_TOP_CAMTM_SEL		92
+#define CLK_TOP_DPI0_SEL		93
+#define CLK_TOP_DPI1_SEL		94
+#define CLK_TOP_DSP_SEL			95
+#define CLK_TOP_NFI2X_SEL		96
+#define CLK_TOP_NFIECC_SEL		97
+#define CLK_TOP_ECC_SEL			98
+#define CLK_TOP_ETH_SEL			99
+#define CLK_TOP_GCPU_SEL		100
+#define CLK_TOP_GCPU_CPM_SEL		101
+#define CLK_TOP_APU_SEL			102
+#define CLK_TOP_APU_IF_SEL		103
+#define CLK_TOP_MBIST_DIAG_SEL		104
+#define CLK_TOP_APLL_I2S0_SEL		105
+#define CLK_TOP_APLL_I2S1_SEL		106
+#define CLK_TOP_APLL_I2S2_SEL		107
+#define CLK_TOP_APLL_I2S3_SEL		108
+#define CLK_TOP_APLL_TDMOUT_SEL		109
+#define CLK_TOP_APLL_TDMIN_SEL		110
+#define CLK_TOP_APLL_SPDIF_SEL		111
+#define CLK_TOP_APLL12_CK_DIV0		112
+#define CLK_TOP_APLL12_CK_DIV1		113
+#define CLK_TOP_APLL12_CK_DIV2		114
+#define CLK_TOP_APLL12_CK_DIV3		115
+#define CLK_TOP_APLL12_CK_DIV4		116
+#define CLK_TOP_APLL12_CK_DIV4B		117
+#define CLK_TOP_APLL12_CK_DIV5		118
+#define CLK_TOP_APLL12_CK_DIV5B		119
+#define CLK_TOP_APLL12_CK_DIV6		120
+#define CLK_TOP_AUD_I2S0_M		121
+#define CLK_TOP_AUD_I2S1_M		122
+#define CLK_TOP_AUD_I2S2_M		123
+#define CLK_TOP_AUD_I2S3_M		124
+#define CLK_TOP_AUD_TDMOUT_M		125
+#define CLK_TOP_AUD_TDMOUT_B		126
+#define CLK_TOP_AUD_TDMIN_M		127
+#define CLK_TOP_AUD_TDMIN_B		128
+#define CLK_TOP_AUD_SPDIF_M		129
+#define CLK_TOP_USB20_48M_EN		130
+#define CLK_TOP_UNIVPLL_48M_EN		131
+#define CLK_TOP_LVDSTX_CLKDIG_EN	132
+#define CLK_TOP_VPLL_DPIX_EN		133
+#define CLK_TOP_SSUSB_TOP_CK_EN		134
+#define CLK_TOP_SSUSB_PHY_CK_EN		135
+#define CLK_TOP_CONN_32K		136
+#define CLK_TOP_CONN_26M		137
+#define CLK_TOP_DSP_32K			138
+#define CLK_TOP_DSP_26M			139
+#define CLK_TOP_NR_CLK			140
+
+/* INFRACFG */
+#define CLK_IFR_PMIC_TMR		0
+#define CLK_IFR_PMIC_AP			1
+#define CLK_IFR_PMIC_MD			2
+#define CLK_IFR_PMIC_CONN		3
+#define CLK_IFR_ICUSB			4
+#define CLK_IFR_GCE			5
+#define CLK_IFR_THERM			6
+#define CLK_IFR_PWM_HCLK		7
+#define CLK_IFR_PWM1			8
+#define CLK_IFR_PWM2			9
+#define CLK_IFR_PWM3			10
+#define CLK_IFR_PWM4			11
+#define CLK_IFR_PWM5			12
+#define CLK_IFR_PWM			13
+#define CLK_IFR_UART0			14
+#define CLK_IFR_UART1			15
+#define CLK_IFR_UART2			16
+#define CLK_IFR_DSP_UART		17
+#define CLK_IFR_GCE_26M			18
+#define CLK_IFR_CQ_DMA_FPC		19
+#define CLK_IFR_BTIF			20
+#define CLK_IFR_SPI0			21
+#define CLK_IFR_MSDC0_HCLK		22
+#define CLK_IFR_MSDC2_HCLK		23
+#define CLK_IFR_MSDC1_HCLK		24
+#define CLK_IFR_DVFSRC			25
+#define CLK_IFR_GCPU			26
+#define CLK_IFR_TRNG			27
+#define CLK_IFR_AUXADC			28
+#define CLK_IFR_CPUM			29
+#define CLK_IFR_AUXADC_MD		30
+#define CLK_IFR_AP_DMA			31
+#define CLK_IFR_DEBUGSYS		32
+#define CLK_IFR_AUDIO			33
+#define CLK_IFR_PWM_FBCLK6		34
+#define CLK_IFR_DISP_PWM		35
+#define CLK_IFR_AUD_26M_BK		36
+#define CLK_IFR_CQ_DMA			37
+#define CLK_IFR_MSDC0_SF		38
+#define CLK_IFR_MSDC1_SF		39
+#define CLK_IFR_MSDC2_SF		40
+#define CLK_IFR_AP_MSDC0		41
+#define CLK_IFR_MD_MSDC0		42
+#define CLK_IFR_MSDC0_SRC		43
+#define CLK_IFR_MSDC1_SRC		44
+#define CLK_IFR_MSDC2_SRC		45
+#define CLK_IFR_PWRAP_TMR		46
+#define CLK_IFR_PWRAP_SPI		47
+#define CLK_IFR_PWRAP_SYS		48
+#define CLK_IFR_MCU_PM_BK		49
+#define CLK_IFR_IRRX_26M		50
+#define CLK_IFR_IRRX_32K		51
+#define CLK_IFR_I2C0_AXI		52
+#define CLK_IFR_I2C1_AXI		53
+#define CLK_IFR_I2C2_AXI		54
+#define CLK_IFR_I2C3_AXI		55
+#define CLK_IFR_NIC_AXI			56
+#define CLK_IFR_NIC_SLV_AXI		57
+#define CLK_IFR_APU_AXI			58
+#define CLK_IFR_NFIECC			59
+#define CLK_IFR_NFIECC_BK		60
+#define CLK_IFR_NFI1X_BK		61
+#define CLK_IFR_NFI_BK			62
+#define CLK_IFR_MSDC2_AP_BK		63
+#define CLK_IFR_MSDC2_MD_BK		64
+#define CLK_IFR_MSDC2_BK		65
+#define CLK_IFR_SUSB_133_BK		66
+#define CLK_IFR_SUSB_66_BK		67
+#define CLK_IFR_SSUSB_SYS		68
+#define CLK_IFR_SSUSB_REF		69
+#define CLK_IFR_SSUSB_XHCI		70
+#define CLK_IFR_NR_CLK			71
+
+/* PERICFG */
+#define CLK_PERIAXI			0
+#define CLK_PERI_NR_CLK			1
+
+/* APMIXEDSYS */
+#define CLK_APMIXED_ARMPLL		0
+#define CLK_APMIXED_MAINPLL		1
+#define CLK_APMIXED_UNIVPLL		2
+#define CLK_APMIXED_MFGPLL		3
+#define CLK_APMIXED_MSDCPLL		4
+#define CLK_APMIXED_MMPLL		5
+#define CLK_APMIXED_APLL1		6
+#define CLK_APMIXED_APLL2		7
+#define CLK_APMIXED_LVDSPLL		8
+#define CLK_APMIXED_DSPPLL		9
+#define CLK_APMIXED_APUPLL		10
+#define CLK_APMIXED_UNIV_EN		11
+#define CLK_APMIXED_USB20_EN		12
+#define CLK_APMIXED_NR_CLK		13
+
+/* GCE */
+#define CLK_GCE_FAXI			0
+#define CLK_GCE_NR_CLK			1
+
+/* AUDIOTOP */
+#define CLK_AUD_AFE			0
+#define CLK_AUD_I2S			1
+#define CLK_AUD_22M			2
+#define CLK_AUD_24M			3
+#define CLK_AUD_INTDIR			4
+#define CLK_AUD_APLL2_TUNER		5
+#define CLK_AUD_APLL_TUNER		6
+#define CLK_AUD_SPDF			7
+#define CLK_AUD_HDMI			8
+#define CLK_AUD_HDMI_IN			9
+#define CLK_AUD_ADC			10
+#define CLK_AUD_DAC			11
+#define CLK_AUD_DAC_PREDIS		12
+#define CLK_AUD_TML			13
+#define CLK_AUD_I2S1_BK			14
+#define CLK_AUD_I2S2_BK			15
+#define CLK_AUD_I2S3_BK			16
+#define CLK_AUD_I2S4_BK			17
+#define CLK_AUD_NR_CLK			18
+
+/* MIPI_CSI0A */
+#define CLK_MIPI0A_CSR_CSI_EN_0A	0
+#define CLK_MIPI_RX_ANA_CSI0A_NR_CLK	1
+
+/* MIPI_CSI0B */
+#define CLK_MIPI0B_CSR_CSI_EN_0B	0
+#define CLK_MIPI_RX_ANA_CSI0B_NR_CLK	1
+
+/* MIPI_CSI1A */
+#define CLK_MIPI1A_CSR_CSI_EN_1A	0
+#define CLK_MIPI_RX_ANA_CSI1A_NR_CLK	1
+
+/* MIPI_CSI1B */
+#define CLK_MIPI1B_CSR_CSI_EN_1B	0
+#define CLK_MIPI_RX_ANA_CSI1B_NR_CLK	1
+
+/* MIPI_CSI2A */
+#define CLK_MIPI2A_CSR_CSI_EN_2A	0
+#define CLK_MIPI_RX_ANA_CSI2A_NR_CLK	1
+
+/* MIPI_CSI2B */
+#define CLK_MIPI2B_CSR_CSI_EN_2B	0
+#define CLK_MIPI_RX_ANA_CSI2B_NR_CLK	1
+
+/* MCUCFG */
+#define CLK_MCU_BUS_SEL			0
+#define CLK_MCU_NR_CLK			1
+
+/* MFGCFG */
+#define CLK_MFG_BG3D			0
+#define CLK_MFG_MBIST_DIAG		1
+#define CLK_MFG_NR_CLK			2
+
+/* MMSYS */
+#define CLK_MM_MM_MDP_RDMA0		0
+#define CLK_MM_MM_MDP_CCORR0		1
+#define CLK_MM_MM_MDP_RSZ0		2
+#define CLK_MM_MM_MDP_RSZ1		3
+#define CLK_MM_MM_MDP_TDSHP0		4
+#define CLK_MM_MM_MDP_WROT0		5
+#define CLK_MM_MM_MDP_WDMA0		6
+#define CLK_MM_MM_DISP_OVL0		7
+#define CLK_MM_MM_DISP_OVL0_2L		8
+#define CLK_MM_MM_DISP_RSZ0		9
+#define CLK_MM_MM_DISP_RDMA0		10
+#define CLK_MM_MM_DISP_WDMA0		11
+#define CLK_MM_MM_DISP_COLOR0		12
+#define CLK_MM_MM_DISP_CCORR0		13
+#define CLK_MM_MM_DISP_AAL0		14
+#define CLK_MM_MM_DISP_GAMMA0		15
+#define CLK_MM_MM_DISP_DITHER0		16
+#define CLK_MM_MM_DSI0			17
+#define CLK_MM_MM_DISP_RDMA1		18
+#define CLK_MM_MM_MDP_RDMA1		19
+#define CLK_MM_DPI0_DPI0		20
+#define CLK_MM_MM_FAKE			21
+#define CLK_MM_MM_SMI_COMMON		22
+#define CLK_MM_MM_SMI_LARB0		23
+#define CLK_MM_MM_SMI_COMM0		24
+#define CLK_MM_MM_SMI_COMM1		25
+#define CLK_MM_MM_CAM_MDP		26
+#define CLK_MM_MM_SMI_IMG		27
+#define CLK_MM_MM_SMI_CAM		28
+#define CLK_MM_IMG_IMG_DL_RELAY		29
+#define CLK_MM_IMG_IMG_DL_ASYNC_TOP	30
+#define CLK_MM_DSI0_DIG_DSI		31
+#define CLK_MM_26M_HRTWT		32
+#define CLK_MM_MM_DPI0			33
+#define CLK_MM_LVDSTX_PXL		34
+#define CLK_MM_LVDSTX_CTS		35
+#define CLK_MM_NR_CLK			36
+
+/* IMGSYS */
+#define CLK_CAM_LARB2			0
+#define CLK_CAM				1
+#define CLK_CAMTG			2
+#define CLK_CAM_SENIF			3
+#define CLK_CAMSV0			4
+#define CLK_CAMSV1			5
+#define CLK_CAM_FDVT			6
+#define CLK_CAM_WPE			7
+#define CLK_CAM_NR_CLK			8
+
+/* VDECSYS */
+#define CLK_VDEC_VDEC			0
+#define CLK_VDEC_LARB1			1
+#define CLK_VDEC_NR_CLK			2
+
+/* VENCSYS */
+#define CLK_VENC			0
+#define CLK_VENC_JPGENC			1
+#define CLK_VENC_NR_CLK			2
+
+/* APUSYS */
+#define CLK_APU_IPU_CK			0
+#define CLK_APU_AXI			1
+#define CLK_APU_JTAG			2
+#define CLK_APU_IF_CK			3
+#define CLK_APU_EDMA			4
+#define CLK_APU_AHB			5
+#define CLK_APU_NR_CLK			6
+
+#endif /* _DT_BINDINGS_CLK_MT8365_H */
-- 
2.37.2

