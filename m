Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2A050560B
	for <lists+linux-clk@lfdr.de>; Mon, 18 Apr 2022 15:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241919AbiDRNbp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 18 Apr 2022 09:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244889AbiDRNbA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Apr 2022 09:31:00 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9BF2F2;
        Mon, 18 Apr 2022 05:56:59 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id t4so18747820pgc.1;
        Mon, 18 Apr 2022 05:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZTq1XcYxL7GQtHVs9BvCOYZLUP8rTZ608J8PYhVQGUk=;
        b=m22/INC0ra8CxvZ037KrM4uM0loy88TOSIYBMStJoVfGQbEo9C0T7mvT4MN8UI0rBK
         Nvrf9CP7D0LFcPcQMgjHh4E68MytLUqLawwVOpTFUIWSlQgmfqFDbDk6jm63ydlV/22r
         TA9qUEGSM4zfQN3rRLP1GXvqfsq5ZIbqfcx6DIakiIaxn2R2SXV3ukVNAEfNzYK1ecs8
         X6YQue9I8l6tZpJNs6Rqg05mTy5gvG6LrzbIYqOodwhPXw7YBddDg8UK19qDMwYF8oJ2
         ErkNcF42wMi7+e/HQ7UBDkE9HK2s3/JPeuc4fVBlmjr5Qxi+mjI7hkHakFO7I71ugKR3
         qJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZTq1XcYxL7GQtHVs9BvCOYZLUP8rTZ608J8PYhVQGUk=;
        b=KuZZaEI1Iwn6z0a9RwNrPDbv+bcNDdjCltRriiQEC6WEDsiXzSNyBRsex4voeAmUBj
         pljnx8FIn0xs3v0vR1qe4fDVQ8Ni47A4IEs0+67YjkqOrZ68CsBoooJpl0z7ivxLsZgk
         AC3HwsldOmBC6QnAumeelQ0LifWym8yplcOlnKxKftTOl9Y+ua7GJUKpiWGW5C6NYXE2
         jVV6AhksW/WlhTeWXVVhK0r3DXjECV7H8D1TTShRqj+beLpsM7FH5PbZlsap3zkYkjUk
         MXGVLbLqKoLDA+o5ytLP1pr79l9DX/epduzaMcIkB1I94SQf2rVLUB6uvDktR3bOON/d
         BHyQ==
X-Gm-Message-State: AOAM530qZue/pgiME0PohiXfchf+yq7JRHmXjc5/9UYkQrQK2NchskGY
        spKtJDpqVseB15BiGwCqKPA=
X-Google-Smtp-Source: ABdhPJytU1ikXcAN//ihQNPO11m7qmyyzvWyGIjmdBe+w55+WKnZnLwewd1ZMA+Jhg8tN5+1vZpIQQ==
X-Received: by 2002:a63:5a1c:0:b0:39d:adec:1764 with SMTP id o28-20020a635a1c000000b0039dadec1764mr9829919pgb.113.1650286618669;
        Mon, 18 Apr 2022 05:56:58 -0700 (PDT)
Received: from tj10039pcu.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id 73-20020a63064c000000b003a216524089sm11358212pgg.57.2022.04.18.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 05:56:58 -0700 (PDT)
From:   Cixi Geng <gengcixi@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, orsonzhai@gmail.com,
        baolin.wang7@gmail.com, zhang.lyra@gmail.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/3] clk: sprd: Add dt-bindings include file for UMS512
Date:   Mon, 18 Apr 2022 20:56:29 +0800
Message-Id: <20220418125630.2342538-3-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418125630.2342538-1-gengcixi@gmail.com>
References: <20220418125630.2342538-1-gengcixi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Cixi Geng <cixi.geng1@unisoc.com>

This file defines all UMS512 clock indexes, it should be included in the
device tree in which there's device using the clocks.

Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 include/dt-bindings/clock/sprd,ums512-clk.h | 397 ++++++++++++++++++++
 1 file changed, 397 insertions(+)
 create mode 100644 include/dt-bindings/clock/sprd,ums512-clk.h

