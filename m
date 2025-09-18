Return-Path: <linux-clk+bounces-26627-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 123F7B33E9E
	for <lists+linux-clk@lfdr.de>; Mon, 25 Aug 2025 14:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1962D1A82580
	for <lists+linux-clk@lfdr.de>; Mon, 25 Aug 2025 12:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15A326CE2D;
	Mon, 25 Aug 2025 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cYziQjLJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D380F25B1DC
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 12:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123328; cv=none; b=RR5DR9gIrvjRAegg8+FjRc3LwYXCmZvxLYdcrzU3tzp7NVKnI72WYm3d4Lk0t93G1rIiEms9bKGYHE80BhbY6ZnZTuCX9J86wl+5b5sqqTe/x0SQXPLkb/EONwCnDNqLieor9Shx1iH58XN79HwgNJluLGc9nDCG6pbdDgno/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123328; c=relaxed/simple;
	bh=+FzwHF8KuNzlOWaaKrrdM7RTgM5W1jyxUgMxJOzJj4g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=b9ck3TBdKO2q/zuG5eH1urUgtn9Ie021SS2nqwmuM4vvIJWYSMFQ7hiCIpOdmFtokwoKfEutMeiuGnvg2hRGOnq5qIqhGhFZOLbhXbJvhKM4RgSfqxj9js1RGCYa2vF51PlgfJaK6oBKxEKIm+ph8X7o4KmcblFgzbnea4UOgGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cYziQjLJ; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250825120204epoutp02a1744a0b505f0d55591e0d8faba6826d~fANwTAOxL1341513415epoutp026
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 12:02:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250825120204epoutp02a1744a0b505f0d55591e0d8faba6826d~fANwTAOxL1341513415epoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123324;
	bh=+FzwHF8KuNzlOWaaKrrdM7RTgM5W1jyxUgMxJOzJj4g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=cYziQjLJ2pZX+j8U/8EwOGgqhIx2xStM1PACDs79uontzUR5RP99yKw+VKgpYFIST
	 iZiZ7kYFjO3EFHpwE5NUXlIsjM+DfLCjU4O2fYUXWXFK9eaBufESztX40L1fmjqTQl
	 Kh8kEUycYsqxnrLTktroB9vGuydDz0PqduPadSbo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250825120203epcas5p1c6378c60ea36aa87f171b0477956f62a~fANuuWErA2818828188epcas5p1x;
	Mon, 25 Aug 2025 12:02:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9TtL13lDz2SSKZ; Mon, 25 Aug
	2025 12:02:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120201epcas5p2d4daa5629b3552586363349fb30e94e0~fANs7W8Nk0034600346epcas5p2Z;
	Mon, 25 Aug 2025 12:02:01 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825120157epsmtip265a67df65657294b364f9f90edabfe52~fANpJa82N2901829018epsmtip2W;
	Mon, 25 Aug 2025 12:01:57 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <2eaa1303-79e6-431e-9902-356862357c9f@kernel.org>
Subject: RE: [PATCH v2 10/12] dt-bindings: media: fsd: Document CSIS DMA
 controller
Date: Mon, 25 Aug 2025 17:31:56 +0530
Message-ID: <015a01dc15b8$1095f0e0$31c1d2a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQIMxZSZAiExi2YA0x2iDwJfHwx3AsbuavuyZvR80A==
Content-Language: en-in
X-CMS-MailID: 20250825120201epcas5p2d4daa5629b3552586363349fb30e94e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141051epcas5p14dccee388087372973988aeebcb872cf
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141051epcas5p14dccee388087372973988aeebcb872cf@epcas5p1.samsung.com>
	<20250814140943.22531-11-inbaraj.e@samsung.com>
	<c46c6f66-dee6-4efa-a624-de62aa705206@kernel.org>
	<00e201dc13d7$17d2a750$4777f5f0$@samsung.com>
	<2eaa1303-79e6-431e-9902-356862357c9f@kernel.org>

Hi Krzysztof,

> > According to the HW design of FSD SoC, the control to manage CSIS
> > power is given to a separate CPU where custom firmware runs.
> > Therefore. The Linux side does not control the CSIS power supplies dire=
ctly
> and are hence not included in the device tree.
>=20
> Usually this still means you vote for enabling these resources, at least =
for
> other vendors it is like that. Unless you want to say these are essential=
ly
> always on and CANNOT be disabled ever.

Yes, we want IP to remain enabled permanently, So we are not adding power s=
upply
control in linux.

Regards,
Inbaraj E


