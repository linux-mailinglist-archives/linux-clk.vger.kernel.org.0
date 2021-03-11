Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1697833762A
	for <lists+linux-clk@lfdr.de>; Thu, 11 Mar 2021 15:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbhCKOvM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 11 Mar 2021 09:51:12 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:60813 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbhCKOui (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 09:50:38 -0500
Received: from mail-wm1-f72.google.com ([209.85.128.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lKMe5-0001X0-3n
        for linux-clk@vger.kernel.org; Thu, 11 Mar 2021 14:50:37 +0000
Received: by mail-wm1-f72.google.com with SMTP id a63so1610412wmd.8
        for <linux-clk@vger.kernel.org>; Thu, 11 Mar 2021 06:50:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uKAiLuqa2i9OZl7ygZkPLgKIbolSbL3Tro2Nub/Uk4Y=;
        b=gJ4gvoQik4VucgbgP2yRxKNVMbZbmHfH3cmYlwEz0TXMAkwSSIG9VkVjSic566Y2Ya
         UFa7QTv/2roqqWAXbnvoWX+qiLRIuBpkOjBGyl/KqxiqIIun+RESKUz7/tUwEHZs61ka
         PA3NXm6YEMVUikf/C6iI5pcbK3/B6Il/A+zYJuksWYljXjasWeH1jGtw80r+7tT/JN2d
         aiiod4Jfw60HLvPmAztMYLKqowCp+kqBHWLQrHA3ULeFBGknI9fGuWradxvkYda6C63G
         VG7eJqEOgBkySDBW2l/SBz28kE7aO3pQ8QpnKUA8zsZZIrym3e03UpRNUwZNZ46dC9Ob
         SsqA==
X-Gm-Message-State: AOAM532mTHpIvbK5n7SAGMhZbVQUSrAE5zErfYHlwjgM0fpwRYo1fodY
        S5i3vX6osWa22ilGTDWVfsxooDr5ckRGFWg5TzaL6zqvl46GnF0QK2Rq8ZzKLAu1f8qaIS7ZuMQ
        M2sjbZq7SA9fK5jjEWFI+y2BAFB7Iqh79EFVIQw==
X-Received: by 2002:adf:f852:: with SMTP id d18mr9342162wrq.210.1615474236737;
        Thu, 11 Mar 2021 06:50:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyesJMeh5P/4D8iW/copAeKCALuE0/kYNU8cA4lvJq7myQHewdqjAfZPd2tqbyUu+ezagHw4g==
X-Received: by 2002:adf:f852:: with SMTP id d18mr9342138wrq.210.1615474236553;
        Thu, 11 Mar 2021 06:50:36 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id 4sm4433053wma.0.2021.03.11.06.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 06:50:36 -0800 (PST)
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Moritz Fischer <mdf@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org,
        Networking <netdev@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
 <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
 <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com>
 <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
 <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
 <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
 <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <30ba7549-c60d-4ee9-3502-b863bca8d3a7@canonical.com>
Date:   Thu, 11 Mar 2021 15:50:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/03/2021 10:14, Arnd Bergmann wrote:
> On Thu, Mar 11, 2021 at 8:08 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> On 10/03/2021 17:42, Arnd Bergmann wrote:
>>> On Wed, Mar 10, 2021 at 4:54 PM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>> On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
>>>>> This edac Altera driver is very weird... it uses the same compatible
>>>>> differently depending whether this is 32-bit or 64-bit (e.g. Stratix
>>>>> 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
>>>>> have two. It's quite a new code (2019 from Intel), not some ancient
>>>>> legacy, so it should never have been accepted...
>>>>
>>>> Oh, it's not that horrible as it sounds. They actually have different
>>>> compatibles for edac driver with these differences (e.g. in interrupts).
>>>> They just do not use them and instead check for the basic (common?)
>>>> compatible and architecture... Anyway without testing I am not the
>>>> person to fix the edac driver.
>>>
>>> Ok, This should be fixed properly as you describe, but as a quick hack
>>> it wouldn't be hard to just change the #ifdef to check for CONFIG_64BIT
>>> instead of CONFIG_ARCH_STRATIX10 during the rename of the config
>>> symbol.
>>
>> This would work. The trouble with renaming ARCH_SOCFPGA into
>> ARCH_INTEL_SOCFPGA is that still SOCFPGA will appear in many other
>> Kconfig symbols or even directory paths.
>>
>> Let me use ARCH_INTEL_SOCFPGA for 64bit here and renaming of 32bit a
>> little bit later.
> 
> Maybe you can introduce a hidden 'ARCH_INTEL_SOCFPGA' option first
> and select that from both the 32-bit and the 64-bit platforms in the first step.
> 
> That should decouple the cleanups, so you can change the drivers to
> (only) 'depends on ARCH_INTEL_SOCFPGA' before removing the other
> names.

Sure, let me try that. I have a v3 almost ready.

Best regards,
Krzysztof
