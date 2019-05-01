Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFC210BA2
	for <lists+linux-clk@lfdr.de>; Wed,  1 May 2019 18:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfEAQyH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 1 May 2019 12:54:07 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46134 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726517AbfEAQyG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 May 2019 12:54:06 -0400
Received: by mail-pg1-f193.google.com with SMTP id n2so8518889pgg.13
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2019 09:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xONlzx3IaXMZ6M2dIMHdENsla+SllYiw67kc5eZCItg=;
        b=mdmHe26OBi9kOgFFLbKVTkeFrr/oF7ylBvU855Q+odT/xOzuTNul9rItz3QAEJD0Oe
         IYQEGUcYenG1Hvwks5L36dSwARhC5uiRVulTqgCNAuiBvmJ86HlXK9xxNZ4mc3xI/TOh
         m0ZYdFFI2iGNENCIsW+jnZIjhpRhyBOyXL9R9qgx/iPr0MgejOrJwkZQ9z/jPOATBchZ
         ljykq3BK8ezWbsX2WJVG9i/qDXnwLuQ8wIzuFbKOqMIO5F1BJK3ocgrKxgeZKags1cWH
         Uo6z0T7WEKDsgyiLA92M+r8PxjRC65a8GzXoV0Nix+j780MTA95B4UEScAdGlBv6WSAh
         +1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xONlzx3IaXMZ6M2dIMHdENsla+SllYiw67kc5eZCItg=;
        b=o+IkY/kk1/U/38DgFVkA8XN9b9WEEOcudwyRUcRZCVJCe7LUF/rV/5OK3yH9PurYw8
         OpX0+NjQdan3HnGjIK0qiV2Dco6MVYAiN9dYX/BCM+WLoeavaZRh1SpwwQ4LEsFbYxP4
         hzjPQe1FYHAX5Sb4qUiRXdLc4F9fwMG5mCZnNVhVVXV6bENIWzMsbK8mVfC9Olm8irAL
         sNr3UBo+1DIRUmt2U24+GdUf7RSICNI6Gfb5M5h8ZR7pwZGYMFGN51Qqr99D6+CrlIkM
         nyeG7KjtDPNDfNxFP+4l4LaHEqEWuNOpVBNQSlZlvjcBQaZ7gZQYxM9I1KtuQ46FBLVR
         VhGw==
X-Gm-Message-State: APjAAAX8oJo1RnLFn3/soQJB79559Wxw6MAtbfi6oeEeh8M2KZB9C0m8
        p3kJJe3z5aIIrgw5hxUOH0DvDQ==
X-Google-Smtp-Source: APXvYqzfb2xrwvHBji0xFCXOTmqgNI8ofWQ4r1hEacPKpw22h+6vWrHSlazGTj5++rju1N8fNQ4TEg==
X-Received: by 2002:aa7:8e14:: with SMTP id c20mr47798607pfr.14.1556729645920;
        Wed, 01 May 2019 09:54:05 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 4sm4316877pfd.55.2019.05.01.09.54.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 09:54:04 -0700 (PDT)
Date:   Wed, 1 May 2019 09:54:06 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org,
        marc.w.gonzalez@free.fr, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/6] clk: qcom: Add MSM8998 Multimedia Clock
 Controller (MMCC) driver
Message-ID: <20190501165406.GI2938@tuxbook-pro>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677642-29428-1-git-send-email-jhugo@codeaurora.org>
 <20190501034314.GE2938@tuxbook-pro>
 <0513163c-5088-6168-64fb-04fa51f711fa@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0513163c-5088-6168-64fb-04fa51f711fa@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 01 May 07:25 PDT 2019, Jeffrey Hugo wrote:

> On 4/30/2019 9:43 PM, Bjorn Andersson wrote:
> > On Tue 30 Apr 19:27 PDT 2019, Jeffrey Hugo wrote:
> > > +static const struct of_device_id mmcc_msm8998_match_table[] = {
> > > +	{ .compatible = "qcom,mmcc-msm8998" },
> > > +	{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, mmcc_msm8998_match_table);
> > > +
> > > +static int mmcc_msm8998_probe(struct platform_device *pdev)
> > > +{
> > > +	struct regmap *regmap;
> > > +
> > 
> > Don't you want to wait for "xo" here as well?
> 
> No, I don't want to.  As far as I recall, Stephen would like to make a clear
> divide between clock providers, and clock consumers.  Since we have the uart
> issue in gcc, and gcc is pretty critical to the entire SoC, it seems like
> there is a reason (not sure I'd call it "good") to wait for xo there.
> 
> Here, I'm less confident in the reasoning.  mmcc is not really critical to
> the SoC, and everything it services is "optional".  If you have a headless
> system with no display output, you won't even need it.  On system where
> there is a display, I expect the realistic driver ordering to be that
> everything which consumes a mmcc clock to come up well after xo is
> available.
> 
> In short, seems like a bit of a kludge to maybe avoid an issue which doesn't
> seem like would happen.
> 

Okay, cool.

> > 
> > > +	regmap = qcom_cc_map(pdev, &mmcc_msm8998_desc);
> > > +	if (IS_ERR(regmap))
> > > +		return PTR_ERR(regmap);
> > > +
> > > +	return qcom_cc_really_probe(pdev, &mmcc_msm8998_desc, regmap);
> > > +}
> > [..]
> > > +MODULE_DESCRIPTION("QCOM MMCC MSM8998 Driver");
> > > +MODULE_LICENSE("GPL v2");
> > > +MODULE_ALIAS("platform:mmcc-msm8998");
> > 
> > MODULE_DEVICE_TABLE() will provide the alias for module auto loading, so
> > drop this.
> 
> Huh.  I did not know that.  Will put on the list to fixup.
> 

With this dropped (and your objection above) I think the patch looks
good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> > 
> 
> 
> -- 
> Jeffrey Hugo
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies,
> Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
