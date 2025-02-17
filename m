Return-Path: <linux-clk+bounces-18078-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFEFA36AC3
	for <lists+linux-clk@lfdr.de>; Sat, 15 Feb 2025 02:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CE9718949A2
	for <lists+linux-clk@lfdr.de>; Sat, 15 Feb 2025 01:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED533B1A4;
	Sat, 15 Feb 2025 01:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Hl2dxZXe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FvlWvLG9"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73679179BF;
	Sat, 15 Feb 2025 01:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739582363; cv=none; b=FmOH2jR5fHqsyMFrbrbdXW+nH8QbU1IUnYFHAu1SyaNkz23ovXC4UiLYDv2FQBhyzZ50AvlCtyqoBK67ODWKGpmezI3L2tBqoPDzKK2tUQtndHv8aUzy+onmufaSliQ6j72hQqGeOegstUPMGtfzFFovxwh8dbERRH4f52cvjcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739582363; c=relaxed/simple;
	bh=9Zw9qHIbO/o2Y8OUY8DklygHPOBEGYyoTippFvP87eM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=W898jMKi25Y1Zbice/2wJtI6Z02/V+anzOrbyoYDpW4IrRGrYF18+dEa/p/yyxyaSD3nlcB8LHXu/IPn3rFdTw4e/Iz1buAI0tWRqJV5KqdcuftwRFRYBUBAgNKQwq+0eLDNGhac8BFNZL7u3smfvL0mVBDRn0DNkpq0jxnZt3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Hl2dxZXe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FvlWvLG9; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6BC6D11401B6;
	Fri, 14 Feb 2025 20:19:20 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Fri, 14 Feb 2025 20:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1739582360; x=1739668760; bh=tOuJgsb9reT9v24EZ+TEHw2W8peMs2Gz
	sTIwm6goNGc=; b=Hl2dxZXeV307gE122iJ/3jRfFeTDxZQISO5FBFwIgCvbs1YP
	wlQSzTfHHGgfDCSf33uabD+jcQ/2J+kDGe3EXgl6CVJOQxMZ4BAEM5VwWxt1HXqk
	9OuiO7JMiFpCk3ApcVeW43JiwT0PbPyJWCZOXWnkUhHm5XzH3Cd/CZu3VAkwpcsi
	MHEY/eNmSzIuA1Sf83jhjQRJ0YF107EhoS860ucNxGMRLcePEsL5b84978STsWFz
	HqZBmn/KHUcUWLoO2iQJLLxhJHvt6NlWNT6kfODpJRyu+zpRZeahwSuTDEoBhMkH
	mTQXVxpLYMyYYG7Lztqxjs77wEE3XbYccaQlwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739582360; x=
	1739668760; bh=tOuJgsb9reT9v24EZ+TEHw2W8peMs2GzsTIwm6goNGc=; b=F
	vlWvLG99wUSOP/zMRkP9qVr+B/2dTNe9AqxVr/mKKNc091mS3zqVrQaXyBthor6E
	h3Gi01UYL62L1mCUPEc8zgpIpyO7th9jNVXOz0hnrh2620vFL0zdm5TFnjibaxYj
	d8Yrbyz84MBTgHzs4ByzZWeUxrwtAUJ9NjotRP/1z4IXmWTMhxQLIyrStHAecjU5
	qOLyqJYS3nr/zJcCeb3REIOP4keYza2EoF1pLP1RvHu7X5W1xLnDeVqXbISURuaj
	YxSvtk64lz1qunGsuK96u8qYQT3ehZmoikZjpotygo0TuyZP9sAg++o4iyRQ8OwD
	N+g+r9C27UMzGyYgm6XHg==
X-ME-Sender: <xms:mOuvZ58osQ0I3vOmGKfQdpQBY83_i83DfAdI1HvRkVEiTHu7nuOEMQ>
    <xme:mOuvZ9tBd5v0DM5FjV4xHRfRyyqqcMDevNG9toTbWfUfQ47ox966KmbitaTyH25U-
    UlIU4ixnQP3lM1efQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehuddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
    vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
    dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
    ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
    esghhmrghilhdrtghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghi
    lhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mOuvZ3AkNu5FEzvDhjznN9rdipvJ5mHnqNeSuE_PNojHd9hrZ3GCUg>
    <xmx:mOuvZ9eP7Q2NP4e19l68Xa3Ayi3Xa_JDMDbqWUZM17dql_ttn57l0g>
    <xmx:mOuvZ-Ms2aUq_dCBvtstZfX12jE7Pg0D0K-hYv-Lgy7o6ecsb4JeIA>
    <xmx:mOuvZ_mq9nez5yynAmFWQX2RcXkvq5vB-b_HS8xMf6VWMfpwfc7zlA>
    <xmx:mOuvZ6srJHxh6iK0HRdurHbPvILiwIhGlkJpRxXqAmBtbtDB62vIttO7>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 408AEBA0070; Fri, 14 Feb 2025 20:19:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 14:18:59 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Message-Id: <4c31826f-0ffa-4ada-bcf9-199fcbe6db07@app.fastmail.com>
In-Reply-To: 
 <4cumvwkhmbi7fecjeq6r7elon63u3ytootqcvavjg5vfnargy3@wrjpy6pnphmb>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-9-ryan@testtoast.com>
 <4cumvwkhmbi7fecjeq6r7elon63u3ytootqcvavjg5vfnargy3@wrjpy6pnphmb>
Subject: Re: [PATCH v5 08/26] drm: sun4i: de3: add YUV support to the DE3 mixer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sun, 20 Oct 2024, at 3:14 AM, Dmitry Baryshkov wrote:
> On Sun, Sep 29, 2024 at 10:04:40PM +1300, Ryan Walklin wrote:

>> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
>> index c48cbc1aceb80..ffafc29b3a0c3 100644
>> --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
>> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h

>> @@ -151,6 +153,9 @@ struct sunxi_engine {
>>  
>>  	int id;
>>  
>> +	u32				format;
>> +	enum drm_color_encoding		encoding;
>
> Should these be a part of the state instead of being a part of the
> sunxi_engine?

Sure, would you suggest in sun8i_mixer_cfg?

Regards,

Ryan

