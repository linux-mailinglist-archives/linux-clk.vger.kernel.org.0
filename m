Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B99A587753
	for <lists+linux-clk@lfdr.de>; Tue,  2 Aug 2022 08:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbiHBG4n (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 2 Aug 2022 02:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbiHBG4m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Aug 2022 02:56:42 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4674012ABF
        for <linux-clk@vger.kernel.org>; Mon,  1 Aug 2022 23:56:41 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id w15so20580143lft.11
        for <linux-clk@vger.kernel.org>; Mon, 01 Aug 2022 23:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iMuU/+kBv7uQa4ksnz3y5D5RzasCJO1LvoyYUaKGIvg=;
        b=GtN8HWU367INLFdwvJTvCAcJiTf5H1KMuMXUneYCyWPDyamQs4mUHvuStc/RT7r5HU
         Zi+wswF7BkyAt76mqmFbM/sZII3ZzUdoioNkKR76nSTrOCA0H69yVb+mfI52lkVsZWQw
         kDgXhe5KzPGdELLtW3OP4ugB86elJ/G7QO+9WDvub+f69VqGsSMbU5SYFCAbM6F+JTnq
         1uGdaN02Ii6IhOA6jSqDNBrJNdEO/IOnZhJMx1/5RZxpB9j32vNTwX4v/VG+7Es/CMtp
         2zoCqHcVWfMyaL6gxNCIOEIhtit98SA226vV0yBs2FT965xDKSmQe8tZf55TPuOiZh0D
         hhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iMuU/+kBv7uQa4ksnz3y5D5RzasCJO1LvoyYUaKGIvg=;
        b=pWLh7Lmy67JgDntsBAtNEFeko/W8JicHj9UDUGaA0ZrRLdSMbPMAqCLwnJpZXCvN6F
         uOMPhXZ3/PmDQzV94PvAN1OfXe19R8+N+jY9T4CuMYCJK/RyGP6o5hbHDUdSWP/59bzU
         noJfWkStTLNsOhEhluQ41pS9/+ak8Ls8zQZ2/MxmGgzbvg9Qzx35WAkZO1E4NPQQr8OO
         +sDC8uA2W3eN9vsBWn9ge9jfZ9ifZZ0gh+J1hqzyB4CkfBbAVeHnltwqE/tFNTqQuvAX
         y17iAzi1rKe5ohc7znVIBtp2QJ1JxD10S7mTzRhI9cfKkGN6Cj64s4UqPqzv96Ojug34
         HcSw==
X-Gm-Message-State: ACgBeo2nZxrsoeTmRGIVVsRHG5QxAQw+qwG+33uIbW/ciT638dZQXHkQ
        VYoLs4wGBK7oNjW39bNaGGMbNg==
X-Google-Smtp-Source: AA6agR6OD3SyXcazFdvfviRV/qRudnX3giONi9aNPEN0ye5R+PrAzIKJlucO/pfw5lkXeb3Hs1wTsw==
X-Received: by 2002:a05:6512:2989:b0:48a:f4b9:84bf with SMTP id du9-20020a056512298900b0048af4b984bfmr3722655lfb.39.1659423399649;
        Mon, 01 Aug 2022 23:56:39 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id i12-20020a2ea36c000000b0025d55600855sm1800669ljn.25.2022.08.01.23.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 23:56:39 -0700 (PDT)
Message-ID: <008e9a39-07bc-612b-aa49-cb1f32a790b4@linaro.org>
Date:   Tue, 2 Aug 2022 08:56:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 6/6] clk: samsung: exynosautov9: add fsys1 clock
 support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1659054220.git.chanho61.park@samsung.com>
 <CGME20220729003612epcas2p4cd006dcd814ff49583aa44921fbbed5a@epcas2p4.samsung.com>
 <d4aa967538fed9667e9550a256e545026fc2fa8d.1659054220.git.chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d4aa967538fed9667e9550a256e545026fc2fa8d.1659054220.git.chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/07/2022 02:30, Chanho Park wrote:
> CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1, 2 x USB 2.0) and
> mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also supported as a PLL
> source clock provider.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynosautov9.c | 130 +++++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
