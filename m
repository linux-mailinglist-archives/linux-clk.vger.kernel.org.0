Return-Path: <linux-clk+bounces-14364-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94E9C02DD
	for <lists+linux-clk@lfdr.de>; Thu,  7 Nov 2024 11:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6D328189C
	for <lists+linux-clk@lfdr.de>; Thu,  7 Nov 2024 10:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447BD1F4294;
	Thu,  7 Nov 2024 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnxxY7Ps"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334511F4263
	for <linux-clk@vger.kernel.org>; Thu,  7 Nov 2024 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976525; cv=none; b=qGegoiosBqPS2ia14J4iQISMjuybdlWEvAS6N6YKIrgLJKV81Sad8GA5N/kaf06+vLatBVEVaEQ2Xv0aadBVChNCxz6vxXBmogOBVyclCpQhHuFxruM2aRcp/btm7tnwTW0aB5Kdrv0RAZ7n6YSRyUSBWjhu9xj4RH5I/u+zD/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976525; c=relaxed/simple;
	bh=MBPycbdj9FiE3ovlDl7f7aUyiX0+YRucuRI+BpDOsbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgvxeajsYhOlI8C5QAjQe1QQ86XeDPJh5N8/1pymRFactebrSOJmUTVsqkmVUzNZuN8+XbArOKVO/4vkUd0BCuB8TPx8u6k3m77XH+SxXkFLMnme+SRFc3AgbZiZ2U2ymUo7ZrnHUU3LlEFmGiCL3zlf7liORFFXocxrj1vr3vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SnxxY7Ps; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43155afca99so10946565e9.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Nov 2024 02:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730976521; x=1731581321; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nQgl/AX8mMVE9EUDQBv/3f4z18FoWTN9mAKyzIZgOL4=;
        b=SnxxY7Psu9NGwS38KYnUTgPhdDrP4TdkvC83Z5zLLYx74zNeHCaxHnKWZv20hXa/c4
         lDBKuolBIRM/DP5ouXZnqqOOzuP1ityhY8zMBoynQFufQL5/qX7KOW7Ffmj4uJMHW79C
         pXs1wqPyetNJx3uZ7LouUru86E9v4dcpKYjAsYVgqlzWABIJzOJVNTPqmrBGngkcjcao
         H/0EhLNrGsZ2Xi0+6wGvBJA8pujqU98AEW3oS9efjVuPgerJP3JLF5JxQQ6agAUTPAfo
         ZgZS3/vxtgJOvPaRdvkeZR0z+DIsOR4kC48USvMpmtChnyTlSUZb1zTcji0+Q6mWc6Qs
         CVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730976521; x=1731581321;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQgl/AX8mMVE9EUDQBv/3f4z18FoWTN9mAKyzIZgOL4=;
        b=maq2s3falnuElFotajRKB97TkDs9xh9mZgepcAbvQ+SfuDQ9GmGzJd/2UjrBMEdSRT
         QKPuYF2lNSa0cqsRgsKuKh9ge07wg5yGrnObODro++2Nb+WG/LIkjXwA1jR7J+Hmz0XZ
         mcY8q8lCT05NJ8yqfE2KdR9z+yqVC3GvDi1eoJFnuHbRLFzjVBGyPEeRLZ8zR9QW/wQ7
         KQzgvIZT4uMkWBJFXPWusAGhBos0lcS7Yy1zTd8vv2nqmJGicBp8QzohJCLmZGcWZt3W
         NNpKu8GuLgxmHaUuTFCxmCEmXEUS7UWfLy80jHmh5uPYvc0aLG81GfuKjusEOcfWcAFE
         +VJA==
X-Forwarded-Encrypted: i=1; AJvYcCUURqluGrUO7xGTLmjHwW1tz7f3f9brZhibSQRWpGSJf9MSqT7wijen4KjDnAJ0qM8AtYH884u+alY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ydrxjEo1is3k+0MlrroUBFqkTigP9/JVKtZtE5D9/dVfBKt8
	KAi6HG7eEf6NwGxUpLjXEuj1JgnV5QXSHxbtVcrCFyuxu7pOmMaE1nd0ON9dDg==
