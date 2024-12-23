Return-Path: <linux-clk+bounces-16197-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D8C9FAE84
	for <lists+linux-clk@lfdr.de>; Mon, 23 Dec 2024 13:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F3BB163A5D
	for <lists+linux-clk@lfdr.de>; Mon, 23 Dec 2024 12:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90801B393E;
	Mon, 23 Dec 2024 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cQea19YH"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C0E1AF0CE
	for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 12:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734958578; cv=none; b=Hm7hnT3ZWvloUPWar2f6CsHF9dyMfXOgh5IZL7WOSxWMt96nT+DAxIQzlkLYiO7qjvd8H4HOQj+gIRAUEZ93QGeUfxlESPzLUa+YOUrBk6maEHqLCW1bcLHFg3N7hTyC1C5BGShh1GeBpmrvvZkbMbUSA/gUuuB+rsu6TV0ZQuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734958578; c=relaxed/simple;
	bh=p6GSR0eJCq3HUetnFWbhAcGK9Z/l5uvQrox+JWeorIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=iLwy+ZzVXlS8kyOAXI5t7PbmJXE/N0DOvMN5AWqrztQRNVIKhPq40289KTXwjSEzZDJqvtyGcI1B1dWHugkwf58xCjMp41pMk+1s3R320Euw4GOXsodt19IFf2JvIGvMGDq+Zku7p1mdOtW56a87q5Adf5PVdK59ghJyDuiH+NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cQea19YH; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241223125610euoutp0140e221cad69e4d37d2cf748bcc7af7d2~Tz6CTnR_N3236432364euoutp01y
	for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 12:56:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241223125610euoutp0140e221cad69e4d37d2cf748bcc7af7d2~Tz6CTnR_N3236432364euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734958570;
	bh=ak8gNd2kuvwW5yLJPIl6tDdkpIPrBu/lDgwJ1z1llMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQea19YHV7VoEdyGrNDL6l1kxLZovi5vVoA15DOMNV0+ruWSKOWExdbZZgR8YfvEa
	 SVUlW5UsyjIxGaWNHVzQmuoA/FJvD3S5gLVJal+j8Zwfmisv3tDSGc62AAF3H9HGIb
	 i1v7qMYup56vMBQlP3U83sjgA8jwBwWHHBJTJGWQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241223125609eucas1p219f1798c6da9078c58f62f93878d0c02~Tz6B3rum01778817788eucas1p2J;
	Mon, 23 Dec 2024 12:56:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id CC.42.20397.9ED59676; Mon, 23
	Dec 2024 12:56:09 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241223125608eucas1p25f0be9eb6fb7ab906f942201560dd881~Tz6BN_V4M2931829318eucas1p2A;
	Mon, 23 Dec 2024 12:56:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241223125608eusmtrp1739a1620515d98773419e190628bbe8e~Tz6BM_lLF2051220512eusmtrp1S;
	Mon, 23 Dec 2024 12:56:08 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-7f-67695de9b7b9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id E4.F3.19920.8ED59676; Mon, 23
	Dec 2024 12:56:08 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241223125607eusmtip238c4b8f3f912c0b4722ca3fa4d3a12e1~Tz5-xL8TI1803818038eusmtip2k;
	Mon, 23 Dec 2024 12:56:07 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
	<m.wilczynski@samsung.com>
Subject: [RFC PATCH v2 06/19] soc: thead: power-domain: Add power-domain
 driver for TH1520
