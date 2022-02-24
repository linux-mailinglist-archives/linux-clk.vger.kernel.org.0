Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933164C312A
	for <lists+linux-clk@lfdr.de>; Thu, 24 Feb 2022 17:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiBXQZj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 24 Feb 2022 11:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiBXQZj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Feb 2022 11:25:39 -0500
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A8A1E015A
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 08:25:01 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id x193so3276179oix.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 08:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rKwNr7V3uW8Gv5L5uE2dYixe/ABj2Wzg3cgJbqkHzkw=;
        b=zIopXaux8buylgS/mMHZWgmjizG0jplQs8WuYQ5OzFEyXnPpgWKNOyXcLU+p3/hBRl
         vx9xc12pCvRjJwjNTUA4wjFzc0f14UVrk0+2ny2yfQH0Ym1CXGcRXthGMimMYa92kRBv
         7s13/nHCq3ffzYJvRkajTcVApXX7VgEw9upY4NLrk1rPdwD6Xx6x5Z6r6uPxQ1YaznWp
         cyaF1WhTvaHQ8BS6WRTjKAl/NKwRT//U5eIFo4LHCBF57MG/YieDl38gAhXY9Nw0OOUz
         IyXdAf46a0JT/5m/vv7J1T/yFsMXY6z4XuB3xmDuPRPpnhq8AP8rdbCL15J1eEyM8HWe
         fLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rKwNr7V3uW8Gv5L5uE2dYixe/ABj2Wzg3cgJbqkHzkw=;
        b=MRMYtpsEGIjqd/2PdRy/2mXOeOzJ5+ddBW4v/elWAIFE54RQkC16B4a8iCSfKu/Xmu
         xb8KiAWMQC+9kuUeXSBIyJgnnXezb9394Zv/oCBLrOQi4BuSl8AmBFCvyEAIpyKiebVP
         162+IU8KOVoW4vNazfT5ZY/zM7XqFKvE3kAIu1XtLvlBWKBzpKLIM/8HsJnzucRCy53u
         FFJQqgasUxl/2hG8yrVYMzNzDxba2A7gDEnUvpmz6eOYjkwQkhm+UaMNDt31Mo/kJxoF
         ZduHhP2Adl8Vf2uAiqSG7+jlEvm9eFAMCUCqQVaXqSEZZoWeputBW06YpIE5nsTh+ras
         m7bQ==
X-Gm-Message-State: AOAM532pnlfFx3bo6N2dpBlo1D0tMNFjAqXEfy+ZuwSarY5gIR+g9Wbm
        X+1rZ3TH+LgZLVxIF0qkyI4jOtCdqIkEaw==
X-Google-Smtp-Source: ABdhPJw/GpLCX/lTyPQyMRvaZlzuBOX2VoKZCUHE1DPThnj38YIABagyTXb5Bcj4mZHA/blBVFYYIw==
X-Received: by 2002:a05:6870:2042:b0:d6:d3e6:ec3 with SMTP id l2-20020a056870204200b000d6d3e60ec3mr1075903oad.315.1645719305760;
        Thu, 24 Feb 2022 08:15:05 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id eh38sm1639274oab.36.2022.02.24.08.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 08:15:04 -0800 (PST)
Date:   Thu, 24 Feb 2022 08:17:03 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/16] clk: qcom: gcc-ipq806x: add additional freq nss
 cores
Message-ID: <Yhevf9f8ghpUWZvZ@ripper>
References: <20220217235703.26641-1-ansuelsmth@gmail.com>
 <20220217235703.26641-9-ansuelsmth@gmail.com>
 <YhcBpBflfTd5/BNF@builder.lan>
 <YheqZag1q6U8Gx8Y@Ansuel-xps.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YheqZag1q6U8Gx8Y@Ansuel-xps.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 24 Feb 07:55 PST 2022, Ansuel Smith wrote:

> On Wed, Feb 23, 2022 at 09:55:16PM -0600, Bjorn Andersson wrote:
> > On Thu 17 Feb 17:56 CST 2022, Ansuel Smith wrote:
> > 
> > > Ipq8065 SoC (an evolution of ipq8064 SoC) contains nss cores that can be
> > > clocked to 800MHz. Add these missing freq to the gcc driver.
> > > 
> > 
> > Do we somehow need to ensure that these new frequencies are only
> > available on 8065?
> > 
> > Regards,
> > Bjorn
> >
> 
> In theory ipq8064 can run the nss cores to this freq. Do you have any
> suggestion on how to limit these 2 clock to the different compatible?
> 

What's done in other clock drivers is that we have different
compatibles and then rewrite the clock definitions at probe before
registering the clocks.

It sounds like it's the right thing to do here as well, to avoid the
8064 nss to be overclocked.

Regards,
Bjorn

> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >  drivers/clk/qcom/gcc-ipq806x.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> > > index a4bf78fe8678..53a61860063d 100644
> > > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > > @@ -232,7 +232,9 @@ static struct clk_regmap pll14_vote = {
> > >  
> > >  static struct pll_freq_tbl pll18_freq_tbl[] = {
> > >  	NSS_PLL_RATE(550000000, 44, 0, 1, 0x01495625),
> > > +	NSS_PLL_RATE(600000000, 48, 0, 1, 0x01495625),
> > >  	NSS_PLL_RATE(733000000, 58, 16, 25, 0x014b5625),
> > > +	NSS_PLL_RATE(800000000, 64, 0, 1, 0x01495625),
> > >  };
> > >  
> > >  static struct clk_pll pll18 = {
> > > @@ -2702,7 +2704,9 @@ static const struct freq_tbl clk_tbl_nss[] = {
> > >  	{ 110000000, P_PLL18, 1, 1, 5 },
> > >  	{ 275000000, P_PLL18, 2, 0, 0 },
> > >  	{ 550000000, P_PLL18, 1, 0, 0 },
> > > +	{ 600000000, P_PLL18, 1, 0, 0 },
> > >  	{ 733000000, P_PLL18, 1, 0, 0 },
> > > +	{ 800000000, P_PLL18, 1, 0, 0 },
> > >  	{ }
> > >  };
> > >  
> > > -- 
> > > 2.34.1
> > > 
> 
> -- 
> 	Ansuel
