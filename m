Return-Path: <linux-clk+bounces-17729-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA1A2AC7B
	for <lists+linux-clk@lfdr.de>; Thu,  6 Feb 2025 16:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38EC83A69EF
	for <lists+linux-clk@lfdr.de>; Thu,  6 Feb 2025 15:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDD21EDA36;
	Thu,  6 Feb 2025 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QGCOJGVc"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A631EDA32
	for <linux-clk@vger.kernel.org>; Thu,  6 Feb 2025 15:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738855922; cv=none; b=Z90UCTb8ZCTilZTB40l3cz1heC8aZuvBomzv/AF3La91fkC525Po+NBrUXNevClNXX8EFU+PCLCUwIWk0vnEzuT/mMLml8NjKQAcwy/GK8zGwHqzwdEbewpDZiE/UeEuSDOaYFLWnqGBeN8PUnT07tooD2M8nGX6+YZBgC+9G60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738855922; c=relaxed/simple;
	bh=ncAPF7rrerkEjN9nNIYfemcUfjRmvB1hGOhegNOaz7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/Mq2KXbIw9/h20qtoYVgnJdg3Lo8UMVf+9oN1m+R37ng2lhyTQyT3HZv7jn9S5Wq/hb14T7aGkAxUH6HOSvCs/w3RffY9syiTxCZHCgiLHcQzLzvcXwwFlJ/w0mDqFPVII7zjRb1SfR3fikiSoVDJQFFKZBfelc8TMboZkP/y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QGCOJGVc; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f7440444efso8964287b3.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Feb 2025 07:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1738855919; x=1739460719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSEjI0/PhbFe1xLIAMNstyhshP1bNC0F9pZ0DzpzpJE=;
        b=QGCOJGVcYMe/I4OY9Knfe5T2pcI1NMLa1VCIAIGYbomILGV2kqHcTIAnb/50EDKrPk
         H1gVsmw7AvdFsoCMchz9HySu0cd7OgacJahifyvPJCjPPT3+RJHyXcxpJJ1xbdXP2MCW
         7Ur7T9MkW8hXwCRTG722YBMvak61XwqawozgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738855919; x=1739460719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSEjI0/PhbFe1xLIAMNstyhshP1bNC0F9pZ0DzpzpJE=;
        b=ej+zQTWy1nzCggNKLYmsGJtPyocAuauWK3N73HAcOKrVRPS3AhOW4zhiMGgqCz3Pmv
         HjzQRr5hZGH1SlG9mHON41j2iz7WYQw+j3rVI7gCWdpoX3JFnLiiSIQf6yfKiQSIITv2
         Enszb+1cv6Up9VI058z49+4nPPn0gF8W7XNOzMJvfOHYW7k/knGqxWDAbLwxE2117VWQ
         VF1l3mhKT0ewLCG++A05y04a3IQ2NmUDp2RvOvexRlNFylUjdT4AuGA+F6rhVVdGWfNJ
         X+wuJiBROh8iUAJxbJx8hBINoLzUonzeK5gq3pWFVf3jeLwwpI6GgHJlYeV/GfG5h4oT
         yLdw==
X-Forwarded-Encrypted: i=1; AJvYcCXUgKeg9cgBf4O0C3+gA0cvkB+wCZJulov9RkNDBOs45xqId0Hpx2Hxb73j4k/TyMEMFUBeC0dJRTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh/KZDxi0UUXaPrwp2A8yIRVC+HKr71a8hC9m09ZboKxaHCFJX
	LYky4pGtk2X3oz8JTGI7rDTQpfBS3SgWeMcEpQTuLu14Gkprr45xjFJP6jSahK4mIK6VD8GBCn/
	C+OKwtxibjVhUmE3klGDigBOlaqeqZVTOtog8Dw==
X-Gm-Gg: ASbGnctM/JCNOEchozdHWofayl94bYPqE73Fttme6Yl4abRvxXuViRynfEYwaO3qUyJ
	nlJ9QQqA/43pxoS86WpT8BamUrSpjE872jkgIsLfJugMuL7lYIbY9vm701hbeNwiMPZwtPUw=
X-Google-Smtp-Source: AGHT+IFBR4yKWi12OxeMKiZJ7mNefCRGP6DMSE17bw0bh1mSFoEoNgEKrlLuvfsnGxNrudo9/TnSwafSOEZjwfBjbM8=
X-Received: by 2002:a05:690c:691:b0:6f9:87da:b763 with SMTP id
 00721157ae682-6f989e2f6a4mr64301617b3.12.1738855919056; Thu, 06 Feb 2025
 07:31:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com> <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
 <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com> <PAXPR04MB8459F1CE0E8049355ADC9F3C88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459F1CE0E8049355ADC9F3C88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 6 Feb 2025 16:31:46 +0100
