Return-Path: <linux-clk+bounces-7902-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB78C901EBA
	for <lists+linux-clk@lfdr.de>; Mon, 10 Jun 2024 12:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF5C01C21AC5
	for <lists+linux-clk@lfdr.de>; Mon, 10 Jun 2024 10:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCAB75817;
	Mon, 10 Jun 2024 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Oxheru9T"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12B34F5EC
	for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2024 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013789; cv=none; b=Vl7IQF2mNe16l8+ggz91HihFC2HKpXDkD+HHcW3F3z0ngAqupe7Bk7v6MaUUaK4NXNQ+eGRZjSj+t8w5hrJHrXHyiF0G0c3mLxM8xhTDr3ypBnOXKnCWYWp4RuHcgPgnE5wSTlkz5fOOnax9JfVDDwWwsm4uDpNB2rsEm0SYkAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013789; c=relaxed/simple;
	bh=Y0iKmWiPBU29dga43VWbPXPzqrHpBYaGevVFmNGDUs4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=feHZpD/vo4t5sdO5wBXKdKHKXFj9E9HU4sZFvJgKOi9Z3KHfFvdd/9ccNngglNIc+UBSIiiBJtBcpjSysPgwsDa4wd8d6ohxelY456GnsjjiHW694RTcL8E1q1zTbweEDWZCuorkZ8x8Jg2pu5LgNnlRDLnQw+Nf7MntWlmRmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Oxheru9T; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e724bc466fso51962321fa.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2024 03:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718013784; x=1718618584; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b2i7+OYCl1YQYAYWvDNNXE/dtiCXGJ18nePxaYtt3mU=;
        b=Oxheru9TMZJnIA3rr4/MU6RUNrhMaZwtBJAj5q3p92FmvKuJ0ESuVV/pAcNNvM5Fa+
         TD7CmbF/A0I14CZIvzW3Mz961zoxyao6MedOzV8NeORwGgkz8NR3lXzFBjOSxYnrv1Iy
         b+NL/dresvjIoIlASO6XXE/80dLInlote71BrbMt+xvz0p3mexdrBMPYgx1MhG+SzISY
         fMOFvXKhCAh4Co0LZBqOj6vq5xiVreizgzBtlKdyDALHQPP+U7YVD7hg25O7wsX+hmRG
         zuPol8BBZvzUlW6O1210fUreEbtgLcAsQK+8h/G/C2N+J0qYg3piwdJpSaacv0VHAXsv
         00Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718013784; x=1718618584;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2i7+OYCl1YQYAYWvDNNXE/dtiCXGJ18nePxaYtt3mU=;
        b=XeOAEZ4mhrdu3XrHO8xcI2cGmlDeNbJaqdsPwY2bk5h0+aP5Wrp/dD9Bi/Bv3R7NwX
         TNXfTD/NnFLIFvtPF3M+BrGKuOjnTPcqaH4KyPyXyYsnpG5T0q7Yrs3GSti6omrst5I5
         ODe61rOGCmzE45p20bvbNM8T57jJFpI5Gmt3u5gSF28ezKe07e8STXlE5saETjAnHflg
         cD/A1FLgR2zrVgrsiL+9cPK0DR/GHzgnCc9/0eaGupC57rGVOYlxcH1IaPDT4gzVBr1z
         MMs7Ev+OCeQvQmdKmU0SPo2az29i8ZW0t6CT9tyvnIfOtuvakHb19aoorsyatU0LYosR
         rrSA==
X-Forwarded-Encrypted: i=1; AJvYcCWcbvMjg5px4q5EN8Twaoqsd+vYcHtUI6ICAqamrtPzFyGs+MiFa7cKNk3s7LMn+sJH2N+3INZE+wK5r1z2Qr8Sw9Aro2Y9PK3q
X-Gm-Message-State: AOJu0YyBI1EBpABmPkXbIAor7n5T94XRNDkunaqqjfOAmdo6K6zb6ote
	TT/INihKUDVgDO10IPULRzXMKC5LqxIMf+xTUFY8H+qkRez5mBPWuPcFUYb4H9M=
X-Google-Smtp-Source: AGHT+IHZ73Tpvv2Elpueal4JbazGDNuTQZMcJtVKElUURsboMYpgXqIw1Wja70T0IsIuzDJ+z0958A==
X-Received: by 2002:a2e:2202:0:b0:2eb:17fe:a14b with SMTP id 38308e7fff4ca-2eb17fea1b8mr52129051fa.3.1718013783395;
        Mon, 10 Jun 2024 03:03:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:afd3:66ee:5486:4249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4217f633f2asm63744345e9.28.2024.06.10.03.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:03:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: <neil.armstrong@linaro.org>,  <mturquette@baylibre.com>,
  <sboyd@kernel.org>,  <robh+dt@kernel.org>,
  <krzysztof.kozlowski+dt@linaro.org>,  <khilman@baylibre.com>,
  <martin.blumenstingl@googlemail.com>,  <jian.hu@amlogic.com>,
  <kernel@sberdevices.ru>,  <rockosov@gmail.com>,
  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/7] clk: meson: a1: pll: support 'syspll'
 general-purpose PLL for CPU clock
