Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A195D438C88
	for <lists+linux-clk@lfdr.de>; Mon, 25 Oct 2021 01:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbhJXXXo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 24 Oct 2021 19:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbhJXXXn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 24 Oct 2021 19:23:43 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60434C061764
        for <linux-clk@vger.kernel.org>; Sun, 24 Oct 2021 16:21:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bi35so727337lfb.9
        for <linux-clk@vger.kernel.org>; Sun, 24 Oct 2021 16:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=37EfsXc0CKwE4ZomaFAm5bDGDVpfUse9rWaVkk06N8E=;
        b=Px9mnr8zu/GzkthMts8NBbM+JmIYRKGyGjWgEap1za4p7rEDWi6W/DG3UrzrCTJFKV
         WqmW/3GFDsa/3iU950oJlL8CTgo0EG/MrAzum/4+z4tZx/tdqjv6kRLmNz9nDLNSXhMR
         /nessPAQsKXBUkI0XcT9jXDGqZ+MU/6tBB22oo5HzVdYqfZTvl4rDS4gw/IIoHX3gQZa
         55+L7DDFyLQkp1CLe6cR3Ej2GdDpAIYZxQ2glhT1Zlf8D/9rAU+MhAnxgNqGnBXD6VMZ
         ebibQ4JXFr+X0vg1aG/mTYEj11l3kRs5EaWR+o5QfKuV03Of8td6eRncs9IHIen//ec1
         TBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=37EfsXc0CKwE4ZomaFAm5bDGDVpfUse9rWaVkk06N8E=;
        b=GdmZV+wvLgTBzPYZarf3oyBpGao13dDzTa+ACbuXXl7XBsRrsjEKTaHAGzsG9R88BV
         97X5JX98JzFnv70wNCEa6yrkaWbac0AwHndPr2QIm3kZQsYBbxjZnICMfnM9UXfwm/sh
         uHBUh03gvoUg65QxzwfinY/4b301FkOal18CicTDZNd52dfnIZrow0ai2OnuQq7eXc4z
         JIAJyrdj1bDEqm++k2ZxFjCv3VjVCHklqWEwQzMUrJFxUV+8QD0aPu26HpYRgWQau+2f
         GdDhn9JdvjMcYs9xqoqEKJXDMHzEIo8pJEguKmK9yGQiLQjs1+jmIp3x5KaWrd3h5mtE
         ZnOw==
X-Gm-Message-State: AOAM533Ngs35Iwz2cLZO5sRyOymRdEArMUohBh0QG8c7ltwD+XKOT/r+
        +Tmz+En19q8YWlsANBAFz/+4BkvbPO1kxadQxGhgVQ==
X-Google-Smtp-Source: ABdhPJzKZDyPRJjamiuqfOr8TePEjwRVAwoQEtUyaDMeYRh/KoV/hvptFO78qhdTpPRG1/6yoDMPCROqvbnR4g0v8Ls=
X-Received: by 2002:a19:6717:: with SMTP id b23mr8743261lfc.95.1635117680743;
 Sun, 24 Oct 2021 16:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210913192816.1225025-1-robh@kernel.org> <20210913192816.1225025-7-robh@kernel.org>
 <CAL_JsqJiH5ZDpFEC+A+S=EQ5Tp4T_YhFK4A44YEGUY_NW+88qw@mail.gmail.com>
In-Reply-To: <CAL_JsqJiH5ZDpFEC+A+S=EQ5Tp4T_YhFK4A44YEGUY_NW+88qw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Oct 2021 01:21:09 +0200
Message-ID: <CACRpkdaYGKv7cPUgQn8VmiMb9ftWygU187NoRACDP3VnMio+HA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] ARM: dts: arm: Update register-bit-led nodes 'reg'
 and node names
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Oct 21, 2021 at 11:16 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Sep 13, 2021 at 2:28 PM Rob Herring <robh@kernel.org> wrote:
> >
> > Add a 'reg' entry for register-bit-led nodes on the Arm Ltd platforms.
> > The 'reg' entry is the LED control register address. With this, the node
> > name can be updated to use a generic node name, 'led', and a
> > unit-address.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  arch/arm/boot/dts/arm-realview-eb.dtsi        | 27 +++++++++++++------
> >  arch/arm/boot/dts/arm-realview-pb1176.dts     | 27 +++++++++++++------
> >  arch/arm/boot/dts/arm-realview-pb11mp.dts     | 27 +++++++++++++------
> >  arch/arm/boot/dts/arm-realview-pbx.dtsi       | 27 +++++++++++++------
> >  arch/arm/boot/dts/integrator.dtsi             | 23 +++++++++++-----
> >  arch/arm/boot/dts/mps2.dtsi                   | 10 +++++--
> >  arch/arm/boot/dts/versatile-ab-ib2.dts        |  6 ++++-
> >  arch/arm/boot/dts/versatile-ab.dts            | 27 +++++++++++++------
> >  arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 27 +++++++++++++------
> >  9 files changed, 144 insertions(+), 57 deletions(-)
>
> Linus, Can you apply this and patch 7?

I signed them off and sent directly to the SoC tree mailalias.

Yours,
Linus Walleij
