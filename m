Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C0D39D49B
	for <lists+linux-clk@lfdr.de>; Mon,  7 Jun 2021 08:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhFGGDX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 7 Jun 2021 02:03:23 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35012 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhFGGDW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Jun 2021 02:03:22 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lq8KJ-00013S-Be
        for linux-clk@vger.kernel.org; Mon, 07 Jun 2021 06:01:31 +0000
Received: by mail-wr1-f70.google.com with SMTP id e11-20020a056000178bb0290119c11bd29eso2533924wrg.2
        for <linux-clk@vger.kernel.org>; Sun, 06 Jun 2021 23:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qAtq8fZxJa+xoWcGAlXfKDVfTmmln1jGGwqwLzPVz5w=;
        b=gknvh8aufzK3J5nqbnbwSpktI9XnYp/ksWYoMKnkTp4Y6zTquh6Gm9BZKQPDennfDB
         AzwZ6QSHTcT/DZYTofD49EhXEsNZr1AySiXOXLfnUbBhMgZd+T33s05nP4pO+/CXS6sv
         6Bu4S8kO0H5d//AoQuFNtN0Ryhu0RdS1MRQSKhcqN2/opgz0tpXZt798y8JXnOhZLCup
         KXEgKU49ORh4tkzC4wLRRSbfNl60SqhnRrhOuMyesFjEkykxcBwFrIPFcfneR4GagLGX
         dlTcamtn2t0KM8JU+q0SPxJjHQleQ2e9mMmTxZ/NI7fWKli8ANRgVVpNXHGhd/rwYbVR
         X8ng==
X-Gm-Message-State: AOAM53171IUUtDKwWddX/Y3h+eV3YsNLii1mmvCq4b71Sl8VJP5xswcT
        cdDxzzioI4K45FyvBoPuELZppP5QcvSlqmP3vgUdB1GhchPwINIztxf42MPxPEIah6mDAJxPHcP
        45qpWWFKTqYlM2GnFwxUE1XDcXn2L7JUgem3puQ==
X-Received: by 2002:a1c:740b:: with SMTP id p11mr14833133wmc.94.1623045690461;
        Sun, 06 Jun 2021 23:01:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpu7m3EIJUyOBKcObfXEeEge07GsVcQb9YzJG8QvObto+R5NJsN0+hGkmIqmu4dspK7YMSzw==
X-Received: by 2002:a1c:740b:: with SMTP id p11mr14833107wmc.94.1623045690239;
        Sun, 06 Jun 2021 23:01:30 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id q20sm18398437wrf.45.2021.06.06.23.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jun 2021 23:01:29 -0700 (PDT)
Subject: Re: [PATCH v6 08/14] memory: tegra: Enable compile testing for all
 drivers
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        =?UTF-8?Q?Nikola_Milosavljevi=c4=87?= <mnidza@outlook.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        linux-clk@vger.kernel.org
References: <20210601023119.22044-1-digetx@gmail.com>
 <20210601023119.22044-9-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <41899ef4-bb16-6c3a-035c-1e840a993bec@canonical.com>
Date:   Mon, 7 Jun 2021 08:01:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601023119.22044-9-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/06/2021 04:31, Dmitry Osipenko wrote:
> Enable compile testing for all Tegra memory drivers.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 

Hi Dmitry,

This fails on x86_64 and i386:
https://krzk.eu/#/builders/38/builds/260
https://krzk.eu/#/builders/40/builds/261

/bin/ld: warning: orphan section `__reservedmem_of_table' from `drivers/memory/tegra/tegra210-emc-table.o' being placed in section `__reservedmem_of_table'
/bin/ld: drivers/memory/tegra/mc.o: in function `tegra_mc_probe':
mc.c:(.text+0x87a): undefined reference to `reset_controller_register'
make[1]: *** [/home/buildbot/worker/builddir/build/Makefile:1191: vmlinux] Error 1

It's a defconfig with:
scripts/config --file out/.config -e COMPILE_TEST -e OF -e SRAM -e
MEMORY -e PM_DEVFREQ -e ARM_PL172_MPMC -e ATMEL_SDRAMC -e ATMEL_EBI -e
BRCMSTB_DPFE -e BT1_L2_CTL -e TI_AEMIF -e TI_EMIF -e OMAP_GPMC -e
TI_EMIF_SRAM -e MVEBU_DEVBUS -e FSL_CORENET_CF -e FSL_IFC -e JZ4780_NEMC
-e MTK_SMI -e DA8XX_DDRCTL -e PL353_SMC -e RENESAS_RPCIF -e
STM32_FMC2_EBI -e SAMSUNG_MC -e EXYNOS5422_DMC -e EXYNOS_SROM -e
TEGRA_MC -e TEGRA20_EMC -e TEGRA30_EMC -e TEGRA124_EMC -e
TEGRA210_EMC_TABLE -e TEGRA210_EMC


Best regards,
Krzysztof
