Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3AF6A859C
	for <lists+linux-clk@lfdr.de>; Thu,  2 Mar 2023 16:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjCBPtl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 2 Mar 2023 10:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjCBPt3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Mar 2023 10:49:29 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7506643468
        for <linux-clk@vger.kernel.org>; Thu,  2 Mar 2023 07:49:12 -0800 (PST)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 97E4D3F231
        for <linux-clk@vger.kernel.org>; Thu,  2 Mar 2023 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1677772143;
        bh=26437nXpVLIvdfg2JB4Z5LtSENxYNL+8c1al12BRcCM=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=VTMeHmkAhZfyk+Id97d0vsia8x3WRlqbL3JQG+dezPONxUdWrJUXeamyohmEtv9KO
         Ckk37EI3vvvrotfGhcCGuVSuUfgS12msr4PEx6jINlMt+Goj8pEOccavaeOQoe9Ezx
         NlsAaxfjPgDVoWewXSyAy8Lh1Gv5UDl2xStuBBF7wso8fOAoM/usZlddEaQL88uOcW
         FE22yyxQ1GJJKKcSqTqMJM/q+Lfj99dzr8HOuGAv+MgUJ+ngiyOhCjEoBui3d+tE66
         DMAj697Es02vwIJA53CPSGl38pzLUITh/TNQ+0HMgMNCyhdbSe58Xe7lr1HB4h0cEA
         hcaoqII4u165A==
Received: by mail-qv1-f70.google.com with SMTP id ny17-20020a056214399100b00570f687e908so9028023qvb.14
        for <linux-clk@vger.kernel.org>; Thu, 02 Mar 2023 07:49:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677772142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26437nXpVLIvdfg2JB4Z5LtSENxYNL+8c1al12BRcCM=;
        b=AYQaTESmfzrPtW+M+8Yp+ddcO3s9cXA28i5ubKd31sJ6NKMG5TgOhwReN9ozhY+4+l
         13nle33kRkzcuCYMQU+OCdWL0zMidh7NRTLbIrmF6BY41PSEFZBCE2yjnhiq/E737r5Z
         piL1N8ReoCxG59erCMAecb5+JgJdQ66t2xUDWqBp6P4HvtO101drCpePybIHVGg3HzQf
         1WRXjWUbJenLvKii73vRoQITQe0ks7iPWHENwzSxPpA1bKHPoMO/DigcKU2kXNIc6kNG
         afnWYTMH8C2kKSl9326ksP58MRozAPcae2/sOWMA8fiY8b+o/f2uP6SbK4tbzv9VX3ti
         qqbA==
X-Gm-Message-State: AO0yUKWDdgNuCzdVb5+ocsz68WApyVykWZQWTnftqhq1c+85ZDIhY41x
        A03X+C0Dgzvk10SvaLCMiTF+r1D7dFJ/Tpk63rmDDGALkFAn6lqr01JyTkOnAQCSFjiu9Bb2F8L
        43tnf3U03BLCZih+keOw7M14CPgsjKTJRyaCmtarEJc8Ui1tUG1X0UxZ7gEg=
X-Received: by 2002:a05:620a:8507:b0:742:72c6:a140 with SMTP id pe7-20020a05620a850700b0074272c6a140mr2742726qkn.7.1677772142055;
        Thu, 02 Mar 2023 07:49:02 -0800 (PST)
X-Google-Smtp-Source: AK7set85+Cm77MyzMrEEH75ngClLjWoi9FAzp9hBuPRmAfS8DG4Ui7kSmFYG8gaN7QUtuqikVXUnTy2DIKbarZK//fw=
X-Received: by 2002:a05:620a:8507:b0:742:72c6:a140 with SMTP id
 pe7-20020a05620a850700b0074272c6a140mr2742708qkn.7.1677772141789; Thu, 02 Mar
 2023 07:49:01 -0800 (PST)
