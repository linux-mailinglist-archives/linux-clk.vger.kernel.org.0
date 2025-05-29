Return-Path: <linux-clk+bounces-22419-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE06BAC7C99
	for <lists+linux-clk@lfdr.de>; Thu, 29 May 2025 13:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3FAD4E095C
	for <lists+linux-clk@lfdr.de>; Thu, 29 May 2025 11:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B750E28E59D;
	Thu, 29 May 2025 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gc5xKezy"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D7D242D85
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 11:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517669; cv=none; b=ficpXtN/nvr/0/Wc8ShBxNjmaRZizwD+5HkD9u/ANkVzUnB7CvM6VY0hMgnexUackISPPViSAm9WsnDhLQjjmjDVqo/pwsvOyicL9de7vQfvPOS67j1LMSKTG/BiNugx5iyGgZwIGPI5SssqV2FWfAJXgi8RYAIo9VrbDkLEJhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517669; c=relaxed/simple;
	bh=vShDvPk9+kZ+VCTHxgHNzgcGR8RHuX9zZUoWFOCLXxs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkJs2KFf9C1t8FMmBccuh+QL1sjVWSXXveBfTXwirsj2RK7glSD9b15IUz9YRRRq8qQlDj5wzxoH3Kqnp6wMi1ewSOstS0gAoLaFA60Yo+rEG+bXgiqC6PNhNdKrvnlrIzkQQ6bzxga8TNlPfnzSSdJNgejq09pLy3xueqhl4p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gc5xKezy; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-ad88d77314bso146809966b.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 04:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517666; x=1749122466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rgxPKVq6wwZTho8Z5w88rjxN+cD9bfwQRNHyzTFMlas=;
        b=gc5xKezy+JtGb+Mgob7PNk4l8ExuavrXvJSGef/+vfjXSvdEwuIrzjyMoPQ4jmlMfd
         xcnb9PLWXErsgnup7mW6xAZDX1SYqgl70IPtGLxWrX65O+VpNoJi8Ylj+l9odIpYzHCu
         +NRiCDkdtEVS/rsHIUgBzQvscdq8X5pJRB9GokGSzn1/DHJjOh8cRkSRSYSH7GPPRuYM
         au18y+e3N1sS+kJpCJDCHupopcp7GwNMmfi1Zjog5BXJuL+Wf9FGjBMR/qEknlbHJRUK
         3S5M0FVrMi84GgeeHcvCKHwzA7n5kNBTgvdSYd2IFC6w6W2EuBqMVGugToXDgnqN/FRU
         h53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517666; x=1749122466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgxPKVq6wwZTho8Z5w88rjxN+cD9bfwQRNHyzTFMlas=;
        b=Re1TCyPDpPlmHqpXoHqQUV/gI7BzWCpyUX9AhA34jfm30sr0vurRca0w7OPL4Wvvtm
         v7n5kLec9VrdpabWmHeUEtyGsZwTc5COIQlhAjFNetj8D9u0QM6QjP0Qj61A+NBdekG8
         g8xqvdct/8zB2041LzrtjON6YK8ft8WQDelB/Z4/jQT651CA3CG1gew4CvleSwA6QoUz
         EehzoDs4/H2i13XAPLAqyFGv5r8i/vVdja/lsgujJ7tdCdSFK1eibNOzlnUR3h8CpepG
         nP5vB3QVLa/TgBf7VbRuc1RH9f1mYD28wG9/fpfxDMZWvU4G5SBRYiagdJwdHnRNo/ou
         283A==
X-Forwarded-Encrypted: i=1; AJvYcCU2DB5BF8r/NQyYXMEorA1YB6qZGHiHH/U63CsVCwfUeEXC7hSGJEUm+2nDWWFijqYcDw1zCXnQPbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxxBeVvYA1XK3wND3aYUa7Vzld5CqhPhtsNDylg1o2PvSCuOO3
	XBL+orNJi3f3YQpQ3+cxrMAgSv32fXQCaWI1ptOaiESqG6XWlpTOew5E7u0ZaXZzQN8=
