Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D51111FFD2
	for <lists+linux-clk@lfdr.de>; Mon, 16 Dec 2019 09:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfLPIbh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Dec 2019 03:31:37 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:32798 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfLPIbg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Dec 2019 03:31:36 -0500
Received: by mail-ua1-f66.google.com with SMTP id v19so1788576uap.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2019 00:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rfvNJ6SwD135PnS64Nblsl7Xm55KVFsUpW1c0eS2aVY=;
        b=wOHPZF2+BYK6vzqlz1znc9EAj8uqLkELPngMwylGAxwnHWVHi5jDTQsS5EfDYt6Bqa
         V4ru3lw+J8heO3Q5g6OoS8A8ConuE4Ic3Lym6EkjxnEQ3Z9oY8AXSmMVRGHWNXBZVI2t
         /p4RShonvw73Ywu2BrVxv02T0FhA9iagfClQ10XNrKcMAYVoIyYj8vWu0h3p0mgQNX40
         MN7v6mUuqZLSHvblwbxzjcgQCNrsgg5oaCLfiGP6PvS2qJZGQFszpU8BS5wAjLraSRIu
         QuSxv1yIZyYfmQWeq/HignciG/JW4vhXQVXGIlx/5x816KYrIYVFPzELAaL9QymoQWAu
         1S7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rfvNJ6SwD135PnS64Nblsl7Xm55KVFsUpW1c0eS2aVY=;
        b=JUbGUGydjkLtdDoDfi31U4RxoMSMk4lj9yQBDrZxKizdF2HYlJxbkhwg7nclXsXtGf
         FuNtWEpwogWyahA0lBaOznp5fmF7sJkSWwujdG0VlNL1/RVpSQKoFIH5hOWLu26KTjtY
         EQJNfFHpGWLdqPUckHONqFsh25hoBEkLdQ2faJznXgmgLd0tYFyNKFBojjwLk+3R5Af2
         jyA+Nlwsc2esDNscMBIJNasgXyxivhQAeoTbPNs7RUuq897Hgzlyj7ArqdTblE0G8Gwo
         EKATprl7QoXuen+UoXCpBP469vJlfw/QQiaBUB44mPmFnT7+TYtPTnCE2rux2tb+IUS/
         /TLw==
X-Gm-Message-State: APjAAAVMGBkS4QWJ55po7CNjvj4mXKWF9Nv+8yvrjsw4TO0H0nhp5JA4
        FGO9IVKIr58zKVMkZv5lVTfbd/KqGn/h/5XvR2gohQ==
X-Google-Smtp-Source: APXvYqxpum27qzlPECIy99bHs3MTRT1fsw5fQXcrzj94L1CgoL4z3o4EdzdWdo+LFQweAhtr1FIPsa+WvuSZCwwL/ps=
X-Received: by 2002:ab0:2716:: with SMTP id s22mr22638741uao.20.1576485095866;
 Mon, 16 Dec 2019 00:31:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com> <f56dce4fcb71592cbcf0fc48a841f86f52770d4c.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <f56dce4fcb71592cbcf0fc48a841f86f52770d4c.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:31:24 +0100
Message-ID: <CACRpkdap9TXqWpUKb+vPmLkjV-1msm8zVWshv+m6c87oDxip7A@mail.gmail.com>
Subject: Re: [PATCH v6 11/15] docs: driver-model: Add missing managed GPIO
 array get functions
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Dec 11, 2019 at 10:48 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> devm_gpiod_get_array and devm_gpiod_get_array_optional were missing
> from the list. Add them.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> No changes sinnce v5

Patch applied.

No need to merge this patch into MFD or other subsystem where the
rest gets merged.

Yours,
Linus Walleij
