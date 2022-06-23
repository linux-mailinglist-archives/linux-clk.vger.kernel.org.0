Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5F9556EE4
	for <lists+linux-clk@lfdr.de>; Thu, 23 Jun 2022 01:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345283AbiFVXPu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 Jun 2022 19:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237295AbiFVXPr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jun 2022 19:15:47 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA6D41F93
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 16:15:44 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id h34-20020a17090a29a500b001eb01527d9eso866222pjd.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 16:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P3stu2jpiD+rq/YUltL+8D0cKuW4FhmusRPumDgAJ0I=;
        b=r88DL+kQpJGEwJS5QbL6tbQ8UHchHtslEcqPmEMKryjaseziWq6gpDn+UOSIncdF0f
         ih2Dgcw1xtkTXPfXXBA0vEwh5DO0T15lCK1iJ9qv6mPqONnxSJPUHKu1rcyMIxI8cBsW
         zq+G8mh+RTo2n6OQ2+Ue4bkOwTwL9fH2iAGdd25rodFBVLH3Y57V37DjjagBy0KSH2AO
         EnG1W3lYCSTspW8rlwezcZqIMiNTTwZ12bI9rZEnVGi100T3nCPrhoedApCehzO+YC+m
         A9XhoR0Mvdk7X3R01zm1JUGA3JG2iOucdeoC0XtBxul95DHTmNN3VvrvnvIJVwKYfaq4
         LHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P3stu2jpiD+rq/YUltL+8D0cKuW4FhmusRPumDgAJ0I=;
        b=UY+1lkEjkNPi8jfLeGab5viQoE/vXe3ZCycAqI63VOA4f2YpIkyuSs1Zix4k4qiPWQ
         DQj61Mb/U02fMfBoA3bZ8Ik2sGG62WCemxyfqwk59fMsGW4swrI45xiQIrfjf2OCPno7
         g8EIXb//NYlpD0B22pPnpFLnW279X5md7hWHiRfZX82SAulqgKrmLmPYWCq5Y6F/SqX+
         V2VyDd5O8k+oZI4PJ2+h/vN6oMmFLHIpk7pvDqlLd11ns5UQuZQGT1tMXS/Znlxhgp2L
         v3ci+yM2nN4HXBdDDQYf00nuloYNLkb/N7YrLHa3XiITWcD78WSbi8ll2tI52d8LESj/
         daTg==
X-Gm-Message-State: AJIora812sxchmeeInNwbqUmzErMocuoeUU2c/5MtC10tfduY00NKJ+w
        hnrKqkMpHRyVT8VDMKhjsOJVkXWuXwfbnRM1AOfFAQ==
X-Google-Smtp-Source: AGRyM1vINaSkhrPo3agP88+r6SUCLlHgWMzvH841oHqK5cw3api5ODNloLKrbM5eo9YTDs/tAJbZ5CpBusGYzZqVe9k=
X-Received: by 2002:a17:90b:4d8b:b0:1e3:30bd:5a35 with SMTP id
 oj11-20020a17090b4d8b00b001e330bd5a35mr817264pjb.152.1655939744266; Wed, 22
 Jun 2022 16:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220621233412.506768-1-robert.foss@linaro.org>
 <20220621233412.506768-3-robert.foss@linaro.org> <9c7a9e47-904a-fb1e-c0b3-b612a178299f@somainline.org>