MIME-Version: 1.0
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com> <20230221083323.302471-10-xingyu.wu@starfivetech.com>
In-Reply-To: <20230221083323.302471-10-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Thu, 2 Mar 2023 16:48:45 +0100
Message-ID: <CAJM55Z8XnBtBJK8tgDBoQ0FLFY10NQ3es7Aj0TwiTG6vfzqUSQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] clk: starfive: Add StarFive JH7110 Video-Output
 clock driver
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 21 Feb 2023 at 09:40, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add driver for the StarFive JH7110 Video-Output clock controller.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  11 +
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jh7110-vout.c   | 261 ++++++++++++++++++
>  3 files changed, 273 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-vout.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 59499acb95f7..5ebf1ed08627 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -64,3 +64,14 @@ config CLK_STARFIVE_JH7110_ISP
>         help
>           Say yes here to support the Image-Signal-Process clock controller
>           on the StarFive JH7110 SoC.
> +
> +config CLK_STARFIVE_JH7110_VOUT
> +       tristate "StarFive JH7110 Video-Output clock support"
> +       depends on CLK_STARFIVE_JH7110_SYS && JH71XX_PMU
> +       select AUXILIARY_BUS
> +       select CLK_STARFIVE_JH71X0
> +       select RESET_STARFIVE_JH7110
> +       default CLK_STARFIVE_JH7110_SYS

default m if ARCH_STARFIVE

