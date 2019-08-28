Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8A19FAE9
	for <lists+linux-clk@lfdr.de>; Wed, 28 Aug 2019 08:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfH1Gzk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 28 Aug 2019 02:55:40 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:2725 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726209AbfH1Gzk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Aug 2019 02:55:40 -0400
X-UUID: 2f7b9396eb764d099497d8d524d296ad-20190828
X-UUID: 2f7b9396eb764d099497d8d524d296ad-20190828
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 118196236; Wed, 28 Aug 2019 14:55:34 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 28 Aug 2019 14:55:40 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 28 Aug 2019 14:55:40 +0800
Message-ID: <1566975333.24969.2.camel@mtksdaap41>
Subject: Re: [PATCH 2/2] clk: mediatek: add pericfg clocks for MT8183
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
CC:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Ryder Lee" <ryder.lee@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        "Erin Lo" <erin.lo@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Wed, 28 Aug 2019 14:55:33 +0800
In-Reply-To: <1566971755-21217-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1566971755-21217-1-git-send-email-chunfeng.yun@mediatek.com>
         <1566971755-21217-2-git-send-email-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2019-08-28 at 13:55 +0800, Chunfeng Yun wrote:
> Add pericfg clocks for MT8183, it's used when support USB
> remote wakeup
> 
> Cc: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt8183.c      | 35 ++++++++++++++++++++++++++
>  include/dt-bindings/clock/mt8183-clk.h |  4 +++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> index 1aa5f4059251..b19221bad0c9 100644
> --- a/drivers/clk/mediatek/clk-mt8183.c
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -999,6 +999,25 @@ static const struct mtk_gate infra_clks[] = {
>  		"msdc50_0_sel", 24),
>  };
>  
> +static const struct mtk_gate_regs peri_cg_regs = {
> +	.set_ofs = 0x20c,
> +	.clr_ofs = 0x20c,
> +	.sta_ofs = 0x20c,
> +};
> +
> +#define GATE_PERI(_id, _name, _parent, _shift) {	\
> +	.id = _id,				\
> +	.name = _name,				\
> +	.parent_name = _parent,			\
> +	.regs = &peri_cg_regs,			\
> +	.shift = _shift,			\
> +	.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
> +}

Hi Chunfeng,

I suggest

#define GATE_PERI(_id, _name, _parent, _shift)		\
	GATE_MTK(_id, _name, _parent, &peri_cg_regs, _shift,	\
		&mtk_clk_gate_ops_no_setclr_inv)

> +
> +static const struct mtk_gate peri_clks[] = {
> +	GATE_PERI(CLK_PERI_AXI, "periaxi", "axi_sel", 31),
> +};
> +
>  static const struct mtk_gate_regs apmixed_cg_regs = {
>  	.set_ofs = 0x20,
>  	.clr_ofs = 0x20,
> @@ -1194,6 +1213,19 @@ static int clk_mt8183_infra_probe(struct platform_device *pdev)
>  	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>  }
>  
> +static int clk_mt8183_peri_probe(struct platform_device *pdev)
> +{
> +	struct clk_onecell_data *clk_data;
> +	struct device_node *node = pdev->dev.of_node;
> +
> +	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
> +
> +	mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks),
> +			       clk_data);
> +
> +	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +}
> +
>  static int clk_mt8183_mcu_probe(struct platform_device *pdev)
>  {
>  	struct clk_onecell_data *clk_data;
> @@ -1223,6 +1255,9 @@ static const struct of_device_id of_match_clk_mt8183[] = {
>  	}, {
>  		.compatible = "mediatek,mt8183-infracfg",
>  		.data = clk_mt8183_infra_probe,
> +	}, {
> +		.compatible = "mediatek,mt8183-pericfg",
> +		.data = clk_mt8183_peri_probe,
>  	}, {
>  		.compatible = "mediatek,mt8183-mcucfg",
>  		.data = clk_mt8183_mcu_probe,
> diff --git a/include/dt-bindings/clock/mt8183-clk.h b/include/dt-bindings/clock/mt8183-clk.h
> index 0046506eb24c..a7b470b0ec8a 100644
> --- a/include/dt-bindings/clock/mt8183-clk.h
> +++ b/include/dt-bindings/clock/mt8183-clk.h
> @@ -284,6 +284,10 @@
>  #define CLK_INFRA_FBIST2FPC		100
>  #define CLK_INFRA_NR_CLK		101
>  
> +/* PERICFG */
> +#define CLK_PERI_AXI			0
> +#define CLK_PERI_NR_CLK			1
> +
>  /* MFGCFG */
>  #define CLK_MFG_BG3D			0
>  #define CLK_MFG_NR_CLK			1


