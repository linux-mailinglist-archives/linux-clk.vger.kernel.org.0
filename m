Return-Path: <linux-clk+bounces-13754-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ADB9AF9DA
	for <lists+linux-clk@lfdr.de>; Fri, 25 Oct 2024 08:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EEF0281507
	for <lists+linux-clk@lfdr.de>; Fri, 25 Oct 2024 06:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32771A3AB9;
	Fri, 25 Oct 2024 06:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aSfajmUg"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C81AD3E4
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 06:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729837224; cv=none; b=PEwI5HASkcFjK9Czd9fQ53FVZYeZg8/SMKHspcyoZY7UTTlD4wraGseSQGDDWooCk2QHz3cvy+gE1Wh/zXloxHAno60oNLzGuRtN2U6qJ9kicU+VLWFWdBYtpQtnKuH0OeEOmgBvLwN+zXsBP7asmyqhRbSs9+0JS+3I1a0WDDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729837224; c=relaxed/simple;
	bh=g6p6yYGZNMePl2Bu1icHhA1ifXTYGoVl1Gl/Wxk7rME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhhVRZvHu9LuiODIZD+veor66I63IrE7CEdz3qfH+p2OdzIw6x4pqp9J6PLxXzDzudjv7e5iUhakJa0DagGYESUBrIa98dwOJMdw52B1aNiG7WWDxZYdJSrr9bnV3VGaAgVdFAa5s8svy/q7UQnENe20dm/E1D9OQ0JyBfNs8L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aSfajmUg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1601705e87.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Oct 2024 23:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729837220; x=1730442020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LT7qztNvDTajPr+P1qF56tF5WwBG1zv9JTupVPDvExU=;
        b=aSfajmUgzWvg7gy0p8Ah6JyzmBGuHHaTVNQ4StoGW0EG7MU8aJUV4qTmGCRs7mummC
         zUfLpwSdzLiiy9+9hYTTYazzeKDVTNFx2sXKRvLd/fHPLKjWd0nqVIcpkYmzYwaVvCM2
         /Aas4LRdDxYtfiJGmkaemrH3jicxBz1w3xfCHQspsUJ0MctV24iUzAnYU6mgswCtkgd1
         mJrlXgHeLjQDj/Tq/DGrF/3pcGQ5MO0HOcjtXtM0SkYS5OmWZHjyJyCCr5bRP/6uWbKC
         eCnI4ttNCotbSPh0VMFjMRytWUkhIbUMvao0bymeLi+TSmlxAN1vZgy4iIxSDnjZXW/P
         4mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729837220; x=1730442020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LT7qztNvDTajPr+P1qF56tF5WwBG1zv9JTupVPDvExU=;
        b=lDA3snzxEdVv3ud6Gy/MKPpVttZuqvA1tmm/s9COQ/YFrvBmmr6ghwm68dvgD1QCOz
         wEVdDfDJ2HhGkxfyAEwvVss+tckMMbgQfS0uc6GXmvO8U1oyeIUU+C4La8OT04v39eBm
         6I7sdMtLDNIp3VFwcxvQjygwRElWUbqhYxXXC3MH3zpGr29XonYXy04YVaDykORxgEEo
         voCjhSmukG/dRvyQtAeBBVlLGMOzmgxAk3D296FDd8ua9r86KjjZIfQz4gI2SO9/Z4CZ
         WzVNnz4yJsBfhwSo9ePXNun4dsv5ctu1WRjwtrzdDjoPd++n3EpDcbjdBBnY3cDRZTe2
         K3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhzUZdJADO/TVanPUSCw/UBcC7sihT5DBTkRILOrnSFtJ8wVL7S0eBsIf6Sg4m6gsCTAVepnKFIro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLF3SZp1wENvNsD2x4eUze+iQneov0pa7RPF4AFklPUgofnImp
	p/IuRsdbb1+jfRvEVc27d79z1OgnIEDtD7RWLdM5I25ZGfTqIV6Ktr4XVZOo4jI=
X-Google-Smtp-Source: AGHT+IHK5zBo/G1XmMf7skZDEcEg2s6xwm7NVg+qD5geLCsBKKZjdShcAEhN2noveps7AI8xcchnxw==
X-Received: by 2002:a05:6512:1585:b0:52f:d69e:bb38 with SMTP id 2adb3069b0e04-53b23dcd34fmr2513489e87.2.1729837220262;
        Thu, 24 Oct 2024 23:20:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1249ccsm66169e87.95.2024.10.24.23.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:20:17 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:20:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: dispcc-qcm2290: remove alpha values from
 disp_cc_pll0_config
Message-ID: <kp777aozahdmwvv3daz323rtcx7gajtytenxn2uz2p4gh7yrfe@wdhwh7ls3zkt>
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
 <20241021-alpha-mode-cleanup-v1-4-55df8ed73645@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-alpha-mode-cleanup-v1-4-55df8ed73645@gmail.com>

On Mon, Oct 21, 2024 at 10:22:00PM +0200, Gabor Juhos wrote:
> Since both the 'alpha' and 'alpha_hi' members of the configuration is
> initialized (the latter is implicitly) with zero values, the output
> rate of the PLL will be the same whether alpha mode is enabled or not.
> 
> Remove the initialization of the alpha* members to make it clear that
> the alpha mode is not required to get the desired output rate.
> 
> No functional changes intended, compile tested only.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index 449ffea2295d3760f40abe8b1195e9022f46a9b0..d7bb1399e1022afc68e45ee335d615d4a5be5add 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -40,8 +40,6 @@ static const struct pll_vco spark_vco[] = {
>  /* 768MHz configuration */
>  static const struct alpha_pll_config disp_cc_pll0_config = {
>  	.l = 0x28,
> -	.alpha = 0x0,
> -	.alpha_en_mask = BIT(24),

NAK, this pll isn't fixed rate.

>  	.vco_val = 0x2 << 20,
>  	.vco_mask = GENMASK(21, 20),
>  	.main_output_mask = BIT(0),
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry

