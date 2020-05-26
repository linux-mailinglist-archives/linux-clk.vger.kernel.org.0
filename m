Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933D91C4D72
	for <lists+linux-clk@lfdr.de>; Tue,  5 May 2020 06:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgEEExm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 5 May 2020 00:53:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:44884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbgEEExm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 00:53:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60D19206B9;
        Tue,  5 May 2020 04:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588654421;
        bh=f65b1BTpikGC31/6vPVuAxkSaUyizcH0ezHMxUUud5o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uieDilMYBHnHd7hBz/BHztvR2KvpaFo8NXMGFabQVg+cvkBixv8g8ksUnFaH5iRbA
         Xv4h9xGfb6dPTGlXHAmfRyUidEagOJIZ44qWiv4mXv/y/BVp9eVWSlWdE5OowxdE0b
         FAyh/mNdxSVnCGa/TUNFjkinOA4ct8IUV1DwNrFg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584279836-29825-12-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com> <1584279836-29825-12-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V6 11/12] clk: imx: lpcg: add suspend/resume support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 04 May 2020 21:53:40 -0700
Message-ID: <158865442071.11125.16124334622401774759@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-03-15 06:43:55)
> LPCG clock state may be lost when it's power domain is completely
> off during system suspend/resume and we need save and restore the
> state properly.
>=20
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

> diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-sc=
u.c
> index 2242e5047a0e..5bd8af371059 100644
> --- a/drivers/clk/imx/clk-lpcg-scu.c
> +++ b/drivers/clk/imx/clk-lpcg-scu.c
> @@ -122,3 +128,34 @@ void imx_clk_lpcg_scu_unregister(struct clk_hw *hw)
>         clk_hw_unregister(&clk->hw);
>         kfree(clk);
>  }
> +
> +static int __maybe_unused imx_clk_lpcg_scu_suspend(struct device *dev)
> +{
> +       struct clk_lpcg_scu *clk =3D dev_get_drvdata(dev);
> +
> +       clk->state =3D readl_relaxed(clk->reg);
> +       dev_dbg(dev, "save lpcg state 0x%x\n", clk->state);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused imx_clk_lpcg_scu_resume(struct device *dev)
> +{
> +       struct clk_lpcg_scu *clk =3D dev_get_drvdata(dev);
> +
> +       /*
> +        * FIXME: Sometimes writes don't work unless the CPU issues

Is this ever going to be resolved? Maybe the FIXME can be dropped and we
can accept that writes don't work?

> +        * them twice
> +        */
> +
> +       writel(clk->state, clk->reg);
> +       writel(clk->state, clk->reg);
> +       dev_dbg(dev, "restore lpcg state 0x%x\n", clk->state);
