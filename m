Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E3A78E67D
	for <lists+linux-clk@lfdr.de>; Thu, 31 Aug 2023 08:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238517AbjHaG1J (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 31 Aug 2023 02:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244186AbjHaG1H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2023 02:27:07 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53092CEB
        for <linux-clk@vger.kernel.org>; Wed, 30 Aug 2023 23:26:37 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bdcade7fbso44004166b.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Aug 2023 23:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693463194; x=1694067994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0avG/zYQ6RvuG7fLU/XP4zrbphvj+u7vgRSAcgPOjGk=;
        b=HNUe472ZibY/mpCeS/YcVjLpfjo8KlCPD5+q3uNsEUeOhtEYUKtXhkjjWQK/vRu0D6
         LuIZM5mmtaEBBSGalnAAG2AgHe6s2WgJa8YQR6gJx82PUDJhrUWTtfpUkJPYMIXLyVBp
         8VQZusz/NgVtZuqIjROPM5ELyTdumlTvVn0OP/Eyn4dGzJcGk62+wicGi6GAVWaVZWKo
         KcYSnNY4ebvk322hpBTbv2U/VnBHtJ4xzGmp0e4P8qp8q2A4aaNhoMvpluF7TASqzJEC
         /1LVU6wOvNPorEHKUOciWu90Fem5/by+q9z9W6YuMOgMMzSVqWi+KG8P6FxOMXsXALnf
         5o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693463194; x=1694067994;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0avG/zYQ6RvuG7fLU/XP4zrbphvj+u7vgRSAcgPOjGk=;
        b=FGjnzbFmWonS1r82GH5jDOA32lHpKlooCoXmjtk1m00mW27sW+YhrDA6xKw4+6eL1Z
         5wtYbfp72eyrcMKNhkiiEuk4GZLCXJjqTkqKSykssNUzJGrODso7gybpJGSI5uu5gTYX
         FpQccvrbXv36nj9E5Pc4h9Xjdy8+Y9OkzGOGynj5AJiaphtay3ptbPLmIrS/ZxDrB4GI
         P7jcYNZfnp/+fi12gFFeUOa7UUsclf4APMtwEgMF56RUoxqP+qChWEoAE1mzX0G3j3gi
         l098syDnaaQXAuKAV0FbaY5TEIl21NCJPDESpVF+9vEvqMMuDlgZKXG0eOuR/Fk0WnQE
         rJHw==
X-Gm-Message-State: AOJu0Yx4ur8khFnZoS6+tgPxDAwymJibXgu4N06LFZXZs10tfUM/hxgY
        V8aIFYyZZpxF/PXsJ5FTSYS07g==
X-Google-Smtp-Source: AGHT+IEadjmU41MKGVrKyUN5627zgsM67OWxxEoxWIcEUwC9E9HEA7Gw+EWwBoMimlJzb3HFbKAb6w==
X-Received: by 2002:a17:907:7622:b0:9a5:d657:47e5 with SMTP id jy2-20020a170907762200b009a5d65747e5mr3084566ejc.49.1693463194196;
        Wed, 30 Aug 2023 23:26:34 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id l23-20020a1709060e1700b00991e2b5a27dsm386574eji.37.2023.08.30.23.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 23:26:33 -0700 (PDT)
Message-ID: <6baf47b2-6244-c6a5-ff43-1514f7f74f4b@linaro.org>
Date:   Thu, 31 Aug 2023 08:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/5] dt-bindings: mfd: convert twl-family.tx to
 json-schema
Content-Language: en-US
To:     Andreas Kemnade <andreas@kemnade.info>, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230830182038.878265-1-andreas@kemnade.info>
 <20230830182038.878265-2-andreas@kemnade.info>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830182038.878265-2-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/08/2023 20:20, Andreas Kemnade wrote:
> Convert the TWL[46]030 binding to DT schema format. To do it as a step by
> step work, do not include / handle nodes for subdevices yet, just convert
> things with minimal corrections. There are already some bindings for its
> subdevices in the tree.
> 

...

> +properties:
> +  compatible:
> +    description:
> +      TWL4030 for integrated power-management/audio CODEC device used in OMAP3
> +      based boards
> +      TWL6030/32 for integrated power-management used in OMAP4 based boards
> +    enum:
> +      - ti,twl4030
> +      - ti,twl6030
> +      - ti,twl6032
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +additionalProperties: true

No, this must be false. example-schema and all device bindings require
this to be false. Having it true makes the schema basically no-op, so
why do you need it?


Best regards,
Krzysztof

