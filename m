Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECEF5068E7
	for <lists+linux-clk@lfdr.de>; Tue, 19 Apr 2022 12:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbiDSKo2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 19 Apr 2022 06:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350703AbiDSKmh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 06:42:37 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DAF112752
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 03:39:54 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id s18so32080146ejr.0
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GL2fYhpPazaoZcNVvKzwIzbLVWsgi0SqDsBRdlVnGFE=;
        b=gU9fKApCIgWofdlZwPbCJoYJui79+QQoAMZ+f4btrxoIXH53zopKm0uPJ6pUKWZsWc
         gnHSKHPdLUXuvoNRjU+smc3AFSRKapOOz1l2A93Tr56xhzFtCnJXZICCsNTEIC1QOjAa
         y6WteyMqxwZuUXv/QrGy3nvxqzSXhWUi/WnOFo7DxBeRC7XHUww41gI6cmkEmdHIG3yI
         O+364XZYQDQEFok1MDIIefNvKaokOD8yWwKrqQcpAO+hLsVB3TThs1dInqp38Bbkugnt
         hvuYkI1b/6lQWTaNWVFQR4iYI+csOEqjepIweK8TweLlm0GihscIjXij9HRmrPOmDhLn
         2+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GL2fYhpPazaoZcNVvKzwIzbLVWsgi0SqDsBRdlVnGFE=;
        b=dwEvrE267ZBiOvXR6v+Y0bYAiTjdYg+TnO933ll0r4oehVFDnEvhCnBQ4mZSkV5eFX
         QOmqWvvbeF91btInvBLfn7PSTRtyhTqoHGa5DKQ1xyErmEvoCeXP6aVQ8cdxlHQ/5Vr7
         mAblBmzwhGwNqe8NaCa5EPUGXRzpFL6KBZr16hLrCCqAwpGYLDNY6yYPpKR05KmCzQ+g
         X0aheX9gib93f7Zba+D8neNBaOqgRZwfI/K+rEwy755vf+VJSpBMMp1etKJGDgnNVelo
         l8m2lwioo3Yz9g2lDQdEY838zjDndP8HdxrFBkE1fIsA97fZLtRa9h58N9lFXzTgDVL/
         alQQ==
X-Gm-Message-State: AOAM531xjYDlceQDH5Zzw4aSMqFg/C4LP0tqLOpmEkKd6ek4X5JMU9JP
        f4cigwNy1fMG0DRBOg7ioNTs4g==
X-Google-Smtp-Source: ABdhPJx155Ovc/3OaXt56VJVSQL+8VeYbvwvfy68N2lcRmJQt54ZzMqfT/zGyNp+W/WNmFB8c5CVsw==
X-Received: by 2002:a17:906:9c09:b0:6e8:89e7:9807 with SMTP id ff9-20020a1709069c0900b006e889e79807mr13019845ejc.473.1650364792867;
        Tue, 19 Apr 2022 03:39:52 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lb4-20020a170907784400b006e0d13f65e5sm5502888ejc.167.2022.04.19.03.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 03:39:50 -0700 (PDT)
Message-ID: <b2e32685-73a6-98be-50be-5121c67431ed@linaro.org>
Date:   Tue, 19 Apr 2022 12:39:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: Document MA35D1 clock
 controller bindings
Content-Language: en-US
To:     Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
Cc:     robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        arnd@arndb.de, olof@lixom.net, will@kernel.org, soc@kernel.org,
        cfli0@nuvoton.com
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-3-ychuang3@nuvoton.com>
 <2f8d2f6a-32dc-15cc-321c-f75721edf8a2@linaro.org>
 <29b00c24-681a-7f6f-f27d-b7525c5b8485@nuvoton.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <29b00c24-681a-7f6f-f27d-b7525c5b8485@nuvoton.com>
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

On 19/04/2022 12:12, Jacky Huang wrote:
>>> +
>>> +  assigned-clock-rates:
>>> +    minItems: 5
>>> +    maxItems: 5
>>> +
>>> +  nuvoton,clk-pll-mode:
>>> +    A list of PLL operation mode corresponding to DDRPLL, APLL, EPLL,
>>> +    and VPLL in sequential.
>> This does not look like a binding which was tested. Read
>> "writing-schema" and test your bindings.
> 
> "nuvoton,clk-pll-mode" is a nonstandard property used to describe the 
> operation mode of
> corresponding PLLs.
> 
> (According to Device tree Specification section "2.2.4 Properties"
> Nonstandard property names should specify a unique string prefix, such 
> as a stock ticker symbol, identifying the name of
> the company or organization that defined the property. Examples:

I am not saying about property name. I replied under some description
below which fails to build.

Instead please test your bindings.

Best regards,
Krzysztof
