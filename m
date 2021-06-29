Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C084A3B79C7
	for <lists+linux-clk@lfdr.de>; Tue, 29 Jun 2021 23:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbhF2VQ1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 29 Jun 2021 17:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235688AbhF2VQ1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Jun 2021 17:16:27 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD84C061767
        for <linux-clk@vger.kernel.org>; Tue, 29 Jun 2021 14:13:59 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id h9so413246oih.4
        for <linux-clk@vger.kernel.org>; Tue, 29 Jun 2021 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U74U+iEn5Am5+kX3N0VS9opfa7Yy7NUE/0AOkeeLZSE=;
        b=lh/WrrXMroWGGnIqlMGVQxW+VoxGnNc+tj6xNgIhRuotpvHEdNQe08qn92E8yCYIIO
         i+TlkPSaRSi0Yflyaw8nIY6aFzSdwE7ilTSAZRu+JGWJMPcgHSFs9Ft8c8Qef9d16/ML
         6bPEUmYNYLvDFbNbdqx50gM70+5OIeiZIyzWYtjQeqAnFPg5RQuVnVHWk2zDn/lpd8nA
         FCqTpcKPOdVVg3sqsWJIMX1NhVIN0p38+oXinZ4rLJocqxmWVcIPsHc2AVOIzhIVkab4
         5QA8zMA3uWoLcBbc8pXqghUTsKMF3+DrWsiCZkFq8KsStl/xBuceD73aR7a/Rt7f/1nf
         aU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U74U+iEn5Am5+kX3N0VS9opfa7Yy7NUE/0AOkeeLZSE=;
        b=dwIjw9ewcitpmY0+wh38hb3rm896ciHsmHrVTM1nUbPI4k+6cneZxeh3BkIV2sPrFQ
         ZE2K6RZ+e6pIIx7Lm/P0DkFtUPsIni/U9F6dQmpNsT9JZ6xPTe5vw/Rd1+Cihkcpxzz5
         wcU6O7XX+vysdkRLHNzd3RAvJi8cB0/09P0QbgMUFPBsWxLiM3Xp/EzNb/bpixh/8EwQ
         RTmRAfS4W4DL8I/EqWD57fmrWGcZtPRoCyf/ZKoQcwQY3uysDiTqFc62VT4I1v6IPzcf
         SS+1w7XBdfBsmSatGPABFNRFH1IGP91WY4tkOLQxsZGqQMHZb6Yu9HKPfgSzrXGuEHG9
         IU8w==
X-Gm-Message-State: AOAM531LI1ibdIlSX6Ux5TV2J5RV/1Ln1jr1CpWBLrMC8Mc5JHFUNGoT
        9XxRuuKjEvoD/TskYiY8KKq2dw==
X-Google-Smtp-Source: ABdhPJz74smIKy3vpdkAtG9TjzPJN8VOtP7iUper90rhSA1q4NycNiwb0I47lYywHVlKsY0x3xUltA==
X-Received: by 2002:a05:6808:1451:: with SMTP id x17mr633681oiv.55.1625001238673;
        Tue, 29 Jun 2021 14:13:58 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x5sm2292665oto.63.2021.06.29.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 14:13:58 -0700 (PDT)
Date:   Tue, 29 Jun 2021 16:13:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gdsc: Ensure regulator init state matches
 GDSC state
Message-ID: <YNuNFNZm7qRpD/eG@yoga>
References: <20210625225414.1318338-1-bjorn.andersson@linaro.org>
 <162494849279.2516444.9302337933628102536@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162494849279.2516444.9302337933628102536@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 29 Jun 01:34 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-06-25 15:54:14)
> > As GDSCs are registered and found to be already enabled
> > gdsc_toggle_logic() will be invoked for votable GDSCs and ensure that
> > the vote is matching the hardware state. Part of this the related
> > regulator will be enabled.
> > 
> > But for non-votable GDSCs the regulator and GDSC status will be out of
> > sync and as the GDSC is later disabled regulator_disable() will face an
> > unbalanced enable-count, or something might turn off the supply under
> > the feet of the GDSC.
> > 
> > So ensure that the regulator is enabled even for non-votable GDSCs.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 37416e554961 ("clk: qcom: gdsc: Handle GDSC regulator supplies")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/clk/qcom/gdsc.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > index 51ed640e527b..f7e7759cdb90 100644
> > --- a/drivers/clk/qcom/gdsc.c
> > +++ b/drivers/clk/qcom/gdsc.c
> > @@ -359,10 +359,17 @@ static int gdsc_init(struct gdsc *sc)
> >  
> >         /*
> >          * Votable GDSCs can be ON due to Vote from other masters.
> > -        * If a Votable GDSC is ON, make sure we have a Vote.
> > +        * If a Votable GDSC is ON, make sure we have a Vote. If
> > +        * non-votable, ensure that the supply is kept enabled (as
> > +        * is done by gdsc_enable).
> >          */
> > -       if ((sc->flags & VOTABLE) && on)
> > +       if ((sc->flags & VOTABLE) && on) {
> >                 gdsc_enable(&sc->pd);
> > +       } else if (on) {
> > +               ret = regulator_enable(sc->rsupply);
> > +               if (ret < 0)
> > +                       return ret;
> 
> Looking at this makes me think we've messed something up with
> gdsc_enable() being called or cherry-picking the regulator enable (and
> other stuff in this gdsc_init()) out of the enable path. Maybe we should
> have a followup patch that replaces the gdsc_enable() with
> gdsc_toggle_logic(sc, GDSC_ON) so that we know it isn't doing anything
> else during init like asserting a reset when presumably all we want to
> do is toggle the enable bit to assert our vote.
> 
> And I notice that we already call gdsc_toggle_logic() in gdsc_init(), so
> then we'll have a double regulator_enable() in the case of PWRSTS_ON?
> And then if the flag is ALWAYS_ON we'll call regulator_enable() yet
> again, but luckily only if it isn't on initially, phew! This code is
> quite twisted.
> 
> It would be super nice to make it more like
> 
> 	if (on) {
> 		/* It was on in hardware, sync kernel state */
> 		regulator_enable();
> 
> 		if (votable)
> 			write bit, why do any wait?
> 
> 		if (retain ff)
> 			write bit
> 	} else if (always_on) {
> 		/* Force on */
> 		gdsc_enable();
> 		on = true;
> 	}
> 
> 	if (on || ...)
> 

This does look cleaner, I will dig through the logic here once more
before figuring out what to do for v2.

Thanks,
Bjorn

> > +       }
> >  
> >         /*
> >          * Make sure the retain bit is set if the GDSC is already on, otherwise