X-Gm-Features: AWEUYZnQk9hBdobcOkaoMUgqLWtL6CPT5MwibT2ZdKB14CAL3v3eIVCfdwwIt1Y
Message-ID: <CABGWkvrKe6az5XR=MvdMwBOfeXqd5yPoF4Yf4pqyyGPD4Kpvpg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock generation
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Abel Vesa <abelvesa@kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Thu, Feb 6, 2025 at 1:53=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum
> > clock generation
> >
> > Hi Peng,
> >
> > On Wed, Feb 5, 2025 at 10:51=E2=80=AFAM Peng Fan (OSS)
> > <peng.fan@oss.nxp.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Add support for spread spectrum clock (SSC) generation to the
> > pll14xxx
> > > driver.
> > >
> > > Co-developed-by: Dario Binacchi
> > <dario.binacchi@amarulasolutions.com>
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > It doesn=E2=80=99t seem right to me.
> > You can=E2=80=99t take 90% of my patch, where the SSC management was
> > actually implemented, add 10%, and consider yourself the author of
> > the patch.
> > Please correct it in version 3.
>
> Ah. But if you look into the patches, 10% is not accurate
> per lines I change.
> you could see more changes compared with your patch
> https://lore.kernel.org/all/20250118124044.157308-18-dario.binacchi@amaru=
lasolutions.com/.
>
> 1. Use set_spread_spectrm ops
> 2. Use clk_spread_spectrum to replace imx_pll14xx_ssc
> 3. Drop imx_clk_pll14xx_ssc_parse_dt and clk_pll14xx_ssc_mod_type. This o=
ne would
>  count over 50% changes.
>
> The logic that I only did minor update is the function
> clk_pll1443x_enable_ssc with switching to use clk_spread_sectrum

Sorry if I miscounted the lines, but here we are not considering who
actually implemented
the algorithmic part of the SSC management and all the time spent
testing the code on more
than one platform/board with each submission of the series for all 9 versio=
ns.

[1] https://lore.kernel.org/all/20250118124044.157308-18-dario.binacchi@ama=
rulasolutions.com/

Your changes, which are unnecessary for the clk-scmi.c changes, only
serve to support the
DT binding `assigned-clock-sscs`, which, as Krzysztof also reiterated:

https://github.com/devicetree-org/dt-schema/pull/154

you should have proposed during the review of series [1]. You are the
NXP reviewer.

>
> If you think it is not fair, I could drop this patch in V3 and leave it t=
o you to handle.
> I take this patch in the patchset, mainly to ease your work and make

Sorry for quoting Krzysztof again, but:
"Three months iMX8 patchsets, multiple reviews and no single comment
from you till January!"

So please, if you really want to ease my work, then remove this patch
from this series and resume
reviewing series [1].

Thanks and regards,
Dario

