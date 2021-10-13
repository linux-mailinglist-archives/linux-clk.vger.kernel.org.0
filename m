Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCE342BF05
	for <lists+linux-clk@lfdr.de>; Wed, 13 Oct 2021 13:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhJMLiE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 13 Oct 2021 07:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbhJMLiE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Oct 2021 07:38:04 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148B6C061746
        for <linux-clk@vger.kernel.org>; Wed, 13 Oct 2021 04:36:01 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id f4so3784404uad.4
        for <linux-clk@vger.kernel.org>; Wed, 13 Oct 2021 04:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1BHXXzvtzeANnGlYj0j/Y48TNpRv6ZNQOg6UzSjdT00=;
        b=CaxxwZx5QBPBptY9NbvsOzzkgYhmLshDyqM8s5zJ9u+q4tXDuc4QD6J1pSVZWT9SZI
         mFKihFPK1keHRYr+o4rfQZVnmKF5pLtnkivygAdMSQKWnmLo7Ggtcz+SJ+h9JlVMGC6Z
         Wznr0axqgDcJpPZtmQqSXEKSa5jrY13EEAIhlFfFxH0tIiAPpV0d+FBb0L0bbX61AL/4
         uCaTW+RsowGPSIQ3wdWN/2qQMy2D2+wzC+PHJdumfJVYjbeg/rdj95IO0ckvVyNgxWoH
         MEZJ669IBFk82K+4RgrmlifRgVP5oi+vwbwg9omah8VgIXxStFOJfdvq6w7OrexWOMSq
         6Bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1BHXXzvtzeANnGlYj0j/Y48TNpRv6ZNQOg6UzSjdT00=;
        b=zJKrmFzMNAfYfX2NQU5j8Wyh3NKPTx29Pjp9tscEJZZdcyZglpHv438oQcj16E5qL9
         JXxI8W5QRV8QSZSxKBDhY1Jcu7xeahTuwTsaD5dWsI82YBcz/icEB99bhczQIvuApiQl
         B4/PswXyVVnLAzDlpSttRwQOc+5RJTobnXHKO1qWl7SqreTpFhVIO3ubJ0gkOIkC27qr
         zMtUe9xhHHbA6c9CoEJU94dkm7hZPKGa3AyBVjzbU47br2hlr8RF5ctLY+LkdvFHupw/
         z2JW5WYXr2mnuQE0paoSV6/PjDaKnmBfkisW1iN8erMxYwtHIe2H921gZwtSZV30IK44
         tlOg==
X-Gm-Message-State: AOAM532SlVir4tBhTs2JS8kvAxNd/btvzdQdCZTYfbqAkRurBGV64ffZ
        nXMDyfTMkvLiB8w25wAfu2DIi0vD9Mf/IrtkYpogFA==
X-Google-Smtp-Source: ABdhPJznGxQeOjBPAWshGZU+/Dw0bXZgRfSGB8DNwUM/e6NNXXuizv4hmCdzGEvAEy9Rm76j0GUoePqDxI3bjN0gf4I=
X-Received: by 2002:ab0:708e:: with SMTP id m14mr28558622ual.104.1634124960204;
 Wed, 13 Oct 2021 04:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211007182158.7490-1-semen.protsenko@linaro.org> <YWXaKevf8D0kKYXo@smile.fi.intel.com>
In-Reply-To: <YWXaKevf8D0kKYXo@smile.fi.intel.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 13 Oct 2021 14:35:48 +0300
Message-ID: <CAPLW+4==u6Lpi-tRpGCFjuCBUARsarJx=Lg2QVAbvXX7hOyRVg@mail.gmail.com>
Subject: Re: [PATCH v5] clk: Add write operation for clk_parent debugfs node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 12 Oct 2021 at 21:55, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 07, 2021 at 09:21:58PM +0300, Sam Protsenko wrote:
> > Useful for testing mux clocks. One can write the index of the parent to
> > be set into clk_parent node, starting from 0. Example
> >
> >     # cd /sys/kernel/debug/clk/mout_peri_bus
> >     # cat clk_possible_parents
> >       dout_shared0_div4 dout_shared1_div4
> >     # cat clk_parent
> >       dout_shared0_div4
> >     # echo 1 > clk_parent
> >     # cat clk_parent
> >       dout_shared1_div4
> >
> > CLOCK_ALLOW_WRITE_DEBUGFS has to be defined in drivers/clk/clk.c in
> > order to use this feature.
>
> ...
>
> > +#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
> > +     if (core->num_parents > 1)
> > +             debugfs_create_file("clk_parent", 0644, root, core,
> > +                                 &current_parent_rw_fops);
> > +     else
> > +#endif
>
> > +     {
> > +             if (core->num_parents > 0)
> > +                     debugfs_create_file("clk_parent", 0444, root, core,
> > +                                         &current_parent_fops);
> > +     }
>
> Currently there is no need to add the {} along with increased indentation
> level. I.o.w. the 'else if' is valid in C.
>

Without those {} we have two bad options:

  1. When putting subsequent 'if' block on the same indentation level
as 'else': looks ok-ish for my taste (though inconsistent with #ifdef
code) and checkpatch swears:

        WARNING: suspect code indent for conditional statements (8, 8)
        #82: FILE: drivers/clk/clk.c:3334:
        +    else
        [...]
             if (core->num_parents > 0)

  2. When adding 1 additional indentation level for subsequent 'if'
block: looks plain ugly to me, inconsistent for the case when
CLOCK_ALLOW_WRITE_DEBUGFS is not defined, but checkpatch is happy

I still think that the way I did that (with curly braces) is better
one: it's consistent for all cases, looking ok, checkpatch is happy
too. But isn't it hairsplitting? This particular case is not described
in kernel coding style doc, so it's about personal preferences.

If it's still important to you -- please provide exact code snippet
here (with indentations) for what you desire, I'll send v6. But
frankly I'd rather spend my time on something more useful. This is
minor patch, and I don't see any maintainers wishing to pull it yet.
Btw, if you know someone who can take it, could you please reference
them here?

> --
> With Best Regards,
> Andy Shevchenko
>
>
