Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF5D4B44DB
	for <lists+linux-clk@lfdr.de>; Mon, 14 Feb 2022 09:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242239AbiBNIsy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 14 Feb 2022 03:48:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240341AbiBNIsx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Feb 2022 03:48:53 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF625674E
        for <linux-clk@vger.kernel.org>; Mon, 14 Feb 2022 00:48:45 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id w1so9988802plb.6
        for <linux-clk@vger.kernel.org>; Mon, 14 Feb 2022 00:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0213eCef7TIL2MvkZ9Bue/8Mgn370BBknHdTEHhXe/g=;
        b=N6LBIUpcan1t9ObXkdAU+NPD4v4f8dIucFdC4Cu7UZJMUpcUaVvnzzxLK6i2RslHrq
         p0gJIFzrkZyKw5tP4b+eiJsA4LVKNCqCfL2CQJcIcDZA/uvduL2VdRQGrfxwVnO7Ih4u
         Ui+PzrJ13MEas9XSVEtOPVkvXGUOi//ZU/LNqWjr0UT2G9sp4H0eIdOm1Gi2mXgZHaoG
         xpZVdaKlC24PCJcWpA861wBU0uHIib1SkOqaVCjW6BK+pDdYSG88azN4cYYONXOWFLnP
         5sl7yjAX/UKnAQpKUhBnAt2PsRcKkRFbtmhvYdqWovgU7ZxoC80Gz9lHWgvagVbjLq9q
         k1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0213eCef7TIL2MvkZ9Bue/8Mgn370BBknHdTEHhXe/g=;
        b=iZSAv2ifymhkmScG4lch3pHg1aioLpZB84XttiX0Ky0Au4RdeAndCS9B5rtbstwxcX
         Tv5o6N7FxJoRM4f8YqPsYGrwKwvtqKq8wVtwUYfZ/cjTiJwc58FapWZB/3feHKueQPq5
         nmmlcqlLAfD+2y1q3NCwMkDsqn37iRHCGYIc7dS483tN89wvQO5STTu9Mw0WK1TVqY0E
         wDhNplnSiCgqRWv4j2D0XaYQuS7JrfldrFxQApnivQneFyyg5/AlYqBEpw1gPXlBWFoa
         jkwFk4OUSld1IrrKYrZYR721mVUKoYo0kGdkXWInnjLYV2r7JiIlkoLyGCY1GPfnHUeO
         nIiw==
X-Gm-Message-State: AOAM532DAW9HYniFib+6t+Q/NK50Lg1XdsqR8j8IsXzpo+5w5IiO0AKM
        FxbfIJRQBsLPSQWp2p2s94rD
X-Google-Smtp-Source: ABdhPJy52FiMd9G529k12vI66yqIZ6MrIxLiIgDZyifJdFJLMd3J5AU1HT+lH8N/AVlvOUJy2veSWg==
X-Received: by 2002:a17:902:a9c6:: with SMTP id b6mr13409917plr.90.1644828525268;
        Mon, 14 Feb 2022 00:48:45 -0800 (PST)
Received: from thinkpad ([2409:4072:817:5a6f:3104:62c0:1941:5033])
        by smtp.gmail.com with ESMTPSA id t24sm36171906pfg.92.2022.02.14.00.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:48:45 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:18:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 7/8] clk: qcom: Add SDX65 APCS clock controller support
Message-ID: <20220214084839.GG3494@thinkpad>
References: <1644822247-27884-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644822247-27884-1-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 14, 2022 at 12:34:07PM +0530, Rohit Agarwal wrote:
> Add a driver for the SDX65 APCS clock controller. It is part of the APCS
> hardware block, which among other things implements also a combined mux
> and half integer divider functionality. The APCS clock controller has 3
> parent clocks:
> 
> 1. Board XO
> 2. Fixed rate GPLL0
> 3. A7 PLL
> 
> This is required for enabling CPU frequency scaling on SDX65-based
> platforms.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

I assume that the SDX65 is alomst a replica of SDX55. So why can't we use
"qcom-sdx55-acps-clk"?

Thanks,
Mani

