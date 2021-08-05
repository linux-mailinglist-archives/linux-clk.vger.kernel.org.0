Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0043E0EFF
	for <lists+linux-clk@lfdr.de>; Thu,  5 Aug 2021 09:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbhHEHRd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 5 Aug 2021 03:17:33 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:42506
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233122AbhHEHRc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Aug 2021 03:17:32 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 060BA3F353
        for <linux-clk@vger.kernel.org>; Thu,  5 Aug 2021 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628147838;
        bh=6jE8SFRe7ptXY9h+Q9iewRO8CdNFo9CcZ4yJYWrZSWc=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Sx0g1gy4Mse2QM35A44uQAsB4V0cjuLKFUY0WSxyg2uHuWJwgptUVLnytSY+PeUWu
         Cp8rxaEwwIaAT9xeyDnTB9x5R1vM8mSwHuyqK+6ieEeqUZ1W5AMnAU4WMwpRD6VhDp
         xzkhMuyHFPEruEvvhfS5RWkHfdXIG1N3u6xSKhpBxaKSBMZ7gR6eL50atKnqP1rlRa
         JXWhnBf0yL+QlED2cAS+XekP5WGCL4iX5JqIKYQR1NFt+W/BWP3ecgt2ptDLqNNaMG
         UgI2RPyCfEphzj/IiPxhcuKTdhgehXvTGdH8tsrlv1wNozSN+zIhxOE4J6fKMOxQ3S
         kzYZdhRF9KF6g==
Received: by mail-ej1-f72.google.com with SMTP id gg35-20020a17090689a3b0290580ff45a075so1689513ejc.20
        for <linux-clk@vger.kernel.org>; Thu, 05 Aug 2021 00:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6jE8SFRe7ptXY9h+Q9iewRO8CdNFo9CcZ4yJYWrZSWc=;
        b=NEeo2pRUkvLEFmMp6mIVlNCbBwd3Zyd112Wi0U5xfhijBZngf5B/MDKDDEf8vUGj00
         CyPk27GkAKv3+TFDcqr1yaJx1YtefPTPi1omM1mNjlP+k+yro3yMwsgyqcHUjRk+eV/Q
         atdm6SbUF3kDVDm0PUA+k7atmQppupOA5iP+UQ8bkp9mxkmaGbTcfxbvnckFRROh8kSt
         x5PFHtu2+4xdRFabZMPmmv4Va4GhKumQjbgR8Sto3GFlg34AwpCaDZuPAw1aRqB65FzU
         K00agU391+HKfUcx9gxgn365Rhz8odb/gPO8NstuQVLseQbogzJh0pVHMRESlugTZ5KK
         t+OQ==
X-Gm-Message-State: AOAM5323wyLM77GLLgq/WC5Ez+NHZwGVzuZcu1wCgHhljf1maUMAaJje
        LVvnV38fvzXSEP5mXB1KQA5Gb/2MfzoXv+nBVJAK8Fjs9oXtFRdbbXIQoM0rJP9MVu7yIZw0oIS
        FuKrJOIbSuU125/U8dJnRS2gg8xFbOqX+7hnOJw==
X-Received: by 2002:a17:906:814:: with SMTP id e20mr3376563ejd.497.1628147837581;
        Thu, 05 Aug 2021 00:17:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmqkhGtSvkGYoSPphNi/E1sqEExfzHFCc595MmtVHJLYYLMLjFqUPCQbwvvoYcfaH54ftfTQ==
X-Received: by 2002:a17:906:814:: with SMTP id e20mr3376533ejd.497.1628147837423;
        Thu, 05 Aug 2021 00:17:17 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id g10sm1391412ejj.44.2021.08.05.00.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 00:17:16 -0700 (PDT)
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org>
 <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
 <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
 <bf21badb-804f-45f0-c02b-80ff57ab9931@canonical.com>
 <CAPLW+4nY=hozOR+B_0sPZODrk9PXaXg+NB-9pVhDbAjEy7yjhg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e264f96e-a230-456b-08a5-dbe3a31bdb43@canonical.com>
Date:   Thu, 5 Aug 2021 09:17:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4nY=hozOR+B_0sPZODrk9PXaXg+NB-9pVhDbAjEy7yjhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/08/2021 23:30, Sam Protsenko wrote:
>>>
>>> Nice catch! Actually there is an error (typo?) in SoC's TRM, saying
>>> that Virtual Interface Control Register starts at 0x3000 offset (from
>>> 0x12a00000), where it obviously should be 0x4000, that's probably
>>> where this dts error originates from. Btw, I'm also seeing the same
>>> error in exynos7.dtsi.
>>
>> What's the error exactly? The "Virtual interface control register"
>> offset (3rd region) is set properly to 0x4000 on Exynos7. Also one for
>> the Exynos5433 looks correct.
>>
> 
> The issue is that 2nd region's size is 0x1000, but it must be 0x2000.
> It's defined by GIC-400 architecture, as I understand. Please look at
> [1], table 3-1 has very specific offsets and sizes for each functional
> block, and each particular SoC must adhere to that spec. So having
> 0x1000 for 2nd region can't be correct. And because exynos7.dtsi has
> GIC-400 as well, and 0x1000 is specified there for 2nd region size
> too, so I presume there is the same mistake there.

I understand, the range length has indeed same mistake. However it does
not matter that much There are no registers pass 0x10C (so pass 0x1000).
This address space is not used.

> Can you please check the TRM for Exynos7 SoC (if you have one in your
> possession), and see if there is a typo there? E.g. in case of
> Exynos850 TRM I can see that in "Register Map Summary" section the
> offset for the first register (GICH_HCR) in "Virtual Interface Control
> Register" region is specified as 0x3000, where it should be 0x4000, so
> it's probably a typo. But the register description is correct, saying
> that: "Address = Base Address + 0x4000".

The starting addresses of each registers range is different issue and
this one matters. Except same typo as you say, all looks good - they
start at 0x4000.

> 
> [1] https://developer.arm.com/documentation/ddi0471/b/programmers-model/gic-400-register-map

> 
>>> Though I don't have a TRM for Exynos7 SoCs, so
>>> not sure if I should go ahead and fix that too. Anyway, for Exynos850,
>>> I'll fix that in v2 series.
>>
>>
>> However while we are at addresses - why are you using address-cells 2?
>> It adds everywhere additional 0x0 before actual address.
>>
> 
> Right. For "cpus" node I'll change the address-cells to 1 in my v2
> series. I'll keep address-cells=2 for the root node, but I'm going to
> encapsulate some nodes into soc node (as you suggested earlier), where
> I'll make address-cells=1. That's pretty much how it's done in
> exynos7.dtsi and in exynos5433.dtsi, so I guess that's should be fine
> (to get rid of superfluous 0x0 and conform with other Exynos DTs)?

Yes, thanks.


Best regards,
Krzysztof
