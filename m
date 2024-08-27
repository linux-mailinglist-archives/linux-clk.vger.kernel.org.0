Return-Path: <linux-clk+bounces-11268-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D16369617BE
	for <lists+linux-clk@lfdr.de>; Tue, 27 Aug 2024 21:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1099F1C234F7
	for <lists+linux-clk@lfdr.de>; Tue, 27 Aug 2024 19:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35A21D31A2;
	Tue, 27 Aug 2024 19:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="JNAVeq4x"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B6148FE5;
	Tue, 27 Aug 2024 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724785744; cv=none; b=KKkT4CQbv4YQqO3/BqfI53mcoxcRIipVL2Tt498toxl9W0JB/lfzuAaJTm/GPoqgdRE0PqOpF8nAeseCImwOlOlzG3iFeLh5eLdHtv+o6WjLxgzsLZScCQAqMgNFHCMFnLvj7dEXWxPJFzKpSYz9ki/fCDGzPW3PqbfRDPD5OLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724785744; c=relaxed/simple;
	bh=bCs2F10/la/a5He5Vc0x9d/7rblweUo1XUfMID1kayY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ss0rUvgqOFTuGWVPaOB8dh2SPP2dwiFMD8xO/NppzHE6zm49PjUFWasfJCo2+fcAL1YkGOwvC6bBJ8PKsFV4GB+6TP4KvteVgjBbVZSvs6AmTazxLgv5G3n3ics2M73rYkRrjNiASiT8VvYKWQhBKYOc+Cvnj94XTrKjTLAwt1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=JNAVeq4x; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1724785736; x=1725044936;
	bh=wtZFtUpYfRJVM6uEwMbiUQOlfn1kJh47pty0BpMfqd0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JNAVeq4xtOJHWgpQzQbeoRRhyDGCVarlj3hD3LDlJXruDSSrzXQSI2dTgcGBudDxc
	 VzQZtpli5nEX0Gv+eFgGj214HDr7z0pcZ0kuCs1AqC8rhvxSvCtOgUjR2svtimzKP2
	 BGQgiCUgWAnzgz1t/O5+bs2lsPzhYk+HAh4n6cjuruafbRgQHt24/zqXB+6lDOSMJq
	 //W+J/Hi7hZ7QLPzF/CDVOINhlcA5h4r1dslNTbq2ecyCzv4/EF06JOl/a/j2uJUXd
	 1BcwFWgzy0VW1Eua7/x9WE7TTbXqMqmsXXNIkeWknYEJR8u26hxapCa+xDFMSVeYFI
	 TtuKTcX2rRPoA==
Date: Tue, 27 Aug 2024 19:08:52 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 7/9] uio: add Xilinx user clock monitor support
Message-ID: <D3QXIGN92QZ7.S2LY531JZ1L9@protonmail.com>
In-Reply-To: <2024082655-cubicle-flashily-6ab3@gregkh>
References: <20240826123602.1872-1-hpausten@protonmail.com> <20240826123602.1872-8-hpausten@protonmail.com> <2024082655-cubicle-flashily-6ab3@gregkh>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: ec1732088562b68387aa388135c69c468b2c569f
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Aug 26, 2024 at 2:11 PM BST, Greg Kroah-Hartman wrote:
> On Mon, Aug 26, 2024 at 12:38:36PM +0000, Harry Austen wrote:
> > Xilinx clocking wizard IP core supports monitoring of up to four
> > optional user clock inputs, with a corresponding interrupt for
> > notification in change of clock state (stop, underrun, overrun or
> > glitch). Give userspace access to this monitor logic through use of the
> > UIO framework.
> >
> > Implemented as an auxiliary_driver to avoid introducing UIO dependency
> > to the main clock driver.
> >
> > Signed-off-by: Harry Austen <hpausten@protonmail.com>
> > ---
> >  drivers/uio/Kconfig            |  8 ++++
> >  drivers/uio/Makefile           |  1 +
> >  drivers/uio/uio_xlnx_clk_mon.c | 71 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 80 insertions(+)
> >  create mode 100644 drivers/uio/uio_xlnx_clk_mon.c
> >
> > diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
> > index b060dcd7c6350..ca8a53de26a67 100644
> > --- a/drivers/uio/Kconfig
> > +++ b/drivers/uio/Kconfig
> > @@ -164,4 +164,12 @@ config UIO_DFL
> >  =09    opae-sdk/tools/libopaeuio/
> >
> >  =09  If you compile this as a module, it will be called uio_dfl.
> > +
> > +config UIO_XLNX_CLK_MON
> > +=09tristate "Xilinx user clock monitor support"
> > +=09depends on COMMON_CLK_XLNX_CLKWZRD
> > +=09help
> > +=09  Userspace I/O interface to the user clock monitor logic within th=
e
> > +=09  Xilinx Clocking Wizard IP core.
>
> Why do you want a UIO api for a clock device?  What userspace code is
> going to access the hardware this way?  Why not use the normal
> kernel/user apis instead?

I was just trying to provide userspace access to these _unexpected_ clock
status event indications (clock stopped, underrun, overrun or glitched) and=
 UIO
seemed like an easy way to do it and leave interrupt enablement and monitor=
ing
up to userspace. I'm not aware of any existing clock event notification
framework. Are you suggesting that such a generic event notification mechan=
ism
should be added to the clk subsystem? e.g. additional clk_ops callbacks etc=
.?

>
> thanks,
>
> greg k-h

Thanks for the review,
Harry


