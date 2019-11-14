Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184F7FCB60
	for <lists+linux-clk@lfdr.de>; Thu, 14 Nov 2019 18:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfKNREx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 Nov 2019 12:04:53 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45038 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfKNREx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Nov 2019 12:04:53 -0500
Received: by mail-pf1-f194.google.com with SMTP id q26so4628109pfn.11
        for <linux-clk@vger.kernel.org>; Thu, 14 Nov 2019 09:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7XNWyfRdpr24EDRK/YG4453Ghr8ygX346m8X217SNQk=;
        b=ikXpotm3ypGRzwDkA+uphqKs6Dhwb2Qw18UsqiRmq5sPAqVh5d81UujkZgsBcLbYUs
         orLk0ElMmQFW/QZL09vIzyTKMmHONg1T0QWhix83z2rnzzjahD+5pHvanSmFGJ+I1kdu
         QlH5lcyADhMoPjdHiZHucRDMNKQSgpv5cLQ5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7XNWyfRdpr24EDRK/YG4453Ghr8ygX346m8X217SNQk=;
        b=Z1RRC6Ro3Tfs5IKWAIveKh4timzgwUfoNFwOpy3D1T4tZgMSF7ioX3TyHFBmRUULo+
         aUbFtz5qK5xVoB5T7ZvvA+yPUwVGjCrwI8TIS+ZDHcAF+Bx09oEqCkY/tw4SwF82xYg/
         tVF1WHCr657n2q7V8vy63uf9S494yaAkBIqO7ohirSYEkHC2muGMWX9wdU25hvl8nZJZ
         z0W/IJHqZCSZIQ36y6TZ5vgGM8/iYW/o9suSjuyq7Gf8sYZbAoCX++s+UCW5BgxiOBkV
         2Mlr/zMvwl4Yqq47vqMAWK1qchhtxHOS8D4nlp6COZ8qXq9VoOSbYuzcSKFc6QqueIYQ
         hLfQ==
X-Gm-Message-State: APjAAAWLbJbjIRAisLwerunmDMIBJOuUBdWNdIo/CNY+HmXSqyGHaHY0
        5SyH/B2VcBZNf6E5pgZj89WYVA==
X-Google-Smtp-Source: APXvYqxD2nMjn0cIqRXmT160OiBVgzqRoINItXt56fZxYK5ysqshErWGVdbKL+cNJ7zKy9hD6znPkg==
X-Received: by 2002:a17:90a:4d8f:: with SMTP id m15mr3627528pjh.71.1573751092047;
        Thu, 14 Nov 2019 09:04:52 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id a6sm8558346pja.30.2019.11.14.09.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 09:04:51 -0800 (PST)
Date:   Thu, 14 Nov 2019 09:04:49 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v4 5/5] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
Message-ID: <20191114170449.GG27773@google.com>
References: <fa17b97d-bfc4-4e9c-78b5-c225e5b38946@codeaurora.org>
 <20191031174149.GD27773@google.com>
 <20191107210606.E536F21D79@mail.kernel.org>
 <CAJs_Fx60uEdGFjJXAjvVy5LLBXXmergRi8diWxhgGqde1wiXXQ@mail.gmail.com>
 <20191108063543.0262921882@mail.kernel.org>
 <CAJs_Fx5trp2B7uOMTFZNUsYoKrO1-MWsNECKp-hz+1qCOCeU8A@mail.gmail.com>
 <20191108184207.334DD21848@mail.kernel.org>
 <CAJs_Fx6KCirGMtQxE=xA-A=bd5LeuYWviee0+KqO5OtGT9GKEw@mail.gmail.com>
 <20191114010210.GF27773@google.com>
 <CAF6AEGv9+Ow=RCXGKmaANfmA2NtR32E07CKwGFKJbeeOJRP9=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGv9+Ow=RCXGKmaANfmA2NtR32E07CKwGFKJbeeOJRP9=Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 13, 2019 at 09:30:57PM -0800, Rob Clark wrote:
> On Wed, Nov 13, 2019 at 5:03 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > On Fri, Nov 08, 2019 at 11:40:53AM -0800, Rob Clark wrote:
> > > On Fri, Nov 8, 2019 at 10:42 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > > >
> > > > Quoting Rob Clark (2019-11-08 08:54:23)
> > > > > On Thu, Nov 7, 2019 at 10:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > > >
> > > > > > Quoting Rob Clark (2019-11-07 18:06:19)
> > > > > > > On Thu, Nov 7, 2019 at 1:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > NULL is a valid clk pointer returned by clk_get(). What is the display
> > > > > > > > driver doing that makes it consider NULL an error?
> > > > > > > >
> > > > > > >
> > > > > > > do we not have an iface clk?  I think the driver assumes we should
> > > > > > > have one, rather than it being an optional thing.. we could ofc change
> > > > > > > that
> > > > > >
> > > > > > I think some sort of AHB clk is always enabled so the plan is to just
> > > > > > hand back NULL to the caller when they call clk_get() on it and nobody
> > > > > > should be the wiser when calling clk APIs with a NULL iface clk. The
> > > > > > common clk APIs typically just return 0 and move along. Of course, we'll
> > > > > > also turn the clk on in the clk driver so that hardware can function
> > > > > > properly, but we don't need to expose it as a clk object and all that
> > > > > > stuff if we're literally just slamming a bit somewhere and never looking
> > > > > > back.
> > > > > >
> > > > > > But it sounds like we can't return NULL for this clk for some reason? I
> > > > > > haven't tried to track it down yet but I think Matthias has found it
> > > > > > causes some sort of problem in the display driver.
> > > > > >
> > > > >
> > > > > ok, I guess we can change the dpu code to allow NULL..  but what would
> > > > > the return be, for example on a different SoC where we do have an
> > > > > iface clk, but the clk driver isn't enabled?  Would that also return
> > > > > NULL?  I guess it would be nice to differentiate between those cases..
> > > > >
> > > >
> > > > So the scenario is DT describes the clk
> > > >
> > > >  dpu_node {
> > > >      clocks = <&cc AHB_CLK>;
> > > >      clock-names = "iface";
> > > >  }
> > > >
> > > > but the &cc node has a driver that doesn't probe?
> > > >
> > > > I believe in this scenario we return -EPROBE_DEFER because we assume we
> > > > should wait for the clk driver to probe and provide the iface clk. See
> > > > of_clk_get_hw_from_clkspec() and how it looks through a list of clk
> > > > providers and tries to match the &cc phandle to some provider.
> > > >
> > > > Once the driver probes, the match will happen and we'll be able to look
> > > > up the clk in the provider with __of_clk_get_hw_from_provider(). If
> > > > the clk provider decides that there isn't a clk object, it will return
> > > > NULL and then eventually clk_hw_create_clk() will turn the NULL return
> > > > value into a NULL pointer to return from clk_get().
> > > >
> > >
> > > ok, that was the scenario I was worried about (since unclk'd register
> > > access tends to be insta-reboot and hard to debug)..  so I think it
> > > should be ok to make dpu just ignore NULL clks.
> > >
> > > From a quick look, I think something like the attached (untested).
> >
> > The driver appears to be happy with it, at least at probe() time.
> 
> Ok, I suppose I should re-send the dpu patch to the appropriate
> lists.. does that count as a Tested-by?

Ack
