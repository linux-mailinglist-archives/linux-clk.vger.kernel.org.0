Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2729053DC5E
	for <lists+linux-clk@lfdr.de>; Sun,  5 Jun 2022 16:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345302AbiFEOyu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 5 Jun 2022 10:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234211AbiFEOyt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Jun 2022 10:54:49 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286942BCC
        for <linux-clk@vger.kernel.org>; Sun,  5 Jun 2022 07:54:47 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id v1so13839579ejg.13
        for <linux-clk@vger.kernel.org>; Sun, 05 Jun 2022 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nr9goO6JCR6ynsOrkzdJyNSIrUg9yZwLsbH12VXCnv0=;
        b=nrithu8KVe+0Ef6h0ePei9GiCMv2WDKM8GSaIfn0Ar6bNX8ASc1AN2K35a49/JrU3Y
         j7k1YP5G4ugVlQjqD7hAuCd2aeuhbtK5rX6bFyzvxtHlkP8M/y5F145phmQbiR4J3Jvl
         R85UOsOC9MPCyuuEjTYVXzl71SqvDMby/ip4U7POqd0Bra5XOdQ20YGXgH53LrsGPh59
         gaeHsgWIzTUjQj+iouDOtdS6cR7/jwTbqvSsWJPR03Wh9u0yKHTDO7v4BwhVD5myoo4K
         i17inQ2rz0Q/j8o8eagXaXgmEB/kFnFtQJ2FfBE+qb1ojXv8ba+1MEVFeWTTPR7YewC8
         d02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nr9goO6JCR6ynsOrkzdJyNSIrUg9yZwLsbH12VXCnv0=;
        b=18ZPf9GWY6TS3hKNQHpGsAGaJqjpDLQA1Xc+yFZ8O/JDf672KWASe7qEMa0BUzYJir
         u9BGZyZebxtRwdEsIVADOOuMb//jx6fvZNV1LLyfFJPa1YFciqsBvxfGUQUBue50l9d0
         twZycj7d9AG/fc3owj4VMFbF+ROEfSW5TI6YWRyDpfV5kkrix26a5nE/bQTVwuqjONbM
         cucMFILXCoBT5xA3lyMW9NwITIq0UAtJnH6tnVlQ7zHnhqWWglgWi6b9YwFtu7AXbUrF
         IrmRseUj9kL3dTOvSFqY5EThC6YTR8FSO1yxee6zh4nVq0D2SYahVpGgFdeA8rvEder8
         BdNg==
X-Gm-Message-State: AOAM530BMPhn4yR1GDXHtISSupzMocLcywWY+x3VboXaFw8ypB+9NkqQ
        wGUsral1dvGqIl+ZAxiltiLCAQ==
X-Google-Smtp-Source: ABdhPJzJldMnVHXS3QDl/dM42X4k0XAaCUYXOZ4XIGmGG7wyaMi/VlfLe5nM4rkal6LkB6xfrPpcNQ==
X-Received: by 2002:a17:907:3f9f:b0:6fe:f9e2:9c6a with SMTP id hr31-20020a1709073f9f00b006fef9e29c6amr18158922ejc.479.1654440885697;
        Sun, 05 Jun 2022 07:54:45 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a23-20020aa7cf17000000b0042dc882c823sm7009190edy.70.2022.06.05.07.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 07:54:45 -0700 (PDT)
Message-ID: <34e6715e-795c-3d64-1341-31da9bd27563@linaro.org>
Date:   Sun, 5 Jun 2022 16:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v2 1/2] clk: hisilicon: add CRG driver Hi3521a SoC
Content-Language: en-US
To:     "Marty E. Plummer" <hanetzer@startmail.com>
Cc:     arnd@arndb.de, cai.huoqing@linux.dev, christian.koenig@amd.com,
        devicetree@vger.kernel.org, gengdongjiu@huawei.com,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux@armlinux.org.uk, michael@walle.cc, miquel.raynal@bootlin.com,
        mturquette@baylibre.com, novikov@ispras.ru, olof@lixom.net,
        p.yadav@ti.com, rdunlap@infradead.org, richard@nod.at,
        robh+dt@kernel.org, sboyd@kernel.org, soc@kernel.org,
        sumit.semwal@linaro.org, tudor.ambarus@microchip.com,
        vigneshr@ti.com, xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
 <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
 <20220601105846.7hriawg3stxb657f@proprietary-killer>
 <630b0d13-6778-2508-6a34-9daa0358047d@linaro.org>
 <20220601110616.xmxih663kxgupszv@proprietary-killer>
 <a2a98c6d-2ff7-89f6-0711-c8f8b99e85c2@linaro.org>
 <20220601182418.okoofgannw6vbcxo@proprietary-killer>
 <b1b87be5-a048-b713-c9f2-84b948aa6718@linaro.org>
 <20220603112227.hmzwy7xxl6ddezqh@proprietary-killer>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220603112227.hmzwy7xxl6ddezqh@proprietary-killer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/06/2022 13:22, Marty E. Plummer wrote:
> On Thu, Jun 02, 2022 at 08:37:43AM +0200, Krzysztof Kozlowski wrote:
>> On 01/06/2022 20:24, Marty E. Plummer wrote:
>>
>>>>> Either or. Whatever makes the workload easier is what I'm looking for.
>>>>
>>>> Sorry, you need to be more specific. Apply is not a job for you, for the
>>>> patch submitter.
>>>>
>>>> Then you miss here important piece - which is the first patch. DTS goes
>>>> always via separate branch (or even tree) from driver changes. That's
>>>> why bindings are always separate first patches.
>>>>
>>> So, add a 4: arch/arm/boot/dts/soc.dtsi and 5: arch/arm/boot/dts/board.dts
>>> to the above list, or should those be the same patch as well?
>>
>> For me does not matter, sub architecture maintainer might have preference.
>>
> Fair enough. That being said, for the dt-bindings patch, is it
> permissible to include #define CLOCK_FOO 1337 and so on for clocks which
> haven't been wired up in the driver yet? As in, you know they're there,
> and are important enough to model, but you haven't gotten to that point
> yet?

What would be the benefit to include them now? I imagine that if you
plan to add such clocks to the driver in next week or something, and you
need to use them in DTS, then it's fine. If that's not the case,
probably there is little sense in defining them upfront...


Best regards,
Krzysztof
