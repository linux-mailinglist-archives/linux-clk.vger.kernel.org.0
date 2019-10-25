Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF26FE4696
	for <lists+linux-clk@lfdr.de>; Fri, 25 Oct 2019 11:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438041AbfJYJEk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 25 Oct 2019 05:04:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437447AbfJYJEk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 25 Oct 2019 05:04:40 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 423B321929;
        Fri, 25 Oct 2019 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571994279;
        bh=hPfHiyhDFvSWyPkt6mjIwA99+K5iOA9vRiU4uEr+ikA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j+mwx55MltOSh7EfnAsUgdCHR0Lx5SXp+xhjkQUjZi2chaUFgkJazoRvb6r99YaDq
         zEZWYdBddetZrpyDK1kwFx+DfPEmWpJrFcFY5h/EIFzmQ8Ktz0jCxzS8IiHoSB9VxQ
         7bSZGjlVOdWq1exVBVNCjxkrHwXzrXNb9KJZpEfs=
Date:   Fri, 25 Oct 2019 17:04:24 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/3] clk: imx8m: Define gates for pll1/2 dividers
Message-ID: <20191025090422.GI3208@dragon>
References: <cover.1571226979.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1571226979.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 16, 2019 at 11:57:36AM +0000, Leonard Crestez wrote:
> Leonard Crestez (3):
>   clk: imx8mq: Define gates for pll1/2 fixed dividers
>   clk: imx8mm: Define gates for pll1/2 fixed dividers
>   clk: imx8mn: Define gates for pll1/2 fixed dividers

Applied, thanks.
