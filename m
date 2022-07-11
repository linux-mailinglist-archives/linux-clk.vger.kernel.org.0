Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20859570080
	for <lists+linux-clk@lfdr.de>; Mon, 11 Jul 2022 13:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiGKL22 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 11 Jul 2022 07:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiGKL1s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 07:27:48 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA22C03
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 04:06:30 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id bx13so5766950ljb.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=ShcHvaYzrSCb0r8mNkppt/5w+x7vmLFW+WTx8wVnhQ0=;
        b=BvTPfYUYb/eMVFUbstYpcIcvr+yw+G8nfhpzi9NIfe0kSFO3fQE9MCo7iHYkR3SMSf
         6XRthFOxKALpu6jFCOpgfu0IW+UFrZ4LzpHS+bqzMwFbzZpXXnnWLg4WfouX22pDUmT7
         0nNtuUFkU9dnylZZLKoQbQ0sHYoAk2lx8mupKxt/UEptVaf9kBkrqBHUZqEEcwMdgk8v
         9C5rEUeAIhQcQDpE6o8GoECNfN9lXb7nEvc7t/8CgUDWjX4cyStIAliTZAcLID3LH6pr
         6VLKf7l6nSvkMIuGMPUCDfP2+aanTjaFO4FzviYJQDQIhYcG4yZ2ARyVxzsqICYUVMEX
         jMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ShcHvaYzrSCb0r8mNkppt/5w+x7vmLFW+WTx8wVnhQ0=;
        b=hWNXHbt3jMdVH0AsMk70DD6a/Cm/wTic/e0IX26E82bCf6iM95dtTBc8bfpviGqehG
         mTWtsSbk4SXyv6E9T0R6cx28ov1xrdj+39aS0aFJDRwyT6B8JH0lHR5Kf5ZXchotaq9r
         IUQV3kqdM1P+jFbY2ZHjDQhxsR7yUyHUNvj9e+sFLe5kUoWJUxFUo+LK3zyxc24/5urX
         m9gYI4o5zrvvw8/gnbxvzatp0tx91eISx3xfbovu7k9d13Na8RJCGrGfm50dmnC3oEMr
         rKu+EVT8t7zY1rxwze7CLLdI+Q3zC47ffPk79izvwcpFdfDe5rDzjHvbkJ2zMETJfGIa
         Mklw==
X-Gm-Message-State: AJIora9Ij2yCvqLkHKOtkGEectKF5eWQBPiMukQ6epvHZi7dqnx8Ox67
        Q/ZIkpCswxK+/dLlxOwQrpnHEQ==
X-Google-Smtp-Source: AGRyM1v5zU+UHoE16m3GejzRdZt8+tkN+Sb1qi2hxjIofCH753ni3v024SbWFXJXw7LM7xl+Q+lfxg==
X-Received: by 2002:a2e:aaa5:0:b0:25d:5a53:d143 with SMTP id bj37-20020a2eaaa5000000b0025d5a53d143mr8695710ljb.401.1657537588785;
        Mon, 11 Jul 2022 04:06:28 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id q26-20020ac2515a000000b004797b92f4cdsm1481843lfd.91.2022.07.11.04.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:06:28 -0700 (PDT)
Message-ID: <c9e03add-5e0f-9130-9a85-5b1b77c971b4@linaro.org>
Date:   Mon, 11 Jul 2022 13:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] clk: qcom: apss-ipq-pll: add support for IPQ8074
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, bjorn.andersson@linaro.org,
        agross@kernel.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sivaprak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220711104719.40939-1-robimarko@gmail.com>
 <20220711104719.40939-6-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711104719.40939-6-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/07/2022 12:47, Robert Marko wrote:
> Add support for IPQ8074 since it uses the same PLL setup, however it does
> not require the Alpha PLL to be reconfigured.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> index bef7899ad0d6..acfb3ec4f142 100644
> --- a/drivers/clk/qcom/apss-ipq-pll.c
> +++ b/drivers/clk/qcom/apss-ipq-pll.c
> @@ -55,6 +55,7 @@ static const struct regmap_config ipq_pll_regmap_config = {
>  static int apss_ipq_pll_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
>  	struct regmap *regmap;
>  	void __iomem *base;
>  	int ret;
> @@ -67,7 +68,8 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> -	clk_alpha_pll_configure(&ipq_pll, regmap, &ipq_pll_config);
> +	if (of_device_is_compatible(node, "qcom,ipq6018-a53pll"))

Use match data instead with quirks. Better not to encode compatibles all
through the code.

Best regards,
Krzysztof
