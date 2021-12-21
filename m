Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC2347BE36
	for <lists+linux-clk@lfdr.de>; Tue, 21 Dec 2021 11:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbhLUKj2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Dec 2021 05:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhLUKj2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Dec 2021 05:39:28 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB525C061574
        for <linux-clk@vger.kernel.org>; Tue, 21 Dec 2021 02:39:27 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id y7so10461568plp.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Dec 2021 02:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OKwtJBcsU+KGenhnkPUish86uil7JAo87n3Fj1EyeVU=;
        b=VvezOSjPnpJorYhv7DNh8w4QJoPnmnM6MTc8XB0eWK/BPS1hMEV7GCb13xCvWTh/tH
         J11G2G2zw60qufmBOoUnXGnpyae4YLpCI8kCDaliNTqTQmMGvEAN5L7VqQ3++KaDrCUc
         6qD6CNmebCVofzrOWvhisphqeLy3lotjq2GrqMjo5fC8aPEsXktHMYAg93HxYUqo0BIM
         dc8Yn+czwZBBTMlDSee2lnm2Siiqu4c7Muqn0EkW/TwMuo+5cZG+qztRKhVrtkGi+acr
         G9xDd4B79r4VzZ15uo3CSD2Ktx6pJuXUbh8GILR8PyK4dJM84t8gmIp69mNaC36fJuM3
         tpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OKwtJBcsU+KGenhnkPUish86uil7JAo87n3Fj1EyeVU=;
        b=SFgTDUcPTQB1MPLXA8knorWdGh+JXOGkv2J3S7pO7AoP/B50g9vOBPpR9i68Ra2bpN
         ohMHjiUygvqMYTIc0URSgCAYE8V8SwfJEabMAn8kZCvhSxyv3s7Z6S0pgTfcwuxP+nc7
         oSlpAuQTHjaLWV307SVOJKooXralf8wdC+0ha72+l1U/PXmR3w9kXSmxaVKqBaE88gjO
         bVzZ7MQY+o/s1LtFqieWYO+yZ1MBCXUt/i/r5cFWafBQ/8KmNBK+yZE6EVHXxLpMwHhS
         ndC8zFubxf/TMOCJjLw5NqErdmkDJKAQKdT7kyFwANQRwB72xR2pD4f095ET3MtRyz/1
         18Dg==
X-Gm-Message-State: AOAM530rWoGlk3qDVgV6EpyeDjc66gfYBC1lkUD9I+8mW1mYi2mbRAxw
        gtsppbS7NfKMGhmAz3c7lUH/vl1dU56jxVHS4KONvw==
X-Google-Smtp-Source: ABdhPJyWyxk6opdxp188WP0pJhEVQ+v4B+km1duz3n74xfRqoSLa7QkUJq0CnRr2c2KGWlpBamMdnlIsKPuH60nme2c=
X-Received: by 2002:a17:902:9349:b0:148:b21c:5875 with SMTP id
 g9-20020a170902934900b00148b21c5875mr2508439plp.51.1640083167188; Tue, 21 Dec
 2021 02:39:27 -0800 (PST)
MIME-Version: 1.0
References: <1639994084-25447-1-git-send-email-loic.poulain@linaro.org> <YcEUrtQuJ5CGF2RW@ripper>
In-Reply-To: <YcEUrtQuJ5CGF2RW@ripper>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 21 Dec 2021 11:50:55 +0100
Message-ID: <CAMZdPi9g9x0Rn4YUwcLrZ5M23i3EzJOuUfh3MXFVM7pscQx5Tw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: CLK_OPS_PARENT_ENABLE flag for
 rcg2 clocks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mike Tipton <quic_mdtipton@quicinc.com>, agross@kernel.org,
        sboyd@kernel.org, shawn.guo@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Bjorn,

On Tue, 21 Dec 2021 at 00:40, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 20 Dec 01:54 PST 2021, Loic Poulain wrote:
>
> > When a rcg2 clock migrates to a new parent, both the old and new
> > parent clocks must be enabled to complete the transition. This can
> > be automatically performed by the clock core when a clock is flagged
> > with CLK_OPS_PARENT_ENABLE.
> >
> > Without this, we may hit rate update failures:
> > gcc_sdcc2_apps_clk_src: rcg didn't update its configuration.
> > WARNING: CPU: 1 PID: 82 at drivers/clk/qcom/clk-rcg2.c:122 update_config+0xe0/0xf0
> >
> > Fixes: 496d1a13d405 ("clk: qcom: Add Global Clock Controller driver for QCM2290")
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/clk/qcom/gcc-qcm2290.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
> > index b6fa7b8..9e1d88e 100644
> > --- a/drivers/clk/qcom/gcc-qcm2290.c
> > +++ b/drivers/clk/qcom/gcc-qcm2290.c
> > @@ -674,6 +674,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
> >               .name = "gcc_usb30_prim_mock_utmi_clk_src",
> >               .parent_data = gcc_parents_0,
> >               .num_parents = ARRAY_SIZE(gcc_parents_0),
> > +             .flags = CLK_OPS_PARENT_ENABLE,
>
> This seems like a correct fix for the obvious problem that we might end
> up invoking clk_set_rate() and clk_set_parent() for these clocks while
> their (and thereby themselves - in a software sense) are disabled.
>
>
> However, clocks that downstream are marked "enable_safe_config", may in
> addition be enabled by the hardware, behind out back. As such we must
> ensure that they always have a valid configuration, we do this by
> "parking" them on CXO whenever we're going to disable their parent
> clocks.
>
> Upstream we handle this by using the clk_rcg2_shared_ops, which will do
> exactly this.

Ok, thanks for the explanation, so we actually need both
clk_rcg2_shared_ops and CLK_OPS_PARENT_ENABLE, the former parking the
clock under always-on CXO (safe source), allowing hardware to toggle it
on its own. The latter allows safe parent switching by enabling the
new parent clock before update (and old parent, but we don't care
since we are actually parked on CXO) . Is that correct?

> PS. Unfortunately these RCGs doesn't allow us to reliably implement
> is_enabled() and as such clk_disable_unused() will skip parking the
> unused clocks and continue to disable the PLLs feeding them (if they are
> unused). I don't think this is a problem for the clocks you list here,
> but we certainly have a problem with this in the dispcc. So this is
> currently being discussed. For now it's expected that booting without
> "clk_ignore_unused" is "broken".

Ok, understood thanks.


Loic
