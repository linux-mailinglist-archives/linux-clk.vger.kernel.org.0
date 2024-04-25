Return-Path: <linux-clk+bounces-6402-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B78B269D
	for <lists+linux-clk@lfdr.de>; Thu, 25 Apr 2024 18:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79CF51F214A3
	for <lists+linux-clk@lfdr.de>; Thu, 25 Apr 2024 16:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE5C14D6EB;
	Thu, 25 Apr 2024 16:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6T6Pr+P"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09EA12C7FB
	for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714062933; cv=none; b=qi7VDr9MzSndwKD8QMd2GUTRDdABDKLkMhUCev2pB053pcmCDMt89P6/f72FOca35BIOrIYbpm88pl2gh/PKfxEVJqlPtTlaKEwLy179MqF56IS4wZrq/0Em8NWFaVs1adRosD8xf+TSvMUrAf0/71oWe0R4xJVEE7xWLiUeT8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714062933; c=relaxed/simple;
	bh=j9WGUFY71ps6OSCWciRhDzFj4uK9mlFz0tqR2rg0Q4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r05qQoBTa4Y+j5O2s+NJlldLHyKGtS40RlWMRKKcQx9q4mmxZobkHxM0HJhCKnW4zrRmPpiBmvYQj8O5TmmDn8sjBhcnN3Byw30HhX/ODSOl22IcZHVrT+JWPHV26paBvOWzGjGjWiJGuM8aMDNoSJ2OaDMIqtmnT4wSvruw8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6T6Pr+P; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5af702072a9so184796eaf.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 09:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714062931; x=1714667731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8D10nkcOa5R+uHy2/Q7XxV4zDHaJ6w0gsH2wqoomVXQ=;
        b=U6T6Pr+PFC5DKgi3aIKsKkSrPsanqBFS5/OHvEcc9EkNwJuboB4yPzS9B1cYFY2my5
         Ven3lsSYywpkatU72jcZ6HXqGPmPDFums3SmmZz9WHDBBfcyFduxF8kJXrXP0VAAsuae
         aulHTdAbGkZZe/HwAxOQfrNxkP4szowDdlzUUI1EkBumawc4TRa+BMGGDvofPZNOgmy5
         noJDkddsbc5cBqFkzbmMo5js/77K6f7l6404Kzr2RwZ1mKgefcwUSPesl3gJMyYDOh2B
         AcKn0Uw8jwoCo2v8n1poJ8Kd9XkisE29wrq0ylFPIeUplX9uYLh/R06Cl9QgDcxttnb1
         37XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714062931; x=1714667731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8D10nkcOa5R+uHy2/Q7XxV4zDHaJ6w0gsH2wqoomVXQ=;
        b=Sr2DeXy1h/D8uzdDmCcmWsRzhMIF/RJivUxQTM9QQ3cfgOsdgYm0gYraIYKlyCyTbU
         tQ3ooBSMEGr2vxKT0KCB+XhdKXdpFG+JSjX6jjJTQckSrlbRSF/iARxWnDemAOUgnYr8
         i+OFD8fWkUbUSISfHIjdgdFtQovcusuzn7v1xAKRjhRAhHhqmn4md78xVV7H0bve0iMm
         ckLJHGvw3gmVCEDYZq+EtCLuNRyNPrMmUlDkpjesZm2luLhG6dTYVZVZ9xglCMuG7ZJC
         eJeGJASSQ9fvW+dB+AlpSHjozRFMXcP5/QitGpMEt0bJzXDnHH+jkvkeMfIbvI0e5utv
         4vqA==
X-Forwarded-Encrypted: i=1; AJvYcCV48fT2r2LXWQ8UggQfVFeKq/3Zx7KkrtXgCPjbsSm2ASrwIQPHhGvAoD/i5lTlTZxZBCSllVBR5VZ6+gbEBwDRMXkL7gC08SYR
X-Gm-Message-State: AOJu0Yw0Xg9FeI6e6VwXmVmgRKJ3452DVzO1pb03A6bYYJLWQ3dthdcW
	MZnmNMM+uF2Yb0YBZ+FPdqBh/TnBsTmQGCVv4iIZzc2ZqHKLJTuIPh3epjg4g8wZ9hwrBM+1Uuc
	qS19zzHUOj+Fevky3KA5MRlhs16km2idTT+WCyg==
X-Google-Smtp-Source: AGHT+IHjcgDl2gtVr/nZRGKGuh2NquqDXaKs02m0Ke3hafEhPZVueDe1BLxI7k0uWnYn7WyPx11zD8Zk9f2sSWyLcbo=
X-Received: by 2002:a4a:d46:0:b0:5ac:9e7d:576e with SMTP id
 67-20020a4a0d46000000b005ac9e7d576emr185709oob.1.1714062931017; Thu, 25 Apr
 2024 09:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
 <20240423205006.1785138-7-peter.griffin@linaro.org> <52403f522a4f7513c5ee5dae48856988f7141825.camel@linaro.org>
In-Reply-To: <52403f522a4f7513c5ee5dae48856988f7141825.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 25 Apr 2024 17:35:19 +0100
Message-ID: <CADrjBPrpsTFns8o+H=SvqdgmKFrkuGEJ2QphL7BpRfy9kifxJQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] arm64: dts: exynos: gs101: Add ufs, ufs-phy and
 ufs regulator dt nodes
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, James.Bottomley@hansenpartnership.com, 
	ebiggers@kernel.org, linux-scsi@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	tudor.ambarus@linaro.org, saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Thu, 25 Apr 2024 at 13:02, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Tue, 2024-04-23 at 21:49 +0100, Peter Griffin wrote:
> > Enable the ufs controller, ufs phy and ufs regulator in device tree.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../boot/dts/exynos/google/gs101-oriole.dts   | 18 ++++++++++
> >  arch/arm64/boot/dts/exynos/google/gs101.dtsi  | 36 +++++++++++++++++++
> >  2 files changed, 54 insertions(+)
> >
>
> [...]
>
> > +
> > +             ufs_0: ufs@14700000 {
> > +                     compatible =3D "google,gs101-ufs";
> > +                     reg =3D <0x14700000 0x200>,
> > +                           <0x14701100 0x200>,
> > +                           <0x14780000 0xa000>,
> > +                           <0x14600000 0x100>;
> > +                     reg-names =3D "hci", "vs_hci", "unipro", "ufsp";
> > +                     interrupts =3D <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0=
>;
> > +                     clocks =3D <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_AC=
LK>,
> > +                              <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_CLK_=
UNIPRO>,
> > +                              <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_FMP_=
CLK>,
> > +                              <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI=
2_ACLK>,
> > +                              <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI=
2_PCLK>,
> > +                              <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCL=
K>;
> > +                     clock-names =3D "core_clk", "sclk_unipro_main", "=
fmp",
> > +                                   "ufs_aclk", "ufs_pclk", "sysreg";
> > +                     freq-table-hz =3D <0 0>, <0 0>, <0 0>, <0 0>, <0 =
0>, <0 0>;
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&ufs_rst_n &ufs_refclk_out>;
>
> The preferred order is pinctrl-0 before pinctrl-names (similar to clock-n=
ames and reg-names).

Will fix
>
> Other than that,
>
> Acked-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

thanks,

Peter

