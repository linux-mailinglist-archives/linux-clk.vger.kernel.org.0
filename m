Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA577413020
	for <lists+linux-clk@lfdr.de>; Tue, 21 Sep 2021 10:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhIUI1N (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Sep 2021 04:27:13 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34680
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230508AbhIUI1M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Sep 2021 04:27:12 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AF8DA3FE01
        for <linux-clk@vger.kernel.org>; Tue, 21 Sep 2021 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632212743;
        bh=PakN2wbGs/med/D4ZWenpx5EeuVdG2xsZUFyxVDNDpM=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=LAk0vPfckMMSyktNld/vuvQX+8a5g4UIMfl1CqaBK7GK0XnoJvq3JrEICNr5naYig
         j4heNgKMAZ5c3BFGl+sLwp9UYQnCTeOtgeodsCAq0eFju4pv+ZajDTEx/Jl9bhZ/+Z
         /AaEJ5wUnutJfAt6hoyfU8OqzbZZ+s8tq15BdbRIlrfasRhoJk6VLwS498fdM1Hbq2
         Kc2EMhZRTRg8a0mwr4AejWXLamww2eMmvEghwAT48ZUbg0wZDzV2XUH4OUjhf07avb
         q41LjW5jFh7/cUEw+GfJVoNggp9oW7PToPaqgLVlsoxJcUPyEgKETPpVOSrdhkcZeE
         KPPQwECZV5+sQ==
Received: by mail-wr1-f69.google.com with SMTP id x7-20020a5d6507000000b0015dada209b1so8147930wru.15
        for <linux-clk@vger.kernel.org>; Tue, 21 Sep 2021 01:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PakN2wbGs/med/D4ZWenpx5EeuVdG2xsZUFyxVDNDpM=;
        b=zE5qkbsDbzoWe2NHfEhQBVfv/YhOKzmYWf1SgCluQDqvjKIS78vJdA4iO7C+el7Q7G
         zWtsdYLn8nctKaR7teONU2JJpnIoNUosvrYf7CufayKgMRUhOOlAK/tdebAAKVLLaZYW
         9lCnIz3OGBywMA39mPpGNMylbD9B3NZWbgrHw4fnS9puK1NsiaxBoORt1KDo+XJ3E888
         iE0VOn5S0DNXCDUWtmCe611SaprThLjdkw1BSKnKR5998MaN6gkZbQnGYWEcel53cFSb
         corgufIieF3FuCm2LERIV2SwNMgEjG+LwB3wdQToUfOdutZCkhYr5TOn4JLtEO4s1VeO
         6qzQ==
X-Gm-Message-State: AOAM530RsB54gRxSTvt/7lz71SSptqrvPgvKcTe6L8SSPf07/G1DBT3p
        nd1rS3D5NNqgik6DTIUbTddPZ9W1GTAbtffZHIUHqP9e9kcLzIveHkt/Hr8H4aOyiDg3CGPw1CJ
        3b7HMkKr2/2sbwGlyk0wvw713IgzOXNxO6XZ39g==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr3268401wmh.117.1632212743167;
        Tue, 21 Sep 2021 01:25:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp0rPHyWd368/Ze8iF9YfFlWr90/JCakDv7rQLGftI6ArWqIbwE51Hrm/RKPh1ClGVqMawxw==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr3268385wmh.117.1632212742951;
        Tue, 21 Sep 2021 01:25:42 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id g2sm5599447wrb.20.2021.09.21.01.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 01:25:42 -0700 (PDT)
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com>
 <YUmTwZPqrCfRMekd@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
Message-ID: <d6212801-f2a0-a6a7-6154-0f99b57f1c4d@canonical.com>
Date:   Tue, 21 Sep 2021 10:25:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUmTwZPqrCfRMekd@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/09/2021 10:11, Lee Jones wrote:
> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> 
>> On 20/09/2021 21:03, Will McVicker wrote:
>>> This patch series tries to address the issue of ARCH_EXYNOS force selecting
>>> a handful of drivers without allowing the vendor to override any of the
>>> default configs. This takes away from the flexibilty of compiling a generic
>>> kernel with exynos kernel modules. For example, it doesn't allow vendors to
>>> modularize these drivers out of the core kernel in order to share a generic
>>> kernel image across multiple devices that require device-specific kernel
>>> modules.
>>
>> You do not address the issue in these patches. The problem you describe
>> is that drivers are not modules and you are not changing them into modules.
> 
> The wording is unfortunate.  The reason for this change doesn't have
> much to do with kernel modules.
> 
> Let's go back in time 18 months or so when Greg KH submitted this [0]
> patch, which you Acked.  Greg was trying to solve the problem of not
> having to enable ARCH_EXYNOS on kernels which are designed to be
> platform agnostic (sometimes called Generic Kernels).  For some reason
> SERIAL_SAMSUNG is the only symbol with these dependencies, so the
> solution seemed simple and straight forward at the time.
> 
> However, For sound reasons Geert NACKed the patch.
> 
> Quoting from [1] he says:
> 
>   "A generic kernel will include Samsung SoC support, hence
>   PLAT_SAMSUNG or ARCH_EXYNOS will be enabled."

Yes, it's correct reasoning. There is also one more use-case -
non-upstreamed (out of tree) platform which wants to use Exynos-specific
drivers. Something like was happening with Apple M1 except that it got
upstreamed and we do not care much about out-of-tree.

> 
> However, since the entry for ARCH_EXYNOS *insists* on building-in a
> bunch of other symbols (via 'select') which will be unused in most
> cases, this is not a currently acceptable approach for many Generic
> Kernels due to size constraints.

In the mainline kernel there is no such use case. If you want to have
Exynos-whatever-driver (e.g. SERIAL_SAMSUNG or S3C RTC), you should
select ARCH_EXYNOS because otherwise it does not make any sense. Zero
sense. Such kernel won't work.

It makes sense only if there is some other work, hidden here, where
someone might want to have SERIAL_SAMSUNG or S3C RTC without
ARCH_EXYNOS. Although GKI is not that work because GKI kernel will
select ARCH_EXYNOS. It must select ARCH_EXYNOS if it wants to support
Exynos platforms.

Therefore I expect first to bring this "some other work, hidden here" to
broader audience, so we can review its use case.

> 
> What this patch does is migrates those symbols from being 'select'ed
> (always built-in with no recourse) to 'default y'.  Where the former
> cannot be over-ridden, but the latter can be via a vendor's
> defconfig/fragment.

It cannot be overridden by vendor fragment because options are not
visible. You cannot change them.

The patch does nothing in this regard (making them selectable/possible
to disable), which is why I complained.

> 
> I doubt many (any?) of these symbols can be converted to kernel
> modules anyway, as they are required very early on in the boot
> sequence.

True, some could, some not. Also some platforms are set up via
bootloader, so actually could "survive" till module is loaded from some
initrd.


Best regards,
Krzysztof
