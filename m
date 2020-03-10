Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 996E9180571
	for <lists+linux-clk@lfdr.de>; Tue, 10 Mar 2020 18:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgCJRuM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 10 Mar 2020 13:50:12 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37599 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJRuM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Mar 2020 13:50:12 -0400
Received: by mail-lf1-f66.google.com with SMTP id j11so11693876lfg.4;
        Tue, 10 Mar 2020 10:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=goAJpXnujj5+7IIzD+wIBEHPOokKFfYUjpyJQHVTm40=;
        b=QVJKIqehKcu24dwMaIGjeKR3UcVe2tBBwUWG9c7Q39xSfZwynDqZCcNrt0YCQL5nDF
         2w5fBlb7VU4jM2EChm9DqJCxrThJiyV5UVpTqBDE7FbrrDNBVzkyUickKywYgYfM5rYK
         EkEqPaz3HzhQo9hNond4t6WQ77eirGLRfVoEuNUIp05k1gYpwPcOweGxUNwR0Mz0Y/vr
         TUUf5cdypFPO5CRchV54kityiuo13nzdJ5v5KBoRJrgdTo1m9DxriKpfmPYLf9zxi+07
         PO9vynNMhGomYSsEYrEnwVlSDLuFrXYQzbtWVK505JXmQXXXQR3M0D47nvImMzwNETv5
         sg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=goAJpXnujj5+7IIzD+wIBEHPOokKFfYUjpyJQHVTm40=;
        b=kILK9kX9BsdLQ0KzoZVn/nXE6ikNvAL0Vx7AbecCjZwXaOkl5gIvorC5TPVbOJAVfn
         KmjAW7F/zrDJAqlfCEL7uLHCOdwknAAXpNJRnwpgFI9wXj3h+ucbb+MMyCvI9uVKzS54
         QejH5wRGPBe30YpcDTKtkj1vPq/k0faA+Ur4cQRBjd9sFDZn1cLrSAlMXPZoTaNHYqGD
         NkFtPIqisXdrXll0NQFzEdAykASyxwZ9zfFBEhr2IRkcXNny9j2QWahX3nH3/rmxcmqo
         jaSEJRzp1qrGIwqYLo4i/ODzOdj6vuY1YvrPQWajpJYyaBKU3YxDNfUGPAlkDNcSWtXB
         x3WA==
X-Gm-Message-State: ANhLgQ2dFL+n+CZXmO+4aDPzsiVmHd65BF6Z5Ims6xvqoIiB6i7tHY6+
        dvKpxNPb3YDzZfYf0K1obCg=
X-Google-Smtp-Source: ADFU+vsz/i/6+z2fGDLGQ6vPCi+tDh/3r1l13kXnFFBiFEwDokoqykXzX3KvIfu9fJ0gV/juMevAlQ==
X-Received: by 2002:ac2:50c7:: with SMTP id h7mr13554346lfm.101.1583862609134;
        Tue, 10 Mar 2020 10:50:09 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id r23sm7375579lfe.53.2020.03.10.10.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 10:50:08 -0700 (PDT)
Subject: Re: [PATCH v5 1/8] clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-2-thierry.reding@gmail.com>
 <9b343fd1-15df-409a-390f-e30fa6bbbfe7@gmail.com>
 <20200310170508.GA3079591@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f613a047-bf3f-3fb5-4034-ce435bb6cd6d@gmail.com>
Date:   Tue, 10 Mar 2020 20:50:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310170508.GA3079591@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

10.03.2020 20:05, Thierry Reding пишет:
> On Tue, Mar 10, 2020 at 07:19:59PM +0300, Dmitry Osipenko wrote:
>> 10.03.2020 18:19, Thierry Reding пишет:
>>> From: Joseph Lo <josephl@nvidia.com>
>>>
>>> Introduce the low jitter path of PLLP and PLLMB which can be used as EMC
>>> clock source.
>>>
>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/clk/tegra/clk-tegra210.c         | 11 +++++++++++
>>>  include/dt-bindings/clock/tegra210-car.h |  4 ++--
>>>  2 files changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>>> index 45d54ead30bc..f99647b4a71f 100644
>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>> @@ -3161,6 +3161,17 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
>>>  	clk_register_clkdev(clk, "pll_m_ud", NULL);
>>>  	clks[TEGRA210_CLK_PLL_M_UD] = clk;
>>>  
>>> +	/* PLLMB_UD */
>>> +	clk = clk_register_fixed_factor(NULL, "pll_mb_ud", "pll_mb",
>>> +					CLK_SET_RATE_PARENT, 1, 1);
>>> +	clk_register_clkdev(clk, "pll_mb_ud", NULL);
>>> +	clks[TEGRA210_CLK_PLL_MB_UD] = clk;
>>> +
>>> +	/* PLLP_UD */
>>> +	clk = clk_register_fixed_factor(NULL, "pll_p_ud", "pll_p",
>>> +					0, 1, 1);
>>> +	clks[TEGRA210_CLK_PLL_P_UD] = clk;
>>
>> Isn't it possible to auto-enable the low-jitter bit when necessary
>> during of the rate-change based on a given clock-rate?
> 
> I don't think so. These new clocks (pll_mb_ud and pll_p_ud) are parents
> for the emc clock, so they are needed to properly reflect the position
> of the emc clock in the clock tree.

Okay, even if it's possible to do, I guess that won't be very compatible
with the firmware.
