Return-Path: <linux-clk+bounces-10853-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E6B9566D5
	for <lists+linux-clk@lfdr.de>; Mon, 19 Aug 2024 11:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17A1F1F2271F
	for <lists+linux-clk@lfdr.de>; Mon, 19 Aug 2024 09:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F5115C15F;
	Mon, 19 Aug 2024 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXeWwqev"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC715C132
	for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724059548; cv=none; b=GKaYQOzAtZ7i0yRQPeDHmKV5yzICCG3d3q+X27ehKduATlpHRs72PklqIvZsYm5/FooEFfztMHcpBYto3ZdWY8U9UJpNj6CfWdSJlK1aaw7RMHon74S2lxC8Zw7nxFbvsFLs34nXWh8H4Pi1AAqJmByCF2cqYpmKEqJKDTD9rx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724059548; c=relaxed/simple;
	bh=yWhNcKiwIdEAMPhY36EsyqP3KTIBbwHmtHb26IH7sDA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gO8tjsydzjcugYSvUEDhRlbDfUy1d+V/vwQd51FbIkHCDj0bA8BOTILxvbNQAqfzZLz5rCmgbUiFHZpSnZju2ObKUfYfmKa3Hu6PtOB+irIESHljwtS1EAIGVG+IKBszvpBVZrClpiYSVXNVkgPnoWum3clhOggokfV7thDtijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXeWwqev; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42816ca782dso34134445e9.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724059544; x=1724664344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfW9Kwq9X1wpHBuiYFfD0xRufSkqc+MUvuXDywyMTeU=;
        b=mXeWwqevOP/srrVSsB3+CgwvkfBegeELun0bmHubGMNPESPXSEkmBqTFMpvwpHxQtx
         VyjH9gBB1XoX84ArBiVe5a1E0uQ2Q38wocRaLetGQtLtRnhk8nrr+lkX4UagkMsFBVFU
         NjsV98Oz7LM3S0vwPrQ6ApRpcDBLm9VYoGm+NdiRvJOz60e6fSi1bxuHCErTRTndcTUh
         Y5/g5X0AalTkFz6ZmXhzEMU5Y4pKDnHIY0aWfvHjNNdzgGm26t0nMoCXFKKZCysQHrdv
         oIdbpMKoX7RhgxDgeoiBthPQqaIA/iHBKIMRxsGYaUnlg2bgMr2b9wwV7SeQAnZrZfpU
         F1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724059544; x=1724664344;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jfW9Kwq9X1wpHBuiYFfD0xRufSkqc+MUvuXDywyMTeU=;
        b=UH4xzMnqZ9GN9fVGrEWmcNbLwcXrFx45U2a6a3kBm3WEyGIKxT20PnDGNumN7XjZb0
         tixWIp9OjN0j7JZFoZhZMXQgsV+MHqqZu6d6y5YLymYkhBf1fo2a3hI2NOtHYxoCSVuA
         oTZ6RmrPBledwbOBvw9OrMMTkPGa+wnVjhXp/jOHcmbRxI2PY5hVwVmd18Z3U0l0WxSA
         yCJQAAhYUKT2bbst0Aq5jKDiRdMW23Q2RzLgPAeNPbpawoQ7oOWx6d50HSYBowxoSehl
         1kYFnUimbS3pSCQCL+MRt/OyP+3J9Qt8G9ixr8gcazH9cFaBzaeBAHOPm6f28tV31nz9
         L9Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVXQI6mn10yvVY0TTu1VdBs+ZhYOWN7mAvI6H2ZhzVqbwp8JqMuU5eR1GfZLwvfAA8RDesEZnsPMZSiKReuCPbPJOWj0vfqiqu5
X-Gm-Message-State: AOJu0YzcSN2GaBS42wRnys3Wfmm2FSBFj3jMoOjX5OTUMIKHfjMVAcbT
	wa40LVnOfRZVOs6ao5wrOIWun7caldQPEbAepEtwp0E6NQRS83S3Cp22rusCdwhWpw3okK1Jikp
	Y
X-Google-Smtp-Source: AGHT+IFmL16ccgiNeq/E/Niw4V8tgmlsnmy1hKEoLh5VVxYjhee6XWl4XuGbOlmTpWIxFNPH/nyKRA==
X-Received: by 2002:a05:600c:45d3:b0:428:2e9:65a9 with SMTP id 5b1f17b1804b1-42aa82651f1mr40496815e9.28.1724059543625;
        Mon, 19 Aug 2024 02:25:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded2931asm154411275e9.17.2024.08.19.02.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 02:25:43 -0700 (PDT)
Message-ID: <0588a70b-61ef-4d2c-bda1-dec2b0d04cdd@linaro.org>
Date: Mon, 19 Aug 2024 11:25:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: qcom: videocc-sm8550: Use HW_CTRL_TRIGGER flag for
 video GDSC's
To: Vedang Nagar <quic_vnagar@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_dikshita@quicinc.com,
 quic_vgarodia@quicinc.com
References: <20240812134752.28031-1-quic_vnagar@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240812134752.28031-1-quic_vnagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:47, Vedang Nagar wrote:
> The video driver will be using the newly introduced
> dev_pm_genpd_set_hwmode() API to switch the video GDSC
> to HW/SW control modes at runtime.
> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for
> video GDSC's.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> ---
>   drivers/clk/qcom/videocc-sm8550.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
> index 97d150b132a6..7c25a50cfa97 100644
> --- a/drivers/clk/qcom/videocc-sm8550.c
> +++ b/drivers/clk/qcom/videocc-sm8550.c
> @@ -449,7 +449,7 @@ static struct gdsc video_cc_mvs0_gdsc = {
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
>   	.parent = &video_cc_mvs0c_gdsc.pd,
> -	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
>   };
>   
>   static struct gdsc video_cc_mvs1c_gdsc = {
> @@ -474,7 +474,7 @@ static struct gdsc video_cc_mvs1_gdsc = {
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
>   	.parent = &video_cc_mvs1c_gdsc.pd,
> -	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
>   };
>   
>   static struct clk_regmap *video_cc_sm8550_clocks[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

