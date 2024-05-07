Return-Path: <linux-clk+bounces-6776-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0E98BDF7C
	for <lists+linux-clk@lfdr.de>; Tue,  7 May 2024 12:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0151C1F223EA
	for <lists+linux-clk@lfdr.de>; Tue,  7 May 2024 10:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A814414EC4B;
	Tue,  7 May 2024 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ronazVYD"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A1A14E2F0
	for <linux-clk@vger.kernel.org>; Tue,  7 May 2024 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076820; cv=none; b=DS3BEEQmgWk/MPW5rPbeVV+0QXjisHwE/PBS78wth2NFvsjHRjnRIxmzHuPGk6FE+iEMGUIT9YnQ42bx4L+viAi8Y7u71bVz3MTTsOqdorJi4wdmwfJJ2ZXGamLdNkYZHA4xevDoCbEqrCKlBEAiDmtEz1cclbG067XwLaJuQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076820; c=relaxed/simple;
	bh=m3tCofB4NMIGnHABhiBunpQUZgNSb7hU8zxpgMZ6Rz8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGrKADOYoVqtF3PjWgpvfZunBH0Y858FxgbDtGZPyNXPl6SZijFbyitEcP2Fq7uhQmM2xfAGLH4khwJLhul4dLwQCf2zQImHMOQWaACkaoeF5VMVgJ+wON34Y0VeXmW0ggExiJNzrJE9/GGtbBCZzjurTFcgjC/8J9IljG+Re0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ronazVYD; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DC25540098
	for <linux-clk@vger.kernel.org>; Tue,  7 May 2024 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1715076816;
	bh=397X4zZ5qk6cmfxvJ66g5Oe/KXHQi7SbJr6mL/vXFTk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ronazVYDfRESfDFXThriTvfHZoKRxPX56aJndWDCsD1z5uV5mxyFZHJeDCrhmXkS0
	 WkLuCqU2a1yFJXvV5NNiq5Me4ofaWwLtxladK+rwGJEOZJvmgfupqzyEJStrEJ0S/9
	 VZIWjIwaqwDR4SRDflhUfrEidRSS/+OuhU8iLkYnaYGFzNXhR+LRiESis0a2BWw0g6
	 bb3dfK87xEW3tkh5kV5DYLfCfYUOIsTZdyaKZVqIZjVPhwXuwLyqWPfz//ZmV0nMEq
	 jiFloOdblr8AWRwSXB6yjBV3utsh5QpU10gaYsmaqqH+M6fSOTY5Amc7GQHaVNY246
	 GCgiSUWEoKaQg==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-43d245bfdb9so39132071cf.1
        for <linux-clk@vger.kernel.org>; Tue, 07 May 2024 03:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076816; x=1715681616;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=397X4zZ5qk6cmfxvJ66g5Oe/KXHQi7SbJr6mL/vXFTk=;
        b=XcqYb8d6LjUpH68HbLH3+mKr+xfUrztsLf9ROGOX86uUrxLGvY4HX+g36Q/UmGRbMA
         bNzzFeG2WvlMPB2y8D1QHt3kLtvYsv0YBNbLVtIQ93uR6iy1keg1W6FubXDc1A8KfK3n
         UtKYs7vtw2MnZfFrA9EbKlahoRC7Xz4KHJr9EIYy2CyZT7IjaJGd1XTGEz2GufSzHoY8
         Dt1FOrJOloSJYyKlkFoJ/o6z4A5/mCJOxtPDIfwAr/QNW2yaj7PuHT+vVS6FkYCPzh0L
         49rABq8XBHarmxXzwflLAHc7D4e8FJ1ZLM1DDmHjW5PUldNSyqoWDyrc52JBTY5N4UGP
         SrGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwNAQmbWLjbxQ7DOR0h2Ekamf0vQelHGBVXVYwTun78hWb7PFMnJ/gn0imW52NNZJzL++YQ/F+MDWiQMwDSdwwGxz77uG7feBB
X-Gm-Message-State: AOJu0YyCiv4N8iJV1p6QIc1sn5pwrwqj4yuSW7VX+4O+lu5Oq1btmpyI
	IU/+mNBFDHgW0de8fEwA49IOueie3inS9zfJjSOBPdFH8scvTblEogkpMP1zClomwuD/I3T7tjV
	65mdHLbCjcXoUbSZN9XjfJ85ZHtVzmRYlq2as4OZfQjWI8oI1Z3o3yt4D9Svx4dhioNP24uZr/m
	oJubsB6fCKCwQrsAQ1ljyjMi3EfbmQx8n0LiOqj6ODMOzFPCMj
X-Received: by 2002:a05:622a:4e0b:b0:43a:712a:bb97 with SMTP id dh11-20020a05622a4e0b00b0043a712abb97mr15579362qtb.7.1715076816027;
        Tue, 07 May 2024 03:13:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjgVEjWFG0Er1wzm6XME0OZo9sKv/t6H0/VJqg3xbQh7tYq4BfD/1KVLjHaQMTeCkQMWpcnkGoRTUTZ7VYW1c=
X-Received: by 2002:a05:622a:4e0b:b0:43a:712a:bb97 with SMTP id
 dh11-20020a05622a4e0b00b0043a712abb97mr15579347qtb.7.1715076815802; Tue, 07
 May 2024 03:13:35 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 May 2024 03:13:35 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240507065319.274976-3-xingyu.wu@starfivetech.com>
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com> <20240507065319.274976-3-xingyu.wu@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Tue, 7 May 2024 03:13:35 -0700
Message-ID: <CAJM55Z-p9OLYCWHzhQ9HJ3vEt+u-qx0kxcWmGnO8FoarxJQiQQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] riscv: dts: starfive: visionfive-2: Fix lower rate
 of CPUfreq by setting PLL0 rate to 1.5GHz
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Xingyu Wu wrote:
> CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
> But now PLL0 rate is 1GHz and the cpu frequency loads become
> 333/500/500/1000MHz in fact.
>
> The PLL0 rate should be default set to 1.5GHz and set the
> cpu_core rate to 500MHz in safe.
>
> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110 SoC")
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

This should really be based on Conor's riscv-dt-for-next branch, eg. the change
should be to the new jh7110-common.dtsi instead since the Milk-V Mars board
would most likely also benefit from this change.

In any case:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi     | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 45b58b6f3df8..28981b267de4 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -390,6 +390,12 @@ spi_dev0: spi@0 {
>  	};
>  };
>
> +&syscrg {
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> +			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> +	assigned-clock-rates = <500000000>, <1500000000>;
> +};
> +
>  &sysgpio {
>  	i2c0_pins: i2c0-0 {
>  		i2c-pins {
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

