Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1678F116AB1
	for <lists+linux-clk@lfdr.de>; Mon,  9 Dec 2019 11:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfLIKPk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Dec 2019 05:15:40 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41026 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfLIKPk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Dec 2019 05:15:40 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id C67AD28EDB5
Subject: Re: [resend PATCH v6 12/12] drm/mediatek: Add support for mmsys
 through a pdev
To:     matthias.bgg@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
        mturquette@baylibre.com, sboyd@kernel.org,
        ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com
Cc:     sean.wang@mediatek.com, sean.wang@kernel.org,
        rdunlap@infradead.org, wens@csie.org, hsinyi@chromium.org,
        frank-w@public-files.de, drinkcat@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-13-matthias.bgg@kernel.org>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <96c850e0-9b12-a943-4e99-9aca7ce8ca8b@collabora.com>
Date:   Mon, 9 Dec 2019 11:15:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191207224740.24536-13-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Matthias,

Just one nit below and LGTM

On 7/12/19 23:47, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The MMSYS subsystem includes clocks and drm components.
> This patch adds an initailization path through a platform device
> for the clock part, so that both drivers get probed from the same
> device tree compatible.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h |  2 ++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 210455e9f46c..5ada74d8d0c9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -186,6 +186,7 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>  	.ext_path = mt2701_mtk_ddp_ext,
>  	.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
>  	.shadow_register = true,
> +	.clk_drv_name = "clk-mt2701-mm",
>  };
>  
>  static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
> @@ -195,6 +196,7 @@ static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>  	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
>  	.third_path = mt2712_mtk_ddp_third,
>  	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
> +	.clk_drv_name = "clk-mt2712-mm",
>  };
>  
>  static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
> @@ -202,6 +204,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>  	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
>  	.ext_path = mt8173_mtk_ddp_ext,
>  	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
> +	.clk_drv_name = "clk-mt8173-mm",
>  };
>  
>  static int mtk_drm_kms_init(struct drm_device *drm)
> @@ -499,6 +502,24 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  	INIT_WORK(&private->commit.work, mtk_atomic_work);
>  	private->data = of_device_get_match_data(dev);
>  
> +	/*
> +	 * MMSYS includes apart from components management a block providing
> +	 * clocks for the subsystem. We probe this clock driver via a platform
> +	 * device.
> +	 */
> +	if (private->data->clk_drv_name) {
> +		private->clk_dev = platform_device_register_data(dev,
> +						private->data->clk_drv_name, -1,
> +						NULL, 0);

Replace -1 for PLATFORM_DEVID_NONE

> +
> +		if (IS_ERR(private->clk_dev)) {
> +			dev_err(dev, "failed to register %s platform device\n",
> +				private->data->clk_drv_name);
> +
> +			return PTR_ERR(private->clk_dev);
> +		}
> +	}
> +
>  	private->config_regs = syscon_node_to_regmap(dev->of_node);
>  	if (IS_ERR(private->config_regs))
>  		return PTR_ERR(private->config_regs);
> @@ -605,6 +626,9 @@ static int mtk_drm_remove(struct platform_device *pdev)
>  	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
>  		of_node_put(private->comp_node[i]);
>  
> +	if (private->clk_dev)
> +		platform_device_unregister(private->clk_dev);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index 63a121577dcb..8fe9136adc38 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -29,11 +29,13 @@ struct mtk_mmsys_driver_data {
>  	unsigned int third_len;
>  
>  	bool shadow_register;
> +	const char *clk_drv_name;
>  };
>  
>  struct mtk_drm_private {
>  	struct drm_device *drm;
>  	struct device *dma_dev;
> +	struct platform_device *clk_dev;
>  
>  	unsigned int num_pipes;
>  
> 
