Return-Path: <linux-clk+bounces-4087-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0756862B73
	for <lists+linux-clk@lfdr.de>; Sun, 25 Feb 2024 17:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A5181F2111E
	for <lists+linux-clk@lfdr.de>; Sun, 25 Feb 2024 16:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981B112E70;
	Sun, 25 Feb 2024 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mDfTzpXZ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7664117C61
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877392; cv=none; b=iWxvPF8+PmT5IruPmfkPuCqz/Zt4MkVk6vDiaVgOj96F2i8x4kW4iW6pQihz+2SPIoIHLGM9bWRJw1hD66WM+gwk1KzcH/7+qhKKOR0OCwku0re6nPABuV5udHCulzpL0z1XL6kAt5KbB75uDLdTMXKdOAQQwwPjtDBKUxGOcy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877392; c=relaxed/simple;
	bh=U2+VGqrsZndaPaTKvuFN9LF54oo+9v3fZPEIQn7mSUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWiqcw6kdNG+ZPFw/crNvt4aQaaH3xyRzsV70DxoU3v7CFI8KrgEBrh5NuAP1kgrsCz9mrRjL1yoVxDbhFpiZvKYWfnTltEzVmWQERobPiKu0QKT0W69v8t1G92eVNMYrFEjTPzV7FmksNPvdYYxATlysfvAg1VpJIoaQ3Po32k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mDfTzpXZ; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6e432514155so1047403a34.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 08:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877389; x=1709482189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNniMBJSHHTqW45rUrejLdgYVmP6sB411s+Ak3b0ET4=;
        b=mDfTzpXZUYfm9mTP7kkjqaT5f5oItE8pj874veNVqRo+bDwA6eBRiFdLMGyxFDn89r
         V+pKEsDzhiLMQj/YWe+cp3/2U1upBwWcy+CflSqiN1qXXTcceXOJeena5ZwEubDv3dqj
         B1ihZsqyBcgzoiss0tTm/MOoGDIa5rh7TD4jLxvkEYkbg5TWc+UPDMhLAEfJquIUuFFO
         u0B8VkjlP9xKPz93Jv4UT7QaKXIzmJFlTJ7hoYqbqSnfb05CilCYPTBUdS8nVs4kcFWc
         RLmMO7ts1zYnCmit0tjO9odUhiMNo+A2M3pu4bxGjrEru52ewisshTR6+iH11DB9PusF
         Pg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877389; x=1709482189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNniMBJSHHTqW45rUrejLdgYVmP6sB411s+Ak3b0ET4=;
        b=HfzyRU7ItQz7Ym2MdHxFwPSBi0/40ObsJlNZTk9YcPvmWO28IDTo7K3C30UXqkhlQp
         2HmN1/7J+ADa80L2NiijUFF0v3Uxc/OyXULC8cxtGU0Ool2H7DlvMYjU/wgawHARMWob
         duYwEq65aADolFD51/3SWUf0s2/I21AfbFH5TiTfFLi6xSzdrhaUjFlM81N7YMYQgwBK
         NaDIZ+iiY8Jehpn2FjWjvDRN3J1zterIoy0rhEVJFr16bDgujbKlVSWqJ0dxOMkbNp5m
         6jSp12Lj5JWf7kdPmbm2vwh1HGr5zMrI/VVYJpNKe6BMda90oe6gQQBo8vf3tA4jmdx7
         oMEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMKc51LIdHH0Orsc3Z5yKEqC/SGpDh/hwGAnXKQ3GQEth+4PYIToii3RP+rMGu5c2us23oxAddlYtY5lL16GF3v/hotzvs0m04
X-Gm-Message-State: AOJu0YxCFQZLreaTEKiagRybb9C0viPRX9kA99K4DeJ/vmRn7pFjYweB
	dSh3Ww80MUl5nFG/9ic97Aw2/crY057jddskfZA0yKcRUAzQsHN2ORn8c+C40DY=
