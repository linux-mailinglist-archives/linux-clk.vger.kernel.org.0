Return-Path: <linux-clk+bounces-11657-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAF4969D92
	for <lists+linux-clk@lfdr.de>; Tue,  3 Sep 2024 14:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28D901F22A68
	for <lists+linux-clk@lfdr.de>; Tue,  3 Sep 2024 12:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CE71CEAC4;
	Tue,  3 Sep 2024 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IbY6SCP4"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A74E1C9879
	for <linux-clk@vger.kernel.org>; Tue,  3 Sep 2024 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725366555; cv=none; b=IrWB6AcO2fLfJoDmxUtzlgGI29L/RPfUy4ADK4HufImGqLtKJtYzKf8Rmb9Q60UBUBeZFkvf85p+oXYNtlaJGhFgZgwuHcNPuOjl0oL3egT151MS3ekkHAS5Jt90a8AophexG2LtRC9DGZJzJ8+Gd45eOg+B7Yx5pvzq7mfO7iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725366555; c=relaxed/simple;
	bh=LYZ3g1BOQrAmEV2a5L00wMHSlNaPPgLH0lWGP87X9VE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvq3mmcm37MBbvmNl5FB4Y1hQ88/oKNrt/aBF5aUFMgtukR2HIC0wivIav/77iMh3/O7J7m6lR8GuLbYUTcfqLjvIt5frDs28hS3EmDVEdTNaHkAwoPL6oToqZgP+KxpyoKSwFNl42wFAYgkg/CtiHfQc3waqyHai021smJNrsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IbY6SCP4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-533488ffaebso6308044e87.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Sep 2024 05:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725366551; x=1725971351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQaEXKZRWyREIUo8wC8RcTnNWfD1rXPNnUAij9Sr27k=;
        b=IbY6SCP4WWPPL2wU29cTSHcvBDgNnVeuU2grWCJXHhk+8cJGN+SSnRloO9PpTLhe4b
         LfHYLzWEfoCva2m/GdE8rJ7f62g5YKa0X0eUeeJlCOfybn5LI79N6kFW66kvOiFeQsI4
         nwhl2hdZbXWiAMrbE89ngBhyAfDA6Df5AKAs07lJUXb6dklEVIGdpN3/ZMrhQn61wc8k
         NCfOuJ+8YGx7apRuj0krn9P0DlpMk0AeQ+/8hLUd/EjOSK4WIsr6Fz8kMpCSPR04ocF7
         Ur+e4xK+Hlp8/W0ymMOcrQ9WaxoE++Mj9jQUuF92/3dQCfDuJ/lUIytA6SwFu0eK6Jvt
         /r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725366551; x=1725971351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQaEXKZRWyREIUo8wC8RcTnNWfD1rXPNnUAij9Sr27k=;
        b=eS/D3J01IeM9zKHpA5IrGTIkLJe3k4HFGYGOCPLEjc2Bha8dptstwt/x8t4yO20YmW
         sNMd+K6/+8mUJ1Ah2S4srw5yjDK9OLO1Ib/HLkpc9vzi2VSGdfqJZEprLJ+YMwiVAm3+
         plxvPWR6/U3vJ0DWR/sfmtZDSiOpoTjqPzLhfmTpuMtNYjzpwXG8tVlj79aFxo0GjF9t
         lRsd+f0HGyJxDO1K83pBZKv9b6WkoCXbILfS9aWXV08ODYi1douq9KPplXqCw80y11qf
         TRMk7QHxT8YxNCxxWWdwZjKRGDh6VUcWsIb8rmtmJZo39nkG4Wrv9+jV2ebsSj3nXuL1
         KyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe14kLIldItoQZ7rsTueGeQQAK927XNc9VE6jZJIncUHExnbPp6NY1OM8R0qnCypL44mdrYAZOWWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiExgQX9v+vU/Cyw3gp7lnVukp7ybhKmGoiY65uYBYKtFVxUbj
	uekuM4KFq5MJjkIsExWBt5aO4w1dY0iTJZ7U7rTfsbL/C7OAbYH7P1lMsUSYGbU=
X-Google-Smtp-Source: AGHT+IFq5h7rZ8oQIIXm6nz6CibNpWmLcPJNLG4TGtm/2ICu6a9ZqKTz9NHYYqSXDVwrc61upSj1pQ==
X-Received: by 2002:a05:6512:2254:b0:530:ea60:7e07 with SMTP id 2adb3069b0e04-53546bb9455mr9237621e87.58.1725366550821;
        Tue, 03 Sep 2024 05:29:10 -0700 (PDT)
Received: from localhost (host-80-182-198-72.retail.telecomitalia.it. [80.182.198.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d7834sm688285166b.177.2024.09.03.05.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:29:10 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 3 Sep 2024 14:29:18 +0200
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stefan Wahren <wahrenst@gmx.net>, Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 05/11] vmlinux.lds.h: Preserve DTB sections from being
 discarded after init
Message-ID: <ZtcBHvI9JxgH9iFT@apocalypse>
References: <cover.1724159867.git.andrea.porta@suse.com>
 <12d0909b1612fb6d2caa42b4fda5e5ae63d623a3.1724159867.git.andrea.porta@suse.com>
 <2113b8df52164733a0ee3860bb793d6e.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2113b8df52164733a0ee3860bb793d6e.sboyd@kernel.org>

Hi Stephen,

On 12:46 Fri 30 Aug     , Stephen Boyd wrote:
> Quoting Andrea della Porta (2024-08-20 07:36:07)
> > The special section .dtb.init.rodata contains dtb and dtbo compiled
> > as objects inside the kernel and ends up in .init.data sectiion that
> > will be discarded early after the init phase. This is a problem for
> > builtin drivers that apply dtb overlay at runtime since this happens
> > later (e.g. during bus enumeration) and also for modules that should
> > be able to do it dynamically during runtime.
> > Move the dtb section to .data.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  include/asm-generic/vmlinux.lds.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index ad6afc5c4918..3ae9097774b0 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -365,6 +365,7 @@
> >         TRACE_PRINTKS()                                                 \
> >         BPF_RAW_TP()                                                    \
> >         TRACEPOINT_STR()                                                \
> > +       KERNEL_DTB()                                                    \
> 
> The KERNEL_DTB() macro shows the section name is dtb.init.rodata. Can
> you remove the ".init." part if this isn't initdata anymore? And
> shouldn't it be in the RO_DATA() macro?

Ack.

> 
> It would be nice to keep the initdata properties when this isn't used
> after init as well. Perhaps we need another macro and/or filename to
> indicate that the DTB{O} can be thrown away after init/module init.

We can certainly add some more filename extension that would place the
relevant data in a droppable section. 
Throwing away the dtb/o after init is like the actual KERNEL_DTB macro that
is adding teh data to section .init.data, but this would mean t would be
useful only at very early init stage, just like for CONFIG_OF_UNITTEST.
Throwing after module init could be more difficult though, I think,
for example we're not sure when to discard the section in case of deferred
modules probe.

Many thanks,
Andrea

