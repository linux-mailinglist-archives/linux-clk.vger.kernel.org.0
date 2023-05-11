Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D676FFD46
	for <lists+linux-clk@lfdr.de>; Fri, 12 May 2023 01:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjEKX3b (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 11 May 2023 19:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239506AbjEKX3a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 19:29:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B920461BA
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 16:29:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A38D265274
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 23:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8179FC433EF;
        Thu, 11 May 2023 23:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683847768;
        bh=SLlcwEuE4JpFNFcPjNi/S0l6z/1UC6psRw1iRRUVsYs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=efUdlcXR/weB6qRSybLmpnKrQG4ctSZoORqH6nEZTv0i+nAPO4aErh3H652p78bhZ
         tVE+QXHCkMDO7gRC+eRJ7rKBpsXJZQ/l/knP+UPmqN5P4YyFLbvYLE/N+2mpU8jehw
         JDTysC+qkto2m3UoixYkCKVqqj2MKCiOiS0dSMR1lNHOnC6XTnUF1I9jWNYP4e6LhG
         h9d8bKTpoQq3YuR4xqlTf/GqOXvMYILRNsWv+evIyyp7FR/57/Fu6XvxYSnFYFbXoV
         M6uJbiFNqPHw4+XLoGIe9pJpTllMPFIVdCOcujeyDwvddeGva5nJ+dpAi7mfwoO6kW
         fb+AFD5Kkdh9g==
Date:   Thu, 11 May 2023 16:29:26 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadfed@meta.com>, Jiri Pirko <jiri@resnulli.us>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [RFC PATCH v7 1/8] dpll: spec: Add Netlink spec in YAML
Message-ID: <20230511162926.009994bb@kernel.org>
In-Reply-To: <DM6PR11MB4657EF0A57977C56264BC7A99B749@DM6PR11MB4657.namprd11.prod.outlook.com>
References: <20230428002009.2948020-1-vadfed@meta.com>
        <20230428002009.2948020-2-vadfed@meta.com>
        <ZFOe1sMFtAOwSXuO@nanopsycho>
        <20230504142451.4828bbb5@kernel.org>
        <MN2PR11MB46645511A6C93F5C98A8A66F9B749@MN2PR11MB4664.namprd11.prod.outlook.com>
        <20230511082053.7d2e57e3@kernel.org>
        <DM6PR11MB4657EF0A57977C56264BC7A99B749@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 11 May 2023 20:53:40 +0000 Kubalewski, Arkadiusz wrote:
> >Because I think that'd be done by an NCO, no?  
> 
> From docs I can also see that chip has additional designated dpll for NCO mode,
> and this statement:
> "Numerically controlled oscillator (NCO) behavior allows system software to steer
> DPLL frequency or synthesizer frequency with resolution better than 0.005 ppt."
> 
> I am certainly not an expert on this, but seems like the NCO mode for this chip
> is better than FREERUN, since signal produced on output is somehow higher quality.

Herm, this seems complicated. Do you have a use case for this? 
Maybe we can skip it :D

My reading of the quote is that there is an NCO which SW can control
precisely. But that does not answer the questions:
 - is the NCO driven by system clock or can it be used in locked mode?
 - what is the "system software"? FW which based on temperature
   information, and whatever else compensates drift of system clock?
   or there are exposed registers to control the NCO?

