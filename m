Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC691E31D6
	for <lists+linux-clk@lfdr.de>; Wed, 27 May 2020 00:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390028AbgEZV7y (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 May 2020 17:59:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:47112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389510AbgEZV7x (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 May 2020 17:59:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8036320707;
        Tue, 26 May 2020 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590530393;
        bh=t8jrZEZhmKvBw2b+4iWBP38WDt+eDDgVDOAgDgFoLmM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vqnldlgDaMLFwXLZuDrvCI7SGBPsg6JV8lDi4lkoaukDLbKunm7Og/fp6MnT34Gvo
         7TdY5lPN2579hClr32CvB1yRLQtd0f6zt0+0PvHVB2TyThWioRE0uY1bjX8Xz/NIXx
         x0B3RLN+I0t6Kw1itxJKw+lUiGpIILeBTpY+9Zkg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e18bd659-6a8f-4a4f-8308-8e5091ca8b45.lettre@localhost>
References: <e18bd659-6a8f-4a4f-8308-8e5091ca8b45.lettre@localhost>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 5.8
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Tue, 26 May 2020 14:59:52 -0700
Message-ID: <159053039289.88029.7942746274793283156@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-05-15 10:12:45)
> Hi,
>=20
> Please pull the following changes for the next release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-for-5.8-1
>=20
> for you to fetch changes up to ee25d9742dabed3fd18158b518f846abeb70f319:
>=20
>   clk: sunxi: Fix incorrect usage of round_down() (2020-04-14 09:21:05 +0=
200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
