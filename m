Return-Path: <linux-clk+bounces-20316-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59943A815E5
	for <lists+linux-clk@lfdr.de>; Tue,  8 Apr 2025 21:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A39577A3A12
	for <lists+linux-clk@lfdr.de>; Tue,  8 Apr 2025 19:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29728253B4A;
	Tue,  8 Apr 2025 19:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bS2T6yhQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6004224889A
	for <linux-clk@vger.kernel.org>; Tue,  8 Apr 2025 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141053; cv=none; b=V3F7NX2oa/WV8xZ/8IogZUxaeuFT7JFcpNmHeb6WfyWjPF9u1l1y7xArmhSNifT6fqgDqfmdJNl9vE70motMTyjMvp2iw9NLY0pFT+ZEdt4BZThZmBGsUcC5CTBeZuqavas2vDWfLI03jKYcyeXqUY1cnpG++gxKrJL73gUXVcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141053; c=relaxed/simple;
	bh=3UEGQybMIzCIb/fK6BHx3wjM28c2EMUIg2D2eyuMdKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRZfIrZhC6l8HD0C0i0SorkdQYJGa0cVlS11+NLmQQsyzfyl1Vqc3QwtcdDf/FZPiCBQHmGNPfWuV1YTySTFLx/OBGthKH+Aeb+SU8LVaO4EvPzdiU10KyO9VJYmK+EhmqdNCtzdOvV6vWBG9zfb+b8N1KLMLVvMpcbnwi90z1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bS2T6yhQ; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85df99da233so525607839f.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Apr 2025 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141050; x=1744745850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmV03+3+73PF3Wnm576GGuQSs6MRwFfeF314mocZSr4=;
        b=bS2T6yhQM5V9SH8BeCcYK3+4+ZtkG5UgiVTVCY5xZERNtOBUUlWeGob/jeHqDafBS3
         PfJpr0WWL8dCRchcr3e1bpWuJeDA0hv+LxIE5t1jtAV3DNPN8edQKK5WK8xl3J7ClQng
         OhC3yjvXmIdAh8wKjryNvD92Oj1JllrHUqJL3ZwUl4q+lZd+poo5l+/IewTO3aKYrBGe
         t1J4sUnOTJTAE/ffbaLAhBizuc9nQLp2QBFJ/QaX25IXUv78eThOidgAmHb7yQbiAqkd
         rtd97U6uD0vKFoxNVX/zQvnK2Q9F46OhocABchqAsmFaC2JC8aTPMzNsA3544/bRbF1V
         RRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141050; x=1744745850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmV03+3+73PF3Wnm576GGuQSs6MRwFfeF314mocZSr4=;
        b=P31OoyzYRbDH7syBYIoVLpie1uB7cQjhIyMQXPoDFwuy1jtVxNry7ulbN0JAtcrwrM
         /Dey8JsEMBpZz/kcg8XIKULbhM41jEIn3L5zBnPo3sowegsyVbt59fmOF9KHNH+YltW8
         xrAs26VAFS9qfZj9rlw93aL/WTHj7FO/WSBv28XLjmOyCeFG4M/hrDM64jeB1AV1Rm/2
         tIWknjyYdi5VUIS1rPXUT4zzZsSFalT9qp8MJh06f0nVdzOFuyLm6kMKpg7GfgydjM9m
         o1It0HrlgMhIbHspQEdkO5K+alkjy+ZfsFNpg6blLK6CjM0YsfAKHMO2uxEfAwamJy57
         q13A==
X-Forwarded-Encrypted: i=1; AJvYcCVLXMK6e2rgwAMdEXl+IUbwX2Orb0nyniMGFGHZfc+bLfQDepe3DccdoHVOITEGafh+lgDb4v7JGkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdFnVYnvnfY3xFBsBBYIY/4uEIUeLZRzHqo8uZxn/qPQFGveBH
	CUdSpWe92CiqySkbrYUrNDiEcskXGsRQvKi0Xdro/ad+T6ia0LvlD4ZewxVHR9Q=
X-Gm-Gg: ASbGncvnY4MVJpkBN8vT7Ua/EVbBkk2ebJq2bB/na5UtThNOD0gTnFXfMBMFJIIPXQ3
	n3oDFDtxjIfQcSx71+l8RebzqkBL4PbbRQQah8gqB0NWIWWSdXefkVE4NM9RerKLzTyI/QgrY7V
	fH98Oco0g5jWvdXg74icCnBmZDMm6Xkm64deG0F/O4SzBNglb5u+YxJUX76pSTu0y6OGFkxWyL9
	NpW2LQ7bHJb+2zrvqbfqh7DQGUhOfAL6zHBCztGW1F0qDDkxVPRTscCp4Cb4d/OJ9hj0F+yKHeh
	MHP//9Rh5hyAzpGeYn04wtRHIFwHybb6GTZuM/Z92mmOQEKnYsL1MiuVcdAFCkmCGrhMM6W9507
	7k1jxYJ6Z
