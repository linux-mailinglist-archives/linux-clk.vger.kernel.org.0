Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25E03CCDA2
	for <lists+linux-clk@lfdr.de>; Sun,  6 Oct 2019 03:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbfJFBFP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 5 Oct 2019 21:05:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:50476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726986AbfJFBFP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 5 Oct 2019 21:05:15 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C714A222C8;
        Sun,  6 Oct 2019 01:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570323914;
        bh=Pf9/d5vVjnlPKk6M1od3ctC5DpBEelEq+hMSLuWLdo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D++bcTh4Glu+CeOeynzWo+wszaZBx85Jj7nV1Ao4qOPw6b3eHywudNpI8d4YvXA1/
         BjFcBhPuIoMo2iKwG0l9zxHQfksHelul20GxBhJljPPWIBpyyqiknUM50dzAgQWcRF
         xWYK5P21Olnl4Atk09kJhpv05/G5hgeGyLp5sTxA=
Date:   Sun, 6 Oct 2019 09:04:57 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx: pll14xx: Fix quick switch of S/K parameter
Message-ID: <20191006010456.GG7150@dragon>
References: <c3e86b5a832a14278e8ba670d51defc70ee78d84.1567590349.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3e86b5a832a14278e8ba670d51defc70ee78d84.1567590349.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 04, 2019 at 12:49:18PM +0300, Leonard Crestez wrote:
> The PLL14xx on imx8m can change the S and K parameter without requiring
> a reset and relock of the whole PLL.
> 
> Fix clk_pll144xx_mp_change register reading and use it for pll1443 as
> well since no reset+relock is required on K changes either.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
