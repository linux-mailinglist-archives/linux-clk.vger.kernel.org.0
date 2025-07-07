Return-Path: <linux-clk+bounces-24274-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4DAFB310
	for <lists+linux-clk@lfdr.de>; Mon,  7 Jul 2025 14:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57B2A7A4EC0
	for <lists+linux-clk@lfdr.de>; Mon,  7 Jul 2025 12:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E60A29A30D;
	Mon,  7 Jul 2025 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RTS1W6xz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A2E28934F
	for <linux-clk@vger.kernel.org>; Mon,  7 Jul 2025 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751890789; cv=none; b=NpiScCNIJTQ0C4hEIDLUKMur41BIuq7PygulVg79+Ju2vQC6DMfRhogj4cMkfNU4zscAVr6anTascIaodO14xSmmxPJlpMpwsE+hKiERSjUWS31pFF4HAY8wSS4YDrdmTtJFd1kVt/lL6RluQn7GHYH2a0WWXktglv9N6GxnaSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751890789; c=relaxed/simple;
	bh=G2nuJk0ebAC3LWYePQqGnvMvK1ajrnj1SIODzaviyXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rz+gPQVWdQ97ECdS1Tez9pMtex7WDtS0xML/bewA8AUl4QsrUw19UBBVFGurYeuaEBy1VkpGg0mCQZLgXvtfuvK3wNxSw6F3K9eIjNU334D5JEbIG2f/kP5tes9AqjLldtG+k08BWyk/792WAm5OaVViAab0tCLThJeHelntqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RTS1W6xz; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3e0570a9b83so10166435ab.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Jul 2025 05:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751890786; x=1752495586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxogMmaQmgY2q2qzD7nC3CsZ+3t0oYcFl9XYA4Lsn1M=;
        b=RTS1W6xzNE1951iRffx6867cN5C8oWh7pekgfSoFAj/jnDyuZ64wz8GYtIhP7a1vsk
         tY5VHGar0l1hF7m6fuzviSwrwYpYF8Gs9EbytWS/Zkc+ZnJcUnKLjGVa5fY9ItfcnkBC
         RjCs7gXQ/qmFK6AtqkNR7NFTgPR1Zp0Xnb4DV60cauO2CNdGqDo6/dTEXDG1czKVmwyG
         LHLz8s15waXDv/MUg6teSKIDC4BMJR66/e2024ramTEbr2R4xDreHKogssTPcL5rxoH5
         S4/wkcWl7SIJPRYKLe+eKwr7PrOrZ2nR6/nBUU79krKEMvtQj/KB1OGuaAvGdkuvowNL
         I0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751890786; x=1752495586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxogMmaQmgY2q2qzD7nC3CsZ+3t0oYcFl9XYA4Lsn1M=;
        b=tvEGhTHpZaNgXSNLuSuO4jiok4gJ+JtJ6uELMjnaeSIlAT56l6ehksh+Ljv7z5cijP
         N+Y/GoM8h+cpZ+Nfy1R8D7ggggtBXr0ua7/xuQrDXZhrqnAvD33SIutkEWjlVDc5PBMb
         Po5tnKt9/x+UHHMf5gOoXVUpo+oRpnS0ukOXAev59DEhAJH+k1IUBSJ0MHaFvGw/FGxI
         tNVw1EYeRyUW9XuQ9RL/fo/nmgMgU2hTehWnPGTABKAj7TiEN+E6k+rSF3X2CQbyNn+C
         ckA4vvWHUrirlJugQcoMViRdvpGVs0JmwccpQK78u4ISblkS7ZAzOM6V49BRN6cQs/pb
         d5rg==
X-Forwarded-Encrypted: i=1; AJvYcCUmKpAq/LzKO8c21u9AsiMS4mA6E3nMKWTx6WZBfln7YPbYA/OEy597/P8MkggrKvH0y1AExsDF6kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTL4odWKxOsO9GKn73ZWq/nYkh0tXXvA+leDUVq8rewzYOc4on
	5QDyBEyeZBUfPzLOKDtME2KTD8piQOQy0zR/fu0FTj0ujPo0Jy/IY6YCL+A8KP9uYQ4=
