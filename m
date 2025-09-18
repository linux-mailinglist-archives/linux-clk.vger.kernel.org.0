Return-Path: <linux-clk+bounces-25226-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D28AB13D34
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jul 2025 16:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52BE216590C
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jul 2025 14:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714B941C69;
	Mon, 28 Jul 2025 14:32:05 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564D2905
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753713125; cv=none; b=Ioh01Y5mEc9OVr0wWiTUHUtyznLKsiMaOQYggcb5EHlnmqHWGmP0k9oeTdDRcujewv8/xH8KtC72Cds1GzNXO5JrXAZSMRgz5ASJNqQUQBH/A9g3PB69W+lbc/xz4JgFzU1EPgFyW6qi4IiZxAweRn+8ETS1K81ucX7t0Kh7mpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753713125; c=relaxed/simple;
	bh=GiRCTvogn7ntbALPFxjjkV0sjmOTi5Vnv3UdhDhu2P8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NUkbXpVsvinEpJDGKj5QvjQ074nq6tH3ujKuvLk/AGLndxDEjVpp5fEB6+MLe6JJ7QEw18frdQx4jh4VNWVpjpLHm8Xqq7owYzc09xrjoBTnAuHiM7PU7oyMnDDdQvK+V1xa+s/aRd4fwnhU0RLFoicAX/W0cjMM45u4OnqgFZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ugOtH-0001dE-Rg; Mon, 28 Jul 2025 16:31:47 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ugOtF-00AitJ-1n;
	Mon, 28 Jul 2025 16:31:45 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ugOtF-000Y2W-1V;
	Mon, 28 Jul 2025 16:31:45 +0200
Message-ID: <4a0f042e4019888e81835d14e6edd86f89e41cb9.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/v3d: Allocate all resources before enabling the
 clock
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz
 Julienne <nsaenz@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Maxime
 Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>, Iago Toral
 Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list
	 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Date: Mon, 28 Jul 2025 16:31:45 +0200
In-Reply-To: <20250728-v3d-power-management-v1-2-780f922b1048@igalia.com>
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
	 <20250728-v3d-power-management-v1-2-780f922b1048@igalia.com>
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

Hi Ma=C3=ADra,

On Mo, 2025-07-28 at 09:35 -0300, Ma=C3=ADra Canal wrote:
> Move all resource allocation operations before actually enabling the
> clock,

This patch moves code even before requesting the clock.
But I don't think this is necessary, see below.

