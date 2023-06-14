Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCF9718AB4
	for <lists+linux-clk@lfdr.de>; Wed, 31 May 2023 22:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjEaUDj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 31 May 2023 16:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbjEaUDh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 May 2023 16:03:37 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B258112B
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 13:03:34 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-96f5685f902so937413266b.2
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 13:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685563413; x=1688155413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fl99vrQa7b2aQpHCy7q4IdOcbocEiTGFVhUuly+eb9c=;
        b=Sf2MRXsCD/k/WPslkLQQvOMWhUJMCPc4HZjWuaLtHsf0TaiP7h5XZ+vsNoTLMQ6dbK
         GzSngD98rVi1pIk3rH6u7ZY7UEXxHiQ4ZLjwxzzk9Vv4+Y3BZqgQ/h3IcP++Z363LGwg
         +zdNQb4FCpwCfarTBlHOEXzJSs+OgzAFEIrnl2lmck8YZNCEJb09YVB5Wa2XpaVXQpUT
         YJuhlw3FazZFHyuojrranvgr5tg7UljssSL98OLO7hwWraZ64VpJKQpdXMECI+Ia1awJ
         O8yYsM04Eg23qKslGkj8Gp79yoOVwzURfpldPso1WKXPWyXPCllnsCMOef4y90wq3bFW
         7ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685563413; x=1688155413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl99vrQa7b2aQpHCy7q4IdOcbocEiTGFVhUuly+eb9c=;
        b=jv9+/4S9oqGII26zq/CaguNxMhrtd55DjLk5KCt/CFm6meyZT6So+hZpWvkolYgUQo
         C+UJ5HDuwUpaQZARf150Ato++1xKmRoK8iwsO0w2l6a5nd3kaK/VipVCmPMsO4fCo805
         xfLFGk7G/asBOzwpN0Y/QbmNiYWLRO4dX9OMjAMu63blt5lAlN/sHL9+HeME0u9+tbbq
         M8EfXBhAS5eM1cQpMI9q3Jm1PQbSk7JUu4gvFIpsHrdv75P1enp3xVbwfHNWvJqkbqap
         T1SzZnUa8VTFwJo4Olc3Zrpj0zJJwjummHAZAR7ubbV9fUyZtRUE0OSq39k2r38kbu7U
         hzJQ==
X-Gm-Message-State: AC+VfDwRvoWhek1KAG121u7txy49xGO1JP/8NtrY1jKDUDvZ4KSXqL+g
        2qHo9DMZ84c+mGpqtkL+fPyiig==
X-Google-Smtp-Source: ACHHUZ5J7RVYG334XtIRu16q6ujNR+vWJrs1FB6BJ/BEtNYtF3/KmQR5XmeCjgqouHvbvZGyftYWFw==
X-Received: by 2002:a17:907:7f0d:b0:973:d71f:4029 with SMTP id qf13-20020a1709077f0d00b00973d71f4029mr7653681ejc.2.1685563413165;
        Wed, 31 May 2023 13:03:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id t24-20020a170906179800b00968db60e070sm9434788eje.67.2023.05.31.13.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 13:03:32 -0700 (PDT)
Message-ID: <542a67da-5870-dda0-3604-9367a438e51b@linaro.org>
Date:   Wed, 31 May 2023 22:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sc8280xp: add resets for
 soundwire controllers
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
 <20230525122930.17141-6-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230525122930.17141-6-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/05/2023 14:29, Srinivas Kandagatla wrote:
> Soundwire controllers on sc8280xp needs an explicit reset, add
> support for this.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 6730349e34f4..39be2e89ce05 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
>  #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
> +#include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,sc8280xp.h>
> @@ -2560,6 +2561,8 @@
>  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&rxmacro>;
>  			clock-names = "iface";
> +			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
> +			reset-names = "swr_audio_cgcr";
>  			label = "RX";
>  
>  			qcom,din-ports = <0>;
> @@ -2634,6 +2637,8 @@
>  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&wsamacro>;
>  			clock-names = "iface";
> +			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
> +			reset-names = "swr_audio_cgcr";
>  			label = "WSA";
>  
>  			qcom,din-ports = <2>;
> @@ -2656,6 +2661,14 @@
>  			status = "disabled";
>  		};
>  
> +		lpass_audiocc: clock-controller@32a9000 {
> +			compatible = "qcom,sc8280xp-lpassaudiocc";
> +			reg = <0 0x032a9000 0 0x1000>;
> +			qcom,adsp-pil-mode;

Here and...

> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		swr2: soundwire-controller@3330000 {
>  			compatible = "qcom,soundwire-v1.6.0";
>  			reg = <0 0x03330000 0 0x2000>;
> @@ -2665,6 +2678,8 @@
>  
>  			clocks = <&txmacro>;
>  			clock-names = "iface";
> +			resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
> +			reset-names = "swr_audio_cgcr";
>  			label = "TX";
>  			#sound-dai-cells = <1>;
>  			#address-cells = <2>;
> @@ -2901,6 +2916,14 @@
>  			};
>  		};
>  
> +		lpasscc: clock-controller@33e0000 {
> +			compatible = "qcom,sc8280xp-lpasscc";
> +			reg = <0 0x033e0000 0 0x12000>;
> +			qcom,adsp-pil-mode;

... here - where do you use these properties? Driver ignores them.

AFAIR, these were only for sc7280 where we supported two variants for audio.

Best regards,
Krzysztof

