Return-Path: <linux-clk+bounces-196-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 883CE7EB18E
	for <lists+linux-clk@lfdr.de>; Tue, 14 Nov 2023 15:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48BC6281147
	for <lists+linux-clk@lfdr.de>; Tue, 14 Nov 2023 14:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B16405E9;
	Tue, 14 Nov 2023 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dbop/ewK"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB83FE43
	for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 14:08:41 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59111AD
	for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 06:08:39 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40a48775c58so33879115e9.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 06:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699970918; x=1700575718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqf6gytLqFb8qEPqoHx08oC5AruJuDr18v95ngS2z6E=;
        b=dbop/ewKMARzrW2Jct1rbYdHZNCa85MYG13V2da9cRGba1ugUyr52h1JEDom/i+ehR
         hIxuC7Hh3Zb/mc10qY0GgAYHrXEGZ2J1Jrl0Hh/iaxpQtuj6YSMr4dkEGMYkYewEnQgO
         4X2UTLDHqEr9eJTFai1uqyUF43oT/JkAS/ryBUBXfHVTQbx2LDALUKNhGfEL8zEAG4w7
         KtDAnupHUMhw9faTX9F+u4/YC5DUAzaueTV9i9Yx75rWQpgISol5IniP68eJqESOQs51
         tKhftBNpJmddTG0cNQGhtTGIrUwGL7ZgTlhLgkviYhj7uCiQ1OZ6WLmmnmFipcvKXq32
         ePHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970918; x=1700575718;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Oqf6gytLqFb8qEPqoHx08oC5AruJuDr18v95ngS2z6E=;
        b=c3R0WV4DUCIHB8MrdU9z5PTdK+qK+1+WIR8wMe+BiNKgrOONfhcdRrTLAK8udcSDAc
         GD3vGd7Ve2L3dgKE2ChPUqv/FEXg/QXG+D1Trxu93OXU7bkJbAKdmv8/oqNADL2o/B53
         ToZK/NZ7V+/Oy1dGmdmY4+F3j+VrL6CzBHMpgrnaIRnr52l+geGiw3EUbM79llYVpobQ
         zL5eBiPZSOpBCQuuLB74SwanLiXiJtqL5yWuit/tZ0kKEhjigxWJyVjl526snYM704SK
         r6ioECK/9jy9hAhS6I7IZarzzqQzkJ3GO3ig4KV0lqqAb8Q3PnwZUoBiBZs6kOs+POU1
         eBhw==
X-Gm-Message-State: AOJu0YwZZW1xr7kYpZ5pjn4NiQNtLVcu2GFKyvHztWImjw6RB85iX46p
	Wr+oKyhvXoK4An1l+sOPeDZdig==
X-Google-Smtp-Source: AGHT+IFTU2lq4vDw46y+DKgUmMqgoWFvNm96LbGHVmRkHynSA3vr4y39kjkdpLQGvpzK9zKQ5nKYPg==
X-Received: by 2002:a05:600c:4715:b0:40a:42dd:c82c with SMTP id v21-20020a05600c471500b0040a42ddc82cmr7754829wmo.27.1699970917579;
        Tue, 14 Nov 2023 06:08:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a90d:d9d5:9399:5adf? ([2a01:e0a:982:cbb0:a90d:d9d5:9399:5adf])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003fe1fe56202sm11435423wma.33.2023.11.14.06.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 06:08:37 -0800 (PST)
Message-ID: <c45a3094-501f-408d-9bef-7e634f99185e@linaro.org>
Date: Tue, 14 Nov 2023 15:08:35 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v8 04/12] dt-bindings: phy: amlogic,g12a-mipi-dphy-analog:
 drop unneeded reg property and example
Content-Language: en-US, fr
To: Rob Herring <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
 <20231110205716.GA413638-robh@kernel.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20231110205716.GA413638-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2023 21:57, Rob Herring wrote:
> On Thu, Nov 09, 2023 at 10:00:05AM +0100, Neil Armstrong wrote:
>> Now this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml and is
>> documented as a subnode of a simple-mfd, drop the invalid reg property.
> 
> Why is it invalid? It's preferred to have 'reg' in MFDs even if Linux
> doesn't use them. If there's a chunk of registers you can define, then
> do so. If it's all register bit soup, then fine, omit it.

I still don't understand why this particular MFD subnode needs a reg and not
the other ones, using reg would need adding #address-cells/#size-cells on top
node and change all examples/DT for nothing.

Like the other meson-gx-hhi-sysctrl subnodes, it's a register bit soup and this
one is no exception.

Neil

> 
> Rob


