Return-Path: <linux-clk+bounces-8011-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1230906650
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jun 2024 10:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36439B24D5C
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jun 2024 08:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C7D13D28B;
	Thu, 13 Jun 2024 08:15:21 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB213D27C
	for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718266521; cv=none; b=nxXAMEs6SeMGvpDY/lnfGF6vOMHr6iPDEtB6RZ1bRGDg6lN9I9B/zJBNmQifJNbxwe+a4tqWBu7KGLiru6yrHBd1swV0WdOWQtwToE3Ax6ofmEpEfDz7EKtlwnS7zyFlLvbT/aFQ6NAUE52aw7qU1NUqVSg28XvStBvM1DbtF2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718266521; c=relaxed/simple;
	bh=rXEKRMvId4ve84z8AItG3uwUw0AENm9bXkidn6KfjDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUwFhpNIZ6Jrfk95Stvk/oe+naQeAZvHy218SDPXDsR+iXejSup2CaIRW0GO4vvu+kGcTuAvnUb4/Kk5Zjl223jJSjZAIom4EErWy8MoXt2pwad9dyX/558FBmIiTVsYR2VyTWZjCmvQQx4gta7nldu5B/Gel8XTCFbzZGb4O1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sHfbn-00036N-8G; Thu, 13 Jun 2024 10:14:59 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sHfbm-001yyc-B2; Thu, 13 Jun 2024 10:14:58 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sHfbm-008PUZ-0m;
	Thu, 13 Jun 2024 10:14:58 +0200
Date: Thu, 13 Jun 2024 10:14:58 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: p.zabel@pengutronix.de, abelvesa@kernel.org, peng.fan@nxp.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	marex@denx.de, linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH v7 3/5] reset: imx8mp-audiomix: Add AudioMix Block
 Control reset driver
Message-ID: <20240613081458.idnrarxjwoau2eoa@pengutronix.de>
References: <1718243482-18552-1-git-send-email-shengjiu.wang@nxp.com>
 <1718243482-18552-4-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718243482-18552-4-git-send-email-shengjiu.wang@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hi,

On 24-06-13, Shengjiu Wang wrote:
> Add support for the resets on i.MX8MP Audio Block Control module,
> which includes the EARC PHY software reset and EARC controller
> software reset. The reset controller is created using the auxiliary
> device framework and set up in the clock driver.

thanks a lot for converting it to the single purpose driver.

> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/reset/Kconfig                 |   8 ++
>  drivers/reset/Makefile                |   1 +
>  drivers/reset/reset-imx8mp-audiomix.c | 103 ++++++++++++++++++++++++++
>  3 files changed, 112 insertions(+)
>  create mode 100644 drivers/reset/reset-imx8mp-audiomix.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 7112f5932609..b3c0e528d08c 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -91,6 +91,14 @@ config RESET_IMX7
>  	help
>  	  This enables the reset controller driver for i.MX7 SoCs.
>  
> +config RESET_IMX8MP_AUDIOMIX
> +	tristate "i.MX8MP AudioMix Reset Driver"
> +	depends on CLK_IMX8MP
> +	select AUXILIARY_BUS
> +	default CLK_IMX8MP
> +	help
> +	  This enables the reset controller driver for i.MX8MP AudioMix
> +
>  config RESET_INTEL_GW
>  	bool "Intel Reset Controller Driver"
>  	depends on X86 || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index fd8b49fa46fc..a6796e83900b 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
>  obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
>  obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
>  obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
> +obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
>  obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
>  obj-$(CONFIG_RESET_K210) += reset-k210.o
>  obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
> new file mode 100644
> index 000000000000..f3f9f5420c14
> --- /dev/null
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +
> +#define EARC			0x200
> +#define EARC_RESET_MASK		0x3
> +
> +struct imx8mp_audiomix_reset_priv {
				^
Nit: the _priv can be dropped.

> +	struct reset_controller_dev rcdev;
> +	void __iomem *base;
> +};
> +
> +static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
> +					unsigned long id)
> +{
> +	struct imx8mp_audiomix_reset_priv *priv = container_of(rcdev,
> +					struct imx8mp_audiomix_reset_priv, rcdev);

Nit:

static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct  reset_controller_dev *rcdev)
{
	return container_of(rcdev, struct imx8mp_audiomix_reset, rcdev);
}

	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);

Since both nits are cosmetic feel free to add my:

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Regards,
  Marco

> +	void __iomem *reg_addr = priv->base;
> +	unsigned int mask, reg;
> +
> +	if (id >= fls(EARC_RESET_MASK))
> +		return -EINVAL;
> +
> +	mask = BIT(id);
> +	reg = readl(reg_addr + EARC);
> +	writel(reg & ~mask, reg_addr + EARC);
> +
> +	return 0;
> +}
> +
> +static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
> +					  unsigned long id)
> +{
> +	struct imx8mp_audiomix_reset_priv *priv = container_of(rcdev,
> +					struct imx8mp_audiomix_reset_priv, rcdev);
> +	void __iomem *reg_addr = priv->base;
> +	unsigned int mask, reg;
> +
> +	if (id >= fls(EARC_RESET_MASK))
> +		return -EINVAL;
> +
> +	mask = BIT(id);
> +	reg = readl(reg_addr + EARC);
> +	writel(reg | mask, reg_addr + EARC);
> +
> +	return 0;
> +}
> +
> +static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
> +	.assert   = imx8mp_audiomix_reset_assert,
> +	.deassert = imx8mp_audiomix_reset_deassert,
> +};
> +
> +static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
> +				       const struct auxiliary_device_id *id)
> +{
> +	struct imx8mp_audiomix_reset_priv *priv;
> +	struct device *dev = &adev->dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->rcdev.owner     = THIS_MODULE;
> +	priv->rcdev.nr_resets = fls(EARC_RESET_MASK);
> +	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
> +	priv->rcdev.of_node   = dev->parent->of_node;
> +	priv->rcdev.dev	      = dev;
> +	priv->rcdev.of_reset_n_cells = 1;
> +	priv->base            = of_iomap(dev->parent->of_node, 0);
> +
> +	return devm_reset_controller_register(dev, &priv->rcdev);
> +}
> +
> +static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
> +	{
> +		.name = "clk_imx8mp_audiomix.reset",
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
> +
> +static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
> +	.probe		= imx8mp_audiomix_reset_probe,
> +	.id_table	= imx8mp_audiomix_reset_ids,
> +};
> +
> +module_auxiliary_driver(imx8mp_audiomix_reset_driver);
> +
> +MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
> +MODULE_DESCRIPTION("Freescale i.MX8MP Audio Block Controller reset driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 
> 
> 