X-Google-Smtp-Source: AGHT+IH0TSMJF+g/Z6xVX1/aYkm6TagQPlKzWAceXhcuRviJQOI+i72GhBsaY2XFvoCOzOyuaI7f0A==
X-Received: by 2002:a05:6602:4008:b0:85d:115b:bb3f with SMTP id ca18e2360f4ac-86161198b56mr61824839f.6.1744141050583;
        Tue, 08 Apr 2025 12:37:30 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e3aa0sm653506173.126.2025.04.08.12.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:30 -0700 (PDT)
Message-ID: <89385654-11bc-4cf0-b94e-15bf841ac215@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:29 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: spacemit: k1: Add TWSI8 bus and function
 clocks
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-5-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-5-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 12:24 PM, Haylen Chu wrote:
> The control register for TWSI8 clocks, APBC_TWSI8_CLK_RST, contains mux
> selection bits, reset assertion bit and enable bits for function and bus
> clocks. It has a quirk that reading always results in zero.
> 
> As a workaround, let's hardcode the mux value as zero to select
> pll1_d78_31p5 as parent and treat twsi8_clk as a gate, whose enable mask
> is combined from the real bus and function clocks to avoid the
> write-only register being shared between two clk_hws, in which case
> updates of one clk_hw zero the other's bits.
> 
> With a 1:1 factor serving as placeholder for the bus clock, the I2C-8
> controller could be brought up, which is essential for boards attaching
> power-management chips to it.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

Now that I understand why, I'm glad you put this into a separate
patch.  However I think you should make a note in the code to
indicate there's something different about this one clock.
People can then go back (with "git blame") to see the explanation
above.

Please consider adding such a comment in your next version.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/spacemit/ccu-k1.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cd95c4f9c127..5804c2f85407 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -397,6 +397,8 @@ CCU_MUX_GATE_DEFINE(twsi6_clk, twsi_parents, APBC_TWSI6_CLK_RST, 4, 3, BIT(1),
>   		    0);
>   CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents, APBC_TWSI7_CLK_RST, 4, 3, BIT(1),
>   		    0);
> +CCU_GATE_DEFINE(twsi8_clk, CCU_PARENT_HW(pll1_d78_31p5), APBC_TWSI8_CLK_RST,
> +		BIT(1) | BIT(0), 0);
>   
>   static const struct clk_parent_data timer_parents[] = {
>   	CCU_PARENT_HW(pll1_d192_12p8),
> @@ -528,6 +530,7 @@ CCU_GATE_DEFINE(twsi6_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI6_CLK_RST,
>   		BIT(0), 0);
>   CCU_GATE_DEFINE(twsi7_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI7_CLK_RST,
>   		BIT(0), 0);
> +CCU_FACTOR_DEFINE(twsi8_bus_clk, CCU_PARENT_HW(apb_clk), 1, 1);
>   
>   CCU_GATE_DEFINE(timers1_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TIMERS1_CLK_RST,
>   		BIT(0), 0);
> @@ -1059,6 +1062,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   	[CLK_TWSI5]		= &twsi5_clk.common.hw,
>   	[CLK_TWSI6]		= &twsi6_clk.common.hw,
>   	[CLK_TWSI7]		= &twsi7_clk.common.hw,
> +	[CLK_TWSI8]		= &twsi8_clk.common.hw,
>   	[CLK_TIMERS1]		= &timers1_clk.common.hw,
>   	[CLK_TIMERS2]		= &timers2_clk.common.hw,
>   	[CLK_AIB]		= &aib_clk.common.hw,
> @@ -1110,6 +1114,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   	[CLK_TWSI5_BUS]		= &twsi5_bus_clk.common.hw,
>   	[CLK_TWSI6_BUS]		= &twsi6_bus_clk.common.hw,
>   	[CLK_TWSI7_BUS]		= &twsi7_bus_clk.common.hw,
> +	[CLK_TWSI8_BUS]		= &twsi8_bus_clk.common.hw,
>   	[CLK_TIMERS1_BUS]	= &timers1_bus_clk.common.hw,
>   	[CLK_TIMERS2_BUS]	= &timers2_bus_clk.common.hw,
>   	[CLK_AIB_BUS]		= &aib_bus_clk.common.hw,


