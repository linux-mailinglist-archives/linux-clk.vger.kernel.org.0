Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152CA231D22
	for <lists+linux-clk@lfdr.de>; Wed, 29 Jul 2020 13:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbgG2LDF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Jul 2020 07:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgG2LDD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jul 2020 07:03:03 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C134EC061794
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2020 04:03:03 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id j23so5595159vsq.7
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2020 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gwrmcmEFgHmE2elsCA3SQReEP7dtrnHUEc+lw41Ownc=;
        b=FwWqEJiqgTcRl9RLLuyH4qkEABEtXo3DtQFBEuq7WHwYZxqB3mG0CHZD3uUpi/uuMM
         pzPmDybDQpuYWZeaXue++7H72rsGLcrlC7pn9ApVJ/UKSCrB0GtfysxLOueCwUEyhQxa
         rbkTJ1SJlJJWU7SHFGVtQ/GXcEwJDweIJAP5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gwrmcmEFgHmE2elsCA3SQReEP7dtrnHUEc+lw41Ownc=;
        b=FSJzmmGqL3CgfrKQmILhJ2Jju3sFxjoD2hDuFbfJrmE1lXOs5jkHAkGuYmuTPhi6C2
         LsnhUi+uoX00xxZXsg/ErZ2iLo627wWscLuZlyNrXObMQZhUWlkmasP9KGiiXXEuHtMn
         JhHjwK5emea4F6fmd1v3IaUXUm8qRf1RQOcGjSujPBIz0SEg9UcD4/NZVd3ldxx4pTqB
         rj3lf+8gMkDpJfbOVSBs78Chec3Y4NhhY4FInlz3IPlhkn7T5F2N1isYFSO/QEyAfWRA
         KM7wS1dyO/E//PC+GLSS9aubwRdeRwzCsUhmK0nTdbP+gE+r+sCfXicC4D9eZP2D7Pas
         fqvg==
X-Gm-Message-State: AOAM530ye9M9sA2gi3UNIZSza58p+PUN7+4MLxn8WdqZYjTJ3A904EhS
        N5eV13yuPBhj9ldU08Xax/P9O2ATxtFTt9Xp/z4I2g==
X-Google-Smtp-Source: ABdhPJxf6gmq/1Vn4jyFC8rLBzVhmaXoarShTaaxIz+4CLlWEE/Ex5LiltCrFY4PE3r0Xot21uyjY+pVSlZu2o6pC5E=
X-Received: by 2002:a67:bb06:: with SMTP id m6mr379702vsn.54.1596020582972;
 Wed, 29 Jul 2020 04:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-4-git-send-email-weiyi.lu@mediatek.com> <CANMq1KBJ3QgpZ4EuSOWYTpOatsOte5sGkqtSZQs337x3fMFFYw@mail.gmail.com>
In-Reply-To: <CANMq1KBJ3QgpZ4EuSOWYTpOatsOte5sGkqtSZQs337x3fMFFYw@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 29 Jul 2020 19:02:52 +0800
Message-ID: <CANMq1KAYg2+RQiF0w7-2FKZj1QwoPDsXtmak-DHfserRjX-TWA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        James Liao <jamesjj.liao@mediatek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Wendell Lin <wendell.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 29, 2020 at 6:51 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Wed, Jul 29, 2020 at 4:44 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > The en_mask actually is a combination of divider enable mask
> > and pll enable bit(bit0).
> > Before this patch, we enabled both divider mask and bit0 in prepare(),
> > but only cleared the bit0 in unprepare().
> > Now, setting the enable register(CON0) in 2 steps: first divider mask,
> > then bit0 during prepare(), vice versa.
> > Hence, en_mask will only be used as divider enable mask.
> > Meanwhile, all the SoC PLL data are updated.
>
> I like this a lot better, most changes look fine, just a few nits.
>
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/clk/mediatek/clk-mt2701.c | 26 ++++++++++++------------
> >  drivers/clk/mediatek/clk-mt2712.c | 30 ++++++++++++++--------------
> >  drivers/clk/mediatek/clk-mt6765.c | 20 +++++++++----------
> >  drivers/clk/mediatek/clk-mt6779.c | 24 +++++++++++-----------
> >  drivers/clk/mediatek/clk-mt6797.c | 20 +++++++++----------
> >  drivers/clk/mediatek/clk-mt7622.c | 18 ++++++++---------
> >  drivers/clk/mediatek/clk-mt7629.c | 12 +++++------
> >  drivers/clk/mediatek/clk-mt8173.c | 42 ++++++++++++++++++++++++++-------------
> >  drivers/clk/mediatek/clk-mt8183.c | 22 ++++++++++----------
> >  drivers/clk/mediatek/clk-pll.c    | 10 ++++++++--
> >  10 files changed, 122 insertions(+), 102 deletions(-)
> >
[snip]
> > diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> > index f440f2cd..3c79e1a 100644
> > --- a/drivers/clk/mediatek/clk-pll.c
> > +++ b/drivers/clk/mediatek/clk-pll.c
> > @@ -247,8 +247,10 @@ static int mtk_pll_prepare(struct clk_hw *hw)
> >         writel(r, pll->pwr_addr);
> >         udelay(1);
> >
> > -       r = readl(pll->base_addr + REG_CON0);
> > -       r |= pll->data->en_mask;
> > +       r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
> > +       writel(r, pll->base_addr + REG_CON0);
> > +
> > +       r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;

One more question. I have the feeling that CON0_BASE_EN is what
enables the clock for good (and pll->data->en_mask is just an
additional setting/mask, since you could disable the clock by simply
clearing CON0_BASE_EN). Shouldn't you set pll->data->en_mask _first_,
then CON0_BASE_EN?

> >         writel(r, pll->base_addr + REG_CON0);
>
> As a small optimization, you can do:
>
> if (pll->data->en_mask) {
>    r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;
>    writel(r, pll->base_addr + REG_CON0);
> }
>
> >
> >         __mtk_pll_tuner_enable(pll);
> > @@ -278,6 +280,10 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
> >         __mtk_pll_tuner_disable(pll);
> >
> >         r = readl(pll->base_addr + REG_CON0);
> > +       r &= ~pll->data->en_mask;
>
> Move this to one line? (so that the code looks symmetrical, too?)
>
> > +       writel(r, pll->base_addr + REG_CON0);
> > +
> > +       r = readl(pll->base_addr + REG_CON0);
> >         r &= ~CON0_BASE_EN;

And ditto, ~CON0_BASE_EN then ~pll->data->en_mask?

>
> ditto?
>
> >         writel(r, pll->base_addr + REG_CON0);
> >
> > --
> > 1.8.1.1.dirty
