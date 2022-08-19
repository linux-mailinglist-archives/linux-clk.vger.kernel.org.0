Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1089C59A7DE
	for <lists+linux-clk@lfdr.de>; Fri, 19 Aug 2022 23:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbiHSVl4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 19 Aug 2022 17:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbiHSVly (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 17:41:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C0510DCD5
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 14:41:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFBD06179D
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 21:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3138AC433C1;
        Fri, 19 Aug 2022 21:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660945313;
        bh=9r3PvTvqlF7UTLX0U9CkvaDXuLblCQDqHDcdWTfLIVA=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=fgtueJxT08XU2SlKmaG8ClTXLCKjGmmljwJuo/AbD72NNzlm+D75fbcL20KoW/F8O
         rc8Egh7lBaaFausrSd/fIjT9rYBhqllSilm+M/44Np9Ay9k4e+Tjdo4AAng4joeXMx
         qeGOp6zosgYTtbRHrP5xl2ytZ3vZEG6lnfAvrVlCVsn9qRKtz50boLkfhYjKGwMXdR
         jCRxluOUKJ9iroZFUfuNqACIm2ztblAwG8kID5q/sx8+BK1F9/m0LaOi8WvXixz8ES
         Fh2FaeRrn4dB9xFymSUQavSmtQ/+ZlpRsL3gEw4ZBooMEyXesojkd2g83pqyWAeQv+
         34/IZjFJiL96w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220628143851.171299-1-windhl@126.com>
References: <20220628143851.171299-1-windhl@126.com>
Subject: Re: [PATCH v2] clk: qoriq: Hold reference returned by of_get_parent()
From:   Stephen Boyd <sboyd@kernel.org>
To:     linux-clk@vger.kernel.org, mturquette@baylibre.com, windhl@126.com
Date:   Fri, 19 Aug 2022 14:41:51 -0700
User-Agent: alot/0.10
Message-Id: <20220819214153.3138AC433C1@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liang He (2022-06-28 07:38:51)
> In legacy_init_clockgen(), we need to hold the reference returned
> by of_get_parent() and use it to call of_node_put() for refcount
> balance.
>=20
> Beside, in create_sysclk(), we need to call of_node_put() on 'sysclk'
> also for refcount balance.
>=20
> Fixes: 0dfc86b3173f ("clk: qoriq: Move chip-specific knowledge into drive=
r")
> Signed-off-by: Liang He <windhl@126.com>
> ---

Applied to clk-next
