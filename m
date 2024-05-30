Return-Path: <linux-clk+bounces-7488-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A428D496F
	for <lists+linux-clk@lfdr.de>; Thu, 30 May 2024 12:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BFC51C220EB
	for <lists+linux-clk@lfdr.de>; Thu, 30 May 2024 10:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B71176AC2;
	Thu, 30 May 2024 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TspVXms4"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE43E176AA1
	for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 10:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064200; cv=none; b=Hn4TDLzKg2IR5sUxafS0L5N6byYBxoU2DoUo2JXQQ1UFTVm7zMQouCzv0tN1xwD1/JXLsAL7xWMDvAt7CGTOQ9opAkOZWSHfsfdJVofl8I5ANKsIN83+NvW051fgAKLFMHG381JTkrkS+Co11VN6lRqVRIVO+7mOneTAykxiCBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064200; c=relaxed/simple;
	bh=O+bfZPNgR+5cgx22z1M6wTZNIFfEPtzPEK1LR2N9awc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bowI7SJK8zV2iC6/6SC09COu+OG6unO//+QxTdpegCopQzCaThkSsVkUan8oG+Q2YzBBCerjRXJHgJHOD1oHvPNgAFZdHlnuxfZWoo6KdIWTOKMVD62QQ18xlX6HKutxIrLHYbA88R8/jYExQ49PIoZDUjK2XmBPGqDg4yZgLnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TspVXms4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b7e693b8aso464978e87.1
        for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 03:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717064197; x=1717668997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzT5yCSvV57mMTYhBGzUgbIbwkfE5KRalJPYyg3Db1Q=;
        b=TspVXms413+ULQrpfS8L9w1jZC4LN8VHIvcxwqbLQoyxYQoYG44E/dszpe+z2CVchm
         NRvrVbFOpX+67jON8+qCwtReBmVAIQpZQCBK3Fa4ECSEyeLtXsf4Tg/lBm2mUjlhnwyo
         a9bNsz68nhcsn/jXXrCb30vePrXWPv1xaHnUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717064197; x=1717668997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzT5yCSvV57mMTYhBGzUgbIbwkfE5KRalJPYyg3Db1Q=;
        b=iyuNn1VLR8YujhnM/RYOdnMuMYhQwDorsFo2dopPyJmscpdTFfnA/f3Af40Mm/8voG
         bhkAXyxR8+/Dq7Vab2IqdYqe+3DIi9qYhmwO1uwCGadmzp5qTo8KFWCCXVK+fRtpRHf2
         WqNaus8MKklwP0NZK/C3UfiMKm+6OUWeBRVyahjFfjwObtKQnMJ5H0Ug4/2fixIFBCeC
         FjA+NhaxN8QMA3JBThdiF11vqPtvODrgJwyHmA8ybIP/+Z+jQsFwS2EOecr6VSadBs9H
         Q5zXwcgiFRReUPVOdhVzcPHe9/i2ligrpT5QNCYD4YJLCyTPbuMeX8zREZ0Lh9CaOVAx
         PosQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+7DNNXjC2XMeM9TcsR7LFL6267HC6MQCDix4KPoyna97lsO3qygEAEDCNV7yxQZKEykgSwBmqkfLznaK+sgp4g8wCEObpyXYh
X-Gm-Message-State: AOJu0YxassUC1r70Sjd4C387jsOw+GKbgL1chZkoloDc9x7i7Mhcavix
	mDMINwFveu6TkKODKU9X9UPhxX1H5esfJh0yurpL/9eEYfIWI1pAV6TaGIdP0aAnduizk2XTpSq
	cPPYlqxX0jVFn7I5MU+4GZf3iUcwWhoy5exDZySYPWJYbLa0hYw==
X-Google-Smtp-Source: AGHT+IFQ1k/efBlxIyxFB1csG13ig4X/Xag1QwXMyDgIYBVAydIEN4a9Cvp5XFm54Ap13GSLIFikgOr4c5wgUFxmhYc=
X-Received: by 2002:a05:6512:505:b0:52b:2b11:a574 with SMTP id
 2adb3069b0e04-52b7e10cc61mr331899e87.15.1717064196733; Thu, 30 May 2024
 03:16:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-3-wenst@chromium.org>
 <5a5842d7-adad-410b-bac2-9e5cb03ae18c@collabora.com>
