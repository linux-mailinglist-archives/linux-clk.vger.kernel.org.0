Return-Path: <linux-clk+bounces-18598-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DB9A427B5
	for <lists+linux-clk@lfdr.de>; Mon, 24 Feb 2025 17:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF2F516D006
	for <lists+linux-clk@lfdr.de>; Mon, 24 Feb 2025 16:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8990A262D38;
	Mon, 24 Feb 2025 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NP7fB6XR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B42E263C86
	for <linux-clk@vger.kernel.org>; Mon, 24 Feb 2025 16:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740414027; cv=none; b=pY04qZWDAFJ82VSYb60snfilnlaNAQdB3oZs44BbsmJzdWHAe1uh+TPufqgcIws5ketNC24WCOGd1gpzelINS6Dz2E21iiIpgkSDXR1t03t3v4ryZm3nJnA6z2qC0sADWiI5isF/aglEhkCZ+LUIYHyW9vamtKK9o4lEypP4uK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740414027; c=relaxed/simple;
	bh=HOFhS+gsTTizkhOxEXwbo9veBSeS4vXwkzNTcSGkVIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpHft4r7Sk3w7ygQon/QmEVVCzpaX60/NGb3pXvKfgLsAkwrbpYMFlFyw/3d5JpnffN41WrmDz0ZpQ9vFo7ZMZQMh+6kNg2wA9ngkCMHtQcYWbo3XWO5kXAD4LkBiEaS8+QAov49PT3tQ1QXQJBdGvzYM5KSd6kof6+NipK1Ifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NP7fB6XR; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-727250dbf60so2385399a34.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Feb 2025 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740414025; x=1741018825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRHASzoS8B0V0Tmm5gNKYMeZ4qTMY1SwnDt+h3HpNgM=;
        b=NP7fB6XRRhYBZUsBgD+WAhDAR4jhASpyv2P5oU50F7fmHA3RVIz9eng8Ux6kcrKKD/
         E3Ypq5uYn7HU0eCsYd2j+tD8BzPJCPRwoPI4gc8qL1r831O/b8gncEeR9utuFqW8P18F
         B1EhbQ4lrnk9VCL2y8IC+NWeusB3dSXLqTYWoNw06bgbvUYEFi2tJmxgEgJttMf8rauf
         a3VH1zz0GWl+z7E02X58OlS8wJZC9pntOSvr1vp/UOpkrA/9LZB5jFGVuLKVXV7X6tYz
         /t+BCB1YkvyOWz6ZtpmYv5ggwa9sUEAEqu475kxt0PvRPqAuTp/W94cp8E9UsBDVGLgY
         fwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740414025; x=1741018825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRHASzoS8B0V0Tmm5gNKYMeZ4qTMY1SwnDt+h3HpNgM=;
        b=NtDfuIESefprZUOs3hWz1TCDoxeb12Lc5d9HgdAzWuqtaljQ80Lb/etD8HbdPZhAa6
         0dCQxagpy7bsq7mOWndn0ZUubt/YmWsJdFyumsy10bEScRbMInFNv09RSFGOpDCjuUQP
         BX4AMlMujxoBSfKQv1dEio+8H5I61CgJIk/AhzYUNTOx1kKZecKZaOL9c7A01HSN2Xf0
         UIWZkWhE9hyFe9SfSrm0kKzv8PypemInS51shBw7gnCzqRxvw6yxZ1CEY5Qjk9Q+oHLH
         dvFFII3OZ1xHhOJbbg7iGjO/y2Y7aE7Zm4wAEjDhbBvUdMCVbhrOrdnPLUUR6R18i++W
         33uA==
X-Forwarded-Encrypted: i=1; AJvYcCVLbDGb+kSTXfu739RJ/M9W5qth5ra/311N0CLSnKpyBmSshvhcDKnVGCNJM7TUW39fbEQ9tE3BDqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfKV4xU+ZgMHVWFU+WjZWlj7emIjl7e3OcP84siIAY1RveB7jt
	Z4Y7eOqdJIgNlV/2cCIXB40Xoh9Fu0PIOOA33JVbk3jdOL6Zi3YsO6AH6Sd/Z9s=
X-Gm-Gg: ASbGncvC3MI3+QXmjO6wEtV85XeUmp566fRDxGV9Ww4VdkuocahUWr3e0VTx31sKM9w
	Ozka+SW6ezjx1tn4ctz9JHbBOVepXHbQdJUhuBu8Um+ksqv5kg9ms6gn0+WR9YFH772NDZpbCsc
	R/aP9Hp6W/Nc6eTF7SqSv5SzNHbEHtCM+BFMqaNNCgDPnfCrA0gWi/npXvUa1b2hGdW7oBwgAHK
	rR1QrjLmHqYMHWghXmJ/N1xbEtLXObjm/oSLJvNUMq+XhX0hKavOGKk7z214TGrn0hAAkQMf7oH
	W8k+Cp2rTxn6GdgmEz8zxU0s/4xzGpFF4RKuovTa8gaT7lFpu/oM5i6joX3HTluBCQ==
