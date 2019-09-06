Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA1AABE46
	for <lists+linux-clk@lfdr.de>; Fri,  6 Sep 2019 19:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405919AbfIFRHO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Sep 2019 13:07:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:58946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730223AbfIFRHO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:07:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81A1A20578;
        Fri,  6 Sep 2019 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567789633;
        bh=D11z4GUDpq/JdT/cpzm/Kangl1whlU3Xiur0T0XShRE=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=j3KWnfQ36jWrgIhToQXSTZ4O/HzhKbLmzgJ5KOV8GemUUu1x7FD8GusSInpC4Uswd
         MDxMBAU5Jk9A8GRJ36TUM76zExcqBYzyMM0+h+/xC7ZBHCKykX4qNsNZVzaEOL6QmV
         tnlL4V3XBjKcmj/MCZNvNqxFuaQsGbxMVreB3O9g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566299605-15641-5-git-send-email-aisheng.dong@nxp.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com> <1566299605-15641-5-git-send-email-aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH V4 04/11] clk: imx: scu: bypass cpu power domains
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:07:12 -0700
Message-Id: <20190906170713.81A1A20578@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2019-08-20 04:13:18)
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 48bfb08..5f935b1 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -479,6 +479,10 @@ static int imx_clk_scu_attach_pd(struct device *dev,=
 u32 rsrc_id)
>                 .args[0] =3D rsrc_id,
>         };
> =20
> +       if ((rsrc_id =3D=3D IMX_SC_R_A35) || (rsrc_id =3D=3D IMX_SC_R_A53=
) ||
> +           (rsrc_id =3D=3D IMX_SC_R_A72))

Please drop the extra parenthesis. It makes it hard to read.

> +               return 0;
> +
>         return of_genpd_add_device(&genpdspec, dev);
