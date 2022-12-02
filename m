Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9446404E5
	for <lists+linux-clk@lfdr.de>; Fri,  2 Dec 2022 11:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbiLBKl2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 2 Dec 2022 05:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbiLBKlN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 05:41:13 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368DFD11CA
        for <linux-clk@vger.kernel.org>; Fri,  2 Dec 2022 02:40:50 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id bn5so4971556ljb.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Dec 2022 02:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+MXYguyjssptA8DU77l67l2AFn1VS80LiknP4/TOsmc=;
        b=IEJtlvVdwgQCZC8vt/M9I0Kyxqy96Uybos+AsQychnP3fbYugkDJhzyjElPLuGU/d0
         3TmbP6wuyBB/tQTr3fL2/1y5DotifCT+UCxav/w4tWZP4FoNyQGLmHqjn9obnBVLmBGu
         LDTs9KHzTiA+4SWcR51brofVIm8ORVh7YaXp0BceeQULu/OMw8yGbRc2fbOhHzU+KJow
         cdRFBJoMVneUnSarWpNuk9cpPhr3lqhqUl40wp6VEoo+o78WHOSHWAa0+gcyNYQEPnq/
         r+8BJTSyUc6kPLF7prLWPjQEaWAK5izSTxdaT82Y3xxpo8MYfPxQ0uAfCUNNTvkIp16l
         DpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MXYguyjssptA8DU77l67l2AFn1VS80LiknP4/TOsmc=;
        b=RcSsT3moELzumDEwnwsOqyVPca/XyFqzNLUOUkfiOid8QWkUsSRwukromPaVajRnIo
         gZ+WA6D/D+2D0OW7osyEQ0Qn+NBU0kZs8CdGvdFrNCH5uIV722vCjBUPta0EtbRD7efR
         ke9SNGaXX+2S8m7oR02vyseFvbZBhKU54KidM6CJVrghV+3sYxt8bpaqHzTyoEXHl2kr
         uygxkcmqMNtpUeBXuS3e7NJHMdoTVi830V+2hVCM5xiQrS3uQ30tq6FyAs+q+DqcMYaH
         cFginLRA9c4GULEUIAiMljLRo9tXWeikqGwdBcgpwBrH3lpE/nBlFnmZ9/x+iz6Hje90
         k8eg==
X-Gm-Message-State: ANoB5pl9miN4lYozSAvQg3caaVoXcNRtgvjk4MuJf/Ykp4pDyhm55fxN
        92W8TsWF5FFajvofg+W0M2BGjw==
X-Google-Smtp-Source: AA0mqf6G7NS1s2BlL4nzio2zY8DUUfrHcznNa5otERS9Z2UdUD5OSMEGq62r4PCDY+cYyJuggsMIHw==
X-Received: by 2002:a2e:a806:0:b0:277:4b35:d94a with SMTP id l6-20020a2ea806000000b002774b35d94amr14436143ljq.21.1669977648518;
        Fri, 02 Dec 2022 02:40:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f7-20020a05651c02c700b002772414817esm597103ljo.1.2022.12.02.02.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:40:47 -0800 (PST)
Message-ID: <3a6bc7ea-284d-27f0-104c-51a326d07d27@linaro.org>
Date:   Fri, 2 Dec 2022 11:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 10/11] dt-bindings: clock: meson: fixup A1 peripherals
 clkc dtb_check errors
Content-Language: en-US
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        neil.armstrong@linaro.org, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-11-ddrokosov@sberdevices.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201225703.6507-11-ddrokosov@sberdevices.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/12/2022 23:57, Dmitry Rokosov wrote:
> During running dtbs_check and dt_binding_check checkers the following
> problems were found and resolved:
>     - $id is not correct, it has wrong url path
>     - no base offset in the dt node definition
>     - CLKIDs aren't applied by names, just magic int constants there
>     - address and size cells are required for long reg definition
>     - wrong indentations
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-clkc.yaml       | 36 +++++++++++--------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> index 7729850046cf..b0249ab21466 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> @@ -1,7 +1,7 @@
> -#SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/amlogic,a1-clkc.yaml#"
> +$id: "http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#"
>  $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>  

NAK. This must be squashed.

Best regards,
Krzysztof

