Return-Path: <linux-clk+bounces-7888-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3FF90145E
	for <lists+linux-clk@lfdr.de>; Sun,  9 Jun 2024 05:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C29321C20AB6
	for <lists+linux-clk@lfdr.de>; Sun,  9 Jun 2024 03:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2756AD7;
	Sun,  9 Jun 2024 03:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="BKk+ta52";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MSJPQ9QI"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF07C138;
	Sun,  9 Jun 2024 03:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717903468; cv=none; b=LNofUH7FSNfm32Hnr/EJxDOnbka178MiDQ9Va7Xmf6Fo7wa2werBDqMwzpp0iOmVzgdIX3qP8I5KZAb/c3K1T7cseQ41OXk6se+b3o768jdvO6aVPN7ePf7wYAgAhoYy/G6AcQ9++gfvNcqYhZqUIf2VtKFs/OjC4tDwZPRQFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717903468; c=relaxed/simple;
	bh=nnBF7siKGaRQDQ6aerGHINxyaNRt/yxBE7c3TRJUhFM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=vCehkcpyHvTitjegK/D1GRzApXZOszHCaZ0x5V0CKZ+HddPNBXuoiLbnaUucd7DjHNtXVIhxYhf44G6BlH33alT/eGvI40fZE53QqLc5kPw7fTh7hHqpGC0aqlxfx+BGKF5XyxvJbajkKawyQTe5rUqYodwnhDMUiEuqCFAPUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=BKk+ta52; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MSJPQ9QI; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0988C11400D1;
	Sat,  8 Jun 2024 23:24:25 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Sat, 08 Jun 2024 23:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1717903465; x=
	1717989865; bh=nnBF7siKGaRQDQ6aerGHINxyaNRt/yxBE7c3TRJUhFM=; b=B
	Kk+ta5222eQf5DPK6prPs526sbG4F9QQTCVQBti/nP9PviQFHjz0INVPa0xfYyxT
	TmEOXDj5cHbBEm2L+vF9nOmJKmmrAgnTE4NV+I4Xbms5JkY8AQA9ilpdNBJ5ZEMd
	F7y/b2e+FkqP5wA1cYgbETAlVtM5rZTsSBoR8XGVaYKRD2twTSLJeH0ilDHFM+qF
	LivXdyG4G6SB5kpU6EPPj8k2OmE7ln8pxG9mPngc/TFeMuD6Pm/4x75jpIHxC2Jl
	zlrP1z1gHnJzEfz3c4mk0E9o7v6SrfO6IUaseWy/VC3Xwc1JuJea56IeQtWRA8oM
	2kBobGhIxLeyuglX9bhgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717903465; x=1717989865; bh=nnBF7siKGaRQDQ6aerGHINxyaNRt
	/yxBE7c3TRJUhFM=; b=MSJPQ9QIlr4ygV7QNPN/Si+UtkH4CfcjUk6xsLe1iWPM
	24+i3srzRiBYYATw0pStvQQEILTBd++Fdr4AbTO9HwG8R9/Imx/KwjL/Bq1DHnp1
	CKBht0eNMs3U/55FO06Ne8mAchgaJ/Cs1+rF6jS/OycoAiS37FyzixCqR+JjI2V1
	xhlXwWJrTteNT5kDVB4eB342Bxjvt3UBlJWPD+3PsNLDm815PhDbZc7q6wpiciVm
	X8nhibMHKRpzPWGbSX0qaDE1NDXlxXGVWu/lECR+CXRJMjV3jy/A4Knt9j3ZBADl
	EtscSd9EbDjnf9dlwF4eKaTXeljae5DVSAgW2MGpog==
X-ME-Sender: <xms:aCBlZtzq4Iej0v4z0pQjzmzACck0ZpOueps8_w-52nD-H8dlWsztjw>
    <xme:aCBlZtTDi4Cx9A8tvsGOaBgxc0DRC1IZj2fewqtW_0LLx7tBBbC0WEMcR17mAoNAE
    HxI-yRcp3Uw84TSew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedthedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
    rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
    ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
    ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:aCBlZnUxQ6Q07T376-AdZt-Uig0J_aza8YikRTZJvMoc1VdcJgtdDg>
    <xmx:aCBlZviYyqHmD7U2d-9mB8KUiHza5XZPWhqhxuSUb-SG25-EnwE4qA>
    <xmx:aCBlZvC1lTmxvNjqAm9661U-860GiTz7yShZUw-kxMNHRQvhPvkbNw>
    <xmx:aCBlZoKzWmCsCEHPSYV5pu-pZ4cOlqGoP2Df6ms-iKUtIg7ZAG-ODg>
    <xmx:aCBlZuAgU3Vzt00mK_NWRLSxA907WXH6k4uFtXtTpebV7EOg6K5EatSb>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A6403A60078; Sat,  8 Jun 2024 23:24:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <11376802-7c04-4779-9dac-f41301a64b60@app.fastmail.com>
In-Reply-To: <20240607153250.51906e89@donnerap.manchester.arm.com>
References: <20240607110227.49848-1-ryan@testtoast.com>
 <20240607110227.49848-8-ryan@testtoast.com>
 <20240607153250.51906e89@donnerap.manchester.arm.com>
Date: Sun, 09 Jun 2024 15:24:03 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Chris Morgan" <macroalpha82@gmail.com>,
 "John Watts" <contact@jookia.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 7/8] drm/sun4i: de3: Implement AFBC support
Content-Type: text/plain

On Sat, 8 Jun 2024, at 2:32 AM, Andre Przywara wrote:

>> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

> This signature suggests that it's indeed Jernej's patch, so it should
> have his authorship, as in the other patches, indicated by a line starting
> with "From:" before the commit message.

Thanks Andre, no this is Jernej's work, I have simply minimally refactored to as cleanly as possible just support the DE33 with this set, and added the device-tree binding docs. My mistake in my git client pulling in his patches, will correct authorship for v2.

> "Co-developed-by:" is only used if the patch really has two authors, both
> having contributed significantly to the patch.
> If you merely post a patch from someone else, then it just needs your
> Signed-off-by, as you correctly do below.
>
> That applies to the other patches as well.

Thanks, noted. Will correct in v2.

> Cheers,
> Andre

Regards,

Ryan

