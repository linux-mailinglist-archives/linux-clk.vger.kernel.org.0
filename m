Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90B542D377
	for <lists+linux-clk@lfdr.de>; Thu, 14 Oct 2021 09:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbhJNHYu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 Oct 2021 03:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhJNHYt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Oct 2021 03:24:49 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C02C061570
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 00:22:45 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 66so4676636pgc.9
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 00:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0E4COH2ngrsNLXN5bCFa0OuHr0xwFVq3eN5FS8su8SI=;
        b=sZg2UBbzc5xYFuaYrGZAIEckcQgPOqz4j4cpz8yj5S1wsZoxSQgUoirPCursJASrNF
         945CajmOzF8Dc4IJE2X3QtNug9AtGIc5CKtsfidTyY71GssDhuJQeNFlW1YdKChQUkUR
         8ENOT6pYFRppbKljq3W7UFqT5UK4W3hAIccjNbSeaeMmVafHHYdFVwLBXLvStW5NK69K
         UlpiVVDGaMCX+lHYKau1JiaV31fkO5u7FfOpgzVTKcg+bktpfdesgHdTfXNHnZEXuLxW
         NVoSkZsV+I9wLdewHh0sPQ86HxdVqkSFC7lt7UnuvFLGiXeImsnquMTD3Ipf/oEcvyqV
         MsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0E4COH2ngrsNLXN5bCFa0OuHr0xwFVq3eN5FS8su8SI=;
        b=vIA9QN7BpheMAUiH1UltNfisW66H8aY1w7xZCSLD5R4n/gJYJzoa966m8p5Av/4pxp
         Mzf0Tj3IPQjdldG5atKQxjyfUXbPZSLlYCk4D4069uOmy6PCoZvgps1sxNnE9cxbL90j
         mT+2Y878XPzR58QbdS3WrFwU3FRybch+LuWdBVO1EhGilq+qW/Lc9m9S0z01cP9vm4Bv
         3rEtc60sL28mRcRLn7Y6V5z2rLctd6Qp9WMpUMRU98lzphvD/Hf7fwGyGz0p06ZZACSF
         Mnb0i5mOs/Ai67NcsSh1cp9i/eWA0llmhdS/l0xmLO4AtNejpETOv+TtgdG69Ah3DPLM
         FuTA==
X-Gm-Message-State: AOAM532P0fclwwQMeIJXmmAma1JFx4llBAnZsZYE/WVoZsbhJ2ceK3vT
        ozLU/h/Kv12/cInal+wD1ZYdYw==
X-Google-Smtp-Source: ABdhPJzZs4kh6M/dTz/1dja+i0gSblIEsU52ShMyg0/r5m5O8L8oyr8Q5S6iSy+DsP/OGZBF1kcsKQ==
X-Received: by 2002:a62:8f8e:0:b0:44c:f130:9291 with SMTP id n136-20020a628f8e000000b0044cf1309291mr3853972pfd.19.1634196164780;
        Thu, 14 Oct 2021 00:22:44 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id y17sm1579348pfi.206.2021.10.14.00.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 00:22:44 -0700 (PDT)
Date:   Thu, 14 Oct 2021 12:52:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Hector Martin <marcan@marcan.st>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-kernel@lists.infradead.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Sven Peter <sven@svenpeter.dev>, Marc Zyngier <maz@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/9] opp: core: Don't warn if required OPP device
 does not exist
Message-ID: <20211014072242.bvj6exirqrct73vl@vireshk-i7>
References: <20211012032144.2ltlpat7orrsyr6k@vireshk-i7>
 <b7cd51ec-38e5-11d8-5193-1170c9d60ac9@marcan.st>
 <20211012055143.xmkbvhbnolspgjin@vireshk-i7>
 <caf16a6c-f127-7f27-ed17-0522d9f1fb9e@marcan.st>
 <20211012092603.lkmhhjoo5v67wh44@vireshk-i7>
 <049FC437-EC38-4FE5-891E-5E25960892CF@marcan.st>
 <20211012093252.hb6rlcpxv5bmk7n3@vireshk-i7>
 <0db8e994-ac2c-8fad-55d0-1b5a9e2e21f2@marcan.st>
 <20211014065636.lkv77aqbugp3qhif@vireshk-i7>
 <039b77f3-d10e-bd7a-a594-b951a98bdd45@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <039b77f3-d10e-bd7a-a594-b951a98bdd45@marcan.st>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14-10-21, 16:03, Hector Martin wrote:
> On 14/10/2021 15.56, Viresh Kumar wrote:
> > > +	/*
> > > +	 * Attach the CPU device to its genpd domain (if any), to allow OPP
> > > +	 * dependencies to be satisfied.
> > > +	 */
> > > +	ret = genpd_dev_pm_attach(cpu_dev);
> > > +	if (ret <= 0) {
> > > +		dev_err(cpu_dev, "Failed to attach CPU device to genpd\n");
> > > +		goto out;
> > > +	}
> > > +
> > 
> > Other platform do this from some other place I think.
> > 
> > Ulf, where should this code be moved ? cpu-clk driver ?
> > 
> 
> I see one driver that does this is drivers/clk/qcom/apcs-sdx55.c (via
> dev_pm_domain_attach).

That may be a good place since you are already adding it and it is related to
CPU clk.

> Though it only does it for CPU#0; we need to do it
> for all CPUs.

Sure.

-- 
viresh
