Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05EF3193E5A
	for <lists+linux-clk@lfdr.de>; Thu, 26 Mar 2020 12:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgCZLyr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 26 Mar 2020 07:54:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:35222 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728119AbgCZLyq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 26 Mar 2020 07:54:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id AF9C7ADDA;
        Thu, 26 Mar 2020 11:54:43 +0000 (UTC)
Subject: Re: [PATCH v12 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
To:     CK Hu <ck.hu@mediatek.com>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        airlied@linux.ie, mturquette@baylibre.com, sboyd@kernel.org,
        ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com,
        Allison Randal <allison@lohutok.net>,
        Matthias Brugger <matthias.bgg@gmail.com>, wens@csie.org,
        linux-media@vger.kernel.org, sean.wang@mediatek.com,
        hsinyi@chromium.org, rdunlap@infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-kernel@lists.infradead.org, matthias.bgg@kernel.org,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        frank-w@public-files.de, devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        linux-kernel@vger.kernel.org, mtk01761 <wendell.lin@mediatek.com>,
        Richard Fontana <rfontana@redhat.com>
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-5-enric.balletbo@collabora.com>
 <02290a21-7392-a2cf-576c-215091ec05e8@suse.com>
 <1585177534.26117.4.camel@mtksdaap41>
From:   Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; prefer-encrypt=mutual; keydata=
 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
 HxUCQ9Y1Y/Ct
Message-ID: <f3c2926a-ef92-b004-9786-5be1645af497@suse.com>
Date:   Thu, 26 Mar 2020 12:54:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1585177534.26117.4.camel@mtksdaap41>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi CK,

On 26/03/2020 00:05, CK Hu wrote:
> Hi, Matthias:
> 
> On Wed, 2020-03-25 at 17:16 +0100, Matthias Brugger wrote:
>>
>> On 11/03/2020 17:53, Enric Balletbo i Serra wrote:
>>> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() functions to
>>> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path().
>>> Those functions will allow DRM driver and others to control the data
>>> path routing.
>>>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>> Acked-by: CK Hu <ck.hu@mediatek.com>
>>
>> This patch does not apply against v5.6-rc1.
>> Please rebase as this is a quite big patch and it won't be easy to do that by hand.
> 
> I think this patch depends on [1] which has been acked by me and I have
> not picked it. The simple way is that you pick [1] first and then pick
> this series.
> 
> [1] 
> https://patchwork.kernel.org/patch/11406227/
> 

You would need to provide a stable tag for me that I can merge into my tree. You
can also try to merge my for-next [1] which has the newest version from Enric.
If you see any merge conflict, then we have to do something about it :)

Regards,
Matthias

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=for-next

