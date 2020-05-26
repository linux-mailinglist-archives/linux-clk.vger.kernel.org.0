Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B951E3216
	for <lists+linux-clk@lfdr.de>; Wed, 27 May 2020 00:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391923AbgEZWK4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 May 2020 18:10:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391892AbgEZWK4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 May 2020 18:10:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1734C208DB;
        Tue, 26 May 2020 22:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590531056;
        bh=NDgMcgxsWGVfavPDRi4+CdwajNlmdkDz1MEFIu3Jjcg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=e5T+88UU9jaKOrW4oo65l+OFDZ8BaiqtlFRLCIQjWXJTyZlQF++utSC7P9BnVZ3Hl
         4nJIDv8TBvhWpXVu3DzHvZy2BZQ+p2We/+cgiAABQ3W9dH0A/eVJYEjhfgJZqy8lN+
         dGdkucUM9fN/20jsxIfl7IcaZu7PEIUmAyjTBXGQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200523010732.GA9835@dragon>
References: <20200523010732.GA9835@dragon>
Subject: Re: [GIT PULL] i.MX clock updates for 5.8
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Shawn Guo <shawnguo@kernel.org>
Date:   Tue, 26 May 2020 15:10:55 -0700
Message-ID: <159053105536.88029.7016095954634120650@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2020-05-22 18:07:33)
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/c=
lk-imx-5.8
>=20
> for you to fetch changes up to b1657ad708f761f9ca6d166d4dda685ca39b1254:
>=20
>   clk: imx: use imx8m_clk_hw_composite_bus for i.MX8M bus clk slice (2020=
-05-21 22:37:48 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
