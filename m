Return-Path: <linux-clk+bounces-12092-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 939C6979BF6
	for <lists+linux-clk@lfdr.de>; Mon, 16 Sep 2024 09:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17067280CDE
	for <lists+linux-clk@lfdr.de>; Mon, 16 Sep 2024 07:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2060E139CE2;
	Mon, 16 Sep 2024 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iiF1tHqp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44EA4C62A
	for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2024 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726471251; cv=none; b=OhQav6j7ujT7t0csmcbZ7ovn8BNa7p7aKtzkikoTD5IzMkXWPO6g9nO4IBAdxCi02H/+4FoX8fg00uZOrso43Yc/LoYaKj+XcicVhAqyBkPr8SEnmvetNtdTfM3YW6cX7byGdfDOWX8upsFaW4y36BT29GtMlvrLQPKiprpIGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726471251; c=relaxed/simple;
	bh=9mPn+F8Bj7AoM9q+BHrYAjNZXQCWRr4pIG11ZkDFRjM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nVz61iiFgoCTkHv7P8xHXtVH9j5Bo4ZtsCg/vGkXA35tzjrdft2zrfEcxV4Vkq7fAWlAkTRxMAtRwp/MpBy1AFjMPAoth2yzTHwpprXYAJ/dw0TNL4dhywGtpTFd+TbGkUflE0EI94iTtnSpI8QglUcSy2A2DuYvDYL23O+mCq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iiF1tHqp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cae102702so23220785e9.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2024 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726471247; x=1727076047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4G2KoVlFImQyEEBlvtWpQhFz3zZpE+7zDeyjIho9XI=;
        b=iiF1tHqp+rCYV/mDUY/OKUvK8S3JwUOaVs0a9EMC42ElgYW0bWob9zib+bTGFWleIV
         /dlaYjJTwWCJwDxm8/dW5uQaBT+a1ZktKq36wiobfS1cdOpi/8Z2YnEo7Ye1rAdFP4pk
         MdKKAZpfHvZL2XOHxSIpFIseLTFyh8XLCEQsqnPykhGogHmhiy6JVhW3aSqYrWI1keUL
         ezV52lJXlFwWGFEqZ8Oxahxq+eOZOjomhOmveLr+Z60Ayf32sKJRKu1aDppG62ovzFOS
         jB9q+vNrude26gVjyNDmdudW4fYTRR/pRcYdC034Io4pe7A267MUVcHLAuXSsLJJY3OH
         t3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726471247; x=1727076047;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F4G2KoVlFImQyEEBlvtWpQhFz3zZpE+7zDeyjIho9XI=;
        b=iyItII1AFPReqXO4AIMS7gT5bX6PnsMWYah22gDd45rKInD97HMYePBnhox4qQVBnl
         WaHWeNRKD20qmZoNrilZgXt/02H+XR3aFWf5CPHjaysNhwFj0GPwK/5sedDF6Vc/4pao
         SRmKgAouIy9tKIeTDB/4+hT78x7K3uEo01iQSwnU3xEamEcma9DpdJjyj1rOnSQvaFFB
         c3Jl7RwBQBPNzK4QXUFxBxZ6DsJJmUt8H3WHrlFzwzrH26+YUUBP7Te7hofMDwxMITZV
         D5H3EhcTF5QJpOwwHRm6EsSLD5i5PzxxA3dxrISDw8qpgAz+aI8ljxLT96jM/JwEzSLW
         ZzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUDiJoBOfqWjrfzaqmJ+odv7MjZY1EUWFhe6lPpVnAQQEywQjFi6KtC64XIevs5tvXV8f8s1K9qsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM2wtJJLvVL/ebsKOzycf/8xsvyMpOsPuxhLWmZITiSfBLjQzw
	LHItx+1y70VOBsv9n0DQBr1X/ky2e/8oDFNSmlgC8KYgycwMNTR1dV1aZKo0CF8=
X-Google-Smtp-Source: AGHT+IF+BiCZpHlNGDJ0WVsb2BbNS1rcnnfUaWDIzT2pr8fr1gMxHSS2QBCjtZVj34KgbZSFWvXMFg==
X-Received: by 2002:a05:600c:63d3:b0:426:6a53:e54f with SMTP id 5b1f17b1804b1-42d964e10b0mr60254615e9.33.1726471246241;
        Mon, 16 Sep 2024 00:20:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:46e0:9b1e:8680:c41c? ([2a01:e0a:982:cbb0:46e0:9b1e:8680:c41c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da2427227sm67433715e9.44.2024.09.16.00.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 00:20:45 -0700 (PDT)
Message-ID: <c9392d3a-8336-4cac-83c6-6b85a8cb92f0@linaro.org>
Date: Mon, 16 Sep 2024 09:20:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: clock: convert amlogic,meson8b-clkc.txt to
 dtschema
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
 <CAFBinCBZ8kowT_R6MnVkQO_BpxPA88xz-=KPStFDYQgH=P5upA@mail.gmail.com>
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
In-Reply-To: <CAFBinCBZ8kowT_R6MnVkQO_BpxPA88xz-=KPStFDYQgH=P5upA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 15/09/2024 21:25, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Wed, Sep 11, 2024 at 5:09 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> Convert the Amlogic Meson8, Meson8b and Meson8m2 Clock and
>> Reset Controller to dt-schema.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Thank you for working on this! First of all this patch is:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Do you want me to send a patch to document the
> "amlogic,meson-hhi-sysctrl" compatible string next?
> We either have to update
> Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> or create a similar binding file for the older SoCs.
> Also I think when documenting that compatible string we'll have to add
> per-SoC compatibles as I think this generic one is not enough.

I have it ready already, waiting for this one to go upstream first!

https://git.codelinaro.org/neil.armstrong/linux/-/commit/1be8f8c67e5b83fa4069ccbcfa80d0614f668a65

Neil

> 
> Best regards,
> Martin


