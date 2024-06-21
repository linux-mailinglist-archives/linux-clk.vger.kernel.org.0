Return-Path: <linux-clk+bounces-8486-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB322912F99
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 23:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24D321C2261D
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 21:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF2317C205;
	Fri, 21 Jun 2024 21:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I+gLL+W5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09B2208C4
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719005672; cv=none; b=qaUdco7F2N1eRZYG0CPMVxDKcgbotDFf/UV2iQOiNT81UIyg6fJuQAeqnJ8/lHfV9qYCGYIVRT4d38HYmQJlOgmo58lbyleqbNRpHYthmm3HpQGH3Lakn7RYmHH47OUr1B+zyqEnlx0/S0jcWi2hUIyBekh8YspuRGMYyKs/bYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719005672; c=relaxed/simple;
	bh=j6vDoLUrRaDY20UmI+c+o97/8kIf765BHIvIVJs1t5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtlogYMXtOm8CjWTnZO3t0AaBKBDAHkZDMcT+HLZivUU7m+Vdg0sIorsDZg8teMcAgKpxWAXfMSIaGecWdNBRYWWrLl8r7kJHUvWEoppBR+tQuD+A++ODnWXnXXWyTMixZzN04X0bqwktentzWq+7+iNWrPphnLWY1J6xd+vwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I+gLL+W5; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ebe3bac6c6so29857141fa.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 14:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719005669; x=1719610469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pn63cjY4CH601Ssfo3ANW4x42gLFLLgNY0T4TfIh1vc=;
        b=I+gLL+W53b6jVqxa+Cgjm0gJ+Cw1mIrU69feQycaWvJvPSMJqSUbkQv+bZ/V/8Y/et
         mHf9UyCBV58d5SbrzIY6H7WZwHBQ1cbvJFZSbfNC3L1uf4Ra08PcGkRpUxOvsGCt1zue
         VJIf/IISNH2s1sHtF/tTX2hzDUj0culLvCFAT/hME/5rQPHYsSTJN4sdeRa7PF3NxlmB
         7DQFEsFuqooJeNU3wRfu6jY/rWHtgM8D1wgN89T3S+80BLm7BuAwNLyvqKb5BLeloicw
         1Ti/0B7jqzJR5A8dbRAtkVdHwBnIbrJEJ/wtlp2UKqiMZLe2bF/69k+qc/VDr4PBeAZ+
         NAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719005669; x=1719610469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pn63cjY4CH601Ssfo3ANW4x42gLFLLgNY0T4TfIh1vc=;
        b=bSELcRme17Zv3MeTbeBHiVCxb3PmcaJ6bkKJ8h2D4Jrnc3/6WMDX/XXa/Ar7rafSsm
         cy7hA1tTev3R/g/D7cutiv2WCEgCtgpH25DEmcv7/pwHC7Bv0VKvmaB1vQwithAfRbaE
         vk+lcHT0zW30/qjBffs26xlwS8EtX8lnS7GeJMdZiGsoFXuJ8w6qMyAa41pRZcwmAgKM
         Lc/Gp9MZScdVsi9WQID061Vn0L8SAaboYmd4W0j9zNEeV8rswcM0SwAumuUWlorbiCBv
         oRKHsOVdkR55t3Xy+rb6GW4qlOYPpmMiunLRn0tkifyOCkSrJPQLQ4bC62x40gR6UTQu
         NVKA==
X-Forwarded-Encrypted: i=1; AJvYcCUMYbn4HAplnaabQ48jIAfROpjij6DZNiqXXtwQ0ACqfC1PV41NjQbX3l8tZD7TttifpgNHyGYnYu+rYCBvegNbBdxwkUguEZCQ
X-Gm-Message-State: AOJu0YzAqZYs3AN8FK9zZNScQsPOG0JnZD24RtqtsIkH9pqKN6ksWRGU
	gxz3yazXkOT4ifg/o9of95wcYERmr/1LKse7tDVgYvj1BCkR33b26swDiSyxqk8=
X-Google-Smtp-Source: AGHT+IG91S4SWJ8oGiOp31tb7eR2w967Cc7jB2Ddr7QtTNYyfA0/+9KgwyPHqLE/QPaUhHKa8qOeAg==
X-Received: by 2002:a2e:96d4:0:b0:2eb:e471:dc42 with SMTP id 38308e7fff4ca-2ec3cea2bedmr69747651fa.31.1719005668950;
        Fri, 21 Jun 2024 14:34:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d708883sm2954361fa.47.2024.06.21.14.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:34:28 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:34:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: dispcc-sm8650: use correct clk ops for
 dptx1_aux_clk_src
Message-ID: <txiu2qlknkpwbzq4l7ouvv67q3titgzk7rojffbhy6pxom55ff@lbmtphg5qrvu>
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
 <20240621-topic-sm8650-upstream-fix-dispcc-v1-2-7b297dd9fcc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-topic-sm8650-upstream-fix-dispcc-v1-2-7b297dd9fcc1@linaro.org>

On Fri, Jun 21, 2024 at 04:01:15PM GMT, Neil Armstrong wrote:
> Use the same clk clocks ops as the dptx0_aux_clk_src, dptx2_aux_clk_src
> and dptx3_aux_clk_src.

Squash into the previous patch, please.

> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8650.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
> index 31c82f791b44..70944b7128e2 100644
> --- a/drivers/clk/qcom/dispcc-sm8650.c
> +++ b/drivers/clk/qcom/dispcc-sm8650.c
> @@ -398,7 +398,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
>  		.parent_data = disp_cc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_dp_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

