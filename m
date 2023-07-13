Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8263751E4F
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jul 2023 12:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbjGMKGr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 Jul 2023 06:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbjGMKGX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 06:06:23 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B65273E
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 03:06:07 -0700 (PDT)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 038493F0C3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689242765;
        bh=7D9j0MDilnvFprx+DsklvDNjNXoQbrJzlr03prvuUyc=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=mDs4klhTs1IU9OTC1Nui8e3ABSEt79KeAKVY0cbCT8uEyCoH3GtlQ9SDLarcCVzk+
         HreQA2aNTt2KwSk9Q442H62tYg+PTtd8SnRcdjY/my4TtG5arnwFWSjMq1v4pjUM9i
         Q+F+M7viLGCafy7bvqTsSnWHvSkqegGJot5dwI3PsCeQuDwMYaf2VjN1UrE6sfMIjp
         L4ILJgZxxMcDO7jAqE3dbdbXNi/b7aYWCQPIFUodz/vwU7YNG9N/XF9OHRn3JomxJ1
         EXvLXdqPFJw6b6m4GQY0knKgu6umnbGNI++arTmoa5ZK2NyKZsdFRa7t6tbT6/af2B
         qKy0kJe4bdjgQ==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-403b7a5be1dso5167121cf.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 03:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689242764; x=1691834764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7D9j0MDilnvFprx+DsklvDNjNXoQbrJzlr03prvuUyc=;
        b=j9uFJUuA2YJAab/nTLgH8yRKEMfX+eQI93E49s9YRw6HNlKBXJyRFpukU6VZ3YPZAI
         inTauEz0Kikpqig4ohJJ1OqS96oho4GBgkFpgLZLGEk0E9JLZVlMcTKNpBkpWFphzXFP
         PIIHiRSWS47HQ9bVPe1wlcWnUMI0xJsrdKf9u2rVLlPFKOaQgUHzX+rHg5maqj2qd8hB
         08H4kp+pPmSpmdPOqPQgwo4kBoShCut7+7cED52x/j+v5sMEl8i+SnV480qWIjHCl7LN
         nKKvIceonJ1VQu6rCLvMyePe9LtKtpVXaDmyMT6edaDGK//YqlhXV9NJxjV6Or0l0vl0
         8DxA==
X-Gm-Message-State: ABy/qLYX8zvTzgiGH4uUoibFI+ovjs88IBIWqH5vXJYNH91kSBFzXKgR
        kXiSMAakHoYoox425JitIo6N6MI46lbODhB3lHpGfaYx/l+IUP+uYsZtJmT5SzUQE4kfvkw9jVe
        eWRoUKR0MVr1xWvnyyXF2EjLyseJs00hf9vy+D5BV5RWCJkw5L255XA==
X-Received: by 2002:ac8:5791:0:b0:3fd:e363:ad44 with SMTP id v17-20020ac85791000000b003fde363ad44mr1125520qta.30.1689242764032;
        Thu, 13 Jul 2023 03:06:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF5KFhaeawMtOM9EncTwCky1oU1rA+BCdlIIAZvTmHbL+RSmQoEBursCw4TQMWU/7ffxZvdA609IAQE8Wd8Pwc=
X-Received: by 2002:ac8:5791:0:b0:3fd:e363:ad44 with SMTP id
 v17-20020ac85791000000b003fde363ad44mr1125499qta.30.1689242763761; Thu, 13
 Jul 2023 03:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com>
 <20230712092007.31013-3-xingyu.wu@starfivetech.com> <CAJM55Z-FsYSo1mnN_++RE_Ksu58q5LbNYuXNF8tA84ixg=h5Ag@mail.gmail.com>
 <66ec4805-a0bf-0590-55ef-39f8f974023d@starfivetech.com>
In-Reply-To: <66ec4805-a0bf-0590-55ef-39f8f974023d@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Thu, 13 Jul 2023 12:05:47 +0200
Message-ID: <CAJM55Z8bQgx77hEAQVjsXrtTASTyY9A1ocOU1Kii3zFrA_57kQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] clk: starfive: Add StarFive JH7110
 System-Top-Group clock driver
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 13 Jul 2023 at 11:57, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
> On 2023/7/13 1:50, Emil Renner Berthing wrote:
> > On Wed, 12 Jul 2023 at 11:22, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
> >>
> >> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >>
> >> Add driver for the StarFive JH7110 System-Top-Group clock controller.
> >>
> >> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> >
> > Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> Hi Emil,
>
> Thanks. I already added you as the commit author of this patch, so I will not
> add the Reviewed-by tag for you.

