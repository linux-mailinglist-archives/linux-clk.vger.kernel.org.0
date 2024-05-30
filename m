Return-Path: <linux-clk+bounces-7490-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 318038D4BF7
	for <lists+linux-clk@lfdr.de>; Thu, 30 May 2024 14:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D587B28434E
	for <lists+linux-clk@lfdr.de>; Thu, 30 May 2024 12:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCF81474C3;
	Thu, 30 May 2024 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="0lOOhjDC"
X-Original-To: linux-clk@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1EB132128;
	Thu, 30 May 2024 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717073315; cv=none; b=NEfi4wVGmaCkq4/SBks22KaDpF+UhfRUXizsSgsi0mO6YcoEANEzhnbW+RrMIKn0HcN9CEtvsSvoVhpo2SjNbR0yAN+erLf3xvTY7/cXv6jTWGksmL3xGpV98MHbLzoJp0DlcAEKSTQk2WsSlegnnAahOuc//Ih7UaPTlpQKK2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717073315; c=relaxed/simple;
	bh=OP6XRog4cE88wYyTXoF/8qzQ5XybwFBKMvY44sDP6tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kzy/Nm1/Kp/yeDxUR34T71Xz7hoKym2cB+W9T7RuTGWmNGjcfo0IFUwEJ5VV2XCrt002Zk24Japx2UNKeJ5XgnIw6x3lsFU/jG8EhFVpPDgNG9o2bGylP39L0iGZqRPwAppJRtRGkYrGUdk8U8k8NFoa8Nfst9FkY00qsP+BOAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=0lOOhjDC; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717073309;
	bh=OP6XRog4cE88wYyTXoF/8qzQ5XybwFBKMvY44sDP6tg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0lOOhjDCGvhvKpRBJ/3tS866RbqNldDgB/AdLjHOSplmEAD1NddLepyromD58JEIm
	 aIiut8ql2U2I69qnJROphoaKZptWc8+FSmBmxs/f/qGcyrQutRkt8on0N4KInkJ6ET
	 JCkbum2LsZ3iFtmAVPJA6UNrB3Oi7ZxDqeMEVdK3EUOE3JvSrEWbjE06DbDXF07MdE
	 sFH662HcsxZcimCVFbQtb1cKeVH+/RpZX5rlV7OgT2WLPLoe7lQ7fMPL79KsUq+iD/
	 /vVsWPX/lEjEGxOd0y2tOjl1mZWTarVn1E/Qafprk5Ty8fmeAHeJ4FStntJ8538Oox
	 6VJSqIKHdisKg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9DEF637821AD;
	Thu, 30 May 2024 12:48:28 +0000 (UTC)
Message-ID: <0e5a5b36-6969-416d-9a16-6c71d7986c73@collabora.com>
Date: Thu, 30 May 2024 14:48:28 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: mediatek: Add mt8173-mfgtop driver
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-3-wenst@chromium.org>
 <5a5842d7-adad-410b-bac2-9e5cb03ae18c@collabora.com>
 <CAGXv+5E5zFWVi+QmZj+mMb5jRfv138kz1FQyXiuzpe5Zz2KbZQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5E5zFWVi+QmZj+mMb5jRfv138kz1FQyXiuzpe5Zz2KbZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 30/05/24 12:16, Chen-Yu Tsai ha scritto:
