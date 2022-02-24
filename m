Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2092C4C22AE
	for <lists+linux-clk@lfdr.de>; Thu, 24 Feb 2022 04:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiBXDuq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Feb 2022 22:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiBXDup (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 22:50:45 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F106A25456B
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 19:50:16 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id y15-20020a4a650f000000b0031c19e9fe9dso1638670ooc.12
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 19:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YX+8SJVk0oliJ3pEu4ZMjuzH+FEJiz0kXUJ+6yLv9a4=;
        b=GA90Bpj8f/3QLmmY2xQqr8xq+ilH5tEUvsH11kAFRgyfYarduXU7XRPIiOH5yE81IB
         o2uD+ecmbi5A1PhoB++9M+aZgJwciRkK2iES4b0oYLvjRmOx7+XEb7rT5NC8D9vJ/Tun
         sk85rMK4Hi05XxQFYG3O/8cCI44k4R6QOM7XQTPHiORfV9KQ9pbi4OVmOKzFZHm3FC89
         SW5hxuG1YIqDQJ+jusCORyRQOdu02/7RgaL1zFTNDUbTZTgw9OHUObyxynkBt4qPa3zn
         OVkkkBHUEEvvOJFQB4WCgFUbgXzXIH+B0NU4g+8fe/pp9t3SzNmZbaNKuOk5pMcCAAEu
         9e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YX+8SJVk0oliJ3pEu4ZMjuzH+FEJiz0kXUJ+6yLv9a4=;
        b=oPzPjfCntWEigBA070hC8OhIDra/K/tb3IAIycgVb7QidWQ2o0AFb9MiKUdtYZM5zb
         BGfSp71CmVb7t3mW0XkrmZiGu6td4J0elikVZDprW+mqm+Z/fju8W4L9Qws8/th2x26h
         rPoDYz2QEXefo7bA4uZuu9et0/W/bw8qWgYcNmbcxla+2SqJGRgje1RxYBrOsMZBqRTz
         Wr7E675qO+kXbln+CYiB2rZWMt7rN0O4juWgwcgCgxqjTJqP17SccX8mrJ2ivK5QSCoH
         AYIRH/0SYpOzFzHmEst2Y0Il5Wv6Bg+JHWqDJUVn5o7R2/m9qrv/raSbLaalY062Q0vT
         EHjQ==
X-Gm-Message-State: AOAM532HfQrkgzvobHtGOkxHqv9ohad9Qgn3v8/o7MmMUocPJG0O88l8
        n8dNf4xcPOGedD1SvNXqSdFYyWTCd8lQkA==
X-Google-Smtp-Source: ABdhPJwfPVEYmjXLEJZtJLB3Y6ke4eOm2bx2wvBFvPmm0pp7LB7bFxCVEHhSH1ML96DFDxbNe+fzFw==
X-Received: by 2002:a05:6870:832a:b0:cc:f848:1651 with SMTP id p42-20020a056870832a00b000ccf8481651mr316226oae.347.1645674616380;
        Wed, 23 Feb 2022 19:50:16 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id o2sm645821otl.9.2022.02.23.19.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 19:50:15 -0800 (PST)
Date:   Wed, 23 Feb 2022 21:50:14 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/16] clk: qcom: gcc-ipq806x: drop hardcoded pxo and
 cxo source clk
Message-ID: <YhcAdq4ouQenhn2f@builder.lan>
References: <20220217235703.26641-1-ansuelsmth@gmail.com>
 <20220217235703.26641-8-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217235703.26641-8-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 17 Feb 17:56 CST 2022, Ansuel Smith wrote:

> We now define these clk in dts. Drop pxo and cxo hardcoded in the gcc
> probe function.
> 

As noted on the previous patch, this breaks booting with existing dtbs.
So I would like to split this with 1-2 releases in between to avoid any
problems.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

on the change though.

Regards,
Bjorn

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq806x.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> index f6db7247835e..a4bf78fe8678 100644
> --- a/drivers/clk/qcom/gcc-ipq806x.c
> +++ b/drivers/clk/qcom/gcc-ipq806x.c
> @@ -3119,23 +3119,14 @@ MODULE_DEVICE_TABLE(of, gcc_ipq806x_match_table);
>  
>  static int gcc_ipq806x_probe(struct platform_device *pdev)
>  {
> -	struct device *dev = &pdev->dev;
>  	struct regmap *regmap;
>  	int ret;
>  
> -	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 25000000);
> -	if (ret)
> -		return ret;
> -
> -	ret = qcom_cc_register_board_clk(dev, "pxo_board", "pxo", 25000000);
> -	if (ret)
> -		return ret;
> -
>  	ret = qcom_cc_probe(pdev, &gcc_ipq806x_desc);
>  	if (ret)
>  		return ret;
>  
> -	regmap = dev_get_regmap(dev, NULL);
> +	regmap = dev_get_regmap(&pdev->dev, NULL);
>  	if (!regmap)
>  		return -ENODEV;
>  
> -- 
> 2.34.1
> 
