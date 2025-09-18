Return-Path: <linux-clk+bounces-25288-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8418B143A9
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jul 2025 23:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 916167A7109
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jul 2025 20:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD571547F2;
	Mon, 28 Jul 2025 21:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="WAKTjq9/"
X-Original-To: linux-clk@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7013B1CAB3
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 21:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753736448; cv=none; b=Iy/twRe/kFvexAvMFGrFZMXwQCBxUbDm6lkjCQWg5gQ2BworDiAHMS969tAYprbADei+Gf3rJoTCBuc1dXAYgqaY0aRv8RtsWgvsHfJK05+CQsRO5isR00FfdMBIoJfnJPihfb45sPm3TdyAt9LdNwexlC6KhpR0HMLQwJILcyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753736448; c=relaxed/simple;
	bh=ZLJqbJsq5/249gZ3WmNrKkb4m92zY89eiUxRmm1XnBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+w6lKPhTRGVvGprDeic/Ccsy1TM8e+M7wmUxn84HAcAyXmSpNCmxxHHUYmNI3Xlf9iBMdcXBKwA+S3qgpX+p1ZmxyiBO2jBW4PAJ8f6RM6mv880JKSn6y2E1/oMVJkpYale5tLyzyAVyn+26iNtMmbyA+gXIdyyQxHs+EWlUGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=WAKTjq9/; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1753736443; x=1754341243; i=wahrenst@gmx.net;
	bh=J/Oy88lUm0FvJGz5wLKgjQPt0tOXP/VHyBYdDBP1ZbI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WAKTjq9/lYD3Ykm6ciWyw60DDlY6MpdkbkBBeBg5ZI2kziCU+1OxvU1jxu4xS20/
	 zCaE60R08Fy+csCD+9HcfG12hQxJbcTcxM6YmfXCm2TkGVNdT/Cu/5/1IwG2sVT4A
	 zvjUcajqdOByBljHf/wSqPDO8o9Yvb2PFg5mJIzvyQPID2uf2GfV5Q02SjJpQNLYS
	 t8DPdXBNLFIY6BEanczLjXko9ansP5WPg1Y2O6t/LVsGvUqy/jUJt1D6hhGpvVATa
	 DopjdUftouIW2NzZsYgZJ/0QRcUAe+XjnLWbOTgh0yeG+o0r/+oY73n1J3O7ZD6a4
	 B+zxJDoHRna1Dzx5VQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.143.227]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mg6Zw-1uC8U10nzK-00lZe3; Mon, 28
 Jul 2025 23:00:43 +0200
Message-ID: <e18ed574-e84e-4812-86c0-5cfd14860030@gmx.net>
Date: Mon, 28 Jul 2025 23:00:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Power Management for Raspberry Pi V3D GPU
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OMv3nR2OBn7j1J7/9IrOQZWL+dHJrL6Q1VJxVofqORmkzTy4gmp
 mzZd8gfr0KkDWw1dtZtyBQv8T69cPuFkkm42liRy4Pqa4DzJcU8RoxkU1syGnfaMw6N2pY3
 pfD11Ceg3dIdv6Y255jBBEfPZ+Mf0vpP31PdSkFdOy9P4DOyTGXCxWFYEd0YMrvzb6NKNrC
 crpYv2Bea9bua75w8JKmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8RrSjGKtHYA=;MiesSgyKfKIlscGxbeexIXgBOpg
 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

Hi,

Am 28.07.25 um 14:35 schrieb Ma=C3=ADra Canal:
> This series introduces Runtime PM for Raspberry Pi's GPU, V3D.
> Currently, the GPU clock stays up during the whole operation, even if
> the GPU is idle. By introducing Runtime PM, we can now turn off the
> clock completely during idle. For example, with this series, when
> checking `vcgencmd measure_clock v3d` in the Raspberry Pi 5, we get:
>
> (idle)
>
> $ vcgencmd measure_clock v3d
> frequency(0)=3D0
>
> (running glmark2)
>
> $ vcgencmd measure_clock v3d
> frequency(0)=3D960016128
>
> To implement PM for V3D, it was needed to add a prepare and unprepare
> hook to RPi's firmware clocks. Currently, they don't turn on and off,
> nor lower the clock rate. Therefore, PATCH 1/3 addresses this issue in
> clk/bcm/clk-raspberrypi.c.
>
> The other two patches are related to PM enablement in the V3D driver.
Maybe you want to cherry-pick this older patch and integrate it into=20
your series? [2]

[2] -=20
https://github.com/lategoodbye/linux-dev/commit/2ee5e1205922b06100206e760e=
d8aefe0b6d322f
>
> To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
> backporting this series to rpi-6.12.y [1].
>
> [1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-ma=
nagement-v2
>
> Best Regards,
> - Ma=C3=ADra
>
> ---
> Ma=C3=ADra Canal (3):
>        clk: bcm: rpi: Turn firmware clock on/off when preparing/unprepar=
ing
>        drm/v3d: Allocate all resources before enabling the clock
>        drm/v3d: Introduce Runtime Power Management
>
>   drivers/clk/bcm/clk-raspberrypi.c |  41 ++++++++-
>   drivers/gpu/drm/v3d/Makefile      |   3 +-
>   drivers/gpu/drm/v3d/v3d_debugfs.c |  23 ++++-
>   drivers/gpu/drm/v3d/v3d_drv.c     | 171 +++++++++++++++++++-----------=
=2D-------
>   drivers/gpu/drm/v3d/v3d_drv.h     |  21 ++++-
>   drivers/gpu/drm/v3d/v3d_gem.c     |  18 +++-
>   drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
>   drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
>   drivers/gpu/drm/v3d/v3d_power.c   |  79 ++++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
>   10 files changed, 291 insertions(+), 111 deletions(-)
> ---
> base-commit: a7352c849492a30b5d8491fcb9314ab376a3942f
> change-id: 20250728-v3d-power-management-eebb2024dc96
>