> +       help
> +         Say yes here to support the Video-Output clock controller
> +         on the StarFive JH7110 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 76fb9f8d628b..841377e45bb6 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_SYS)   += clk-starfive-jh7110-sys.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)  += clk-starfive-jh7110-aon.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)  += clk-starfive-jh7110-stg.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)  += clk-starfive-jh7110-isp.o
> +obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT) += clk-starfive-jh7110-vout.o
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> new file mode 100644
> index 000000000000..d786537563a4
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7110 Video-Output Clock Driver
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +/* external clocks */
> +#define JH7110_VOUTCLK_VOUT_SRC                        (JH7110_VOUTCLK_END + 0)
> +#define JH7110_VOUTCLK_VOUT_TOP_AHB            (JH7110_VOUTCLK_END + 1)
> +#define JH7110_VOUTCLK_VOUT_TOP_AXI            (JH7110_VOUTCLK_END + 2)
> +#define JH7110_VOUTCLK_VOUT_TOP_HDMITX0_MCLK   (JH7110_VOUTCLK_END + 3)
> +#define JH7110_VOUTCLK_I2STX0_BCLK             (JH7110_VOUTCLK_END + 4)
> +#define JH7110_VOUTCLK_HDMITX0_PIXELCLK                (JH7110_VOUTCLK_END + 5)
> +#define JH7110_VOUTCLK_EXT_END                 (JH7110_VOUTCLK_END + 6)
> +
> +static const struct jh71x0_clk_data jh7110_voutclk_data[] = {
> +       /* divider */
> +       JH71X0__DIV(JH7110_VOUTCLK_APB, "apb", 8, JH7110_VOUTCLK_VOUT_TOP_AHB),
> +       JH71X0__DIV(JH7110_VOUTCLK_DC8200_PIX, "dc8200_pix", 63, JH7110_VOUTCLK_VOUT_SRC),
> +       JH71X0__DIV(JH7110_VOUTCLK_DSI_SYS, "dsi_sys", 31, JH7110_VOUTCLK_VOUT_SRC),
> +       JH71X0__DIV(JH7110_VOUTCLK_TX_ESC, "tx_esc", 31, JH7110_VOUTCLK_VOUT_TOP_AHB),
> +       /* dc8200 */
> +       JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
> +       JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
> +       JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0, JH7110_VOUTCLK_VOUT_TOP_AHB),
> +       JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0, 2,
> +                   JH7110_VOUTCLK_DC8200_PIX,
> +                   JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> +       JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0, 2,
> +                   JH7110_VOUTCLK_DC8200_PIX,
> +                   JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> +       /* LCD */
> +       JH71X0_GMUX(JH7110_VOUTCLK_DOM_VOUT_TOP_LCD, "dom_vout_top_lcd", 0, 2,
> +                   JH7110_VOUTCLK_DC8200_PIX0,
> +                   JH7110_VOUTCLK_DC8200_PIX1),
> +       /* dsiTx */
> +       JH71X0_GATE(JH7110_VOUTCLK_DSITX_APB, "dsiTx_apb", 0, JH7110_VOUTCLK_DSI_SYS),
> +       JH71X0_GATE(JH7110_VOUTCLK_DSITX_SYS, "dsiTx_sys", 0, JH7110_VOUTCLK_DSI_SYS),
> +       JH71X0_GMUX(JH7110_VOUTCLK_DSITX_DPI, "dsiTx_dpi", 0, 2,
> +                   JH7110_VOUTCLK_DC8200_PIX,
> +                   JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> +       JH71X0_GATE(JH7110_VOUTCLK_DSITX_TXESC, "dsiTx_txesc", 0, JH7110_VOUTCLK_TX_ESC),
> +       /* mipitx DPHY */
> +       JH71X0_GATE(JH7110_VOUTCLK_MIPITX_DPHY_TXESC, "mipitx_dphy_txesc", 0,
> +                   JH7110_VOUTCLK_TX_ESC),
> +       /* hdmi */
> +       JH71X0_GATE(JH7110_VOUTCLK_HDMI_TX_MCLK, "hdmi_tx_mclk", 0,
> +                   JH7110_VOUTCLK_VOUT_TOP_HDMITX0_MCLK),
> +       JH71X0_GATE(JH7110_VOUTCLK_HDMI_TX_BCLK, "hdmi_tx_bclk", 0,
> +                   JH7110_VOUTCLK_I2STX0_BCLK),
> +       JH71X0_GATE(JH7110_VOUTCLK_HDMI_TX_SYS, "hdmi_tx_sys", 0, JH7110_VOUTCLK_APB),
> +};
> +
> +struct vout_top_crg {
> +       struct clk_bulk_data *top_clks;
> +       struct reset_control *top_rst;
> +       int top_clks_num;
> +       void __iomem *base;
> +};
> +
> +static struct clk_bulk_data jh7110_vout_top_clks[] = {
> +       { .id = "vout_src" },
> +       { .id = "vout_top_ahb" }
> +};
> +
> +static struct vout_top_crg *top_crg_from(void __iomem **base)
> +{
> +       return container_of(base, struct vout_top_crg, base);
> +}
> +
> +static int jh7110_vout_top_crg_get(struct jh71x0_clk_priv *priv, struct vout_top_crg *top)
> +{
> +       int ret;
> +
> +       top->top_clks = jh7110_vout_top_clks;
> +       top->top_clks_num = ARRAY_SIZE(jh7110_vout_top_clks);
> +       ret = devm_clk_bulk_get(priv->dev, top->top_clks_num, top->top_clks);
> +       if (ret) {
> +               dev_err(priv->dev, "top clks get failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       /* The reset should be shared and other Vout modules will use its. */
> +       top->top_rst = devm_reset_control_get_shared(priv->dev, NULL);
> +       if (IS_ERR(top->top_rst)) {
> +               dev_err(priv->dev, "top rst get failed\n");
> +               return PTR_ERR(top->top_rst);
> +       }
> +
> +       return 0;
> +}
> +
> +static int jh7110_vout_top_crg_enable(struct vout_top_crg *top)
> +{
> +       int ret;
> +
> +       ret = clk_bulk_prepare_enable(top->top_clks_num, top->top_clks);
> +       if (ret)
> +               return ret;

Hmm.. do all the clocks used as input really need to be enabled for
any one of the vout clocks to work?

In other words: suppose you just need a single clock in the VOUTCRG
domain. Do we really need to turn on all the input clocks for the
VOUTCRG for that one clock to work? Normally I'd expect the clock
framework to make sure all parents of that clock are enabled.

> +
> +       return reset_control_deassert(top->top_rst);
> +}
> +
> +static void jh7110_vout_top_crg_disable(struct vout_top_crg *top)
> +{
> +       clk_bulk_disable_unprepare(top->top_clks_num, top->top_clks);
> +}
> +
> +static struct clk_hw *jh7110_voutclk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct jh71x0_clk_priv *priv = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx < JH7110_VOUTCLK_END)
> +               return &priv->reg[idx].hw;
> +
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +static int jh7110_voutcrg_probe(struct platform_device *pdev)
> +{
> +       struct jh71x0_clk_priv *priv;
> +       struct vout_top_crg *top;
> +       unsigned int idx;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev,
> +                           struct_size(priv, reg, JH7110_VOUTCLK_END),
> +                           GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       top = devm_kzalloc(&pdev->dev, sizeof(*top), GFP_KERNEL);
> +       if (!top)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->rmw_lock);
> +       priv->dev = &pdev->dev;
> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       top->base = priv->base;
> +       dev_set_drvdata(priv->dev, (void *)(&top->base));
> +
> +       pm_runtime_enable(priv->dev);
> +       ret = pm_runtime_get_sync(priv->dev);
> +       if (ret < 0) {
> +               dev_err(priv->dev, "failed to turn power: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = jh7110_vout_top_crg_get(priv, top);
> +       if (ret)
> +               goto err_clk;
> +
> +       ret = jh7110_vout_top_crg_enable(top);
> +       if (ret)
> +               goto err_clk;
> +
> +       for (idx = 0; idx < JH7110_VOUTCLK_END; idx++) {
> +               u32 max = jh7110_voutclk_data[idx].max;
> +               struct clk_parent_data parents[4] = {};
> +               struct clk_init_data init = {
> +                       .name = jh7110_voutclk_data[idx].name,
> +                       .ops = starfive_jh71x0_clk_ops(max),
> +                       .parent_data = parents,
> +                       .num_parents =
> +                               ((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> +                       .flags = jh7110_voutclk_data[idx].flags,
> +               };
> +               struct jh71x0_clk *clk = &priv->reg[idx];
> +               unsigned int i;
> +               char *fw_name[JH7110_VOUTCLK_EXT_END - JH7110_VOUTCLK_END] = {

this can be const char *const fw_name[...] right?

> +                       "vout_src",
> +                       "vout_top_ahb",
> +                       "vout_top_axi",
> +                       "vout_top_hdmitx0_mclk",
> +                       "i2stx0_bclk",
> +                       "hdmitx0_pixelclk"
> +               };
> +
> +               for (i = 0; i < init.num_parents; i++) {
> +                       unsigned int pidx = jh7110_voutclk_data[idx].parents[i];
> +
> +                       if (pidx < JH7110_VOUTCLK_END)
> +                               parents[i].hw = &priv->reg[pidx].hw;
> +                       else if (pidx < JH7110_VOUTCLK_EXT_END)
> +                               parents[i].fw_name = fw_name[pidx - JH7110_VOUTCLK_END];
> +               }
> +
> +               clk->hw.init = &init;
> +               clk->idx = idx;
> +               clk->max_div = max & JH71X0_CLK_DIV_MASK;
> +
> +               ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> +               if (ret)
> +                       goto err_exit;
> +       }
> +
> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_voutclk_get, priv);
> +       if (ret)
> +               goto err_exit;
> +
> +       ret = jh7110_reset_controller_register(priv, "reset-vout", 4);
> +       if (ret)
> +               goto err_exit;
> +
> +       return 0;
> +
> +err_exit:
> +       jh7110_vout_top_crg_disable(top);
> +err_clk:
> +       pm_runtime_put_sync(priv->dev);
> +       pm_runtime_disable(priv->dev);
> +       return ret;
> +}
> +
> +static int jh7110_voutcrg_remove(struct platform_device *pdev)
> +{
> +       void __iomem **base = dev_get_drvdata(&pdev->dev);
> +       struct vout_top_crg *top = top_crg_from(base);
> +
> +       jh7110_vout_top_crg_disable(top);
> +       pm_runtime_disable(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id jh7110_voutcrg_match[] = {
> +       { .compatible = "starfive,jh7110-voutcrg" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, jh7110_voutcrg_match);
> +
> +static struct platform_driver jh7110_voutcrg_driver = {
> +       .probe = jh7110_voutcrg_probe,
> +       .remove = jh7110_voutcrg_remove,
> +       .driver = {
> +               .name = "clk-starfive-jh7110-vout",
> +               .of_match_table = jh7110_voutcrg_match,
> +       },
> +};
> +module_platform_driver(jh7110_voutcrg_driver);
> +
> +MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive JH7110 Video-Output clock driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