Date: Mon, 23 Dec 2024 13:55:40 +0100
Message-Id: <20241223125553.3527812-7-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH+d17e2/bWXYt3fyF6ciIkM1k4MBsv8gemGFyZzadcYmTjEkH
	N6VYHmlBnPiAtTCpBXzGUBTYQqDhTW07IDCgAsWhwHCWLoOCBIZVZkEKyQBxlMs2//ucc77n
	fM/55cfHxWbSny9PTmOVyVJFICkkLD1/D7ztipHLdg6WQ9Q7/COGzMt6CtW09WOotKufh5xD
	Jgz9tuAmUd3UIIUetmUTyG64QSF1Tz2JXHonieZ0Th6613KdRPP5XQBZ5jUkqu0apVD9QimG
	fpgzE6i8qQWg3LwKHvr1l71o1NlLINc9HY5y9S+j561NFFq1NxKo+Ek7hUwzF3nIVnsYadqv
	EJGvM25HDsXMuFwEc+uch2LaFssIplk/SjG65juAMVblkcyIvZVkSm4fZMbO2zDmZvlZRlPb
	gzGFz3Yy7p/vk0yBqQowQ+ph6nNxtPD9eFYhP84qQz+MFSY8KLgEUqujTvSUXiazwH2kBXw+
	pHdBQ4NAC4R8MW0AcKDQxOMCD4CmwkmCC+YB7PNcI7VAsN5RM7NMcYVKAHtnXRvBzJrK0kh4
	VSQdBscrS9dnSegcAuZ0ZwNvgNPTAFomr6/P8qO/gh2LFZR3E4IOguNLtBdF9EfwO9sZzi0A
	tnfexb0soCNhjdYBvCyiN8PbRZPrXviaRm0uxr3jId0ohDmlVpxrjoKrV7+nOPaDj2ymDd4K
	+y7rCI5T4Lj56Yb+FGzW2TY4Ao70L5HefXD6LVjfEsql98DZLjfJvZ0vdPy1mVvBF16yXMO5
	tAieyxVz6mB4VZf/n2m/wYJxzMDVx4vUBfCG/oVj9C8co//ftwzgVWALm65KkrGq8GQ2I0Ql
	TVKlJ8tC4lKSjGDtZ/et2haagOHRXIgVYHxgBZCPB0pEVrFcJhbFS789ySpTjirTFazKCl7j
	E4FbREHxAayYlknT2GMsm8oq/61ifIF/Frb/yR/Gn+gHng8aXilpVMfqthdlFh+JvFmF/R4T
	zcjD/Sq/SQzAVPKDEy99krlywviZJVGSMTbhSBvaFr47Lyu2LPq0vyJ/uFOlEAtcf4Ya4qLC
	uosjlm69F3HllM+s07wnOPFNc930qx5hVILGx2fl6O4vJJJNvMe+sU0n91mCnq4qMpfFsW09
	jiP7DvluXymWmD/9OvjY6NaMgJLpkHd3ne7UxhRO2c+vfGzXRFSkVrq+BCuti9nuhmcdD52D
	B+JEDkN18Ig6YUwn7jt8Nq3OFFWLH982ckG2d6psQreJ2nHoTMfd/IGSO0GYuiysXWAqaJOm
	BDzvtXQbpzqtRfsrqwMJVYL0nR24UiX9B0eyWkVIBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xe7ovYjPTDb7t1rI4cX0Rk8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
	cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
	5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
	F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
	vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
	k5Kak1mWWqRvl6CX8bBvEmPBapeKY/MnszUwXrXoYuTkkBAwkVjz5jd7FyMXh5DAUkaJ7o/9
	TBAJGYlr3S9ZIGxhiT/Xutggil4xSmxvXMcIkmATMJJ4sHw+K4gtIrCYRWLvvkqQImaBt4wS
	12duBOsWFoiSuPtpJnMXIwcHi4CqxINfAiAmr4C9RNPxOoj58hL7D55lBrE5BRwk1nTdABsv
	BFTy79QHNhCbV0BQ4uTMJ2ATmYHqm7fOZp7AKDALSWoWktQCRqZVjCKppcW56bnFhnrFibnF
	pXnpesn5uZsYgcll27Gfm3cwznv1Ue8QIxMH4yFGCQ5mJRHeQ0KZ6UK8KYmVValF+fFFpTmp
	xYcYTYGunsgsJZqcD0xveSXxhmYGpoYmZpYGppZmxkrivG6Xz6cJCaQnlqRmp6YWpBbB9DFx
	cEo1MGUdFhATZFr3kXO5X+TN6WLeyfv1D594bfjCU0l/67sOp8BpgvOy0/s8H7KnHpi5aW3p
	r1LL+z63DFLLLHy+JgpNmnxO+pD4KdVHWvL3Y3yq/9V7X9drzt/qlWXY0PGufadk0sW67/n7
	Yhcsn/J+j0R4rCDvo8r0AMdXJcaMTM/7M77vCuT1zuY/vdio8MWduCfnD9asauxkWnL1vaJk
	dazywScJiXJGqTNOH+y+996fLeNzt2+cr2zrR8ObP7hE/xlN2rqQ02vaG53VR2YrTu0RLK26
	9DJOMeGXQMif6IVLrLgXXG6UzZ9dsv2S9Qmvo3v/RJ1zO22/a8fG/bnuDyq0b+/m3/LsV1lD
	XzD/eiWW4oxEQy3mouJEAPfKQ8m3AwAA
