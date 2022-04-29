Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C62514F9F
	for <lists+linux-clk@lfdr.de>; Fri, 29 Apr 2022 17:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378549AbiD2PkE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 29 Apr 2022 11:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376353AbiD2PkD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Apr 2022 11:40:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1BFD5EBE
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 08:36:43 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id w19so14706895lfu.11
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0/swxt/MBj9zmJL12zzZjYDuvVM8H+g/a3BhPywR37Y=;
        b=S3dGCbmJOBJbgAOxTMDYUNLbaogfdKlAKGKljXzmQ0IfXN1EL+2J7Pi/t//WgNxRh3
         XWyPl2DpoM0vUxU1Y3qzGbuTOnwCr2BrLa/+Y1WgUwPF6pMlEHQfWLDFCpbbBu7ATN/F
         eorBJ3aUPRYAI4n2TJED2k97m2xT9qDQ/ruEDnM7977UiCHngTEgBpXnUPFbOX7Ip3IN
         8v3+cKIQ7y+xOtJZKhtgcMUPxJ/A48OXREgeS2daexUv/su2/1Kp1dCalNcCBR8wQNjl
         Vnbwerl7q3BTZcLpCt+1oBb8KhE2GIBPlG5RFY3dgiChXFDLJPA8dJqD+XXDqlCX26eQ
         jS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0/swxt/MBj9zmJL12zzZjYDuvVM8H+g/a3BhPywR37Y=;
        b=tkRoH93N7g8wgSUkvisNajOS39FaHNaBTV+mEUSfjiiCIrwGYVjpHFtW05Z+h+qNp8
         gKlUDiYXlcwogM0w9h0d4pfaC244ZNHOnyoWrMlqUPcScXRAI2ZttIJX9q8tnzF/TQAB
         fUGF7lJnZOJcvBswyUcYduS1xwWP5x414a5T4slwVQQHGAtGxY2qlKfp8MDeXTO57vYa
         U2ASl8Mg9t+RHs9PxdvKFMUNhZVUyzUMuE0cdIOLKm4B/X84S7kJOpyNQrck1XSDcru+
         m8EBXn+YwGLGZCxtHBEHc7EzFKg6JgSTy4/2WjS714lYkPzIWClRxvlmfl8HwEgLm4cK
         6K/g==
X-Gm-Message-State: AOAM5336r923IhnbokbtW3J1YUECdkvvx1uosTlD4YiHQ/Px94KroGSk
        f2WTsyPywi/kBasQnHjSbjaJlw==
X-Google-Smtp-Source: ABdhPJw4vwNEIpST25smaYx5reE0Z7Abv/P4NhwDxJXarJKsOKpuUA8HvkvKKgycw8Jhaj9VB3CdQg==
X-Received: by 2002:a05:6512:2145:b0:472:82f:2520 with SMTP id s5-20020a056512214500b00472082f2520mr18521393lfr.325.1651246602061;
        Fri, 29 Apr 2022 08:36:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a13-20020a2eb54d000000b0024f3d1dae90sm301046ljn.24.2022.04.29.08.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 08:36:41 -0700 (PDT)
Message-ID: <90084676-ccea-1250-698c-f2a773b9e24d@linaro.org>
Date:   Fri, 29 Apr 2022 18:36:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 7/9] dt-bindings: clock: Add Qcom SM8350 DISPCC
 bindings
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, bjorn.andersson@linaro.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, jonathan@marek.ca,
        tdas@codeaurora.org, anischal@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20220429151247.388837-1-robert.foss@linaro.org>
 <20220429151247.388837-7-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220429151247.388837-7-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/04/2022 18:12, Robert Foss wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
> bindings. Update the documentation with the new compatible.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Due to qcom,dispcc-sm8350.h being a symlink, checkpatch is not happy
> with this patch. Other than warnings related to this, it should be good.
> 
> 
>   .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
>   include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
>   2 files changed, 5 insertions(+), 2 deletions(-)
>   create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> index 31497677e8de..7a8d375e055e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> @@ -4,18 +4,19 @@
>   $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
> +title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
>   
>   maintainers:
>     - Jonathan Marek <jonathan@marek.ca>
>   
>   description: |
>     Qualcomm display clock control module which supports the clocks, resets and
> -  power domains on SM8150 and SM8250.
> +  power domains on SM8150/SM8250/SM8350.
>   
>     See also:
>       dt-bindings/clock/qcom,dispcc-sm8150.h
>       dt-bindings/clock/qcom,dispcc-sm8250.h
> +    dt-bindings/clock/qcom,dispcc-sm8350.h
>   
>   properties:
>     compatible:
> @@ -23,6 +24,7 @@ properties:
>         - qcom,sc8180x-dispcc
>         - qcom,sm8150-dispcc
>         - qcom,sm8250-dispcc
> +      - qcom,sm8350-dispcc
>   
>     clocks:
>       items:
> diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
> new file mode 120000
> index 000000000000..0312b4544acb
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
> @@ -0,0 +1 @@
> +qcom,dispcc-sm8250.h
> \ No newline at end of file


-- 
With best wishes
Dmitry