X-Gm-Gg: ASbGncv1Gx3FIklY2sYKoilqKd7oh/VPMMR4yB+4bM78UNOxwB2sJVQc56YcMpkPPoa
	KZL4z6tF/+18L5RMInXglkXsfA0RjAaI/C8NQnaQ+73NfK71A7k1Qn4FbaKctvu3JgB5DgB37JR
	ZnG1pto2EaG4e2OiRWmmFF3WPIQ4Ic6zMqvu2WaF7GuWnWoUdBJ5u3lXtf1LpfrKQ5pGRAWEZaR
	BJgWemu1nbEumiOeYpmQFT8DK4sXukm1p8On7IA02fvBFTA+viUyQAq0yqqstqc4gb7nHop7AsJ
	kUxTlYG2ZKok9mNz29LtypykO2brFQVtQygLrC4Os8Ui+mp/G0rWJ8EeYqkpVZWmSgbnpUWq5Ez
	n8jQAbzdH7mTIICFqafxvsan4SA==
X-Google-Smtp-Source: AGHT+IHhI0FQyOogd1s/uXHV7ed2uK3z0eA0h1VaUBWuw5Kj8IBh7AKQNpwKJDcN3xx1YzBfgWCFWA==
X-Received: by 2002:a05:6e02:1c0b:b0:3dd:d98c:cca9 with SMTP id e9e14a558f8ab-3e13ee8b5e8mr72520815ab.3.1751890786546;
        Mon, 07 Jul 2025 05:19:46 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b59c92ebsm1619337173.46.2025.07.07.05.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 05:19:46 -0700 (PDT)
Message-ID: <7bdbef20-da43-4b23-9ae2-a0cf077fec92@riscstar.com>
Date: Mon, 7 Jul 2025 07:19:45 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250612224856.1105924-1-elder@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250612224856.1105924-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 5:48 PM, Alex Elder wrote:
> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> parent for numerous clocks, including those used by APB and AXI buses.
> Guodong Xu discovered that this clock got disabled while responding to
> getting -EPROBE_DEFER when requesting a reset controller.
> 
> The needed clock (CLK_DMA, along with its parents) had already been
> enabled.  To respond to the probe deferral return, the CLK_DMA clock
> was disabled, and this led to parent clocks also reducing their enable
> count.  When the enable count for pll1_d8 was decremented it became 0,
> which caused it to be disabled.  This led to a system hang.
> 
> Marking that clock critical resolves this by preventing it from being
> disabled.
> 
> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
> be supplied for a CCU_FACTOR_GATE clock.

Is there any reason this bug fix cannot be merged?  It was
first posted a month ago, and although there was some initial
discussion that led to revisions, this version has been waiting
for over three weeks.

					-Alex

> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Tested-by: Guodong Xu <guodong@riscstar.com>
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> ---
> v3: Define struct with static scope; added Haylen's Reviewed-by
> v2: Reworded the description to provide better detail
> 
>   drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>   drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>   2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cdde37a052353..df65009a07bb1 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>   CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
> +		CLK_IS_CRITICAL);
>   CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 51d19f5d6aacb..54d40cd39b275 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>   	}									\
>   }
>   
> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, _flags)					\
> +static struct ccu_mix _name = {							\
> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> +	.common = {								\
> +		.reg_ctrl	= _reg_ctrl,					\
> +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
> +	}									\
> +}
> +
>   #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>   			       _mul)						\
> -static struct ccu_mix _name = {							\
> -	.gate	= CCU_GATE_INIT(_mask_gate),					\
> -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> -	.common = {								\
> -		.reg_ctrl	= _reg_ctrl,					\
> -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
> -	}									\
> -}
> +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, 0)
>   
>   #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>   			    _mask_gate, _flags)					\
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494