X-CMS-MailID: 20241223125608eucas1p25f0be9eb6fb7ab906f942201560dd881
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125608eucas1p25f0be9eb6fb7ab906f942201560dd881
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125608eucas1p25f0be9eb6fb7ab906f942201560dd881
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
	<CGME20241223125608eucas1p25f0be9eb6fb7ab906f942201560dd881@eucas1p2.samsung.com>

The T-Head TH1520 SoC contains multiple power islands that can be
programmatically turned on and off using the AON (Always-On) protocol
and a hardware mailbox [1]. The relevant mailbox driver has already been
merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
Introduce support for T-head TH1520 Mailbox driver");

This commit introduces a power-domain driver for the TH1520 SoC, which
is using AON firmware protocol to communicate with E902 core through the
hardware mailbox. This way it can send power on/off commands to the E902
core.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                                |   1 +
 drivers/pmdomain/Kconfig                   |   1 +
 drivers/pmdomain/Makefile                  |   1 +
 drivers/pmdomain/thead/Kconfig             |  12 ++
 drivers/pmdomain/thead/Makefile            |   2 +
 drivers/pmdomain/thead/th1520-pm-domains.c | 181 +++++++++++++++++++++
 6 files changed, 198 insertions(+)
 create mode 100644 drivers/pmdomain/thead/Kconfig
 create mode 100644 drivers/pmdomain/thead/Makefile
 create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 42aef66bd257..173eeaf3bbe8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20200,6 +20200,7 @@ F:	drivers/firmware/thead,th1520-aon.c
 F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
+F:	drivers/pmdomain/thead/
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 23c64851a5b0..91f04ace35d4 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -16,6 +16,7 @@ source "drivers/pmdomain/st/Kconfig"
 source "drivers/pmdomain/starfive/Kconfig"
 source "drivers/pmdomain/sunxi/Kconfig"
 source "drivers/pmdomain/tegra/Kconfig"
+source "drivers/pmdomain/thead/Kconfig"
 source "drivers/pmdomain/ti/Kconfig"
 source "drivers/pmdomain/xilinx/Kconfig"
 
diff --git a/drivers/pmdomain/Makefile b/drivers/pmdomain/Makefile
index a68ece2f4c68..7030f44a49df 100644
--- a/drivers/pmdomain/Makefile
+++ b/drivers/pmdomain/Makefile
@@ -14,6 +14,7 @@ obj-y					+= st/
 obj-y					+= starfive/
 obj-y					+= sunxi/
 obj-y					+= tegra/
+obj-y					+= thead/
 obj-y					+= ti/
 obj-y					+= xilinx/
 obj-y					+= core.o governor.o