diff --git a/include/dt-bindings/clock/sprd,ums512-clk.h b/include/dt-bindings/clock/sprd,ums512-clk.h
new file mode 100644
index 000000000000..4f1d90849944
--- /dev/null
+++ b/include/dt-bindings/clock/sprd,ums512-clk.h
@@ -0,0 +1,397 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Unisoc UMS512 SoC DTS file
+ *
+ * Copyright (C) 2022, Unisoc Inc.
+ */
+
+#ifndef _DT_BINDINGS_CLK_UMS512_H_
+#define _DT_BINDINGS_CLK_UMS512_H_
+
+#define CLK_26M_AUD			0
+#define CLK_13M				1
+#define CLK_6M5				2
+#define CLK_4M3				3
+#define CLK_2M				4
+#define CLK_1M				5
+#define CLK_250K			6
+#define CLK_RCO_25M			7
+#define CLK_RCO_4M			8
+#define CLK_RCO_2M			9
+#define CLK_ISPPLL_GATE			10
+#define CLK_DPLL0_GATE			11
+#define CLK_DPLL1_GATE			12
+#define CLK_LPLL_GATE			13
+#define CLK_TWPLL_GATE			14
+#define CLK_GPLL_GATE			15
+#define CLK_RPLL_GATE			16
+#define CLK_CPPLL_GATE			17
+#define CLK_MPLL0_GATE			18
+#define CLK_MPLL1_GATE			19
+#define CLK_MPLL2_GATE			20
+#define CLK_PMU_GATE_NUM		(CLK_MPLL2_GATE + 1)
+
+#define CLK_DPLL0			0
+#define CLK_DPLL0_58M31			1
+#define CLK_ANLG_PHY_G0_NUM		(CLK_DPLL0_58M31 + 1)
+
+#define CLK_MPLL1			0
+#define CLK_MPLL1_63M38			1
+#define CLK_ANLG_PHY_G2_NUM		(CLK_MPLL1_63M38 + 1)
+
+#define CLK_RPLL			0
+#define CLK_AUDIO_GATE			1
+#define CLK_MPLL0			2
+#define CLK_MPLL0_56M88			3
+#define CLK_MPLL2			4
+#define CLK_MPLL2_47M13			5
+#define CLK_ANLG_PHY_G3_NUM		(CLK_MPLL2_47M13 + 1)
+
+#define CLK_TWPLL			0
+#define CLK_TWPLL_768M			1
+#define CLK_TWPLL_384M			2
+#define CLK_TWPLL_192M			3
+#define CLK_TWPLL_96M			4
+#define CLK_TWPLL_48M			5
+#define CLK_TWPLL_24M			6
+#define CLK_TWPLL_12M			7
+#define CLK_TWPLL_512M			8
+#define CLK_TWPLL_256M			9
+#define CLK_TWPLL_128M			10
+#define CLK_TWPLL_64M			11
+#define CLK_TWPLL_307M2			12
+#define CLK_TWPLL_219M4			13
+#define CLK_TWPLL_170M6			14
+#define CLK_TWPLL_153M6			15
+#define CLK_TWPLL_76M8			16
+#define CLK_TWPLL_51M2			17
+#define CLK_TWPLL_38M4			18
+#define CLK_TWPLL_19M2			19
+#define CLK_TWPLL_12M29			20
+#define CLK_LPLL			21
+#define CLK_LPLL_614M4			22
+#define CLK_LPLL_409M6			23
+#define CLK_LPLL_245M76			24
+#define CLK_LPLL_30M72			25
+#define CLK_ISPPLL			26
+#define CLK_ISPPLL_468M			27
+#define CLK_ISPPLL_78M			28
+#define CLK_GPLL			29
+#define CLK_GPLL_40M			30
+#define CLK_CPPLL			31
+#define CLK_CPPLL_39M32			32
+#define CLK_ANLG_PHY_GC_NUM		(CLK_CPPLL_39M32 + 1)
+
+#define CLK_AP_APB			0
+#define CLK_IPI			        1
+#define CLK_AP_UART0			2
+#define CLK_AP_UART1			3
+#define CLK_AP_UART2			4
+#define CLK_AP_I2C0			5
+#define CLK_AP_I2C1			6
+#define CLK_AP_I2C2			7
+#define CLK_AP_I2C3			8
+#define CLK_AP_I2C4			9
+#define CLK_AP_SPI0			10
+#define CLK_AP_SPI1			11
+#define CLK_AP_SPI2			12
+#define CLK_AP_SPI3			13
+#define CLK_AP_IIS0			14
+#define CLK_AP_IIS1			15
+#define CLK_AP_IIS2			16
+#define CLK_AP_SIM			17
+#define CLK_AP_CE			18
+#define CLK_SDIO0_2X			19
+#define CLK_SDIO1_2X			20
+#define CLK_EMMC_2X			21
+#define CLK_VSP				22
+#define CLK_DISPC0			23
+#define CLK_DISPC0_DPI			24
+#define CLK_DSI_APB			25
+#define CLK_DSI_RXESC			26
+#define CLK_DSI_LANEBYTE		27
+#define CLK_VDSP		        28
+#define CLK_VDSP_M		        29
+#define CLK_AP_CLK_NUM			(CLK_VDSP_M + 1)
+
+#define CLK_DSI_EB			0
+#define CLK_DISPC_EB			1
+#define CLK_VSP_EB			2
+#define CLK_VDMA_EB			3
+#define CLK_DMA_PUB_EB			4
+#define CLK_DMA_SEC_EB			5
+#define CLK_IPI_EB			6
+#define CLK_AHB_CKG_EB			7
+#define CLK_BM_CLK_EB			8
+#define CLK_AP_AHB_GATE_NUM		(CLK_BM_CLK_EB + 1)
+
+#define CLK_AON_APB			0
+#define CLK_ADI				1
+#define CLK_AUX0			2
+#define CLK_AUX1			3
+#define CLK_AUX2			4
+#define CLK_PROBE			5
+#define CLK_PWM0			6
+#define CLK_PWM1			7
+#define CLK_PWM2			8
+#define CLK_PWM3			9
+#define CLK_EFUSE			10
+#define CLK_UART0			11
+#define CLK_UART1			12
+#define CLK_THM0			13
+#define CLK_THM1			14
+#define CLK_THM2			15
+#define CLK_THM3			16
+#define CLK_AON_I2C			17
+#define CLK_AON_IIS			18
+#define CLK_SCC				19
+#define CLK_APCPU_DAP			20
+#define CLK_APCPU_DAP_MTCK		21
+#define CLK_APCPU_TS			22
+#define CLK_DEBUG_TS			23
+#define CLK_DSI_TEST_S			24
+#define CLK_DJTAG_TCK			25
+#define CLK_DJTAG_TCK_HW		26
+#define CLK_AON_TMR			27
+#define CLK_AON_PMU			28
+#define CLK_DEBOUNCE			29
+#define CLK_APCPU_PMU			30
+#define CLK_TOP_DVFS			31
+#define CLK_OTG_UTMI			32
+#define CLK_OTG_REF			33
+#define CLK_CSSYS			34
+#define CLK_CSSYS_PUB			35
+#define CLK_CSSYS_APB			36
+#define CLK_AP_AXI			37
+#define CLK_AP_MM			38
+#define CLK_SDIO2_2X			39
+#define CLK_ANALOG_IO_APB		40
+#define CLK_DMC_REF_CLK			41
+#define CLK_EMC				42
+#define CLK_USB				43
+#define CLK_26M_PMU			44
+#define CLK_AON_APB_NUM			(CLK_26M_PMU + 1)
+
+#define CLK_MM_AHB			0
+#define CLK_MM_MTX			1
+#define CLK_SENSOR0			2
+#define CLK_SENSOR1			3
+#define CLK_SENSOR2			4
+#define CLK_CPP				5
+#define CLK_JPG				6
+#define CLK_FD				7
+#define CLK_DCAM_IF			8
+#define CLK_DCAM_AXI			9
+#define CLK_ISP				10
+#define CLK_MIPI_CSI0			11
+#define CLK_MIPI_CSI1			12
+#define CLK_MIPI_CSI2			13
+#define CLK_MM_CLK_NUM			(CLK_MIPI_CSI2 + 1)
+
+#define CLK_RC100M_CAL_EB		0
+#define CLK_DJTAG_TCK_EB		1
+#define CLK_DJTAG_EB			2
+#define CLK_AUX0_EB			3
+#define CLK_AUX1_EB			4
+#define CLK_AUX2_EB			5
+#define CLK_PROBE_EB			6
+#define CLK_MM_EB			7
+#define CLK_GPU_EB			8
+#define CLK_MSPI_EB			9
+#define CLK_APCPU_DAP_EB		10
+#define CLK_AON_CSSYS_EB		11
+#define CLK_CSSYS_APB_EB		12
+#define CLK_CSSYS_PUB_EB		13
+#define CLK_SDPHY_CFG_EB		14
+#define CLK_SDPHY_REF_EB		15
+#define CLK_EFUSE_EB			16
+#define CLK_GPIO_EB			17
+#define CLK_MBOX_EB			18
+#define CLK_KPD_EB			19
+#define CLK_AON_SYST_EB			20
+#define CLK_AP_SYST_EB			21
+#define CLK_AON_TMR_EB			22
+#define CLK_OTG_UTMI_EB			23
+#define CLK_OTG_PHY_EB			24
+#define CLK_SPLK_EB			25
+#define CLK_PIN_EB			26
+#define CLK_ANA_EB			27
+#define CLK_APCPU_TS0_EB		28
+#define CLK_APB_BUSMON_EB		29
+#define CLK_AON_IIS_EB			30
+#define CLK_SCC_EB			31
+#define CLK_THM0_EB			32
+#define CLK_THM1_EB			33
+#define CLK_THM2_EB			34
+#define CLK_ASIM_TOP_EB			35
+#define CLK_I2C_EB			36
+#define CLK_PMU_EB			37
+#define CLK_ADI_EB			38
+#define CLK_EIC_EB			39
+#define CLK_AP_INTC0_EB			40
+#define CLK_AP_INTC1_EB			41
+#define CLK_AP_INTC2_EB			42
+#define CLK_AP_INTC3_EB			43
+#define CLK_AP_INTC4_EB			44
+#define CLK_AP_INTC5_EB			45
+#define CLK_AUDCP_INTC_EB		46
+#define CLK_AP_TMR0_EB			47
+#define CLK_AP_TMR1_EB			48
+#define CLK_AP_TMR2_EB			49
+#define CLK_PWM0_EB			50
+#define CLK_PWM1_EB			51
+#define CLK_PWM2_EB			52
+#define CLK_PWM3_EB			53
+#define CLK_AP_WDG_EB			54
+#define CLK_APCPU_WDG_EB		55
+#define CLK_SERDES_EB			56
+#define CLK_ARCH_RTC_EB			57
+#define CLK_KPD_RTC_EB			58
+#define CLK_AON_SYST_RTC_EB		59
+#define CLK_AP_SYST_RTC_EB		60
+#define CLK_AON_TMR_RTC_EB		61
+#define CLK_EIC_RTC_EB			62
+#define CLK_EIC_RTCDV5_EB		63
+#define CLK_AP_WDG_RTC_EB		64
+#define CLK_AC_WDG_RTC_EB		65
+#define CLK_AP_TMR0_RTC_EB		66
+#define CLK_AP_TMR1_RTC_EB		67
+#define CLK_AP_TMR2_RTC_EB		68
+#define CLK_DCXO_LC_RTC_EB		69
+#define CLK_BB_CAL_RTC_EB		70
+#define CLK_AP_EMMC_RTC_EB		71
+#define CLK_AP_SDIO0_RTC_EB		72
+#define CLK_AP_SDIO1_RTC_EB		73
+#define CLK_AP_SDIO2_RTC_EB		74
+#define CLK_DSI_CSI_TEST_EB		75
+#define CLK_DJTAG_TCK_EN		76
+#define CLK_DPHY_REF_EB			77
+#define CLK_DMC_REF_EB			78
+#define CLK_OTG_REF_EB			79
+#define CLK_TSEN_EB			80
+#define CLK_TMR_EB			81
+#define CLK_RC100M_REF_EB		82
+#define CLK_RC100M_FDK_EB		83
+#define CLK_DEBOUNCE_EB			84
+#define CLK_DET_32K_EB			85
+#define CLK_TOP_CSSYS_EB		86
+#define CLK_AP_AXI_EN			87
+#define CLK_SDIO0_2X_EN			88
+#define CLK_SDIO0_1X_EN			89
+#define CLK_SDIO1_2X_EN			90
+#define CLK_SDIO1_1X_EN			91
+#define CLK_SDIO2_2X_EN			92
+#define CLK_SDIO2_1X_EN			93
+#define CLK_EMMC_2X_EN			94
+#define CLK_EMMC_1X_EN			95
+#define CLK_PLL_TEST_EN			96
+#define CLK_CPHY_CFG_EN			97
+#define CLK_DEBUG_TS_EN			98
+#define CLK_ACCESS_AUD_EN		99
+#define CLK_AON_APB_GATE_NUM		(CLK_ACCESS_AUD_EN + 1)
+
+#define CLK_MM_CPP_EB			0
+#define CLK_MM_JPG_EB			1
+#define CLK_MM_DCAM_EB			2
+#define CLK_MM_ISP_EB			3
+#define CLK_MM_CSI2_EB			4
+#define CLK_MM_CSI1_EB			5
+#define CLK_MM_CSI0_EB			6
+#define CLK_MM_CKG_EB			7
+#define CLK_ISP_AHB_EB			8
+#define CLK_MM_DVFS_EB			9
+#define CLK_MM_FD_EB			10
+#define CLK_MM_SENSOR2_EB		11
+#define CLK_MM_SENSOR1_EB		12
+#define CLK_MM_SENSOR0_EB		13
+#define CLK_MM_MIPI_CSI2_EB		14
+#define CLK_MM_MIPI_CSI1_EB		15
+#define CLK_MM_MIPI_CSI0_EB		16
+#define CLK_DCAM_AXI_EB			17
+#define CLK_ISP_AXI_EB			18
+#define CLK_MM_CPHY_EB			19
+#define CLK_MM_GATE_CLK_NUM		(CLK_MM_CPHY_EB + 1)
+
+#define CLK_SIM0_EB			0
+#define CLK_IIS0_EB			1
+#define CLK_IIS1_EB			2
+#define CLK_IIS2_EB			3
+#define CLK_APB_REG_EB			4
+#define CLK_SPI0_EB			5
+#define CLK_SPI1_EB			6
+#define CLK_SPI2_EB			7
+#define CLK_SPI3_EB			8
+#define CLK_I2C0_EB			9
+#define CLK_I2C1_EB			10
+#define CLK_I2C2_EB			11
+#define CLK_I2C3_EB			12
+#define CLK_I2C4_EB			13
+#define CLK_UART0_EB			14
+#define CLK_UART1_EB			15
+#define CLK_UART2_EB			16
+#define CLK_SIM0_32K_EB			17
+#define CLK_SPI0_LFIN_EB		18
+#define CLK_SPI1_LFIN_EB		19
+#define CLK_SPI2_LFIN_EB		20
+#define CLK_SPI3_LFIN_EB		21
+#define CLK_SDIO0_EB			22
+#define CLK_SDIO1_EB			23
+#define CLK_SDIO2_EB			24
+#define CLK_EMMC_EB			25
+#define CLK_SDIO0_32K_EB		26
+#define CLK_SDIO1_32K_EB		27
+#define CLK_SDIO2_32K_EB		28
+#define CLK_EMMC_32K_EB			29
+#define CLK_AP_APB_GATE_NUM		(CLK_EMMC_32K_EB + 1)
+
+#define CLK_GPU_CORE_EB			0
+#define CLK_GPU_CORE			1
+#define CLK_GPU_MEM_EB			2
+#define CLK_GPU_MEM			3
+#define CLK_GPU_SYS_EB			4
+#define CLK_GPU_SYS			5
+#define CLK_GPU_CLK_NUM			(CLK_GPU_SYS + 1)
+
+#define CLK_AUDCP_IIS0_EB		0
+#define CLK_AUDCP_IIS1_EB		1
+#define CLK_AUDCP_IIS2_EB		2
+#define CLK_AUDCP_UART_EB		3
+#define CLK_AUDCP_DMA_CP_EB		4
+#define CLK_AUDCP_DMA_AP_EB		5
+#define CLK_AUDCP_SRC48K_EB		6
+#define CLK_AUDCP_MCDT_EB		7
+#define CLK_AUDCP_VBCIFD_EB		8
+#define CLK_AUDCP_VBC_EB		9
+#define CLK_AUDCP_SPLK_EB		10
+#define CLK_AUDCP_ICU_EB		11
+#define CLK_AUDCP_DMA_AP_ASHB_EB	12
+#define CLK_AUDCP_DMA_CP_ASHB_EB	13
+#define CLK_AUDCP_AUD_EB		14
+#define CLK_AUDCP_VBC_24M_EB		15
+#define CLK_AUDCP_TMR_26M_EB		16
+#define CLK_AUDCP_DVFS_ASHB_EB		17
+#define CLK_AUDCP_AHB_GATE_NUM		(CLK_AUDCP_DVFS_ASHB_EB + 1)
+
+#define CLK_AUDCP_WDG_EB		0
+#define CLK_AUDCP_RTC_WDG_EB		1
+#define CLK_AUDCP_TMR0_EB		2
+#define CLK_AUDCP_TMR1_EB		3
+#define CLK_AUDCP_APB_GATE_NUM		(CLK_AUDCP_TMR1_EB + 1)
+
+#define CLK_ACORE0			0
+#define CLK_ACORE1			1
+#define CLK_ACORE2			2
+#define CLK_ACORE3			3
+#define CLK_ACORE4			4
+#define CLK_ACORE5			5
+#define CLK_PCORE0			6
+#define CLK_PCORE1			7
+#define CLK_SCU				8
+#define CLK_ACE				9
+#define CLK_PERIPH			10
+#define CLK_GIC				11
+#define CLK_ATB				12
+#define CLK_DEBUG_APB			13
+#define CLK_APCPU_SEC_NUM		(CLK_DEBUG_APB + 1)
+
+#endif /* _DT_BINDINGS_CLK_UMS512_H_ */
-- 
2.25.1

