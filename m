Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7F0530BB0
	for <lists+linux-clk@lfdr.de>; Mon, 23 May 2022 11:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbiEWJCf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 23 May 2022 05:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbiEWJCb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 05:02:31 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343D618E0A
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 02:02:20 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id u7so15690038ljd.11
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dlfET5UONJTRSOldsSXnP8VfMZiQfkrQWEQeer/UsdE=;
        b=KRLj4pXWt2o7W1VV0l/wVx0AcbODZvZ5qTc9IhTSoe9KF2JM0D3hmubFBImQ9psh3L
         QCeewgiYglpOJ6XSztimgmABmIIAfOHi9C6YCleGn0wOPmMKQiWDKYqQacc/mULtsGps
         bDztuXUAauEEaNTT6etJjzh4/o8foOV1NuPa+kw7djgPpD0VuAdoy1raZ+uhnoq2vYPj
         0CeJfrtNW/1enVLni8bcCj1MLozx1PuYxfhaJDQPucYewE+k+oXIyrdETEmvpNGlAi4G
         HFwV8opJshXqlZjjy8GbRXkO/cLzfXDloIKAqEhLEfwAfzO4ICqKJn8g8du4spdz3KVE
         vKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dlfET5UONJTRSOldsSXnP8VfMZiQfkrQWEQeer/UsdE=;
        b=kQGZleaUw2iFGwu5yhA5H5+x0SBtV4OQNNnCzdRvGIKdI7HYGp7SCYDlJ4a51We356
         mUH52Wprn3OOhmebomqLpZ5bWR3j2WyjWiPmkp943XiYis+gs7ru/RranvTtLoG3j3Y8
         HFTSTCniSXCVcQeBhtVCllqpkmcNgPmaG/O4s/xnNMrrHNFMFWko7Ca31DVEggFxj8al
         QCeMTT28DrERUzlPBYodkMyXZm5SZb4Ko2hnF4xwWnM+wZD/P4Y9RNiWLfW68qYEgrAj
         pScbHgNUqgxCBwd91LTgAmxYZLtJ9KggcT50GS9msH4TvU2T7IZVmKHJh5KfwhcLAh6l
         UVFQ==
X-Gm-Message-State: AOAM533oThsXX0Jxrp3eybjj0Q4paBxeDWwIoRVcYwXUbtzQeZbUuDdk
        Wm8qquBfO+LLUUznJpD3WC3IYA==
X-Google-Smtp-Source: ABdhPJxvLdpCyy9QQcDde8YxjJo46U2wGyCrj9zc+1giCC5FfKz0vl+qvRHh262fNGonLwftr8mNEA==
X-Received: by 2002:a05:651c:50c:b0:253:e168:f28e with SMTP id o12-20020a05651c050c00b00253e168f28emr6833169ljp.429.1653296538266;
        Mon, 23 May 2022 02:02:18 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y3-20020a2e9d43000000b00253dde4720esm1654866ljj.90.2022.05.23.02.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 02:02:17 -0700 (PDT)
Message-ID: <ec8cb01f-cf9b-2b2d-68ed-96b0b8465537@linaro.org>
Date:   Mon, 23 May 2022 11:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 14/19] dt-bindings: arm: npcm: Add nuvoton,npcm845
 compatible string
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220522155046.260146-1-tmaimon77@gmail.com>
 <20220522155046.260146-15-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522155046.260146-15-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/05/2022 17:50, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 SoC and a board
> specific device tree for the NPCM845 (Arbel) evaluation board.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
