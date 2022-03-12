Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058CC4D6C38
	for <lists+linux-clk@lfdr.de>; Sat, 12 Mar 2022 04:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiCLDXy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 11 Mar 2022 22:23:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiCLDXy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Mar 2022 22:23:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586E53BBE3
        for <linux-clk@vger.kernel.org>; Fri, 11 Mar 2022 19:22:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 07DBFB82DC5
        for <linux-clk@vger.kernel.org>; Sat, 12 Mar 2022 03:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF4AC340E9;
        Sat, 12 Mar 2022 03:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647055366;
        bh=j1SIdXouwoPFRxjV44klB4eVyArI7OSgIwZUOKvv7wg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RKqJhGFgFIhZuoqCSS/0bJIZTXstQFTEwowVK2XDI4HdL0NvGtDASP3TrLcjXMJFJ
         j2lqEcEpLf6jiRTqHrDbWvHlnFNkzPkzB2WfdgZyNrVv2qmA1KPrZDyrk8BKRKu13t
         w7qJC2Ecf3jOGKFkRmEPPYhvWV47/F8mB1KH8ApdrICj9Uw9m5b44ltJTwWI1PPksm
         mUf66557tI3nScj91gxdDhsjs6/gCCezMwZtxXxs9Xhu6N+5WyxJ/nR6Gp3lUOoyaj
         XAlR8JQqBIT32UOFwU3zbIHEzGGP2TUIaSOfGDXWJAdo31jItnODrky76+9KvcIwkV
         USdne/P7vJ2xA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220222140732.253819-1-maxime@cerno.tech>
References: <20220222140732.253819-1-maxime@cerno.tech>
Subject: Re: [PATCH] clk: bcm2835: Remove unused variable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>,
        kernel test robot <lkp@intel.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 11 Mar 2022 19:22:43 -0800
User-Agent: alot/0.10
Message-Id: <20220312032246.8BF4AC340E9@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-02-22 06:07:32)
> Since commit 8ca011ef4af4 ("clk: bcm-2835: Remove rounding up the
> dividers"), the rem variable is still set but no longer used. Remove it.
>=20
> Fixes: 8ca011ef4af4 ("clk: bcm-2835: Remove rounding up the dividers")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