X-Google-Smtp-Source: AGHT+IE6NCHf6XkzksgLtKxsYqizETbcAOrwL653/44Y8ua1Yg3RXdn0ZLinr6iybMw8EYmi8x8h9Q==
X-Received: by 2002:a05:6830:648e:b0:727:2fa8:c0e9 with SMTP id 46e09a7af769-7274bf9acb3mr9615704a34.2.1740414024890;
        Mon, 24 Feb 2025 08:20:24 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727378237e4sm2656892a34.47.2025.02.24.08.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:20:24 -0800 (PST)
Message-ID: <e66a3ac6-f997-4270-9e71-b3d7c26d63f2@riscstar.com>
Date: Mon, 24 Feb 2025 10:20:22 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/5] clk: bcm21664: Add matching bus clocks for
 peripheral clocks
To: Artur Weber <aweber.kernel@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, Stanislav Jakubek
 <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com>
 <20250216-kona-bus-clock-v1-4-e8779d77a6f2@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250216-kona-bus-clock-v1-4-e8779d77a6f2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/25 10:12 AM, Artur Weber wrote:
> Now that bus clock support has been implemented into the Broadcom Kona
> clock driver, add bus clocks corresponding to HUB_TIMER, SDIO, UART and
> BSC, as well as the USB OTG bus clock.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Other than the comment about the header from Rob, this looks
good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>
	
