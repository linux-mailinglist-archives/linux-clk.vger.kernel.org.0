Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A575E745AFD
	for <lists+linux-clk@lfdr.de>; Mon,  3 Jul 2023 13:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjGCL0L (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 3 Jul 2023 07:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjGCL0L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Jul 2023 07:26:11 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B72F2
        for <linux-clk@vger.kernel.org>; Mon,  3 Jul 2023 04:26:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso6664061e87.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Jul 2023 04:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688383567; x=1690975567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQTFV6r4j+x639oD+2FlqfKL/09PTIN4u4gmuje5iTs=;
        b=iXwviK7jhAWek4Ai/X07M2TFUfVdd1qmtR3VUG/29f+EC+oq2Ji3aDydxnUlnmG01L
         aIazF0ik6Q2jkFNi7OxtnsQKujLx6DoKcSaKuTXRhT8CR+hQ141lHpxjniPxLCBzdT6f
         /VEG+421U195obbW6u2ERAXGOvPqTVqZ27bqX3mXSHUjX2q16WLX5uvD2DxfO1v1GVkl
         6rbhiJt+J0kn9acP/Y6N46FXWWKdV4J+Ygu0zJC1v7laAIeJwpbhvvMMhBHVjDefMfJk
         5WuB1bCol8LisLNZOVI7sEa967t+f4GUNrRdu5hjzwxjBrVDDb2sIUrbbSAKFH8joPCs
         8VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688383567; x=1690975567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQTFV6r4j+x639oD+2FlqfKL/09PTIN4u4gmuje5iTs=;
        b=WXtiObW55g1s5YQ0AZDssONO1AfzPDcWE0NU3m4i6IAeVZRpfWPmCXcVbEsUwXmGTW
         tWoQwK6ZT7KPmQUUZWYwJn2LDfFPDPkMwXm5kcZtRVWZh16HeTVNvZ+HpSUDJgLFtOiS
         agdTqBM/YkIDrow+LQuvt89hfqFwluEwDEey64TCabcqszbWzOZvx5SS3eGVOp0iolWG
         MTlgm3uTSMVLsyJXEwLFN6LWUSZayqsyCMjVQaNiWyMUjKtIjEgC60vgMvYBaUjBBsuG
         MppY3TpiGE5uYA0FLOrHSd0OCROAVQoJn6qXrK0AX1ES31Ha9oYPks46igHO2DbsbF8k
         C03A==
X-Gm-Message-State: ABy/qLZYZRJwgOoxQPuxf1SVm0Pz6c6vR/x4iGzaOY7NlC+rJ3k+RylU
        pgalmYoerMxDjT3KDTcUXgaqSg==
X-Google-Smtp-Source: APBJJlH4oQklgW8vYjv+nWVr/nja1wPyxwG4kR5hTwuMC258dg5IMKUVeWl3HJqfDSvo/YNzOUQYcA==
X-Received: by 2002:a05:6512:3086:b0:4f9:547c:a3cc with SMTP id z6-20020a056512308600b004f9547ca3ccmr7412216lfd.14.1688383567367;
        Mon, 03 Jul 2023 04:26:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id t5-20020a19ad05000000b004fb9fe34c27sm2250219lfc.92.2023.07.03.04.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:26:07 -0700 (PDT)
Message-ID: <4f3afe9c-671b-bdec-51ce-1a147ceae9c3@linaro.org>
Date:   Mon, 3 Jul 2023 13:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/28] ARM: dts: qcom: apq8064-cm-qs600: constraint
 cpufreq regulators
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
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
 <20230702174246.121656-16-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702174246.121656-16-dmitry.baryshkov@linaro.org>
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

On 2.07.2023 19:42, Dmitry Baryshkov wrote:
> Add additional constraints to the CPUfreq-related regulators, it is
> better be safe than sorry there.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts    | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> index 6472277d1c6d..ee0090e03fb3 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> @@ -106,8 +106,8 @@ pm8921_s1: s1 {
>  		};
>  
>  		pm8921_s3: s3 {
> -			regulator-min-microvolt = <1000000>;
> -			regulator-max-microvolt = <1400000>;
> +			regulator-min-microvolt = <950000>;
> +			regulator-max-microvolt = <1150000>;
>  			qcom,switch-mode-frequency = <4800000>;
>  		};
>  
> @@ -147,9 +147,23 @@ pm8921_l23: l23 {
>  			bias-pull-down;
>  		};
>  
> +		pm8921_l24: l24 {
> +			regulator-min-microvolt = <1050000>;
> +			regulator-max-microvolt = <1150000>;
> +			bias-pull-down;
> +		};
> +
>  		pm8921_lvs6: lvs6 {
>  			bias-pull-down;
>  		};
> +
> +		/* HFPLL regulator */
> +		pm8921_lvs7: lvs7 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +		};
>  	};
>  };
>  