In-Reply-To: <20240515185103.20256-4-ddrokosov@salutedevices.com> (Dmitry
	Rokosov's message of "Wed, 15 May 2024 21:47:26 +0300")
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
	<20240515185103.20256-4-ddrokosov@salutedevices.com>
Date: Mon, 10 Jun 2024 12:03:02 +0200
Message-ID: <1jzfrtp12h.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 15 May 2024 at 21:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The 'syspll' PLL, also known as the system PLL, is a general and
> essential PLL responsible for generating the CPU clock frequency.
> With its wide-ranging capabilities, it is designed to accommodate
> frequencies within the range of 768MHz to 1536MHz.
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  drivers/clk/meson/a1-pll.c | 72 ++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/a1-pll.h |  6 ++++
>  2 files changed, 78 insertions(+)
>
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 60b2e53e7e51..286e83199d17 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -138,6 +138,76 @@ static struct clk_regmap hifi_pll = {
>  	},
>  };
>  
> +static const struct pll_mult_range sys_pll_mult_range = {
> +	.min = 32,
> +	.max = 64,
> +};
> +
> +static const struct reg_sequence sys_pll_init_regs[] = {
> +	{ .reg = ANACTRL_SYSPLL_CTRL1, .def = 0x01800000 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL2, .def = 0x00001100 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL3, .def = 0x10022300 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL4, .def = 0x00300000 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL0, .def = 0x01f18432 },

That last entry is clearly an hard coded rate being poked.
Drop it please

> +};
> +
> +static struct clk_regmap sys_pll = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.frac = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 19,
> +		},
> +		.l = {
> +			.reg_off = ANACTRL_SYSPLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.current_en = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 26,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL2,
> +			.shift   = 6,
> +			.width   = 1,
> +		},
> +		.range = &sys_pll_mult_range,
> +		.init_regs = sys_pll_init_regs,
> +		.init_count = ARRAY_SIZE(sys_pll_init_regs),
> +		/*
> +		 * The sys_pll clock is usually enabled and initialized in the
> +		 * bootloader stage. Additionally, the cpu_clk is connected to
> +		 * sys_pll. As a result, it is not allowed to initialize the
> +		 * cpu_clk again, as doing so would prevent the CPU from
> +		 * executing any instructions.
> +		 */
> +		.flags = CLK_MESON_PLL_NOINIT_ENABLED,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "sys_pll",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_names = (const char *[]){ "syspll_in" },
> +		.num_parents = 1,
> +	},
> +};
> +
>  static struct clk_fixed_factor fclk_div2_div = {
>  	.mult = 1,
>  	.div = 2,
> @@ -283,6 +353,7 @@ static struct clk_hw *a1_pll_hw_clks[] = {
>  	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
>  	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
>  	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
> +	[CLKID_SYS_PLL]		= &sys_pll.hw,
>  };
>  
>  static struct clk_regmap *const a1_pll_regmaps[] = {
> @@ -293,6 +364,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
>  	&fclk_div5,
>  	&fclk_div7,
>  	&hifi_pll,
> +	&sys_pll,
>  };
>  
>  static struct regmap_config a1_pll_regmap_cfg = {
> diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
> index 4be17b2bf383..666d9b2137e9 100644
> --- a/drivers/clk/meson/a1-pll.h
> +++ b/drivers/clk/meson/a1-pll.h
> @@ -18,6 +18,12 @@
>  #define ANACTRL_FIXPLL_CTRL0	0x0
>  #define ANACTRL_FIXPLL_CTRL1	0x4
>  #define ANACTRL_FIXPLL_STS	0x14
> +#define ANACTRL_SYSPLL_CTRL0	0x80
> +#define ANACTRL_SYSPLL_CTRL1	0x84
> +#define ANACTRL_SYSPLL_CTRL2	0x88
> +#define ANACTRL_SYSPLL_CTRL3	0x8c
> +#define ANACTRL_SYSPLL_CTRL4	0x90
> +#define ANACTRL_SYSPLL_STS	0x94
>  #define ANACTRL_HIFIPLL_CTRL0	0xc0
>  #define ANACTRL_HIFIPLL_CTRL1	0xc4
>  #define ANACTRL_HIFIPLL_CTRL2	0xc8

-- 
Jerome

