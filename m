Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE5F56F6F8A
	for <lists+linux-clk@lfdr.de>; Thu,  4 May 2023 18:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjEDQEI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 4 May 2023 12:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjEDQEH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 12:04:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D7E4EE1
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 09:04:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 667776354D
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 16:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBD1C433D2;
        Thu,  4 May 2023 16:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683216244;
        bh=Ov33ChoosA7Cg6h45OD0WZw1JmTuLbJ584Oy24/tJVw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DR204dEDNKBcZFSP8CNLlrVFA0V5T7uw3kTvqe8VeJNeBbra6huCqOW1gyOnh+d8V
         xAgCzYQ5VjPQIXOIBNcAi+/bIj5n3LiigembK7raNPr5RL8qISsKu/WRMb2PF7UnS0
         Ur0ugAfKCQDj3LNtTi7EZ2qTldvPT+Rh7Ss/2MudtXsMuw8Vx+MSbZIXe9aOM0IS8T
         FVaTTjyje7Xgmzm7SqmJbjc/UtrIv4oIxYY9nC16c1TGKkYx4itmg86WAcAXUSzBhI
         yCcDl/l8Z2P+TFEBsqIyYsw3ESufSDfm+FFe2vaheFRBMF1pT34Ll6xzGltabAfVNU
         u8Q1tDHVdFhqg==
Date:   Thu, 4 May 2023 09:04:01 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <20230504090401.597a7a61@kernel.org>
In-Reply-To: <ZFOQWmkBUtgVR06R@nanopsycho>
References: <ZBGOWQW+1JFzNsTY@nanopsycho>
        <20230403111812.163b7d1d@kernel.org>
        <ZDJulCXj9H8LH+kl@nanopsycho>
        <20230410153149.602c6bad@kernel.org>
        <ZDwg88x3HS2kd6lY@nanopsycho>
        <20230417124942.4305abfa@kernel.org>
        <ZFDPaXlJainSOqmV@nanopsycho>
        <20230502083244.19543d26@kernel.org>
        <ZFITyWvVcqgRtN+Q@nanopsycho>
        <20230503191643.12a6e559@kernel.org>
        <ZFOQWmkBUtgVR06R@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 4 May 2023 13:00:42 +0200 Jiri Pirko wrote:
> Thu, May 04, 2023 at 04:16:43AM CEST, kuba@kernel.org wrote:
> >On Wed, 3 May 2023 09:56:57 +0200 Jiri Pirko wrote:  
> >> Okay.
> >> 
> >> When netdev will have pin ID in the RT netlink message (as it is done
> >> in RFCv7), it is easy to get the pin/dpll for netdev. No problem there.
> >> 
> >> However, for non-SyncE usecase, how do you imagine scripts to work?
> >> I mean, the script have to obtain dpll/pin ID by deterministic
> >> module_name/clock_id/idx tuple.  
> >
> >No scoped idx.  
> 
> That means, no index defined by a driver if I undestand you correctly,
> right?

Yes, my suggestion did not include a scoped index with no
globally defined semantics.
 
> >> There are 2 options to do that:
> >> 1) dump all dplls/pins and do lookup in userspace
> >> 2) get a dpll/pin according to given module_name/clock_id/idx tuple
> >> 
> >> The first approach is not very nice.
> >> The currently pushed RFCv7 of the patchset does not support 2)
> >> 
> >> Now if we add support for 2), we basically use module_name/clock_id/idx
> >> as a handle for "get cmd". My point is, why can't we use it for "set
> >> cmd" as well and avoid the ID entirely?  
> >
> >Sure, we don't _have_ to have an ID, but it seems go against normal
> >data normalization rules. And I don't see any harm in it.
> >
> >But you're asking for per-device "idx" and that's a no-go for me,
> >given already cited experience.
> >
> >The user space can look up the ID based on identifying information it
> >has. IMO it's better to support multiple different intelligible elements  
> 
> Do you mean fixed tuple or variable tuple?
> 
> CMD_GET_ID
>   -> DPLL_A_MODULE_NAME  
>      DPLL_A_CLOCK_ID

> What is the next intelligible element to identify DPLL device here?

I don't know. We can always add more as needed.
We presuppose that the devices are identifiable, so whatever info
is used to identify them goes here.

>   <- DPLL_A_ID
> 
> CMD_GET_PIN_ID
>   -> DPLL_A_MODULE_NAME  
>      DPLL_A_CLOCK_ID

> What is the next intelligible element to identify a pin here?

Same answer. Could be a name of the pin according to ASIC docs.
Could be the ball name for a BGA package. Anything that's meaningful.

My point is that we don't want a field simply called "index". Because
then for one vendor it will mean Ethernet port, for another SMA
connector number and for the third pin of the package. Those are
different attributes.

>   <- DPLL_A_PIN_ID
> 
> >than single integer index into which drivers will start encoding all
> >sort of info, using locally invented schemes.  
> 
> There could be multiple DPLL and pin instances for a single
> module/clock_id tuple we have to distinguish somehow. If the driver
> can't pass "index" of DPLL or a pin, how we distinguish them?
> 
> Plus is is possible that 2 driver instances share the same dpll
> instance, then to get the dpll pointer reference, they do:
> INSTANCE A:
> dpll_0 = dpll_device_get(clock_id, 0, THIS_MODULE);
> dpll_1 = dpll_device_get(clock_id, 1, THIS_MODULE);
> 
> INSTANCE B:
> dpll_0 = dpll_device_get(clock_id, 0, THIS_MODULE);
> dpll_1 = dpll_device_get(clock_id, 1, THIS_MODULE);
> 
> My point is, event if we don't expose the index to the userspace,
> we need to have it internally.

That's fine, I guess. I'd prefer driver matching to be the same as user
space matching to force driver authors to have the same perspective as
the user. But a "driver coookie" not visible to user space it probably
fine.
