Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D9E50ACB7
	for <lists+linux-clk@lfdr.de>; Fri, 22 Apr 2022 02:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376601AbiDVAW5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Apr 2022 20:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442923AbiDVAW4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 20:22:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35286D95
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 17:20:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CAAFF61F14
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 00:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3120DC385A7;
        Fri, 22 Apr 2022 00:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650586803;
        bh=cCjXBbPo1CWDl7cvi6IB5CtyIggrVuboYWVO8iCOvAA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BzbxSdnkE8znaN+Rf2xlCb2602THIwwru0OPackbZkE0P7x3YAyOW6/e3ZTPJAJzN
         jPatOIiNe3t+qC9rW72pabZ5zMwX4oxNgKyiNGeBw7VZMoyg0Nju5Fud490fPGBqho
         nkwFil5TDYbICvVkd5FOcbHNhH3bHRCE5Wiyg/t6uipqByUS5isALeR6AT6EeIjxvZ
         WcTRzdGhOxh2Il78FhX/bVGepmvQW8nVFgMrlvrMYHvXzbuf0oiP2kBHx0quWl5rdM
         /QzLJiwmLuzvm/f+QEWWp+n0184nY/WdCAw7EpiKw2E+nYljy1DnPgWu9LfeQNGQdc
         3bJbPWkwQjwRQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220407133036.213217-3-nuno.sa@analog.com>
References: <20220407133036.213217-1-nuno.sa@analog.com> <20220407133036.213217-3-nuno.sa@analog.com>
Subject: Re: [RFC PATCH 2/4] clk: fix clk not being unlinked from consumers list
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>
To:     Nuno =?utf-8?q?S=C3=A1?= <nuno.sa@analog.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 21 Apr 2022 17:20:01 -0700
User-Agent: alot/0.10
Message-Id: <20220422002003.3120DC385A7@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nuno S=C3=A1 (2022-04-07 06:30:34)
> When a clk_hw is resgistered we add a struct clk handle to it's

s/resgistered/registered/

> consumers list.

Please add that the clk handle is created in __clk_register() per the
alloc_clk() call.


> Hence, we need to remove it when unregistering the
> clk_hw. This could actually lead to a use after free if a provider get's

s/get's/gets/

> removed before a consumer. When removing the consumer, __clk_put() is
> called and that will do 'hlist_del(&clk->clks_node)' which will touch in
> already freed memory.

Did this actually happen? I don't see how __clk_put() is called on the
internal hw->clk pointer. This pointer in hw->clk should be removed but
so far we've kept it around and various clk providers have used it. If
we start removing it now I'm not sure it will work because we would
probably expose many dangling pointer problems.

>=20
> Fixes: 1df4046a93e08 ("clk: Combine __clk_get() and __clk_create_clk()")
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---
>  drivers/clk/clk.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index ed119182aa1b..e82c3ee1da13 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4198,6 +4198,7 @@ void clk_unregister(struct clk *clk)
>                 pr_warn("%s: unregistering protected clock: %s\n",
>                                         __func__, clk->core->name);
> =20
> +       clk_core_unlink_consumer(clk);
>         kref_put(&clk->core->ref, __clk_release);
>         free_clk(clk);
>  unlock:
> --=20
> 2.35.1
>