> assigned-clock-sscs moving forward, considering SCMI spec needs update
> (clk-scmi.c changes will not land soon).
>
> Regards
> Peng.
>
> >
> > Thanks and regards,
> > Dario
> >
> > > ---
> > >  drivers/clk/imx/clk-pll14xx.c | 66
> > > +++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 66 insertions(+)
> > >
> > > diff --git a/drivers/clk/imx/clk-pll14xx.c
> > > b/drivers/clk/imx/clk-pll14xx.c index
> > >
> > f290981ea13bdba3602af7aa44aaadfe0b78dcf9..3bdce762a9d651a6fb
> > 048dcbf58d
> > > b396af9d3aaf 100644
> > > --- a/drivers/clk/imx/clk-pll14xx.c
> > > +++ b/drivers/clk/imx/clk-pll14xx.c
> > > @@ -20,6 +20,8 @@
> > >  #define GNRL_CTL       0x0
> > >  #define DIV_CTL0       0x4
> > >  #define DIV_CTL1       0x8
> > > +#define SSCG_CTRL      0xc
> > > +
> > >  #define LOCK_STATUS    BIT(31)
> > >  #define LOCK_SEL_MASK  BIT(29)
> > >  #define CLKE_MASK      BIT(11)
> > > @@ -31,15 +33,26 @@
> > >  #define KDIV_MASK      GENMASK(15, 0)
> > >  #define KDIV_MIN       SHRT_MIN
> > >  #define KDIV_MAX       SHRT_MAX
> > > +#define SSCG_ENABLE    BIT(31)
> > > +#define MFREQ_CTL_MASK GENMASK(19, 12) #define
> > MRAT_CTL_MASK
> > > +GENMASK(9, 4)
> > > +#define SEL_PF_MASK    GENMASK(1, 0)
> > >
> > >  #define LOCK_TIMEOUT_US                10000
> > >
> > > +enum imx_pll14xx_ssc_mod_type {
> > > +       IMX_PLL14XX_SSC_DOWN_SPREAD,
> > > +       IMX_PLL14XX_SSC_UP_SPREAD,
> > > +       IMX_PLL14XX_SSC_CENTER_SPREAD, };
> > > +
> > >  struct clk_pll14xx {
> > >         struct clk_hw                   hw;
> > >         void __iomem                    *base;
> > >         enum imx_pll14xx_type           type;
> > >         const struct imx_pll14xx_rate_table *rate_table;
> > >         int rate_count;
> > > +       struct clk_spread_spectrum      ssc_conf;
> > >  };
> > >
> > >  #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw=
)
> > > @@ -349,6 +362,42 @@ static int clk_pll1416x_set_rate(struct
> > clk_hw *hw, unsigned long drate,
> > >         return 0;
> > >  }
> > >
> > > +static void clk_pll1443x_enable_ssc(struct clk_hw *hw, unsigned
> > long parent_rate,
> > > +                                   unsigned int pdiv, unsigned int
> > > +mdiv) {
> > > +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> > > +       struct clk_spread_spectrum *conf =3D &pll->ssc_conf;
> > > +       u32 sscg_ctrl, mfr, mrr, mod_type;
> > > +
> > > +       sscg_ctrl =3D readl_relaxed(pll->base + SSCG_CTRL);
> > > +       sscg_ctrl &=3D
> > > +               ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK |
> > > + SEL_PF_MASK);
> > > +
> > > +       mfr =3D parent_rate / (conf->modfreq * pdiv * (1 << 5));
> > > +       mrr =3D ((conf->spreaddepth / 100) * mdiv * (1 << 6)) / (100 =
*
> > > + mfr);
> > > +
> > > +       switch (conf->method) {
> > > +       case CLK_SSC_CENTER_SPREAD:
> > > +               mod_type =3D IMX_PLL14XX_SSC_CENTER_SPREAD;
> > > +               break;
> > > +       case CLK_SSC_UP_SPREAD:
> > > +               mod_type =3D IMX_PLL14XX_SSC_UP_SPREAD;
> > > +               break;
> > > +       case CLK_SSC_DOWN_SPREAD:
> > > +               mod_type =3D IMX_PLL14XX_SSC_DOWN_SPREAD;
> > > +               break;
> > > +       default:
> > > +               mod_type =3D IMX_PLL14XX_SSC_DOWN_SPREAD;
> > > +               break;
> > > +       }
> > > +
> > > +       sscg_ctrl |=3D SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK,
> > mfr) |
> > > +               FIELD_PREP(MRAT_CTL_MASK, mrr) |
> > > +               FIELD_PREP(SEL_PF_MASK, mod_type);
> > > +
> > > +       writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL); }
> > > +
> > >  static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long
> > drate,
> > >                                  unsigned long prate)  { @@ -370,6
> > > +419,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw,
> > unsigned long drate,
> > >                 writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
> > >                                pll->base + DIV_CTL1);
> > >
> > > +               if (pll->ssc_conf.enable)
> > > +                       clk_pll1443x_enable_ssc(hw, prate, rate.pdiv,
> > > + rate.mdiv);
> > > +
> > >                 return 0;
> > >         }
> > >
> > > @@ -410,6 +462,9 @@ static int clk_pll1443x_set_rate(struct
> > clk_hw *hw, unsigned long drate,
> > >         gnrl_ctl &=3D ~BYPASS_MASK;
> > >         writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
> > >
> > > +       if (pll->ssc_conf.enable)
> > > +               clk_pll1443x_enable_ssc(hw, prate, rate.pdiv,
> > > + rate.mdiv);
> > > +
> > >         return 0;
> > >  }
> > >
> > > @@ -465,6 +520,16 @@ static void clk_pll14xx_unprepare(struct
> > clk_hw *hw)
> > >         writel_relaxed(val, pll->base + GNRL_CTL);  }
> > >
> > > +static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
> > > +                                           struct clk_spread_spectru=
m
> > > +*clk_ss) {
> > > +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> > > +
> > > +       memcpy(&pll->ssc_conf, clk_ss, sizeof(pll->ssc_conf));
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static const struct clk_ops clk_pll1416x_ops =3D {
> > >         .prepare        =3D clk_pll14xx_prepare,
> > >         .unprepare      =3D clk_pll14xx_unprepare,
> > > @@ -485,6 +550,7 @@ static const struct clk_ops clk_pll1443x_ops
> > =3D {
> > >         .recalc_rate    =3D clk_pll14xx_recalc_rate,
> > >         .round_rate     =3D clk_pll1443x_round_rate,
> > >         .set_rate       =3D clk_pll1443x_set_rate,
> > > +       .set_spread_spectrum =3D clk_pll1443x_set_spread_spectrum,
> > >  };
> > >
> > >  struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const
> > char
> > > *name,
> > >
> > > --
> > > 2.37.1
> > >
> >
> >
> > --
> >
> > Dario Binacchi
> >
> > Senior Embedded Linux Developer
> >
> > dario.binacchi@amarulasolutions.com
> >
> > __________________________________
> >
> >
> > Amarula Solutions SRL
> >
> > Via Le Canevare 30, 31100 Treviso, Veneto, IT
> >
> > T. +39 042 243 5310
> > info@amarulasolutions.com
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F
> > www.amarulasolutions.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.
> > com%7Cbeaf5bdcc6694a5a1a1708dd45d701db%7C686ea1d3bc2b4c6
> > fa92cd99c5c301635%7C0%7C0%7C638743511953067272%7CUnkno
> > wn%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA
> > wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C
> > %7C%7C&sdata=3DUFgy1bS7QJ7qenzKFTkPBNfOGn0V89CGR9NLOBka0U
> > 8%3D&reserved=3D0



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

