Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800A148E7C5
	for <lists+linux-clk@lfdr.de>; Fri, 14 Jan 2022 10:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239643AbiANJpn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 14 Jan 2022 04:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiANJpn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jan 2022 04:45:43 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA116C061574
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 01:45:42 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x11so2715079lfa.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 01:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a2l4P3W9CR1K5J7PLgT36ikvS9uajSneo1Al15/HZQE=;
        b=NgmfhEAmXOMsqouy0HSBgQ3YuAQ2rSrDkv38pmVF8kI6Gpwm5t5rVewcE3DPAShTLp
         XWiSy72FN6zqH+COip7WdnQsUw/i8wAQDuO48Rg4otjy5v9GpzwfJoFm2v3wTh5CECMf
         zxcOrY2KpSqoe/h/uo4s0x4F8UhTuY+le6/phFzjofWWcUJncB40kJFp6OcMuD+CmF1s
         yvShFAFHz2D/qX9lQsyX7IgffyDENHoxv6Vj9IDSip0S3/HNX4LC6cTOZoWRfqsSM/mo
         lYa/O7EFKHu5T8QbqNmkPaTMBRskgtZTGN7Mf/bHzcCQK4f+FYY6MSZUsHYegkaRRg7S
         3aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a2l4P3W9CR1K5J7PLgT36ikvS9uajSneo1Al15/HZQE=;
        b=zRcSIR3deACOtIza3WIHu7lETEwlfEeS/4pzufz+xQVvMLuAE3mJQDs7bkfkn0xhyL
         KFn82CFiaLSYDEyf9XnIO+8uqLerBSKHvsVFkJEFZ8PlXt7Cw47/2j7DALLERRbkt8PO
         kXi9ZO7EmcS1gThWXgoTZqGcoSDE/fERrJRnFjsneEvyOATOecnOIdCm7cXOv7vd8JPK
         86PwSRI3kykYShrMLXQJlNSOBKKlWqbnWXcg1jlWp8i3WF81Vk1XaAEjL8NR8ECmvHsV
         GY/mCd67pycAVY3M47B2CuUA4fyVVzOkClXuvZnMwgK4cCf6GzLqV6JMBFTJE2LBwytQ
         eh3A==
X-Gm-Message-State: AOAM530EgYHibSyQKPiQYborhV7fUnLOrDnDQTXkzy3e45wZMIWGT+Zw
        cxvvukY6DN9HKF78TT5ileibhj6dGmNTMLuB7FDjR1NvU6jqTg==
X-Google-Smtp-Source: ABdhPJzbOWlJcwWDSW51HmnDZKd1o967Hg5oPhByByXADHBFLjzpOkO6wiwcF4CMlmG+WJpdL/1zOty2qTtVYweDJp8=
X-Received: by 2002:a05:6512:280c:: with SMTP id cf12mr6450814lfb.5.1642153540785;
 Fri, 14 Jan 2022 01:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20220107090715.2601-1-zong.li@sifive.com> <YdwBWmF8OJYab7qS@google.com>
 <CANXhq0ookagQTZZrNduP5DjXs2awQdRkUxNzTWU=-dz+TVuUwg@mail.gmail.com>
 <Yd1OvFZ4pKw+aTgv@google.com> <CANXhq0oK-NewS9mn-b4a60D7t+fMSbT6=Mnw7st_njxGY1DJCg@mail.gmail.com>
 <Yd6a3Gnmv2ox+Sec@google.com> <CANXhq0oTyHGOUTgLk2HWpSYurUKuz5SvuaF6C5xKjn5Frswayw@mail.gmail.com>
 <YeBftQu9YgfFelmw@google.com> <F0F4C6FB-2340-4ED1-921A-800795B298E7@jrtc27.com>
 <YeBr45vcM6woAKlc@google.com>
In-Reply-To: <YeBr45vcM6woAKlc@google.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Fri, 14 Jan 2022 17:45:28 +0800
Message-ID: <CANXhq0r1LO1--C7DOzTT5q-1PoALq0G_-itOjcMfM0VjC_T9eg@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Jessica Clarke <jrtc27@jrtc27.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jan 14, 2022 at 2:13 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 13 Jan 2022, Jessica Clarke wrote:
>
> > On 13 Jan 2022, at 17:21, Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Thu, 13 Jan 2022, Zong Li wrote:
> > >
> > >> On Wed, Jan 12, 2022 at 5:09 PM Lee Jones <lee.jones@linaro.org> wro=
te:
> > >>>
> > >>> On Wed, 12 Jan 2022, Zong Li wrote:
> > >>>
> > >>>> On Tue, Jan 11, 2022 at 5:32 PM Lee Jones <lee.jones@linaro.org> w=
rote:
> > >>>>>
> > >>>>> On Tue, 11 Jan 2022, Zong Li wrote:
> > >>>>>
> > >>>>>> On Mon, Jan 10, 2022 at 5:50 PM Lee Jones <lee.jones@linaro.org>=
 wrote:
> > >>>>>>>
> > >>>>>>> Please improve the subject line.
> > >>>>>>>
> > >>>>>>> If this is a straight revert, the subject line should reflect t=
hat.
> > >>>>>>>
> > >>>>>>> If not, you need to give us specific information regarding the =
purpose
> > >>>>>>> of this patch.  Please read the Git log for better, more forthc=
oming
> > >>>>>>> examples.
> > >>>>>>>
> > >>>>>>
> > >>>>>> It seems to me that this patch is not a straight revert, it prov=
ides
> > >>>>>> another way to fix the original build warnings, just like
> > >>>>>> '487dc7bb6a0c' tried to do. I guess the commit message has descr=
ibed
> > >>>>>> what the original warnings is and what the root cause is, it als=
o
> > >>>>>> mentioned what is changed in this patch. I'm a bit confused whet=
her we
> > >>>>>> need to add fixes tag, it looks like that it might cause some
> > >>>>>> misunderstanding?
> > >>>>>
> > >>>>> I think it's the patch description and subject that is causing th=
e
> > >>>>> misunderstanding.
> > >>>>>
> > >>>>
> > >>>> Yes, the subject should be made better.
> > >>>>
> > >>>>> Please help me with a couple of points and I'll help you draft
> > >>>>> something up.
> > >>>>>
> > >>>>> Firstly, what alerted you to the problem you're attempting to sol=
ve?
> > >>>>>
> > >>>>
> > >>>> I recently noticed the code was changed, I guess that I was missin=
g
> > >>>> something there. After tracking the log, I found that there is a b=
uild
> > >>>> warning in the original implementation, and it was already fixed, =
but
> > >>>> it seems to me that there are still some situations there, please =
help
> > >>>> me to see the following illustration.
> > >>>>
> > >>>>>>>> --- a/drivers/clk/sifive/fu540-prci.c
> > >>>>>>>> +++ b/drivers/clk/sifive/fu540-prci.c
> > >>>>>>>> @@ -20,7 +20,6 @@
> > >>>>>>>>
> > >>>>>>>> #include <dt-bindings/clock/sifive-fu540-prci.h>
> > >>>>>>>>
> > >>>>>>>> -#include "fu540-prci.h"
> > >>>>>
> > >>>>> How is this related to the issue/patch?
> > >>>>>
> > >>>>
> > >>>> Let's go back to the version without '487dc7bb6a0c' fix. The
> > >>>> prci_clk_fu540 variable is defined in sifive-fu540-prci.h header,
> > >>>> however, fu540-prci.c includes this header but doesn't use this
> > >>>> variable, so the warnings happen.
> > >>>>
> > >>>> The easiest way to do it is just removing this line, then the warn=
ing
> > >>>> could be fixed. But as the '487dc7bb6a0c' or this patch does, the =
code
> > >>>> should be improved, the prci_clk_fu540 variable shouldn't be defin=
ed
> > >>>> in the header, it should be moved somewhere.
> > >>>>
> > >>>>>>>> +struct prci_clk_desc prci_clk_fu540 =3D {
> > >>>>>>>> +     .clks =3D __prci_init_clocks_fu540,
> > >>>>>>>> +     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu540),
> > >>>>>>>> +};
> > >>>>>
> > >>>>>>>> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sif=
ive/fu540-prci.h
> > >>>>>>>> index c220677dc010..931d6cad8c1c 100644
> > >>>>>>>> --- a/drivers/clk/sifive/fu540-prci.h
> > >>>>>>>> +++ b/drivers/clk/sifive/fu540-prci.h
> > >>>>>>>> @@ -7,10 +7,6 @@
> > >>>>>>>> +extern struct prci_clk_desc prci_clk_fu540;
> > >>>>>
> > >>>>>>>> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/si=
five/sifive-prci.c
> > >>>>>>>> index 80a288c59e56..916d2fc28b9c 100644
> > >>>>>>>> --- a/drivers/clk/sifive/sifive-prci.c
> > >>>>>>>> +++ b/drivers/clk/sifive/sifive-prci.c
> > >>>>>>>> @@ -12,11 +12,6 @@
> > >>>>>>>> #include "fu540-prci.h"
> > >>>>>>>> #include "fu740-prci.h"
> > >>>>>>>>
> > >>>>>>>> -static const struct prci_clk_desc prci_clk_fu540 =3D {
> > >>>>>>>> -     .clks =3D __prci_init_clocks_fu540,
> > >>>>>>>> -     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu540),
> > >>>>>>>> -};
> > >>>>>>>> -
> > >>>>>
> > >>>>> I'm not sure if it's you or I that is missing the point here, but
> > >>>>> prci_clk_fu540 is used within *this* file itself:
> > >>>>>
> > >>>>
> > >>>> Here is another situation I mentioned at the beginning, if we'd li=
ke
> > >>>> to put prci_clk_fu540 here, prci_clk_fu740 should be put here as w=
ell.
> > >>>> I guess you didn't do that because there is a bug in the original
> > >>>> code, fu740-prci.c misused the fu540-prci.h, so there is no build
> > >>>> warning on fu740. FU740 still works correctly by misusing the
> > >>>> fu540-prci.h header because fu740-prci.c doesn't actually use the
> > >>>> prci_clk_fu740 variable, like fu540 we talked about earlier.
> > >>>>
> > >>>>> static const struct of_device_id sifive_prci_of_match[] =3D {
> > >>>>>         {.compatible =3D "sifive,fu540-c000-prci", .data =3D &prc=
i_clk_fu540},
> > >>>>>         {.compatible =3D "sifive,fu740-c000-prci", .data =3D &prc=
i_clk_fu740},
> > >>>>>         {}
> > >>>>> };
> > >>>>>
> > >>>>> So why are you moving it out to somewhere it is *not* used and ma=
king
> > >>>>> it an extern?  This sounds like the opposite to what you'd want?
> > >>>>
> > >>>> The idea is that sifive-prci.c is the core and common part of PRCI=
,
> > >>>> and I'd like to separate the SoCs-dependent part into SoCs-depende=
nt
> > >>>> files, such as fu540-prci.c and fu740-prci.c. The goal is if we ad=
d
> > >>>> new SoCs in the future, we can just put the SoCs-dependent data
> > >>>> structure in the new C file, and do as minimum modification as
> > >>>> possible in the core file (i.e. sifive-prci.c). It might also help=
 us
