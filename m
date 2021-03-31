Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854A934AA60
	for <lists+linux-clk@lfdr.de>; Fri, 26 Mar 2021 15:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhCZOoz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 26 Mar 2021 10:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbhCZOou (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Mar 2021 10:44:50 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0906BC0613B3
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 07:44:50 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id l18so6588831edc.9
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rIvv+tA1LMtQGGiDuq1c1q8EFA36Pgjy5WH53f7HNx4=;
        b=iYunu1vYc+nYwytgwT0664RyXaLgIIwSfKZuAagqasIYu9jy9foMpyWg8GYSfAPoSl
         7gXmommvATo5YilSMCWKppg6LleO/43CCNHA5B/ru6Jk9NMhwzLrSDFzr+PaGarm07W7
         mBEkYdqmxjgNwwSk3y9oMCN94y3a4cOYuEb01nuzMH/0mqtLNYzzrVRIT/+ZbQBty8W9
         DoeDDyGU2UhxKa2OOCRbp8rXwfrOEd5I+reszDYXU/CDUOhm55Da+3J7D9UXrfsMjDCR
         LtmDAYZ2TfiSrOTrb9+jife+nA0bQs7GxtgJWytM/0bTimRuWkn57mcH3yp8a70YHvQP
         WdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIvv+tA1LMtQGGiDuq1c1q8EFA36Pgjy5WH53f7HNx4=;
        b=ufuVDn5WVCn7TbT/D7Vwdb4Ov/07xgQVpqjQ1xTFW8rL6D4u+udQb5dhXyZz8yLmSt
         W9L1FTIZy8dff3JcTVBXGlMDbWchAe8Ye2PX6xY2TNFvCVlhSXAhydyyW+pvPe/Y8qT5
         KqCtZME9rKGIXbgcaX56ZpGrZRC9PA7sK+xHJaSpO/f3rXfcCfsXreyrgnHj/XJNdixN
         J65Yxx2/dtAihCeAhynMzRe/Vftm4mMlQ3+OUKg3RfrJPsSWFCoDiG2dBgEXtUG3yYY+
         LMnQxnyI0n1oV+s0vIIYjdPOTs3qI3rMsJ5dnfkw+hV8sEvWAynZAOU9/LBJLM9y88h8
         lpHA==
X-Gm-Message-State: AOAM530565Xna2sUyz0Ua4zCFbxB5Q/Gvtf+WCQd17nIcOMw/XbyZ9qC
        WANZrBpFOqWN0Mk86DIQOLATKyVU1WmFGuMD31u3og==
X-Google-Smtp-Source: ABdhPJyu4ZYMKthWiIfIsLH5cJYN/YmYPXtv3Hl6Hl6YxrLqty3+4cM/fQnPI6E5xbB/otdrwsE35jlQjEFjqhXSpzo=
X-Received: by 2002:a05:6402:17d6:: with SMTP id s22mr15385463edy.232.1616769888652;
 Fri, 26 Mar 2021 07:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <50f72f1f7f28e969a1e0353712fcc530bce9dd06.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <CAMpxmJVjnAMig16qWkjpaHwQ+4Ld9yEc-gg-CGv28QQYBB6gNg@mail.gmail.com> <afaff71f75cd476c828671779acd1a3f8b66b62c.camel@fi.rohmeurope.com>
In-Reply-To: <afaff71f75cd476c828671779acd1a3f8b66b62c.camel@fi.rohmeurope.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 26 Mar 2021 15:44:38 +0100
Message-ID: <CAMpxmJXe9EVaDooPYphRV_500Dd9fU7WQHAFFL_-2-usxZG9kA@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] gpio: support ROHM BD71815 GPOs
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 23, 2021 at 10:57 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
>
> On Tue, 2021-01-19 at 12:07 +0100, Bartosz Golaszewski wrote:
> > On Tue, Jan 19, 2021 at 8:23 AM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > Support GPO(s) found from ROHM BD71815 power management IC. The IC
> > > has two
> > > GPO pins but only one is properly documented in data-sheet. The
> > > driver
> > > exposes by default only the documented GPO. The second GPO is
> > > connected to
> > > E5 pin and is marked as GND in data-sheet. Control for this
> > > undocumented
> > > pin can be enabled using a special DT property.
> > >
> > > This driver is derived from work by Peter Yang <
> > > yanglsh@embest-tech.com>
> > > although not so much of original is left.
> > >
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> >
> > Hi Matti,
> >
> > looks great, just a couple nits.
>
> Hello Bartosz,
>
> I think fixed all the nits to v3. Can I translate this to an ack? (I
> will respin the series as I guess the regulator part may have fallen
> through the cracks so I'd like to add the relevant acks :] )
>
> Best Regards
>         Matti Vaittinen

Yes:

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
