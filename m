Return-Path: <linux-clk+bounces-18779-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AC4A4AB02
	for <lists+linux-clk@lfdr.de>; Sat,  1 Mar 2025 13:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF5B3B95E5
	for <lists+linux-clk@lfdr.de>; Sat,  1 Mar 2025 12:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3561D5CDB;
	Sat,  1 Mar 2025 12:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="zTzeqQwC"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B438DDB
	for <linux-clk@vger.kernel.org>; Sat,  1 Mar 2025 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740833287; cv=none; b=NsDqHoEKMJw3A+DN7doKkGxxcyIuefdJxLxpF9hrT8JbJSSdW4Ovg0dWuubitf3DjCT/JZ3F0ps7LVR5M7olnu3dkpiSSSJ3wfY7RFZnCPPS4687Ex9zc983MSEzvo6Z8EKCU7PrhKCErgA2Wg/7HUwJqly4p6zptTwawuKXk4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740833287; c=relaxed/simple;
	bh=3MCj/WCvoWMoAc4bJMk7a306JBmP9qXA6McF5MDfN30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6XudRfQzdhv3+ez1Y5EUlen4jcd83TfrxzAZ8ejF4FeHPWtl3iFu+geBlSnnyoALw2RT9O5DpA5aCKE9uvh8OYGWU4TP6qNbfd60UU5z+ylOzKBkMUTBzclNq1lvya+L1FKti2buHxZ+5C+L642xfEEh9l6GtqVRPpx3yJTepA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=zTzeqQwC; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1740833279;
 bh=vlAHgpbS8ocJiIPCyubD8pMYmZoM/v7ggXzVGihd27E=;
 b=zTzeqQwCcJ3DgnR1jMreKMAnqZQfND/zFKTvzkkl92THMmYTUnIUB+8W2iSjhds+TYGNbNiJK
 Z+zncAJugc/6lgSP2eQb/yeAvtjmo3hmFfR+XkbWJ9VeSRkQFAF/+8F3ugx8eko5wG+ra0louzG
 dK0o2KA1udCrCuddrB60GdADwv9wGdE7znDJHsD8T2c8yUYTCUHazZwURJ71xUyAYOGvgI6oOdl
 tmeNB6eGK22j/G5ePIBq8a1w1jCOYntoqUj/rFFEkelkTnyzxL78ndDBxxF2ijkRtm0m7GF7vNg
 bBPwsBovX7ZBYn08wpfXa6sKl0qJxtZkNUuJYCdvJxxQ==
X-Forward-Email-ID: 67c301f890cf55d47dbe8d70
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9fd51bcb-3e6a-46b6-b1f7-ff16fa562d9e@kwiboo.se>
Date: Sat, 1 Mar 2025 13:47:47 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: rockchip: Add SDMMC/SDIO controllers for
 RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Frank Wang <frank.wang@rock-chips.com>,
 Shresth Prasad <shresthprasad7@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250301104250.36295-1-ziyao@disroot.org>
 <20250301104749.36423-1-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250301104749.36423-1-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2025-03-01 11:47, Yao Zi wrote:
> RK3528 features two SDIO controllers and one SD/MMC controller, describe
> them in devicetree. Since their sample and drive clocks are located in
> the VO and VPU GRFs, corresponding syscons are added to make these
> clocks available.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 62 ++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 5b334690356a..078c97fa1d9f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
> +#include <dt-bindings/reset/rockchip,rk3528-cru.h>
>  
>  / {
>  	compatible = "rockchip,rk3528";
> @@ -122,6 +123,16 @@ gic: interrupt-controller@fed01000 {
>  			#interrupt-cells = <3>;
>  		};
>  
> +		vpu_grf: syscon@ff340000 {
> +			compatible = "rockchip,rk3528-vpu-grf", "syscon";

vpu_grf is also used for gmac1, so should possible be a "syscon",
"simple-mfd", or have I misunderstood when to use simple-mfd ?

> +			reg = <0x0 0xff340000 0x0 0x8000>;
> +		};
> +
> +		vo_grf: syscon@ff360000 {
> +			compatible = "rockchip,rk3528-vo-grf", "syscon";

similar here, vo_grf is also used for gmac0.

> +			reg = <0x0 0xff360000 0x0 0x10000>;
> +		};
> +
>  		cru: clock-controller@ff4a0000 {
>  			compatible = "rockchip,rk3528-cru";
>  			reg = <0x0 0xff4a0000 0x0 0x30000>;
> @@ -251,5 +262,56 @@ uart7: serial@ffa28000 {
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		sdio0: mmc@ffc10000 {
> +			compatible = "rockchip,rk3528-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xffc10000 0x0 0x4000>;
> +			clocks = <&cru HCLK_SDIO0>,
> +				 <&cru CCLK_SRC_SDIO0>,
> +				 <&cru SCLK_SDIO0_DRV>,
> +				 <&cru SCLK_SDIO0_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <150000000>;
> +			resets = <&cru SRST_H_SDIO0>;
> +			reset-names = "reset";
> +			status = "disabled";
> +		};
> +
> +		sdio1: mmc@ffc20000 {
> +			compatible = "rockchip,rk3528-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xffc20000 0x0 0x4000>;
> +			clocks = <&cru HCLK_SDIO1>,
> +				 <&cru CCLK_SRC_SDIO1>,
> +				 <&cru SCLK_SDIO1_DRV>,
> +				 <&cru SCLK_SDIO1_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <150000000>;
> +			resets = <&cru SRST_H_SDIO1>;
> +			reset-names = "reset";
> +			status = "disabled";
> +		};
> +
> +		sdmmc: mmc@ffc30000 {
> +			compatible = "rockchip,rk3528-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xffc30000 0x0 0x4000>;
> +			clocks = <&cru HCLK_SDMMC0>,
> +				 <&cru CCLK_SRC_SDMMC0>,
> +				 <&cru SCLK_SDMMC_DRV>,
> +				 <&cru SCLK_SDMMC_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <150000000>;
> +			resets = <&cru SRST_H_SDMMC0>;
> +			reset-names = "reset";

Suggest adding default pinctrl props here:

  pinctrl-names = "default";
  pinctrl-0 = <&sdmmc_bus4>, <&sdmmc_clk>, <&sdmmc_cmd>, <&sdmmc_det>;

And possible also for sdio0 and sdio1.

Regards,
Jonas

> +			status = "disabled";
> +		};
>  	};
>  };


