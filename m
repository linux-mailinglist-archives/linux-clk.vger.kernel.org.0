Return-Path: <linux-clk+bounces-16809-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11BA05778
	for <lists+linux-clk@lfdr.de>; Wed,  8 Jan 2025 10:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B901318869FA
	for <lists+linux-clk@lfdr.de>; Wed,  8 Jan 2025 09:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAF31F8686;
	Wed,  8 Jan 2025 09:55:44 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E911F76D8;
	Wed,  8 Jan 2025 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736330144; cv=none; b=oXs/Tw/VkPHQWYFPeDYMGEkzNZhOwZqxkqE9cgo4u+extmrQ1jAt8zzXwIHfag+DUZ+ob+lOdmVw4bFU/ORzbOC8OIM6fuNXH76KfaKCwbgk9DpK4XWVPkY05M60AsQM4DKbENj7zptp57W4htODYU/XR2YmYFWA612FU1vD6MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736330144; c=relaxed/simple;
	bh=nyb6wvpdFddRDb2StfKA4STA68FADaIDs8reKsWCTzo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IS3nzT8Em4iWhKqNxa1qm1I1yEi7DbhbTsKZ6SuinyyFhG6tiruaTuP9X6XIzG4rHGpCkxdyc+0JSZsAStgSPMimHFKkZcUiHMV+Ifdms3BsZPIWmXrM9CdrEKM5s831kLJGetJVNz6CHg+UhyVRv59xQbsQ8SMv8zUwOey9728=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Wed, 8 Jan 2025
 17:40:29 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock controller
Date: Wed, 8 Jan 2025 17:40:22 +0800
Message-ID: <20250108094025.2664201-3-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108094025.2664201-1-jian.hu@amlogic.com>
References: <20250108094025.2664201-1-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/dt-bindings/clock/amlogic,t7-scmi.h | 48 +++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h

diff --git a/include/dt-bindings/clock/amlogic,t7-scmi.h b/include/dt-bindings/clock/amlogic,t7-scmi.h
new file mode 100644
index 000000000000..aa2431ea72ed
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,t7-scmi.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Jian Hu <jian.hu@amlogic.com>
+ */
+
+#ifndef __T7_SCMI_CLKC_H
+#define __T7_SCMI_CLKC_H
+
+#define CLKID_DDR_PLL_OSC			0
+#define CLKID_AUD_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_TCON_PLL_OSC			3
+#define CLKID_USB_PLL0_OSC			4
+#define CLKID_USB_PLL1_OSC			5
+#define CLKID_MCLK_PLL_OSC			6
+#define CLKID_PCIE_OSC				7
+#define CLKID_ETH_PLL_OSC			8
+#define CLKID_PCIE_REFCLK_PLL_OSC		9
+#define CLKID_EARC_OSC				10
+#define CLKID_SYS1_PLL_OSC			11
+#define CLKID_HDMI_PLL_OSC			12
+#define CLKID_SYS_CLK				13
+#define CLKID_AXI_CLK				14
+#define CLKID_FIXED_PLL_DCO			15
+#define CLKID_FIXED_PLL				16
+#define CLKID_FCLK_DIV2_DIV			17
+#define CLKID_FCLK_DIV2				18
+#define CLKID_FCLK_DIV2P5_DIV			19
+#define CLKID_FCLK_DIV2P5			20
+#define CLKID_FCLK_DIV3_DIV			21
+#define CLKID_FCLK_DIV3				22
+#define CLKID_FCLK_DIV4_DIV			23
+#define CLKID_FCLK_DIV4				24
+#define CLKID_FCLK_DIV5_DIV			25
+#define CLKID_FCLK_DIV5				26
+#define CLKID_FCLK_DIV7_DIV			27
+#define CLKID_FCLK_DIV7				28
+#define CLKID_FCLK_50M_DIV			29
+#define CLKID_FCLK_50M				30
+#define CLKID_CPU_CLK				31
+#define CLKID_A73_CLK				32
+#define CLKID_CPU_CLK_DIV16_DIV			33
+#define CLKID_CPU_CLK_DIV16			34
+#define CLKID_A73_CLK_DIV16_DIV			35
+#define CLKID_A73_CLK_DIV16			36
+
+#endif /* __T7_SCMI_CLKC_H */
-- 
2.47.1


