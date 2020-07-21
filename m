Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2D8227A1A
	for <lists+linux-clk@lfdr.de>; Tue, 21 Jul 2020 10:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgGUIDN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Jul 2020 04:03:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:37858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbgGUIDN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Jul 2020 04:03:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22A9820709;
        Tue, 21 Jul 2020 08:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595318593;
        bh=z/wxKRVe4zSV5lMbhLHJfCHSnqOQj2tNSL1T150PKhk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nvV+usdfxcP19KGtA8ccMCKug4ZuJ2GtKbWAyT69F/XmnSE3zaZ/0cIDirrWcwTGx
         Y4is7tBqS/upQ+xEPeXIAmouc7VyIUW4hN2m+MsQI5nkS+UrnhnqeA9y3SBXEOzJfC
         i/BTTgxQEtl3AC6GFgGlFbkPYf1UnN1uyG144aBQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200720062516.GB20462@dragon>
References: <20200720062516.GB20462@dragon>
Subject: Re: [GIT PULL] i.MX clock changes for 5.9
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Stefan Agner <stefan@agner.ch>, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Shawn Guo <shawnguo@kernel.org>
Date:   Tue, 21 Jul 2020 01:03:12 -0700
Message-ID: <159531859247.3847286.15799470044289847029@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2020-07-19 23:25:24)
> Hi Stephen,
>=20
> This is a couple of i.MX clock patches I collected for 5.9.  Please pull
> and keep it stable, as I also pull it into my DT branch to resolve
> dependency.  Thanks!
>=20
> Shawn
>=20
>=20
> The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c74=
07:
>=20
>   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/c=
lk-imx-5.9
>=20
> for you to fetch changes up to 018e4308349dbf32f4d971cbe72f4f3d6b1c217a:
>=20
>   clk: imx: vf610: add CAAM clock (2020-06-23 15:10:05 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
