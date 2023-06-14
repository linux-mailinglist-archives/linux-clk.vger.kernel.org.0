Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549AB730985
	for <lists+linux-clk@lfdr.de>; Wed, 14 Jun 2023 23:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjFNVBB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 14 Jun 2023 17:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbjFNVBA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 17:01:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25D61BE3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 14:00:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B95E60C1D
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 21:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DADDC433C0;
        Wed, 14 Jun 2023 21:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686776458;
        bh=i7Ospn2pc7cGgUQ5ZydmPwTZx1Id0XIpxdsM++zKIdE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=o+mtP0jfjCUh+wsx132QyhEKl6QyiKK+2XAqf8+t+TaErVKaN747gue9Tm3VwcMZE
         iUAo09EhyVRHdPgDsYpcxbAmRNJQPN5oFPrf4CFs+/gk2pvYlEgBzX86rQXVSebKRj
         u99aXayUpWhW5euY2srWIMrEP8Edbaoy4HHc/9zXx9GdzQYfB9QPj5Cbfkk9uuXfY/
         LeioxRwSW/p4fo3jwC/Xhml/5SvKbRo1gz1iK3qJiOZOHt1qun3wmV33kKqavWc9NM
         bh6pCXS/xg3c/1WaExfZSNGfzlgGyk1IyqDMgHXvlIBG4LVeuR+eIHJGfQlVC937nn
         S8NT/hGTwjd9Q==
Message-ID: <2ec1576f9d7a56a40e35dd10989a1da5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230614130044.499588-1-claudiu.beznea@microchip.com>
References: <20230614130044.499588-1-claudiu.beznea@microchip.com>
Subject: Re: [GIT PULL] Microchip clock updates for 6.5
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, conor.dooley@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Wed, 14 Jun 2023 14:00:56 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2023-06-14 06:00:44)
> The following changes since commit ac9a78681b921877518763ba0e89202254349d=
1b:
>=20
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.5
>=20
> for you to fetch changes up to 9a7b010116a430d74dc30a214ea55a58a2863d71:
>=20
>   dt-bindings: clocks: at91sam9x5-sckc: convert to yaml (2023-05-22 15:59=
:49 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
