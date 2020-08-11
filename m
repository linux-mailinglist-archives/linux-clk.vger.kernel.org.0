Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB73241726
	for <lists+linux-clk@lfdr.de>; Tue, 11 Aug 2020 09:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgHKH2l (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 11 Aug 2020 03:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgHKH2l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Aug 2020 03:28:41 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F28C06174A
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2020 00:28:41 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i26so8307545edv.4
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2020 00:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VNS8rgxQTsSqkuQvisEfuQkArMcjZwTTMFnULFhcBtc=;
        b=I4zF9BZfsZmsK7v24MOsVh7XvfpQcnthAJ+k+iaowWwFaGJKa8I19900B1KW4J28/g
         QR7nxd0IiU11LQkTVy/3+d7XPpi7vGdQov5nIi0/DWk2Kvl23qwuigMTXNJztOHnjsoM
         /thmEzj30fA5G4XJFAH1TYiYY+DDEeFHE12gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VNS8rgxQTsSqkuQvisEfuQkArMcjZwTTMFnULFhcBtc=;
        b=UyAE92W54T9M2pdH92jbrNhahoB+DUD499p4KLpkYDL7GHl+Cnt9Va7uFe0AtH3bfg
         5yxBR6uzxnMx95yRCMNKomfyp9eYG4DyFX2UcYTjjlOEtvUk8Jx430ldNUmJxHkCFqNQ
         1UYL7arArplRArewGtMglVWqi13JNZH7+v7PtPU9zMQnOmYpnfKYa5KZga8QS18JoqD6
         zKzc/z6dHCySw08mLCfVi2aWT+Nlb6WxB5UXP3wIRqQ+DTo2IDstgq0f4as+zhpCLrNb
         qw9+4lMoYP8mdN4oJSC5mbWc5Nlv4cyoYVyWYd1a24jqbtQfMv7ZDLy2FUEroPhjBCgQ
         HBmg==
X-Gm-Message-State: AOAM532bEZvlcewl+IQsSmz2o1TUd9SnQNZzKKgMnrIpPrRNwnrNfW4K
        FuOgAq7iktfqiR3/kAPZRIq1ltuM0pWTrlHmW/d8Lw==
X-Google-Smtp-Source: ABdhPJyDCtyNs+EX7nXIu9V8/MaQkjXI0d/Rvgm77fNHd3xXnjpWHunejPSvEPJyZoDtl5sSAwCP/jkQNo8TgvajC7g=
X-Received: by 2002:a50:e004:: with SMTP id e4mr13096018edl.114.1597130919795;
 Tue, 11 Aug 2020 00:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-5-git-send-email-weiyi.lu@mediatek.com> <CANMq1KCG1xUan5-=DBZewvTqmUH=p7=nxy0Va=pdYBhAfYhhjQ@mail.gmail.com>
 <1597128205.20627.14.camel@mtksdaap41>
In-Reply-To: <1597128205.20627.14.camel@mtksdaap41>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 11 Aug 2020 15:28:29 +0800
Message-ID: <CANMq1KDRwwFvR2v6ykpvV6Y72L+Ym+4NcZF0F7wYq2znKy4sqw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: mediatek: Add configurable enable control to mtk_pll_data
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Rob Herring <robh@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        James Liao <jamesjj.liao@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wendell Lin <wendell.lin@mediatek.com>,
        linux-clk@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Aug 11, 2020 at 2:43 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> [...]
> > > +       writel(r, pll->en_addr);
> > >
> > >         r = readl(pll->pwr_addr) | CON0_ISO_EN;
> > >         writel(r, pll->pwr_addr);
> > > @@ -327,6 +327,10 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
> > >                 pll->tuner_addr = base + data->tuner_reg;
> > >         if (data->tuner_en_reg)
> > >                 pll->tuner_en_addr = base + data->tuner_en_reg;
> > > +       if (data->en_reg)
> > > +               pll->en_addr = base + data->en_reg;
> > > +       else
> > > +               pll->en_addr = pll->base_addr + REG_CON0;
> >
> > Don't you need to set pll->data->pll_en_bit to CON0_BASE_EN here?
> > (which probably means that you need to add a pll->en_bit field to
> > struct mtk_clk_pll)
> >
>
> Because all mtk_clk_pll data are static variables, en_bit would be 0 if
> NO value assigned.

Wow, you're right, but this is a little bit subtle. I wonder if it's
worth adding a small comment? (either here or in struct mtk_pll_data)
