Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550EC6AD673
	for <lists+linux-clk@lfdr.de>; Tue,  7 Mar 2023 05:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjCGEoL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Mar 2023 23:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbjCGEoH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 23:44:07 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293833B665
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 20:43:28 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id s1so11286648vsk.5
        for <linux-clk@vger.kernel.org>; Mon, 06 Mar 2023 20:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678164205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhJjKxrUhurA/m4r0Y8ciLGDFRFz3Zu/L7FJeZQi0n0=;
        b=jOKDEzTFJKDobwqd/AaLDsioLxzunt0PU3HWIuUlngMXLEufc/ZCoVD6guXfhWzOE3
         LP/FGV+ei6S/XtPrBkbWJJ8vNgJyyTKabNa36UqfPYgp4WmojFFtOvg2oP9Ml7dgWHsm
         ls1XlNpd8H6AMm6H4FpPD5j7Evsrqn73rJ+2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678164205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KhJjKxrUhurA/m4r0Y8ciLGDFRFz3Zu/L7FJeZQi0n0=;
        b=n/zQy2DuGN1qqnM6P8Pr4J2JmRVf5s28FGetV5BGxmjYoHn3YYhFaU66EZRJN2h6AI
         nJba6t1PICAZaSeFx1Jc+1cP/0wLTiyui2S3mD/q14q1YZ1kjgpUbdLJNllc/JuHsV6b
         M7ERH/cCTZc7FTJQu/DXqVQxQAJrt8tDVazSrXQFC7W8mbSZas9ino3xbzwjuK+tmO6c
         wmhwqMNvCCgcq9QpPdn5DNOojGOkAbS34qVTXfyWOW5/44XMcvLzK/uPwtXQca/YXiVl
         //ehyQfc9TsklETXVNwIbuBcqtMCv8xcRDU7dXxZuIcJN9qzgBq5FuLizVNJYkOBNRxW
         Uf7w==
X-Gm-Message-State: AO0yUKWfRSMVqycfa7/bCI+QCXSfvzxdC4TjkfRIYydrd4KMYrir47eN
        DUxogw3Bpi3dTmFjJk7G8ZV5wgTWtXKbscThzZ8CvQ==
X-Google-Smtp-Source: AK7set/1DJCH0yxSVzq1QxxilcX1Ry7rj5FrT+uT+Ty9POkTz3gYzHgrQh11DgQu5fT4OEg/HkjyYznfw7u/BjjiNaA=
X-Received: by 2002:a67:e3cb:0:b0:421:e25b:3d0c with SMTP id
 k11-20020a67e3cb000000b00421e25b3d0cmr2865465vsm.3.1678164205669; Mon, 06 Mar
 2023 20:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206100105.861720-8-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Mar 2023 12:43:14 +0800
Message-ID: <CAGXv+5Ey02hzNQA2O2ussAt9sXxxy9mOjze2GH90Ko9HeoETXQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] clk: mediatek: mt8195: Add support for frequency
 hopping through FHCTL
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        edward-jw.yang@mediatek.com, johnson.wang@mediatek.com,
        miles.chen@mediatek.com, chun-jie.chen@mediatek.com,
        rex-bc.chen@mediatek.com, jose.exposito89@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 6, 2023 at 6:01=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add FHCTL parameters and register PLLs through FHCTL to add support
