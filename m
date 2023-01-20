Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB10F675BEC
	for <lists+linux-clk@lfdr.de>; Fri, 20 Jan 2023 18:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjATRrZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 Jan 2023 12:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjATRrY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 12:47:24 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4DBD518D1
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 09:47:22 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id v30so7638710edb.9
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 09:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BipnOyO2jsAkSmzvNbujWDpxdaTEf2MUiztSdhwIYZM=;
        b=Bd3FjursiOsjI69j3RURLqlVLWzxWtZw1tS9m3pap8RceZvgWm6SQ18OSQOwxnZbR5
         95CZzqiuQtlbzDTw2+kXJfHS47PqWgeBCNsJUrBetsIVxT7d35ITORG35757jkfXMExY
         AMS2ZeC+x8/ZpqzWF+fvfradiRNEznbCJqmEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BipnOyO2jsAkSmzvNbujWDpxdaTEf2MUiztSdhwIYZM=;
        b=ikrDH87nIqvgJWGhFGjaHCDVbVMV6/TMK/H6P8/iG3srwTjnVmnaPuiw4pRfcJhFZp
         9bfelTLkBBnh0yxBugE+rH6XObA1er+gzPcOl8g0Lig87SuLWCU59SMulxX0dubay+xC
         CGdbLT1HOLc9JljMuYgMaeZ7UAB6fN/KguU6vqG1IpwFn55cfdHKX+3fhQ33yg/y0F8b
         CNvZXmF0txrp7Q09FLetMagwzLWgQoezDswKjPirCvixrVOWAp6N/9jzCuhbf6vqfut5
         6h9ruPpMEFRwwhbafu2ILBd1O7PtcihonHbntBvY8esYnTfth0wEYDZ1QMNlH1O82KVM
         mfDA==
X-Gm-Message-State: AFqh2krJlJ0bbkwj+Z1+3Fck1SJQo4I0BJ6OSyeVulXMexEa9MqdAj/Z
        nlxevZUrcYiFXrkwN4y5TYrfEROgD1sNv9NqA/jP5w==
X-Google-Smtp-Source: AMrXdXtTqlcT7UkNlFBypYAC/4a4mGUM44HYZB7Bo3ZplyiQ8KH3qBRlCAOatXHxjolMvMR8xpieQN103+X9bl+aHh4=
X-Received: by 2002:a05:6402:1396:b0:49b:52b4:83ca with SMTP id
 b22-20020a056402139600b0049b52b483camr1773177edv.225.1674236841244; Fri, 20
 Jan 2023 09:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20230101175740.1010258-1-dario.binacchi@amarulasolutions.com>
 <20230101175740.1010258-12-dario.binacchi@amarulasolutions.com> <Y8VgzyNxGpqSvJ2b@linaro.org>
In-Reply-To: <Y8VgzyNxGpqSvJ2b@linaro.org>
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date:   Fri, 20 Jan 2023 18:47:10 +0100
Message-ID: <CABGWkvrmKzPHozcB6Wn94sG50qEsR8rK-p32eP127XPBJ7xe0A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/11] arm64: dts: imx8mn: add clocks description
To:     Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, angelo@amarulasolutions.com,
        michael@amarulasolutions.com, tommaso.merciai@amarulasolutions.com,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-amarula@amarulasolutions.com, anthony@amarulasolutions.com,
        jagan@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Markus Niebel <Markus.Niebel@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Tero Kristo <kristo@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Mon, Jan 16, 2023 at 3:36 PM Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 23-01-01 18:57:40, Dario Binacchi wrote:
> > The patch creates a unique node for each clock in the imx8mn clock
> > control module (CCM).
> >
> > To ensure backwards compatibility it was not possible to separate the
> > changes to the device tree from those applied to the clocks setup code.
> > In doing so, all clocks are initialized from the device tree and the
> > legacy setup code with hardwired parameters is removed.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > (no changes since v1)
> >
> >  .../boot/dts/freescale/imx8mn-clocks.dtsi     | 1885 +++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8mn.dtsi     |   54 +-
> >  drivers/clk/imx/clk-imx8mn.c                  |  714 ++-----
> >  3 files changed, 2086 insertions(+), 567 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-clocks.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-clocks.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-clocks.dtsi
> > new file mode 100644
> > index 000000000000..21e02ea996d0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-clocks.dtsi
> > @@ -0,0 +1,1885 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Device Tree Source for imx8mn clock data
> > + *
> > + * Copyright (c) 2022 Amarula Solutions
> > + *
> > + * Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > + */
> > +
> > +/ {
> > +     osc_32k: clock-osc-32k {
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             clock-frequency = <32768>;
> > +             clock-output-names = "osc_32k";
> > +     };
> > +
>
> [...]
>
> > +
> > +     clk_audio_pll2_bypass: clock-audio-pll2-bypass@14 {
> > +             compatible = "fsl,imx8mn-mux-clock";
> > +             #clock-cells = <0>;
> > +             clocks = <&clk_audio_pll2>, <&clk_audio_pll2_ref_sel>;
> > +             fsl,anatop = <&anatop 0x14>;
> > +             fsl,bit-shift = <16>;
> > +             fsl,set-rate-parent;
>
> NACK. I'm sorry, but this creates a huge effort on maintaining the
> bindings.

IMHO I don't think that's the point. Rather, is it correct to keep adding
platforms always replicating the same code that makes use of hardwired
parameters? When I thought about the development of this series I
thought it could be an opportunity to reverse the trend. In the direction
suggested by the linux kernel development policies.The benefits of using the
device tree have been proven for quite some time now.
The 03/11 and 04/11 patches of the series make a list of the legacy code that
has been added over time (functions with names that are sometimes unclear)
and that with the progressive use of the device tree would be removed.

As written in the cover letter, I am available to add the necessary DT
bindings to
the series.

Plus the vendor specific properties will keep increasing.
>
> I don't think Rob and Krzysztof will be OK with this either.

I hope instead that they agree with me. I didn't answer right away as
I was waiting
for their opinion. And I keep hoping for their response. And any other
recipients of
the series as well.

By the way, I add Tero Kristo and Toni Lindgren as their work done for
the TI clock
subsystem has been a great help for me in the implementation of this series.

Thanks and regards,
Dario

>
>
> > +             clock-output-names = "audio_pll2_bypass";
> > +     };
> > +
> > +     clk_audio_pll2_out: clock-audio-pll2-out@14 {
> > +             compatible = "fsl,imx8mn-gate-clock";
> > +             #clock-cells = <0>;
> > +             clocks = <&clk_audio_pll2_bypass>;
> > +             fsl,anatop = <&anatop 0x14>;
> > +             fsl,bit-shift = <13>;
> > +             clock-output-names = "audio_pll2_out";
> > +     };
> > +
>
> [...]
>
> > --
> > 2.32.0
> >



-- 

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
