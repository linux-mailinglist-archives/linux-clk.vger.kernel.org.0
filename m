Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E931E530AC4
	for <lists+linux-clk@lfdr.de>; Mon, 23 May 2022 10:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiEWHdL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 23 May 2022 03:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiEWHcl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 03:32:41 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D136B40
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 00:32:17 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bq30so24081999lfb.3
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 00:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=17JqV26wVHdgo28ZqibLwQLBrW+2wdRYXH2zbWrVfCo=;
        b=Ib9IYf1AvLT27iihXTu9RkqmCryClPTfougnJ4FyWIlLyfyQLNoahME9lk60jT7YXm
         jD+7fF0WQXgTnEJ244khLVZ2ruXBE8MS1uUVUlTeK2ut3gzKojOjbTDWEHyZ98VTUslE
         NjdYJQZNiVrEOIgva4BhEJiS4Ewom+kaGwXmokXK9WVHBOaGDsVce74hQ1PaoCqMtfm7
         tmQCCcjUUAYxDvOTYI9RRd+9Bf0ud4XjKoAI+6sp0abtcwlOGdCJsf7ESg6hkRNhtrw8
         nO0lprI8/GsPSj3vbIte8Vsmr0wnD5DbJ9z2/t0tu+2zMycYVUyl8WY7wWrEoa1qh7HP
         gHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=17JqV26wVHdgo28ZqibLwQLBrW+2wdRYXH2zbWrVfCo=;
        b=u/5ZG3D/HdrRYupJGr/of/JMyIJWITuQSTuDQNVhF0gb87sLBSNQWwj10qlX37v0xH
         Zh0XaomX8coghGrfHIpf6VzIbRoTLC0iaAa8IQ4nBXR3uBr4tssX7M67AI9ZkRLBXtjk
         uJnvJfDuRr4ZZIsLYRj03pz1vTJiEX+2qzSUNKxfx+gGMQH5qceWegF3uPKYZJcqEw2X
         7QZcP/dkqG6cBnxoz8u6LyXiTRYEiXct0HVWbq89VFOxkYVNn7rpe6/cdLpb11V603Tl
         xxGkDU4jMDp12RY+jw4VWu7wYy2oBPB0WldxBMjLjRQAlDP6t5dkCtchM2+1/xCQDFUb
         9dWQ==
X-Gm-Message-State: AOAM530tOA5G/VmQd8FhJERyVOo1wrq/xr3fOtYJ78ICKGfBhavazgP7
        +nuJMhEAxG8tY1/ViQW8SsQDwg==
X-Google-Smtp-Source: ABdhPJwr/sSdCGIN0en6yM1a+IjJKGEZWdESs2RUoX6hwQ9lIqGKLwQqPAREwe3x2yxzBpnbbnpjpg==
X-Received: by 2002:ac2:43a1:0:b0:478:5867:5047 with SMTP id t1-20020ac243a1000000b0047858675047mr9556576lfl.37.1653291135678;
        Mon, 23 May 2022 00:32:15 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id r5-20020a19ac45000000b0047255d21167sm1828342lfc.150.2022.05.23.00.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 00:32:15 -0700 (PDT)
Message-ID: <d48f8b9b-92e2-2fc9-6d06-0b1496768d4e@linaro.org>
Date:   Mon, 23 May 2022 09:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 03/19] dt-bindings: serial: 8250: Add npcm845
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
 <20220522155046.260146-4-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522155046.260146-4-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/05/2022 17:50, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 UART.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
