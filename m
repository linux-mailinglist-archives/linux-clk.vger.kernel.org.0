Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F75152F864
	for <lists+linux-clk@lfdr.de>; Sat, 21 May 2022 06:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354557AbiEUEQL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 21 May 2022 00:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354524AbiEUEQG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 May 2022 00:16:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB0963E4;
        Fri, 20 May 2022 21:16:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D1526092E;
        Sat, 21 May 2022 04:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD67DC34115;
        Sat, 21 May 2022 04:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653106563;
        bh=fzfuUIxGZ8p8zrC5r/YfbXG+uhgNGHUT6VJrg95Ma/U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eufWsIrbRGWCqwBq5dySPW8/xQiRG0rR0r9ufLl2k3JZexRI+qWmjo0c9cqOuN6AA
         U+z9aXhPDs7OqLRShyEnieyjxo8+z+dgblGNfo0fR/9tek5YZePJMlI050p69Smn4h
         Wa+CZYE/y/A+4VaeEhKVvNeQc1+QiwVSWVpBGcYJWzkd4nHABNzOnwMpfbqxQ/sbnz
         5O8+jXmZK6WJdheRZxMRFle2G627FxjZ7UH0rzjHJKJlSdsUbWHc0ypNgbNMKNpR5O
         DpAu2znwcLD2t1HpFO+F0/Rn/hPVYN3x4UUL/NELNZsEaDc/6MrxXjhA7ONUsyVTkj
         jC+2LPJS8h5HQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220516070600.7692-10-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com> <20220516070600.7692-10-gabriel.fernandez@foss.st.com>
Subject: Re: [PATCH v4 09/14] clk: stm32mp13: add all STM32MP13 kernel clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 20 May 2022 21:16:01 -0700
User-Agent: alot/0.10
Message-Id: <20220521041603.BD67DC34115@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@foss.st.com (2022-05-16 00:05:55)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>=20
> Complete all kernel clocks of stm32mp13.
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
