Return-Path: <linux-clk+bounces-22202-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FBAAC1FBD
	for <lists+linux-clk@lfdr.de>; Fri, 23 May 2025 11:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3870A4E7CDA
	for <lists+linux-clk@lfdr.de>; Fri, 23 May 2025 09:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47FB225388;
	Fri, 23 May 2025 09:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hTkBmFrr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31DD5D8F0
	for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747992580; cv=none; b=nCQvLQfbF2wPkrntQrxv30uMcPly/xvFXIlAs2h+UOML3NUSvrKOIWDj+8/k29L7bhcdiDB2Uk099yM7+s88Y355b8g3NPRe/2Z60CTL6/B++vB6n43yYJ5vEqeWOeCxd5XmbnS8rWg8bbap5xyUxE8N9of+g8WmWx5IqrhZ04o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747992580; c=relaxed/simple;
	bh=7iV0PK0XEkkXSDlRpCH9WIf0RlD/ImvYxhD6cBK3FpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R79ImkYPwSORSncG3TOIM22shIENN7lAEYf7pDotZyVCnJFClMXiscTQal/ZoiK+P8fKyZhXjonq/N2BXP2GrxF9EZSDw0xxBbVxyeizXUBiWC5Rubrw+413IwVzyBMPDiwq4psWPCCibMEWfxTE121Ck9ghjTkYh2IvuxOjGIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hTkBmFrr; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad5740dd20eso906923466b.0
        for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747992577; x=1748597377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QSkMK6hpsz693rlBfw8R7EN03Okxs/CKoRdgfg9uKIU=;
        b=hTkBmFrr2Cc7PRYyj+UG+706qMcQYEyxdZ+oTCQVizgwscoFpH539pP1fT068iyyLj
         z/xuwfvFysFjM+RSHJS4v6DokZgJ1nFqXMDu86etV++yaZs5EVqFSB9Xm8pliSNCE3h/
         GdhGJMpa1vk1YowmSz4vkIrgoZ22EB/qMOM+koJeb9lgbeaQ7ghKw2tHkBX6Dm16xe7c
         iEtUI+glc4iFuYmOe7VF6bP0Pk1Wf+phaQ08wOA03DtwLr9XnHr8ov6NxQ1TVu7tRGed
         jGVbU6PCvIf+4RAMkoyp21NAPRd3dPdxvicgpVMlAfr276gYJ2GH4NAAG12MGup4rb6T
         8VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747992577; x=1748597377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSkMK6hpsz693rlBfw8R7EN03Okxs/CKoRdgfg9uKIU=;
        b=FlxzIEkkESfZh5zjHxWCISAKzsgcE5VJepWzuMZvZlqxZSnRmBRCRXPgChkLUQnDTm
         RKQ0NNyLIwISic57oV/eRutg7XEhRobahjWqX0DTZozeZyrndBoeOabIccHCVBmbEfPQ
         X9ByCE6bf+6O+EEhbt6U3XigcucGy6LDv1im1UqbwCuInGQG7KInjQz5e05ZS+Zz6Qgg
         13c2RDnUkLV6PSdOnA5Vbxc5wIr48t7ZYo7px9ZYl+di5Q6fqcs/0cJU2/LXEkXrATOQ
         smsd5ZPJD5+lpC7Y+exQKe15p6i9hH5DMeu1AgDs0Vy852Qazwu240wyACihPKHfu2g8
         GQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCW9TGbf3n8aZwpMFVxWB5lKypuDAmEH5NUYARHbKmGhbA9bVwjkotEvKSmQ60nt6wKuHvYs6aSYKjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkjsEEgfjpgC9+hOVMDybZxemZaB+ZbqdWdPSMHWod4BfxMuIb
	RSwBS1bCwmyT371jUO6EX2pMut8m9k9nUsB2a/rmDyEoEf0kYFe8k/jHeYcW9Woim5Y=
X-Gm-Gg: ASbGncs21XH8CxAyuiT+1+O2Q5gnpUzb6kNFKkJpCKBzxEdC9M8KWfbx8JMpTt375UU
	R2cyqP7afD47sbXhYdvjHdY3PBZYYoJZu1v05/8F4Xjd6vA9iz369HARoflzytHd5aN9K0qpZQs
	QOPItthWZ7uchkxw0qckUtiEnKe3BmcccDDwkRV1YR3vWSUtIRg9+n7lCCcNy/O+1FS/4u8H9rH
	9rMJMNwBuEKVEYcp7/ryPs13Ub2qTSnIWKeI9WPBjZfoymzlQmCoB5vsVxGMk29H33EBjHgtEBz
	PK5OAT6K8urz10btTgIGrhf4B6EptxD5TbkK2xm8LmD5uHy1FTrcV+9jbSrp684=