In-Reply-To: <5a5842d7-adad-410b-bac2-9e5cb03ae18c@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 May 2024 18:16:24 +0800
Message-ID: <CAGXv+5E5zFWVi+QmZj+mMb5jRfv138kz1FQyXiuzpe5Zz2KbZQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: mediatek: Add mt8173-mfgtop driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 5:59=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/05/24 10:35, Chen-Yu Tsai ha scritto:
> > The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> > in the datasheet, that contains clock gates, some power sequence signal
> > delays, and other unknown registers that get toggled when the GPU is
> > powered on.
> >
> > The clock gates are exposed as clocks provided by a clock controller,
> > while the power sequencing bits are exposed as one singular power domai=
n.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   drivers/clk/mediatek/Kconfig             |   9 +
> >   drivers/clk/mediatek/Makefile            |   1 +
> >   drivers/clk/mediatek/clk-mt8173-mfgtop.c | 240 ++++++++++++++++++++++=
+
> >   3 files changed, 250 insertions(+)
> >   create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
> >
> > diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfi=
g
> > index 70a005e7e1b1..9e279c739f1c 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -500,6 +500,15 @@ config COMMON_CLK_MT8173_IMGSYS
> >       help
> >         This driver supports MediaTek MT8173 imgsys clocks.
> >
> > +config COMMON_CLK_MT8173_MFGTOP
> > +     tristate "Clock and power driver for MediaTek MT8173 mfgtop"
> > +     depends on COMMON_CLK_MT8173
> > +     default COMMON_CLK_MT8173
> > +     select PM_GENERIC_DOMAINS
> > +     select PM_GENERIC_DOMAINS_OF
> > +     help
> > +       This driver supports MediaTek MT8173 mfgtop clocks and power do=
main.
> > +
> >   config COMMON_CLK_MT8173_MMSYS
> >          tristate "Clock driver for MediaTek MT8173 mmsys"
> >          depends on COMMON_CLK_MT8173
> > diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makef=
ile
> > index eeccfa039896..fdd3a76e12a1 100644
> > --- a/drivers/clk/mediatek/Makefile
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -77,6 +77,7 @@ obj-$(CONFIG_COMMON_CLK_MT8167_VDECSYS) +=3D clk-mt81=
67-vdec.o
> >   obj-$(CONFIG_COMMON_CLK_MT8173) +=3D clk-mt8173-apmixedsys.o clk-mt81=
73-infracfg.o \
> >                                  clk-mt8173-pericfg.o clk-mt8173-topckg=
en.o
> >   obj-$(CONFIG_COMMON_CLK_MT8173_IMGSYS) +=3D clk-mt8173-img.o
> > +obj-$(CONFIG_COMMON_CLK_MT8173_MFGTOP) +=3D clk-mt8173-mfgtop.o
> >   obj-$(CONFIG_COMMON_CLK_MT8173_MMSYS) +=3D clk-mt8173-mm.o
> >   obj-$(CONFIG_COMMON_CLK_MT8173_VDECSYS) +=3D clk-mt8173-vdecsys.o
> >   obj-$(CONFIG_COMMON_CLK_MT8173_VENCSYS) +=3D clk-mt8173-vencsys.o
> > diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/med=
iatek/clk-mt8173-mfgtop.c
> > new file mode 100644
> > index 000000000000..85fa7a7453ed
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
> > @@ -0,0 +1,240 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2024 Google LLC
> > + * Author: Chen-Yu Tsai <wenst@chromium.org>
> > + *
> > + * Based on driver in downstream ChromeOS v5.15 kernel.
> > + *
> > + * Copyright (c) 2014 MediaTek Inc.
> > + * Author: Chiawen Lee <chiawen.lee@mediatek.com>
> > + */
> > +
> > +#include <dt-bindings/clock/mt8173-clk.h>
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "clk-gate.h"
> > +#include "clk-mtk.h"
> > +
> > +static const struct mtk_gate_regs mfg_cg_regs =3D {
> > +     .sta_ofs =3D 0x0000,
> > +     .clr_ofs =3D 0x0008,
> > +     .set_ofs =3D 0x0004,
> > +};
> > +
> > +#define GATE_MFG(_id, _name, _parent, _shift, _flags)        \
> > +             GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift,=
 &mtk_clk_gate_ops_setclr, _flags)