> ---
>   drivers/clk/bcm/clk-bcm21664.c       | 107 +++++++++++++++++++++++++++++++----
>   include/dt-bindings/clock/bcm21664.h |  19 ++++++-
>   2 files changed, 111 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-bcm21664.c b/drivers/clk/bcm/clk-bcm21664.c
> index 520c3aeb4ea9c4a431512c0909f9545c1761d17a..c9d15bde1d49c345c160880f72c96aea94dd9f55 100644
> --- a/drivers/clk/bcm/clk-bcm21664.c
> +++ b/drivers/clk/bcm/clk-bcm21664.c
> @@ -39,6 +39,11 @@ static struct peri_clk_data hub_timer_data = {
>   	.trig		= TRIGGER(0x0a40, 4),
>   };
>   
> +static struct bus_clk_data hub_timer_apb_data = {
> +	.gate		= HW_SW_GATE(0x0414, 18, 3, 2),
> +	.hyst		= HYST(0x0414, 10, 11),
> +};
> +
>   static struct ccu_data aon_ccu_data = {
>   	BCM21664_CCU_COMMON(aon, AON),
>   	.policy		= {
> @@ -47,7 +52,9 @@ static struct ccu_data aon_ccu_data = {
>   	},
>   	.kona_clks	= {
>   		[BCM21664_AON_CCU_HUB_TIMER] =
> -			KONA_CLK(aon, hub_timer, peri),
> +			KONA_CLK_PREREQ(aon, hub_timer, peri, hub_timer_apb),
> +		[BCM21664_AON_CCU_HUB_TIMER_APB] =
> +			KONA_CLK(aon, hub_timer_apb, bus),
>   		[BCM21664_AON_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
>   	},
>   };
> @@ -122,6 +129,26 @@ static struct peri_clk_data sdio4_sleep_data = {
>   	.gate		= HW_SW_GATE(0x0360, 18, 2, 3),
>   };
>   
> +static struct bus_clk_data sdio1_ahb_data = {
> +	.gate		= HW_SW_GATE(0x0358, 16, 0, 1),
> +};
> +
> +static struct bus_clk_data sdio2_ahb_data = {
> +	.gate		= HW_SW_GATE(0x035c, 16, 0, 1),
> +};
> +
> +static struct bus_clk_data sdio3_ahb_data = {
> +	.gate		= HW_SW_GATE(0x0364, 16, 0, 1),
> +};
> +
> +static struct bus_clk_data sdio4_ahb_data = {
> +	.gate		= HW_SW_GATE(0x0360, 16, 0, 1),
> +};
> +
> +static struct bus_clk_data usb_otg_ahb_data = {
> +	.gate		= HW_SW_GATE(0x0348, 16, 0, 1),
> +};
> +
>   static struct ccu_data master_ccu_data = {
>   	BCM21664_CCU_COMMON(master, MASTER),
>   	.policy		= {
> @@ -130,13 +157,13 @@ static struct ccu_data master_ccu_data = {
>   	},
>   	.kona_clks	= {
>   		[BCM21664_MASTER_CCU_SDIO1] =
> -			KONA_CLK(master, sdio1, peri),
> +			KONA_CLK_PREREQ(master, sdio1, peri, sdio1_ahb),
>   		[BCM21664_MASTER_CCU_SDIO2] =
> -			KONA_CLK(master, sdio2, peri),
> +			KONA_CLK_PREREQ(master, sdio2, peri, sdio2_ahb),
>   		[BCM21664_MASTER_CCU_SDIO3] =
> -			KONA_CLK(master, sdio3, peri),
> +			KONA_CLK_PREREQ(master, sdio3, peri, sdio3_ahb),
>   		[BCM21664_MASTER_CCU_SDIO4] =
> -			KONA_CLK(master, sdio4, peri),
> +			KONA_CLK_PREREQ(master, sdio4, peri, sdio4_ahb),
>   		[BCM21664_MASTER_CCU_SDIO1_SLEEP] =
>   			KONA_CLK(master, sdio1_sleep, peri),
>   		[BCM21664_MASTER_CCU_SDIO2_SLEEP] =
> @@ -145,6 +172,16 @@ static struct ccu_data master_ccu_data = {
>   			KONA_CLK(master, sdio3_sleep, peri),
>   		[BCM21664_MASTER_CCU_SDIO4_SLEEP] =
>   			KONA_CLK(master, sdio4_sleep, peri),
> +		[BCM21664_MASTER_CCU_SDIO1_AHB] =
> +			KONA_CLK(master, sdio1_ahb, bus),
> +		[BCM21664_MASTER_CCU_SDIO2_AHB] =
> +			KONA_CLK(master, sdio2_ahb, bus),
> +		[BCM21664_MASTER_CCU_SDIO3_AHB] =
> +			KONA_CLK(master, sdio3_ahb, bus),
> +		[BCM21664_MASTER_CCU_SDIO4_AHB] =
> +			KONA_CLK(master, sdio4_ahb, bus),
> +		[BCM21664_MASTER_CCU_USB_OTG_AHB] =
> +			KONA_CLK(master, usb_otg_ahb, bus),
>   		[BCM21664_MASTER_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
>   	},
>   };
> @@ -225,6 +262,38 @@ static struct peri_clk_data bsc4_data = {
>   	.trig		= TRIGGER(0x0afc, 19),
>   };
>   
> +static struct bus_clk_data uartb_apb_data = {
> +	.gate		= HW_SW_GATE_AUTO(0x0400, 16, 0, 1),
> +};
> +
> +static struct bus_clk_data uartb2_apb_data = {
> +	.gate		= HW_SW_GATE_AUTO(0x0404, 16, 0, 1),
> +};
> +
> +static struct bus_clk_data uartb3_apb_data = {
> +	.gate		= HW_SW_GATE_AUTO(0x0408, 16, 0, 1),
> +};
> +
> +static struct bus_clk_data bsc1_apb_data = {
> +	.gate		= HW_SW_GATE_AUTO(0x0458, 16, 0, 1),
> +	.hyst		= HYST(0x0458, 8, 9),
> +};
> +
> +static struct bus_clk_data bsc2_apb_data = {
> +	.gate		= HW_SW_GATE_AUTO(0x045c, 16, 0, 1),
> +	.hyst		= HYST(0x045c, 8, 9),
> +};
> +
> +static struct bus_clk_data bsc3_apb_data = {
> +	.gate		= HW_SW_GATE_AUTO(0x0470, 16, 0, 1),
> +	.hyst		= HYST(0x0470, 8, 9),
> +};
> +
> +static struct bus_clk_data bsc4_apb_data = {
> +	.gate		= HW_SW_GATE_AUTO(0x0474, 16, 0, 1),
> +	.hyst		= HYST(0x0474, 8, 9),
> +};
> +
>   static struct ccu_data slave_ccu_data = {
>   	BCM21664_CCU_COMMON(slave, SLAVE),
>          .policy		= {
> @@ -233,19 +302,33 @@ static struct ccu_data slave_ccu_data = {
>   	},
>   	.kona_clks	= {
>   		[BCM21664_SLAVE_CCU_UARTB] =
> -			KONA_CLK(slave, uartb, peri),
> +			KONA_CLK_PREREQ(slave, uartb, peri, uartb_apb),
>   		[BCM21664_SLAVE_CCU_UARTB2] =
> -			KONA_CLK(slave, uartb2, peri),
> +			KONA_CLK_PREREQ(slave, uartb2, peri, uartb2_apb),
>   		[BCM21664_SLAVE_CCU_UARTB3] =
> -			KONA_CLK(slave, uartb3, peri),
> +			KONA_CLK_PREREQ(slave, uartb3, peri, uartb3_apb),
>   		[BCM21664_SLAVE_CCU_BSC1] =
> -			KONA_CLK(slave, bsc1, peri),
> +			KONA_CLK_PREREQ(slave, bsc1, peri, bsc1_apb),
>   		[BCM21664_SLAVE_CCU_BSC2] =
> -			KONA_CLK(slave, bsc2, peri),
> +			KONA_CLK_PREREQ(slave, bsc2, peri, bsc2_apb),
>   		[BCM21664_SLAVE_CCU_BSC3] =
> -			KONA_CLK(slave, bsc3, peri),
> +			KONA_CLK_PREREQ(slave, bsc3, peri, bsc3_apb),
>   		[BCM21664_SLAVE_CCU_BSC4] =
> -			KONA_CLK(slave, bsc4, peri),
> +			KONA_CLK_PREREQ(slave, bsc4, peri, bsc4_apb),
> +		[BCM21664_SLAVE_CCU_UARTB_APB] =
> +			KONA_CLK(slave, uartb_apb, bus),
> +		[BCM21664_SLAVE_CCU_UARTB2_APB] =
> +			KONA_CLK(slave, uartb2_apb, bus),
> +		[BCM21664_SLAVE_CCU_UARTB3_APB] =
> +			KONA_CLK(slave, uartb3_apb, bus),
> +		[BCM21664_SLAVE_CCU_BSC1_APB] =
> +			KONA_CLK(slave, bsc1_apb, bus),
> +		[BCM21664_SLAVE_CCU_BSC2_APB] =
> +			KONA_CLK(slave, bsc2_apb, bus),
> +		[BCM21664_SLAVE_CCU_BSC3_APB] =
> +			KONA_CLK(slave, bsc3_apb, bus),
> +		[BCM21664_SLAVE_CCU_BSC4_APB] =
> +			KONA_CLK(slave, bsc4_apb, bus),
>   		[BCM21664_SLAVE_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
>   	},
>   };
> diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
> index 7c7492742f3d4ca439236f2f352e432989409570..8d3e3796c72b02eace84dfb90d6264dee0297a33 100644
> --- a/include/dt-bindings/clock/bcm21664.h
> +++ b/include/dt-bindings/clock/bcm21664.h
> @@ -26,7 +26,8 @@
>   /* aon CCU clock ids */
>   
>   #define BCM21664_AON_CCU_HUB_TIMER		0
> -#define BCM21664_AON_CCU_CLOCK_COUNT		1
> +#define BCM21664_AON_CCU_HUB_TIMER_APB		1
> +#define BCM21664_AON_CCU_CLOCK_COUNT		2
>   
>   /* master CCU clock ids */
>   
> @@ -38,7 +39,12 @@
>   #define BCM21664_MASTER_CCU_SDIO2_SLEEP		5
>   #define BCM21664_MASTER_CCU_SDIO3_SLEEP		6
>   #define BCM21664_MASTER_CCU_SDIO4_SLEEP		7
> -#define BCM21664_MASTER_CCU_CLOCK_COUNT		8
> +#define BCM21664_MASTER_CCU_SDIO1_AHB		8
> +#define BCM21664_MASTER_CCU_SDIO2_AHB		9
> +#define BCM21664_MASTER_CCU_SDIO3_AHB		10
> +#define BCM21664_MASTER_CCU_SDIO4_AHB		11
> +#define BCM21664_MASTER_CCU_USB_OTG_AHB		12
> +#define BCM21664_MASTER_CCU_CLOCK_COUNT		13
>   
>   /* slave CCU clock ids */
>   
> @@ -49,6 +55,13 @@
>   #define BCM21664_SLAVE_CCU_BSC2			4
>   #define BCM21664_SLAVE_CCU_BSC3			5
>   #define BCM21664_SLAVE_CCU_BSC4			6
> -#define BCM21664_SLAVE_CCU_CLOCK_COUNT		7
> +#define BCM21664_SLAVE_CCU_BSC1_APB		7
> +#define BCM21664_SLAVE_CCU_BSC2_APB		8
> +#define BCM21664_SLAVE_CCU_BSC3_APB		9
> +#define BCM21664_SLAVE_CCU_BSC4_APB		10
> +#define BCM21664_SLAVE_CCU_UARTB_APB		11
> +#define BCM21664_SLAVE_CCU_UARTB2_APB		12
> +#define BCM21664_SLAVE_CCU_UARTB3_APB		13
> +#define BCM21664_SLAVE_CCU_CLOCK_COUNT		14
>   
>   #endif /* _CLOCK_BCM21664_H */
> 


