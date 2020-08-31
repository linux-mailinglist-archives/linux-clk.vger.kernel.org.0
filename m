Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7916E257320
	for <lists+linux-clk@lfdr.de>; Mon, 31 Aug 2020 06:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgHaEqP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 31 Aug 2020 00:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgHaEqO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Aug 2020 00:46:14 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD3DC061575
        for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2020 21:46:13 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id h2so2462135plr.0
        for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2020 21:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9DT7T9nQfwo6eKdKm8ktrJGI/iqaC4tsTOR19DzTOIc=;
        b=gqG+SDRFtzBK7B/V2gV7gjW0mZAqUuY/579i8mfVPZ62EyXYeaZjxrmqJ4cmgi263J
         KVJuqDAAKZJ/ghgm5Sy+azj5BrwEDWUL2/F7xevIXcp525YE/I/IqhIj1El6lShC6gHA
         Rg1Dxn3AUyJImGm2mW+eqYkCrxx/f2TxJmOxJ8iMwP5QiiWLUPXsGQXluACFyBkUmhya
         0qCGHP8hXj7qjnpnzxUuFpeRrlThckzHt8aZFKUTexLXbfwR84nT08fFvOi5wHsCgodU
         wZetw2ky7aQu6OeA0Kx2LMu5/rpf16Zg8Chdqy07tLQCfySrwEreR3N1kzw4O2CEUkyS
         Vj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9DT7T9nQfwo6eKdKm8ktrJGI/iqaC4tsTOR19DzTOIc=;
        b=TzNoCHjVc+FBzsb60NNGccyLfMLdvdHSIlOBxwiS0mymXvyWhJZYn6ZfT/0yfirdKU
         2b1ep6S1mq9chGDMr2Er3D7VsUttFp0PBV2ZYOAaj0OdMcf3Soai0PgwXRpGbFZGKEx9
         ElUvTVvrm4VAFpq8do/N9M0LkzoAhCZRk3HTWWCB/UUfw7OTVmUa6nnSobMhDjc9ylNS
         Plbr33QLMnjvmRX2+AVA8ZAn81y5OpXkVsQEgrOI8bLUmhBtnhLIvMI/KqBInG5AR4Sk
         t1m0OQ+Ji7xrtuHilUfw4uYTVKbA0mjSnrIxgJ+yu2oL+4PJ5BSrrngUlLCNkCQY3o3s
         93Yw==
X-Gm-Message-State: AOAM531oby4gfA3f7QwC45sAlXuAmODljgePfwygwo+jQQ6mJKHAF6fF
        ZnLv5CFNF+wLarykuVD9PIm9/g==
X-Google-Smtp-Source: ABdhPJxt8ExSDwcad3/nlwy4wcUU3CTerjAZ2bl7+IOocMW5vV2fbb+AlFHt6ItMXMlUaUtqP2vCDA==
X-Received: by 2002:a17:90b:1093:: with SMTP id gj19mr9397091pjb.149.1598849172382;
        Sun, 30 Aug 2020 21:46:12 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id h193sm5930037pgc.42.2020.08.30.21.46.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Aug 2020 21:46:11 -0700 (PDT)
Date:   Mon, 31 Aug 2020 10:16:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        lkft-triage@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        madhuparnabhowmik10@gmail.com
Subject: Re: Kernel panic : Unable to handle kernel paging request at virtual
 address - dead address between user and kernel address ranges
Message-ID: <20200831044609.owejwct5rvrgc5e5@vireshk-i7>
References: <CA+G9fYvUwH2FA9GOeA_7GYpLA31uOmEpg32VKnJ8-d5QSK4PdQ@mail.gmail.com>
 <20200827090813.fjugeqbb47fachy7@vireshk-i7>
 <CAK8P3a2zxybiMDzHXkTsT=VpHJOLkwd1=YTtCNU04vuMjZLkxA@mail.gmail.com>
 <20200827101231.smqrhqu5da6jlz6i@vireshk-i7>
 <CA+G9fYv=XLtsuD=tVR1HHotwpKLkbwZVyPr4UhY-jD+6-duTmw@mail.gmail.com>
 <CA+G9fYvSEHua0EpW64rASucWuS-U2STAZxufrfN75UDspGt2cA@mail.gmail.com>
 <CAPDyKFrpOqpBiSvkvO7sXHiQDOwdXYmx-80Ji5wW79QF-MrOuQ@mail.gmail.com>
 <CADYN=9K3D3OZ5T_K+6MfcgVLRoktPB6LvwDiXGj-+Zpq3faYfg@mail.gmail.com>
 <CAPDyKFpNVJZ0FddJ8naXYp-oZr-mYSOH-5iXG-wASZEFozBJJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpNVJZ0FddJ8naXYp-oZr-mYSOH-5iXG-wASZEFozBJJQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28-08-20, 14:23, Ulf Hansson wrote:
> Anders, Naresh - thanks for testing and reporting. I am dropping the
> patch from my tree.
> 
> Viresh, I suggest to keep Anders/Naresh in the cc, for the next
> version. Then I can wait for their tested-by tag before I apply again.

Sorry for the trouble, I thought you will wait for a bit before
applying the patch to see test results from Naresh, but you were fast
enough as well :)

-- 
viresh
