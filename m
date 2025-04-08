Return-Path: <linux-clk+bounces-20318-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE23A815EE
	for <lists+linux-clk@lfdr.de>; Tue,  8 Apr 2025 21:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07FFA448B0E
	for <lists+linux-clk@lfdr.de>; Tue,  8 Apr 2025 19:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3572254862;
	Tue,  8 Apr 2025 19:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tUWjlHU0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552AD253F36
	for <linux-clk@vger.kernel.org>; Tue,  8 Apr 2025 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141060; cv=none; b=RXQH4t5ZzYgts4EZM9O1aQqKsGWJ63uX0gfeVXp0U2lRKB0Gy5zuuahebynTi2H4/0WK4rBVKF0tXIzxCHxXfFxq7h2VtKr5xLUHSYaOzTaazDNI3Yiqvz1x/6j5mxKOd+4QTOOEFW7fxSpjmP1taUdY3plGpWc/YLKQf4C8wiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141060; c=relaxed/simple;
	bh=rVKeUcWubqSu6ZsfxRbi7N7hyuMsaoaOHtTFm6Zrf7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7Ts6iy0MzDUGkYBNTamqgN/I/g6+ai8ytoYXL321Fe4W4trE03VUoTbugZ/41EBakvyyy72vnuzHg39uTXGF46tEqM7C6HGfOYVTNER9FAc0fsEYKj2Pkkljr0SWnveQ84ly/IGYLLCsSeOuuuBgnKIrh4A8xV/cu3FfuJ3Mvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tUWjlHU0; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d4496a34cdso20014675ab.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Apr 2025 12:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141057; x=1744745857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RqTCyVarb3HOJMAA+PoO2FMbP6+BrxJ4VIEUqNGh+4=;
        b=tUWjlHU0jseg0svHBFiNSRfTs+KVZCtBz6VdgJQQ9SYYP9kvhuC5XAItAHZYGKJwH+
         6dx55PmP++IFWY2eR/QPlk5fWaVCcbpYYZnDxsvagcl9LFsRdCnORSDaziEM6NXr1Cj8
         hFS0KvJWccJ4Sx46MPJJMsh5sabUSZaOrfMlcrhAwnfkV6ZgFvYUfxsDtdVHfymksa+E
         D8T24+WEJW3226RrSXpi0Zpv3vpq5cCIwiiriQMXLN+CcOLP10iHUOpq5rVyrXagPcFm
         RT8XJzfC0S2M1+802mnRWMu0vp1+MxXQN3EByiHarBSVFdPztwIvp2tdHF3Fg/fVhb2E
         mf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141057; x=1744745857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RqTCyVarb3HOJMAA+PoO2FMbP6+BrxJ4VIEUqNGh+4=;
        b=hMLzRh7afPacQeyxjzfMBzFn9aBly4YDpNeOWEUQpNlqQLxRN2clnB2J97ckykhn11
         kO5yS6jNgCeA48dTjLdLqxfYxfbxNRc9QOO2qVAkRlMZwA7XSqaNWcPsd4ifD8luuUEI
         0C5ITHDB25xpvI13jzRJchL+UrW03m5S8MEyXpZC++DCTqmkICDYXnzjr+W6WAFy5l44
         4innN8vTyINfhIfLkM3BcwyHqjPlt9LWsNVmCXMaFNuOOecVi8gn/IQWlUBTAqIg07ry
         4yLNPDffqUVqw7peYUXNuuT76D3W1xuDOjXKnzrxevMr3D4dbOWs6OQSTnbuU/73ghRC
         Xl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVC//a0bnj7Mqjm9jpMRg8YED0D20Y/OMx76VmIDRZNSfZp9H82I2eWLvEUNP1uEQj3fivLNjTQ6qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmUp/LlNOshz2aYrli0bG6JKyzxYsEVfAPPWD2KYoMdq80fIvH
	tC0FNcXgwHIN4g0czAUETyWtqHJHLzXhmTgl6igqyjHOy0/NSkrmyhmXzuLm+/I=
X-Gm-Gg: ASbGncsKIk6B8/EUYTyK89rTJ9XzaMiZbZ0lLlkPHvLehSNAoHpVXwgLtxu5it1PfSi
	rTJhVnRDOz49VDYMuVnuvD5mG0sRHBdQV3BL3LKOV5zHIYUXO1BRojVJrHL6YwiRlg5WFUqQDdN
	yxdIM5rD3I1Z//KhnegFV2I9dPfulf3lGdVkVT+bnonlJQReyz1g91rqdYpB1w7ecxQ4J1+CAzs
	CEkuPybeJLHGbpG71F+ElUXrN5FWACJPnVmgnWAkvYVrcgdpz0x9We8g4nnaD169Ho4RdK2Y5c7
	9TJCzlYBgfNIJtb0KR+glv15W3OTlwjCYBV3ohy6irsnINXOv2QKyGvLW6avv4OMYC95GdcNHX8
	aDu6P7/no
X-Google-Smtp-Source: AGHT+IG7rW/jA34zO9YwR/Uhv4tZyavVt40Io0eZXrFxdcpUtJcFv8zQCXnlCLGlof0n9kin5siP+g==
X-Received: by 2002:a05:6e02:2587:b0:3d5:be65:34ac with SMTP id e9e14a558f8ab-3d776c807acmr2719605ab.2.1744141057452;
        Tue, 08 Apr 2025 12:37:37 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d703c0665esm5904485ab.50.2025.04.08.12.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:36 -0700 (PDT)
Message-ID: <e2c5c2c2-61a8-458d-8e95-521c5ea752f9@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:35 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] riscv: defconfig: enable clock controller unit
 support for SpacemiT K1
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
 <20250401172434.6774-7-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-7-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 12:24 PM, Haylen Chu wrote:
> Clock controller unit, or CCU, generates various clocks frequency for
> peripherals integrated in SpacemiT K1 SoC and is essential for normal
> operation. Let's enable it in defconfig.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>   arch/riscv/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0f7dcbe3c45b..011788d16d93 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -252,6 +252,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
>   CONFIG_CLK_SOPHGO_SG2042_PLL=y
>   CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
>   CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
> +CONFIG_SPACEMIT_CCU=y
> +CONFIG_SPACEMIT_K1_CCU=y

Maybe these could be specified with default values that
are based on the value of CONFIG_ARCH_SPACEMIT instead of
forcing them to be defined here?

					-Alex

>   CONFIG_SUN8I_DE2_CCU=m
>   CONFIG_SUN50I_IOMMU=y
>   CONFIG_RPMSG_CHAR=y


