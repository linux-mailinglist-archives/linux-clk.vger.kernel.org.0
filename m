Return-Path: <linux-clk+bounces-2977-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2950783EA48
	for <lists+linux-clk@lfdr.de>; Sat, 27 Jan 2024 03:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE30C1F25457
	for <lists+linux-clk@lfdr.de>; Sat, 27 Jan 2024 02:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B8E33EE;
	Sat, 27 Jan 2024 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KM9P8Ffj"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD15BA28
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 02:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706324345; cv=none; b=D50DTwi77LEqpdWm8a422D+3anzEYhCI0FtD0q+qBOmW+69UGm6DnuRix4dtzaJXRygl9vr/ssbdAohaE1M0XCqwXA8+IiXP3pgFHtTHjQzbuSI0+La77KSpZJzQvZ9mMJLgCNFGujGZEjaWNyj9M9SFbNAwvdyJQRc5dqH3QhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706324345; c=relaxed/simple;
	bh=cqz6h8qybg8zqeHMlgnFpj2fAVvyFuBzRiCjORdpKIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLjFHiA4roxwxLpsTmzVjzIXujUp9PdDL9MPSTjDlkFIP43nHifsgs3CnslOc0wT6Pk9h9JZzdWwczh4TFHHZsY23ZuUshTZdf0Zg1qEElU64vSqJkX89i5JD1gK/HlhoJ4LqvysfforbUtnkUxTvl9LzGz0QPwQW7pn0nUXrQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KM9P8Ffj; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5957ede4deaso667745eaf.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 18:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706324343; x=1706929143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgh8HDwSDPm2J03EDVHmibPYOLvv4r06hCadDQb19fQ=;
        b=KM9P8FfjDICBG8gPKPT5T4TbLmSo6cKuT8NhYiYAH8m8dX30rzTMcxHt4TfH7s38vZ
         o0E+K5Mfzw2yeChgvCe/B+Q2bEHGCDFCsc/tjgKY4rvo0NhYDcr/xYcNQhFcIhaG/aMo
         pYVeoaYo6bwUTiB6B7udeSkoDFgcqdCGPJcvxmRPyswHf7R1X1UYfX0PCQ/2RGGYDNiz
         7rIk7OOR1Lu5pIqZMDnJh0ehTCvnSq429KSv4CoUrFbz9ffTYvVYYeMkhM33kqPoXHxF
         nHTkGLVnwwHV18JPceizYHvwzN0YhH3+mtCi1H/v1tWCuIs/Eq/L2azyw1ZhyDTlhz7E
         Gs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706324343; x=1706929143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgh8HDwSDPm2J03EDVHmibPYOLvv4r06hCadDQb19fQ=;
        b=Eha/2DjRTpsFnuK5xo1HRUOpkC2ZAq7GhsNNBSwh4hE0GWl7sVOCvXESIXSnCfH2qf
         AAK0lALt4+CV/r7nk6FVzibU3bhSRN18L5HkoT7sOgcR5yDN8bFksV7W2+2Tr9LNOZGZ
         oJszZ5HBBSdBWgYSK0RfYsLyFPzA9nE27Yb9HWbrEpkZUvIelK2jIVQBAXqcx7hVlrZu
         ZT4T1nu967fu5AZtWPaRMUBNeyVR50yaY5gK2Ntfuo2IYZOu+oj3o0SOpYNwravf1Gbl
         8tvzaYqHC/lcySGfpTse8a+Y7UzfmD/1XKBmNR0JGXztaIs3EWOKGH682y8YDR39Gm1F
         nmOg==
X-Gm-Message-State: AOJu0YymPkBMDueBW3kl9c3YH+ptgTIgctdy1RdCZDFvhsnOB8pscqfr
	8U9V8jk4m6UUWeDC4KBXEMHUf1oNApt/nX04wnda/bS1zKkLamrtFor5jMKnq4RUUEsD8nKm5kz
	PgcwPL16oaTt9YXZUquasGt6djuGHHvZEA0V6WQ==
X-Google-Smtp-Source: AGHT+IEq0snClZUeq4rcjxQ00Gum27FvXapuVAnu/X2sIV8nk4Gb0dv6sVWx7czBtCSzZQnsoZAeAd5esWgduMRyUi0=
X-Received: by 2002:a05:6359:428a:b0:176:67f3:4159 with SMTP id
 kp10-20020a056359428a00b0017667f34159mr828828rwb.20.1706324343213; Fri, 26
 Jan 2024 18:59:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-7-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-7-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 20:58:52 -0600
Message-ID: <CAPLW+4m4G+-zFLGr6Bp-73-mERCofxDiD7F=2fd_Wq+18iTs9g@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:19=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> This bus has various USB-related devices attached to it.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/ar=
m64/boot/dts/exynos/google/gs101-oriole.dts
> index cb4d17339b6b..c8f6b955cd4e 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -72,6 +72,10 @@ eeprom: eeprom@50 {
>         };
>  };
>
> +&hsi2c_12 {
> +       status =3D "okay";

But there are no bus clients declared here? A bit of explanation about
how this bus is being currently used would be nice to have (in commit
message); e.g. maybe it's used in user space somehow, etc. Because
otherwise it doesn't have much sense to enable the bus with no users.

> +};
> +
>  &pinctrl_far_alive {
>         key_voldown: key-voldown-pins {
>                 samsung,pins =3D "gpa7-3";
> @@ -113,6 +117,11 @@ &usi8 {
>         status =3D "okay";
>  };
>
> +&usi12 {
> +       samsung,mode =3D <USI_V2_I2C>;
> +       status =3D "okay";
> +};
> +
>  &watchdog_cl0 {
>         timeout-sec =3D <30>;
>         status =3D "okay";
> --
> 2.43.0.429.g432eaa2c6b-goog
>

