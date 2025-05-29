Return-Path: <linux-clk+bounces-22453-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E207AC7EE5
	for <lists+linux-clk@lfdr.de>; Thu, 29 May 2025 15:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5160916C08A
	for <lists+linux-clk@lfdr.de>; Thu, 29 May 2025 13:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4ECD2288C6;
	Thu, 29 May 2025 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UGyMqcad"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276AC1DB551
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 13:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525855; cv=none; b=Huon0Bt8LsKZuEiCouRsPLfmtmW2xa5dW0MP4NxagtCrhj9wa84+CY9030njaO2W56Qt3XoN2j3IJ1YRYQGAFRe8Bf4uYLp1SC7SWPCWv/lf6z+TomipfN8vjThZGAZWqUb5hH/kpAvRiToWVTFHDyE8PThqlnJ5W3ofqYGONVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525855; c=relaxed/simple;
	bh=7qvdrjpOdlBvDAh2/Y7+8Ba7USpRO6EVtdx5gt1PBLc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWxJaqf08+Vmpt6BOplfIMjjRJMRVvnTQIrs/4Pr3W/2KDHFu0GsnzUZqLWDHPUNhAmL1QGnZ3Amc7IBjhzbiqbw5zqRQ+pQs/BKhEjFsxibMfBFNGGMKPM0mkXyFwTTTpA9QwvecM8a9XblsBOYpp0HY+M2mMtYAASFHoH8DlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UGyMqcad; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-602e203db66so1452372a12.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 06:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748525851; x=1749130651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGJgxS1k4sjFLENCJ0R74UHOiVaE0JfhO0ApUNQ8FHM=;
        b=UGyMqcadATKeuV2VBLDOsEAhMCNaemxh28mnsKQ03bUx48e+f7L5NV6DQs9haqOIzq
         tqJWegjNbg2laXGZ37XDuNfg2Ozhmo7dfpTXMROY+p9CSPqkLxinxvQdSqmgLgf4nyiq
         GXJjWzhWG1eY/UhJwxormCrnbTEBeGvpKeAe9HgwTNJTnOxSsK7QJfzdCQYh/KOHyJFE
         g6lfSZYAtls+KA3IeZ9GGx5kiZUdCS7C7JQTc9Mqb0p1FLk13SiZWbyWY2HU3MRzLmg6
         Q9dutbpY2/sWZM3uMxorrImnEbh4YTkevzao2AGsnMgDEUHq5RrwcnJ7+oAWNy3rO92K
         wvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525851; x=1749130651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGJgxS1k4sjFLENCJ0R74UHOiVaE0JfhO0ApUNQ8FHM=;
        b=w2HVfh4xU4/P9EE5EXpwAgrWICSBJbS3FyhrMYmKwITcKlfl4kntfMGHBW0JpocsLD
         9wLrKb5ilSzj8gAL+soUnWE7PraQMJcFQcoiCWVY37Nbe9c610OQVRBd2A6w97mX6uhN
         HL45d7AdDMatFCgx4oCsHBPiUqDjzoZ4BUjrj0NyOH65w4AbzObVlaOgoIN7lxJDwPbY
         3dg+uNhLEB3VtLZHuGJDGEcWUWkjE3CCZ2jPHmbD2JtDv3g6JtuoxmUWrpVGhNZS3dM1
         XOgY0CQx0oWMDbvEXzbQ29Nuj9X7l0hIiLif+FdvuhwkgxmXfcmgYOdChYMkPGjnOqb3
         xyng==
X-Forwarded-Encrypted: i=1; AJvYcCVxOe7aGhoo6YhTRdjDMjhBVDjI2eoW/YDOcVbpQAtZN+m1FVa0iUVa79qmGQ//H2RV1xAVUyK8tFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YytMJKHgOPqcyhi7xvyAL8KspWoH6c2pJr4VxMo/XiDTSbJuDNq
	WGL8wgsXEHJXdneFJvfjiFiCO4E6cgwKX8+Ln+MKSrtOHTyfQEIFsdew/WOlOYF+lLM=
X-Gm-Gg: ASbGncuN0d9VHThZt7uhggO0Aw/y0jAqO4DTnpKTxSe4mZWDXoMbbtwGFYsPWMhmLeT
	aKA0gRpikTcjTUsIHUobtgOYxLw7ySK5F4vbYgQBOFs+706b/JJt+lwWCqtdNK8/iP5soE5cxG5
	dPns2YV+t5s56q/uoQZPQXVf2t9S/R/gvTSul0rtPQCNfHIYSqMxztW8/fsrEGv6CXGNDdjKWNi
	OP5ibwot0aejJ6//DO3QWMw9eU5zNeTN++HinGQbuPPBb4FWSI0W2weOkwbX70y4T4iXlkayH46
	Dl+bmiqwSsGio9Dea0hdRUblaH2n1f6tab4WPOiuYlWSDsZAirAZP8Mtj9mpnXxsIiQcf/CPw44
	wO7RJmNmSWpvS+GhqfCdIgg==
X-Google-Smtp-Source: AGHT+IE89jORsxIfrZ11Z2zrlUgtzpwgSWYSGzkctmVru6WV+L9ZxyVvE4uRFiUjC5dkQM82OICRVg==
X-Received: by 2002:a17:906:6a10:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ad8a935c9b6mr508211266b.31.1748525851272;
        Thu, 29 May 2025 06:37:31 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff047sm146955766b.18.2025.05.29.06.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:37:30 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 15:39:06 +0200
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
Subject: Re: [PATCH v11 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aDhjehJxIxfNPwTr@apocalypse>
References: <cover.1748522349.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>

Again, this patchset for some reason has duplicated Message-Id for 
patches 1 to 5, so they will result as clobbered up. Please ignore 
V10 and V11, I'll send V12 which should be, hopefully, the correct one.
Sorry for that.

Andrea

On 14:43 Thu 29 May     , Andrea della Porta wrote:
> *** RESENDING PATCHSET AS V11 SINCE LAST ONE HAS CLOBBERED SEQUENCE NUMBER ***
> 
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
> CHANGES IN V11
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

