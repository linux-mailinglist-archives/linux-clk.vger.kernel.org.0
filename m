Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F81B42CF32
	for <lists+linux-clk@lfdr.de>; Thu, 14 Oct 2021 01:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhJMXe3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 13 Oct 2021 19:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhJMXe0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Oct 2021 19:34:26 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5311EC061749
        for <linux-clk@vger.kernel.org>; Wed, 13 Oct 2021 16:32:22 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id d3so16663932edp.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Oct 2021 16:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ospeyyhqw0CRqoqClIHT3mWhQW06xSFUt4wC+aB72Do=;
        b=J0ppSYQmk6ftQ18xXBFf83hWkQjuJ0uLuFrwp5CEMTzHH9X80jUZcDhXJB4Ryq4mKF
         M2fHKboCOtYZKFEvDiFCbJALu+OngShOiwebyHS6U2HgVMIFe6qAyjjRVan0ulHsTdP1
         0ztcoUX43Hkg9WoIIPCmcUtPpmq+lBFVaQdl4ZO0KpCg1RCattIhLd14HhE/o+5MZ8JM
         ygkgNM9Hw9gOspvT9k5K1ZA9nG5u04QksrR1CFB1YgaM0CPsh7EKr76JkDhnE7oSUhPe
         h8q5pCOZjk9UF7KmI/Pm1RKI8qF+yQXSC4Mn7bGV5CjO5Xj2UA1pNGWkFiK9MWhT10mv
         gq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ospeyyhqw0CRqoqClIHT3mWhQW06xSFUt4wC+aB72Do=;
        b=Sob5QNNDVmNwXlD0ctY4zsSpb5SOT7cq8uMD+1zAPrxhGT0X41CC/8BnrspTaca4bg
         QVigrTJdl9TApjruuAgAKSQLVieynZ/B/Hnu3qYVr7wxdG68hN0w+SwXg6H+XoT5vjpe
         twvxpptRZSK7JK/M9o/lI6O8g5Jev4mlzGPoNM5TfqSsEMdfKHcs4Z+5KO7mNrCrGUyZ
         bSWqqNd0h1uRPZwzWtj1iPbXnl46D63g5Mu2OnXwSHDgvNmlw+fdbHZhuEt9RyzR+pGH
         1rFkF+RJr0tHohw323cvUJFoZekWJKoY0hzgq37MLcuS5aIbBMjE6cJKJNc2BtG9gDbL
         goUQ==
X-Gm-Message-State: AOAM530E9Yi1janKui90Svf+XHMcU2GXqxNJgmAHtHNFXPFyvE6nrTn+
        nwW3W0cRsPyMmyvjRUf/UU/kLu4s9m71KRuCrtYXGg==
X-Google-Smtp-Source: ABdhPJyuIYlcFJXtQMXt4pTjgAt118n7IntyXdUFIq9VY1B2uFC6+blRjvGj0T3/x3oVRqgidcVcxpMLoAdd+OF/5zA=
X-Received: by 2002:a05:6402:278a:: with SMTP id b10mr3626283ede.134.1634167940811;
 Wed, 13 Oct 2021 16:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:32:09 +0200
Message-ID: <CACRpkdaB27Ar0a+Kxh9bmH78bUL_vFush==Suua2TDjt7wpYug@mail.gmail.com>
Subject: Re: [PATCH v1 00/16] Basic StarFive JH7100 RISC-V SoC support
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 12, 2021 at 3:41 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

>   dt-bindings: pinctrl: Add StarFive pinctrl definitions
>   dt-bindings: pinctrl: Add StarFive JH7100 bindings
>   pinctrl: starfive: Add pinctrl driver for StarFive SoCs

I'd be happy to apply these to the pinctrl tree if everybody is
happy.
If you prefer some other merge path:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
