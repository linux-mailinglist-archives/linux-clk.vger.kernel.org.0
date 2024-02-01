Return-Path: <linux-clk+bounces-3201-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5084534F
	for <lists+linux-clk@lfdr.de>; Thu,  1 Feb 2024 10:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E321290AE8
	for <lists+linux-clk@lfdr.de>; Thu,  1 Feb 2024 09:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE6215AACE;
	Thu,  1 Feb 2024 09:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QuztIaIc"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2415A498
	for <linux-clk@vger.kernel.org>; Thu,  1 Feb 2024 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706778040; cv=none; b=iMRfQdJIKe2x9s3A4o/C7gNd4gn8b7mk5tTYuEqJiB6OqYG/7pHzfuzljgLVDVXPcryn6toDnDiF5BKeg7Cw1prhvyaowDGoP8cm2+T9vlrTTmwr2qKKt2PxK+5RQVt48rdzsH9w4+hzBYCgPJ3wXa1RPcKM88/wt2SnW3RaZV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706778040; c=relaxed/simple;
	bh=fYslxJEf/Z/rscvFq7DdJSRqxFpOsrNJssNF4gqBFkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LPx/E/DAdpQ2++ZDhRYt+MOajiaDkl6o5SN9nfgR4DUuc+6EkhUhxSjRxZEHnAwAE/KmqjEZ525Ks+5//GXsYgIVuX4RA8Ku5YWwxMLGAxnlaP5Bmnx08+KYgp/0cLho4CIK/2hRnn5bG9R28t8Drr7WQkR+x3HV7XypsOLmr34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QuztIaIc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a358ec50b7cso117489866b.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Feb 2024 01:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706778037; x=1707382837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JbeFf5n2Oyv9Yqc3rkPK+DBR6kxdBct8U150vB7knbc=;
        b=QuztIaIc1kDotje2eNKozX5ZjeVeM0s55IBF3V8u0+GENgiQZCeCXmbMtQjJfCOnle
         KKu6uGjQGLSslJDHSUfZsmm6c4E2l8Ul6EqpRdfAakwI4D1eZdnAtGRZnnLtoPJ7l+a0
         oX3p/DXrGiEP8Xq2vHAtbHVBRKuW8Tqx/SnwxZz19qtcOdfTy9Xi0YP+KZbuPoozOIke
         k4daAbWIHLN9ROI+Ilz4ja9E8/nWyTeZHIF23nzQB9IyBttL7tF8gpwTx5mwvCUHZ08z
         /UPmb5DFmsHXWzWGpi4g8iMIpdxR8lo1dRUwIVEHGuNHGpraRB4/Qjz8B+FXE4ANR3oO
         pWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706778037; x=1707382837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JbeFf5n2Oyv9Yqc3rkPK+DBR6kxdBct8U150vB7knbc=;
        b=mWylzHizQ+/TmfYYuo4KFRIDT0Hmcl8SehCjecy66Rb1sl7p4xWEJibY73EIyGabuc
         TcSTdX+mDKD3vVbwmyOm+MFbWKdPbkJJlCvW85eD32crXpNcBCHeAHtGOgmoTJiVJCN7
         dBGZc3Q2STbfPYK/UelbfhkoOhpG8jEb5+Wt+ZMJ1WRd/AzMfUYQslcOGTkPu+A8Biog
         XyfPzoRc81aIwdJtgHCY/li78efHS3QK62VaTKuRur1CxSqfCOClE5dNPvuDRcNalsUW
         VInEeqDO6AqhO14rIm5mvSwz63JH/AoRJn74R7dXUWzXA9c9vmMzi+JNQkywB4VaooSe
         Tejw==
X-Gm-Message-State: AOJu0YyLG7btYLKE7QBPVeiQtw+Eb8ZPdiQvXyIxmRm95Xucz56UiFEm
	mLEp0bM1Isn5DRHAsmS1jY8y9uXBzxfKzyrxB+XCwa4FUl/AOvlsk8DP1khVB7E=
X-Google-Smtp-Source: AGHT+IHM9bitjU2UVL+U8Qg98wReY19D/d1IuXu1QELo9AS+RhhOUSkkAOgZLgtmjdOE44weSPgXkA==
X-Received: by 2002:a17:906:aed5:b0:a35:b59c:fc04 with SMTP id me21-20020a170906aed500b00a35b59cfc04mr3531407ejb.25.1706778037170;
        Thu, 01 Feb 2024 01:00:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX+arCeiGMY8xcF2rXGmCus2dHtPctRqDhLx0Z91DmKkB0UpV/FDrOUo7+LMK8NIy42JURi0MxX086MmXTphpOBiiunl7e2rOKzLw4s3SDZaCbDoBcX8mbSLUQ1sRpfKZ3vZPmEFZBDVLqOohtDKJYAGQNPQTimsjdwCSeL1uuwPJjoQIrGBDkQwSSyRxjH58WkuXs4C2BbpWQB+X2bOubCE03r/vBd5KJ25eVtro9yQa/uA0sLfSnYOs+vQndKW/CBlG9k8P3So2WOqgoDWJcn0hWhQxTxTiUAyjcpbCX9S3PH2qDdonMB5rmrwqgq28ipPbPqVrAbHOA5+lfzse/hZdPkk/2MDPjv55HugdVHk6gOUSz2GcWlwQkcRd3H9t0gXqH5AcC4PIk3zEGww3tG0aihf2i/iq2zUPaFCVvXZdmbxcDaWZf2j94Yj3X847XxaBC7LQbJKq83zSP8aTLWaHhutPQwTUliwA+p1GFM7ZTZRDbzuv7rPI2lGcLOLaPoMZ5sMyYQOTn5DRAl/gxOsl2TTqcS6IT7rMAyvKcd54lRR7vdQitoGS077Q/ckRgDa1OxXsNzHnJrudD5WQ0Tx659Uc712RmCye+0sloRAHcOJlJ2jODkpDkFB32TmMby/zHzlDIxtw==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id 20-20020a170906329400b00a3527dba974sm6110367ejw.35.2024.02.01.01.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 01:00:36 -0800 (PST)
Message-ID: <0558d9c9-106a-4061-9db2-3776104030d0@linaro.org>
Date: Thu, 1 Feb 2024 10:00:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] dt-bindings: reset: mobileye,eyeq5-reset: add
 bindings
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
References: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com>
 <20240131-mbly-clk-v4-5-bcd00510d6a0@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240131-mbly-clk-v4-5-bcd00510d6a0@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/01/2024 17:26, Théo Lebrun wrote:
> Add DT-Schema bindings for the EyeQ5 reset controller.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/reset/mobileye,eyeq5-reset.yaml       | 44 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +

Where is explanation what changed and why the tag was not applied?

Best regards,
Krzysztof


