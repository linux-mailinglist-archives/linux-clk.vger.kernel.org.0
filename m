Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3924D193D82
	for <lists+linux-clk@lfdr.de>; Thu, 26 Mar 2020 12:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgCZLCV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 26 Mar 2020 07:02:21 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42695 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbgCZLCV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Mar 2020 07:02:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id h15so7161866wrx.9
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2020 04:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Wfr3mshtBQnM/CRVPTN/PuNLxJ6J3zVmMT5YCluRUKU=;
        b=LPWfvfHrcNCXNtsq0QjG6Fb5PLQf4zqNS1I4yiE3WrjMnjE7ONt6PJNZuIBHd7czBa
         ZAE9OR0Ni4Y382HuAXc0eLi78Wu5B6h12fuJFS/ys8K5tCnKPe+Svr0E6r9lwvBYUuql
         U8XsxbSR5PkoccOpge2YO/OuCK7aNjH41yqqHiRdhz0Vb2TqQsIqAgLaTFK31FiVgOIQ
         WDmw0hEC84w3vcNOJI3T20VD9K0Lmun6FvApLjBc+lpUuXQ+e1j8QGb9f4HaAahYm796
         RaF8cKKeNxOX60QSQcioWxnQoBCWHEvLt5WD6VXl5TvKxBNiFakzqkIAfTGFtE2stLNd
         L8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Wfr3mshtBQnM/CRVPTN/PuNLxJ6J3zVmMT5YCluRUKU=;
        b=Gj7qsQezbmCZ51OEijTE9Py8bSawI8KXSt67CO/qGPFh1Nq67OOfRe44wrbVAIipvu
         Qb0cG+5SvJCaXYe4+g+KF0Eke7IlLLUSUMr0Q5KoEjQw/OXiKErzz+i2HM9Y9lLyGk0t
         6fgb5ZLA/6zRB8+Yb08D+695psR8JZfiDOAoUm+PdNyHBjwHyY2WOAoqAn1vOzWnpMT0
         ZCvvDfTw8dpedjvCcuCYo3k4KQCwxov4WStaDZ0YnMqfH6oZgtCloQOlq7ma3HFs4RvG
         uAgUpmpRswXAWplWk76v3UNvfjmznXorFrQjLgaUk/RDVdouVQE1AsJYjNd/17D+AuBf
         1JXA==
X-Gm-Message-State: ANhLgQ2Z/ZtIdqaEa31rrHk8IoSoC+tLQE3Y1gOpoOiEjvTmvprbuvyf
        ti3Bl1puoYsMOjbaNyNaGwxVSQ==
X-Google-Smtp-Source: ADFU+vtJM2ifjt4NqZRCHSSMScdSfbUzWRVkLXVDgI6yZyq4thQ1DCTSR0RTMYpBX4xGlbTd9gzoTg==
X-Received: by 2002:adf:a348:: with SMTP id d8mr8696704wrb.83.1585220537040;
        Thu, 26 Mar 2020 04:02:17 -0700 (PDT)
Received: from dell ([2.27.35.213])
        by smtp.gmail.com with ESMTPSA id o67sm3063824wmo.5.2020.03.26.04.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 04:02:16 -0700 (PDT)
Date:   Thu, 26 Mar 2020 11:03:06 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Subject: Re: [RFC 01/11] mfd: Add i.MX generic mix support
Message-ID: <20200326110306.GE603801@dell>
References: <1583226206-19758-1-git-send-email-abel.vesa@nxp.com>
 <1583226206-19758-2-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1583226206-19758-2-git-send-email-abel.vesa@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 03 Mar 2020, Abel Vesa wrote:

> Some of the i.MX SoCs have a IP for interfacing the dedicated IPs with
> clocks, resets and interrupts, plus some other specific control registers.
> To allow the functionality to be split between drivers, this MFD driver is
> added that has only two purposes: register the devices and map the entire
> register addresses. Everything else is left to the dedicated drivers that will
> bind to the registered devices.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  drivers/mfd/Kconfig   | 11 +++++++++++
>  drivers/mfd/Makefile  |  1 +
>  drivers/mfd/imx-mix.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 60 insertions(+)
>  create mode 100644 drivers/mfd/imx-mix.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3c547ed..3c89288 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -460,6 +460,17 @@ config MFD_MX25_TSADC
>  	  i.MX25 processors. They consist of a conversion queue for general
>  	  purpose ADC and a queue for Touchscreens.
>  
> +config MFD_IMX_MIX
> +	tristate "NXP i.MX Generic Mix Control Driver"
> +	depends on OF || COMPILE_TEST
> +	help
> +	  Enable generic mixes support. On some i.MX platforms, there are
> +	  devices that are a mix of multiple functionalities like reset
> +	  controllers, clock controllers and some others. In order to split
> +	  those functionalities between the right drivers, this MFD populates
> +	  with virtual devices based on what's found in the devicetree node,
> +	  leaving the rest of the behavior control to the dedicated driver.
> +
>  config MFD_HI6421_PMIC
>  	tristate "HiSilicon Hi6421 PMU/Codec IC"
>  	depends on OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f935d10..5b2ae5d 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -113,6 +113,7 @@ obj-$(CONFIG_MFD_TWL4030_AUDIO)	+= twl4030-audio.o
>  obj-$(CONFIG_TWL6040_CORE)	+= twl6040.o
>  
>  obj-$(CONFIG_MFD_MX25_TSADC)	+= fsl-imx25-tsadc.o
> +obj-$(CONFIG_MFD_IMX_MIX)	+= imx-mix.o
>  
>  obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
>  obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
> diff --git a/drivers/mfd/imx-mix.c b/drivers/mfd/imx-mix.c
> new file mode 100644
> index 00000000..d3f8c71
> --- /dev/null
> +++ b/drivers/mfd/imx-mix.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_platform.h>
> +
> +#include <linux/mfd/core.h>
> +
> +static int imx_audiomix_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	dev_set_drvdata(dev, base);
> +
> +	return devm_of_platform_populate(dev);
> +}
> +
> +static const struct of_device_id imx_audiomix_of_match[] = {
> +	{ .compatible = "fsl,imx8mp-audiomix" },
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, imx_audiomix_of_match);

This needs DT binding documentation.

Do the sub-device memory ranges overlap?

> +static struct platform_driver imx_audiomix_driver = {
> +	.probe = imx_audiomix_probe,
> +	.driver = {
> +		.name = "imx-audiomix",
> +		.of_match_table = of_match_ptr(imx_audiomix_of_match),
> +	},
> +};
> +module_platform_driver(imx_audiomix_driver);

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
