Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1876F26C01F
	for <lists+linux-clk@lfdr.de>; Wed, 16 Sep 2020 11:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgIPJHB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 16 Sep 2020 05:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgIPJGy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Sep 2020 05:06:54 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3D9C061788
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2020 02:06:53 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 67so3502683pgd.12
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2020 02:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ttZkZx1LzxLGYFhW4zTKYKYiQwvfjDiSjvWqnbF0vHk=;
        b=Z7I6N1XxqCqBifMW2RwOmCjaR7e0Mnw+2vjVnacAqGC0CEBgiJkfWus2y6dGywgVUe
         FYeiY2d+d+2KX0av8QlogjDPyiewesxjJSLdXGSr29TuUi22NJ3sYmq6f1kJQDfY7woi
         hwSCxoweIjXUcOEBxQOScVoueGh+uTb7HP/7scp5C7Sesz3XbyHXBjoHfRfHL54l4xYT
         gDsv6VCSw2SFx7xD84WpA64KYk1/bLFrSMHtZNNg2NfXby9cFK4yspALSuY+DzByxaFo
         dXKWkfjfCfHM3ZI5px5ISyExcyo49ojgI62wdWNIe5JGJ5twMDHayuXR60h4zFHB8VSo
         X6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ttZkZx1LzxLGYFhW4zTKYKYiQwvfjDiSjvWqnbF0vHk=;
        b=nX1po2ILe9HSuQocfFZYYleF6lhfhi6R69powZzBraJgb4ic2LbKBHiwHF7yR2oq+b
         vAM8+JHUTY3mHD/zHg2hSAs27exzdk7dLoDovpwxfFx7R4RuxJUZ7CYK2kVhFFLnWcov
         nN0mTvy4VzMDnyilippOwewDyFigL8tbZFSSxC88PWtfaGhxJ9kG8eSqiShc/ENfJW8b
         0zKtHhOE1dI+y4GCOMtMFQal3qqU/KYE8hUus+22syy6mvHe598ZH8z2z0hgK6qLOoLQ
         fpjpFK+1FUQcVgIWhEGPVbUc1hxANn42Kv+aZxBVcVM2l/QsgmgWaWmp4/M287hry9bg
         Pb5A==
X-Gm-Message-State: AOAM532YAqxs4G2MJLVATVuPSfMfhTtQuo1g5u9/dV9vNEBGkflGPxxv
        bayVrNOCpeBAFWp8nhXzfx2Eeg==
X-Google-Smtp-Source: ABdhPJxaex4WXIf49yTDWeyTvhfkQ16nkldb65p5CHOJKBKiFPs1J1w8fAlogBZCbdj68MzDmDyP2w==
X-Received: by 2002:a62:7c82:0:b029:13c:1611:6525 with SMTP id x124-20020a627c820000b029013c16116525mr22021122pfc.5.1600247210609;
        Wed, 16 Sep 2020 02:06:50 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id z1sm11903216pfq.102.2020.09.16.02.06.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 02:06:49 -0700 (PDT)
Date:   Wed, 16 Sep 2020 14:36:37 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        linux-clk <linux-clk@vger.kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: Unable to handle kernel paging request at virtual address dead -
 __clk_put
Message-ID: <20200916090637.fvyangrcc7ao4gye@vireshk-i7>
References: <CA+G9fYvYEsxjU_cnm6oWFgOrU4x0T1CMoN-L2SHLGeJC6MF54Q@mail.gmail.com>
 <CAPDyKFqVB_hgDghaYU1B1BbWUuL6GHhWMbZEYM-cXDQ8T8ThfQ@mail.gmail.com>
 <20200916052239.7c5z4wqqrdpauti4@vireshk-i7>
 <CAPDyKFrxrKRuJec0pDLooovV3BJBVvmDizoL6N4eb+hv1D0NgA@mail.gmail.com>
 <20200916080728.ajqzw75spcmbbwsc@vireshk-i7>
 <20200916082042.ejzaje62k4bl2hhy@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916082042.ejzaje62k4bl2hhy@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16-09-20, 13:50, Viresh Kumar wrote:
> On 16-09-20, 13:37, Viresh Kumar wrote:
> > On 16-09-20, 09:37, Ulf Hansson wrote:
> > > I have the board as well. If you need some help with testing, just let me know.
> > > 
> > > In any case, I will try the revert and see how that changes things.
> > 
> > I am testing this with help of Naresh currently, will try to update
> > back today itself.
> 
> I think I have found the issue and it is with a new patch from the opp
> tree (which isn't merged upstream yet):
> 
> commit 99f1c7ff37b0 ("opp: Handle multiple calls for same OPP table in
> _of_add_opp_table_v1()")
> 
> I have asked Naresh to run it again, lets see.

https://lkft.validation.linaro.org/scheduler/job/1770973

Got fixed.

I will update my branch and push it.

Ulf, you don't need to do anything.

Naresh, Thanks a lot for testing this stuff out.

-- 
viresh
