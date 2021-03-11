Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF18336D0E
	for <lists+linux-clk@lfdr.de>; Thu, 11 Mar 2021 08:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhCKHaP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 11 Mar 2021 02:30:15 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:48733 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbhCKHaK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 02:30:10 -0500
Received: from mail-wm1-f70.google.com ([209.85.128.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lKFlP-00030S-PU
        for linux-clk@vger.kernel.org; Thu, 11 Mar 2021 07:29:43 +0000
Received: by mail-wm1-f70.google.com with SMTP id w10so2002472wmk.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Mar 2021 23:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UM3RKX0XCDpJCuubU4GyjNFkIs45HL7bg2XqkxuxPoo=;
        b=gF5zt73sISSOG5rJyRvFA8CsuYHk4Ls63Vd5O3/0bupTcFA9Eomoi9+ahT6Lh904DQ
         W82f6WoWdNyA74hZRd3GfmfthsGvrL+1KN4PPJmmECwK7oijNFNalC/r5w5zrI2AJd4b
         zjm+390WkDzsIoyxlrDq+MT5pD1xvQ/s2VuX+FwnuXmxRiMLgsp9Wepcrn5Z832Nn91w
         Pfz5swYWiFVcwRQE8NSHSBztzx8D96bT0mFJpBakDnvjPY0oZwdmAbruZg/JJj+M5C9N
         WY9OtMlA2noRbcAfK1ki8nPJxzBk7T3NwfkLixTs7VWrY/5gle2LMJAJTUcvXvDHTKVF
         SH8Q==
X-Gm-Message-State: AOAM532hLXm1CG+eDfq8V7Pp3ojxa8W2jvdDo281qLC/BFUJfTLksBAn
        z6ZUQth/CV4UGihuEyLT+ucR2hzCqjWnbgJhHtg2nyhYNQAPdZdjcqrSfEfQKf8joeaKfRlhvCv
        os+UpDomcB0G8w1mO799l1/gU4iRkkqpDQmceig==
X-Received: by 2002:a5d:4708:: with SMTP id y8mr7473161wrq.382.1615447783438;
        Wed, 10 Mar 2021 23:29:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwntEUdVEQpqMsRTDpIua5kEKJ6BAuZNIC5Far5vVjfExGBGIXOrXsOxt/q5mJ8+gEXtFcFdw==
X-Received: by 2002:a5d:4708:: with SMTP id y8mr7473131wrq.382.1615447783295;
        Wed, 10 Mar 2021 23:29:43 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id z3sm2323807wrw.96.2021.03.10.23.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 23:29:42 -0800 (PST)
Subject: Re: [RFC v2 5/5] clk: socfpga: allow compile testing of Stratix 10 /
 Agilex clocks
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
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
 <20210310083840.481615-3-krzysztof.kozlowski@canonical.com>
 <CAK8P3a27hAExCKtsO7k1HQwLKk-5Q8uxYYt_G2v-Osq8RZv2tg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a1f296ad-19db-824e-5d33-c93c6af87e70@canonical.com>
Date:   Thu, 11 Mar 2021 08:29:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a27hAExCKtsO7k1HQwLKk-5Q8uxYYt_G2v-Osq8RZv2tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/03/2021 17:48, Arnd Bergmann wrote:
> On Wed, Mar 10, 2021 at 9:38 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> --- a/drivers/clk/socfpga/Kconfig
>> +++ b/drivers/clk/socfpga/Kconfig
>> @@ -1,6 +1,17 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> +config COMMON_CLK_SOCFPGA
>> +       bool "Intel SoCFPGA family clock support" if COMPILE_TEST && !ARCH_SOCFPGA && !ARCH_SOCFPGA64
>> +       depends on ARCH_SOCFPGA || ARCH_SOCFPGA64 || COMPILE_TEST
>> +       default y if ARCH_SOCFPGA || ARCH_SOCFPGA64
> 
> I think the 'depends on' line here is redundant if you also have the
> 'if' line and the default.

Yes, you're right.
Best regards,
Krzysztof
