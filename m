Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42DD68D09C
	for <lists+linux-clk@lfdr.de>; Tue,  7 Feb 2023 08:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjBGHa4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 7 Feb 2023 02:30:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjBGHaz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 02:30:55 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD1D32E7F
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 23:30:54 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id d66so15284754vsd.9
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 23:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gCNAF49cUJ7MluixE59CxJOTxjhSyJFzlB7p666SLz0=;
        b=SpsTbPrXlrn0BMOnnB5WAx1mT3fGSu2PJ8hSRfX5+MeynLpKHjBMp2WYTFYXzfUlyU
         t84xSFlVt36uQYH+euKczCPs/6PfnGOfgLpX97MxI5jtyqfO/xLoDBUeaSWL7GPQQYot
         lK9C6fL7vDus9ucgKna/MVkAR98Rvu/GkBtyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCNAF49cUJ7MluixE59CxJOTxjhSyJFzlB7p666SLz0=;
        b=SdvJ560ztBqt95sWjqLfg/qUlrZyfAtIFy5vhV/Ce7qDjUiK71JLMJiKPInOlf6TL1
         yf+k5S7BCuMfLZjECWWjTLUu65lTpbDToXefuLwscHhqhs7fA68X7r4nd62NESZoWoPl
         Qkwp1jGX36orQq//QHRguytSgCrpsX5O8t4k1gvXGyclFj0kL13upIzJyziMaq4aw7jI
         7PDOaGR984kkYofjyu61H39eDlVssVLjkO7RluoF/csjFaq25TuDfmJsW9HHsbGXhkGI
         rzuvh+NwUCrExYVH8rSwRY+bASOHfR0Uja6Oo/vGkYYlGQynK7wGnFKGsCZuEl9wvBzi
         6Vgw==
X-Gm-Message-State: AO0yUKXSRPO1lq/R4npo6trr41aQE9u1XwsTgI70hagtJB5iF376m64C
        t1hGDeA+vl0VM//jzDwHsZ3FFudZpKEc+Ox7WHr6XA==
X-Google-Smtp-Source: AK7set91DMXJxIvga9meSVc/G34kt/Sh+4idj85b3F2q+xpEyp8Wc9TZUP2+DE7MZ2Dt5/Fy22cI/k24gJN79sKGzIw=
X-Received: by 2002:a05:6102:2445:b0:411:a162:c432 with SMTP id
 g5-20020a056102244500b00411a162c432mr278129vss.26.1675755053286; Mon, 06 Feb
 2023 23:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-14-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-14-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 15:30:42 +0800
Message-ID: <CAGXv+5E8FoVN7HoOpawMhhsKab7qs2F5NcRrpTf5TQiti7XUVA@mail.gmail.com>
Subject: Re: [PATCH v1 13/45] clk: mediatek: mt8167: Compress GATE_TOPx macros
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use the GATE_MTK macro to compress the GATE_TOP{0..5} macros.
> No functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8167.c | 88 +++++++++----------------------
>  1 file changed, 24 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
> index 91669ebafaf9..97a443fdfc77 100644
> --- a/drivers/clk/mediatek/clk-mt8167.c
> +++ b/drivers/clk/mediatek/clk-mt8167.c
> @@ -736,77 +736,37 @@ static const struct mtk_gate_regs top5_cg_regs = {
>         .sta_ofs = 0x44,
>  };
>
> -#define GATE_TOP0(_id, _name, _parent, _shift) {       \
> -               .id = _id,                              \
> -               .name = _name,                          \
> -               .parent_name = _parent,                 \
> -               .regs = &top0_cg_regs,                  \
> -               .shift = _shift,                        \
> -               .ops = &mtk_clk_gate_ops_setclr,        \
> -       }
> +#define GATE_TOP0(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &top0_cg_regs,            \
> +                _shift, &mtk_clk_gate_ops_setclr)

Nit: 100 characters should be enough to fit the whole GATE_MTK part in one
line.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
