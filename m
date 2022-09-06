Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972665ADF9E
	for <lists+linux-clk@lfdr.de>; Tue,  6 Sep 2022 08:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238523AbiIFGQ6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 6 Sep 2022 02:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238506AbiIFGQj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Sep 2022 02:16:39 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83C170E44;
        Mon,  5 Sep 2022 23:15:21 -0700 (PDT)
X-UUID: b2bb39e2250644ed8ece4dd29a00f116-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=j4MN08XblrDSbxE0fXBIA+Mpq1rxLZoCqtsuW3ROu2g=;
        b=M9sgsEaLyYFa6fW2UoOPDZSWMR3Nv/QJszDorkKgJwfperfUFGAVrHRMw9SU5gnAlNjlMNdUjWVDrw1IrfcuIZfE5GszICxZVotu53vqbFLFtY8x2umw0krQvD0OOYD5XpKuCdAhRePrJZdyd157VXRgJbhud1IkI68CVrYqWlI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:a687a147-6a6e-499a-a663-106e64a7be9e,OB:0,L
        OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
        Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:a1015221-1c20-48a5-82a0-25f9c331906d,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
        nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b2bb39e2250644ed8ece4dd29a00f116-20220906
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <edward-jw.yang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1589515334; Tue, 06 Sep 2022 14:15:16 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 14:15:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 6 Sep 2022 14:15:15 +0800
Message-ID: <4f12f2b254a5ea795720052cb1c58e59abe9b9ce.camel@mediatek.com>
Subject: Re: [PATCH 3/4] clk: mediatek: Add new clock driver to handle FHCTL
 hardware
From:   Edward-JW Yang <edward-jw.yang@mediatek.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Johnson Wang =?UTF-8?Q?=28=E7=8E=8B=E8=81=96=E9=91=AB=29?= 
        <Johnson.Wang@mediatek.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Tue, 6 Sep 2022 14:15:15 +0800
In-Reply-To: <d2abe2d3-f17c-6c22-ccae-514fe196441e@collabora.com>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
         <20220831124850.7748-4-johnson.wang@mediatek.com>
         <d2abe2d3-f17c-6c22-ccae-514fe196441e@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_CSS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Angelo,

Thanks for suggestions.

On Thu, 2022-09-01 at 16:05 +0800, AngeloGioacchino Del Regno wrote:
> Il 31/08/22 14:48, Johnson Wang ha scritto:
> > To implement frequency hopping and spread spectrum clocking
> > function, we introduce new clock type and APIs to handle
> > FHCTL hardware.
> > 
> > Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> > Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > ---
> >   drivers/clk/mediatek/Makefile    |   2 +-
> >   drivers/clk/mediatek/clk-fhctl.c | 258 +++++++++++++++++++++++++++++
> >   drivers/clk/mediatek/clk-fhctl.h |  27 +++
> >   drivers/clk/mediatek/clk-pllfh.c | 271 +++++++++++++++++++++++++++++++
> >   drivers/clk/mediatek/clk-pllfh.h |  81 +++++++++
> >   5 files changed, 638 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/clk/mediatek/clk-fhctl.c
> >   create mode 100644 drivers/clk/mediatek/clk-fhctl.h
> >   create mode 100644 drivers/clk/mediatek/clk-pllfh.c
> >   create mode 100644 drivers/clk/mediatek/clk-pllfh.h
> > 
> > diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> > index caf2ce93d666..0e674a55e51e 100644
> > --- a/drivers/clk/mediatek/Makefile
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -1,5 +1,5 @@
> >   # SPDX-License-Identifier: GPL-2.0
> > -obj-$(CONFIG_COMMON_CLK_MEDIATEK) += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o clk-cpumux.o reset.o clk-mux.o
> > +obj-$(CONFIG_COMMON_CLK_MEDIATEK) += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o clk-cpumux.o reset.o clk-mux.o clk-fhctl.o clk-pllfh.o
> >   
> >   obj-$(CONFIG_COMMON_CLK_MT6765) += clk-mt6765.o
> >   obj-$(CONFIG_COMMON_CLK_MT6765_AUDIOSYS) += clk-mt6765-audio.o
> > diff --git a/drivers/clk/mediatek/clk-fhctl.c b/drivers/clk/mediatek/clk-fhctl.c
> > new file mode 100644
> > index 000000000000..69bd4ce2bc72
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-fhctl.c
> > @@ -0,0 +1,258 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Edward-JW Yang <edward-jw.yang@mediatek.com>
> > + */
> > +
> 
> #include <linux/io.h>
> 
> Please don't rely on implicit header inclusion.