> for frequency hopping and SSC. FHCTL will be enabled only on PLLs
> specified in devicetree.
>
> This commit brings functional changes only upon addition of
> devicetree configuration.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 69 +++++++++++++++++++-
>  1 file changed, 66 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8195-apmixedsys.c
> index 1bc917f2667e..c0db31ce0741 100644
> --- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> @@ -3,9 +3,11 @@
>  // Copyright (c) 2021 MediaTek Inc.
>  // Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
>
> +#include "clk-fhctl.h"
>  #include "clk-gate.h"
>  #include "clk-mtk.h"
>  #include "clk-pll.h"
> +#include "clk-pllfh.h"
>
>  #include <dt-bindings/clock/mt8195-clk.h>
>  #include <linux/of_device.h>
> @@ -105,6 +107,61 @@ static const struct mtk_pll_data plls[] =3D {
>             0, 0, 22, 0x0158, 24, 0, 0, 0, 0x0158, 0, 0x0158, 0, 9),
>  };
>
> +enum fh_pll_id {
> +       FH_ARMPLL_LL,
> +       FH_ARMPLL_BL,
> +       FH_MEMPLL,
> +       FH_ADSPPLL,
> +       FH_NNAPLL,
> +       FH_CCIPLL,
> +       FH_MFGPLL,
> +       FH_TVDPLL2,
> +       FH_MPLL,
> +       FH_MMPLL,
> +       FH_MAINPLL,
> +       FH_MSDCPLL,
> +       FH_IMGPLL,
> +       FH_VDECPLL,
> +       FH_TVDPLL1,
> +       FH_NR_FH,
> +};
> +
> +#define FH(_pllid, _fhid, _offset) {                                   \
> +               .data =3D {                                              =
 \
> +                       .pll_id =3D _pllid,                              =
 \
> +                       .fh_id =3D _fhid,                                =
 \
> +                       .fh_ver =3D FHCTL_PLLFH_V2,                      =
 \
> +                       .fhx_offset =3D _offset,                         =
 \
> +                       .dds_mask =3D GENMASK(21, 0),                    =
 \

> +                       .slope0_value =3D 0x6003c97,                     =
 \
> +                       .slope1_value =3D 0x6003c97,                     =
 \

Are these

> +                       .sfstrx_en =3D BIT(2),                           =
 \
> +                       .frddsx_en =3D BIT(1),                           =
 \
> +                       .fhctlx_en =3D BIT(0),                           =
 \
> +                       .tgl_org =3D BIT(31),                            =
 \
> +                       .dvfs_tri =3D BIT(31),                           =
 \
> +                       .pcwchg =3D BIT(31),                             =
 \

> +                       .dt_val =3D 0x0,                                 =
 \
> +                       .df_val =3D 0x9,                                 =
 \

and these just copied from MT8186?

> +                       .updnlmt_shft =3D 16,                            =
 \
> +                       .msk_frddsx_dys =3D GENMASK(23, 20),             =
 \
> +                       .msk_frddsx_dts =3D GENMASK(19, 16),             =
 \
> +               },                                                      \
> +       }
> +
> +static struct mtk_pllfh_data pllfhs[] =3D {
> +       FH(CLK_APMIXED_ADSPPLL, FH_ADSPPLL, 0x78),
> +       FH(CLK_APMIXED_NNAPLL, FH_NNAPLL, 0x8c),
> +       FH(CLK_APMIXED_MFGPLL, FH_MFGPLL, 0xb4),
> +       FH(CLK_APMIXED_TVDPLL2, FH_TVDPLL2, 0xc8),
> +       FH(CLK_APMIXED_MMPLL, FH_MMPLL, 0xf0),
> +       FH(CLK_APMIXED_MAINPLL, FH_MAINPLL, 0x104),
> +       FH(CLK_APMIXED_MSDCPLL, FH_MSDCPLL, 0x118),
> +       FH(CLK_APMIXED_IMGPLL, FH_IMGPLL, 0x12c),
> +       FH(CLK_APMIXED_VDECPLL, FH_VDECPLL, 0x140),
> +       FH(CLK_APMIXED_TVDPLL2, FH_TVDPLL1, 0x154),
> +};
> +
>  static const struct of_device_id of_match_clk_mt8195_apmixed[] =3D {
>         { .compatible =3D "mediatek,mt8195-apmixedsys", },
>         {}
> @@ -114,13 +171,17 @@ static int clk_mt8195_apmixed_probe(struct platform=
_device *pdev)
>  {
>         struct clk_hw_onecell_data *clk_data;
>         struct device_node *node =3D pdev->dev.of_node;
> +       const u8 *fhctl_node =3D "mediatek,mt8195-fhctl";
>         int r;
>
>         clk_data =3D mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
>         if (!clk_data)
>                 return -ENOMEM;
>
> -       r =3D mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_dat=
a);
> +       fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
> +
> +       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +                                   pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
>         if (r)
>                 goto free_apmixed_data;
>
> @@ -140,7 +201,8 @@ static int clk_mt8195_apmixed_probe(struct platform_d=
evice *pdev)
>  unregister_gates:
>         mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), =
clk_data);
>  unregister_plls:
> -       mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
> +       mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
> +                                 ARRAY_SIZE(pllfhs), clk_data);

Nit: I think this could be squeezed into one line.

>  free_apmixed_data:
>         mtk_free_clk_data(clk_data);
>         return r;
> @@ -153,7 +215,8 @@ static int clk_mt8195_apmixed_remove(struct platform_=
device *pdev)
>
>         of_clk_del_provider(node);
>         mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), =
clk_data);
> -       mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
> +       mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
> +                                 ARRAY_SIZE(pllfhs), clk_data);

Same here.

ChenYu

>         mtk_free_clk_data(clk_data);
>
>         return 0;
> --
> 2.39.1
>
