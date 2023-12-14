Return-Path: <linux-clk+bounces-1445-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC68134FE
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 16:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9057A1F2179B
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 15:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B38E5D8F3;
	Thu, 14 Dec 2023 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CjorwqaM"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FEE134
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 07:39:47 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-28ade227850so2255716a91.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 07:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702568387; x=1703173187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdjSPhIyB1xzNvePwzN4Lv4667HwZ9Mo32XFQbt5RU0=;
        b=CjorwqaMiPGQidFhMzoDJnRgw5CvHfMjnV0O3bnJ1c+7nfTT8pBgXYUBAx+xONuqdm
         PoEwNuy8OExz/JPKygfkdgYZqI62xgBpcHptaSsBD7UzDcOdBJ8geEagtvW2x0OisLMc
         2+6C5IWQ3kQRwZ5Ae1bxVUgZC9iqV3sAlbMg5SrmdF8sy9RU8NmZddpgmCMiFX5HGpss
         h/37tCS94e9A5xhiP6TepgZ0EDJP+pgXjAsXs0qxy9eA5LpW2jE2l0HUz2fC8wqWS8jE
         POMnLIdAjrxhbFAlj0BlUYT8iYQvMU5CVKrCpdB+osbkNAP8nswuTOepaVGcC6yfEH0M
         +ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702568387; x=1703173187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdjSPhIyB1xzNvePwzN4Lv4667HwZ9Mo32XFQbt5RU0=;
        b=O0eVadw4BLm2yIY33NK6TQMic7vtE1eYarhaXX2XUl+aqNDfnxBgACTNzuzOAplPW5
         lomO6sD/mC6O6XVaEw28GbXxb5UR/hz2CxUHVa49oIx4lnpGoZcgAh70sGzpLSgnnysy
         xGhC+9WZluwY1qV/+azdEC8v4C8O5rekRrnB2T5SIx1IIFe+iUkfsVK6BQTI134EOfiL
         GYsbAeb21BRHk1Cn6q7UjtlhF2fJngqXx2bXDwqGpvJABeRWkYNNCH9XA2n/F10OkU+l
         EgrgJPjwA6JvRjv+ke9z+UbhamsatQpEmtdThIYukBZvmArBV6Neuv+/C2tFFSmvDE2j
         riXA==
X-Gm-Message-State: AOJu0YzwMfqcpIkE2HJIBNWF8NtF1Rdimo7UEe3fH2c06HxRPoTuC8XB
	OoEgRl7JDKHtYs7pbkv1yr8s7K3FarLRegGJ+CmZUw==
X-Google-Smtp-Source: AGHT+IGirM4+nryJ8CQwEZU0IegMIG64eLAF/7DoRqfynsZoP/h4uO2l7qynqj6arTSz3lMXlgfoKAyn+JsuJdyqzHo=
X-Received: by 2002:a17:90a:e50:b0:286:964d:c with SMTP id p16-20020a17090a0e5000b00286964d000cmr7480168pja.86.1702568387270;
 Thu, 14 Dec 2023 07:39:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-9-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-9-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 09:39:35 -0600
Message-ID: <CAPLW+4=bfcemh-dd7r9hOe0RbtC01+sNpj3ZMMfc8rMezKQfNA@mail.gmail.com>
Subject: Re: [PATCH 08/13] arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 4:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Enable the cmu-peric0 clock controller. It feeds USI and I3c.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 9747cb3fa03a..d0b0ad70c6ba 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -339,6 +339,18 @@ ppi_cluster2: interrupt-partition-2 {
>                         };
>                 };
>
> +               cmu_peric0: clock-controller@10800000 {
> +                       compatible =3D "google,gs101-cmu-peric0";
> +                       reg =3D <0x10800000 0x4000>;
> +                       #clock-cells =3D <1>;
> +                       clocks =3D <&ext_24_5m>,
> +                                <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
> +                                <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
> +                       clock-names =3D "oscclk",
> +                                     "dout_cmu_peric0_bus",

I'd pull this line to the above line. Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +                                     "dout_cmu_peric0_ip";
> +               };
> +
>                 sysreg_peric0: syscon@10820000 {
>                         compatible =3D "google,gs101-peric0-sysreg", "sys=
con";
>                         reg =3D <0x10820000 0x10000>;
> --
> 2.43.0.472.g3155946c3a-goog
>

