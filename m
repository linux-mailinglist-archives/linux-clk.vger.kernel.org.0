Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA95C81549
	for <lists+linux-clk@lfdr.de>; Mon,  5 Aug 2019 11:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfHEJVK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 5 Aug 2019 05:21:10 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41399 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbfHEJVJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Aug 2019 05:21:09 -0400
Received: by mail-lf1-f66.google.com with SMTP id 62so52482772lfa.8
        for <linux-clk@vger.kernel.org>; Mon, 05 Aug 2019 02:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XeZuwJ8iOEhz5F2Wyo98q50Ei+RrYxquDk/4W/V9cn0=;
        b=d38K7iRFWg8Rc6C4PuO9fKbqOufJuG0gaI0lCMNB0BnZbyW9wnVbGzVpM2JFvzyqsy
         8YSH2Q/DdHFeEZeJxbiuBKA50NXM1R3iWzf4oEON9JzpZQ/jPku4nDplix1QVwlmePpA
         KKt/EzMcVOckc7Xa8QNN7OueaXG9Oe+8vgR+xQvwZ0AMKPmXa0Qh1XseZuuh/AekaC/S
         oTslBzcMnORlG314vI6mNUY/s5WyOv2ACIzwOOuy6PDwaA6FT9yek3oNCya4yDFtsx7o
         OazivBDUDaq0/x1S+WDHAzfBHXRo4sUv+CX+Dl1SIjB56bi3lXg+eaVIRjlkOsM9q8/b
         s4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XeZuwJ8iOEhz5F2Wyo98q50Ei+RrYxquDk/4W/V9cn0=;
        b=IYAjIgB8hS+4qyUGFRrapyypUrLz0eJ+4b7tDTTgfjluAX/lPRqXSBX6BKDc3D47Gj
         qLe19u8wtPJpMSBu69+RBcCB72at8jbe0tslNAHJtagdTqdBLptDVj1mNcf0RDdInr6k
         ZMpjo7Jf1mNqUIdRjVX5h/xx5gQ+YjTbPRaGUnrd2MtImX98vwv1GyhLD204beCeJAyF
         Iw3vANvaE9fl0RCyLt5gJZwsn7wb+u0ej31BJodyIw2Dx0B1LBJ1RnkNu+V+StruwuOS
         epmp5lqnrHm9LC5UcP8mUG364QJRXtdM7S9eyfp2fC/t4lDhbixS0IMYnbl2QOKv/gz1
         BPKQ==
X-Gm-Message-State: APjAAAUGiRRmwWMBmQ9CVOt6qtau3JVZV4YeOElTdhAUwqzyJNK7JR2W
        p2uzRvJangurtdHNxmrU2kbp55AGF0VA1yH7ayS40whP
X-Google-Smtp-Source: APXvYqxF1O5EyxUA2mWKTQH1RGnvxfpX5mkjdne+NiMtuk+mLdGY91xYa+kkP3albntIoVAT5SSzBtSmKVC7v/w3ioQ=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr1226892lfi.115.1564996867652;
 Mon, 05 Aug 2019 02:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com> <1564607463-28802-2-git-send-email-skomatineni@nvidia.com>
In-Reply-To: <1564607463-28802-2-git-send-email-skomatineni@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:20:56 +0200
Message-ID: <CACRpkdZVR-i1c5eATL2hSPbLXcX1sR8NgXwa4j259XXUi57xug@mail.gmail.com>
Subject: Re: [PATCH v7 01/20] pinctrl: tegra: Add suspend and resume support
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stefan Agner <stefan@agner.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        viresh kumar <viresh.kumar@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 31, 2019 at 11:11 PM Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:

> This patch adds support for Tegra pinctrl driver suspend and resume.
>
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Patch applied to the pinctrl tree.

This patch seems finished.

Also if the rest don't get merged for v5.4 then at least this is so
your patch stack gets more shallow.

I hope it's fine to merge this separately, else tell me and I'll
pull it out.

Yours,
Linus Walleij
