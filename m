Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D807B760BE9
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jul 2023 09:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbjGYHej (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Jul 2023 03:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjGYHeD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 03:34:03 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CD619AA
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 00:32:25 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9939fbb7191so1096405366b.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690270344; x=1690875144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f0ors0a89FPC2zr5yfVoc1Y0M8pWwcZxhyKxP7N+YJk=;
        b=DAvkE8k9uYHeDiaTZZb5SaaOv7w8WGFcVouNoWNNaSmxutoWiD6hF2QJcCyBl5t9nD
         ID+ji5vB5TZ1O8VXJYrpMXdGCkuPvdksz7aEkHq3poChXML57mxWTMjggGzBRfUYwPdv
         0xf0I+eyPRGJrmvehL846K1XyOoGNg8OzG1xMdd/Yz5yeYvyjHCs+N88lXNySTl7H9yw
         3S6VGM++JTIa4KLfgQeeUdUT/iQkgb4Xj6P3646qN3T6VbD33YZ+OTtdButWrJrDuRhN
         ynn7uLSLBjtiHgYmnMLgdWezAG525VUFnHl+bjdybkSPl2Qr/+yywO2JJ4EPwE1spPLS
         HP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690270344; x=1690875144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0ors0a89FPC2zr5yfVoc1Y0M8pWwcZxhyKxP7N+YJk=;
        b=FxgDYOlqP4rfnfzMh2PeIOoqy62LmLtMOVd8Y4jYhqCtARmpbHfKNBbxWjwZhLhx9T
         ucOZGHQOHy900KtEAJCSAyrHdqxTiP0ooHECX9HILQbG5/CtSMqcQmtVjBSgs8FAnhny
         NASTKzC6LDfWrNNrGOFWo4ZDcHyF631lnE9dnxZ9sMTr3FNfQrOoM0lOZlYFN61bMHNq
         urFxrB1QyptHm+NQrIdOC/Pucn63bHzyMIVhoHpNdjIctsyxBlsLtmJMpe0Z/qaKEKL9
         Dxz6yZJSp26oeFI9VvK+cBmQeR0OyRQWNMkpaaRWBcBsn4F37qjxLJGfzbiVar7p1eyO
         TYKg==
X-Gm-Message-State: ABy/qLbWAHJ/ACucZTGPeqj3UsatTc7KMv1AUkkHfuQzmEODX6PEIBVM
        4c7jlyetlYGmhZg8VUhnZ/PJiw==
X-Google-Smtp-Source: APBJJlG3C+z/ixO72AVzELu42dhN+l0ANe+obZJj9xxSFO/SGrOtubArE7HW2FuBQwzzNSkIhfajlQ==
X-Received: by 2002:a17:906:6488:b0:997:6729:5f4b with SMTP id e8-20020a170906648800b0099767295f4bmr1776526ejm.11.1690270344249;
        Tue, 25 Jul 2023 00:32:24 -0700 (PDT)
Received: from linaro.org ([82.78.74.213])
        by smtp.gmail.com with ESMTPSA id j22-20020a170906831600b0098951bb4dc3sm7716238ejx.184.2023.07.25.00.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 00:32:23 -0700 (PDT)
Date:   Tue, 25 Jul 2023 10:32:21 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, shengjiu.wang@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: imx: imx8: add audio clock mux driver
Message-ID: <ZL96hRcVMYGLBEY/@linaro.org>
References: <1688607078-4183-1-git-send-email-shengjiu.wang@nxp.com>
 <1688607078-4183-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1688607078-4183-4-git-send-email-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-07-06 09:31:18, Shengjiu Wang wrote:
> The Audio Clock Mux (ACM) is a collection of control registers
> and multiplexers that are used to route the audio source clocks
> to the audio peripherals.
> 
> Each audio peripheral has its dedicated audio clock mux
> (which differ based on usage) and control register.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> changes in v3:
> - change compatible string from nxp to fsl
> 
> changes in v2:
> - none
> 
>  drivers/clk/imx/Makefile       |   2 +-
>  drivers/clk/imx/clk-imx8-acm.c | 477 +++++++++++++++++++++++++++++++++
>  2 files changed, 478 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/imx/clk-imx8-acm.c
> 
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index ae9d84ef046b..27a96085ad10 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -35,7 +35,7 @@ obj-$(CONFIG_CLK_IMX93) += clk-imx93.o
>  obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
>  clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o \
>  				     clk-imx8qxp-rsrc.o clk-imx8qm-rsrc.o \
> -				     clk-imx8dxl-rsrc.o
> +				     clk-imx8dxl-rsrc.o clk-imx8-acm.o
>  clk-imx-lpcg-scu-$(CONFIG_CLK_IMX8QXP) += clk-lpcg-scu.o clk-imx8qxp-lpcg.o
>  
>  obj-$(CONFIG_CLK_IMX8ULP) += clk-imx8ulp.o
> diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
> new file mode 100644
> index 000000000000..eb4eacba267a
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imx8-acm.c
> @@ -0,0 +1,477 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright 2018-2023 NXP
> +//
> +
> +#include <dt-bindings/clock/imx8-clock.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include "clk.h"
> +
> +/**
> + * struct clk_imx_acm_pm_domains: structure for multi power domain
> + * @pd_dev: power domain device
> + * @pd_dev_link: power domain device link
> + * @num_domains: power domain nummber
> + */
> +struct clk_imx_acm_pm_domains {
> +	struct device **pd_dev;
> +	struct device_link **pd_dev_link;
> +	int    num_domains;
> +};
> +
> +/**
> + * struct clk_imx8_acm_sel: for clock mux
> + * @name: clock name
> + * @clkid: clock id
> + * @parents: clock parents
> + * @num_parents: clock parents number
> + * @reg: register offset
> + * @shift: bit shift in register
> + * @width: bits width
> + */
> +struct clk_imx8_acm_sel {
> +	const char			*name;
> +	int				clkid;
> +	const struct clk_parent_data	*parents;	/* For mux */
> +	int				num_parents;
> +	u32				reg;
> +	u8				shift;
> +	u8				width;
> +};
> +
> +/**
> + * struct imx8_acm_soc_data: soc specific data
> + * @sels: pointer to struct clk_imx8_acm_sel
> + * @num_sels: numbers of items
> + */
> +struct imx8_acm_soc_data {
> +	struct clk_imx8_acm_sel *sels;
> +	unsigned int num_sels;
> +};
> +
> +/**
> + * struct imx8_acm_priv: private structure
> + * @dev_pm: multi power domain
> + * @soc_data: pointer to soc data
> + * @reg: base address of registers
> + * @regs: save registers for suspend
> + */
> +struct imx8_acm_priv {
> +	struct clk_imx_acm_pm_domains dev_pm;
> +	const struct imx8_acm_soc_data *soc_data;
> +	void __iomem *reg;
> +	u32 regs[IMX_ADMA_ACM_CLK_END];
> +};
> +
> +static const struct clk_parent_data imx8qm_aud_clk_sels[] = {
> +	{.fw_name = "aud_rec_clk0_lpcg_clk", .name = "aud_rec_clk0_lpcg_clk" },
> +	{.fw_name = "aud_rec_clk1_lpcg_clk", .name = "aud_rec_clk1_lpcg_clk" },
> +	{.fw_name = "mlb_clk", .name = "mlb_clk" },
> +	{.fw_name = "hdmi_rx_mclk", .name = "hdmi_rx_mclk" },
> +	{.fw_name = "ext_aud_mclk0", .name = "ext_aud_mclk0" },
> +	{.fw_name = "ext_aud_mclk1", .name = "ext_aud_mclk1" },
> +	{.fw_name = "esai0_rx_clk", .name = "esai0_rx_clk" },
> +	{.fw_name = "esai0_rx_hf_clk", .name = "esai0_rx_hf_clk" },
> +	{.fw_name = "esai0_tx_clk", .name = "esai0_tx_clk" },
> +	{.fw_name = "esai0_tx_hf_clk", .name = "esai0_tx_hf_clk" },
> +	{.fw_name = "esai1_rx_clk", .name = "esai1_rx_clk" },
> +	{.fw_name = "esai1_rx_hf_clk", .name = "esai1_rx_hf_clk" },
> +	{.fw_name = "esai1_tx_clk", .name = "esai1_tx_clk" },
> +	{.fw_name = "esai1_tx_hf_clk", .name = "esai1_tx_hf_clk" },
> +	{.fw_name = "spdif0_rx", .name = "spdif0_rx" },
> +	{.fw_name = "spdif1_rx", .name = "spdif1_rx" },
> +	{.fw_name = "sai0_rx_bclk", .name = "sai0_rx_bclk" },
> +	{.fw_name = "sai0_tx_bclk", .name = "sai0_tx_bclk" },
> +	{.fw_name = "sai1_rx_bclk", .name = "sai1_rx_bclk" },
> +	{.fw_name = "sai1_tx_bclk", .name = "sai1_tx_bclk" },
> +	{.fw_name = "sai2_rx_bclk", .name = "sai2_rx_bclk" },
> +	{.fw_name = "sai3_rx_bclk", .name = "sai3_rx_bclk" },
> +	{.fw_name = "sai4_rx_bclk", .name = "sai4_rx_bclk" },
> +};
> +
> +static const struct clk_parent_data imx8qm_mclk_out_sels[] = {
> +	{.fw_name = "aud_rec_clk0_lpcg_clk", .name = "aud_rec_clk0_lpcg_clk" },
> +	{.fw_name = "aud_rec_clk1_lpcg_clk", .name = "aud_rec_clk1_lpcg_clk" },
> +	{.fw_name = "mlb_clk", .name = "mlb_clk" },
> +	{.fw_name = "hdmi_rx_mclk", .name = "hdmi_rx_mclk" },
> +	{.fw_name = "spdif0_rx", .name = "spdif0_rx" },
> +	{.fw_name = "spdif1_rx", .name = "spdif1_rx" },
> +	{.fw_name = "sai4_rx_bclk", .name = "sai4_rx_bclk" },
> +	{.fw_name = "sai6_rx_bclk", .name = "sai6_rx_bclk" },
> +};
> +
> +static const struct clk_parent_data imx8qm_mclk_sels[] = {
> +	{.fw_name = "aud_pll_div_clk0_lpcg_clk", .name = "aud_pll_div_clk0_lpcg_clk" },
> +	{.fw_name = "aud_pll_div_clk1_lpcg_clk", .name = "aud_pll_div_clk1_lpcg_clk" },
> +	{.fw_name = "acm_aud_clk0_sel", .name = "acm_aud_clk0_sel" },
> +	{.fw_name = "acm_aud_clk1_sel", .name = "acm_aud_clk1_sel" },
> +};
> +
> +static const struct clk_parent_data imx8qm_asrc_mux_clk_sels[] = {
> +	{.fw_name = "sai4_rx_bclk", .name = "sai4_rx_bclk" },
> +	{.fw_name = "sai5_tx_bclk", .name = "sai5_tx_bclk" },
> +	{.name = "dummy" },
> +	{.fw_name = "mlb_clk", .name = "mlb_clk" },
> +
> +};
> +
> +static struct clk_imx8_acm_sel imx8qm_sels[] = {
> +	{"acm_aud_clk0_sel", IMX_ADMA_ACM_AUD_CLK0_SEL, imx8qm_aud_clk_sels, ARRAY_SIZE(imx8qm_aud_clk_sels), 0x000000, 0, 5},
> +	{"acm_aud_clk1_sel", IMX_ADMA_ACM_AUD_CLK1_SEL, imx8qm_aud_clk_sels, ARRAY_SIZE(imx8qm_aud_clk_sels), 0x010000, 0, 5},
> +	{"acm_mclkout0_sel", IMX_ADMA_ACM_MCLKOUT0_SEL, imx8qm_mclk_out_sels, ARRAY_SIZE(imx8qm_mclk_out_sels), 0x020000, 0, 3},
> +	{"acm_mclkout1_sel", IMX_ADMA_ACM_MCLKOUT1_SEL, imx8qm_mclk_out_sels, ARRAY_SIZE(imx8qm_mclk_out_sels), 0x030000, 0, 3},
> +	{"acm_asrc0_mclk_sel", IMX_ADMA_ACM_ASRC0_MUX_CLK_SEL, imx8qm_asrc_mux_clk_sels, ARRAY_SIZE(imx8qm_asrc_mux_clk_sels), 0x040000, 0, 2},
> +	{"acm_esai0_mclk_sel", IMX_ADMA_ACM_ESAI0_MCLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x060000, 0, 2},
> +	{"acm_esai1_mclk_sel", IMX_ADMA_ACM_ESAI1_MCLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x070000, 0, 2},
> +	{"acm_sai0_mclk_sel", IMX_ADMA_ACM_SAI0_MCLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x0E0000, 0, 2},
> +	{"acm_sai1_mclk_sel", IMX_ADMA_ACM_SAI1_MCLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x0F0000, 0, 2},
> +	{"acm_sai2_mclk_sel", IMX_ADMA_ACM_SAI2_MCLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x100000, 0, 2},
> +	{"acm_sai3_mclk_sel", IMX_ADMA_ACM_SAI3_MCLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x110000, 0, 2},
> +	{"acm_sai4_mclk_sel", IMX_ADMA_ACM_SAI4_MCLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x120000, 0, 2},
> +	{"acm_sai5_mclk_sel", IMX_ADMA_ACM_SAI5_MCLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x130000, 0, 2},
> +	{"acm_sai6_mclk_sel", IMX_ADMA_ACM_SAI6_MCLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x140000, 0, 2},
> +	{"acm_sai7_mclk_sel", IMX_ADMA_ACM_SAI7_MCLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x150000, 0, 2},
> +	{"acm_spdif0_mclk_sel", IMX_ADMA_ACM_SPDIF0_TX_CLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x1A0000, 0, 2},
> +	{"acm_spdif1_mclk_sel", IMX_ADMA_ACM_SPDIF1_TX_CLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x1B0000, 0, 2},
> +	{"acm_mqs_mclk_sel", IMX_ADMA_ACM_MQS_TX_CLK_SEL, imx8qm_mclk_sels, ARRAY_SIZE(imx8qm_mclk_sels), 0x1C0000, 0, 2},
> +};
> +
> +static const struct clk_parent_data imx8qxp_aud_clk_sels[] = {
> +	{.fw_name = "aud_rec_clk0_lpcg_clk", .name = "aud_rec_clk0_lpcg_clk" },
> +	{.fw_name = "aud_rec_clk1_lpcg_clk", .name = "aud_rec_clk1_lpcg_clk" },
> +	{.fw_name = "ext_aud_mclk0", .name = "ext_aud_mclk0" },
> +	{.fw_name = "ext_aud_mclk1", .name = "ext_aud_mclk1" },
> +	{.fw_name = "esai0_rx_clk", .name = "esai0_rx_clk" },
> +	{.fw_name = "esai0_rx_hf_clk", .name = "esai0_rx_hf_clk" },
> +	{.fw_name = "esai0_tx_clk", .name = "esai0_tx_clk" },
> +	{.fw_name = "esai0_tx_hf_clk", .name = "esai0_tx_hf_clk" },
> +	{.fw_name = "spdif0_rx", .name = "spdif0_rx" },
> +	{.fw_name = "sai0_rx_bclk", .name = "sai0_rx_bclk" },
> +	{.fw_name = "sai0_tx_bclk", .name = "sai0_tx_bclk" },
> +	{.fw_name = "sai1_rx_bclk", .name = "sai1_rx_bclk" },
> +	{.fw_name = "sai1_tx_bclk", .name = "sai1_tx_bclk" },
> +	{.fw_name = "sai2_rx_bclk", .name = "sai2_rx_bclk" },
> +	{.fw_name = "sai3_rx_bclk", .name = "sai3_rx_bclk" },
> +};
> +
> +static const struct clk_parent_data imx8qxp_mclk_out_sels[] = {
> +	{.fw_name = "aud_rec_clk0_lpcg_clk", .name = "aud_rec_clk0_lpcg_clk" },
> +	{.fw_name = "aud_rec_clk1_lpcg_clk", .name = "aud_rec_clk1_lpcg_clk" },
> +	{.name = "dummy" },
> +	{.name = "dummy" },
> +	{.fw_name = "spdif0_rx", .name = "spdif0_rx" },
> +	{.name = "dummy" },
> +	{.name = "dummy" },
> +	{.fw_name = "sai4_rx_bclk", .name = "sai4_rx_bclk" },
> +};
> +
> +static const struct clk_parent_data imx8qxp_mclk_sels[] = {
> +	{.fw_name = "aud_pll_div_clk0_lpcg_clk", .name = "aud_pll_div_clk0_lpcg_clk" },
> +	{.fw_name = "aud_pll_div_clk1_lpcg_clk", .name = "aud_pll_div_clk1_lpcg_clk" },
> +	{.fw_name = "acm_aud_clk0_sel", .name = "acm_aud_clk0_sel" },
> +	{.fw_name = "acm_aud_clk1_sel", .name = "acm_aud_clk1_sel" },
> +};
> +
> +static struct clk_imx8_acm_sel imx8qxp_sels[] = {
> +	{"acm_aud_clk0_sel", IMX_ADMA_ACM_AUD_CLK0_SEL, imx8qxp_aud_clk_sels, ARRAY_SIZE(imx8qxp_aud_clk_sels), 0x000000, 0, 5},
> +	{"acm_aud_clk1_sel", IMX_ADMA_ACM_AUD_CLK1_SEL, imx8qxp_aud_clk_sels, ARRAY_SIZE(imx8qxp_aud_clk_sels), 0x010000, 0, 5},
> +	{"acm_mclkout0_sel", IMX_ADMA_ACM_MCLKOUT0_SEL, imx8qxp_mclk_out_sels, ARRAY_SIZE(imx8qxp_mclk_out_sels), 0x020000, 0, 3},
> +	{"acm_mclkout1_sel", IMX_ADMA_ACM_MCLKOUT1_SEL, imx8qxp_mclk_out_sels, ARRAY_SIZE(imx8qxp_mclk_out_sels), 0x030000, 0, 3},
> +	{"acm_esai0_mclk_sel", IMX_ADMA_ACM_ESAI0_MCLK_SEL, imx8qxp_mclk_sels, ARRAY_SIZE(imx8qxp_mclk_sels), 0x060000, 0, 2},
> +	{"acm_sai0_mclk_sel", IMX_ADMA_ACM_SAI0_MCLK_SEL, imx8qxp_mclk_sels, ARRAY_SIZE(imx8qxp_mclk_sels), 0x0E0000, 0, 2},
> +	{"acm_sai1_mclk_sel", IMX_ADMA_ACM_SAI1_MCLK_SEL, imx8qxp_mclk_sels, ARRAY_SIZE(imx8qxp_mclk_sels), 0x0F0000, 0, 2},
> +	{"acm_sai2_mclk_sel", IMX_ADMA_ACM_SAI2_MCLK_SEL, imx8qxp_mclk_sels, ARRAY_SIZE(imx8qxp_mclk_sels), 0x100000, 0, 2},
> +	{"acm_sai3_mclk_sel", IMX_ADMA_ACM_SAI3_MCLK_SEL, imx8qxp_mclk_sels, ARRAY_SIZE(imx8qxp_mclk_sels), 0x110000, 0, 2},
> +	{"acm_sai4_mclk_sel", IMX_ADMA_ACM_SAI4_MCLK_SEL, imx8qxp_mclk_sels, ARRAY_SIZE(imx8qxp_mclk_sels), 0x140000, 0, 2},
> +	{"acm_sai5_mclk_sel", IMX_ADMA_ACM_SAI5_MCLK_SEL, imx8qxp_mclk_sels, ARRAY_SIZE(imx8qxp_mclk_sels), 0x150000, 0, 2},
> +	{"acm_spdif0_mclk_sel", IMX_ADMA_ACM_SPDIF0_TX_CLK_SEL, imx8qxp_mclk_sels, ARRAY_SIZE(imx8qxp_mclk_sels), 0x1A0000, 0, 2},
> +	{"acm_mqs_mclk_sel", IMX_ADMA_ACM_MQS_TX_CLK_SEL, imx8qxp_mclk_sels, ARRAY_SIZE(imx8qxp_mclk_sels), 0x1C0000, 0, 2},
> +};
> +
> +static const struct clk_parent_data imx8dxl_aud_clk_sels[] = {
> +	{.fw_name = "aud_rec_clk0_lpcg_clk", .name = "aud_rec_clk0_lpcg_clk" },
> +	{.fw_name = "aud_rec_clk1_lpcg_clk", .name = "aud_rec_clk1_lpcg_clk" },
> +	{.fw_name = "ext_aud_mclk0", .name = "ext_aud_mclk0" },
> +	{.fw_name = "ext_aud_mclk1", .name = "ext_aud_mclk1" },
> +	{.name = "dummy" },
> +	{.name = "dummy" },
> +	{.name = "dummy" },
> +	{.name = "dummy" },
> +
> +	{.fw_name = "spdif0_rx", .name = "spdif0_rx" },
> +	{.fw_name = "sai0_rx_bclk", .name = "sai0_rx_bclk" },
> +	{.fw_name = "sai0_tx_bclk", .name = "sai0_tx_bclk" },
> +	{.fw_name = "sai1_rx_bclk", .name = "sai1_rx_bclk" },
> +	{.fw_name = "sai1_tx_bclk", .name = "sai1_tx_bclk" },
> +	{.fw_name = "sai2_rx_bclk", .name = "sai2_rx_bclk" },
> +	{.fw_name = "sai3_rx_bclk", .name = "sai3_rx_bclk" },
> +};
> +
> +static const struct clk_parent_data imx8dxl_mclk_out_sels[] = {
> +	{.fw_name = "aud_rec_clk0_lpcg_clk", .name = "aud_rec_clk0_lpcg_clk" },
> +	{.fw_name = "aud_rec_clk1_lpcg_clk", .name = "aud_rec_clk1_lpcg_clk" },
> +	{.name = "dummy" },
> +	{.name = "dummy" },
> +	{.fw_name = "spdif0_rx", .name = "spdif0_rx" },
> +	{.name = "dummy" },
> +	{.name = "dummy" },
> +	{.name = "dummy" },
> +};
> +
> +static const struct clk_parent_data imx8dxl_mclk_sels[] = {
> +	{.fw_name = "aud_pll_div_clk0_lpcg_clk", .name = "aud_pll_div_clk0_lpcg_clk" },
> +	{.fw_name = "aud_pll_div_clk1_lpcg_clk", .name = "aud_pll_div_clk1_lpcg_clk" },
> +	{.fw_name = "acm_aud_clk0_sel", .name = "acm_aud_clk0_sel" },
> +	{.fw_name = "acm_aud_clk1_sel", .name = "acm_aud_clk1_sel" },
> +};
> +
> +static struct clk_imx8_acm_sel imx8dxl_sels[] = {
> +	{"acm_aud_clk0_sel", IMX_ADMA_ACM_AUD_CLK0_SEL, imx8dxl_aud_clk_sels, ARRAY_SIZE(imx8dxl_aud_clk_sels), 0x000000, 0, 5},
> +	{"acm_aud_clk1_sel", IMX_ADMA_ACM_AUD_CLK1_SEL, imx8dxl_aud_clk_sels, ARRAY_SIZE(imx8dxl_aud_clk_sels), 0x010000, 0, 5},
> +	{"acm_mclkout0_sel", IMX_ADMA_ACM_MCLKOUT0_SEL, imx8dxl_mclk_out_sels, ARRAY_SIZE(imx8dxl_mclk_out_sels), 0x020000, 0, 3},
> +	{"acm_mclkout1_sel", IMX_ADMA_ACM_MCLKOUT1_SEL, imx8dxl_mclk_out_sels, ARRAY_SIZE(imx8dxl_mclk_out_sels), 0x030000, 0, 3},
> +	{"acm_sai0_mclk_sel", IMX_ADMA_ACM_SAI0_MCLK_SEL, imx8dxl_mclk_sels, ARRAY_SIZE(imx8dxl_mclk_sels), 0x0E0000, 0, 2},
> +	{"acm_sai1_mclk_sel", IMX_ADMA_ACM_SAI1_MCLK_SEL, imx8dxl_mclk_sels, ARRAY_SIZE(imx8dxl_mclk_sels), 0x0F0000, 0, 2},
> +	{"acm_sai2_mclk_sel", IMX_ADMA_ACM_SAI2_MCLK_SEL, imx8dxl_mclk_sels, ARRAY_SIZE(imx8dxl_mclk_sels), 0x100000, 0, 2},
> +	{"acm_sai3_mclk_sel", IMX_ADMA_ACM_SAI3_MCLK_SEL, imx8dxl_mclk_sels, ARRAY_SIZE(imx8dxl_mclk_sels), 0x110000, 0, 2},
> +	{"acm_spdif0_mclk_sel", IMX_ADMA_ACM_SPDIF0_TX_CLK_SEL, imx8dxl_mclk_sels, ARRAY_SIZE(imx8dxl_mclk_sels), 0x1A0000, 0, 2},
> +	{"acm_mqs_mclk_sel", IMX_ADMA_ACM_MQS_TX_CLK_SEL, imx8dxl_mclk_sels, ARRAY_SIZE(imx8dxl_mclk_sels), 0x1C0000, 0, 2},
> +};
> +
> +/**
> + * clk_imx_acm_attach_pm_domains: attach multi power domains
> + * @dev: device pointer
> + * @dev_pm: power domains for device
> + */
> +static int clk_imx_acm_attach_pm_domains(struct device *dev,
> +					 struct clk_imx_acm_pm_domains *dev_pm)
> +{
> +	int ret;
> +	int i;
> +
> +	dev_pm->num_domains = of_count_phandle_with_args(dev->of_node, "power-domains",
> +							 "#power-domain-cells");
> +	if (dev_pm->num_domains <= 1)
> +		return 0;
> +
> +	dev_pm->pd_dev = devm_kmalloc_array(dev, dev_pm->num_domains,
> +					    sizeof(*dev_pm->pd_dev),
> +					    GFP_KERNEL);
> +	if (!dev_pm->pd_dev)
> +		return -ENOMEM;
> +
> +	dev_pm->pd_dev_link = devm_kmalloc_array(dev,
> +						 dev_pm->num_domains,
> +						 sizeof(*dev_pm->pd_dev_link),
> +						 GFP_KERNEL);
> +	if (!dev_pm->pd_dev_link)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < dev_pm->num_domains; i++) {
> +		dev_pm->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
> +		if (IS_ERR(dev_pm->pd_dev[i]))
> +			return PTR_ERR(dev_pm->pd_dev[i]);
> +
> +		dev_pm->pd_dev_link[i] = device_link_add(dev,
> +							 dev_pm->pd_dev[i],
> +							 DL_FLAG_STATELESS |
> +							 DL_FLAG_PM_RUNTIME |
> +							 DL_FLAG_RPM_ACTIVE);
> +		if (IS_ERR(dev_pm->pd_dev_link[i])) {
> +			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
> +			ret = PTR_ERR(dev_pm->pd_dev_link[i]);
> +			goto detach_pm;
> +		}
> +	}
> +	return 0;
> +
> +detach_pm:
> +	while (--i >= 0) {
> +		device_link_del(dev_pm->pd_dev_link[i]);
> +		dev_pm_domain_detach(dev_pm->pd_dev[i], false);
> +	}
> +	return ret;
> +}
> +
> +/**
> + * clk_imx_acm_detach_pm_domains: detach multi power domains
> + * @dev: deivice pointer
> + * @dev_pm: multi power domain for device
> + */
> +static int clk_imx_acm_detach_pm_domains(struct device *dev,
> +					 struct clk_imx_acm_pm_domains *dev_pm)
> +{
> +	int i;
> +
> +	if (dev_pm->num_domains <= 1)
> +		return 0;
> +
> +	for (i = 0; i < dev_pm->num_domains; i++) {
> +		device_link_del(dev_pm->pd_dev_link[i]);
> +		dev_pm_domain_detach(dev_pm->pd_dev[i], false);
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx8_acm_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *clk_hw_data;
> +	struct device *dev = &pdev->dev;
> +	struct clk_imx8_acm_sel *sels;
> +	struct imx8_acm_priv *priv;
> +	struct resource *res;
> +	struct clk_hw **hws;
> +	void __iomem *base;
> +	int ret;
> +	int i;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base = devm_ioremap(dev, res->start, resource_size(res));
> +	if (!base)
> +		return -ENOMEM;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->reg = base;
> +	priv->soc_data = of_device_get_match_data(dev);
> +	platform_set_drvdata(pdev, priv);
> +
> +	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
> +					  IMX_ADMA_ACM_CLK_END), GFP_KERNEL);
> +
> +	clk_hw_data->num = IMX_ADMA_ACM_CLK_END;
> +	hws = clk_hw_data->hws;
> +
> +	ret = clk_imx_acm_attach_pm_domains(&pdev->dev, &priv->dev_pm);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
> +
> +	sels = priv->soc_data->sels;
> +	for (i = 0; i < priv->soc_data->num_sels; i++) {
> +		hws[sels[i].clkid] = devm_clk_hw_register_mux_parent_data_table(dev,
> +										sels[i].name, sels[i].parents,
> +										sels[i].num_parents, 0,
> +										base + sels[i].reg,
> +										sels[i].shift, sels[i].width,
> +										0, NULL, NULL);
> +		if (IS_ERR(hws[sels[i].clkid])) {
> +			pm_runtime_disable(&pdev->dev);
> +			goto err_clk_register;
> +		}
> +	}
> +
> +	imx_check_clk_hws(hws, IMX_ADMA_ACM_CLK_END);
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register hws for ACM\n");
> +		pm_runtime_disable(&pdev->dev);
> +	}
> +
> +err_clk_register:
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static int imx8_acm_clk_remove(struct platform_device *pdev)
> +{
> +	struct imx8_acm_priv *priv = dev_get_drvdata(&pdev->dev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	clk_imx_acm_detach_pm_domains(&pdev->dev, &priv->dev_pm);
> +
> +	return 0;
> +}
> +
> +static const struct imx8_acm_soc_data imx8qm_acm_data = {
> +	.sels = imx8qm_sels,
> +	.num_sels = ARRAY_SIZE(imx8qm_sels),
> +};
> +
> +static const struct imx8_acm_soc_data imx8qxp_acm_data = {
> +	.sels = imx8qxp_sels,
> +	.num_sels = ARRAY_SIZE(imx8qxp_sels),
> +};
> +
> +static const struct imx8_acm_soc_data imx8dxl_acm_data = {
> +	.sels = imx8dxl_sels,
> +	.num_sels = ARRAY_SIZE(imx8dxl_sels),
> +};
> +
> +static const struct of_device_id imx8_acm_match[] = {
> +	{ .compatible = "fsl,imx8qm-acm", .data = &imx8qm_acm_data },
> +	{ .compatible = "fsl,imx8qxp-acm", .data = &imx8qxp_acm_data },
> +	{ .compatible = "fsl,imx8dxl-acm", .data = &imx8dxl_acm_data },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8_acm_match);
> +
> +static int __maybe_unused imx8_acm_runtime_suspend(struct device *dev)
> +{
> +	struct imx8_acm_priv *priv = dev_get_drvdata(dev);
> +	struct clk_imx8_acm_sel *sels;
> +	int i;
> +
> +	sels = priv->soc_data->sels;
> +
> +	for (i = 0; i < priv->soc_data->num_sels; i++)
> +		priv->regs[i] = readl_relaxed(priv->reg + sels[i].reg);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused imx8_acm_runtime_resume(struct device *dev)
> +{
> +	struct imx8_acm_priv *priv = dev_get_drvdata(dev);
> +	struct clk_imx8_acm_sel *sels;
> +	int i;
> +
> +	sels = priv->soc_data->sels;
> +
> +	for (i = 0; i < priv->soc_data->num_sels; i++)
> +		writel_relaxed(priv->regs[i], priv->reg + sels[i].reg);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops imx8_acm_pm_ops = {
> +	SET_RUNTIME_PM_OPS(imx8_acm_runtime_suspend,
> +			   imx8_acm_runtime_resume, NULL)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				      pm_runtime_force_resume)
> +};
> +
> +static struct platform_driver imx8_acm_clk_driver = {
> +	.driver = {
> +		.name = "imx8-acm",
> +		.of_match_table = imx8_acm_match,
> +		.pm = &imx8_acm_pm_ops,
> +	},
> +	.probe = imx8_acm_clk_probe,
> +	.remove = imx8_acm_clk_remove,
> +};
> +module_platform_driver(imx8_acm_clk_driver);
> +
> +MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
> +MODULE_DESCRIPTION("Freescale i.MX8 Audio Clock Mux driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 
