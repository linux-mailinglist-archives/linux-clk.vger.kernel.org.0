Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C846859A7FC
	for <lists+linux-clk@lfdr.de>; Fri, 19 Aug 2022 23:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235388AbiHSVui (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 19 Aug 2022 17:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbiHSVuh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 17:50:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46180B5E52
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 14:50:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B1B78B82968
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 21:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479E9C433D7;
        Fri, 19 Aug 2022 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660945833;
        bh=sp4r3pDjizjc/cz2ZyZUCXnQCLJXtyhvnDMzHGxheqk=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=cBZ3cvHH0uZafx0TuHG4lBbEBRp3f7Aln00thTNT5cmpIKFXfpuWHqDOg/aHfhcJ4
         i5AmMPYICHfq1WajiagjbcJXG8NpU+uFFxwi8D7Mh49aBH2FI3YsOjqiCsCaogmnZV
         fkU3/6oGh5yTmkn8XVPMoKTiQap2DYHvUs2n/tF+9cGuTNdMIkxtSdQ+pRQnJMCl/4
         wO3XUKojSjFjn1gP+0S+QT4rOJDOlQxcAcTJ5EQB1x+0zRWMQJVCMDE/Dci6NPXGrc
         gj2xVb8CvkujGSj62Jxzr5dj3iq8RtFQ5Bxhk1usITwM7yqYl2TnpjSpCTVnGBTZmA
         FwL2xdcrXkssA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220708084900.311684-1-windhl@126.com>
References: <20220708084900.311684-1-windhl@126.com>
Subject: Re: [PATCH] clk: berlin: Add of_node_put() for of_get_parent()
From:   Stephen Boyd <sboyd@kernel.org>
To:     linux-clk@vger.kernel.org, mturquette@baylibre.com, windhl@126.com
Date:   Fri, 19 Aug 2022 14:50:31 -0700
User-Agent: alot/0.10
Message-Id: <20220819215033.479E9C433D7@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liang He (2022-07-08 01:49:00)
> In berlin2_clock_setup() and berlin2q_clock_setup(), we need to
> call of_node_put() for the reference returned by of_get_parent()
> which has increased the refcount. We should call *_put() in fail
> path or when it is not used anymore.
>=20
> Fixes: 26b3b6b959b2 ("clk: berlin: prepare simple-mfd conversion")
> Signed-off-by: Liang He <windhl@126.com>
> ---

Applied to clk-next
