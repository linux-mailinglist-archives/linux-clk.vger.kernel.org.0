Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D823B26BED1
	for <lists+linux-clk@lfdr.de>; Wed, 16 Sep 2020 10:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgIPIHi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 16 Sep 2020 04:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgIPIHf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Sep 2020 04:07:35 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73212C061788
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2020 01:07:35 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id r19so2771710pls.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2020 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=al9Aj6fs6m+1M4OkCEo9LbifP4jLsy69rCvFZh8tgSo=;
        b=zzWy5FpNemcfGLEGQwn9nDnjgZhz9mWvEAhdUPA/Ylhu/AmfNsEo2+rh/3jna6Geck
         OP0RAVDF/RnzkFm8PSMVyDhbRcHqk+QknIGlSRD54RXMfRCxEwko2D/ST0dfUyzR/apl
         HG1dj8NhxvhQFs9NSzqlFxxslPCgdisM32diLBgmaAcmyFyb7WCI8i0TFY3/vUJMRTMf
         XvXWRMQTf+4bsLJ7BaiBMzd0R4mpg2yX42QTpafRpoUvsLZJddNWbdvtDBa7tuT4OND6
         h6CrlRIrk7qLDtPaodHamGUU9EKRuKol4PujdZjFkyUbywJKuQp50Ew/JrmLBwbwwEub
         JCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=al9Aj6fs6m+1M4OkCEo9LbifP4jLsy69rCvFZh8tgSo=;
        b=JxHtrfnoOQzBfDEJOyhX049HViI+PpzF29swvm1lpoiIPXbG0N2GnE3ub8zjJCwF5w
         67AnJyS5tzYkj1ppVxeIcq8VcUqeWRkivr9KSouiNAu7AB75NHG8fNadPgDjcet5z/1j
         S7SAVaZ/q76QcSsJj6hJRXQkIPV+lehSjrIm4hgAbyedaRII0VZuYyHzMFyu7PfFvVfg
         pBvkHVikYibUq4j3vrm8TaLx65KyIw0C2BSdPTOt50JU0a35JFNjQYaqdiY9j+g5P+y8
         jyF68n/MkTawfqiwbqJgvKPDPwLcWZbdbGmrXoW7cUAEP5UENVUTBKg5N8S+nF9zJ7+o
         EFqg==
X-Gm-Message-State: AOAM532BvHC9RCrmJnZqds5dN1pi+mykvPJiXjti9a3gSYHEHvXk7zma
        9Tq8VLu7E84TQjuHyrAsH7fBm+enwcs4Gw==
X-Google-Smtp-Source: ABdhPJwrXgqKRavyqwV2JZf/7NkYcdOZiJpy8XXK8VuazY2kkP30NBcE/tCboIIeuERfnF+hGcTHvA==
X-Received: by 2002:a17:90a:aa94:: with SMTP id l20mr2813436pjq.95.1600243654933;
        Wed, 16 Sep 2020 01:07:34 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id f28sm16163363pfq.191.2020.09.16.01.07.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 01:07:33 -0700 (PDT)
Date:   Wed, 16 Sep 2020 13:37:28 +0530
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
Message-ID: <20200916080728.ajqzw75spcmbbwsc@vireshk-i7>
References: <CA+G9fYvYEsxjU_cnm6oWFgOrU4x0T1CMoN-L2SHLGeJC6MF54Q@mail.gmail.com>
 <CAPDyKFqVB_hgDghaYU1B1BbWUuL6GHhWMbZEYM-cXDQ8T8ThfQ@mail.gmail.com>
 <20200916052239.7c5z4wqqrdpauti4@vireshk-i7>
 <CAPDyKFrxrKRuJec0pDLooovV3BJBVvmDizoL6N4eb+hv1D0NgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrxrKRuJec0pDLooovV3BJBVvmDizoL6N4eb+hv1D0NgA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16-09-20, 09:37, Ulf Hansson wrote:
> I have the board as well. If you need some help with testing, just let me know.
> 
> In any case, I will try the revert and see how that changes things.

I am testing this with help of Naresh currently, will try to update
back today itself.

-- 
viresh
