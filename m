Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB0B41D817
	for <lists+linux-clk@lfdr.de>; Thu, 30 Sep 2021 12:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350173AbhI3KyA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 30 Sep 2021 06:54:00 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39288
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350172AbhI3Kx7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Sep 2021 06:53:59 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0DE7D402D9
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 10:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632999136;
        bh=IXdF+Px2IPPBasNnxm33nxmrPP5ltJ+hhzJPPAqE+rA=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=tSq7GmyN3jky0RAeHfX+PvLSClisESELri4D089yayNFSW3PRwt5gZ8nVvjPVnyaM
         viDLmaQLvJrKiFPUVwh2GI7HAomUFyTMkWiOxkQpTyK2kDzKTy4nEuZtwWxZ4FeoUm
         U6i/AcRRPt9aGDW9AZazbEetskYOWOnoedMd9h6BbS7JctHPxOfZKasegeLVXPeB41
         00nn1Bh+B4beQ527K+8Gnvs0I4q15sVF4Y591XcIogyp5JSC3IclyYUfJ/joev1Iqi
         VfnDazlVi7p1BnilEWBgd/UBPObH8ov1rp2oK+k0fJbs3oKqWtFGwKn2aSxSzuYy1D
         XxYk1OYPY2Qjg==
Received: by mail-lf1-f71.google.com with SMTP id g9-20020a0565123b8900b003f33a027130so5200463lfv.18
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 03:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IXdF+Px2IPPBasNnxm33nxmrPP5ltJ+hhzJPPAqE+rA=;
        b=vyPiCx18NoulkJ5dN+pxBkCnCpAaN22P2hQKJdX6nGwXvqHDKhiOismVIrg2ZWThCD
         2kS8p5gq639dDqL/7JGHFETJZN+hYxqGCfQaRHCoLZ4N7d8XcVcN5XjXcvlZru5KeMsQ
         gqTC8iCAQiHvQQArlxjxWKHr/yfID+NRKdRd1lBsQlVw1fT5uV9XmnKCl/lsHpLqaOR6
         KRp+L7A05Fuz/9KAsW9wmtWYXPKWXPBWWV8QREWQ8IaAVgaYtrMONo5Avc8B+4Pirz5c
         hQt5mvnu8t31FNYAQ5MuVtr9p0DuCul8Nc85QNfbrVCu5NFyogZ7eM8TvsbWXTQCcaCU
         YAOQ==
X-Gm-Message-State: AOAM533Jg8ZccPTp5SBLCMtIn4FBa0rUvtCmkzgaXUAFXI3FKLKne5FW
        937NLhDo6J6DM5lUxIbLWiz8Z9+kHX+0k7gzeNL0fXa03eCzODXQssoH0DzkkF6OMWP5pyYBE9F
        u/+uoorm4N21APIFCyVNJGJV2K9l4fXltdHFswQ==
X-Received: by 2002:a19:4895:: with SMTP id v143mr5214346lfa.622.1632999134995;
        Thu, 30 Sep 2021 03:52:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP1XCL6lSBqwYJx+1KtdIMtCBYDdtJrS4cpFezKFo6ZYlspxly5txMX2ta+SKXWbBz1VKdtg==
X-Received: by 2002:a19:4895:: with SMTP id v143mr5214307lfa.622.1632999134719;
        Thu, 30 Sep 2021 03:52:14 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id b25sm329579lfi.151.2021.09.30.03.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 03:52:14 -0700 (PDT)
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <d79df9ff-fc22-8d29-011d-c3cb7dbbfa4e@canonical.com>
Date:   Thu, 30 Sep 2021 12:52:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVWCK5QO331rfhJJ@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/09/2021 11:23, Lee Jones wrote:
> I've taken the liberty of cherry-picking some of the points you have
> reiteratted a few times.  Hopefully I can help to address them
> adequently.
> 
> On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
>> Reminder: these are essential drivers and all Exynos platforms must have
>> them as built-in (at least till someone really tests this on multiple
>> setups).
> 
>> Therefore I don't agree with calling it a "problem" that we select
>> *necessary* drivers for supported platforms. It's by design - supported
>> platforms should receive them without ability to remove.
> 
>> The selected drivers are essential for supported platforms.
> 
> SoC specific drivers are only essential/necessary/required in
> images designed to execute solely on a platform that requires them.
> For a kernel image which is designed to be generic i.e. one that has
> the ability to boot on vast array of platforms, the drivers simply
> have to be *available*.

By "essential", I meant drivers which are needed for supported platform
to boot properly. Also without significant performance penalty due to
probe deferrals.

Therefore if someone selects ARCH_EXYNOS in mainline kernel, it means
he/she wants such devices to be working fine with generic kernel.

