Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 645E615AA26
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2020 14:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbgBLNif (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Feb 2020 08:38:35 -0500
Received: from gloria.sntech.de ([185.11.138.130]:35944 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgBLNif (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 08:38:35 -0500
Received: from p508fd8fe.dip0.t-ipconnect.de ([80.143.216.254] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1j1sDe-0008KK-20; Wed, 12 Feb 2020 14:38:22 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Russell King <linux@armlinux.org.uk>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] ARM: rockchip: Replace <linux/clk-provider.h> by <linux/of_clk.h>
Date:   Wed, 12 Feb 2020 14:38:21 +0100
Message-ID: <7623400.vQJERCBc6Q@phil>
In-Reply-To: <20200212100830.446-5-geert+renesas@glider.be>
References: <20200212100830.446-1-geert+renesas@glider.be> <20200212100830.446-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Mittwoch, 12. Februar 2020, 11:08:27 CET schrieb Geert Uytterhoeven:
> The Rockchip platform code is not a clock provider, and just needs to
> call of_clk_init().
> 
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

applied for 5.7

Thanks
Heiko


