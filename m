Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB576A1F6F
	for <lists+linux-clk@lfdr.de>; Fri, 24 Feb 2023 17:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjBXQQc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Feb 2023 11:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjBXQQb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Feb 2023 11:16:31 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149FE63DE7
        for <linux-clk@vger.kernel.org>; Fri, 24 Feb 2023 08:16:16 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 945B4C000A;
        Fri, 24 Feb 2023 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677255375;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CEcJzAt1Nz9tEOX4g5xEs4R3tREJCiS0mtbc0K3mvxI=;
        b=fD3VsbT4BDR8SfSzuUnNJEGrGVDhDyEw/gJTS1KCKzVQDxY4/67AkUlPrYnhEqqB8Z8QlP
        bQzOl5I6r5hB+GMi3aVFDZxyKognPth+TFYoZVOberRpqMRAq+fdhzs+E/vLe0e8yta03E
        WyMzzGacOXIFKyobU4/KGwZBwdFhBXSYVvl4ZZ3nhgCvv/wJKNYzzGqdPbCD7EjUOSKdBZ
        83BOtTWrAbrkwFVAqt/moszJH+PbOFxTpA/w7JyInvIpMiwS9BaNxRN3XHk9L6hqGY9iX+
        z0HVKKoq2r0sj5RfCxRlX9ZTq31E7bkp88G4pWfPoNP7oZnKtJ/uHApaKxK09Q==
Date:   Fri, 24 Feb 2023 17:16:11 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
Message-ID: <20230224171611.42760f58@booty>
In-Reply-To: <9aa7d898-d3ba-2018-7f88-d8978e0e52a1@denx.de>
References: <20220625013235.710346-1-marex@denx.de>
        <20220625013235.710346-6-marex@denx.de>
        <20230222182252.2ad6d82b@booty>
        <9aa7d898-d3ba-2018-7f88-d8978e0e52a1@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On Thu, 23 Feb 2023 17:24:32 +0100
Marek Vasut <marex@denx.de> wrote:

> On 2/22/23 18:22, Luca Ceresoli wrote:
> > Hello Marek,  
> 
> Hi,
> 
> > On Sat, 25 Jun 2022 03:32:35 +0200
> > Marek Vasut <marex@denx.de> wrote:
> >   
> >> Enable SAI3 on i.MX8MP EVK, add WM8960 codec binding and regulator.
> >> This is all that is needed to get analog audio output operational
> >> on i.MX8MP EVK.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Abel Vesa <abel.vesa@nxp.com>
> >> Cc: Fabio Estevam <festevam@gmail.com>
> >> Cc: Jacky Bai <ping.bai@nxp.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Lucas Stach <l.stach@pengutronix.de>
> >> Cc: Michael Turquette <mturquette@baylibre.com>
> >> Cc: Shawn Guo <shawnguo@kernel.org>
> >> Cc: Stephen Boyd <sboyd@kernel.org>
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-clk@vger.kernel.org
> >> Cc: linux-imx@nxp.com  
> > 
> > I'm sending in reply to this e-mail the device tree patch I have used
> > for my audio testing on the MSC SM2-MB-EP1 board. Feel free to add it to
> > your series if you want, it obviously depends on it.  
> 
> Lemme just mark this email locally and start with the MX8MP EVK . If the 
> audio patches ever get upstream, then this one can be easily 
> resubmitted. Does that work ?

Sure.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
