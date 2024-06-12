Return-Path: <linux-clk+bounces-7959-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B7904E21
	for <lists+linux-clk@lfdr.de>; Wed, 12 Jun 2024 10:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C926287CE0
	for <lists+linux-clk@lfdr.de>; Wed, 12 Jun 2024 08:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435F216C871;
	Wed, 12 Jun 2024 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="UKgnTScl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gZtpl8gh"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B97156228;
	Wed, 12 Jun 2024 08:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718180893; cv=none; b=Y58xgU7Tj81WZZjDIMzbHnI1RtXyl3PlUBt8WRKXRP+D8IUaAO/pX7re7qQOqH21H8OzbKn6/p580H+OWbKfEqLbnOWlXMTiDRWYKLYYRRyOpUOKTLyDTvlhs+UABtQynkrqSeCfgWMEzOieqgYUbxc+ZRJZ2PnpYLTN09XHG8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718180893; c=relaxed/simple;
	bh=Z/UMuLs/o6dw5+2fKNFoU7Tw/Q8URKPY0UieXgL57uI=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Y5ex+d60BeNsuad4Z5x36kcxMRA98z3rPdkZPTrpYOj6evEI2CuXkOs4LtEYFURpOkxBlY4hGe6D07jacwfhhwMxm+UJLSLMEg60aXyxkk1YVRQB9fg+A3l3RVT8eJjo/Y9O3+UaalgELERdb5Rq8EscG2kvmHJVnqDTPZlJ7zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=UKgnTScl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gZtpl8gh; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id CF04A138016A;
	Wed, 12 Jun 2024 04:28:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 12 Jun 2024 04:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1718180890; x=1718267290; bh=Z/UMuLs/o6dw5+2fKNFoU7Tw/Q8URKPY
	0UieXgL57uI=; b=UKgnTScloM82nXFl0QWRnccEk7hIZ21llKzPlgXrvAeaxJ0R
	XYxbIKzrwsg1hU+3gGii3KWQ1dR9eWMldYkb67fz335olMN9CajILdnsf0rvdXPE
	IjUJTy8Scw/M2gjyrzD5+YrBcP3EK7wtyJ1PmM2QIRqAymsrDSQkdrSpvgta68ap
	xpmD2KRpg2MdtraXil/Kmr2AR2s4IOxPPAgJNDmnbAEJBSMiFW9jNfacPJ9KtQlX
	FbgzyVUSGodWEQ1SpaK8Dbjnfn9YtCBMR9+5Y5HsplQEQ/citWh1Ot/GcGyOphhq
	7v9kkbPeNrJfjJOwrZB5TrzCufegLgus06PbMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718180890; x=
	1718267290; bh=Z/UMuLs/o6dw5+2fKNFoU7Tw/Q8URKPY0UieXgL57uI=; b=g
	Ztpl8ghVaGfIg9b4AYxg6CuEi0EODFcYNrzT/HrJa6I3b6mTbZ7SqsVbafJo1Dwf
	ErN+g0/hVooloYWDHJ7DpgNJBxmkgYXjy+0oQ9QqKhhnUKIk6aNrdtHwAUsLAirK
	PGNtV8JpwkAX9Tl1H4Txff8Uh+E+zFLc5+rjB5ACLhMB6B//znV5OcuvMqE6QW0s
	4mTOVR9em7oFz0IwkU1OFIUBLk7qNiHfDdVMM6ONrogXszPZGMrWf+yh3mVlDsVy
	ViG1w3c7hRK6M7WjiZvkFY5NJh4GMxTeWL8/Rq9YaZ0a73u9grJzZ6GVujGrGU4/
	7yLfkeBR28LQOzhl7B0dg==
X-ME-Sender: <xms:GVxpZoTQgqT61sz_Z8rLWyXvu8XmpNAI3nZK1gipjo_Zb4yAYZbnfQ>
    <xme:GVxpZlx8r4wOqWcqr62v9H82R8Ha9LqUV7_Sg3yAyHrkUnhJyCJLQSJD5ZB3-mpbU
    y676Q21c7SjhQFaLw>
X-ME-Received: <xmr:GVxpZl3zovR4sP5fYqDmuOFP5adtO6zu13VkgvsPcY-Z_i43qDOMBIhRN7LIvtQ3Pq0fvC_ppHwppIwKmaX20bc227-oTrtp7xRNUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptgfghfggufffkfhfvegjvffosehtqhhmtdhhtdejnecuhfhrohhmpefthigr
    nhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrf
    grthhtvghrnhepkeeffffhtdeuvdejiedtueegueevgfejueegudfhieetgfdtfeevhffh
    feejjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:GVxpZsCYptSnYUCEeaEE0-fm2bkEA0OCI6lOuXtNHKOojwi7Z7rRng>
    <xmx:GVxpZhhOb8VPSZDaaHgBEws0uTjBJPawrYugGdFL0T3b6KItQhbXMA>
    <xmx:GVxpZopslF8SZw96-F5ZTacmMfXnf03aYZ_HvuhH3NmDkYX_wV5yfQ>
    <xmx:GVxpZkjEizmq9uPkFlaEoRPCAcEab6HQHQGh7Ai_U4V1bMYDElEMiw>
    <xmx:GlxpZsR8XtyFLeHod5is8DV11ILTQpd2tCEOqvETBhoYDy9lL1aOmXMK>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 04:28:09 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Ryan Walklin <ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH RFC 1/8] dt-bindings: bus: allwinner: add H616 DE33 bindings
Date: Wed, 12 Jun 2024 20:27:53 +1200
Message-Id: <E4874AEF-3C9D-4D71-B71D-1AF6AD77D238@testtoast.com>
References: <20240610-morbidity-slum-d733494f1939@spud>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
In-Reply-To: <20240610-morbidity-slum-d733494f1939@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: iPhone Mail (21F90)



> On 11 Jun 2024, at 4:32=E2=80=AFAM, Conor Dooley <conor@kernel.org> wrote:=


> Ahh, I didn't notice that " drm: sun4i: add Display Engine 3.3 (DE33)
> support" had a clk driver.
> That needs to go into a patch of its own.

Thanks, can certainly split that out.

Regards,

Ryan=


