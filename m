Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517ED55C9A3
	for <lists+linux-clk@lfdr.de>; Tue, 28 Jun 2022 14:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238814AbiF0Pga (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Jun 2022 11:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238488AbiF0Pfv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 11:35:51 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3C81AD86
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 08:35:44 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id c13so13582882eds.10
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZjbPKHKzwlJ6oGElgNZmyPrvPKDy2czrB9FdM3FvKdE=;
        b=xYpdXd4wXfK60ilePQAHIQJKno/TJ+75nxnyVJB/Svh0kykC3v8uV02p8derUBAcDb
         ovhmIDcrsG+oexsPeN9JAYaL8fXUjTD70DS8fu6XDIFbFWGcPh9tiUxNI//C7X8fy7tL
         OTZr69dIJk0u8TaD7WRKxmerR6OwIbvpZibjjSd8ig8H8gR86AjQSeoeF9UnlGn+7rlJ
         HoKys1TnjjrSUlKyqt74DJgHqO3AtR+C4MmlmOJf4vurHRiuDMqraAp/GvpTvNTktMcd
         0scJw0AbhQ0qWUIcLYz2d/Zsse1EO5t3NEAKUzNcIuUXJDBO0vHOs99Qzwj7QHphTph3
         PFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZjbPKHKzwlJ6oGElgNZmyPrvPKDy2czrB9FdM3FvKdE=;
        b=fsF6MXVuVvkxYvAPFoEZHcoHqyJPPK6lW5oOMNJIzpxcG6mmn4cwgyyvuZckBcqCDM
         ZGuFSxlG7SsbGxJ4oEEpMjGiS8N++Uf6FavuRMuwwWixzXMFATSZNopZrHX3WwykpJyQ
         YoU6ZyjpqXFMphFuwIVuiwNQk5fFl2b4e1XbAzKWWs/ntZgf8sZtsggmP4TYSQ41NeKA
         YElmON/9byq3cLSPldK7WWjnbDheQbcERbD6N1mZ7iaGqKu7AVRYe6ptFaH47FRJus+i
         dTY+mEx5oOs+oM19EYzhhq7f67nMSMP2JBSZGUlKLxU7D8u7qmJoM2vFQ0lAVk03Q3AB
         YQ9w==
X-Gm-Message-State: AJIora+/IvfGcEa43Itb3XYHfiHdLiIzTxZqBDOU55pTlIE7I1VAA9oI
        R0g421dJStSn4t4OHs39wirgcA==
X-Google-Smtp-Source: AGRyM1uwaZLWXZ7vp5KrgiO1hm15EhKd2UfenVY6VihOagXR+H19xiWDfe0GlU2ScGaF7Bb7o0o0Ow==
X-Received: by 2002:aa7:cb83:0:b0:435:9170:8e3b with SMTP id r3-20020aa7cb83000000b0043591708e3bmr17784413edt.144.1656344143450;
        Mon, 27 Jun 2022 08:35:43 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id f3-20020a170906138300b0072124df085bsm5133462ejc.15.2022.06.27.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 08:35:42 -0700 (PDT)
Date:   Mon, 27 Jun 2022 18:35:41 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marek Vasut <marex@denx.de>, Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Message-ID: <YrnOTaLS2r7QBMNx@linaro.org>
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625013235.710346-3-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-06-25 03:32:32, Marek Vasut wrote:
> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> series of clock gates and muxes. Model it as a large static table of
> gates and muxes with one exception, which is the PLL14xx . The PLL14xx
> SAI PLL has to be registered separately.
>

Again, there is a chance that the blk-ctrl driver might disable the PD
from under this.

Lucas, are you OK with this implementation, considering that it might
break the future work of audiomix blk-ctrl driver ?

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-imx@nxp.com
> ---
> V2: No change
> V3: - Use devm_platform_ioremap_resource
>     - Use clk_hw_onecell_data instead of clk_imx8mp_audiomix_priv
>     - Include mod_devicetable.h for of_device_id struct
>     - Use struct clk_parent_data instead of string parent_name
> ---
>  drivers/clk/imx/Makefile              |   2 +-
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 286 ++++++++++++++++++++++++++
>  2 files changed, 287 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/imx/clk-imx8mp-audiomix.c
>
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index 88b9b9285d22e..c4290937637eb 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -25,7 +25,7 @@ obj-$(CONFIG_MXC_CLK) += mxc-clk.o
>
>  obj-$(CONFIG_CLK_IMX8MM) += clk-imx8mm.o
>  obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn.o
> -obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o
> +obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o clk-imx8mp-audiomix.o
>  obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
>
>  obj-$(CONFIG_CLK_IMX93) += clk-imx93.o
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
> new file mode 100644
> index 0000000000000..2d5d8255c7fa2
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for i.MX8M Plus Audio BLK_CTRL
> + *
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +
> +#include "clk.h"
> +
> +#define CLKEN0			0x000
> +#define CLKEN1			0x004
> +#define SAI_MCLK_SEL(n)		(300 + 4 * (n))	/* n in 0..5 */
> +#define PDM_SEL			0x318
> +#define SAI_PLL_GNRL_CTL	0x400
> +
> +#define SAIn_MCLK1_PARENT(n)						\
> +static const struct clk_parent_data					\
> +clk_imx8mp_audiomix_sai##n##_mclk1_parents[] = {			\
> +	{								\
> +		.fw_name = "sai"__stringify(n),				\
> +		.name = "sai"__stringify(n)				\
> +	}, {								\
> +		.fw_name = "sai"__stringify(n)"_mclk",			\
> +		.name = "sai"__stringify(n)"_mclk"			\
> +	},								\
> +}
> +
> +SAIn_MCLK1_PARENT(1);
> +SAIn_MCLK1_PARENT(2);
> +SAIn_MCLK1_PARENT(3);
> +SAIn_MCLK1_PARENT(5);
> +SAIn_MCLK1_PARENT(6);
> +SAIn_MCLK1_PARENT(7);
> +
> +static const struct clk_parent_data clk_imx8mp_audiomix_sai_mclk2_parents[] = {
> +	{ .fw_name = "sai1", .name = "sai1" },
> +	{ .fw_name = "sai2", .name = "sai2" },
> +	{ .fw_name = "sai3", .name = "sai3" },
> +	{ .name = "dummy" },
> +	{ .fw_name = "sai5", .name = "sai5" },
> +	{ .fw_name = "sai6", .name = "sai6" },
> +	{ .fw_name = "sai7", .name = "sai7" },
> +	{ .fw_name = "sai1_mclk", .name = "sai1_mclk" },
> +	{ .fw_name = "sai2_mclk", .name = "sai2_mclk" },
> +	{ .fw_name = "sai3_mclk", .name = "sai3_mclk" },
> +	{ .name = "dummy" },
> +	{ .fw_name = "sai5_mclk", .name = "sai5_mclk" },
> +	{ .fw_name = "sai6_mclk", .name = "sai6_mclk" },
> +	{ .fw_name = "sai7_mclk", .name = "sai7_mclk" },
> +	{ .fw_name = "spdif_extclk", .name = "spdif_extclk" },
> +	{ .name = "dummy" },
> +};
> +
> +static const struct clk_parent_data clk_imx8mp_audiomix_pdm_parents[] = {
> +	{ .fw_name = "pdm", .name = "pdm" },
> +	{ .name = "sai_pll_out_div2" },
> +	{ .fw_name = "sai1_mclk", .name = "sai1_mclk" },
> +	{ .name = "dummy" },
> +};
> +
> +
> +static const struct clk_parent_data clk_imx8mp_audiomix_pll_parents[] = {
> +	{ .fw_name = "osc_24m", .name = "osc_24m" },
> +	{ .name = "dummy" },
> +	{ .name = "dummy" },
> +	{ .name = "dummy" },
> +};
> +
> +static const struct clk_parent_data clk_imx8mp_audiomix_pll_bypass_sels[] = {
> +	{ .fw_name = "sai_pll", .name = "sai_pll" },
> +	{ .fw_name = "sai_pll_ref_sel", .name = "sai_pll_ref_sel" },
> +};
> +
> +#define CLK_GATE(gname, cname)						\
> +	{								\
> +		gname"_cg",						\
> +		IMX8MP_CLK_AUDIOMIX_##cname,				\
> +		{ .fw_name = "ahb", .name = "ahb" }, NULL, 1,		\
> +		CLKEN0 + 4 * !!(IMX8MP_CLK_AUDIOMIX_##cname / 32),	\
> +		1, IMX8MP_CLK_AUDIOMIX_##cname % 32			\
> +	}
> +
> +#define CLK_SAIn(n)							\
> +	{								\
> +		"sai"__stringify(n)"_mclk1_sel",			\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1_SEL, {},		\
> +		clk_imx8mp_audiomix_sai##n##_mclk1_parents,		\
> +		ARRAY_SIZE(clk_imx8mp_audiomix_sai##n##_mclk1_parents), \
> +		SAI_MCLK_SEL(n), 1, 0					\
> +	}, {								\
> +		"sai"__stringify(n)"_mclk2_sel",			\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2_SEL, {},		\
> +		clk_imx8mp_audiomix_sai_mclk2_parents,			\
> +		ARRAY_SIZE(clk_imx8mp_audiomix_sai_mclk2_parents),	\
> +		SAI_MCLK_SEL(n), 4, 1					\
> +	}, {								\
> +		"sai"__stringify(n)"_ipg_cg",				\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_IPG,			\
> +		{ .fw_name = "ahb", .name = "ahb" }, NULL, 1,		\
> +		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_IPG		\
> +	}, {								\
> +		"sai"__stringify(n)"_mclk1_cg",				\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1,			\
> +		{							\
> +			.fw_name = "sai"__stringify(n)"_mclk1_sel",	\
> +			.name = "sai"__stringify(n)"_mclk1_sel"		\
> +		}, NULL, 1,						\
> +		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1		\
> +	}, {								\
> +		"sai"__stringify(n)"_mclk2_cg",				\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2,			\
> +		{							\
> +			.fw_name = "sai"__stringify(n)"_mclk2_sel",	\
> +			.name = "sai"__stringify(n)"_mclk2_sel"		\
> +		}, NULL, 1,						\
> +		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2		\
> +	}, {								\
> +		"sai"__stringify(n)"_mclk3_cg",				\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK3,			\
> +		{							\
> +			.fw_name = "sai_pll_out_div2",			\
> +			.name = "sai_pll_out_div2"			\
> +		}, NULL, 1,						\
> +		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK3		\
> +	}
> +
> +#define CLK_PDM								\
> +	{								\
> +		"pdm_sel", IMX8MP_CLK_AUDIOMIX_PDM_SEL, {},		\
> +		clk_imx8mp_audiomix_pdm_parents,			\
> +		ARRAY_SIZE(clk_imx8mp_audiomix_pdm_parents),		\
> +		PDM_SEL, 2, 0						\
> +	}
> +
> +struct clk_imx8mp_audiomix_sel {
> +	const char			*name;
> +	int				clkid;
> +	const struct clk_parent_data	parent;		/* For gate */
> +	const struct clk_parent_data	*parents;	/* For mux */
> +	int				num_parents;
> +	u16				reg;
> +	u8				width;
> +	u8				shift;
> +};
> +
> +static struct clk_imx8mp_audiomix_sel sels[] = {
> +	CLK_GATE("asrc", ASRC_IPG),
> +	CLK_GATE("pdm", PDM_IPG),
> +	CLK_GATE("earc", EARC_IPG),
> +	CLK_GATE("ocrama", OCRAMA_IPG),
> +	CLK_GATE("aud2htx", AUD2HTX_IPG),
> +	CLK_GATE("earc_phy", EARC_PHY),
> +	CLK_GATE("sdma2", SDMA2_ROOT),
> +	CLK_GATE("sdma3", SDMA3_ROOT),
> +	CLK_GATE("spba2", SPBA2_ROOT),
> +	CLK_GATE("dsp", DSP_ROOT),
> +	CLK_GATE("dspdbg", DSPDBG_ROOT),
> +	CLK_GATE("edma", EDMA_ROOT),
> +	CLK_GATE("audpll", AUDPLL_ROOT),
> +	CLK_GATE("mu2", MU2_ROOT),
> +	CLK_GATE("mu3", MU3_ROOT),
> +	CLK_PDM,
> +	CLK_SAIn(1),
> +	CLK_SAIn(2),
> +	CLK_SAIn(3),
> +	CLK_SAIn(5),
> +	CLK_SAIn(6),
> +	CLK_SAIn(7)
> +};
> +
> +static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *priv;
> +	struct device *dev = &pdev->dev;
> +	void __iomem *base;
> +	struct clk_hw *hw;
> +	int i;
> +
> +	priv = devm_kzalloc(dev,
> +			    struct_size(priv, hws, IMX8MP_CLK_AUDIOMIX_END),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->num = IMX8MP_CLK_AUDIOMIX_END;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	for (i = 0; i < ARRAY_SIZE(sels); i++) {
> +		if (sels[i].num_parents == 1) {
> +			hw = devm_clk_hw_register_gate_parent_data(dev,
> +								   sels[i].name,
> +								   &sels[i].parent,
> +								   0,
> +								   base + sels[i].reg,
> +								   sels[i].shift,
> +								   0, NULL);
> +		} else {
> +			hw = devm_clk_hw_register_mux_parent_data(dev,
> +								  sels[i].name,
> +								  sels[i].parents,
> +								  sels[i].num_parents,
> +								  0,
> +								  base + sels[i].reg,
> +								  sels[i].shift,
> +								  sels[i].width,
> +								  0, NULL);
> +		}
> +
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		priv->hws[sels[i].clkid] = hw;
> +	}
> +
> +	/* SAI PLL */
> +	hw = devm_clk_hw_register_mux_parent_data(dev, "sai_pll_ref_sel",
> +						  clk_imx8mp_audiomix_pll_parents,
> +						  ARRAY_SIZE(clk_imx8mp_audiomix_pll_parents),
> +						  CLK_SET_RATE_NO_REPARENT,
> +						  base + SAI_PLL_GNRL_CTL,
> +						  0, 2, 0, NULL);
> +	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_REF_SEL] = hw;
> +
> +	hw = imx_dev_clk_hw_pll14xx(dev, "sai_pll", "sai_pll_ref_sel",
> +				    base + 0x400, &imx_1443x_pll);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL] = hw;
> +
> +	hw = devm_clk_hw_register_mux_parent_data(dev, "sai_pll_bypass",
> +						  clk_imx8mp_audiomix_pll_bypass_sels,
> +						  ARRAY_SIZE(clk_imx8mp_audiomix_pll_bypass_sels),
> +						  CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
> +						  base + SAI_PLL_GNRL_CTL,
> +						  16, 1, 0, NULL);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_BYPASS] = hw;
> +
> +	hw = devm_clk_hw_register_gate(dev, "sai_pll_out", "sai_pll_bypass",
> +				       0, base + SAI_PLL_GNRL_CTL, 13,
> +				       0, NULL);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_OUT] = hw;
> +
> +	hw = devm_clk_hw_register_fixed_factor(dev, "sai_pll_out_div2",
> +					       "sai_pll_out", 0, 1, 2);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
> +					   priv);
> +}
> +
> +static const struct of_device_id clk_imx8mp_audiomix_of_match[] = {
> +	{ .compatible = "fsl,imx8mp-audio-blk-ctrl" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, clk_imx8mp_audiomix_of_match);
> +
> +static struct platform_driver clk_imx8mp_audiomix_driver = {
> +	.probe	= clk_imx8mp_audiomix_probe,
> +	.driver = {
> +		.name = "imx8mp-audio-blk-ctrl",
> +		.of_match_table = clk_imx8mp_audiomix_of_match,
> +	},
> +};
> +
> +module_platform_driver(clk_imx8mp_audiomix_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_DESCRIPTION("Freescale i.MX8MP Audio Block Controller driver");
> +MODULE_LICENSE("GPL");
> --
> 2.35.1
>
