Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7C35BE2E5
	for <lists+linux-clk@lfdr.de>; Tue, 20 Sep 2022 12:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbiITKSx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 20 Sep 2022 06:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiITKSw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 06:18:52 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CFE6D9CA;
        Tue, 20 Sep 2022 03:18:50 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FA956600368;
        Tue, 20 Sep 2022 11:18:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1663669128;
        bh=B7xp7LNcnfbdR5oIkfuWVwdzNL7IbuXIGjam7V0vK40=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SaWh1AMtnitMfo9coVDZcsdbltKYBYXw1LJst710ha2g5XKkVzVvVVl3mkwpxxGgm
         FthnwnKgggKvZyl2L4nVuOYLOoub08A7CWFtDfYuO0n39YHGmR+N89bIZ9WBXTkFfh
         /z+1CbJhG5nCl6CQS318lSxAGSRxzRwG8pTE8k5bw0LHZhqk3cFrB59Skd3+l7bnlS
         Nmg6BNozuvtjwsD94fpJMY90oSG3pr5dVxXqS3/fzpUoNpBsct05N4mWFKrVqR51ab
         xaS5ot7qE+WxpH0LABFAaBp0eYFgvd3dJUPoITu1R6pvxN3hLVfvgDL+LXTZwwaZ4K
         ewVvTrcPWH7vw==
Message-ID: <32c4822a-a094-5fa3-c2af-e515bf897937@collabora.com>
Date:   Tue, 20 Sep 2022 12:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 05/17] drm/mediatek: hdmi: use a syscon/regmap instead
 of iomem
Content-Language: en-US
To:     Guillaume Ranquet <granquet@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-5-4844816c9808@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-5-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
> To prepare support for newer chips that need to share their address
> range with a dedicated ddc driver, move to a syscon.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 3196189429bc..5cd05d4fe1a9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c

..snip..

> @@ -1428,7 +1413,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   	struct device_node *cec_np, *remote, *i2c_np;
>   	struct platform_device *cec_pdev;
>   	struct regmap *regmap;
> -	struct resource *mem;
>   	int ret;
>   
>   	ret = mtk_hdmi_get_all_clk(hdmi, np);
> @@ -1474,8 +1458,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   	}
>   	hdmi->sys_regmap = regmap;
>   
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	hdmi->regs = devm_ioremap_resource(dev, mem);
> +	hdmi->regs = syscon_node_to_regmap(dev->of_node);

Nack. You're breaking ABI, this will force everyone to add syscon to devicetree,
hence this breaks retrocompatibility with old devicetrees.

Hint: not here, device_node_to_regmap()

Regards,
Angelo

>   	if (IS_ERR(hdmi->regs)) {
>   		ret = PTR_ERR(hdmi->regs);
>   		goto put_device;


