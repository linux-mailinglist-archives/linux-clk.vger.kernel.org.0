Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABFD4A3145
	for <lists+linux-clk@lfdr.de>; Sat, 29 Jan 2022 19:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbiA2SAv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 29 Jan 2022 13:00:51 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36414
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346291AbiA2SAu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 29 Jan 2022 13:00:50 -0500
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 94F173F1E6
        for <linux-clk@vger.kernel.org>; Sat, 29 Jan 2022 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643479249;
        bh=wj26dowE18UBChU4iJsZoK9hW1bTUvEBWMZ3lDSEVB4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=EBzzHRFTnVrkMZu5tdokGIpM1OLGDE53QzTBM4lTF5Z0vcAtJq32DA2hd4Vsmhb98
         5vacAbJ/YBVLW7fGcZk8z0FZHdtgV8e7eOo/eTW7usQgyLj6GRqBBiTSZ5fI6xpf+R
         6vGs9oY8isv20zXQBKP2F3G3wGHAXcB6YPrDeI3oLmPCRg1wjcwKcu7Tvux1kpT2dH
         +kej8l1icvKffitQsZ5m/M6S/061qDtsodIVrFTmWxQP/1nL7EwIdd5YXSdEPD9t9G
         6HeqwC0quhIkpLVv8EazZd6WLnT3M8BOHKYEL9ymxZ95XhM9wTHxK6hHqDK+LCnj8c
         YstVFcFV+eP9w==
Received: by mail-ej1-f71.google.com with SMTP id r18-20020a17090609d200b006a6e943d09eso3762292eje.20
        for <linux-clk@vger.kernel.org>; Sat, 29 Jan 2022 10:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wj26dowE18UBChU4iJsZoK9hW1bTUvEBWMZ3lDSEVB4=;
        b=RyV8JMPSgzZ0uvuxboVzCugskMpdcF9dIUmE4Q1jYfvB5Y2CDuu/JEZ4Z4//fTf2xh
         v/renCj32AXFuSdR6VTtuElbGY0YL3Pu9rz1H87tO3frdGpeDcgAa04MY/SPPwXgjWzT
         vKdBkrp6Un3LAQgiP5gY/sLLyW+/qT4EE8i3jFWEE5vcdT2RN7r1o4FRVM4e+ai0XZBf
         acPobL2fY6/SYYL1HEYQd+UVen6h8B6jY2lf69Ki1HAgC/tEuLWBnSqx6P14xuaQz7Iu
         5UxBVN/7F2IXGicnX8V8DSP94aYtv+NoDKfqCyT+W1s0p4qMvtcIqHnhTtztKEKcOCBb
         es/A==
X-Gm-Message-State: AOAM5305Boto9ikmIzYNWb9A1bTiWqZAghP1TeSU/G4CoEcXREHcStd4
        dOffCGpd5JvQtmcO63GlyA61bA6/JMkQjRLv9f3fQmMCVblp5XANJ9brn/xRdYjL2V6IXiouU1g
        rTgZhZTdA52BzEj6h/HirC5TrrJM/zxj12JisLg==
X-Received: by 2002:a05:6402:184d:: with SMTP id v13mr13614166edy.109.1643479249166;
        Sat, 29 Jan 2022 10:00:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6bjwiCDZCxOplOaDglUSHk7pmnpQn3kHhZBBmcKVaRe2EwfObgQ4fcdEMeY8GoW/rPHhUnA==
X-Received: by 2002:a05:6402:184d:: with SMTP id v13mr13614158edy.109.1643479249044;
        Sat, 29 Jan 2022 10:00:49 -0800 (PST)
Received: from [192.168.0.71] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c2sm14849032edj.24.2022.01.29.10.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jan 2022 10:00:48 -0800 (PST)
Message-ID: <47ff2b5a-745e-a32c-6c24-80f8e72ea8a3@canonical.com>
Date:   Sat, 29 Jan 2022 19:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] clk: samsung: fix missing Tesla FSD dependency on Exynos
Content-Language: en-US
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>
References: <20220129173407.278591-1-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220129173407.278591-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/01/2022 18:34, Krzysztof Kozlowski wrote:
> The Tesla FSD clock controller driver uses shared parts from Exynos
> ARM64 clock drivers, so add proper dependency to fix COMPILE_TEST build
> errors like:
> 
>   /usr/bin/aarch64-linux-gnu-ld: drivers/clk/samsung/clk-fsd.o: in function `fsd_cmu_probe':
>   clk-fsd.c:(.init.text+0x9c): undefined reference to `exynos_arm64_register_cmu'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: e3f3dc3810d3 ("clk: samsung: fsd: Add cmu_peric block clock information")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/clk/samsung/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

What I forgot to mention - the commit being fixes is in my tree, so this
should go as well via Samsung SoC.


Best regards,
Krzysztof
