Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F8341EEB4
	for <lists+linux-clk@lfdr.de>; Fri,  1 Oct 2021 15:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbhJANlf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 1 Oct 2021 09:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbhJANle (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Oct 2021 09:41:34 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5390CC06177C
        for <linux-clk@vger.kernel.org>; Fri,  1 Oct 2021 06:39:50 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g41so38691462lfv.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Oct 2021 06:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EjEzezsR+/PambgN+lAAYZ1z9rojBWgi6PT34tsYxbI=;
        b=C6fV4yWw1ceIqlo3pLFwCxKnhVCw/kuzIb7ecScYvV7TNg4eT2p4ZPgCXRjlPQxuCS
         Wdr/7z3822oHu/gKY7pb2CMDmwChG2MImExZ3SoiaWINyTtW1mjxzlIHKKJVuIYKx8hL
         XXDlmZ7O6Q9suRQD3j6+xskiuv0wxvOHMTdBDNCKErUgilJvcT2E9jxQ+bUfhhOn3Zl2
         PegGBhq5uW1fZcmpSDj8XwDwrskqlXtJCleoq2gIF4EIY51y2Y2nzExVxEGZFUBtMPZS
         64vraK/EdUmAWqAarHFzUdqeZf01jrOztwUyhU1RKUkqlXcaOnw2/6iNrgizwk96n/W6
         ZSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EjEzezsR+/PambgN+lAAYZ1z9rojBWgi6PT34tsYxbI=;
        b=nEqgfzXNfeXIYCjgZHglJspO9TUfALCRWsR+jezU3jlxyMdxOT9plf9znWLSLOvebt
         kJP1AAYknBt5Z70sXemJq7CfDBokv2scPjm8bp/C9HhIpFVQ/X7jJ3T1oM3F9uIDCS7Y
         hZQb/ORPwvTzPFeiUqJEhCZZPvCHiDQ8TT/Q+GbLKartrbYOcZrSlsv6QxLFpvpJ4Bte
         T+O3HwG2+ZbMDgCW1CReq9tJwINFbQFySDj4QOu8d0zsakHYtqnUmHIAWvWZK4wyCpS1
         xaUqg1s/qxgJtcOkxgEgKe+XUAe8PlkmjxoUZShvucQ1x79SlWVoP793PAsKVyKPxEWu
         ZWHg==
X-Gm-Message-State: AOAM531xtbgp1GFM+d6TIZJU6/Lxe0T0WW6BL5tW2sv9/eipK0sLaTnH
        T7NHek4Hpm8CLMiK/j1coG0he6j6feT1w8n+XtdPzA==
X-Google-Smtp-Source: ABdhPJxp4p0UQRRIw2z72BWkWXdCGpyRnefweou3T6S9p6407CeSYXpm2W/gIhkCapLJ10cfY553xwNF/HrJa5MfNR0=
X-Received: by 2002:a05:651c:2006:: with SMTP id s6mr12122181ljo.4.1633095586851;
 Fri, 01 Oct 2021 06:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com> <20210926224058.1252-14-digetx@gmail.com>
In-Reply-To: <20210926224058.1252-14-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 1 Oct 2021 15:39:10 +0200
Message-ID: <CAPDyKFpzhv1UxjM0q5AWHVxTWC_cCO_Kg_6exO0o_=EoVvjo+w@mail.gmail.com>
Subject: Re: [PATCH v13 13/35] drm/tegra: gr2d: Support generic power domain
 and runtime PM
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add runtime power management and support generic power domains.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gr2d.c | 155 +++++++++++++++++++++++++++++++++--

[...]

>  static int gr2d_remove(struct platform_device *pdev)
> @@ -259,15 +312,101 @@ static int gr2d_remove(struct platform_device *pdev)
>                 return err;
>         }
>
> +       pm_runtime_dont_use_autosuspend(&pdev->dev);
> +       pm_runtime_disable(&pdev->dev);

There is no guarantee that the ->runtime_suspend() has been invoked
here, which means that clock may be left prepared/enabled beyond this
point.

I suggest you call pm_runtime_force_suspend(), instead of
pm_runtime_disable(), to make sure that gets done.

[...]

Kind regards
Uffe
