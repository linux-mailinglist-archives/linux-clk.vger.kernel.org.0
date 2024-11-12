Return-Path: <linux-clk+bounces-14568-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA80A9C50D9
	for <lists+linux-clk@lfdr.de>; Tue, 12 Nov 2024 09:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AAFAB221CC
	for <lists+linux-clk@lfdr.de>; Tue, 12 Nov 2024 08:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB64D20B1E8;
	Tue, 12 Nov 2024 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cYQ4xslB"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DDF154456
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731400379; cv=none; b=JqIzcWoCsQoHDQWkCrQEAxrj9tiepW+dnEnj6Y+6a/7NsKblXdIaWTLbcjJw/6wBq3egTvvlzRuqaCgSg97uVsmv+cUcmtNUAm0mWjEvjGdAOQrdNEncr1aeZjHAeBpi2Eji/g9LshUyR9ZOGUiE3avyG2kXzl8CWmwgmB00RiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731400379; c=relaxed/simple;
	bh=uJwb0TTl57hPGZjoejoO6FoBrOxbaib0DxAlcH9leAk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=We0DHQTRy8PjvcSSJXzCzQ0bpryNoylbSfrVCjgTgn78KiSERCLN9fHG12Y6TzzuvARsNd1QULVJZ6Kp1egcKJRwAOMKbs36+4EBZeVKsb/lhuEc/0vORePN5nVdLYXYkU1NgPIgSncg8IdW2F3V/4UwdKFu5vFXg8Fl4uxLtLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cYQ4xslB; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so6744846e87.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 00:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400374; x=1732005174; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MpOmmhEgCIw/0RfkRHrc8gag9KJhea6HQz3Fc6gj8mk=;
        b=cYQ4xslBmppGQExwWde4gLw7a3viRGeKNT7Puohhd7drPZYaNGeQhATKlzmormZLZn
         +hdrBX26vl0NcpekepDCUCVysXWjQgt9W8QiAGj0B0XvWqwMzdrviArut6bt7srNwaan
         HWaUA+gaieKt9jLgNOb+EmK2NdvSSsxQOOZPPM24u5VjTtPTZaXL2yKQnz8G8RItnt9u
         X4JcVYqFtPWSvTdO5o6CUvUU8v0sOfnhuTLk0I6cAqdPWVatM1EE8giCyOvymJ1jcJze
         sRfmZ6UhZV2GLQly4JbzjV+YgbsaipMkksr193LK7YZbCmjGGrF5cLkSdoJZbdK3AXa4
         jbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400374; x=1732005174;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpOmmhEgCIw/0RfkRHrc8gag9KJhea6HQz3Fc6gj8mk=;
        b=q3lnR10RR2+alqXAWwixt1B0pp6kKiL9xxCDIYo2te3opZlL71sT5KRuBf/tjF7xai
         SYFznUI8EPTl7LUFcM44R5TVwbCwB6kkc4v1Id0KS/WO4fUJVBphLNjvg+mVHzWZDx4o
         8v0Jzd4sqYWmgRC8bbUACUBZ6DC4EmIy2o0Jvw9xEstV1g3uVrqalvdJy15kcL/GkStZ
         RvhpzjNL6kXWBEcduKxiW5/nuA7I7x4AE5jgZ/VseF16/QJEL3Fo3Bi294u5TW06CTWC
         tnDG28BiczRvUbieZJ9y8L775By2uFZeEOOgKXdriU/nOm3Y/XlVTi5gQlhCzduWmYMQ
         0SiA==
X-Forwarded-Encrypted: i=1; AJvYcCVWTYsVQaig6fZSATnbfvazWcQUaIJBg1R+KYzcAHD1gv0M+0bTQXj32LJZUGxMKwln5MSVKi2VSPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/No4VkwGX3P9zio3FRIOnUPmzZdZ1WUywIFFIN7rge9H0NEH
	FcC0xvD5GYgaUE8BmgawDfgX7W9nC4zmMBw1f/Ce65wFkeXJVN3HwBDAHaw9uaA=
X-Google-Smtp-Source: AGHT+IFDkMH3817tueatY05ODRpjlMk98rQ1z0j0irToOsmILa1mIIxBQeYG9cqGFBBCc961D8pddw==
X-Received: by 2002:a05:6512:2393:b0:53b:4bc0:72aa with SMTP id 2adb3069b0e04-53d862431b0mr7092845e87.34.1731400374216;
        Tue, 12 Nov 2024 00:32:54 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b053047dsm200262155e9.3.2024.11.12.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:32:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: meson: Fix failure of glitch-free mux
 switching