>
> Extra tabulation: please fix

One tab instead of two? OK.

> > +
> > +/* TODO: The block actually has dividers for the core and mem clocks. =
*/
> > +static const struct mtk_gate mfg_clks[] =3D {
> > +     GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RAT=
E_PARENT),
> > +     GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RAT=
E_PARENT),
> > +     GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PAREN=
T),
> > +     GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
> > +};
> > +
> > +static const struct mtk_clk_desc mfg_desc =3D {
> > +     .clks =3D mfg_clks,
> > +     .num_clks =3D ARRAY_SIZE(mfg_clks),
> > +};
> > +
> > +struct mt8173_mfgtop_data {
> > +     struct clk_hw_onecell_data *clk_data;
> > +     struct regmap *regmap;
> > +     struct generic_pm_domain genpd;
> > +     struct of_phandle_args parent_pd, child_pd;
> > +     struct clk *clk_26m;
> > +};
> > +
> > +static const struct of_device_id of_match_clk_mt8173_mfgtop[] =3D {
> > +     { .compatible =3D "mediatek,mt8173-mfgtop", .data =3D &mfg_desc }=
,
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_mfgtop);
>
> Please move of_match_clk_mt8173_mfgtop before clk_mt8173_mfgtop_drv for c=
onsistency
> with all the other clock drivers.

Ack.

> > +
> > +/* Delay count in clock cycles */
> > +#define MFG_ACTIVE_POWER_CON0        0x24
> > + #define RST_B_DELAY_CNT     GENMASK(7, 0)   /* pwr_rst_b de-assert de=
lay during power-up */
> > + #define CLK_EN_DELAY_CNT    GENMASK(15, 8)  /* CLK_DIS deassert delay=
 during power-up */
> > + #define CLK_DIS_DELAY_CNT   GENMASK(23, 16) /* CLK_DIS assert delay d=
uring power-down */
>
> The reason why I had EVT_FORCE_ABORT and ACTIVE_PWRCTL_EN in my driver is=
 to
> document that we're keeping the event force abort disabled and, more impo=
rtantly,
> we are keeping the "active power control" feature disabled.
>
> Please, add those two - or at least the ACTIVE_PWRCTL_EN - to keep that d=
ocumented,
> or this information will be lost for sure.
> If in the future the ACTIVE_PWRCTL feature will become usable, it's going=
 to be
> just a 30 seconds change, as the info is already there.

OK.

> > +
> > +#define MFG_ACTIVE_POWER_CON1        0x28
> > + #define PWR_ON_S_DELAY_CNT  GENMASK(7, 0)   /* pwr_on_s assert delay =
during power-up */
> > + #define ISO_DELAY_CNT               GENMASK(15, 8)  /* ISO assert del=
ay during power-down */
> > + #define ISOOFF_DELAY_CNT    GENMASK(23, 16) /* ISO de-assert delay du=
ring power-up */
> > + #define RST__DELAY_CNT              GENMASK(31, 24) /* pwr_rsb_b asse=
rt delay during power-down */
> > +
> > +static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain=
)
> > +{
> > +     struct mt8173_mfgtop_data *data =3D container_of(domain, struct m=
t8173_mfgtop_data, genpd);
> > +
> > +     /* drives internal power management */
> > +     clk_prepare_enable(data->clk_26m);
> > +
> > +     /* Power on/off delays for various signals */
> > +     regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
> > +                  FIELD_PREP(RST_B_DELAY_CNT, 77) |
> > +                  FIELD_PREP(CLK_EN_DELAY_CNT, 61) |
> > +                  FIELD_PREP(CLK_DIS_DELAY_CNT, 60));
>
> I get that this is kinda odd to read, but still...
>
> FIELD_PREP(CLK_DIS_DELAY_CNT, 60) |
> FIELD_PREP(ACTIVE_PWRCTL_EN, 0));
>
> ...please :-)

Sure.

