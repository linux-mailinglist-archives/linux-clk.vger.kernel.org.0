Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9623DEC63
	for <lists+linux-clk@lfdr.de>; Tue,  3 Aug 2021 13:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235822AbhHCLlo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 3 Aug 2021 07:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235745AbhHCLlj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Aug 2021 07:41:39 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529AAC06175F
        for <linux-clk@vger.kernel.org>; Tue,  3 Aug 2021 04:41:28 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id j15so8066313uaa.5
        for <linux-clk@vger.kernel.org>; Tue, 03 Aug 2021 04:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q9weUQNZb8zSNK5Fi3st7B7Mx/yd5pLorJlvNfQAB7M=;
        b=kfcBVwLo2v4t80n4OumhhW192grQ72/pi1j+v0NLCEfgB2B7gJ5T9Az1FmJquZjew+
         pV28mDG/VvEawMLGiiyTlwSYOpy4tuqlTl0HdBcu/rJlfa2S6EkvhYc9Gzp+5ly2XoMA
         JmTF+5CQu64TXVH5tUYJTSG/JR3Y/SZutL+lx90PjFoWTf5hBfWsz/Szga2pgnAGiZnr
         sPZX1K4poC/VjFsxpeM5+nic+zPT9zJwux1h+BGJA5K8BL6/6Zh77XjkUnLJYtocjyeK
         9zwoiTXM6DVIqKTxJwvhgIZGQNPFBomEZ57Cjfd/vhcTWVXvqrmhZQBBHonRj5c9Unfi
         KjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q9weUQNZb8zSNK5Fi3st7B7Mx/yd5pLorJlvNfQAB7M=;
        b=CtlHBe+/L32PC5QQu75W6uhiJ4dYpkbAZDQ6jddiR9kBeapSi6wVtZJUKjMU1raKju
         tXsGaMwqFH8AG9JuzYyF4uuUt86oguoG8g4MygbDcowt/rHZomPd/lk3gbkbODHA/AZw
         Z3JTrD+Bq5/J68J2hHzDkBvVjzI0s4VcgHUNoFuxqjV/wJIbnu+WUq8pZqJzi1v11wKW
         EHKiYLd2AYQn9z9ySmSeyvPogvqm9i1YKS3fYjZI7juqR/3r4uhcLVQ7MAY6JqMbeBeh
         bc8VkC4C1S19OtsUM8UiMQzTfl489ykFLHv5f6TE4JWAtST2Tik0AKWdhtKJH1hUa/ih
         cHaQ==
X-Gm-Message-State: AOAM530LQ9i8UhsCfH87hb8/LSrCKo6yaNMPvLrpC8cbueiHy2+GL+Ep
        rKlkly0jIzuQHIQ3jNgYWVS612p301581HGvkt9a2A==
X-Google-Smtp-Source: ABdhPJyMm8jbzan+OPnDFk8P5ouN4DVyswFjAchUVuSljur2ivO50vwXOgB9rQG9t/IlQF5od7rElB1Vo73792CVc80=
X-Received: by 2002:ab0:4e22:: with SMTP id g34mr14114826uah.17.1627990887450;
 Tue, 03 Aug 2021 04:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-5-semen.protsenko@linaro.org> <a1701931-136e-235c-8392-a3f64c050d74@canonical.com>
 <CAPLW+4mMCzzyqqJTse-UEpjQoVu1b-9Xz3_3L=nmg63uKYFnGw@mail.gmail.com> <7364ccb2-70da-6400-ae6d-6a30171b6678@canonical.com>
In-Reply-To: <7364ccb2-70da-6400-ae6d-6a30171b6678@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 3 Aug 2021 14:41:15 +0300
Message-ID: <CAPLW+4m=rAAcRuRp7oC4_opjPpM=eVyeBipbaC+V=wtjErWxUQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] tty: serial: samsung: Init USI to keep clocks running
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 3 Aug 2021 at 10:37, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 03/08/2021 01:06, Sam Protsenko wrote:
>
> (...)
>
> >>> diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
> >>> index f6c3323fc4c5..013c2646863e 100644
> >>> --- a/include/linux/serial_s3c.h
> >>> +++ b/include/linux/serial_s3c.h
> >>> @@ -28,6 +28,15 @@
> >>>  #define S3C2410_UFSTAT         (0x18)
> >>>  #define S3C2410_UMSTAT         (0x1C)
> >>>
> >>> +/* USI Control Register offset */
> >>> +#define USI_CON                      (0xC4)
> >>> +/* USI Option Register offset */
> >>> +#define USI_OPTION           (0xC8)
> >>> +/* USI_CON[0] = 0b0: clear USI global software reset (Active High) */
> >>> +#define USI_RESET            (0<<0)
> >>
> >> Just 0x0. I understand you wanted to hint it is a bit field, but the
> >> shift of 0 actually creates more questions.
> >>
> >
> > After some consideration I decided to adhere to existing style and do
> > something like this (in v2):
> >
> > 8<--------------------------------------------------------------------->8
> > #define USI_CON          (0xC4)
> > #define USI_OPTION      (0xC8)
> >
> > #define USI_CON_RESET_CLEAR        (0<<0)
> > #define USI_CON_RESET_SET        (1<<0)
> > #define USI_CON_RESET_MASK        (1<<0)
> >
> > #define USI_OPTION_HWACG_CLKREQ_ON    (1<<1)
> > #define USI_OPTION_HWACG_CLKSTOP_ON    (1<<2)
> > #define USI_OPTION_HWACG_MASK        (3<<1)
> > 8<--------------------------------------------------------------------->8
> >
> > The whole reason for those comments was missing public TRM. But in the
> > end I decided it just looks ugly. Also, this way I can do RMW
> > operation (discussed above) in more logical way.
> >
> > Please let me know if code snippets above look good to you.
>
> Please skip the USI_CON_RESET_CLEAR. There is no such pattern in the
> code. Clearing bit is an obvious operation and such code is already
> everywhere:
>     val &= ~USI_CON_RESET
>
> (or &= ~USI_RESET_MASK)
>
> Therefore for USI_CON_RESET only:
>     #define USI_CON_RESET             (1<<0)
>     #define USI_CON_RESET_MASK        (1<<0)
>

Sure, I'll make it so.

>
> Best regards,
> Krzysztof
