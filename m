Return-Path: <linux-clk+bounces-23736-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B1AEBCBF
	for <lists+linux-clk@lfdr.de>; Fri, 27 Jun 2025 18:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98BD617ABEB
	for <lists+linux-clk@lfdr.de>; Fri, 27 Jun 2025 16:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAAD19F422;
	Fri, 27 Jun 2025 16:02:15 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C91C14EC73
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040135; cv=none; b=nDrsknPO0t8PTYFC3GfDmgEB4rWf/460Ob7VvVw0LQ5gu7Xe8WQY5F7ju1UBJMdVIvf5GtPlSfGS7rUFbE2XVUKmc5fEuY1Bn/leebaOWYuuV+za054y+2dnkiIdw6pJO85gG1948VB6pmZufN4XK2kx6Tusf6rdQocc4aDYjlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040135; c=relaxed/simple;
	bh=GldpBUfQxusdRLQisJudA/HXkddw/PUvTkMxa+47M6o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NtMjA1WXDQiSrJp1N0qeQAjWTGRjIoo+v89rmCFroOVvTjtk5VUtOYywcINowpW4eO+Pb4DKdftp8DdzdTROFYNk3UjdLxIIZw7COwvGocFvGLHcXsCyPyrZtSlj+WoITDgenO9QMDmptpfirMGUfVh85iDRCQhpMog8CqqqFDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBWT-00038m-D8; Fri, 27 Jun 2025 18:01:53 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBWS-005dyk-2s;
	Fri, 27 Jun 2025 18:01:52 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBWS-000Olw-2X;
	Fri, 27 Jun 2025 18:01:52 +0200
Message-ID: <905dc44cf6e7fc4d4500b47f493ec073991a849b.camel@pengutronix.de>
Subject: Re: [PATCH v3 4/9] reset: mpfs: add non-auxiliary bus probing
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>, sboyd@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, pierre-henry.moussay@microchip.com, 
 valentina.fernandezalanis@microchip.com, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Lee
 Jones <lee@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 27 Jun 2025 18:01:52 +0200
In-Reply-To: <20250623-equate-ogle-0ce3293567e2@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
	 <20250623-equate-ogle-0ce3293567e2@spud>
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

On Mo, 2025-06-23 at 13:56 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> While the auxiliary bus was a nice bandaid, and meant that re-writing
> the representation of the clock regions in devicetree was not required,
> it has run its course. The "mss_top_sysreg" region that contains the
> clock and reset regions, also contains pinctrl and an interrupt
> controller, so the time has come rewrite the devicetree and probe the
> reset controller from an mfd devicetree node, rather than implement
> those drivers using the auxiliary bus. Wanting to avoid propagating this
> naive/incorrect description of the hardware to the new pic64gx SoC is a
> major motivating factor here.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v2:
> Implement the request to use regmap_update_bits(). I found that I then
> hated the read/write helpers since they were just bloat, so I ripped
> them out. I replaced the regular spin_lock_irqsave() stuff with a
> guard(spinlock_irqsave), since that's a simpler way of handling the two
> different paths through such a trivial pair of functions.
> ---
>  drivers/reset/reset-mpfs.c | 81 ++++++++++++++++++++++++++++++--------
>  1 file changed, 65 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index 574e59db83a4f..9c3e996f3a099 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -7,12 +7,15 @@
>   *
>   */
>  #include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/regmap.h>

Maybe sort these alphabetically.

>  #include <linux/reset-controller.h>
>  #include <dt-bindings/clock/microchip,mpfs-clock.h>
>  #include <soc/microchip/mpfs.h>
> @@ -27,11 +30,14 @@
>  #define MPFS_SLEEP_MIN_US	100
>  #define MPFS_SLEEP_MAX_US	200
> =20
> +#define REG_SUBBLK_RESET_CR	0x88u
> +
>  /* block concurrent access to the soft reset register */
>  static DEFINE_SPINLOCK(mpfs_reset_lock);
> =20
>  struct mpfs_reset {
>  	void __iomem *base;
> +	struct regmap *regmap;
>  	struct reset_controller_dev rcdev;
>  };
> =20
> @@ -46,41 +52,50 @@ static inline struct mpfs_reset *to_mpfs_reset(struct=
 reset_controller_dev *rcde
>  static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long=
 id)
>  {
>  	struct mpfs_reset *rst =3D to_mpfs_reset(rcdev);
> -	unsigned long flags;
>  	u32 reg;
> =20
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
> +
> +	if (rst->regmap) {
> +		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), BIT(id))=
;

mpfs_reset_lock is only needed for the readl()/writel() below.
regmap has its own locking.

> +		return 0;
> +	}
> =20
>  	reg =3D readl(rst->base);
>  	reg |=3D BIT(id);
>  	writel(reg, rst->base);
> =20
> -	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> -
>  	return 0;
>  }
> =20
>  static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned lo=
ng id)
>  {
>  	struct mpfs_reset *rst =3D to_mpfs_reset(rcdev);
> -	unsigned long flags;
>  	u32 reg;
> =20
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
> +
> +	if (rst->regmap) {
> +		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), 0);

Same as above.


regards
Philipp

