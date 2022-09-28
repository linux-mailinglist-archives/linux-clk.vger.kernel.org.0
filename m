Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFC55EDC7A
	for <lists+linux-clk@lfdr.de>; Wed, 28 Sep 2022 14:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbiI1MXv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 28 Sep 2022 08:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiI1MXu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 08:23:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A640386FF8
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 05:23:48 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id k10so20108192lfm.4
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 05:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=Swb7XVMS5l4jVs+taUaFHDZniMnQe0LrNo5JVaq+smE=;
        b=c7CWUAsfmp+EUrBbsuVwHuXZYgfW2HVC0Li9FEyeBNVz54UBKlH/LwX+eoHjrw/RhN
         HgS0dnWmAJwxifOaPqgR6tmTb84kzSWbrL9exeYtUY0fduYToLJfXsgj6MPghccx5j+M
         455J5Z9jH0S3XuLMki862MI98Ona3zIEpM/bACfbyA19QAIoYxKwCSLRj+rD8+kAIr3o
         7HxESQA5LojmCE8FnZPaLunR8pN4t1Txi2JgQDvgZFhWprO8gHUPQ4datyPbLQ9eBa35
         gbCYiQHE5tolljp0ZvNeexs29IETA3U2U2YvnLz27nJDLCzvEV87zs2Bq8knrfW2sb7q
         tZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Swb7XVMS5l4jVs+taUaFHDZniMnQe0LrNo5JVaq+smE=;
        b=QT6cG+GFqGuolDaM5TSMafI3Hsqw2gmW4fg9JDpC/ehtVG24DIGB3zT0Q7Yv0yM5QA
         81RqWRblW6N3bd383wdRTvEEA/vGrz8Ou4gO3/oKYBsHoqOAzvT98thCgtrNUAMkvcC3
         o8K6JCSZpBBKAmn4Vfe6jfh4SYC2fGyJ2zPmkVMpF85xYQaGSNOpR2LQgOtQltWVxUTq
         6G2vZSe44WMBXqmTVV5KdC83vilbba8t0YVc/Vlkqv3iIYJj5FhG8qWMop7Izt60WOdA
         roWogmtAHvD5YR3WpHtvLCT3hbdq8H6mgcie8eSKdRdlQhQwj9wHotDHU8bamFfsBnfV
         Bkqg==
X-Gm-Message-State: ACrzQf2qcFOue7P1maMdzbQpDqBtLztB1+jwk1n4EAcPXWOkr3vf3Oy0
        d43J9xBCA/KRFKtGeywgusgsgduuTX5kIhBpX54aZg==
X-Google-Smtp-Source: AMsMyM6y/zW9NWpjwXIpFeG7jR5sdtiQjNZFUTI8LJaS28E+8UxFW/BjROXWV6E4XvWqIlDYLzeduXvGYy1dfVvHhHk=
X-Received: by 2002:a05:6512:5d7:b0:498:f521:e143 with SMTP id
 o23-20020a05651205d700b00498f521e143mr12968086lfo.617.1664367826958; Wed, 28
 Sep 2022 05:23:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Sep 2022 05:23:43 -0700
From:   Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-14-4844816c9808@baylibre.com>
 <d1346dcf6b6906d153c13c086bf963dc89c5549b.camel@mediatek.com>
 <CABnWg9v4OuAU0x7n1q09gO7u3faOsmeq_4PFpw=_wAn1+erF8A@mail.gmail.com> <da5c39fb351a7ca5a9dfa1c938d2e3d914ecb0d2.camel@mediatek.com>
In-Reply-To: <da5c39fb351a7ca5a9dfa1c938d2e3d914ecb0d2.camel@mediatek.com>
MIME-Version: 1.0
Date:   Wed, 28 Sep 2022 05:23:43 -0700
Message-ID: <CABnWg9u5bJgfRqug3wFUOnFb3c7Fv_9YN2p8CXmhcnBrqa+pQA@mail.gmail.com>
Subject: Re: [PATCH v1 14/17] phy: mediatek: add support for phy-mtk-hdmi-mt8195
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
        Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 28 Sep 2022 04:40, Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>On Tue, 2022-09-27 at 06:23 -0700, Guillaume Ranquet wrote:
>> On Tue, 20 Sep 2022 09:46, Chunfeng Yun <chunfeng.yun@mediatek.com>
>> wrote:
>> > On Mon, 2022-09-19 at 18:56 +0200, Guillaume Ranquet wrote:
>> > > Add basic support for the mediatek hdmi phy on MT8195 SoC
>> > >
>> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> > >
>> > > diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>> > > b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>> > > index bb7593ea4c86..0157acdce56c 100644
>> > > --- a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>> > > +++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>> > > @@ -1344,6 +1344,8 @@ static void mtk_hdmi_bridge_disable(struct
>> > > drm_bridge *bridge,
>> > >  	mtk_hdmi_disable_hdcp_encrypt(hdmi);
>> > >  	usleep_range(50000, 50050);
>> > >
>> > > +	phy_power_off(hdmi->phy);
>> > > +
>> > >  	hdmi->enabled = false;
>> > >  }
>> > >
>> > > diff --git a/drivers/phy/mediatek/Makefile
>> > > b/drivers/phy/mediatek/Makefile
>> > > index fb1f8edaffa7..c9a50395533e 100644
>> > > --- a/drivers/phy/mediatek/Makefile
>> > > +++ b/drivers/phy/mediatek/Makefile
>> > > @@ -12,6 +12,7 @@ obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-
>> > > mtk-
>> > > xsphy.o
>> > >  phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
>> > >  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-
>> > > mt2701.o
>> > >  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-
>> > > mt8173.o
>> > > +phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-
>> > > mt8195.o
>> > >  obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
>> > >
>> > >  phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
>> > > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> > > b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> > > new file mode 100644
>> > > index 000000000000..149015b64c02
>> > > --- /dev/null
>> > > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> > > @@ -0,0 +1,673 @@
>> > > +// SPDX-License-Identifier: GPL-2.0
>> > > +/*
>> > > + * Copyright (c) 2021 MediaTek Inc.
>> > > + * Copyright (c) 2021 BayLibre, SAS
>> > > + */
>> > > +#include <linux/delay.h>
>> > > +#include <linux/io.h>
>> > > +#include <linux/mfd/syscon.h>
>> > > +#include <linux/module.h>
>> > > +#include <linux/phy/phy.h>
>> > > +#include <linux/platform_device.h>
>> > > +#include <linux/types.h>
>> > > +#include <linux/nvmem-consumer.h>
>> > > +
>> > > +#include "phy-mtk-hdmi.h"
>> > > +#include "phy-mtk-hdmi-mt8195.h"
>> > > +
>> > > +static void mtk_hdmi_ana_fifo_en(struct mtk_hdmi_phy *hdmi_phy)
>> > > +{
>> > > +	/* make data fifo writable for hdmi2.0 */
>> > > +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_ANA_CTL,
>> > > REG_ANA_HDMI20_FIFO_EN,
>> > > +			  REG_ANA_HDMI20_FIFO_EN);
>> > > +}
>> > > +
>> > > +static void
>> > > +mtk_mt8195_phy_tmds_high_bit_clk_ratio(struct mtk_hdmi_phy
>> > > *hdmi_phy,
>> > > +				       bool enable)
>> > > +{
>> > > +	mtk_hdmi_ana_fifo_en(hdmi_phy);
>> > > +
>> > > +	/* HDMI 2.0 specification, 3.4Gbps <= TMDS Bit Rate <= 6G,
>> > > +	 * clock bit ratio 1:40, under 3.4Gbps, clock bit ratio 1:10
>> > > +	 */
>> > > +	if (enable)
>> > > +		mtk_hdmi_phy_mask(hdmi_phy, HDMI20_CLK_CFG,
>> > > +				  0x2 << REG_TXC_DIV_SHIFT,
>> >
>> > Use FIELD_PREP() macro, then no need define REG_TXC_DIV_SHIFT
>> > anymore.
>> >
>>
>> Didn't know about FIELD_* macros, will use them for V2.
>>
>> Thx for the suggestion.
>Please use helpers defined in phy-mtk-io.h, the register access helpers
>of mtk_hdmi_phy_* are already removed in phy next branch.
>
>Thanks a lot
>
>
Hi,

Thank you for the headsup, I've seen the change landed in
next-20220927 on which I'm currently rebasing.


Thx,
Guillaume.
