Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 893F478AE06
	for <lists+linux-clk@lfdr.de>; Mon, 28 Aug 2023 12:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjH1Ky6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Aug 2023 06:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232344AbjH1Kyi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Aug 2023 06:54:38 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DDD913E
        for <linux-clk@vger.kernel.org>; Mon, 28 Aug 2023 03:54:15 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bcde83ce9fso45743641fa.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Aug 2023 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693220053; x=1693824853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MfwpRXji8Gob8iTzLFPaW1E26id4GY5S7pBe784OZ0o=;
        b=vFHXqcplwjCk4JYLNBAqeluz5wn0kH+IlKhYt0o8vkLKsukIDjWoywBvxaqniiHyEp
         o5V4Z5Wpgqj56jsyMSaKc3irizLrqk9qyfRFX4M7uj4+fBBY1ptiQg18ke9K1gpYtWoh
         3VCnx8A/DjVBHnlB27JtY5kc/+DoQ+9b2a0eetbu6isNgryQoHpstjgo3HJOoChO3tLD
         4h07It4Vj6lSTqgTL/lFAmm0mqPX83iX8MrNP4guhOj8K9vPRYULMj/yPRDavib0jLOZ
         rKasXb/pWEo2pn5s1w+JAQ7ZE/SfQvBY1haMv2qjOc6N6UyjI076VC9d7gqfmrH5uwg/
         AdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693220053; x=1693824853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfwpRXji8Gob8iTzLFPaW1E26id4GY5S7pBe784OZ0o=;
        b=Eor4/lVHtdoqeX0koEeIH0WtvnqOEIp2NZrf6RDwCOFgGcxBriCMRoU35Fv5l6AerU
         MbrGyAAmIVgOId6+QsEpON5VH077fz3yj/B/lj3Fakj6W0DdqUMq7ax1npultqdEFDIc
         D0voowMnNVdN+106dQlzVWHJmSN8qFlQglUAIxdfmU98jZ7OThD01c/FADA/VGl769ud
         2889jR6Z5zsxpNJtuAnrlODv4JMbFBzQj1qdqa5uCg6D4ZB7JNTDz9Rt6C3QdzMNSrwA
         UqaFNDviTS88azMnL+UbpeBQ8pRJGgT1PawOnmvHEMQORRi46Vxun0xy5UV/nm5470DE
         pwqA==
X-Gm-Message-State: AOJu0YzXUI1aT7AgBpQaIa/dcmVRiUGfAVZMWp8OLVYfiuIyNGgWqrJC
        SFi6HkyruVXeUWZi0QzXu66N+Q==
X-Google-Smtp-Source: AGHT+IGEk/z7Kh8gLIlJ3TK7vfHKBVeWGAzy7vtbhbkXvQdJ/xtq62IDKSwK9oTJIo12X3YJL14vcQ==
X-Received: by 2002:a2e:b0d8:0:b0:2bc:f5a0:cc25 with SMTP id g24-20020a2eb0d8000000b002bcf5a0cc25mr6002204ljl.2.1693220052953;
        Mon, 28 Aug 2023 03:54:12 -0700 (PDT)
Received: from [192.168.1.101] (abyl195.neoplus.adsl.tpnet.pl. [83.9.31.195])
        by smtp.gmail.com with ESMTPSA id w16-20020a2e9990000000b002b6d7682050sm1698240lji.89.2023.08.28.03.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 03:54:12 -0700 (PDT)
Message-ID: <3b88827f-9cda-46b3-96ad-d10245afce1e@linaro.org>
Date:   Mon, 28 Aug 2023 12:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/23] ARM: dts: qcom: apq8064: add Krait clock
 controller
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
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
 <20230827115033.935089-16-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230827115033.935089-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27.08.2023 13:50, Dmitry Baryshkov wrote:
> Add device node for the clock controller for the CPU cores and L2
> clocks. It will be further used by the L2 and by the CPUfreq nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index ba7d5ef8de17..a05e64bff07f 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -213,6 +213,32 @@ sleep_clk: sleep_clk {
>  		};
>  	};
>  
> +	kraitcc: clock-controller {
> +		compatible = "qcom,krait-cc-v1";
> +		clocks = <&gcc PLL9>,
> +			 <&gcc PLL10>,
> +			 <&gcc PLL16>,
> +			 <&gcc PLL17>,
> +			 <&gcc PLL12>,
> +			 <&acc0>,
> +			 <&acc1>,
> +			 <&acc2>,
> +			 <&acc3>,
> +			 <&l2cc>;
> +		clock-names = "hfpll0",
> +			      "hfpll1",
> +			      "hfpll2",
> +			      "hfpll3",
> +			      "hfpll_l2",
> +			      "acpu0_aux",
> +			      "acpu1_aux",
> +			      "acpu2_aux",
> +			      "acpu3_aux",
> +			      "acpu_l2_aux";
> +		#clock-cells = <1>;
> +		#interconnect-cells = <1>;
Doesn't only the L2 device register with icc?

Konrad