X-Google-Smtp-Source: AGHT+IGOpo1TPYd5N03AiCPo1Usu1rICKOKfo2ZjPp3xB2uH6rOk7X8el6oNzyY1EObtn5S2D2NxwQ==
X-Received: by 2002:a17:906:c103:b0:ad5:7499:2644 with SMTP id a640c23a62f3a-ad71c671007mr203816166b.54.1747992576817;
        Fri, 23 May 2025 02:29:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:845b:bbb4:b39e:a452])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d277a2esm1197585566b.83.2025.05.23.02.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:29:36 -0700 (PDT)
Date: Fri, 23 May 2025 11:29:31 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
Message-ID: <aDA_-zQEgFVVNE9W@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
 <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
 <aCNGSwL7043GoJBz@linaro.org>
 <20250514160841.GA2427890-robh@kernel.org>
 <aCUHTJGktLFhXq4Q@linaro.org>
 <20250521-psychedelic-cute-grouse-ee1291@kuoka>
 <aC-AqDa8cjq2AYeM@linaro.org>
 <20250523-markhor-of-fortunate-experience-1f575e@kuoka>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-markhor-of-fortunate-experience-1f575e@kuoka>

On Fri, May 23, 2025 at 11:06:04AM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 22, 2025 at 09:53:12PM GMT, Stephan Gerhold wrote:
> > +Saravana
> > 
> > On Wed, May 21, 2025 at 11:20:40AM +0200, Krzysztof Kozlowski wrote:
> > > On Wed, May 14, 2025 at 10:12:44PM GMT, Stephan Gerhold wrote:
> > > > > > > > The mailbox itself does not need any clocks and should probe early to
> > > 
> > > ... so probe it early.
> > > 
> > > > > > > > unblock the rest of the boot process. The "clocks" are only needed for the
> > > > > > > > separate clock controller. In Linux, these are already two separate drivers
> > > > > > > > that can probe independently.
> > > 
> > > They can probe later, no problem and DT does not stop that. Linux, not
> > > DT, controls the ways of probing of devices and their children.
> > > 
> > > > > > > > 
> > > > > > > 
> > > > > > > Why does this circular dependency need to be broken in the DeviceTree
> > > > > > > representation?
> > > > > > > 
> > > > > > > As you describe, the mailbox probes and register the mailbox controller
> > > > > > > and it registers the clock controller. The mailbox device isn't affected
> > > > > > > by the clock controller failing to find rpmcc...
> > > > > > > 
> > > > > > 
> > > > > > That's right, but the problem is that the probe() function of the
> > > > > > mailbox driver won't be called at all. The device tree *looks* like the
> > > > > > mailbox depends on the clock, so fw_devlink tries to defer probing until
> > > > > > the clock is probed (which won't ever happen, because the mailbox is
> > > > > > needed to make the clock available).
> > > > > > 
> > > > > > I'm not sure why fw_devlink doesn't detect this cycle and tries to probe
> > > > > > them anyway, but fact is that we need to split this up in order to avoid
> > > > > > warnings and have the supplies/consumers set up properly. Those device
> > > > > > links are created based on the device tree and not the drivers.
> > > > > 
> > > > > Does "post-init-providers" providers solve your problem?
> > > > > 
> > > > 
> > > > I would expect that it does, but it feels like the wrong solution to the
> > > > problem to me. The clock is not really a post-init provider: It's not
> > > > consumed at all by the mailbox and needed immediately to initialize the
> > > > clock controller. The real problem in my opinion is that we're
> > > > describing two essentially distinct devices/drivers in a single device
> > > > node, and there is no way to distinguish that.
> > > > 
> > > > By splitting up the two distinct components into separate device tree
> > > > nodes, the relation between the providers/consumers is clearly
> > > > described.
> > > 
> > > You can split devices without splitting the nodes. I do not see reason
> > > why the DT is the problem here.
> > > 
> > 
> > The Linux drivers for this particular mailbox/clock controller already
> > work exactly the way you propose. They are split into two devices that
> > can probe independently.
> > 
> > The problem is outside of the drivers, because fw_devlink in Linux
> > blocks probing until all resources specified in the device tree nodes
> > become available. fw_devlink has no knowledge that the mailbox described
> > by this peculiar device tree node does not actually need the clocks:
> > 
> > 	apcs1_mbox: mailbox@b011000 {
> > 		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
> > 		reg = <0x0b011000 0x1000>;
> > 		#mbox-cells = <1>;
> > 		clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > 		clock-names = "pll", "aux", "ref";
> > 		#clock-cells = <0>;
> > 	};
> > 
> > Without device-specific quirks in fw_devlink, the fact that these clocks
> > are only used by an unrelated clock controller only becomes clear if we
> > split the device tree node like I propose in this series:
> > 
> > 	apcs1_mbox: mailbox@b011000 {
> > 		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
> > 		reg = <0x0b011000 0x1000>;
> > 		#mbox-cells = <1>;
> > 
> > 		apcs1_clk: clock-controller {
> > 			clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > 			clock-names = "pll", "aux", "ref";
> > 			#clock-cells = <0>;
> > 		};
> > 	};
> 
> Above code suggests that clocks are not needed for the mailbox at all.
> You need to be really sure of that. If that's the case, then this
> description looks like correct hardware description, more detailed then
> the first case, though.
> 

