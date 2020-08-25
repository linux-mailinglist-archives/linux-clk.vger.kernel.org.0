Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82085251A88
	for <lists+linux-clk@lfdr.de>; Tue, 25 Aug 2020 16:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgHYOLU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Aug 2020 10:11:20 -0400
Received: from inva020.nxp.com ([92.121.34.13]:58902 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgHYOLS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Aug 2020 10:11:18 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CB7C21A05DF;
        Tue, 25 Aug 2020 16:11:16 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BD4D81A05DD;
        Tue, 25 Aug 2020 16:11:16 +0200 (CEST)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A81D92030A;
        Tue, 25 Aug 2020 16:11:16 +0200 (CEST)
Date:   Tue, 25 Aug 2020 17:11:16 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Fugang Duan <fugang.duan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <anson.huang@nxp.com>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/17] clk: imx: Add blk_ctrl combo driver
Message-ID: <20200825141116.wgvybk7mtozvjxmb@fsr-ub1664-175>
References: <1597406966-13740-1-git-send-email-abel.vesa@nxp.com>
 <1597406966-13740-12-git-send-email-abel.vesa@nxp.com>
 <ea2563fcb456830b37b0031455e5054d6b81c680.camel@pengutronix.de>
 <20200825112421.eut7gx3i4eirhnfw@fsr-ub1664-175>
 <8e8e33386eea12036bb17529b4d578704bf735d1.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e8e33386eea12036bb17529b4d578704bf735d1.camel@pengutronix.de>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20-08-25 14:07:29, Philipp Zabel wrote:
> On Tue, 2020-08-25 at 14:24 +0300, Abel Vesa wrote:
> [...]
> > > > +static int imx_blk_ctrl_reset_set(struct reset_controller_dev *rcdev,
> > > > +				  unsigned long id, bool assert)
> > > > +{
> > > > +	struct imx_blk_ctrl_drvdata *drvdata = container_of(rcdev,
> > > > +			struct imx_blk_ctrl_drvdata, rcdev);
> > > > +	unsigned int offset = drvdata->rst_hws[id].offset;
> > > > +	unsigned int shift = drvdata->rst_hws[id].shift;
> > > > +	unsigned int mask = drvdata->rst_hws[id].mask;
> > > > +	void __iomem *reg_addr = drvdata->base + offset;
> > > > +	unsigned long flags;
> > > > +	unsigned int asserted_before = 0, asserted_after = 0;
> > > > +	u32 reg;
> > > > +	int i;
> > > > +
> > > > +	spin_lock_irqsave(&drvdata->lock, flags);
> > > > +
> > > > +	for (i = 0; i < drvdata->rcdev.nr_resets; i++)
> > > > +		if (drvdata->rst_hws[i].asserted)
> > > > +			asserted_before++;
> > > > +
> > > > +	if (asserted_before == 0 && assert)
> > > > +		pm_runtime_get(rcdev->dev);
> > > 
> > > Shouldn't that be pm_runtime_get_sync() ?
> > > 
> > > I would do that unconditionally before locking drvdata->lock and then
> > > drop unnecessary refcounts afterwards.
> > > 
> > 
> > I thought we already discussed this on the last's version thread.
> 
> This is about something different. pm_runtime_get() just queues the
> device to be enabled at a later point, but I presume you want to have it
> enabled before writing to its registers. (The question here is can you
> write to the registers, and have the device update its internal state,
> while the power domain is disabled?)
> Either way, if you want the reset to be asserted after the function
> returns (as is required by the reset API), as I understand it, you have
> to make sure that the power domain is activated before the function
> returns.
> Therefore pm_runtime_get_sync() is required instead of pm_runtime_get(),
> and that must be called outside of the spin locked section. My
> suggestion would be:
> 
> 	if (assert)
> 		pm_runtime_get_sync();
> 	spin_lock_irqsave();
> 	/* ... */
> 	spin_unlock_irqrestore();
> 	if (assert && asserted_before)
> 		pm_runtime_put();
> 

You're right this makes more sense.

> unless the following might be an issue:
> 
> > > > +
> > > > +	if (assert) {
> > > > +		reg = readl(reg_addr);
> > > > +		writel(reg & ~(mask << shift), reg_addr);
> > > > +		drvdata->rst_hws[id].asserted = true;
> > > > +	} else {
> > > > +		reg = readl(reg_addr);
> > > > +		writel(reg | (mask << shift), reg_addr);
> 
> Could this cause problems if the power domain is already disabled? If
> so, it would be best to either temporarily enable power, or to skip the
> register writes if asserted_before == 0 && !assert.

I'll go with the latter one since it leaves the PD off.

> 
> > > > +		drvdata->rst_hws[id].asserted = false;
> > > > +	}
> > > > +
> > > > +	for (i = 0; i < drvdata->rcdev.nr_resets; i++)
> > > > +		if (drvdata->rst_hws[i].asserted)
> > > > +			asserted_after++;
> > > > +
> > > > +	if (asserted_before == 1 && asserted_after == 0)
> > > > +		pm_runtime_put(rcdev->dev);
> > > > +
> > > > +	spin_unlock_irqrestore(&drvdata->lock, flags);
> > > > +
> > > > +	return 0;
> > > > +}
> 
> regards
> Philipp
