Return-Path: <linux-clk+bounces-6224-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630248AC9E7
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 11:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB7D2B217F4
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 09:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123A313C3F4;
	Mon, 22 Apr 2024 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1GE8NQW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CB813DB83
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713779636; cv=none; b=m1Q9zi2ZuL3Y/ikbnAdjR/wbnVjDNZgHs56sKgCxAjAGDDkhM8G7GQcEB9Of2HOcwqRkHBs/pBAH4QCFJkwotCHOztcEHdLL+GKJoRpgY0EFDrbs8d1kXDUD81H0f0e+3IXjwPlCB1ZqOIllSvS83mZLXBxAOj3EpqMABmBBpQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713779636; c=relaxed/simple;
	bh=N1vyexUJTOQeKTD1hVlxVmzss+1ZNvL8gjrDrN9+c5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foU1sSsqRMoz8kKBA4wy+qnlLgGqxszRCuso+OBJ7UwcPwbx4E5McuQFNgQ9hJHT+TrcLPbmcBc0ZRI7bSSUPtrviav65TSo23cbCmDsBqI8JC92icjvnTr4bKG8k50ECoJnaA5qvHrzcOYuRjTSzHEaeB2jMSXNXKTcfU2jxoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1GE8NQW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a44ad785a44so385453166b.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 02:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713779631; x=1714384431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d2uumArb564F2HWCEnPtPYvaUcc8ViHiyMPm3V2MaMY=;
        b=X1GE8NQWIup58JzNcWE9ZNhMnQr9sUdVs+K8IahuPD7CcrSvTOoayqkpTzhHwClZ2m
         ZtVay9YgUkgqv7I9q6om+Mh4aARQ9uyTgWy6eBWalRaRhJ2ERJ/5EG/BMu/UqHVptamg
         ZC+jSGQ9m1ezs4VPcNDhXMvp+19c29B1xVW3hcPgEbifJ1so5SBwkAb4icbCXiph7pjA
         bInWqgYl2xkGmW+Smz7pZbhxJrzcHOKt6C3G+OUwjg0vY308ABa7HJ68VbaYhpcwYYfR
         P6N6K9/jPVaA3qq7/VGLwuWg7JrFGwEdnjlo+BI94GmcBGM1vPghtuaWF5g1IlZdT3lx
         JFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713779631; x=1714384431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2uumArb564F2HWCEnPtPYvaUcc8ViHiyMPm3V2MaMY=;
        b=MK+slARHTNSC5n6Bd/aNksOpaGxM45oQ96dIT2L1IsAO+Dgkjt5dMFp43olG5ZOOzV
         F1PD21rbOX+2PpAPDzLwRG0JIAIT/Jw3W7MT78bn6Tf6jlSJEzOBT82gL/irXZGnI5Uv
         MRf5EnAykvUrET0JqEis256Rb4+x+cuSmAG+NmzWBwQBZVSLJXPzCVvRDgXdIjSb2rdM
         p00PrpZlYSSAgSkTVHECzbN9pWszLAz6LQFTk7Ah17zeeTWkLeq16oHHczQh1Rm29pvx
         vMn9TFs92fICwAP9l48eP3wMZQ39pDhJJWznd+B0o40LjXMRu8bcrAzjnlD6ixC2U117
         WPVw==
X-Forwarded-Encrypted: i=1; AJvYcCX4O4f42oKlj2t2H5PmmYJA639v1jv/Gm3U0bnzeL7ZG8jvPj+VXT006wKY26JCHJW6X8a044KhtoGHqLR3BcsiXBJJMvDC/aTO
X-Gm-Message-State: AOJu0YxthyY0QS+gWZLamveWnsc7EN1nTzb4GH+MuNX2TXrM3W13SXKn
	fnQJyLdqPEnJ9totAwcKoEu7CcT6IzTW5F8YBVn4SiAaW8SQnFzEfHz14O0PkgM=
X-Google-Smtp-Source: AGHT+IHtVQEJ5E8Z4QaC15gw43IZTt11181hKo2PdG891CUSiHQ3+kZc3JnZz0whOG2LSvqCj2assg==
X-Received: by 2002:a17:906:f292:b0:a55:5eb0:6f2d with SMTP id gu18-20020a170906f29200b00a555eb06f2dmr5754405ejb.56.1713779630981;
        Mon, 22 Apr 2024 02:53:50 -0700 (PDT)
Received: from linaro.org ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id m18-20020a1709060d9200b00a5561456fa8sm5534335eji.21.2024.04.22.02.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 02:53:50 -0700 (PDT)
Date: Mon, 22 Apr 2024 12:53:48 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 4/4] clk: imx: add i.MX95 BLK CTL clk driver
Message-ID: <ZiYzrDndFV+GSG+O@linaro.org>
References: <20240401-imx95-blk-ctl-v6-0-84d4eca1e759@nxp.com>
 <20240401-imx95-blk-ctl-v6-4-84d4eca1e759@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401-imx95-blk-ctl-v6-4-84d4eca1e759@nxp.com>

