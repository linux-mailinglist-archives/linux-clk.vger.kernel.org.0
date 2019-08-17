Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184BB90CA1
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2019 05:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfHQD64 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 16 Aug 2019 23:58:56 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35340 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfHQD64 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Aug 2019 23:58:56 -0400
Received: by mail-pl1-f193.google.com with SMTP id gn20so3228482plb.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Aug 2019 20:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fpzq1IJyTN3+XLH7OodHaHJGoEjp28ZAcokHx0BKwM8=;
        b=zj4wTskwXi8JTaFitu4xIdG1IKRFka99SesptRKIhfkVA9A3VUY8yxC+C6V5UFh1EJ
         BL3kfdAw/RH+la1vpcg1SJWRfLITpUj5rbuMbZQ3kd7BJLWhTQyLReBp5wg4iiGd8n6F
         /TDmGGNEbLWhCTFPeScJfGvABGU3dWQdhQFqKJ9Xa6JgmG8r3VmspZ3BaH4aHaXWWK/6
         W+6MxtpTUyxRSJsKCGFHH5BIrGPp6Jm2CRy5rZVGQiqxgwJKTuQvJhvzJ8lYYX0MeoXN
         UEndhJEX/f0wLy7ztz4/Y5rk9U2OlywenbKF1/Ag+KfUO/6F3KUcHJM/+TTGTBYMtJrj
         pxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fpzq1IJyTN3+XLH7OodHaHJGoEjp28ZAcokHx0BKwM8=;
        b=A5nFlkx0wuGBGA6TMfPiYz6eUQQa6wRtyIzuyO1BFir29GxHI0URaw91AMUcWdEKar
         fDW12CbimFVRZYKzvifYnuR6chutwCFWPN0GVZBZKas/wt7B+WOttD/1divP+bDw3Fa6
         flBevjs9SM7b/1qc2CbmsESSM8uwOJE27UVKqGdXIOKh31RT2FKLaaFlhbVE1E7IfPxG
         bvzslBvMzc+uyeFsfyatIGrU/nHeCW3R12eG0GcEuTfrb+n2YbWeWPRMfSfwGu4yN9hT
         qb6O44tS+6CeGwx3Q34n0NUt/eNPeiLD4IcArfrRFR5ckQcMzWfs/rDmSUalbkzzPIlE
         UoNw==
X-Gm-Message-State: APjAAAUBvxzvfxoeDuR91xiVHxpTT3G/atPy5D5IgE0Q7TD0CNkwl81A
        a/8o4Y8x3fCMM2l957LFm3aK
X-Google-Smtp-Source: APXvYqxdLtY4XshCz+FNTJXBVbPVkfdMbdGtSuK9U+G+VAYToLM0bknoU7ihCSGgVowQBAlCe/CjAA==
X-Received: by 2002:a17:902:7612:: with SMTP id k18mr12190722pll.48.1566014335297;
        Fri, 16 Aug 2019 20:58:55 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:70a:af69:9185:a772:a21d:70ac])
        by smtp.gmail.com with ESMTPSA id u7sm8165596pfm.96.2019.08.16.20.58.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 20:58:54 -0700 (PDT)
Date:   Sat, 17 Aug 2019 09:28:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add Bitmain BM1880 SoC clock
 controller binding
Message-ID: <20190817035845.GD14652@Mani-XPS-13-9360>
References: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org>
 <20190705151440.20844-2-manivannan.sadhasivam@linaro.org>
 <20190808050128.E3DA52186A@mail.kernel.org>
 <20190817033422.GB14652@Mani-XPS-13-9360>
 <20190817034612.6DA7E21721@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190817034612.6DA7E21721@mail.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 16, 2019 at 08:46:11PM -0700, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2019-08-16 20:34:22)
> > On Wed, Aug 07, 2019 at 10:01:28PM -0700, Stephen Boyd wrote:
> > > Quoting Manivannan Sadhasivam (2019-07-05 08:14:36)
> > > > +It is expected that it is defined using standard clock bindings as "osc".
> > > > +
> > > > +Example: 
> > > > +
> > > > +        clk: clock-controller@800 {
> > > > +                compatible = "bitmain,bm1880-clk";
> > > > +                reg = <0xe8 0x0c>,<0x800 0xb0>;
> > > 
> > > It looks weird still. What hardware module is this actually part of?
> > > Some larger power manager block?
> > > 
> > 
> > These are all part of the sysctrl block (clock + pinctrl + reset) and the
> > register domains got split between system and pll.
> > 
> 
> And that can't be one node that probes the clk, pinctrl, and reset
> drivers from C code?

It is not a MFD for sure. It's just grouping of the register domains together.

Thanks,
Mani
> 
