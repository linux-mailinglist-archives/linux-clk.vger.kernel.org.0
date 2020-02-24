Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED5B16ADA5
	for <lists+linux-clk@lfdr.de>; Mon, 24 Feb 2020 18:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgBXRgs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 24 Feb 2020 12:36:48 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:43187 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727259AbgBXRgr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Feb 2020 12:36:47 -0500
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 6HeejhXRRyIme6Heij4c5R; Mon, 24 Feb 2020 18:36:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582565805; bh=+Ut1mFONrMyDQY1g0dvIqwQmUQyccv/MhZXUMWlHI9A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AjPklyf5BwQcNHOgIqII5CgvXvmQ1u4PiNNlUpLpKq2LWeWDdeNN1l4VivqIlBI4D
         K6KO4mKvo4UCrOFYB1ok9plTr5KSKjPk7ZHmg9c/rKZKRTu9dPY6B5NGcwNw+beimV
         pWgzdX/kjeC7+sTVYaHMQpyZ1LwJ3d5VE8PDabba4fxWUbByaPEPGVgNLRDdnQ+r+p
         EwpKgoaSu0/oM7DOXfyB1xSsDRfLCAnOeGx6VoYnLE9HKj8e9rXilQJANYkEnkvm72
         6oSXCjkwZogH4rbFriWzzRqQTTANFEu40AcVxFFq2cjGeZ+KXGaFM8vT5WNRmfRA5C
         DGx8nXNjzAjog==
Subject: Re: [PATCH v7 06/13] media: mtk-mdp: Check return value of of_clk_get
To:     matthias.bgg@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
        mturquette@baylibre.com, sboyd@kernel.org,
        ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com,
        enric.balletbo@collabora.com
Cc:     devicetree@vger.kernel.org, drinkcat@chromium.org,
        frank-w@public-files.de, sean.wang@mediatek.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        wens@csie.org, linux-mediatek@lists.infradead.org,
        rdunlap@infradead.org, hsinyi@chromium.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
 <20200213201953.15268-7-matthias.bgg@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9d39ba53-482e-ba8f-2699-c34540a3dfd0@xs4all.nl>
Date:   Mon, 24 Feb 2020 18:36:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200213201953.15268-7-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPySf1WBmv9/RjqzYz0BQrBmUht4Eva9g0QKaBR+01XPvXf6Dc7Z2L6oIPUgvGSRSBSFLEDzxEqIQxoAIRiayxX34Q+8Lq0cvVinehfGodRFg1Pt8Xtv
 Le3q4kyfX7omNMDWyWR693Q/8hU3nGZTxpH3Epk2cPojh08FWuyHCr6/qXBwne18uXeZI7asrpcnzMAGzsPQA2yzr/d7hlZL8mVQ+hnaSoKLdln3FY/JUB9k
 xVmii4ez/4ZtoMv39s8o+fFV28vxY9ncLBEG3bNtQvh3VL/Z3ycs3bI4Qn+Op/6C2HOB3TPaW6F/+vO2psgJdTTOYe1ipwXXg//ZA6jnDX56kRPljtOk02qA
 5jTh9vPH06cfk/+jgovkB8gSn4L+0Hdkh7FJH9sPX5uShf7q8O/+zIqIohpBeJP0Dh3Yg143bKxhmWyl5N+wrkcrzMlmZIMjtXmXvP5AMtagZCPoK6vwT+9H
 VPhcbhGiWxVEXRZOqZhQQPtNSoOa62oK6lITRcaYj6RQE8Jm2xFQemNaQu2yqTY/LolxXsUH64Lxctk+DjjWhM4kyMBxOh1fIORL3/EChGfXDJdbrszHA5cN
 b0xSiu5x0jHOSj1g0S+8c0amgRey9HMs1nNjeaYJXXetUf5o7fmAZ64Nsc2DLyijHppuILpRCur9KTJZV4T4SbEsHjVkA2DLnVCF8/X8tF4svoUkifM+PfKG
 mZk73l2d94eyjyKBTao45kOB8gGZ7BZmPMJ8XFKxHBS2QO2K1MCpUC2rUo6VGKnnM89eTib/mgSwgdT3nQt1mcWtyBT2P/YiioVSUANAZXnKoHg+YLzKbuIS
 qhnipdRHQHZ0wqpNmjhnctoRWmY53pBb01kK++5Eu2oJiPHB4lq/NH/eGln9wrK1qv7WzwZMGEfLC+KComyvr9J7qbjCfIHakhDRukt3EFvLxHnXN9z5yVh1
 RQRVrrr56dKoFXVcDhNLMDmGz2rz1rLXtFHgbwVfKOM6t2HOa2cCIGLheHUjzsLGubuWsdH4v7QAJWQcpNcFyLTY88X007mEhYDgcB486IsA5xwHjdMfE6it
 +/AEsmalRYePA+Xv27YRGaBkwwcasHLXraWguBJ3YT7FzyE2b4EocUkP+RQ2C+0C0GwBZEs5SdYGudBxmAHZ+n0jARTz4B9QdHuZf+CKyE2QRRsJ3kkQBSY7
 CiymZeJ+kXPXXU2qZugulQEx6TB7dY6owNLKOzmCmFs=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Matthias,

On 2/13/20 9:19 PM, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Check the return value of of_clk_get and print an error
> message if not EPROBE_DEFER.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>

This patch is independent from the remainder of this series, right?
It looks good to me, so is it OK if I merge this in the media subsystem?

Regards,

	Hans

> 
> ---
> 
> Changes in v7:
> - fix check of return value of of_clk_get
> - fix identation
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 0c4788af78dd..58abfbdfb82d 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -110,6 +110,12 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>  
>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		comp->clk[i] = of_clk_get(node, i);
> +		if (IS_ERR(comp->clk[i])) {
> +			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to get clock\n");
> +
> +			return PTR_ERR(comp->clk[i]);
> +		}
>  
>  		/* Only RDMA needs two clocks */
>  		if (comp->type != MTK_MDP_RDMA)
> 

