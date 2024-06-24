Return-Path: <linux-clk+bounces-8552-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67902914659
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 11:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B371B2131C
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 09:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F1A130AC8;
	Mon, 24 Jun 2024 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+0JPqbf"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10364130A73
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719221106; cv=none; b=q2+D5aBM2ZCDg17osyfZJyV4Ci0Kp4evVsn7q8s9wPDJs1QUqBt4b3jqgPchVIcV2gr718UErjOZxyVxaVgQaSTjwlxa6koxhCFvyD+GGw7fKWFcBJQbgALih1fI6GDZPRUkvFvTgnzF+pVJx9qvVclwUwkiuxrUA/tE/jw5irY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719221106; c=relaxed/simple;
	bh=lkvZ2sbx3Ysd6SxUkZL7FvgxTkogAYM4Ga6zUcZmzpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DF9h+GeRbhaJr41vDRBt7IxSpGsbiuWfK+ZMBvW11eM3otpqEn7sheFUZJhSRCfwGl/pDeHCghdscoZjr4we351SXZhy7aN+w8/lXHh0V67LRsYNq6dGbndO0zpeyiwARAhf0zJStXc59fkB0FrXzYue35y3XADZWh1i1xL4B9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+0JPqbf; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdfb69724so1627408e87.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 02:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719221103; x=1719825903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jFXpXAOFLFRkozZpZH9Ka9dd/aYYOjDsel8dYMvfjJY=;
        b=n+0JPqbf0M2tDBwkuk6LZKZ5pT5bBFqRLdbJYolZB6JKj940YllPtdDV8tM4tBCvHc
         Q74vO2d9V5GFYpx9uUKqhF/IPU3TV85RgJQfoSS67YIKiRzlOo4hf+73gMkrFL9xhgbw
         R/AbgLSSkcezSGpKPLGeqRpJMrQVtCe9qnWv77Ue98v+xAPe7j5HL2PhUt1/k8Z7PR6E
         tiYaMnJ89Uf4RsPABEx7joKKrnAo7M2DrbnD41sGLhUmeg11Kjx3vUk71n69IBPB83dj
         c/kHtqTQWH11DTa60UKCfIjphHTOonUJZBh+LZy22ErxoFk80nDeqEmJ+JO/9q2jOIrR
         z+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719221103; x=1719825903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFXpXAOFLFRkozZpZH9Ka9dd/aYYOjDsel8dYMvfjJY=;
        b=wZ7b1p7viBFOlN1BApoMO+koKxYEUzVGbN5uRSrHwlTG2VO/IgOap4Q2w3ithSWml+
         abzv2VoGYRLJlcpID5nYtkgddIH/Vp2ZtEzVPjl9diCYuXH03emJ5qoplhnMV7QtRCvO
         FzMBfFhmV39BP6LiAXfgKwFQoThYpGv12Sh36xi8tkADMDO7TQqctTFadNTjFNK1p1fB
         SbIUIghxlRSjzCu7nRq+w2ebClQXwyHI3+EkSMVqkaUImrYf/WwiPzRyYXtRIWxGZc5V
         b2P3GeFbeuG9iwtn4eFVnTK4Q898v7UdqaxcYarObrftOi0rg9ZpY8BsgpTTpiiHEJOS
         ad+g==
X-Forwarded-Encrypted: i=1; AJvYcCXE4L9TWyNOq6i3ENSLHYG+/3m+LJFJUYP9zr9Ekl36TLrRUEV+/RUMk7S5yF0EgZtt9QxotcQpsVQsp+C7plTyvKJrTzkt4xNR
X-Gm-Message-State: AOJu0Yx16MiR2Q3ZDIC/J30pR4DZOdcbz520FB6AEORJVBYwQpPzSmUQ
	mggKk9R7wWlW06jQIvLYE+PJmxuenMZcZQdQrdFjjzALdEoDrh4gCz5h2EUyw6Q=
X-Google-Smtp-Source: AGHT+IEsUNZH4vfpWCGa8E8IbieWBtTQDbUwbXJdyweNBlz6fQAG2gGISHmpGNTl6P9+g4zm9jyTLQ==
X-Received: by 2002:a19:e046:0:b0:52c:e171:ba2 with SMTP id 2adb3069b0e04-52ce1835617mr2053574e87.17.1719221103171;
        Mon, 24 Jun 2024 02:25:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63bcee5sm949182e87.73.2024.06.24.02.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:25:02 -0700 (PDT)
Date: Mon, 24 Jun 2024 12:25:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: qcom: dispcc-sm8650: Park RCG's clk source
 at XO during disable
Message-ID: <4skm6zab2xf2e4qgh4l45xzhuncmls7yfw4y77yufb7pvs2zew@rmzcgb6ozamf>
References: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
 <20240624-topic-sm8650-upstream-fix-dispcc-v2-1-ddaa13f3b207@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-topic-sm8650-upstream-fix-dispcc-v2-1-ddaa13f3b207@linaro.org>

On Mon, Jun 24, 2024 at 10:05:50AM GMT, Neil Armstrong wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> It also changes dptx1_aux_clk_src to use the correct ops instead of
> clk_dp_ops.
> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8650.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
> index c9d2751f5cb8..360b80377ed6 100644
> --- a/drivers/clk/qcom/dispcc-sm8650.c
> +++ b/drivers/clk/qcom/dispcc-sm8650.c
> @@ -339,7 +339,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
>  		.parent_data = disp_cc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> @@ -398,7 +398,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
>  		.parent_data = disp_cc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_dp_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> @@ -457,7 +457,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
>  		.parent_data = disp_cc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> @@ -516,7 +516,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
>  		.parent_data = disp_cc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };

The only parent for these three clocks is the DT_BI_TCXO. Is this really
going to work as expected? Also what's the point of parking the
TCXO-sourced clocks?

>  
> @@ -560,7 +560,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
>  		.parent_data = disp_cc_parent_data_5,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> @@ -575,7 +575,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
>  		.parent_data = disp_cc_parent_data_5,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> @@ -647,7 +647,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
>  		.parent_data = disp_cc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
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

