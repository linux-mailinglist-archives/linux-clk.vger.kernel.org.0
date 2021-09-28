Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8A141BA52
	for <lists+linux-clk@lfdr.de>; Wed, 29 Sep 2021 00:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240687AbhI1W0z (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 28 Sep 2021 18:26:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:41368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243089AbhI1W0z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 28 Sep 2021 18:26:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC85861391;
        Tue, 28 Sep 2021 22:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632867915;
        bh=2tH9+XEExZA1XrQZ9WnFhsqrVxIkw+KMQTLPern2Jnw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=R/Odh5/7/MI8fmnyqwL4f/VLA9LnX4bQ8jlXhUM9wzM7ORrM8C1vqWIas5lw7ShPF
         pfKtJUXYA8FuzQEBiy0kQnkNwbJUEphpLrvhv1RibylpJGXWbe0aHGDZrutqvr7Qws
         9AwhwQf5LsckK8ktDOM29zeqpyUz532RZswN/vTy80BLDNThykc1Dn5aPpopa6kXly
         E2MX3f2/o7Hqw01f81qfhEPwm4gi1S9guoVEUHDEMNMMlH00ctizuAJLVSEo6e5ZCs
         Gt2IsMieAzRRh8v9uXzYO0ldoY+E5+tPEd3/Ugp72E09K0Fgq58qKW5c5l0wVvNnVt
         cAP0Gh3g+dHNw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4726255.Mh6RI2rZIc@phil>
References: <4726255.Mh6RI2rZIc@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.16
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Tue, 28 Sep 2021 15:25:12 -0700
Message-ID: <163286791272.358640.17275918941263643760@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2021-09-27 02:44:16)
> Hi Mike, Stephen,
>=20
> please find below some Rockchip clock changes for 5.16
>=20
> Please pull, thanks
> Heiko
>=20
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd=
8f:
>=20
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.16-rockchip-clk-1
>=20
> for you to fetch changes up to 1da80da028fe5accb866c0d6899a292ed86bef45:
>=20
>   clk: rockchip: use module_platform_driver_probe (2021-09-21 00:44:53 +0=
200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
