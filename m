Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5AA14CB84E
	for <lists+linux-clk@lfdr.de>; Thu,  3 Mar 2022 09:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbiCCIH7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Mar 2022 03:07:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiCCIH7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Mar 2022 03:07:59 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C599216FDFC
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 00:07:13 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so2708856wmp.5
        for <linux-clk@vger.kernel.org>; Thu, 03 Mar 2022 00:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=T4kbvdEkJq7G6CWV0LAt8KL4gr8THBwbvBRsRaY/1QQ=;
        b=M/tb1iQDePqb2cmCw0hU63ea8SHPbgBraIobX1tCakB233EkdlNYqSdYUoLFfOEPTs
         t5ECrCvd788ldBGHa1nJbxRykpHBaD/HEQGExMpiH5o+y6fJHq3HbMDVIDD2xNJEsSzi
         O5hoF7fTiPL9/GC6fZ1CNfQLtjhiMrnIapRJosNBhe8s7P794FZnVdV/Wpl9z2+feW3f
         MgpzrD7p9NfGYUVXfzr5FQDt/Y4OGOwx2Hi50nfkD3tkx0uuzQxuu6NqevUrwDJpMtLW
         E0+pygTamKjNW+kD/MrM+puuyLqXpryxCWyFRdG8bj6+/jHGIPgu5+ITm8onuR1OtlQw
         AwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=T4kbvdEkJq7G6CWV0LAt8KL4gr8THBwbvBRsRaY/1QQ=;
        b=qN9iWkQq1KDCTrGrv3GyknoadiexStL001HNeW/Bw8N7V4smyXEqcBSKIKdb3krLi5
         cpKzPh8UV5VZLjtjjq8DHx/wZiw7uBUx+1lPF21ETFAnQmYr7HiwyJx9xmT+F+GGMR5z
         0OYKUTZJu/WG6O//jOFkPKsBf/74ge1jhFtMiCI6qQbClkfdtK3j4LulDLI8958/1Uov
         xJCGqiFPDqwgLVXfrEA3QjezhlxfLwbnDq3mbwfD/s93aGSwmbU05u5i3Qnh3MmD7TWo
         nSTFJvBVrYhOcPp69m2oiyS3i02GtiaNf3eNP8Pl6NWVQUqUiZiKrj2a+BgQNp1RZ/K7
         eaWw==
X-Gm-Message-State: AOAM531Hy73UpVifFbiAonCHMjP8IAU9K+9qWQkit+E5jVkrDHxld4Ax
        lvlQTdYv71LV0i8ethKLV3AVwA==
X-Google-Smtp-Source: ABdhPJxssSWDTS0arUsVI2AtPzFrsJyLEpnlrXh0+Wuj4W0lgc2VDglTI9bvy0zswsg7KY/31OI4Qw==
X-Received: by 2002:a05:600c:3546:b0:381:7a9d:eee2 with SMTP id i6-20020a05600c354600b003817a9deee2mr2762176wmq.24.1646294832313;
        Thu, 03 Mar 2022 00:07:12 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:37d4:6d61:9015:27a5? ([2001:861:44c0:66c0:37d4:6d61:9015:27a5])
        by smtp.gmail.com with ESMTPSA id p12-20020a5d48cc000000b001e6114938a8sm1244035wrs.56.2022.03.03.00.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 00:07:11 -0800 (PST)
Message-ID: <7d585748-7a41-13ca-60da-20eb4fe78374@baylibre.com>
Date:   Thu, 3 Mar 2022 09:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] clk: Use of_device_get_match_data()
Content-Language: en-US
To:     cgel.zte@gmail.com, mturquette@baylibre.com
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
        linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20220303014856.2059307-1-chi.minghao@zte.com.cn>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220303014856.2059307-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/03/2022 02:48, cgel.zte@gmail.com wrote:
> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> 
> Use of_device_get_match_data() to simplify the code.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> ---
>   drivers/clk/clk-oxnas.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/clk-oxnas.c b/drivers/clk/clk-oxnas.c
> index 78d5ea669fea..cda5e258355b 100644
> --- a/drivers/clk/clk-oxnas.c
> +++ b/drivers/clk/clk-oxnas.c
> @@ -209,15 +209,11 @@ static int oxnas_stdclk_probe(struct platform_device *pdev)
>   {
>   	struct device_node *np = pdev->dev.of_node;
>   	const struct oxnas_stdclk_data *data;
> -	const struct of_device_id *id;
>   	struct regmap *regmap;
>   	int ret;
>   	int i;
>   
> -	id = of_match_device(oxnas_stdclk_dt_ids, &pdev->dev);
> -	if (!id)
> -		return -ENODEV;
> -	data = id->data;
> +	data = of_device_get_match_data(&pdev->dev);
>   
>   	regmap = syscon_node_to_regmap(of_get_parent(np));
>   	if (IS_ERR(regmap)) {


Acked-by: Neil Armstrong <narmstrong@baylibre.com>
