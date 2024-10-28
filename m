Return-Path: <linux-clk+bounces-13914-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 746779B2D01
	for <lists+linux-clk@lfdr.de>; Mon, 28 Oct 2024 11:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98AFC1C2189D
	for <lists+linux-clk@lfdr.de>; Mon, 28 Oct 2024 10:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1571D3573;
	Mon, 28 Oct 2024 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Az0ar+/R"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672DE1D2B25
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111802; cv=none; b=Aocrc5XVYGs56XPmWDmH3COey389YR4X7xVmFORkt/WY0TC9/IBfYg3eyuPUPyLX4AIE8cwhaNJQYRWL/EygrdMurDiZUEZ548GLXsCZAt9HAzX6GYI5uGog22dcACl9n+TsoddrgCuWgxul90WQT+exjoNJB9UhlBnswn4rL3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111802; c=relaxed/simple;
	bh=oEn8z9MqoHTTS3d/0dOtXTLMxxBwRriKpl2xUYLAhn8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldG68GCH0K1hyOWtGdcPPUgE/BubZQynpbnnanIhIghXgrR97uraQ/P5KFTuNbYPkvF41omF+UMuYEXvSJb067NlrdhodBRJ3Xvlk4hmK8bOSLUhaWHgQlgwdpLdiKBgaLXR6U0Qr1bOA4E77ZRJWXRPYlNuUVp9ro7H5jSwrck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Az0ar+/R; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso603423266b.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 03:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730111797; x=1730716597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMofVo8hbKk0Swbq8g7Wqb/qoQ7xBjUn4m5ktsUGG78=;
        b=Az0ar+/RPKbMQqOe9q/yQsE/CYIfJJxn6q5tMKx9ryOBZso0yCtpx3JUCObpnviMfc
         UQwQXkO9slpKHs1s7GtvhwzQ4y5fMkxXCxY857a4Q0+jBi2Jf6/Mzozv+UbqRur7jOG0
         4ibAYe2v8L0jfFTZ+tZOY7A2zrIwsi/zgxBSRDaZSjhuxt9Vcnn1RO0WIioPaNxpNQui
         imIHAEb23sY3tBaiaqjZMBzI1IkecMc9eBL7QaCEnVxGGo6VcUdeXc1SwqxRzvfv6jXw
         GzQks1DpQnVnm1R7SFBws2Np9AjS717w+UQM+Q10g9xGYNYM5F/KVx/Kx3B6UdkiOw9i
         C5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111797; x=1730716597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMofVo8hbKk0Swbq8g7Wqb/qoQ7xBjUn4m5ktsUGG78=;
        b=jkgm44qDdWxCGX78XvCE8XnaeA3cHC+PzjZUARMOEo366C6a5JC6698bD4UHYTY3Y0
         Ywz1+9xBgOVDOkfZfHt8FftsZuW1Shwp+iw/0LNT1R2Ep1lCOmhB7vcAR7r3phGi2Auu
         5xkDrzDWw/N/JHFW79KjCYpnTj02qJ1bcwcsMtdvBY3yf5SkbUtude5TQAEvktBMBa+Z
         TRNwJt8J1Gy8QDij8FyfOjlMo8qCOrmSXopl4DHs1128d5dWTvmIxTREvU1U6JwurFR5
         y0MhDRoaE8RcRrg4MAlCBAYRpZKl57JLL1F6P56619BIkdIQwU6VRSQihwA4qxdf0wuv
         CweA==
X-Forwarded-Encrypted: i=1; AJvYcCVHAyn8A4swUjp2oAuvHyYO06TXBrY+/VaEJmXocTmnOJ14BoFRnYF/O+z0g5BhPdG1ImjwFt9ckBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YycLkjA4QbX+x+m/T70W1xKr58YvgK7oZrT+kHdEwAkVUEY9dHg
	q9H3eU2gB/GRKhDiPPPfUcqugLRQlmmGVGUVoaCQ4X3/SGPed6tRcAYA8LX3u+M=
X-Google-Smtp-Source: AGHT+IE71P+Tc8wEJl1++AmZI7Lie6dR5rgB/dlxrq9d7RRZ7akirpK4bMRLI/OEdqic/AucIdtIBA==
X-Received: by 2002:a17:907:7da2:b0:a9a:6752:ba80 with SMTP id a640c23a62f3a-a9de5d6e1dcmr779581466b.5.1730111796750;
        Mon, 28 Oct 2024 03:36:36 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30c7af41sm362413266b.157.2024.10.28.03.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:36:36 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 28 Oct 2024 11:36:59 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 14/14] arm64: defconfig: Enable RP1 misc/clock/gpio
 drivers
Message-ID: <Zx9pS-195by58cEN@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <6964b1728d155b85c9c97fe26726e8ee2c04abf8.1728300190.git.andrea.porta@suse.com>
 <7y4rgefxfst5y7xgvtwhv6dulxjd7ieou5jlqi3waqwyw6vpuq@xken3govscld>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7y4rgefxfst5y7xgvtwhv6dulxjd7ieou5jlqi3waqwyw6vpuq@xken3govscld>

Hi Krzysztof,

On 08:32 Tue 08 Oct     , Krzysztof Kozlowski wrote:
> On Mon, Oct 07, 2024 at 02:39:57PM +0200, Andrea della Porta wrote:
> > Select the RP1 drivers needed to operate the PCI endpoint containing
> > several peripherals such as Ethernet and USB Controller. This chip is
> > present on RaspberryPi 5.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  arch/arm64/configs/defconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 5fdbfea7a5b2..5fcd9ae0d373 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -609,6 +609,7 @@ CONFIG_PINCTRL_QCM2290=y
> >  CONFIG_PINCTRL_QCS404=y
> >  CONFIG_PINCTRL_QDF2XXX=y
> >  CONFIG_PINCTRL_QDU1000=y
> > +CONFIG_PINCTRL_RP1=y
> 
> Module, that's not a SoC component.

This driver was born as a builtin only one, indeed it is bool and not
tristate in Kconfig and is registered through builtin_platform_driver().
Hence I've set it =y in defconfig. A quick check transforming it to be
dynamically loaded as a module confirm that something is not working, and
I agree with you that, in theory, this should also be a loadable module.
I need some investigation on that though...

Many thanks,
Andrea

> 
> >  CONFIG_PINCTRL_SA8775P=y
> >  CONFIG_PINCTRL_SC7180=y
> 
> Best regards,
> Krzysztof
> 