diff --git a/drivers/pmdomain/thead/Kconfig b/drivers/pmdomain/thead/Kconfig
new file mode 100644
index 000000000000..3b61e92dde43
--- /dev/null
+++ b/drivers/pmdomain/thead/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config TH1520_PM_DOMAINS
+	tristate "Support TH1520 Power Domains"
+	depends on TH1520_AON_PROTOCOL || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  This driver enables power domain management for the T-HEAD
+	  TH-1520 SoC. On this SoC there are number of power domains,
+	  which can be managed independently. For example GPU, NPU,
+	  and DPU reside in their own power domains which can be
+	  turned on/off.
diff --git a/drivers/pmdomain/thead/Makefile b/drivers/pmdomain/thead/Makefile
new file mode 100644
index 000000000000..adfdf5479c68
--- /dev/null
+++ b/drivers/pmdomain/thead/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_TH1520_PM_DOMAINS)		+= th1520-pm-domains.o
diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
new file mode 100644
index 000000000000..a56ba164a58d
--- /dev/null
+++ b/drivers/pmdomain/thead/th1520-pm-domains.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#include <linux/firmware/thead/thead,th1520-aon.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+
+#include <dt-bindings/power/thead,th1520-power.h>
+
+struct th1520_power_domain {
+	struct th1520_aon_chan *aon_chan;
+	struct generic_pm_domain genpd;
+	u32 rsrc;
+};
+
+struct th1520_power_info {
+	const char *name;
+	u32 rsrc;
+};
+
+static const struct th1520_power_info th1520_pd_ranges[] = {
+	{ "vdec", TH1520_AON_VDEC_PD },
+	{ "npu", TH1520_AON_NPU_PD },
+	{ "venc", TH1520_AON_VENC_PD },
+	{ "gpu", TH1520_AON_GPU_PD },
+	{ "dsp0", TH1520_AON_DSP0_PD },
+	{ "dsp1", TH1520_AON_DSP1_PD }
+};
+
+static inline struct th1520_power_domain *
+to_th1520_power_domain(struct generic_pm_domain *genpd)
+{
+	return container_of(genpd, struct th1520_power_domain, genpd);
+}
+
+static int th1520_pd_power_on(struct generic_pm_domain *domain)
+{
+	struct th1520_power_domain *pd = to_th1520_power_domain(domain);
+
+	return th1520_aon_power_update(pd->aon_chan, pd->rsrc, true);
+}
+
+static int th1520_pd_power_off(struct generic_pm_domain *domain)
+{
+	struct th1520_power_domain *pd = to_th1520_power_domain(domain);
+
+	return th1520_aon_power_update(pd->aon_chan, pd->rsrc, false);
+}
+
+static struct generic_pm_domain *th1520_pd_xlate(const struct of_phandle_args *spec,
+						 void *data)
+{
+	struct generic_pm_domain *domain = ERR_PTR(-ENOENT);
+	struct genpd_onecell_data *pd_data = data;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
+		struct th1520_power_domain *pd;
+
+		pd = to_th1520_power_domain(pd_data->domains[i]);
+		if (pd->rsrc == spec->args[0]) {
+			domain = &pd->genpd;
+			break;
+		}
+	}
+
+	return domain;
+}
+
+static struct th1520_power_domain *
+th1520_add_pm_domain(struct device *dev, const struct th1520_power_info *pi)
+{
+	struct th1520_power_domain *pd;
+	int ret;
+
+	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return ERR_PTR(-ENOMEM);
+
+	pd->rsrc = pi->rsrc;
+	pd->genpd.power_on = th1520_pd_power_on;
+	pd->genpd.power_off = th1520_pd_power_off;
+	pd->genpd.name = pi->name;
+
+	ret = pm_genpd_init(&pd->genpd, NULL, true);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pd;
+}
+
+static void th1520_pd_init_all_off(struct generic_pm_domain **domains,
+				   struct device *dev)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
+		struct th1520_power_domain *pd =
+			to_th1520_power_domain(domains[i]);
+
+		ret = th1520_aon_power_update(pd->aon_chan, pd->rsrc, false);
+		if (ret)
+			dev_err(dev,
+				"Failed to initially power down power domain %s\n",
+				pd->genpd.name);
+	}
+}
+
+static int th1520_pd_probe(struct platform_device *pdev)
+{
+	struct generic_pm_domain **domains;
+	struct genpd_onecell_data *pd_data;
+	struct th1520_aon_chan *aon_chan;
+	struct device *dev = &pdev->dev;
+	int i;
+
+	aon_chan = dev_get_drvdata(dev->parent);
+	if (!aon_chan) {
+		dev_err(dev, "Failed to get AON channel from parent\n");
+		return -EINVAL;
+	}
+
+	domains = devm_kcalloc(dev, ARRAY_SIZE(th1520_pd_ranges),
+			       sizeof(*domains), GFP_KERNEL);
+	if (!domains)
+		return -ENOMEM;
+
+	pd_data = devm_kzalloc(dev, sizeof(*pd_data), GFP_KERNEL);
+	if (!pd_data)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
+		struct th1520_power_domain *pd;
+
+		pd = th1520_add_pm_domain(dev, &th1520_pd_ranges[i]);
+		if (IS_ERR(pd))
+			return PTR_ERR(pd);
+
+		pd->aon_chan = aon_chan;
+		domains[i] = &pd->genpd;
+		dev_dbg(dev, "added power domain %s\n", pd->genpd.name);
+	}
+
+	pd_data->domains = domains;
+	pd_data->num_domains = ARRAY_SIZE(th1520_pd_ranges);
+	pd_data->xlate = th1520_pd_xlate;
+
+	/*
+	 * Initialize all power domains to off to ensure they start in a
+	 * low-power state. This allows device drivers to manage power
+	 * domains by turning them on or off as needed.
+	 */
+	th1520_pd_init_all_off(domains, dev);
+
+	return of_genpd_add_provider_onecell(dev->of_node, pd_data);
+}
+
+static const struct of_device_id th1520_pd_match[] = {
+	{ .compatible = "thead,th1520-pd" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver th1520_pd_driver = {
+	.driver = {
+		.name = "th1520-pd",
+		.of_match_table = th1520_pd_match,
+	},
+	.probe = th1520_pd_probe,
+};
+module_platform_driver(th1520_pd_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("T-HEAD TH1520 SoC power domain controller");
+MODULE_LICENSE("GPL");
-- 
2.34.1


