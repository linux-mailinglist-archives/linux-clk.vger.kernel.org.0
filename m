Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF5A7000D7
	for <lists+linux-clk@lfdr.de>; Fri, 12 May 2023 08:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239876AbjELGuI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 12 May 2023 02:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239877AbjELGuH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 02:50:07 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3C835A0
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 23:50:05 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-96652cb7673so1019042566b.0
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 23:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683874203; x=1686466203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20JFakpad4Yi3m+h8m5OwraA4mcgdT8+ns7QsA/uaws=;
        b=qxSFtT4FdVei35mkSk5ccg/ZEvSHMXvhTwLa4N5c1mkkO43MizRI4B6WpC2iUkvG+H
         7Kfl3xJN5zAM+ijd+2oVO+eS9wV24jcgVW/Z7e22vVUhQ6kWGAkAW2TC0hJvA7GVdJ9k
         d1xkvob71ubYiEU8MqdqFx51aDziHDFYRgQeY+nL7DkBzZ4IKFBagfCYhaVd/+oHdWVM
         00Xn3YYwGjhzdwKO0+tC9s3O0inbUS+f0jXKUqZWw6LvkDW2iHlXhtnLEOjmYxdlGEGw
         EdbCSPgkGNudB43+xl5nZvA8dgj0RaVAVEEVIzTmjQtQ5SATp269ouLsv97iGTDhOe4d
         DH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683874203; x=1686466203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20JFakpad4Yi3m+h8m5OwraA4mcgdT8+ns7QsA/uaws=;
        b=CYCd7b6ul37U1vh4BZnStajkGT6lIP7UY4mkpuzei/ecTQG1eg7I4cuh6yBA/bkZGE
         9IkTiIxW1KqxHriRR9wYfPiisCQvDrcHjl5onF3WTe+42obrpsRmxKlxE/WSX4KsveoY
         dhpUJVzPoIfpKJZ2i6B8LkIYkWjR7MKT+9L1iCJAXIOxiReDA1pY57XT2FrxmRmJZ5G0
         roklyH6Iw+MjCeBBFC7gGsAVoVQ3wwqyXZ57Xg/CJnXqcSpxP+w7xt5Ua3uow3WiDSCp
         VL0oaKIWiDnaIlr32iqbwsJaGas5mpkUTSDgCXCjLD0SL8BNhSds/pgL5Z6uNIYzPJEt
         A1ZA==
X-Gm-Message-State: AC+VfDwtMCQ1Cr/EE4ZmseBSd/L2KHcIvyGpSiI3ZwC2RFel5qQKZ13R
        UpnqUlyGSLJHPptSZ7JW+WUpnA==
X-Google-Smtp-Source: ACHHUZ5OsBthlEQL5vFhxa3LwORFmPmz1h5PHYYWrlOEZU7LcEfzOqX1e05KAA6fXxIZxw4oMXuSNQ==
X-Received: by 2002:a17:906:4fd1:b0:959:8575:2635 with SMTP id i17-20020a1709064fd100b0095985752635mr24906838ejw.17.1683874203648;
        Thu, 11 May 2023 23:50:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id og51-20020a1709071df300b009662c57b4ffsm5048914ejc.96.2023.05.11.23.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 23:50:03 -0700 (PDT)
Message-ID: <b0133bcb-9c46-643a-5eda-dfdd816296fa@linaro.org>
Date:   Fri, 12 May 2023 08:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-6-xingyu.wu@starfivetech.com>
 <2fb8c88a-dab5-791b-eefe-c983decad5e8@linaro.org>
 <20230512-brewery-spouse-86350c9664d8@wendy>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512-brewery-spouse-86350c9664d8@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/05/2023 08:43, Conor Dooley wrote:
> On Fri, May 12, 2023 at 08:35:43AM +0200, Krzysztof Kozlowski wrote:
>> On 12/05/2023 04:20, Xingyu Wu wrote:
>>> From: William Qiu <william.qiu@starfivetech.com>
> 
>>> +  "#power-domain-cells":
>>> +    const: 1
>>
>> Add it to the existing examples.
>>
>> This part confuses me... why aon appeared here?  Why power-controller
>> disappeared? I don't think that Rob or me proposed any of this.
> 
> Rob did actually suggest this, as the power-controller child node had no
> properties other than #power-domain-cells.

He suggested it for aon, but not for stg or sys... aon is not a child of
sys, is it? Then why power-controller disappeared from sys?

Best regards,
Krzysztof

