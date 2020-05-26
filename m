Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8FE1D0442
	for <lists+linux-clk@lfdr.de>; Wed, 13 May 2020 03:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbgEMBUZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 12 May 2020 21:20:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:34608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728131AbgEMBUZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 May 2020 21:20:25 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B715206D3;
        Wed, 13 May 2020 01:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589332825;
        bh=aUO4Hd9gwJ7SPhAlEhXeA+zsnUAmGPEMNmhK0lYyhBI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TfWbrfb2iKisn7uoK14YHqxFjSGP/7Lj8zLE0sJ8ga6B5D4P7y23ywi6cFupFdup4
         /i3cc2wN5ZF2jPZeKFXflJMS3SVmj13C36+yO3Hc1e4w+2jIRIYO7iOoqIRA6EURff
         J9Hs+AAX1vvNN+2oP7iqFbkDZdGBjwstZNH4jSdY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2256140.alkMTrVvHO@phil>
References: <2256140.alkMTrVvHO@phil>
Subject: Re: [GIT PULL] Rockchip clock fix for 5.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Tue, 12 May 2020 18:20:24 -0700
Message-ID: <158933282442.215346.11254945377753790433@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2020-05-05 17:28:40)
> Hi Mike, Stephen,
>=20
> please find below a rockchip clock fix for 5.7
> Please pull
>=20
> Thanks
> Heiko
>=20
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.7-rockchip-clk-fixes1
>=20
> for you to fetch changes up to cec9d101d70a3509da9bd2e601e0b242154ce616:
>=20
>   clk: rockchip: fix incorrect configuration of rk3228 aclk_gpu* clocks (=
2020-04-13 09:35:24 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.
