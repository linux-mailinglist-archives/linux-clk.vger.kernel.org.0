Return-Path: <linux-clk+bounces-6116-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C4D8A9B12
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 15:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CBC2281A12
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 13:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3DD161305;
	Thu, 18 Apr 2024 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hI9W2kT7"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3153D1465BA
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713446429; cv=none; b=Fy2optOIuUKdXPCi417J0IEQMy79tT1EZd6+iIvhZi9Tnpr3Nwc1uhqS4cD2RDnK5L8WwBaceodUTf+prkYi7Yslr1KNgxbIfAku8uWYYh79wCoxxDKNMiDflHfxgshhbxvW0KmjJIAEMMvD7O0oHpqGCeE6bANE8Hlq75lvcoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713446429; c=relaxed/simple;
	bh=Ij0WftYV/5ZMg5fO9jgZuOZnGI9lrIxnyxWRy7o1chQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKq6qvZWZGmsRJkJKqZyLJGB8w4U58NZdMH9x/5k2qz9YFZtN8x+4fT32EwwxQTI6pbKgY/4BrbLIFrvA79PBMmCEujw1Tc9+GMOYDZzqNjsAaIcWIFGAtIQV7QGKIcm+v0cecvzpUMZSTQQTs+JySwI7/6lGC+MtvoPgDqlzGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hI9W2kT7; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5aa400b917dso542740eaf.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 06:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713446426; x=1714051226; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kv/eRlfqI9fnVJrlsdInFKVMVhQmcxt9AimltQ38bU4=;
        b=hI9W2kT7VEnNzepqozO6CsirkQ87gJT6BbCrodwmQQVbLuVDsUJiKI3tykUM+HP9S/
         eed/NaEkNHh98ebwISsdFegj5BfJ/0evAevx4fqGvdtEWP9SLJ37AaVOTYZxk9AeCMuW
         rWKXaHY6mqr7ZU2YOopgr0+uyjh4+9fVu/6+fY19xw7h+KIvkcaQ0hlLhCJe0LpM7oiS
         rdi7eKufPWOhtCqaERieSSJxr+aSPStPlWT7sGo7cVTBpLJmkD6mdDnUkHD5LnLeupD/
         YgLLYz9ogrq1UkWYu1zryJDjZd7ISd84phdqd07AG3DpP/LDSWuyXtgxRijsnZK5eC1h
         yOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446426; x=1714051226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kv/eRlfqI9fnVJrlsdInFKVMVhQmcxt9AimltQ38bU4=;
        b=qbU1l5ZlVV8VZFN3ntnTkL/9fLWxHbd07B/YSzAN10w2g2UcgheZpMr6FWItJ9WM7A
         j93yUZ2z7kVMzDkSuaAEKTyM75B4Aap4K2w9W67lPZKGUuv4kNVzCNgU0fWPH7hksEa+
         bYTL0VCY3FVYO/GYKpETjBXDe/vBrVA2dgrzBuUN/XJg+oRZfGk7H2n+tOIe/u6Jr/k+
         4C/0pElbhMQJ/juCiL6DeNFHDS7IPV899ro5PpFAalP4SwCQGCUqKwGEvimAzuFGTs0J
         g4jqDAnlYViN9cM2tAfUEjFnzqsBBoCmbBsjxneQ9zt9A0CyelZBjdSiKpI5io2SFXeG
         sSNg==
X-Forwarded-Encrypted: i=1; AJvYcCWEqIekTSc/Tupt+Hc/jpVqmBdkAA2Y6A7SIcgv1V6T0tS7fbN220heFx+Vkb92SjwqkXoRAMIJYsWbWcnW3VK5gEu0zMzB+tTW
X-Gm-Message-State: AOJu0YzcY9Sf1cnmyeHqSf705ASDm2y3Nmp5sKKjtaJDnsiQxjW3I69Z
	Bb1XkrB/mMKCtbsMnRJEu/bxPUIlfXXFVu2smvqajUSK2yxVYCrhKzQ7CN5RM91pLYw4u8+8Y3Z
	qJ8crQAFiDRic4hKTGFs4Hpxn05X+6VgZa0oxoA==
X-Google-Smtp-Source: AGHT+IHb/MdViNDEYLGDlZta2cUpYEdAdq/Zq5yJhTp7tH/XZ2cMCev0RXDqyzn43o1+A8jwrKM5rxrFUIw8Q5yDYVo=
X-Received: by 2002:a4a:ac89:0:b0:5aa:676e:9ad9 with SMTP id
 b9-20020a4aac89000000b005aa676e9ad9mr3474499oon.2.1713446426269; Thu, 18 Apr
 2024 06:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-8-peter.griffin@linaro.org> <4ed72378-672e-46d6-9f29-fa118f598739@kernel.org>