> On Thu, May 30, 2024 at 5:59 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 30/05/24 10:35, Chen-Yu Tsai ha scritto:
>>> The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
>>> in the datasheet, that contains clock gates, some power sequence signal
>>> delays, and other unknown registers that get toggled when the GPU is
>>> powered on.
>>>
>>> The clock gates are exposed as clocks provided by a clock controller,
>>> while the power sequencing bits are exposed as one singular power domain.
>>>
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> ---
>>>    drivers/clk/mediatek/Kconfig             |   9 +
>>>    drivers/clk/mediatek/Makefile            |   1 +
>>>    drivers/clk/mediatek/clk-mt8173-mfgtop.c | 240 +++++++++++++++++++++++
>>>    3 files changed, 250 insertions(+)
>>>    create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
>>>
>>> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
>>> index 70a005e7e1b1..9e279c739f1c 100644
>>> --- a/drivers/clk/mediatek/Kconfig
>>> +++ b/drivers/clk/mediatek/Kconfig
>>> @@ -500,6 +500,15 @@ config COMMON_CLK_MT8173_IMGSYS
>>>        help
>>>          This driver supports MediaTek MT8173 imgsys clocks.
>>>
>>> +config COMMON_CLK_MT8173_MFGTOP
>>> +     tristate "Clock and power driver for MediaTek MT8173 mfgtop"
>>> +     depends on COMMON_CLK_MT8173
>>> +     default COMMON_CLK_MT8173
>>> +     select PM_GENERIC_DOMAINS
>>> +     select PM_GENERIC_DOMAINS_OF
>>> +     help
>>> +       This driver supports MediaTek MT8173 mfgtop clocks and power domain.
>>> +
>>>    config COMMON_CLK_MT8173_MMSYS
>>>           tristate "Clock driver for MediaTek MT8173 mmsys"
>>>           depends on COMMON_CLK_MT8173
>>> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
>>> index eeccfa039896..fdd3a76e12a1 100644
>>> --- a/drivers/clk/mediatek/Makefile
>>> +++ b/drivers/clk/mediatek/Makefile
>>> @@ -77,6 +77,7 @@ obj-$(CONFIG_COMMON_CLK_MT8167_VDECSYS) += clk-mt8167-vdec.o
>>>    obj-$(CONFIG_COMMON_CLK_MT8173) += clk-mt8173-apmixedsys.o clk-mt8173-infracfg.o \
>>>                                   clk-mt8173-pericfg.o clk-mt8173-topckgen.o
>>>    obj-$(CONFIG_COMMON_CLK_MT8173_IMGSYS) += clk-mt8173-img.o
>>> +obj-$(CONFIG_COMMON_CLK_MT8173_MFGTOP) += clk-mt8173-mfgtop.o
>>>    obj-$(CONFIG_COMMON_CLK_MT8173_MMSYS) += clk-mt8173-mm.o
>>>    obj-$(CONFIG_COMMON_CLK_MT8173_VDECSYS) += clk-mt8173-vdecsys.o
>>>    obj-$(CONFIG_COMMON_CLK_MT8173_VENCSYS) += clk-mt8173-vencsys.o
>>> diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
>>> new file mode 100644
>>> index 000000000000..85fa7a7453ed
>>> --- /dev/null
>>> +++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
>>> @@ -0,0 +1,240 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024 Google LLC
>>> + * Author: Chen-Yu Tsai <wenst@chromium.org>
>>> + *
>>> + * Based on driver in downstream ChromeOS v5.15 kernel.
>>> + *
>>> + * Copyright (c) 2014 MediaTek Inc.
>>> + * Author: Chiawen Lee <chiawen.lee@mediatek.com>
>>> + */
>>> +
>>> +#include <dt-bindings/clock/mt8173-clk.h>
>>> +
>>> +#include <linux/bitfield.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/mfd/syscon.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_domain.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/regmap.h>
>>> +
>>> +#include "clk-gate.h"
>>> +#include "clk-mtk.h"
>>> +
>>> +static const struct mtk_gate_regs mfg_cg_regs = {
>>> +     .sta_ofs = 0x0000,
>>> +     .clr_ofs = 0x0008,
>>> +     .set_ofs = 0x0004,
>>> +};
>>> +
>>> +#define GATE_MFG(_id, _name, _parent, _shift, _flags)        \
>>> +             GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
>>
>> Extra tabulation: please fix
> 
> One tab instead of two? OK.
> 

Yeah.

