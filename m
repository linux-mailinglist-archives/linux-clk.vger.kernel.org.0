Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58FBD12F51A
	for <lists+linux-clk@lfdr.de>; Fri,  3 Jan 2020 08:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgACHrv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 3 Jan 2020 02:47:51 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41417 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgACHrv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jan 2020 02:47:51 -0500
Received: by mail-pl1-f195.google.com with SMTP id bd4so18771462plb.8
        for <linux-clk@vger.kernel.org>; Thu, 02 Jan 2020 23:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TYmR7Su3TQRhxaGSs/Gmy519O0CuGnaDkzrvLms+94Q=;
        b=XEFtpMy5dirtZBAqM+HlhZxWmFJs8HM7yAX4hIvs1uimxFANWi/fN275Yyz0CfOQZn
         VKiiTqf2W6g4Eug26y3EBVgcQiGR4E1Lv28ZNhY3cNo7bcsThg2VG3jNwU4hX8LsKa7Y
         +x9xhrdzgZPuLS7t/3yM4jrcK/t3npeui8yU9zzihZCfmNiXppGIIFxle1dS8JC0fVhw
         Zs4sLyPsqJHT/fr1v2/7dO8AVfCUoLeb5OdPcNoMrD8BRFfJGra8meReEPPIkK0OXyLM
         hD+vWP0pgKG/8VXUOQTVDq0FzW6a8Qa55dAXGTZW63b7HFulGhCwrMkJ3vuqwGCsaOOz
         /SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TYmR7Su3TQRhxaGSs/Gmy519O0CuGnaDkzrvLms+94Q=;
        b=pWr4gg57hpCwsXSmkDfLf/vC9dNIcars0MoejkN5jaW2TwPcbJePqIkNUdFuBlu2N8
         v0FAVc4n5Pfi34158I9fy9t2u5JXM8FcfGLUuTyoH76JyYNXUcRBBGN5xVa8BHoC7fJ5
         pgokk6Z0L0M6rRg/yH3PVdSiWxcjk1nJow59bu+JeCty5ZEkamUXdu7K8GwkMRgw45+z
         boOeHsB4jfOKvcxg14ckBpVty4yjb08VFDQR148z6TC4ON65sFaJQfm7P+PUAB4z4foM
         BPEt1KMfl33OFCXp7iZkTrrgX16NKx7GWNAvFtZJBthnK/AbkQfTbfb9XOfcvPWEDyfI
         xzsw==
X-Gm-Message-State: APjAAAUuS/XB1yCRM4GOuB0omPJbw7pKtHYNDHSMXizaIn9p+X9d/Fa3
        H4ImkAnhuY+7hAji8/CWCaQ+UQ==
X-Google-Smtp-Source: APXvYqxz0tmqTG4nkUi/jqHamIprde+Yghm55ERkvI/ApLP+eEKBlyIgUlbqqmbMFNvps9rmIp6gCw==
X-Received: by 2002:a17:90a:c388:: with SMTP id h8mr24798177pjt.83.1578037670646;
        Thu, 02 Jan 2020 23:47:50 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k16sm13727175pje.18.2020.01.02.23.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 23:47:49 -0800 (PST)
Date:   Thu, 2 Jan 2020 23:47:47 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        amit.kucheria@linaro.org, sboyd@kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] clk: qcom: apcs-msm8916: use clk_parent_data to
 specify the parent
Message-ID: <20200103074747.GN988120@minitux>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
 <20191125135910.679310-8-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191125135910.679310-8-niklas.cassel@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 25 Nov 05:59 PST 2019, Niklas Cassel wrote:

> Allow accessing the parent clock names required for the driver
> operation by using the device tree node, while falling back to
> the previous method of using names in the global name space.
> 
> This permits extending the driver to other platforms without having to
> modify its source code.
> 
> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
> Changes since v2:
> -Use clk_parent_data when specifying clock parents.
> 
>  drivers/clk/qcom/apcs-msm8916.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
> index 46061b3d230e..bb91644edc00 100644
> --- a/drivers/clk/qcom/apcs-msm8916.c
> +++ b/drivers/clk/qcom/apcs-msm8916.c
> @@ -19,9 +19,9 @@
>  
>  static const u32 gpll0_a53cc_map[] = { 4, 5 };
>  
> -static const char * const gpll0_a53cc[] = {
> -	"gpll0_vote",
> -	"a53pll",
> +static const struct clk_parent_data pdata[] = {
> +	{ .fw_name = "aux", .name = "gpll0_vote", },
> +	{ .fw_name = "pll", .name = "a53pll", },
>  };
>  
>  /*
> @@ -51,6 +51,19 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  	struct clk_init_data init = { };
>  	int ret = -ENODEV;
>  
> +	/*
> +	 * This driver is defined by the devicetree binding
> +	 * Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt,
> +	 * however, this driver is registered as a platform device by
> +	 * qcom-apcs-ipc-mailbox.c. Because of this, when this driver
> +	 * uses dev_get_regmap() and devm_clk_get(), it has to send the parent
> +	 * device as argument.
> +	 * When registering with the clock framework, we cannot use this trick,
> +	 * since the clock framework always looks at dev->of_node when it tries
> +	 * to find parent clock names using clk_parent_data.
> +	 */
> +	dev->of_node = parent->of_node;
> +

With this hunk replaced by Stephen's patch for handling this in the
clock core I did some basic tests and things seems to work as expected.

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  	regmap = dev_get_regmap(parent, NULL);
>  	if (!regmap) {
>  		dev_err(dev, "failed to get regmap: %d\n", ret);
> @@ -62,8 +75,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	init.name = "a53mux";
> -	init.parent_names = gpll0_a53cc;
> -	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
> +	init.parent_data = pdata;
> +	init.num_parents = ARRAY_SIZE(pdata);
>  	init.ops = &clk_regmap_mux_div_ops;
>  	init.flags = CLK_SET_RATE_PARENT;
>  
> -- 
> 2.23.0
> 
