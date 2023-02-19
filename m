Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97DDB69C2B0
	for <lists+linux-clk@lfdr.de>; Sun, 19 Feb 2023 22:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbjBSVYE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 19 Feb 2023 16:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbjBSVYD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Feb 2023 16:24:03 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81EA14491
        for <linux-clk@vger.kernel.org>; Sun, 19 Feb 2023 13:23:59 -0800 (PST)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 77DB53F212
        for <linux-clk@vger.kernel.org>; Sun, 19 Feb 2023 21:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676841837;
        bh=/kUicKp44h8IZwjD7ZH8EOt+fWMByHoQqi0d8iuyIiI=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=j11Nfcq1Wq/ftJt7GhkoiRhk82PXFxJm9ROfWvFrDgQ5UmEAWaw28EGWqRdqwXOQL
         TXjEJaAiGeoMHoc4g2yJGa15LWDVMaWWlVKbWhq95KLTqzEztJiEY586h5AY/qiaTQ
         6aqLsco3jk3pxFYec2KhtK/aP7h5tYAcASBXy0W8OY++mv+DJ2KvQa+C/LdmxXFmLt
         TEaSiK3MJGrKsvpOZzsTA5ukFrg3S9CsCfvWbIiKJA4/NyYCWCrNAyjPT9eC9EDHIq
         b502dpTxsVJ3ddJVj8Tg52aV/ACWtCo3fO/2HP07PTidF1QDpIkRYAxy+qUkY8fi0i
         ezHvMfXQijHrA==
Received: by mail-lj1-f199.google.com with SMTP id e18-20020a2ea552000000b002934e8e57e2so399366ljn.10
        for <linux-clk@vger.kernel.org>; Sun, 19 Feb 2023 13:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kUicKp44h8IZwjD7ZH8EOt+fWMByHoQqi0d8iuyIiI=;
        b=p8OP1cWb6I2ocsmbyxEhqJ9mxq+/60r7yOSG9D7aKwxF0YdLtj5RZO7qdpFgmm9a7S
         fyZTyi9gHdMOXqTT8HuCi/xJWQKnNQc7wFcVMhdSKPQUOSOUH2tz1oYvExb5sEZeoTG0
         BhbId8aJVD3QBIh6QcBNxOYZtSKcoGLFV1Gl6HxcNDZ01Gt+fgsQ1i7lDKhy3aWlXyn8
         FOsF1nwwr4xwzFaRvfFh6wi0gz+IRYcFw47QJGOlJ9o/Cm8eMqWKyatTt5nzyBtgU8y8
         LJpT1BGxf8mlZnCzeupIu2PY0Cv3v6gVGZKYtIRKeMDkixE9LCjDqD+iS+iQ0dBNBFkQ
         6NsQ==
X-Gm-Message-State: AO0yUKWYP3bKc3BOnFMV87KN7eeOiu/FYw5ge5Nm7FCGOgnVSmPQZe4/
        ffQaxZO/3L+PiIZ1jILJ5jkbx7cB29Ml6b+ic5qwPJ68WhihuzAjZiyQqS36KdoTM5Gnnj884Yy
        Sgp0mBL45RRh4dWulbJNG9qK2Ip11tWc9owlH2UdcjXMLsl8sqzAtZg==
X-Received: by 2002:ac2:521b:0:b0:4db:1aa4:fe02 with SMTP id a27-20020ac2521b000000b004db1aa4fe02mr129482lfl.1.1676841836771;
        Sun, 19 Feb 2023 13:23:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8nu+GFqIlFktXGHGYjQC7nqndMfeKYoadSGlLNK2DOJwH1S2aZKpEGpcgbHDcEcXPl0/jJ4cBDlret8rMBGUg=
X-Received: by 2002:ac2:521b:0:b0:4db:1aa4:fe02 with SMTP id
 a27-20020ac2521b000000b004db1aa4fe02mr129470lfl.1.1676841836322; Sun, 19 Feb
 2023 13:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20221220005054.34518-1-hal.feng@starfivetech.com> <20221220005054.34518-10-hal.feng@starfivetech.com>
