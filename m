Return-Path: <linux-clk+bounces-544-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB57F7594
	for <lists+linux-clk@lfdr.de>; Fri, 24 Nov 2023 14:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA0B3B20ED9
	for <lists+linux-clk@lfdr.de>; Fri, 24 Nov 2023 13:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B9F2C1B4;
	Fri, 24 Nov 2023 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXfobGd6"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477EAD71
	for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 05:51:07 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40b2afd049aso13394915e9.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 05:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700833866; x=1701438666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxCC2Aq/t8/Q52ovrlgjo6dDEhp//mxj0rpaMToUQEw=;
        b=SXfobGd6xu1kNerihSTVM0fMjoMTJepJn9SsiYzapAkDo0XFBARSRvGY62PxolvLKj
         JjSevhAYIvUwpQziHEuaAWdG32cn+I0ptzdvEd+M7ds3RPTyuhki4t53aNvmbHb26/ZS
         z5Vocy8OJLrcQav69jovpTqmA7q/hAqmLKumgh6gI6FWstaA08ec9pnLP+WdXtEvb0y9
         sldxK3q5W12sG1l9NugJLJaTunpbTFGjCsuAgpUE02YtA8m+iyeVgpAtiyLJ15n2iMtw
         BXa0eAFUUTBpaDP8551hnjXS1FetYS68ahIr3vFudi9QY4JOWf24CUL+5OfWkAAUWLUX
         6qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700833866; x=1701438666;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VxCC2Aq/t8/Q52ovrlgjo6dDEhp//mxj0rpaMToUQEw=;
        b=ICwkF0G1Fc7FZhT6nQ/Dnp01SiuJuNGsWpAnLH2CBldcSULCW435ZprgDwaFKHMdtj
         hJaZ46svCKJF5Q8tlQtoLDCkceZzMr0ioH8AxeDu/V5LoTIfWSA12FpzZqz3XIA9evVY
         wmLqpKTObs0bIXIRgDXw2Bu0aRHFDNEQmE/FFzxqzCG1kiN+SB+DAYWqWFT76KBh4jhq
         p3D13XBXHCmMiUqmYs2VssMOKjoOfGX9EAV920SnOVWNx8HwqibeC8jHlV6imFHYVm7d
         PUCUgJqBPwyMMXSOPeoLqdD2dXhSlrYtY2ipbFhebk+TFwr4ErSLT4PDj1pth99Hx7zk
         3rig==
X-Gm-Message-State: AOJu0Yy8MWpyiS6tC2X56NTH0xLYQevh9HracXmY82IpGY60Ok8v3RuI
	7SnsCopPL24jckMEeB9f/tao5g==
X-Google-Smtp-Source: AGHT+IEEAJHJwIQiERlLA4dW2jNyNyW36yyG+T8pNRKwyFVm+lg97DXezz9uNgCZRLAAjUfPmw5KOA==
X-Received: by 2002:a05:600c:4f4b:b0:40b:36e9:bf4b with SMTP id m11-20020a05600c4f4b00b0040b36e9bf4bmr2821370wmq.41.1700833865591;
        Fri, 24 Nov 2023 05:51:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4? ([2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4])
        by smtp.gmail.com with ESMTPSA id fj13-20020a05600c0c8d00b00407b93d8085sm5856582wmb.27.2023.11.24.05.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 05:51:05 -0800 (PST)
Message-ID: <c3a07912-07da-4965-94b8-3c0d8889ddc4@linaro.org>
Date: Fri, 24 Nov 2023 14:50:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v9 04/12] dt-bindings: phy: amlogic,g12a-mipi-dphy-analog:
 drop unneeded reg property and example
Content-Language: en-US, fr
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Remi Pommarel
 <repk@triplefau.lt>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
 <20231124-felt-tip-everybody-f2a6836e52af@spud>
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
In-Reply-To: <20231124-felt-tip-everybody-f2a6836e52af@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Conor,

On 24/11/2023 13:36, Conor Dooley wrote:
> On Fri, Nov 24, 2023 at 09:41:15AM +0100, Neil Armstrong wrote:
>> The amlogic,g12a-mipi-dphy-analog is a feature of the simple-mfd
>> amlogic,meson-axg-hhi-sysctrl system control register zone which is an
>> intermixed registers zone, thus it's very hard to define clear ranges for
>> each SoC controlled features even if possible.
>>
>> The amlogic,g12a-mipi-dphy-analog was wrongly documented as an independent
>> register range, which is not the reality, thus fix the bindings by dropping
>> the reg property now it's referred from amlogic,meson-gx-hhi-sysctrl.yaml
>> and documented as a subnode of amlogic,meson-axg-hhi-sysctrl.
>>
>> Also drop the unnecessary example, the top level bindings example should
>> be enough.
>>
>> Fixes: 76ab79f9726c ("dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> I feel like I left a tag on this one before, but I can't remember.
> Perhaps I missed the conclusion to the discussion to the discussion with
> Rob about whether having "reg" was desirable that lead to a tag being
> dropped?

I checked again and nope, not tag, but Rob's question was legitimate and I reworded
and clarified the commit message following your reviews.
On the other side you suggested a Fixes tag, which I added.

The rewording is about why reg doesn't make sense on the nature of the memory
region and it doesn't make sense here like other similar nodes.

Neil

> 
>> ---
>>   .../bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml          | 12 ------------
>>   1 file changed, 12 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
>> index c8c83acfb871..81c2654b7e57 100644
>> --- a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
>> +++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
>> @@ -16,20 +16,8 @@ properties:
>>     "#phy-cells":
>>       const: 0
>>   
>> -  reg:
>> -    maxItems: 1
>> -
>>   required:
>>     - compatible
>> -  - reg
>>     - "#phy-cells"
>>   
>>   additionalProperties: false
>> -
>> -examples:
>> -  - |
>> -    phy@0 {
>> -          compatible = "amlogic,g12a-mipi-dphy-analog";
>> -          reg = <0x0 0xc>;
>> -          #phy-cells = <0>;
>> -    };
>>
>> -- 
>> 2.34.1
>>