> > >>>> to see all SoCs-dependent data in one file, then we don't need to
> > >>>> cross many files. Putting these two variables in sifive-pric.c is =
the
> > >>>> right thing to do, but that is why I separate them and make them
> > >>>> extern in this patch.
> > >>>
> > >>> I can see what you are doing, but I don't think this is the right
> > >>> thing to do.  Please put the struct in the same location as it's
> > >>> referenced.
> > >>
> > >> If we decide to move them into sifive-prci.c (i.e. put it in where
> > >> it's referenced.), I worried that we might need to move all stuff
> > >> which are in fu540-prci.c and fu740-prci.c. Because 'prci_clk_fu540'
> > >> is referenced in sifive-prci.c, whereas '__prci_init_clocks_fu540' i=
s
> > >> used by 'prci_clk_fu540', and the almost things in fu540-prci.c are
> > >> used by '__prci_init_clocks_fu540'. It seems to be a little bit
> > >> difficult to clearly decouple it for modularization which I want to
> > >> do. What this patch does might be a accepted way, I hope that you ca=
n
> > >> consider it again.
> > >>
> > >>>
> > >>> And yes that should also be the case for prci_clk_fu740 and yes, it
> > >>> was over-looked because it wasn't causing warnings at build time fo=
r
> > >>> whatever reason.
> > >>>
> > >>> IMHO, placing 'struct of_device_id' match tables in headers is also
> > >>> odd and is likely the real cause of this strange situation.
> > >>
> > >> I couldn't see what are you pointing, do you mind give more details
> > >> about it? It seems to me that the match table is put in C file (i.e.
> > >> sifive-prci.c).
> > >
> > > Oh, sorry, it's a common source file, rather than a header.
> > >
> > > Okay, so I went and actually looked at the code this time.
> > >
> > > If I were you I would move all of the device specific structs and
> > > tables into the device specific header files, then delete the device
> > > specific source (C) files entirely.
> > >
> > > There seems to be no good reason for carrying a common source file as
> > > well as a source file AND header file for each supported device.
> > > IMHO, that's over-complicating things for no apparent gain.
> >
> > The reason it exists the way it does is that the driver uses the header
> > files shipped and used for the device tree bindings, and they give the
> > same names to different constants (the first three constants are in
> > fact the same so don=E2=80=99t clash, but PRCI_CLK_TLCLK is different b=
etween
> > the two), so can=E2=80=99t both be in the same translation unit (at lea=
st not
> > without some gross #undef=E2=80=99ing). In FreeBSD I took the alternate
> > approach of just defining our own FU540_ and FU740_ namespaced copies
> > of the constants, as drivers do for most things anyway.
>
> That's a sensible approach.
>
> One which we use in Linux extensively.

Thanks all for the review and suggestions, it is great to me to move
all stuff into the specific headers, I only have one question there,
is it ok to put the definition of those data structures in header
files? That is one of the changes we had done in v2 patch. If it's
good to you, I will do it in the next version. Thanks.

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Principal Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
