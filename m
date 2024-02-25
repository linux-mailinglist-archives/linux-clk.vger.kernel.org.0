Return-Path: <linux-clk+bounces-4100-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD96862BD7
	for <lists+linux-clk@lfdr.de>; Sun, 25 Feb 2024 17:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92E512817D7
	for <lists+linux-clk@lfdr.de>; Sun, 25 Feb 2024 16:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FC617984;
	Sun, 25 Feb 2024 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="wzEYAgtx"
X-Original-To: linux-clk@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96775175B6;
	Sun, 25 Feb 2024 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708879600; cv=none; b=AsAstzvELbkHP/9zONbD1T+mXAkDk1U08uuZ5hKo2wpQj+/evBqs3Ul480mTgn2JAvFf6kTi5iGMYDUjC8Hi5oCNMkrGzQjS6dg9rCRdh60Ve8+FfxDWVkOgONVCkehWr/xmGPtebmyeIuzgwAMEW5e3RkUmTfyeAlfhIFLaMv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708879600; c=relaxed/simple;
	bh=0IaysRnkSUJ7kafD+lVXCwhXE6tPyPunpWCjBWUijxo=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 MIME-Version:Content-Type; b=S0BKGWqU7+LZBdxjpXAUPj2jxa5bnTizqSk8slIhQZ84jU+SlVw2PgIRtLn4tFzQfoI5jzphJRHKywsIJG18ryVBhD5jGlJWDsKnf9H3fQrh1TfFG9Q7ymHo/QCptGZg24s087hlAbjzIx+IIeS5KIv1vL2oFh7AdGmJ2gckP/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=wzEYAgtx; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4TjV512SKkz9sWt;
	Sun, 25 Feb 2024 17:46:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1708879589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KLvix7hOqGdcmlVqOW3S7yNP24rggDpe3G67MMT5Wy8=;
	b=wzEYAgtxIWOE/MbT9GVIjTxl0alloTW3tYRA4CooKsH2iJ+EVMMmWBKAO3MpOjbvNB5YTT
	ztRp6X8h/3VtEd4ymtHXM4ND8X0rocTb6GwwgEUUXFCFfF7GoC1aGzoIU8HplcwyqbErUH
	y5hVYMH17/cFwaleV7b2b3W10eGEOkIj25l/LOfuEKIRxKA+1TOpRtQx8mQi8IjmzRdgsy
	Y2XCYv54na1xCZWJAR3WP0hxIwzJDhJ31QFsLvRN8OZU+XtsmfP43cEPVXG+SZHUgKEPY6
	xkl7ArtkrKlI48AYkpYv3SgMkaqMACDWNbd0TCPDvWLLWEhuuX51TcHxNHu3Vg==
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-5-96a46a2d8c9b@oltmanns.dev>
 <poua4bzyciiwt65sqjf2whqfdumvoe4h3bkjpf64px2vwgumrf@sai73byg2iju>
 <87sf1zxb0s.fsf@oltmanns.dev>
 <ia7e7gqozltl5wkfdvwtf2rw2ko2dt67qxtuqbavsroyv4ifys@x4mbulqhhri5>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Guido
 =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Purism Kernel Team
 <kernel@puri.sm>, Ondrej
 Jirman <megi@xff.cz>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Icenowy Zheng
 <uwu@icenowy.me>
Subject: Re: [PATCH v2 5/6] drm/panel: st7703: Drive XBD599 panel at higher
 clock rate
In-reply-to: <ia7e7gqozltl5wkfdvwtf2rw2ko2dt67qxtuqbavsroyv4ifys@x4mbulqhhri5>
Date: Sun, 25 Feb 2024 17:46:16 +0100
Message-ID: <87o7c4mqzr.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Maxime,

On 2024-02-22 at 11:29:51 +0100, Maxime Ripard <mripard@kernel.org> wrote:
> [[PGP Signed Part:Undecided]]
> On Sun, Feb 11, 2024 at 04:42:43PM +0100, Frank Oltmanns wrote:
>>
>> On 2024-02-08 at 20:05:08 +0100, Maxime Ripard <mripard@kernel.org> wrote:
>> > [[PGP Signed Part:Undecided]]
>> > Hi Frank,
>> >
>> > On Mon, Feb 05, 2024 at 04:22:28PM +0100, Frank Oltmanns wrote:
>> >> This panel is used in the pinephone that runs on a Allwinner A64 SOC.
>> >> The SOC requires pll-mipi to run at more than 500 MHz.
>> >>
>> >> This is the relevant clock tree:
>> >>  pll-mipi
>> >>     tcon0
>> >>        tcon-data-clock
>> >>
>> >> tcon-data-clock has to run at 1/4 the DSI per-lane bit rate. The XBD599
>> >> has 24 bpp and 4 lanes. Therefore, the resulting requested
>> >> tcon-data-clock rate is:
>> >>     crtc_clock * 1000 * (24 / 4) / 4
>> >>
>> >> tcon-data-clock runs at tcon0 / 4 (fixed divisor), so it requests a
>> >> parent rate of
>> >>     4 * (crtc_clock * 1000 * (24 / 4) / 4)
>> >>
>> >> Since tcon0 is a ccu_mux, the rate of tcon0 equals the rate of pll-mipi.
>> >>
>> >> pll-mipi's constraint to run at 500MHz or higher forces us to have a
>> >> crtc_clock >= 83333 kHz if we want a 60 Hz vertical refresh rate.
>> >>
>> >> Change [hv]sync_(start|end) so that we reach a clock rate of 83502 kHz
>> >> so that it is high enough to align with pll-pipi limits.
>> >>
>> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>> >
>> > That commit log is great, but it's kind of off-topic. It's a panel
>> > driver, it can be used on any MIPI-DSI controller, the only relevant
>> > information there should be the panel timings required in the datasheet.
>> >
>> > The PLL setup is something for the MIPI-DSI driver to adjust, not for
>> > the panel to care for.
>> >
>>
>> I absolutely agree. It even was the reason for my submission of a
>> sunxi-ng patch series last year that was accepted, to make pll-mipi more
>> flexible. :)
>>
>> The only remaining option I currently see for adjusting the sunxi-ng
>> driver to further accomodate the panel, is trying to use a higher
>> divisor than 4 for calculating tcon-data-clock from tcon0. I remember
>> reading a discussion about this, but as far as I remember that proposal
>> was rejected (by you, IIRC).
>>
>> While I appreciate other suggestion as well, I'll look into options for
>> using a different divisor than 4.
>
> Like I said, I'm not against the patch at all, it looks great to me on
> principle. I just think you should completely rephrase the commit log
> using the datasheet as the only reliable source of the display timings.
> Whether sun4i can work around the panel requirements is something
> completely orthogonal to the discussion, and thus the commit log.
>

I was trying to follow the guidelines [1] for describing the reason
behind my changes to the panel. My original commit message was a lot
shorter, which, understandably, resulted in follow up questions [2].
With the current commit log, I'm trying to address those questions.
According to the device tree, the panel is only used in the pinephone.
The only reason for the change is that the SoC used by the only user of
this panel can not provide the rate the panel requests with the current
values. I think this information is relevant.

Unfortunately, as described in [2], I cannot back these values with any
datasheets because I couldn't find any. I could only find hints that
they are not publicly available. Icenowy (added to CC) submitted the
original values.

Best regards,
  Frank

[1]: https://www.kernel.org/doc/html/v6.7/process/submitting-patches.html#describe-your-changes
[2]: https://lore.kernel.org/lkml/87wmsvo0fh.fsf@oltmanns.dev/

>
> Maxime
>
> [[End of PGP Signed Part]]

