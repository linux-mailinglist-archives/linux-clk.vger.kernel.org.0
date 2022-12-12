Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9CC649F00
	for <lists+linux-clk@lfdr.de>; Mon, 12 Dec 2022 13:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbiLLMoW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 12 Dec 2022 07:44:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbiLLMoV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Dec 2022 07:44:21 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8B911A2D
        for <linux-clk@vger.kernel.org>; Mon, 12 Dec 2022 04:44:18 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso3478144wmp.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Dec 2022 04:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n7ey5OE4WbD1JahXkqzMDy7rEZ6qWxzQ6t8f0HPSRNs=;
        b=qUTeXZxuhuYycyobAALAsMsiPtMXWTK0cbENHii/uMQzfin6RsG6UXWghBAnEMZbX9
         pLTDHrCfmf+gaM4wx+Z3w+++qqLWsUHw2TiVPC+gX5u0WCqV/oBny6cbQDTjmibNQ/0L
         J2VSja4ME/RDtxUoM2MrSDnRXuqGITyuxog8Nc5kp+WrslUqLFD/0EizAilSrVAt9Nwr
         b+E6Ts0aE7K07sTpFRlyxkwNHxj3RTOJy3YVPY4whhl14QrkZsIUps3ML6uX2g/LmheS
         5gUiQg5x478OLPYtDTZ2U6RAJIKX7zrCS+HVXoTsDXHsfhgMWlVt3V4rxxTdZHsLYC36
         qM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7ey5OE4WbD1JahXkqzMDy7rEZ6qWxzQ6t8f0HPSRNs=;
        b=NO9f9lNE7vemBhp/WdIk1S9A4HbQ2TZBRLzUYHj5Av8NQUYtHTRS1nfO40D6ncTBB/
         GucjvzJMq7T5d4XN+rpEHCfsheLs+u0BTKqRqNbfp0cVV0d1KpQnu5TBy4KkPsg/pCJ7
         EaITeN3WujyJAVi/Sj7pmVPBWlMR6GRTqAWo7nA0tGFGEMn3Q99m/hpZZH+moVBJwSkM
         0PmRonZYoF1uFWTebjGOzDhSpiOpf1CC7MqzZOmkihtegQaQsv4fV0DCr4uien0EczOP
         a/02cS6DJ3unFM6j0pg94tgilbIio+js5TlHgFCx9Oix2pJA1LEiXhOBy5n7n8hktmSm
         rY2w==
X-Gm-Message-State: ANoB5pkOHZP5Ci0wej+5kDpjPzwDxno+JzAKj4BE+KJ1DRT1ys+4ArYk
        Oy3ImWF9003q/EBt+v5mtqbN2w==
X-Google-Smtp-Source: AA0mqf5LTY9uPSvi1G6cqxJF3CcL4A+t/hPjYQhFazq21Aj9/MjvP9uQfiQ6LD0UD5sXSAcK4yzQGw==
X-Received: by 2002:a05:600c:4691:b0:3d0:5254:8a43 with SMTP id p17-20020a05600c469100b003d052548a43mr15351923wmo.38.1670849057277;
        Mon, 12 Dec 2022 04:44:17 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id c1-20020a05600c0a4100b003d1e3b1624dsm10251490wmq.2.2022.12.12.04.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 04:44:16 -0800 (PST)
Date:   Mon, 12 Dec 2022 13:44:13 +0100
From:   Corentin LABBE <clabbe@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     heiko@sntech.de, ardb@kernel.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v10 28/33] arm64: dts: rockchip: rk3399: add crypto node
Message-ID: <Y5ciHdLeB5rpnPqj@Red>
References: <20220927075511.3147847-1-clabbe@baylibre.com>
 <20220927075511.3147847-29-clabbe@baylibre.com>
 <CAL_JsqJkHR+iccEf=5SU40Qq+cQpGZRq26TLzec-_Nr-Buu2KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJkHR+iccEf=5SU40Qq+cQpGZRq26TLzec-_Nr-Buu2KQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Le Sun, Dec 11, 2022 at 09:51:42AM -0600, Rob Herring a �crit :
> On Tue, Sep 27, 2022 at 2:56 AM Corentin Labbe <clabbe@baylibre.com> wrote:
> >
> > The rk3399 has a crypto IP handled by the rk3288 crypto driver so adds a
> > node for it.
> >
> > Tested-by Diederik de Haas <didi.debian@cknow.org>
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > index 92c2207e686c..4391aea25984 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > @@ -582,6 +582,26 @@ saradc: saradc@ff100000 {
> >                 status = "disabled";
> >         };
> >
> > +       crypto0: crypto@ff8b0000 {
> > +               compatible = "rockchip,rk3399-crypto";
> > +               reg = <0x0 0xff8b0000 0x0 0x4000>;
> > +               interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>;
> > +               clocks = <&cru HCLK_M_CRYPTO0>, <&cru HCLK_S_CRYPTO0>, <&cru SCLK_CRYPTO0>;
> > +               clock-names = "hclk_master", "hclk_slave", "sclk";
> > +               resets = <&cru SRST_CRYPTO0>, <&cru SRST_CRYPTO0_S>, <&cru SRST_CRYPTO0_M>;
> > +               reset-names = "master", "lave", "crypto";
> 
> This doesn't match the binding:
> 
> crypto@ff8b8000: reset-names:2: 'crypto-rst' was expected
> crypto@ff8b0000: reset-names:2: 'crypto-rst' was expected
> crypto@ff8b0000: reset-names:1: 'slave' was expected
> 

Hello

I will send a patch to fix that

Regards
