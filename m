Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAF7F72CDD3
	for <lists+linux-clk@lfdr.de>; Mon, 12 Jun 2023 20:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbjFLSXI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 12 Jun 2023 14:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjFLSXI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 14:23:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C101EC
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 11:23:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1126761713
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 18:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64005C4339E;
        Mon, 12 Jun 2023 18:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686594186;
        bh=WyvhCdaTbuSl+hj8YxIif3NWK70yovwmlYcBoHz6jNc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ExeIaOqg7ko8a2XqHAudSRpTI1/nXrGu/iBGKg88j9AGEoNvuOIAUkPfc5y8sMlt1
         0h06+QuIY4nMmMBxtBXpkLRj4+gtVWoDTH7B56GWzUmbfJ6X34kfXoqxPjaKzPxSKH
         4io3wwz7oRen5Uuw1/2pZsEmaNtP0jz94hkZqBJRE2SfLh2ZZwo7ufxyqA2iIWm52s
         TOY5fldy9sMEYfRuUlVOJqDSGhZkYtSnXOk9o+dFS0m/NOwLc+U0OykdoWJL6VQcbN
         lLne28FCD4BBZ6p2/YT4dEm1oYR/V749xJ2A9LMPI1jDVMkwt5TNcjTjWgoQaXjeZI
         fg3szMZGxBw2A==
Message-ID: <9a3239dc68473e8f7145e6036e3a4298.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j1qik7lrg.fsf@starbuckisacylon.baylibre.com>
References: <1j1qik7lrg.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic updates for v6.5
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, AML <linux-amlogic@lists.infradead.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Mon, 12 Jun 2023 11:23:04 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2023-06-09 07:25:30)
> Hi Stephen,
>=20
> Here are the amlogic clock updates for v6.5
> Please pull
>=20
> Cheers
> Jerome
>=20
> The following changes since commit ac9a78681b921877518763ba0e89202254349d=
1b:
>=20
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.5-1
>=20
> for you to fetch changes up to 84af914404dbc01f388c440cac72428784b8a161:
>=20
>   clk: meson: a1: add Amlogic A1 Peripherals clock controller driver (202=
3-05-30 17:53:09 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