> Regards,
> CK
> 
>>
>> Regards,
>> Matthias
>>
>>> ---
>>>
>>> Changes in v12: None
>>> Changes in v10:
>>> - Select CONFIG_MTK_MMSYS (CK)
>>> - Pass device pointer of mmsys device instead of config regs (CK)
>>>
>>> Changes in v9:
>>> - Introduced a new patch to move routing control into mmsys driver.
>>> - Removed the patch to use regmap as is not needed anymore.
>>>
>>> Changes in v8: None
>>> Changes in v7: None
>>>
>>>  drivers/gpu/drm/mediatek/Kconfig        |   1 +
>>>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  19 +-
>>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 256 ----------------------
>>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |   7 -
>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  14 +-
>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   2 +-
>>>  drivers/soc/mediatek/mtk-mmsys.c        | 279 ++++++++++++++++++++++++
>>>  include/linux/soc/mediatek/mtk-mmsys.h  |  20 ++
>>>  8 files changed, 316 insertions(+), 282 deletions(-)
>>>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
>>> index fa5ffc4fe823..c420f5a3d33b 100644
>>> --- a/drivers/gpu/drm/mediatek/Kconfig
>>> +++ b/drivers/gpu/drm/mediatek/Kconfig
>>> @@ -11,6 +11,7 @@ config DRM_MEDIATEK
>>>  	select DRM_MIPI_DSI
>>>  	select DRM_PANEL
>>>  	select MEMORY
>>> +	select MTK_MMSYS
>>>  	select MTK_SMI
>>>  	select VIDEOMODE_HELPERS
>>>  	help
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> index 0e05683d7b53..579a5a5d4472 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> @@ -6,6 +6,7 @@
>>>  #include <linux/clk.h>
>>>  #include <linux/pm_runtime.h>
>>>  #include <linux/soc/mediatek/mtk-cmdq.h>
>>> +#include <linux/soc/mediatek/mtk-mmsys.h>
>>>  
>>>  #include <asm/barrier.h>
>>>  #include <soc/mediatek/smi.h>
>>> @@ -28,7 +29,7 @@
>>>   * @enabled: records whether crtc_enable succeeded
>>>   * @planes: array of 4 drm_plane structures, one for each overlay plane
>>>   * @pending_planes: whether any plane has pending changes to be applied
>>> - * @config_regs: memory mapped mmsys configuration register space
>>> + * @mmsys_dev: pointer to the mmsys device for configuration registers
>>>   * @mutex: handle to one of the ten disp_mutex streams
>>>   * @ddp_comp_nr: number of components in ddp_comp
>>>   * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
>>> @@ -50,7 +51,7 @@ struct mtk_drm_crtc {
>>>  	u32				cmdq_event;
>>>  #endif
>>>  
>>> -	void __iomem			*config_regs;
>>> +	struct device			*mmsys_dev;
>>>  	struct mtk_disp_mutex		*mutex;
>>>  	unsigned int			ddp_comp_nr;
>>>  	struct mtk_ddp_comp		**ddp_comp;
>>> @@ -296,9 +297,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>>>  	}
>>>  
>>>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
>>> -		mtk_ddp_add_comp_to_path(mtk_crtc->config_regs,
>>> -					 mtk_crtc->ddp_comp[i]->id,
>>> -					 mtk_crtc->ddp_comp[i + 1]->id);
>>> +		mtk_mmsys_ddp_connect(mtk_crtc->mmsys_dev,
>>> +				      mtk_crtc->ddp_comp[i]->id,
>>> +				      mtk_crtc->ddp_comp[i + 1]->id);
>>>  		mtk_disp_mutex_add_comp(mtk_crtc->mutex,
>>>  					mtk_crtc->ddp_comp[i]->id);
>>>  	}
>>> @@ -355,9 +356,9 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>>>  					   mtk_crtc->ddp_comp[i]->id);
>>>  	mtk_disp_mutex_disable(mtk_crtc->mutex);
>>>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
>>> -		mtk_ddp_remove_comp_from_path(mtk_crtc->config_regs,
>>> -					      mtk_crtc->ddp_comp[i]->id,
>>> -					      mtk_crtc->ddp_comp[i + 1]->id);
>>> +		mtk_mmsys_ddp_disconnect(mtk_crtc->mmsys_dev,
>>> +					 mtk_crtc->ddp_comp[i]->id,
>>> +					 mtk_crtc->ddp_comp[i + 1]->id);
>>>  		mtk_disp_mutex_remove_comp(mtk_crtc->mutex,
>>>  					   mtk_crtc->ddp_comp[i]->id);
>>>  	}
>>> @@ -761,7 +762,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>>>  	if (!mtk_crtc)
>>>  		return -ENOMEM;
>>>  
>>> -	mtk_crtc->config_regs = priv->config_regs;
>>> +	mtk_crtc->mmsys_dev = priv->mmsys_dev;
>>>  	mtk_crtc->ddp_comp_nr = path_len;
>>>  	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
>>>  						sizeof(*mtk_crtc->ddp_comp),
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>>> index b885f60f474c..014c1bbe1df2 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>>> @@ -13,26 +13,6 @@
>>>  #include "mtk_drm_ddp.h"
>>>  #include "mtk_drm_ddp_comp.h"
>>>  
>>> -#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
>>> -#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
>>> -#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
>>> -#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
>>> -#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
>>> -#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
>>> -#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
>>> -#define DISP_REG_CONFIG_DSIE_SEL_IN		0x0a4
>>> -#define DISP_REG_CONFIG_DSIO_SEL_IN		0x0a8
>>> -#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
>>> -#define DISP_REG_CONFIG_DISP_RDMA2_SOUT		0x0b8
>>> -#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN	0x0c4
>>> -#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
>>> -#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
>>> -
>>> -#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
>>> -#define DISP_REG_CONFIG_OUT_SEL			0x04c
>>> -#define DISP_REG_CONFIG_DSI_SEL			0x050
>>> -#define DISP_REG_CONFIG_DPI_SEL			0x064
>>> -
>>>  #define MT2701_DISP_MUTEX0_MOD0			0x2c
>>>  #define MT2701_DISP_MUTEX0_SOF0			0x30
>>>  
>>> @@ -94,48 +74,6 @@
>>>  #define MUTEX_SOF_DSI2			5
>>>  #define MUTEX_SOF_DSI3			6
>>>  
>>> -#define OVL0_MOUT_EN_COLOR0		0x1
>>> -#define OD_MOUT_EN_RDMA0		0x1
>>> -#define OD1_MOUT_EN_RDMA1		BIT(16)
>>> -#define UFOE_MOUT_EN_DSI0		0x1
>>> -#define COLOR0_SEL_IN_OVL0		0x1
>>> -#define OVL1_MOUT_EN_COLOR1		0x1
>>> -#define GAMMA_MOUT_EN_RDMA1		0x1
>>> -#define RDMA0_SOUT_DPI0			0x2
>>> -#define RDMA0_SOUT_DPI1			0x3
>>> -#define RDMA0_SOUT_DSI1			0x1
>>> -#define RDMA0_SOUT_DSI2			0x4
>>> -#define RDMA0_SOUT_DSI3			0x5
>>> -#define RDMA1_SOUT_DPI0			0x2
>>> -#define RDMA1_SOUT_DPI1			0x3
>>> -#define RDMA1_SOUT_DSI1			0x1
>>> -#define RDMA1_SOUT_DSI2			0x4
>>> -#define RDMA1_SOUT_DSI3			0x5
>>> -#define RDMA2_SOUT_DPI0			0x2
>>> -#define RDMA2_SOUT_DPI1			0x3
>>> -#define RDMA2_SOUT_DSI1			0x1
>>> -#define RDMA2_SOUT_DSI2			0x4
>>> -#define RDMA2_SOUT_DSI3			0x5
>>> -#define DPI0_SEL_IN_RDMA1		0x1
>>> -#define DPI0_SEL_IN_RDMA2		0x3
>>> -#define DPI1_SEL_IN_RDMA1		(0x1 << 8)
>>> -#define DPI1_SEL_IN_RDMA2		(0x3 << 8)
>>> -#define DSI0_SEL_IN_RDMA1		0x1
>>> -#define DSI0_SEL_IN_RDMA2		0x4
>>> -#define DSI1_SEL_IN_RDMA1		0x1
>>> -#define DSI1_SEL_IN_RDMA2		0x4
>>> -#define DSI2_SEL_IN_RDMA1		(0x1 << 16)
>>> -#define DSI2_SEL_IN_RDMA2		(0x4 << 16)
>>> -#define DSI3_SEL_IN_RDMA1		(0x1 << 16)
>>> -#define DSI3_SEL_IN_RDMA2		(0x4 << 16)
>>> -#define COLOR1_SEL_IN_OVL1		0x1
>>> -
>>> -#define OVL_MOUT_EN_RDMA		0x1
>>> -#define BLS_TO_DSI_RDMA1_TO_DPI1	0x8
>>> -#define BLS_TO_DPI_RDMA1_TO_DSI		0x2
>>> -#define DSI_SEL_IN_BLS			0x0
>>> -#define DPI_SEL_IN_BLS			0x0
>>> -#define DSI_SEL_IN_RDMA			0x1
>>>  
>>>  struct mtk_disp_mutex {
>>>  	int id;
>>> @@ -246,200 +184,6 @@ static const struct mtk_ddp_data mt8173_ddp_driver_data = {
>>>  	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
>>>  };
>>>  
>>> -static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
>>> -				    enum mtk_ddp_comp_id next,
>>> -				    unsigned int *addr)
>>> -{
>>> -	unsigned int value;
>>> -
>>> -	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>>> -		value = OVL0_MOUT_EN_COLOR0;
>>> -	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>>> -		value = OVL_MOUT_EN_RDMA;
>>> -	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>> -		value = OD_MOUT_EN_RDMA0;
>>> -	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>>> -		value = UFOE_MOUT_EN_DSI0;
>>> -	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>>> -		value = OVL1_MOUT_EN_COLOR1;
>>> -	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>>> -		value = GAMMA_MOUT_EN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>> -		value = OD1_MOUT_EN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> -		value = RDMA0_SOUT_DPI0;
>>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> -		value = RDMA0_SOUT_DPI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> -		value = RDMA0_SOUT_DSI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> -		value = RDMA0_SOUT_DSI2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> -		value = RDMA0_SOUT_DSI3;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> -		value = RDMA1_SOUT_DSI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> -		value = RDMA1_SOUT_DSI2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> -		value = RDMA1_SOUT_DSI3;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> -		value = RDMA1_SOUT_DPI0;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> -		value = RDMA1_SOUT_DPI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> -		value = RDMA2_SOUT_DPI0;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> -		value = RDMA2_SOUT_DPI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> -		value = RDMA2_SOUT_DSI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> -		value = RDMA2_SOUT_DSI2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> -		value = RDMA2_SOUT_DSI3;
>>> -	} else {
>>> -		value = 0;
>>> -	}
>>> -
>>> -	return value;
>>> -}
>>> -
>>> -static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
>>> -				   enum mtk_ddp_comp_id next,
>>> -				   unsigned int *addr)
>>> -{
>>> -	unsigned int value;
>>> -
>>> -	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>>> -		value = COLOR0_SEL_IN_OVL0;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> -		value = DPI0_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> -		value = DPI1_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> -		value = DSI0_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> -		value = DSI1_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> -		value = DSI2_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> -		value = DSI3_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> -		value = DPI0_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> -		value = DPI1_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> -		value = DSI0_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> -		value = DSI1_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> -		value = DSI2_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> -		value = DSI3_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>>> -		value = COLOR1_SEL_IN_OVL1;
>>> -	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DSI_SEL;
>>> -		value = DSI_SEL_IN_BLS;
>>> -	} else {
>>> -		value = 0;
>>> -	}
>>> -
>>> -	return value;
>>> -}
>>> -
>>> -static void mtk_ddp_sout_sel(void __iomem *config_regs,
>>> -			     enum mtk_ddp_comp_id cur,
>>> -			     enum mtk_ddp_comp_id next)
>>> -{
>>> -	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>>> -		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
>>> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>>> -	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
>>> -		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
>>> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>>> -		writel_relaxed(DSI_SEL_IN_RDMA,
>>> -			       config_regs + DISP_REG_CONFIG_DSI_SEL);
>>> -		writel_relaxed(DPI_SEL_IN_BLS,
>>> -			       config_regs + DISP_REG_CONFIG_DPI_SEL);
>>> -	}
>>> -}
>>> -
>>> -void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
>>> -			      enum mtk_ddp_comp_id cur,
>>> -			      enum mtk_ddp_comp_id next)
>>> -{
>>> -	unsigned int addr, value, reg;
>>> -
>>> -	value = mtk_ddp_mout_en(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(config_regs + addr) | value;
>>> -		writel_relaxed(reg, config_regs + addr);
>>> -	}
>>> -
>>> -	mtk_ddp_sout_sel(config_regs, cur, next);
>>> -
>>> -	value = mtk_ddp_sel_in(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(config_regs + addr) | value;
>>> -		writel_relaxed(reg, config_regs + addr);
>>> -	}
>>> -}
>>> -
>>> -void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
>>> -				   enum mtk_ddp_comp_id cur,
>>> -				   enum mtk_ddp_comp_id next)
>>> -{
>>> -	unsigned int addr, value, reg;
>>> -
>>> -	value = mtk_ddp_mout_en(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(config_regs + addr) & ~value;
>>> -		writel_relaxed(reg, config_regs + addr);
>>> -	}
>>> -
>>> -	value = mtk_ddp_sel_in(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(config_regs + addr) & ~value;
>>> -		writel_relaxed(reg, config_regs + addr);
>>> -	}
>>> -}
>>> -
>>>  struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
>>>  {
>>>  	struct mtk_ddp *ddp = dev_get_drvdata(dev);
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>>> index 827be424a148..6b691a57be4a 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>>> @@ -12,13 +12,6 @@ struct regmap;
>>>  struct device;
>>>  struct mtk_disp_mutex;
>>>  
>>> -void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
>>> -			      enum mtk_ddp_comp_id cur,
>>> -			      enum mtk_ddp_comp_id next);
>>> -void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
>>> -				   enum mtk_ddp_comp_id cur,
>>> -				   enum mtk_ddp_comp_id next);
>>> -
>>>  struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id);
>>>  int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex);
>>>  void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> index 8e2d3cb62ad5..208f9c5256ef 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> @@ -10,6 +10,7 @@
>>>  #include <linux/of_address.h>
>>>  #include <linux/of_platform.h>
>>>  #include <linux/pm_runtime.h>
>>> +#include <linux/soc/mediatek/mtk-mmsys.h>
>>>  #include <linux/dma-mapping.h>
>>>  
>>>  #include <drm/drm_atomic.h>
>>> @@ -425,7 +426,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>>  {
>>>  	struct device *dev = &pdev->dev;
>>>  	struct mtk_drm_private *private;
>>> -	struct resource *mem;
>>>  	struct device_node *node;
>>>  	struct component_match *match = NULL;
>>>  	int ret;
>>> @@ -436,14 +436,10 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>>  		return -ENOMEM;
>>>  
>>>  	private->data = of_device_get_match_data(dev);
>>> -
>>> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -	private->config_regs = devm_ioremap_resource(dev, mem);
>>> -	if (IS_ERR(private->config_regs)) {
>>> -		ret = PTR_ERR(private->config_regs);
>>> -		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
>>> -			ret);
>>> -		return ret;
>>> +	private->mmsys_dev = dev->parent;
>>> +	if (!private->mmsys_dev) {
>>> +		dev_err(dev, "Failed to get MMSYS device\n");
>>> +		return -ENODEV;
>>>  	}
>>>  
>>>  	/* Iterate over sibling DISP function blocks */
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>>> index 17bc99b9f5d4..b5be63e53176 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>>> @@ -39,7 +39,7 @@ struct mtk_drm_private {
>>>  
>>>  	struct device_node *mutex_node;
>>>  	struct device *mutex_dev;
>>> -	void __iomem *config_regs;
>>> +	struct device *mmsys_dev;
>>>  	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
>>>  	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
>>>  	const struct mtk_mmsys_driver_data *data;
>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>>> index dbdfedd302fa..4b286b525cd3 100644
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -5,8 +5,76 @@
>>>   */
>>>  
>>>  #include <linux/clk-provider.h>
>>> +#include <linux/device.h>
>>>  #include <linux/of_device.h>
>>>  #include <linux/platform_device.h>
>>> +#include <linux/soc/mediatek/mtk-mmsys.h>
>>> +
>>> +#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
>>> +#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"
>>> +
>>> +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
>>> +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
>>> +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
>>> +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
>>> +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
>>> +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
>>> +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
>>> +#define DISP_REG_CONFIG_DSIE_SEL_IN		0x0a4
>>> +#define DISP_REG_CONFIG_DSIO_SEL_IN		0x0a8
>>> +#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
>>> +#define DISP_REG_CONFIG_DISP_RDMA2_SOUT		0x0b8
>>> +#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN	0x0c4
>>> +#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
>>> +#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
>>> +
>>> +#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
>>> +#define DISP_REG_CONFIG_OUT_SEL			0x04c
>>> +#define DISP_REG_CONFIG_DSI_SEL			0x050
>>> +#define DISP_REG_CONFIG_DPI_SEL			0x064
>>> +
>>> +#define OVL0_MOUT_EN_COLOR0			0x1
>>> +#define OD_MOUT_EN_RDMA0			0x1
>>> +#define OD1_MOUT_EN_RDMA1			BIT(16)
>>> +#define UFOE_MOUT_EN_DSI0			0x1
>>> +#define COLOR0_SEL_IN_OVL0			0x1
>>> +#define OVL1_MOUT_EN_COLOR1			0x1
>>> +#define GAMMA_MOUT_EN_RDMA1			0x1
>>> +#define RDMA0_SOUT_DPI0				0x2
>>> +#define RDMA0_SOUT_DPI1				0x3
>>> +#define RDMA0_SOUT_DSI1				0x1
>>> +#define RDMA0_SOUT_DSI2				0x4
>>> +#define RDMA0_SOUT_DSI3				0x5
>>> +#define RDMA1_SOUT_DPI0				0x2
>>> +#define RDMA1_SOUT_DPI1				0x3
>>> +#define RDMA1_SOUT_DSI1				0x1
>>> +#define RDMA1_SOUT_DSI2				0x4
>>> +#define RDMA1_SOUT_DSI3				0x5
>>> +#define RDMA2_SOUT_DPI0				0x2
>>> +#define RDMA2_SOUT_DPI1				0x3
>>> +#define RDMA2_SOUT_DSI1				0x1
>>> +#define RDMA2_SOUT_DSI2				0x4
>>> +#define RDMA2_SOUT_DSI3				0x5
>>> +#define DPI0_SEL_IN_RDMA1			0x1
>>> +#define DPI0_SEL_IN_RDMA2			0x3
>>> +#define DPI1_SEL_IN_RDMA1			(0x1 << 8)
>>> +#define DPI1_SEL_IN_RDMA2			(0x3 << 8)
>>> +#define DSI0_SEL_IN_RDMA1			0x1
>>> +#define DSI0_SEL_IN_RDMA2			0x4
>>> +#define DSI1_SEL_IN_RDMA1			0x1
>>> +#define DSI1_SEL_IN_RDMA2			0x4
>>> +#define DSI2_SEL_IN_RDMA1			(0x1 << 16)
>>> +#define DSI2_SEL_IN_RDMA2			(0x4 << 16)
>>> +#define DSI3_SEL_IN_RDMA1			(0x1 << 16)
>>> +#define DSI3_SEL_IN_RDMA2			(0x4 << 16)
>>> +#define COLOR1_SEL_IN_OVL1			0x1
>>> +
>>> +#define OVL_MOUT_EN_RDMA			0x1
>>> +#define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
>>> +#define BLS_TO_DPI_RDMA1_TO_DSI			0x2
>>> +#define DSI_SEL_IN_BLS				0x0
>>> +#define DPI_SEL_IN_BLS				0x0
>>> +#define DSI_SEL_IN_RDMA				0x1
>>>  
>>>  struct mtk_mmsys_driver_data {
>>>  	const char *clk_driver;
>>> @@ -16,10 +84,221 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>>>  	.clk_driver = "clk-mt8173-mm",
>>>  };
>>>  
>>> +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
>>> +					  enum mtk_ddp_comp_id next,
>>> +					  unsigned int *addr)
>>> +{
>>> +	unsigned int value;
>>> +
>>> +	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>>> +		value = OVL0_MOUT_EN_COLOR0;
>>> +	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>>> +		value = OVL_MOUT_EN_RDMA;
>>> +	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>> +		value = OD_MOUT_EN_RDMA0;
>>> +	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>>> +		value = UFOE_MOUT_EN_DSI0;
>>> +	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>>> +		value = OVL1_MOUT_EN_COLOR1;
>>> +	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>>> +		value = GAMMA_MOUT_EN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>> +		value = OD1_MOUT_EN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		value = RDMA0_SOUT_DPI0;
>>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		value = RDMA0_SOUT_DPI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		value = RDMA0_SOUT_DSI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		value = RDMA0_SOUT_DSI2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		value = RDMA0_SOUT_DSI3;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		value = RDMA1_SOUT_DSI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		value = RDMA1_SOUT_DSI2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		value = RDMA1_SOUT_DSI3;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		value = RDMA1_SOUT_DPI0;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		value = RDMA1_SOUT_DPI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		value = RDMA2_SOUT_DPI0;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		value = RDMA2_SOUT_DPI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		value = RDMA2_SOUT_DSI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		value = RDMA2_SOUT_DSI2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		value = RDMA2_SOUT_DSI3;
>>> +	} else {
>>> +		value = 0;
>>> +	}
>>> +
>>> +	return value;
>>> +}
>>> +
>>> +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
>>> +					 enum mtk_ddp_comp_id next,
>>> +					 unsigned int *addr)
>>> +{
>>> +	unsigned int value;
>>> +
>>> +	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>>> +		value = COLOR0_SEL_IN_OVL0;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		value = DPI0_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		value = DPI1_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
>>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		value = DSI0_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>>> +		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> +		value = DSI1_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		value = DSI2_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>>> +		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> +		value = DSI3_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		value = DPI0_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		value = DPI1_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
>>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		value = DSI0_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>>> +		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> +		value = DSI1_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		value = DSI2_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		value = DSI3_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>>> +		value = COLOR1_SEL_IN_OVL1;
>>> +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>>> +		*addr = DISP_REG_CONFIG_DSI_SEL;
>>> +		value = DSI_SEL_IN_BLS;
>>> +	} else {
>>> +		value = 0;
>>> +	}
>>> +
>>> +	return value;
>>> +}
>>> +
>>> +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
>>> +				   enum mtk_ddp_comp_id cur,
>>> +				   enum mtk_ddp_comp_id next)
>>> +{
>>> +	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>>> +		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
>>> +			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>>> +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
>>> +		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
>>> +			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>>> +		writel_relaxed(DSI_SEL_IN_RDMA,
>>> +			       config_regs + DISP_REG_CONFIG_DSI_SEL);
>>> +		writel_relaxed(DPI_SEL_IN_BLS,
>>> +			       config_regs + DISP_REG_CONFIG_DPI_SEL);
>>> +	}
>>> +}
>>> +
>>> +void mtk_mmsys_ddp_connect(struct device *dev,
>>> +			   enum mtk_ddp_comp_id cur,
>>> +			   enum mtk_ddp_comp_id next)
>>> +{
>>> +	void __iomem *config_regs = dev_get_drvdata(dev);
>>> +	unsigned int addr, value, reg;
>>> +
>>> +	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>>> +	if (value) {
>>> +		reg = readl_relaxed(config_regs + addr) | value;
>>> +		writel_relaxed(reg, config_regs + addr);
>>> +	}
>>> +
>>> +	mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
>>> +
>>> +	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>>> +	if (value) {
>>> +		reg = readl_relaxed(config_regs + addr) | value;
>>> +		writel_relaxed(reg, config_regs + addr);
>>> +	}
>>> +}
>>> +
>>> +void mtk_mmsys_ddp_disconnect(struct device *dev,
>>> +			      enum mtk_ddp_comp_id cur,
>>> +			      enum mtk_ddp_comp_id next)
>>> +{
>>> +	void __iomem *config_regs = dev_get_drvdata(dev);
>>> +	unsigned int addr, value, reg;
>>> +
>>> +	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>>> +	if (value) {
>>> +		reg = readl_relaxed(config_regs + addr) & ~value;
>>> +		writel_relaxed(reg, config_regs + addr);
>>> +	}
>>> +
>>> +	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>>> +	if (value) {
>>> +		reg = readl_relaxed(config_regs + addr) & ~value;
>>> +		writel_relaxed(reg, config_regs + addr);
>>> +	}
>>> +}
>>> +
>>>  static int mtk_mmsys_probe(struct platform_device *pdev)
>>>  {
>>>  	const struct mtk_mmsys_driver_data *data;
>>> +	struct device *dev = &pdev->dev;
>>>  	struct platform_device *clks;
>>> +	void __iomem *config_regs;
>>> +	struct resource *mem;
>>> +	int ret;
>>> +
>>> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	config_regs = devm_ioremap_resource(dev, mem);
>>> +	if (IS_ERR(config_regs)) {
>>> +		ret = PTR_ERR(config_regs);
>>> +		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
>>> +			ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	platform_set_drvdata(pdev, config_regs);
>>>  
>>>  	data = of_device_get_match_data(&pdev->dev);
>>>  
>>> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
>>> new file mode 100644
>>> index 000000000000..7bab5d9a3d31
>>> --- /dev/null
>>> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2015 MediaTek Inc.
>>> + */
>>> +
>>> +#ifndef __MTK_MMSYS_H
>>> +#define __MTK_MMSYS_H
>>> +
>>> +enum mtk_ddp_comp_id;
>>> +struct device;
>>> +
>>> +void mtk_mmsys_ddp_connect(struct device *dev,
>>> +			   enum mtk_ddp_comp_id cur,
>>> +			   enum mtk_ddp_comp_id next);
>>> +
>>> +void mtk_mmsys_ddp_disconnect(struct device *dev,
>>> +			      enum mtk_ddp_comp_id cur,
>>> +			      enum mtk_ddp_comp_id next);
>>> +
>>> +#endif /* __MTK_MMSYS_H */
>>>
> 
