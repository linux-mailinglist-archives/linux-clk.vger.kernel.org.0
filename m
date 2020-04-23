Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D31EB1B523D
	for <lists+linux-clk@lfdr.de>; Thu, 23 Apr 2020 04:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgDWCEo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 Apr 2020 22:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgDWCEl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Apr 2020 22:04:41 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40737C03C1AA
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2020 19:04:41 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h2so4679267wmb.4
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2020 19:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PXsxej4a8qqwz/sfWnqPjxxFcWxvfDf5r8RVd8jOHBY=;
        b=F18pfPNTF7ApImBneOgNukS/R1M6/pFbVbk/GQb1BKJwUujDP5S2/2a2dTChLsV0I1
         Q1gKgWOLf0q+i7XuGwxMlXmoM/Fp7eoDCD7RE7lCH8QCy+o0WfWpzTDUGMao4+ALUALH
         87Hm6uMKha1+fb6dKbNjQ5TrsNAqjMJjc3c0kHmKfAbpTwaaORAipg3YKVD7gzPyYj6y
         b2Rotc+Sg9TdEtLFWMhnbvGgoxlA3JtyLycnA+dOWIvChYmRz9SO1pzakxfmtly1oGEz
         NByfAmujA7XjS1qNQX2/aAOVsNPMoBKEZoL1fR/qz4Rga6BI7kZZBrkxBzvQ+aSfTO8F
         Svxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PXsxej4a8qqwz/sfWnqPjxxFcWxvfDf5r8RVd8jOHBY=;
        b=jA2eiQos7t8d15MxV41HMKHOkde2hI0nAZtr2fnABevgxi3mfZni8AUlqbuWd7KtmG
         PxgirPylR5fYU9szQ/V8udEWXosCX1I9OythEqCXJ+HAaZaKKMM8WyF1K8v85H3q1e0/
         DhZ1CP1SKFjYxEiHZCMGrbPmQECoZmMdK+JtpxHXV7sxmwQeOEJ/LuWDS5w4IRX61ha3
         RjqH5sjdeDU3XVIWMUzarHH9E6MH6UnqxG+QHHIzzFBeokek1Fr9B/mytEioW89i6gTI
         DiAVSOHo/781Xpu0bg8UuEfKhGU93FDMrMe+cAkB/+X0ptWyutZuTAxB7PhRlzjWfQpd
         izvA==
X-Gm-Message-State: AGi0PuaaFRITwBMbsqXZs1OiIU7Jk4h4rXXOHjvOGtkgDxEVkXzMeFq+
        iMNJnIEMG2SWGNgHtwPN8XC8fw==
X-Google-Smtp-Source: APiQypI9OJNYTOx2dFYga3uG6HiHyD3Du/Y2rszzLxnw9qPYdCGcV6eQ7webq/esI6/8ElPR8drH3A==
X-Received: by 2002:a1c:4985:: with SMTP id w127mr1406035wma.100.1587607479945;
        Wed, 22 Apr 2020 19:04:39 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id j17sm1423292wrb.46.2020.04.22.19.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 19:04:39 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 1/2] clk: qcom: Add DT bindings for MSM8939 GCC
Date:   Thu, 23 Apr 2020 03:05:06 +0100
Message-Id: <20200423020507.455732-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200423020507.455732-1-bryan.odonoghue@linaro.org>
References: <20200423020507.455732-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add compatible strings and the include files for the MSM8939 GCC.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc.yaml   |   3 +
 include/dt-bindings/clock/qcom,gcc-msm8939.h  | 179 ++++++++++++++++++
 include/dt-bindings/reset/qcom,gcc-msm8939.h  | 100 ++++++++++
 3 files changed, 282 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8939.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-msm8939.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index e533bb0cfd2b..ee0467fb5e31 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -22,6 +22,8 @@ description: |
   - dt-bindings/reset/qcom,gcc-ipq6018.h
   - dt-bindings/clock/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
   - dt-bindings/reset/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
