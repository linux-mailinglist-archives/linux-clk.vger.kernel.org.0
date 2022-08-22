Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7441359CC9E
	for <lists+linux-clk@lfdr.de>; Tue, 23 Aug 2022 01:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbiHVX6p (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Aug 2022 19:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiHVX6n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 19:58:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19751F2D8
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 16:58:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A617613E2
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 23:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61173C433C1;
        Mon, 22 Aug 2022 23:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661212721;
        bh=AeNpJCsTQy5+ypQNpkegYoWSGNGMRl8ywwgPM+EFyVw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Qop6W0ppAarsROnfNVFN6OcKXmYm99uyBhF7Uc95U+IrWI/YBZDcH/WkJCAHZv2pg
         RhIdqmERhDl3yszefMKO3eHWyYTEtoxGdG8eHVXrqnwcc0Ki0/7VOnWSPAXpKk1Z9o
         Ez1xPs6T6S0KAokqiR90YYp85HNrUbe/bSK/AZq8u63mok/qOzZOY3/iWUHpr9iC8Q
         eUGj1uYusAlaXuTUy6bNqvquoYogjybww0DjzMCwFWLTDnMdWFmcUHFYe2ZdXs4qXL
         hy4DP2LMQgmosHrlGrbSm7Cect9Nz6KNxhIhFnPmqSuh7od2LcfrFRWPBlbC+NZWFs
         pXYYC882pkz+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220510070154.29528-2-shubhrajyoti.datta@xilinx.com>
References: <20220510070154.29528-1-shubhrajyoti.datta@xilinx.com> <20220510070154.29528-2-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 1/2] clk: zynqmp: Replaced strncpy() with strscpy()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, git@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 22 Aug 2022 16:58:39 -0700
User-Agent: alot/0.10
Message-Id: <20220822235841.61173C433C1@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2022-05-10 00:01:53)
> Replaced strncpy() with strscpy() as the clock names are supposed to
> be NULL terminated.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Applied to clk-next