X-Google-Smtp-Source: AGHT+IEL7pBi/R21XdtjAI/ovskBwkyc+QGRVLeiORtTlYr2h8bZQHdRpl6WvFMznUszUCztJYD4fQ==
X-Received: by 2002:a05:6870:95a8:b0:21e:fbf6:8aaf with SMTP id k40-20020a05687095a800b0021efbf68aafmr5860764oao.53.1708877389506;
        Sun, 25 Feb 2024 08:09:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id r17-20020a056830121100b006e45a5f0a70sm764617otp.49.2024.02.25.08.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Feb 2024 08:09:49 -0800 (PST)
Message-ID: <eb968e2b-495b-44dd-aad9-3cd5eac72bdf@linaro.org>
Date: Sun, 25 Feb 2024 17:09:43 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] clk: samsung: Implement manual PLL control for
 ARM64 SoCs
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-14-semen.protsenko@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240224202053.25313-14-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/02/2024 21:20, Sam Protsenko wrote:
> Some ARM64 Exynos chips are capable to control PLL clocks automatically.
> For those chips, whether the PLL is controlled automatically or manually
> is chosen in PLL_CON1 register with next bits:
> 
>     [28]  ENABLE_AUTOMATIC_CLKGATING
>     [1]   MANUAL_PLL_CTRL
>     [0]   AUTO_PLL_CTRL
> 
> The bl2 bootloader sets 0x10000001 value for some PLL_CON1 registers,
> which means any attempt to control those PLLs manually (e.g.
> disabling/enabling those PLLs or changing MUX parent clocks) would lead
> to PLL lock timeout with error message like this:
> 
>     Could not lock PLL ...
> 
> At the moment, all Samsung clock drivers implement manual clock control.
> So in order to make it possible to control PLLs, corresponding PLL_CON1
> registers should be set to 0x2 first.
> 
> Some older ARM64 chips don't implement the automatic clock control
> though. It also might be desirable to configure some PLLs for manual
> control, while keeping the default configuration for the rest. So it'd
> convenient to choose this PLL mode for each CMU separately. Introduce
> .manual_plls field to CMU structure to choose the PLL control mode.
> Because it'll be initialized with "false" in all existing CMU
> structures by default, it won't affect any existing clock drivers,
> allowing for this feature to be enabled gradually when it's needed with
> no change for the rest of users. In case .manual_plls is set, set
> PLL_CON1 registers to manual control, akin to what's already done for
> gate clocks in exynos_arm64_init_clocks(). Of course, PLL_CON1 registers
> should be added to corresponding struct samsung_cmu_info::clk_regs array
> to make sure they get initialized.
> 
> No functional change. This patch adds a feature, but doesn't enable it
> for any users.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>   - none
> 
> Changes in v2:
>   - none
> 
>  drivers/clk/samsung/clk-exynos-arm64.c | 44 +++++++++++++++++---------
>  drivers/clk/samsung/clk.h              |  4 +++
>  2 files changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
> index 6fb7194df7ab..55490209b9a9 100644
> --- a/drivers/clk/samsung/clk-exynos-arm64.c
> +++ b/drivers/clk/samsung/clk-exynos-arm64.c
> @@ -25,6 +25,19 @@
>  #define GATE_OFF_START		0x2000
>  #define GATE_OFF_END		0x2fff
>  
> +/* PLL CON register offsets range */
> +#define PLL_CON_START		0x100
> +#define PLL_CON_END		0x600
> +
> +/* PLL register bits */
> +#define PLL_CON1_MANUAL		BIT(1)
> +
> +/* Helper macros to check for particular clock regiter by its offset */
> +#define IS_GATE_REG(o)		((o) >= GATE_OFF_START && (o) <= GATE_OFF_END)
> +#define IS_PLL_CONx_REG(o)	((o) >= PLL_CON_START && (o) <= PLL_CON_END)
> +#define IS_PLL_CON1_REG(o)	\
> +	(IS_PLL_CONx_REG(o) && ((o) & 0xf) == 0x4 && !((o) & 0x10))

These should be static functions, because it leads to trickier code. See
also checkpatch warning.

Best regards,
Krzysztof


