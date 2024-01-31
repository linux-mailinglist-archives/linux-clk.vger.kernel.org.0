Return-Path: <linux-clk+bounces-3191-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9BA84493B
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jan 2024 21:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2899E1F2173C
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jan 2024 20:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C50C38DE4;
	Wed, 31 Jan 2024 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1+wMIIJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D2138DDA
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706734567; cv=none; b=mrTPBZghL9Yj8Gza+XwvRtenHqFUcoda9uS3uI9tFrCUlK6V4tvQcnDVEpaBdWCOk780sR6Be0NwIY8TXTFeFFMvMEOD1ORiP6NYgBRfi+4He4M7A1p48zIjATeqY3q6ZIWNz0IipWBRajb7EtOzO8eY6FmMRBeEDa7Jthzwquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706734567; c=relaxed/simple;
	bh=SN8BqaoqK4IhvOPgDP2RdQxe6JgLeGUnxbb+hDI6eKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXNKr4fvGY2ER23F2U5JL9khENgestzuevt4duostZWuuTskmFnpzngVih5ABTIi3kyeTu6famNSa32Ao5ojNcnVJUAjLfIWoGD70UClR9Y+naVX7uYGetmKVLCGI7iudQ5eBAsK+fWx1biTccQ6Tw5Sb+jAiuX1RcTG3ruCHcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1+wMIIJ; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-602d2e67217so2125027b3.2
        for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 12:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706734564; x=1707339364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7hyd0uUWhkbaFe/33mIS/9rt+Zgy9D3j/1s4opCgVA=;
        b=G1+wMIIJIU7EHJ6Og+6RLOHz5Oq7bJJZzdngxPfE+D+l1rbrZneMFjhsnQoVe6n4wW
         BqReeI164HGr4joyYJblNT/2NmchMOS9jhi7lRivQ+fFlykiPKAaYGPL4rydmf58NQSd
         HhmnQGOWFvraor9flr7N/7lMLfsfBF5+8hpYuwfp9NS+9TBErT3q+nXa2rNtr59oqm00
         1NoRvK35Jgy4zs6mxK088X5ZaIQ7pczl6Sy/qeriJsAPBIK7yHd8WVt9DqHFZ94mzr27
         ituI3qc+cwZGzWzqS12A0SybqPK42F6IzoyxLbPNOoenFy+r8b8uBxrFM2I+E29HAZgC
         kYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706734564; x=1707339364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7hyd0uUWhkbaFe/33mIS/9rt+Zgy9D3j/1s4opCgVA=;
        b=lFZjKrOVyFNE8m5L44mHQk0TECnVJjiBZvZqNbB9DlvwgZqSqqPCK4ZP9+VNHmvGts
         KO1FmDJyM8Akll4lfEAyri0AItQgNZq8knoI87whoBYJmykitdO3eh0tXB/ZZHn6yl5S
         ytTl7+0Wpy94lQRVb5a0uVPQja8v2uAxIkwpsg3s0IGgl3teo5MwruFJp77QNFDpOCxr
         6cD+ptrb2fOc7bLjNmhdTwPhCS9sjnUDMFXaGNCkG3m+sPDqSQl6Tq8u3KE5fColHxa1
         n5viJxlWFL42dmzNUQ7G5zFne+UwZhDABdmxh8eYiwSq1P8J00LEEH7kJXBPR99JcKPP
         SMwA==
X-Gm-Message-State: AOJu0Yw0bHIbChcbYwPOjlfRWogHFEbxhl/1diwmLi5ueu+HCuiKr5CV
	RHuN7ydKYsloQP+SUnDapMzoiN1rA3eT3DEgCIJ8C0pV10sqLkowYWEXiynLFA9x7EmgSTCCNnE
	N2091unotME2c3n4CFJqWu5Cz9xdFWkXczcmw+Q==
X-Google-Smtp-Source: AGHT+IFJ/1xZgCSwoaduRMuAwfRIZptre9CM/jzrBsxgmGVbsa52bCGEib3ffEWOgkTlCCPbnjv9iZn0wOW7R+22/YA=
X-Received: by 2002:a81:6c97:0:b0:5ff:956d:8b7f with SMTP id
 h145-20020a816c97000000b005ff956d8b7fmr2745745ywc.10.1706734564562; Wed, 31
 Jan 2024 12:56:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com> <20240131-mbly-clk-v4-10-bcd00510d6a0@bootlin.com>
In-Reply-To: <20240131-mbly-clk-v4-10-bcd00510d6a0@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:55:52 +0100
Message-ID: <CACRpkdZvj2E1zfSU1RGY2+_6sCCYxu=pbQ0yv+-bmTLGzEyFwg@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] pinctrl: eyeq5: add platform driver
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Theo,

thanks for your patch!

On Wed, Jan 31, 2024 at 5:27=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add the Mobileye EyeQ5 pin controller driver. It might grow to add later
> support of other platforms from Mobileye. It belongs to a syscon region
> called OLB.
>
> Existing pins and their function live statically in the driver code
> rather than in the devicetree, see compatible match data.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

The driver looks very nice and is using all standard features, I'm pretty s=
ure
we can merge this soon.

> +static void eq5p_update_bits(const struct eq5p_pinctrl *pctrl,
> +                            enum eq5p_bank bank, enum eq5p_regs reg,
> +                            u32 mask, u32 val)
> +{
> +       void __iomem *ptr =3D pctrl->base + eq5p_regs[bank][reg];
> +
> +       writel((readl(ptr) & ~mask) | (val & mask), ptr);
> +}

This is in practice a reimplementation of regmap MMIO.

Can't you just use regmap MMIO to access the banks then...?

Maybe it doesn't add much here. I'm not sure.

> +static bool eq5p_readl_bit(const struct eq5p_pinctrl *pctrl,

eq5p_test_bit() maybe? that describes better what the
function does.

> +                          enum eq5p_bank bank, enum eq5p_regs reg, int b=
it)
> +{
> +       u32 val =3D readl(pctrl->base + eq5p_regs[bank][reg]);
> +
> +       return (val & BIT(bit)) !=3D 0;
> +}

Maybe add a check for bit > 31?

> +static int eq5p_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
> +                                      unsigned int selector,
> +                                      const unsigned int **pins,
> +                                      unsigned int *num_pins)
> +{
> +       *pins =3D &pctldev->desc->pins[selector].number;
> +       *num_pins =3D 1;
> +       return 0;
> +}

One pin per group, also known as the "qualcomm trick".

(It's fine.)

> +       mask =3D 0b11 << offset;

That's pretty nonstandard but it's quite readable so let's keep it!

Yours,
Linus Walleij

