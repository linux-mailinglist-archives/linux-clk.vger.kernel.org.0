Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC5DD6BC6EF
	for <lists+linux-clk@lfdr.de>; Thu, 16 Mar 2023 08:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjCPHTd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Mar 2023 03:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjCPHTX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 03:19:23 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8465F6DE
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 00:19:12 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w9so3827078edc.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 00:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678951150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bm96tdwLx6fPQGeDjINABDetH/ZY7i77lBQjLJrR1ts=;
        b=lknDG8yZUnixEHyBPesXoiJREWN5L9q5lFvMBm9EJDIKbdAGhkgNdYivDsc4vUhQDD
         8y2W+FyY+fXV3a9MIhsebmNN/Z/QCZvIAw8g7dtZRXX3ZhkZ2e4RQ40HOBjSqx39BetR
         db37n60Az/c8hzlRRM4JzCsJ4dSySNlmMS7VJHt0PyA2U4aobJKcbHV7y6osDRonesgJ
         +0EPdHijgkWkHXIlOLjPPXZwZQ2uVRe+A84j58m1duRUFqEf1ReWf1pNJoK18ONLvUZd
         7UYyNmFLfknWngTkP5/NZfhqWVoyDWJxlLuoy7vEt6SxAcK8HnGSRSJQkuelMVg2EQ+p
         8w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678951150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bm96tdwLx6fPQGeDjINABDetH/ZY7i77lBQjLJrR1ts=;
        b=2CQimAyQfV+FwYfa8CZ1196/McfrN6VlTlLY3DTy6TjwOBgEibCyxWxMgtkH5P9NPw
         EtvcqMPaRdGhYoQ08izVS2nxS1RatuDwQD/gX351BaR2mQpvE4jnrqzpXUP3gwFkkTvS
         0hIP00CO4s3LsaLs3QYN2NIIsrI8cYWvaIE9KjwxLKKE82ut+cPT8pDrWi733D8SetGI
         7eotIvDii+uOunJ4xKMazeG452erkNhrAiW5ro/HaXDrJUAsMNJiaZpmt/gt286pyfDH
         lUHJ9xSiADMq945SU+7l1yKNzd3wrl7vH2jy1+MtJ5+/7gaUh7uTk1q6PubtkgUBot/E
         BQqw==
X-Gm-Message-State: AO0yUKWT/nwfIkX99MYhg7+BakVY+TBWPSv1dNIlryJgKmQv1A0XTsJH
        0LhMg0tMQq4BDYppSQqKVHzsUg==
X-Google-Smtp-Source: AK7set9cPxmxsJC+fDgnp9bdjaIupZwvekzcVHxzUtQcTePr9a9/UyCWNrhIzW+IZivrsS671zcVmg==
X-Received: by 2002:a17:906:4e02:b0:8f7:48fe:319d with SMTP id z2-20020a1709064e0200b008f748fe319dmr1626347eju.17.1678951150203;
        Thu, 16 Mar 2023 00:19:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id r24-20020a50d698000000b004af71e8cc3dsm3387915edi.60.2023.03.16.00.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 00:19:09 -0700 (PDT)
Message-ID: <47fd240a-847b-e034-5a6a-4ed14f453612@linaro.org>
Date:   Thu, 16 Mar 2023 08:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH net-next 04/11] dt-bindings: net: qcom,ethqos: Add
 Qualcomm sc8280xp compatibles
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-5-ahalaney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313165620.128463-5-ahalaney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/03/2023 17:56, Andrew Halaney wrote:
> The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
> Add a compatible for this.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 68ef43fb283d..89c17ed0442f 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -24,6 +24,7 @@ properties:
>      enum:
>        - qcom,qcs404-ethqos
>        - qcom,sm8150-ethqos
> +      - qcom,sc8280xp-ethqos

Alphabetical order, same in other places.


Best regards,
Krzysztof

