Return-Path: <linux-clk+bounces-27373-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93503B45C49
	for <lists+linux-clk@lfdr.de>; Fri,  5 Sep 2025 17:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13E3B5E26A2
	for <lists+linux-clk@lfdr.de>; Fri,  5 Sep 2025 15:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8832F7AD1;
	Fri,  5 Sep 2025 15:14:43 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B5E2F7ACB;
	Fri,  5 Sep 2025 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757085283; cv=none; b=qGgfLHeoKohziFcMhjHtj7bjRTMhzqjvG7j+B+aXDo0TlAK7UMw6kUMXexKBHSGI2trirqaB7oeJqTXFaxvXo41W04RUfZ80+sw0qCOdBrwzWHBCemcxr9s2IpZBx9X3zhyXch8O6IbIJwqiURRH9kX2/Nv9AE08rFOgQ2J7ye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757085283; c=relaxed/simple;
	bh=YBoQ0jb9BkWrIvQ0QHQzRC1HHRALUcH/V91HeU2Y3mc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXATZCaqlEKh25IARShIic/aMbL/nnonFVzuXsMQH6KvptFRnVUvSEuaQWrBdUpaDg3/KSrnnSQS+4OOSQqWU0Xn9bbDhYbokCzTculVKUwlcmIcIZgIbicKtb5f1Rh9fKTgHRL1aJHQVnSBwejUYnxVIqSHylEVD+J97ySSJMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72134152B;
	Fri,  5 Sep 2025 08:14:33 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAEA23F6A8;
	Fri,  5 Sep 2025 08:14:39 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:14:37 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel
 Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: allwinner: a523: Add MCU PRCM CCU node
Message-ID: <20250905161437.1a164745@donnerap>
In-Reply-To: <20250830170901.1996227-8-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
	<20250830170901.1996227-8-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 31 Aug 2025 01:09:00 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> Add a device node for the third supported clock controller found in the
> A523 / T527 SoCs. This controller has clocks and resets for the RISC-V
> MCU, and others peripherals possibly meant to operate in low power mode
> driven by the MCU, such as audio interfaces, an audio DSP, and the NPU.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 79bd9ce08c7c..b6e82d53af54 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -4,8 +4,10 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/sun6i-rtc.h>
>  #include <dt-bindings/clock/sun55i-a523-ccu.h>
> +#include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
>  #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
>  #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
>  #include <dt-bindings/power/allwinner,sun55i-a523-pck-600.h>
> @@ -825,6 +827,29 @@ rtc: rtc@7090000 {
>  			clock-names = "bus", "hosc", "ahb";
>  			#clock-cells = <1>;
>  		};
> +
> +		mcu_ccu: clock-controller@7102000 {
> +			compatible = "allwinner,sun55i-a523-mcu-ccu";
> +			reg = <0x7102000 0x164>;

There is a register at 0x164, and even though the Linux driver doesn't use
it, we should let the region cover it. Maybe even going to 0x200?

The clock names match up with those .fw_name used in the driver, so with
the region size fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +			clocks = <&osc24M>,
> +				 <&rtc CLK_OSC32K>,
> +				 <&rtc CLK_IOSC>,
> +				 <&ccu CLK_PLL_AUDIO0_4X>,
> +				 <&ccu CLK_PLL_PERIPH0_300M>,
> +				 <&ccu CLK_DSP>,
> +				 <&r_ccu CLK_R_AHB>,
> +				 <&ccu CLK_MBUS>;
> +			clock-names = "hosc",
> +				      "losc",
> +				      "iosc",
> +				      "pll-audio0-4x",
> +				      "pll-periph0-300m",
> +				      "dsp",
> +				      "r-ahb",
> +				      "mbus";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
>  	};
>  
>  	thermal-zones {