On 24-04-01 21:28:18, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 has BLK CTL modules in various MIXes, the BLK CTL modules
> support clock features such as mux/gate/div. This patch
> is to add the clock feature of BLK CTL modules
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/Kconfig             |   7 +
>  drivers/clk/imx/Makefile            |   1 +
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 438 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 446 insertions(+)
> 
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index db3bca5f4ec9..6da0fba68225 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -114,6 +114,13 @@ config CLK_IMX93
>  	help
>  	    Build the driver for i.MX93 CCM Clock Driver
>  
> +config CLK_IMX95_BLK_CTL
> +	tristate "IMX95 Clock Driver for BLK CTL"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	select MXC_CLK
> +	help
> +	    Build the clock driver for i.MX95 BLK CTL
> +
>  config CLK_IMXRT1050
>  	tristate "IMXRT1050 CCM Clock Driver"
>  	depends on SOC_IMXRT || COMPILE_TEST
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index d4b8e10b1970..03f2b2a1ab63 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o clk-imx8mp-audiomix.o
>  obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
>  
>  obj-$(CONFIG_CLK_IMX93) += clk-imx93.o
> +obj-$(CONFIG_CLK_IMX95_BLK_CTL) += clk-imx95-blk-ctl.o
>  
>  obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o clk-imx-acm.o
>  clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o \
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> new file mode 100644
> index 000000000000..74f595f9e5e3
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <dt-bindings/clock/nxp,imx95-clock.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +enum {
> +	CLK_GATE,
> +	CLK_DIVIDER,
> +	CLK_MUX,
> +};
> +
> +struct imx95_blk_ctl {
> +	struct device *dev;
> +	spinlock_t lock;
> +	struct clk *clk_apb;
> +
> +	void __iomem *base;
> +	/* clock gate register */
> +	u32 clk_reg_restore;
> +};
> +
> +struct imx95_blk_ctl_clk_dev_data {
> +	const char *name;
> +	const char * const *parent_names;
> +	u32 num_parents;
> +	u32 reg;
> +	u32 bit_idx;
> +	u32 bit_width;
> +	u32 clk_type;
> +	u32 flags;
> +	u32 flags2;
> +	u32 type;
> +};
> +
> +struct imx95_blk_ctl_dev_data {
> +	const struct imx95_blk_ctl_clk_dev_data *clk_dev_data;
> +	u32 num_clks;
> +	bool rpm_enabled;
> +	u32 clk_reg_offset;
> +};
> +
> +static const struct imx95_blk_ctl_clk_dev_data vpublk_clk_dev_data[] = {
> +	[IMX95_CLK_VPUBLK_WAVE] = {
> +		.name = "vpublk_wave_vpu",
> +		.parent_names = (const char *[]){ "vpu", },
> +		.num_parents = 1,
> +		.reg = 8,
> +		.bit_idx = 0,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +	[IMX95_CLK_VPUBLK_JPEG_ENC] = {
> +		.name = "vpublk_jpeg_enc",
> +		.parent_names = (const char *[]){ "vpujpeg", },
> +		.num_parents = 1,
> +		.reg = 8,
> +		.bit_idx = 1,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +	[IMX95_CLK_VPUBLK_JPEG_DEC] = {
> +		.name = "vpublk_jpeg_dec",
> +		.parent_names = (const char *[]){ "vpujpeg", },
> +		.num_parents = 1,
> +		.reg = 8,
> +		.bit_idx = 2,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	}
> +};
> +
> +static const struct imx95_blk_ctl_dev_data vpublk_dev_data = {
> +	.num_clks = ARRAY_SIZE(vpublk_clk_dev_data),
> +	.clk_dev_data = vpublk_clk_dev_data,
> +	.rpm_enabled = true,
> +	.clk_reg_offset = 8,
> +};
> +
> +static const struct imx95_blk_ctl_clk_dev_data camblk_clk_dev_data[] = {
> +	[IMX95_CLK_CAMBLK_CSI2_FOR0] = {
> +		.name = "camblk_csi2_for0",
> +		.parent_names = (const char *[]){ "camisi", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 0,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +	[IMX95_CLK_CAMBLK_CSI2_FOR1] = {
> +		.name = "camblk_csi2_for1",
> +		.parent_names = (const char *[]){ "camisi", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 1,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +	[IMX95_CLK_CAMBLK_ISP_AXI] = {
> +		.name = "camblk_isp_axi",
> +		.parent_names = (const char *[]){ "camaxi", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 4,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +	[IMX95_CLK_CAMBLK_ISP_PIXEL] = {
> +		.name = "camblk_isp_pixel",
> +		.parent_names = (const char *[]){ "camisi", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 5,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +	[IMX95_CLK_CAMBLK_ISP] = {
> +		.name = "camblk_isp",
> +		.parent_names = (const char *[]){ "camisi", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 6,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	}
> +};
> +
> +static const struct imx95_blk_ctl_dev_data camblk_dev_data = {
> +	.num_clks = ARRAY_SIZE(camblk_clk_dev_data),
> +	.clk_dev_data = camblk_clk_dev_data,
> +	.clk_reg_offset = 0,
> +};
> +
> +static const struct imx95_blk_ctl_clk_dev_data lvds_clk_dev_data[] = {
> +	[IMX95_CLK_DISPMIX_LVDS_PHY_DIV] = {
> +		.name = "ldb_phy_div",
> +		.parent_names = (const char *[]){ "ldbpll", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 0,
> +		.bit_width = 1,
> +		.type = CLK_DIVIDER,
> +		.flags2 = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	[IMX95_CLK_DISPMIX_LVDS_CH0_GATE] = {
> +		.name = "lvds_ch0_gate",
> +		.parent_names = (const char *[]){ "ldb_phy_div", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 1,
> +		.bit_width = 1,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +	[IMX95_CLK_DISPMIX_LVDS_CH1_GATE] = {
> +		.name = "lvds_ch1_gate",
> +		.parent_names = (const char *[]){ "ldb_phy_div", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 2,
> +		.bit_width = 1,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +	[IMX95_CLK_DISPMIX_PIX_DI0_GATE] = {
> +		.name = "lvds_di0_gate",
> +		.parent_names = (const char *[]){ "ldb_pll_div7", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 3,
> +		.bit_width = 1,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +	[IMX95_CLK_DISPMIX_PIX_DI1_GATE] = {
> +		.name = "lvds_di1_gate",
> +		.parent_names = (const char *[]){ "ldb_pll_div7", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 4,
> +		.bit_width = 1,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +};
> +
> +static const struct imx95_blk_ctl_dev_data lvds_csr_dev_data = {
> +	.num_clks = ARRAY_SIZE(lvds_clk_dev_data),
> +	.clk_dev_data = lvds_clk_dev_data,
> +	.clk_reg_offset = 0,
> +};
> +
> +static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
> +	[IMX95_CLK_DISPMIX_ENG0_SEL] = {
> +		.name = "disp_engine0_sel",
> +		.parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
> +		.num_parents = 4,
> +		.reg = 0,
> +		.bit_idx = 0,
> +		.bit_width = 2,
> +		.type = CLK_MUX,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
> +	},
> +	[IMX95_CLK_DISPMIX_ENG1_SEL] = {
> +		.name = "disp_engine1_sel",
> +		.parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
> +		.num_parents = 4,
> +		.reg = 0,
> +		.bit_idx = 2,
> +		.bit_width = 2,
> +		.type = CLK_MUX,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
> +	}
> +};
> +
> +static const struct imx95_blk_ctl_dev_data dispmix_csr_dev_data = {
> +	.num_clks = ARRAY_SIZE(dispmix_csr_clk_dev_data),
> +	.clk_dev_data = dispmix_csr_clk_dev_data,
> +	.clk_reg_offset = 0,
> +};
> +
> +static int imx95_bc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct imx95_blk_ctl_dev_data *bc_data;
> +	struct imx95_blk_ctl *bc;
> +	struct clk_hw_onecell_data *clk_hw_data;
> +	struct clk_hw **hws;
> +	void __iomem *base;
> +	int i, ret;
> +
> +	bc = devm_kzalloc(dev, sizeof(*bc), GFP_KERNEL);
> +	if (!bc)
> +		return -ENOMEM;
> +	bc->dev = dev;
> +	dev_set_drvdata(&pdev->dev, bc);
> +
> +	spin_lock_init(&bc->lock);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	bc->base = base;
> +	bc->clk_apb = devm_clk_get(dev, NULL);
> +	if (IS_ERR(bc->clk_apb))
> +		return dev_err_probe(dev, PTR_ERR(bc->clk_apb), "failed to get APB clock\n");
> +
> +	ret = clk_prepare_enable(bc->clk_apb);
> +	if (ret) {
> +		dev_err(dev, "failed to enable apb clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	bc_data = of_device_get_match_data(dev);
> +	if (!bc_data)
> +		return devm_of_platform_populate(dev);
> +
> +	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc_data->num_clks),
> +				   GFP_KERNEL);
> +	if (!clk_hw_data)
> +		return -ENOMEM;
> +
> +	if (bc_data->rpm_enabled)
> +		pm_runtime_enable(&pdev->dev);
> +
> +	clk_hw_data->num = bc_data->num_clks;
> +	hws = clk_hw_data->hws;
> +
> +	for (i = 0; i < bc_data->num_clks; i++) {
> +		const struct imx95_blk_ctl_clk_dev_data *data = &bc_data->clk_dev_data[i];
> +		void __iomem *reg = base + data->reg;
> +
> +		if (data->type == CLK_MUX) {
> +			hws[i] = clk_hw_register_mux(dev, data->name, data->parent_names,
> +						     data->num_parents, data->flags, reg,
> +						     data->bit_idx, data->bit_width,
> +						     data->flags2, &bc->lock);
> +		} else if (data->type == CLK_DIVIDER) {
> +			hws[i] = clk_hw_register_divider(dev, data->name, data->parent_names[0],
> +							 data->flags, reg, data->bit_idx,
> +							 data->bit_width, data->flags2, &bc->lock);
> +		} else {
> +			hws[i] = clk_hw_register_gate(dev, data->name, data->parent_names[0],
> +						      data->flags, reg, data->bit_idx,
> +						      data->flags2, &bc->lock);
> +		}
> +		if (IS_ERR(hws[i])) {
> +			ret = PTR_ERR(hws[i]);
> +			dev_err(dev, "failed to register: %s:%d\n", data->name, ret);
> +			goto cleanup;
> +		}
> +	}
> +
> +	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, clk_hw_data);
> +	if (ret)
> +		goto cleanup;
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret) {
> +		of_clk_del_provider(dev->of_node);
> +		goto cleanup;
> +	}
> +
> +	if (pm_runtime_enabled(bc->dev))
> +		clk_disable_unprepare(bc->clk_apb);
> +
> +	return 0;
> +
> +cleanup:
> +	for (i = 0; i < bc_data->num_clks; i++) {
> +		if (IS_ERR_OR_NULL(hws[i]))
> +			continue;
> +		clk_hw_unregister(hws[i]);
> +	}
> +
> +	if (bc_data->rpm_enabled)
> +		pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +#ifdef CONFIG_PM
> +static int imx95_bc_runtime_suspend(struct device *dev)
> +{
> +	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(bc->clk_apb);
> +	return 0;
> +}
> +
> +static int imx95_bc_runtime_resume(struct device *dev)
> +{
> +	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> +
> +	return clk_prepare_enable(bc->clk_apb);
> +}
> +#endif
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int imx95_bc_suspend(struct device *dev)
> +{
> +	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> +	const struct imx95_blk_ctl_dev_data *bc_data;
> +	int ret;
> +
> +	bc_data = of_device_get_match_data(dev);
> +	if (!bc_data)
> +		return 0;
> +
> +	if (bc_data->rpm_enabled) {
> +		ret = pm_runtime_get_sync(bc->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(bc->dev);
> +			return ret;
> +		}
> +	}
> +
> +	bc->clk_reg_restore = readl(bc->base + bc_data->clk_reg_offset);
> +
> +	return 0;
> +}
> +
> +static int imx95_bc_resume(struct device *dev)
> +{
> +	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> +	const struct imx95_blk_ctl_dev_data *bc_data;
> +
> +	bc_data = of_device_get_match_data(dev);
> +	if (!bc_data)
> +		return 0;
> +
> +	writel(bc->clk_reg_restore, bc->base + bc_data->clk_reg_offset);
> +
> +	if (bc_data->rpm_enabled)
> +		pm_runtime_put(bc->dev);
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops imx95_bc_pm_ops = {
> +	SET_RUNTIME_PM_OPS(imx95_bc_runtime_suspend, imx95_bc_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(imx95_bc_suspend, imx95_bc_resume)
> +};
> +
> +static const struct of_device_id imx95_bc_of_match[] = {
> +	{ .compatible = "nxp,imx95-camera-csr", .data = &camblk_dev_data },
> +	{ .compatible = "nxp,imx95-display-master-csr", },
> +	{ .compatible = "nxp,imx95-lvds-csr", .data = &lvds_csr_dev_data },
> +	{ .compatible = "nxp,imx95-display-csr", .data = &dispmix_csr_dev_data },
> +	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, imx95_bc_of_match);
> +
> +static struct platform_driver imx95_bc_driver = {
> +	.probe = imx95_bc_probe,
> +	.driver = {
> +		.name = "imx95-blk-ctl",
> +		.of_match_table = imx95_bc_of_match,
> +		.pm = &imx95_bc_pm_ops,
> +	},
> +};
> +module_platform_driver(imx95_bc_driver);
> +
> +MODULE_DESCRIPTION("NXP i.MX95 blk ctl driver");
> +MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.37.1
> 

