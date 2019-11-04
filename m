Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0929FEE6C7
	for <lists+linux-clk@lfdr.de>; Mon,  4 Nov 2019 18:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbfKDR6s (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 4 Nov 2019 12:58:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:36534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728174AbfKDR6s (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 4 Nov 2019 12:58:48 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6356920B7C;
        Mon,  4 Nov 2019 17:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572890327;
        bh=k+9S09XcQRmCiolkBiQbRZQaiXmWCScIZjPdHuaY8kM=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=xqUwvb2x/GydLedPuvMXOxkCKIt8AbXFJgMmlbIEHT2ggOFDg9gvVqEb+Q9jPpBW9
         05KovoI3p1rSTvh9yd8eAYVKYeQX99wPMbbqPQz7U8FGsPVrF9FZvC9/9EF2WepqIW
         vV8CqW8tARhqvVQBnyjB3J/xa28Ux4vYpoX4GNGY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eb232b2b-ff54-48d5-bbd0-f628d4650b25.lettre@localhost>
References: <eb232b2b-ff54-48d5-bbd0-f628d4650b25.lettre@localhost>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] Allwinner Clock Fixes for 5.4
To:     Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 09:58:46 -0800
Message-Id: <20191104175847.6356920B7C@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-11-02 08:50:26)
> Hi,
>=20
> Please pull the following changes for the current release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-fixes-for-5.4-1
>=20
> for you to fetch changes up to cdfc2e2086bf9c465f44e2db25561373b084a113:
>=20
>   clk: sunxi-ng: a80: fix the zero'ing of bits 16 and 18 (2019-10-29 08:4=
2:52 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.