>>> +
>>> +/* TODO: The block actually has dividers for the core and mem clocks. */
>>> +static const struct mtk_gate mfg_clks[] = {
>>> +     GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RATE_PARENT),
>>> +     GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RATE_PARENT),
>>> +     GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PARENT),
>>> +     GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
>>> +};
>>> +
>>> +static const struct mtk_clk_desc mfg_desc = {
>>> +     .clks = mfg_clks,
>>> +     .num_clks = ARRAY_SIZE(mfg_clks),
>>> +};
>>> +
>>> +struct mt8173_mfgtop_data {
>>> +     struct clk_hw_onecell_data *clk_data;
>>> +     struct regmap *regmap;
>>> +     struct generic_pm_domain genpd;
>>> +     struct of_phandle_args parent_pd, child_pd;
>>> +     struct clk *clk_26m;
>>> +};
>>> +
>>> +static const struct of_device_id of_match_clk_mt8173_mfgtop[] = {
>>> +     { .compatible = "mediatek,mt8173-mfgtop", .data = &mfg_desc },
>>> +     { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_mfgtop);
>>
>> Please move of_match_clk_mt8173_mfgtop before clk_mt8173_mfgtop_drv for consistency
>> with all the other clock drivers.
> 
> Ack.
> 
>>> +
>>> +/* Delay count in clock cycles */
>>> +#define MFG_ACTIVE_POWER_CON0        0x24
>>> + #define RST_B_DELAY_CNT     GENMASK(7, 0)   /* pwr_rst_b de-assert delay during power-up */
>>> + #define CLK_EN_DELAY_CNT    GENMASK(15, 8)  /* CLK_DIS deassert delay during power-up */
>>> + #define CLK_DIS_DELAY_CNT   GENMASK(23, 16) /* CLK_DIS assert delay during power-down */
>>
>> The reason why I had EVT_FORCE_ABORT and ACTIVE_PWRCTL_EN in my driver is to
>> document that we're keeping the event force abort disabled and, more importantly,
>> we are keeping the "active power control" feature disabled.
>>
>> Please, add those two - or at least the ACTIVE_PWRCTL_EN - to keep that documented,
>> or this information will be lost for sure.
>> If in the future the ACTIVE_PWRCTL feature will become usable, it's going to be
>> just a 30 seconds change, as the info is already there.
> 
> OK.
> 
>>> +
>>> +#define MFG_ACTIVE_POWER_CON1        0x28
>>> + #define PWR_ON_S_DELAY_CNT  GENMASK(7, 0)   /* pwr_on_s assert delay during power-up */
>>> + #define ISO_DELAY_CNT               GENMASK(15, 8)  /* ISO assert delay during power-down */
>>> + #define ISOOFF_DELAY_CNT    GENMASK(23, 16) /* ISO de-assert delay during power-up */
>>> + #define RST__DELAY_CNT              GENMASK(31, 24) /* pwr_rsb_b assert delay during power-down */
>>> +
>>> +static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
>>> +{
>>> +     struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
>>> +
>>> +     /* drives internal power management */
>>> +     clk_prepare_enable(data->clk_26m);
>>> +
>>> +     /* Power on/off delays for various signals */
>>> +     regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
>>> +                  FIELD_PREP(RST_B_DELAY_CNT, 77) |
>>> +                  FIELD_PREP(CLK_EN_DELAY_CNT, 61) |
>>> +                  FIELD_PREP(CLK_DIS_DELAY_CNT, 60));
>>
>> I get that this is kinda odd to read, but still...
>>
>> FIELD_PREP(CLK_DIS_DELAY_CNT, 60) |
>> FIELD_PREP(ACTIVE_PWRCTL_EN, 0));
>>
>> ...please :-)
> 
> Sure.
> 
>>> +     regmap_write(data->regmap, MFG_ACTIVE_POWER_CON1,
>>> +                  FIELD_PREP(PWR_ON_S_DELAY_CNT, 11) |
>>> +                  FIELD_PREP(ISO_DELAY_CNT, 68) |
>>> +                  FIELD_PREP(ISOOFF_DELAY_CNT, 69) |
>>> +                  FIELD_PREP(RST__DELAY_CNT, 77));
>>> +
>>> +     /* Magic numbers related to core switch sequence and delays */
>>> +     regmap_write(data->regmap, 0xe0, 0x7a710184);
>>> +     regmap_write(data->regmap, 0xe4, 0x835f6856);
>>> +     regmap_write(data->regmap, 0xe8, 0x002b0234);
>>> +     regmap_write(data->regmap, 0xec, 0x80000000);
>>> +     regmap_write(data->regmap, 0xa0, 0x08000000);
>>
>> Is there any way to retrieve information about what those registers are?
> 
> I asked. They said the project was too long ago, and they could only
> figure out that it had something to do with core switch sequencing and
> delays between each core, which is what I put in the comment there.
> 

