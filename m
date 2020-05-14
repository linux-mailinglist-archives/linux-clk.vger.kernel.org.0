Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7CF1D3228
	for <lists+linux-clk@lfdr.de>; Thu, 14 May 2020 16:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgENOIM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 May 2020 10:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgENOIM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 May 2020 10:08:12 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B98AC061A0C
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2020 07:08:12 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id g1so3637646ljk.7
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2020 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4tjpLfreP4k0pSGmLfKu7J4qVyl2PfcgR+DBUFuyQfI=;
        b=Dj7/g773oDlRsTiNUR7xo2qlLm/wu1orsMurVYbTiR6KmugblKgadVSe7mPERK4aCL
         vEPNEYTpo0FsOvkLTFcAR67KlJyF7Lm0tYMvWEFjNfuewnDqxPfak/mLCAwyBwyRj2ir
         q0by15fYjqzhJnUNE1ONVJGr3vLUxaVTcB05C/nT5aCMA95AP0XrrQXYs66hWza3MVLf
         R+msddyOYrqaHHXoL1h2Zg7FvdZ9e0msvkVGT4lgti3NVlNIlsRBi9Wq6iHo7+nPlyp+
         J4SOOLifvlUKFSIzHAfmGa1qomnjT8z0ZSZ1URkY4VQZLOT1r8zjI6FEv5Gh00Bgxe6d
         cS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tjpLfreP4k0pSGmLfKu7J4qVyl2PfcgR+DBUFuyQfI=;
        b=towNin9xX6cSCHTobCQvx7L/9s2eLQ7rfHYP+fkngPc/icA9GA69caVrXcQoapltCb
         5VrnWxBo9a48prmjerlLcz10BI7BfrLIl4CMkgquLY8QzDUtn1Pu+KakkxuG7fgmYsSH
         6tg3EIy6L0sSszdAhqBGYkrg0jKAIbYwphdtX0xbDulydVmhELIZIgJHShTGdPZr9CxP
         SPm0jOwWHB/i+hUWxhhzgJfbAFj5xmdww1R6CPaKGa67zRRKUQAeT6wDfOGzR3CnqfEG
         kEkP/OeKDZdQPU5oQIHubcOcmIjKyJTQyOAjHeF6HKeiZ1WsUqrXUg5DcgFKAA8v4Qzb
         A/Rw==
X-Gm-Message-State: AOAM5324+qbseN5QYnRXb/cEYtXjjeZwn8c0kPlMlFus+ryB+RuwpUCB
        /FjFACDhPmiYQSKO2ZqVXAo8prAcYCgaz4n3amTyww==
X-Google-Smtp-Source: ABdhPJx5t1yZM5yB0Se02KNKlQ3Kf5olZkwfnoQ7/EcJOQjcx6eZpQDoXhQSKSv4wdy91TSKQPnH1L4MsQ9yfH5F0tc=
X-Received: by 2002:a2e:531e:: with SMTP id h30mr2030382ljb.168.1589465290360;
 Thu, 14 May 2020 07:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-6-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdbZoMDC-D12CByKJUZbu4shqixC=QrKwJUd8x=nyK7seQ@mail.gmail.com> <CAL9mu0LVsePqifEC+-FR+NxvuZT3UGpU86KhzaTqb7w_Px0z2g@mail.gmail.com>
In-Reply-To: <CAL9mu0LVsePqifEC+-FR+NxvuZT3UGpU86KhzaTqb7w_Px0z2g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 May 2020 16:07:57 +0200
Message-ID: <CACRpkdbcD7i+kNoJ9YP5XXTtLi12=yzW5OBNzet5oRdwPYz=dA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drm/panel: Add ilitek ili9341 driver
To:     dillon min <dillon.minfei@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 14, 2020 at 12:22 PM dillon min <dillon.minfei@gmail.com> wrote:

> > > +       /* Gamma */
> > > +       mipi_dbi_command(dbi, ILI9341_3GAMMA_EN, 0x00);
> > > +       mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, 0x01);
> > > +       mipi_dbi_command(dbi, ILI9341_PGAMMA,
> > > +                        0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1,
> > > +                        0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00);
> > > +       mipi_dbi_command(dbi, ILI9341_NGAMMA,
> > > +                        0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1,
> > > +                        0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f);
> >
> > It seems to be copies of the stuff above, but why is there a different
> > gamma if you use DBI?

> for dbi interface, currently i just copy the code from tiny/ili9341.c.
> as so many boards use this driver now, like raspberry pi, etc
> i'm afraid it's will not work after modification. so, just leave the
> original code there.

OK if you move it to ili9341_config it will be clear which panels
need this gamma and which panels need another gamma.

I think there should be one ili9341_config for the new st,*
variant and one for the old DBI variant.

> anther question:
> is there any panel driver have dbi & dpi or dpi & dsi supported? which
> i mean support
> two different panel interface in one driver.
> thanks

Usually you split the driver in three files becuase a driver can
only list one initcall, and also it makes it modularized.

There is nothing in-tree but look at my branch here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/log/?h=ux500-skomer-v5.7-rc1

You see how I split up the s6e63m0 driver in one SPI part
and one DSI part:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?h=ux500-skomer-v5.7-rc1&id=6c0e1fb5df5fa8fa857dee65f6c0f54d06d158a7
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?h=ux500-skomer-v5.7-rc1&id=cfbf562cc709b53b62f5fbc7fedf176ffa17b088

The overall idea should work the same with DBI.

Yours,
Linus Walleij

Yours,
Linus Walleij
