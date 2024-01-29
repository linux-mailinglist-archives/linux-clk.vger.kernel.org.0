Return-Path: <linux-clk+bounces-3075-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B309F841330
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jan 2024 20:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E65D61C24127
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jan 2024 19:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E1976027;
	Mon, 29 Jan 2024 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xzd/H3Xg"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98774CB55
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 19:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706556054; cv=none; b=ddM0nNCk84XWgLlHpGO6vPIs2a0LTr0bI6ELNNsGLAVQNPaYTGpaOVM62JGW5V8kP8l9rkFkaPSkgrS/ao/dhSujzgsCS/Yfpc7afL7CRHKJfBpleT2kQlKf2USu6/18dy7PgKZDl5SP8tyfv8Zt7UHAPFPNKWVROVAqo6jkiKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706556054; c=relaxed/simple;
	bh=JvbWfOz11vNiFRX0wX7ECmpupNbMxltE2NEJ+NK26YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGPFRLjy8ZOO0Fsp/rPE68g4fv2oWo+3OlXj3XVtoGyIdsIolXcp6BfGERtOaw880l9XZ+yYkzyyQp2aaWIK4rZTiAnIbxTow+8a9RhvoP4lA6egCa/W67hQsZPCB2Hvg5/xloz7jaE9ecXxo8CIXyPsSk0UtkMKCHhjcqINCeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xzd/H3Xg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6de2f8d6fb9so762457b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 11:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706556052; x=1707160852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIeL+ClHde5Q0WzDNwjmOu8VjZIU0zrITXV3DaJ0q2I=;
        b=Xzd/H3XgGlDjYlu8FfjjiEInVw51TK2rHCsbuQHe1NeluwgOGEJUHaeuxtFc1Jj1aS
         /Bo8GbZVNgJ/Ga8uFsxH/XoZht2+Y5AvSEPM4pC3OM+uNSnSk3MJY9awP4KC0sqZBpR/
         7vAO3ZevW6U/njj37tlOpJZjBz3afTo90AcqBncn0iSBtS9AmP4KXLBhyXo43BVwtx7b
         h5L7WrwjDpnjsxrIADEnzO/hfEbLkzbvznMC8vdgeD+hFmsEP0vxOLZh91/RN6vQdJWR
         p4MClD+0K3PYnWouFV/+aSREFVdh0AeJdi2AudMpV/9B9/Zq5iXn0/S/+cdRy+7gFPeZ
         ryrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706556052; x=1707160852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIeL+ClHde5Q0WzDNwjmOu8VjZIU0zrITXV3DaJ0q2I=;
        b=DqmAnFzSvkrphLsCRZlG/CIVeyd/EI9F1KZmhQUTsMgHHxJiQ/9AfDezyWrRrmaq8G
         wcyfKALWlPQI5VOT8cJPVKQJ3LzJwOmDPaj2GGXki1/+nnZvB+82Q5NAhjcG0lIuopk5
         Zc/+JDCXWMkHwoVnAKlYpWMO6qukqhKIaHZtRvPvm/w1qXS5eZlNN1UDxDxASR8ITFhK
         mKxK4Ngw81lOaOrpt8O09YMIi0MfXUEF+kWzZUKXHl6RIFv7QLmSyePBWjj4kCUczl+q
         VRXE8TLvhbTTqpM4XoitF0QZ4gF+JwpweppReZ15ZSa4XNrPhiUAsY4BGjtLUTWdIYSc
         uiyA==
X-Gm-Message-State: AOJu0YxWiF6jMvlXEoDb1gyK+sFPT+1nfYDzOZ1qCxP7nP8CN0YIH7Ha
	XpQx+3PFqprkwAF4ngjes0OkZgXrtedClndlo9qgflrD8sbfxYZd5PM5C+Lo1A73azZeHJgWw8E
	8hgr4PkKobpoxZeuMPEAIG6RJ0VYwRQzUjWHOvg==
X-Google-Smtp-Source: AGHT+IHOCPSaT+Nkr7VPs0AUYEN3NLE/Qj5EVmTGejdhU8hk4hJznc8UDvcuF7xGLhc3uOMKc9yfKfo97PeJPSw9pUo=
X-Received: by 2002:a05:6a00:1883:b0:6de:1d0b:b3cb with SMTP id
 x3-20020a056a00188300b006de1d0bb3cbmr4136434pfh.0.1706556051945; Mon, 29 Jan
 2024 11:20:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129174703.1175426-1-andre.draszik@linaro.org> <20240129174703.1175426-8-andre.draszik@linaro.org>
In-Reply-To: <20240129174703.1175426-8-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 29 Jan 2024 13:20:40 -0600
Message-ID: <CAPLW+4kRcozGqXEZZpEZVrhwD2VJA3Og+LA+2J3tOc9tGLKj8w@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
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

On Mon, Jan 29, 2024 at 11:47=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>
> This bus has three USB-related devices attached to it:
>     0x25: Maxim 77759 Type-C port controller
>     0x35: Maxim 20339EWB Surge protection IC
>     0x36: Maxim 77759 Fuel gauge
>     0x57: NXP PCA9468 Battery charger
>     0x66: Maxim 77759 PMIC
>     0x69: Maxim 77759 Charger
> where the Maxim 77759 has multiple i2c slave addresses.
>
> These don't have (upstream) Linux drivers yet, but nevertheless we can
> enable the bus so as to allow working on them (and to make i2cdetect /
> i2cdump / etc. work).
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> v2:
> * add short summary of devices attached to this bus & add TODO
> * collect Reviewed-by: tags
> ---
>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/ar=
m64/boot/dts/exynos/google/gs101-oriole.dts
> index cb4d17339b6b..6ccade2c8cb4 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -72,6 +72,11 @@ eeprom: eeprom@50 {
>         };
>  };
>
> +&hsi2c_12 {
> +       status =3D "okay";
> +       /* TODO: add the devices once drivers exist */
> +};
> +
>  &pinctrl_far_alive {
>         key_voldown: key-voldown-pins {
>                 samsung,pins =3D "gpa7-3";
> @@ -113,6 +118,11 @@ &usi8 {
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

