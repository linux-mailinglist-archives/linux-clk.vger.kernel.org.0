Return-Path: <linux-clk+bounces-26484-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C3B2F866
	for <lists+linux-clk@lfdr.de>; Thu, 21 Aug 2025 14:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD4C3AC3ED9
	for <lists+linux-clk@lfdr.de>; Thu, 21 Aug 2025 12:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEA53218C1;
	Thu, 21 Aug 2025 12:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QDZRyq2I"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAB4311C21
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780066; cv=none; b=sy+rVsP/fO0lVJZxqy3/1TJmVu8rS21hj7dkkSvZKSGObhQNXmQdRcp6uRI/HB28+VscDxjFaXfmjP1OTOqgBlc6ROkB2uHa61VxPNLm89yB2bIxxbRR0L/ajnLm8m7Vmw2QGPDC+BP4XQY8w3JviVXwcd6rAmY0hww4IRHl+0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780066; c=relaxed/simple;
	bh=Of/mxPqLCArJXwuC2OswsRmeaMkQVbPub9oQGV9G9zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ojTUNOqQCqGc+NYqgND98nLwdx0t97iLMaPVuCbAwGSER0uOVlwcpaU83XyesaJk+tvDI9FH4n0gwSTawcJPYHh126b87ag+iwWaUTtW3JbDo9R+Kk2CNyRczuqJXOjr7hH6NeSBM+72zsr4yKQEwiDtAAHkDWuWBrh1XD5128A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QDZRyq2I; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250821124103epoutp01dbe97122d3026d60f4203668981492ff~dyKpADuAN2177121771epoutp01L
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 12:41:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250821124103epoutp01dbe97122d3026d60f4203668981492ff~dyKpADuAN2177121771epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780063;
	bh=yQuDkkBEvyY5Pt7iRYQ2Pcj3famUClF/QwXS+CmFsW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QDZRyq2IrUIYlSVEBnjaob7bSJaKLBKa0IoNCHuMTc0XA5+zRnMz50wT0V5Hv0kOW
	 hxnTUrRZPPXYzD61Zi5hVTHenV/+4SNmozG3iwZUpf4we5jkDSIL6E1auo3Wcn7pNW
	 /07EpcljG7R817uWZHsOnMjUfZO8treYXYVKXmgA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250821124102epcas5p3aa30a35494b09361d8bae614d677e106~dyKoB77w81592915929epcas5p31;
	Thu, 21 Aug 2025 12:41:02 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c72x927pLz3hhT9; Thu, 21 Aug
	2025 12:41:01 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250821124100epcas5p42f719e140529823d9408b7325c646bbf~dyKmgUAUU1046010460epcas5p4b;
	Thu, 21 Aug 2025 12:41:00 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124055epsmtip2bb7e13494bf406afbf5f8720b36eaecd~dyKh9XXyP2603426034epsmtip2i;
	Thu, 21 Aug 2025 12:40:55 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v2 09/10] arm64: dts: axis: Add ARTPEC-8 Grizzly dts support
Date: Thu, 21 Aug 2025 18:02:53 +0530
Message-ID: <20250821123310.94089-10-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821123310.94089-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124100epcas5p42f719e140529823d9408b7325c646bbf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124100epcas5p42f719e140529823d9408b7325c646bbf
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124100epcas5p42f719e140529823d9408b7325c646bbf@epcas5p4.samsung.com>

From: SeonGu Kang <ksk4725@coasia.com>

Add initial devcie tree for the ARTPEC-8 Grizzly board.
The ARTPEC-8 Grizzly is a small board developed by Axis,
based on the Axis ARTPEC-8 SoC.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 arch/arm64/boot/dts/exynos/axis/Makefile      |  4 +++
 .../boot/dts/exynos/axis/artpec8-grizzly.dts  | 35 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/axis/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts

diff --git a/arch/arm64/boot/dts/exynos/axis/Makefile b/arch/arm64/boot/dts/exynos/axis/Makefile
new file mode 100644
index 000000000000..ccf00de64016
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_ARTPEC) += \
+	artpec8-grizzly.dtb
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts b/arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts
new file mode 100644
index 000000000000..5ae864ec3193
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-8 Grizzly board device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+/dts-v1/;
+#include "artpec8.dtsi"
+#include "artpec8-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+/ {
+	model = "ARTPEC-8 grizzly board";
+	compatible = "axis,artpec8-grizzly", "axis,artpec8";
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		stdout-path = &serial_0;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&osc_clk {
+	clock-frequency = <50000000>;
+};
--
2.49.0


