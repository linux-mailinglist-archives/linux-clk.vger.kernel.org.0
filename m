Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92BD3C20C1
	for <lists+linux-clk@lfdr.de>; Fri,  9 Jul 2021 10:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbhGII1K (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 9 Jul 2021 04:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbhGII1J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 04:27:09 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BCEC0613E5
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 01:24:25 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id p1so21662203lfr.12
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 01:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R9ROpNEhva5nhBZc7A0DO1wS4iiAe3klQ1xnW3ni7+o=;
        b=ZFngDI6rL2z3UXY3NgGKNkaymnfJ5c/exdXGaBqKVa7gAfKnWRNo6Gh0k71hv2iTff
         JbXuDbgYEEr5bWu4yGTLhcICHA3aZMuHU5KCvv7f2iF+tq7XXi1DsLq12CFWoKtzPsTL
         s3l1zSutrAiJ1wJzAv9eM/YGGtDQzsanwB/bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R9ROpNEhva5nhBZc7A0DO1wS4iiAe3klQ1xnW3ni7+o=;
        b=LP3GkTJU3tPLOe5aDMK7bBDj3i95MnjFaX0GrMxEXIMQ5gOAbFDD84xDxq5gKtWDsv
         bHEcycyXgpYYEon62IGIygLSWW0WuRvzLa1AZC58AzpIsERNNn6GHPEV6PYQViVFP+hD
         JtsRydRaUTtuQ3b56MXyyFGKPj5cWamBZstLwELYxUBlQ4dIbD0cL0X1y2p572WqKtrC
         6KHGZ+Q5cUSbcrxMyHwkWNRW1g0thFC2/wVmzVlpuz7wNjNA0WPwCC5UHr3YC7Q89ToK
         um+lgsj1hzGOJ+5SXmgWQiwesfSna28ASsj3qvvqRBASYo13H7AUWGAWZ37dRNEVtRpz
         mK9A==
X-Gm-Message-State: AOAM533FwNfU9epCDZOF+UyLss2Cz/0rIbPFISzpML6roBeR185WGVwm
        iTV2lWzxTkFVNLO8sBDhQOlWDXfKc8zREbOT7V+Bsg==
X-Google-Smtp-Source: ABdhPJxqMm0yEfmyZT02/vhmXv/W0H893rDty1n/dYZfWN32qRFcvyRqmfmHZo7Fpj5imIGkuoLW1bG5lqRRgfPv3bc=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr29357326lfh.342.1625819063439;
 Fri, 09 Jul 2021 01:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com> <20210616224743.5109-14-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-14-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 9 Jul 2021 16:24:12 +0800
Message-ID: <CAGXv+5GR7gRnAMJSJTPbq1QUL58Fq5oejuAvaEwLHTYNMwVBzQ@mail.gmail.com>
Subject: Re: [PATCH 13/22] clk: mediatek: Add MT8195 nnasys clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, Jun 17, 2021 at 7:00 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 nnasys clock provider
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig          |   6 ++
>  drivers/clk/mediatek/Makefile         |   1 +
>  drivers/clk/mediatek/clk-mt8195-nna.c | 128 ++++++++++++++++++++++++++
>  3 files changed, 135 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-nna.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 7cb745d47770..d34517728f4a 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -636,6 +636,12 @@ config COMMON_CLK_MT8195_SCP_ADSP
>         help
>           This driver supports MediaTek MT8195 scp_adsp clocks.
>
> +config COMMON_CLK_MT8195_NNASYS
> +       bool "Clock driver for MediaTek MT8195 nnasys"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 nnasys clocks.
> +
>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST

Same comments about commit log and Kconfig option apply.

> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 058ff55468a2..49e585a7ac8e 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -89,5 +89,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_IMGSYS) += clk-mt8195-img.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_IPESYS) += clk-mt8195-ipe.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_MFGCFG) += clk-mt8195-mfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_SCP_ADSP) += clk-mt8195-scp_adsp.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_NNASYS) += clk-mt8195-nna.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-nna.c b/drivers/clk/mediatek/clk-mt8195-nna.c
> new file mode 100644
> index 000000000000..4210c6cf5ef4
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-nna.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2021 MediaTek Inc.
> +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +
> +#include <dt-bindings/clock/mt8195-clk.h>
> +
> +static const struct mtk_gate_regs nna0_cg_regs = {
> +       .set_ofs = 0x104,
> +       .clr_ofs = 0x104,
> +       .sta_ofs = 0x104,

You are using the _no_setclr_ops variant. That means the .set_ofs and
.clr_ofs fields don't have any meaning and are not used. Please just
don't initialize them.

I think this applies to some of the other patches as well.

> +};
> +
> +static const struct mtk_gate_regs nna1_cg_regs = {
> +       .set_ofs = 0x110,
> +       .clr_ofs = 0x110,
> +       .sta_ofs = 0x110,
> +};
> +
> +static const struct mtk_gate_regs nna2_cg_regs = {
> +       .set_ofs = 0x90,
> +       .clr_ofs = 0x90,
> +       .sta_ofs = 0x90,
> +};
> +
> +static const struct mtk_gate_regs nna3_cg_regs = {
> +       .set_ofs = 0x94,
> +       .clr_ofs = 0x94,
> +       .sta_ofs = 0x94,
> +};
> +
> +static const struct mtk_gate_regs nna4_cg_regs = {
> +       .set_ofs = 0x98,
> +       .clr_ofs = 0x98,
> +       .sta_ofs = 0x98,
> +};
> +
> +static const struct mtk_gate_regs nna5_cg_regs = {
> +       .set_ofs = 0x9c,
> +       .clr_ofs = 0x9c,
> +       .sta_ofs = 0x9c,
> +};
> +
> +static const struct mtk_gate_regs nna6_cg_regs = {
> +       .set_ofs = 0xa0,
> +       .clr_ofs = 0xa0,
> +       .sta_ofs = 0xa0,
> +};
> +
> +static const struct mtk_gate_regs nna7_cg_regs = {
> +       .set_ofs = 0xa4,
> +       .clr_ofs = 0xa4,
> +       .sta_ofs = 0xa4,
> +};

