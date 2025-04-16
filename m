Return-Path: <linux-clk+bounces-20709-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 108BEA90A7B
	for <lists+linux-clk@lfdr.de>; Wed, 16 Apr 2025 19:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B5694476E0
	for <lists+linux-clk@lfdr.de>; Wed, 16 Apr 2025 17:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8A8218EBD;
	Wed, 16 Apr 2025 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cPZHhQRz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4A218AC0
	for <linux-clk@vger.kernel.org>; Wed, 16 Apr 2025 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825895; cv=none; b=POFNTSnxp0ZYdojCmB6XOj7Kp4Fr4+0+sCVh+8qN9R/+wbdnlGwhTDzw6ucXAhbwR+RKfRuXby6PBj1ockV7YT9PxnP/iOhBKqWg1e21eiJnV9nhw1Tx8WRQIAP8WwgrL9bJO9nBFUcv/7qjBOlDxzxUkLlvFsJys85+XraMalA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825895; c=relaxed/simple;
	bh=TBZ3+IULu0N+duqvjfzo4MbqJH8vZN2SCabf43+KQyI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSdOv/Pwab54Vvm8dJbarxufazT94GR97Ccbjesfpte6bVDPyOSNLD89qAGNSMB4Jiy+RqTama3JUdZXx+2TCYXnhyllpZyk1o1sSQKGGStTa9rm89LafbABNbdwCvjTxrVY74TtKtq8h/H+Bd2G+cTeqbULZqK2Aj69rWr7Id8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cPZHhQRz; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5f4c5eb520dso997919a12.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Apr 2025 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744825891; x=1745430691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xlBoDFGfwAiK0YOXlC4SwDB4WdN2STB65PhvVY3kGQ=;
        b=cPZHhQRzzydDIk7JgVIWYDsaKXxgVTfyDSeP7v8JK8BDcHa2puEK1LNdNqVYhBKuFO
         rPWDic4nMpbi7UXdJ0mpxoF3fKY5dF0k8/9Vgu68txTMuYlwpOf7JelTsg5c9ipwlPeO
         BJepNfAEVEjQrpVfMA0TFqhm7L8CD8WEl/ZU2KFgFIJ2yegC61g2i1WbMi1wPijepvvu
         fJkh9d1Js9YEO3sWWrmlqFnhj/+6kDbMmOV2cPIFo8ByePmcmg62HQhcghoJicMoI4/7
         qqucvQxh4jWl7IWNIVanfIzUZSZmxOw5yf+ztwVNGDG2B6x7do/OYOu/JvJ1Zi0q9YeL
         F7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744825891; x=1745430691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xlBoDFGfwAiK0YOXlC4SwDB4WdN2STB65PhvVY3kGQ=;
        b=MKMwN9Jeuln3vH+5khe3mn40ze1TRpavDz5Z3IvQYyIHmPeTtKH/0MPB13alFJBzUx
         q+Nu8nQibgy0twiWzS+Gp4Bm50WBgWO68RE5a3X1CoJ2ook5CnqUMUCKFDIbTI4Wy8Be
         jo7xJfYKr/BgmyDcTZWb5uVpXcWIs2guJuZ5xQX5ap1TA2oiHMY1MzcIWdC2fTkaqPPT
         l4extaVMPx+7cEEFfNz68JiW94R0ppwlp3CGmWLAoDXiZT2hBo+Bjm9tNa8Wa3/MJTjs
         H9ZDIvR4W02vIubNT2C7u92f+yk2DRqqOJGWIxWrdfe+rjRy6YlUE86eyGjeN5pPifw8
         nJxg==
X-Forwarded-Encrypted: i=1; AJvYcCVR0xWb+ESCBR/+G7Lekgqjg1VroA8Q8hUgmqFfV94ivmFwtf+dQelEQyLckhwTHOggd9mbu1ZZ/0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg0whVQANSvlHgueuekXUc7EsH+NQFCi2WQFe+VFCdk034muAC
	vVajlXvC0sAwrHcNj5gXDC/znDsFAQEgP5hKauHtKs6OYrxfj5ITSCiuybvJeLg=