X-Gm-Gg: ASbGncvEzNQUF7clUJ0TkUtFmwl/iQamr7KtiX7WFhoh7CBAeNKkHuCnLiMRP/gfMLt
	c11LpCfYA3DSdxENwnFfkg/+N7wtZcnrPM8Vvk4tWpKd4llnLApA3x3oMs9JYPwPToJPu37IRAs
	ISlD3DGcXVckf0UthjFet0om/8//LuGa3ObqFyN4mFcLovHDnH4bz9OyxaCTXdxXwOF7EyK1nPZ
	oLdu+xJvaijcDQeZRhmtLJ0wyvvQDyqWZFJSkQNrMyHTWkBMgg7HSr0qW2uyCSaz9j+xgoK4Mdr
	uwVvGVjrhtu6hFo/Sdzskh2znvwvIcKj+vk1db8kEHiD82QKrQJOuABFNHCsZTLiidA72O4C+Bq
	QfoPPoYIfAAm2elTE7gr+WuDx2bUpCkXt
X-Google-Smtp-Source: AGHT+IHkWFZgWfVC3wsduslv1JW97TLkP+ID17A3dJTf4p7mD0EKIiXxaa5IifbRmSh1qLG7Wy61mg==
X-Received: by 2002:a17:907:2d9e:b0:ad8:8efe:3206 with SMTP id a640c23a62f3a-adadeeb9748mr168671666b.42.1748517665519;
        Thu, 29 May 2025 04:21:05 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d95bsm125977666b.57.2025.05.29.04.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:21:05 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 13:22:40 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v10 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aDhDgJtLp9Fhs7V9@apocalypse>
References: <cover.1748514765.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>

Please ignore this set since it has clobbered sequence number in subject.
I'll resend it in a moment.

Apologies for the inconvenience,
Andrea

