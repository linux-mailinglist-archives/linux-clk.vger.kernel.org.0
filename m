Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428EFF1EBE
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2019 20:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfKFT22 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Nov 2019 14:28:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:58854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727411AbfKFT22 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Nov 2019 14:28:28 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF0CA2178F;
        Wed,  6 Nov 2019 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573068508;
        bh=NF2bSZxZIsTQZx9/i88LUBuo8zO0EdADUFOoow/kws4=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=kbxLaUUatCArIb0K+nXFiQ9rfamRxJ0ettvHBIfnXJZ0DjOiNSyKkk2Oj01vBVVAz
         z9TZwzWiM3+GvNVqS2g8ubEMsGJpzIDvQ0FM5ia1ks/3p3N8Vn0hVa6bwmLi2LN0at
         V+1fKC3VsIgztUXWX8+vqBGymUTQcpuV5ZVRP50c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jftjbljwn.fsf@starbuckisacylon.baylibre.com>
References: <1jftjbljwn.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: Amlogic clock updates for v5.5
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 11:28:27 -0800
Message-Id: <20191106192827.EF0CA2178F@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-10-29 07:13:12)
>=20
> Hi Stephen,
>=20
> Here are our updates for Amlogic clock for this cycle.
> The main topic is sm1 soc family support in the audio
> clock controller
> Please pull.
>=20
> Thanks
> Jerome
>=20
> The following changes since commit 90b171f6035688236a3f09117a683020be4560=
3a:
>=20
>   clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu clock muxes (201=
9-10-01 14:51:15 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.5-1
>=20
> for you to fetch changes up to 50bf025b75902d326fdb8078be3d278e1b693576:
>=20
>   clk: meson: axg-audio: use devm_platform_ioremap_resource() to simplify=
 code (2019-10-14 17:06:27 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

