Return-Path: <linux-clk+bounces-6970-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E338C3BA7
	for <lists+linux-clk@lfdr.de>; Mon, 13 May 2024 08:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2D181F2174F
	for <lists+linux-clk@lfdr.de>; Mon, 13 May 2024 06:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CE8146A7E;
	Mon, 13 May 2024 06:54:51 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2932C1465BD
	for <linux-clk@vger.kernel.org>; Mon, 13 May 2024 06:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715583291; cv=none; b=lYRoJbmNR6+h8AfBMJI7D2L3dgXbwWsxRoe8BCGJqJRtD9cn2RvgnzasVNTN+e+HySmVCoGwuSIlMlDlOe6A/XfnZYmk7Ib9Kcwnedv1zZbsb9/I2+g3Z0ggem5JazUEbBV6frdUJKdsFGTX7EIgZg6aihOKjeEtI69UZgfzgD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715583291; c=relaxed/simple;
	bh=lN/1vCTP0wYNL0Pd3ViC+AMORd82VxLhCd0MaH31XRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqzjRO9dKQ/jodiBVruitsTT7wALrmluesrJ2irZok4QEUfKyyE2mDwTaZPbsmD4EPXkpzmixclNDuVKxhoBkcgtjgS8BC2LgwGXe0cY8AG5FivAy6imK8nCK7vJ5u+CJrBzq4v+3tjn+QDm/nodwl4q9DyMIZznIfzzAa3tQfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s6Pa1-0006sF-G3; Mon, 13 May 2024 08:54:37 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s6Pa0-0017VY-7p; Mon, 13 May 2024 08:54:36 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s6Pa0-009O7G-0S;
	Mon, 13 May 2024 08:54:36 +0200
Date: Mon, 13 May 2024 08:54:36 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
	Ye Li <ye.li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 03/17] clk: imx: composite-7ulp: Check the PCC present
 bit
Message-ID: <ZkG5LGzFGWe0blJ_@pengutronix.de>
References: <20240510-imx-clk-v2-0-c998f315d29c@nxp.com>
 <20240510-imx-clk-v2-3-c998f315d29c@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510-imx-clk-v2-3-c998f315d29c@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Fri, May 10, 2024 at 05:18:58PM +0800, Peng Fan (OSS) wrote:
> From: Ye Li <ye.li@nxp.com>
> 
> When some module is disabled by fuse, its PCC PR bit is default 0 and
> PCC is not operational. Any write to this PCC will cause SError.
> 
> Fixes: b40ba8065347 ("clk: imx: Update the compsite driver to support imx8ulp")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-composite-7ulp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
> index e208ddc51133..e70a03e7299c 100644
> --- a/drivers/clk/imx/clk-composite-7ulp.c
> +++ b/drivers/clk/imx/clk-composite-7ulp.c
> @@ -14,6 +14,7 @@
>  #include "../clk-fractional-divider.h"
>  #include "clk.h"
>  
> +#define PCG_PR_MASK		BIT(31)
>  #define PCG_PCS_SHIFT	24
>  #define PCG_PCS_MASK	0x7
>  #define PCG_CGC_SHIFT	30
> @@ -78,6 +79,10 @@ static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
>  	struct clk_hw *hw;
>  	u32 val;
>  
> +	val = readl(reg);
> +	if (!(val & PCG_PR_MASK))
> +		return ERR_PTR(-ENODEV);

It looks like this will trigger an error message in imx_check_clk_hws()

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