In-Reply-To: <9c7a9e47-904a-fb1e-c0b3-b612a178299f@somainline.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 23 Jun 2022 01:15:33 +0200
Message-ID: <CAG3jFyunJVWM+kvF1=HXuehF0bx6mFwT8Ck=Qarh0KMQyxYx-Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] clk: qcom: add support for SM8350 GPUCC
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 Jun 2022 at 12:20, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
>
> On 22.06.2022 01:34, Robert Foss wrote:
> > The GPUCC manages the clocks for the Adreno GPU found on the
> > sm8350 SoCs.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > ---
> >
> > Changes since v1
> >  - Remove .name assignments for clk_parent_data - Dmitry
> >  - Use ARRAY_SIZE where possible - Dmitry
> >  - Remove commented out code - Dmitry
> >  - Set CLAMP_IO flag for gpu_gx_gdsc - Dmitry
> >  - Assign .parent_hws instead of .hw - Dmitry
> >
> > Changes since v2
> >  - Switch license to dual BSD/GPL - Bjorn
> >  - Add Jonathans SoB - Jonathan
> >  - Add Linaro to copyright statement - Bjorn
> >  - Make .hw.init assignment const - Bjorn
> >  - Extract & deduplicate bi_tcxo parent_data - Bjorn
> >  - Removed further .name assignment - Bjorn
> >  - Move of_device_id declaration - Bjorn
> >
> > Changes since v3
> >  - Change license to BSD/GPL - Rob/Bjorn
> >  - Switch from .fw_name to .index
> >
> > Changes since v4
> >  - Change year of copyright statement
> >  - Change to dual license for header file - Rob
> >
> > Changes since since v5
> >  - Change hex to lower case - Konrad
> >
> >
> >  drivers/clk/qcom/Kconfig        |   8 +
> >  drivers/clk/qcom/Makefile       |   1 +
> >  drivers/clk/qcom/gpucc-sm8350.c | 637 ++++++++++++++++++++++++++++++++
> >  3 files changed, 646 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gpucc-sm8350.c
> >
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index bc4dcf356d82..b11235c21952 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -712,6 +712,14 @@ config SM_GPUCC_8250
> >         Say Y if you want to support graphics controller devices and
> >         functionality such as 3D graphics.
> >
> > +config SM_GPUCC_8350
> > +     tristate "SM8350 Graphics Clock Controller"
> > +     select SM_GCC_8350
> > +     help
> > +       Support for the graphics clock controller on SM8350 devices.
> > +       Say Y if you want to support graphics controller devices and
> > +       functionality such as 3D graphics.
> > +
> >  config SM_VIDEOCC_8150
> >       tristate "SM8150 Video Clock Controller"
> >       select SM_GCC_8150
> > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > index 36789f5233ef..ef9c64824424 100644
> > --- a/drivers/clk/qcom/Makefile
> > +++ b/drivers/clk/qcom/Makefile
> > @@ -101,6 +101,7 @@ obj-$(CONFIG_SM_GCC_8450) += gcc-sm8450.o
> >  obj-$(CONFIG_SM_GPUCC_6350) += gpucc-sm6350.o
> >  obj-$(CONFIG_SM_GPUCC_8150) += gpucc-sm8150.o
> >  obj-$(CONFIG_SM_GPUCC_8250) += gpucc-sm8250.o
> > +obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
> >  obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
> >  obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
> >  obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
> > diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
> > new file mode 100644
> > index 000000000000..b7f075b1a81b
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gpucc-sm8350.c
> > @@ -0,0 +1,637 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> I don't think you can relicense this code, as Jonathan mentioned in a previous revision [1], this is mostly the downstream driver which was explicitly GPL-2.0-only [2].

Ack

