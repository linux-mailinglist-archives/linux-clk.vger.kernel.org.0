Return-Path: <linux-clk+bounces-3020-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B3C83FEB2
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jan 2024 07:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EB9D1C21DF2
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jan 2024 06:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935474D11F;
	Mon, 29 Jan 2024 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yXCeIgja"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DDA4EB35
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706511303; cv=none; b=DWeY56ZNaJVFn4dZwiO/708n/CGA2sl10Ljhcv7Q564hn+sUhF9cMUTGCcMWkDUmDGiQjIWabicJrIZlqd3k1umxkwO6gGxUS66W00fLQb1/XO+4EPEzz2lV0fyFmeT2Xt/tbCuSZ28INCzEB8Iwv6EPBUVFsKEhAu+CCPRU4xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706511303; c=relaxed/simple;
	bh=2EPa0U+VukGXPRNbsZYJGUNCbNggov8QmdEi5cf3Kko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUXn0oomT5oEROwi1XA9h5O/6REez8w0WHEHggQQlcFJUTrU4cyAvaxHpEY3jL+gG2bOxHhs+Dc4F9F7RaweSDpyROGcmZX+61IEVPqnTNOBkvuXBpue01TbxoL/tzZIGaSSNQulk8oOkd9Kzg7SYe5KAum4WtLDKSYVQtMbiG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yXCeIgja; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-42a446cb1baso21383761cf.0
        for <linux-clk@vger.kernel.org>; Sun, 28 Jan 2024 22:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706511300; x=1707116100; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1hxnPoh6daX0WjU31FuHTB7nYnSeoBVwHLBpFGzZZE=;
        b=yXCeIgja1BeZkXGrCxSjIQFQTKha3rrK7ldC39PtRrQfCWas1NYafGEkgQ6VaLhZrT
         ncXNQRL/9U4QNTYdBzsbBSyrKH6IkB1/FPn0JUuKNAe4mtHwnj4fgyw8fvD6ICUuVohP
         JhTvrUoPVXOUCK+GH8GTv1cmA8npbkz6TcRMIeEq+MewxcStyRMHW6AuYBqY3IrM1kBE
         pGFi8wckNS7jMO4FPFY9jhO3Kj3l2UMVe7FJsg5tjByPIj+AD3eS8altVt3cZHVcQyOF
         L3/x9/OEHoFskp6aNg7Q5C5wc7DKLrMGlFdYEoVApo4nlMtWYgQuA8e48EywXFyq1cjO
         1l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706511300; x=1707116100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1hxnPoh6daX0WjU31FuHTB7nYnSeoBVwHLBpFGzZZE=;
        b=WzG2NuNI3s4jpG+aH0YM+2znSN76sZxH53tAzVl39kuR8mgk9IJ/4V7NZ7Sqb2A8Zb
         13PHy9rTSY3kZCTOcKOooLBOjZPMIAFRk4HKXgwGRkwcPn+FzA9qZMuQSocdkwnUgAtw
         rD7UlXxLXGYz5wOfW5ge4p18YBzpkQkojo37laTlM07s4mgJUXXpUyYAo7nGfCxUmjkt
         Fs3DGGvjLPCZyF0qP3B5lappoDRZ+vDKiXQmF2NmTsaouKfPhUcBWT5GDIzo94p8768V
         wZuwGPv6s9vNsEN0ChKvXK9Kx3UoDHErAvVebJOBIqb/7a8AVCK8UHCUWsWrPCn46Amo
         1gcw==
X-Gm-Message-State: AOJu0YzltwxQ9u2E58pq25YE2Noc6cLA7sHdCvm9EHbaycG9d1SLlczH
	ge8bZe0XZucTjIx3rOwS6lQHze6SF++xGgOBhv3fbQwDZllTkeGUNJKAhqGdXQ==
X-Google-Smtp-Source: AGHT+IHwfQa7OVYQ7eqwRmxrB+cXFuJ+tQWWagggVHZdoSqnHID39moNiRd92Sd4lXHtYQce6W0czA==
X-Received: by 2002:ac8:7f4c:0:b0:42a:9b63:7828 with SMTP id g12-20020ac87f4c000000b0042a9b637828mr2844845qtk.68.1706511299804;
        Sun, 28 Jan 2024 22:54:59 -0800 (PST)
Received: from thinkpad ([117.193.214.109])
        by smtp.gmail.com with ESMTPSA id cb27-20020a05622a1f9b00b004283695a39bsm1356146qtb.94.2024.01.28.22.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 22:54:59 -0800 (PST)
Date: Mon, 29 Jan 2024 12:24:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
	linux@armlinux.org.uk, m.szyprowski@samsung.com,
	pankaj.dubey@samsung.com
