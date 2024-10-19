Return-Path: <linux-clk+bounces-13401-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B69A4C20
	for <lists+linux-clk@lfdr.de>; Sat, 19 Oct 2024 10:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05F6281EED
	for <lists+linux-clk@lfdr.de>; Sat, 19 Oct 2024 08:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044B21DED65;
	Sat, 19 Oct 2024 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CfZ/vSMV"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6301DE2A2
	for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327603; cv=none; b=caQJ5DV3Bt1PJfj6CmtY0J5r1mFDY6qipKZryOWYzE9gv+WQHhh7uByQAX9mHN6LHnnn3AcKmq3dfclkicFA5CbKNJcZFkjSt7AwhOfSldR7cLXnhVRC9lT8Tbv4yRhvsQtrLf/CAEOhbF8R4MhYZqfA4/eRPNhGn/YuLk+zvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327603; c=relaxed/simple;
	bh=gNbr23i1Y7tru0e0VyGj6/FwF2Lx5ttC9gneh6Z0QG0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIajDfJrl5sRR/pWnL9cLcerrUOG+JWRSfPscHmF1kUuBC4dRBDDvxxLqYyAndMkxqnouiqoS9h1j9TLIcs9T6y95s/33dk4/QAKn/oeAEAVOVyNFhAtnnPxaVA3tBH/vMEZRrY9YXdXJQW/H47ppVODmntDYH4QqQ8beIIkVFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CfZ/vSMV; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99f646ff1bso348946766b.2
        for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 01:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729327598; x=1729932398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=goIM8l9m337Jc/qmGgmMN6cGaQgYnCJzJED4V8yFMUM=;
        b=CfZ/vSMVPZo5AOU7tR2WJsdndqZveDhhHDl8Sp3gAcT3KjLdU3NAGex8ZSl+j9E1ZW
         eNw3cpBh6HGxBM9O5oFJTvLWdG8C5D4sZEqpE9gZOtyAGvjTTNg5xwsXa07fhOxM1r5C
         NRW2EGJjiony3JqOHYSe0kazfJu4Jh3kdV3QRswniXXZB6F5j61hwixdpZcAwyXyI6D7
         cyDZt/A5L/mEqB3bqd+XBI1OvpYDIA+yfBV5qbxlxTzx3ixEYn/jP54tn8TU+0pGnTBQ
         GyTlnoY/veeg2tiSnUZYHMP7zuZRZs9c8U+QM4lElzJ5QHGHkQ0Zw+WZQajLOtlOWzQ6
         HWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327598; x=1729932398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goIM8l9m337Jc/qmGgmMN6cGaQgYnCJzJED4V8yFMUM=;
        b=gUVzztb8toDyM0ZTwZCx7fXm+rfXUFHCQz1K9Kz5SNnpsQ0CAtq9eGaeEeOEMcoyqq
         x9kcpIc9MwzV7isiSDpzkC0WQZwUAhlj3MjAiWYan8EhENvWqRD4DIvSOyLH6JkMKUsF
         mn/WZTml6kj9/J3UKFsA3lcBVF203FRckmh8TuLPTr4SKs1N6KC/egX2LCLMCj/nlHHa
         CJU3AnO+FzdHX7LIyBKdkXptTOstq5OpgKhd+vb7elgIJ2bF0q2xt+NxzF2b6n8qN6+T
         7meBRrpsOuA9ozKqYHId2Nlf5oxy+1D5BQ1Ls5gEQLYNl+6zNnTc6qXByV4MqcquY25b
         r4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVWKIZiVf10Jq9KAIidXxzRob1Bd/znChIooDuL5HdszKFK1v3nXFtSTjL/tsbEwL2LsmS6I/hVCtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYANyHMYMW680VmAJ0dc0JiCO1bIpHlm9idzqS2ZUh/KG647E/
	3pB17S58Y5eC3pdHf29BmRO+S468y6tKjs1ovMWMiDnismeSAtShvMmmxzs8j2o=
X-Google-Smtp-Source: AGHT+IE6LjBSGzuHopccP4572hv/igYqTjW1d9uem80OwOh8YbiNrdYIuLnJQku+pZ2TZlmLJ4YdEQ==
X-Received: by 2002:a17:907:705:b0:a99:36ab:d843 with SMTP id a640c23a62f3a-a9a69baadbbmr400539166b.38.1729327598506;
        Sat, 19 Oct 2024 01:46:38 -0700 (PDT)
