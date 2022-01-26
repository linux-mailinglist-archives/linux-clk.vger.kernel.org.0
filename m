Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE00249C38B
	for <lists+linux-clk@lfdr.de>; Wed, 26 Jan 2022 07:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235383AbiAZGSU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Jan 2022 01:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbiAZGSU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jan 2022 01:18:20 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E7AC06161C
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 22:18:19 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id p27so61128573lfa.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 22:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RpEABcwS975oei+Y9ttqKcy253wTKHzRhAN8k1S7oQs=;
        b=bV5dffUWZ6A29E8num3B1mZUkB6ga1sbxeYQIRibfvYYit7Be7VLIoA7zv9WwUyO+a
         ACKAoQ96NZRr8BC5766Jn6+iHAHsK58XJN1XbezWj0C/Ft2nJLBCvZswINNp8U74vsk+
         YHVG8kZrJodRtDYsAUYvIjvG2oGuPJrC29lPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RpEABcwS975oei+Y9ttqKcy253wTKHzRhAN8k1S7oQs=;
        b=Dx6OU4eY0UMZWmP6edVmANEhS86+X1W4JvK8BT1jTJ2/k9+e9srxyX9hyraVtZh0Ze
         7jgSSWy9pYi3Jw2nCNSvMdDD7wmednt8ikO3d7RLUK9n1oQRof/mkhNReH58HzGBgHFc
         qPCa5yn+HTccOvUVRrDwLCdhJwxqX1Czvj/LpKwe//iNYyz/U7FrFjhB83Qm6PGOTRLv
         QjC+sdE+Q6Q6XrPJLvRs8B16QizR2HPNLb+g9rC8752boxWCh8YY74qrGla0zN7cJBHR
         DWkLxrKgDjfhHff1BCxhDvI/Pj18y9lMRlaXP6WSWOLuAnKzgDXgIOJk2I85eQmMVM3I
         mHBw==
X-Gm-Message-State: AOAM531sQklwfylsNRVysrUYmW2iDPuRM/78JQURFnovzEpouofG7jTN
        G833/d9lbGnJ/T3Yiwc5bXUuGrWWZPr7aosVlPK31Q==
X-Google-Smtp-Source: ABdhPJyqqlRpnlyel7jHSw11onS+UWB9JQwLpjdyosUsCKsRpEB8SXNv6Asj8uheBfdmuamJ4ijimL3uq2WC/H8caRg=
X-Received: by 2002:ac2:5442:: with SMTP id d2mr12853999lfn.482.1643177897972;
 Tue, 25 Jan 2022 22:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20220122091731.283592-10-wenst@chromium.org> <20220126060449.24874-1-miles.chen@mediatek.com>
In-Reply-To: <20220126060449.24874-1-miles.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 26 Jan 2022 14:18:06 +0800
Message-ID: <CAGXv+5GKmOrT=yOkadsKVz38vvAj1-1sBN8i86zMLv3yusZeQw@mail.gmail.com>
Subject: Re: [PATCH 13/31] clk: mediatek: pll: Implement unregister API
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     chun-jie.chen@mediatek.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 26, 2022 at 2:04 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> > +static void mtk_clk_unregister_pll(struct clk *clk)
> > +{
> > +     struct clk_hw *hw = __clk_get_hw(clk);
> > +     struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> > +
> > +     clk_unregister(clk);
> > +     kfree(pll);
> > +}
> > +
>
> mtk_clk_unregister_pll() looks different.
> Do we need to check hw before passing it to to_mtk_clk_pll(hw), like
> mtk_clk_unregister_mux()?

Good catch.

In theory we should, since __get_clk_hw() would return NULL if clk is NULL.
However the code already does that check before it calls
mtk_clk_unregister_pll(), so the code is safe. We should make everything
consistent though.

I might have written the code on separate days and thus introduced some
discrepancies. I'll fix it in v2.


ChenYu

> >  void mtk_clk_register_plls(struct device_node *node,
> >               const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
> >  {
> > @@ -388,4 +397,44 @@ void mtk_clk_register_plls(struct device_node *node,
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
> >
> > +static __iomem void *mtk_clk_pll_get_base(struct clk *clk,
> > +                                       const struct mtk_pll_data *data)
> > +{
> > +     struct clk_hw *hw = __clk_get_hw(clk);
> > +     struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> > +
> > +     return pll->base_addr - data->reg;
> > +}
> > +
> > +void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
> > +                          struct clk_onecell_data *clk_data)
> > +{
> > +     __iomem void *base = NULL;
> > +     int i;
> > +
> > +     if (!clk_data)
> > +             return;
> > +
> > +     for (i = num_plls; i > 0; i--) {
> > +             const struct mtk_pll_data *pll = &plls[i - 1];
> > +
> > +             if (IS_ERR_OR_NULL(clk_data->clks[pll->id]))
> > +                     continue;
> > +
> > +             /*
> > +              * This is quite ugly but unfortunately the clks don't have
> > +              * any device tied to them, so there's no place to store the
> > +              * pointer to the I/O region base address. We have to fetch
> > +              * it from one of the registered clks.
> > +              */
> > +             base = mtk_clk_pll_get_base(clk_data->clks[pll->id], pll);
> > +
> > +             mtk_clk_unregister_pll(clk_data->clks[pll->id]);
> > +             clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
> > +     }
> > +
> > +     iounmap(base);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_clk_unregister_plls);
> > +
> >  MODULE_LICENSE("GPL");
> > diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
> > index d01b0c38311d..a889b1e472e7 100644
> > --- a/drivers/clk/mediatek/clk-pll.h
> > +++ b/drivers/clk/mediatek/clk-pll.h
> > @@ -51,5 +51,7 @@ struct mtk_pll_data {
> >  void mtk_clk_register_plls(struct device_node *node,
> >                          const struct mtk_pll_data *plls, int num_plls,
> >                          struct clk_onecell_data *clk_data);
> > +void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
> > +                          struct clk_onecell_data *clk_data);
> >
> >  #endif /* __DRV_CLK_MTK_PLL_H */
> > --
> > 2.35.0.rc0.227.g00780c9af4-goog
>
>
