Return-Path: <linux-clk+bounces-17985-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE6DA34BE9
	for <lists+linux-clk@lfdr.de>; Thu, 13 Feb 2025 18:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98F14164A3D
	for <lists+linux-clk@lfdr.de>; Thu, 13 Feb 2025 17:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E173C20766B;
	Thu, 13 Feb 2025 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CDFqEyi6"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E261A28A2D6
	for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 17:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467802; cv=none; b=uYjl/KrclbkkowN3VtUkD0XiDez/+2TgRnkg1QQ+eJXkUcYn0JJ/O4qFFSbKueoTSeQASp9DME4afmQJ5Ys/TchDYzg7kJX1TAYstgOYAbCFvnzhmJ5UmlWP9JCH1mROanxzM0Kh6NsS0hYGoUjouYiM/FLI9jvxQoD/T5y56ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467802; c=relaxed/simple;
	bh=zCyaallTEZbcZi+JylNVW9wmEI/TBI8/RQryPjwOpa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUqJhz3Pl4dgfIJF9y63vdMCeGw8u7y5+0ElQUgdzdvRBbZtf+JBxlFQK8Jm9qflMQjkylZYSF/SH8OLIm9Sv5FhxXzF5TIaJfvL+C0Jm3i2MXz8AXtQr9ah96xJsevvoKy5uR3gcbNPnmOIgVn6Rr9jCHKelbBiOuOh8birj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=CDFqEyi6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so150824066b.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 09:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739467799; x=1740072599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCyaallTEZbcZi+JylNVW9wmEI/TBI8/RQryPjwOpa8=;
        b=CDFqEyi6Bv1HleC6Cy5siHHPDLJcf1a8cOladBbrJPFmDSCj334wcT0TT2E1pub8Rf
         LUG1nNpfJkCazIiYf2tXd0UrjkIps4ePzQRuqgiB7mXMtjC8acdpxZtwIk7nHV86Eoz5
         L00571aJCrVOWwF4ktJPpY1HjgK7i9G6SyM2KCi+FeY1wB2gArrUebDZKNjJj5bkZwP/
         WKPi82jRW/5qvsAZtvh2jPudofvlki+RrzyXNElThwP/gDj6dCwhJ8aRVEe872XEBFou
         bDj2rNyCMXhJjIJ0IkmHlZ3KMcRqAUnCJ4hxaU7zVqoFb42MzSDcoAEx36Oaxs06DoJA
         beWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467799; x=1740072599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCyaallTEZbcZi+JylNVW9wmEI/TBI8/RQryPjwOpa8=;
        b=U8jtmSTvzfr5HSqBtzzoE8XLSWXVUdbeHtx8agBL1hli6qIyPYvZo6VGiJB8++RIZo
         nT7PGQivGPowX8xlL5c4pqlEGd5QVtfXZ9VVDc/FD2TjqHiKsB3ZRAzLYLBDRWX52jV9
         xGBSHMd/Pf5uMp/QM8BpoWMkCW7kyGD1Xcy79tNSZCyJJYCN9K5eD6YlG7sljgyR+uvq
         OsssxBm1Pvs1+x1Y0d4H0rNT5hcq1MAgglgDvogZ4aw5RU4AxS5ypOvzAuVtrJviGFk5
         u2/Tai8xQzbelic/cyD6mOgJZ7yeSVVgLNXggjVWvCaUkDZaa7JvNCiuMEd508IFvPIE
         C8xw==
X-Forwarded-Encrypted: i=1; AJvYcCXq3sK/0VHu3D96hOAPii1DudBOwwddqqpd+XTIJxG877ZMHaKYTegoQOnrTwPePZBaWHd1lK3X8OY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHh7V+LQ6Z4s4JZ55YQDLB1LpZtA7f+OKz0wGWG9LcbclTtLz1
	8gV+Fu83d9GWQ7qZ3ITX5JLrL9drmQNsNvDqCVPr1X5YWg+pDs+5b1dralMvZVmtkReFSWlD3P7
	Ni/aZyVPNOIkOiPC+xdTZp7za7jdL0zWXSaEhIA==
X-Gm-Gg: ASbGnctyJLm326yuRQDuysOEQWosjP+b+dujkLi495CuNULlCKfmO2RQUvgbnoHdhWv
	YpkNrG/8Q8inFByQA11JhiBwOUXoTws/TLgn9sKr1v501FZN3jQdWgWnb3oxlqHvaVCmpPVYyBU
	zyB7cLjvovukNOUId1sMhKDIVkk1NJ