+  - dt-bindings/clock/qcom,gcc-msm8939.h
+  - dt-bindings/reset/qcom,gcc-msm8939.h
   - dt-bindings/clock/qcom,gcc-msm8660.h
   - dt-bindings/reset/qcom,gcc-msm8660.h
   - dt-bindings/clock/qcom,gcc-msm8974.h
@@ -41,6 +43,7 @@ properties:
       - qcom,gcc-ipq8064
       - qcom,gcc-msm8660
       - qcom,gcc-msm8916
+      - qcom,gcc-msm8939
       - qcom,gcc-msm8960
       - qcom,gcc-msm8974
       - qcom,gcc-msm8974pro
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8939.h b/include/dt-bindings/clock/qcom,gcc-msm8939.h
new file mode 100644
index 000000000000..e792ef049fc8
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-msm8939.h
@@ -0,0 +1,179 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2020 Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_MSM_GCC_8939_H
+#define _DT_BINDINGS_CLK_MSM_GCC_8939_H
+
+#define GPLL0					0
+#define GPLL0_VOTE				1
+#define BIMC_PLL				2
+#define BIMC_PLL_VOTE				3
+#define GPLL1					4
+#define GPLL1_VOTE				5
+#define GPLL2					6
+#define GPLL2_VOTE				7
+#define PCNOC_BFDCD_CLK_SRC			8
+#define SYSTEM_NOC_BFDCD_CLK_SRC		9
+#define CAMSS_AHB_CLK_SRC			10
+#define APSS_AHB_CLK_SRC			11
+#define CSI0_CLK_SRC				12
+#define CSI1_CLK_SRC				13
+#define GFX3D_CLK_SRC				14
+#define VFE0_CLK_SRC				15
+#define BLSP1_QUP1_I2C_APPS_CLK_SRC		16
+#define BLSP1_QUP1_SPI_APPS_CLK_SRC		17
+#define BLSP1_QUP2_I2C_APPS_CLK_SRC		18
+#define BLSP1_QUP2_SPI_APPS_CLK_SRC		19
+#define BLSP1_QUP3_I2C_APPS_CLK_SRC		20
+#define BLSP1_QUP3_SPI_APPS_CLK_SRC		21
+#define BLSP1_QUP4_I2C_APPS_CLK_SRC		22
+#define BLSP1_QUP4_SPI_APPS_CLK_SRC		23
+#define BLSP1_QUP5_I2C_APPS_CLK_SRC		24
+#define BLSP1_QUP5_SPI_APPS_CLK_SRC		25
+#define BLSP1_QUP6_I2C_APPS_CLK_SRC		26
+#define BLSP1_QUP6_SPI_APPS_CLK_SRC		27
+#define BLSP1_UART1_APPS_CLK_SRC		28
+#define BLSP1_UART2_APPS_CLK_SRC		29
+#define CCI_CLK_SRC				30
+#define CAMSS_GP0_CLK_SRC			31
+#define CAMSS_GP1_CLK_SRC			32
+#define JPEG0_CLK_SRC				33
+#define MCLK0_CLK_SRC				34
+#define MCLK1_CLK_SRC				35
+#define CSI0PHYTIMER_CLK_SRC			36
+#define CSI1PHYTIMER_CLK_SRC			37
+#define CPP_CLK_SRC				38
+#define CRYPTO_CLK_SRC				39
+#define GP1_CLK_SRC				40
+#define GP2_CLK_SRC				41
+#define GP3_CLK_SRC				42
+#define BYTE0_CLK_SRC				43
+#define ESC0_CLK_SRC				44
+#define MDP_CLK_SRC				45
+#define PCLK0_CLK_SRC				46
+#define VSYNC_CLK_SRC				47
+#define PDM2_CLK_SRC				48
+#define SDCC1_APPS_CLK_SRC			49
+#define SDCC2_APPS_CLK_SRC			50
+#define APSS_TCU_CLK_SRC			51
+#define USB_HS_SYSTEM_CLK_SRC			52
+#define VCODEC0_CLK_SRC				53
+#define GCC_BLSP1_AHB_CLK			54
+#define GCC_BLSP1_SLEEP_CLK			55
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK		56
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK		57
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK		58
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK		59
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK		60
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK		61
+#define GCC_BLSP1_QUP4_I2C_APPS_CLK		62
+#define GCC_BLSP1_QUP4_SPI_APPS_CLK		63
+#define GCC_BLSP1_QUP5_I2C_APPS_CLK		64
+#define GCC_BLSP1_QUP5_SPI_APPS_CLK		65
+#define GCC_BLSP1_QUP6_I2C_APPS_CLK		66
+#define GCC_BLSP1_QUP6_SPI_APPS_CLK		67
+#define GCC_BLSP1_UART1_APPS_CLK		68
+#define GCC_BLSP1_UART2_APPS_CLK		69
+#define GCC_BOOT_ROM_AHB_CLK			70
+#define GCC_CAMSS_CCI_AHB_CLK			71
+#define GCC_CAMSS_CCI_CLK			72
+#define GCC_CAMSS_CSI0_AHB_CLK			73
+#define GCC_CAMSS_CSI0_CLK			74
+#define GCC_CAMSS_CSI0PHY_CLK			75
+#define GCC_CAMSS_CSI0PIX_CLK			76
+#define GCC_CAMSS_CSI0RDI_CLK			77
+#define GCC_CAMSS_CSI1_AHB_CLK			78
+#define GCC_CAMSS_CSI1_CLK			79
+#define GCC_CAMSS_CSI1PHY_CLK			80
+#define GCC_CAMSS_CSI1PIX_CLK			81
+#define GCC_CAMSS_CSI1RDI_CLK			82
+#define GCC_CAMSS_CSI_VFE0_CLK			83
+#define GCC_CAMSS_GP0_CLK			84
+#define GCC_CAMSS_GP1_CLK			85
+#define GCC_CAMSS_ISPIF_AHB_CLK			86
+#define GCC_CAMSS_JPEG0_CLK			87
+#define GCC_CAMSS_JPEG_AHB_CLK			88
+#define GCC_CAMSS_JPEG_AXI_CLK			89
+#define GCC_CAMSS_MCLK0_CLK			90
+#define GCC_CAMSS_MCLK1_CLK			91
+#define GCC_CAMSS_MICRO_AHB_CLK			92
+#define GCC_CAMSS_CSI0PHYTIMER_CLK		93
+#define GCC_CAMSS_CSI1PHYTIMER_CLK		94
+#define GCC_CAMSS_AHB_CLK			95
+#define GCC_CAMSS_TOP_AHB_CLK			96
+#define GCC_CAMSS_CPP_AHB_CLK			97
+#define GCC_CAMSS_CPP_CLK			98
+#define GCC_CAMSS_VFE0_CLK			99
+#define GCC_CAMSS_VFE_AHB_CLK			100
+#define GCC_CAMSS_VFE_AXI_CLK			101
+#define GCC_CRYPTO_AHB_CLK			102
+#define GCC_CRYPTO_AXI_CLK			103
+#define GCC_CRYPTO_CLK				104
+#define GCC_OXILI_GMEM_CLK			105
+#define GCC_GP1_CLK				106
+#define GCC_GP2_CLK				107
+#define GCC_GP3_CLK				108
+#define GCC_MDSS_AHB_CLK			109
+#define GCC_MDSS_AXI_CLK			110
+#define GCC_MDSS_BYTE0_CLK			111
+#define GCC_MDSS_ESC0_CLK			112
+#define GCC_MDSS_MDP_CLK			113
+#define GCC_MDSS_PCLK0_CLK			114
+#define GCC_MDSS_VSYNC_CLK			115
+#define GCC_MSS_CFG_AHB_CLK			116
+#define GCC_OXILI_AHB_CLK			117
+#define GCC_OXILI_GFX3D_CLK			118
+#define GCC_PDM2_CLK				119
+#define GCC_PDM_AHB_CLK				120
+#define GCC_PRNG_AHB_CLK			121
+#define GCC_SDCC1_AHB_CLK			122
+#define GCC_SDCC1_APPS_CLK			123
+#define GCC_SDCC2_AHB_CLK			124
+#define GCC_SDCC2_APPS_CLK			125
+#define GCC_GTCU_AHB_CLK			126
+#define GCC_JPEG_TBU_CLK			127
+#define GCC_MDP_TBU_CLK				128
+#define GCC_SMMU_CFG_CLK			129
+#define GCC_VENUS_TBU_CLK			130
+#define GCC_VFE_TBU_CLK				131
+#define GCC_USB2A_PHY_SLEEP_CLK			132
+#define GCC_USB_HS_AHB_CLK			133
+#define GCC_USB_HS_SYSTEM_CLK			134
+#define GCC_VENUS0_AHB_CLK			135
+#define GCC_VENUS0_AXI_CLK			136
+#define GCC_VENUS0_VCODEC0_CLK			137
+#define BIMC_DDR_CLK_SRC			138
+#define GCC_APSS_TCU_CLK			139
+#define GCC_GFX_TCU_CLK				140
+#define BIMC_GPU_CLK_SRC			141
+#define GCC_BIMC_GFX_CLK			142
+#define GCC_BIMC_GPU_CLK			143
+#define ULTAUDIO_LPAIF_PRI_I2S_CLK_SRC		144
+#define ULTAUDIO_LPAIF_SEC_I2S_CLK_SRC		145
+#define ULTAUDIO_LPAIF_AUX_I2S_CLK_SRC		146
+#define ULTAUDIO_XO_CLK_SRC			147
+#define ULTAUDIO_AHBFABRIC_CLK_SRC		148
+#define CODEC_DIGCODEC_CLK_SRC			149
+#define GCC_ULTAUDIO_PCNOC_MPORT_CLK		150
+#define GCC_ULTAUDIO_PCNOC_SWAY_CLK		151
+#define GCC_ULTAUDIO_AVSYNC_XO_CLK		152
+#define GCC_ULTAUDIO_STC_XO_CLK			153
+#define GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK	154
+#define GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_LPM_CLK	155
+#define GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK		156
+#define GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK		157
+#define GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK		158
+#define GCC_CODEC_DIGCODEC_CLK			159
+#define GCC_MSS_Q6_BIMC_AXI_CLK			160
+
+/* Indexes for GDSCs */
+#define BIMC_GDSC				0
+#define VENUS_GDSC				1
+#define MDSS_GDSC				2
+#define JPEG_GDSC				3
+#define VFE_GDSC				4
+#define OXILI_GDSC				5
+
+#endif
diff --git a/include/dt-bindings/reset/qcom,gcc-msm8939.h b/include/dt-bindings/reset/qcom,gcc-msm8939.h
new file mode 100644
index 000000000000..6e79caff552c
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,gcc-msm8939.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2020 Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_RESET_MSM_GCC_8939_H
+#define _DT_BINDINGS_RESET_MSM_GCC_8939_H
+
+#define GCC_BLSP1_BCR			0
+#define GCC_BLSP1_QUP1_BCR		1
+#define GCC_BLSP1_UART1_BCR		2
+#define GCC_BLSP1_QUP2_BCR		3
+#define GCC_BLSP1_UART2_BCR		4
+#define GCC_BLSP1_QUP3_BCR		5
+#define GCC_BLSP1_QUP4_BCR		6
+#define GCC_BLSP1_QUP5_BCR		7
+#define GCC_BLSP1_QUP6_BCR		8
+#define GCC_IMEM_BCR			9
+#define GCC_SMMU_BCR			10
+#define GCC_APSS_TCU_BCR		11
+#define GCC_SMMU_XPU_BCR		12
+#define GCC_PCNOC_TBU_BCR		13
+#define GCC_PRNG_BCR			14
+#define GCC_BOOT_ROM_BCR		15
+#define GCC_CRYPTO_BCR			16
+#define GCC_SEC_CTRL_BCR		17
+#define GCC_AUDIO_CORE_BCR		18
+#define GCC_ULT_AUDIO_BCR		19
+#define GCC_DEHR_BCR			20
+#define GCC_SYSTEM_NOC_BCR		21
+#define GCC_PCNOC_BCR			22
+#define GCC_TCSR_BCR			23
+#define GCC_QDSS_BCR			24
+#define GCC_DCD_BCR			25
+#define GCC_MSG_RAM_BCR			26
+#define GCC_MPM_BCR			27
+#define GCC_SPMI_BCR			28
+#define GCC_SPDM_BCR			29
+#define GCC_MM_SPDM_BCR			30
+#define GCC_BIMC_BCR			31
+#define GCC_RBCPR_BCR			32
+#define GCC_TLMM_BCR			33
+#define GCC_USB_HS_BCR			34
+#define GCC_USB2A_PHY_BCR		35
+#define GCC_SDCC1_BCR			36
+#define GCC_SDCC2_BCR			37
+#define GCC_PDM_BCR			38
+#define GCC_SNOC_BUS_TIMEOUT0_BCR	39
+#define GCC_PCNOC_BUS_TIMEOUT0_BCR	40
+#define GCC_PCNOC_BUS_TIMEOUT1_BCR	41
+#define GCC_PCNOC_BUS_TIMEOUT2_BCR	42
+#define GCC_PCNOC_BUS_TIMEOUT3_BCR	43
+#define GCC_PCNOC_BUS_TIMEOUT4_BCR	44
+#define GCC_PCNOC_BUS_TIMEOUT5_BCR	45
+#define GCC_PCNOC_BUS_TIMEOUT6_BCR	46
+#define GCC_PCNOC_BUS_TIMEOUT7_BCR	47
+#define GCC_PCNOC_BUS_TIMEOUT8_BCR	48
+#define GCC_PCNOC_BUS_TIMEOUT9_BCR	49
+#define GCC_MMSS_BCR			50
+#define GCC_VENUS0_BCR			51
+#define GCC_MDSS_BCR			52
+#define GCC_CAMSS_PHY0_BCR		53
+#define GCC_CAMSS_CSI0_BCR		54
+#define GCC_CAMSS_CSI0PHY_BCR		55
+#define GCC_CAMSS_CSI0RDI_BCR		56
+#define GCC_CAMSS_CSI0PIX_BCR		57
+#define GCC_CAMSS_PHY1_BCR		58
+#define GCC_CAMSS_CSI1_BCR		59
+#define GCC_CAMSS_CSI1PHY_BCR		60
+#define GCC_CAMSS_CSI1RDI_BCR		61
+#define GCC_CAMSS_CSI1PIX_BCR		62
+#define GCC_CAMSS_ISPIF_BCR		63
+#define GCC_CAMSS_CCI_BCR		64
+#define GCC_CAMSS_MCLK0_BCR		65
+#define GCC_CAMSS_MCLK1_BCR		66
+#define GCC_CAMSS_GP0_BCR		67
+#define GCC_CAMSS_GP1_BCR		68
+#define GCC_CAMSS_TOP_BCR		69
+#define GCC_CAMSS_MICRO_BCR		70
+#define GCC_CAMSS_JPEG_BCR		71
+#define GCC_CAMSS_VFE_BCR		72
+#define GCC_CAMSS_CSI_VFE0_BCR		73
+#define GCC_OXILI_BCR			74
+#define GCC_GMEM_BCR			75
+#define GCC_CAMSS_AHB_BCR		76
+#define GCC_MDP_TBU_BCR			77
+#define GCC_GFX_TBU_BCR			78
+#define GCC_GFX_TCU_BCR			79
+#define GCC_MSS_TBU_AXI_BCR		80
+#define GCC_MSS_TBU_GSS_AXI_BCR		81
+#define GCC_MSS_TBU_Q6_AXI_BCR		82
+#define GCC_GTCU_AHB_BCR		83
+#define GCC_SMMU_CFG_BCR		84
+#define GCC_VFE_TBU_BCR			85
+#define GCC_VENUS_TBU_BCR		86
+#define GCC_JPEG_TBU_BCR		87
+#define GCC_PRONTO_TBU_BCR		88
+#define GCC_SMMU_CATS_BCR		89
+
+#endif
-- 
2.25.1

