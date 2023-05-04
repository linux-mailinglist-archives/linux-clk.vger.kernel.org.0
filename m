Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D7F6F6505
	for <lists+linux-clk@lfdr.de>; Thu,  4 May 2023 08:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjEDGa0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 4 May 2023 02:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjEDGaZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 02:30:25 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC99358A
        for <linux-clk@vger.kernel.org>; Wed,  3 May 2023 23:30:09 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so13900600a12.1
        for <linux-clk@vger.kernel.org>; Wed, 03 May 2023 23:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683181808; x=1685773808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DsEju73RgQljsuUtQoc4O04dfIOFlaIzv582jF9psSU=;
        b=ChWIGLTWtDYofc/YHyzWotY+mqBpLcTIYu8Tj6wrEyp6YyanHHQf5ERMIR6jHaBorB
         5d03hTHOuC6tHTo4HgKdDRX/ss8C7xTwXkEmL/kh784DOIblqEHEbhR1TqWG5Fl2sWFm
         sfF6A6NG6wxvGAgk9fQMU8eBfbP/y4pXNYtUybszTUuoPqh9YBBKGRZt7540Sj9sBbFE
         bGX3m9qGTA+MGGhdnPK68TSjYDcSgOccKdO9Uy8uEoQHvS58In5JbLdRJLkZ0UaJJ3Cg
         aBbAFCP/iH5/clAyA7uhBIodlfqAUs9cjQrRAa1dzHpZ7kFnZDqc3BF95WpXyhv47gzj
         Hk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683181808; x=1685773808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsEju73RgQljsuUtQoc4O04dfIOFlaIzv582jF9psSU=;
        b=GA8E2RqpD2kYfYiZuoWsaMUJCRGlJXieTPix3A7ns/ZhU+ZJIJzBA5v29Bw6BvrNcu
         jsl0lnyEFwvYmhaQE0npSsBukCRly9o15bonV9ZHEX1Ov2KnslyRX7xNMKGf0GQQ7S6R
         hu9ykeU8Zc1jcL/32cvqiAjv/rujUNzcx3GdgHZKVhQk+Hn+fnDwsb2p//Lcy4FxSsgD
         7Y1Amu1Xq/7JQc4LemAfoNH7kPh2qXSkd/WBPsHXdnDIa1vRTJk1h9Tb1uXBNdidHL3j
         xXakkoDkiJC0c03pHIxwUyAsu3xjLRYEcCzoBG8klAKvGxS7y+MQRxoylG5jSrYvhbx/
         VldA==
X-Gm-Message-State: AC+VfDw69vE0CwukKSTOpJ8FEGjBTsQzr0b9uQN4GhSRjZH1xd0CiEMg
        0x36WxUP63IFVVRMAFWli41Elg==
X-Google-Smtp-Source: ACHHUZ4sqSN0jb7OKc+D2v16xfNqvAng0D/yGOGO2XaZu2NFVifTNmHjGwSkJ7MYr7yFOSH9gXoIgQ==
X-Received: by 2002:a05:6402:2713:b0:4ea:a9b0:a518 with SMTP id y19-20020a056402271300b004eaa9b0a518mr488840edd.17.1683181808202;
        Wed, 03 May 2023 23:30:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id u4-20020a05640207c400b0050bd7267a5csm1486226edy.58.2023.05.03.23.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 23:30:07 -0700 (PDT)
Message-ID: <a34e8809-7c49-c482-c7d4-8c7cb5742351@linaro.org>
Date:   Thu, 4 May 2023 08:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v9 07/10] arm64: dts: nuvoton: Add initial ma35d1 device
 tree
Content-Language: en-US
To:     Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        tmaimon77@gmail.com, catalin.marinas@arm.com, will@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, arnd@arndb.de, schung@nuvoton.com,
        mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230504033726.93-1-ychuang570808@gmail.com>
 <20230504033726.93-8-ychuang570808@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230504033726.93-8-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/05/2023 05:37, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add initial device tree support for Nuvoton ma35d1 SoC, including
> cpu, clock, reset, and serial controllers.
> Add reference boards som-256m and iot-512m.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  arch/arm64/boot/dts/nuvoton/Makefile          |   2 +
>  .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  56 +++++
>  .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  56 +++++
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 232 ++++++++++++++++++
>  4 files changed, 346 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>  create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
>  create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

