Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7E55AB83E
	for <lists+linux-clk@lfdr.de>; Fri,  2 Sep 2022 20:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiIBSb3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 2 Sep 2022 14:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiIBSbR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Sep 2022 14:31:17 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27523F63D4
        for <linux-clk@vger.kernel.org>; Fri,  2 Sep 2022 11:31:11 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id w5so3313183wrn.12
        for <linux-clk@vger.kernel.org>; Fri, 02 Sep 2022 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=UiGnkmWH9iLnrdhPrU2lDZgR3mZDj/1lVrghpfS4bgc=;
        b=Nz69+sv63l6vAT/d+MeZEexuMUrgEJ61UWVjbKzAJch/Mt4H6DOUcOmfORfFfGTDVI
         v5zBB/pJgK0ndGYjp11XbxRVZw1rCbg7xMqYYP87XQ3V/LM4twIPcmT7Xst90Zc+He+8
         IGDrjE+OuD+G7Bot3CYPEj+cetiAiaQ11nL5OdA2xzvcykzMRqlj78MiGAfsWROYF//R
         fo6eP/zgQoMR8Nc+WFOJU4cKlT5qR71aB8zYwEK+YVRmfzNd68akIEdeQW/hvvClTb5v
         mZyLf3vKP1X+NF72hKAacRjfEnn7vrqgCalQNzQigXEElEovQQJpduLQ2rKBVZgEkz6H
         2qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UiGnkmWH9iLnrdhPrU2lDZgR3mZDj/1lVrghpfS4bgc=;
        b=PKzyIjnrD1xIoIT0sjcY8CgWOTRweQ8jeJK8lmiJJqi7EBr0vYZYN7fJf6D8GxZjnX
         9iZ1NfFALezbxgX5NFVf7uKKKPq3DxKbE8QuLFTnXtJ4fBZ+LxFrsNzWWP0Gnbxv9dZ7
         iICfGu2K+xyDtL+ukxMUgVZOJPoRIaUWZr6ijgbFxCQbHvce6I5SnqOpUqIdkRzEDT1l
         JkgFhrCepHjNmz6bsBgXNi1uezFIv/SIMlXg1VVKgVjQmtMXdPtFGzJcgIUaF/Kwde7S
         N9gkZY4n0qdQBPJ6/YMUG7YX8+mx0c3LorMu54rFnpdOdOvjGEGNHYm2zVA7A6e9jBRf
         QWPg==
X-Gm-Message-State: ACgBeo1PWqjd8lnHfivqiepqQ29CuVD8X0eOgpaASKMRjovjhZtWxJRT
        j+1HcaLxHY+NUpuso4GuCIRZig==
X-Google-Smtp-Source: AA6agR6eS6uSXkalS5S5mkAzDMTgTkYyNru/CqV+NIhwqEG+B0Lv2KKm4WvxlXq2+4qR5ux20YX6YQ==
X-Received: by 2002:a5d:47a6:0:b0:228:473c:b84b with SMTP id 6-20020a5d47a6000000b00228473cb84bmr1957625wrb.556.1662143470250;
        Fri, 02 Sep 2022 11:31:10 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c014a00b003a4efb794d7sm2787122wmm.36.2022.09.02.11.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 11:31:09 -0700 (PDT)
Date:   Fri, 2 Sep 2022 21:31:06 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V3 2/8] clk: imx93: drop of_match_ptr
Message-ID: <YxJL6re6XuCPGlta@linaro.org>
References: <20220830033137.4149542-1-peng.fan@oss.nxp.com>
 <20220830033137.4149542-3-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830033137.4149542-3-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-08-30 11:31:31, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is build warning when CONFIG_OF is not selected.
> >> drivers/clk/imx/clk-imx93.c:324:34: warning: 'imx93_clk_of_match'
> >> defined but not used [-Wunused-const-variable=]
>      324 | static const struct of_device_id imx93_clk_of_match[] = {
>          |                                  ^~~~~~~~~~~~~~~~~~
> 
> The driver only support DT table, no sense to use of_match_ptr.
> 
> Fixes: 24defbe194b6 ("clk: imx: add i.MX93 clk")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Stephen will you pick this patch?

I'll take the rest through my tree.

> ---
>  drivers/clk/imx/clk-imx93.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index f5c9fa40491c..dcc41d178238 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -332,7 +332,7 @@ static struct platform_driver imx93_clk_driver = {
>  	.driver = {
>  		.name = "imx93-ccm",
>  		.suppress_bind_attrs = true,
> -		.of_match_table = of_match_ptr(imx93_clk_of_match),
> +		.of_match_table = imx93_clk_of_match,
>  	},
>  };
>  module_platform_driver(imx93_clk_driver);
> -- 
> 2.37.1
> 
