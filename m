Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 516EB15D030
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2020 03:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgBNCuQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 Feb 2020 21:50:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:36400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727604AbgBNCuP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Feb 2020 21:50:15 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D98FB20873;
        Fri, 14 Feb 2020 02:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581648615;
        bh=cQz7WMswfnptwR1SES46bBvWnXS2aGplada74E0ndYY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zh/nJnbIegiJ91mRCijJH3FWiDC8+voZl7dA7qAwsXopCpgBcbbJk27akiEvitc+W
         DdfSBFinysn6NBKrwbPpPiR4AUi6AfxN74Kqdw0uFwYc/dLr1FaqMG5QWdY8scZaPC
         298JTfXdHPScaPeivsRJU8xQ5Y+MAiQRqXDaOYR4=
Date:   Fri, 14 Feb 2020 10:50:07 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Subject: Re: [PATCH V4 0/4] clk: imx: imx8m: introduce
 imx8m_clk_hw_composite_core
Message-ID: <20200214025006.GI22842@dragon>
References: <1580189015-5744-1-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580189015-5744-1-git-send-email-peng.fan@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 28, 2020 at 05:28:32AM +0000, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V4:
>  Per Leonard's comments, added new definitions and  _SRC/CG/DIV are
>  alias to the new definition.
>  Did boot test on i.MX8MQ/M/N-EVK
> 
> V3:
>  Add CLK_SET_RATE_NO_REPARENT and CLK_OPS_PARENT_ENABLE for core
>  Avoid break DT for i.MX8MQ
> 
> V2:
>  Rename imx8m_clk_hw_core_composite to imx8m_clk_hw_composite_core
>  Add Abel's tag
> 
> To i.MX8M family, there are different types of clock slices,
> bus/core/ip and etc. Currently, the imx8m_clk_hw_composite
> api could only handle bus and ip clock slice, it could
> not handle core slice. The difference is core slice not have
> pre divider and the width of post divider is 3 bits.
> 
> To simplify code and reuse imx8m_clk_hw_composite, introduce a
> flag IMX_COMPOSITE_CORE to differentiate the slices.
> 
> With this new helper, we could simplify i.MX8M SoC clk drivers.
> 
> 
> Peng Fan (4):
>   clk: imx: composite-8m: add imx8m_clk_hw_composite_core
>   clk: imx: imx8mq: use imx8m_clk_hw_composite_core
>   clk: imx: imx8mm: use imx8m_clk_hw_composite_core
>   clk: imx: imx8mn: use imx8m_clk_hw_composite_core

Applied all, thanks.