In-Reply-To: <20241111-fix_glitch_free-v2-2-0099fd9ad3e5@amlogic.com> (Chuan
	Liu via's message of "Mon, 11 Nov 2024 11:37:02 +0800")
References: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
	<20241111-fix_glitch_free-v2-2-0099fd9ad3e5@amlogic.com>
Date: Tue, 12 Nov 2024 09:32:53 +0100
Message-ID: <1j8qto3l8q.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 11 Nov 2024 at 11:37, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> glitch-free mux has two clock channels (channel 0 and channel 1) with
> the same configuration.Channel 0 of glitch-free mux is not only the
> clock source for the mux, but also the working clock for glitch free
> mux. Therefore, when glitch-free mux switches, it is necessary to ensure
> that channel 0 has a clock input, otherwise glitch free mux will not
> work and cannot switch to the target channel. So adding flag
> CLK_OPS_PARENT_ENABLE ensures that both channels 0 and 1 are enabled
> when mux switches.
>
> In fact, we just need to make sure that channel 0 is enabled. The
> purpose of CLK_OPS_PARENT_ENABLE may not be to solve our situation, but
> adding this flag does solve our current problem.
>
> Fixes: 84af914404db ("clk: meson: a1: add Amlogic A1 Peripherals clock
> controller driver")

Fix your mailer please

> Fixes: 14ebb3154b8f ("clk: meson: axg: add Video Clocks")
> Fixes: f06ac3ed04e8 ("clk: meson: c3: add c3 clock peripherals controller
> driver")
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Fixes: fac9a55b66c9 ("clk: meson-gxbb: Add MALI clocks")
> Fixes: 74e1f2521f16 ("clk: meson: meson8b: add the GPU clock tree")
> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC
> peripheral clock controller")

There is no reason to mix up so many things together.

> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/a1-peripherals.c |  4 ++--
>  drivers/clk/meson/axg.c            |  4 ++--
>  drivers/clk/meson/c3-peripherals.c |  2 +-
>  drivers/clk/meson/g12a.c           |  6 +++---
>  drivers/clk/meson/gxbb.c           |  6 +++---
>  drivers/clk/meson/meson8b.c        | 21 ++++++++++++++++++---
>  drivers/clk/meson/s4-peripherals.c | 12 ++++++------
>  7 files changed, 35 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index 7aa6abb2eb1f..4b9686916b17 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -489,7 +489,7 @@ static struct clk_regmap dspa_sel = {
>  			&dspa_b.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -635,7 +635,7 @@ static struct clk_regmap dspb_sel = {
>  			&dspb_b.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 1b08daf579b2..a1217dff40fa 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -1144,7 +1144,7 @@ static struct clk_regmap axg_vpu = {
>  			&axg_vpu_1.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1260,7 +1260,7 @@ static struct clk_regmap axg_vapb_sel = {
>  			&axg_vapb_1.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index 7dcbf4ebee07..4566c2aeeb19 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -1431,7 +1431,7 @@ static struct clk_regmap hcodec = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_data = hcodec_parent_data,
>  		.num_parents = ARRAY_SIZE(hcodec_parent_data),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d3539fe9f7af..4d3b064d09fc 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -2812,7 +2812,7 @@ static struct clk_regmap g12a_vpu = {
>  			&g12a_vpu_1.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -3105,7 +3105,7 @@ static struct clk_regmap g12a_vapb_sel = {
>  			&g12a_vapb_1.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -4039,7 +4039,7 @@ static struct clk_regmap g12a_mali = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = g12a_mali_parent_hws,
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 262c318edbd5..dfa9ffc61b41 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1132,7 +1132,7 @@ static struct clk_regmap gxbb_mali = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = gxbb_mali_parent_hws,
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1613,7 +1613,7 @@ static struct clk_regmap gxbb_vpu = {
>  			&gxbb_vpu_1.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1748,7 +1748,7 @@ static struct clk_regmap gxbb_vapb_sel = {
>  			&gxbb_vapb_1.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index e4b474c5f86c..0af76b527e5b 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1997,7 +1997,22 @@ static struct clk_regmap meson8b_mali = {
>  			&meson8b_mali_1.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		/*
> +		 * glitch-free mux has two clock channels (channel 0 and
> +		 * channel 1) with the same configuration.Channel 0 of
> +		 * glitch-free mux is not only the clock source for the mux,
> +		 * but also the working clock for glitch free mux. Therefore,
> +		 * when glitch-free mux switches, it is necessary to ensure that
> +		 * channel 0 has a clock input, otherwise glitch free mux will
> +		 * not work and cannot switch to the target channel. So adding
> +		 * flag CLK_OPS_PARENT_ENABLE ensures that both channels 0 and 1
> +		 * are enabled when mux switches.
> +		 *
> +		 * In fact, we just need to make sure that channel 0 is enabled.
> +		 * The purpose of CLK_OPS_PARENT_ENABLE may not be to solve our
> +		 * situation, but adding this flag does solve our current problem.
> +		 */
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -2252,7 +2267,7 @@ static struct clk_regmap meson8b_vpu = {
>  			&meson8b_vpu_1.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -2364,7 +2379,7 @@ static struct clk_regmap meson8b_vdec_1 = {
>  			&meson8b_vdec_1_2.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index c930cf0614a0..79e0240d58e6 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -1404,7 +1404,7 @@ static struct clk_regmap s4_mali_mux = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = s4_mali_parent_hws,
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1536,7 +1536,7 @@ static struct clk_regmap s4_vdec_mux = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = s4_vdec_mux_parent_hws,
>  		.num_parents = ARRAY_SIZE(s4_vdec_mux_parent_hws),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1656,7 +1656,7 @@ static struct clk_regmap s4_hevcf_mux = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = s4_hevcf_mux_parent_hws,
>  		.num_parents = ARRAY_SIZE(s4_hevcf_mux_parent_hws),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1774,7 +1774,7 @@ static struct clk_regmap s4_vpu = {
>  			&s4_vpu_1.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1989,7 +1989,7 @@ static struct clk_regmap s4_vpu_clkc_mux = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = s4_vpu_mux_parent_hws,
>  		.num_parents = ARRAY_SIZE(s4_vpu_mux_parent_hws),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -2115,7 +2115,7 @@ static struct clk_regmap s4_vapb = {
>  			&s4_vapb_1.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };

-- 
Jerome

