Return-Path: <linux-clk+bounces-17314-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 846A9A17F46
	for <lists+linux-clk@lfdr.de>; Tue, 21 Jan 2025 14:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E0361886F58
	for <lists+linux-clk@lfdr.de>; Tue, 21 Jan 2025 13:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97B61F37BB;
	Tue, 21 Jan 2025 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T9e5cQEv"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F21F2380
	for <linux-clk@vger.kernel.org>; Tue, 21 Jan 2025 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737467913; cv=none; b=aGTeWnqhtBC92HNdgYxRylu6YTxdMJQNYDP6r2CW4HXqVCBMxqv7GNmDQtmDmretFL9tqxpaFZIyVYx3amjSeY9DNiJ9kGUaMLRYIXFayN0o6F7CKdFpcUKR2BA/cGLYcIgdHW6KLGWSQ1cg2OdyWn6Bg9oZVgOpq5U6ObMEs2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737467913; c=relaxed/simple;
	bh=jQzXuU3BlH5a1zJ/BamQoNSatZlIbAHnl77mcwz9/Dk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhuXOVBOY97QdGjB41v0eQ5xwA9tJyGwa2CYPqe7JGRhj7+tCRqtvlanrqxZbMsbJDEHpSLLc7zmefcorm7GS5mqkulRg8Z5SLtlTC87tRgv4ilq6rDd7tJvFZDXNnBC19PkS6+8GNY50pWRqLFvbpUTM2zF9Qgq10i0sGceWJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T9e5cQEv; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-aab925654d9so999211966b.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Jan 2025 05:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737467908; x=1738072708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndX+bS7mfcHIUz3eSPCBChEUR/+D/+QHPhUMGbWKkjw=;
        b=T9e5cQEvREUvXyqRhhD5eAV2nfjPCGzjN++Tz2ucCQ7EEwC+FBjJPzHZ2XSKNI/9Fd
         iFRIiYzEsSkQWN7ddx4YGD0EsgQPsKEHrkMz8Wz8CcBkdPIX+NIlzY+7GQnKoL9kzQV2
         Ycc9fAejae0ZDTsB7rcWWGW++ZG9onozPvd924M9ZVE7shwggIYiivqwxknXTqrHK6hA
         FSEGZ2jePN/9lImkKVkkW7dGqvjfM9zm58YEzyynNrIZSVM2NewPm+cW/U14SxGKHeMu
         JBSaUewH1tQV3karBYsBn9sKMnGevJBdkS4XzSxNLlhVYTd3peAER5VwYOVAVt3Iajnf
         0QCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737467908; x=1738072708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndX+bS7mfcHIUz3eSPCBChEUR/+D/+QHPhUMGbWKkjw=;
        b=aODIkc+8MnTyrz/BEaTWkC0Kf6DKUf+lYGZzSSFoRbMWKTWwNfOoEG7borUtNuHweo
         RUHgenwZQOMhq4FDsQTrPCS1+H5sGP8YqbSTw6A3WIzkxt4H3kdgMcMAQ5ITiXOeJEe+
         /gyRGa2mt5XnpHD6aSucR84/JFKzBNI1YwfhTfd8Ntfv8WNzOhYWapfCuZgfL2p1U9gG
         o+M6de8RQrBah2yKTPR0kvqAy98l854T5FF/SFPycpo9/kUY+M8dS91Y8Mf6POD4YD+j
         yUwbI0V4rp8R3In9KXI8IsDwZyOX3cI8+sob2TIrVN3xtVCDAF7rNOerTbrqX9OwhXFr
         me5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4u7/8ZjdGJXKwxUzd6NL1FKEyVb7Zc4iLgCt3JmfVJD9ro0/wkfJRFccjwOs5vlzvrS3yAjMVW/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuFatoRSz9NzEnPhSQm/Q584glm7GKrHBk1A9bKSQ/D1IfbBFf
	kzbiS43PabeICaaU1Op0aVN8b2uHUi9XRg8We+AfdaKgYF7VMhFVW+VNBcqfYgY=
X-Gm-Gg: ASbGncvPOs/37LF9KCKOah+aTQz4UL5uHf5wA95wIukvigNll6wM+TS7mwLZDaDWx1V
	CfDEMNnYfTmeXzV7CslxDB/0ndMn4KBhv01KN2O7YTuEZ5KgVmXsg3HNrisf5VgDD4pGIL/yG7q
	9t+8rYu2OqBbapKunPU4ZrA9cwtaV6fbQVMgbSiNh+0DIw+NVrgWUQ5DmtzM+IU6mtwOPvo3DKI
	0EyZ9yBHAxAUdsCRlQt8AT3VPjYQ+zAySx5eED9P6HV04/s6fOGHGCp/kq+PBDAIw46Bvmv4vSx
	IcYeARQbXd0I8Jx2lOUESRNiq9kYf/S2OPWAwUNk
