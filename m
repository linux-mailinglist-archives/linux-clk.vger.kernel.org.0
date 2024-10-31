Return-Path: <linux-clk+bounces-14082-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7382F9B7D3F
	for <lists+linux-clk@lfdr.de>; Thu, 31 Oct 2024 15:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A64A1F245F0
	for <lists+linux-clk@lfdr.de>; Thu, 31 Oct 2024 14:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CCA1A3020;
	Thu, 31 Oct 2024 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JigHa9wD"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85951A262D
	for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385990; cv=none; b=PJHYTOQ2f8bQPLmretmOf9oaGP31ybZbNMpvwKBNTSx7Gr1KeQDMstVPQkK1pX+7CvsikkY/CKeAusH/o6ADhGssZve7rI8njudBrfsbXsZKvNAnF3dBa+zIHP2mCqvIAl/n60WZjHezhJTsKDKkEQWUYH/NMEHDG6dciuO7aBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385990; c=relaxed/simple;
	bh=ehYS0/ZZQ0XEcholrijqQu2XW7HUON0Q4qS6E3K47wo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgzOurHySh6em8//CKIT0q2nmMSrJUufsc9hbS2mf4dud75Pi2pLG+jV2/KPSvCs0OWgOkgWYUAEfB+OEPxwEp5R0IYB/CjEFCOrvprembYtLNq1vP7pvCITq7X5dmTC5NhuqE+btwkScHIw4lNSx4RmYStp7VUzPCbctqjMpsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JigHa9wD; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a16b310f5so142639566b.0
        for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 07:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730385987; x=1730990787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypveLFvkaXf1wJtqmx/51pwj85CYlxVe18qe346szto=;
        b=JigHa9wDDYMdmPHgr+8ya+yp+Sb4oZUzO6K/SrPVfOarpc7h6ZnnXzh04hS3JYiLey
         WQipQVDhew6IXjHPKfP9K8hRJU1DxsKYPEbb/0PXRo+Bi/JzUMf0jpVF6Xw2T5CKmW1+
         5+8PZGu98bTTkO87Ksrnj5zTxQjd3EAbHvHIdCA5BUuH80md2o3GkOmga1Vo9SWx06KO
         OVjykr+ciPOjC0lFGbGqEoyCbVkBCUZeTc/o6SrO5DZKaJBkyG8RNPB3msZ5cFo1adG1
         KGubmZY1DF45W5i6yjL2m67KitUXsr+CToHq8mLHSlp+d60hbdbo7uB3gzN0GfseAWfx
         I2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730385987; x=1730990787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypveLFvkaXf1wJtqmx/51pwj85CYlxVe18qe346szto=;
        b=WlqhdrmYtlDVqVc/0e9XPriyWp9gxsHaTgSUWIStZZuKgk09HvlZFtPNe5bl75fjRj
         yQDlurJCW00f8NE3lm/RzfpTaKrLKfivhtF8BhDG3kUTh0OX3+d2wosepbb5Xj+FMaPE
         EG276+hrascl/0oxKRjf7O7ywPZvPcyuSvY3YVaDoymOZtmojLsvP3HfZlo5+FPo34Gm
         nIRBNY7QdlD5HKSFUOO8GsbjbCGEpOZJSt9IEY5m6NBVN7c2tJdHwnXgHKUBXxghuP8M
         Nj0CDEP2y3dX6lJe6nYJPk4C/AZojK6cYD2YcfxevNsTp9va9k2CllToyQ6M7PmqUiYQ
         AFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfuqKW9JWwtETzUAX/fS7KVs5d59UQKuzKiX9rdgVsPvedtAg9KXmvH6xruyZRwBZNtCdQEybm6CU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC9Wge+5LDWYZhndFBrZ/8PMcZeWMy0XfPR5jLNMriaI+VsPki
	lhy6stggo/rWCffdiO5g4S8a790uhuNXgaxGEzdE9+MFarbC3AH7/CjIbIAN7k4=
X-Google-Smtp-Source: AGHT+IHO0u8NI+kPpq4+Wzny8mwJitAvu47tgJQ19gV0TI9gjpe3yY4DuzAFhy8aDC6EsCh5Rx123g==
X-Received: by 2002:a17:907:3f9f:b0:a9a:2afc:e4d7 with SMTP id a640c23a62f3a-a9e50b948d0mr315152266b.44.1730385987116;
        Thu, 31 Oct 2024 07:46:27 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c6150sm74717766b.81.2024.10.31.07.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 07:46:26 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 31 Oct 2024 15:46:51 +0100
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v3 11/12] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
Message-ID: <ZyOYWxZZWkGnGknI@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <13ad41f172cc8605cb9b324ea0f22296c4c97033.1730123575.git.andrea.porta@suse.com>
 <eb1b630a7ee8222322d213f72ceb1c23.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb1b630a7ee8222322d213f72ceb1c23.sboyd@kernel.org>

Hi Stephen,

On 13:49 Mon 28 Oct     , Stephen Boyd wrote:
> Quoting Andrea della Porta (2024-10-28 07:07:28)
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > index 6e5a984c1d4e..efdf9abf04c4 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > @@ -38,6 +38,13 @@ clk_emmc2: clk-emmc2 {
> >                         clock-frequency = <200000000>;
> >                         clock-output-names = "emmc2-clock";
> >                 };
> > +
> > +               clk_rp1_xosc: clock-rp1-xosc {
> 
> The node name is preferred to be clock-50000000 now.

Ack.

Many thanks,
Andrea

