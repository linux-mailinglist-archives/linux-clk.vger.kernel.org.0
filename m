Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E1350ECCD
	for <lists+linux-clk@lfdr.de>; Tue, 26 Apr 2022 01:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbiDYXt0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 25 Apr 2022 19:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiDYXtZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 19:49:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F861903C
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 16:46:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4BD20B81A2F
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 23:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFEDC385A7;
        Mon, 25 Apr 2022 23:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650930378;
        bh=WHeXOpBZLfDZ+Vw84EpD1LKBrqSghkKm6dttfg32iGA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cgB5Pe8kkz/LnkfH5zdL9N1+fILH17ARiYFttMWjJaXHO3KjvpZbWrP7TE3HsSbOK
         VZWp8UEXL5ETKHvu6vnym8zNVXYxmEVaEu/DO8WyWvWj1ZAV8iXtRH/+YMuHu+mY6U
         TZghfL4m2gGF5ERMcw0VSSu6fdDrlWlpWh5v5VIX8y5O1o+9EvdKPbjk+/cDQIJ7x8
         nv5iv675a0MBForbP3U+15imM7xcdQKmNRKHOfQZAXzZdFz8B+UAJNBwJF+KDwoa4I
         u6gUyKa1gCjMUNEwNqaq+rv7lfU90S/chbSblMT9+W2MWbrYZo9DXG7fMeCrMWrUCb
         viN1LeqOct1Gg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220414221751.323525-4-linus.walleij@linaro.org>
References: <20220414221751.323525-1-linus.walleij@linaro.org> <20220414221751.323525-4-linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5 v3] clk: ux500: Drop .is_prepared state from PRCMU clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 25 Apr 2022 16:46:16 -0700
User-Agent: alot/0.10
Message-Id: <20220425234618.0FFEDC385A7@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2022-04-14 15:17:49)
> The core already keeps a software prepare count. Drop this
> custom software prepare count.
>=20
> The only semantic difference is that if disabling the clock
> fails, .is_prepared() will still return 1, but this will only
> serve to confuse the framework, the error message is
> sufficient.
>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
