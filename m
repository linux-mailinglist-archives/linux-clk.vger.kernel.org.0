Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F0A67C2C1
	for <lists+linux-clk@lfdr.de>; Thu, 26 Jan 2023 03:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235490AbjAZCT6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Jan 2023 21:19:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235494AbjAZCT4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 21:19:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB49061D75;
        Wed, 25 Jan 2023 18:19:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6593CB81CC3;
        Thu, 26 Jan 2023 02:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6168C433D2;
        Thu, 26 Jan 2023 02:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674699593;
        bh=NI5V/7nTeYLGVaiqfSK4AlDeU6PyLgfnwGCBsE+e6SE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FITw87IL/OjWa9qK/q8t2WlfflKeXXrWr1t70zN8CW8aUnj5sJdYDGZ4GnGkYmMb+
         GThtxbl38M9hA8I3BuZZQqsHOp3bug94Mn1mHsS8Qr58uV9O/wifASYypM5yh8dYc6
         7EFOHNCUhe6bVKfQK/4Dvs7rFNSrN7qK7Rry0wwIsvAsVO1NM0P4bPZmbSHujrzFx1
         K8SXP9w98mrQpb3F0zMBXngCH9sMoW5oAB4CDIzV1AA3oEwbQPYHxiwv4QyghoMFu0
         FtaoHHN0cDoIS0fiwudfrCpfCROt51wNJ1u9bo4vD6Zp5joe1tcq4hqkSMIarxwBuF
         vfzTAF1uLWd7Q==
Message-ID: <730844d96d26823c993d51793a008d29.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <367cf74b038281d235681f6e7fd6f3f7046c962b.1674401764.git.daniel@makrotopia.org>
References: <cover.1674401764.git.daniel@makrotopia.org> <367cf74b038281d235681f6e7fd6f3f7046c962b.1674401764.git.daniel@makrotopia.org>
Subject: Re: [PATCH v4 3/3] clk: mediatek: add MT7981 clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Miles Chen <miles.chen@mediatek.com>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>,
        Jianhui Zhao <zhaojh329@gmail.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date:   Wed, 25 Jan 2023 18:19:50 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Golle (2023-01-22 07:44:00)
> Add MT7981 clock support, include topckgen, apmixedsys, infracfg and
> ethernet subsystem clocks.
>=20
> The drivers are based on clk-mt7981.c which can be found in MediaTek's
> SDK sources. To be fit for upstream inclusion the driver has been split
> into clock domains and the infracfg part has been significantly
> de-bloated by removing all the 1:1 factors (aliases).
>=20
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next
