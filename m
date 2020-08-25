Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50593251A31
	for <lists+linux-clk@lfdr.de>; Tue, 25 Aug 2020 15:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgHYNx2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Aug 2020 09:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgHYNxZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Aug 2020 09:53:25 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A54C061574
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2020 06:53:24 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x5so2521946wmi.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2020 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=m5K7q4ntfOvCuWo9VcwV3Y8K7PEmWf/RHpOYApWqYOo=;
        b=p6qMNMd5VglEdqFcIL1iv1XVKPRZ+sI70S8iThAOM+4AcOZuWdjDKeIKcuVwOrv97l
         mlzPdyztvYgnW6wJDVCB3Zwj5L/YbWx44evE1cefrB4fkVlzOUNZGIK1bwBRlX34j8Vx
         rop3HtmimD+WJ70KqcQt4D6PQzT1TvsMJ/x9dio43yiqkEcoej/f4of2ZQlmhTfC4p+n
         WIxtyaIr6IzvFHkq73aPJzB8sua9bocWmlXJIpI7t5WUNXF+apZlgt3q1ncLtpusFoWn
         NSctCbUnOTq51icB0I75NTaV26VnEpI1kjT4ICWIZXkbN4xEi1Hp16oDmEPe/fetgm3z
         M2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=m5K7q4ntfOvCuWo9VcwV3Y8K7PEmWf/RHpOYApWqYOo=;
        b=hcXiO5XVWziEAuMc4Q+UOGLtFgixhd1NxHa1zYbk+aQli6xq5ns0W3e9C8RMdeQScY
         xhwqSZ/P6a1S8WUBpMVkWEL2GkFz8wsbUGejdApMCRD+EkRBON+jvv6fVgsIP3A1anCu
         meT/pmsD6oGGADzSxiADM1kvMoWwgMypABrCQnTKFt4Ds/M9EKAmUu2bhwPuyuLZ02Mh
         7HYQ9rO1W0aCd0DXGpTcNTSblTa2qf2zXXOTcEhaobcvkYznnbDEHjclcTzzf90mhK/+
         4oMSmU+lK5g6+Va3oJoG/nkfOZqI90P4V1+Ve45R43OM8DBLBopaEVRpv9brEkkqwl24
         Z1uQ==
X-Gm-Message-State: AOAM5312cULE/yOkLb4X5zC11JJRystbHbzBxuc96gVnlx0Wn8EFRv5H
        EPY7r3Ro2DOC74A+SC/VdoOloQ==
X-Google-Smtp-Source: ABdhPJy8k9/Nb4tlj+y4Bq+1w/ACN3QGov3SCl+s4GMHcCRvFUwVSFwb3GgE8g5wKq+pB2bBXE/pBA==
X-Received: by 2002:a1c:c90d:: with SMTP id f13mr2243927wmb.25.1598363603543;
        Tue, 25 Aug 2020 06:53:23 -0700 (PDT)
Received: from dell ([95.149.164.62])
        by smtp.gmail.com with ESMTPSA id h10sm30075699wro.57.2020.08.25.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 06:53:22 -0700 (PDT)
Date:   Tue, 25 Aug 2020 14:53:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Frank Lee <tiny.windzz@gmail.com>,
        Frank Lee <frank@allwinnertech.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, gregory.clement@bootlin.com,
        Thomas Gleixner <tglx@linutronix.de>, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        "p.zabel" <p.zabel@pengutronix.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        clabbe@baylibre.com, bage@linutronix.de,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, linux-i2c@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v5 00/16] Allwinner A100 Initial support
Message-ID: <20200825135320.GM3248864@dell>
References: <cover.1595572867.git.frank@allwinnertech.com>
 <CAEExFWsvScMgi_Dftfq06HZiF8CFAmym8Z_tgQoHHAfiGxWt0g@mail.gmail.com>
 <CAEExFWuwjmqAh0c3kMLS3Gs6UC2A8TtY-9nJeWxFPRDugtR4pA@mail.gmail.com>
 <20200824080327.GH3248864@dell>
 <20200825085532.vv4dpuzmjnshm5qn@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200825085532.vv4dpuzmjnshm5qn@gilmour.lan>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 25 Aug 2020, Maxime Ripard wrote:

> On Mon, Aug 24, 2020 at 09:03:27AM +0100, Lee Jones wrote:
> > On Mon, 24 Aug 2020, Frank Lee wrote:
> > 
> > > ping......
> > 
> > "Please don't send content free pings and please allow a reasonable
> >  time for review.  People get busy, go on holiday, attend conferences
> >  and so on so unless there is some reason for urgency (like critical
> >  bug fixes) please allow at least a couple of weeks for review.  If
> >  there have been review comments then people may be waiting for those
> >  to be addressed.  Sending content free pings just adds to the mail
> >  volume (if they are seen at all) and if something has gone wrong
> >  you'll have to resend the patches anyway so [RESEND]ing with any
> >  comments addressed is generally a much better approach."
> 
> This is true to some extent, but pinging after a month doesn't seem
> unreasonable either.

Pinging is mostly a fruitless exercise.

After a month, many Maintainers would have purged any un-serviced
mails anyway.  If a patch-set is left hanging, still requiring
attention before the next version, submitting a [RESEND] is generally
a better option.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
