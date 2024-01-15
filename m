Return-Path: <linux-clk+bounces-2450-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC6C82D5F3
	for <lists+linux-clk@lfdr.de>; Mon, 15 Jan 2024 10:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BF2C282D67
	for <lists+linux-clk@lfdr.de>; Mon, 15 Jan 2024 09:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FC5CA7A;
	Mon, 15 Jan 2024 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yES32lqX"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E8CC2D3
	for <linux-clk@vger.kernel.org>; Mon, 15 Jan 2024 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-556c3f0d6c5so10232728a12.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Jan 2024 01:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705310950; x=1705915750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K+nA5BMsBtuAQLecJV0tVbl8+7H0Iz426JLB/WU66Ag=;
        b=yES32lqXpOhi93jKRjfqBPdbY/nkZOulQ+FHD8b02e1EMAuE18AsdCTmKolHsMkEgt
         QCG9gtvLVaE30APoKMkv+3/WwZQDBiYDTJAqRhWPY8XhjKMUjfjXzkGogXZvRpy8MCAM
         tNjECaw6ZZJQvxo8z6GBK06ANhJk8c7eWrZxxLOtYZ1LcbcxcI0evhcbroyi1HcQIn2I
         d+ke+ujBNtWKf5mUQd5yoc9aJ1EZPaW0T0EGlfSGPDL6Fkhrbh4fGZSGNuRDKL5Pjh0d
         r9g3UcUUvjLBa48D6QDUKzY1fYNTc3uiJbvdQcNbZ2r/AIBOm4aoHLLBrtPZM12ajw1m
         jvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705310950; x=1705915750;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+nA5BMsBtuAQLecJV0tVbl8+7H0Iz426JLB/WU66Ag=;
        b=lI6A/dBZuiGVjBUJ08KOj5z/YxPXVt8jdOHCZIqkMYCe1skMUjybucxLEvhZ+PlPLw
         318UW/ZC8gpQsm8Cu9Zftx/P4JGcElj17g26M5igTO44irjBMsmcx1+dlV2BUi983Nne
         BWwQ0kb9w2VcG7tTn0B6ma5RQZIiOn7vgnFGY4gWC5R3//gXEhaCW8MpQzQX1fUiPBw0
         qNTctHjHUNF0XBkfbDynAVHhRfSkNm+XUVhQ00/yNykoZuj6QpYXTIlJfZEJF2HKnPAR
         nQhKQ7Ek6bpF6x55VE3sQ498qPz2Ejuc7v+y9csW8u/Va/pJKXlvl7abGO7XkwhKoO5L
         d5lA==
X-Gm-Message-State: AOJu0YyItvjIVSd5+UvZMNHP+OAZubdcAvL8fWsFrU9YKT5i9ABTqLkZ
	op2AXkvucCJuLPdcDKDaEnQFnqoetF8RhQ==
X-Google-Smtp-Source: AGHT+IHxuVUVu4cAQ15YGoDAYmqMrusE9AEKDMja+4xWZJYKXRiARG593emzoRsoP6U21zVJESGzXQ==
X-Received: by 2002:a17:906:1159:b0:a27:fcd0:13fc with SMTP id i25-20020a170906115900b00a27fcd013fcmr1525879eja.168.1705310950585;
        Mon, 15 Jan 2024 01:29:10 -0800 (PST)
Received: from [192.168.174.25] (178235179017.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.17])
        by smtp.gmail.com with ESMTPSA id cx12-20020a170907168c00b00a2d3ecfb8ecsm2644337ejd.154.2024.01.15.01.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 01:29:10 -0800 (PST)
Message-ID: <a78cf494-2a01-48d9-bc82-dfa6058f077e@linaro.org>
Date: Mon, 15 Jan 2024 10:29:07 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/12] Unregister critical branch clocks + some RPM
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org>
 <CAA8EJppjxT=qri+bhfa=DbX09aCiFVp0vO3P0OD=TNiYJAd1-g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <CAA8EJppjxT=qri+bhfa=DbX09aCiFVp0vO3P0OD=TNiYJAd1-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2024 05:53, Dmitry Baryshkov wrote:
> On Sat, 13 Jan 2024 at 16:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On Qualcomm SoCs, certain branch clocks either need to be always-on, or
>> should be if you're interested in touching some part of the hardware.
>>
>> Using CLK_IS_CRITICAL for this purpose sounds like a genius idea,
>> however that messes with the runtime pm handling - if a clock is
>> marked as such, the clock controller device will never enter the
>> "suspended" state, leaving the associated resources online, which in
>> turn breaks SoC-wide suspend.
>>
>> This series aims to solve that on a couple SoCs that I could test the
>> changes on and it sprinkles some runtime pm enablement atop these drivers.
> 
> Probably it is out of scope for this
> I wonder if it makes sense to route (some) of the clocks properly.
> Should we use GCC_foo_SLEEEP_CLK as a sleep clock for the
> corresponding device?
> I'm not sure about the AHB and XO clocks.
> 
> Another question is regarding the suspended state. Wouldn't leaving
> GCC_foo_XO clocks enabled keep the XO enabled as well?

Doesn't seem to be the case

Konrad