In-Reply-To: <4ed72378-672e-46d6-9f29-fa118f598739@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 18 Apr 2024 14:20:15 +0100
Message-ID: <CADrjBPpaR86R6FMwMqos7ojVfDpGxS=ygW50UBCy1DTsoXHJgQ@mail.gmail.com>
Subject: Re: [PATCH 07/17] arm64: dts: exynos: gs101: Add ufs, ufs-phy and ufs
 regulator dt nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, chanho61.park@samsung.com, ebiggers@kernel.org, 
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review feedback.

On Fri, 5 Apr 2024 at 08:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 04/04/2024 14:25, Peter Griffin wrote:
> > Enable the ufs controller, ufs phy and ufs regulator in device tree.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../boot/dts/exynos/google/gs101-oriole.dts   | 17 +++++++++
> >  arch/arm64/boot/dts/exynos/google/gs101.dtsi  | 35 +++++++++++++++++++
>
> If you wish you can split DTSI and DTS into separate patches. Up to you.

Thanks for the heads up
>
> >  2 files changed, 52 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > index 6be15e990b65..986eb5c9898a 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > @@ -53,6 +53,14 @@ button-power {
> >                       wakeup-source;
> >               };
> >       };
> > +
> > +     ufs_0_fixed_vcc_reg: regulator-0 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "ufs-vcc";
> > +             gpio = <&gpp0 1 0>;
>
> Use defines for GPIO flags,

Will fix in v2

> but more important: are you sure this is not
> coming from a PMIC? What's the voltage? It looks like a stub for missing
> PMIC, because UFS voltages are usually provided by PMIC.

UFS vcc is 1.2v. The gpio signal from gs101 SoC is called BOOTLD0, and
it is connected to slave pmic (S2MPG11) UFS_EN signal which is a gpio
enabled voltage rail for UFS (LDO8S).

The downstream driver code declares the UFS supply as regulator-fixed
even though it has a fully featured regulator driver for the pmic,
with the LDO8S regulator exposed. Checking the DT for the pmic the min
and max volt are different, so using regulator-fixed seems wrong for
downstream.

s_ldo8_reg: LDO8S {
    regulator-name = "S2MPG11_LDO8";
    regulator-min-microvolt = <1127800>;
    regulator-max-microvolt = <1278600>;
    regulator-always-on;
    regulator-initial-mode = <SEC_OPMODE_SUSPEND>;
    channel-mux-selection = <0x28>;
    schematic-name = "L8S_UFS_VCCQ";
    subsys-name = "UFS";
 };

So I think you're correct this is a stub pending full pmic support. I
propose in v2 to add a comment similar to what we have in
exynos850-e850-96.dts today above the regulator-fixed node like /*
TODO: Remove this once PMIC is implemented  */?

regards,

Peter.




>
> > +             regulator-boot-on;
> > +             enable-active-high;
> > +     };
> >  };
> >
> >  &ext_24_5m {
> > @@ -106,6 +114,15 @@ &serial_0 {
> >       status = "okay";
> >  };
> >
> > +&ufs_0 {
> > +     status = "okay";
> > +     vcc-supply = <&ufs_0_fixed_vcc_reg>;
> > +};
> > +
> > +&ufs_0_phy {
> > +     status = "okay";
> > +};
> > +
> >  &usi_uart {
> >       samsung,clkreq-on; /* needed for UART mode */
> >       status = "okay";
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > index 608369cec47b..9c94829bf14c 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > @@ -1277,6 +1277,41 @@ pinctrl_hsi2: pinctrl@14440000 {
> >                       interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
> >               };
> >
> > +             ufs_0_phy: phy@17e04000 {
> > +                     compatible = "google,gs101-ufs-phy";
> > +                     reg = <0x14704000 0x3000>;
> > +                     reg-names = "phy-pma";
> > +                     samsung,pmu-syscon = <&pmu_system_controller>;
> > +                     #phy-cells = <0>;
> > +                     clocks = <&ext_24_5m>;
> > +                     clock-names = "ref_clk";
> > +                     status = "disabled";
> > +             };
> > +
> > +             ufs_0: ufs@14700000 {
> > +                     compatible = "google,gs101-ufs";
> > +
>
> Drop blank line.
>
> > +                     reg = <0x14700000 0x200>,
> > +                           <0x14701100 0x200>,
> > +                           <0x14780000 0xa000>,
> > +                           <0x14600000 0x100>;
>
>
> Best regards,
> Krzysztof
>

