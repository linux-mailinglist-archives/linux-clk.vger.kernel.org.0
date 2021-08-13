Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80EBF3EB9BB
	for <lists+linux-clk@lfdr.de>; Fri, 13 Aug 2021 18:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241550AbhHMQDy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 13 Aug 2021 12:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241531AbhHMQDx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Aug 2021 12:03:53 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C8AC061756
        for <linux-clk@vger.kernel.org>; Fri, 13 Aug 2021 09:03:26 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 203-20020a1c00d40000b02902e6a4e244e4so7228547wma.4
        for <linux-clk@vger.kernel.org>; Fri, 13 Aug 2021 09:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x0xWLTk86tzzRjkpfY1Nei5soG6C/jHVAXTF3VFx8as=;
        b=oid8lx5rMiXxBC7FhshiK5zRVwBoupwa7etIGRHYqQP5Ghxv3EasyGjtRUp/q5Z46g
         dPi4hgDi6lfE5M69WkGUYoB4UpHQjdbW7/b5w+LQt9p0RZAURATPXapoGxPpFNZGjzQ2
         Va9LQd+pJxCIAWHKes5nlRutYkbGgOx43p5fIFbu9CspxwKZ0CrPNYFzCNlRiL+FJ93W
         TklrGcoUss7pCNoyZU9yjb2EHpT0pnIOHwJ3YWr6JRwQpdEjkHA7IduQ3ogIp5ZS3EEF
         TY52xmFQkxtmdRAbmlYH2KZXBZWX0m8UvuZV3/wRxjMEJMwUP5V9hqpzXnySsIbfOhVF
         3TFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x0xWLTk86tzzRjkpfY1Nei5soG6C/jHVAXTF3VFx8as=;
        b=Ur62dKP4fh+r6WSTDt6+9IQTgmMO1u3Do+KZ3zggR/WpVEuOAcykqnKPGbytVu7no7
         wvdczvD+mn1+RuKgdiza2Pcnstx3PqdYM6gB1vZPGL7Bydfg+NMLw9e+i2AeaJ+mwLzy
         hJvXPZ5nDzmQySMxJD4peYHtwpIKBj3h42Cp/TtRy6lqe58hPnMMrpiWfyeWbaefdwFC
         Uo7dpl5y9kGzpoqkgz2RvIlspUsK5ZAZ/quOtR7jQ4nnoO4CpwxcKW3COHIvVa1xP/1A
         2uzf+PzsO8WnhF0r2zk0upmh4yb05r5bLA2Hq4MJEAYGkgv0JFWcGww/DlFReeD98skt
         swWA==
X-Gm-Message-State: AOAM530IVTRC0KBnHxkfqQHJXYuz20MCd+gUCQCr3LFZBSebK+xeAPHz
        84Mqiq7iRISvmialf/cW5ewGQA==
X-Google-Smtp-Source: ABdhPJxcIJRrl7o4ZN0CYfus5qLWkxvFiJ5ZwqVc8qhAmA8Ox/ETKV+ybqsxewm9Za6B47x1WERQbA==
X-Received: by 2002:a05:600c:2290:: with SMTP id 16mr3333448wmf.26.1628870603592;
        Fri, 13 Aug 2021 09:03:23 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5df3:d0eb:3945:640d? ([2a01:e34:ed2f:f020:5df3:d0eb:3945:640d])
        by smtp.googlemail.com with ESMTPSA id i9sm2470529wre.36.2021.08.13.09.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 09:03:23 -0700 (PDT)
Subject: Re: [PATCH v4 4/9] clocksource/drivers/pistachio: Make it selectable
 for MIPS
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        linus.walleij@linaro.org, vkoul@kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
 <20210723022543.4095-5-jiaxun.yang@flygoat.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <9db45153-d4d6-aab9-8cf8-12fdb76be249@linaro.org>
Date:   Fri, 13 Aug 2021 18:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723022543.4095-5-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/07/2021 04:25, Jiaxun Yang wrote:
> So it will be avilable for generic MIPS kernel.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/clocksource/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 39aa21d01e05..58ad7af8c673 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -234,8 +234,9 @@ config CLKSRC_LPC32XX
>  	  Support for the LPC32XX clocksource.
>  
>  config CLKSRC_PISTACHIO
> -	bool "Clocksource for Pistachio SoC" if COMPILE_TEST
> +	bool "Clocksource for Pistachio SoC"
>  	depends on HAS_IOMEM
> +	depends on MIPS || COMPILE_TEST

The dependency on the platform is only required if the COMPILE_TEST
fails on other platforms.

The selection is done from arch/mips/Kconfig directly otherwise.

>  	select TIMER_OF
>  	help
>  	  Enables the clocksource for the Pistachio SoC.
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
