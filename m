Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4026AD869
	for <lists+linux-clk@lfdr.de>; Tue,  7 Mar 2023 08:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjCGHrS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 7 Mar 2023 02:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjCGHrQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Mar 2023 02:47:16 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F195A3D08E
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 23:47:14 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id s11so48712183edy.8
        for <linux-clk@vger.kernel.org>; Mon, 06 Mar 2023 23:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678175233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmfI+nHnkEqaAvjTBCYnN1twlAqQaJgDbBXTUdXeeFQ=;
        b=iu9fwHUW9JYA8hvS/oUJwEd4kEhdZsTVk6arW6P3La/Jgtxm2pkPWh1oX+8H2for8e
         zmIJPmBNj2h5olU7KH69L2bPb2H6LSOFEBfXqoetxQ4h7iRKLeEFbcuGn17PgyG8YzqJ
         CSTqVdyHp19RcgJ8PkbRAiq4tPHdpbqjt7Bwuw2TRDcez45jRYIkNtHh6OpPO+0juO4Q
         GvxATuyVzfKTXaP/BkWMKzH9vDF57/LQyR04ZFmKg1aIYn2XJEucO1/Wu4p/BaUKNJBm
         oV5fSOZLad6Uh/v+WtL4ugD7BxYara4n0qp/Nf6quOkSsctVBdcUJfs6eq/SItnovS1g
         /i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678175233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmfI+nHnkEqaAvjTBCYnN1twlAqQaJgDbBXTUdXeeFQ=;
        b=Z3kgrhPzdFWewlPO8Zl8Qp0OOnzCtjG1fijHihk4XUfd6lrmPZrwGB9FAittjvoafY
         h2zaT3ME9dBhPU8f2HGVIKJLDlciw+DeEXWB0obDezG5bn0vyHj6Prqaye9opC1FSk+5
         Wib4hNApxKv5iAVEhLkxvLiuojnScuCP8pnTlVI+kC/QUfa4mcdTkrHKcWeRzZnbPbY9
         gsqSEHgDDxJLDYBCOCt96KJCunNr+kxneB2HNAk9j7oYgbnjRUOVrX6B2QGjij817sdo
         Yyc6j3R1HsOi3PNuWvvRrk9acU+zaa9IYiiQ+MFi5DxirKLVbAuVR+DWxvScOcOdynhY
         2z0g==
X-Gm-Message-State: AO0yUKXMjamrYpnMjmx162+qbDcR2sKPYEXfiK84kRUieKtttPlcuD1L
        ufYIeDPrDVZ1qx2oSKasEsrhdQ==
X-Google-Smtp-Source: AK7set8O4IoTTFwYSdQW8lhVj/770uCuSaTe+CetkZL4C7EpKVXb0/fviq7hgLA5AbL7mIIUBlFvvg==
X-Received: by 2002:a17:906:af18:b0:8aa:c155:9233 with SMTP id lx24-20020a170906af1800b008aac1559233mr13332907ejb.26.1678175233466;
        Mon, 06 Mar 2023 23:47:13 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id y26-20020a170906071a00b008b2714f4d8asm5646123ejb.181.2023.03.06.23.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 23:47:13 -0800 (PST)
Message-ID: <3a27febc-4d4e-1cfd-45dc-6ade4f25ca13@linaro.org>
Date:   Tue, 7 Mar 2023 08:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/6] clk: samsung: exynos850: Add missing clocks for PM
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
References: <20230223042133.26551-1-semen.protsenko@linaro.org>
 <167811290503.11716.15730246749418548221.b4-ty@linaro.org>
 <48c8a0cf-08dc-a831-33ef-3b8e32eef2d3@linaro.org>
 <CAPLW+4=9Vwxd4upa3j_cKtRrNyyx_XCz+TgOOziMguEonbHb0g@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPLW+4=9Vwxd4upa3j_cKtRrNyyx_XCz+TgOOziMguEonbHb0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/03/2023 19:55, Sam Protsenko wrote:
> On Mon, 6 Mar 2023 at 09:51, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 06/03/2023 15:28, Krzysztof Kozlowski wrote:
>>> On Wed, 22 Feb 2023 22:21:27 -0600, Sam Protsenko wrote:
>>>> As a part of preparation for PM enablement in Exynos850 clock driver,
>>>> this patch series implements CMU_G3D, and also main gate clocks for AUD
>>>> and HSI CMUs. The series brings corresponding changes to bindings, the
>>>> driver and SoC dts file.
>>>>
>>>> Changes in v2:
>>>>   - Rebased all patches on top of the most recent soc/for-next tree
>>>>   - Added A-b and R-b tags
>>>>   - Minor fixes
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/6] dt-bindings: clock: exynos850: Add Exynos850 CMU_G3D
>>>       https://git.kernel.org/krzk/linux/c/067ba1605806e52118bb598afb357718df9f0e19
>>> [2/6] dt-bindings: clock: exynos850: Add AUD and HSI main gate clocks
>>>       https://git.kernel.org/krzk/linux/c/e289665ed0d6df9fca3ebc128f1232d305e4600b
>>> [3/6] clk: samsung: clk-pll: Implement pll0818x PLL type
>>>       https://git.kernel.org/krzk/linux/c/a6feedab8ab9a9e4483deb0bcc87919d92c88b7e
>>> [4/6] clk: samsung: exynos850: Implement CMU_G3D domain
>>>       https://git.kernel.org/krzk/linux/c/c5704a56893b4e77e434597c7c53d878bb3073b0
>>> [5/6] clk: samsung: exynos850: Add AUD and HSI main gate clocks
>>>       https://git.kernel.org/krzk/linux/c/d8d12e0d079aff4b1d8079a0a55944c0596f1d67
>>> [6/6] arm64: dts: exynos: Add CMU_G3D node for Exynos850 SoC
>>>       https://git.kernel.org/krzk/linux/c/ad8f6ad9a4f219950df65731a8ff91baa022c4b0
>>
>> And builds are broken. Please mention in cover letter or commit
>> dependencies and ordering...
>>
> 
> Just checked all most recent commits on your for-next and next/clk
> branches. Seem to build fine for me. AFAIR I checked all patches in
> that series, and I guess there shouldn't be any issues if you apply
> those in the same order they are numbered inside the series. Or you
> mean you have some clash between different series? Anyways, I'm glad
> to help, but I'd need more details on where exactly the problem is (or
> maybe you already fixed it?).

The builds were failing after I applied everything to respective
branches (so DTS separate). I did not notice that your DTS and driver
(both) depend on bindings header constant. This requires special
handling. It actually always required, because it was going through
different trees. Now it goes through my tree, but I still need to handle
it. I reworked the branches and force-pushed, thus you did not see the
exact issue.

Best regards,
Krzysztof

