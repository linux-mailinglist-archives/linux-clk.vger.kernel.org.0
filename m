Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B51344B3F6
	for <lists+linux-clk@lfdr.de>; Tue,  9 Nov 2021 21:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244349AbhKIUcZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 Nov 2021 15:32:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244337AbhKIUcV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Nov 2021 15:32:21 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B239C06127A
        for <linux-clk@vger.kernel.org>; Tue,  9 Nov 2021 12:29:35 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id v40-20020a056830092800b0055591caa9c6so514843ott.4
        for <linux-clk@vger.kernel.org>; Tue, 09 Nov 2021 12:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mcjMHcwYzwBgvUlsJJw9+Jv9JVC62owaRPJ/yUM6y5U=;
        b=OweV8gSNpr/wemLfT5r5RqLdeNQQkyD/5uhlgtWeguJV2kW4kusfjz5uEepsm35Uhz
         zxR38DUI8/IDIgxkpQz0Tr9dwCnxanyqiqv/JOp8GMlFop+gP+rMEs9Mhbm8m9bOx212
         6oyJhJb6BNDTip5qNk1mjb8MZbGv7koOtqGXg1JXtimY92OdEVIub6loTlg0f4f4g9Mp
         U9khgkYKVjZK/5/igWUFPJBklDaIWAgtGhHPLcTG0hS0KLbmatF62yQe54EL0uzApfg7
         x8JIp4TmUBJP4w/9BfWDl1KDTkR5EAu60nNT8PYwktSPJrYlp4yUEqClTkbZC2OlPz8j
         yE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mcjMHcwYzwBgvUlsJJw9+Jv9JVC62owaRPJ/yUM6y5U=;
        b=2yIBGID2GBDr8yy8B0/BHG75Ax/TN/ykq8e5woR+MFFKDjj1MgBuXD3vDom7B05LEv
         /mwbIPoD7uGy6mxEEYtplYuz5XcsFKECjrTXsI8JvcnoM4H7Ka9aAgGTq3LSdnhqAhEg
         L99Nd4TJ5S+F137tUIXUT2H6QmPy6kzsVVVOyIBySmoZ3Qm81se6g5MU1tpnIZ7jbEBt
         X3mCDDliIfwhTMzKkREqhlyi7KscW8DtwKU61LGim4dWkl4qT6HbwkGWUaeqXIsL02YL
         iJgOuT1b4107o35VJx82cR45rfsj8gLRNdgLhxMotqjIPUTo0khN9sad21r4UJvgvxc7
         P/Hg==
X-Gm-Message-State: AOAM532z1F3HAu2fl2YWPkN4xP6OcJVZR6hkWph1k36tdfonA74C2LFv
        Wcb7VFaXx/3QnHjAc9ZUij1xreTB+/1Kop6Mrd0j7A==
X-Google-Smtp-Source: ABdhPJx79vAz5xo21O8AcZjHZ2iz/cgsFzrU7PqDL77Snjbftb5loWoN2JiL02a01H3N9KzF4bFY81wiDaHO8sIEFIQ=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr8156814otj.35.1636489774773;
 Tue, 09 Nov 2021 12:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
 <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
 <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com> <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
In-Reply-To: <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 21:29:22 +0100
Message-ID: <CACRpkda7b+j1=X9rUrqwEFhxvp2zVTvFkxanjh3hL7AksqCX1g@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 9, 2021 at 10:40 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 9 Nov 2021 at 10:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> > > The order the different states are blinked depends entirely on
> > > how the pinctrl framework parses the device tree. I still think it
> > > would be more natural to cleanly go to the end result without this
> > > blinking.
>
> Hmm.. but if going through the different states is what you want, then
> wouldn't you need the device tree to have an ordered list of the
> states rather than just a single node and also a way to tune how long
> time the different states are blinked?

In a way you are correct that the DT is a functional language and it's
a bit lite a style sheet or prolog or something in that the end reduction
is what counts.

In this case, I would say something is weird if there are interim states,
the yaml validation should not allow you to set the same thing back
and forth in your DTS file.

Alas we are not perfect as in yaml validation isn't perfect either.
I can't see what the problem is really, just write proper DTS files
and there will not be any interim states, right? And if it is possible
to write DTS files that have states and sequence requirements,
these should be caught in validation. Should be.

Yours,
Linus Walleij
