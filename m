Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E6141E6EE
	for <lists+linux-clk@lfdr.de>; Fri,  1 Oct 2021 06:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351876AbhJAEye (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 1 Oct 2021 00:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbhJAEyd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Oct 2021 00:54:33 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC225C06176A
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 21:52:49 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id i84so17877567ybc.12
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 21:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HSY5dUG0iWk0wmOHITmVmnD9YYtjGnNr2FW0qw66Pe4=;
        b=ERvLu10phYrVrUIUT3FzdDeg2rgbZvK7s0wbD18UwtSTLHKvY+YAMQN2Z4wvYwRRiL
         /iRsVFxQjqeYWGoJQV/Rdo+r09ydttg3pJqOhGWg3MyiGhvh/JiMTgy0TZM2cBXSmGrp
         L0ERj0n5zOOzIzH5m/U7eBBJPWYKbnOJ5JEUDDAyXqEOrDPwvMBP1Dr/RbnG6FqSxegE
         ulQ4x5AozNlp0wP1JYC8A3wJ0IXc4kgWceI+UcywptFCLQOaNgQeoq2dnO8oMLWez+UK
         c2f6pDqf7TqUq0GspOOliKauJ7YJqi+MU5ExnkpEsXJxt4ahiYH6wzRY1oLkDhkvXcx3
         yahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HSY5dUG0iWk0wmOHITmVmnD9YYtjGnNr2FW0qw66Pe4=;
        b=MZPQsRPdETQ6e55miiYQKV5sUO3cXj8HFPBaW8wpgw3uctXRU8EFlvsxUxm2tIOm/3
         sZT76aUcGDTYVyWaJKuPdrioAOdlu+RUpeDB/AoGPzu0576ltSFcRo0qLkQ9A11sN2pM
         dZHEs12L28d2+G9pnldDb7VijGqYbgXBw+lNbrp/D3ibKk/FeRbZTYYnu/4QqkGmm5zk
         jgkYGlptVnlPYK4i6Lzzwp/B5LWtRyy1368KGZJDqhvSfVLkPhjsVj2V4kLIaMiitk2O
         hEfRo1nqjEZdyfNONj/x/LKuA9X2dr1NgokSGIHUjHwF/FvmnCIJbXWTQn0jgvtH/KGG
         Tg8g==
X-Gm-Message-State: AOAM530Dmhvgy46K7JoSBsk5wm2t+LVEOZBLiI88S3Q/sUuWLT46MgpG
        KlzHNHZ7qonkHsrSoFZKLSoAZjrYXzQ1BddJwjweBw==
X-Google-Smtp-Source: ABdhPJygycpZauu9TFmc+TzH6Xxv9d3sYB6IkEM/HcmQ8hM9+hQo2lPA+CHRH3RKW0G4hzlav9jzO/VJG+svIlgQKNg=
X-Received: by 2002:a25:4684:: with SMTP id t126mr3386461yba.476.1633063968846;
 Thu, 30 Sep 2021 21:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <YVWCK5QO331rfhJJ@google.com>
 <CA+Ln22EbXKsRFZ=3L4A_jqciRxG2hnAh9iKTfQ_Ypr2NJgDzQQ@mail.gmail.com>
 <YVWkxnc8wTdBgRsv@google.com> <CA+Ln22FBy2ks9gX3df=rQw-6W3iftMVoqsoqBPchGCqDDoMaLg@mail.gmail.com>
 <YVaIC8GTzvLKmZ5z@infradead.org>
In-Reply-To: <YVaIC8GTzvLKmZ5z@infradead.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 30 Sep 2021 21:52:12 -0700
Message-ID: <CAGETcx-5pBJK4y84QJfr7cTjsd_GhHyuZJfjmYZ8CN0vKXOxcw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 30, 2021 at 9:02 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Sep 30, 2021 at 09:10:31PM +0900, Tomasz Figa wrote:
> > Generally, the subsystems being mentioned here are so basic (clock,
> > pinctrl, rtc), that I really can't imagine what kind of rocket science
> > one might want to hide for competitive reasons... If it's for an
> > entire SoC, I wonder why Intel and AMD don't have similar concerns and
> > contribute support for their newest hardware far before the release.
>
> There is no reason at all, and to be honest this whole discussion with
> these bullshit arguments from the Google/Linaro/SoC vendor crowd just
> shows how on crack these people are, and shows a good example of why
> we should not support these models at all.  There is no good reason
> to "overide" uptream functionality EVER.  Stop digging yourselves into
> your ever bigger holes and just f***king contribute upstream NOW.  Just
> as we always have we should not give you more rope to shoot yoursel
> while ausing us extra overhead.

Maybe you need to read up the code of conduct again.

-Saravana
