Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A70A668D1E6
	for <lists+linux-clk@lfdr.de>; Tue,  7 Feb 2023 09:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbjBGI6R (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 7 Feb 2023 03:58:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjBGI6Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 03:58:16 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C7EC151
        for <linux-clk@vger.kernel.org>; Tue,  7 Feb 2023 00:58:15 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id k4so15516496vsc.4
        for <linux-clk@vger.kernel.org>; Tue, 07 Feb 2023 00:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bJGUTHNzVk0CrDLPjREXJzjqiBi2pjaUdCgiLmgCaNE=;
        b=YsQ1SJKp9ric8eetL2Txcs9f3CUPHJidqRiInmtOn+W9Sgc4ANb5a4fPTp8NepJeK2
         d0BVtGtvFURucArLag7vF2lXxRRWEoM7QgEVoqkRdxp48E1/ZmvL0r9EtyNWyktyUKlT
         TDiqxW9IlaHadd8ZnNM+qtf7gED6kJrCCdDyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJGUTHNzVk0CrDLPjREXJzjqiBi2pjaUdCgiLmgCaNE=;
        b=SPLhwyZL1rIKcJvS+p5UMOixQQv3V3AJEyHXhLJcHtIqyEi8YXSSEVdBokTW6TV3Zq
         Ac5IMFp2H/juRbbBLrpRkdSpG5gYirNMOo5w+iMNXtxP1jGjKSkjEXz9QLdHk7sUtO7A
         oy6TvCgucaPi69cp1VpBXbiXu6Rv/QpuaCP8J5y7ihziDfBayTIYK0JXt5HdAayJJqPo
         q3IdZIv3UVZnji2l/dGkeWAPQjtL8bd0exPdh9Z9ugL3BHWRwszCwbZyuGTrGynKCPk5
         IqfzaQF955fHAGcAk81lp5789gqIVv7GIPVwubEvgShAbBgkpk5n48fxBjVgJShidcDy
         VYZA==
X-Gm-Message-State: AO0yUKW66y1G1D23uBF+K/2Q1f4f8uVA0eCinGKbSJcriL3kmX25teBT
        2F8Voc2S6RxFnzHXu+4cskyzuXF9nIxQVhY/1drslA==
X-Google-Smtp-Source: AK7set8q/Np50pceKj/VI+JvmP79bjSmnUhKoBbzRgRnOhvnmB0W3alAQiNAxbYLsMfSSntXfkhvFzvLcr3TP50xUVc=
X-Received: by 2002:a05:6102:4b8:b0:3fe:ae88:d22 with SMTP id
 r24-20020a05610204b800b003feae880d22mr515509vsa.65.1675760294338; Tue, 07 Feb
 2023 00:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gg60-4B29V9cYUw7b1OVcZvU+w9qdiiBbt10LJsAJiCA@mail.gmail.com> <93d95309-84eb-16c6-b64e-b0c43d784900@collabora.com>
In-Reply-To: <93d95309-84eb-16c6-b64e-b0c43d784900@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 16:58:03 +0800
Message-ID: <CAGXv+5HYLOuqzgepTbaT+3bAeDp3Ofa_JWLPqQ7M6e0dQrof4A@mail.gmail.com>
Subject: Re: [PATCH v1 05/45] clk: mediatek: mt2712: Migrate topckgen/mcucfg
 to mtk_clk_simple_probe()
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 7, 2023 at 4:45 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/02/23 07:15, Chen-Yu Tsai ha scritto:
> > On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Now that the common mtk_clk_simple_{probe,remove}() functions can deal
> >> with divider clocks it is possible to migrate more clock drivers to it:
> >> in this case, it's about topckgen.
> >> While at it, also perform a fast migration for mcucfg.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> >> ---
> >>   drivers/clk/mediatek/clk-mt2712.c | 127 +++++-------------------------
> >>   1 file changed, 21 insertions(+), 106 deletions(-)
> >>
>
> ..snip..
>                       __func__, r);
> >> +static const struct mtk_clk_desc topck_desc = {
> >> +       .clks = top_clks,
> >> +       .num_clks = ARRAY_SIZE(top_clks),
> >> +       .fixed_clks = top_fixed_clks,
> >> +       .num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
> >> +       .factor_clks = top_divs,
> >> +       .num_factor_clks = ARRAY_SIZE(top_divs),
> >> +       .composite_clks = top_muxes,
> >> +       .num_composite_clks = ARRAY_SIZE(top_muxes),
> >> +       .divider_clks = top_adj_divs,
> >> +       .num_divider_clks = ARRAY_SIZE(top_adj_divs),
> >> +       .clk_lock = &mt2712_clk_lock,
> >
> > At some point maybe we should look into splitting up the locks to one
> > per block, or converting everything to regmap.
> >
>
> I was thinking the same about the locks... but about regmap, that would
> actually add up some overhead at every R/W operation and I would really
> like to measure that precisely before doing any kind of regmap conversion
> for the MediaTek clocks.
>
> Perhaps I'll even find a way to avoid any kind of (even if small) overhead
> while doing that sometime in the future, which wouldn't be benefitting only
> MediaTek, but also other users like Qualcomm (as they have practically all
> clocks on regmap!).

Stephen would likely appreciate a unified regmap clock library :D
