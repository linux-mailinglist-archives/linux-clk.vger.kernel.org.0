Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D07B4EB370
	for <lists+linux-clk@lfdr.de>; Tue, 29 Mar 2022 20:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239098AbiC2Sie (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 29 Mar 2022 14:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240603AbiC2Sic (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 14:38:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2B4185452
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 11:36:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C301EB817F7
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 18:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80391C2BBE4;
        Tue, 29 Mar 2022 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648579005;
        bh=b9eMg+HdZXnqKiC8V2d+mu03B4Z962oua246cclibqE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=X0SnTRJxe3SAdljGSG7cFaO4ojkHJmVLUsfKswY2T1VaAb0ZTTUjwjhp66PejsMgB
         31LU8H8ZZ8wIcqeOYtsEhuIcDgzEAvdLcN+5U6GGv6YdymflME/nS1cXrzKiKpf+kJ
         4CY/POjmDHetMjEQqU+p5kMufIiZZAiJUg8qzcHQqGSwOAuBlXXEFtaQGrtJvhtFGw
         s2MvihF5Z9OO9epAyGQbNW4AWYNuRCO0gAWQmhvTBEJFz0oG6l5ba002US06r0sbg/
         g9Ynu3NZ4Hr7htWXQoyFR0uoX6nyPPcLnt281nkv4K0RSZAAcz0EFtE+XhTd2McLjK
         7Oi7b5nquB66g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220325161144.1901695-4-maxime@cerno.tech>
References: <20220325161144.1901695-1-maxime@cerno.tech> <20220325161144.1901695-4-maxime@cerno.tech>
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 29 Mar 2022 11:36:43 -0700
User-Agent: alot/0.10
Message-Id: <20220329183645.80391C2BBE4@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-03-25 09:11:44)
> While the current code will trigger a new clk_set_rate call whenever the
> rate boundaries are changed through clk_set_rate_range, this doesn't
> occur when clk_put() is called.
>=20
> However, this is essentially equivalent since, after clk_put()
> completes, those boundaries won't be enforced anymore.
>=20
> Let's add a call to clk_set_rate_range in clk_put to make sure those
> rate boundaries are dropped and the clock drivers can react.
>=20
> Let's also add a few tests to make sure this case is covered.
>=20
> Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rate")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
