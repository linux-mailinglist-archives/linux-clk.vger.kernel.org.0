Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D36AF12057B
	for <lists+linux-clk@lfdr.de>; Mon, 16 Dec 2019 13:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbfLPMVv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Dec 2019 07:21:51 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:45726 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727531AbfLPMVu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Dec 2019 07:21:50 -0500
Received: by mail-vk1-f195.google.com with SMTP id g7so1539940vkl.12
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2019 04:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Osz9VkIv77cDwS5TcCegl7t+g2vcc4c6bR2gC0bBTE=;
        b=DZZyv8KM/AkMijIzHa1GdiQtmMM5jFO5/iApv4ZaWBvNM353Ymxg2+pnW5EC9h1d10
         raOcV/4ZpE2mLiy9niImgy6S2uIbA8AxH7zU77oNYUJK5xvF07asZDBu2dJQL1Nt3X8x
         6HN96msV5Xasoa7rvuf7T9sxjtSopJk43dVkSSJ1RkjWKxqXtfKtVaWoc6wECXGLbsW6
         +5KQFjSFWGoSMFLp4WestwfyV+ESb9MvghUFcvSOF1K4p1gyWUHq00PnIs22QsYnLQ66
         zzcsQnc5XGu/COfqK2j7KirCwaIBS0mSgbm1k2K1q1CxtYxlAMMyEMywAX2JwUw3AoxK
         cEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Osz9VkIv77cDwS5TcCegl7t+g2vcc4c6bR2gC0bBTE=;
        b=K2pmUugahzZxCCIajqel+sE7hTrhE+dqOpfIrRoNLkhgDzeh/hgMYBKBZXtms8auBX
         bgMGyd1LpHt6PUBvY/tmXsnYZE9f2CoxXfN0hzcSyITqfNav8Zszev1r81f+QKBW5E+6
         +k4jJX/v7e/C2XG4uSEMBY1v3rJoXu7B5dkA+eNU8DsPNbLJXo6Zohkg63tj2/QlWl7D
         PMDiXF7KVtmBR91cIQaWM9x8MJEflNWHlt4OxkiFETkFtV/CBJEULMw4TY0zIcVURC+J
         Qm4NgkBQuVW807IlEy7KxXnCKr4IZ1psrJndOQLH5DhkMN/Or817ropJVd3U91BmD/ta
         nzHA==
X-Gm-Message-State: APjAAAVCC072KQaPKaAsRO9VdNDzy8UipdufLVvjpVnpwlMF75jdcREr
        aoNpAX4018V8PzS33J2gL8eG0Xq7Fs7BzaHB/DVbsQ==
X-Google-Smtp-Source: APXvYqx0xjbvyReO9ph3sJ/hbSdKSuPIz6dCp5eLmtjvK0OiHzZ5p261fyvWyE0OL/9Yo5d+jJByHNJNcdJ2/e/Yeww=
X-Received: by 2002:a1f:add3:: with SMTP id w202mr2070054vke.30.1576498909436;
 Mon, 16 Dec 2019 04:21:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <f34765b5cb4e949c2e85415ded3d0ee7736cc97b.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <CACRpkdbUS7WeQ7OoTtjGnB7L=uhYncwwcHxkJ1Uj6GqYCGNGJA@mail.gmail.com> <812acba9df70c4bb6975580c7965b61e923a3a13.camel@fi.rohmeurope.com>
In-Reply-To: <812acba9df70c4bb6975580c7965b61e923a3a13.camel@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 13:21:38 +0100
Message-ID: <CACRpkdbi9AhGnG3hBwXNQV9foK=JNBH8WUNvXZVxbEX4LyDCig@mail.gmail.com>
Subject: Re: [PATCH v6 10/15] gpio: devres: Add devm_gpiod_get_parent_array
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Dec 16, 2019 at 9:59 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:

> I dropped the run-level support from regulator patch (for now at
> least). This means that I no longer have GPIO consumers needing this
> new API in the series.

OK I dropped it for now, we can add it when needed.

Yours,
Linus Walleij
