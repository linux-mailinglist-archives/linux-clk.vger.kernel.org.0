Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F038D314669
	for <lists+linux-clk@lfdr.de>; Tue,  9 Feb 2021 03:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhBICdU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 8 Feb 2021 21:33:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:33544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhBICdN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:33:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D2E064EBF;
        Tue,  9 Feb 2021 02:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612837953;
        bh=E1JyaKaJyxf0Q/mgLSd9kZ+dqcdbkyNDn2+UStmuPK8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ScDvHxIbVZrqIWDoK5HGjVs1cBoouoaSKhtF7voWxHDz9e7q8cFMzVfvzc0KPbWu3
         BllbecYnOOP9umI2xYn7dVbnT1qpopBalT6ip+JVWcro8G8XHYpZINcCYjjh9p6Oro
         pjuKhHzqArRnrQj40MqBUotoHYWHyFu8pnZzjF82X1IQtvDFPINKxpwGJx5GQZYGI7
         6JTmvL3YyiACzDSns+F2L2DErimEoXAiAVP5vcaAUn7g1dprGAaPmbWF+P7/VTsZWt
         bbEpEsr6nI67C2tSdoorNb0EFA7al5qqpoj9PzLB4jtOchvlwS7aANq58PV4NK/kPV
         w+g11x1IU1iNA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-6-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-6-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 05/15] soc: xilinx: vcu: add helpers for configuring PLL
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:32:31 -0800
Message-ID: <161283795180.76967.9672753408331027692@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:49)
> The xvcu_set_vcu_pll_info function sets the rate of the PLL and enables
> it, which makes it difficult to cleanly convert the driver to the common
> clock framework.
>=20
> Split the function and add separate functions for setting the rate,
> enabling the clock and disabling the clock.
>=20
> Also move the enable of the reference clock from probe to the helper
> that enables the PLL.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
