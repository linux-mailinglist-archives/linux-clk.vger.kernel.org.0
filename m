Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C82E52F80C
	for <lists+linux-clk@lfdr.de>; Sat, 21 May 2022 05:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239623AbiEUD3x (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 May 2022 23:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbiEUD3w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 23:29:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10370185C9F;
        Fri, 20 May 2022 20:29:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F49461EF8;
        Sat, 21 May 2022 03:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC305C385A9;
        Sat, 21 May 2022 03:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653103791;
        bh=ktEWLw7fX0VJQgaR8sZo/sm5OJ8hGBxTsDsZpHgOnyA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=q2eBIHoX2s/YvWBv8HDaGrffHl6F7iXLUG1iE++YIOpKUqP4Rs84CtL3Uj6ptrXjd
         xLOrdP5+hIF1cZwRcVzm57kHrYt4+4/sZ+oMe1snQ6NJ93yBqUqFvEeDLRZ3uiuLCV
         9czgUD2nZq/u4D+Jo2NBDFQD1WIwOzaUAPMmB5a/b4ptunCCUs4j0tXfY3nZI89OES
         OAnRkAqRfvanq7fQ5jDSEbZEY9TmrDdSEG/BLqNKC/zXItwLFIpw2Yf8GOCB8I4wfB
         Rw/RH6cS2YcZ2T+qtSrjvNDAVjXfSfVGK6iwVuAmTccvgpjxixa+pIoCLfCxOk//rR
         W3P6fmrTIx9zg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220520030625.145324-1-chanho61.park@samsung.com>
References: <CGME20220520030551epcas2p1a67b9f026ce2ec56b0a167026ef96baf@epcas2p1.samsung.com> <20220520030625.145324-1-chanho61.park@samsung.com>
Subject: Re: [PATCH] dt-bindings: clock: exynosautov9: correct count of NR_CLK
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>
To:     Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>
Date:   Fri, 20 May 2022 20:29:48 -0700
User-Agent: alot/0.10
Message-Id: <20220521032950.EC305C385A9@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chanho Park (2022-05-19 20:06:25)
> _NR_CLKS which can be used to register clocks via nr_clk_ids. The clock
> IDs are started from 1. So, _NR_CLKS should be defined to "the last
> clock id + 1"
>=20
> Fixes: 680e1c8370a2 ("dt-bindings: clock: add clock binding definitions f=
or Exynos Auto v9")
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---

Applied to clk-next
