Return-Path: <linux-clk+bounces-1356-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40908811FBE
	for <lists+linux-clk@lfdr.de>; Wed, 13 Dec 2023 21:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6326C1C20F5C
	for <lists+linux-clk@lfdr.de>; Wed, 13 Dec 2023 20:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC7B7E553;
	Wed, 13 Dec 2023 20:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgsigAG8"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE359D0;
	Wed, 13 Dec 2023 12:11:55 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3331752d2b9so4845617f8f.3;
        Wed, 13 Dec 2023 12:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702498314; x=1703103114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHZJxjE/63ZPQdMM7w++i0H3AQcrKC5RCaCrTHY5Njs=;
        b=ZgsigAG8jfJ+kBydniVf67BWA9G+Bz+wa0c39/hKxY3cBjYEhYK61Fm3aDmXcGjziv
         W29YYxIl1iJBqGdCgnRwOuwKFLvn52Lyw6tSDqOLjsQPtGaPhhl/up0GzAkZHCYTZzns
         OGwUw8CWq/xL0hvxKWY1yInqPZvm5tg1vSPewcJjhlzVYmujiUPWMyoF+jTaHsR83Jd6
         ADCtDa381Td0TdXurJZD3GGOfabXJluYgX2UzWcYzAK5H0yDyIidZ0NPQOawZwSpCtsy
         fbqz0AXlcq3dO9veM1ie8EgVUGN+ypYLGh89dLavTQCqcACh0sGoRHTEPxjeqXZw9Tvo
         zQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702498314; x=1703103114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHZJxjE/63ZPQdMM7w++i0H3AQcrKC5RCaCrTHY5Njs=;
        b=VQiNahbCl2+9hUekMWVVIpSl6zRkKBFEhMWbls9p4wbXgB+56BYkum3BMN97OfL8ps
         X6ltJ4irwRlC5Sg94ZD3JoLRHB06BPnrLWZK9EeKXt5ncUHy7WuIVT60iiOb8NHxolfB
         gJ/lERWR0OzFpzUT56zFswqX1k62YJCfpAMTYXNn+H/2ZR8Vw/E7VkmYii+OJWomT/cT
         0W8rZSUc2DzVaynvC85IdZl+RfkTBaO+QQ7yzICtR5gY7/I6LuQ/Z9JIVqPDlrv3hm0U
         /drkfUHxfVH0s+nm2ViBGbCzxQy899d4fxw097YsnNg/P8tzCkgJxO6E27LF1U+xarjl
         32JA==
X-Gm-Message-State: AOJu0YyRAIjlyld+36OBPjhaCoGBA0WVLlHpp2qfZvNz8uVr8pvisWe4
	1EEMZrCTHC0aq4E1BmHq7r0KUiL/9jM=
X-Google-Smtp-Source: AGHT+IHg04Gu69P+Oe4HgRL6vL95x2eltXYD3MsDq45X2kjtZUnpZ+853MUpjE5htvbO4NJbgu55tw==
X-Received: by 2002:a5d:4c4e:0:b0:336:30d8:a75f with SMTP id n14-20020a5d4c4e000000b0033630d8a75fmr1969785wrt.136.1702498314064;
        Wed, 13 Dec 2023 12:11:54 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d458a000000b00336463625c0sm100880wrq.51.2023.12.13.12.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:11:53 -0800 (PST)
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
 Re: [PATCH v7 5/7] ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
Date: Wed, 13 Dec 2023 21:11:52 +0100
Message-ID: <8310859.T7Z3S40VBb@archlinux>
In-Reply-To: <20231122141426.329694-6-paul.kocialkowski@bootlin.com>
References:
 <20231122141426.329694-1-paul.kocialkowski@bootlin.com>
 <20231122141426.329694-6-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, November 22, 2023 3:14:23 PM CET Paul Kocialkowski wrote:
> MIPI CSI-2 is supported on the A83T with a dedicated controller that
> covers both the protocol and D-PHY. It is connected to the only CSI
> receiver with a fwnode graph link. Note that the CSI receiver supports
> both this MIPI CSI-2 source and a parallel source.
> 
> An empty port with a label for the MIPI CSI-2 sensor input is also
> defined for convenience.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi | 43 +++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
> index 94eb3bfc989e..b74c3f9e6598 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
> @@ -1062,6 +1062,49 @@ csi: camera@1cb0000 {
>  			clock-names = "bus", "mod", "ram";
>  			resets = <&ccu RST_BUS_CSI>;
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					csi_in_mipi_csi2: endpoint {
> +						remote-endpoint = <&mipi_csi2_out_csi>;
> +					};
> +				};
> +			};
> +		};
> +
> +		mipi_csi2: csi@1cb1000 {
> +			compatible = "allwinner,sun8i-a83t-mipi-csi2";
> +			reg = <0x01cb1000 0x1000>;
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_CSI_SCLK>,
> +				 <&ccu CLK_MIPI_CSI>,
> +				 <&ccu CLK_CSI_MISC>;
> +			clock-names = "bus", "mod", "mipi", "misc";
> +			resets = <&ccu RST_BUS_CSI>;
> +			status = "disabled";
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
> +					mipi_csi2_out_csi: endpoint {
> +						remote-endpoint = <&csi_in_mipi_csi2>;
> +					};
> +				};
> +			};
>  		};
>  
>  		hdmi: hdmi@1ee0000 {
> 





