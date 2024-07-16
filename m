Return-Path: <linux-clk+bounces-9687-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A93229327C1
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 15:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4EDA1C22654
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 13:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68E61991C2;
	Tue, 16 Jul 2024 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vsgn9FeT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186F7161309
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721137589; cv=none; b=mksOdXZXZzi33T+oRoTaYcvULVp1T+o8tScKH9CywONbgIqKxsOF3vTwaW+rd2m1eGCZsSlJuQcLzpsWjyRcKHDrChzB74eHPJbbsZeLCmGGCNzbgRAkOL74ZgyWD1G1jNDxbuyrlTvB33Zyt6d8xS1Qg5RWE1iulffNqQEEhvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721137589; c=relaxed/simple;
	bh=p0RNMBvL3eJ6sEAB755RIAQbLcZly+U/PwYjMi8Zdqc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UkUQXbcjrnEZ1EHRaIpYHvir2Ref4Y90bFcD81cGHQifJ+M6+SULPLTakRY62MUxreIp4OZV7D7yOH9N9hTM9hxefWsMVyTZAfGWpqewA/+LKnyWkRQkOAB81c/UAK6yo5LH5sF77DVb52zfZuKRN6JfMwV+MOXZA+UADCpqu7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vsgn9FeT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4266ea6a412so38577205e9.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721137586; x=1721742386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvvaiaxwafomr6sYSwj6tDfXhfHH8GBr+OeGJN0bC2I=;
        b=Vsgn9FeTAVVz/IWNUm6kn2n+wxh6FLEwWErQuwQ999LplFyZ6lc/D/yOWOhswKGEoc
         1ANjdSugjcK02z0huFnkPRau/70u/e5M5H/fNBJAGNzs5hwLdKn2SVX+Pr7HJUY4sRSp
         PhA/jFjgKkFj2YVQzNjlCaIxoEdaq/2JkviFU5ZYoLl9QHsYNxOEbkpFEoaQH7D9qYdl
         noh62f2V+dbcF0l3YAAVHGue1+vvDlxxdAQBB/TNdWgQvSRU6COCdifSO29xpdTYmVLs
         XnALtAyDXRybCMtzuafNQ5GwJoKs81bX+/1yGCTuEmBBDw8eoIcpf9/Xd2D6GkovfSYR
         aPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721137586; x=1721742386;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kvvaiaxwafomr6sYSwj6tDfXhfHH8GBr+OeGJN0bC2I=;
        b=bloRl+QgnetuYt3JZZ3e7LzgeRh8jHH4EVGT8tgaImJz3Av0YYgG4dEFvBUYbhxirH
         K3WQYuI0hbvj8AfadMdf3DOQ18ukAwmGu8LmRW/ez8uHcT1W2ZNfcfbMl1ecuW7b6Wbl
         U0UxT+avq9FOnQ7oyLjVJjLtnpElcJ2rURYqyKOcy9wqTAXH8TLXyu6r/H2a9j6y9k+4
         qSqWF73auSRyXwUX9BOV3WZ0b1vw6O1HzFw51QW6UZuWV9TwXwR10Br07pejYvEW0cGv
         5G4huIJUL+qdsmzRd2+J8dGhY7Ig+zJ2CsawZAOJb0+11pl8jNIK+mjBt24M6zyrLTlx
         AOnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK8/X2q7/AbyxxY06rRZoJWaYQs7du3bhc1mxHp+pZzcP55xYlwkiwm3qArlTd4EPLUMJkEbmJQ2rQMHqXQM7WTp3yL+rOdl0c
X-Gm-Message-State: AOJu0YwbCdBvcUVUzqkqMWQy0um4chkNsd6e1bXHuHTisTh+06p5eCXq
	s0ScDSvv7mhSc/WTkLKcAundhSLXIZNCYc0tmDmcpuMDhcJOHMxgJa6Ym0Ni3ZM=
X-Google-Smtp-Source: AGHT+IE/0LKOTs3JG1uEkPDKwdoAk7cFX1znVevA7DJCpRbjU+ZgD+QerJ8uamnTjeLMoskPR+YsHw==
X-Received: by 2002:a05:600c:4f53:b0:426:6ed5:fd5 with SMTP id 5b1f17b1804b1-427ba5f537amr15292485e9.6.1721137586045;
        Tue, 16 Jul 2024 06:46:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f5ba:a94c:e43a:d197? ([2a01:e0a:982:cbb0:f5ba:a94c:e43a:d197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e81f0dsm127192415e9.12.2024.07.16.06.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 06:46:25 -0700 (PDT)
Message-ID: <278354ec-532b-48de-8ee1-5477ddb4a285@linaro.org>
Date: Tue, 16 Jul 2024 15:46:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
 <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
 <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org>
 <CAA8EJpr9L+AKDhuHfQa=Nco7fvG9vLH3a+gxVhENrhz12b3n=Q@mail.gmail.com>
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
In-Reply-To: <CAA8EJpr9L+AKDhuHfQa=Nco7fvG9vLH3a+gxVhENrhz12b3n=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2024 15:44, Dmitry Baryshkov wrote:
> On Tue, 16 Jul 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On 16/07/2024 13:20, Dmitry Baryshkov wrote:
>>> On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
>>>> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
>>>> and byte1_div_clk_src, the clock rate should propagate to
>>>> the corresponding _clk_src.
>>>>
>>>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/clk/qcom/dispcc-sm8650.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>
>>> This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
>>> rate should not be propagated. Other platforms don't set this flag.
>>>
>>
>> Why not ? the disp_cc_mdss_byte1_clk_src has CLK_SET_RATE_PARENT and a div_table,
>> and we only pass DISP_CC_MDSS_BYTE1_CLK to the dsi controller.
> 
> Yes, the driver sets byte_clk with the proper rate, then it sets
> byte_intf_clk, which results in a proper divisor.
> If we have CLK_SET_RATE_PARENT for byte1_div_clk_src, then setting
> byte_intf_clk rate will also result in a rate change for the byte_clk
> rate.
> 
> Note, all other platforms don't set that flag for this reason (I think
> I had to remove it during sm8450 development for this reason).
> 

Ack, I think this deserves a comment explaining this, I'll add it.

Thanks,
Neil

