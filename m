Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16262A360C
	for <lists+linux-clk@lfdr.de>; Mon,  2 Nov 2020 22:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgKBVfl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 2 Nov 2020 16:35:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:57778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgKBVfk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 2 Nov 2020 16:35:40 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00C5521534;
        Mon,  2 Nov 2020 21:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604352940;
        bh=cv6DfRgYK5qT8tm4jACKpFBWOA+Wz86x9LCpVgZILW8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sfBXDpbRqIfeXL8TbsrfG2MieFNLccRKBYgmOPL5IlVjDzyzFCDZ9uyHKfIkpnbvA
         DTcgYkn0QLAu9LcTGIArVgKyql9uSSdjUuyY//wQffWBIOxBODAj7+dXYJyJWKLjxH
         clNgp80Xiz6nXjHDngyQhr99Fo0skJxciPrZjMxE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201030153733.30160-1-aisheng.dong@nxp.com>
References: <20201030153733.30160-1-aisheng.dong@nxp.com>
Subject: Re: [PATCH 1/1] clk: imx: scu: fix build break when compiled as modules
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>,
        kernel test robot <lkp@intel.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 02 Nov 2020 13:35:38 -0800
Message-ID: <160435293872.884498.8249363298805179406@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-10-30 08:37:33)
> After commit e0d0d4d86c76 ("clk: imx8qxp: Support building i.MX8QXP clock
> driver as module"), clk-scu.c and clk-imx8qxp.c are complied in one modul=
e,
> thus there can be only one module_init() in those two files.
> Commit 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
> introduced another module_init() in clk_scu.c which caused the errors
> below.
>=20
> To fix the issue, we can remove the unnecessary builtin_platform_driver
> from clk_scu.c and directly register the driver in imx_clk_scu_init().
>=20
>   CC [M]  drivers/clk/imx/clk-scu.o
> In file included from ../include/linux/of_device.h:6,
>                  from ../include/linux/of_platform.h:12,
>                  from ../drivers/clk/imx/clk-scu.c:11:
> ../drivers/clk/imx/clk-scu.c: In function =E2=80=98imx_clk_scu_init=E2=80=
=99:
> ../drivers/clk/imx/clk-scu.c:176:35: error: =E2=80=98imx_clk_scu_driver=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98im=
x_clk_scu_init=E2=80=99?
>   176 |  return platform_driver_register(&imx_clk_scu_driver);
>       |                                   ^~~~~~~~~~~~~~~~~~
> ../include/linux/platform_device.h:218:29: note: in definition of macro =
=E2=80=98platform_driver_register=E2=80=99
>   218 |  __platform_driver_register(drv, THIS_MODULE)
>       |                             ^~~
> ../drivers/clk/imx/clk-scu.c:176:35: note: each undeclared identifier is =
reported only once for each function it appears in
>   176 |  return platform_driver_register(&imx_clk_scu_driver);
>       |                                   ^~~~~~~~~~~~~~~~~~
> ../include/linux/platform_device.h:218:29: note: in definition of macro =
=E2=80=98platform_driver_register=E2=80=99
>   218 |  __platform_driver_register(drv, THIS_MODULE)
>       |                             ^~~
> ../drivers/clk/imx/clk-scu.c:177:1: error: control reaches end of non-voi=
d function [-Werror=3Dreturn-type]
>   177 | }
>       | ^
> At top level:
> ../drivers/clk/imx/clk-scu.c:470:31: warning: =E2=80=98imx_clk_scu_driver=
=E2=80=99 defined but not used [-Wunused-variable]
>   470 | static struct platform_driver imx_clk_scu_driver =3D {
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")

And doesn't apply because this commit is only in linux-next. Alright
leaving this to Shawn.
