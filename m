Return-Path: <linux-clk+bounces-1358-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E689811FEA
	for <lists+linux-clk@lfdr.de>; Wed, 13 Dec 2023 21:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E6321C211C1
	for <lists+linux-clk@lfdr.de>; Wed, 13 Dec 2023 20:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F467E56C;
	Wed, 13 Dec 2023 20:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mt8vc5kU"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBBADC;
	Wed, 13 Dec 2023 12:26:35 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3333fbbeab9so6246411f8f.2;
        Wed, 13 Dec 2023 12:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702499194; x=1703103994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGV9ovWt1T0TxLyTUNl8lJVAhcl8IWinEHZFMqlV8R0=;
        b=mt8vc5kUaYve7mnwB4XE85KSX317GUxCnZiqCWNFf+RS7V7twcBVCTE7n9tt4NrJls
         6JO++SdyI+Q20x9jkIo9WnaoPWIDKFXx8TF8DT72nQdspDSAAUH6FHMWkABlLgThhr9H
         xP5NuT7hPkGzc6wODuL5wY50Lj2L4IF+EoYeoLt6Tk+uZloUdxa2qIGtyyGDrt0jVGZ+
         qF8hzfsN/JxkmFN5wEPOTiCIe4uGwm8XeHalmIBXJguTnhBNj9FGmT6c/YoGi+ptl5LM
         hsZGx2cSMq7xc/iTcxHZFvmQfaY3ERIlxF1TLh41hA5n3aVoLKgybXr3Gpt/+8svXb3q
         +Zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499194; x=1703103994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGV9ovWt1T0TxLyTUNl8lJVAhcl8IWinEHZFMqlV8R0=;
        b=gx28ZH4pxRt0jfu2wgrUOSsn19o4KukUqCT4M5JMJj7M3oFHbRyfYJyCkof7uq8P0T
         Ztc9ZnavUmPMxYcmeytZTQgnmHUX6G/hfix3jeMJ0djICImLfRySFIQoG66coctDr4EC
         hj5HHQFxAIDyBxP3NwXRAfTzxs2VtDXaPzlkh8wZAAH7Wt2wzuvbUNlEqzqtCVXYel7X
         w5C9lquZIjLRm5hPsb0Mo6OdcNNbqXzBgGqfwQO3HRJmSBMKPKt/ld15H4jsuphX1veN
         jPw06+P5scpnFmDEH4kzkSH/sAzCa8n9FgLbLbzVDnxbwBG7nqV87gLuqIc4X+5UlrC+
         jhvA==
X-Gm-Message-State: AOJu0YzifCWjYfTaSfUDCsQ0obIHE+iWQQkryeUlFkWrR5xIxg0C7sX6
	51rfeF9YuHJGatqtJLpldWASJZLBAVc=
X-Google-Smtp-Source: AGHT+IGCl2qoP1T/NnW43knX1fCbT4M6OGvmsXKs/O9+AOQvHcSiKP9r2rbiyLldtzfSqmLZwS+qiA==
X-Received: by 2002:a05:6000:194f:b0:332:ce52:6388 with SMTP id e15-20020a056000194f00b00332ce526388mr4258017wry.14.1702499194241;
        Wed, 13 Dec 2023 12:26:34 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id m11-20020a056000008b00b0033332524235sm14110534wrx.82.2023.12.13.12.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:26:33 -0800 (PST)
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
 Re: [PATCH v7 7/7] ARM: dts: sun8i-a83t: Add BananaPi M3 OV8865 camera
 overlay
Date: Wed, 13 Dec 2023 21:26:32 +0100
Message-ID: <3780932.kQq0lBPeGt@archlinux>
In-Reply-To: <20231122141426.329694-8-paul.kocialkowski@bootlin.com>
References:
 <20231122141426.329694-1-paul.kocialkowski@bootlin.com>
 <20231122141426.329694-8-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Paul,

same comments as for patch 6.

Best regards,
Jernej

On Wednesday, November 22, 2023 3:14:25 PM CET Paul Kocialkowski wrote:
> Add an overlay supporting the OV8865 from the BananaPi Camera v3
> peripheral board. The board has two sensors (OV5640 and OV8865)
> which cannot be supported in parallel as they share the same reset
> pin and the kernel currently has no support for this case.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   1 +
>  .../sun8i-a83t-bananapi-m3-camera-ov8865.dtso | 109 ++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-ca=
mera-ov8865.dtso
>=20
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index a0a9aa6595e4..980ac88634e3 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -278,6 +278,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a83t-allwinner-h8homlet-v2.dtb \
>  	sun8i-a83t-bananapi-m3.dtb \
>  	sun8i-a83t-bananapi-m3-camera-ov5640.dtbo \
> +	sun8i-a83t-bananapi-m3-camera-ov8865.dtbo \
>  	sun8i-a83t-cubietruck-plus.dtb \
>  	sun8i-a83t-tbs-a711.dtb \
>  	sun8i-h2-plus-bananapi-m2-zero.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov=
8865.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov886=
5.dtso
> new file mode 100644
> index 000000000000..0656ee8d4bfe
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dt=
so
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0 OR X11
> +/*
> + * Copyright 2022 Bootlin
> + * Author: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/sun8i-a83t-ccu.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	/*
> +	 * These regulators actually have DLDO4 tied to their EN pin, which is
> +	 * described as input supply here for lack of a better representation.
> +	 * Their actual supply is PS, which is always-on.
> +	 */
> +
> +	ov8865_avdd: ov8865-avdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-avdd";
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +
> +	ov8865_dovdd: ov8865-dovdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-dovdd";
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +
> +	ov8865_dvdd: ov8865-dvdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-dvdd";
> +		regulator-min-microvolt =3D <1200000>;
> +		regulator-max-microvolt =3D <1200000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +};
> +
> +&ccu {
> +	assigned-clocks =3D <&ccu CLK_CSI_MCLK>;
> +	assigned-clock-parents =3D <&osc24M>;
> +	assigned-clock-rates =3D <24000000>;
> +};
> +
> +&csi {
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c2_pe_pins>;
> +	status =3D "okay";
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	ov8865: camera@36 {
> +		compatible =3D "ovti,ov8865";
> +		reg =3D <0x36>;
> +
> +		clocks =3D <&ccu CLK_CSI_MCLK>;
> +		assigned-clocks =3D <&ccu CLK_CSI_MCLK>;
> +		assigned-clock-parents =3D <&osc24M>;
> +		assigned-clock-rates =3D <24000000>;
> +
> +		avdd-supply =3D <&ov8865_avdd>;
> +		dovdd-supply =3D <&ov8865_dovdd>;
> +		dvdd-supply =3D <&ov8865_dvdd>;
> +
> +		powerdown-gpios =3D <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
> +		reset-gpios =3D <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +
> +		port {
> +			ov8865_out_mipi_csi2: endpoint {
> +				remote-endpoint =3D <&mipi_csi2_in_ov8865>;
> +				link-frequencies =3D /bits/ 64 <360000000>;
> +				data-lanes =3D <1 2 3 4>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_csi2 {
> +	status =3D "okay";
> +};
> +
> +&mipi_csi2_in {
> +	mipi_csi2_in_ov8865: endpoint {
> +		remote-endpoint =3D <&ov8865_out_mipi_csi2>;
> +		data-lanes =3D <1 2 3 4>;
> +	};
> +};
> +
> +&pio {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&csi_mclk_pin>;
> +};
> +
> +&reg_dldo4 {
> +	regulator-min-microvolt =3D <2800000>;
> +	regulator-max-microvolt =3D <2800000>;
> +};
>=20





