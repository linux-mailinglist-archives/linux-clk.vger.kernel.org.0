Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2D4F4EAC
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2019 15:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbfKHOrm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 8 Nov 2019 09:47:42 -0500
Received: from gloria.sntech.de ([185.11.138.130]:59624 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725883AbfKHOrm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Nov 2019 09:47:42 -0500
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1iT5Y2-0001jJ-4t; Fri, 08 Nov 2019 15:47:38 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: make clk_half_divider_ops static
Date:   Fri, 08 Nov 2019 15:47:37 +0100
Message-ID: <3569233.5vzpmiOc6b@diego>
In-Reply-To: <20191017105348.8061-1-ben.dooks@codethink.co.uk>
References: <20191017105348.8061-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Donnerstag, 17. Oktober 2019, 12:53:48 CET schrieb Ben Dooks (Codethink):
> The clk_half_divider_ops is not used outside or declared
> outside of drivers/clk/rockchip/clk-half-divider.c so make
> it static to avoid the following warning:
> 
> drivers/clk/rockchip/clk-half-divider.c:142:22: warning: symbol 'clk_half_divider_ops' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

applied for 5.5

Thanks
Heiko


