Return-Path: <linux-clk+bounces-11793-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCAD96EB00
	for <lists+linux-clk@lfdr.de>; Fri,  6 Sep 2024 08:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C929D285B5E
	for <lists+linux-clk@lfdr.de>; Fri,  6 Sep 2024 06:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056D513D891;
	Fri,  6 Sep 2024 06:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="B3gDDkq3"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF1E8175F
	for <linux-clk@vger.kernel.org>; Fri,  6 Sep 2024 06:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605481; cv=none; b=oNXEZZytTZ811OzLrGKXgqAefGQamorahiM7HM5Kmrjm2X/MB4JDjtgemm4LNCxuRJv2EvmlTWTn5jrLrqH1tN+V1MlC5p0zYOHfN8GK47GnxU9mr5vO/NML6UedP8tekWyj9YFxhnIfSPCh1uPOSf4MCyyXGofp07jI1xkjy90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605481; c=relaxed/simple;
	bh=dgISMJU/UloEgT58Zmk6Ooz/FxYmL7vxOQUpJEbq+8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sN93YD8+Tx7ZAEBf93uITDt54aeIPfkyM6JNttGmBOfjLS3b3NhPxWwH4KvGBXIgG39iNRi3ok8vYABxromUhIvVg/c3stsKaktH2Xal9bQDoecK0MQzjIKNBXnL6UTe7AYzcbUozRJR7rh8GK9EUiE2918U3iP2ACTUOQ+gyZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=B3gDDkq3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42bb72a5e0bso13192435e9.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Sep 2024 23:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725605477; x=1726210277; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUwiZqd9TfqNcVUN4h6daMaGyO3lnoY2hjg6KdFRqok=;
        b=B3gDDkq3glrUH1dzy0pmmvxg55ehhSQz+nWMizf+DZJT3KoOgsw4sbBlCcsTDoHBvY
         xeDvfz90Jg04V8jW2GfNpaJRYqZBhgdslYVAIpPxDpIIXOUOTu2YzkL5x51jeW5NjrIk
         DqeIfxVdy6aHEYnMSHNY+tiWvNcj+b2AZUBaojydHS78JngOcnEyTYZu7WNE4C5vfD/r
         9nAAIunpM4yvK1TUpww/caT5FZ8t6NE7Pd1aouzeevfk2IvBKhWx3X/feStT8DCe7qZ6
         fTUos1usWFWyQQ/c+euXGjx2Xv3soyrI4Y1h2+5ftpWwXE8S0VoW4w6n5P/6S8wHAlVO
         CseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725605477; x=1726210277;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUwiZqd9TfqNcVUN4h6daMaGyO3lnoY2hjg6KdFRqok=;
        b=lyQuZ8AmEaYRnfCrhfx5QJulTsnWmjVwRHStdIcnc7uByCYVxGFCjBWt/6CPacrxqD
         EU8uEaN70Irl/kZtUenfFJDfMnzC0mAlPMAj10RZhVMAGIC9LZR2gxAQlXwE+AeAtsXl
         hF0G6wfFRv9R1gLVIuNj+466IypXcOnaFHa424ZcmPmxHOYUUmN8YINR/1gs4CfAROFn
         MkHlj9MI1WddR+lYBM7Fl/tkQ7l6Ip9pJ9vz5aP9yGQfJ9jJQQL6DdJPs3QGPpH2JHk9
         J9xk+J3heFfAwOToOO9sgMEirPH/YhfpzCrtDiYchLwcBobmOvBnX/S2Acm7jE4Wlbg4
         vF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWO1qKd7pZO9qoqJEztVUmB3UII+Kz1CNqBIYEbFTAstPWPsJW2U+oRkOuMGwgXrB6LakMB0M01bjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtbbFs8bmkmk6NAfdszArH03SUaCabLx0mziraUJPoX87XbG+9
	KkNkWgrIXfxrHQtKzTHhxOe0iIu/HysxBVdH85UwzdT1OWy43sw4xYaIZtAAPNIj/qiAAOc5J7/
	6
