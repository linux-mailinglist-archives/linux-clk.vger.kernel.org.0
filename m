Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E62454D86C
	for <lists+linux-clk@lfdr.de>; Thu, 16 Jun 2022 04:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347216AbiFPCfU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Jun 2022 22:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349639AbiFPCfT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 22:35:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6C633A10
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 19:35:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3451761015
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 02:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88473C3411A;
        Thu, 16 Jun 2022 02:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655346916;
        bh=xlBA1pOBgFT/FDCQhyIQrOjaVMKVtDFpVx/iWnjrdfc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=S7GM3g4MeKvLSJnNU8s1JmzcAk6n3B0EwC5jb3EuaM+p8i7Y/1m2BQRQF12JV/WPy
         YV1YCHgn0s+6I9ZUe8CEwXH7ManKoBrKBFCsOdByN1JD3h9iwVXuV1Khb+UDb/5tiE
         uSW5+aRPgdM6Ci30mM/0uoFzqPvoCEV1vdrI3ygbJA7OvV+2WO5ZRQpzalVbB1eXuV
         nzcgm8La/qTeacpEfh7tRg3reR3PJWvI38w7keolgiEo0En5c+3Bnz/UIj/N0A4CoO
         baTfMQEA6L2nv66+tCQueI/fGQgl5Y2m2KbsWkbXJFibaFiaqrDu/bYp3qMkz++W1j
         xRG3gyFRZ8Itg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220520075737.758761-2-u.kleine-koenig@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de> <20220520075737.758761-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v9 1/4] clk: Improve documentation for devm_clk_get() and its optional variant
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>
To:     Russell King <linux@armlinux.org.uk>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Wed, 15 Jun 2022 19:35:13 -0700
User-Agent: alot/0.10
Message-Id: <20220616023516.88473C3411A@smtp.kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2022-05-20 00:57:34)
> Make use of "Context:" and "Return:". Mention that the clk is not to be
> expected to be prepared, previously only not being enabled was mentioned
> which probably dates from the times when the concept of clk preparation
> wasn't invented yet.
>=20
> Also describe devm_clk_get_optional() fully instead of just referencing
> devm_clk_get().
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
