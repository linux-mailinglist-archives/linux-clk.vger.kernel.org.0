Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0215FBA36
	for <lists+linux-clk@lfdr.de>; Wed, 13 Nov 2019 21:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfKMUsl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 13 Nov 2019 15:48:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:55890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfKMUsl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Nov 2019 15:48:41 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA7BE206CB;
        Wed, 13 Nov 2019 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573678121;
        bh=cr9JMVegJx1oJynsuDAElAURTb0vNtKWI9b3GvC/J2Y=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=hQdYxShn5pxruV9NXfokGFMUb8zaCN14jjz/I2zsY+13NPYw+L1GUVH4m/d9xw32e
         SWA9SFTwsc7aOcwgIxD786gLeUNYM6TXXVI3TgKaHNM9r5Nr8xSSrBMyqXilBsPUIC
         1SX95jAo9olQ9/QDYSek0kyQiL/4sm4HMZGMJP6Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2139639.gTPWsosUxc@phil>
References: <2139639.gTPWsosUxc@phil>
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] Rockchip clock updates for 5.4
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
User-Agent: alot/0.8.1
Date:   Wed, 13 Nov 2019 12:48:40 -0800
Message-Id: <20191113204841.BA7BE206CB@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2019-11-10 16:45:05)
> Hi Mike, Stephen,
>=20
> please find below rockchip clock changes for 5.5
> Please pull
>=20
> Thanks
> Heiko
>=20
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
v5.5-rockchip-clk-1
>=20
> for you to fetch changes up to 3b0b4ebfd761943179fe03b107f66c72c3b5c8d4:
>=20
>   clk: rockchip: protect the pclk_usb_grf as critical on px30 (2019-11-05=
 20:53:42 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

