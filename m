Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DF73D3D49
	for <lists+linux-clk@lfdr.de>; Fri, 23 Jul 2021 18:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhGWPdU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 23 Jul 2021 11:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhGWPdU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jul 2021 11:33:20 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8046C061760
        for <linux-clk@vger.kernel.org>; Fri, 23 Jul 2021 09:13:52 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m13so2867759lfg.13
        for <linux-clk@vger.kernel.org>; Fri, 23 Jul 2021 09:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZG8EM0ibWzAiSvgD/0B7tPbf0jFZ6hKm+43FjwPiK0k=;
        b=rlD9kU3EsUgSAXXwAp5ElP1YPzxO3q0z7M6zy8r9F8vzIGyuKKeFnlfR9ePbi3O+MU
         iKrGUnx/6N3cB1WpOZ3l8JtjE9kKvbBMcWMS/7maqJLonFHGN4PMWzQzYUYx0S8sf0TZ
         fRm7+ki8JlaKrLWfiuAWY1vq+4PhJc2PsEviDvGe6iOMTui96hfNscclgm+3wlXss7Iz
         QloERXBZuBfrXWAaeZsHGAF3yuWj8k0znpzgm0Bg31Fr/VQJ+dU3lm1pyEknTf2xdyIQ
         aJeXg082bW/eiNMFNYX4m/WuwYqi151M+Np4xmVwExaBSvO//B5JCmj+UIgUgMhnG4ls
         S59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZG8EM0ibWzAiSvgD/0B7tPbf0jFZ6hKm+43FjwPiK0k=;
        b=ayfTOt2scdYO6SUXlczegiR2gQ0jcPuC6uKeFVhEMc/GVocl1i9D9huc/EXgAE7zwr
         oWaL5t4EoFeos9/NDufUdCwTNOhmUpdm1/PE7+IvgSH9Afw8Mm8xuTZwuSC0SICG0xLA
         z8IEaRzMG+/SfgOP5l0CF8PmdCstjcu6eERMvZXgD0B9e7Dfl7G1pZEYQI7k+jk9lEbJ
         MXaDen+dokDq6HN03bT4Sia1LV8LMO1loWUbQ45zAfSyHzeR2bPiw5/vgi7VHRzrlg48
         tfEqTUXhaZFmTDxow2lcBno8E+jbf2wGPZ7Bmu0YptBdhVS5rrnsfNsXi4VK79WQV+zj
         82hQ==
X-Gm-Message-State: AOAM531+X54VcxSpa3VXz8pCAxneXY9x0ldEZknZec+H/lNLaHoX5+Zs
        F3ZBIhiBwcTlZoWPcrLTRnRJ+o1NvoOCd0Z2lGHHCA==
X-Google-Smtp-Source: ABdhPJxugAzgYOKChCqv3cRo/aKnwy4Bq+Q7V7eWSMFB1s+HkNGhWLe4KTH/emdsfmJ5hrY2eynft8sPj9YUAjJjH8k=
X-Received: by 2002:a05:6512:3696:: with SMTP id d22mr3678649lfs.586.1627056830723;
 Fri, 23 Jul 2021 09:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com> <20210627045631.2882-7-jiaxun.yang@flygoat.com>
In-Reply-To: <20210627045631.2882-7-jiaxun.yang@flygoat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 18:13:39 +0200
Message-ID: <CACRpkdZkvSg___ZxdE639SMbTs5rJbjHBq-HkTCuv0e645Rssg@mail.gmail.com>
Subject: Re: [PATCH 6/9] pinctrl: pistachio: Make it as a option
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jun 27, 2021 at 6:57 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> So it will be avilable for generic MIPS kernel.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Is this solved, or should I apply this patch?

Yours,
Linus Walleij
