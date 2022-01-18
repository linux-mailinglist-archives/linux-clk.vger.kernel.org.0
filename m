Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F20492E60
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jan 2022 20:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348713AbiARTVS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 18 Jan 2022 14:21:18 -0500
Received: from mail-4316.protonmail.ch ([185.70.43.16]:24135 "EHLO
        mail-4316.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348702AbiARTVR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 14:21:17 -0500
Date:   Tue, 18 Jan 2022 19:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail2; t=1642533674;
        bh=tfWAZJgnSaRC1MFVJbqL3tOrSHLv3FUslRpoETwgRGk=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=WJ0OzyCkH4+O5W9NDr9GUeSBP8lDpsthFx0+TSoNeoATpf3vPuYX4DBTUFXTtqy/V
         PIFbVEtyuaFHwwM4Ml7CN9ztbSALUKGAwiBV2cEFAledBnf7X1w/7jWqeMST4CedEz
         7uK5a7U4pN23V4USPW+p9KlLyVtOJ1ttxMBA6+ayEUWkiVPzAdJWeEDGFtYA72L8Y2
         ANlSfvIB0W959T96eP5lodK+0DcyibJAdXgs3D0aZz/T+0QU00wcRxkks38ru9slzD
         Jd8m0seYMIlh2br8BTzYMT+H/Qm99GLG1xIrWxneXxzA7OSzFF2bvyfm6JowNtR0S9
         i0ECcqe6WS5NA==
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>
Cc:     marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kettenis@openbsd.org,
        =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>
Subject: [PATCH v2 2/3] clk: clk-apple-nco: Add driver for Apple NCO
Message-ID: <20220118191839.64086-3-povik+lin@protonmail.com>
In-Reply-To: <20220118191839.64086-1-povik+lin@protonmail.com>
References: <20220118191839.64086-1-povik+lin@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a common clock driver for NCO blocks found on Apple SoCs where they
are typically the generators of audio clocks.

Signed-off-by: Martin Povi=C5=A1er <povik+lin@protonmail.com>
---
 drivers/clk/Kconfig         |   9 +
 drivers/clk/Makefile        |   1 +
 drivers/clk/clk-apple-nco.c | 340 ++++++++++++++++++++++++++++++++++++
 3 files changed, 350 insertions(+)
 create mode 100644 drivers/clk/clk-apple-nco.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index ad4256d54361..af4d037e18e3 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -59,6 +59,15 @@ config LMK04832
 =09  Say yes here to build support for Texas Instruments' LMK04832 Ultra
 =09  Low-Noise JESD204B Compliant Clock Jitter Cleaner With Dual Loop PLLs

+config COMMON_CLK_APPLE_NCO
+=09bool "Clock driver for Apple SoC NCOs"
+=09depends on ARCH_APPLE || COMPILE_TEST
+=09default ARCH_APPLE
+=09help
+=09  This driver supports NCO (Numerically Controlled Oscillator) blocks
+=09  found on Apple SoCs such as t8103 (M1). The blocks are typically
+=09  generators of audio clocks.
+
 config COMMON_CLK_MAX77686
 =09tristate "Clock driver for Maxim 77620/77686/77802 MFD"
 =09depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 16e588630472..e95e702bdaeb 100644
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
index 000000000000..593f5b5ce5b7
--- /dev/null
+++ b/drivers/clk/clk-apple-nco.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Driver for an SoC block (Numerically Controlled Oscillator)
+ * found on t8103 (M1) and other Apple chips
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_clk.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define NCO_CHANNEL_STRIDE=090x4000
+#define NCO_CHANNEL_REGSIZE=0920
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
+/*
+ * Theory of operation (postulated)
+ *
+ * The REG_DIV register indirectly expresses a base integer divisor, rough=
ly
+ * corresponding to twice the desired ratio of input to output clock. This
+ * base divisor is adjusted on a cycle-by-cycle basis based on the state o=
f a
+ * 32-bit phase accumulator to achieve a desired precise clock ratio over =
the
+ * long term.
+ *
+ * Specifically an output clock cycle is produced after (REG_DIV divisor)/=
2
+ * or (REG_DIV divisor + 1)/2 input cycles, the latter taking effect when =
top
+ * bit of the 32-bit accumulator is set. The accumulator is incremented ea=
ch
+ * produced output cycle, by the value from either REG_INC1 or REG_INC2, w=
hich
+ * of the two is selected depending again on the accumulator's current top=
 bit.
+ *
+ * Because the NCO hardware implements counting of input clock cycles in p=
art
+ * in a Galois linear-feedback shift register, the higher bits of divisor
+ * are programmed into REG_DIV by picking an appropriate LFSR state. See
+ * nco_compute_tables/nco_div_translate for details on this.
+ */
+
+struct nco_tables;
+
+struct nco_channel {
+=09void __iomem *base;
+=09struct nco_tables *tbl;
+=09struct clk_hw hw;
+
+=09spinlock_t lock;
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
+static void nco_enable_nolock(struct clk_hw *hw);
+static void nco_disable_nolock(struct clk_hw *hw);
+static int nco_is_enabled(struct clk_hw *hw);
+
+static void nco_compute_tables(struct nco_tables *tbl)
+{
+=09int i;
+=09u32 state =3D LFSR_INIT;
+
+=09/*
+=09 * Go through the states of a Galois LFSR and build
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
+static bool nco_div_out_of_range(unsigned int div)
+{
+=09unsigned int coarse =3D div / 4;
+=09return coarse < COARSE_DIV_OFFSET ||
+=09=09coarse >=3D COARSE_DIV_OFFSET + LFSR_TBLSIZE;
+}
+
+static u32 nco_div_translate(struct nco_tables *tbl, unsigned int div)
+{
+=09unsigned int coarse =3D div / 4;
+
+=09if (WARN_ON(nco_div_out_of_range(div)))
+=09=09return 0;
+
+=09return FIELD_PREP(DIV_COARSE, tbl->fwd[coarse - COARSE_DIV_OFFSET]) |
+=09=09=09FIELD_PREP(DIV_FINE, div % 4);
+}
+
+static unsigned int nco_div_translate_inv(struct nco_tables *tbl, u32 regv=
al)
+{
+=09unsigned int coarse, fine;
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
+=09unsigned long flags;
+=09u32 div;
+=09s32 inc1, inc2;
+=09bool was_enabled;
+
+=09div =3D 2 * parent_rate / rate;
+=09inc1 =3D 2 * parent_rate - div * rate;
+=09inc2 =3D -((s32) (rate - inc1));
+
+=09if (nco_div_out_of_range(div))
+=09=09return -EINVAL;
+
+=09div =3D nco_div_translate(chan->tbl, div);
+
+=09spin_lock_irqsave(&chan->lock, flags);
+=09was_enabled =3D nco_is_enabled(hw);
+=09nco_disable_nolock(hw);
+
+=09writel_relaxed(div,  chan->base + REG_DIV);
+=09writel_relaxed(inc1, chan->base + REG_INC1);
+=09writel_relaxed(inc2, chan->base + REG_INC2);
+
+=09/* Presumably a neutral initial value for accumulator */
+=09writel_relaxed(1 << 31, chan->base + REG_ACCINIT);
+
+=09if (was_enabled)
+=09=09nco_enable_nolock(hw);
+=09spin_unlock_irqrestore(&chan->lock, flags);
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
+static void nco_enable_nolock(struct clk_hw *hw)
+{
+=09struct nco_channel *chan =3D to_nco_channel(hw);
+=09u32 val;
+
+=09val =3D readl_relaxed(chan->base + REG_CTRL);
+=09writel_relaxed(val | CTRL_ENABLE, chan->base + REG_CTRL);
+}
+
+static void nco_disable_nolock(struct clk_hw *hw)
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
+static int nco_enable(struct clk_hw *hw)
+{
+=09struct nco_channel *chan =3D to_nco_channel(hw);
+=09unsigned long flags;
+
+=09spin_lock_irqsave(&chan->lock, flags);
+=09nco_enable_nolock(hw);
+=09spin_unlock_irqrestore(&chan->lock, flags);
+
+=09return 0;
+}
+
+static void nco_disable(struct clk_hw *hw)
+{
+=09struct nco_channel *chan =3D to_nco_channel(hw);
+=09unsigned long flags;
+
+=09spin_lock_irqsave(&chan->lock, flags);
+=09nco_disable_nolock(hw);
+=09spin_unlock_irqrestore(&chan->lock, flags);
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
+=09struct clk_parent_data pdata =3D { .index =3D 0 };
+=09struct clk_init_data init;
+=09struct clk_hw_onecell_data *onecell_data;
+=09void __iomem *regs;
+=09struct resource *regs_res;
+=09struct nco_tables *tbl;
+=09unsigned int nchannels;
+=09int ret, i;
+
+=09regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &regs_res);
+=09if (IS_ERR(regs))
+=09=09return PTR_ERR(regs);
+
+=09if (resource_size(regs_res) < NCO_CHANNEL_REGSIZE)
+=09=09return -EINVAL;
+=09nchannels =3D (resource_size(regs_res) - NCO_CHANNEL_REGSIZE)
+=09=09=09/ NCO_CHANNEL_STRIDE + 1;
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
+=09=09spin_lock_init(&chan->lock);
+
+=09=09memset(&init, 0, sizeof(init));
+=09=09init.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
+=09=09=09=09=09=09"%s-%d", np->name, i);
+=09=09init.ops =3D &nco_ops;
+=09=09init.parent_data =3D &pdata;
+=09=09init.num_parents =3D 1;
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
+=09return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+=09=09=09=09=09=09=09onecell_data);
+}
+
+static const struct of_device_id apple_nco_ids[] =3D {
+=09{ .compatible =3D "apple,nco" },
+=09{ }
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
+MODULE_AUTHOR("Martin Povi=C5=A1er <povik+lin@protonmail.com>");
+MODULE_DESCRIPTION("Clock driver for NCO blocks on Apple SoCs");
+MODULE_LICENSE("GPL v2");
--
2.33.0


