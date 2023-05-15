Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19676702BC6
	for <lists+linux-clk@lfdr.de>; Mon, 15 May 2023 13:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240919AbjEOLtj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 15 May 2023 07:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241523AbjEOLri (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 07:47:38 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1C73C27
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 04:38:20 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f24ddf514eso10772146e87.0
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 04:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684150694; x=1686742694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B94EAWMCxnjRsfG9Aoezq0coWavG9yclOh4BGcxeBcc=;
        b=ztL9dg+YLd9M7xYFmtYovoUfLqvN7jxg+dxRkN0eVAF6E/GZATYDPVD3JQRE6P/rbC
         VK5k5GLBXxnoy+9dg4mv/KJxQ81Rf+ZTRKXx2nxbHlAkVY0mAuPzK6tffV6pzo+7sFc3
         Ht5z0PSvtvIeOgIgR9eorIQRL7o6bMt92gJOaaYo1/Xwmi3bRO49DnCjVbG4u7QJZvoQ
         zsCMPhMkR7kVbKwm4qiUpAnZXAXpItitSLdaZ91jgmA1QFA7aM4EmGi/LY3iTe2maTLG
         5H3PO4RP1e+Er2bwokLBVLUx4CHiGc5j+frY0Gpj8KQK9NFrbKtVGIPXdNsgSJujjmlb
         emwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150694; x=1686742694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B94EAWMCxnjRsfG9Aoezq0coWavG9yclOh4BGcxeBcc=;
        b=IFunhaGf4eUbvnxm6C0l5wSOvW2xxyd+qm+8THKqTW8aZVwCKnRy7wp5z9TjseOTUQ
         eBT9M4/FuBR3B4dD/CeX3+FQafCqDrAXiwbo74FDJEWUfNwK6STodd9oG8ifvkYrQQif
         +3HiaxTC/pw9K50E41zYlhCIwWnPHMQYVWKsc2iZw93DQt1EvN065aOd2I/mbo7XQsXA
         Z9Btcgg6zwx6QYXSocPMMqVDHlboGxmbiDYCOcJxx3qXUgw0RdfsFW4FkablC1Hmp4mR
         DuRciHND8FB5aIMOkCUh1msCSV+V3A/lduX6IjysLXOhmeLDl6uVFIOlX3Y0NvBCll5h
         o2sw==
X-Gm-Message-State: AC+VfDxip1SbjR4Ac/Dukmb9syKJ8TdF3G9uF47YyjpJEYkTD1Zo6o4c
        yU8itUh8ldmMHidmd95xAR9jqQ==
X-Google-Smtp-Source: ACHHUZ42o3v3m46gPMHThnWw+kJUwMKBvavuc1DP77n61UIo+p+oDH/TYv88aHOjQVq3irP3KsIKMg==
X-Received: by 2002:ac2:5091:0:b0:4f3:7d0e:3684 with SMTP id f17-20020ac25091000000b004f37d0e3684mr1609828lfm.44.1684150694385;
        Mon, 15 May 2023 04:38:14 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004eed8de597csm2533789lfl.32.2023.05.15.04.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 04:38:14 -0700 (PDT)
Message-ID: <ea23f3ae-4790-b633-b9f2-ee37324dbb73@linaro.org>
Date:   Mon, 15 May 2023 13:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 06/10] clk: qcom: gcc-mdm9615: use proper parent for
 pll0_vote clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, stable@kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
 <20230512211727.3445575-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230512211727.3445575-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 12.05.2023 23:17, Dmitry Baryshkov wrote:
> The pll0_vote clock definitely should have pll0 as a parent (instead of
> pll8).
> 
> Fixes: 7792a8d6713c ("clk: mdm9615: Add support for MDM9615 Clock Controllers")
> Cc: stable@kernel.org
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-mdm9615.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
> index fb5c1244fb97..2f921891008d 100644
> --- a/drivers/clk/qcom/gcc-mdm9615.c
> +++ b/drivers/clk/qcom/gcc-mdm9615.c
> @@ -58,7 +58,7 @@ static struct clk_regmap pll0_vote = {
>  	.enable_mask = BIT(0),
>  	.hw.init = &(struct clk_init_data){
>  		.name = "pll0_vote",
> -		.parent_names = (const char *[]){ "pll8" },
> +		.parent_names = (const char *[]){ "pll0" },
>  		.num_parents = 1,
>  		.ops = &clk_pll_vote_ops,
>  	},