> > +     regmap_write(data->regmap, MFG_ACTIVE_POWER_CON1,
> > +                  FIELD_PREP(PWR_ON_S_DELAY_CNT, 11) |
> > +                  FIELD_PREP(ISO_DELAY_CNT, 68) |
> > +                  FIELD_PREP(ISOOFF_DELAY_CNT, 69) |
> > +                  FIELD_PREP(RST__DELAY_CNT, 77));
> > +
> > +     /* Magic numbers related to core switch sequence and delays */
> > +     regmap_write(data->regmap, 0xe0, 0x7a710184);
> > +     regmap_write(data->regmap, 0xe4, 0x835f6856);
> > +     regmap_write(data->regmap, 0xe8, 0x002b0234);
> > +     regmap_write(data->regmap, 0xec, 0x80000000);
> > +     regmap_write(data->regmap, 0xa0, 0x08000000);
>
> Is there any way to retrieve information about what those registers are?

I asked. They said the project was too long ago, and they could only
figure out that it had something to do with core switch sequencing and
delays between each core, which is what I put in the comment there.

> > +
> > +     return 0;
> > +}
> > +
> > +static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domai=
n)
> > +{
> > +     struct mt8173_mfgtop_data *data =3D container_of(domain, struct m=
t8173_mfgtop_data, genpd);
> > +
> > +     /* Magic numbers related to core switch sequence and delays */
> > +     regmap_write(data->regmap, 0xec, 0);
> > +
> > +     /* drives internal power management */
> > +     clk_disable_unprepare(data->clk_26m);
> > +
> > +     return 0;
> > +}
> > +
> > +static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct device_node *node =3D dev->of_node;
> > +     struct mt8173_mfgtop_data *data;
> > +     int ret;
> > +
> > +     data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, data);
> > +
> > +     data->clk_data =3D mtk_devm_alloc_clk_data(dev, ARRAY_SIZE(mfg_cl=
ks));
> > +     if (!data->clk_data)
> > +             return -ENOMEM;
> > +
> > +     /* MTK clock gates also uses regmap */
> > +     data->regmap =3D device_node_to_regmap(node);
> > +     if (IS_ERR(data->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(data->regmap), "Failed =
to get regmap\n");
> > +
> > +     data->child_pd.np =3D node;
> > +     data->child_pd.args_count =3D 0;
> > +     ret =3D of_parse_phandle_with_args(node, "power-domains", "#power=
-domain-cells", 0,
> > +                                      &data->parent_pd);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to parse power dom=
ain\n");
> > +
> > +     devm_pm_runtime_enable(dev);
> > +     /*
> > +      * Do a pm_runtime_resume_and_get() to workaround a possible
> > +      * deadlock between clk_register() and the genpd framework.
> > +      */
> > +     ret =3D pm_runtime_resume_and_get(dev);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to runtime resume device\=
n");
> > +             goto put_of_node;
> > +     }
> > +
> > +     ret =3D mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mf=
g_clks),
> > +                                  data->clk_data);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to register clock gates\n=
");
> > +             goto put_pm_runtime;
> > +     }
> > +
> > +     data->clk_26m =3D clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M]=
, "26m");
> > +     if (IS_ERR(data->clk_26m)) {
> > +             dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get=
 26 MHz clock\n");
> > +             goto unregister_clks;
> > +     }
> > +
> > +     ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data-=
>clk_data);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to add clk OF provider\n"=
);
> > +             goto put_26m_clk;
> > +     }
> > +
> > +     data->genpd.name =3D "mfg_apm";
>
> "mfg-apm" or "mfg-pwr" please!

Ack.

> Everything else looks good.
>
> Thanks for taking care of that, I started this work way too much time ago=
 and
> realistically I wouldn't have been able to finish it due to time constrai=
nts.
>
> It's great to see that *finally* we can get some GPU upstream on this old=
 SoC.
> As its CPUs are really slow, LLVMPipe is quite unusable from a UX perspec=
tive
> hence its only big issue was the lack of 3D HW acceleration.

I think there's still more work on the GPU driver side. I was digging
through the mailing list to find ways to get it running, and evidently
it doesn't fully support zink yet.

> This makes machines embedding this SoC usable, and that's simply awesome.

I'll give the patches a week to simmer while I go work on some
other stuff.

ChenYu

