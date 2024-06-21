Return-Path: <linux-clk+bounces-8452-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B99912702
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 15:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E0971C21ACF
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 13:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A83EB65E;
	Fri, 21 Jun 2024 13:51:48 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBED1C14
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718977908; cv=none; b=LKJ1ls8o8Myslnnq0i/ulaZbKYqH0eBdo4IltB6SFvat/e5uJc34SkUMy8rMVjoZ4p7f+CJlYiqOLBB2vhMzcxS10s3Xtpiqe5SzHUfEMAGfflBEQf/tRYLkEPiWbPTh6V99lBSZ/B1hb1mstQMW3lTkHcT0U9EeBXOFBEHAn1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718977908; c=relaxed/simple;
	bh=eIw0OrBTZkPMxvDDlPxgQ/eFcPTznxDkkavDnJ7jnO4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SR6P/CXpqkPENT3gcVozEOGy+ceCmWJtkRc8se8gkhqbrYudTBlVLQsuflZTtDYAYWWJwVM6erbVpua/aTL2PNfuCFGXqb1Jprt9AENSA5xZ4bd2W3vX/qgQVJzi4IKIQNvoQgPG6YZUYCG64NMyk+j0Rq23vSUH5AKtOY6WNLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sKefl-0000ET-Hn; Fri, 21 Jun 2024 15:51:25 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sKefk-003xIz-Uf; Fri, 21 Jun 2024 15:51:24 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sKefk-000BnP-2n;
	Fri, 21 Jun 2024 15:51:24 +0200
Message-ID: <5744e0de7ee58d6a435e62f5740d921f143f6635.camel@pengutronix.de>
Subject: Re: [PATCH v8 3/5] reset: imx8mp-audiomix: Add AudioMix Block
 Control reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, 
 peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org,  krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org,  s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, marex@denx.de,  linux-clk@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 21 Jun 2024 15:51:24 +0200
In-Reply-To: <CAA+D8AOzY3EcUayGP+pYeAqQu1y0=8WWngnBriwDwOCwnbcN2A@mail.gmail.com>
References: <1718350923-21392-1-git-send-email-shengjiu.wang@nxp.com>
	 <1718350923-21392-4-git-send-email-shengjiu.wang@nxp.com>
	 <27ea1bf7de6f349426fcd7ddb056a1adfae47c73.camel@pengutronix.de>
	 <CAA+D8AOzY3EcUayGP+pYeAqQu1y0=8WWngnBriwDwOCwnbcN2A@mail.gmail.com>
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

On Fr, 2024-06-21 at 20:34 +0800, Shengjiu Wang wrote:
> > I wonder why we map at all. If the parent driver already has iomem
> > mapped, can't it just pass that in, like JH7110 does?
>=20
> Because this is a simple reset driver, just two reset bits,
> I want to avoid adding a header file for the parent driver and this drive=
r.

Ok.

> Thanks for reviewing.
>=20
> By the way: shall I just send a new version for this patch only next time=
?

Yes, this is the only remaining patch for me to pick up, no need to
resend the patches that were already applied.

regards
Philipp