X-Google-Smtp-Source: AGHT+IGUuk+xvGmbiQD3bRfCbckgBF2RVH3B6tetIFWqVCQnsVutS7iL+mu2n84MUq9YEhicZgprHw==
X-Received: by 2002:a17:906:f58e:b0:ab2:f816:c5e0 with SMTP id a640c23a62f3a-ab38b1e569cmr1477479066b.12.1737467908253;
        Tue, 21 Jan 2025 05:58:28 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c5ad98sm753624766b.28.2025.01.21.05.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 05:58:27 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 21 Jan 2025 14:59:21 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Subject: Re: [PATCH v6 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z4-oORWO4BgOqibB@apocalypse>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
 <Z49eOdVvwknOoD3E@apocalypse>
 <2025012143-rippling-rehydrate-581b@gregkh>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025012143-rippling-rehydrate-581b@gregkh>

Hi Greg,

On 09:48 Tue 21 Jan     , Greg Kroah-Hartman wrote:
> On Tue, Jan 21, 2025 at 09:43:37AM +0100, Andrea della Porta wrote:
> > Hi Greg,
> > 
> > On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:
> > > On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:
> > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > and others.
> > > > 
> > > > Implement a bare minimum driver to operate the RP1, leveraging
> > > > actual OF based driver implementations for the on-board peripherals
> > > > by loading a devicetree overlay during driver probe.
> > > > 
> > > > The peripherals are accessed by mapping MMIO registers starting
> > > > from PCI BAR1 region.
> > > > 
> > > > With the overlay approach we can achieve more generic and agnostic
> > > > approach to managing this chipset, being that it is a PCI endpoint
> > > > and could possibly be reused in other hw implementations. The
> > > > presented approach is also used by Bootlin's Microchip LAN966x
> > > > patchset (see link) as well, for a similar chipset.
> > > > 
> > > > For reasons why this driver is contained in drivers/misc, please
> > > > check the links.
> > > 
> > > Links aren't always around all the time, please document it here why
> > > this is needed, and then links can "add to" that summary.
> > 
> > Ack.
> > 
> > > 
> > > > This driver is heavily based on downstream code from RaspberryPi
> > > > Foundation, and the original author is Phil Elwell.
> > > > 
> > > > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > 
> > ...
> > 
> > > > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > > > new file mode 100644
> > > > index 000000000000..3e8ba3fa7fd5
> > > > --- /dev/null
> > > > +++ b/drivers/misc/rp1/rp1_pci.c
> > > > @@ -0,0 +1,305 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > > > + * All rights reserved.
> > > > + */
> > > > +
> > > > +#include <linux/err.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/irq.h>
> > > > +#include <linux/irqchip/chained_irq.h>
> > > > +#include <linux/irqdomain.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/msi.h>
> > > > +#include <linux/of_platform.h>
> > > > +#include <linux/pci.h>
> > > > +#include <linux/platform_device.h>
> > > > +
> > > > +#include "rp1_pci.h"
> > > 
> > > Why does a self-contained .c file need a .h file?  Please put it all in
> > > here.
> > 
> > I agree with you. Indeed, the very first version of this patch had the header
> > file placed inside the .c, but I received concerns about it and some advice to
> > do it differently, as you can see here:
> > https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
> > so I've changed it accordingly in V2. So right now I'm not sure what the
> > acceptable behaviour should be ...
> 
> It's a pretty simple rule:
> 	Only use a .h file if multiple .c files need to see the symbol.
> 
> So no .h file is needed here.

Perfect, I'll revert back that two lines to V1 then. Please be aware
though that this will trigger the following checkpatch warning:

WARNING: externs should be avoided in .c files

> 
> > > > +struct rp1_dev {
> > > > +	struct pci_dev *pdev;
> > > > +	struct irq_domain *domain;
> > > > +	struct irq_data *pcie_irqds[64];
> > > > +	void __iomem *bar1;
> > > > +	int ovcs_id;	/* overlay changeset id */
> > > > +	bool level_triggered_irq[RP1_INT_END];
> > > > +};
> > > > +
> > > > +static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
> > > > +{
> > > > +	iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_SET + MSIX_CFG(hwirq));
> > > 
> > > Do your writes need a read to flush them properly?  Or can they handle
> > > this automatically?
> > >
> > 
> > I had some thoughts with RaspberryPi foundation folks to double check it, and it
> > seems that there should be no need to readback the value (unless we want to go
> > really paranoid), so I would avoid that since in case of level handled interrupt
> > we would end up reading the register on every triggering interrupts.
> 
> Ok, if it passes testing, that's fine, hopefully it works properly, but
> if not, you now have a trail to go and fix it in the future :)

Sure :)

Many thanks,
Andrea

> 
> thanks,
> 
> greg k-h

