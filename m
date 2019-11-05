Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0C8EFE48
	for <lists+linux-clk@lfdr.de>; Tue,  5 Nov 2019 14:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389078AbfKENYc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 5 Nov 2019 08:24:32 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33478 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389080AbfKENYb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Nov 2019 08:24:31 -0500
Received: by mail-lf1-f65.google.com with SMTP id y127so15108918lfc.0
        for <linux-clk@vger.kernel.org>; Tue, 05 Nov 2019 05:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OriTvqKjGZz26vq3sX+0nz0hNVWCQx915SM+y16L4zI=;
        b=mmSF+IAUX1udzNA10gxQDs4IVguwwokEurVOW3StfXUANAJNYQv4/+zWORcXWFMJz6
         m8BMOmIIg6IdlyXqx/JOil3Nbe1GQJOjv3TKF4sU9Y8IhkaCAxvvuN9OIs6XmIOXlhaV
         3yDCu8ShhTKAlUTHth4u2KT53qkmJ5SC02XPDZHD1F7NmyWDtGHSU+gmVOKet8p9J0tg
         tOUcealyAZisw9u0YxSTwLwJi9mNZL5v3AiyePab1IAJp9k9ulTtGJUtUmXfCzS/M3vK
         ttjdpKUqRtjmkL88v5AmTh1EY7ErppJQbMgbmt1rENGRy7NzGgSd1ie29VbCA1Ll9hDA
         riGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OriTvqKjGZz26vq3sX+0nz0hNVWCQx915SM+y16L4zI=;
        b=oTYzNPnx+RD+YUeUpWW3wEWd+KEgYwMefRx4Z1V+HTIYH/ZYSUZ2STUzlg4ASArDQy
         +wIfMN6IH093MSJFHUMeRBfMJpUfstC+CqABeTMcIZ2oELk9S0XhP3RS7BK9t9t43y5W
         gdRSPEag4RL5cxkN9t3yFgdDhJQB1r0jbyH3KBkFGGY4h2AskaU6y21MJb4OmPqsf97H
         UcUiA+1xJ0PW3fQBkf+bODcycfRYXq8r7FmOp0W7Wc1ntQI4kPqwdnbvlRYx1lsOBH0h
         CYRgGQtB1mCZlwW+T3ml8FzRv2wvMfqT5iNaCk38DbAefULx1CaYmD221iWApCi4wDjO
         ZxKw==
X-Gm-Message-State: APjAAAX0EDaTTP3qySUGDJrKvxlptgN/kYXMudYMfbhVeXuFCJBA9TAX
        a+y8xetmMSjMXVh70bddWZi6Ap+LLJcCL+pgYrFNiw==
X-Google-Smtp-Source: APXvYqzoypaV1FwIebV/f2TxtU2nRgrE/Ebq2efFlxTgxI/d4F0Qe39na0QD1eDLDWhk898Dgs+NBvY32AC34gSuqMc=
X-Received: by 2002:ac2:5295:: with SMTP id q21mr20306882lfm.93.1572960267714;
 Tue, 05 Nov 2019 05:24:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <2a8fa03308b08b2a15019d9b457d9bff7aafce94.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <CACRpkdZYw3QQcQ4h5y_C0UD6+4Wz9AdmQ0qSrrjfUweuJj8hyQ@mail.gmail.com> <1550472ac1e105bd38da25803358cfbc0404bf38.camel@fi.rohmeurope.com>
In-Reply-To: <1550472ac1e105bd38da25803358cfbc0404bf38.camel@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 14:24:15 +0100
Message-ID: <CACRpkdYkgEg=4H9tQQrVcvx1xtETYD_cHxhqd-BW6g67jpEeEg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 10/15] regulator: bd71828: Add GPIO based run-level
 control for regulators
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Nov 4, 2019 at 8:05 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Sun, 2019-11-03 at 23:27 +0100, Linus Walleij wrote:

> > I do not understand the regulator parts of the patch.
>
> I'm sorry. The patch is not clearest one what comes to the regulator
> stuff. I can try splitting it to smaller and more logical changes if
> you, Mark or other interested people hope to get it splitted. Or
> perhaps it would be simplest to review if it was all in one patch?

As long as the regulator experts are happy with the format,
stay with that. I am just a drive-by coder when it comes to regulators.

Yours,
Linus Walleij
