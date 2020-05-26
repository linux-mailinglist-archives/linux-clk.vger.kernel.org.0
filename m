Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402BE1B6E29
	for <lists+linux-clk@lfdr.de>; Fri, 24 Apr 2020 08:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgDXG1d (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Apr 2020 02:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725868AbgDXG1c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Apr 2020 02:27:32 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A89C09B046
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2020 23:27:32 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k12so583444wmj.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2020 23:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UG4zneR+b2HX1vUABd9tEJTmiup5w9fG3+R5EQZb+0w=;
        b=qBQDR3rE5Zj/ATnIxvJjzyRU6q2opvmNDRcRX86ol/sJus6g3Jj+CYkD4T/5gNdCWO
         JrVDy6gxhkTdOjmj74r+UlZF3rm/x3MEhEmkWveasJOryF+aiGi9+UjvgDHHiwUU28Av
         +1y6tjhB1pPBrogQpqOuWptMo+8I4d39bLmKpiG1pNmsyPZH2bVjvkpryhm7WfJkR148
         C6LrJeJ6GkimBmzuKgdvPg5ZcIc9EDFX4PsPgC0LpW6YKcj8U7tK/tDsAiTxHTPU7aDy
         qAa8Zv6MgDPFo3nByyWpC+0yrw8No80ruodXFWIH9xTfJ6ykgfXllYaOFEcTBxBV7BgK
         p3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UG4zneR+b2HX1vUABd9tEJTmiup5w9fG3+R5EQZb+0w=;
        b=UDtvyTf/4GCdNqQqkkuZpFlTxEeTuEMSUfjgN/cR0juV2ApM1N0++kCDxFCuB5TM/f
         pq2oQ/Nlyb9fJisgpUsaLpWX0Ysv1iNmSv/+dNi4l6v37RJM9STU1ZzgLUHy+BEpRVXQ
         JpY/LHUwwOZj++Av7kegInGHfoL2Plr5Xvk4XwbIdaaRtP3GxxGgNP4y09uHLMxYD3Pz
         jKxX0rznqVKZB5opOg+qi3M6uTzqaUqJUqGEax41hTS1y/9MGY7djiXJEufn7jbeFKG3
         H7jk60AuYhSAnfyGTR8SKU2FiBov0BUV3peO4FwPxmwpzpe4BQm7GVUf9jooEYBqaxxc
         ZCMw==
X-Gm-Message-State: AGi0PubLSkpXSjHduBqGcsPaOLQN4Rd3V7bPVHVnylakdap8AUgS5mKC
        HjKm3NwF5CWdRcDHQwJI6nWbjQ==
X-Google-Smtp-Source: APiQypIm/Xjji5kQV2xW2buV/Rqqhd1gGi3AXANx2GMzwAiPHMVTVrnTO3qT8sfTAdAnbA3M9ll8eg==
X-Received: by 2002:a1c:4e15:: with SMTP id g21mr8007933wmh.29.1587709650747;
        Thu, 23 Apr 2020 23:27:30 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id j13sm6722742wro.51.2020.04.23.23.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 23:27:29 -0700 (PDT)
Date:   Fri, 24 Apr 2020 07:27:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     Abel Vesa <abel.vesa@nxp.com>, "arnd@arndb.de" <arnd@arndb.de>,
        Shawn Guo <shawnguo@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Anson Huang <anson.huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 01/13] mfd: Add i.MX generic mix support
Message-ID: <20200424062727.GI3612@dell>
References: <1586937773-5836-1-git-send-email-abel.vesa@nxp.com>
 <1586937773-5836-2-git-send-email-abel.vesa@nxp.com>
 <20200417080747.GE2167633@dell>
 <20200422091854.rhtkcfrdptwofngs@fsr-ub1664-175>
 <AM6PR04MB4966B3527BF97918C1689A4580D30@AM6PR04MB4966.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM6PR04MB4966B3527BF97918C1689A4580D30@AM6PR04MB4966.eurprd04.prod.outlook.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 23 Apr 2020, Aisheng Dong wrote:

