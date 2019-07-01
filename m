Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A272B447EE
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jun 2019 19:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfFMRDK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 Jun 2019 13:03:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:45866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729473AbfFLXCB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Jun 2019 19:02:01 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3692F20896;
        Wed, 12 Jun 2019 23:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560380521;
        bh=+tsGRqVHjeMRxsoBEL+dBhG2hHJk5zEZ/qrS5yPoAuc=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=NWGxbm9OnP2Jw3us2CHmadnvpCXRaGa3/QohdvbyGHjdaV8G8tSOlnesslaFSK2Zo
         8gpdUppUf16bSiZPYswEgH6kSoImMPPQZ6jxzxLsSLgs/fGgzwj6sodPHq/x6L+y/A
         aqiW2dPzdE1elJI/Bo0mP9EJHRl0p7O+ltL0uw1A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com>
References: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.2
User-Agent: alot/0.8.1
Date:   Wed, 12 Jun 2019 16:02:00 -0700
Message-Id: <20190612230201.3692F20896@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-06-11 05:23:33)
> Dear clock maintainers,
>=20
> Below is a request to pull a couple of fixes on Amlogic clocks for v5.2
> These are typos in recently added clocks, the most annoying one being in
> the DT binding identifier on the MPLL50M which is used by the network PLL.
>=20
> Regards
>=20
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0eb=
d9:
>=20
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.2-1-fixes
>=20
> for you to fetch changes up to 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:
>=20
>   clk: meson: meson8b: fix a typo in the VPU parent names array variable =
(2019-05-20 12:11:08 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next.

