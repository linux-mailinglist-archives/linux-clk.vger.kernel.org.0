Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997A573E170
	for <lists+linux-clk@lfdr.de>; Mon, 26 Jun 2023 16:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbjFZOC5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 26 Jun 2023 10:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbjFZOCz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 10:02:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30A410C4
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 07:02:53 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f8777caaa1so4444709e87.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687788172; x=1690380172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=noKXMZsJ4wZ+kGx4ZDC6Xe3m1bRKMQSKnvqp4ma8fcc=;
        b=qI04KqgDRm4/E+h4+knnTf67K0wrKLrsseKlMFiue3Pm1qDrPIOxZtotAAXNiKZssj
         wxWK2lmL/lyyrmeR+vY0hAmFAB4M8Gargk6awRMWRvditMHF1fbQqeoONXPLND/3/xLH
         Evmg4n045B2AotiUFGq3qFYzKMYANPaccGiK5BuFjCvtj1kK//WD+3ISpJ+3GkHfO/Ys
         CfE/iAcQ+FHz4bdEhVIm+qclRElKVUgWe9Uc62BX+MTFVFugpAhm+mG0+2SlxWJL9GX6
         3BV+pf2HkknogyKjvows1x8hSjXpjmQUoF2zlmhMdhuQfWTAYfmylHkRnelGtA+vLfqs
         rprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687788172; x=1690380172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noKXMZsJ4wZ+kGx4ZDC6Xe3m1bRKMQSKnvqp4ma8fcc=;
        b=ZCYcD6R2aN5c+6wfHPyguoueqJW4oCNcZGE6oCQklKj+LsdbFboc6dlpowz0/4s3Uv
         Zhb5bY/gBJzkq5sZgJQaKvkV8iHfTWpmgCeAv8LS083gTCfBwgHc+Tw33O8/6TN9Fxyj
         +XQhOJnmU8ZILflgwjDL7lQMUcnEyfw0vwrpbPzhl/hAJLjxVX+MeEXwN94SKEnQPk8K
         PnA4ZVAUCpPAUKWj7ttZ+27gNWODL6LKklIbcWkA0Nz7dUP3+mZDOycFlyylgQLW08T0
         zErUYyOYnZbnPTFgaOABwWO0HL5knQHBO31rTsm40uUxhMLzMLP8JzcR4Z2zGZIJRDCz
         X+1Q==
X-Gm-Message-State: AC+VfDxVR5WaIAaxZbGHZYyAy+8mrgsRvtfwRM2/ZhqvVlKB/17LyPNU
        fgq9YrKY3uAArNouEVkzLEL8MQ==
X-Google-Smtp-Source: ACHHUZ7DbbnQicwpujOwKpLNNPrYfyRr4WEV+95gpUv1MbfQf4VAb/Tb7fIfyXBpF/PbNU8xLmR5wg==
X-Received: by 2002:ac2:465b:0:b0:4f8:692c:74cd with SMTP id s27-20020ac2465b000000b004f8692c74cdmr13999319lfo.22.1687788172084;
        Mon, 26 Jun 2023 07:02:52 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id w15-20020a05651204cf00b004f64fddc5f9sm1125500lfq.112.2023.06.26.07.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 07:02:51 -0700 (PDT)
Message-ID: <8716ac05-014c-6660-7b81-368fc18754da@linaro.org>
Date:   Mon, 26 Jun 2023 16:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 24/26] ARM: dts: qcom: msm8974: drop 'regulator'
 property from SAW2 device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-25-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625202547.174647-25-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25.06.2023 22:25, Dmitry Baryshkov wrote:
> The SAW2 device should describe the regulator constraints rather than
> just declaring that it has the regulator.
> 
> Drop the 'regulator' property. If/when CPU voltage scaling is
> implemented for this platform, proper regulator node show be added
> instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> index aeca504918a0..dffab32c757d 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -416,7 +416,6 @@ saw3: power-controller@f90b9000 {
>  		saw_l2: power-controller@f9012000 {
>  			compatible = "qcom,saw2";
>  			reg = <0xf9012000 0x1000>;
> -			regulator;
>  		};
>  
>  		acc0: power-manager@f9088000 {
