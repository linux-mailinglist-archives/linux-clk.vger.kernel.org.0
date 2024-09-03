Return-Path: <linux-clk+bounces-11654-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8206D969C6A
	for <lists+linux-clk@lfdr.de>; Tue,  3 Sep 2024 13:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC421C23CE4
	for <lists+linux-clk@lfdr.de>; Tue,  3 Sep 2024 11:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FD01B9857;
	Tue,  3 Sep 2024 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOriQXDt"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8AC1AD270
	for <linux-clk@vger.kernel.org>; Tue,  3 Sep 2024 11:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725364245; cv=none; b=TJ9fTYvh14cZou4YirvoVDRAA9ADCKgBMyfR2e+VYBF4UX3pa8hLqBAzuALg195Q4iNMXLSEwSW92aRZTp7kB2HKDLPQ3rZi99K8iCvlqq0UyOtfRPQ5ousL5CPJ+dhvo6gxkBSJwBNhnzzYpuUzSgvG0K+twPcPQh1aKsEQgNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725364245; c=relaxed/simple;
	bh=4E0xulKVYycTdN6kmcI0wSr9SBqan18ie1bBK3rYCq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GH4qM0mBwZTxldg4F6e829tzfegzQwlZDXu+SOW43RXpQd2+jHoB6VgJgF791N6ch/u3NVzmjBHhtPxx72lb01mUAhcwFj1+KjWnc8ULQJ1OOzN00rNi3vPAFpY+TIKRH8VoyYh0dDnDXl/v2MlvPA68k2CArxmgCvXxgNmHTA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SOriQXDt; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e1a7f1597bbso2662234276.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Sep 2024 04:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725364243; x=1725969043; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M6oe5mOo0/Q2QUx8kdHtHzBteg518/H7oafdVdtWZ8E=;
        b=SOriQXDtzTCxY7hGSVqMQYMwLDq2J+rnEi8OZxrIxATKAQ9u4zSHqL8VK5W80tUHT0
         05yna/3MsWgBwRhK/SO8KZi2QtBZ4gN5ty2dxyCMlk3mefcMY8lgrDZsfrpv7b7G9ygz
         3NVtDylH4bhYlgxNdiYUOQrp5SB7mLoweFls1yv/3Fwn9r/nH6lx6vJHdSIAUie9wLfG
         CGpqnvm1MHdNT1NMQaNk+WiJWx64iP5b6DY4VBFA6C97nENNb6vqLxhwEkoEMcSu6Ol7
         f8WdbrxrhgMF011LzY+Iu1NhUQ4ewwmHwM7ZG7cBSiGcmfvDYX+0o4dUThR7q/WsJPSA
         wIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725364243; x=1725969043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6oe5mOo0/Q2QUx8kdHtHzBteg518/H7oafdVdtWZ8E=;
        b=VquDrJSXIUnT0d2doMl1DTZHxoQqsOjKgxnyyDTpYyRw8fY4+nb39s3wGplv5ESxvo
         RhB/Rd9MavVRbvSTPL0mAOb/OV0+cUEz7OF+vkSepCPTXl9r4Jb0jzXg0f6teyIl+wf1
         zqmaqccSZgd3sBZE4YticsTBuA2pbW4Li6yu5G0KX73nI2AU2ZUQfdoE/qZ8TaMVvPLy
         ZCqoWdMvoma7dWmhz8BoowQb56/7SDa4GlP704ff2AegxjvK9sNwjFovePNscQCkGh+H
         O47HfELIcgHWvNLozzbxOlbVL7xamXo/R1FLcmKWNdb7SDa8qXgWOuzD2KfD1yXAdk3W
         bmig==
X-Forwarded-Encrypted: i=1; AJvYcCVmOXcaqcYRmrrqZYBI6agDqnGplFs1krvHVYszFlfSXbqEZ6kAqmx5ieJozNeYcFK2H+d8xIzZ9Aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYuZGt5hLFJn+4gkUhl0aJqZC31tVluWag3GwcRGar5W9hAvUN
	La8Wl/8bu0Ri5I3UxBKoCJYt9SiYkNEWJDE+rrxkVa0dTwMHMeOF/rwpjGcpW9usF/yp3ZAR7jT
	0K8RtdAl7Ry+bxN9aR/bx7ptTM6CRmipMKdlntQ==
X-Google-Smtp-Source: AGHT+IGQtMOS4YakO3mVRU55aBPqdi3LzajbKXFr5W6dpvH6QZXYvNNBmu8gXnrpyyZN1Wg9oeBHgUN50f5gy2PQASY=
X-Received: by 2002:a05:6902:e92:b0:e0e:8740:2a76 with SMTP id
 3f1490d57ef6-e1a7a3d95d9mr9063263276.26.1725364242841; Tue, 03 Sep 2024
 04:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFrS4Dhd7DZa2zz=oPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com>
 <99bef301-9f6c-4797-b47e-c83e56dfbda9@tuxon.dev> <CAPDyKFrVS2vpsJqTvjKCJ7ADqXc4D4k2eeCBsaK4T+=pXDnKUA@mail.gmail.com>
 <fa9b3449-ea3e-4482-b7eb-96999445cea5@tuxon.dev> <CAPDyKFrkkASq7rfRN=9sEet-p8T8t+f__PdnSNRN3bMNipnNNw@mail.gmail.com>
 <CAPDyKFpLnREr4C=wZ7o8Lb-CZbQa4Nr2VTuYdZHZ26Rcb1Masg@mail.gmail.com> <da4c57ff-de2b-418f-ba2c-e83c1d399b94@tuxon.dev>
