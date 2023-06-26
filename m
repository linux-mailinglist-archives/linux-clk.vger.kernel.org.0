Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4A273E174
	for <lists+linux-clk@lfdr.de>; Mon, 26 Jun 2023 16:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjFZODD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 26 Jun 2023 10:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbjFZODD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 10:03:03 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5EE10F
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 07:03:01 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b69a48368fso23491291fa.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687788179; x=1690380179;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSpwDp6TEFx0GvICUxE5SdgTSUU//kFziHNYp14rSlI=;
        b=Io+thId4OmF25Eu76Cxr6FBxmgqofA47twPByDQV5fYfGsylWq6PqY9Mg/etYyMB+8
         9PZ9o2p6Ir8wN6yFldpmEQJZhhy3/GouH4TmyUC/Yq8wSqfdINwCxuSDFlRJIPuhKMlr
         ZVFrkgPFfXI08J7KRX9XdSpFibiZeQB1d1T+UIm1CwFVL4rNRscSLCrk5Zg+l76GVKfQ
         FfzqVItEjsr1TfeKBKyNLcSbjW7KOk5P+wC43miC6Z2u25Y+lMVF9SS+MuGMoQw1s1Pw
         mtdogr6vcR/TKXjCqVCTF7KVJDl9nxgLv61CkjFSSuymx5WqcI+2B4qO8H/gmmIsJp5p
         Y/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687788179; x=1690380179;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSpwDp6TEFx0GvICUxE5SdgTSUU//kFziHNYp14rSlI=;
        b=MQvSnf+MH05LzH1HOJwc2ZWJHSWkjkXekaYvAGnZCyvpfuXkKVOXG87WFoo9LYeA3u
         COkv12Z14abATGsLFcBYD5Sdv2ILRMlahgoZlmul/cqm3CewEw5OqyuJQZ2K88Bm2yAY
         KzAfOz+yIgP+X6J5Htm/+LNVY1J9M/9b9dUIq8dKIOf0yMgv/5UHmTYpFgKQVlWoHdno
         wO2XRqFVPdTqydjEOutf6SsiuVoOnfKVDsQU7Wegx1IfDq41ee0mm2sgq6Kcyf3+e9R/
         AqhUeVgBAdBz4wfPf244kViKUU859KDME43NeXs7HhUAWZTnkoA5xtqpmrm+Z7CrRpiW
         GDsw==
X-Gm-Message-State: AC+VfDw83fT+jnBEvesXc4S0ph7yuQ5lfZ+bPPrCz+a1FiaeAcIfjkIo
        VHcstoyuAeMb3aywuoMRgQh0dX7+gU+MYOgKH/k=
X-Google-Smtp-Source: ACHHUZ4Wn+USIuf04414GFQQMpMdskd+PlSbHMfI4Z77OsSVcS+EAjkxaIEGnCzufmUkMkqYLB5/VA==
X-Received: by 2002:a2e:9205:0:b0:2b6:9f95:46d3 with SMTP id k5-20020a2e9205000000b002b69f9546d3mr2211284ljg.9.1687788179526;
        Mon, 26 Jun 2023 07:02:59 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id s19-20020a2e2c13000000b002b482823f73sm1243074ljs.11.2023.06.26.07.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 07:02:58 -0700 (PDT)
Message-ID: <d34679d0-169f-9037-17e2-b0850e1bf56d@linaro.org>
Date:   Mon, 26 Jun 2023 16:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 23/26] ARM: dts: qcom: apq8084: drop 'regulator'
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
 <20230625202547.174647-24-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625202547.174647-24-dmitry.baryshkov@linaro.org>
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
>  arch/arm/boot/dts/qcom/qcom-apq8084.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
> index 8f178bc87e1d..6a2ff30a2f3c 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
> @@ -652,7 +652,6 @@ saw3: power-controller@f90b9000 {
>  		saw_l2: power-controller@f9012000 {
>  			compatible = "qcom,saw2";
>  			reg = <0xf9012000 0x1000>;
> -			regulator;
>  		};
>  
>  		acc0: power-manager@f9088000 {
