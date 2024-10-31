Return-Path: <linux-clk+bounces-14064-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B00D59B7730
	for <lists+linux-clk@lfdr.de>; Thu, 31 Oct 2024 10:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FBD1B249B6
	for <lists+linux-clk@lfdr.de>; Thu, 31 Oct 2024 09:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B431E194A54;
	Thu, 31 Oct 2024 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dVLD1SsQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC891940B9
	for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730366141; cv=none; b=MpNHDi+fQdyonApaOxhXzmJHwtiNGqfGtsLT48tlJHUBflrRsk/Eiu6/Tnbu144wKEb1tICC2DlVM47ybiC8J/MMDsVopWmlCV3bMDWRhPnjr4vKVH80zlw84LFAZ/co2yrWH8QevfXH84dlJiCHEX1YLfOR7jJb9hOdOWkIEBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730366141; c=relaxed/simple;
	bh=9ZHRxZumObj39ZvDw0426iS1eCvx4QwbXyn0KE00mX0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flvBLNz/lgAcohFhEhGQrdnnWWZIRAcYcn7fzxJg923va1I1GvVYP5bGBYTDSJEBJS3PNufIpIsdiUEkZAkDcGOdmTUyYzKZWgt9keJnVIhbBAgIB9CGorFG9yKeaHTYp7rmMBNR4CxykWwYdnYDAmntM3Z5t/sgxSeQGv/TOkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dVLD1SsQ; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so117240766b.0
        for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730366137; x=1730970937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GoiG2q7mPENxGqV2o9EotirCxP1iVZskztD3m7IMwvo=;
        b=dVLD1SsQpW2pxIdAtUf3HJCQWRGwNodLgt6denM2hzckJ3lZCnXLAmQCpDCE9lsA2e
         mNoYjK8p2RWqeAkVx91NELoTDXkRgICI3J1Ldet5I0iTg7gUmpqFakfEgtE7K/y71jS2
         hl7RB5y99fej5Xw88LaU+mRdIRjS7RRLNrOy1ccOa4c+WHcHRzV2jmt6mwUzAkLOT5wj
         xsIyCipu4zEf7KzMocVUGT+PgAmYSTO34+W75MRrxTvDJQex8u/FtwqSKi+INVTIkBpu
         kqUsE0723xGqCo1ivNk8k+sIwiDLEeAE7pu2SWHxZJUGMD51W1S2NnzIM7tv2/+OvUzZ
         vuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366137; x=1730970937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoiG2q7mPENxGqV2o9EotirCxP1iVZskztD3m7IMwvo=;
        b=V1hnNHbdmeYngp41KERkGCLpC2KGo3TeOStHYRzWuX7oUdN5LsTqLUBLWlLfnq0XUk
         xYJmD764Hqf0ySqO1F1vixv1LT6tc+Oya5fboUUa5dzZQyT+KSuXkggnp6EuyzBcY5jS
         U+W8tjCPrFjWCi/xEH9gMoGM5FpCmA6icBj+uWDxBC71WMdFf9yPhv81MLFgdn7hprIm
         faExDMTQZgtozbygwL7BaNjRRVCsH2bU+qyS7D3IwPyk26PnaNMof1Lmu2cbN+3P0apo
         PhAm4HS5Zz4Qqj7ETllxrL6ORlHLIrDOU0M/Hm52diN3bBlwpUTXQWra51f+yO3OJxr3
         nTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4J8m4j0TSadkwSKFblaNK5aNbdeFGeHTnBGcapZ9scqbRws/dbeaxgKMkdUICxa7STVP85WlK4Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIw0ALJsCT5ZeBXkLBBmy+nkuEVFpnh1896cag6+s4x3Ew+MGf
	FA+8+aWM04WsPV2Fs3GXMy9mXtT6ezIn65HPTEkfB0lbdddACCAfYdRa2RHEra4=
