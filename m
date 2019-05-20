Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2116B22CA8
	for <lists+linux-clk@lfdr.de>; Mon, 20 May 2019 09:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfETHJu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 May 2019 03:09:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:45106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbfETHJu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 May 2019 03:09:50 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4110A2081C;
        Mon, 20 May 2019 07:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558336189;
        bh=yW6IVRJo569ByQp1u7OG8jglSSvhhQWKDEbo0xa44zU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g8KfvYrVJgiXkSZe1EnWsDbegQzLxdXHBtzYXYbIbM7Ksh47j0sXlPFV0lR7H8GNT
         I9i+i4w2LZfKRXu3xFiNBF/GgGjw8i+kTi/mm2EhzbUEWWJeehSFnwC8G3yYoT0kf3
         KUpNJ66VFCgyuWcqDvtKi+EfthaJoWxWe6eo5BrE=
Date:   Mon, 20 May 2019 15:08:57 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Jacky Bai <ping.bai@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
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
Subject: Re: [PATCH 2/2] clk: imx8mm: Add gic clk
Message-ID: <20190520070856.GT15856@dragon>
References: <61a5cad23ad56a2aed96f3bdbf7c67df25e0bd6b.1557725494.git.leonard.crestez@nxp.com>
 <7e1ffa50b8e2e95ec415c7b46b5ef83b0ec46e2d.1557725494.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e1ffa50b8e2e95ec415c7b46b5ef83b0ec46e2d.1557725494.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 13, 2019 at 05:32:09AM +0000, Leonard Crestez wrote:
> This is documented in the reference manual as GIC_CLK_ROOT.
> 
> In some out-of-tree DVFS the gic clock can end up as the only user of
> sys_pll2 so if we don't define the gic clk explicitly it might be turned
> off.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

It failed to be applied.  Please rebase it onto my clk/imx branch.

Shawn