Yeah, that's fine. I just wanted to let Conor know that I reviewed the
latest changes.

> Best regards,
> Xingyu Wu
>
> >
> >> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> >> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> >> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >> ---
> >>  drivers/clk/starfive/Kconfig                  |   8 +
> >>  drivers/clk/starfive/Makefile                 |   1 +
> >>  .../clk/starfive/clk-starfive-jh7110-stg.c    | 173 ++++++++++++++++++
> >>  3 files changed, 182 insertions(+)
> >>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-stg.c
> >>
> >> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> >> index 5d2333106f13..eb1023b5e95a 100644
> >> --- a/drivers/clk/starfive/Kconfig
> >> +++ b/drivers/clk/starfive/Kconfig
> >> @@ -39,3 +39,11 @@ config CLK_STARFIVE_JH7110_AON
> >>         help
> >>           Say yes here to support the always-on clock controller on the
> >>           StarFive JH7110 SoC.
> >> +
> >> +config CLK_STARFIVE_JH7110_STG
> >> +       tristate "StarFive JH7110 System-Top-Group clock support"
> >> +       depends on CLK_STARFIVE_JH7110_SYS
> >> +       default m if ARCH_STARFIVE
> >> +       help
> >> +         Say yes here to support the System-Top-Group clock controller
> >> +         on the StarFive JH7110 SoC.
> >> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> >> index f3df7d957b1e..b81e97ee2659 100644
> >> --- a/drivers/clk/starfive/Makefile
> >> +++ b/drivers/clk/starfive/Makefile
> >> @@ -6,3 +6,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO) += clk-starfive-jh7100-audio.o
> >>
> >>  obj-$(CONFIG_CLK_STARFIVE_JH7110_SYS)  += clk-starfive-jh7110-sys.o
> >>  obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)  += clk-starfive-jh7110-aon.o
> >> +obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)  += clk-starfive-jh7110-stg.o
> >> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-stg.c b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
> >> new file mode 100644
> >> index 000000000000..dafcb7190592
> >> --- /dev/null
> >> +++ b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
> >> @@ -0,0 +1,173 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * StarFive JH7110 System-Top-Group Clock Driver
> >> + *
> >> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> >> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> >> + */
> >> +
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/io.h>
> >> +#include <linux/platform_device.h>
> >> +
> >> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
> >> +
> >> +#include "clk-starfive-jh7110.h"
> >> +
> >> +/* external clocks */
> >> +#define JH7110_STGCLK_OSC                      (JH7110_STGCLK_END + 0)
> >> +#define JH7110_STGCLK_HIFI4_CORE               (JH7110_STGCLK_END + 1)
> >> +#define JH7110_STGCLK_STG_AXIAHB               (JH7110_STGCLK_END + 2)
> >> +#define JH7110_STGCLK_USB_125M                 (JH7110_STGCLK_END + 3)
> >> +#define JH7110_STGCLK_CPU_BUS                  (JH7110_STGCLK_END + 4)
> >> +#define JH7110_STGCLK_HIFI4_AXI                        (JH7110_STGCLK_END + 5)
> >> +#define JH7110_STGCLK_NOCSTG_BUS               (JH7110_STGCLK_END + 6)
> >> +#define JH7110_STGCLK_APB_BUS                  (JH7110_STGCLK_END + 7)
> >> +#define JH7110_STGCLK_EXT_END                  (JH7110_STGCLK_END + 8)
> >> +
> >> +static const struct jh71x0_clk_data jh7110_stgclk_data[] = {
> >> +       /* hifi4 */
> >> +       JH71X0_GATE(JH7110_STGCLK_HIFI4_CLK_CORE, "hifi4_clk_core", 0,
> >> +                   JH7110_STGCLK_HIFI4_CORE),
> >> +       /* usb */
> >> +       JH71X0_GATE(JH7110_STGCLK_USB0_APB, "usb0_apb", 0, JH7110_STGCLK_APB_BUS),
> >> +       JH71X0_GATE(JH7110_STGCLK_USB0_UTMI_APB, "usb0_utmi_apb", 0, JH7110_STGCLK_APB_BUS),
> >> +       JH71X0_GATE(JH7110_STGCLK_USB0_AXI, "usb0_axi", 0, JH7110_STGCLK_STG_AXIAHB),
> >> +       JH71X0_GDIV(JH7110_STGCLK_USB0_LPM, "usb0_lpm", 0, 2, JH7110_STGCLK_OSC),
> >> +       JH71X0_GDIV(JH7110_STGCLK_USB0_STB, "usb0_stb", 0, 4, JH7110_STGCLK_OSC),
> >> +       JH71X0_GATE(JH7110_STGCLK_USB0_APP_125, "usb0_app_125", 0, JH7110_STGCLK_USB_125M),
> >> +       JH71X0__DIV(JH7110_STGCLK_USB0_REFCLK, "usb0_refclk", 2, JH7110_STGCLK_OSC),
> >> +       /* pci-e */
> >> +       JH71X0_GATE(JH7110_STGCLK_PCIE0_AXI_MST0, "pcie0_axi_mst0", 0,
> >> +                   JH7110_STGCLK_STG_AXIAHB),
> >> +       JH71X0_GATE(JH7110_STGCLK_PCIE0_APB, "pcie0_apb", 0, JH7110_STGCLK_APB_BUS),
> >> +       JH71X0_GATE(JH7110_STGCLK_PCIE0_TL, "pcie0_tl", 0, JH7110_STGCLK_STG_AXIAHB),
> >> +       JH71X0_GATE(JH7110_STGCLK_PCIE1_AXI_MST0, "pcie1_axi_mst0", 0,
> >> +                   JH7110_STGCLK_STG_AXIAHB),
> >> +       JH71X0_GATE(JH7110_STGCLK_PCIE1_APB, "pcie1_apb", 0, JH7110_STGCLK_APB_BUS),
> >> +       JH71X0_GATE(JH7110_STGCLK_PCIE1_TL, "pcie1_tl", 0, JH7110_STGCLK_STG_AXIAHB),
> >> +       JH71X0_GATE(JH7110_STGCLK_PCIE_SLV_MAIN, "pcie_slv_main", CLK_IS_CRITICAL,
> >> +                   JH7110_STGCLK_STG_AXIAHB),
> >> +       /* security */
> >> +       JH71X0_GATE(JH7110_STGCLK_SEC_AHB, "sec_ahb", 0, JH7110_STGCLK_STG_AXIAHB),
> >> +       JH71X0_GATE(JH7110_STGCLK_SEC_MISC_AHB, "sec_misc_ahb", 0, JH7110_STGCLK_STG_AXIAHB),
> >> +       /* stg mtrx */
> >> +       JH71X0_GATE(JH7110_STGCLK_GRP0_MAIN, "mtrx_grp0_main", CLK_IS_CRITICAL,
> >> +                   JH7110_STGCLK_CPU_BUS),
> >> +       JH71X0_GATE(JH7110_STGCLK_GRP0_BUS, "mtrx_grp0_bus", CLK_IS_CRITICAL,
> >> +                   JH7110_STGCLK_NOCSTG_BUS),
> >> +       JH71X0_GATE(JH7110_STGCLK_GRP0_STG, "mtrx_grp0_stg", CLK_IS_CRITICAL,
> >> +                   JH7110_STGCLK_STG_AXIAHB),
> >> +       JH71X0_GATE(JH7110_STGCLK_GRP1_MAIN, "mtrx_grp1_main", CLK_IS_CRITICAL,
> >> +                   JH7110_STGCLK_CPU_BUS),
> >> +       JH71X0_GATE(JH7110_STGCLK_GRP1_BUS, "mtrx_grp1_bus", CLK_IS_CRITICAL,
> >> +                   JH7110_STGCLK_NOCSTG_BUS),
> >> +       JH71X0_GATE(JH7110_STGCLK_GRP1_STG, "mtrx_grp1_stg", CLK_IS_CRITICAL,
> >> +                   JH7110_STGCLK_STG_AXIAHB),
> >> +       JH71X0_GATE(JH7110_STGCLK_GRP1_HIFI, "mtrx_grp1_hifi", CLK_IS_CRITICAL,
> >> +                   JH7110_STGCLK_HIFI4_AXI),
> >> +       /* e24_rvpi */
> >> +       JH71X0_GDIV(JH7110_STGCLK_E2_RTC, "e2_rtc", 0, 24, JH7110_STGCLK_OSC),
> >> +       JH71X0_GATE(JH7110_STGCLK_E2_CORE, "e2_core", 0, JH7110_STGCLK_STG_AXIAHB),
> >> +       JH71X0_GATE(JH7110_STGCLK_E2_DBG, "e2_dbg", 0, JH7110_STGCLK_STG_AXIAHB),
> >> +       /* dw_sgdma1p */
> >> +       JH71X0_GATE(JH7110_STGCLK_DMA1P_AXI, "dma1p_axi", 0, JH7110_STGCLK_STG_AXIAHB),
> >> +       JH71X0_GATE(JH7110_STGCLK_DMA1P_AHB, "dma1p_ahb", 0, JH7110_STGCLK_STG_AXIAHB),
> >> +};
> >> +
> >> +static struct clk_hw *jh7110_stgclk_get(struct of_phandle_args *clkspec, void *data)
> >> +{
> >> +       struct jh71x0_clk_priv *priv = data;
> >> +       unsigned int idx = clkspec->args[0];
> >> +
> >> +       if (idx < JH7110_STGCLK_END)
> >> +               return &priv->reg[idx].hw;
> >> +
> >> +       return ERR_PTR(-EINVAL);
> >> +}
> >> +
> >> +static int jh7110_stgcrg_probe(struct platform_device *pdev)
> >> +{
> >> +       struct jh71x0_clk_priv *priv;
> >> +       unsigned int idx;
> >> +       int ret;
> >> +
> >> +       priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, JH7110_STGCLK_END),
> >> +                           GFP_KERNEL);
> >> +       if (!priv)
> >> +               return -ENOMEM;
> >> +
> >> +       spin_lock_init(&priv->rmw_lock);
> >> +       priv->dev = &pdev->dev;
> >> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> >> +       if (IS_ERR(priv->base))
> >> +               return PTR_ERR(priv->base);
> >> +
> >> +       for (idx = 0; idx < JH7110_STGCLK_END; idx++) {
> >> +               u32 max = jh7110_stgclk_data[idx].max;
> >> +               struct clk_parent_data parents[4] = {};
> >> +               struct clk_init_data init = {
> >> +                       .name = jh7110_stgclk_data[idx].name,
> >> +                       .ops = starfive_jh71x0_clk_ops(max),
> >> +                       .parent_data = parents,
> >> +                       .num_parents =
> >> +                               ((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> >> +                       .flags = jh7110_stgclk_data[idx].flags,
> >> +               };
> >> +               struct jh71x0_clk *clk = &priv->reg[idx];
> >> +               const char *fw_name[JH7110_STGCLK_EXT_END - JH7110_STGCLK_END] = {
> >> +                       "osc",
> >> +                       "hifi4_core",
> >> +                       "stg_axiahb",
> >> +                       "usb_125m",
> >> +                       "cpu_bus",
> >> +                       "hifi4_axi",
> >> +                       "nocstg_bus",
> >> +                       "apb_bus"
> >> +               };
> >> +               unsigned int i;
> >> +
> >> +               for (i = 0; i < init.num_parents; i++) {
> >> +                       unsigned int pidx = jh7110_stgclk_data[idx].parents[i];
> >> +
> >> +                       if (pidx < JH7110_STGCLK_END)
> >> +                               parents[i].hw = &priv->reg[pidx].hw;
> >> +                       else if (pidx < JH7110_STGCLK_EXT_END)
> >> +                               parents[i].fw_name = fw_name[pidx - JH7110_STGCLK_END];
> >> +               }
> >> +
> >> +               clk->hw.init = &init;
> >> +               clk->idx = idx;
> >> +               clk->max_div = max & JH71X0_CLK_DIV_MASK;
> >> +
> >> +               ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> >> +               if (ret)
> >> +                       return ret;
> >> +       }
> >> +
> >> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_stgclk_get, priv);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       return jh7110_reset_controller_register(priv, "rst-stg", 2);
> >> +}
> >> +
> >> +static const struct of_device_id jh7110_stgcrg_match[] = {
> >> +       { .compatible = "starfive,jh7110-stgcrg" },
> >> +       { /* sentinel */ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, jh7110_stgcrg_match);
> >> +
> >> +static struct platform_driver jh7110_stgcrg_driver = {
> >> +       .probe = jh7110_stgcrg_probe,
> >> +       .driver = {
> >> +               .name = "clk-starfive-jh7110-stg",
> >> +               .of_match_table = jh7110_stgcrg_match,
> >> +       },
> >> +};
> >> +module_platform_driver(jh7110_stgcrg_driver);
> >> +
> >> +MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
> >> +MODULE_AUTHOR("Emil Renner Berthing <kernel@esmil.dk>");
> >> +MODULE_DESCRIPTION("StarFive JH7110 System-Top-Group clock driver");
> >> +MODULE_LICENSE("GPL");
> >> --
> >> 2.25.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
