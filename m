Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2BC35B7896
	for <lists+linux-clk@lfdr.de>; Tue, 13 Sep 2022 19:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233464AbiIMRql (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 13 Sep 2022 13:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233497AbiIMRqM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 13:46:12 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B2080492
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 09:42:41 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso11888181pjm.5
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=+D2aa8PettZ+gajRv9WE2n4dG1IRjQbOdCP5/ZsNCXU=;
        b=yK/acudqmY9tNknsqIBFoKfZN933PY0SUpdMS2BMwePVj/EPc4uGPgmWjbZ6umgl/M
         OxO5aPJlohPv2HDiUZwakBuQLw+F27SwHExv1jdrIkYl8Hg/NjiueiS6/aqxXQv7Ah19
         BO5vmdb1HDXcRBbjVYBmdI+rkVueSCdMc5NVAl2N5jNl2Ypll/UD98ARJWBEFJed1Dyi
         NnIpsriizo1npXfyPrWY4hESt3zrGJYH3KMb2kD9FTxw2xWRpnSt8oI+jMGODiONwGIT
         c2CcgrOFCHKwU6NhAYjQ+2h833vwlfklKein5oFbyzPy8k/kFeJlGuzo/+62pq8uV78X
         VpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+D2aa8PettZ+gajRv9WE2n4dG1IRjQbOdCP5/ZsNCXU=;
        b=jjHHjdmBTxIbO2DDtwqRzgEIh/0469Bo/VgX/6/fx5tWtYQGtPPmHzmscwjjEkAnII
         ghWXhmuNF6XhpC2xVwW45fNgKObnPL/Ey8dcu6bWghahHhIL1NToxEY/0RE5krZqofWW
         yJtE8kMa78IGZtEAoQdqVwsKcQRzTALDyG9JsiUWbBLPkCjrFgxbBbW9T6zV5lXKHL1y
         iZn9EGAzIR0Ogvo1Xlr9jhFK9UyJjFqdnLJZ+L5plrVgQn8Uwul5pzK1k6lnrVYxZCY2
         tdPjpNFRGT45Z8vx9gTdTTY6SWe6kyvnZ8M1cca7XXnnOeGTIpUwfQlgWUa9O3S0wZXn
         lMIA==
X-Gm-Message-State: ACrzQf21Z6GW0HyqFrC5XHp+uymVsY6IHEPwzt1SQIEls5mzpegYRU+F
        x/quW6jnBTIbmVoIkUj1Tpnx
X-Google-Smtp-Source: AMsMyM6aaQo3KWrpF9B+6HMrJtHoR3KFub3BtX5pu/jTeL4QJFRubmpVcpXcY6zSbX6SHF33y3Kyuw==
X-Received: by 2002:a17:90a:9f96:b0:1fa:b4fb:6297 with SMTP id o22-20020a17090a9f9600b001fab4fb6297mr186375pjp.80.1663087360938;
        Tue, 13 Sep 2022 09:42:40 -0700 (PDT)
Received: from workstation ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a1f4300b001f262f6f717sm7538605pjy.3.2022.09.13.09.42.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Sep 2022 09:42:39 -0700 (PDT)
Date:   Tue, 13 Sep 2022 22:12:33 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        helgaas@kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, quic_vbadigan@quicinc.com,
        quic_hemantk@quicinc.com, quic_nitegupt@quicinc.com,
        quic_skananth@quicinc.com, quic_ramkri@quicinc.com,
        swboyd@chromium.org, dmitry.baryshkov@linaro.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v6 5/5] clk: qcom: Alwaya on pcie gdsc
Message-ID: <20220913164233.GF25849@workstation>
References: <1662713084-8106-1-git-send-email-quic_krichai@quicinc.com>
 <1662713084-8106-6-git-send-email-quic_krichai@quicinc.com>
 <20220912170437.GA36223@thinkpad>
 <49536ca8-ef98-9927-d1be-977ab5244c91@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49536ca8-ef98-9927-d1be-977ab5244c91@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 13, 2022 at 12:12:32PM +0530, Rajendra Nayak wrote:
> 
> On 9/12/2022 10:34 PM, Manivannan Sadhasivam wrote:
> > + Rajendra
> > 
> > On Fri, Sep 09, 2022 at 02:14:44PM +0530, Krishna chaitanya chundru wrote:
> > > Make GDSC always on to ensure controller and its dependent clocks
> > > won't go down during system suspend.
> > > 
> > 
> > You need to mention the SoC name in subject, otherwise one cannot know for
> > which platform this patch applies to.
> > 
> > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > ---
> > >   drivers/clk/qcom/gcc-sc7280.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> > > index 7ff64d4..2f781a2 100644
> > > --- a/drivers/clk/qcom/gcc-sc7280.c
> > > +++ b/drivers/clk/qcom/gcc-sc7280.c
> > > @@ -3109,7 +3109,7 @@ static struct gdsc gcc_pcie_1_gdsc = {
> > >   		.name = "gcc_pcie_1_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > -	.flags = VOTABLE,
> > > +	.flags = ALWAYS_ON,
> > 
> > Rajendra, should we also put PCIe GDSC into retention state as you have done for
> > USB [1]?
> 
> Yes, it looks like we should handle this the same way as we did with usb.

Okay, thanks for the confirmation.

> Why are we removing the VOTABLE flag anyway?

Yeah, I don't see a reason for doing that.

Chaitanya, please follow the patch from Rajendra I mentioned above and adapt it
for PCIe GDSC.

Thanks,
Mani

> 
> > 
> > Thanks,
> > Mani
> > 
> > [1] https://lore.kernel.org/all/20220901101756.28164-2-quic_rjendra@quicinc.com/
> > 
> > >   };
> > >   static struct gdsc gcc_ufs_phy_gdsc = {
> > > -- 
> > > 2.7.4
> > > 
> > 
