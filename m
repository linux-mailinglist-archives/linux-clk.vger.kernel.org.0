Return-Path: <linux-clk+bounces-982-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8236806F19
	for <lists+linux-clk@lfdr.de>; Wed,  6 Dec 2023 12:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E578281B9C
	for <lists+linux-clk@lfdr.de>; Wed,  6 Dec 2023 11:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937F8347C0;
	Wed,  6 Dec 2023 11:52:24 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904971FE9;
	Wed,  6 Dec 2023 03:51:51 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 253EB24E317;
	Wed,  6 Dec 2023 19:51:50 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 19:51:50 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 6 Dec 2023 19:51:43 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <kernel@esmil.dk>, <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <p.zabel@pengutronix.de>,
	<emil.renner.berthing@canonical.com>, <hal.feng@starfivetech.com>,
	<xingyu.wu@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>
Subject: [PATCH v1 12/16] clk: starfive: Add JH8100 System-South-West clock generator driver
Date: Wed, 6 Dec 2023 19:49:56 +0800
Message-ID: <20231206115000.295825-13-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Add support for JH8100 System-South-West clock generator.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 drivers/clk/starfive/Kconfig             |   8 ++
 drivers/clk/starfive/jh8100/Makefile     |   1 +
 drivers/clk/starfive/jh8100/clk-sys-sw.c | 136 +++++++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 drivers/clk/starfive/jh8100/clk-sys-sw.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index acd530c3897b..2d8a1e0fae8a 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -97,3 +97,11 @@ config CLK_STARFIVE_JH8100_SYS_NE
 	help
 	  Say yes here to support the System-North-East clock controller on the=
 StarFive JH8100
 	  SoC.
+
+config CLK_STARFIVE_JH8100_SYS_SW
+	bool "StarFive JH8100 System-South-West clock support"
+	depends on CLK_STARFIVE_JH8100_SYS
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the System-South-West clock controller on the=
 StarFive JH8100
+	  SoC.
diff --git a/drivers/clk/starfive/jh8100/Makefile b/drivers/clk/starfive/=
jh8100/Makefile
index 164c1d55b97c..5c14bff5c541 100644
--- a/drivers/clk/starfive/jh8100/Makefile
+++ b/drivers/clk/starfive/jh8100/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS)		+=3D clk-sys.o
 obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS_NW)	+=3D clk-sys-nw.o
 obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS_NE)	+=3D clk-sys-ne.o
+obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS_SW)        +=3D clk-sys-sw.o
diff --git a/drivers/clk/starfive/jh8100/clk-sys-sw.c b/drivers/clk/starf=
ive/jh8100/clk-sys-sw.c
new file mode 100644
index 000000000000..d88dd8741b5d
--- /dev/null
+++ b/drivers/clk/starfive/jh8100/clk-sys-sw.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JH8100 System Clock Driver
+ *
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ *
+ * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
+ *
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/starfive,jh8100-crg.h>
+
+#include "clk-starfive-jh8100.h"
+
+/* external clocks */
+#define SYSCRG_SW_CLK_APB_BUS		(SYSCRG_SW_CLK_END + 0)
+#define SYSCRG_SW_CLK_VDEC_ROOT		(SYSCRG_SW_CLK_END + 1)
+#define SYSCRG_SW_CLK_FLEXNOC1		(SYSCRG_SW_CLK_END + 2)
+
+static const struct starfive_clk_data jh8100_syscrg_sw_clk_data[] =3D {
+	/* jpeg */
+	STARFIVE__DIV(SYSCRG_SW_CLK_JPEG_AXI, "sys_sw_clk_jpeg_axi", 20,
+		      SYSCRG_SW_CLK_VDEC_ROOT),
+	STARFIVE_GATE(SYSCRG_SW_CLK_VC9000DJ_AXI, "sys_sw_clk_vc9000dj_axi",
+		      CLK_IGNORE_UNUSED, SYSCRG_SW_CLK_JPEG_AXI),
+	STARFIVE_GDIV(SYSCRG_SW_CLK_VC9000DJ_VDEC, "sys_sw_clk_vc9000dj_vdec",
+		      CLK_IGNORE_UNUSED, 40, SYSCRG_SW_CLK_VDEC_ROOT),
+	STARFIVE_GATE(SYSCRG_SW_CLK_VC9000DJ_APB, "sys_sw_clk_vc9000dj_apb",
+		      CLK_IGNORE_UNUSED, SYSCRG_SW_CLK_APB_BUS),
+	/* video dec */
+	STARFIVE__DIV(SYSCRG_SW_CLK_VDEC_AXI, "sys_sw_clk_vdec_axi", 20,
+		      SYSCRG_SW_CLK_VDEC_ROOT),
+	STARFIVE_GATE(SYSCRG_SW_CLK_VC9000D_AXI, "sys_sw_clk_vc9000d_axi", CLK_=
IGNORE_UNUSED,
+		      SYSCRG_SW_CLK_VDEC_AXI),
+	STARFIVE_GDIV(SYSCRG_SW_CLK_VC9000D_VDEC, "sys_sw_clk_vc9000d_vdec",
+		      CLK_IGNORE_UNUSED, 40, SYSCRG_SW_CLK_FLEXNOC1),
+	STARFIVE_GATE(SYSCRG_SW_CLK_VC9000D_APB, "sys_sw_clk_vc9000d_apb", CLK_=
IGNORE_UNUSED,
+		      SYSCRG_SW_CLK_APB_BUS),
+	/* icg_en */
+	STARFIVE_GATE(SYSCRG_SW_CLK_JPEG_ICG_EN, "sys_sw_clk_jpeg_en", 0,
+		      SYSCRG_SW_CLK_VDEC_ROOT),
+	STARFIVE_GATE(SYSCRG_SW_CLK_VDEC_ICG_EN, "sys_sw_clk_vdec_en", 0,
+		      SYSCRG_SW_CLK_VDEC_AXI),
+};
+
+static struct clk_hw *jh8100_syscrg_sw_clk_get(struct of_phandle_args *c=
lkspec, void *data)
+{
+	struct starfive_clk_priv *priv =3D data;
+	unsigned int idx =3D clkspec->args[0];
+
+	if (idx < SYSCRG_SW_CLK_END)
+		return &priv->reg[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int jh8100_syscrg_sw_probe(struct platform_device *pdev)
+{
+	struct starfive_clk_priv *priv;
+	unsigned int idx;
+	int ret;
+
+	priv =3D devm_kzalloc(&pdev->dev,
+			    struct_size(priv, reg, SYSCRG_SW_CLK_END),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->rmw_lock);
+	priv->dev =3D &pdev->dev;
+	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	for (idx =3D 0; idx < SYSCRG_SW_CLK_END; idx++) {
+		u32 max =3D jh8100_syscrg_sw_clk_data[idx].max;
+		struct clk_parent_data parents[4] =3D {};
+		struct clk_init_data init =3D {
+			.name =3D jh8100_syscrg_sw_clk_data[idx].name,
+			.ops =3D starfive_clk_ops(max),
+			.parent_data =3D parents,
+			.num_parents =3D
+				((max & STARFIVE_CLK_MUX_MASK) >> STARFIVE_CLK_MUX_SHIFT) + 1,
+			.flags =3D jh8100_syscrg_sw_clk_data[idx].flags,
+		};
+		struct starfive_clk *clk =3D &priv->reg[idx];
+		unsigned int i;
+
+		for (i =3D 0; i < init.num_parents; i++) {
+			unsigned int pidx =3D jh8100_syscrg_sw_clk_data[idx].parents[i];
+
+			if (pidx < SYSCRG_SW_CLK_END)
+				parents[i].hw =3D &priv->reg[pidx].hw;
+			else if (pidx =3D=3D SYSCRG_SW_CLK_APB_BUS)
+				parents[i].fw_name =3D "sys_clk_apb_bus";
+			else if (pidx =3D=3D SYSCRG_SW_CLK_VDEC_ROOT)
+				parents[i].fw_name =3D "sys_clk_vdec_root";
+			else if (pidx =3D=3D SYSCRG_SW_CLK_FLEXNOC1)
+				parents[i].fw_name =3D "sys_clk_flexnoc1";
+		}
+
+		clk->hw.init =3D &init;
+		clk->idx =3D idx;
+		clk->max_div =3D max & STARFIVE_CLK_DIV_MASK;
+
+		ret =3D devm_clk_hw_register(&pdev->dev, &clk->hw);
+		if (ret)
+			return ret;
+	}
+
+	ret =3D devm_of_clk_add_hw_provider(&pdev->dev, jh8100_syscrg_sw_clk_ge=
t, priv);
+	if (ret)
+		return ret;
+
+	return jh8100_reset_controller_register(priv, "rst-sys-sw", 3);
+}
+
+static const struct of_device_id jh8100_syscrg_sw_match[] =3D {
+	{ .compatible =3D "starfive,jh8100-syscrg-sw" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jh8100_syscrg_sw_driver =3D {
+	.driver =3D {
+		.name =3D "clk-starfive-jh8100-sys-sw",
+		.of_match_table =3D jh8100_syscrg_sw_match,
+		.suppress_bind_attrs =3D true,
+	},
+};
+builtin_platform_driver_probe(jh8100_syscrg_sw_driver, jh8100_syscrg_sw_=
probe);
--=20
2.34.1


