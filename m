Return-Path: <linux-clk+bounces-8540-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A349143F9
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 09:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1F70281FEF
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 07:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FAC482DD;
	Mon, 24 Jun 2024 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTYUAtWI"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993FB481AB
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719215798; cv=none; b=RMC+Y86HCilov8Nwchk2SlXDCXpRSEJGy4qAZT0lFzcAvpSODG1yOvNielQ/3DYMWZqE/KqOe9ML7z2r+8qdZ1AclQJYOYr3sc0l0xt6Kx6lxf3/suMztzWHZfHsK2kCdWL1nHcD207iRvRLvN9u4dJXcMZRXLByQWQ7B4xowoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719215798; c=relaxed/simple;
	bh=ZhGDo8cXsdmWgdlNHJfJ8MACqMu6lnyLvjl4GWo+aNo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u5WL7yHKYVD/ARNWjBIAguq43HOGQZwG29l1EltvQ6w2LqFzBF9Xu7ZwIIFzQyJTsxFZcCdvrtWYuDacORLimmdr+1cRjsGz8MBmXf5PBKspxWVy252S6izgHQ4sWfHJ0gcE5qI2gi+EzF8zf/4T6OJrpfKoROoZnBgJlUHOrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTYUAtWI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-35f06861ae6so3125728f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719215795; x=1719820595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkAZCoR1EAxHYyMUSyL77CxZBsg/gsiAFxg+O7Lf1wE=;
        b=MTYUAtWIZPkdidfXhufsPevB+toBMVMAJ8EmkzzUfZEDOwuAcuWj3+yItCi2V5RNIM
         8nlHspmnbkuomP0GwMWvQyCLPKHIdTxbdTX3IFxZ8vhRaEFuIsM4dTDm73U7PIMn1WJH
         1vv+gisIRdupyJ79Vl44L+fen6au4TpyjgowDgBgDDEbbK5v0QrvVTYJAG/eS2Wx+miK
         eLBF1Q/xWeR3Qw2JQ6M+A+fmIxb6Ley4gW6ydYOgXkfDgpTMXHcclkbbEkbJG3GgEUv2
         Wcd1lWdzrmWkA2958OPniUfQJ+oLlPqOFAJJ04eg2qdO1Jz12pxQHoF+aQULcGa9xk8P
         pexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215795; x=1719820595;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bkAZCoR1EAxHYyMUSyL77CxZBsg/gsiAFxg+O7Lf1wE=;
        b=sfoveAJV2qwsLVOmxIyxXJB5QUoCoXI+zmalb7NveJsz9KetIgXmeGCxUYWXlLkNlu
         nlhE3FgYRs+VI4XER4gfKs9KDfk1g9lbJZzGruWt8+ny/FSVMmBPITy/w9FjVGCSC+cw
         Ra9h5sBL7a7siuaJuz0rF4c6eEmCPLovKIde24EkprHG0g4FCc2YnwdjiaYD/F6tX+Tk
         jaeGjH8dRu+JeJ1MaiBC2OTUZN36y7aMrrMH7SPgekQPOMRBeHB0SPFeBSXtiJjydN5F
         Neia5JYjlndsu4OG90MLBkbJkUZzA6VMpr3sCKcNiC0/AdstEQsIDBapdE9IXggM3SLs
         bfGw==
X-Forwarded-Encrypted: i=1; AJvYcCU3NuHMmgRT5BEVaTDOccctumu2RVJCFveB7Ee+9TjIx/C251DmT8Q6Ln5TgsXJLYhW0kzgUwR3Nq2wX2xidt3BxAS3TO9+IMMk
X-Gm-Message-State: AOJu0YwyYf1wtWncewDs245fw6hQJow+Y78z2j+74DsLl6glDRfHhVpF
	qrLFSknC0TKzdK6LTMcPzEHUTYFIXfJ/tRNMMfNGHLfRkHmblPsz+Q2gF86rdd4=
X-Google-Smtp-Source: AGHT+IH5j/Ekjx/L85BTArhDYmuRCO9srSTxGbIrLpKT2Z6tyiKEDWQFgTXYpWagliPQeNJVMGiszg==
X-Received: by 2002:a05:6000:1f88:b0:366:ec79:661f with SMTP id ffacd0b85a97d-366ec79679amr2370670f8f.48.1719215794728;
        Mon, 24 Jun 2024 00:56:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74? ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0bea05sm163671825e9.18.2024.06.24.00.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 00:56:34 -0700 (PDT)
Message-ID: <754a6ad5-f093-4426-9d68-3556978e1d2a@linaro.org>
Date: Mon, 24 Jun 2024 09:56:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/5] clk: qcom: dispcc-sm8650: drop TCXO from table when
 using rcg2_shared_ops
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
 <20240621-topic-sm8650-upstream-fix-dispcc-v1-3-7b297dd9fcc1@linaro.org>
 <d508f8e5-8303-4f84-83d4-d63f6c612a02@linaro.org>
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
In-Reply-To: <d508f8e5-8303-4f84-83d4-d63f6c612a02@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/06/2024 13:01, Konrad Dybcio wrote:
> On 21.06.2024 4:01 PM, Neil Armstrong wrote:
>> Since those clocks are using rcg2_shared_ops to park on TCXO
>> instead of disable, no need to have TCXO in the frequency table.
>>
>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> I don't think that's correct.. some hardware can still run with the
> core clock @ 19.2 / 38.4 MHz

I agree, but the same table on other dispcc drivers don't have this TCXO entries,
and the OPP table in DT neither...

I'll drop this, but at some point we should align ourselves.

Neil

> 
> Konrad


