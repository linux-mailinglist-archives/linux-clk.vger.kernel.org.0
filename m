Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2B448BDB4
	for <lists+linux-clk@lfdr.de>; Wed, 12 Jan 2022 04:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236491AbiALDhS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 11 Jan 2022 22:37:18 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:44516 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234465AbiALDhR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jan 2022 22:37:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BB60617E5;
        Wed, 12 Jan 2022 03:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63631C36AEA;
        Wed, 12 Jan 2022 03:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641958636;
        bh=29VZOk9VZTU0KI3sMTHWb1ZbhNj6D153fE/brbqOtCQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FIRXTiY+ALguH9vhx5ht0JcSD/v6zEng+0A//S7oeQMThG75am3lzYabn351xql0Z
         BB1V18LFZdnUp3JFObG0X6ymt4yVkwt/6gcFoDV5guq0ihzF6mCGn9uSEL2l0No484
         RGqQE3/vBNvvVLohL6SLt9/SquKJ0zI2ln1aZxemYWzkjy7bWPV2ARVafM8vO+OWRB
         X1Wo5yPi8qp0LvMCSYqU8CDjAVdjFSarfmKOOFPc8M1bFx03hUCk9eeXh8cgdP3PUt
         u71vIwNG+2AbbZAmyXg0GMWtrsp2HCUkJkr/purKg9jo91shjWUygMtB/xdqxd4QoS
         WzLBCfBMH7BNg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914093515.260031-2-maxime@cerno.tech>
References: <20210914093515.260031-1-maxime@cerno.tech> <20210914093515.260031-2-maxime@cerno.tech>
Subject: Re: [PATCH v2 1/3] clk: Introduce a clock request API
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org,
        Jerome Brunet <jbrunet@baylibre.com>
Date:   Tue, 11 Jan 2022 19:37:15 -0800
User-Agent: alot/0.9.1
Message-Id: <20220112033716.63631C36AEA@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sorry for being super delayed on response here. I'm buried in other
work. +Jerome for exclusive clk API.

Quoting Maxime Ripard (2021-09-14 02:35:13)
> It's not unusual to find clocks being shared across multiple devices
> that need to change the rate depending on what the device is doing at a
> given time.
>=20
> The SoC found on the RaspberryPi4 (BCM2711) is in such a situation
> between its two HDMI controllers that share a clock that needs to be
> raised depending on the output resolution of each controller.
>=20
> The current clk_set_rate API doesn't really allow to support that case
> since there's really no synchronisation between multiple users, it's
> essentially a fire-and-forget solution.

I'd also say a "last caller wins"

>=20
> clk_set_min_rate does allow for such a synchronisation, but has another
> drawback: it doesn't allow to reduce the clock rate once the work is
> over.

What does "work over" mean specifically? Does it mean one of the clk
consumers has decided to stop using the clk?

Why doesn't clk_set_rate_range() work? Or clk_set_rate_range() combined
with clk_set_rate_exclusive()?

>=20
> In our previous example, this means that if we were to raise the
> resolution of one HDMI controller to the largest resolution and then
> changing for a smaller one, we would still have the clock running at the
> largest resolution rate resulting in a poor power-efficiency.

Does this example have two HDMI controllers where they share one clk and
want to use the most efficient frequency for both of the HDMI devices? I
think I'm following along but it's hard. It would be clearer if there
was some psuedo-code explaining how it is both non-workable with current
APIs and workable with the new APIs.

>=20
> In order to address both issues, let's create an API that allows user to
> create temporary requests to increase the rate to a minimum, before
> going back to the initial rate once the request is done.
>=20
> This introduces mainly two side-effects:
>=20
>   * There's an interaction between clk_set_rate and requests. This has
>     been addressed by having clk_set_rate increasing the rate if it's
>     greater than what the requests asked for, and in any case changing
>     the rate the clock will return to once all the requests are done.
>=20
>   * Similarly, clk_round_rate has been adjusted to take the requests
>     into account and return a rate that will be greater or equal to the
>     requested rates.
>=20

I believe clk_set_rate_range() is broken but it can be fixed. I'm
forgetting the details though. If the intended user of this new API
can't use that range API then it would be good to understand why it
can't be used. I imagine it would be something like

	struct clk *clk_hdmi1, *clk_hdmi2;

	clk_set_rate_range(&clk_hdmi1, HDMI1_MIN, HDMI1_MAX);
	clk_set_rate_range(&clk_hdmi2, HDMI2_MIN, HDMI2_MAX);
	clk_set_rate_range(&clk_hdmi2, 0, UINT_MAX);

and then the goal would be for HDMI1_MIN to be used, or at the least for
the last call to clk_set_rate_range() to drop the rate constraint and
re-evaluate the frequency of the clk again based on hdmi1's rate range.
We could have a macro for range requests to drop their frequency
constraint like clk_drop_rate_range() that's a simple wrapper around 0,
UINT_MAX if that makes it easier to read.
