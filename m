Return-Path: <linux-clk+bounces-2489-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E4582F399
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jan 2024 18:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3E1B1C237B3
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jan 2024 17:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510451CD1E;
	Tue, 16 Jan 2024 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkDahVsT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A24B1CD01
	for <linux-clk@vger.kernel.org>; Tue, 16 Jan 2024 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705427952; cv=none; b=VlFPDuNPA+W6roUXLZ5Kh41E2Siyrhy7om/Ttomc3ec5fcdB+A3TiFWsc6CDbCPIBRiuHfN8yP2PPRP3um4F127bNmUuQ8vVMk/h2/v7HXew303C8LUgOS1nlme7f6RuFpYb7gEFx5+ksA1qzhcILUaPs2mhk+obqx/VKmraHQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705427952; c=relaxed/simple;
	bh=RTj1/a3oYSeud5ORgmRAnE80RHagk1otScZh5SrAwTU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=ixXvOBrhSRjR83zC/gqWKp9W3MQdMa74pQL3X7pk+UbrF+qi4tu3x07m7laQwOWepQkQbFHZE6ufJxxFSTaxTl5HIB6cWmJY58wHFJA3mtPXA2uKTZTEDzYfsMBK3Yg7r9A36AgoI0SAi5Se7bkGOaBnaSbIg0SjdLvKTfW6rk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkDahVsT; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6daf694b439so5480690b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jan 2024 09:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705427949; x=1706032749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oc31P8IatTocdDsZCQmXC0DQW4G/2dM1ao0ezkE1ShU=;
        b=JkDahVsTUFQzILwmrbaw5GVoo7GKSHClYkN0dmYQMmepUpA4q6ORNLgDOOVfgLZyrs
         R8O+PTNwYKkB8ifFwD3GC6F1hM3WON9o1M9s3rlQcakCqBEYD2w2HlFMAkJl3cyzF82G
         bA2mjh72ioX0a08JvbZuqitFtyv6Ex6P8jwr2RSV2DBr2EArb9uKfZ6K4bsbSNbTn3by
         1Ugi6NmAxJhN0RnPWToXL2Bo1RoMPIJCqIUd5WbYTkCnJcN1EVwP5BzN3HzGi84EQ6RY
         EN1WpK/Cc0yV0HLymo/0JtTz0Ji5dtjexuCauf35fjhbg8RZt3w6iuHhuYKdyIdXO/AE
         lnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705427949; x=1706032749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oc31P8IatTocdDsZCQmXC0DQW4G/2dM1ao0ezkE1ShU=;
        b=RTRAw1rSd4BIDodZK4LdiW3SHXbiU05887qFGMkGMWX/KnxeKs7P3e+F+KMrMPgPl/
         TgAag9CSkssYNqPpdKyCjGmVIiS6Rp2a724xlO0CENAQJORLSQUb4knXNF4MHzsTFnoK
         BNk0L2c/RkPjyOVBedUOBFKv0pFMfkp4pkKYa8c4Q8yBkwhHjCtUidFiRCPopWGucH9Q
         naalxJ7WyhnCSqxcsOvh8oIZXUKVX9aoAwlMBJZdQ8xUszLnfL3bA+Wx3l/8UuvWzJeS
         3+tHJNRc1esQ/5H3+gh4FiBvd3763bhnKHQ/q60aLx80IY0TRNy97DtleNXHrEjro/+Z
         8b5w==
X-Gm-Message-State: AOJu0Yy8FVU8kElZr9kp64yR9YjU9OON+f92cs04Ce9yPHXHHNR1+FnQ
	j1Px2ows0eVyers99Wp9T39Ahc+yGr6o3p7Y2zlmQBuF2Ba6qA==
X-Google-Smtp-Source: AGHT+IHNDDAgODlU90dyfmnXD7N4uAm4wwmeGkhk10dznInmiWmF4zv8f/xyyIrQiB56xBzJulFhItR2ZgwhI+7RmH0=
X-Received: by 2002:a05:6a00:2310:b0:6d9:b3ce:9bce with SMTP id
 h16-20020a056a00231000b006d9b3ce9bcemr4079809pfh.40.1705427949018; Tue, 16
 Jan 2024 09:59:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org> <20240109125814.3691033-11-tudor.ambarus@linaro.org>
In-Reply-To: <20240109125814.3691033-11-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 11:58:58 -0600
Message-ID: <CAPLW+4k948THg=UVx-VVN8QJ980M8cLF0EDOUjhGwu=tTMcxqQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] arm64: dts: exynos: gs101: update USI UART to
 use peric0 clocks
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, 
	alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 7:01=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Get rid of the dummy clock and start using the cmu_peric0 clocks
> for the usi_uart and serial_0 nodes.
>
> Tested the serial at 115200, 1000000 and 3000000 baudrates,
> everthing went fine.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> v3: no change
> v2: identify and use gate clocks instead of divider clocks
>
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 2d1344a202a9..6aa25cc4676e 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -180,14 +180,6 @@ HERA_CPU_SLEEP: cpu-hera-sleep {
>                 };
>         };
>
> -       /* TODO replace with CCF clock */
> -       dummy_clk: clock-3 {
> -               compatible =3D "fixed-clock";
> -               #clock-cells =3D <0>;
> -               clock-frequency =3D <12345>;
> -               clock-output-names =3D "pclk";
> -       };
> -
>         /* ect node is required to be present by bootloader */
>         ect {
>         };
> @@ -367,7 +359,8 @@ usi_uart: usi@10a000c0 {
>                         ranges;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> -                       clocks =3D <&dummy_clk>, <&dummy_clk>;
> +                       clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC=
0_USI0_UART_CLK>,
> +                                <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1=
_IPCLK_0>;

That looks much better.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1020>;
>                         samsung,mode =3D <USI_V2_UART>;
> @@ -378,7 +371,8 @@ serial_0: serial@10a00000 {
>                                 reg =3D <0x10a00000 0xc0>;
>                                 interrupts =3D <GIC_SPI 634
>                                               IRQ_TYPE_LEVEL_HIGH 0>;
> -                               clocks =3D <&dummy_clk 0>, <&dummy_clk 0>=
;
> +                               clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_C=
LK_PERIC0_USI0_UART_CLK>,
> +                                        <&cmu_peric0 CLK_GOUT_PERIC0_PER=
IC0_TOP1_IPCLK_0>;
>                                 clock-names =3D "uart", "clk_uart_baud0";
>                                 samsung,uart-fifosize =3D <256>;
>                                 status =3D "disabled";
> --
> 2.43.0.472.g3155946c3a-goog
>
>

