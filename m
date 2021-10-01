Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549B041F1A7
	for <lists+linux-clk@lfdr.de>; Fri,  1 Oct 2021 18:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355133AbhJAQBy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 1 Oct 2021 12:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354559AbhJAQBx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Oct 2021 12:01:53 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8635DC061775
        for <linux-clk@vger.kernel.org>; Fri,  1 Oct 2021 09:00:09 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id 187so3911104pfc.10
        for <linux-clk@vger.kernel.org>; Fri, 01 Oct 2021 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GNY4mCLAdh6H7+10tLD5snDvXVL71nb/jw0ZWy9yCyw=;
        b=bB/8c+ktBYRSYiIzc1qYdiubvKawZKgIs8yj4AWJv1gFhGEflb4n8+xq7ndQLzWzsv
         K2PoREC6WSRvpb/r1htjH2I++9Pd3MKb6hwuYz8yf4RIFihCvaomNe5Wx3EJRw9S5N1x
         vlaKFUz5kJqPvqnvfliveUpR7z9HK41Xg2uGj0e55vVZuSNT0SF+lkXHftPTsBq2zwN7
         R8Dz4h2MllWdZAY5yIvDO9sT/QQFFSPB3d6t+CtS3955sZSk4oMhZ1i+PfTXSjr+4lMF
         5dHqYhbtjKCPxPxLaEthOIjBefkcIr+EoEpAyYJ72wR35YGiuIJ/za7Q4La1tnXcJot5
         VAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GNY4mCLAdh6H7+10tLD5snDvXVL71nb/jw0ZWy9yCyw=;
        b=xiKHGXVzP++TLd2pvI580wM3u21lqVpYX1Eu3RoLIX53GqElqPoujvwxIxkQy2tYXJ
         8jFVOFTgU5qDw/DyYWn04xbzVXtAKSj2/s0D/qF2QyrIl0K2zL884rnT+orfMDw+ZL93
         BgN8UVZCtUOkpvCpAtBafp3X1EyJzNoVb8j/qvn5ccdYqZOOMrEZUhWKkXbtaSfqUg3U
         YhEQ0BRZiId/QTJrxZo/ss4maJ5vLhj4mTImYweG1tOf+CSOqAGSX47Ejuw7OtE6AJTR
         VgU+Y6Ny5iSTP/ZNfNPdxg8trxu16J2mQzdWOjz5v3af+jvDDuG2xu4CL3Oo56YPafOn
         P3XQ==
X-Gm-Message-State: AOAM5330zgb57Q1lHQ3CjCpAeYOstOMd2fQykRoiOyMR8IACt2rx7IAQ
        6b9tgzOSyzR88ehg6sODK79FVOR3Yw+M1lFrnPrhPA==
X-Google-Smtp-Source: ABdhPJzMhlQ+ie8HM5hyc7yInR7SfxTR/SFzyRo8unfhzRxZHrqwZrqYTWNFAYGA5eeve8rD6AbkmvK5EfkKMBQQF1k=
X-Received: by 2002:a05:6a00:16cb:b0:44b:bd38:e068 with SMTP id
 l11-20020a056a0016cb00b0044bbd38e068mr12092458pfc.34.1633104008868; Fri, 01
 Oct 2021 09:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
 <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com> <CAMuHMdUkMwyA-bk7hfr7S7TE-_S9eBUxKWKmpj0rDCUvHL+fxw@mail.gmail.com>
In-Reply-To: <CAMuHMdUkMwyA-bk7hfr7S7TE-_S9eBUxKWKmpj0rDCUvHL+fxw@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 1 Oct 2021 08:59:57 -0700
Message-ID: <CAOesGMg_eA5PNzsL76xv6kDQ2QUZeCwC04BNeucfGXkFSOE=Tw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 1, 2021 at 4:59 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Olof,
>
> On Fri, Oct 1, 2021 at 7:36 AM Olof Johansson <olof@lixom.net> wrote:
> > A much more valuable approach would be to work towards being able to
> > free up memory by un-probed drivers at the end of boot. That would
> > possibly benefit all platforms on all architectures.
>
> We used to have such a functionality in arch/ppc (not arch/powerpc!),
> where code/data could be tagged __prep, __chrp, or __pmac, to put it
> in a special section, and to be freed with initdata when unused.  It
> was removed in v2.6.15[1], as the savings weren't worth the hassle.
> In a more fragmented space like arm the memory lost due to alignment
> of the sections would be even more substantial.

Yeah, the balance between per-platform code size and overall kernel
code size shifted over time to a point where it wasn't as meaningful
on ppc.

> Another problem is to know when is the end of the boot, especially
> with deferred probing.

Most of this code either has a module_init() or an initcall that
actually registers the drivers and/or probes for the platform and does
the work.

This means you can have a late equivalent hook/initcall that
determines whether this path ended up being probed/used. If it wasn't,
you can then unregister and flag the corresponding memory to be freed
at the end, and would take out the heuristics and guessing on needing
to do it automatically from the code path that's doing said freeing.


-Olof
