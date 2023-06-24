Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2EE73C99C
	for <lists+linux-clk@lfdr.de>; Sat, 24 Jun 2023 10:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjFXIdA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 24 Jun 2023 04:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233130AbjFXIcX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Jun 2023 04:32:23 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38164C05
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 01:28:19 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-988f066f665so164056666b.2
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 01:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595293; x=1690187293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GIkG+tRxlPhRtm7YOpXeJRcJeLkXqLt09OeZ1Nh1Q4=;
        b=DkiglpMjfjZCyxhWBqFcrR4RkmF6xYeIJhZq2bOE8/tpFTboyhHRBzqMweLVJwZdse
         Po5v9VUAlVpzETIWlBeTSQ/MOOvNBADP10/6rUf8cTK/xsSxgq1hO5ZM9vc4292Kwd83
         VTdWBdvUwwEOS+VqFVyBMZUM6hlNddUzTKFQc1w5NukZTFWumAXPj6zYaXxUMWoU/DSy
         XQel7bucUiZ+Ngsaptd6xqTY94Y066kVJS9WhWDC0jZ5rzUsfBkGryZ36kc7qmVLWyeh
         wthERO5PoF7uGlAF2OMarb6r+LyNXoKbb+5cj2mZ36KhHU2OJG0uneADkVzgtHgvzaZM
         aiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595293; x=1690187293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GIkG+tRxlPhRtm7YOpXeJRcJeLkXqLt09OeZ1Nh1Q4=;
        b=ePq7NyS0wLZBo8lhwg92UNutmIsL57RQ3Ez3nlObG1ChUSAaHJUdl++Duffp2gQiK2
         z7O2o6fDOhlj50N1gReqdU3CEs1sPvpLDO/7d2snVPPbj26Hq0VrmjQaQu6iiF23pJEC
         P7NUy0yVsYa2NCb0L+OcrljOtqAZ3xKuGbgaSeo8qSZTbk2EeGR8d1iVPBPSwge1dRTe
         6ZtLIaVnuMgN0od9ua+f+nbhhnIyAin3ppkt3OKBZGRMCSY4qG7sMaJ7k4Kl+VglPkX/
         eJGj/g+0lRv98hqyxMLkBbO1Ly21Ol5JnVVsmJjhzVR4oDG7KWQplCizCF4Roe4IXLQG
         gyWQ==
X-Gm-Message-State: AC+VfDw/sOVQYuh4B6q/yW0F3r5ZlrMja/FBhkuq9Kpk1JL4i5oJVONl
        i/rC14rBhMj6Tl2W6W16LMe7lQ==
X-Google-Smtp-Source: ACHHUZ4ujAlY65iLeyuRh50Ps6Pp7ng1jowk6gt0zzaeZKnGL1gJBg6GDgqsvIKWUupAOCVYBEqBCQ==
X-Received: by 2002:a17:907:3e8e:b0:987:88eb:2416 with SMTP id hs14-20020a1709073e8e00b0098788eb2416mr19943130ejc.61.1687595293178;
        Sat, 24 Jun 2023 01:28:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id kq2-20020a170906abc200b009887bb956e0sm620186ejb.103.2023.06.24.01.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:28:12 -0700 (PDT)
Message-ID: <36a6ba38-d01e-96ad-c89f-7e2c860e0a88@linaro.org>
Date:   Sat, 24 Jun 2023 10:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 00/45] Add support for sam9x7 SoC family
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        olivia@selenic.com, a.zummo@towertech.it,
        radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
        gregkh@linuxfoundation.org, lgirdwood@gmail.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com,
        horatiu.vultur@microchip.com, durai.manickamkr@microchip.com,
        andrew@lunn.ch, alain.volmat@foss.st.com,
        neil.armstrong@linaro.org, mihai.sain@microchip.com,
        eugen.hristev@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
        balamanikandan.gunasundar@microchip.com,
        manikandan.m@microchip.com, dharma.b@microchip.com,
        nayabbasha.sayed@microchip.com, balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
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

On 23/06/2023 22:30, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v2:
>  --------------
> 
>  - Added sam9x7 specific compatibles in DT with fallbacks
>  - Documented all the newly added DT compatible strings
>  - Added device tree for the target board sam9x75 curiosity and
>    documented the same in the DT bindings documentation
>  - Removed the dt nodes that are not supported at the moment
>  - Removed the configs added by previous version that are not supported
>    at the moment
>  - Fixed all the corrections in the commit message
>  - Changed all the instances of copyright year to 2023
>  - Added sam9x7 flag in PIT64B configuration
>  - Moved macro definitions to header file
>  - Added another divider in mck characteristics in the pmc driver
>  - Fixed the memory leak in the pmc driver
>  - Dropped patches that are no longer needed
>  - Picked up Acked-by and Reviewed-by tags

Where did you pick them up? Can you point me to the patches?

Best regards,
Krzysztof

