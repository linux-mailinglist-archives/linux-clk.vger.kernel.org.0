Return-Path: <linux-clk+bounces-9995-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F2793C7E1
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jul 2024 19:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D39511F2114B
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jul 2024 17:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2A119DF48;
	Thu, 25 Jul 2024 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="I9ddwloA"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE85F26286;
	Thu, 25 Jul 2024 17:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721930277; cv=none; b=YFLKZORBBhmAG3lmno6nznhN5dgPf0gK03O5FwqB34KLZxhPNwh0gPGHP6MKV5dd+vr8VCxcLzWzMGY4gKfltCD+xv57s8gZgwe6wxGG17whZ4+jduO8M0aWjRz2xqukXdXU03lZZQKcjEGc9DLfvljhcs7MHmV6OeCCHe0fq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721930277; c=relaxed/simple;
	bh=ng9R+gVlc71t0ByS3AWROoo+RcEiNNDNOxfsSsO8uGk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pL4kAksnFmrMc3rwNS0hjwcfmxFWqqUsqQKmrIRM6+Nioi60oTM9LSl5LKawoZ+RjZlssnZ5ediPeQGgtsc81H/6UnReLbIEa0+tIJc9VVPXYdTXH7CJ5qxk0br6afq318aY3UBLkJkqZNaUMzbk++5CfDxbFvXwvOKkcbth/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=I9ddwloA; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1721930273; x=1722189473;
	bh=jVkhxV5sxcbE6YMc/9Xgtn3MyKGfTufmHHoyM9gyozE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I9ddwloAnY6YD1xcRPbqy3FWrW/6TwkgWDOVoTTXvTy4ihZVNK2+YtSF5Y5DpkyZT
	 oEr+bMd5K7hVtCnaE8d27cz+90/W8G2GG3p7yjM6ZCsLRqnCwEg5R36d4DZLMFIdXU
	 hPZOvTgL3U1ZtfisZXce4ZJBEOKnxp6c6+673knP/RsfrD+4MnOVgUampciUucM2ma
	 5LmpbLYJ+TMKs52u5LfDiymEfsidMNt6iP0T9tzNdrW6w8RjozjtHOzKv2WkJ/Xupr
	 A11xXLAV0BGARlopmEOe/73xr7Ah3bY5yXsILCiygNNadlpiuRwbU/Y7piogSbVxEN
	 mRfzCalTRAOnQ==
Date: Thu, 25 Jul 2024 17:57:49 +0000
To: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] clk: clocking-wizard: use newer clk_hw API
Message-ID: <D2YTC3LYGPDZ.1W97KEMUQ2RU3@protonmail.com>
In-Reply-To: <d02cd87b7a52067d6eb9b4ef3c5b7803.sboyd@kernel.org>
References: <20240720120048.36758-1-hpausten@protonmail.com> <20240720120048.36758-3-hpausten@protonmail.com> <d02cd87b7a52067d6eb9b4ef3c5b7803.sboyd@kernel.org>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: cf7a43a9a39d796f6aee3a69f85d6519c7eeee37
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Jul 24, 2024 at 12:14 AM BST, Stephen Boyd wrote:
> General comment: do one thing in one patch, i.e. use clk_hw API and
> don't also migrate to devm in one patch.

Fair point. Will split into two patches in v2.

>
> Quoting Harry Austen (2024-07-20 05:01:36)
> > diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/x=
ilinx/clk-xlnx-clock-wizard.c
> > index 0ca045849ea3e..30c5cc9dcd7e9 100644
> > --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> > +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/of.h>
> >  #include <linux/math64.h>
> >  #include <linux/module.h>
> > +#include <linux/overflow.h>
>
> What is this include for? __counted_by()?

For struct_size()

>
> >  #include <linux/err.h>
> >  #include <linux/iopoll.h>
> >
> > @@ -121,24 +122,22 @@ enum clk_wzrd_int_clks {
> >  /**
> >   * struct clk_wzrd - Clock wizard private data structure
> >   *
> > - * @clk_data:          Clock data
> > + * @clk_data:          Output clock data
> >   * @nb:                        Notifier block
> >   * @base:              Memory base
> >   * @clk_in1:           Handle to input clock 'clk_in1'
> >   * @axi_clk:           Handle to input clock 's_axi_aclk'
> >   * @clks_internal:     Internal clocks
> > - * @clkout:            Output clocks
> >   * @speed_grade:       Speed grade of the device
> >   * @suspended:         Flag indicating power state of the device
> >   */
> >  struct clk_wzrd {
> > -       struct clk_onecell_data clk_data;
> > +       struct clk_hw_onecell_data *clk_data;
>
> It could be placed at the end and then one allocation could be used
> instead of two.

Ah good point. Will move in v2.

>
> >         struct notifier_block nb;
> >         void __iomem *base;
> >         struct clk *clk_in1;
> >         struct clk *axi_clk;
> > -       struct clk *clks_internal[wzrd_clk_int_max];
> > -       struct clk *clkout[WZRD_NUM_OUTPUTS];
> > +       struct clk_hw *clks_internal[wzrd_clk_int_max];
> >         unsigned int speed_grade;
> >         bool suspended;
> >  };
> > @@ -1108,35 +1110,32 @@ static int clk_wzrd_probe(struct platform_devic=
e *pdev)
> >                 if (!div)
> >                         div =3D 1;
> >
> > -               clk_mul_name =3D __clk_get_name(clk_wzrd->clks_internal=
[wzrd_clk_mul]);
> > +               clk_mul_name =3D clk_hw_get_name(clk_wzrd->clks_interna=
l[wzrd_clk_mul]);
> >                 clk_wzrd->clks_internal[wzrd_clk_mul_div] =3D
> > -                       clk_register_fixed_factor(&pdev->dev, clk_name,
> > -                                                 clk_mul_name, 0, 1, d=
iv);
> > +                       clk_hw_register_fixed_factor(&pdev->dev, clk_na=
me,
> > +                                                    clk_mul_name, 0, 1=
, div);
> >         } else {
> >                 ctrl_reg =3D clk_wzrd->base + WZRD_CLK_CFG_REG(is_versa=
l, 0);
> > -               clk_wzrd->clks_internal[wzrd_clk_mul_div] =3D clk_regis=
ter_divider
> > +               clk_wzrd->clks_internal[wzrd_clk_mul_div] =3D clk_hw_re=
gister_divider
>
> Are these going to be using devm so that on failure they get
> unregistered?

I appear to have missed that entirely. Yes, that was the intention. Will fi=
x in v2.

>
> >                         (&pdev->dev, clk_name,
> > -                        __clk_get_name(clk_wzrd->clks_internal[wzrd_cl=
k_mul]),
> > +                        clk_hw_get_name(clk_wzrd->clks_internal[wzrd_c=
lk_mul]),
> >                         flags, ctrl_reg, 0, 8, CLK_DIVIDER_ONE_BASED |
> >                         CLK_DIVIDER_ALLOW_ZERO, &clkwzrd_lock);
> >         }
> >         if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
> >                 dev_err(&pdev->dev, "unable to register divider clock\n=
");
> > -               ret =3D PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_di=
v]);
> > -               goto err_rm_int_clk;
> > +               return PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div=
]);
> >         }



