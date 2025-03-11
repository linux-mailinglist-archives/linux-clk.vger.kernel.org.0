Return-Path: <linux-clk+bounces-19341-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE32A5BF26
	for <lists+linux-clk@lfdr.de>; Tue, 11 Mar 2025 12:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A637175351
	for <lists+linux-clk@lfdr.de>; Tue, 11 Mar 2025 11:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7F9254867;
	Tue, 11 Mar 2025 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FlYvAtbW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDAB253B46
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741692954; cv=none; b=Ld5V2r4n/FlYVyvPvtjIxc02xqW9aVSFxmF3wVjWx4BmFFJEkoBlsXR+PXWyVeBFbYH5Vs4XlIrudmSltVKnL9IDBiov+zkxMTzbhQpvZFIjbbmrue/dLQw8JHN9s7sazSyhaLQYLld+3iPbGGmtXB8/UCEAcdQ8ljPuAClZXLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741692954; c=relaxed/simple;
	bh=H8WHtwt8NwohMFMSJyOYCpjReRpfvizxw55BJZSel9E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLmoPQLQ0JDTz1HLU6jTtu/xY5w+zAFe3fslwVyoA4GLS4AcyGXt6OsLeqJNFfdBVXGaAwkhgsL/+dTB4Vit8bGvNzgINsbfdVF103oZ9zU7Jw02Gd7qGfsIO4mGLOMtHUMc46afLrXZlbeKXtm6E1oBcn1DMDnq8UTmUQ5H+YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FlYvAtbW; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac25d2b2354so656010966b.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 04:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741692950; x=1742297750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRhhFOV50S8nkiKWbxOQjhnR/D7pnJ4RjNLNNRoG574=;
        b=FlYvAtbWUQ783/BLA7JdmBN+i3taWgiMQfwzZ3MEwXpGQr5NXq59uc5Lys34D6Xqd2
         KgFi0rEeyRNHRWcHVedFgHoLfiDJB+yYrlvS88+uMh8x5je/gnuyUBdUF14wybfr46Gg
         lo5jWxagxDkLNH19pX/MyWbrFCBSwbMkj4soo1HKlN/6NmoKbp1vo0PBps4bC4WwQucA
         gdyLsrnJVokl1sU+7ZwSaGnImjSMFDat3BNRpBdf7BpDq3SjxQsnDlJWTCTLgWObUTcR
         PzhHG0vz+Feq6HFnQvARiEmpqNcCwzUSGSkYmsPQBQcncT4QF6FZAzSrkL0yJZ8pESs+
         iGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741692950; x=1742297750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRhhFOV50S8nkiKWbxOQjhnR/D7pnJ4RjNLNNRoG574=;
        b=bGxysx8cN41uvvBjHZ/pL2cCFYV8/MNPhCLmcYCZKY3ItV5qtvVZN9PeiEXIQXC2e6
         nqS4Vl1DgatTKiHuPCpiz9DpL/+pWkoTiKpPks3pn5ltfvSA2ca2Qzy54nkilUBoZ2BC
         eAcRrQd+eFJEjXlamubj1lDV2SLOwrnpzr6CqnV0jZ6Ndn6e/ATxpCJSRfVsEpQ3lp46
         vmJaUVnrElZxL6Zv2OK+c7GeHba8hRfgu7jZhIjiy4ZWv2wGU47kYaNO4DzeMu5KmQvf
         10Y4o1oZeTrII6C4VAGBg6uVxqwIdWOon/Eee8dn1YYsKSV2d7H7vGlO1V9kd94OPd/r
         ZHHg==
X-Forwarded-Encrypted: i=1; AJvYcCVAoXJvhp4t+axb3mRQZCsLxxboYcsKpbFJR+aRLUKaLH1qsVIbWLsL+7TXtEfkSQ8aPy9OGiD/C88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7GB9cEteziBlvZOhA1sQsGS8K8jaIpswDachCxm3jG0R0xf0
	JMhKO4i+DDE7RT2xKsfi3+SJo8g8tnfK22IHbAxi78X3Vcu9yEKKqcB+I0CdKz8=
X-Gm-Gg: ASbGnctTrGVGEucY37a0Q9lv/VCnUhP1sND0d4mARUd6rFdIVksftAM/QA4W+fJ7RoU
	bHWoFOknZH1wSj6dDEQXISP9nLt7dYTaCr/7aYZbzBazwDfeItBre57mgQC0XCkP25ApgbgPl6G
	vc8OK/QXWqAJq+GgpxNNhCqa+iQSCoNHmgS4votuJ4YTXSIV1D4ZmoAsnNUoy2R92Hb631bQtZu
	M8Rau2X4qKTYZwc9mkrMcMquwQA48YOh1FWWaqC6SjTZW2kb0Ls70bmCbAFcMWTNovnfSI45CH7
	xl0+gI1eKreczv6n0wEmg6UWH0d28ps6eUeAFBLQWBo3xeADp8x16z5M3zkSqojW54ebkoijk03
	cQFdg0RvtvWcO
X-Google-Smtp-Source: AGHT+IGVJsJ/tQDtRk3D58VsHDhx/tt/Tli65otubVC+55JrPtE5bG4yX5BvCZyT6vnF2dPKlEKCgA==
X-Received: by 2002:a17:907:3e16:b0:abf:fb78:6743 with SMTP id a640c23a62f3a-ac252fa0fedmr2145428366b.35.1741692949753;
        Tue, 11 Mar 2025 04:35:49 -0700 (PDT)
Received: from localhost (host-87-14-236-98.retail.telecomitalia.it. [87.14.236.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2a65c7f7esm277405266b.117.2025.03.11.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 04:35:49 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 11 Mar 2025 12:36:59 +0100
To: Krzysztof Wilczynski <kw@linux.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: Re: [PATCH v7 03/11] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
Message-ID: <Z9AgW1TEiJ3G9dvh@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <c0acc51a7210fb30cae7b26f4ad1f0449beed95e.1738963156.git.andrea.porta@suse.com>
 <20250310212125.GB2377483@rocinante>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310212125.GB2377483@rocinante>

Hi Krzysztof,

On 06:21 Tue 11 Mar     , Krzysztof Wilczynski wrote:
> Hello,
> 
> [...]
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d45c88955072..af2e4652bf3b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19752,6 +19752,7 @@ RASPBERRY PI RP1 PCI DRIVER
> >  M:	Andrea della Porta <andrea.porta@suse.com>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > +F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> >  F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> >  F:	include/dt-bindings/clock/rp1.h
> >  F:	include/dt-bindings/misc/rp1.h
> 
> I would be happy to pick this via the PCI tree as per the standard
> operating procedure.  However, the MAINTAINERS changes do not exist
> for us yet, and are added in the first patch of the series, which is
> not ideal.
> 
> I can add the missing dependency manually, but that would cause issues
> for linux-next tree, which is also not ideal.
> 
> I saw some review feedback, as such, when you are going to be sending
> another version, can you make MAINTAINERS changes to be the last patch,
> perhaps.  Basically, something standalone that perhaps whoever will pick
> the misc patch could also pick and apply at the same time.

Sure, I will split the changes for MAINTAINERS file to its own separate
patch in the next revision.

Many thanks,
Andrea

> 
> Alternatively, someone else picking up the PCI dt-bindings would work, too.
> 
> Your thoughts?
> 
> Thank you!
> 
> 	Krzysztof