X-Google-Smtp-Source: AGHT+IHB/YpX7yDBIiMKQf1XABXotq1JmIw871lEb1D2SOU7hMooBIqwLjF+jMYHMwzyvT2gdYzl5g==
X-Received: by 2002:a05:6000:400e:b0:381:eba9:12c7 with SMTP id ffacd0b85a97d-381ec61f7aemr2189560f8f.27.1730976521502;
        Thu, 07 Nov 2024 02:48:41 -0800 (PST)
Received: from thinkpad ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054a5ccsm19688595e9.11.2024.11.07.02.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 02:48:40 -0800 (PST)
Date: Thu, 7 Nov 2024 10:48:37 +0000
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
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
Subject: Re: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU bus
 address to dynamic bridge nodes
Message-ID: <20241107104837.pre7tgc3mdb7lyit@thinkpad>
References: <20241104150521.r4hbsurw4dbzlxpg@thinkpad>
 <20241104234937.GA1446920@bhelgaas>
 <20241106143511.2ao7nwjrxi3tiatt@thinkpad>
 <ZyyDLaWsikcNw4wT@apocalypse>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyyDLaWsikcNw4wT@apocalypse>

On Thu, Nov 07, 2024 at 10:06:53AM +0100, Andrea della Porta wrote:
> Hi Manivannan,
> 
> On 14:35 Wed 06 Nov     , Manivannan Sadhasivam wrote:
> > On Mon, Nov 04, 2024 at 05:49:37PM -0600, Bjorn Helgaas wrote:
> > > On Mon, Nov 04, 2024 at 08:35:21PM +0530, Manivannan Sadhasivam wrote:
> > > > On Mon, Nov 04, 2024 at 09:54:57AM +0100, Andrea della Porta wrote:
> > > > > On 22:39 Sat 02 Nov     , Manivannan Sadhasivam wrote:
> > > > > > On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
> > > > > > > When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> > > > > > > incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> > > > > > > bridge, the window should instead be in PCI address space. Call
> > > > > > > pci_bus_address() on the resource in order to obtain the PCI bus
> > > > > > > address.
> > > > > > 
> > > > > > of_pci_prop_ranges() could be called for PCI devices also (not just PCI
> > > > > > bridges), right?
> > > > > 
> > > > > Correct. Please note however that while the PCI-PCI bridge has the parent
> > > > > address in CPU space, an endpoint device has it in PCI space: here we're
> > > > > focusing on the bridge part. It probably used to work before since in many
> > > > > cases the CPU and PCI address are the same, but it breaks down when they
> > > > > differ.
> > > > 
> > > > When you say 'focusing', you are specifically referring to the
> > > > bridge part of this API I believe. But I don't see a check for the
> > > > bridge in your change, which is what concerning me. Am I missing
> > > > something?
> > > 
> > > I think we want this change for all devices in the PCI address
> > > domain, including PCI-PCI bridges and endpoints, don't we?  All those
> > > "ranges" addresses should be in the PCI domain.
> > > 
> > 
> > Yeah, right. I was slightly confused by the commit message. Maybe including a
> > sentence about how the change will work fine for endpoint devices would help.
> > Also, why it went unnoticed till now (ie., both CPU and PCI addresses are same
> > in many SoCs).
> 
> Sorry for the (admittedly) confusing explanation from my side. What I would
> have really liked to convey is that although the root complex (that is itself
> a bridge) is the ultimate 'translator' between CPU and PCI addresses, all the
> other entities are of course under PCI address space. In fact, any resource
> submitted to of_pci_set_address() is intended to be a PCI bus address,
> and this is valid for both sub-bridges and EPs.
> 

Sounds good. We usually have empty ranges for PCI bridges (1:1 mapping), so that
also lead to the confusion at my end.

> > 
> > Also there should be a fixes tag (also CC stable) since this is a potential bug
> > fix.
> 
> Sure. I think it could be better to resend this specific patch (and maybe also the 
> patch "of: address: Preserve the flags portion on 1:1 dma-ranges mapping", which
> is also a kind of bugfix) as standalone ones instead of prerequisites for the RP1
> patchset, if it's not a concern to anyone...
> 

In fact, it is recommended to send fixes separately (or at the start of the
series). So there should be no concerns.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

