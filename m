Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7224398F2
	for <lists+linux-clk@lfdr.de>; Mon, 25 Oct 2021 16:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbhJYOs3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 25 Oct 2021 10:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbhJYOs3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Oct 2021 10:48:29 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C4CC061746
        for <linux-clk@vger.kernel.org>; Mon, 25 Oct 2021 07:46:06 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id u130so5315327vku.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Oct 2021 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w7Nv9MdDuJmNWCjczdBB5OvM7fjU1pFKjbuVkcMA+wA=;
        b=nYOBLeK1cY2M1/R1tnKXFZOOsqLvfESyY9IeGuwXWm3EH6A1iyoQf9Q//81RDO3Cp5
         SkJHQVx77QV+OMVkSWDo/q6ygCXlLCh18uoR9aN7MqVDgfJ7jsimjtk6eZlp5BAZ6nj6
         16fFhfiP8gTpWjGpU7DqHIxeCgcylSP5/AJMsvS8e+4OI992rtbekXZMC695HhER37e5
         kVFafrzQtyKkUAGYHQ7SDs/W57PyZ+GGVwoFjEpAaTyt9kckjMKvFPvLz4JofU6w7GhO
         T5zK2mhQ50y2ZdqV7VETsUHENE9xw3snr8/beef91WUfovteIM0I24Wmuy1XcA6kq0in
         WKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w7Nv9MdDuJmNWCjczdBB5OvM7fjU1pFKjbuVkcMA+wA=;
        b=7cCFs2M2WScw9XlFbgeYThjRob1TlRHeu/visZzlZpCHZuj4p0EcLqay7Reji1Pa4T
         ACdSbg31H44sAsvrsF0YNt1SFxbe57Dj7Z9qV8K8lhKtQZXmRItxkXyF8gU0Eqka+7Fr
         +AjetlTkbQQl31L5F4dAXSMAbKIqr9Mj/wYgY8MLJPImYC/eT1KpbBN2r0iKZ2ZUI/DY
         xNakAv5o13mRSncXnKZtMP1mhJHsxkkrG6b6r8TUQ+fel5/OTyBWw+QfJvrL7lGl2p6b
         BrSTb2tOC6QzVYULxHbUBJPZ0YSPUntmGcWDbBCus3V4uFFEM2ghMzR2Om++l9uyCMhv
         Pf3Q==
X-Gm-Message-State: AOAM5337o8z92D8g1hynq/iZbHB3FDrQ3kpoBu/EDKpqfNr1NddtnAyr
        dB7AmSkW+WmqjQx8KzFBGbPnChlFl4sPcbnEMDe7Ig==
X-Google-Smtp-Source: ABdhPJwsLJkppl1vHeQd439U7ptbfGOILqCOBsfzqrvFvNYwXpiGKKZmBIl2IxFsZQ8ol0cNfWQbGmhI0smyVopPYG0=
X-Received: by 2002:a05:6122:1827:: with SMTP id ay39mr3476582vkb.24.1635173165035;
 Mon, 25 Oct 2021 07:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211022215635.31128-1-semen.protsenko@linaro.org> <f8f1121a-f9ba-e231-ece2-646d9de8b22b@canonical.com>
In-Reply-To: <f8f1121a-f9ba-e231-ece2-646d9de8b22b@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 25 Oct 2021 17:45:53 +0300
Message-ID: <CAPLW+4kh0B70M0n_vc39Me_EPcPk+r_ZHCaJFtWrMgnnPYDL5w@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos850: Register clocks early
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 23 Oct 2021 at 12:19, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 22/10/2021 23:56, Sam Protsenko wrote:
> > Some clocks must be registered before init calls. For example MCT clock
> > (from CMU_PERI) is needed for MCT timer driver, which is registered
> > with TIMER_OF_DECLARE(). By the time we get to core_initcall() used for
> > clk-exynos850 platform driver init, it's already too late. Inability to
> > get "mct" clock in MCT driver leads to kernel panic, as functions
> > registered with *_OF_DECLARE() can't do deferred calls. MCT timer driver
> > can't be fixed either, as it's acting as a clock source and it's
> > essential to register it in start_kernel() -> time_init().
> >
> > Let's register all Exynos850 clocks early, using
> > CLK_OF_DECLARE_DRIVER(), and do all stuff relying on "struct dev" object
> > (like runtime PM and enabling bus clock) later in platform driver probe.
> > Basically CLK_OF_DECLARE_DRIVER() matches CMU compatible, but clears
> > OF_POPULATED flag, which allows the same device to be matched again
> > later.
> >
> > Similar issue was discussed at [1] and addressed in commit 1f7db7bbf031
> > ("clk: renesas: cpg-mssr: Add early clock support"), as well as in
> > drivers/clk/mediatek/clk-mt2712.c.
> >
> > [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20180829132954.64862-2-chris.brandt@renesas.com/
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Notes:
> >   - This patch should be applied on top of CMU_APM series
> >     (clk: samsung: exynos850: Implement CMU_APM domain)
> >   - I considered introducing some macro to reduce the code duplication
> >     (actually created one), but decided to go with plain code: this way
> >     it's easier to understand and navigate
> >   - Also considered registering only *some* clocks early: won't be
> >     possible, as leaf clocks (like MCT) depend on the whole clock tree.
> >     Registering early only *some* CMUs (like CMU_PERI) looks possible,
> >     but I'm not sure what is the best way to implement this, and that
> >     won't be consistent with other CMUs (too much code variation as for
> >     my taste)
> >
>
> In the long term it is better for entire kernel and SoC to support
> deferred probes and register clocks as devices, not as CLK_OF_DECLARE. I
> understand that it's not possible now to get rid of CLK_OF_DECLARE
> entirely, but we could meet half-way.
>

Agreed, the more general problem is probably insufficient dependency
resolving in kernel, so this is more like a workaround anyway. I'll
send v2 soon.

> The Exynos5433 has the same problem and it registers few core CMUs
> early: the TOP, CPUs, memory bus, peripheral buses including PERIS with
> MCT. I prefer this approach than yours. The only domains needing
> CLK_OF_DECLARE are TOP and PERIS. Maybe also CORE - one would have to
> check if GIC and CCI are needed early.
>

Let's register only CMU_PERI clocks early for now. If the need arises,
we can do the same for other domains later.

>
> Best regards,
> Krzysztof
