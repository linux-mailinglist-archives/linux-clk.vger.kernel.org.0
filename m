Return-Path: <linux-clk+bounces-1354-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C179811FB2
	for <lists+linux-clk@lfdr.de>; Wed, 13 Dec 2023 21:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 110CAB20C93
	for <lists+linux-clk@lfdr.de>; Wed, 13 Dec 2023 20:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AA87E548;
	Wed, 13 Dec 2023 20:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmFJ+UNp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66014C9;
	Wed, 13 Dec 2023 12:07:24 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c317723a8so63978685e9.3;
        Wed, 13 Dec 2023 12:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702498043; x=1703102843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gsu3q13MvDpE/CGXMPYCWwJtd9OUgwH5TkWvsm2e2cA=;
        b=MmFJ+UNppUWxNTHj/tS7v/ct3AjdddJkI7rwYJjgACVwpImj3ljY4OypC6k6pZwfdN
         E+DsM80nkSKC+MOGnziALObRa64yhHE9wHjAdLu1WAAAuFx2JQ53XCsqNw7x6PhqDdXU
         28eSeMYvGzA04xJ58OBdu1GH+mvAJDlx7O4/6Yxpm2LzyTDgjS+xde+Y8HiawKPGqG12
         j/Qhe2+8bMOTXZAB4BLcgIf842zUT4DiAGa/BTJhH72sEmqFN9AAg+RIuYiRnEumVB/k
         qwyDAbAjXcfpEnvO+BhfLLkmgTTcaWG/oaIivs9BywsWoy6S9MgvYvg6nYs2mh69rNKJ
         T7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702498043; x=1703102843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gsu3q13MvDpE/CGXMPYCWwJtd9OUgwH5TkWvsm2e2cA=;
        b=LysvFYfyvxJvL1s+WYzBvcJZpeZ3Zxm7oyw/V/AO6lyrn21TCpl9gsDr/lsjxa/kPf
         V1Bdwst1TbzQIQyAXvBRCTkntZyRjlOuAVSkjPZWNgsewDabbxL7r9gAH9oEGfoY8bHq
         FYyqSq8gmYb2sDsy23HcehuV9LCN54hDqbcuk6CxJn1JeUZZOmPlWJM9/EtLe5dqH6Kq
         7chtXo066XbKQv2+mHYDSmaAIvJ5Ku5j4+ewiT7mrE+xyiBrtfPi3s2UWQEICsXG1mUJ
         EHhaykxAgXof2xf44DUhFZWaKi+3wEKSWUM8vBdXpkhyHxXmVo7SwKDnWZs9bqejXIpI
         /lDQ==
X-Gm-Message-State: AOJu0YxXSFTya2ee17bh2V8+JvngkG/QCz9+X0m8p8R/B5A7a2gladEg
	IxWiVQC3vmg4dddS4NhXKtBkGMWs2yU=
X-Google-Smtp-Source: AGHT+IHXFAhPhkQlTGwETgEwQJ0+N7+UNA2cm4OrTmck51BAJtoT4bV4BK2nZBlfQ3MZpCxFuPiTkg==
X-Received: by 2002:a05:600c:81b:b0:40b:5e59:c590 with SMTP id k27-20020a05600c081b00b0040b5e59c590mr4312661wmp.186.1702498042479;
        Wed, 13 Dec 2023 12:07:22 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm15195843wmo.22.2023.12.13.12.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:07:21 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject:
 Re: [PATCH v7 3/7] ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
Date: Wed, 13 Dec 2023 21:07:20 +0100
Message-ID: <2169265.irdbgypaU6@archlinux>
In-Reply-To: <20231122141426.329694-4-paul.kocialkowski@bootlin.com>
References:
 <20231122141426.329694-1-paul.kocialkowski@bootlin.com>
 <20231122141426.329694-4-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Paul!

Sorry for late reply.

On Wednesday, November 22, 2023 3:14:21 PM CET Paul Kocialkowski wrote:
> MIPI CSI-2 is supported on the V3s with an A31-based MIPI CSI-2 bridge
> controller. The controller uses a separate D-PHY, which is the same
> that is otherwise used for MIPI DSI, but used in Rx mode.
> 
> On the V3s, the CSI0 controller is dedicated to MIPI CSI-2 as it does
> not have access to any parallel interface pins.
> 
> Add all the necessary nodes (CSI0, MIPI CSI-2 bridge and D-PHY) to
> support the MIPI CSI-2 interface.
> 
> Note that a fwnode graph link is created between CSI0 and MIPI CSI-2
> even when no sensor is connected. This will result in a probe failure
> for the controller as long as no sensor is connected but this is fine
> since no other interface is available.
> 
> The interconnects property is used to inherit the proper DMA offset.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> index 506e98f4f69d..d57612023aa4 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> @@ -621,6 +621,77 @@ gic: interrupt-controller@1c81000 {
>  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>  		};
>  
> +		csi0: camera@1cb0000 {
> +			compatible = "allwinner,sun8i-v3s-csi";
> +			reg = <0x01cb0000 0x1000>;
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_CSI1_SCLK>,
> +				 <&ccu CLK_DRAM_CSI>;
> +			clock-names = "bus", "mod", "ram";
> +			resets = <&ccu RST_BUS_CSI>;
> +			interconnects = <&mbus 5>;
> +			interconnect-names = "dma-mem";

As far as I can see, interconnects are not documented in
allwinner,sun6i-a31-csi.yaml. Please run make dtbs_check on this.

Best regards,
Jernej

> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					csi0_in_mipi_csi2: endpoint {
> +						remote-endpoint = <&mipi_csi2_out_csi0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		mipi_csi2: csi@1cb1000 {
> +			compatible = "allwinner,sun8i-v3s-mipi-csi2",
> +				     "allwinner,sun6i-a31-mipi-csi2";
> +			reg = <0x01cb1000 0x1000>;
> +			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_CSI1_SCLK>;
> +			clock-names = "bus", "mod";
> +			resets = <&ccu RST_BUS_CSI>;
> +			status = "disabled";
> +
> +			phys = <&dphy>;
> +			phy-names = "dphy";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				mipi_csi2_in: port@0 {
> +					reg = <0>;
> +				};
> +
> +				mipi_csi2_out: port@1 {
> +					reg = <1>;
> +
> +					mipi_csi2_out_csi0: endpoint {
> +						remote-endpoint = <&csi0_in_mipi_csi2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dphy: d-phy@1cb2000 {
> +			compatible = "allwinner,sun6i-a31-mipi-dphy";
> +			reg = <0x01cb2000 0x1000>;
> +			clocks = <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_MIPI_CSI>;
> +			clock-names = "bus", "mod";
> +			resets = <&ccu RST_BUS_CSI>;
> +			allwinner,direction = "rx";
> +			status = "disabled";
> +			#phy-cells = <0>;
> +		};
> +
>  		csi1: camera@1cb4000 {
>  			compatible = "allwinner,sun8i-v3s-csi";
>  			reg = <0x01cb4000 0x3000>;
> 