X-Google-Smtp-Source: AGHT+IEHpzGOhWWzUiRDzPOLNzp9YXUJMsGD72YcUx4PUeutR3aym3wR77yLoxsgRGXTk2VSMsiRI1k+qJ+nezQ3KC8=
X-Received: by 2002:a17:907:86a7:b0:ab7:c284:7245 with SMTP id
 a640c23a62f3a-ab7f339c875mr683201066b.18.1739467799148; Thu, 13 Feb 2025
 09:29:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com> <20250213180733.11999e07@bootlin.com>
In-Reply-To: <20250213180733.11999e07@bootlin.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 17:29:47 +0000
X-Gm-Features: AWEUYZklu9_MY3YY8SePLjBKtjUgGs0eTYBH-ezMm1VNb2UMos7_-NKxbQAJTns
Message-ID: <CAMEGJJ2FB-wwyOtjjCmPJ-vUDpZaV-8MMXxV13qXnKxYSzt9pw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrea della Porta <andrea.porta@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, kw@linux.com, 
	Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, lpieralisi@kernel.org, 
	luca.ceresoli@bootlin.com, manivannan.sadhasivam@linaro.org, 
	masahiroy@kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, saravanak@google.com, Stephen Boyd <sboyd@kernel.org>, 
	thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, 
	Will Deacon <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Herv=C3=A9,

On Thu, 13 Feb 2025 at 17:07, Herve Codina <herve.codina@bootlin.com> wrote=
:
>
> On Thu, 13 Feb 2025 16:30:44 +0000
> Phil Elwell <phil@raspberrypi.com> wrote:
>
> > Hi Andrew,
> >
> > On Thu, 13 Feb 2025 at 16:27, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > On Thu, Feb 13, 2025 at 05:14:35PM +0100, Herve Codina wrote:
> > > > Hi Phil,
> > > >
> > > > On Thu, 13 Feb 2025 15:18:45 +0000
> > > > Phil Elwell <phil@raspberrypi.com> wrote:
> > > >
> > > > > Hi Andrea,
> > > > >
> > > > > The problem with this approach (loading an overlay from the RP1 P=
CIe
> > > > > driver), and it's one that I have raised with you offline, is tha=
t
> > > > > (unless anyone can prove otherwise) it becomes impossible to crea=
te a
> > > > > Pi 5 DTS file which makes use of the RP1's resources. How do you
> > > > > declare something as simple as a button wired to an RP1 GPIO, or =
fan
> > > > > connected to a PWM output?
> > >
> > > Where is this button or fan? On a pluggable board? Isn't that what
> > > overlays are for, and they are stackable. So when you probe the
> > > pluggable board via its eeprom etc, you find the overlay and load it?
> >
> > In the Raspberry Pi ecosystem it would be the firmware that applies
> > the overlay, and it can't do that if the resources the overlay refers
> > to are not yet present in the dtb.
>
> What do you mean by the 'the resources are not yet present in the dtb' ?

Consider the fan connector on the Pi 5 PCB. It is wired to GPIO 45 on
RP1. In our current Pi 5 dtb there is an instance of pwm-fan whose
"pwms" property links to rp1_pwm node, which declares a PWM block on
RP1. Similarly, the camera and display ports make use of I2C
interfaces on RP1. The camera and display overlays, applied by the
firmware, have references to those interfaces.

If RP1 is not present in the dtb then neither of those scenarios -
board features and overlays applied the firmware - will work because
the necessary nodes and symbols are not present until the kernel has
started running, at which point dtb has been handed over.

> Also what you call the 'firmware' is the bootloader ? the kernel ?
> Can you tell me who is the 'firmware' what is the mecanisme it uses to
> load the overlay.

In the case of the Pi 5, the firmware is an EEPROM image containing
code run by the VPU embedded processor. It can load overlays using the
same mechanisms it uses to load the kernel - SD/EMMC, NVME, USB, TFTP,
etc. The same problem would exist for U-boot. Even though RP1 has a
standard XHCI controller, U-boot wouldn't be able to detect it and
make use of it, say to load a kernel from a USB stick, because it
isn't declared in the DTB.

Phil

