Return-Path: <linux-clk+bounces-3049-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8D840BF8
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jan 2024 17:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E81FB2656A
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jan 2024 16:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FF4156989;
	Mon, 29 Jan 2024 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aoO4Lit5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB9F15696E
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546650; cv=none; b=u3CCBcEpmr2UwDLLp3u46txeXOzmtI85WB/Hvm/ieFIOZMJIqGbqSNhN2jyTBFBbNvupDyftnL1EFmPRSCjNDhKQn3J3IhyRvc0DHD1w2zKjqHv/UpnLeL2r1w2yzHRpecwT/BbeM+wrf6ZIXcmUc+Cmel5Pu1+CdeVKcAbd+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546650; c=relaxed/simple;
	bh=Z2u3lcqAmJxvezqCdlseHPBizo4Olu1ZNsffiLHXn8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDtZY3dq428VsrqSO0itExBBBSTAqRD8wJpRHP/FYnNWSufsCa5DfXoVNRUrFKGmjmLU8lq5yaKljDzBJTMQ64KQlePbSrlztwieNs8iIX1GAO/uENFEgoY/pV9odkPI1Vljt04BuoQ9154HnmW3gKQKj6CLLrI1V614Zp1ZF3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aoO4Lit5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a35c0ed672cso142569366b.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 08:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546647; x=1707151447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjgKUi6i4KXLjb4tgi3GJa+ofj8ldjbzUGjojBY1ZdU=;
        b=aoO4Lit5RtUaGgMUCyp/J783ez+PW38+dL1EPKrOqnLbInL+0oQceEoP4hI4zelun4
         jUQz+qZe7ja3EhcwdyxU5JoUFSlzjZGRcwZLxoIJBa3v9Ovo8qPEWJndDmvo9d815PMm
         t3u+8WkLGiVpGbuZm5yyZkxTCQDRMlyDe/Z4UTczirgtsIMRPvQaERB5RBk/a5Zro/On
         URTsQNcheY35iQr9TewOfJLR1POd6oQfYUfJi2QrK3g4vHFrak/tWBCkXmX9pksmchp9
         eZR1WOi6inYD2MsLrb02IsT2hsdU+xCNIEr3YvqA/SdZy51ew4MRZMbJ9QGAyozqHpNf
         /s7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546647; x=1707151447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjgKUi6i4KXLjb4tgi3GJa+ofj8ldjbzUGjojBY1ZdU=;
        b=u97dDwbbmar1g1x1IuC54JoUs8v92a8Oc2TEC4Q2XyWzU1JAV5vJ1jjcRoFHg1zc0P
         0L6ZJdMDdr06owmQwBhzwaZDXdywQ7OEyryQOcnrudYumLrTB/ACitTbISqW9VGlC1nx
         Wew4UO6SL9ChWvNAJB8j/h7LaV/aD/vhvvavRWxs3utHIZSF3hm0NQsLWcDWF3niP4uC
         A8Q6Xxrur06ht2VAH1X3a+eyUBDxN2RSiFT8Qh+7Ndhf4AQzQgMoBgftPO0xb4cAZg74
         6sE2tGflMw3TuEg+R2oNf1o/ir0W9f3lm62hP9MWFgjB2Z6ztEt+JXj6Xb8SDU1RT0H8
         2ANw==
X-Gm-Message-State: AOJu0Ywl2aYBHZqN5bu7BKPy2HPzh4c+P3WM12f/Crjjx7VyqTUNvb7A
	MMdoxV0AGbN2LxvVibrZ0YbeP5HZSq+iZW4miOWgPLXzm2oiPFXX5r7M+sbCVT8=
X-Google-Smtp-Source: AGHT+IEEG4EIpLonogPr6tL1HNR/enaft0TIIE1L51CBBdkoCMudWW8SmAYxiS4cEfN9AFyG7AqwOQ==
X-Received: by 2002:a17:907:1044:b0:a31:13ce:d64f with SMTP id oy4-20020a170907104400b00a3113ced64fmr4165730ejb.55.1706546646711;
        Mon, 29 Jan 2024 08:44:06 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id ci11-20020a170906c34b00b00a2f181266f6sm4157001ejb.148.2024.01.29.08.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 08:44:06 -0800 (PST)
Message-ID: <673661cf-879d-45fe-979d-8650685f8b71@linaro.org>
Date: Mon, 29 Jan 2024 16:44:04 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: samsung: gs101: don't mark non-essential clocks
 as critical
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20240127003607.501086-1-andre.draszik@linaro.org>
 <20240127003607.501086-6-andre.draszik@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240127003607.501086-6-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/27/24 00:35, André Draszik wrote:
> The peric0_top1_ipclk_0 and peric0_top1_pclk_0 are the clocks going to
> peric0/uart_usi, with pclk being the bus clock. Without pclk running,
> any bus access will hang.
> Unfortunately, in commit d97b6c902a40 ("arm64: dts: exynos: gs101:
> update USI UART to use peric0 clocks") the gs101 DT ended up specifying
> an incorrect pclkk in the respective node and instead the two clocks
> here were marked as critical.
> 
> We have fixed the gs101 DT and can therefore drop this incorrect
> work-around here, the uart driver will claim these clocks as needed.
> 
> Note that this commit has the side-effect of causing earlycon to stop
> to work sometime into the boot for two reasons:
>     * peric0_top1_ipclk_0 requires its parent gout_cmu_peric0_ip to be
>       running, but because earlycon doesn't deal with clocks that
>       parent will be disabled when none of the other drivers that
>       actually deal with clocks correctly require it to be running and
>       the real serial driver (which does deal with clocks) hasn't taken
>       over yet
>     * hand-over between earlycon and serial driver appears to be
>       fragile and clocks get enabled and disabled a few times, which
>       also causes register access to hang while earlycon is still
>       active
> Nonetheless we shouldn't keep these clocks running unconditionally just
> for earlycon. Clocks should be disabled where possible. If earlycon is
> required in the future, e.g. for debug, this commit can simply be
> reverted (locally!).
> 
> Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

I find the logic fine:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/clk/samsung/clk-gs101.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> index 61bb0dcf84ee..5c338ac9231c 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -2982,20 +2982,18 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
>  	     "gout_peric0_peric0_top0_pclk_9", "mout_peric0_bus_user",
>  	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
>  	     21, 0, 0),
> -	/* Disabling this clock makes the system hang. Mark the clock as critical. */
>  	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0,
>  	     "gout_peric0_peric0_top1_ipclk_0", "dout_peric0_usi0_uart",
>  	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0,
> -	     21, CLK_IS_CRITICAL, 0),
> +	     21, 0, 0),
>  	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2,
>  	     "gout_peric0_peric0_top1_ipclk_2", "dout_peric0_usi14_usi",
>  	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_2,
>  	     21, 0, 0),
> -	/* Disabling this clock makes the system hang. Mark the clock as critical. */
>  	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0,
>  	     "gout_peric0_peric0_top1_pclk_0", "mout_peric0_bus_user",
>  	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0,
> -	     21, CLK_IS_CRITICAL, 0),
> +	     21, 0, 0),
>  	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2,
>  	     "gout_peric0_peric0_top1_pclk_2", "mout_peric0_bus_user",
>  	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_2,

