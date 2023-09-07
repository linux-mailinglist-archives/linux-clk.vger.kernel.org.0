Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDDA797675
	for <lists+linux-clk@lfdr.de>; Thu,  7 Sep 2023 18:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237951AbjIGQKO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 7 Sep 2023 12:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233772AbjIGQJ6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 12:09:58 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D3A5FF5
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 09:04:42 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso12197985e9.2
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694102595; x=1694707395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cqyTbMBftf/joQMRKfMkLzU0Opm2y7wHA3eqP28zpI=;
        b=zkJpr4KErUv2fhKIQ5yQDOoooP4JqGXTfZLs+zW3aYITiUbcG23xpvN6Nfkfg2/gux
         O4NpkrGu2mr/uXz40A2b+/2fP5B4vnVBlcxlYcG0IMOd/rOtJzM+DxoiNVgx9mllZ8CG
         bXhfjl3JloTqhXwKfJbPc3sWaZP957XiqWhyuxKcTsOX30LoJC0bofNH8vTrq4p0cAHg
         SyriTeMmE3y8ISJvkMg4BHxEpRojGBXttr03CQXi6X94VplP9Ob12hdJpSry9OJhCeV9
         OhXq3hfvnvQpMWYhmVLiqBcDaXcGIJuMyMv8ca+MrivcbLHwrF0ucmA51AjMhukiqOHr
         3WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694102595; x=1694707395;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cqyTbMBftf/joQMRKfMkLzU0Opm2y7wHA3eqP28zpI=;
        b=S2d2IF/B9jU6eU/r/pR6V8nEvK4MZRfAlwuTg/d9+WLfJ+8a/+lstcrv30WqbuEaAm
         ZoJF3D2zax6u5k1nzXjV/o1ZrdUquhdp90XjeVf7DT1cFyI23pzM0gNIzRI3AkLKtUMe
         LcsU8gRTPapxYS8a7/daJIKf9OFVN3tMvi38WBC1FNJ1bVx7D/8P8OxXWt9pY6xAB3EQ
         AeWdq2tA9kuQM8cEsD0qKBWp6UaXmFy8baeuYzb/e/XPZbkC49ASJr/jPfrFdLgxsmAQ
         qYSKUE92Iq4Uvu1+MXTyVeQaZgf+pJe8Ph190jzOJ/Xt0m6hRJiJ43t9AdDYOdkKRCev
         wnjA==
X-Gm-Message-State: AOJu0YwLkyiesQmKNHBS/dqt9q+Cpw5n/adLvwUwOnn8JPa5uLZqf+E2
        SXJoYvE7x9WP/VXmGBchJ4XyzJa65iLMZWI+IoJPXg==
X-Google-Smtp-Source: AGHT+IElMhH6SZyz3Q6I00GiHi9+hHjfTot2J8HBhVaHsG4aeOjUaubp+sXD76/MBLaMZ8727VrnoQ==
X-Received: by 2002:a17:906:73ce:b0:9a1:edb0:2a8c with SMTP id n14-20020a17090673ce00b009a1edb02a8cmr3878447ejl.39.1694075088243;
        Thu, 07 Sep 2023 01:24:48 -0700 (PDT)
Received: from [192.168.37.232] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id lu7-20020a170906fac700b00992e14af9b9sm9949024ejb.134.2023.09.07.01.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 01:24:47 -0700 (PDT)
Message-ID: <4f51bd22-0f7d-4e94-8d84-98091fc2dd53@linaro.org>
Date:   Thu, 7 Sep 2023 10:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] clk: qcom: clk-alpha-pll: introduce stromer plus
 ops
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1693996662.git.quic_varada@quicinc.com>
 <18a3bc0c5b371deec5c4bbe6ceacf8afcf0bc640.1693996662.git.quic_varada@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <18a3bc0c5b371deec5c4bbe6ceacf8afcf0bc640.1693996662.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 7.09.2023 07:21, Varadarajan Narayanan wrote:
> Stromer plus APSS PLL does not support dynamic frequency scaling.
> To switch between frequencies, we have to shut down the PLL,
> configure the L and ALPHA values and turn on again. So introduce the
> separate set of ops for Stromer Plus PLL.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
[...]

> +
> +	/* Wait five micro seconds or more */
> +	udelay(5);
> +	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_RESET_N,
> +			   PLL_RESET_N);
> +
> +	/* The lock time should be less than 50 micro seconds worst case */
> +	udelay(50);
https://www.kernel.org/doc/Documentation/timers/timers-howto.txt

> +
> +	ret = wait_for_pll_enable_lock(pll);
> +	if (ret) {
> +		pr_err("alpha pll running in 800 MHz with source GPLL0\n");
> +		return ret;
> +	}
Would that not be SoC-specific information?

Konrad
