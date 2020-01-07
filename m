Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5670713236D
	for <lists+linux-clk@lfdr.de>; Tue,  7 Jan 2020 11:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbgAGKUX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 7 Jan 2020 05:20:23 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34800 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbgAGKUX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jan 2020 05:20:23 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so30317933lfc.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Jan 2020 02:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eMXkNg8gjjjP4/UPSl/T3BVhY6m7trOu4dhjFlvWIdM=;
        b=xCw2aOcDbDhAosRUZpI6S8jMUrGPkDQqWqFwb5KY/DgItDqPB6ptgX5V8gs2yDC82+
         TQSjZ5E2cLNKjaz6JtEmt4T7mFfIrrPYNyrT3jiAN6/2Iyc2srA526cttuVeaA9GgZy7
         RsjrRB4c79+Wti1TvIpqtZa5J1rHZihfl2JV8GWrftEngwr59RFHWw/BAxyZc22OAW9/
         mAqEQpKUAtdMyffk8S0eL1YYz/+fwuQPZL+9BCsW8/zdkEbMRl8S/rExnFRhho40HLDS
         VkvUCyyWA7t7vhznmbNtN4ENfD3DyIk0oCQtLNU+auQQZHfpdNT541zidQxXe0Qz4M0T
         FgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eMXkNg8gjjjP4/UPSl/T3BVhY6m7trOu4dhjFlvWIdM=;
        b=eB9ZbF10ONGF1Dj9CMViZqDsslMJW+mTwnX0zypmXhTPUWbvwmQsyjeuOEqWAEVKVb
         ekaxp3d8XPXOXtWP3yIhSpS9N+wsp9iRd1Q2Ev3tK7rfC2aMOIhe0RNwfqTfmc0vtwHL
         TzqOU3Aq/ICy612D/MycDV9N6Un5e6EmpD192OT0nQJZKoNYQV/a3N6Nmu29RsliwWn2
         bfpw4tnhzW2An3Ki+9AC3+8cyLxa8/XPyzHg/4g0UglU1XZ2OD5m377pdHaLPsSbeaAe
         CXqco8lBc9ARZydilVb0ushArrEvomn5ov2SEV6tcSzXaazSPglp9UWEOsVPI42+XVQG
         4wKw==
X-Gm-Message-State: APjAAAUsn3677/43zOHrqgwrNEpAs3XBPaFnQMMQAzK6yzHX1cVSU3f6
        TnUm+SP2pycUeOUs/GJGlCNHEHO9DXfJJrk2cvUQIQ==
X-Google-Smtp-Source: APXvYqx+1HVleR9t6Yuyooq8t8xa7rjXdvZgR0S/2R2tmpjcPZ3EC1OYv8foVlifSxaWiiQHWGnQCar3duKMNpwhtnc=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr58557682lfg.117.1578392421291;
 Tue, 07 Jan 2020 02:20:21 -0800 (PST)
MIME-Version: 1.0
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
 <1566206502-4347-6-git-send-email-mars.cheng@mediatek.com>
 <CACRpkdZa_sQgvWC3ic0NxrVi9gS1cNTsV-wa-SDpA0e5kutBRw@mail.gmail.com> <1577022724.7468.20.camel@mtkswgap22>
In-Reply-To: <1577022724.7468.20.camel@mtkswgap22>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:20:10 +0100
Message-ID: <CACRpkdZUxpQ1tS9mKG9tc_U==M2BL9HwXt3DS1t413GGSEaVTA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Mars Cheng <mars.cheng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
        mtk01761 <wendell.lin@mediatek.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Dec 23, 2019 at 4:11 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
> On Fri, 2019-08-23 at 10:57 +0200, Linus Walleij wrote:
> > On Mon, Aug 19, 2019 at 11:22 AM Mars Cheng <mars.cheng@mediatek.com> wrote:

> > This does not explain what a "virtual GPIO" is in this
> > context, so please elaborate. What is this? Why does
> > it exist? What is it used for?
> >
> > GPIO is "general purpose input/output" and it is a
> > pretty rubbery category already as it is, so we need
> > to define our terms pretty strictly.
> >
> Virtual GPIO only used inside SOC and not being exported to outside SOC
> in MTK platform. Some modules use virtual GPIO as eint (e.g. pmic or
> usb).

I would call that internal GPIOs, those are very real rails inside
the chip made with polysilicone so there is nothing "virtual"
about them. If the documentation for the chip calls them virtual
then explain in the driver that these are SoC-internal
lines so that everyone will get it.

Is the PMIC inside the SoC? I thought that was usually outside of it
in its own chip.

But I suppose there could be some interface to it in the SoC and
then that interface has this EINT?

> In MTK platform, external interrupt (EINT) and GPIO is 1-1 mapping and
> we can set GPIO as eint.
> But some modules use specific eint which doesn't have real GPIO pin.
> So we use virtual GPIO to map it.

OK I get it I think... just put these comments into the code as well
so we understand when reading the code what is going on.

> > > +       if (mtk_is_virt_gpio(hw, gpio))
> > > +               return 1;
> >
> > Why are "virtual GPIOs" always inputs?
>
> We set virtual GPIO as eint.
> It mean virtual GPIO only used inside SOC and not being exported to
> outside SOC.

Are you saying that:
- "Virtual" GPIOs are always and only used for interrupts
- Since they are only used for interrupts, they are always inputs

Then write that in a comment to the above change so we know
this context.

Yours,
Linus Walleij
