Return-Path: <linux-clk+bounces-8496-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEA8913385
	for <lists+linux-clk@lfdr.de>; Sat, 22 Jun 2024 13:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2616B23292
	for <lists+linux-clk@lfdr.de>; Sat, 22 Jun 2024 11:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D00154449;
	Sat, 22 Jun 2024 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsvyzqC0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB69F14B947
	for <linux-clk@vger.kernel.org>; Sat, 22 Jun 2024 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719056932; cv=none; b=DAMq2Wqr5z7nWBSFS53wi5CmMwQ8nldFwA+S28ci6NjCPptcPdNEeJNkI1ITrr2lguf1sZOkyrcYz8ZLCt3tn/Aq1/GAAX5+L9JNOSaGAoD8oUVRd+yRqkBV5dj5O+7dQwGY+lcs/dUBsdH9dzPqSooU1c8rPs/xvydjSGGveeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719056932; c=relaxed/simple;
	bh=64yO8JfGv2L2EdkUtYfsGwvZ48+tCTCotY2TqOzKbQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DIcp83S69Dty2vNpmZJTzCU0L8sn3Xb9R+yiPJb58amhzhpVGTUikG5FZFzf+aAbLipYkVgrxXvVXNWD3NjVaDlWcJyDKza3K4R5mDajnGsw2ZDIUD7KZQ3v3XVAQG58WK/6i/s0Ov3GkGRcqiEVTrgfX+4NoMV6JsASBdsAews=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JsvyzqC0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57d280e2d5dso2481577a12.1
        for <linux-clk@vger.kernel.org>; Sat, 22 Jun 2024 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719056929; x=1719661729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Si+0+Udt3TumPYpj87u59+KPSMEelqrx15xLL3IUjzg=;
        b=JsvyzqC0/Zr6zOkTWHxPCxqgTt0b4572BhpuVl3gLusJv2iOqmxwf6xAyt8OARjS0R
         vTxBhd0xcu81TV1gZz/yMbvM3UAxEgyyKq2rYUWCLtDWT/vLilcil3ABsQ5rzRVSbdsF
         CFYzpZuuC8/hdJeEYng2OwkgvVQ/HD+f9+HJE/SwwPf7tvkSTsaF3+l6a9CCtcGIzqBc
         VDwNnmB007BMbbfb6VzEUzmhLxyhKbXz7GaToCA4YQk5M7kThTHAwl8q8g4/2Q68PPaI
         uYqZX3G/F4/F5hlK3LZMKXmwz5gTGQn64BTdoT79Xa/gExuIz8Bxdl5kxUKSE5m2usqo
         5NEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719056929; x=1719661729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Si+0+Udt3TumPYpj87u59+KPSMEelqrx15xLL3IUjzg=;
        b=UP+Nq1GyNdJ1luNuQlOPqQRtV0IW+By3eXVWzGUQS8AwCiU/N9Yi5skFW9MX0TIHfH
         /HFoL7WT/877qkBDu0ZqBs+oDOupFWu7wgFf5l0pYZQT64+LxLSZszx/8FUgew2Ksoog
         lTXQPvApFOZ0ZGRwqlXeG+cjBZXZOKJqAK4i/o3VWpzByz+Ms/+N3VofDxFZzW0oMG5W
         8/RARlowDmsKrEAXXpVV12r+c6/cBXurensb20vGjuHrsk0o+KZWAym8jUUxJxGklHwz
         /xA13irSYNl+MRHCxOAFmHT/hs1kS0TTUHwsT7T+xGTjg1I69tzDKb7Chxf1AUqSbDKv
         qtIg==
X-Forwarded-Encrypted: i=1; AJvYcCXrXfWRjz5/ohm2Vak++JsQSeMq4eeuIw+xHrvuOIjbZgL536rPSItc8GGKGPuISwLVzGSawKOoCYduzMS1AoLFBhWTIlnrFRFm
X-Gm-Message-State: AOJu0YztpT8jOhUJMeghQDpCiyT7nqBPmgNiGq85OT2KfB4fZnslhaH/
	lIzhLZ9UnsfqC7EbSvv8O5gEK+loFmA1RGYXPCD6w//ii+1VqKXH+UFQBBh496w=
X-Google-Smtp-Source: AGHT+IETsmUp0wg345dn1k6YoCEgM27JTx2/WGxNpwXA2lrAy+TNHTbiIiNfA5B4wb3j7PDAkVxgug==
X-Received: by 2002:a50:c30d:0:b0:57d:261d:f825 with SMTP id 4fb4d7f45d1cf-57d261df8b3mr3767209a12.21.1719056929128;
        Sat, 22 Jun 2024 04:48:49 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3041208esm2237898a12.30.2024.06.22.04.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 04:48:48 -0700 (PDT)
Message-ID: <2fcf909c-10c5-41b4-9962-d085e7e2bf5c@linaro.org>
Date: Sat, 22 Jun 2024 13:48:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] ARM: dts: qcom: msm8226: Convert APCS usages to mbox
 interface
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
 <20240619-msm8226-cpufreq-v1-7-85143f5291d1@lucaweiss.eu>
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
In-Reply-To: <20240619-msm8226-cpufreq-v1-7-85143f5291d1@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 11:02 PM, Luca Weiss wrote:
> Since we now have the apcs set up as a mailbox provider, let's use the
> interface for all drivers where possible.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