OK, I'll fix it. Thanks.

> 
> > +#include <linux/iopoll.h>
> > +
> > +#include "clk-mtk.h"
> > +#include "clk-pllfh.h"
> > +#include "clk-fhctl.h"
> > +
> > +#define PERCENT_TO_DDSLMT(dds, percent_m10) \
> > +	((((dds) * (percent_m10)) >> 5) / 100)
> > +
> > +static const struct fhctl_offset fhctl_offset = {
> > +	.offset_hp_en = 0x0,
> > +	.offset_clk_con = 0x8,
> > +	.offset_rst_con = 0xc,
> > +	.offset_slope0 = 0x10,
> > +	.offset_slope1 = 0x14,
> > +	.offset_cfg = 0x0,
> > +	.offset_updnlmt = 0x4,
> > +	.offset_dds = 0x8,
> > +	.offset_dvfs = 0xc,
> > +	.offset_mon = 0x10,
> > +};
> > +
> > +const struct fhctl_offset *fhctl_get_offset_table(void)
> > +{
> > +	return &fhctl_offset;
> > +}
> > +
> > +static void dump_hw(struct mtk_clk_pll *pll, struct fh_pll_regs *regs,
> > +		    const struct fh_pll_data *data)
> > +{
> > +	pr_info("hp_en<%x>,clk_con<%x>,slope0<%x>,slope1<%x>\n",
> > +		readl(regs->reg_hp_en), readl(regs->reg_clk_con),
> > +		readl(regs->reg_slope0), readl(regs->reg_slope1));
> > +	pr_info("cfg<%x>,lmt<%x>,dds<%x>,dvfs<%x>,mon<%x>\n",
> > +		readl(regs->reg_cfg), readl(regs->reg_updnlmt),
> > +		readl(regs->reg_dds), readl(regs->reg_dvfs),
> > +		readl(regs->reg_mon));
> > +	pr_info("pcw<%x>\n", readl(pll->pcw_addr));
> > +}
> > +
> > +static int fhctl_set_ssc_regs(struct mtk_clk_pll *pll, struct fh_pll_regs *regs,
> > +			      const struct fh_pll_data *data, u32 rate)
> > +{
> > +	u32 updnlmt_val, r;
> > +
> > +	writel((readl(regs->reg_cfg) & ~(data->frddsx_en)), regs->reg_cfg);
> > +	writel((readl(regs->reg_cfg) & ~(data->sfstrx_en)), regs->reg_cfg);
> > +	writel((readl(regs->reg_cfg) & ~(data->fhctlx_en)), regs->reg_cfg);
> > +
> > +	if (rate > 0) {
> > +		/* Set the relative parameter registers (dt/df/upbnd/downbnd) */
> > +		r = readl(regs->reg_cfg);
> > +		r &= ~(data->msk_frddsx_dys);
> > +		r |= (data->df_val << (ffs(data->msk_frddsx_dys) - 1));
> > +		writel(r, regs->reg_cfg);
> > +
> > +		r = readl(regs->reg_cfg);
> > +		r &= ~(data->msk_frddsx_dts);
> > +		r |= (data->dt_val << (ffs(data->msk_frddsx_dts) - 1));
> > +		writel(r, regs->reg_cfg);
> > +
> > +		writel((readl(pll->pcw_addr) & data->dds_mask) | data->tgl_org,
> > +			regs->reg_dds);
> > +
> > +		/* Calculate UPDNLMT */
> > +		updnlmt_val = PERCENT_TO_DDSLMT((readl(regs->reg_dds) &
> > +						 data->dds_mask), rate) <<
> > +						 data->updnlmt_shft;
> > +
> > +		writel(updnlmt_val, regs->reg_updnlmt);
> > +		writel(readl(regs->reg_hp_en) | BIT(data->fh_id),
> > +		       regs->reg_hp_en);
> > +		/* Enable SSC */
> > +		writel(readl(regs->reg_cfg) | data->frddsx_en, regs->reg_cfg);
> > +		/* Enable Hopping control */
> > +		writel(readl(regs->reg_cfg) | data->fhctlx_en, regs->reg_cfg);
> > +
> > +	} else {
> > +		/* Switch to APMIXEDSYS control */
> > +		writel(readl(regs->reg_hp_en) & ~BIT(data->fh_id),
> > +		       regs->reg_hp_en);
> > +		/* Wait for DDS to be stable */
> > +		udelay(30);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int hopping_hw_flow(struct mtk_clk_pll *pll, struct fh_pll_regs *regs,
> > +			   const struct fh_pll_data *data,
> > +			   struct fh_pll_state *state, unsigned int new_dds)
> > +{
> > +	u32 dds_mask = data->dds_mask;
> > +	u32 mon_dds = 0;
> > +	u32 con_pcw_tmp;
> > +	int ret;
> > +
> > +	if (state->ssc_rate)
> > +		fhctl_set_ssc_regs(pll, regs, data, 0);
> > +
> > +	writel((readl(pll->pcw_addr) & dds_mask) | data->tgl_org,
> > +		regs->reg_dds);
> > +
> > +	writel(readl(regs->reg_cfg) | data->sfstrx_en, regs->reg_cfg);
> > +	writel(readl(regs->reg_cfg) | data->fhctlx_en, regs->reg_cfg);
> > +	writel(data->slope0_value, regs->reg_slope0);
> > +	writel(data->slope1_value, regs->reg_slope1);
> > +
> > +	writel(readl(regs->reg_hp_en) | BIT(data->fh_id), regs->reg_hp_en);
> > +	writel((new_dds) | (data->dvfs_tri), regs->reg_dvfs);
> > +
> > +	/* Wait 1000 us until DDS stable */
> > +	ret = readl_poll_timeout_atomic(regs->reg_mon, mon_dds,
> > +				       (mon_dds & dds_mask) == new_dds,
> > +					10, 1000);
> > +	if (ret) {
> > +		pr_warn("%s: FHCTL hopping timeout\n", pll->data->name);
> > +		dump_hw(pll, regs, data);
> > +	}
> > +
> > +	con_pcw_tmp = readl(pll->pcw_addr) & (~dds_mask);
> > +	con_pcw_tmp = (con_pcw_tmp | (readl(regs->reg_mon) & dds_mask) |
> > +		       data->pcwchg);
> > +
> > +	writel(con_pcw_tmp, pll->pcw_addr);
> > +	writel(readl(regs->reg_hp_en) & ~BIT(data->fh_id), regs->reg_hp_en);
> > +
> > +	if (state->ssc_rate)
> > +		fhctl_set_ssc_regs(pll, regs, data, state->ssc_rate);
> 
> Does it really make sense to set the SSC registers if the FH operation times out?

FH opration times out means DDS doesn't reach the target dds value but the de-sense issue
may still exist. We can still base on current dds_mon value to do SSC.

> 
> > +
> > +	return ret;
> > +}
> > +
> > +static unsigned int __get_postdiv(struct mtk_clk_pll *pll,
> > +				  struct fh_pll_regs *regs,
> > +				  const struct fh_pll_data *fh_data)
> 
> You don't need regs, nor fh_data, so this can be as simple as
> 
> static unsigned int __get_postdiv(struct mtk_clk_pll *pll)

OK, I'll fix it. Thanks.

> 
> > +{
> > +	unsigned int regval;
> > +
> > +	regval = readl(pll->pd_addr) >> pll->data->pd_shift;
> > +	regval &= POSTDIV_MASK;
> > +
> 
> 	return BIT(regval);

OK, I'll fix it. Thanks.

> 
> > +	return (1 << regval);
> > +}
> > +
> > +static void __set_postdiv(struct mtk_clk_pll *pll, struct fh_pll_regs *regs,
> > +			  const struct fh_pll_data *data, int postdiv)
> 
> static void __set_postdiv(struct mtk_clk_pll *pll, unsigned int val)

OK, I'll fix it. Thanks.

> 
> > +{
> > +	unsigned int regval;
> > +
> > +	regval = readl(pll->pd_addr);
> > +	regval &= ~(POSTDIV_MASK << pll->data->pd_shift);
> > +	regval |= (ffs(postdiv) - 1) << pll->data->pd_shift;
> > +	writel(regval, pll->pd_addr);
> > +}
> > +
> > +static int fhctl_hopping(struct mtk_fh *fh, unsigned int new_dds, int postdiv)
> 
> The postdiv cannot ever be negative, so you can change it to an unsigned type...
> 
> static int fhctl_hopping(struct mtk_fh *fh, unsigned int new_dds,
> 			 unsigned int postdiv)

OK, I'll fix it. Thanks.

> 
> > +{
> > +	const struct fh_pll_data *data = &fh->pllfh_data->data;
> > +	struct fh_pll_state *state = &fh->pllfh_data->state;
> > +	struct fh_pll_regs *regs = &fh->regs;
> > +	struct mtk_clk_pll *pll = &fh->clk_pll;
> > +	spinlock_t *lock = fh->lock;
> > +	unsigned int pll_postdiv;
> > +	unsigned long flags = 0;
> > +	int ret;
> > +
> 
> ...so since postdiv is unsigned, we can write this conditional as
> 
> 	if (postdiv)

OK, I'll fix it. Thanks.

> 
> > +	if (postdiv > 0) {
> > +		pll_postdiv = __get_postdiv(pll, regs, data);
> > +
> > +		if (postdiv > pll_postdiv)
> > +			__set_postdiv(pll, regs, data, postdiv);
> > +	}
> > +
> > +	spin_lock_irqsave(lock, flags);
> > +
> > +	ret = hopping_hw_flow(pll, regs, data, state, new_dds);
> > +
> > +	spin_unlock_irqrestore(lock, flags);
> > +
> > +	if (postdiv > 0) {
> > +		if (postdiv < pll_postdiv)
> 
> ...and this one as
> 
> if (postdiv && postdiv < pll_postdiv)

OK, I'll fix it. Thanks.

> 
> > +			__set_postdiv(pll, regs, data, postdiv);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int __fhctl_ssc_enable(struct mtk_fh *fh, u32 rate)
> > +{
> > +	const struct fh_pll_data *data = &fh->pllfh_data->data;
> > +	struct fh_pll_state *state = &fh->pllfh_data->state;
> > +	struct fh_pll_regs *regs = &fh->regs;
> > +	struct mtk_clk_pll *pll = &fh->clk_pll;
> > +	spinlock_t *lock = fh->lock;
> > +	unsigned long flags = 0;
> > +
> > +	spin_lock_irqsave(lock, flags);
> > +
> > +	fhctl_set_ssc_regs(pll, regs, data, rate);
> > +	state->ssc_rate = rate;
> > +
> > +	spin_unlock_irqrestore(lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int fhctl_ssc_enable(struct mtk_fh *fh, u32 rate)
> > +{
> > +	return __fhctl_ssc_enable(fh, rate);
> > +}
> > +
> > +static int fhctl_ssc_disable(struct mtk_fh *fh)
> > +{
> > +	return __fhctl_ssc_enable(fh, 0);
> > +}
> > +
> > +static const struct fh_operation fhctl_ops = {
> > +	.hopping = fhctl_hopping,
> > +	.ssc_enable = fhctl_ssc_enable,
> 
> Just one callback for ssc_enable is enough, it's fine to keep the logic as
> ssc_enable(fh, >0) to enable and ssc_enable(fh <=0) to disable.

OK, I'll drop ssc_disable callback.

> 
> > +	.ssc_disable = fhctl_ssc_disable,
> > +};
> > +
> > +const struct fh_operation *fhctl_get_ops(void)
> > +{
> > +	return &fhctl_ops;
> > +}
> > +
> > +void fhctl_hw_init(struct mtk_fh *fh)
> > +{
> > +	const struct fh_pll_data data = fh->pllfh_data->data;
> > +	struct fh_pll_state state = fh->pllfh_data->state;
> > +	struct fh_pll_regs regs = fh->regs;
> > +	u32 val;
> > +
> > +	/* initial hw register */
> > +	val = readl(regs.reg_clk_con) | BIT(data.fh_id);
> > +	writel(val, regs.reg_clk_con);
> > +
> > +	val = readl(regs.reg_rst_con) & ~BIT(data.fh_id);
> > +	writel(val, regs.reg_rst_con);
> > +	val = readl(regs.reg_rst_con) | BIT(data.fh_id);
> > +	writel(val, regs.reg_rst_con);
> > +
> > +	writel(0x0, regs.reg_cfg);
> > +	writel(0x0, regs.reg_updnlmt);
> > +	writel(0x0, regs.reg_dds);
> > +
> > +	/* enable ssc if needed */
> > +	if (state.ssc_rate)
> > +		fh->ops->ssc_enable(fh, state.ssc_rate);
> > +}
> > diff --git a/drivers/clk/mediatek/clk-fhctl.h b/drivers/clk/mediatek/clk-fhctl.h
> > new file mode 100644
> > index 000000000000..3cd4921c39e9
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-fhctl.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Edward-JW Yang <edward-jw.yang@mediatek.com>
> > + */
> > +
> > +#ifndef __CLK_FHCTL_H
> > +#define __CLK_FHCTL_H
> > +
> 
> One blank line is enough.

OK, I'll fix it. Thanks

> 
> > +
> > +struct fhctl_offset {
> > +	u32 offset_hp_en;
> > +	u32 offset_clk_con;
> > +	u32 offset_rst_con;
> > +	u32 offset_slope0;
> > +	u32 offset_slope1;
> > +	u32 offset_cfg;
> > +	u32 offset_updnlmt;
> > +	u32 offset_dds;
> > +	u32 offset_dvfs;
> > +	u32 offset_mon;
> > +};
> > +const struct fhctl_offset *fhctl_get_offset_table(void);
> > +const struct fh_operation *fhctl_get_ops(void);
> > +void fhctl_hw_init(struct mtk_fh *fh);
> > +
> > +#endif
> > diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
> > new file mode 100644
> > index 000000000000..71b35323b526
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-pllfh.c
> > @@ -0,0 +1,271 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Edward-JW Yang <edward-jw.yang@mediatek.com>
> > + */
> > +
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/io.h>
> > +#include <linux/slab.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/delay.h>
> > +
> > +#include "clk-mtk.h"
> > +#include "clk-pllfh.h"
> > +#include "clk-fhctl.h"
> > +
> > +static DEFINE_SPINLOCK(pllfh_lock);
> > +
> > +inline struct mtk_fh *to_mtk_fh(struct clk_hw *hw)
> > +{
> > +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> > +
> > +	return container_of(pll, struct mtk_fh, clk_pll);
> > +}
> > +
> > +static int mtk_fhctl_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			      unsigned long parent_rate)
> > +{
> > +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> > +	struct mtk_fh *fh = to_mtk_fh(hw);
> > +	u32 pcw = 0;
> > +	u32 postdiv;
> > +
> > +	mtk_pll_calc_values(pll, &pcw, &postdiv, rate, parent_rate);
> > +	fh->ops->hopping(fh, pcw, postdiv);
> 
> return fh->ops->hopping(....);

OK, I'll fix it. Thanks.

> 
> > +
> > +	return 0;
> > +}
> > +
> 
> ..snip..
> 
> > diff --git a/drivers/clk/mediatek/clk-pllfh.h b/drivers/clk/mediatek/clk-pllfh.h
> > new file mode 100644
> > index 000000000000..d9f7c8527548
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-pllfh.h
> > @@ -0,0 +1,81 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Edward-JW Yang <edward-jw.yang@mediatek.com>
> > + */
> > +
> > +#ifndef __DRV_CLKFH_H
> > +#define __DRV_CLKFH_H
> > +
> > +#include "clk-pll.h"
> > +
> > +struct fh_pll_state {
> 
> Please, base as first member.

OK, I'll modify it.

> 
> > +	u32 fh_enable;
> > +	u32 ssc_rate;
> > +	void __iomem *base;
> > +};
> > +
> 
> Regards,
> Angelo
> 
> 

