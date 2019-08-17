Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0CD090C70
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2019 05:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfHQDee (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 16 Aug 2019 23:34:34 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41519 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfHQDed (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Aug 2019 23:34:33 -0400
Received: by mail-pf1-f193.google.com with SMTP id 196so4083281pfz.8
        for <linux-clk@vger.kernel.org>; Fri, 16 Aug 2019 20:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8LLTjw5mbCMjfVCCXAOoDmaHq3n7/+aUHXsTBnjLG9Y=;
        b=J77/Al2JrQdADWKKNIPoaZH5pQZBty78giuD5J9XNZnpk6DgNLj4q1kBZSO22VqKvi
         P67jYqxrLZVEeilMeHiehh8kmCUbAlXPIn6+kU6HFQQVTOjCZOp2oYD4JqGpamjMWaor
         b94xURoyLakXaVKLDf+485u5vlkYwOlm+CM51giZZROHMOYNSU6Hx7+HBs8aIrbX4rYk
         zvtBVWA8kQxALBdemmzipKzQT+y2qZtu3t7ubRdotZfeMTCZjYXlFPnwNiSzPzlWVx08
         uCynIkkjRVzfWDtLISalyT+teOvR8GS+izovrsgraIgmilaKDzjDtYNmKne34EC1Kvm6
         Jasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8LLTjw5mbCMjfVCCXAOoDmaHq3n7/+aUHXsTBnjLG9Y=;
        b=rz1eRgVLxfo3mfHz3e3bXvhnbvUQwmQRrTxHFgr0XnUyzb2H8L2WdPfG4UnllI5hRV
         pL6uEF8BwvRh7KKsSbvQBg7CEdPXITVtXAk+bhPcJShmUnmH8LCeZ3VUBd5/cG9wN2J9
         gpCtBGhmi9intp9UQRiVqlBcAia4Nh7EidQzu9xbSW8VwHrnJIvxbLNQlR7PCHm4Mhas
         rX/d/YN3vvc7YcNnhKSUzU2xHkXw0YCZcn8bL1B6niFVdI/hi0TMrEo71TS52U4FUWfD
         vCxaRd8sM1rBnI8OsloQOxdPC+RtaFwhJQ4hwkygGyVNpvC6HopSEIO33dcFz5ZXzKiL
         cNPQ==
X-Gm-Message-State: APjAAAXBwLd2NecbTn/XBaJ6gCzMH4y9by8VfDrVVNiiMpzM6u5Ujyqs
        XKN8M+ToAGAucW7nA2yagXTq
X-Google-Smtp-Source: APXvYqy0SEIRcAWpwqX/HsANHjZDK345W2Se4HhcQbc69mXsBK62Pux3dAmVE7iHRjrD7n11NvxCmA==
X-Received: by 2002:a62:144f:: with SMTP id 76mr14051167pfu.62.1566012873127;
        Fri, 16 Aug 2019 20:34:33 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:70a:af69:9185:a772:a21d:70ac])
        by smtp.gmail.com with ESMTPSA id v22sm6184218pgk.69.2019.08.16.20.34.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 20:34:32 -0700 (PDT)
Date:   Sat, 17 Aug 2019 09:04:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add Bitmain BM1880 SoC clock
 controller binding
Message-ID: <20190817033422.GB14652@Mani-XPS-13-9360>
References: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org>
 <20190705151440.20844-2-manivannan.sadhasivam@linaro.org>
 <20190808050128.E3DA52186A@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808050128.E3DA52186A@mail.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Wed, Aug 07, 2019 at 10:01:28PM -0700, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2019-07-05 08:14:36)
> > Add devicetree binding for Bitmain BM1880 SoC clock controller.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../bindings/clock/bitmain,bm1880-clk.txt     | 47 +++++++++++
> 
> Can you convert this to YAML? It's all the rage right now.
> 

Sure.

> >  include/dt-bindings/clock/bm1880-clock.h      | 82 +++++++++++++++++++
> >  2 files changed, 129 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt
> >  create mode 100644 include/dt-bindings/clock/bm1880-clock.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt b/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt
> > new file mode 100644
> > index 000000000000..9c967095d430
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt
> > @@ -0,0 +1,47 @@
> > +* Bitmain BM1880 Clock Controller
> > +
> > +The Bitmain BM1880 clock controler generates and supplies clock to
> > +various peripherals within the SoC.
> > +
> > +Required Properties:
> > +
> > +- compatible: Should be "bitmain,bm1880-clk"
> > +- reg :        Register address and size of PLL and SYS control domains
> > +- reg-names : Register domain names: "pll" and "sys"
> > +- clocks : Phandle of the input reference clock.
> > +- #clock-cells: Should be 1.
> > +
> > +Each clock is assigned an identifier, and client nodes can use this identifier
> > +to specify the clock which they consume.
> > +
> > +All available clocks are defined as preprocessor macros in corresponding
> > +dt-bindings/clock/bm1880-clock.h header and can be used in device tree sources.
> > +
> > +External clocks:
> > +
> > +The osc clock used as the input for the plls is generated outside the SoC.
> > +It is expected that it is defined using standard clock bindings as "osc".
> > +
> > +Example: 
> > +
> > +        clk: clock-controller@800 {
> > +                compatible = "bitmain,bm1880-clk";
> > +                reg = <0xe8 0x0c>,<0x800 0xb0>;
> 
> It looks weird still. What hardware module is this actually part of?
> Some larger power manager block?
> 

These are all part of the sysctrl block (clock + pinctrl + reset) and the
register domains got split between system and pll.

Thanks,
Mani

> > +                reg-names = "pll", "sys";
> > +                clocks = <&osc>;
> > +                #clock-cells = <1>;
> > +        };
> > +
