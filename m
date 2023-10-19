Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4C37CF3F0
	for <lists+linux-clk@lfdr.de>; Thu, 19 Oct 2023 11:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbjJSJV4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 19 Oct 2023 05:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjJSJV4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Oct 2023 05:21:56 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7F7A3
        for <linux-clk@vger.kernel.org>; Thu, 19 Oct 2023 02:21:51 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c50906f941so91413941fa.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Oct 2023 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697707310; x=1698312110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXjT8p0w2WOajyEpbpgr/2SPJ8/jTEv8hAwGe2hZCqc=;
        b=D91ZHMSvYyDNq+BRv/ZmNT3Pg5Oon7Zbj+fyPm7WnE8Hhwd2mtNsbUMPLCp98jQFeJ
         A1vWNTYeMGUBF6Gv2c2kymUbkkOO0G9O/+phTfw13s88fyHSVkLepvgsT20s5a5EeQ3/
         w2E22EqmRv0Chmc7PkhyGA+0B3ncKYSHbUnLVsp3yOJcqrn1bhzCX7/d0ddGfy/yAYs0
         NKl3ChzG51sMWtReUH31SyzdASGH/kT6/RR5DwKPgJZ2fF9L7w0SR9VYlUrQ1+MHgaCj
         mQDtNlgUP2S0LSZfrYCL1+KFq78rNHXYWI7SUjre+fjHoaJk2WEXRiM73zNx7Zk9jX+i
         gCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697707310; x=1698312110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXjT8p0w2WOajyEpbpgr/2SPJ8/jTEv8hAwGe2hZCqc=;
        b=fmuDCN41Oyit/8mTP3oqA4VDQZBUCc2kpeen3+dDQ73lBH1y4TNciXY6h3/gfikqBr
         av7//3EOi/8/P+ylHQbLDhapItZxMWAqqBSjQaLHkPZsctJZxpt2m+NulHfd2UrqxeiT
         UKGrCKDrH8ojsqjn3d5V4J9pd41LFGr4V7GaFNhemk7hmUazoxEdGKVN6zfXD/KTRG5A
         C2zSglEQs0jtMAT4jp9kbYV/YCvoq/W2TKAzu6bsHIUuMAmS4Lgzk8wo8toebm9Y0d6w
         cWi9Bs31AZY3RsljlVQn1/cnE7RmR1ZSmUteqH9S1apvRdrsq/lzRDL2NaUBoM4iukCj
         l8Ug==
X-Gm-Message-State: AOJu0YzZp31lnvAADlzeRdE6Ltwb0QAe0nONzVwfX37fD+d0YaKyA+7T
        /MEwHRolfPWRRDxuQfWdEQourg==
X-Google-Smtp-Source: AGHT+IGuxtMdWdK0zIKfDvAo02KGHVuPKg6EGMQFQPvL+iESuudFCKhTS13DZsoaYuTTcxcl5+uYAQ==
X-Received: by 2002:a05:6512:604:b0:500:c534:3e4e with SMTP id b4-20020a056512060400b00500c5343e4emr1156636lfe.60.1697707309793;
        Thu, 19 Oct 2023 02:21:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id f13-20020a1c6a0d000000b003fe23b10fdfsm3850668wmc.36.2023.10.19.02.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 02:21:49 -0700 (PDT)
Message-ID: <df3c067f-8732-46bf-aa93-852f41e9e4e9@linaro.org>
Date:   Thu, 19 Oct 2023 11:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Content-Language: en-US
To:     Chris Morgan <macroalpha82@gmail.com>,
        linux-rockchip@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, sebastian.reichel@collabora.com,
        sboyd@kernel.org, mturquette@baylibre.com, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, neil.armstrong@linaro.org,
        heiko@sntech.de, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <20231018161848.346947-5-macroalpha82@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20231018161848.346947-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/10/2023 18:18, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
> powered by the Rockchip RK3566 SoC.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index a349bf4da6bc..a6612185a7ff 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -674,6 +674,11 @@ properties:
>            - const: powkiddy,rgb30
>            - const: rockchip,rk3566
>  
> +      - description: Powkiddy RK2023
> +        items:
> +          - const: powkiddy,rk2023

This cuold be just enum in previous entry :/ but I remember we talked
about this once with Heiko.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> +          - const: rockchip,rk3566



Best regards,
Krzysztof

