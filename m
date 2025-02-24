Return-Path: <linux-clk+bounces-18599-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B6BA427EA
	for <lists+linux-clk@lfdr.de>; Mon, 24 Feb 2025 17:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BC4C1619EF
	for <lists+linux-clk@lfdr.de>; Mon, 24 Feb 2025 16:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B590260A5B;
	Mon, 24 Feb 2025 16:28:03 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE9325485D
	for <linux-clk@vger.kernel.org>; Mon, 24 Feb 2025 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740414483; cv=none; b=sGrL5GHhlPujV9hyW1rcb8n/DUs2I+gbbo21xb4J1NCEV0JwXHhltn+6Z8Zle2XU7TA+IYeyAYk8vJbYzW7cjp4vIgx32Hji583RMyHGaU5D3zL/GyOkK/Gvv0JcKWwvSNWE4+q+2KvrRER5mlDQTgHF6KpGEZw8EPBFOEysQak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740414483; c=relaxed/simple;
	bh=FaoeYT/iHjZi1G6SmKpRmaQNHEWG3shJOhqhR6BNlxo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ap7/HpZCko5lv9W3rRGuBJLmur1rc01hGPtkOxT1BcrD4MgDqJop9egD+mWPcBrkdbORq/MwHNYeT/GPqhPvTe1beTovQfZLjOyGz+KDCMh/qhz9q7wMaaPfoPup41XQlhcqXO3E2oCJf+hqessBylflxuNS7y76tEt3XYrwqec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmbIv-0005GS-HA; Mon, 24 Feb 2025 17:27:37 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmbIu-002csr-0G;
	Mon, 24 Feb 2025 17:27:36 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmbIu-000DzX-00;
	Mon, 24 Feb 2025 17:27:36 +0100
Message-ID: <b00aef9582e223a5770cebc714ad65168eab744b.camel@pengutronix.de>
Subject: Re: [PATCH v9 2/3] reset: aspeed: register AST2700 reset auxiliary
 bus device
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>,  Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 24 Feb 2025 17:27:35 +0100
In-Reply-To: <d5d90f03-3db8-4f90-baad-0be4f3d3e0ea@kernel.org>
References: <20250224095506.2047064-1-ryan_chen@aspeedtech.com>
	 <20250224095506.2047064-3-ryan_chen@aspeedtech.com>
	 <71cf8012-3b77-43de-b8ac-54c84a97f9d3@kernel.org>
	 <d5d90f03-3db8-4f90-baad-0be4f3d3e0ea@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Mo, 2025-02-24 at 11:15 +0100, Krzysztof Kozlowski wrote:
> On 24/02/2025 11:12, Krzysztof Kozlowski wrote:
> > On 24/02/2025 10:55, Ryan Chen wrote:
> > > +
> > > +static void aspeed_reset_unregister_adev(void *_adev)
> > > +{
> > > +	struct auxiliary_device *adev =3D _adev;
> > > +
> > > +	auxiliary_device_delete(adev);
> > > +	auxiliary_device_uninit(adev);
> > > +}
> > > +
> > > +static void aspeed_reset_adev_release(struct device *dev)
> > > +{
> > > +	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> > > +
> > > +	kfree(adev);
> > > +}
> > > +
> >=20
> > Every exported function *must* have kerneldoc.
> >=20
> > > +int aspeed_reset_controller_register(struct device *clk_dev, void __=
iomem *base,
> > > +				     const char *adev_name)
> > > +{
> > > +	struct auxiliary_device *adev;
> > > +	int ret;
> > > +
> > > +	adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> > > +	if (!adev)
> > > +		return -ENOMEM;
> > > +
> > > +	adev->name =3D adev_name;
> > > +	adev->dev.parent =3D clk_dev;
> > > +	adev->dev.release =3D aspeed_reset_adev_release;
> > > +	adev->id =3D 666u;
> > > +
> > > +	ret =3D auxiliary_device_init(adev);
> > > +	if (ret) {
> > > +		kfree(adev);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret =3D auxiliary_device_add(adev);
> > > +	if (ret) {
> > > +		auxiliary_device_uninit(adev);
> > > +		return ret;
> > > +	}
> > > +
> > > +	adev->dev.platform_data =3D (__force void *)base;
> > > +
> > > +	return devm_add_action_or_reset(clk_dev, aspeed_reset_unregister_ad=
ev, adev);
> > > +}
> > > +EXPORT_SYMBOL_GPL(aspeed_reset_controller_register);
> >=20
> > No, you cannot export functions without users. There is no single user
> > of this, so this is not justified at all.
> My mistake, I missed patch #3 which uses it.
>=20
> I don't get why do you need to export this in the first place, instead
> of putting it in the clock driver, as usually expected. Handling child
> creation is logically the task of the device having children, the
> parent. Not the child.

Also, consider basing this on top of:

https://lore.kernel.org/all/20250218-aux-device-create-helper-v4-0-c3d7dfde=
a2e6@baylibre.com/

regards
Philipp