X-Google-Smtp-Source: AGHT+IGqY9TZJZkR9s1c+Lyk4eQ/ILwNYxPHLn7zzQfTeVpg9i8pEvuNeYMcJ+P8ngwF9rXjQzp9hw==
X-Received: by 2002:a17:907:8686:b0:a9a:212d:4ecb with SMTP id a640c23a62f3a-a9de5d702eemr1922884766b.12.1730366137085;
        Thu, 31 Oct 2024 02:15:37 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565df8c2sm43663366b.102.2024.10.31.02.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 02:15:36 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 31 Oct 2024 10:16:01 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: Add RaspberryPi RP1 clock
 bindings
Message-ID: <ZyNK0RxJKdNCV11N@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <914978925d34cfb5bee10fe92603f98763af48b0.1730123575.git.andrea.porta@suse.com>
 <cxwzmlzafgdu2uarcx7mdv4p32zig7efatcg4dzmctho6mvykl@dgwvf3ltcjmo>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cxwzmlzafgdu2uarcx7mdv4p32zig7efatcg4dzmctho6mvykl@dgwvf3ltcjmo>

Hi Krzysztof,

On 08:23 Tue 29 Oct     , Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 03:07:18PM +0100, Andrea della Porta wrote:
> > Add device tree bindings for the clock generator found in RP1 multi
> > function device, and relative entries in MAINTAINERS file.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../clock/raspberrypi,rp1-clocks.yaml         | 62 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 ++
> >  .../clock/raspberrypi,rp1-clocks.h            | 61 ++++++++++++++++++
> >  3 files changed, 129 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> >  create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > new file mode 100644
> > index 000000000000..a123dd619f8e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > @@ -0,0 +1,62 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RaspberryPi RP1 clock generator
> > +
> > +maintainers:
> > +  - Andrea della Porta <andrea.porta@suse.com>
> > +
> > +description: |
> > +  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
> > +  VIDEO), and each PLL output can be programmed though dividers to generate
> > +  the clocks to drive the sub-peripherals embedded inside the chipset.
> > +
> > +  Link to datasheet:
> > +  https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > +
> > +properties:
> > +  compatible:
> > +    const: raspberrypi,rp1-clocks
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    description:
> > +      The index in the assigned-clocks is mapped to the output clock as per
> > +      definitions in include/dt-bindings/clock/raspberrypi,rp1-clocks.h.
> 
> You still describe how current driver matches assigned-clocks to your
> output clocks. That's not the property of clock-cells and that's not how
> assigned-clocks work.

This description is taken by another upstream binding, please see
Documentation/devicetree/bindings/clock/renesas,5p35023.yaml

Its purpose is to let the user know how clock-cell number specified
in assigned-clocks is mapped to the clock provided by this generator.
Since some of these clocks are shared among peripherals, their frequency
cannot be set by consumers, so it's the provider itself (i.e. the clock
device described with this binding) that should take care of them.
The renesas example has assigned-clocks specified though, please see below.

> 
> There are no assigned clocks in your DTS, so this is really irrelevant
> (or not correct, choose).

In the first revision of this patchset (please see [1] and following messages)
I had the assigned-clocks setup in the example while trying to explain their
purpose, but Conor said those didn't seem to be relevant, hence I dropped them.
Maybe I had to be more incisive on that.
So, I'd be inclined to retain the description as it is and reintroduce some
assigned-clocks in the example as in the renesas one, would it be ok for you?

> 
> 
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: xosc
> 
> What is the purpose of clock-names if you do not use it? Drop.

Ack.

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#clock-cells'
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
> > +
> > +    rp1 {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        clocks@c040018000 {
> > +            compatible = "raspberrypi,rp1-clocks";
> > +            reg = <0xc0 0x40018000 0x0 0x10038>;
> > +            #clock-cells = <1>;
> > +            clocks = <&clk_rp1_xosc>;
> > +            clock-names =  "xosc";
> 
> Only one space after '='.

I will drop the name since the driver will not refer to it via clk_get()
but will use clk_parent_data::index.

Many thanks,
Andrea

[1] - https://lore.kernel.org/all/20240822-refutable-railroad-a3f111ab1e3f@spud/

> 
> Best regards,
> Krzysztof
> 