On 12:49 Thu 29 May     , Andrea della Porta wrote:
> RP1 is an MFD chipset that acts as a south-bridge PCIe endpoint sporting
> a pletora of subdevices (i.e.  Ethernet, USB host controller, I2C, PWM,
> etc.) whose registers are all reachable starting from an offset from the
> BAR address.  The main point here is that while the RP1 as an endpoint
> itself is discoverable via usual PCI enumeraiton, the devices it contains
> are not discoverable and must be declared e.g. via the devicetree.
> 
> This patchset is an attempt to provide a minimum infrastructure to allow
> the RP1 chipset to be discovered and perpherals it contains to be added
> from a devictree overlay loaded during RP1 PCI endpoint enumeration. To
> ensure compatibility with downstream, a devicetree already comprising the
> RP1 node is also provided, so it's not strictly necessary to use the
> dynamically loaded overlay if the devicetree is already fully defined at
> the origin.
> To achieve this modularity, the RP1 node DT definitions are arranged by
> file inclusion as per following schema (the arrow points to the includer,
> see also [9]):
>  
>  rp1-pci.dtso         rp1.dtso
>      ^                    ^
>      |                    |
> rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b.dts
>                                                ^
>                                                |
>                                            bcm2712-rpi-5-b-ovl-rp1.dts
> 
> Followup patches should add support for the several peripherals contained
> in RP1.
> 
> This work is based upon dowstream drivers code and the proposal from RH
> et al. (see [1] and [2]). A similar approach is also pursued in [3].
> 
> The patches are ordered as follows:
> 
> -PATCHES 1 to 3: add binding schemas for clock, gpio and RP1 peripherals.
>  They are needed to support the other peripherals, e.g. the ethernet mac
>  depends on a clock generated by RP1 and the phy is reset through the
>  on-board gpio controller.
> 
> -PATCH 4 and 5: add clock and gpio device drivers.
> 
> -PATCH 6: the devicetree node describing the RP1 chipset. 
> 
> -PATCH 7: this is the main patch to support RP1 chipset. It can work
>  either with a fully defined devicetree (i.e. one that already included
>  the rp1 node since boot time) or with a runtime loaded dtb overlay
>  which is linked as binary blob in the driver obj. This duality is
>  useful to comply with both downstream and upstream needs (see [9]).
>  The real dtso is in devicetree folder while the dtso in driver folder is
>  just a placeholder to include the real dtso.
>  In this way it is possible to check the dtso against dt-bindings.
>  The reason why drivers/misc has been selected as containing folder
>  for this driver can be seen in [6], [7] and [8].
> 
> -PATCH 8: add the external clock node (used by RP1) to the main dts.
> 
> -PATCH 9: the fully fledged devictree containing also the rp1 node.
>  This devicetree is functionally similar to the one downstream is using.
> 
> -PATCH 10 (OPTIONAL): this patch introduces a new scenario about how
>  the rp1 node is specified and loaded in DT. On top of the base DT
>  (without rp1 node), the fw loads this overlay and the end result is
>  the same devicetree as in patch 9, which is then passed to the next
>  stage (either the kernel or u-boot/bootloader).
>  While this patch is not strictly necessary and can therefore be dropped
>  (see [10]), it's not introducing much extra work and maybe can come
>  in handy while debugging.
> 
> -PATCH 11: add the relevant kernel CONFIG_ options to defconfig.
> 
> -PATCH 12: enable CONFIG_OF_OVERLAY in order for 'make defconfig'
>  to produce a configuration valid for the RP1 driver. Without this
>  patch, the user has to explicitly enable it since the misc driver
>  depends on OF_OVERLAY.
> 
> -PATCH 13: collect all changes for MAINTAINERS file.
> 
> This patchset is also a first attempt to be more agnostic wrt hardware
> description standards such as OF devicetree and ACPI, where 'agnostic'
> means "using DT in coexistence with ACPI", as been already promoted
> by e.g. AL (see [4]). Although there's currently no evidence it will also
> run out of the box on purely ACPI system, it is a first step towards
> that direction.
> 
> Many thanks,
> Andrea della Porta
> 
> Links:
> - [1]: https://lpc.events/event/17/contributions/1421/attachments/1337/2680/LPC2023%20Non-discoverable%20devices%20in%20PCI.pdf
> - [2]: https://lore.kernel.org/lkml/20230419231155.GA899497-robh@kernel.org/t/
> - [3]: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/#t
> - [4]: https://lore.kernel.org/all/73e05c77-6d53-4aae-95ac-415456ff0ae4@lunn.ch/
> - [5]: https://lore.kernel.org/all/20240626104544.14233-1-svarbanov@suse.de/
> - [6]: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
> - [7]: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
> - [8]: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
> - [9]: https://lore.kernel.org/all/Z87wTfChRC5Ruwc0@apocalypse/
> - [10]: https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com/#t
> 
> CHANGES IN V10
> 
> 
> PATCH RELATED -------------------------------------------------
> 
> - Patch 10,11,12: Added: Reviewed-by: Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> - Patches reworked to apply cleanly on broadcom/stblinux branches:
>   patch 1,2,3,6,8,9,10 -> devicetree/next
>   patch 11,12 -> defconfig/next
>   patch 4,5,7 -> drivers/next
>   patch 13 -> maintainers/next
> 
> - Patch 13: new patch gathering all changes for MAINTAINERS
> 
> 
> RP1 CLOCK DRIVER ------------------------------------
> 
> - Dropped some WARN_ONCE() lines that are basically useless
> 
> - rp1_clock_set_parent() now returns EINVAL in case the parent check
>   is failing. As a result, rp1_clock_set_rate_and_parent() has also
>   been adapted to return rp1_clock_set_parent() retcode.
> 
> - Return an ERR_PTR from rp1_register_clock() instead of just NULL
> 
> - Dropped some unaesthetic blank lines
> 
> - Disabled the builtin locking in regmap since we're already dealing
>   with concurrency in the code
> 
> - rp1_clk_probe(): dropped dev_err_probe() as redundant due to commit
>   12a0fd23e870 ("clk: Print an error when clk registration fails")
> 

