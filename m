Return-Path: <linux-clk+bounces-9716-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 247CF9338A0
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jul 2024 10:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5911F23643
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jul 2024 08:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9825336AE0;
	Wed, 17 Jul 2024 08:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RLM90/xr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83322E859
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721203858; cv=none; b=tB3w1KM3lGPA1qYJUCy7TkKInJybN/mKCPvSDF4aiEV9KhQNUmLdYQ1BJdZNrdfzA5ERnPbCT+4Q734opAiD1MH1eU1YShNctt6EQPvYFHIGDaTUCsDp/Yo0r7YbI3Yci+JImQynNLSr356moeiNwshSjUeeZbwIByA9J2tPbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721203858; c=relaxed/simple;
	bh=SX+1wO4uwtKux6jDltAbEwmrSgRJx74uXmfo2113O5M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CGdsow82pwny8Fcn1p7T1ZYncfKPdqJyNy4k/wccMz1bI9d2C4UFneyrBs2Gf/PCU5MVRLh6eIbmueQJ77g0+wWOOnmtcnIslb58hOm+hSGRlqPuAPx1k1BUrNtdXMa+OLUQ+utQxiEOluVIaFpvv6ySvZFOeRXT2uYLFvk3LKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RLM90/xr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-367a3d1a378so5639982f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 01:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721203855; x=1721808655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrZm7mgAkxgMlXIUcXyyiDtmWKTfKigpiCQAcc6QqiU=;
        b=RLM90/xrj/vQlQ+VgqbVZzSGvb+fa7XJcxKSO1ZX14ff1qxfTbAMTO3hRa+8UBaJ/p
         sJOqxLh78v4pLxqwuSIfltu5wGhfOTyC6SNi3zYuAK20R66CbEdpuab37d8Pr9WEbK7g
         7zR2lnBf+VXd3T1WR7SDNRmT+DpfA/2aupkTRO0wY9oV0QV+sAKezO6IUeSUDyqqwvz6
         OZPTnt1TOAHFKz5OhYBXzViqydcKEozKVh3kS6HLWpFMX1XbZ9RutP8WHHuxJbOtU01D
         kcteIcPkJOLbKdSO9BOWLLpUXUVMAOjJTrw6BM2r5mVwx/pUGbb7XOOe0CFhfsWogWLa
         zUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721203855; x=1721808655;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZrZm7mgAkxgMlXIUcXyyiDtmWKTfKigpiCQAcc6QqiU=;
        b=YBIdhf2A3iLfGxJAfQ0aN3a4qGGXx3EZG5f2zzfyDMOfD07t/K7fz1LhwiLpjqWGTF
         1gQTVBQ7COLuFZUzEhnDwfm6qWJwGOY48Ilqg7xZxNmgXYwrF6mYg4VazLPUxYxVEKbw
         0PxoX85orwdX+J1yveOEkuwvINlrQo+ZlvtkHg1vnkiG5Tz03rvHWIKKg8MkpjzNySLC
         xky3NsnE+sZ3zCnlcv0DP876PbDwvjkxtFLLi5hGn2Buz3ByduFc7NnrvGK+e3ucsue2
         twiYrecVwWQbLPBYYmXKq4F6AayXgKuDg+ES2pgBl7hxi6pDRiB/sY28W7t4u1y2NoE0
         eucA==
X-Forwarded-Encrypted: i=1; AJvYcCXhQqMIZeQC3FLXNlV15D7zfnpuxc+uWsiIhKb95c60NFMUtg/GGEAfGFSJZZGZfThsXdYn8AH/qhHh1b+7Jf3G4bN3AbheymNL
X-Gm-Message-State: AOJu0Ywvq6qFCqEAQcSXssTyjSPPzaTrg1ah6iM8RXqIDNrjwIUoCKQ6
	/d++oncuC1X1isrVnysehOeKcPWHydYrQ7LGcWLbPWADekQrumTOzap0bFtYDFs=
X-Google-Smtp-Source: AGHT+IEfkRpCOq6RcmmhKaBK5YofHoy/Le/qOqf0AVlFS0SvAN02ujCY0ajuw9+qm4q+fJlwyGdgrQ==
X-Received: by 2002:a5d:6d47:0:b0:367:9d4e:8861 with SMTP id ffacd0b85a97d-3683176a911mr681207f8f.57.1721203854851;
        Wed, 17 Jul 2024 01:10:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d? ([2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e8144dsm162153365e9.11.2024.07.17.01.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 01:10:54 -0700 (PDT)
Message-ID: <c7b3db09-ab0d-4e90-8afc-1c0a08fb19b9@linaro.org>
Date: Wed, 17 Jul 2024 10:10:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/7] clk: qcom: dispcc-sm8650: Update the GDSC flags
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
 <20240717-dispcc-sm8550-fixes-v1-4-efb4d927dc9a@linaro.org>
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
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-4-efb4d927dc9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2024 23:13, Dmitry Baryshkov wrote:
> Add missing POLL_CFG_GDSCR to the MDSS GDSC flags.
> 
> Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8550.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> index 6bda15bf09ce..49dff9b81fa1 100644
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
> @@ -1611,7 +1611,7 @@ static struct gdsc mdss_gdsc = {
>   		.name = "mdss_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL | RETAIN_FF_ENABLE,
> +	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
>   };
>   
>   static struct gdsc mdss_int2_gdsc = {
> @@ -1620,7 +1620,7 @@ static struct gdsc mdss_int2_gdsc = {
>   		.name = "mdss_int2_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL | RETAIN_FF_ENABLE,
> +	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
>   };
>   
>   static struct clk_regmap *disp_cc_sm8550_clocks[] = {
> 
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

