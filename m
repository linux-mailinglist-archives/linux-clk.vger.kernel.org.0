Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6019437F4F3
	for <lists+linux-clk@lfdr.de>; Thu, 13 May 2021 11:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbhEMJmr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 May 2021 05:42:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:47094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232353AbhEMJma (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 May 2021 05:42:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 715B861285;
        Thu, 13 May 2021 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620898880;
        bh=5REy0cBkp2rSOWKa8qbir57z+YBnFCooUTiOwGD5oCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GElZOuF1/N35y4cmpxHVtdnKHX0/5E1SLFc67kCL9TvRpwvOMiuoYxhJ1hvl3iMTO
         cAWfCFHhTEO1AxmDfcW2L/QTfEPh1y3Kv0YLYeEkORfau2XFEHRL/bVQY3YxInPbBe
         K43YxKW9m10NtGofcIzWs5noSkXgBaBM2aYzn2s9q85S/BBRyJYgwFbWMF5gRjoNcH
         DErVLFit3vcwStOMsHXMTiJj3ZSkmAZ6Wj4chtRWQ06T5qzxs9yRy1ifiRVI+EokUS
         ojl1RjkAjlreTHmVTrOVqCs4LgNgeoZwpL3Cy3Mwft/xy2Zx59jg9lptX/Wd2Srxw1
         2RJ/Tm+oz0R8g==
Date:   Thu, 13 May 2021 12:41:15 +0300
From:   Abel Vesa <abelvesa@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     shawnguo@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com,
        s.hauer@pengutronix.de, sboyd@kernel.org, festevam@gmail.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH v2 2/2] clk: imx: Remove the audio ipg clock from imx8mp
Message-ID: <YJz0O5Du/A3Cmi2r@ryzen.lan>
References: <20210420055453.1235297-1-ping.bai@nxp.com>
 <20210420055453.1235297-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420055453.1235297-2-ping.bai@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-04-20 13:54:53, Jacky Bai wrote:
> There is no audio ipg clock on i.MX8MP, so remove this from
> the clock driver.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied, thanks.

> ---
> - changes v2:
>   keep the clock binding define no changes to fix the cross tree
>   dependency with dts.
> ---
>  drivers/clk/imx/clk-imx8mp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index e39c9c907c38..12837304545d 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -556,7 +556,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
>  
>  	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
> -	hws[IMX8MP_CLK_IPG_AUDIO_ROOT] = imx_clk_hw_divider2("ipg_audio_root", "audio_ahb", ccm_base + 0x9180, 0, 1);
>  
>  	hws[IMX8MP_CLK_DRAM_ALT] = imx8m_clk_hw_composite("dram_alt", imx8mp_dram_alt_sels, ccm_base + 0xa000);
>  	hws[IMX8MP_CLK_DRAM_APB] = imx8m_clk_hw_composite_critical("dram_apb", imx8mp_dram_apb_sels, ccm_base + 0xa080);
> -- 
> 2.26.2
> 
