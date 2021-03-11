Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723D133772E
	for <lists+linux-clk@lfdr.de>; Thu, 11 Mar 2021 16:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbhCKP00 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 11 Mar 2021 10:26:26 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:33833 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbhCKPZz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 10:25:55 -0500
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lKNCD-0004m8-OQ
        for linux-clk@vger.kernel.org; Thu, 11 Mar 2021 15:25:53 +0000
Received: by mail-ed1-f71.google.com with SMTP id p6so9995127edq.21
        for <linux-clk@vger.kernel.org>; Thu, 11 Mar 2021 07:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WNNBQoeYbiaXwIioLMfeHDmEpvN4s0z+f2iELsIEM3g=;
        b=mEJNFFt85Y0bvv4XvAnZbhvVKhgHkqH38Xris6aHXjW760//a2Klhlk6Ur6JrpA0bk
         mB26EkOS9/4cBoDZy/Km34rrF1psIXTPCGwD96eTzQh1HkY5RvA4rF3Xksoq8sMn0d7j
         R6x/wxq3IbJ33+53u1VGLnx/2vEBRb7bDE8U2fruTp84ubh+fT6wDnYEhmHtGbelVjeI
         FcKmmpsKIihWRvv/8W06ekDZuJQAMRqP7xhPJM34CdgA9OqNdkfOdSnKvJS1El4JRc43
         dNPWjw+Mv/oyIW1PmnZQYa07u58D3VR6T1CsjJNyFP3coqM0jsoQqDmrwtcHxmA2/TsE
         IUIA==
X-Gm-Message-State: AOAM530TCna9Vnq4FjUDjdn+j6t6+18O0rOT6ZIl5ndxwTHD4148uip7
        OgOra1JM2+SdsoD51XFXbD/EsMHjoDV2UlovX/sUm632wmV3tVSOl2SBBUAsbMePCm+14PNZzqu
        WZe0f9JVJkRxOxhAMusugLFQ/57lxmxMUUFQ1hw==
X-Received: by 2002:a05:6402:2215:: with SMTP id cq21mr9274782edb.281.1615476353414;
        Thu, 11 Mar 2021 07:25:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz84GEivsrxMtPNo4w3XJQXVZ55xsq/2JYDwU24XYid3WZpGznITM5djSJ6+HC1Qzj5FYXbTw==
X-Received: by 2002:a05:6402:2215:: with SMTP id cq21mr9274760edb.281.1615476353246;
        Thu, 11 Mar 2021 07:25:53 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:25:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 02/15] ARM: socfpga: introduce common ARCH_INTEL_SOCFPGA
Date:   Thu, 11 Mar 2021 16:25:32 +0100
Message-Id: <20210311152545.1317581-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
one for both of them.  This the common practice for other platforms.
Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
from multiple vendors.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/Kconfig                    | 2 +-
 arch/arm/Kconfig.debug              | 6 +++---
 arch/arm/Makefile                   | 2 +-
 arch/arm/boot/dts/Makefile          | 2 +-
 arch/arm/mach-socfpga/Kconfig       | 4 ++++
 arch/arm64/Kconfig.platforms        | 4 ++++
 arch/arm64/boot/dts/altera/Makefile | 2 +-
 7 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 853aab5ab327..37f94cf0cfdb 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1320,7 +1320,7 @@ config ARM_PSCI
 # selected platforms.
 config ARCH_NR_GPIO
 	int
-	default 2048 if ARCH_SOCFPGA
+	default 2048 if ARCH_INTEL_SOCFPGA
 	default 1024 if ARCH_BRCMSTB || ARCH_RENESAS || ARCH_TEGRA || \
 		ARCH_ZYNQ || ARCH_ASPEED
 	default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 || \
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 9e0b5e7f12af..36016497b1b3 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1087,7 +1087,7 @@ choice
 		  on SD5203 UART.
 
 	config DEBUG_SOCFPGA_UART0
-		depends on ARCH_SOCFPGA
+		depends on ARCH_INTEL_SOCFPGA
 		bool "Use SOCFPGA UART0 for low-level debug"
 		select DEBUG_UART_8250
 		help
@@ -1095,7 +1095,7 @@ choice
 		  on SOCFPGA(Cyclone 5 and Arria 5) based platforms.
 
 	config DEBUG_SOCFPGA_ARRIA10_UART1
-		depends on ARCH_SOCFPGA
+		depends on ARCH_INTEL_SOCFPGA
 		bool "Use SOCFPGA Arria10 UART1 for low-level debug"
 		select DEBUG_UART_8250
 		help
@@ -1103,7 +1103,7 @@ choice
 		  on SOCFPGA(Arria 10) based platforms.
 
 	config DEBUG_SOCFPGA_CYCLONE5_UART1
-		depends on ARCH_SOCFPGA
+		depends on ARCH_INTEL_SOCFPGA
 		bool "Use SOCFPGA Cyclone 5 UART1 for low-level debug"
 		select DEBUG_UART_8250
 		help
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index dad5502ecc28..415c3514573a 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -209,7 +209,7 @@ machine-$(CONFIG_PLAT_SAMSUNG)		+= s3c
 machine-$(CONFIG_ARCH_S5PV210)		+= s5pv210
 machine-$(CONFIG_ARCH_SA1100)		+= sa1100
 machine-$(CONFIG_ARCH_RENESAS)	 	+= shmobile
-machine-$(CONFIG_ARCH_SOCFPGA)		+= socfpga
+machine-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga
 machine-$(CONFIG_ARCH_STI)		+= sti
 machine-$(CONFIG_ARCH_STM32)		+= stm32
 machine-$(CONFIG_ARCH_SUNXI)		+= sunxi
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 53b6e06bf19a..fe8f7c349f1d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1033,7 +1033,7 @@ dtb-$(CONFIG_ARCH_S5PV210) += \
 	s5pv210-smdkc110.dtb \
 	s5pv210-smdkv210.dtb \
 	s5pv210-torbreck.dtb
-dtb-$(CONFIG_ARCH_SOCFPGA) += \
+dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria5_socdk.dtb \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index c3bb68d57cea..e43ed0ca6860 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -2,6 +2,7 @@
 menuconfig ARCH_SOCFPGA
 	bool "Altera SOCFPGA family"
 	depends on ARCH_MULTI_V7
+	select ARCH_INTEL_SOCFPGA
 	select ARCH_SUPPORTS_BIG_ENDIAN
 	select ARM_AMBA
 	select ARM_GIC
@@ -20,6 +21,9 @@ menuconfig ARCH_SOCFPGA
 	select PL310_ERRATA_769419
 
 if ARCH_SOCFPGA
+config ARCH_INTEL_SOCFPGA
+	bool
+
 config SOCFPGA_SUSPEND
 	bool "Suspend to RAM on SOCFPGA"
 	help
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index cdfd5fed457f..ecab67a1afb8 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -256,9 +256,13 @@ config ARCH_SEATTLE
 
 config ARCH_STRATIX10
 	bool "Altera's Stratix 10 SoCFPGA Family"
+	select ARCH_INTEL_SOCFPGA
 	help
 	  This enables support for Altera's Stratix 10 SoCFPGA Family.
 
+config ARCH_INTEL_SOCFPGA
+	bool
+
 config ARCH_SYNQUACER
 	bool "Socionext SynQuacer SoC Family"
 
diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 10119c7ab437..4db83fbeb115 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_STRATIX10) += socfpga_stratix10_socdk.dtb \
+dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_stratix10_socdk.dtb \
 				socfpga_stratix10_socdk_nand.dtb
-- 
2.25.1