> > From: Abel Vesa <abel.vesa@nxp.com>
> > Sent: Wednesday, April 22, 2020 5:19 PM
> > On 20-04-17 09:07:47, Lee Jones wrote:
> > > On Wed, 15 Apr 2020, Abel Vesa wrote:
> > >
> > > > Some of the i.MX SoCs have a IP for interfacing the dedicated IPs
> > > > with clocks, resets and interrupts, plus some other specific control registers.
> > > > To allow the functionality to be split between drivers, this MFD
> > > > driver is added that has only two purposes: register the devices and
> > > > map the entire register addresses. Everything else is left to the
> > > > dedicated drivers that will bind to the registered devices.
> > > >
> > > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > > > ---
> > > >  drivers/mfd/Kconfig   | 11 +++++++++++
> > > >  drivers/mfd/Makefile  |  1 +
> > > >  drivers/mfd/imx-mix.c | 48
> > > > ++++++++++++++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 60 insertions(+)
> > > >  create mode 100644 drivers/mfd/imx-mix.c
> > >
> > > For completeness - Arnd's reply to this patch:
> > >
> > 
> > I'm replying here to Arnd's reply.
> > 
> > I'm trying to give here a whole picture of the entire problem while the
> > documentation for i.MX8MP is _not yet_ public.
> > 
> > Historically, each IP would have its own enclosure for all the related GPRs.
> > Starting with i.MX8MP some GPRs (and some subparts) from the IP were placed
> > inside these mixes.
> > 
> > Audiomix for example, has multiple SAIs, a PLL, and some reset bits for EARC
> > and some GPRs for AudioDSP. This means that i.MX8MP has 7 SAIs, 1 EARC and
> > 1 AudioDSP.
> > Future platforms might have different numbers of SAIs, EARCs or AudioDSPs.
> > The PLL can't be placed in one of those SAIs and it was placed in audiomix.
> > The i.MX8MP has at least 4 of these mixes.
> > 
> > Now, the commonalities between all mixes are:
> >  - have their own power domains
> >  - driven by dedicated clock slice
> >  - contain clocks and resets
> >  - some very subsystem specific GPRs
> > 
> > Knowing that each mix has its own power domain, AFAICT, it needs to be
> > registered as a single device. Considering that it can have clocks (audiomix has
> > gates, muxes and plls), I believe that needs a clock driver, even more so since the
> > muxes need their parents from the platform clock driver. Same principle applies
> > to reset bits. The subsystem specific GPRs can be registered as syscon devices
> > and taken care of by its counterpart IP (e.g. the AudioDSP specific regs would be
> > taken care of by the DSP driver, if there is one).
> > 
> > Now based on all of the above, by using MFD we take care of the power domain
> > control for the entire mix, plus, the MFD doesn't have any kind of functionality
> > by its own, relying on its children devices that are populated based on what is in
> > the mix MFD devicetree node.
> > 
> 
> How about doing like this which maybe can address Arnd's concerns?
> audiomix: audiomix@30e20000 {
>         compatible = "fsl,imx8mp-audiomix", "syscon";
>         reg = <0x30e20000 xxx>,
>               <0x30e20xxx xxx>;
>         reg-names = "audio", "reset", "...";
>         #clock-cells = <1>;
>         #reset-cells = <1>;
>         power-domains = <&audiomix_pd>;
> }
> 
> That means we have one combo driver registering two controllers (clk/reset), both use
> the same power domain as audiomix.
> And it can be easily extended to support more services provided by audiomix over syscon
> if needed.
> Then the 'dummy' MDF driver is not needed anymore.
> 
> Jones & Arnd,
> How do you think?

Sounds okay in principle.  Anything that prevents the existence of a
dummy (a.k.a. pointless) MFD must be seen as a positive move.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