> as those operation don't require the GPU to be powered on.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c | 92 ++++++++++++++++++++++---------------=
------
>  drivers/gpu/drm/v3d/v3d_drv.h |  3 +-
>  drivers/gpu/drm/v3d/v3d_gem.c | 14 +++++--
>  drivers/gpu/drm/v3d/v3d_irq.c | 15 +++----
>  4 files changed, 66 insertions(+), 58 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.=
c
> index 2def155ce496ec5f159f6bda9929aeaae141d1a6..6e6b830bee6587e4170fd64d3=
54916766e59d2e5 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -347,14 +347,55 @@ static int v3d_platform_drm_probe(struct platform_d=
evice *pdev)
>  			return ret;
>  	}
> =20
> +	if (v3d->ver < V3D_GEN_41) {
> +		ret =3D map_regs(v3d, &v3d->gca_regs, "gca");
> +		if (ret)
> +			return ret;
> +	}
> +
> +	v3d->reset =3D devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(v3d->reset)) {
> +		ret =3D PTR_ERR(v3d->reset);
> +
> +		if (ret =3D=3D -EPROBE_DEFER)
> +			return ret;
> +
> +		v3d->reset =3D NULL;

Drive-by comment, not an issue with this (code-moving) patch: It looks
like this open-codes devm_reset_control_get_optional_exclusive().

> +		ret =3D map_regs(v3d, &v3d->bridge_regs, "bridge");
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to get reset control or bridge regs\n");
> +			return ret;
> +		}
> +	}
> +
> +	v3d->mmu_scratch =3D dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
> +					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
> +	if (!v3d->mmu_scratch) {
> +		dev_err(dev, "Failed to allocate MMU scratch page\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret =3D v3d_gem_allocate(drm);
> +	if (ret)
> +		goto dma_free;
> +
> +	ret =3D v3d_irq_init(v3d);
> +	if (ret)
> +		goto gem_destroy;

These functions needing manual cleanup are called before another devm_
function below. With this, resources are not freed in inverse order of
allocation. I don't see whether mixing devm and non-devm initialization
is an actual problem in this case, but it would look cleaner if the
devm_clk_get_optional() below was just moved back up before
dma_alloc_wc().

If there are also devm_ functions called from inside the v3d_
functions, it might be better to move all cleanup into devm actions.

> +	v3d_perfmon_init(v3d);
> +
>  	v3d->clk =3D devm_clk_get_optional(dev, NULL);
> -	if (IS_ERR(v3d->clk))
> -		return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\=
n");
> +	if (IS_ERR(v3d->clk)) {
> +		ret =3D dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock=
\n");
> +		goto gem_destroy;
> +	}
> =20
>  	ret =3D clk_prepare_enable(v3d->clk);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Couldn't enable the V3D clock\n");
> -		return ret;
> +		goto gem_destroy;
>  	}
> =20
>  	v3d_idle_sms(v3d);
> @@ -381,45 +422,8 @@ static int v3d_platform_drm_probe(struct platform_de=
vice *pdev)
>  	ident3 =3D V3D_READ(V3D_HUB_IDENT3);
>  	v3d->rev =3D V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV);
> =20
> -	v3d_perfmon_init(v3d);
> -
> -	v3d->reset =3D devm_reset_control_get_exclusive(dev, NULL);
> -	if (IS_ERR(v3d->reset)) {
> -		ret =3D PTR_ERR(v3d->reset);
> -
> -		if (ret =3D=3D -EPROBE_DEFER)
> -			goto clk_disable;
> -
> -		v3d->reset =3D NULL;
> -		ret =3D map_regs(v3d, &v3d->bridge_regs, "bridge");
> -		if (ret) {
> -			dev_err(dev,
> -				"Failed to get reset control or bridge regs\n");
> -			goto clk_disable;
> -		}
> -	}
> -
> -	if (v3d->ver < V3D_GEN_41) {
> -		ret =3D map_regs(v3d, &v3d->gca_regs, "gca");
> -		if (ret)
> -			goto clk_disable;
> -	}
> -
> -	v3d->mmu_scratch =3D dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
> -					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
> -	if (!v3d->mmu_scratch) {
> -		dev_err(dev, "Failed to allocate MMU scratch page\n");
> -		ret =3D -ENOMEM;
> -		goto clk_disable;
> -	}
> -
> -	ret =3D v3d_gem_init(drm);
> -	if (ret)
> -		goto dma_free;
> -
> -	ret =3D v3d_irq_init(v3d);
> -	if (ret)
> -		goto gem_destroy;
> +	v3d_gem_init(drm);
> +	v3d_irq_enable(v3d);
> =20
>  	ret =3D drm_dev_register(drm, 0);
>  	if (ret)
> @@ -435,12 +439,12 @@ static int v3d_platform_drm_probe(struct platform_d=
evice *pdev)
>  	drm_dev_unregister(drm);
>  irq_disable:
>  	v3d_irq_disable(v3d);
> +clk_disable:
> +	clk_disable_unprepare(v3d->clk);

clk_disable_unprepare() is moved up in the error path, but not in
v3d_platform_drm_remove(). Should this be kept consistent?

>  gem_destroy:
>  	v3d_gem_destroy(drm);
>  dma_free:
>  	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
> -clk_disable:
> -	clk_disable_unprepare(v3d->clk);
>  	return ret;
>  }

regards
Philipp