In-Reply-To: <20221220005054.34518-10-hal.feng@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Sun, 19 Feb 2023 22:23:39 +0100
Message-ID: <CAJM55Z-qpQkLjSFN33ELGE8DtoygY+vL6zi2raPh6POJ69pjbg@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] clk: starfive: Add StarFive JH7110 system clock driver
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 20 Dec 2022 at 01:51, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> Add driver for the StarFive JH7110 system clock controller and
> register an auxiliary device for system reset controller which
> is named as "reset-sys".
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  11 +
>  drivers/clk/starfive/Makefile                 |   2 +
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 448 ++++++++++++++++++
>  drivers/clk/starfive/clk-starfive-jh71x0.c    |  54 +++
>  drivers/clk/starfive/clk-starfive-jh71x0.h    |   8 +
>  5 files changed, 523 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-sys.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 594d516dcb38..4640d0665d1c 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -20,3 +20,14 @@ config CLK_STARFIVE_JH7100_AUDIO
>         help
>           Say Y or M here to support the audio clocks on the StarFive JH7100
>           SoC.
> +
> +config CLK_STARFIVE_JH7110_SYS
> +       bool "StarFive JH7110 system clock support"
> +       depends on SOC_STARFIVE || COMPILE_TEST
> +       select AUXILIARY_BUS
> +       select CLK_STARFIVE_JH71X0
> +       select RESET_STARFIVE_JH7110
> +       default SOC_STARFIVE
> +       help
> +         Say yes here to support the system clock controller on the
> +         StarFive JH7110 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 82edfa9f9cb8..5ca4e887fb9c 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -3,3 +3,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH71X0)       += clk-starfive-jh71x0.o
>
>  obj-$(CONFIG_CLK_STARFIVE_JH7100)      += clk-starfive-jh7100.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO)        += clk-starfive-jh7100-audio.o
> +
> +obj-$(CONFIG_CLK_STARFIVE_JH7110_SYS)  += clk-starfive-jh7110-sys.o
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> new file mode 100644
> index 000000000000..abc1c280bbe3
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -0,0 +1,448 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7110 System Clock Driver
> + *
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +/* external clocks */
> +#define JH7110_SYSCLK_OSC                      (JH7110_SYSCLK_END + 0)
> +#define JH7110_SYSCLK_GMAC1_RMII_REFIN         (JH7110_SYSCLK_END + 1)
> +#define JH7110_SYSCLK_GMAC1_RGMII_RXIN         (JH7110_SYSCLK_END + 2)
> +#define JH7110_SYSCLK_I2STX_BCLK_EXT           (JH7110_SYSCLK_END + 3)
> +#define JH7110_SYSCLK_I2STX_LRCK_EXT           (JH7110_SYSCLK_END + 4)
> +#define JH7110_SYSCLK_I2SRX_BCLK_EXT           (JH7110_SYSCLK_END + 5)
> +#define JH7110_SYSCLK_I2SRX_LRCK_EXT           (JH7110_SYSCLK_END + 6)
> +#define JH7110_SYSCLK_TDM_EXT                  (JH7110_SYSCLK_END + 7)
> +#define JH7110_SYSCLK_MCLK_EXT                 (JH7110_SYSCLK_END + 8)
> +
> +static const struct jh71x0_clk_data jh7110_sysclk_data[] __initconst = {
> +       /* root */
> +       JH71X0__MUX(JH7110_SYSCLK_CPU_ROOT, "cpu_root", 2,
> +                   JH7110_SYSCLK_OSC,
> +                   JH7110_SYSCLK_PLL0_OUT),
> +       JH71X0__DIV(JH7110_SYSCLK_CPU_CORE, "cpu_core", 7, JH7110_SYSCLK_CPU_ROOT),
> +       JH71X0__DIV(JH7110_SYSCLK_CPU_BUS, "cpu_bus", 2, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0__MUX(JH7110_SYSCLK_GPU_ROOT, "gpu_root", 2,
> +                   JH7110_SYSCLK_PLL2_OUT,
> +                   JH7110_SYSCLK_PLL1_OUT),
> +       JH71X0_MDIV(JH7110_SYSCLK_PERH_ROOT, "perh_root", 2, 2,
> +                   JH7110_SYSCLK_PLL0_OUT,
> +                   JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0__MUX(JH7110_SYSCLK_BUS_ROOT, "bus_root", 2,
> +                   JH7110_SYSCLK_OSC,
> +                   JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0__DIV(JH7110_SYSCLK_NOCSTG_BUS, "nocstg_bus", 3, JH7110_SYSCLK_BUS_ROOT),
> +       JH71X0__DIV(JH7110_SYSCLK_AXI_CFG0, "axi_cfg0", 3, JH7110_SYSCLK_BUS_ROOT),
> +       JH71X0__DIV(JH7110_SYSCLK_STG_AXIAHB, "stg_axiahb", 2, JH7110_SYSCLK_AXI_CFG0),
> +       JH71X0_GATE(JH7110_SYSCLK_AHB0, "ahb0", CLK_IS_CRITICAL, JH7110_SYSCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_SYSCLK_AHB1, "ahb1", CLK_IS_CRITICAL, JH7110_SYSCLK_STG_AXIAHB),
> +       JH71X0__DIV(JH7110_SYSCLK_APB_BUS, "apb_bus", 8, JH7110_SYSCLK_STG_AXIAHB),
> +       JH71X0_GATE(JH7110_SYSCLK_APB0, "apb0", CLK_IS_CRITICAL, JH7110_SYSCLK_APB_BUS),
> +       JH71X0__DIV(JH7110_SYSCLK_PLL0_DIV2, "pll0_div2", 2, JH7110_SYSCLK_PLL0_OUT),
> +       JH71X0__DIV(JH7110_SYSCLK_PLL1_DIV2, "pll1_div2", 2, JH7110_SYSCLK_PLL1_OUT),
> +       JH71X0__DIV(JH7110_SYSCLK_PLL2_DIV2, "pll2_div2", 2, JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0__DIV(JH7110_SYSCLK_AUDIO_ROOT, "audio_root", 8, JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0__DIV(JH7110_SYSCLK_MCLK_INNER, "mclk_inner", 64, JH7110_SYSCLK_AUDIO_ROOT),
> +       JH71X0__MUX(JH7110_SYSCLK_MCLK, "mclk", 2,
> +                   JH7110_SYSCLK_MCLK_INNER,
> +                   JH7110_SYSCLK_MCLK_EXT),
> +       JH71X0_GATE(JH7110_SYSCLK_MCLK_OUT, "mclk_out", 0, JH7110_SYSCLK_MCLK_INNER),
> +       JH71X0_MDIV(JH7110_SYSCLK_ISP_2X, "isp_2x", 8, 2,
> +                   JH7110_SYSCLK_PLL2_OUT,
> +                   JH7110_SYSCLK_PLL1_OUT),
> +       JH71X0__DIV(JH7110_SYSCLK_ISP_AXI, "isp_axi", 4, JH7110_SYSCLK_ISP_2X),
> +       JH71X0_GDIV(JH7110_SYSCLK_GCLK0, "gclk0", 0, 62, JH7110_SYSCLK_PLL0_DIV2),
> +       JH71X0_GDIV(JH7110_SYSCLK_GCLK1, "gclk1", 0, 62, JH7110_SYSCLK_PLL1_DIV2),
> +       JH71X0_GDIV(JH7110_SYSCLK_GCLK2, "gclk2", 0, 62, JH7110_SYSCLK_PLL2_DIV2),
> +       /* cores */
> +       JH71X0_GATE(JH7110_SYSCLK_CORE, "core", CLK_IS_CRITICAL, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_CORE1, "core1", CLK_IS_CRITICAL, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_CORE2, "core2", CLK_IS_CRITICAL, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_CORE3, "core3", CLK_IS_CRITICAL, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_CORE4, "core4", CLK_IS_CRITICAL, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_DEBUG, "debug", 0, JH7110_SYSCLK_CPU_BUS),
> +       JH71X0__DIV(JH7110_SYSCLK_RTC_TOGGLE, "rtc_toggle", 6, JH7110_SYSCLK_OSC),
> +       JH71X0_GATE(JH7110_SYSCLK_TRACE0, "trace0", 0, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_TRACE1, "trace1", 0, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_TRACE2, "trace2", 0, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_TRACE3, "trace3", 0, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_TRACE4, "trace4", 0, JH7110_SYSCLK_CPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_TRACE_COM, "trace_com", 0, JH7110_SYSCLK_CPU_BUS),
> +       /* noc */
> +       JH71X0_GATE(JH7110_SYSCLK_NOC_BUS_CPU_AXI, "noc_bus_cpu_axi", CLK_IS_CRITICAL,
> +                   JH7110_SYSCLK_CPU_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_NOC_BUS_AXICFG0_AXI, "noc_bus_axicfg0_axi", CLK_IS_CRITICAL,
> +                   JH7110_SYSCLK_AXI_CFG0),
> +       /* ddr */
> +       JH71X0__DIV(JH7110_SYSCLK_OSC_DIV2, "osc_div2", 2, JH7110_SYSCLK_OSC),
> +       JH71X0__DIV(JH7110_SYSCLK_PLL1_DIV4, "pll1_div4", 2, JH7110_SYSCLK_PLL1_DIV2),
> +       JH71X0__DIV(JH7110_SYSCLK_PLL1_DIV8, "pll1_div8", 2, JH7110_SYSCLK_PLL1_DIV4),
> +       JH71X0__MUX(JH7110_SYSCLK_DDR_BUS, "ddr_bus", 4,
> +                   JH7110_SYSCLK_OSC_DIV2,
> +                   JH7110_SYSCLK_PLL1_DIV2,
> +                   JH7110_SYSCLK_PLL1_DIV4,
> +                   JH7110_SYSCLK_PLL1_DIV8),
> +       JH71X0_GATE(JH7110_SYSCLK_DDR_AXI, "ddr_axi", CLK_IGNORE_UNUSED, JH7110_SYSCLK_DDR_BUS),
> +       /* gpu */
> +       JH71X0__DIV(JH7110_SYSCLK_GPU_CORE, "gpu_core", 7, JH7110_SYSCLK_GPU_ROOT),
> +       JH71X0_GATE(JH7110_SYSCLK_GPU_CORE_CLK, "gpu_core_clk", 0, JH7110_SYSCLK_GPU_CORE),
> +       JH71X0_GATE(JH7110_SYSCLK_GPU_SYS_CLK, "gpu_sys_clk", 0, JH7110_SYSCLK_ISP_AXI),
> +       JH71X0_GATE(JH7110_SYSCLK_GPU_APB, "gpu_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GDIV(JH7110_SYSCLK_GPU_RTC_TOGGLE, "gpu_rtc_toggle", 0, 12, JH7110_SYSCLK_OSC),
> +       JH71X0_GATE(JH7110_SYSCLK_NOC_BUS_GPU_AXI, "noc_bus_gpu_axi", 0, JH7110_SYSCLK_GPU_CORE),
> +       /* isp */
> +       JH71X0_GATE(JH7110_SYSCLK_ISP_TOP_CORE, "isp_top_core", 0, JH7110_SYSCLK_ISP_2X),
> +       JH71X0_GATE(JH7110_SYSCLK_ISP_TOP_AXI, "isp_top_axi", 0, JH7110_SYSCLK_ISP_AXI),
> +       JH71X0_GATE(JH7110_SYSCLK_NOC_BUS_ISP_AXI, "noc_bus_isp_axi", CLK_IS_CRITICAL,
> +                   JH7110_SYSCLK_ISP_AXI),
> +       /* hifi4 */
> +       JH71X0__DIV(JH7110_SYSCLK_HIFI4_CORE, "hifi4_core", 15, JH7110_SYSCLK_BUS_ROOT),
> +       JH71X0__DIV(JH7110_SYSCLK_HIFI4_AXI, "hifi4_axi", 2, JH7110_SYSCLK_HIFI4_CORE),
> +       /* axi_cfg1 */
> +       JH71X0_GATE(JH7110_SYSCLK_AXI_CFG1_MAIN, "axi_cfg1_main", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_ISP_AXI),
> +       JH71X0_GATE(JH7110_SYSCLK_AXI_CFG1_AHB, "axi_cfg1_ahb", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_AHB0),
> +       /* vout */
> +       JH71X0_GATE(JH7110_SYSCLK_VOUT_SRC, "vout_src", 0, JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0__DIV(JH7110_SYSCLK_VOUT_AXI, "vout_axi", 7, JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0_GATE(JH7110_SYSCLK_NOC_BUS_DISP_AXI, "noc_bus_disp_axi", 0, JH7110_SYSCLK_VOUT_AXI),
> +       JH71X0_GATE(JH7110_SYSCLK_VOUT_TOP_AHB, "vout_top_ahb", 0, JH7110_SYSCLK_AHB1),
> +       JH71X0_GATE(JH7110_SYSCLK_VOUT_TOP_AXI, "vout_top_axi", 0, JH7110_SYSCLK_VOUT_AXI),
> +       JH71X0_GATE(JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK, "vout_top_hdmitx0_mclk", 0,
> +                   JH7110_SYSCLK_MCLK),
> +       JH71X0__DIV(JH7110_SYSCLK_VOUT_TOP_MIPIPHY_REF, "vout_top_mipiphy_ref", 2,
> +                   JH7110_SYSCLK_OSC),
> +       /* jpegc */
> +       JH71X0__DIV(JH7110_SYSCLK_JPEGC_AXI, "jpegc_axi", 16, JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0_GATE(JH7110_SYSCLK_CODAJ12_AXI, "codaj12_axi", 0, JH7110_SYSCLK_JPEGC_AXI),
> +       JH71X0_GDIV(JH7110_SYSCLK_CODAJ12_CORE, "codaj12_core", 0, 16, JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0_GATE(JH7110_SYSCLK_CODAJ12_APB, "codaj12_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       /* vdec */
> +       JH71X0__DIV(JH7110_SYSCLK_VDEC_AXI, "vdec_axi", 7, JH7110_SYSCLK_BUS_ROOT),
> +       JH71X0_GATE(JH7110_SYSCLK_WAVE511_AXI, "wave511_axi", 0, JH7110_SYSCLK_VDEC_AXI),
> +       JH71X0_GDIV(JH7110_SYSCLK_WAVE511_BPU, "wave511_bpu", 0, 7, JH7110_SYSCLK_BUS_ROOT),
> +       JH71X0_GDIV(JH7110_SYSCLK_WAVE511_VCE, "wave511_vce", 0, 7, JH7110_SYSCLK_PLL0_OUT),
> +       JH71X0_GATE(JH7110_SYSCLK_WAVE511_APB, "wave511_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_VDEC_JPG, "vdec_jpg", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_JPEGC_AXI),
> +       JH71X0_GATE(JH7110_SYSCLK_VDEC_MAIN, "vdec_main", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_VDEC_AXI),
> +       JH71X0_GATE(JH7110_SYSCLK_NOC_BUS_VDEC_AXI, "noc_bus_vdec_axi", 0, JH7110_SYSCLK_VDEC_AXI),
> +       /* venc */
> +       JH71X0__DIV(JH7110_SYSCLK_VENC_AXI, "venc_axi", 15, JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0_GATE(JH7110_SYSCLK_WAVE420L_AXI, "wave420l_axi", 0, JH7110_SYSCLK_VENC_AXI),
> +       JH71X0_GDIV(JH7110_SYSCLK_WAVE420L_BPU, "wave420l_bpu", 0, 15, JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0_GDIV(JH7110_SYSCLK_WAVE420L_VCE, "wave420l_vce", 0, 15, JH7110_SYSCLK_PLL2_OUT),
> +       JH71X0_GATE(JH7110_SYSCLK_WAVE420L_APB, "wave420l_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_NOC_BUS_VENC_AXI, "noc_bus_venc_axi", 0, JH7110_SYSCLK_VENC_AXI),
> +       /* axi_cfg0 */
> +       JH71X0_GATE(JH7110_SYSCLK_AXI_CFG0_MAIN_DIV, "axi_cfg0_main_div", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_AHB1),
> +       JH71X0_GATE(JH7110_SYSCLK_AXI_CFG0_MAIN, "axi_cfg0_main", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_AXI_CFG0),
> +       JH71X0_GATE(JH7110_SYSCLK_AXI_CFG0_HIFI4, "axi_cfg0_hifi4", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_HIFI4_AXI),
> +       /* intmem */
> +       JH71X0_GATE(JH7110_SYSCLK_AXIMEM2_AXI, "aximem2_axi", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_AXI_CFG0),
> +       /* qspi */
> +       JH71X0_GATE(JH7110_SYSCLK_QSPI_AHB, "qspi_ahb", CLK_IGNORE_UNUSED, JH7110_SYSCLK_AHB1),
> +       JH71X0_GATE(JH7110_SYSCLK_QSPI_APB, "qspi_apb", CLK_IGNORE_UNUSED, JH7110_SYSCLK_APB_BUS),
> +       JH71X0__DIV(JH7110_SYSCLK_QSPI_REF_SRC, "qspi_ref_src", 16, JH7110_SYSCLK_PLL0_OUT),
> +       JH71X0_GMUX(JH7110_SYSCLK_QSPI_REF, "qspi_ref", CLK_IGNORE_UNUSED, 2,
> +                   JH7110_SYSCLK_OSC,
> +                   JH7110_SYSCLK_QSPI_REF_SRC),
> +       /* sdio */
> +       JH71X0_GATE(JH7110_SYSCLK_SDIO0_AHB, "sdio0_ahb", CLK_IGNORE_UNUSED, JH7110_SYSCLK_AHB0),
> +       JH71X0_GATE(JH7110_SYSCLK_SDIO1_AHB, "sdio1_ahb", CLK_IGNORE_UNUSED, JH7110_SYSCLK_AHB0),
> +       JH71X0_GDIV(JH7110_SYSCLK_SDIO0_SDCARD, "sdio0_sdcard", CLK_IGNORE_UNUSED, 15,
> +                   JH7110_SYSCLK_AXI_CFG0),
> +       JH71X0_GDIV(JH7110_SYSCLK_SDIO1_SDCARD, "sdio1_sdcard", CLK_IGNORE_UNUSED, 15,
> +                   JH7110_SYSCLK_AXI_CFG0),
> +       /* stg */
> +       JH71X0__DIV(JH7110_SYSCLK_USB_125M, "usb_125m", 15, JH7110_SYSCLK_PLL0_OUT),
> +       JH71X0_GATE(JH7110_SYSCLK_NOC_BUS_STG_AXI, "noc_bus_stg_axi", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_NOCSTG_BUS),
> +       /* gmac1 */
> +       JH71X0_GATE(JH7110_SYSCLK_GMAC1_AHB, "gmac1_ahb", 0, JH7110_SYSCLK_AHB0),
> +       JH71X0_GATE(JH7110_SYSCLK_GMAC1_AXI, "gmac1_axi", 0, JH7110_SYSCLK_STG_AXIAHB),
> +       JH71X0__DIV(JH7110_SYSCLK_GMAC_SRC, "gmac_src", 7, JH7110_SYSCLK_PLL0_OUT),
> +       JH71X0__DIV(JH7110_SYSCLK_GMAC1_GTXCLK, "gmac1_gtxclk", 15, JH7110_SYSCLK_PLL0_OUT),
> +       JH71X0__DIV(JH7110_SYSCLK_GMAC1_RMII_RTX, "gmac1_rmii_rtx", 30,
> +                   JH7110_SYSCLK_GMAC1_RMII_REFIN),
> +       JH71X0_GDIV(JH7110_SYSCLK_GMAC1_PTP, "gmac1_ptp", 0, 31, JH7110_SYSCLK_GMAC_SRC),
> +       JH71X0__MUX(JH7110_SYSCLK_GMAC1_RX, "gmac1_rx", 2,
> +                   JH7110_SYSCLK_GMAC1_RGMII_RXIN,
> +                   JH7110_SYSCLK_GMAC1_RMII_RTX),
> +       JH71X0__INV(JH7110_SYSCLK_GMAC1_RX_INV, "gmac1_rx_inv", JH7110_SYSCLK_GMAC1_RX),
> +       JH71X0_GMUX(JH7110_SYSCLK_GMAC1_TX, "gmac1_tx", 0, 2,
> +                   JH7110_SYSCLK_GMAC1_GTXCLK,
> +                   JH7110_SYSCLK_GMAC1_RMII_RTX),
> +       JH71X0__INV(JH7110_SYSCLK_GMAC1_TX_INV, "gmac1_tx_inv", JH7110_SYSCLK_GMAC1_TX),
> +       JH71X0_GATE(JH7110_SYSCLK_GMAC1_GTXC, "gmac1_gtxc", 0, JH7110_SYSCLK_GMAC1_GTXCLK),
> +       /* gmac0 */
> +       JH71X0_GDIV(JH7110_SYSCLK_GMAC0_GTXCLK, "gmac0_gtxclk", 0, 15, JH7110_SYSCLK_PLL0_OUT),
> +       JH71X0_GDIV(JH7110_SYSCLK_GMAC0_PTP, "gmac0_ptp", 0, 31, JH7110_SYSCLK_GMAC_SRC),
> +       JH71X0_GDIV(JH7110_SYSCLK_GMAC_PHY, "gmac_phy", 0, 31, JH7110_SYSCLK_GMAC_SRC),
> +       JH71X0_GATE(JH7110_SYSCLK_GMAC0_GTXC, "gmac0_gtxc", 0, JH7110_SYSCLK_GMAC0_GTXCLK),
> +       /* apb misc */
> +       JH71X0_GATE(JH7110_SYSCLK_IOMUX_APB, "iomux_apb", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_MAILBOX_APB, "mailbox_apb", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_INT_CTRL_APB, "int_ctrl_apb", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_APB_BUS),
> +       /* can0 */
> +       JH71X0_GATE(JH7110_SYSCLK_CAN0_APB, "can0_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GDIV(JH7110_SYSCLK_CAN0_TIMER, "can0_timer", 0, 24, JH7110_SYSCLK_OSC),
> +       JH71X0_GDIV(JH7110_SYSCLK_CAN0_CAN, "can0_can", 0, 63, JH7110_SYSCLK_PERH_ROOT),
> +       /* can1 */
> +       JH71X0_GATE(JH7110_SYSCLK_CAN1_APB, "can1_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GDIV(JH7110_SYSCLK_CAN1_TIMER, "can1_timer", 0, 24, JH7110_SYSCLK_OSC),
> +       JH71X0_GDIV(JH7110_SYSCLK_CAN1_CAN, "can1_can", 0, 63, JH7110_SYSCLK_PERH_ROOT),
> +       /* pwm */
> +       JH71X0_GATE(JH7110_SYSCLK_PWM_APB, "pwm_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       /* wdt */
> +       JH71X0_GATE(JH7110_SYSCLK_WDT_APB, "wdt_apb", CLK_IGNORE_UNUSED, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_WDT_CORE, "wdt_core", CLK_IGNORE_UNUSED, JH7110_SYSCLK_OSC),
> +       /* timer */
> +       JH71X0_GATE(JH7110_SYSCLK_TIMER_APB, "timer_apb", CLK_IGNORE_UNUSED,
> +                   JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_TIMER0, "timer0", CLK_IGNORE_UNUSED, JH7110_SYSCLK_OSC),
> +       JH71X0_GATE(JH7110_SYSCLK_TIMER1, "timer1", CLK_IGNORE_UNUSED, JH7110_SYSCLK_OSC),
> +       JH71X0_GATE(JH7110_SYSCLK_TIMER2, "timer2", CLK_IGNORE_UNUSED, JH7110_SYSCLK_OSC),
> +       JH71X0_GATE(JH7110_SYSCLK_TIMER3, "timer3", CLK_IGNORE_UNUSED, JH7110_SYSCLK_OSC),
> +       /* temp sensor */
> +       JH71X0_GATE(JH7110_SYSCLK_TEMP_APB, "temp_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GDIV(JH7110_SYSCLK_TEMP_CORE, "temp_core", 0, 24, JH7110_SYSCLK_OSC),
> +       /* spi */
> +       JH71X0_GATE(JH7110_SYSCLK_SPI0_APB, "spi0_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GATE(JH7110_SYSCLK_SPI1_APB, "spi1_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GATE(JH7110_SYSCLK_SPI2_APB, "spi2_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GATE(JH7110_SYSCLK_SPI3_APB, "spi3_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_SPI4_APB, "spi4_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_SPI5_APB, "spi5_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_SPI6_APB, "spi6_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       /* i2c */
> +       JH71X0_GATE(JH7110_SYSCLK_I2C0_APB, "i2c0_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GATE(JH7110_SYSCLK_I2C1_APB, "i2c1_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GATE(JH7110_SYSCLK_I2C2_APB, "i2c2_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GATE(JH7110_SYSCLK_I2C3_APB, "i2c3_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_I2C4_APB, "i2c4_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_I2C5_APB, "i2c5_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       JH71X0_GATE(JH7110_SYSCLK_I2C6_APB, "i2c6_apb", 0, JH7110_SYSCLK_APB_BUS),
> +       /* uart */
> +       JH71X0_GATE(JH7110_SYSCLK_UART0_APB, "uart0_apb", CLK_IGNORE_UNUSED, JH7110_SYSCLK_APB0),
> +       JH71X0_GATE(JH7110_SYSCLK_UART0_CORE, "uart0_core", CLK_IGNORE_UNUSED, JH7110_SYSCLK_OSC),
> +       JH71X0_GATE(JH7110_SYSCLK_UART1_APB, "uart1_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GATE(JH7110_SYSCLK_UART1_CORE, "uart1_core", 0, JH7110_SYSCLK_OSC),
> +       JH71X0_GATE(JH7110_SYSCLK_UART2_APB, "uart2_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GATE(JH7110_SYSCLK_UART2_CORE, "uart2_core", 0, JH7110_SYSCLK_OSC),
> +       JH71X0_GATE(JH7110_SYSCLK_UART3_APB, "uart3_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GDIV(JH7110_SYSCLK_UART3_CORE, "uart3_core", 0, 10, JH7110_SYSCLK_PERH_ROOT),
> +       JH71X0_GATE(JH7110_SYSCLK_UART4_APB, "uart4_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GDIV(JH7110_SYSCLK_UART4_CORE, "uart4_core", 0, 10, JH7110_SYSCLK_PERH_ROOT),
> +       JH71X0_GATE(JH7110_SYSCLK_UART5_APB, "uart5_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GDIV(JH7110_SYSCLK_UART5_CORE, "uart5_core", 0, 10, JH7110_SYSCLK_PERH_ROOT),
> +       /* pwmdac */
> +       JH71X0_GATE(JH7110_SYSCLK_PWMDAC_APB, "pwmdac_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GDIV(JH7110_SYSCLK_PWMDAC_CORE, "pwmdac_core", 0, 256, JH7110_SYSCLK_AUDIO_ROOT),
> +       /* spdif */
> +       JH71X0_GATE(JH7110_SYSCLK_SPDIF_APB, "spdif_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GATE(JH7110_SYSCLK_SPDIF_CORE, "spdif_core", 0, JH7110_SYSCLK_MCLK),
> +       /* i2stx0 */
> +       JH71X0_GATE(JH7110_SYSCLK_I2STX0_APB, "i2stx0_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GDIV(JH7110_SYSCLK_I2STX0_BCLK_MST, "i2stx0_bclk_mst", 0, 32, JH7110_SYSCLK_MCLK),
> +       JH71X0__INV(JH7110_SYSCLK_I2STX0_BCLK_MST_INV, "i2stx0_bclk_mst_inv",
> +                   JH7110_SYSCLK_I2STX0_BCLK_MST),
> +       JH71X0_MDIV(JH7110_SYSCLK_I2STX0_LRCK_MST, "i2stx0_lrck_mst", 64, 2,
> +                   JH7110_SYSCLK_I2STX0_BCLK_MST_INV,
> +                   JH7110_SYSCLK_I2STX0_BCLK_MST),
> +       JH71X0__MUX(JH7110_SYSCLK_I2STX0_BCLK, "i2stx0_bclk",   2,
> +                   JH7110_SYSCLK_I2STX0_BCLK_MST,
> +                   JH7110_SYSCLK_I2STX_BCLK_EXT),
> +       JH71X0__INV(JH7110_SYSCLK_I2STX0_BCLK_INV, "i2stx0_bclk_inv", JH7110_SYSCLK_I2STX0_BCLK),
> +       JH71X0__MUX(JH7110_SYSCLK_I2STX0_LRCK, "i2stx0_lrck", 2,
> +                   JH7110_SYSCLK_I2STX0_LRCK_MST,
> +                   JH7110_SYSCLK_I2STX_LRCK_EXT),
> +       /* i2stx1 */
> +       JH71X0_GATE(JH7110_SYSCLK_I2STX1_APB, "i2stx1_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GDIV(JH7110_SYSCLK_I2STX1_BCLK_MST, "i2stx1_bclk_mst", 0, 32, JH7110_SYSCLK_MCLK),
> +       JH71X0__INV(JH7110_SYSCLK_I2STX1_BCLK_MST_INV, "i2stx1_bclk_mst_inv",
> +                   JH7110_SYSCLK_I2STX1_BCLK_MST),
> +       JH71X0_MDIV(JH7110_SYSCLK_I2STX1_LRCK_MST, "i2stx1_lrck_mst", 64, 2,
> +                   JH7110_SYSCLK_I2STX1_BCLK_MST_INV,
> +                   JH7110_SYSCLK_I2STX1_BCLK_MST),
> +       JH71X0__MUX(JH7110_SYSCLK_I2STX1_BCLK, "i2stx1_bclk", 2,
> +                   JH7110_SYSCLK_I2STX1_BCLK_MST,
> +                   JH7110_SYSCLK_I2STX_BCLK_EXT),
> +       JH71X0__INV(JH7110_SYSCLK_I2STX1_BCLK_INV, "i2stx1_bclk_inv", JH7110_SYSCLK_I2STX1_BCLK),
> +       JH71X0__MUX(JH7110_SYSCLK_I2STX1_LRCK, "i2stx1_lrck", 2,
> +                   JH7110_SYSCLK_I2STX1_LRCK_MST,
> +                   JH7110_SYSCLK_I2STX_LRCK_EXT),
> +       /* i2srx */
> +       JH71X0_GATE(JH7110_SYSCLK_I2SRX_APB, "i2srx_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GDIV(JH7110_SYSCLK_I2SRX_BCLK_MST, "i2srx_bclk_mst", 0, 32, JH7110_SYSCLK_MCLK),
> +       JH71X0__INV(JH7110_SYSCLK_I2SRX_BCLK_MST_INV, "i2srx_bclk_mst_inv",
> +                   JH7110_SYSCLK_I2SRX_BCLK_MST),
> +       JH71X0_MDIV(JH7110_SYSCLK_I2SRX_LRCK_MST, "i2srx_lrck_mst", 64, 2,
> +                   JH7110_SYSCLK_I2SRX_BCLK_MST_INV,
> +                   JH7110_SYSCLK_I2SRX_BCLK_MST),
> +       JH71X0__MUX(JH7110_SYSCLK_I2SRX_BCLK, "i2srx_bclk", 2,
> +                   JH7110_SYSCLK_I2SRX_BCLK_MST,
> +                   JH7110_SYSCLK_I2SRX_BCLK_EXT),
> +       JH71X0__INV(JH7110_SYSCLK_I2SRX_BCLK_INV, "i2srx_bclk_inv", JH7110_SYSCLK_I2SRX_BCLK),
> +       JH71X0__MUX(JH7110_SYSCLK_I2SRX_LRCK, "i2srx_lrck", 2,
> +                   JH7110_SYSCLK_I2SRX_LRCK_MST,
> +                   JH7110_SYSCLK_I2SRX_LRCK_EXT),
> +       /* pdm */
> +       JH71X0_GDIV(JH7110_SYSCLK_PDM_DMIC, "pdm_dmic", 0, 64, JH7110_SYSCLK_MCLK),
> +       JH71X0_GATE(JH7110_SYSCLK_PDM_APB, "pdm_apb", 0, JH7110_SYSCLK_APB0),
> +       /* tdm */
> +       JH71X0_GATE(JH7110_SYSCLK_TDM_AHB, "tdm_ahb", 0, JH7110_SYSCLK_AHB0),
> +       JH71X0_GATE(JH7110_SYSCLK_TDM_APB, "tdm_apb", 0, JH7110_SYSCLK_APB0),
> +       JH71X0_GDIV(JH7110_SYSCLK_TDM_INTERNAL, "tdm_internal", 0, 64, JH7110_SYSCLK_MCLK),
> +       JH71X0__MUX(JH7110_SYSCLK_TDM_TDM, "tdm_tdm", 2,
> +                   JH7110_SYSCLK_TDM_INTERNAL,
> +                   JH7110_SYSCLK_TDM_EXT),
> +       JH71X0__INV(JH7110_SYSCLK_TDM_TDM_INV, "tdm_tdm_inv", JH7110_SYSCLK_TDM_TDM),
> +       /* jtag */
> +       JH71X0__DIV(JH7110_SYSCLK_JTAG_CERTIFICATION_TRNG, "jtag_certification_trng", 4,
> +                   JH7110_SYSCLK_OSC),
> +};
> +
> +static struct clk_hw *jh7110_sysclk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct jh71x0_clk_priv *priv = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx < JH7110_SYSCLK_PLL0_OUT)
> +               return &priv->reg[idx].hw;
> +
> +       if (idx < JH7110_SYSCLK_END)
> +               return priv->pll[idx - JH7110_SYSCLK_PLL0_OUT];
> +
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +static int __init jh7110_syscrg_probe(struct platform_device *pdev)
> +{
> +       struct jh71x0_clk_priv *priv;
> +       unsigned int idx;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev,
> +                           struct_size(priv, reg, JH7110_SYSCLK_PLL0_OUT),
> +                           GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->rmw_lock);
> +       priv->dev = &pdev->dev;
> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       dev_set_drvdata(priv->dev, priv->base);
> +
> +       /* 24MHz -> 1250.0MHz */
> +       priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> +                                                        "osc", 0, 625, 12);
> +       if (IS_ERR(priv->pll[0]))
> +               return PTR_ERR(priv->pll[0]);

Hi Hal,

Are you sure this should be 1.25GHz and not 1GHz? I can't seem to make
the ethernet driver work unless I set it to 1GHz. This also makes
other derived clocks that should be 125MHz show up as such in the
clock tree. Eg. "usb_125m".

Perhaps it's because I updated my board to the latest u-boot
release[1]. I know these PLLs are just placeholders until you add
proper code to control them, but until then it's important that these
values match the defaults or whatever the latest u-boot sets them to.
Please check the PLLs below with the latest u-boot too.

/Emil

[1]: https://github.com/starfive-tech/VisionFive2/releases

> +       /* 24MHz -> 1066.0MHz */
> +       priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> +                                                        "osc", 0, 533, 12);
> +       if (IS_ERR(priv->pll[1]))
> +               return PTR_ERR(priv->pll[1]);
> +
> +       /* 24MHz -> 1188.0MHz */
> +       priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
> +                                                        "osc", 0, 99, 2);
> +       if (IS_ERR(priv->pll[2]))
> +               return PTR_ERR(priv->pll[2]);
> +
> +       for (idx = 0; idx < JH7110_SYSCLK_PLL0_OUT; idx++) {
> +               u32 max = jh7110_sysclk_data[idx].max;
> +               struct clk_parent_data parents[4] = {};
> +               struct clk_init_data init = {
> +                       .name = jh7110_sysclk_data[idx].name,
> +                       .ops = starfive_jh71x0_clk_ops(max),
> +                       .parent_data = parents,
> +                       .num_parents =
> +                               ((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> +                       .flags = jh7110_sysclk_data[idx].flags,
> +               };
> +               struct jh71x0_clk *clk = &priv->reg[idx];
> +               unsigned int i;
> +
> +               for (i = 0; i < init.num_parents; i++) {
> +                       unsigned int pidx = jh7110_sysclk_data[idx].parents[i];
> +
> +                       if (pidx < JH7110_SYSCLK_PLL0_OUT)
> +                               parents[i].hw = &priv->reg[pidx].hw;
> +                       else if (pidx < JH7110_SYSCLK_END)
> +                               parents[i].hw = priv->pll[pidx - JH7110_SYSCLK_PLL0_OUT];
> +                       else if (pidx == JH7110_SYSCLK_OSC)
> +                               parents[i].fw_name = "osc";
> +                       else if (pidx == JH7110_SYSCLK_GMAC1_RMII_REFIN)
> +                               parents[i].fw_name = "gmac1_rmii_refin";
> +                       else if (pidx == JH7110_SYSCLK_GMAC1_RGMII_RXIN)
> +                               parents[i].fw_name = "gmac1_rgmii_rxin";
> +                       else if (pidx == JH7110_SYSCLK_I2STX_BCLK_EXT)
> +                               parents[i].fw_name = "i2stx_bclk_ext";
> +                       else if (pidx == JH7110_SYSCLK_I2STX_LRCK_EXT)
> +                               parents[i].fw_name = "i2stx_lrck_ext";
> +                       else if (pidx == JH7110_SYSCLK_I2SRX_BCLK_EXT)
> +                               parents[i].fw_name = "i2srx_bclk_ext";
> +                       else if (pidx == JH7110_SYSCLK_I2SRX_LRCK_EXT)
> +                               parents[i].fw_name = "i2srx_lrck_ext";
> +                       else if (pidx == JH7110_SYSCLK_TDM_EXT)
> +                               parents[i].fw_name = "tdm_ext";
> +                       else if (pidx == JH7110_SYSCLK_MCLK_EXT)
> +                               parents[i].fw_name = "mclk_ext";
> +               }
> +
> +               clk->hw.init = &init;
> +               clk->idx = idx;
> +               clk->max_div = max & JH71X0_CLK_DIV_MASK;
> +
> +               ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_sysclk_get, priv);
> +       if (ret)
> +               return ret;
> +
> +       return jh7110_reset_controller_register(priv, "reset-sys", 0);
> +}
> +
> +static const struct of_device_id jh7110_syscrg_match[] = {
> +       { .compatible = "starfive,jh7110-syscrg" },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver jh7110_syscrg_driver = {
> +       .driver = {
> +               .name = "clk-starfive-jh7110-sys",
> +               .of_match_table = jh7110_syscrg_match,
> +               .suppress_bind_attrs = true,
> +       },
> +};
> +builtin_platform_driver_probe(jh7110_syscrg_driver, jh7110_syscrg_probe);
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index b372083d11c3..dda19c6937cb 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
>   */
>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/clk-provider.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
> @@ -331,3 +332,56 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>         return &jh71x0_clk_inv_ops;
>  }
>  EXPORT_SYMBOL_GPL(starfive_jh71x0_clk_ops);
> +
> +#if IS_ENABLED(CONFIG_CLK_STARFIVE_JH7110_SYS)
> +
> +static void jh7110_reset_unregister_adev(void *_adev)
> +{
> +       struct auxiliary_device *adev = _adev;
> +
> +       auxiliary_device_delete(adev);
> +}
> +
> +static void jh7110_reset_adev_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +       auxiliary_device_uninit(adev);
> +
> +       kfree(adev);
> +}
> +
> +int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
> +                                    const char *adev_name,
> +                                    u32 adev_id)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +       if (!adev)
> +               return -ENOMEM;
> +
> +       adev->name = adev_name;
> +       adev->dev.parent = priv->dev;
> +       adev->dev.release = jh7110_reset_adev_release;
> +       adev->id = adev_id;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret) {
> +               kfree(adev);
> +               return ret;
> +       }
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(priv->dev,
> +                                       jh7110_reset_unregister_adev, adev);
> +}
> +EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
> +
> +#endif
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
> index baf4b5cb4b8a..0cbf9d94257a 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
> @@ -111,4 +111,12 @@ struct jh71x0_clk_priv {
>
>  const struct clk_ops *starfive_jh71x0_clk_ops(u32 max);
>
> +#if IS_ENABLED(CONFIG_CLK_STARFIVE_JH7110_SYS)
> +
> +int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
> +                                    const char *adev_name,
> +                                    u32 adev_id);
> +
> +#endif
> +
>  #endif
> --
> 2.38.1
>
