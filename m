Return-Path: <linux-clk+bounces-6579-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D18B8962
	for <lists+linux-clk@lfdr.de>; Wed,  1 May 2024 13:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F04B61F22C30
	for <lists+linux-clk@lfdr.de>; Wed,  1 May 2024 11:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47B282893;
	Wed,  1 May 2024 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7d0b+ty"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BDC7E58F
	for <linux-clk@vger.kernel.org>; Wed,  1 May 2024 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714563577; cv=none; b=ryr6MizbXC0YohTx+Yl1aRqErGPyP2mQuqshXrMsLnQozdRf98sZc/N/gLX+Z+dBP8Qcvjc3i0r9aW8QmncX5dbKMqf6npA8VOEJqKASgE5QHvTHkv+WRnrUxGhwzqc5ufQEGyNocytJewxbcOmLYzMz6Emlf7I13JDM12PRZac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714563577; c=relaxed/simple;
	bh=hWiB2IF9/BVtMMyQ4v988Y/lvqGLBwMNOHdlgiN6avs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwaULk/ELr8Qqaye2heH/bwznlzXp8vtK4NU6u7R0/7MXNN1SCyGClun6kjxe/Q3ZeQc7Gwu+HPdF+ppAm2m9vP59X9V9rI7stpuH7XqhtdUWgPKu9GaAjm62UG3bnM/afHlSB1kekFwGL91DNocC2h1CXu2mutuwqZaEXvsBa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7d0b+ty; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a5872b74c44so757282666b.3
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 04:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714563574; x=1715168374; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6F17kWFJJgrPWa4fwXbgU8r9m9niISBPH10+pYqanrE=;
        b=X7d0b+tyOuHKQFEFrwUzA4STFjTPXfaIeFQ2Wts6j9HBqZFAiBgKa5DcbkvRE7b2Gi
         1q4uTeF5AOJd5zcmPdtgcJXIJDhjt9litgsuRc/m/sAm2n+5mMsLOSmsl2Lm5onswdjZ
         9fDqGZESWNq4XVU+gtaiBo4U6ERgpFWBa9uhP7JRzP8/gAw6vLQz8+y3bSHJxQUqWaDz
         quI8boiorD3z6bWCGq4jXwAOmWS47DcTglb9wM7rvWHfR0417VoePcg4qqlG4ao7MZrF
         SU06JGLyq6YOahFUnL0st50r24MTzsHnbiNvu1WIjNXpWCSx5eXqCsR4dvuOE31XIBdt
         KrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714563574; x=1715168374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6F17kWFJJgrPWa4fwXbgU8r9m9niISBPH10+pYqanrE=;
        b=DjG1xJFwxhj/pPkz3tBbIov+BFp6N5FKIhYIb2RdNqchpryfqOsSlLHNDJI6THMABe
         ti8uldwRu3MWgL0nnKURTBcxgtXuChRLv3R3Znq0Qreh/wr9ONCZ/wuxDUFSImOX5L7H
         iu4iMCNNBklDTtllve4CxWH0OkEon7Cbsmpt1WbiuX9uLrZ0le2KxlOdn+TzKqcriMw+
         dOl8rKxfM+RygyYN7CV+4AJp7JmgVK38xQnoS/SuJcmthLHfn1hndvSrHg2z2GUlVSQp
         MyA2+MbWh5CXpsDiu5nqWP+YtIYwH2aBfbQ8zuv3s9LBWF6CK4cK/KpiNNTfZkbd2a+v
         Vj6w==
X-Forwarded-Encrypted: i=1; AJvYcCUISHbnwPQOZkRRsfc5O4mm/FAIcWs/d5EvcDyo5dBjIgvLMo8ZGlqDwwNjrhQMjGBV9h2ti8ZUFhGNPreLlbmp35DtyhgKXT1Y
X-Gm-Message-State: AOJu0YwtpPQdaZdJ4T3E+gb1+bnX+rdryE62wC5BiKZAMcTpEuSOR0Pq
	Ux/WDEE1Pb416BNAyc/BongrLJvtBx24ccRrrruJZxSUGicd82ohWLjIksdYYFI=
X-Google-Smtp-Source: AGHT+IG0gW8AtnHPdOjlgNheHMn3PEoAxQnpTPi2JoQxokArraxLe3iFJHW1+ihQz250D5AqltkHqw==
X-Received: by 2002:a17:906:af85:b0:a58:a1e3:a2cd with SMTP id mj5-20020a170906af8500b00a58a1e3a2cdmr1578941ejb.55.1714563573542;
        Wed, 01 May 2024 04:39:33 -0700 (PDT)
Received: from linaro.org ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906c08700b00a51a80028e8sm16222894ejz.65.2024.05.01.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 04:39:33 -0700 (PDT)
Date: Wed, 1 May 2024 14:39:31 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] clk: imx: imx8mp: Convert to platform remove callback
 returning void
Message-ID: <ZjIp85IouNtMV7JD@linaro.org>
References: <20240423071232.463201-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423071232.463201-2-u.kleine-koenig@pengutronix.de>

On 24-04-23 09:12:31, Uwe Kleine-K�nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for power saving")
> Signed-off-by: Uwe Kleine-K�nig <u.kleine-koenig@pengutronix.de>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Hello,
> 
> after the merge window leading to v6.10-rc1 (assuming Linus has >= 10 fingers
> this cycle :-) I want to switch the prototype of struct
> platform_driver::remove to return void. So please either merge this
> patch together with 1496dd413b2e, or accept me sending this patch
> together with the patch changing the function's prototype for inclusion
> to Greg's driver-core tree.

Sure, will apply it today.

> 
> Thanks
> Uwe
> 
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
> index 574a032309c1..be9df93b6adb 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -346,11 +346,9 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int clk_imx8mp_audiomix_remove(struct platform_device *pdev)
> +static void clk_imx8mp_audiomix_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
> @@ -382,7 +380,7 @@ MODULE_DEVICE_TABLE(of, clk_imx8mp_audiomix_of_match);
>  
>  static struct platform_driver clk_imx8mp_audiomix_driver = {
>  	.probe	= clk_imx8mp_audiomix_probe,
> -	.remove = clk_imx8mp_audiomix_remove,
> +	.remove_new = clk_imx8mp_audiomix_remove,
>  	.driver = {
>  		.name = "imx8mp-audio-blk-ctrl",
>  		.of_match_table = clk_imx8mp_audiomix_of_match,
> -- 
> 2.43.0
> 

