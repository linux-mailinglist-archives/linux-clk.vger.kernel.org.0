Return-Path: <linux-clk+bounces-11538-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D618966C3C
	for <lists+linux-clk@lfdr.de>; Sat, 31 Aug 2024 00:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED9B428439C
	for <lists+linux-clk@lfdr.de>; Fri, 30 Aug 2024 22:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F501C1AA1;
	Fri, 30 Aug 2024 22:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dXd8fPOJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393831C1759
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 22:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725056660; cv=none; b=B6S/SnABshtTHLW3IcsJPWGVtZuvT82UBov5O2fSswyhV3PsvgjSpkJ58rnqmvCR2AYAqcww9+y7B2sytbhmlQ/x4pu/TILWDUjZDjlfqi7LYtOLmkS7b21ndjzYqtFuEwPXiqKHfLrjAacFP1z+HpEHobGOPZd6miZeLsoCtYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725056660; c=relaxed/simple;
	bh=I2A/VR8wR7MpkPgXSTzbihxC7ZqnWdWFXtl6dOWUKTI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8+YU4ze/dO6SkDWhEzjT4iqvZJ6Bv7NWiU56RIA7Grxb0nMTDqfeoOmQFHDAoWv8rRWcrBI7dyJ5mFrK/hcecFsmHJwS3WPtXc1UFrdOXB1bG3Lh4arsvNDSYC9TS7MdtIBWrztFTD37hpRnULII2BX++U5nQGl3nhamkCzXHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dXd8fPOJ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso3899187e87.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 15:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725056655; x=1725661455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZByxaspb+X+I9ALGw8uaa+qlzTqyVZ4/M5r6mYzzVAk=;
        b=dXd8fPOJivpjU9934mEMb5iskqoxP1XsRCfT1iv3UeOLS+xGNphOgAMEIIAOnolOyd
         gGrHhbRlOyj4BD3pVXncRvj9NFFgqhTN4O9aqgiiqULX1MQpPnYJUCPgqFrte0bz6w0A
         D+Ym26vHtVgbaIHhwPdGtkLrSEXXwNyNFLV1RxNrAN1sqTvnWTZbDTCvQ+N912Iz57gj
         Atc903vT873+CpP9bKoPSl00WWqv4pcUBfu7vSGObrm8kVG/clsVvqQDNXLWYM9hd7Rf
         1NvSh04Hr4dPiB87cTy5HYmRFoA8LSshl4srzV0k+r4OZ4PakN6g+6qhFR2KPVakPrK7
         UYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725056655; x=1725661455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZByxaspb+X+I9ALGw8uaa+qlzTqyVZ4/M5r6mYzzVAk=;
        b=VjGi+gzTbEnDhag11OdjIj/jDazxdQ68S+A+n6tDCKm/PJx1SJvDrdy4VbJmUyhH4Y
         00sVGRAZnglB3PptbP1EEpsucazoWLaPTE8W5SGU16zE5s2jqqYfDfUFfDvRekWYU8Uj
         XVfpaL7c5veOUl06A8RWsESlND4XoEyvuQLG2SrpbtYPt8LlSRx0ZzItBSMRXKHv773m
         UsF1X43SVlOSBS6CR4i95ee+MKqlgo+l6GL3yzqcliubixmvpuoyS+vEjWm2zvXASL7Q
         WlMZRJ55GuRS2GyoNH2BqkICGygyquZ8Ebmufbl5ptkJv9tGKkZKgMgOS762imkN9I9p
         zCjg==
X-Forwarded-Encrypted: i=1; AJvYcCVLu2gszmhr371dtiA87F44Zsfk7rc1jyJeG4QAgDoS5hxtcuLjFxCtgFp3Qyr8uquJ76vFZ4lg5kc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjx4SJ+SsRe9mceMUE14wIF5SLT4weK8QekTUF5deMa2+lYwcH
	1vHALRdVgI5E7l8+5HM29jooRK/5dKpdRxkfngiSAuJ0P+8ikIdOC2TGZrLDnJE=
X-Google-Smtp-Source: AGHT+IEvdHooOQ4c79uL08xEr1R8wS5rhUagjmDM7pNj1mHniRMIUAYAy3nLL08iJ8o1/B9AwpJ1xg==
X-Received: by 2002:a05:6512:4011:b0:52e:a008:8f55 with SMTP id 2adb3069b0e04-53546b8d58cmr2395569e87.41.1725056654728;
        Fri, 30 Aug 2024 15:24:14 -0700 (PDT)
Received: from localhost (host-80-182-198-72.pool80182.interbusiness.it. [80.182.198.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891a3e52sm256742866b.116.2024.08.30.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 15:24:14 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sat, 31 Aug 2024 00:24:21 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 09/11] arm64: defconfig: Enable RP1 misc/clock/gpio
 drivers as built-in
Message-ID: <ZtJGlX19ODk1mmrA@apocalypse>
References: <cover.1724159867.git.andrea.porta@suse.com>
 <7ec76ec9b10ef1d840a566dab35497bf2d40b437.1724159867.git.andrea.porta@suse.com>
 <woewl6x7zyetuv3lc22kkmk2pptbfgoribtk6ziqmwjqxnm6rl@npv7tkquzqym>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <woewl6x7zyetuv3lc22kkmk2pptbfgoribtk6ziqmwjqxnm6rl@npv7tkquzqym>

Hi Krzysztof,

On 10:47 Wed 21 Aug     , Krzysztof Kozlowski wrote:
> On Tue, Aug 20, 2024 at 04:36:11PM +0200, Andrea della Porta wrote:
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
> > index 7d32fca64996..e7615c464680 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -606,6 +606,7 @@ CONFIG_PINCTRL_QCM2290=y
> >  CONFIG_PINCTRL_QCS404=y
> >  CONFIG_PINCTRL_QDF2XXX=y
> >  CONFIG_PINCTRL_QDU1000=y
> > +CONFIG_PINCTRL_RP1=y
> >  CONFIG_PINCTRL_SA8775P=y
> >  CONFIG_PINCTRL_SC7180=y
> >  CONFIG_PINCTRL_SC7280=y
> > @@ -685,6 +686,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
> >  CONFIG_SENSORS_SL28CPLD=m
> >  CONFIG_SENSORS_INA2XX=m
> >  CONFIG_SENSORS_INA3221=m
> > +CONFIG_MISC_RP1=y
> 
> Module?

Ack.

> 
> >  CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
> >  CONFIG_CPU_THERMAL=y
> >  CONFIG_DEVFREQ_THERMAL=y
> > @@ -1259,6 +1261,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
> >  CONFIG_COMMON_CLK_FSL_SAI=y
> >  CONFIG_COMMON_CLK_S2MPS11=y
> >  CONFIG_COMMON_CLK_PWM=y
> > +CONFIG_COMMON_CLK_RP1=y
> 
> Module?

Ack.

Many thanks,
Andrea

> 
> >  CONFIG_COMMON_CLK_RS9_PCIE=y
> >  CONFIG_COMMON_CLK_VC3=y
> >  CONFIG_COMMON_CLK_VC5=y
> > -- 
> > 2.35.3
> > 

