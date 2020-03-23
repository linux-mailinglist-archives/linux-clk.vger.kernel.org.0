Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 389B118F0F8
	for <lists+linux-clk@lfdr.de>; Mon, 23 Mar 2020 09:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbgCWIiT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 23 Mar 2020 04:38:19 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:43345 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbgCWIiT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Mar 2020 04:38:19 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N2EDg-1jOabZ3H38-013azC for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2020
 09:38:15 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 7D3616503CA
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2020 08:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bydLYrf4bhVX for <linux-clk@vger.kernel.org>;
        Mon, 23 Mar 2020 09:38:15 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 2CB4D64CA17
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2020 09:38:15 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:38:15 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id C3AA1804FB; Mon, 23 Mar 2020 09:36:10 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:36:10 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 05/11] media: adv748x: add support for HDMI audio
Message-ID: <20200323083610.GB4298@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
 <82828e89ccf4173de4e5e52dcecacc4d5168315c.1584720678.git.alexander.riesen@cetitec.com>
 <158475297119.125146.8177273856843293558@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <158475297119.125146.8177273856843293558@swboyd.mtv.corp.google.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:1xY13M2FcyblYpAKqxuUOiblAYXzWdkx+UWV5IQoOc7irTvPfRP
 K03fNejgqMZ3P7FlCDAjrh9H5fHSARS7QexIdYFmoRhFKttN6X9fAU/P/Z9mtjM8I0QegRg
 EUWUSyS0vwJg1FpFOscKBvm+MjLlkMmQUsmN1pNHB96ZZ+oJkE7s7xG9c/pBcWLNBux2yj9
 Bjb9L6iYnECUny70+mnyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lzw2UEuW9I4=:s031IvUc6W6XfRqD3oli22
 9bv5KwF86hAPZig8CGqEWtKOQzkoSInzyQQplnOJ7Cdqu3tizHcns7x/REdfLxzRrl/sFOkoH
 JzDIx9oLKQA6bgk2AbvlGIVCmy/IUtKptcr7c0NJ+gt9z+VwK4VoM+TPgGhHRP1shJSgEwLlF
 sH33onxSuW1ZtzfyNkhiTDqrTSFGKhCG61CmyiFy+c3LSxbv2WNXxEIZ/Pn5ZTc4u6egTWcIP
 MA5s8b4c+Zwm6FMQA1IrJL8JvmfKIFfNv7KIQx6CCrdDmaLtHI4tRiQj+d3uavznwr0No6KAm
 DWiEmpaLJ4rUIpbjMYEds3va+yEiOXlg7m2ZTzt5j9JrV2lDjPMv9+rGA4jqn718FVzIK38Ml
 jCzeqHww7wg8D7eJpWeiAG+SGb0YRWT6Ll/q7nvVcOs0nwYITy99MUA6dAZMcEnCNOs9d0WnU
 s5poEP64cZt6AY9rOvv1DrJCtroJUrB0sWia/6qFn6msCA5XcgOmol8VUXch7oLQxT24cogFG
 g92qPqbGdyd652B439Qgi5LEuz/pkpZH5Gwy1DZjYuRHLpdiHTTRYoPDs/fMTPA2uCIaNuBDb
 sHgLJER+/yqiBnnrh0vipAkSzwC3cNYI8HfcRBbQko8z5v0SDfisjNOpblttrVvz1yf64R+gl
 BQUP5auzBqXMQZ1Qo0BKDQtJePTr6ZKDmenZrRqPfcNtimiV47QHXng0TYk84eXgXiWHO7eJ6
 WeDfd9UHK8yPLsbv9cSd1SdGvx2zWgNCsLLQR8TaTVpZDxvvwJyrFVBn9UAL7Uo+mRa7gme6t
 Z2LFuDbzP3RIbLitjMECtO1rJvPgjasIrN4iQKDuzO5AsVHsVtxNn77W7hFgg8HdB8hJqeu
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Stephen Boyd, Sat, Mar 21, 2020 02:09:31 +0100:
> Quoting Alex Riesen (2020-03-20 09:12:00)
> > diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
> > new file mode 100644
> > index 000000000000..6fce7d000423
> > --- /dev/null
> > +++ b/drivers/media/i2c/adv748x/adv748x-dai.c
> > @@ -0,0 +1,265 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Driver for Analog Devices ADV748X HDMI receiver with AFE
> > + * The implementation of DAI.
> > + */
> > +
> > +#include "adv748x.h"
> > +
> > +#include <linux/clk.h>
> 
> Is this include used? Please try to make a clk provider or a clk
> consumer and not both unless necessary.

Yes, they're both used: I use clk_get_rate to get the frequency of the clock to validate
the master clock frequency configuration.

> > +int adv748x_dai_init(struct adv748x_dai *dai)
> > +{
> > +       int ret;
> > +       struct adv748x_state *state = adv748x_dai_to_state(dai);
> > +
> > +       dai->mclk_name = kasprintf(GFP_KERNEL, "%s.%s-i2s-mclk",
> > +                                  state->dev->driver->name,
> > +                                  dev_name(state->dev));
> > +       if (!dai->mclk_name) {
> > +               ret = -ENOMEM;
> > +               adv_err(state, "No memory for MCLK\n");
> > +               goto fail;
> > +       }
> > +       dai->mclk = clk_register_fixed_rate(state->dev,
> 
> Please register with clk_hw_register_fixed_rate() instead.

Ok, I see the clk_register_fixed_rate isn't even commented...
I shall change it to used clk_hw_register_fixed_rate.

But could you please point me at some documentation, example, or just add a
few words to explain the preference?

BTW, the clock which the driver attempts to provide can actually be switched
on and off (it output pad can be even tristated). As the device is connected
by I2C to the how, I seems to be unable to use the existing gated clock
implementation because of the mmio register it requires. Or am I wrong?

> > +                                           dai->mclk_name,
> > +                                           NULL /* parent_name */,
> > +                                           0 /* flags */,
> > +                                           12288000 /* rate */);
> 
> Not sure these comments are useful.

You're right. Removed.

> > +       dai->drv.name = ADV748X_DAI_NAME;
> > +       dai->drv.ops = &adv748x_dai_ops;
> > +       dai->drv.capture = (struct snd_soc_pcm_stream){
> 
> Can this be const?

It can. Fixed.

> Please drop extra newline at end of file.

Done.

Thanks a lot for the review and commentary!

Regards,
Alex