Unfortunately this hardware block is not documented in the datasheets,
so I can't verify these register offsets.

> +
> +#define GATE_NNA0(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA1(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA2(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna2_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA3(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna3_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA4(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna4_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA5(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna5_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA6(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna6_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA7(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna7_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)

Defining a bunch of macros, only to have each of them used once doesn't
provide any gains with regards to reusing code. Please consider just using
GATE_MTK directly below.

In the general case I would probably make some derivatives of GATE_MTK,
such that the ops field (which seems to be the longest) is hidden, but
all the other fields are exposed.

> +static const struct mtk_gate nna_clks[] = {
> +       /* NNA0 */
> +       GATE_NNA0(CLK_NNA_F26M, "nna_f26m", "clk26m", 0),
> +       /* NNA1 */
> +       GATE_NNA1(CLK_NNA_AXI, "nna_axi", "axi_sel", 0),
> +       /* NNA2 */
> +       GATE_NNA2(CLK_NNA_NNA0, "nna_nna0", "nna0_sel", 0),
> +       /* NNA3 */
> +       GATE_NNA3(CLK_NNA_NNA1, "nna_nna1", "nna0_sel", 0),

Is this correct? I would expect the clock for nna1 to be fed from
"nna1_sel".

ChenYu

> +       /* NNA4 */
> +       GATE_NNA4(CLK_NNA_NNA0_EMI, "nna_nna0_emi", "mem_466m", 0),
> +       GATE_NNA4(CLK_NNA_CKGEN_MEM, "nna_ckgen_mem", "mem_466m", 4),
> +       /* NNA5 */
> +       GATE_NNA5(CLK_NNA_NNA1_EMI, "nna_nna1_emi", "mem_466m", 0),
> +       /* NNA6 */
> +       GATE_NNA6(CLK_NNA_NNA0_AXI, "nna_nna0_axi", "axi_sel", 0),
> +       /* NNA7 */
> +       GATE_NNA7(CLK_NNA_NNA1_AXI, "nna_nna1_axi", "axi_sel", 0),
> +};
> +
> +static const struct mtk_clk_desc nna_desc = {
> +       .clks = nna_clks,
> +       .num_clks = ARRAY_SIZE(nna_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8195_nna[] = {
> +       {
> +               .compatible = "mediatek,mt8195-nnasys",
> +               .data = &nna_desc,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static struct platform_driver clk_mt8195_nna_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .driver = {
> +               .name = "clk-mt8195-nna",
> +               .of_match_table = of_match_clk_mt8195_nna,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8195_nna_drv);
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
