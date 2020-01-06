Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65B31318A1
	for <lists+linux-clk@lfdr.de>; Mon,  6 Jan 2020 20:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgAFTWi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Jan 2020 14:22:38 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34559 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgAFTWh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Jan 2020 14:22:37 -0500
Received: by mail-lj1-f195.google.com with SMTP id z22so47283194ljg.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jan 2020 11:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xD7c5lp/JTbJappC7pd+ucZ9Tynnw8uEgTOT9ePpE+A=;
        b=TP+Pam2PTdFkBDpy/gZulzYsG/H7IMq7WzsRyV4WOz7x5qswCzaOUDZKO5xLXe4Jyl
         ybcgJk58DFy5xlIczIjeYgqmtBAjPSULgp9a9mF17Bp4sQQYz1GNLeb+Ps+AO48gVopr
         EhCCBfcVVTSedL6mg/Z8/t+Akir7yim2Ebgw5WOc61wjVWqfMEBfnxNePlnym/nLdUtf
         tyst3bf9iKLpqN8okUgzoANIdSRGQ01XVqm6nR974HXwhn6yVoRbon3ljBi1Ma/JXkv7
         pIX+1pK8NSWD9s53nQjCPsUIQM1We+R16PEuBT+uI7+DWzIbAlH8gmB5HjAQW8WrUz9v
         KZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xD7c5lp/JTbJappC7pd+ucZ9Tynnw8uEgTOT9ePpE+A=;
        b=Met2BbRMZdodMh8iiqQUudN5C9iEaI7WiSd4h2Vay1OF1VdWnUsLOSS3yDIg/xt2Hw
         aPPzly/TcGwbQN4NBgzN1A/WbmcXhKuxl3onHLDRVnOWJFOv8s1WJajfpbTOCXRDRI15
         fAghbpwcHMvv73Wnfvqpws5ysPun2plRrqHTrXrPORQMLBsuWeP7tOuSYrtB5Q45QxhN
         ZbI46kNcz1Xgjck+k/43FhwnftKj+704OxQ5EsY6OhFZTaFJELa1dxSDDu5CH8WPQXWR
         H21d6RtAAwo/8nVBeosmvqf1lU7LxNAB6q+EPf5QFjPTAo0+dUhmIodoJn0C9fPiGCAG
         1EQg==
X-Gm-Message-State: APjAAAW/aV/8EmK7go9/0Pch3DJBz/2iOV2XFcdcvqTL2PY9oshcWZxJ
        lWaWdKBUaJZWlOGtflImlyGv/w==
X-Google-Smtp-Source: APXvYqwMq/OmT9x8fcwh1uutbMmzgyXfzN2dKfF6mn/uJfy+faFs7dTSzi3k1NrS/6ihZgUkrLqskA==
X-Received: by 2002:a2e:9705:: with SMTP id r5mr61908704lji.114.1578338555545;
        Mon, 06 Jan 2020 11:22:35 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id h81sm29432728lfd.83.2020.01.06.11.22.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 11:22:34 -0800 (PST)
Date:   Mon, 6 Jan 2020 11:22:25 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        soc@kernel.org
Subject: Re: [PATCH 4/5] ARM: dts: mmp3: Add HSIC controllers
Message-ID: <20200106192225.wc3ber4abkf7s3iu@localhost>
References: <20191220065314.237624-1-lkundrak@v3.sk>
 <20191220065314.237624-5-lkundrak@v3.sk>
 <186ca73e408654981e08f7f12ae543ba51debb68.camel@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <186ca73e408654981e08f7f12ae543ba51debb68.camel@v3.sk>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 20, 2019 at 08:05:50AM +0100, Lubomir Rintel wrote:
> On Fri, 2019-12-20 at 07:53 +0100, Lubomir Rintel wrote:
> > There are two on MMP3, along with the PHYs. The PHYs are made compatible
> > with the NOP transceiver, since there's no driver for the time being and
> > they're likely configured by the firmware.
> > 
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > ---
> >  arch/arm/boot/dts/mmp3.dtsi | 44 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/mmp3.dtsi b/arch/arm/boot/dts/mmp3.dtsi
> > index d9762de0ed34b..36c50706e60e0 100644
> > --- a/arch/arm/boot/dts/mmp3.dtsi
> > +++ b/arch/arm/boot/dts/mmp3.dtsi
> > @@ -201,6 +201,50 @@ usb_otg0: usb-otg@d4208000 {
> >  				status = "disabled";
> >  			};
> >  
> > +			hsic_phy0: hsic-phy@f0001800 {
> > +				compatible = "marvell,mmp3-hsic-phy",
> > +					     "usb-nop-xceiv",
> 
> I managed to mess this up right before sending it out.     ^^^
> Sorry for that. There should be a semicolon there. I'll fix this up on
> next patch spin.

Missed the comments when applying, but I fixed it up locally with the below
patch. Please send new versions incremental on top of it.

I applied the series to the mmp/hsic (and mmp/hsic-fixed) branch in our tree if
you want to use that as a base.


-Olof


---

From e2ce979bf176af4b8eb7aea866919d618c08f752 Mon Sep 17 00:00:00 2001
From: Olof Johansson <olof@lixom.net>
Date: Mon, 6 Jan 2020 11:14:10 -0800
Subject: [PATCH] ARM: dts: mmp3: Fix typos

Fixes build failures due to syntax errors.

Fixes: 3240d5b872f2 ("ARM: dts: mmp3: Add HSIC controllers")
Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/arm/boot/dts/mmp3.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mmp3.dtsi b/arch/arm/boot/dts/mmp3.dtsi
index 36c50706e60e..1eba7fb6629b 100644
--- a/arch/arm/boot/dts/mmp3.dtsi
+++ b/arch/arm/boot/dts/mmp3.dtsi
@@ -203,7 +203,7 @@
 
 			hsic_phy0: hsic-phy@f0001800 {
 				compatible = "marvell,mmp3-hsic-phy",
-					     "usb-nop-xceiv",
+					     "usb-nop-xceiv";
 				reg = <0xf0001800 0x40>;
 				#phy-cells = <0>;
 				status = "disabled";
@@ -225,7 +225,7 @@
 
 			hsic_phy1: hsic-phy@f0002800 {
 				compatible = "marvell,mmp3-hsic-phy",
-					     "usb-nop-xceiv",
+					     "usb-nop-xceiv";
 				reg = <0xf0002800 0x40>;
 				#phy-cells = <0>;
 				status = "disabled";
-- 
2.22.GIT

