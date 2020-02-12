Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2BF015A8A7
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2020 13:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbgBLMES (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Feb 2020 07:04:18 -0500
Received: from gloria.sntech.de ([185.11.138.130]:35254 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727589AbgBLMER (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 07:04:17 -0500
Received: from p508fd8fe.dip0.t-ipconnect.de ([80.143.216.254] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1j1qkU-0007ts-5l; Wed, 12 Feb 2020 13:04:10 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        christoph.muellner@theobroma-systems.com, zhangqing@rock-chips.com,
        robin.murphy@arm.com
Subject: Re: [PATCH v3 1/3] clk: rockchip: convert rk3399 pll type to use readl_poll_timeout
Date:   Wed, 12 Feb 2020 13:04:09 +0100
Message-ID: <3214502.EbdgFk5LkT@phil>
In-Reply-To: <20200129163821.1547295-1-heiko@sntech.de>
References: <20200129163821.1547295-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Mittwoch, 29. Januar 2020, 17:38:19 CET schrieb Heiko Stuebner:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Instead of open coding the polling of the lock status, use the
> handy readl_poll_timeout for this. As the pll locking is normally
> blazingly fast and we don't want to incur additional delays, we're
> not doing any sleeps similar to for example the imx clk-pllv4
> and define a very safe but still short timeout of 1ms.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

applied all 3 for 5.7 with Stephen's Review