>
>
> > +/*
> > + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2022, Linaro Limited
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <dt-bindings/clock/qcom,gpucc-sm8350.h>
> > +
> > +#include "clk-alpha-pll.h"
> > +#include "clk-branch.h"
> > +#include "clk-pll.h"
> > +#include "clk-rcg.h"
> > +#include "clk-regmap.h"
> > +#include "common.h"
> > +#include "clk-regmap-mux.h"
> > +#include "clk-regmap-divider.h"
> > +#include "gdsc.h"
> > +#include "reset.h"
> > +
> > +enum {
> > +     P_BI_TCXO,
> > +     P_GPLL0_OUT_MAIN,
> > +     P_GPLL0_OUT_MAIN_DIV,
> > +     P_GPU_CC_PLL0_OUT_MAIN,
> > +     P_GPU_CC_PLL1_OUT_MAIN,
> > +};
> > +
> > +static struct pll_vco lucid_5lpe_vco[] = {
> > +     { 249600000, 1750000000, 0 },
> > +};
> > +
> > +static const struct alpha_pll_config gpu_cc_pll0_config = {
> > +     .l = 0x18,
> > +     .alpha = 0x6000,
> > +     .config_ctl_val = 0x20485699,
> > +     .config_ctl_hi_val = 0x00002261,
> > +     .config_ctl_hi1_val = 0x2a9a699c,
> > +     .test_ctl_val = 0x00000000,
> > +     .test_ctl_hi_val = 0x00000000,
> > +     .test_ctl_hi1_val = 0x01800000,
> > +     .user_ctl_val = 0x00000000,
> > +     .user_ctl_hi_val = 0x00000805,
> > +     .user_ctl_hi1_val = 0x00000000,
> > +};
> > +
> > +static const struct clk_parent_data gpu_cc_parent = {
> > +     .fw_name = "bi_tcxo",
> > +};
> > +
> > +static struct clk_alpha_pll gpu_cc_pll0 = {
> > +     .offset = 0x0,
> > +     .vco_table = lucid_5lpe_vco,
> > +     .num_vco = ARRAY_SIZE(lucid_5lpe_vco),
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +     .clkr = {
> > +             .hw.init = &(const struct clk_init_data){
> > +                     .name = "gpu_cc_pll0",
> > +                     .parent_data = &gpu_cc_parent,
> > +                     .num_parents = 1,
> > +                     .ops = &clk_alpha_pll_lucid_5lpe_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static const struct alpha_pll_config gpu_cc_pll1_config = {
> > +     .l = 0x1A,
> > +     .alpha = 0xAAA,
> Lowercase hex, please, all throughout the file.

Ack.

>
> The rest looks good.
>
>
> Konrad
>
> [1] https://yhbt.net/lore/all/e7935b8e-1e4c-a424-7d77-307e346f507f@marek.ca/
> [2] https://github.com/sonyxperiadev/kernel/blob/aosp/LA.UM.9.14.r1/drivers/clk/qcom/gpucc-lahaina.c#L1
>
> > +     .config_ctl_val = 0x20485699,
> > +     .config_ctl_hi_val = 0x00002261,
> > +     .config_ctl_hi1_val = 0x2A9A699C,
> > +     .test_ctl_val = 0x00000000,
> > +     .test_ctl_hi_val = 0x00000000,
> > +     .test_ctl_hi1_val = 0x01800000,
> > +     .user_ctl_val = 0x00000000,
> > +     .user_ctl_hi_val = 0x00000805,
> > +     .user_ctl_hi1_val = 0x00000000,
> > +};
> > +
> > +static struct clk_alpha_pll gpu_cc_pll1 = {
> > +     .offset = 0x100,
> > +     .vco_table = lucid_5lpe_vco,
> > +     .num_vco = ARRAY_SIZE(lucid_5lpe_vco),
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +     .clkr = {
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_pll1",
> > +                     .parent_data = &gpu_cc_parent,
> > +                     .num_parents = 1,
> > +                     .ops = &clk_alpha_pll_lucid_5lpe_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static const struct parent_map gpu_cc_parent_map_0[] = {
> > +     { P_BI_TCXO, 0 },
> > +     { P_GPU_CC_PLL0_OUT_MAIN, 1 },
> > +     { P_GPU_CC_PLL1_OUT_MAIN, 3 },
> > +     { P_GPLL0_OUT_MAIN, 5 },
> > +     { P_GPLL0_OUT_MAIN_DIV, 6 },
> > +};
> > +
> > +static const struct clk_parent_data gpu_cc_parent_data_0[] = {
> > +     gpu_cc_parent,
> > +     { .hw = &gpu_cc_pll0.clkr.hw },
> > +     { .hw = &gpu_cc_pll1.clkr.hw },
> > +     { .fw_name = "gcc_gpu_gpll0_clk_src" },
> > +     { .fw_name = "gcc_gpu_gpll0_div_clk_src" },
> > +};
> > +
> > +static const struct parent_map gpu_cc_parent_map_1[] = {
> > +     { P_BI_TCXO, 0 },
> > +     { P_GPU_CC_PLL1_OUT_MAIN, 3 },
> > +     { P_GPLL0_OUT_MAIN, 5 },
> > +     { P_GPLL0_OUT_MAIN_DIV, 6 },
> > +};
> > +
> > +static const struct clk_parent_data gpu_cc_parent_data_1[] = {
> > +     gpu_cc_parent,
> > +     { .hw = &gpu_cc_pll1.clkr.hw },
> > +     { .fw_name = "gcc_gpu_gpll0_clk_src" },
> > +     { .fw_name = "gcc_gpu_gpll0_div_clk_src" },
> > +};
> > +
> > +static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
> > +     F(19200000, P_BI_TCXO, 1, 0, 0),
> > +     F(200000000, P_GPLL0_OUT_MAIN_DIV, 1.5, 0, 0),
> > +     F(500000000, P_GPU_CC_PLL1_OUT_MAIN, 1, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 gpu_cc_gmu_clk_src = {
> > +     .cmd_rcgr = 0x1120,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = gpu_cc_parent_map_0,
> > +     .freq_tbl = ftbl_gpu_cc_gmu_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "gpu_cc_gmu_clk_src",
> > +             .parent_data = gpu_cc_parent_data_0,
> > +             .num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static const struct freq_tbl ftbl_gpu_cc_hub_clk_src[] = {
> > +     F(150000000, P_GPLL0_OUT_MAIN_DIV, 2, 0, 0),
> > +     F(240000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
> > +     F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
> > +     { }
> > +};
> > +
> > +static struct clk_rcg2 gpu_cc_hub_clk_src = {
> > +     .cmd_rcgr = 0x117c,
> > +     .mnd_width = 0,
> > +     .hid_width = 5,
> > +     .parent_map = gpu_cc_parent_map_1,
> > +     .freq_tbl = ftbl_gpu_cc_hub_clk_src,
> > +     .clkr.hw.init = &(struct clk_init_data){
> > +             .name = "gpu_cc_hub_clk_src",
> > +             .parent_data = gpu_cc_parent_data_1,
> > +             .num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_rcg2_ops,
> > +     },
> > +};
> > +
> > +static struct clk_regmap_div gpu_cc_hub_ahb_div_clk_src = {
> > +     .reg = 0x11c0,
> > +     .shift = 0,
> > +     .width = 4,
> > +     .clkr.hw.init = &(struct clk_init_data) {
> > +             .name = "gpu_cc_hub_ahb_div_clk_src",
> > +             .parent_hws = (const struct clk_hw*[]){
> > +                     &gpu_cc_hub_clk_src.clkr.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_regmap_div_ro_ops,
> > +     },
> > +};
> > +
> > +static struct clk_regmap_div gpu_cc_hub_cx_int_div_clk_src = {
> > +     .reg = 0x11bc,
> > +     .shift = 0,
> > +     .width = 4,
> > +     .clkr.hw.init = &(struct clk_init_data) {
> > +             .name = "gpu_cc_hub_cx_int_div_clk_src",
> > +             .parent_hws = (const struct clk_hw*[]){
> > +                     &gpu_cc_hub_clk_src.clkr.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +             .ops = &clk_regmap_div_ro_ops,
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_ahb_clk = {
> > +     .halt_reg = 0x1078,
> > +     .halt_check = BRANCH_HALT_DELAY,
> > +     .clkr = {
> > +             .enable_reg = 0x1078,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_ahb_clk",
> > +                     .parent_hws = (const struct clk_hw*[]){
> > +                             &gpu_cc_hub_ahb_div_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_cb_clk = {
> > +     .halt_reg = 0x1170,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x1170,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_cb_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_crc_ahb_clk = {
> > +     .halt_reg = 0x107c,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x107c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_crc_ahb_clk",
> > +                     .parent_hws = (const struct clk_hw*[]){
> > +                             &gpu_cc_hub_ahb_div_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_cx_apb_clk = {
> > +     .halt_reg = 0x1088,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x1088,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_cx_apb_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_cx_gmu_clk = {
> > +     .halt_reg = 0x1098,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x1098,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_cx_gmu_clk",
> > +                     .parent_hws = (const struct clk_hw*[]){
> > +                             &gpu_cc_gmu_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_aon_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_cx_qdss_at_clk = {
> > +     .halt_reg = 0x1080,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x1080,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_cx_qdss_at_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_cx_qdss_trig_clk = {
> > +     .halt_reg = 0x1094,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x1094,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_cx_qdss_trig_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_cx_qdss_tsctr_clk = {
> > +     .halt_reg = 0x1084,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x1084,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_cx_qdss_tsctr_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
> > +     .halt_reg = 0x108c,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x108c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_cx_snoc_dvm_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_cxo_aon_clk = {
> > +     .halt_reg = 0x1004,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x1004,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_cxo_aon_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_cxo_clk = {
> > +     .halt_reg = 0x109c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x109c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_cxo_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_freq_measure_clk = {
> > +     .halt_reg = 0x120c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x120c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_freq_measure_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_gx_gmu_clk = {
> > +     .halt_reg = 0x1064,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x1064,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_gx_gmu_clk",
> > +                     .parent_hws = (const struct clk_hw*[]){
> > +                             &gpu_cc_gmu_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_gx_qdss_tsctr_clk = {
> > +     .halt_reg = 0x105c,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x105c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_gx_qdss_tsctr_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_gx_vsense_clk = {
> > +     .halt_reg = 0x1058,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x1058,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_gx_vsense_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
> > +     .halt_reg = 0x5000,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x5000,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_hub_aon_clk = {
> > +     .halt_reg = 0x1178,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x1178,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_hub_aon_clk",
> > +                     .parent_hws = (const struct clk_hw*[]){
> > +                             &gpu_cc_hub_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_aon_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_hub_cx_int_clk = {
> > +     .halt_reg = 0x1204,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x1204,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_hub_cx_int_clk",
> > +                     .parent_hws = (const struct clk_hw*[]){
> > +                             &gpu_cc_hub_cx_int_div_clk_src.clkr.hw,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .flags = CLK_SET_RATE_PARENT,
> > +                     .ops = &clk_branch2_aon_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_mnd1x_0_gfx3d_clk = {
> > +     .halt_reg = 0x802c,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x802c,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_mnd1x_0_gfx3d_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_mnd1x_1_gfx3d_clk = {
> > +     .halt_reg = 0x8030,
> > +     .halt_check = BRANCH_HALT,
> > +     .clkr = {
> > +             .enable_reg = 0x8030,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_mnd1x_1_gfx3d_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct clk_branch gpu_cc_sleep_clk = {
> > +     .halt_reg = 0x1090,
> > +     .halt_check = BRANCH_HALT_VOTED,
> > +     .clkr = {
> > +             .enable_reg = 0x1090,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
> > +                     .name = "gpu_cc_sleep_clk",
> > +                     .ops = &clk_branch2_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static struct gdsc gpu_cx_gdsc = {
> > +     .gdscr = 0x106c,
> > +     .gds_hw_ctrl = 0x1540,
> > +     .pd = {
> > +             .name = "gpu_cx_gdsc",
> > +     },
> > +     .pwrsts = PWRSTS_OFF_ON,
> > +     .flags = VOTABLE,
> > +};
> > +
> > +static struct gdsc gpu_gx_gdsc = {
> > +     .gdscr = 0x100c,
> > +     .clamp_io_ctrl = 0x1508,
> > +     .pd = {
> > +             .name = "gpu_gx_gdsc",
> > +             .power_on = gdsc_gx_do_nothing_enable,
> > +     },
> > +     .pwrsts = PWRSTS_OFF_ON,
> > +     .flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
> > +};
> > +
> > +static struct clk_regmap *gpu_cc_sm8350_clocks[] = {
> > +     [GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
> > +     [GPU_CC_CB_CLK] = &gpu_cc_cb_clk.clkr,
> > +     [GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
> > +     [GPU_CC_CX_APB_CLK] = &gpu_cc_cx_apb_clk.clkr,
> > +     [GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
> > +     [GPU_CC_CX_QDSS_AT_CLK] = &gpu_cc_cx_qdss_at_clk.clkr,
> > +     [GPU_CC_CX_QDSS_TRIG_CLK] = &gpu_cc_cx_qdss_trig_clk.clkr,
> > +     [GPU_CC_CX_QDSS_TSCTR_CLK] = &gpu_cc_cx_qdss_tsctr_clk.clkr,
> > +     [GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
> > +     [GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
> > +     [GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
> > +     [GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
> > +     [GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
> > +     [GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
> > +     [GPU_CC_GX_QDSS_TSCTR_CLK] = &gpu_cc_gx_qdss_tsctr_clk.clkr,
> > +     [GPU_CC_GX_VSENSE_CLK] = &gpu_cc_gx_vsense_clk.clkr,
> > +     [GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
> > +     [GPU_CC_HUB_AHB_DIV_CLK_SRC] = &gpu_cc_hub_ahb_div_clk_src.clkr,
> > +     [GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
> > +     [GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
> > +     [GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
> > +     [GPU_CC_HUB_CX_INT_DIV_CLK_SRC] = &gpu_cc_hub_cx_int_div_clk_src.clkr,
> > +     [GPU_CC_MND1X_0_GFX3D_CLK] = &gpu_cc_mnd1x_0_gfx3d_clk.clkr,
> > +     [GPU_CC_MND1X_1_GFX3D_CLK] = &gpu_cc_mnd1x_1_gfx3d_clk.clkr,
> > +     [GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
> > +     [GPU_CC_PLL1] = &gpu_cc_pll1.clkr,
> > +     [GPU_CC_SLEEP_CLK] = &gpu_cc_sleep_clk.clkr,
> > +};
> > +
> > +static const struct qcom_reset_map gpu_cc_sm8350_resets[] = {
> > +     [GPUCC_GPU_CC_ACD_BCR] = { 0x1160 },
> > +     [GPUCC_GPU_CC_CB_BCR] = { 0x116c },
> > +     [GPUCC_GPU_CC_CX_BCR] = { 0x1068 },
> > +     [GPUCC_GPU_CC_FAST_HUB_BCR] = { 0x1174 },
> > +     [GPUCC_GPU_CC_GFX3D_AON_BCR] = { 0x10a0 },
> > +     [GPUCC_GPU_CC_GMU_BCR] = { 0x111c },
> > +     [GPUCC_GPU_CC_GX_BCR] = { 0x1008 },
> > +     [GPUCC_GPU_CC_XO_BCR] = { 0x1000 },
> > +};
> > +
> > +static struct gdsc *gpu_cc_sm8350_gdscs[] = {
> > +     [GPU_CX_GDSC] = &gpu_cx_gdsc,
> > +     [GPU_GX_GDSC] = &gpu_gx_gdsc,
> > +};
> > +
> > +static const struct regmap_config gpu_cc_sm8350_regmap_config = {
> > +     .reg_bits = 32,
> > +     .reg_stride = 4,
> > +     .val_bits = 32,
> > +     .max_register = 0x8030,
> > +     .fast_io = true,
> > +};
> > +
> > +static const struct qcom_cc_desc gpu_cc_sm8350_desc = {
> > +     .config = &gpu_cc_sm8350_regmap_config,
> > +     .clks = gpu_cc_sm8350_clocks,
> > +     .num_clks = ARRAY_SIZE(gpu_cc_sm8350_clocks),
> > +     .resets = gpu_cc_sm8350_resets,
> > +     .num_resets = ARRAY_SIZE(gpu_cc_sm8350_resets),
> > +     .gdscs = gpu_cc_sm8350_gdscs,
> > +     .num_gdscs = ARRAY_SIZE(gpu_cc_sm8350_gdscs),
> > +};
> > +
> > +static int gpu_cc_sm8350_probe(struct platform_device *pdev)
> > +{
> > +     struct regmap *regmap;
> > +
> > +     regmap = qcom_cc_map(pdev, &gpu_cc_sm8350_desc);
> > +     if (IS_ERR(regmap)) {
> > +             dev_err(&pdev->dev, "Failed to map gpu cc registers\n");
> > +             return PTR_ERR(regmap);
> > +     }
> > +
> > +     clk_lucid_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> > +     clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> > +
> > +     return qcom_cc_really_probe(pdev, &gpu_cc_sm8350_desc, regmap);
> > +}
> > +
> > +static const struct of_device_id gpu_cc_sm8350_match_table[] = {
> > +     { .compatible = "qcom,sm8350-gpucc" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, gpu_cc_sm8350_match_table);
> > +
> > +static struct platform_driver gpu_cc_sm8350_driver = {
> > +     .probe = gpu_cc_sm8350_probe,
> > +     .driver = {
> > +             .name = "sm8350-gpucc",
> > +             .of_match_table = gpu_cc_sm8350_match_table,
> > +     },
> > +};
> > +
> > +static int __init gpu_cc_sm8350_init(void)
> > +{
> > +     return platform_driver_register(&gpu_cc_sm8350_driver);
> > +}
> > +subsys_initcall(gpu_cc_sm8350_init);
> > +
> > +static void __exit gpu_cc_sm8350_exit(void)
> > +{
> > +     platform_driver_unregister(&gpu_cc_sm8350_driver);
> > +}
> > +module_exit(gpu_cc_sm8350_exit);
> > +
> > +MODULE_DESCRIPTION("QTI GPU_CC SM8350 Driver");
> > +MODULE_LICENSE("GPL v2");
