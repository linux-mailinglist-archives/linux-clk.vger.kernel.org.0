Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FEE40C1AE
	for <lists+linux-clk@lfdr.de>; Wed, 15 Sep 2021 10:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236796AbhIOI1b (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Sep 2021 04:27:31 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52808
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231948AbhIOI1b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Sep 2021 04:27:31 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 47F453F229
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 08:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631694371;
        bh=ptvhp8j3x8Ftji47LhZR4Wys0W2gMYnRB4nsbyxXHrA=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=nH04XNGSn6xeGnsBVWlgCBH4L3qjJZ9Q6lHSeWEzXl+9cOjKdbMOKiUiC4s2YA6Co
         D+lJw9tlJpI0OuZailsBMJ7TP/pROoGN09FKSOCD0pRfb4F1rr1Tg8DhcOYqZK9Wqw
         qBa2uN/IqDq5/q/xdrkAulTPnapSXbNgQJpAF931BA/0Tkm2ZoegJmsyRPpQSOwqz9
         ls6RRa7AprITK+F6aepTumDpg4jAkw2+GlES6UK/pgjSMWepCht0bzss+bw7ypP2xY
         HCqYLIfAj04BETdYx6RriuLOPicqHovt88m2gGbkJGsu8T+ig+jVHaZC8wosSn7jAZ
         BAX5oFhqczCxA==
Received: by mail-ed1-f71.google.com with SMTP id b8-20020a056402350800b003c5e3d4e2a7so1172495edd.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 01:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ptvhp8j3x8Ftji47LhZR4Wys0W2gMYnRB4nsbyxXHrA=;
        b=OJlFrCSVupEn82AsNv8ZVmUNTfBn2x6D6eqQNAZpQHBr8bTCOiwWDQQpEecbQt3yEP
         FQUQOf1924pcwRMjxEzmsV/K8jF7P+j6tDkkX8BW74AIDcgUwB9x34mSICu4RgNG6J7A
         3UmkgkBEoE3ER4oaLOp9EQHk/mR59RIv8TNwfPOhec5sWsnXNN4TxxxZmA9NZRI42MSZ
         sUoJHMQPqWR4ILnDSMcWatWollyv6etOXLiiZ9ggvuAZW0mlZKkUfjJo6R1Z57qOfEoZ
         CDVyT7qYV6eLopCOghBFycUb0M2zqWYyB0Zy9OO7pl1O1Vf39IRdU9qz0s3A8TluupHx
         5SZw==
X-Gm-Message-State: AOAM532gSIO/vGVAD7zZxcPQYecAb1UhFNrxB8DkwJLEB+vZXUERvBKG
        McVuFQsrrzKw/ol14mfW8MBsACDmA+6JnaECUJ1KGcMpnGQ/woBWkzpSxLjQ6452fK16n3MHFqB
        YNqW5E+NOMOoqKbeicENfAHET9uuz1OFQAuSr7g==
X-Received: by 2002:a17:906:72d0:: with SMTP id m16mr23559511ejl.282.1631694370555;
        Wed, 15 Sep 2021 01:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy40iZHAYHG7of77gqMHSsEjCU0O3RP/sEGAl+pwIJiNsr9dTKA2Dzu3UElI7w7k0XRmYtnuw==
X-Received: by 2002:a17:906:72d0:: with SMTP id m16mr23559504ejl.282.1631694370363;
        Wed, 15 Sep 2021 01:26:10 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id a12sm2689234eje.27.2021.09.15.01.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:26:09 -0700 (PDT)
Subject: Re: [PATCH 3/6] clk: samsung: clk-pll: Implement pll0831x PLL type
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4a6e73bb-617d-d849-d64a-7f0de46ea03b@canonical.com>
Date:   Wed, 15 Sep 2021 10:26:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/09/2021 17:56, Sam Protsenko wrote:
> pll0831x PLL is used in Exynos850 SoC for top-level fractional PLLs. The
> code was derived from very similar pll36xx type, with next differences:
> 
> 1. Lock time for pll0831x is 500*P_DIV, when for pll36xx it's 3000*P_DIV
> 2. It's not suggested in Exynos850 TRM that S_DIV change doesn't require
>    performing PLL lock procedure (which is done in pll36xx
>    implementation)
> 3. The offset from PMS-values register to K-value register is 0x8 for
>    pll0831x, when for pll36xx it's 0x4
> 
> When defining pll0831x type, CON3 register offset should be provided as
> a "con" parameter of PLL() macro, like this:
> 
>     PLL(pll_0831x, 0, "fout_mmc_pll", "oscclk",
>         PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, pll0831x_26mhz_tbl),
> 
> To define PLL rates table, one can use PLL_36XX_RATE() macro, e.g.:
> 
>     PLL_36XX_RATE(26 * MHZ, 799999877, 31, 1, 0, -15124)
> 
> as it's completely appropriate for pl0831x type and there is no sense in
> duplicating that.
> 
> If bit #1 (MANUAL_PLL_CTRL) is not set in CON1 register, it won't be
> possible to set new rate, with next error showing in kernel log:
> 
>     Could not lock PLL fout_mmc_pll
> 
> That can happen for example if bootloader clears that bit beforehand.
> PLL driver doesn't account for that, so if MANUAL_PLL_CTRL bit was
> cleared, it's assumed it was done for a reason and it shouldn't be
> possible to change that PLL's rate at all.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk-pll.c | 105 ++++++++++++++++++++++++++++++++++
>  drivers/clk/samsung/clk-pll.h |   1 +
>  2 files changed, 106 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