This is the difference with term "drivers have to be available".

> 
> Forcing all H/W drivers that are only *potentially* utilised on *some*
> platforms as core binary built-ins doesn't make any technical sense.
> The two most important issues this causes are image size and a lack of
> configurability/flexibility relating to real-world application i.e.
> the one issue we already agreed upon; H/W or features that are too
> new (pre-release).

Geert responded here. If drivers are essential for supported platforms
to boot, having them built-in has technical sense.
For other drivers not and we do not discuss such cases.

> 
> Bloating a generic kernel with potentially hundreds of unnecessary
> drivers that will never be executed in the vast majority of instances
> doesn't achieve anything.  If we have a kernel image that has the
> ability to boot on 10's of architectures which have 10's of platforms
> each, that's a whole host of unused/wasted executable space.

Geert responded here.

> 
> In order for vendors to work more closely with upstream, they need the
> ability to over-ride a *few* drivers to supplement them with some
> functionality which they believe provides them with a competitive edge
> (I think you called this "value-add" before) prior to the release of a
> device.  This is a requirement that cannot be worked around.
> 
> By insisting on drivers (most of which will not be executed in the
> vast majority of cases) to be built-in, you are insisting on a
> downstream kernel fork, which all of us would like to avoid [0].

The same with all the DTS and hundreds of drivers you keep out of tree.

> 
> [0] Full disclosure: part of my role at Linaro is to keep the Android
> kernel running as close to Mainline as possible and encourage/push the
> upstream-first mantra, hence my involvement with this and other sets.
> I assure you all intentions are good and honourable.  If you haven't
> already seen it, please see Todd's most recent update on the goals and
> status of GKI:
> 
>   Article: https://tinyurl.com/saaen3sp
>   Video:   https://youtu.be/O_lCFGinFPM
> 
>> We don't even know what are these unsupported, downstream platforms
>> you want customize kernel for. They cannot be audited, cannot be
>> compared.  Affecting upstream platforms just because
>> vendor/downstream does not want to mainline some code is
>> unacceptable. Please upstream your drivers and DTS.
> 
>> You also mentioned downstream devices but without actually ever defining
>> them. Please be more specific. What SoC, what hardware?
> 
> Accepting changes based on the proviso that vendors upstream all of
> their work-in-progress solutions is an unfair position.  

You twisted (or ignored) my words here. I said before - sacrificing any
mainline platform (e.g. reliable boot for distro) for an out-of-tree
vendor which does no want to upstream drivers is the unfair position.
One of the incentives of upstreaming is to be able to shape kernel and
be considered in kernel upstream decisions. That's the privileged for
upstreamed platforms - they have an impact.

Vendor decides to stay out - fine, vendor's choice. You loose impact.
Any sad words like "oh upstream does not want to change for me" should
receive a message: "please join the upstream :), so we will change
together".

> We already
> discussed why upstreaming support for bleeding edge H/W and
> functionality is unrealistic in terms of competitive advantage.

Nope, my last point was not responded to. You said that there is no
point for vendor to upstream bleeding edge HW. Then you said that there
is also little point to upstream older HW.

Basically following this approach you agree that vendor does not have to
do anything because it is inconvenient for him.

However upstream has to adapt to downstream vendor, right?

No, this is *unfair to all the platforms we upstreamed*.

> 
> Besides, we might not be talking about new silicon at all (I don't
> believe anyone alluded to that).  The flexibility in configuration
> simply allows for generic upstream drivers to be swapped out for ones
> which may have more or slightly different functionality (that can't be
> publicly shared until release).
> 
>> Please explain why Exynos is special that it does not require essential
>> drivers to be selected as built-in. For example why aren't same changes
>> done for Renesas?
> 
>> Everyone else are working like this. NXP, Renesas, Xilinx, TI, Rockchip,
>> AllWinner. Samsung or Google is not special to receive an exception for
>> this.
> 
> Exynos isn't special in this regard.  This applies to any vendor who
> releases Android images and wishes to be solve all of the issues the
> GKI project addresses (please read the article above for more about
> this).

We have then slightly different goals, because you are driven by Android
release images and this is why you are less interested in NXP and
Renesas. Only some vendors should receive such changes? No, in upstream
we are not focusing on any specific distro and there are other uses of
Exynos (and NXP and Renesas) platforms. Therefore the choice/policy and
overall design tries to match all vendors, not only some subset
convenient to Android.

If Android (or some vendor) wants to have exception for a specific
driver/platform, it must do it in upstream way, by contributing, not by
changing to match downstream needs while ignoring other users.

Best regards,
Krzysztof