X-Google-Smtp-Source: AGHT+IEAQ8+ZbApQ3oMw8V0g6qInfVZypTuRChEdnmRNkaOEzMCP4G/akqQASSKuY+whN0GPsSSR7g==
X-Received: by 2002:adf:ea09:0:b0:374:c1be:bf2e with SMTP id ffacd0b85a97d-374c1bec8ecmr12950003f8f.62.1725605476525;
        Thu, 05 Sep 2024 23:51:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05c6facsm10144635e9.9.2024.09.05.23.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 23:51:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: meson: Support PLL with fixed fractional
 denominators
In-Reply-To: <20240906-fix_clk-v1-1-2977ef0d72e7@amlogic.com> (Chuan Liu via's
	message of "Fri, 06 Sep 2024 13:52:33 +0800")
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
	<20240906-fix_clk-v1-1-2977ef0d72e7@amlogic.com>
Date: Fri, 06 Sep 2024 08:51:15 +0200
Message-ID: <1j34mds2ak.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 06 Sep 2024 at 13:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Some PLLs with fractional multipliers have fractional denominators that
> are fixed to "100000" instead of the previous "(1 << pll->frac.width)".
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 22 +++++++++++++++++++---
>  drivers/clk/meson/clk-pll.h |  1 +
>  2 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index bc570a2ff3a3..f0009c174564 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -36,6 +36,12 @@
>  #include "clk-regmap.h"
>  #include "clk-pll.h"
>  
> +/*
> + * Some PLLs with fractional multipliers have fractional denominators that
> + * are fixed to "100000" instead of the previous "(1 << pll->frac.width)".
> + */
> +#define FIXED_FRAC_MAX			100000

When the next arbitrary limit comes around, this will get very ugly.
Instead, please add frac_max to the pll parameter

> +
>  static inline struct meson_clk_pll_data *
>  meson_clk_pll_data(struct clk_regmap *clk)
>  {
> @@ -57,12 +63,17 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
>  					  struct meson_clk_pll_data *pll)
>  {
>  	u64 rate = (u64)parent_rate * m;
> +	unsigned int frac_max;
>  
>  	if (frac && MESON_PARM_APPLICABLE(&pll->frac)) {
>  		u64 frac_rate = (u64)parent_rate * frac;
>  
> -		rate += DIV_ROUND_UP_ULL(frac_rate,
> -					 (1 << pll->frac.width));
> +		if (pll->flags & CLK_MESON_PLL_FIXED_FRAC_MAX)
> +			frac_max = FIXED_FRAC_MAX;
> +		else
> +			frac_max = (1 << pll->frac.width);
> +
> +		rate += DIV_ROUND_UP_ULL(frac_rate, frac_max);
>  	}
>  
>  	return DIV_ROUND_UP_ULL(rate, n);
> @@ -100,13 +111,18 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
>  					   unsigned int n,
>  					   struct meson_clk_pll_data *pll)
>  {
> -	unsigned int frac_max = (1 << pll->frac.width);
> +	unsigned int frac_max;
>  	u64 val = (u64)rate * n;
>  
>  	/* Bail out if we are already over the requested rate */
>  	if (rate < parent_rate * m / n)
>  		return 0;
>  
> +	if (pll->flags & CLK_MESON_PLL_FIXED_FRAC_MAX)

Certainly don't need a flag for that. Use a parameter and default to (1
<< pll->frac.width) if unset.

> +		frac_max = FIXED_FRAC_MAX;
> +	else
> +		frac_max = (1 << pll->frac.width);
> +
>  	if (pll->flags & CLK_MESON_PLL_ROUND_CLOSEST)
>  		val = DIV_ROUND_CLOSEST_ULL(val * frac_max, parent_rate);
>  	else
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 7b6b87274073..e996d3727eb1 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -29,6 +29,7 @@ struct pll_mult_range {
>  
>  #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
> +#define CLK_MESON_PLL_FIXED_FRAC_MAX	BIT(2)

Remove this.

>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome

