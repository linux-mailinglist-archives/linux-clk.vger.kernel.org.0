Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3565645F54
	for <lists+linux-clk@lfdr.de>; Wed,  7 Dec 2022 17:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiLGQzK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 7 Dec 2022 11:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLGQzE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Dec 2022 11:55:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4356177A;
        Wed,  7 Dec 2022 08:55:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD319B81F81;
        Wed,  7 Dec 2022 16:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC00C433D6;
        Wed,  7 Dec 2022 16:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670432101;
        bh=g2V0Wwn6EW5nnAQJVxm3ydv5yxtTxZ3faTwyKAV+Vng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qeakXi+qjXqru5YplfgJgzLRGD1+Kp+o1u0MtV7noIDhWiTg7e3xbj8jVEsQ96Fmv
         LlXtOYrRtAoKkmkW9F9lPuMN0YF8HUFGmbuu/XmUnh6ppKiyi82Q8cp8/iIKMNRzWM
         IMLQMMXKxv2yI0KcyYTf7j0fU1iWLIJyNJObT39c5/QSnhwnumB3UmD997BkKwb+4i
         91DwB8cxBiyad80jtnVTax/B81fD88ThFL6Ib+gQCxGQrez8M6+CZoApcaNceeVPB8
         j0prjEvp4t/dfe4FPo6dF4K9r9LaNvhtY1L9p1W/VaPEn/zZw16Csx6NCRIYYE4hfs
         pyjh1A6JwOZ0w==
Date:   Wed, 7 Dec 2022 10:54:57 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        krzysztof.kozlowski@linaro.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
Message-ID: <20221207165457.kwdwwiycbwjpogxl@builder.lan>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221201225705.46r2m35ketvzipox@builder.lan>
 <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Dec 07, 2022 at 05:00:51PM +0100, Ulf Hansson wrote:
> On Thu, 1 Dec 2022 at 23:57, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
> > >
> >
> > @Ulf, Akhil has a power-domain for a piece of hardware which may be
> > voted active by multiple different subsystems (co-processors/execution
> > contexts) in the system.
> >
> > As such, during the powering down sequence we don't wait for the
> > power-domain to turn off. But in the event of an error, the recovery
> > mechanism relies on waiting for the hardware to settle in a powered off
> > state.
> >
> > The proposal here is to use the reset framework to wait for this state
> > to be reached, before continuing with the recovery mechanism in the
> > client driver.
> 
> I tried to review the series (see my other replies), but I am not sure
> I fully understand the consumer part.
> 
> More exactly, when and who is going to pull the reset and at what point?
> 
> >
> > Given our other discussions on quirky behavior, do you have any
> > input/suggestions on this?
> >
> > > Some clients like adreno gpu driver would like to ensure that its gdsc
> > > is collapsed at hardware during a gpu reset sequence. This is because it
> > > has a votable gdsc which could be ON due to a vote from another subsystem
> > > like tz, hyp etc or due to an internal hardware signal. To allow
> > > this, gpucc driver can expose an interface to the client driver using
> > > reset framework. Using this the client driver can trigger a polling within
> > > the gdsc driver.
> >
> > @Akhil, this description is fairly generic. As we've reached the state
> > where the hardware has settled and we return to the client, what
> > prevents it from being powered up again?
> >
> > Or is it simply a question of it hitting the powered-off state, not
> > necessarily staying there?
> 
> Okay, so it's indeed the GPU driver that is going to assert/de-assert
> the reset at some point. Right?
> 
> That seems like a reasonable approach to me, even if it's a bit
> unclear under what conditions that could happen.
> 

Generally the disable-path of the power-domain does not check that the
power-domain is actually turned off, because the status might indicate
that the hardware is voting for the power-domain to be on.

As part of the recovery of the GPU after some fatal fault, the GPU
driver does something which will cause the hardware votes for the
power-domain to be let go, and then the driver does pm_runtime_put().

But in this case the GPU driver wants to ensure that the power-domain is
actually powered down, before it does pm_runtime_get() again. To ensure
that the hardware lost its state...

The proposal here is to use a reset to reach into the power-domain
provider and wait for the hardware to be turned off, before the GPU
driver attempts turning the power-domain on again.


In other words, there is no reset. This is a hack to make a normally
asynchronous pd.power_off() to be synchronous in this particular case.

Regards,
Bjorn