Yes, these clocks are not needed for the mailbox.

> > 
> > It is easy to say that the problem is in Linux (and not the DT), but
> > unless you are suggesting to remove fw_devlink from Linux, or to add
> > more device-specific quirks to the generic fw_devlink code, I'm only
> > aware of the following two options to make this work (both already
> > discussed in this email thread):
> > 
> >  1. post-init-providers (as suggested by Rob):
> > 
> > 		post-init-providers = <&a53pll_c1>, <&gcc>, <&rpmcc>;
> > 
> >     To repeat my previous email: IMHO this is a crude workaround for
> >     this situation. The clock is not really a post-init provider: It's
> >     not consumed at all by the mailbox and needed immediately to
> >     initialize the clock controller.
> 
> Clock is a provider - it has clock-cells - and it is post-init, because
> mailbox (parent) does not need it to initialize itself. Only part of its
> functionality - clocks - need it.
> 

Right.

> > 
> >     With this approach, there are no device links created for the
> >     clocks, so we don't get the proper probe/suspend ordering that
> >     fw_devlink normally provides.
> 
> This probably could be fixed in the Linux?
> 

This is probably something for Saravana to answer, but I think
post-init-providers is more intended to break up actual circular
dependencies, where you want to omit the device links for one of the
sides. For this specific case this is not necessary, because we can
avoid creating the cycle by describing the hardware more accurately.

> > 
> >  2. Split up device tree node (this patch series): With this approach,
> >     the mailbox can probe early and the clock controller child device
> >     gets the expected consumer/supplier device links to the clocks. IMHO
> >     this is the cleanest solution to go for.
> > 
> > @Saravana: Is there any other option that I missed? Or perhaps you have
> > any other suggestions how we should handle this?
> > 
> > To summarize the series and previous emails, the dependency cycle that
> > was in msm8939.dtsi before commit d92e9ea2f0f9 ("arm64: dts: qcom:
> > msm8939: revert use of APCS mbox for RPM") is:
> > 
> >   1. The clock controller inside &apcs1_mbox needs
> >      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>.
> >   2. &rpmcc is a child of remoteproc &rpm
> >   3. remoteproc &rpm needs mboxes = <&apcs1_mbox 8>;
> > 
> > This is not a real dependency cycle, the clocks in the mailbox@ node are
> > not needed for the mailbox. They are only used and needed for the clock
> > controller child device that makes use of the same device tree node.
> > 
> > At runtime this cycle currently results in none of the devices probing:
> > 
> > [   13.281637] platform remoteproc: deferred probe pending: qcom-rpm-proc: Failed to register smd-edge
> > [   13.296257] platform b011000.mailbox: deferred probe pending: platform: supplier b016000.clock not ready
> > [   13.308397] platform b016000.clock: deferred probe pending: platform: wait for supplier /remoteproc/smd-edge/rpm-requests/clock-controller
> > 
> 
> Except missing dev_links you mentioned, this feels for me like job for
> post-init-providers (option 1), but I am also fine with option 2,
> because it fees like more appropriate hardware description.
> 

Great, thanks for the review!

Stephan

