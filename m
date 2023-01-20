Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91169674EF9
	for <lists+linux-clk@lfdr.de>; Fri, 20 Jan 2023 09:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjATIGr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 Jan 2023 03:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjATIGq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 03:06:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226A28766C;
        Fri, 20 Jan 2023 00:06:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 753C561C1D;
        Fri, 20 Jan 2023 08:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04627C4339C;
        Fri, 20 Jan 2023 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674202000;
        bh=UiIWl1B5LiUi4QWU9j9MLDN5A3wG8pwgCFhO+/VTz5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eV82duGb2iVbYPyf0AeoQN8zV/TSECpo1KwtWHWHyFwc/G0u7ds3bXr4Gf1iaXQeW
         Pwwm8fnvJGoBrj/QdnGlrIfCf0QHXJCoN8pdlM5u0+kC5R4gfMB1+gvH+Uf7e5VcxI
         PpgA+S2NMZJoKa1IlJ7qHGY9iE/UO87bWRtgDysT3ajO7hI47onHI+5t5tL3a77ewS
         utwllDInmkt7v2ObVNXNxYSnf2Rfo8FVFepensvD6wTfqd0CCQbKASP7YMWYcUNvDM
         Anh4nz2sI09zSdiT2RBNZKM28fWrmL/ovniHJ40t+r4+UM9To1RXjxRy7uI8IVUUiK
         veIQLzwAP4nmA==
Date:   Fri, 20 Jan 2023 13:36:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, Li Yang <leoyang.li@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 00/10] phy: Add support for Lynx 10G SerDes
Message-ID: <Y8pLjLWjv0nJa+ww@matsya>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <0024c780-ff9c-a9d3-8773-28e6b21bcc43@seco.com>
 <Y8gkMlqfPZic7reK@matsya>
 <17e428ae-7789-a1ab-3ccd-90b3b9a088f1@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17e428ae-7789-a1ab-3ccd-90b3b9a088f1@seco.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19-01-23, 11:22, Sean Anderson wrote:
> On 1/18/23 11:54, Vinod Koul wrote:
> > On 17-01-23, 11:46, Sean Anderson wrote:
> >> 
> >> I noticed that this series is marked "changes requested" on patchwork.
> >> However, I have received only automated feedback. I have done my best
> >> effort to address feedback I have received on prior revisions. I would
> >> appreciate getting another round of review before resending this series.
> > 
> > Looking at the series, looks like kernel-bot sent some warnings on the
> > series so I was expecting an updated series for review
> > 
> 
> Generally, multiple reviewers will comment on a patch, even if another
> reviewer finds something which needs to be changed. This is a one-line
> fix, so I would appreciate getting more substantial feedback before
> respinning. Every time I send a new series I have to rebase and test on
> hardware. It's work that I would rather do when there is something to be
> gained.

I review to apply, if I can apply, I would typically skip this

-- 
~Vinod
