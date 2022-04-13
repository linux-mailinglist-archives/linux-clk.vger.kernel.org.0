Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 939C94FFF73
	for <lists+linux-clk@lfdr.de>; Wed, 13 Apr 2022 21:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbiDMTkv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 13 Apr 2022 15:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237297AbiDMTkt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Apr 2022 15:40:49 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2687806D
        for <linux-clk@vger.kernel.org>; Wed, 13 Apr 2022 12:38:26 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bi26so5407875lfb.2
        for <linux-clk@vger.kernel.org>; Wed, 13 Apr 2022 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=aR8Rt8hLw+17zDYJV1rJ6/xUaIZhtu0FuyOPh+InD/o=;
        b=trdN68tirmcolGrC4dC+u+t0wN/ATkiu5sg7tX6Tw2r3pbz85nwuaaWJZbt/RE5/1k
         9moJGnLmcxYivWE1y58Iozb1DfQxChlHoYHwORYOWYJh+m7CIK7ivi5LVw8ofyc7jJm3
         8aKmZZ9C5X0Dik7CJ1Qf9TGQrFLjBGYqPTB7IoEqkOrnG1wpuCJH3uq8h4rKAsRnrNM0
         qXuM5MizfA54tYGcaXkppG6/RjMDf74pfCPISRg9CXQ8B9WcftlWGL9YnKAL6fHx6BuJ
         UW6UznVtLP/gsp2lf9LFHF48LxHS1b0i7mQ8sp/QZ7iLHrE6Tp470hirkqqR27ikVunH
         VGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aR8Rt8hLw+17zDYJV1rJ6/xUaIZhtu0FuyOPh+InD/o=;
        b=Zll2OUTrAO/4+l+EwdlyCT7iKxWoBtby3MiSGc4c9+tze7wrOD3PH6LsmEUgpp1m2f
         QRNT7OwK8dT3gqunSM1uIDRkzB/xoWY0DjVOfON6t5hH+D2Z30Xy+KeiQYHF60xaKXe0
         4aR4xg646ShquoudJ3clwQSnvcey54QOzpcfgN1AVDlSUu7YDufYrVcR+IghgVDO+3PU
         zu6Jj4+rWyEYJteAmJuAwgtJmz+bsg4stah5dJyr5EmYINtELNw1a0c7KZG8nKLyaoTG
         he6/MzcJinNsbTqhI4TrMRGK/b9aTCQJ1CFD3OtQXjSIavJYn2e/kWtEog9g6i7JfyYc
         gb8g==
X-Gm-Message-State: AOAM530lesH8vBAzdV0gbqPDGXIXkdNj8UrxVgTqvIjqNsYm49CsTu5r
        S3KLUCmiKYxRDNpW4HF+KOsn2Q==
X-Google-Smtp-Source: ABdhPJzSU2SSXNjOZgIvsmcbrN8kworxnQzyaMmffS3HqmF+SaG2rwRHKKmcwqblMG5pCq5pVCWPIw==
X-Received: by 2002:a05:6512:13a9:b0:448:9dd3:b84 with SMTP id p41-20020a05651213a900b004489dd30b84mr29223347lfa.556.1649878705175;
        Wed, 13 Apr 2022 12:38:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bq8-20020a056512150800b00448ab58bd53sm4245625lfb.40.2022.04.13.12.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 12:38:24 -0700 (PDT)
Message-ID: <a280732a-93c1-5d5e-07dd-7bd8790ec546@linaro.org>
Date:   Wed, 13 Apr 2022 22:38:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 05/18] clk: qcom: kpss-xcc: convert to parent data API
Content-Language: en-GB
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20220321231548.14276-1-ansuelsmth@gmail.com>
 <20220321231548.14276-6-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220321231548.14276-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/03/2022 02:15, Ansuel Smith wrote:
> Convert the driver to parent data API. From the Documentation pll8_vote
> and pxo should be declared in the DTS so fw_name can be used instead of
> parent_names. Name is still used to save regression on old definition.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>   drivers/clk/qcom/kpss-xcc.c | 25 ++++++++-----------------
>   1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/qcom/kpss-xcc.c b/drivers/clk/qcom/kpss-xcc.c
> index 4fec1f9142b8..347f70e9f5fe 100644
> --- a/drivers/clk/qcom/kpss-xcc.c
> +++ b/drivers/clk/qcom/kpss-xcc.c
> @@ -12,9 +12,9 @@
>   #include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   
> -static const char *aux_parents[] = {
> -	"pll8_vote",
> -	"pxo",
> +static const struct clk_parent_data aux_parents[] = {
> +	{ .name = "pll8_vote", .fw_name = "pll8_vote" },

I'd just use "pll" here for the .fw_name.

> +	{ .name = "pxo", .fw_name = "pxo" },
>   };
>   
>   static unsigned int aux_parent_map[] = {
> @@ -32,8 +32,8 @@ MODULE_DEVICE_TABLE(of, kpss_xcc_match_table);
>   static int kpss_xcc_driver_probe(struct platform_device *pdev)
>   {
>   	const struct of_device_id *id;
> -	struct clk *clk;
>   	void __iomem *base;
> +	struct clk_hw *hw;
>   	const char *name;
>   
>   	id = of_match_device(kpss_xcc_match_table, &pdev->dev);
> @@ -55,24 +55,15 @@ static int kpss_xcc_driver_probe(struct platform_device *pdev)
>   		base += 0x28;
>   	}
>   
> -	clk = clk_register_mux_table(&pdev->dev, name, aux_parents,
> -				     ARRAY_SIZE(aux_parents), 0, base, 0, 0x3,
> -				     0, aux_parent_map, NULL);
> +	hw = __devm_clk_hw_register_mux(&pdev->dev, NULL, name, ARRAY_SIZE(aux_parents),
> +					NULL, NULL, aux_parents, 0, base, 0, 0x3,
> +					0, aux_parent_map, NULL);
>   
> -	platform_set_drvdata(pdev, clk);
> -
> -	return PTR_ERR_OR_ZERO(clk);
> -}
> -
> -static int kpss_xcc_driver_remove(struct platform_device *pdev)
> -{
> -	clk_unregister_mux(platform_get_drvdata(pdev));
> -	return 0;
> +	return PTR_ERR_OR_ZERO(hw);
>   }
>   
>   static struct platform_driver kpss_xcc_driver = {
>   	.probe = kpss_xcc_driver_probe,
> -	.remove = kpss_xcc_driver_remove,
>   	.driver = {
>   		.name = "kpss-xcc",
>   		.of_match_table = kpss_xcc_match_table,


-- 
With best wishes
Dmitry
