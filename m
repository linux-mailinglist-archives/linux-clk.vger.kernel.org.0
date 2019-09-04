Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2F1A8EC1
	for <lists+linux-clk@lfdr.de>; Wed,  4 Sep 2019 21:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387899AbfIDR7x (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 4 Sep 2019 13:59:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:38900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388299AbfIDR7x (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Sep 2019 13:59:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 743DF22CEA;
        Wed,  4 Sep 2019 17:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567619992;
        bh=B2bXI6eXgFsDNSmO81chznZP1whYX5IyKLZi4UfA7ek=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=EtZenjjLlZ3DAnLkRCqez2j2Trg9Z1uF2ol5DoH4SFwbYtZiLldm6ntyaGkzlj4jd
         uYIPZRcv9c2HZbh92jeUS8TwfdPUJxgA1DrYUVMiPoD2QNtdMoGpnmZfN7YOOLNy2G
         2GN2gY/d/RTx7kyy0TT7ZXQAOjHLSk/5kd6TdYis=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j8srg6t12.fsf@starbuckisacylon.baylibre.com>
References: <1j8srg6t12.fsf@starbuckisacylon.baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] clk: meson: 2nd round of updates for 5.4
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 10:59:51 -0700
Message-Id: <20190904175952.743DF22CEA@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-08-26 04:54:49)
>=20
> Dear clock maintainers,
>=20
> Below is a request to pull another batch of Amlogic clock updates for
> v5.4. It brings reset support in the for the g12a audio controller and
> sm1 support in the main clock controller.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit 1d97657a4794ab23b47bd9921978ddd82569fc=
f4:
>=20
>   Merge branch 'v5.4/dt' into v5.4/drivers (2019-08-09 12:12:58 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-2
>=20
> for you to fetch changes up to da3ceae4ec9f581a50dc0763710078f22d3bc72a:
>=20
>   clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks (2019-08-26 1=
1:04:54 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