Subject: Re: [PATCH v4 1/2] clk: Provide managed helper to get and enable
 bulk clocks
Message-ID: <20240129065448.GC2971@thinkpad>
References: <20240124103838.32478-1-shradha.t@samsung.com>
 <CGME20240124103855epcas5p27400bd95df42f36b9547a4e28aa26f5d@epcas5p2.samsung.com>
 <20240124103838.32478-2-shradha.t@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124103838.32478-2-shradha.t@samsung.com>

On Wed, Jan 24, 2024 at 04:08:37PM +0530, Shradha Todi wrote:
> Provide a managed devm_clk_bulk* wrapper to get and enable all
> bulk clocks in order to simplify drivers that keeps all clocks
> enabled for the time of driver operation.
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  drivers/clk/clk-devres.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/clk.h      | 24 ++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index 4fb4fd4b06bd..cbbd2cc339c3 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -182,6 +182,46 @@ int __must_check devm_clk_bulk_get_all(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all);
>  
> +static void devm_clk_bulk_release_all_enable(struct device *dev, void *res)
> +{
> +	struct clk_bulk_devres *devres = res;
> +
> +	clk_bulk_disable_unprepare(devres->num_clks, devres->clks);
> +	clk_bulk_put_all(devres->num_clks, devres->clks);
> +}
> +
> +int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
> +					      struct clk_bulk_data **clks)
> +{
> +	struct clk_bulk_devres *devres;
> +	int ret;
> +
> +	devres = devres_alloc(devm_clk_bulk_release_all_enable,
> +			      sizeof(*devres), GFP_KERNEL);
> +	if (!devres)
> +		return -ENOMEM;
> +
> +	ret = clk_bulk_get_all(dev, &devres->clks);
> +	if (ret > 0) {
> +		*clks = devres->clks;
> +		devres->num_clks = ret;
> +	} else {
> +		devres_free(devres);
> +		return ret;
> +	}

How about:

	ret = clk_bulk_get_all(dev, &devres->clks);
	if (ret <= 0) {
		devres_free(devres);
		return ret;
	}

	*clks = devres->clks;
	devres->num_clks = ret;

Even though this patch follows the pattern used by the rest of the APIs in the
driver, IMO above makes it more readable.

> +
> +	ret = clk_bulk_prepare_enable(devres->num_clks, *clks);
> +	if (!ret) {
> +		devres_add(dev, devres);
> +	} else {
> +		clk_bulk_put_all(devres->num_clks, devres->clks);
> +		devres_free(devres);
> +	}
> +

Same as above:

	ret = clk_bulk_prepare_enable(devres->num_clks, *clks);
	if (ret) {
		clk_bulk_put_all(devres->num_clks, devres->clks);
		devres_free(devres);
		return ret;
	}

	devres_add(dev, devres);

> +	return ret;

	return 0;

> +}
> +EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
> +
>  static int devm_clk_match(struct device *dev, void *res, void *data)
>  {
>  	struct clk **c = res;
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 1ef013324237..a005e709b7bd 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -438,6 +438,23 @@ int __must_check devm_clk_bulk_get_optional(struct device *dev, int num_clks,
>  int __must_check devm_clk_bulk_get_all(struct device *dev,
>  				       struct clk_bulk_data **clks);
>  
> +/**
> + * devm_clk_bulk_get_all_enable - managed get multiple clk consumers and
> + *				  enable all clks

"Get and enable all clocks of the consumer (managed)"

> + * @dev: device for clock "consumer"
> + * @clks: pointer to the clk_bulk_data table of consumer
> + *
> + * Returns success (0) or negative errno.
> + *
> + * This helper function allows drivers to get several clk

"This helper function allows drivers to get all clocks of the consumer and
enables them..."

- Mani

> + * consumers and enable all of them in one operation with management.
> + * The clks will automatically be disabled and freed when the device
> + * is unbound.
> + */
> +
> +int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
> +					      struct clk_bulk_data **clks);
> +
>  /**
>   * devm_clk_get - lookup and obtain a managed reference to a clock producer.
>   * @dev: device for clock "consumer"
> @@ -960,6 +977,13 @@ static inline int __must_check devm_clk_bulk_get_all(struct device *dev,
>  	return 0;
>  }
>  
> +static inline int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
> +						struct clk_bulk_data **clks)
> +{
> +
> +	return 0;
> +}
> +
>  static inline struct clk *devm_get_clk_from_child(struct device *dev,
>  				struct device_node *np, const char *con_id)
>  {
> -- 
> 2.17.1
> 

-- 
மணிவண்ணன் சதாசிவம்

