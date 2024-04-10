Return-Path: <linux-clk+bounces-5681-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A48E89EE19
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 10:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05C7C2855A6
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 08:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11F2154C0D;
	Wed, 10 Apr 2024 08:57:11 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A313D504
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712739431; cv=none; b=HZZoH/2GspS+M9t+vZtYiVaWDeyJFtsEtIGA8XiX/SkPs9UZmKPhBOwIZZVHdWp35CpYxKiml9ojiqP5KjxnSyw1ahj6m552zB69hMjkHibP4vDYZTXFNHjFZt4VfpGNgK6MedkW/KwBSczrzs8h17zvm3p5NpHaVEPNHI5Rnnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712739431; c=relaxed/simple;
	bh=Q1AqR+G96BIjuAm54HH3yhLhu9vaKzbndYjKoX1vp4U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BznQ8xeJPtwm+68cH9/Ol55D8+bt/nOSqSx9V6fR4wgtIWriJBr9BkmcN6X94grn36XMFq3SFi2+p1LqkH8uxx9oEg/kflbA7+PT4EJCcfLxRs31Shlm2EXgmM6zUDfDxRmMxvErYbH6sSD5DW1jb4d2PmIGnYmD3LvW+DNbY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ruTlJ-0005R5-Qm; Wed, 10 Apr 2024 10:56:57 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ruTlI-00BSie-TL; Wed, 10 Apr 2024 10:56:56 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ruTlI-00050O-2l;
	Wed, 10 Apr 2024 10:56:56 +0200
Message-ID: <b9ee67f1a6d782e6b6ee9e273bc8c6fa5bc1813b.camel@pengutronix.de>
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's
 code to separate module
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Michael
 Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Date: Wed, 10 Apr 2024 10:56:56 +0200
In-Reply-To: <dde59dd2ef4da81528e31f65844e0b3f.sboyd@kernel.org>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
	 <20240328010831.884487-2-jan.dakinevich@salutedevices.com>
	 <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
	 <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org>
	 <f01cdd910ab35316b8012795f73fd2b34c8e6f8e.camel@pengutronix.de>
	 <13617b7a892424d2b024c725505a6f4f.sboyd@kernel.org>
	 <20240408-numerator-escargot-a642507a598e@spud>
	 <20240409-shallow-voice-c84ed791bc7d@spud>
	 <dde59dd2ef4da81528e31f65844e0b3f.sboyd@kernel.org>
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

On Di, 2024-04-09 at 19:27 -0700, Stephen Boyd wrote:
> Quoting Conor Dooley (2024-04-09 05:05:37)
> > On Mon, Apr 08, 2024 at 06:05:51PM +0100, Conor Dooley wrote:
> >=20
> > > > > Seconded, the clk-mpfs/reset-mpfs and clk-starfive-jh7110-sys/res=
et-
> > > > > starfive-jh7110 drivers are examples of this.
> > > > >=20
> > > > > > The auxiliary device creation function can also be in the
> > > > > > drivers/reset/ directory so that the clk driver calls some func=
tion
> > > > > > to create and register the device.
> > > > >=20
> > > > > I'm undecided about this, do you think mpfs_reset_controller_regi=
ster()
> > > > > and jh7110_reset_controller_register() should rather live with th=
e
> > > > > reset aux drivers in drivers/reset/ ?
> > > >=20
> > > > Yes, and also mpfs_reset_read() and friends. We should pass the bas=
e
> > > > iomem pointer and parent device to mpfs_reset_adev_alloc() instead =
and
> > > > then move all that code into drivers/reset with some header file
> > > > exported function to call. That way the clk driver hands over the d=
ata
> > > > without having to implement half the implementation.
> > >=20
> > > I'll todo list that :)
> >=20
> > Something like the below?
> >=20
> > -- >8 --
> > From a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2 Mon Sep 17 00:00:00 2001
> > From: Conor Dooley <conor.dooley@microchip.com>
> > Date: Tue, 9 Apr 2024 11:54:34 +0100
> > Subject: [PATCH] clock, reset: microchip: move all mpfs reset code to t=
he
> >  reset subsystem
> >=20
> > <insert something here>
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Looks pretty good.

Yes, that does look convincing.

regards
Philipp

