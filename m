Return-Path: <linux-clk+bounces-18031-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F47A35C42
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2025 12:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B40BA16F2F8
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2025 11:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B42525EFAA;
	Fri, 14 Feb 2025 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yx/B4F3N"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B9425A652
	for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739531718; cv=none; b=sGH/Zznz+hcqIwSdPa33i5Zn7b3Si58VKm/o/5F9lWlRWR/gbjvqeVzKcXhXHJaWD0t2w+ee+8ybvHneg9q4FAjAfo1rzAa1XfLwWnIKR4/efrMYz+Lw8v0nfpRqUYChsKuTBl43SPcE+l1Dig2/NiHPpU+eiypsvVja7zUfwaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739531718; c=relaxed/simple;
	bh=Byc7coW9dudIXZ8IkgWh7fAF1R3OFkHSFllItq8iXtM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bYhc0/u4sy1QS9MrpfPtfP/cUajrEOgY6VSBpA0rHcIR1BIhdAJOsFE3nx78zYtnFu7InfOi5tbC4zeHQsHs5Bm33XJqAKuJV4ELMJyG7rCsSi/ZiXFlz1ZiXTmiJuLKhxgUn5SGvyk8BBmuev3xi7alA2TtROrunfBn7ptiKrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yx/B4F3N; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso21178715e9.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 03:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739531715; x=1740136515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmEs8ouBliGOCMobju3l9AIdN9DwWGs50L/Ux0bkJ98=;
        b=yx/B4F3Ni1V58MQMZ0MeiyadUjq/XpVfwquVToTEyzdz/O4b0VWt7iNleWjmRrTqc/
         FD9Ma5ptv9FVmfFoHHoZ0bZEHupsfCtVGP7/tS9CnbT11ApvOJrROfU5868xG8BQsmU7
         XDVe3sp2hi79MC1w7LXlZOaMgPle6/VelUwg7MDCay2d0O3YrcrrXWmSY9Yu01Z6ib7M
         4RKRAljD7Zztfmuvsj1KxAPYbNnrBP5gZ3wA6fE7ZWmHCyuVXdbK76+kdZbOeraEG4jZ
         pc4vh/uYFJENeax8mLdgNUZMES2PNTnJvMItgeftBqJgTwBd5q5ciykGIjEj998w9/OX
         xZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531715; x=1740136515;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QmEs8ouBliGOCMobju3l9AIdN9DwWGs50L/Ux0bkJ98=;
        b=M9IF6OLP032G1D9E4nOens3OtKEYxetYbjZUolvlIIPG5drgq58OuvfTi7zo8HqEdn
         nZKiL43MmnYqYU37sMdZvP1UX+EoiBZ4awWU5sIt7B272oE1H0TMdXmMcjrB8bdOchyU
         gvLgBIdU196p2K60Gocb78qe1BGECOeBYnfpKfHKre6WNjkBCrKE84sCyMo/+XljahbK
         u82nu/kbTgvFeMzo/ahScMm6eTD+lYNdOpt6BitpYQmYWoMSLVDmFqKaYNVTNW0iK82o
         tL/sVCchVZ5dz5vhXsTGWGLwgRpFcYvT4/GxpRfUPyoHIZtmXIqJQLcd19gmGS3Ws7dw
         qGWg==
X-Forwarded-Encrypted: i=1; AJvYcCXFBJoPL7EtURzd2r3A2hil29jU1YmJ4ftSRLRMr6zxP18VToaKeUXpgsMyWiR/WX8vN9C/3rANtKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCPSxzTGYaQbpVj+ZMYKMOF3skM2wwxDOZL7d1U+JvehI6Aw5
	NReycT1LAxu9lGYpumUd5xCusiHtBgJJBNg+bXiU/3jtfq8ZvXjI9WD2gmQGYUM=
X-Gm-Gg: ASbGnctJwH9eYv7aFuUeWLrZd+8LHyDPlguPfID4IuadSt7ASnKR/CbrlMsvcAi9Y9x
	AgmCHAn31ck9SAHdmxScmaQB6NfeREf5MGXyXRgfKBRwa7qHAJc1ZPSHun9JRAA24yJdz8pXrUQ
	HAJ5AaUudI/bCC62GqCeFmfyk0fydkl7YeDi2vPbxLqql/TUBvNnrUAfHtP04w5t2KrEZC7jrPu
	YuL0JrwteoSLD0eAjvg3TF9UvOmbq8bwMb9+cUjdp2l2lMwJyvUzQdByir22/yvHo1WnOdgmscc
	fbfzmfxb/dQoaudPWuUoG6sAtyYq24vilybJvIVRl6NMVUszb1u/GqnyficslN0=
