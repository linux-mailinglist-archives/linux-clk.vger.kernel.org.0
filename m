Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9258B28D795
	for <lists+linux-clk@lfdr.de>; Wed, 14 Oct 2020 02:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgJNAkd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 13 Oct 2020 20:40:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727837AbgJNAkd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 20:40:33 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A166921D40;
        Wed, 14 Oct 2020 00:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602636032;
        bh=WnrX3e13zD7VTffWH1FAM71K9TgshLLknCwdqyw4sk0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IRR3hGIcgWarCIl8Ok3EyROAPQoog4YkfNXPfWqMqS0cvYNKroRHkyMtKtc9MU29N
         xSOSSgc1dcKHUsbRg16ibQp4QSuVAP90TbL6Q4wbMJy1jsBuClWANnOM9POYILV+C3
         c3aRCt0vCdG6+gYOfowm4CEshEpiPlzcG7eYd5ns=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1596009618-25516-4-git-send-email-aisheng.dong@nxp.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com> <1596009618-25516-4-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH v7 03/11] clk: imx: scu: add two cells binding support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Tue, 13 Oct 2020 17:40:31 -0700
Message-ID: <160263603141.310579.16999413927152855385@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-07-29 01:00:10)
> This patch implements the new two cells binding for SCU clocks.
> The usage is as follows:
> clocks =3D <&uart0_clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>
>=20
> Due to each SCU clock is associated with a power domain, without power
> on the domain, the SCU clock can't work. So we create platform devices
> for each domain clock respectively and manually attach the required domain
> before register the clock devices, then we can register clocks in the
> clock platform driver accordingly.
>=20
> Note because we do not have power domain info in device tree and the SCU
> resource ID is the same for power domain and clock, so we use resource ID
> to find power domains.
>=20
> Later, we will also use this clock platform driver to support suspend/res=
ume
> and runtime pm.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
