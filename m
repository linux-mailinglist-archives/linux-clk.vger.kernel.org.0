Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B8E4F98AE
	for <lists+linux-clk@lfdr.de>; Fri,  8 Apr 2022 16:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbiDHO5F (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 8 Apr 2022 10:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237210AbiDHO5E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 10:57:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D69654E
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 07:55:00 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id q26so10344126edc.7
        for <linux-clk@vger.kernel.org>; Fri, 08 Apr 2022 07:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=09k0cdXExIXi2nZQGUowL8FTPg31pRqik4f6jmnnO2w=;
        b=MpbglDaS3k4EI/fk+SJWAT/f1sz20SJeI9EtjdiqXMiihqP1mS3ENkAO9g8FRFAN9J
         b30/PEOhU/Z2Gtcj3XsCAWwjN/8ZGJc2KoR8PPSyGLSibIx2jqdhtEWw7xfxdAsj/B2A
         UuvK26k322/fI+NzVLdyaJh95QBE09uVgbcDJjwVg7+3NmXytaRgvsAgX5RBMVGwkLhb
         WlidJYMNyaTKZNGXJbHAycABGs1gHPhEjA7s7pfjSQd5usRl3n9mlhJg9yQJVkSDd7/S
         n9DbZ/gShKAr3Bs8IllyEzXi2vIIo58F88IExJ6FEUL+YBowSMaQ6VH4hYAboT5Y55nA
         M16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=09k0cdXExIXi2nZQGUowL8FTPg31pRqik4f6jmnnO2w=;
        b=G0TDr/66aR6NUWAm0omTHLbduesb6Y/wJRMSHm2cjfudmR3Y4ZUqmXRhqChTK+D73v
         9rLRNuJQfaeRSpVdghqVU36MXd0GzxkKMyHe5if3uzRLTzXA9UxY3Sfe5XkXEE72hH8j
         TL4QVttQ7yLhkHBJaInSccuDMznHrxmi+SYky7aTYwc86Y98j8gohxNkVxPWWxM4mWAX
         cHrf2OUrNxf1sMedQrrlApCDEFxdAcfXkadEkxm56Mft4HXHFX3tXGlo7KCOqKLt1FPv
         oRr6V/1syMda5YUYgvrm3tzBRAaD1deQlJo7dy9y+kuQaVcCnv5DsNBe2L7w+KqC+76Q
         YP7A==
X-Gm-Message-State: AOAM531BGW7YxQrvkAdllHTG1ijFyVCBXiVACniwU4AI0zGoiRZh6HUF
        gXAiVv6dE2ZP9fQ4sDJtYghp1g==
X-Google-Smtp-Source: ABdhPJwHlNeuxcQeuAi8hDLAkT+emovtzwN0HxRAZ5hQ7o8XUVx4+YFAgDy29RKu/t3/uNC1/OGIWw==
X-Received: by 2002:a05:6402:278d:b0:419:3794:de39 with SMTP id b13-20020a056402278d00b004193794de39mr19787666ede.137.1649429699052;
        Fri, 08 Apr 2022 07:54:59 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j22-20020a50ed16000000b00419366b2146sm10878381eds.43.2022.04.08.07.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 07:54:58 -0700 (PDT)
Message-ID: <d4a182e8-9469-6dfb-af97-6e570d4c5ab1@linaro.org>
Date:   Fri, 8 Apr 2022 16:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/7] dt-bindings: clk: mpfs document msspll dri
 registers
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
        sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <20220408143646.3693104-2-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408143646.3693104-2-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/04/2022 16:36, Conor Dooley wrote:
> As there are two sections of registers that are responsible for clock
> configuration on the PolarFire SoC: add the dynamic reconfiguration
> interface section to the binding & describe what each of the sections
> are used for.

(...)

>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: |
> +          clock config registers:
> +          These registers contain enable, reset & divider tables for the, cpu, axi, ahb and
> +          rtc/mtimer reference clocks as well as enable and reset for the peripheral clocks.
> +      - description: |
> +          mss pll dri registers:
> +          Block of registers responsible for dynamic reconfiguration of the mss pll
>  

This breaks all of DTS - in and out of tree.

Best regards,
Krzysztof
