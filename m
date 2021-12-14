Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3AB4741F2
	for <lists+linux-clk@lfdr.de>; Tue, 14 Dec 2021 13:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbhLNMDJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Dec 2021 07:03:09 -0500
Received: from mail-4322.protonmail.ch ([185.70.43.22]:41419 "EHLO
        mail-4322.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhLNMDI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 07:03:08 -0500
Date:   Tue, 14 Dec 2021 12:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail2; t=1639483386;
        bh=p+eA/464g+42bqcIYHs3jjn75snCqIlBs7kmgWNDdMU=;
        h=Date:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:References:
         From:To:Cc;
        b=BzaEw4F1rELAATWLQdD8HDlTKJIzeRvnboNvE5ZTYuAf1zU1251Il+QLigya4YW7p
         6Xyxqs3dcgb7c3ZHpybzGhExIZD7CtOKKA2g7CPG7RNg736cnNrx5jxs327SRdOhvN
         1CYIOJtRQYyMV/i4YQNxATpBCcRQvCbBLWkwUfHf4jGQWXo2o73zZsMJwxtNPin7PZ
         DBBDE7BLxz3Q9G/iKIBNPMZr675pP3iJzgOWD9FdNMWtbhhHOrbpGaUO8Y26lZFUBR
         v/q9mZNUg5MycwyhAmFGojv6FN0No7K6D2iiF1WLrmgN0m6sHZweHd/vtfC+dE+g7D
         a4n90H0bhbSKw==
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        kettenis@openbsd.org, marcan@marcan.st, sven@svenpeter.dev,
        =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Subject: [PATCH 2/2] clk: clk-apple-nco: Add driver for Apple NCO
Message-ID: <20211214120213.15649-3-povik@protonmail.com>
In-Reply-To: <20211214120213.15649-1-povik@protonmail.com>
References: <20211214120213.15649-1-povik@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MISSING_HEADERS
        shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a common clock driver for NCO blocks found on Apple SoCs where they
are typically the generators of audio clocks.

Signed-off-by: Martin Povi=C5=A1er <povik@protonmail.com>
---
 drivers/clk/Kconfig         |   9 ++
 drivers/clk/Makefile        |   1 +
 drivers/clk/clk-apple-nco.c | 299 ++++++++++++++++++++++++++++++++++++
 3 files changed, 309 insertions(+)
 create mode 100644 drivers/clk/clk-apple-nco.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c5b3dc97396a..d2b3d40de29d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -390,6 +390,15 @@ config COMMON_CLK_K210
 =09help
 =09  Support for the Canaan Kendryte K210 RISC-V SoC clocks.

+config COMMON_CLK_APPLE_NCO
+=09bool "Clock driver for Apple SoC NCOs"
+=09depends on ARCH_APPLE || COMPILE_TEST
+=09default ARCH_APPLE
+=09help
+=09  This driver supports NCO (Numerically Controlled Oscillator) blocks
+=09  found on Apple SoCs such as t8103 (M1). The blocks are typically
+=09  generators of audio clocks.
+
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/baikal-t1/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 6afe36bd2c0a..0f39db8664cc 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -17,6 +17,7 @@ endif

 # hardware specific clock types
 # please keep this section sorted lexicographically by file path name
+obj-$(CONFIG_COMMON_CLK_APPLE_NCO)  =09+=3D clk-apple-nco.o
 obj-$(CONFIG_MACH_ASM9260)=09=09+=3D clk-asm9260.o
 obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)=09+=3D clk-axi-clkgen.o
 obj-$(CONFIG_ARCH_AXXIA)=09=09+=3D clk-axm5516.o
diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
new file mode 100644
index 000000000000..152901f6a40d
--- /dev/null
+++ b/drivers/clk/clk-apple-nco.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple NCO (Numerically Controlled Oscillator) clock driver
+ *
+ * Driver for an SoC block found on t8103 (M1) and other Apple chips
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_clk.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+
+#define NCO_CHANNEL_STRIDE=090x4000
+
+#define REG_CTRL=090
+#define CTRL_ENABLE=09BIT(31)
+#define REG_DIV=09=094
+#define DIV_FINE=09GENMASK(1, 0)
+#define DIV_COARSE=09GENMASK(12, 2)
+#define REG_INC1=098
+#define REG_INC2=0912
+#define REG_ACCINIT=0916
+
+struct nco_tables;
+
+struct nco_channel {
+=09void __iomem *base;
+=09struct nco_tables *tbl;
+=09struct clk_hw hw;
+};
+
+#define to_nco_channel(_hw) container_of(_hw, struct nco_channel, hw)
+
+#define LFSR_POLY=090xa01
+#define LFSR_INIT=090x7ff
+#define LFSR_LEN=0911
+#define LFSR_PERIOD=09((1 << LFSR_LEN) - 1)
+#define LFSR_TBLSIZE=09(1 << LFSR_LEN)
+
+/* The minimal attainable coarse divisor (first value in table) */
+#define COARSE_DIV_OFFSET 2
+
+struct nco_tables {
+=09u16 fwd[LFSR_TBLSIZE];
+=09u16 inv[LFSR_TBLSIZE];
+};
+
+static int nco_enable(struct clk_hw *hw);
+static void nco_disable(struct clk_hw *hw);
+static int nco_is_enabled(struct clk_hw *hw);
+
+static void nco_compute_tables(struct nco_tables *tbl)
+{
+=09int i;
+=09u32 state =3D LFSR_INIT;
+
+=09/*
+=09 * Go through the states of a galois LFSR and build
+=09 * a coarse divisor translation table.
+=09 */
+=09for (i =3D LFSR_PERIOD; i > 0; i--) {
+=09=09if (state & 1)
+=09=09=09state =3D (state >> 1) ^ (LFSR_POLY >> 1);
+=09=09else
+=09=09=09state =3D (state >> 1);
+=09=09tbl->fwd[i] =3D state;
+=09=09tbl->inv[state] =3D i;
+=09}
+
+=09/* Zero value is special-cased */
+=09tbl->fwd[0] =3D 0;
+=09tbl->inv[0] =3D 0;
+}
+
+static bool nco_div_check(int div)
+{
+=09int coarse =3D div / 4;
+=09return coarse >=3D COARSE_DIV_OFFSET &&
+=09=09coarse < COARSE_DIV_OFFSET + LFSR_TBLSIZE;
+}
+
+static u32 nco_div_translate(struct nco_tables *tbl, int div)
+{
+=09int coarse =3D div / 4;
+
+=09if (WARN_ON(!nco_div_check(div)))
+=09=09return 0;
+
+=09return FIELD_PREP(DIV_COARSE, tbl->fwd[coarse - COARSE_DIV_OFFSET]) |
+=09=09=09FIELD_PREP(DIV_FINE, div % 4);
+}
+
+static int nco_div_translate_inv(struct nco_tables *tbl, int regval)
+{
+=09int coarse, fine;
+
+=09coarse =3D tbl->inv[FIELD_GET(DIV_COARSE, regval)] + COARSE_DIV_OFFSET;
+=09fine =3D FIELD_GET(DIV_FINE, regval);
+
+=09return coarse * 4 + fine;
+}
+
+static int nco_set_rate(struct clk_hw *hw, unsigned long rate,
+=09=09=09=09unsigned long parent_rate)
+{
+=09struct nco_channel *chan =3D to_nco_channel(hw);
+=09u32 div;
+=09s32 inc1, inc2;
+=09bool was_enabled;
+
+=09was_enabled =3D nco_is_enabled(hw);
+=09nco_disable(hw);
+
+=09div =3D 2 * parent_rate / rate;
+=09inc1 =3D 2 * parent_rate - div * rate;
+=09inc2 =3D -((s32) (rate - inc1));
+
+=09if (!nco_div_check(div))
+=09=09return -EINVAL;
+
+=09div =3D nco_div_translate(chan->tbl, div);
+
+=09writel_relaxed(div,  chan->base + REG_DIV);
+=09writel_relaxed(inc1, chan->base + REG_INC1);
+=09writel_relaxed(inc2, chan->base + REG_INC2);
+=09writel_relaxed(1 << 31, chan->base + REG_ACCINIT);
+
+=09if (was_enabled)
+=09=09nco_enable(hw);
+
+=09return 0;
+}
+
+static unsigned long nco_recalc_rate(struct clk_hw *hw,
+=09=09=09=09unsigned long parent_rate)
+{
+=09struct nco_channel *chan =3D to_nco_channel(hw);
+=09u32 div;
+=09s32 inc1, inc2, incbase;
+
+=09div =3D nco_div_translate_inv(chan->tbl,
+=09=09=09readl_relaxed(chan->base + REG_DIV));
+
+=09inc1 =3D readl_relaxed(chan->base + REG_INC1);
+=09inc2 =3D readl_relaxed(chan->base + REG_INC2);
+
+=09/*
+=09 * We don't support wraparound of accumulator
+=09 * nor the edge case of both increments being zero
+=09 */
+=09if (inc1 < 0 || inc2 > 0 || (inc1 =3D=3D 0 && inc2 =3D=3D 0))
+=09=09return 0;
+
+=09/* Scale both sides of division by incbase to maintain precision */
+=09incbase =3D inc1 - inc2;
+
+=09return div_u64(((u64) parent_rate) * 2 * incbase,
+=09=09=09((u64) div) * incbase + inc1);
+}
+
+static long nco_round_rate(struct clk_hw *hw, unsigned long rate,
+=09=09=09=09unsigned long *parent_rate)
+{
+=09unsigned long lo =3D *parent_rate / (COARSE_DIV_OFFSET + LFSR_TBLSIZE) =
+ 1;
+=09unsigned long hi =3D *parent_rate / COARSE_DIV_OFFSET;
+
+=09return clamp(rate, lo, hi);
+}
+
+static int nco_enable(struct clk_hw *hw)
+{
+=09struct nco_channel *chan =3D to_nco_channel(hw);
+=09u32 val;
+
+=09val =3D readl_relaxed(chan->base + REG_CTRL);
+=09writel_relaxed(val | CTRL_ENABLE, chan->base + REG_CTRL);
+=09return 0;
+}
+
+static void nco_disable(struct clk_hw *hw)
+{
+=09struct nco_channel *chan =3D to_nco_channel(hw);
+=09u32 val;
+
+=09val =3D readl_relaxed(chan->base + REG_CTRL);
+=09writel_relaxed(val & ~CTRL_ENABLE, chan->base + REG_CTRL);
+}
+
+static int nco_is_enabled(struct clk_hw *hw)
+{
+=09struct nco_channel *chan =3D to_nco_channel(hw);
+
+=09return (readl_relaxed(chan->base + REG_CTRL) & CTRL_ENABLE) !=3D 0;
+}
+
+static const struct clk_ops nco_ops =3D {
+=09.set_rate =3D nco_set_rate,
+=09.recalc_rate =3D nco_recalc_rate,
+=09.round_rate =3D nco_round_rate,
+=09.enable =3D nco_enable,
+=09.disable =3D nco_disable,
+=09.is_enabled =3D nco_is_enabled,
+};
+
+static int apple_nco_probe(struct platform_device *pdev)
+{
+=09struct device_node *np =3D pdev->dev.of_node;
+=09struct clk_init_data init;
+=09struct clk_hw_onecell_data *onecell_data;
+=09const char *parent_name;
+=09void __iomem *regs;
+=09struct nco_tables *tbl;
+=09int nchannels;
+=09int ret, i;
+
+=09ret =3D of_property_read_u32(np, "apple,nchannels", &nchannels);
+=09if (ret) {
+=09=09dev_err(&pdev->dev, "missing or invalid apple,nchannels property\n")=
;
+=09=09return -EINVAL;
+=09}
+
+=09regs =3D devm_platform_ioremap_resource(pdev, 0);
+=09if (IS_ERR(regs))
+=09=09return PTR_ERR(regs);
+
+=09if (of_clk_get_parent_count(np) !=3D 1)
+=09=09return -EINVAL;
+=09parent_name =3D of_clk_get_parent_name(np, 0);
+=09if (!parent_name)
+=09=09return -EINVAL;
+
+=09onecell_data =3D devm_kzalloc(&pdev->dev, struct_size(onecell_data, hws=
,
+=09=09=09=09=09=09=09nchannels), GFP_KERNEL);
+=09if (!onecell_data)
+=09=09return -ENOMEM;
+=09onecell_data->num =3D nchannels;
+
+=09tbl =3D devm_kzalloc(&pdev->dev, sizeof(*tbl), GFP_KERNEL);
+=09if (!tbl)
+=09=09return -ENOMEM;
+=09nco_compute_tables(tbl);
+
+=09for (i =3D 0; i < nchannels; i++) {
+=09=09struct nco_channel *chan;
+
+=09=09chan =3D devm_kzalloc(&pdev->dev, sizeof(*chan), GFP_KERNEL);
+=09=09if (!chan)
+=09=09=09return -ENOMEM;
+=09=09chan->base =3D regs + NCO_CHANNEL_STRIDE*i;
+=09=09chan->tbl =3D tbl;
+
+=09=09memset(&init, 0, sizeof(init));
+=09=09init.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
+=09=09=09=09=09=09"%s-%d", np->name, i);
+=09=09init.ops =3D &nco_ops;
+=09=09init.num_parents =3D 1;
+=09=09init.parent_names =3D &parent_name;
+=09=09init.flags =3D 0;
+
+=09=09chan->hw.init =3D &init;
+=09=09ret =3D devm_clk_hw_register(&pdev->dev, &chan->hw);
+=09=09if (ret)
+=09=09=09return ret;
+
+=09=09onecell_data->hws[i] =3D &chan->hw;
+=09}
+
+=09ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+=09=09=09=09=09=09=09onecell_data);
+=09if (ret)
+=09=09return ret;
+
+=09return 0;
+}
+
+static const struct of_device_id apple_nco_ids[] =3D {
+=09{ .compatible =3D "apple,nco" },
+=09{ },
+};
+MODULE_DEVICE_TABLE(of, apple_nco_ids)
+
+static struct platform_driver apple_nco_driver =3D {
+=09.driver =3D {
+=09=09.name =3D "apple-nco",
+=09=09.of_match_table =3D apple_nco_ids,
+=09},
+=09.probe =3D apple_nco_probe,
+};
+module_platform_driver(apple_nco_driver);
+
+MODULE_AUTHOR("Martin Povi=C5=A1er <povik@protonmail.com>");
+MODULE_DESCRIPTION("Clock driver for NCO blocks on Apple SoCs");
+MODULE_LICENSE("GPL v2");
--
2.33.0


