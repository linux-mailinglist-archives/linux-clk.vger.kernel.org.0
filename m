Return-Path: <linux-clk+bounces-16239-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B789FB41E
	for <lists+linux-clk@lfdr.de>; Mon, 23 Dec 2024 19:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD0431647EF
	for <lists+linux-clk@lfdr.de>; Mon, 23 Dec 2024 18:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A591C1F22;
	Mon, 23 Dec 2024 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o8YbE1A8"
X-Original-To: linux-clk@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034651B3939;
	Mon, 23 Dec 2024 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734979400; cv=none; b=i92PM0S9/huDVR6fSs634Jk7RjouNCaLTEMChpK+ye0IMc/xaOD+rcc5o9jrqil2N+Ch3aA3MxCqjT1wwdDtMFaR/c0nWmYzyERV6ql9YWFlfiDhu+X8ZulQtk/uEWKdJNVE+kXgo6fC+pVmq3DPnR0FyCAYwxVuC+fcy7Hzufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734979400; c=relaxed/simple;
	bh=tAYHojWDBj7aASE78SJBwyqHmLpbCeHQhFPsRBYYZkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ChpzfRawWMhlc8feBwedyu8rWuWlQ/w1AsRVZy5dEE5qOi9xwDe/v8ilTes8klXBOKC32gABzr6mP2YhC3hlShJEkppYs7Fuaw0q3XP2YU6LhKVtsVRsJldY4Og+sePfZBFSxHhWJeDdsCEaI3/BKlWeZoRZ+e2Ysw14ILn8744=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o8YbE1A8; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFFA460005;
	Mon, 23 Dec 2024 18:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734979396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vC2iV4OwakMwa517Uq3365YZVqec+LRelz4Fh+drw5s=;
	b=o8YbE1A8M5Wk+WJj303PoOyMqOb3lY0FmnkCryQ1Duhok7CFcWDa8XGO47pLGkA2rnRHPO
	IrxXHjgdYedODe7iN5BhJMjYRT8kl2AuRydSgOGRRmh+xF0CS00L40MO5XLXOBoeZi/Glv
	rcsrsUPuruiYvn6ocB5PoVR6238/qyidXY6ZnhHdA97QT8fwNYPJgV64EFzEM3IJqAyX8X
	S2juydpWqTBfonB6B3QFlqOyrpfxAkHh3xl02I+eXnnGB67G77CmotkgjZ3u7t3gaFU546
	rDvRC2M2aAPXqe1y7YoG8jcv7RIau0BWsTEVPYGkkL3YB5AkN32byaqG6Q04Bg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Abel Vesa <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Ying Liu <victor.liu@nxp.com>,  Marek Vasut
 <marex@denx.de>,  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  linux-clk@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  Abel Vesa <abel.vesa@linaro.org>,
  Herve Codina <herve.codina@bootlin.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
In-Reply-To: <20241217-brown-wapiti-of-promotion-e3bec6@houat> (Maxime
	Ripard's message of "Tue, 17 Dec 2024 13:47:53 +0100")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
	<20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
	<20241217-brown-wapiti-of-promotion-e3bec6@houat>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 19:43:13 +0100
Message-ID: <87bjx2tf3y.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Maxime,

On 17/12/2024 at 13:47:53 +01, Maxime Ripard <mripard@redhat.com> wrote:

> On Thu, Nov 21, 2024 at 06:41:14PM +0100, Miquel Raynal wrote:
>> There are mainly two ways to change a clock frequency.
>
> There's much more than that :)

"mainly"

Or maybe I should have added "on purpose".

>
> Off the top of my head, setting/clearing a min/max rate and changing the
> parent might also result in a rate change.
>
> And then, the firmware might get involved too.
>
>> The active way requires calling ->set_rate() in order to ask "on
>> purpose" for a frequency change. Otherwise, a clock can passively see
>> its frequency being updated depending on upstream clock frequency
>> changes. In most cases it is fine to just accept the new upstream
>> frequency - which by definition will have an impact on downstream
>> frequencies if we do not recalculate internal divisors. But there are
>> cases where, upon an upstream frequency change, we would like to
>> maintain a specific rate.
>
> Why is clk_set_rate_exclusive not enough?

I am trying to protect these rate changes from subtree walks, I don't
see where setting an exclusive rate would have an effect? But I might be
overlooking something, definitely.

...

>> @@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core *cor=
e)
>>  {
>>  	struct clk_core *child;
>>=20=20
>> -	core->new_rate =3D clk_recalc(core, core->parent->new_rate);
>> +	if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
>> +		core->new_rate =3D clk_determine(core, core->rate);
>> +		if (!core->new_rate)
>> +			core->new_rate =3D clk_recalc(core, core->parent->new_rate);
>> +	} else {
>> +		core->new_rate =3D clk_recalc(core, core->parent->new_rate);
>> +	}
>
> Sorry, it's not clear to me how it works. How will the parent clocks
> will get notified to adjust their dividers in that scenario? Also, what
> if they can't?

The idea is: if the flag is set, instead of accepting the new upstream
rate and recalculate the downstream rate based on a previously set
divider value, we change our divider value to match the same frequency
as before. But if we cannot, then we just keep the old way.

Cheers,
Miqu=C3=A8l