That's a bit sad to read, but okay, I guess we'll call it a day and keep the
magic numbers around, as that's the only option. :-(

>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
>>> +{
>>> +     struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
>>> +
>>> +     /* Magic numbers related to core switch sequence and delays */
>>> +     regmap_write(data->regmap, 0xec, 0);
>>> +
>>> +     /* drives internal power management */
>>> +     clk_disable_unprepare(data->clk_26m);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
>>> +{
>>> +     struct device *dev = &pdev->dev;
>>> +     struct device_node *node = dev->of_node;
>>> +     struct mt8173_mfgtop_data *data;
>>> +     int ret;
>>> +
>>> +     data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>> +     if (!data)
>>> +             return -ENOMEM;
>>> +
>>> +     platform_set_drvdata(pdev, data);
>>> +
>>> +     data->clk_data = mtk_devm_alloc_clk_data(dev, ARRAY_SIZE(mfg_clks));
>>> +     if (!data->clk_data)
>>> +             return -ENOMEM;
>>> +
>>> +     /* MTK clock gates also uses regmap */
>>> +     data->regmap = device_node_to_regmap(node);
>>> +     if (IS_ERR(data->regmap))
>>> +             return dev_err_probe(dev, PTR_ERR(data->regmap), "Failed to get regmap\n");
>>> +
>>> +     data->child_pd.np = node;
>>> +     data->child_pd.args_count = 0;
>>> +     ret = of_parse_phandle_with_args(node, "power-domains", "#power-domain-cells", 0,
>>> +                                      &data->parent_pd);
>>> +     if (ret)
>>> +             return dev_err_probe(dev, ret, "Failed to parse power domain\n");
>>> +
>>> +     devm_pm_runtime_enable(dev);
>>> +     /*
>>> +      * Do a pm_runtime_resume_and_get() to workaround a possible
>>> +      * deadlock between clk_register() and the genpd framework.
>>> +      */
>>> +     ret = pm_runtime_resume_and_get(dev);
>>> +     if (ret) {
>>> +             dev_err_probe(dev, ret, "Failed to runtime resume device\n");
>>> +             goto put_of_node;
>>> +     }
>>> +
>>> +     ret = mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mfg_clks),
>>> +                                  data->clk_data);
>>> +     if (ret) {
>>> +             dev_err_probe(dev, ret, "Failed to register clock gates\n");
>>> +             goto put_pm_runtime;
>>> +     }
>>> +
>>> +     data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
>>> +     if (IS_ERR(data->clk_26m)) {
>>> +             dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
>>> +             goto unregister_clks;
>>> +     }
>>> +
>>> +     ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
>>> +     if (ret) {
>>> +             dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
>>> +             goto put_26m_clk;
>>> +     }
>>> +
>>> +     data->genpd.name = "mfg_apm";
>>
>> "mfg-apm" or "mfg-pwr" please!
> 
> Ack.
> 
>> Everything else looks good.
>>
>> Thanks for taking care of that, I started this work way too much time ago and
>> realistically I wouldn't have been able to finish it due to time constraints.
>>
>> It's great to see that *finally* we can get some GPU upstream on this old SoC.
>> As its CPUs are really slow, LLVMPipe is quite unusable from a UX perspective
>> hence its only big issue was the lack of 3D HW acceleration.
> 
> I think there's still more work on the GPU driver side. I was digging
> through the mailing list to find ways to get it running, and evidently
> it doesn't fully support zink yet.
> 

There's still more work to do, yes, but it's still a great advancement.

>> This makes machines embedding this SoC usable, and that's simply awesome.
> 
> I'll give the patches a week to simmer while I go work on some
> other stuff.
> 

Sure, no worries.

Cheers!
Angelo

> ChenYu


