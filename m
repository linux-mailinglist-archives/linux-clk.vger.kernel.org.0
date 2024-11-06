Return-Path: <linux-clk+bounces-14308-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D79BF074
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 15:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11C85285917
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 14:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078522022EC;
	Wed,  6 Nov 2024 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kwhu1hMd"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4D4201244
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730903717; cv=none; b=GOvSc9wFFMgAeZlASqDbwZ/O5Qh5LNC7l9EXm0JiNumrOR5ASI1evJuHeLxYcDmGGQHuiTc2i1oVDRz1djv+h6YxZI1ZKCnsCLbgHrTxgDBsRJ5jpjc8IK7l6raK5ctSMEoFCRuYlGq/Db14sBIWMav2rLR+alu7mAEbQEs1rzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730903717; c=relaxed/simple;
	bh=pQjjbYSj4ZS6KPiNFYIWrrPq6MbXf9GGUul0EVfRfJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOAeI4wSPdckfzO42iR2/4ObE9mgcWxwEB5cwGVgKGPA/lR2zEeU4TO+CDY5m3LS5ZtM/3YWtglSi33Px8SaZxSw7CW/VsLRx5VTt4pYT5axuYXrqVbynocml7iUQMihwRlPJdl0Ln8gCpdFN11bNPMAPnWuBtvRXQsUqQU9yj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kwhu1hMd; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53b34ed38easo6576187e87.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 06:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730903714; x=1731508514; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bnXDazCQ0RtTKBnn8REjgqiFnugp5BLQz0FcP1jAvLs=;
        b=kwhu1hMdYaqiDRrEWOEtqnnrD6fpYEThus7x6Rqi81/29HRpJPnDRjkE31H3Xoei5F
         n8DZKxZ1L2kIgxv2Gv10StnMIpAlsTyKg6UyveFt1hJ/BIdm/tlYpDicN4REVZnxZsYK
         jT3dAX4rsC+Rc+s3l0/3/aSWEsR0k3MvPQLCzxUc3VWCihlIk22HBdudHDMxxjCL9TXN
         6w8AQys05SJ3UXZcgsZaFJJtKGLibYlLz5GFr1+sMUxLcCpJhcJZwSYLGbUwuMIz6S5T
         F+/j7YLRMZ+SGhsUMZoakXD9gPAbVKPL/WNvF3/EkcTWr8sibqImD8Q+klOpx7I0bvsk
         Yx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730903714; x=1731508514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnXDazCQ0RtTKBnn8REjgqiFnugp5BLQz0FcP1jAvLs=;
        b=SQ5MPSRiTJybAVdN7JdykyrOl05BVV3ozwYNe/EsW894oopRsJP1Me+pKOp0allgXK
         BKYu5YglCtbHlOqU9O41zVSXjEkholbY5fN3L6h86Bu/XYXJhKwSn9DDjQBlH2y580pi
         vn3U6rR8zMTqNFPj9owv9M/hb9yLVFuqXxhs8mCJBEG+XhnVsH88TNQe7E593Kzo1evM
         4/hsuTOu8yOPLSKlCPO2AYzAwOo4B68C8drgsQlExk05geF6e7rj18yQTuTtPeS9KYHM
         noCsOFn+qtmd4V9s8KpKxA5X3xufJA5fH7Xx4Gz/vY1vuckEBpPVcuzAqeLx/Htyveim
         95Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVDLeOV5ZHTp7xZKwrwGC7+2gAdWe9VJzjH7qdgjauLHQHAu/T202aqKcXeqPzazgPQSzt5Bho8QnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3wgk423VoyBeQF16+2e0mhXoCD66BRMp8KPQ/qTDnbCds0ZkQ
	herTpCHa2G954PD0BiKSLtd23ltvEpg8+T+JLg1YCqQe0Jhv+4IOCP1guJPgFQ==
X-Google-Smtp-Source: AGHT+IFY7xsniFJYwZTMCPs0XA34VZgv3LQnQ0nmsY4lMKbdJP685p4rmkNLWAvlojUA7tIwGlZepw==
X-Received: by 2002:a05:6512:1324:b0:539:8980:2009 with SMTP id 2adb3069b0e04-53b348e76femr20895757e87.36.1730903714190;
        Wed, 06 Nov 2024 06:35:14 -0800 (PST)
Received: from thinkpad ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa7378e9sm26380495e9.37.2024.11.06.06.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:35:13 -0800 (PST)
Date: Wed, 6 Nov 2024 14:35:11 +0000
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
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
Message-ID: <20241106143511.2ao7nwjrxi3tiatt@thinkpad>
References: <20241104150521.r4hbsurw4dbzlxpg@thinkpad>
 <20241104234937.GA1446920@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104234937.GA1446920@bhelgaas>

On Mon, Nov 04, 2024 at 05:49:37PM -0600, Bjorn Helgaas wrote:
> On Mon, Nov 04, 2024 at 08:35:21PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Nov 04, 2024 at 09:54:57AM +0100, Andrea della Porta wrote:
> > > On 22:39 Sat 02 Nov     , Manivannan Sadhasivam wrote:
> > > > On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
> > > > > When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> > > > > incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> > > > > bridge, the window should instead be in PCI address space. Call
> > > > > pci_bus_address() on the resource in order to obtain the PCI bus
> > > > > address.
> > > > 
> > > > of_pci_prop_ranges() could be called for PCI devices also (not just PCI
> > > > bridges), right?
> > > 
> > > Correct. Please note however that while the PCI-PCI bridge has the parent
> > > address in CPU space, an endpoint device has it in PCI space: here we're
> > > focusing on the bridge part. It probably used to work before since in many
> > > cases the CPU and PCI address are the same, but it breaks down when they
> > > differ.
> > 
> > When you say 'focusing', you are specifically referring to the
> > bridge part of this API I believe. But I don't see a check for the
> > bridge in your change, which is what concerning me. Am I missing
> > something?
> 
> I think we want this change for all devices in the PCI address
> domain, including PCI-PCI bridges and endpoints, don't we?  All those
> "ranges" addresses should be in the PCI domain.
> 

Yeah, right. I was slightly confused by the commit message. Maybe including a
sentence about how the change will work fine for endpoint devices would help.
Also, why it went unnoticed till now (ie., both CPU and PCI addresses are same
in many SoCs).

Also there should be a fixes tag (also CC stable) since this is a potential bug
fix.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

