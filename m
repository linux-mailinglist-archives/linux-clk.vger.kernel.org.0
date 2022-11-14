Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E79628A37
	for <lists+linux-clk@lfdr.de>; Mon, 14 Nov 2022 21:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236843AbiKNUML (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 14 Nov 2022 15:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237563AbiKNULz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Nov 2022 15:11:55 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223E01CFD1
        for <linux-clk@vger.kernel.org>; Mon, 14 Nov 2022 12:11:53 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id h14so11353715pjv.4
        for <linux-clk@vger.kernel.org>; Mon, 14 Nov 2022 12:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F8YJKTEaSjeWZUEi+lCVZoSmHdKaA45O5/BX7Jv9leE=;
        b=Bo4ud/9wy/hrzT1vvhDfzIZliKL3nHdYeO1xarp/GBtmeBMu1ebHsicCRbtzgA4VvD
         zhsCLmYqXAuFGyZ2iJDfrGzsRIfcQNJ7Y4Wg6aOgZKxatMr/2V88oS2o+LK3CFByBcAy
         wPb3b62Csfvpo/22qIFNqV1MXqzfNfF9PWmixTMiZGauBYITr61tA5ZtWXU0rBHMRt+H
         rygyifAQLrP0osA+HOHDhYKOu+XXlcDQhf9PYuaDl2rTJuKTkVqI1fM6Q/EJI0xF8DiD
         QAJzD0uRu4y39bHmuiGEqt4gnA0rEpUbR25D9M0CqdA/+2RCiSSO7Y43j5t+1rl9FcgD
         swGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8YJKTEaSjeWZUEi+lCVZoSmHdKaA45O5/BX7Jv9leE=;
        b=0gScISIP4pWrg8E9NMTnSElvj4nZcVAtxpAh8d8kF3pkymqIzEkmoElglH06IHtfhD
         RiMvoI37r05J+qGHIekaPbRTaQVRp3SeiiT9rP0ASl15GfJBYQ8kJFUDz3A3NTpih6nS
         LLHSt7Fgwt9Z6Uwdvg3mX2wLymXy1nbYCigQ9ZDNn2nfJHn3VIu/tgXa3Fn5X301pbds
         FqqHuHGRJRUAJL/jS4q0bZNH3090aYZ3YZnWy57Bsg1OOrGw/w4EVj2ym10pvbshjJv7
         +0qicZvNt4oVtd6NbwU0O97XL5PPTQOotUdiIqvzFGWIAk4HyegvkyHr5BEeDMdUZdJF
         kmog==
X-Gm-Message-State: ANoB5pmImlCC1KWjupZ3YXcFSqFhGxXZEFsFGiFIEjYyip8JyxGadnrC
        LT95HkrKQn1wRWfXHEjOh7ciVn5SmQnpoGAsDPt7JDt+Ngy18g==
X-Google-Smtp-Source: AA0mqf67zLfaITSHy+eAhqfQdT/uWKph5nU4Nbw6RfC1+A1fyleHLDtSWtGzZ6dKgqVm0q4ZyoONgDwQ/zFsYrOeAlo=
X-Received: by 2002:a17:90a:e64b:b0:20d:b124:33b1 with SMTP id
 ep11-20020a17090ae64b00b0020db12433b1mr14918522pjb.202.1668456713336; Mon, 14
 Nov 2022 12:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20221101233421.997149-1-swboyd@chromium.org> <CAD=FV=XkhtgL_4-cpj-Xi3uH6FAtmWhk5u6sfakXABTnv5eYvw@mail.gmail.com>
 <CAE-0n539akxzrof5nZXb1=8tM9=A7NKaB98LjkQ4tWJmSbWm_A@mail.gmail.com>
In-Reply-To: <CAE-0n539akxzrof5nZXb1=8tM9=A7NKaB98LjkQ4tWJmSbWm_A@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 14 Nov 2022 21:11:16 +0100
Message-ID: <CAPDyKFqLx8rnjN0=ysdE7=1osiug1Si13ywJPan9jCM=nrxYVA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gdsc: Remove direct runtime PM calls
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, patches@lists.linux.dev,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,GUARANTEED_100_PERCENT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2 Nov 2022 at 04:16, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2022-11-01 17:45:03)
> >
> > One small nit is that the kernel doc for "@dev" in "struct gdsc" is
> > incorrect after your patch. It still says this even though we're not
> > using it for pm_runtime calls anymore:
> >
> >  * @dev: the device holding the GDSC, used for pm_runtime calls
>
> Good catch! I can remove the part after the comma.
>
> >
> > Other than that, this seems OK to me. I don't feel like I have a lot
> > of good intuition around PM Clocks and genpd and all the topics talked
> > about here, but I tried to look at the diff from before all the
> > "recent" patches to "drivers/clk/qcom/gdsc.c" till the state after
> > your patch. In other words the combined diff of these 4 patches:
> >
> > clk: qcom: gdsc: Remove direct runtime PM calls
> > clk: qcom: gdsc: add missing error handling
> > clk: qcom: gdsc: Bump parent usage count when GDSC is found enabled
> > clk: qcom: gdsc: enable optional power domain support
> >
> > That basically shows a combined change that does two things:
> >
> > a) Adds error handling if pm_genpd_init() returns an error.
> >
> > b) Says that if "scs[i]->parent" wasn't provided that we can imply a
> > parent from "dev->pm_domain".
> >
> > That seems to make sense, but one thing I'm wondering about for "b)"
> > is how you know that "dev->pm_domain" can be safely upcast to a genpd.
> > In other words, I'm hesitant about the "pd_to_genpd(dev->pm_domain)"
> > call. I'll assume that "dev->pm_domain" isn't 100% guaranteed to be a
> > genpd or else (presumably) we would have stored a genpd. Is there
> > something about the "dev" that's passed in with "struct gdsc_desc"
> > that gives the stronger guarantee about this being a genpd?
>
> Not really any stronger guarantee. The guarantee is pretty strong
> already though. You can look at the callers of dev_pm_domain_set() and
> see that nothing is calling that really besides the genpd attachment
> logic when a driver is bound to a device (follow dev_pm_domain_attach()
> from platform_probe()). The dev->pm_domain is going to be assigned to a
> genpd assuming the 'dev' pointer is a platform device and has
> 'power-domains' in DT.
>
> It's not great, but it works for now. Certainly if we ever want to
> replace the pm_domain with something that isn't a genpd then we'll be in
> trouble. I'm not sure it will ever happen. Ulf, can you provide more
> assurances here?

I think the call to pd_to_genpd() should be considered as safe, as
long as the call is made in a controlled way from within a genpd
provider.

However, in some cases, we want to pick up a genpd from the
dev->pm_domain, that isn't a genpd provider. Internally in genpd we
use dev_to_genpd_safe(). Is that something that would be valuable to
use here? If so, I don't see any issues with exporting that as a new
genpd helper function.

[...]

Kind regards
Uffe