> ---
>  drivers/clk/qcom/Kconfig      |   9 +++
>  drivers/clk/qcom/Makefile     |   1 +
>  drivers/clk/qcom/apcs-sdx65.c | 130 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 drivers/clk/qcom/apcs-sdx65.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 1904ba1..49e89f8 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -63,6 +63,15 @@ config QCOM_CLK_APCS_SDX55
>  	  Say Y if you want to support CPU frequency scaling on devices
>  	  such as SDX55.
>  
> +config QCOM_CLK_APCS_SDX65
> +        tristate "SDX65 APCS Clock Controller"
> +        depends on QCOM_APCS_IPC || COMPILE_TEST
> +        help
> +          Support for the APCS Clock Controller on SDX65 platform. The
> +          APCS is managing the mux and divider which feeds the CPUs.
> +          Say Y if you want to support CPU frequency scaling on devices
> +          such as SDX65.
> +
>  config QCOM_CLK_RPM
>  	tristate "RPM based Clock Controller"
>  	depends on MFD_QCOM_RPM
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 3d855c1..f914f31 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
>  obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
>  obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += clk-cpu-8996.o
>  obj-$(CONFIG_QCOM_CLK_APCS_SDX55) += apcs-sdx55.o
> +obj-$(CONFIG_QCOM_CLK_APCS_SDX65) += apcs-sdx65.o
>  obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
>  obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
>  obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
> diff --git a/drivers/clk/qcom/apcs-sdx65.c b/drivers/clk/qcom/apcs-sdx65.c
> new file mode 100644
> index 0000000..c0cc16a
> --- /dev/null
> +++ b/drivers/clk/qcom/apcs-sdx65.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/cpu.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#include "clk-regmap.h"
> +#include "clk-regmap-mux-div.h"
> +
> +static const u32 apcs_mux_clk_parent_map[] = { 0, 1, 5 };
> +
> +static const struct clk_parent_data pdata[] = {
> +	{ .fw_name = "ref" },
> +	{ .fw_name = "aux" },
> +	{ .fw_name = "pll" },
> +};
> +
> +static int a7cc_notifier_cb(struct notifier_block *nb, unsigned long event,
> +				void *data)
> +{
> +	int ret = 0;
> +	struct clk_regmap_mux_div *md = container_of(nb,
> +						struct clk_regmap_mux_div,
> +						clk_nb);
> +	if (event == PRE_RATE_CHANGE)
> +		ret = mux_div_set_src_div(md, 1, 2);
> +
> +	return notifier_from_errno(ret);
> +}
> +
> +static int qcom_apcs_sdx65_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device *parent = dev->parent;
> +	struct device *cpu_dev;
> +	struct clk_regmap_mux_div *a7cc;
> +	struct regmap *regmap;
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	regmap = dev_get_regmap(parent, NULL);
> +	if (!regmap) {
> +		dev_err(dev, "Failed to get parent regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	a7cc = devm_kzalloc(dev, sizeof(*a7cc), GFP_KERNEL);
> +	if (!a7cc)
> +		return -ENOMEM;
> +
> +	init.name = "a7mux";
> +	init.parent_data = pdata;
> +	init.num_parents = ARRAY_SIZE(pdata);
> +	init.ops = &clk_regmap_mux_div_ops;
> +
> +	a7cc->clkr.hw.init = &init;
> +	a7cc->clkr.regmap = regmap;
> +	a7cc->reg_offset = 0x8;
> +	a7cc->hid_width = 5;
> +	a7cc->hid_shift = 0;
> +	a7cc->src_width = 3;
> +	a7cc->src_shift = 8;
> +	a7cc->parent_map = apcs_mux_clk_parent_map;
> +
> +	a7cc->pclk = devm_clk_get(parent, "pll");
> +	if (IS_ERR(a7cc->pclk))
> +		return dev_err_probe(dev, PTR_ERR(a7cc->pclk),
> +					 "Failed to get PLL clk\n");
> +
> +	a7cc->clk_nb.notifier_call = a7cc_notifier_cb;
> +	ret = clk_notifier_register(a7cc->pclk, &a7cc->clk_nb);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +					 "Failed to register clock notifier\n");
> +
> +	ret = devm_clk_register_regmap(dev, &a7cc->clkr);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register regmap clock\n");
> +		goto err;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
> +					&a7cc->clkr.hw);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to add clock provider\n");
> +		goto err;
> +	}
> +
> +	platform_set_drvdata(pdev, a7cc);
> +
> +	cpu_dev = get_cpu_device(0);
> +	dev_pm_domain_attach(cpu_dev, true);
> +
> +	return 0;
> +
> +err:
> +	clk_notifier_unregister(a7cc->pclk, &a7cc->clk_nb);
> +	return ret;
> +}
> +
> +static int qcom_apcs_sdx65_clk_remove(struct platform_device *pdev)
> +{
> +	struct device *cpu_dev = get_cpu_device(0);
> +	struct clk_regmap_mux_div *a7cc = platform_get_drvdata(pdev);
> +
> +	clk_notifier_unregister(a7cc->pclk, &a7cc->clk_nb);
> +	dev_pm_domain_detach(cpu_dev, true);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver qcom_apcs_sdx65_clk_driver = {
> +	.probe = qcom_apcs_sdx65_clk_probe,
> +	.remove = qcom_apcs_sdx65_clk_remove,
> +	.driver = {
> +		.name = "qcom-sdx65-acps-clk",
> +	},
> +};
> +module_platform_driver(qcom_apcs_sdx65_clk_driver);
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Qualcomm SDX65 APCS Clock driver");
> -- 
> 2.7.4
> 
