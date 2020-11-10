Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4802AD8F6
	for <lists+linux-clk@lfdr.de>; Tue, 10 Nov 2020 15:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbgKJOkM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 10 Nov 2020 09:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJOkM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Nov 2020 09:40:12 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B44C0613D4
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2020 06:40:10 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id e27so17876587lfn.7
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2020 06:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMIR0x3v/SOduiNJI+iAqXslKNdg1Phd+avxtEvAmZ0=;
        b=yMvmv62jzEb5fWYRyJZ4EfNvXQWxI0M2a6MD6A14Kx2zX0+pJwr0BFTgurkn/NFcYN
         SEuffXDjbLtIeQtWDaXAhzdEJoRKIeHAT5dvDEySvCGFrvh9bPI0L3QFezJRcPZWqkwR
         FIQqy4YacfO3Oj7lxlpiIQnlZ4lyLWMQFP58iJL3VeCk2S/Z0o+9+n36DPvrUm3djefP
         Nf8fsoRkRTr406syuJyIdGYjtpWJFYIFc/AlaHKP8gv0mbHpRynDsz7F35XR6HyAaEkO
         LEgu4epTlp38o7p3nKYvORMzrP2I8j9HTmYhHZ1PbN3l0woZQdGi2pyG9yox7ZCDvkr+
         JmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMIR0x3v/SOduiNJI+iAqXslKNdg1Phd+avxtEvAmZ0=;
        b=JAnEoDJMv6YEhb+KAbrw1sl7MgNgdN1WkdTYZ+UFonjYlOAbjqlJ285j5jjBT7pVWg
         fgmkiQwcIoG1BfLU5GhX7Cf0dOa4/F7XFCq5470GQIF/hLQKQF1rMuhyv/i+RGTHbjNV
         qCACiGYPc53BV0DQf0IKvH4mfGZVrbWTXvqpvE/8yjhm6t9+WZpPjsDz2V7YKtRvY3t9
         8HqWExpqQXuARuFbsNmSymtC5g8eCwoH1ZlgLusBwUcWMxbvJUWA1fPCWFcrHakO5R4N
         dmIrlBAfRUQbr8NuCM70WoagPUEsqHqswPa38qo4Yja7OHSoCarc8Wym3jN19J78nz3b
         1ubQ==
X-Gm-Message-State: AOAM5337hyVbivEOG84XgBmHxAd3nZxG9kuKXY1Ed9Hf51/hk8sx2VPQ
        0HRMlsVqqYprygTMtsyBj7DQN6R0W/tA+Q1K091Kew==
X-Google-Smtp-Source: ABdhPJwZKZCcPYORmeuUmPxVdMBipXbwsghexY2Fo6mTCT8Nwc9BfXeRqZ9vpij7/rcd11cpqaaXACeFiLO1OmB0y3k=
X-Received: by 2002:a19:ca05:: with SMTP id a5mr4591668lfg.571.1605019208781;
 Tue, 10 Nov 2020 06:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com> <20201107081420.60325-10-damien.lemoal@wdc.com>
In-Reply-To: <20201107081420.60325-10-damien.lemoal@wdc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 15:39:57 +0100
Message-ID: <CACRpkda1Pd3hTiEHWDOAz3zCMA6WK4VmvjkNv0O_ckFaWQ-zSw@mail.gmail.com>
Subject: Re: [PATCH 09/32] riscv: Fix SiFive gpio probe
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Nov 7, 2020 at 9:14 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:

> Fix the check on the number of IRQs to allow up to the maximum (32)
> instead of only the maximum minus one.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

I just ripped this patch out of your patch set and applied it to
the GPIO tree with some minor change to the subject.

Yours,
Linus Walleij