X-Google-Smtp-Source: AGHT+IH5QDoLnhR0CwlUWQfd6my7FcGNb6CjS78uJgkB/lJP1TtFLz/ksqBTEmg2Q8Mj2ObQDYbmrg==
X-Received: by 2002:a05:600c:783:b0:439:654e:ddf6 with SMTP id 5b1f17b1804b1-439654ede03mr61452765e9.9.1739531714673;
        Fri, 14 Feb 2025 03:15:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1506:c298:390c:8a? ([2a01:e0a:982:cbb0:1506:c298:390c:8a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617da91asm42409885e9.2.2025.02.14.03.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 03:15:14 -0800 (PST)
Message-ID: <d0ec285d-6a27-4f28-b622-6048a9dcb6e8@linaro.org>
Date: Fri, 14 Feb 2025 12:15:14 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: meson: g12a: Fix kernel warnings when no display
 attached
To: Martijn van Deventer <linux@martijnvandeventer.nl>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250213221702.606-1-linux@martijnvandeventer.nl>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250213221702.606-1-linux@martijnvandeventer.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/02/2025 23:17, Martijn van Deventer wrote:
> When booting SM1 or G12A boards without a dislay attached to HDMI,
> the kernel shows the following warning:
> 
> [CRTC:46:meson_crtc] vblank wait timed out
> WARNING: CPU: 2 PID: 265 at drivers/gpu/drm/drm_atomic_helper.c:1682 drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> CPU: 2 UID: 0 PID: 265 Comm: setfont Tainted: G         C
> Tainted: [C]=CRAP
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> lr : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> Call trace:
>   drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>   drm_atomic_helper_commit_tail_rpm+0x84/0xa0
>   commit_tail+0xa4/0x18c
>   drm_atomic_helper_commit+0x164/0x178
>   drm_atomic_commit+0xb4/0xec
>   drm_client_modeset_commit_atomic+0x210/0x270
>   drm_client_modeset_commit_locked+0x5c/0x188
>   drm_fb_helper_pan_display+0xb8/0x1d4
>   fb_pan_display+0x7c/0x120
>   bit_update_start+0x20/0x48
>   fbcon_switch+0x418/0x54c
>   el0t_64_sync+0x194/0x198
> 
> This happens when the kernel disables the unused clocks.
> Sometimes this causes the boot to hang.
> 
> By (re)adding the flag CLK_IGNORE_UNUSED to the VCLK2 clocks, these
> clocks will not be disabled.
> 
> This partially reverts commit b70cb1a21a54 ("clk: meson: g12a:
> make VCLK2 and ENCL clock path configurable by CCF").
> 
> Fixes: b70cb1a21a54 ("clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF").
> Signed-off-by: Martijn van Deventer <linux@martijnvandeventer.nl>
> ---
>   drivers/clk/meson/g12a.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index cfffd434e998..1651898658f5 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -3234,7 +3234,7 @@ static struct clk_regmap g12a_vclk2_div = {
>   			&g12a_vclk2_input.hw
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_GATE,
> +		.flags = CLK_SET_RATE_GATE | CLK_IGNORE_UNUSED,
>   	},
>   };
>   
> @@ -3270,7 +3270,7 @@ static struct clk_regmap g12a_vclk2 = {
>   		.ops = &meson_vclk_gate_ops,
>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>   	},
>   };
>   
> @@ -3354,7 +3354,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
>   		.ops = &clk_regmap_gate_ops,
>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>   	},
>   };
>   
> @@ -3368,7 +3368,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
>   		.ops = &clk_regmap_gate_ops,
>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>   	},
>   };
>   
> @@ -3382,7 +3382,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
>   		.ops = &clk_regmap_gate_ops,
>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>   	},
>   };
>   
> @@ -3396,7 +3396,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
>   		.ops = &clk_regmap_gate_ops,
>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>   	},
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