In-Reply-To: <da4c57ff-de2b-418f-ba2c-e83c1d399b94@tuxon.dev>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Sep 2024 13:50:07 +0200
Message-ID: <CAPDyKFpkCYuK=T6ZGzJ=V67Jj7C6CSKv1GH1W_apWs2rKF4q-g@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas RZ/G3S SoC
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, mturquette@baylibre.com, 
	sboyd@kernel.org, yoshihiro.shimoda.uh@renesas.com, 
	biju.das.jz@bp.renesas.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Sept 2024 at 12:58, claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>
>
>
> On 03.09.2024 13:35, Ulf Hansson wrote:
> > On Sat, 31 Aug 2024 at 12:32, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >>
> >> [...]
> >>
> >>>>
> >>>> If not, there are two other options that can be considered I think.
> >>>> *) Using the genpd on/off notifiers, to really allow the consumer
> >>>> driver of the reset-control to know when the PM domain gets turned
> >>>> on/off.
> >>>> **) Move the entire reset handling into the PM domain provider, as it
> >>>> obviously knows when the domain is getting turned on/off.
> >>>
> >>> This option is what I've explored, tested on my side.
> >>>
> >>> I explored it in 2 ways:
> >>>
> >>> 1/ SYSC modeled as an individual PM domain provider (this is more
> >>>    appropriate to how HW manual described the hardware) with this the PHY
> >>>    reset DT node would have to get 2 PM domains handlers (one for the
> >>>    current PM domain provider and the other one for SYSC):
> >>>
> >>> +               phyrst: usbphy-ctrl@11e00000 {
> >>> +                       compatible = "renesas,r9a08g045-usbphy-ctrl";
> >>> +                       reg = <0 0x11e00000 0 0x10000>;
> >>> +                       clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>;
> >>> +                       resets = <&cpg R9A08G045_USB_PRESETN>;
> >>> +                       power-domain-names = "cpg", "sysc";
> >>> +                       power-domains = <&cpg R9A08G045_PD_USB_PHY>, <&sysc
> >>> R9A08G045_SYSC_PD_USB>;
> >>> +                       #reset-cells = <1>;
> >>> +                       status = "disabled";
> >>> +
> >>> +                       usb0_vbus_otg: regulator-vbus {
> >>> +                               regulator-name = "vbus";
> >>> +                       };
> >>> +               };
> >>> +
> >>
> >> According to what you have described earlier/above, modelling the SYSC
> >> as a PM domain provider seems like a better description of the HW to
> >> me. Although, as I said earlier, if you prefer the reset approach, I
> >> would not object to that.
> >
> > Following the discussion I believe I should take this back. If I
> > understand correctly, SYSC signal seems best to be modelled as a
> > reset.
> >
> >  Although, it looks like the USB PM domain provider should rather be
> > the consumer of that reset, instead of having the reset being consumed
> > by the consumers of the USB PM domain.
>
> The PM domain provider for USB is the provider for the rest of IPs. To work
> like this the SYSC these signals should be handled in the USB domains power
> on/off function. It's not impossible to have it implemented like this but
> it will complicate a bit the code, AFAICT. This will not describe the
> hardware, also.
>
> With the information that we had up to yesterday, the connection b/w HW
> blocks was something as follows:
>
>                  USB area
>               +--------------------------+
>       sig     | PHY -> USB controller X  |
> SYSC -------->|  ^                       |
>               |  |                       |
>               | PHY reset                |
>               +--------------------------+
>
> In this implementation the SYSC signal was connected to PHY reset block as
> it is the root of the devices used in the USB setup and no USB
> functionality can exist w/o the PHY reset being setup.
>
> There is a new information arrived just yesterday from hardware team saying
> this about SYSC signals: "When turning off USB PHY and PCIe PHY, if they
> are not controlled, PHY may break" which may means that it is just
> connected to the PHYs not to the USB area/region or PCIe area/region as
> initially expressed in HW manual.
>
> With that the HW connection b/w the USB devices and SYSC might become
> something like:
>
>                  USB area
>               +--------------------------+
>      sig   +--->PHY -> USB controller X  |
> SYSC ------+  |  ^                       |
>               |  |                       |
>               | PHY reset                |
>               +--------------------------+
>
> I haven't got the chance to test this topology, though.
>
> With this new information would you be OK to still have it as a reset
> signal and connected only to the PHY driver ?

As long as it's a better description of the HW, I am fine with that too.

Although, please note that pm_runtime_get|put() doesn't give you full
controll of how the USB PM domain is being powered. So in that case,
it sounds like you need to use the genpd on/off notifiers too.

Kind regards
Uffe