X-Gm-Gg: ASbGncs8CNlfeoEotf3MjHVaviYEx73Vw72MzuiNWlK4hTRs/oF23cR6MIqO8o9mhjZ
	AH5Va1tExidq3LfBtypsj8UlZ7QPlQt9RW5ojryqpvKw1nkxZUJj5HP4C8X3gKbIai8DqaiebIv
	dehsVuITgH8/tNdaLXqdA09Lruvzy1c0FJ11sBebPS+1yM5Yt5+YcfZYhsCpTCh9aHbJxnrd+pu
	craxrejnTfSlqlnrudn1F7EB0Iy+Z7wqgyU4cSDGneWBGFfvalQThVsx83pmTdUL2cw8F0mZ8tj
	d8//ckk5A8qq7+BAYwPaMyN86xHiPD8RLVTLf02p4tFvZJ2zXx9UHL/YPKhnksGNzuuG+K8=
X-Google-Smtp-Source: AGHT+IG8ocY2R4u3MSMUM8wLm0cAOVd+8ApQg05RyBRV3UoKUWOsni8cwFhkPXwWINMuR8awGmVJfQ==
X-Received: by 2002:a17:907:3d0e:b0:ac3:853e:4345 with SMTP id a640c23a62f3a-acb42ac181emr250869466b.45.1744825891181;
        Wed, 16 Apr 2025 10:51:31 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cde06f8sm167165366b.61.2025.04.16.10.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:51:30 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 19:52:54 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
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
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 10/13] arm64: dts: Add overlay for RP1 device
Message-ID: <Z__udrXkRz-5DSB6@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <ab9ab3536baf5fdf6016f2a01044f00034189291.1742418429.git.andrea.porta@suse.com>
 <abb3405a-45fb-4425-a817-89a03b0c16c4@gmx.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abb3405a-45fb-4425-a817-89a03b0c16c4@gmx.net>

Hi Stefan,

On 13:38 Mon 14 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> just a nit. Could you please add "broadcom:" to the subject?

Consider it done.

Many thanks,
Andrea

> 
> Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > Define the RP1 node in an overlay. The inclusion tree is
> > as follow (the arrow points to the includer):
> > 
> >                        rp1.dtso
> >                            ^
> >                            |
> > rp1-common.dtsi ----> rp1-nexus.dtsi
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> > This patch can be considered optional, since it fills just the second
> > scenario as detailed in [1], which is the RP1 DT node loaded from a dtb
> > overlay by the FW at early boot stage.
> > This may be useful for debug purpose, but as such not strictly necessary.
> > 
> > [1] https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com/#t
> > ---
> >   arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
> >   arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
> >   2 files changed, 13 insertions(+), 1 deletion(-)
> >   create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
> > index 4836c6da5bee..58293f9c16ab 100644
> > --- a/arch/arm64/boot/dts/broadcom/Makefile
> > +++ b/arch/arm64/boot/dts/broadcom/Makefile
> > @@ -13,7 +13,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
> >   			      bcm2837-rpi-3-b.dtb \
> >   			      bcm2837-rpi-3-b-plus.dtb \
> >   			      bcm2837-rpi-cm3-io3.dtb \
> > -			      bcm2837-rpi-zero-2-w.dtb
> > +			      bcm2837-rpi-zero-2-w.dtb \
> > +			      rp1.dtbo
> >   subdir-y	+= bcmbca
> >   subdir-y	+= northstar2
> > diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > new file mode 100644
> > index 000000000000..ab4f146d22c0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > @@ -0,0 +1,11 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&pcie2 {
> > +	#address-cells = <3>;
> > +	#size-cells = <2>;
> > +
> > +	#include "rp1-nexus.dtsi"
> > +};
> 

