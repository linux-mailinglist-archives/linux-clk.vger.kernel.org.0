Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7744E423E02
	for <lists+linux-clk@lfdr.de>; Wed,  6 Oct 2021 14:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238530AbhJFMse (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Oct 2021 08:48:34 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35896
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238087AbhJFMsd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 08:48:33 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A19E23FFF1
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633524400;
        bh=CFPfrwCOLmoOnhcB5cFkeSRW+ygeIs9z/XXXtSaFs3Q=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=u6ZbrHRZdBUbkO8f7SjbHORutJ3tOm+ChiBmhCRUGPq3PZf6FSqRxVxgxtV1Z8uJL
         gHhWQ0fJ6Tp1r2LOez9U0G1pSqCVNw8jrkswAHMi8KfmUykOSGChFZO+yabMg5xOgX
         hunSFdWZFgNc1t/f9HFJz2VD2kUNwmFULQUK9VWXjg4ikL7m7u3Wg/g/XU/vArJC0a
         ytizQthEIdjCpqXUQ9fKJxhmJBF51EoZvtIyZ71WMuLEIIaGRt2ZOla6+5ZH9ivjVQ
         BPxDwZCgV3I7h1DgyzVAnG8NNHLBLiaX/7pKl8KyPbZqWxZ6TrGaneWLiDU8YfSa1n
         rVjs8J/04dsYg==
Received: by mail-lf1-f71.google.com with SMTP id k7-20020ac257c7000000b003fd3ab38ddeso1941267lfo.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 05:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CFPfrwCOLmoOnhcB5cFkeSRW+ygeIs9z/XXXtSaFs3Q=;
        b=acSMastN7TcBa0BKn2uKylNws7iR/Qf+DEYhFja7SVODMdrvQuNMbcWpeekY1VCbc4
         gu98jP1IZ+xHFX4/3zAtFfMn+XpeAmCywwqfiJ/fbRbNVqvcMh6KwSgj20g38kU3zmrN
         NoEO9gpUqm+eOfQgpIZ+aCxxN06617bRR4UJlxbURwRbP5Sp97or6KIJcNwM38d5iUSX
         UNQnWGoUkTVu4vFC168j0mnzqbn1vZkKqg/G4YtvJW8fmtELVNL2JQJRHIaUNLAVNrw7
         gPvBKOyfDNZCDmDh7RYW+gT8WHaKbNC3LTK3o9P2bw/fP2hbYL4mVHfPZjJN1eWCjS+K
         DGog==
X-Gm-Message-State: AOAM530QAZp5x0l400cAl8KyGGB+O8vkxY+NgzXUIwpgCplCK/iUNI4J
        KHAJXSZZw2UACFCF/2kPI4/xn5CJl2l7HttVJzi2q8UaguE/haOmsbZ+/lBm6jcr8oLwrMCmPMB
        0OgK2NTtzERtvjryMxLXx8HDeuPgChVT2GsX1vQ==
X-Received: by 2002:a2e:7f06:: with SMTP id a6mr28466848ljd.437.1633524399772;
        Wed, 06 Oct 2021 05:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1ImH5ZppaJiULcnlj61kt2m4gbZQp0zsJOhQk+6s6980dk31R5+ELxZ7FMAOsluAeUMfLEg==
X-Received: by 2002:a2e:7f06:: with SMTP id a6mr28466823ljd.437.1633524399584;
        Wed, 06 Oct 2021 05:46:39 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g18sm2184560ljj.105.2021.10.06.05.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 05:46:39 -0700 (PDT)
Subject: Re: [PATCH 6/6] clk: samsung: Introduce Exynos850 clock driver
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <CGME20210914155639eucas1p2b65f35fcbd2b3fde7d4e7541ac6d76d3@eucas1p2.samsung.com>
 <20210914155607.14122-7-semen.protsenko@linaro.org>
 <1d884e38-ac8c-6f0c-ad27-243c5c4b9b9b@samsung.com>
 <CAPLW+4n0DX3gn=Ntat39EUO-L2t=SR_=Nr3LtznN4XsNrc=OWA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <98c7d970-d937-3441-20c1-7cec736a8a62@canonical.com>
Date:   Wed, 6 Oct 2021 14:46:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4n0DX3gn=Ntat39EUO-L2t=SR_=Nr3LtznN4XsNrc=OWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/10/2021 13:36, Sam Protsenko wrote:
> On Wed, 15 Sept 2021 at 16:07, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>>
>> On 14.09.2021 17:56, Sam Protsenko wrote:
>>> +static void __init exynos850_cmu_top_init(struct device_node *np)
>>> +{
>>> +     exynos850_init_clocks(np, top_clk_regs, ARRAY_SIZE(top_clk_regs));
>>> +     samsung_cmu_register_one(np, &top_cmu_info);
>>> +}
>>> +
>>> +CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
>>> +            exynos850_cmu_top_init);
>>
>> Was there anything preventing you from making it a platform driver instead?
>>
> 
> Can you please elaborate on benefits of adding platform driver? I
> don't implement PM ops for now, and I can see that clk-exynos7.c does
> not add platform driver as well... clk-exynos5433.c seems to use
> platform_driver for PM ops only.

I said it in response to patch 1, so just for the record:
Exynos7 is not the example you are looking for. :) Exynos5433 is.


Best regards,
Krzysztof