Received: from localhost (host-95-234-228-50.retail.telecomitalia.it. [95.234.228.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bf7a19sm190806966b.168.2024.10.19.01.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:46:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sat, 19 Oct 2024 10:46:58 +0200
To: Bjorn Helgaas <helgaas@kernel.org>
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
	Stefan Wahren <wahrenst@gmx.net>, Lizhi Hou <lizhi.hou@amd.com>
Subject: Re: [PATCH 03/11] PCI: of_property: Sanitize 32 bit PCI address
 parsed from DT
Message-ID: <ZxNyAuaOy6DE8sH-@apocalypse>
References: <ZxJXZ9R-Qp9CNmJk@apocalypse>
 <20241018222850.GA766393@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018222850.GA766393@bhelgaas>

Hi Bjorn,

On 17:28 Fri 18 Oct     , Bjorn Helgaas wrote:
> On Fri, Oct 18, 2024 at 02:41:11PM +0200, Andrea della Porta wrote:
> > On 20:08 Mon 07 Oct     , Bjorn Helgaas wrote:
> > ... 
> 
> > > Yes, this is exactly the problem.  The pci@0 parent and child
> > > addresses in "ranges" are both in the PCI address space.  But we
> > > start with pdev->resource[N], which is a CPU address.  To get the PCI
> > > address, we need to apply pci_bus_address().  If the host bridge
> > > windows are set up correctly, the window->offset used in
> > > pcibios_resource_to_bus() should yield the PCI bus address.
> > 
> > You mean something like this, I think:
> > 
> > @@ -129,7 +129,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
> >                 if (of_pci_get_addr_flags(&res[j], &flags))
> >                         continue;
> >  
> > -               val64 = res[j].start;
> > +               val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
> >                 of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
> >                                    false);
> >                 if (pci_is_bridge(pdev)) {
> 
> Yes.
> 
> > > I think it should look like this:
> > > 
> > >   pci@0: <0x82000000 0x0 0x00000000 0x82000000 0x0 0x00000000 0x0 0x600000>;
> > 
> > indeed, with the above patch applied, the result is exactly as you expected.
> > ...
> 
> > > > > But I don't think it works in general because there's no
> > > > > requirement that the host bridge address translation be that
> > > > > simple.  For example, if we have two host bridges, and we want
> > > > > each to have 2GB of 32-bit PCI address space starting at 0x0,
> > > > > it might look like this:
> > > > > 
> > > > >   0x00000002_00000000 -> PCI 0x00000000 (subtract 0x00000002_00000000)
> > > > >   0x00000002_80000000 -> PCI 0x00000000 (subtract 0x00000002_80000000)
> > > > > 
> > > > > In this case simply ignoring the high 32 bits of the CPU
> > > > > address isn't the correct translation for the second host
> > > > > bridge.  I think we should look at each host bridge's
> > > > > "ranges", find the difference between its parent and child
> > > > > addresses, and apply the same difference to everything below
> > > > > that bridge.
> > > > 
> > > > Not sure I've got this scenario straight: can you please provide
> > > > the topology and the bit setting (32/64 bit) for those ranges?
> > > > Also, is this scenario coming from a real use case or is it
> > > > hypothetical?
> > > 
> > > This scenario is purely hypothetical, but it's a legal topology
> > > that we should handle correctly.  It's two host bridges, with
> > > independent PCI hierarchies below them:
> > > 
> > >   Host bridge A: [mem 0x2_00000000-0x2_7fffffff window] (bus address 0x00000000-0x7fffffff)
> > >   Host bridge B: [mem 0x2_80000000-0x2_ffffffff window] (bus address 0x00000000-0x7fffffff)
> > > 
> > > Bridge A has an MMIO aperture at CPU addresses
> > > 0x2_00000000-0x2_7fffffff, and when it initiates PCI transactions on
> > > its secondary side, the PCI address is CPU_addr - 0x2_00000000.
> > > 
> > > Similarly, bridge B has an MMIO aperture at CPU addresses 
> > > 0x2_80000000-0x2_ffffffff, and when it initiates PCI transactions on 
> > > its secondary side, the PCI address is CPU_addr - 0x2_80000000.
> > > 
> > > Both hierarchies use PCI bus addresses in the 0x00000000-0x7fffffff
> > > range.  In a topology like this, you can't convert a bus address back
> > > to a CPU address unless you know which hierarchy it's in.
> > > pcibios_bus_to_resource() takes a pci_bus pointer, which tells you
> > > which hierarchy (and which host bridge address translation) to use.
> > 
> > Agreed. While I think about how to adjust that specific patch,i
> > let's drop it from this patchset since the aforementioned change is
> > properly fixing the translation issue.
> 
> OK.  I assume you mean to drop the "PCI: of_property: Sanitize 32 bit
> PCI address parsed from DT" patch?  Or replace it with the
> pci_bus_address() addition above?

I'm planning to replace that patch with the above mentioned pci_bus_address()
addition. However, I think the 32 bit sanitization is still useful to prevent
wrongly encoded address to linger around, but I defer it to a subsequent standalone
patch, after figuring out the dual bridge scenario that you proposed.

> 
> Bjorn

Many thanks,
Andrea

