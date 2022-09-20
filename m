Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC0B25BDEBB
	for <lists+linux-clk@lfdr.de>; Tue, 20 Sep 2022 09:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiITHrf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 20 Sep 2022 03:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbiITHqq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 03:46:46 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6D8A184;
        Tue, 20 Sep 2022 00:46:20 -0700 (PDT)
X-UUID: 00548903b7f646a4afcb47057698f0a6-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=GbEIpZuieD+2WNCm0WpmFIf4/+cxXTIK/4SaaBOX7c0=;
        b=fTr1/s6DA99jI4koj7TxmatzmFALsJNRjlCNaDFreDadax5cvXgP/Ds94s4K5sFCi+pj7CJl/PbRq6nb6b5G6InWjcD0zfFjgXPV13wwbWIGrPOp6bFr7y9E8j52I/eTM3GedG4ncI/HOCWejc5D6vECYrKf5OLN8vdhyom3FpQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:82fd22f2-594c-4688-8156-38b878a3b8bf,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:45
X-CID-INFO: VERSION:1.1.11,REQID:82fd22f2-594c-4688-8156-38b878a3b8bf,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
        elease,TS:45
X-CID-META: VersionHash:39a5ff1,CLOUDID:8ae76370-dafa-4a42-b716-cf2cd4845592,B
        ulkID:220920154616J7BGHJEN,BulkQuantity:0,Recheck:0,SF:28|17|19|48|823|824
        ,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL
        :0
X-UUID: 00548903b7f646a4afcb47057698f0a6-20220920
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 614271657; Tue, 20 Sep 2022 15:46:13 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 20 Sep 2022 15:46:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 20 Sep 2022 15:46:11 +0800
Message-ID: <d1346dcf6b6906d153c13c086bf963dc89c5549b.camel@mediatek.com>
Subject: Re: [PATCH v1 14/17] phy: mediatek: add support for
 phy-mtk-hdmi-mt8195
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Guillaume Ranquet <granquet@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
        Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <linux-mediatek@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>,
        Pablo Sun <pablo.sun@mediatek.com>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Date:   Tue, 20 Sep 2022 15:46:10 +0800
In-Reply-To: <20220919-v1-14-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
         <20220919-v1-14-4844816c9808@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,T_SPF_TEMPERROR,
        UNPARSEABLE_RELAY,URIBL_CSS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 2022-09-19 at 18:56 +0200, Guillaume Ranquet wrote:
> Add basic support for the mediatek hdmi phy on MT8195 SoC
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> index bb7593ea4c86..0157acdce56c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> @@ -1344,6 +1344,8 @@ static void mtk_hdmi_bridge_disable(struct
> drm_bridge *bridge,
>  	mtk_hdmi_disable_hdcp_encrypt(hdmi);
>  	usleep_range(50000, 50050);
>  
> +	phy_power_off(hdmi->phy);
> +
>  	hdmi->enabled = false;
>  }
>  
> diff --git a/drivers/phy/mediatek/Makefile
> b/drivers/phy/mediatek/Makefile
> index fb1f8edaffa7..c9a50395533e 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-
> xsphy.o
>  phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
>  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt2701.o
>  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8173.o
> +phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8195.o
>  obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
>  
>  phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> new file mode 100644
> index 000000000000..149015b64c02
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -0,0 +1,673 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Copyright (c) 2021 BayLibre, SAS
> + */
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/nvmem-consumer.h>
> +
> +#include "phy-mtk-hdmi.h"
> +#include "phy-mtk-hdmi-mt8195.h"
> +
> +static void mtk_hdmi_ana_fifo_en(struct mtk_hdmi_phy *hdmi_phy)
> +{
> +	/* make data fifo writable for hdmi2.0 */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_ANA_CTL,
> REG_ANA_HDMI20_FIFO_EN,
> +			  REG_ANA_HDMI20_FIFO_EN);
> +}
> +
> +static void
> +mtk_mt8195_phy_tmds_high_bit_clk_ratio(struct mtk_hdmi_phy
> *hdmi_phy,
> +				       bool enable)
> +{
> +	mtk_hdmi_ana_fifo_en(hdmi_phy);
> +
> +	/* HDMI 2.0 specification, 3.4Gbps <= TMDS Bit Rate <= 6G,
> +	 * clock bit ratio 1:40, under 3.4Gbps, clock bit ratio 1:10
> +	 */
> +	if (enable)
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI20_CLK_CFG,
> +				  0x2 << REG_TXC_DIV_SHIFT, 
Use FIELD_PREP() macro, then no need define REG_TXC_DIV_SHIFT anymore.

> REG_TXC_DIV);
> +	else
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI20_CLK_CFG, 0,
> REG_TXC_DIV);
> +}
> +
> +static void mtk_hdmi_pll_select_source(struct clk_hw *hw)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3, 0x0,
> REG_HDMITX_REF_XTAL_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3, 0x0,
> REG_HDMITX_REF_RESPLL_SEL);
> +
> +	/* DA_HDMITX21_REF_CK for TXPLL input source */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10, 0x0,
> +			  RG_HDMITXPLL_REF_CK_SEL);
> +}
> +
> +static int mtk_hdmi_pll_performance_setting(struct clk_hw *hw)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	/* BP2 */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
> +			  0x1 << RG_HDMITXPLL_BP2_SHIFT,
> RG_HDMITXPLL_BP2);
> +
> +	/* BC */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x3 << RG_HDMITXPLL_BC_SHIFT,
> RG_HDMITXPLL_BC);
> +
> +	/* IC */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x1 << RG_HDMITXPLL_IC_SHIFT,
> RG_HDMITXPLL_IC);
> +
> +	/* BR */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x2 << RG_HDMITXPLL_BR_SHIFT,
> RG_HDMITXPLL_BR);
> +
> +	/* IR */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x2 << RG_HDMITXPLL_IR_SHIFT,
> RG_HDMITXPLL_IR);
> +
> +	/* BP */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0xf << RG_HDMITXPLL_BP_SHIFT,
> RG_HDMITXPLL_BP);
> +
> +	/* IBAND_FIX_EN, RESERVE[14] */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
> +			  0x0 << RG_HDMITXPLL_IBAND_FIX_EN_SHIFT,
> +			  RG_HDMITXPLL_IBAND_FIX_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  0x0 << RG_HDMITXPLL_RESERVE_BIT14_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT14);
> +
> +	/* HIKVCO */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x0 << RG_HDMITXPLL_HIKVCO_SHIFT,
> +			  RG_HDMITXPLL_HIKVCO);
> +
> +	/* HREN */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
> +			  0x1 << RG_HDMITXPLL_HREN_SHIFT,
> RG_HDMITXPLL_HREN);
> +
> +	/* LVR_SEL */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
> +			  0x1 << RG_HDMITXPLL_LVR_SEL_SHIFT,
> +			  RG_HDMITXPLL_LVR_SEL);
> +
> +	/* RG_HDMITXPLL_RESERVE[12:11] */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  0x3 << RG_HDMITXPLL_RESERVE_BIT12_11_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT12_11);
> +
> +	/* TCL_EN */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
> +			  0x1 << RG_HDMITXPLL_TCL_EN_SHIFT,
> +			  RG_HDMITXPLL_TCL_EN);
> +
> +	return 0;
> +}
> +
> +static int mtk_hdmi_pll_set_hw(struct clk_hw *hw, unsigned char
> prediv,
> +			       unsigned char fbkdiv_high,
> +			       unsigned long fbkdiv_low,
> +			       unsigned char fbkdiv_hs3, unsigned char
> posdiv1,
> +			       unsigned char posdiv2, unsigned char
> txprediv,
> +			       unsigned char txposdiv,
> +			       unsigned char digital_div)
> +{
> +	unsigned char txposdiv_value = 0;
> +	unsigned char div3_ctrl_value = 0;
> +	unsigned char posdiv_vallue = 0;
> +	unsigned char div_ctrl_value = 0;
> +	unsigned char reserve_3_2_value = 0;
> +	unsigned char prediv_value = 0;
> +	unsigned char reserve13_value = 0;
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	mtk_hdmi_pll_select_source(hw);
> +
> +	mtk_hdmi_pll_performance_setting(hw);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x2 << RG_HDMITX21_BIAS_PE_BG_VREF_SEL_SHIFT,
> +			  RG_HDMITX21_BIAS_PE_BG_VREF_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x0 << RG_HDMITX21_VREF_SEL_SHIFT,
> +			  RG_HDMITX21_VREF_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_9,
> +			  0x2 << RG_HDMITX21_SLDO_VREF_SEL_SHIFT,
> +			  RG_HDMITX21_SLDO_VREF_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x0 << RG_HDMITX21_BIAS_PE_VREF_SELB_SHIFT,
> +			  RG_HDMITX21_BIAS_PE_VREF_SELB);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
> +			  0x1 << RG_HDMITX21_SLDOLPF_EN_SHIFT,
> +			  RG_HDMITX21_SLDOLPF_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x11 << RG_HDMITX21_INTR_CAL_SHIFT,
> +			  RG_HDMITX21_INTR_CAL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x1 << RG_HDMITXPLL_PWD_SHIFT,
> RG_HDMITXPLL_PWD);
> +
> +	/* TXPOSDIV */
> +	if (txposdiv == 1)
> +		txposdiv_value = 0x0;
> +	else if (txposdiv == 2)
> +		txposdiv_value = 0x1;
> +	else if (txposdiv == 4)
> +		txposdiv_value = 0x2;
> +	else if (txposdiv == 8)
> +		txposdiv_value = 0x3;
> +	else
> +		return -EINVAL;
use ilog2()?

> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  txposdiv_value <<
> RG_HDMITX21_TX_POSDIV_SHIFT,
> +			  RG_HDMITX21_TX_POSDIV);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x1 << RG_HDMITX21_TX_POSDIV_EN_SHIFT,
> +			  RG_HDMITX21_TX_POSDIV_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x0 << RG_HDMITX21_FRL_EN_SHIFT,
> RG_HDMITX21_FRL_EN);
> +
> +	/* TXPREDIV */
> +	if (txprediv == 2) {
> +		div3_ctrl_value = 0x0;
> +		posdiv_vallue = 0x0;
> +	} else if (txprediv == 4) {
> +		div3_ctrl_value = 0x0;
> +		posdiv_vallue = 0x1;
> +	} else if (txprediv == 6) {
> +		div3_ctrl_value = 0x1;
> +		posdiv_vallue = 0x0;
> +	} else if (txprediv == 12) {
> +		div3_ctrl_value = 0x1;
> +		posdiv_vallue = 0x1;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  div3_ctrl_value
> +				  <<
> RG_HDMITXPLL_POSDIV_DIV3_CTRL_SHIFT,
> +			  RG_HDMITXPLL_POSDIV_DIV3_CTRL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  posdiv_vallue << RG_HDMITXPLL_POSDIV_SHIFT,
> +			  RG_HDMITXPLL_POSDIV);
> +
> +	/* POSDIV1 */
> +	if (posdiv1 == 5)
> +		div_ctrl_value = 0x0;
> +	else if (posdiv1 == 10)
> +		div_ctrl_value = 0x1;
> +	else if (posdiv1 == (125 / 10))
> +		div_ctrl_value = 0x2;
> +	else if (posdiv1 == 15)
> +		div_ctrl_value = 0x3;
> +	else
> +		return -EINVAL;
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  div_ctrl_value <<
> RG_HDMITXPLL_DIV_CTRL_SHIFT,
> +			  RG_HDMITXPLL_DIV_CTRL);
> +
> +	/* DE add new setting */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  0x0 << RG_HDMITXPLL_RESERVE_BIT14_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT14);
> +
> +	/* POSDIV2 */
> +	if (posdiv2 == 1)
> +		reserve_3_2_value = 0x0;
> +	else if (posdiv2 == 2)
> +		reserve_3_2_value = 0x1;
> +	else if (posdiv2 == 4)
> +		reserve_3_2_value = 0x2;
> +	else if (posdiv2 == 6)
> +		reserve_3_2_value = 0x3;
> +	else
> +		return -EINVAL;
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  reserve_3_2_value
> +				  << RG_HDMITXPLL_RESERVE_BIT3_2_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT3_2);
> +
> +	/* DE add new setting */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  0x2 << RG_HDMITXPLL_RESERVE_BIT1_0_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT1_0);
> +
> +	/* PREDIV */
> +	if (prediv == 1)
> +		prediv_value = 0x0;
> +	else if (prediv == 2)
> +		prediv_value = 0x1;
> +	else if (prediv == 4)
> +		prediv_value = 0x2;
> +	else
> +		return -EINVAL;
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  prediv_value << RG_HDMITXPLL_PREDIV_SHIFT,
> +			  RG_HDMITXPLL_PREDIV);
> +
> +	/* FBKDIV_HS3 */
> +	if (fbkdiv_hs3 == 1)
> +		reserve13_value = 0x0;
> +	else if (fbkdiv_hs3 == 2)
> +		reserve13_value = 0x1;
> +	else
> +		return -EINVAL;
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  reserve13_value <<
> RG_HDMITXPLL_RESERVE_BIT13_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT13);
> +
> +	/* FBDIV */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  fbkdiv_high <<
> RG_HDMITXPLL_FBKDIV_high_SHIFT,
> +			  RG_HDMITXPLL_FBKDIV_HIGH);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_3,
> +			  fbkdiv_low << RG_HDMITXPLL_FBKDIV_low_SHIFT,
> +			  RG_HDMITXPLL_FBKDIV_low);
> +
> +	/* Digital DIVIDER */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
> +			  0x0 << REG_PIXEL_CLOCK_SEL_SHIFT,
> +			  REG_PIXEL_CLOCK_SEL);
> +
> +	if (digital_div == 1) {
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
> +				  0x0 << REG_HDMITX_PIXEL_CLOCK_SHIFT,
> +				  REG_HDMITX_PIXEL_CLOCK);
> +	} else {
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
> +				  0x1 << REG_HDMITX_PIXEL_CLOCK_SHIFT,
> +				  REG_HDMITX_PIXEL_CLOCK);
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
> +				  (digital_div - 1) <<
> REG_HDMITXPLL_DIV_SHIFT,
> +				  REG_HDMITXPLL_DIV);
> +	}
> +
> +	return 0;
> +}
> +
> +#define PCW_DECIMAL_WIDTH 24
> +
> +static int mtk_hdmi_pll_calculate_params(struct clk_hw *hw, unsigned
> long rate,
> +					 unsigned long parent_rate)
> +{
> +	int ret;
> +	unsigned long long tmds_clk = 0;
> +	unsigned long long pixel_clk = 0;
> +	//pll input source frequency
> +	unsigned long long da_hdmitx21_ref_ck = 0;
> +	unsigned long long ns_hdmipll_ck = 0; //ICO output clk
> +	//source clk for Display digital
> +	unsigned long long ad_hdmipll_pixel_ck = 0;
> +	unsigned char digital_div = 0;
> +	unsigned long long pcw = 0; //FBDIV
> +	unsigned char txprediv = 0;
> +	unsigned char txposdiv = 0;
> +	unsigned char fbkdiv_high = 0;
> +	unsigned long fbkdiv_low = 0;
> +	unsigned char posdiv1 = 0;
> +	unsigned char posdiv2 = 0;
> +	unsigned char prediv = 1; //prediv is always 1
> +	unsigned char fbkdiv_hs3 = 1; //fbkdiv_hs3 is always 1
> +	int i = 0;
> +	unsigned char txpredivs[4] = { 2, 4, 6, 12 };
> +
> +	pixel_clk = rate;
> +	tmds_clk = pixel_clk;
> +
> +	if (tmds_clk < 25000000 || tmds_clk > 594000000)
> +		return -EINVAL;
> +
> +	da_hdmitx21_ref_ck = 26000000UL; //in HZ
> +
> +	/*  TXPOSDIV stage treatment:
> +	 *	0M  <  TMDS clk  < 54M		  /8
> +	 *	54M <= TMDS clk  < 148.35M    /4
> +	 *	148.35M <=TMDS clk < 296.7M   /2
> +	 *	296.7 <=TMDS clk <= 594M	  /1
> +	 */
> +	if (tmds_clk < 54000000UL)
> +		txposdiv = 8;
> +	else if (tmds_clk >= 54000000UL && tmds_clk < 148350000UL)
> +		txposdiv = 4;
> +	else if (tmds_clk >= 148350000UL && tmds_clk < 296700000UL)
> +		txposdiv = 2;
> +	else if (tmds_clk >= 296700000UL && tmds_clk <= 594000000UL)
> +		txposdiv = 1;
> +	else
> +		return -EINVAL;
> +
> +	/* calculate txprediv: can be 2, 4, 6, 12
> +	 * ICO clk = 5*TMDS_CLK*TXPOSDIV*TXPREDIV
> +	 * ICO clk constraint: 5G =< ICO clk <= 12G
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(txpredivs); i++) {
> +		ns_hdmipll_ck = 5 * tmds_clk * txposdiv * txpredivs[i];
> +		if (ns_hdmipll_ck >= 5000000000UL &&
> +		    ns_hdmipll_ck <= 12000000000UL)
> +			break;
> +	}
> +	if (i == (ARRAY_SIZE(txpredivs) - 1) &&
> +	    (ns_hdmipll_ck < 5000000000UL || ns_hdmipll_ck >
> 12000000000UL)) {
> +		return -EINVAL;
> +	}
> +	if (i == ARRAY_SIZE(txpredivs))
> +		return -EINVAL;
> +
> +	txprediv = txpredivs[i];
> +
> +	/* PCW calculation: FBKDIV
> +	 * formula: pcw=(frequency_out*2^pcw_bit) / frequency_in /
> FBKDIV_HS3;
> +	 * RG_HDMITXPLL_FBKDIV[32:0]:
> +	 * [32,24] 9bit integer, [23,0]:24bit fraction
> +	 */
> +	pcw = ns_hdmipll_ck;
> +	pcw = pcw << PCW_DECIMAL_WIDTH;
> +	pcw = pcw / da_hdmitx21_ref_ck;
> +	pcw = pcw / fbkdiv_hs3;
> +
> +	if ((pcw / BIT(32)) > 1) {
> +		return -EINVAL;
> +	} else if ((pcw / BIT(32)) == 1) {
> +		fbkdiv_high = 1;
> +		fbkdiv_low = pcw % BIT(32);
> +	} else {
> +		fbkdiv_high = 0;
> +		fbkdiv_low = pcw;
> +	}
> +
> +	/* posdiv1:
> +	 * posdiv1 stage treatment according to color_depth:
> +	 * 24bit -> posdiv1 /10, 30bit -> posdiv1 /12.5,
> +	 * 36bit -> posdiv1 /15, 48bit -> posdiv1 /10
> +	 */
> +	posdiv1 = 10; // div 10
> +	posdiv2 = 1;
> +	ad_hdmipll_pixel_ck = (ns_hdmipll_ck / 10) / 1;
> +
> +	/* Digital clk divider, max /32 */
> +	digital_div = ad_hdmipll_pixel_ck / pixel_clk;
> +	if (!(digital_div <= 32 && digital_div >= 1))
> +		return -EINVAL;
> +
> +	ret = mtk_hdmi_pll_set_hw(hw, prediv, fbkdiv_high, fbkdiv_low,
> +				  fbkdiv_hs3, posdiv1, posdiv2,
> txprediv,
> +				  txposdiv, digital_div);
> +	if (ret)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
> +{
> +	unsigned char data_channel_bias, clk_channel_bias;
> +	unsigned char impedance, impedance_en;
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +	unsigned long tmds_clk;
> +	unsigned long pixel_clk = hdmi_phy->pll_rate;
> +
> +	tmds_clk = pixel_clk;
> +
> +	/* bias & impedance setting:
> +	 * 3G < data rate <= 6G: enable impedance 100ohm,
> +	 *      data channel bias 24mA, clock channel bias 20mA
> +	 * pixel clk >= HD,  74.175MHZ <= pixel clk <= 300MHZ:
> +	 *      enalbe impedance 100ohm
> +	 *      data channel 20mA, clock channel 16mA
> +	 * 27M =< pixel clk < 74.175: disable impedance
> +	 *      data channel & clock channel bias 10mA
> +	 */
> +
> +	/* 3G < data rate <= 6G, 300M < tmds rate <= 594M */
> +	if (tmds_clk > 300000000UL && tmds_clk <= 594000000UL) {
> +		data_channel_bias = 0x3c; //24mA
> +		clk_channel_bias = 0x34; //20mA
> +		impedance_en = 0xf;
> +		impedance = 0x36; //100ohm
> +	} else if (pixel_clk >= 74175000UL && pixel_clk <= 300000000UL)
> {
> +		data_channel_bias = 0x34; //20mA
> +		clk_channel_bias = 0x2c; //16mA
> +		impedance_en = 0xf;
> +		impedance = 0x36; //100ohm
> +	} else if (pixel_clk >= 27000000UL && pixel_clk < 74175000UL) {
> +		data_channel_bias = 0x14; //10mA
> +		clk_channel_bias = 0x14; //10mA
> +		impedance_en = 0x0;
> +		impedance = 0x0;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	/* bias */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_1,
> +			  data_channel_bias <<
> RG_HDMITX21_DRV_IBIAS_D0_SHIFT,
> +			  RG_HDMITX21_DRV_IBIAS_D0);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_1,
> +			  data_channel_bias <<
> RG_HDMITX21_DRV_IBIAS_D1_SHIFT,
> +			  RG_HDMITX21_DRV_IBIAS_D1);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_1,
> +			  data_channel_bias <<
> RG_HDMITX21_DRV_IBIAS_D2_SHIFT,
> +			  RG_HDMITX21_DRV_IBIAS_D2);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_0,
> +			  clk_channel_bias <<
> RG_HDMITX21_DRV_IBIAS_CLK_SHIFT,
> +			  RG_HDMITX21_DRV_IBIAS_CLK);
> +
> +	/* impedance */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_0,
> +			  impedance_en << RG_HDMITX21_DRV_IMP_EN_SHIFT,
> +			  RG_HDMITX21_DRV_IMP_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_2,
> +			  impedance <<
> RG_HDMITX21_DRV_IMP_D0_EN1_SHIFT,
> +			  RG_HDMITX21_DRV_IMP_D0_EN1);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_2,
> +			  impedance <<
> RG_HDMITX21_DRV_IMP_D1_EN1_SHIFT,
> +			  RG_HDMITX21_DRV_IMP_D1_EN1);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_2,
> +			  impedance <<
> RG_HDMITX21_DRV_IMP_D2_EN1_SHIFT,
> +			  RG_HDMITX21_DRV_IMP_D2_EN1);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_2,
> +			  impedance <<
> RG_HDMITX21_DRV_IMP_CLK_EN1_SHIFT,
> +			  RG_HDMITX21_DRV_IMP_CLK_EN1);
> +
> +	return 0;
> +}
> +
> +static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x1 << RG_HDMITX21_TX_POSDIV_EN_SHIFT,
> +			  RG_HDMITX21_TX_POSDIV_EN);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_0,
> +			  0xf << RG_HDMITX21_SER_EN_SHIFT,
> RG_HDMITX21_SER_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x1 << RG_HDMITX21_D0_DRV_OP_EN_SHIFT,
> +			  RG_HDMITX21_D0_DRV_OP_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x1 << RG_HDMITX21_D1_DRV_OP_EN_SHIFT,
> +			  RG_HDMITX21_D1_DRV_OP_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x1 << RG_HDMITX21_D2_DRV_OP_EN_SHIFT,
> +			  RG_HDMITX21_D2_DRV_OP_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x1 << RG_HDMITX21_CK_DRV_OP_EN_SHIFT,
> +			  RG_HDMITX21_CK_DRV_OP_EN);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x0 << RG_HDMITX21_FRL_D0_EN_SHIFT,
> +			  RG_HDMITX21_FRL_D0_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x0 << RG_HDMITX21_FRL_D1_EN_SHIFT,
> +			  RG_HDMITX21_FRL_D1_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x0 << RG_HDMITX21_FRL_D2_EN_SHIFT,
> +			  RG_HDMITX21_FRL_D2_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x0 << RG_HDMITX21_FRL_CK_EN_SHIFT,
> +			  RG_HDMITX21_FRL_CK_EN);
> +
> +	mtk_hdmi_pll_drv_setting(hw);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x0 << RG_HDMITX21_BG_PWD_SHIFT,
> RG_HDMITX21_BG_PWD);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x1 << RG_HDMITX21_BIAS_EN_SHIFT,
> +			  RG_HDMITX21_BIAS_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
> +			  0x1 << RG_HDMITX21_CKLDO_EN_SHIFT,
> +			  RG_HDMITX21_CKLDO_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
> +			  0xf << RG_HDMITX21_SLDO_EN_SHIFT,
> +			  RG_HDMITX21_SLDO_EN);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  0x1 << DA_HDMITXPLL_PWR_ON_SHIFT,
> +			  DA_HDMITXPLL_PWR_ON);
> +	usleep_range(5, 10);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  0x0 << DA_HDMITXPLL_ISO_EN_SHIFT,
> +			  DA_HDMITXPLL_ISO_EN);
> +	usleep_range(5, 10);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x0 << RG_HDMITXPLL_PWD_SHIFT,
> RG_HDMITXPLL_PWD);
> +	usleep_range(30, 50);
> +	return 0;
> +}
> +
> +static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x1 << RG_HDMITX21_BG_PWD_SHIFT,
> RG_HDMITX21_BG_PWD);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x0 << RG_HDMITX21_BIAS_EN_SHIFT,
> +			  RG_HDMITX21_BIAS_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
> +			  0x0 << RG_HDMITX21_CKLDO_EN_SHIFT,
> +			  RG_HDMITX21_CKLDO_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
> +			  0x0 << RG_HDMITX21_SLDO_EN_SHIFT,
> +			  RG_HDMITX21_SLDO_EN);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x1 << RG_HDMITXPLL_PWD_SHIFT,
> RG_HDMITXPLL_PWD);
> +	usleep_range(10, 20);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  0x1 << DA_HDMITXPLL_ISO_EN_SHIFT,
> +			  DA_HDMITXPLL_ISO_EN);
> +	usleep_range(10, 20);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  0x0 << DA_HDMITXPLL_PWR_ON_SHIFT,
> +			  DA_HDMITXPLL_PWR_ON);
> +}
> +
> +static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long
> rate,
> +				 unsigned long parent_rate)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +	int ret;
> +
> +	dev_dbg(hdmi_phy->dev, "%s: %lu Hz, parent: %lu Hz\n",
> __func__, rate,
> +		parent_rate);
> +
> +	ret = mtk_hdmi_pll_calculate_params(hw, rate, parent_rate);
> +	if (ret != 0)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long
> rate,
> +				    unsigned long *parent_rate)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	hdmi_phy->pll_rate = rate;
> +	return rate;
> +}
> +
> +static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
> +					      unsigned long
> parent_rate)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	return hdmi_phy->pll_rate;
> +}
> +
> +static const struct clk_ops mtk_hdmi_pll_ops = {
> +	.prepare = mtk_hdmi_pll_prepare,
> +	.unprepare = mtk_hdmi_pll_unprepare,
> +	.set_rate = mtk_hdmi_pll_set_rate,
> +	.round_rate = mtk_hdmi_pll_round_rate,
> +	.recalc_rate = mtk_hdmi_pll_recalc_rate,
> +};
> +
> +static void vtx_signal_en(struct mtk_hdmi_phy *hdmi_phy, bool on)
> +{
> +	if (on)
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_0,
> RG_HDMITX21_DRV_EN,
> +				  RG_HDMITX21_DRV_EN);
> +	else
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_0,
> +				  0x0 << RG_HDMITX21_DRV_EN_SHIFT,
> +				  RG_HDMITX21_DRV_EN);
> +}
> +
> +static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
> +{
> +	vtx_signal_en(hdmi_phy, true);
> +	usleep_range(100, 150);
> +}
> +
> +static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
> +{
> +	vtx_signal_en(hdmi_phy, false);
> +}
> +
> +static int mtk_hdmi_phy_configure(struct phy *phy, union
> phy_configure_opts *opts)
> +{
> +	struct phy_configure_opts_dp *dp_opts = &opts->dp;
> +	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
> +	int ret = 0;
> +	bool enable = 0;
> +
> +	ret = clk_set_rate(hdmi_phy->pll, dp_opts->link_rate);
> +
> +	if (ret)
> +		goto out;
> +
> +	mtk_mt8195_phy_tmds_high_bit_clk_ratio(hdmi_phy, enable);
> +
> +out:
> +	return ret;
> +}
> +
> +struct mtk_hdmi_phy_conf mtk_hdmi_phy_8195_conf = {
> +	.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
> +	.hdmi_phy_clk_ops = &mtk_hdmi_pll_ops,
> +	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
> +	.hdmi_phy_disable_tmds = mtk_hdmi_phy_disable_tmds,
> +	.hdmi_phy_configure = mtk_hdmi_phy_configure,
> +};
> +
> +MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
> +MODULE_DESCRIPTION("MediaTek MT8195 HDMI PHY Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
> b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
> new file mode 100644
> index 000000000000..3cc51d8a18a4
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
> @@ -0,0 +1,204 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Copyright (c) 2021 BayLibre, SAS
> + */
> +
> +#ifndef _MTK_HDMI_PHY_8195_H
> +#define _MTK_HDMI_PHY_8195_H
> +
> +#include <linux/types.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +
> +#define DA_HDMITXPLL_ISO_EN BIT(1)
> +#define DA_HDMITXPLL_ISO_EN_SHIFT (1)
> +#define DA_HDMITXPLL_PWR_ON BIT(2)
> +#define DA_HDMITXPLL_PWR_ON_SHIFT (2)
> +
> +#define HDMI20_CLK_CFG 0x70
> +
> +#define HDMI_1_CFG_0 0x00
> +#define HDMI_1_CFG_1 0x04
> +#define HDMI_1_CFG_10 0x40
> +#define HDMI_1_CFG_2 0x08
> +#define HDMI_1_CFG_21 0x84
> +#define HDMI_1_CFG_22 0x88
> +#define HDMI_1_CFG_3 0x0c
> +#define HDMI_1_CFG_6 0x18
> +#define HDMI_1_CFG_9 0x24
> +#define HDMI_1_PLL_CFG_0 0x44
> +#define HDMI_1_PLL_CFG_1 0x48
> +#define HDMI_1_PLL_CFG_2 0x4c
> +#define HDMI_1_PLL_CFG_3 0x50
> +#define HDMI_1_PLL_CFG_4 0x54
> +
> +#define HDMI_ANA_CTL 0x7c
> +
> +#define HDMI_CTL_1 0xc4
> +#define HDMI_CTL_3 0xcc
> +
> +#define REG_ANA_HDMI20_FIFO_EN BIT(16)
> +
> +#define REG_HDMITXPLL_DIV GENMASK(4, 0)
> +#define REG_HDMITXPLL_DIV_SHIFT (0)
No need define *_SHIFT macros, use FIELD_PREP() etc

> +#define REG_HDMITX_PIXEL_CLOCK BIT(23)
> +#define REG_HDMITX_PIXEL_CLOCK_SHIFT (23)
> +#define REG_HDMITX_REF_RESPLL_SEL BIT(9)
> +#define REG_HDMITX_REF_RESPLL_SEL_SHIFT (9)
> +#define REG_HDMITX_REF_XTAL_SEL BIT(7)
> +#define REG_HDMITX_REF_XTAL_SEL_SHIFT (7)
> +
> +#define REG_PIXEL_CLOCK_SEL BIT(10)
> +#define REG_PIXEL_CLOCK_SEL_SHIFT (10)
> +
> +#define REG_TXC_DIV GENMASK(31, 30)
> +#define REG_TXC_DIV_SHIFT (30)
> +
> +#define RG_HDMITX21_BG_PWD BIT(20)
> +#define RG_HDMITX21_BG_PWD_SHIFT (20)
> +
> +#define RG_HDMITX21_BIAS_EN BIT(29)
> +#define RG_HDMITX21_BIAS_EN_SHIFT (29)
> +#define RG_HDMITX21_BIAS_PE_BG_VREF_SEL GENMASK(16, 15)
> +#define RG_HDMITX21_BIAS_PE_BG_VREF_SEL_SHIFT (15)
> +#define RG_HDMITX21_BIAS_PE_VREF_SELB GENMASK(10, 10)
> +#define RG_HDMITX21_BIAS_PE_VREF_SELB_SHIFT (10)
> +
> +#define RG_HDMITX21_CKLDO_EN BIT(3)
> +#define RG_HDMITX21_CKLDO_EN_SHIFT (3)
> +
> +#define RG_HDMITX21_CK_DRV_OP_EN BIT(11)
> +#define RG_HDMITX21_CK_DRV_OP_EN_SHIFT (11)
> +
> +#define RG_HDMITX21_D0_DRV_OP_EN BIT(10)
> +#define RG_HDMITX21_D0_DRV_OP_EN_SHIFT (10)
> +
> +#define RG_HDMITX21_D1_DRV_OP_EN BIT(9)
> +#define RG_HDMITX21_D1_DRV_OP_EN_SHIFT (9)
> +
> +#define RG_HDMITX21_D2_DRV_OP_EN BIT(8)
> +#define RG_HDMITX21_D2_DRV_OP_EN_SHIFT (8)
> +
> +#define RG_HDMITX21_DRV_EN GENMASK(27, 24)
> +#define RG_HDMITX21_DRV_EN_SHIFT (24)
> +#define RG_HDMITX21_DRV_IBIAS_CLK GENMASK(10, 5)
> +#define RG_HDMITX21_DRV_IBIAS_CLK_SHIFT (5)
> +#define RG_HDMITX21_DRV_IBIAS_D0 GENMASK(19, 14)
> +#define RG_HDMITX21_DRV_IBIAS_D0_FFE1 GENMASK(21, 17)
> +#define RG_HDMITX21_DRV_IBIAS_D0_FFE1_SHIFT (17)
> +#define RG_HDMITX21_DRV_IBIAS_D0_FFE2 GENMASK(23, 20)
> +#define RG_HDMITX21_DRV_IBIAS_D0_FFE2_SHIFT (20)
> +#define RG_HDMITX21_DRV_IBIAS_D0_SHIFT (14)
> +#define RG_HDMITX21_DRV_IBIAS_D1 GENMASK(25, 20)
> +#define RG_HDMITX21_DRV_IBIAS_D1_FFE1 GENMASK(26, 22)
> +#define RG_HDMITX21_DRV_IBIAS_D1_FFE1_SHIFT (22)
> +#define RG_HDMITX21_DRV_IBIAS_D1_FFE2 GENMASK(27, 24)
> +#define RG_HDMITX21_DRV_IBIAS_D1_FFE2_SHIFT (24)
> +#define RG_HDMITX21_DRV_IBIAS_D1_SHIFT (20)
> +#define RG_HDMITX21_DRV_IBIAS_D2 GENMASK(31, 26)
> +#define RG_HDMITX21_DRV_IBIAS_D2_FFE1 GENMASK(31, 27)
> +#define RG_HDMITX21_DRV_IBIAS_D2_FFE1_SHIFT (27)
> +#define RG_HDMITX21_DRV_IBIAS_D2_FFE2 GENMASK(31, 28)
> +#define RG_HDMITX21_DRV_IBIAS_D2_FFE2_SHIFT (28)
> +#define RG_HDMITX21_DRV_IBIAS_D2_SHIFT (26)
> +#define RG_HDMITX21_DRV_IMP_CLK_EN1 GENMASK(31, 26)
> +#define RG_HDMITX21_DRV_IMP_CLK_EN1_SHIFT (26)
> +#define RG_HDMITX21_DRV_IMP_D0_EN1 GENMASK(13, 8)
> +#define RG_HDMITX21_DRV_IMP_D0_EN1_SHIFT (8)
> +#define RG_HDMITX21_DRV_IMP_D1_EN1 GENMASK(19, 14)
> +#define RG_HDMITX21_DRV_IMP_D1_EN1_SHIFT (14)
> +#define RG_HDMITX21_DRV_IMP_D2_EN1 GENMASK(25, 20)
> +#define RG_HDMITX21_DRV_IMP_D2_EN1_SHIFT (20)
> +#define RG_HDMITX21_DRV_IMP_EN GENMASK(23, 20)
> +#define RG_HDMITX21_DRV_IMP_EN_SHIFT (20)
> +
> +#define RG_HDMITX21_FRL_CK_EN BIT(13)
> +#define RG_HDMITX21_FRL_CK_EN_SHIFT (13)
> +#define RG_HDMITX21_FRL_D0_EN BIT(14)
> +#define RG_HDMITX21_FRL_D0_EN_SHIFT (14)
> +#define RG_HDMITX21_FRL_D1_EN BIT(15)
> +#define RG_HDMITX21_FRL_D1_EN_SHIFT (15)
> +#define RG_HDMITX21_FRL_D2_EN BIT(16)
> +#define RG_HDMITX21_FRL_D2_EN_SHIFT (16)
> +#define RG_HDMITX21_FRL_EN BIT(12)
> +#define RG_HDMITX21_FRL_EN_SHIFT (12)
> +
> +#define RG_HDMITX21_INTR_CAL GENMASK(22, 18)
> +#define RG_HDMITX21_INTR_CAL_READOUT GENMASK(22, 18)
> +#define RG_HDMITX21_INTR_CAL_READOUT_SHIFT (18)
> +#define RG_HDMITX21_INTR_CAL_SHIFT (18)
> +
> +#define RG_HDMITX21_SER_EN GENMASK(31, 28)
> +#define RG_HDMITX21_SER_EN_SHIFT (28)
> +
> +#define RG_HDMITX21_SLDOLPF_EN BIT(7)
> +#define RG_HDMITX21_SLDOLPF_EN_SHIFT (7)
> +#define RG_HDMITX21_SLDO_EN GENMASK(11, 8)
> +#define RG_HDMITX21_SLDO_EN_SHIFT (8)
> +#define RG_HDMITX21_SLDO_VREF_SEL GENMASK(5, 4)
> +#define RG_HDMITX21_SLDO_VREF_SEL_SHIFT (4)
> +
> +#define RG_HDMITX21_TX_POSDIV GENMASK(27, 26)
> +#define RG_HDMITX21_TX_POSDIV_EN GENMASK(28, 28)
> +#define RG_HDMITX21_TX_POSDIV_EN_SHIFT (28)
> +#define RG_HDMITX21_TX_POSDIV_SHIFT (26)
> +
> +#define RG_HDMITX21_VREF_SEL BIT(4)
> +#define RG_HDMITX21_VREF_SEL_SHIFT (4)
> +
> +#define RG_HDMITXPLL_BC GENMASK(28, 27)
> +#define RG_HDMITXPLL_BC_SHIFT (27)
> +#define RG_HDMITXPLL_BP GENMASK(13, 10)
> +#define RG_HDMITXPLL_BP2 BIT(30)
> +#define RG_HDMITXPLL_BP2_SHIFT (30)
> +#define RG_HDMITXPLL_BP_SHIFT (10)
> +#define RG_HDMITXPLL_BR GENMASK(21, 19)
> +#define RG_HDMITXPLL_BR_SHIFT (19)
> +#define RG_HDMITXPLL_DIV_CTRL GENMASK(25, 24)
> +#define RG_HDMITXPLL_DIV_CTRL_SHIFT (24)
> +#define RG_HDMITXPLL_FBKDIV_HIGH BIT(31)
> +#define RG_HDMITXPLL_FBKDIV_high_SHIFT (31)
> +#define RG_HDMITXPLL_FBKDIV_low (0xffffffff)
> +#define RG_HDMITXPLL_FBKDIV_low_SHIFT (0)
> +#define RG_HDMITXPLL_HIKVCO GENMASK(29, 29)
> +#define RG_HDMITXPLL_HIKVCO_SHIFT (29)
> +#define RG_HDMITXPLL_HREN GENMASK(13, 12)
> +#define RG_HDMITXPLL_HREN_SHIFT (12)
> +#define RG_HDMITXPLL_IBAND_FIX_EN GENMASK(24, 24)
> +#define RG_HDMITXPLL_IBAND_FIX_EN_SHIFT (24)
> +#define RG_HDMITXPLL_IC GENMASK(26, 22)
> +#define RG_HDMITXPLL_IC_SHIFT (22)
> +#define RG_HDMITXPLL_IR GENMASK(18, 14)
> +#define RG_HDMITXPLL_IR_SHIFT (14)
> +#define RG_HDMITXPLL_LVR_SEL GENMASK(27, 26)
> +#define RG_HDMITXPLL_LVR_SEL_SHIFT (26)
> +#define RG_HDMITXPLL_POSDIV GENMASK(23, 22)
> +#define RG_HDMITXPLL_POSDIV_DIV3_CTRL BIT(21)
> +#define RG_HDMITXPLL_POSDIV_DIV3_CTRL_SHIFT (21)
> +#define RG_HDMITXPLL_POSDIV_SHIFT (22)
> +#define RG_HDMITXPLL_PREDIV GENMASK(29, 28)
> +#define RG_HDMITXPLL_PREDIV_SHIFT (28)
> +#define RG_HDMITXPLL_PWD BIT(31)
> +#define RG_HDMITXPLL_PWD_SHIFT (31)
> +#define RG_HDMITXPLL_REF_CK_SEL GENMASK(2, 1)
> +#define RG_HDMITXPLL_REF_CK_SEL_SHIFT (1)
> +#define RG_HDMITXPLL_RESERVE GENMASK(15, 0)
> +#define RG_HDMITXPLL_RESERVE_BIT12_11 GENMASK(12, 11)
> +#define RG_HDMITXPLL_RESERVE_BIT12_11_SHIFT (11)
> +#define RG_HDMITXPLL_RESERVE_BIT13 BIT(13)
> +#define RG_HDMITXPLL_RESERVE_BIT13_SHIFT (13)
> +#define RG_HDMITXPLL_RESERVE_BIT14 BIT(14)
> +#define RG_HDMITXPLL_RESERVE_BIT14_SHIFT (14)
> +#define RG_HDMITXPLL_RESERVE_BIT1_0 GENMASK(1, 0)
> +#define RG_HDMITXPLL_RESERVE_BIT1_0_SHIFT (0)
> +#define RG_HDMITXPLL_RESERVE_BIT3_2 GENMASK(3, 2)
> +#define RG_HDMITXPLL_RESERVE_BIT3_2_SHIFT (2)
> +#define RG_HDMITXPLL_RESERVE_SHIFT (0)
> +#define RG_HDMITXPLL_TCL_EN BIT(31)
> +#define RG_HDMITXPLL_TCL_EN_SHIFT (31)
> +
> +#define RG_INTR_IMP_RG_MODE GENMASK(7, 3)
> +#define RG_INTR_IMP_RG_MODE_SHIFT (3)
> +
> +#endif /* MTK_HDMI_PHY_8195_H */
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c
> b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index af46472237e0..3fb60ab53668 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -194,6 +194,9 @@ static const struct of_device_id
> mtk_hdmi_phy_match[] = {
>  	{ .compatible = "mediatek,mt8173-hdmi-phy",
>  	  .data = &mtk_hdmi_phy_8173_conf,
>  	},
> +	{ .compatible = "mediatek,mt8195-hdmi-phy",
> +	  .data = &mtk_hdmi_phy_8195_conf,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_hdmi_phy_match);
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h
> b/drivers/phy/mediatek/phy-mtk-hdmi.h
> index 05de93f63a61..9d6399be71e9 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.h
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
> @@ -51,6 +51,7 @@ void mtk_hdmi_phy_mask(struct mtk_hdmi_phy
> *hdmi_phy, u32 offset,
>  		       u32 val, u32 mask);
>  struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw);
>  
> +extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_8195_conf;
>  extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_8173_conf;
>  extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf;
>  
> 

