Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51697583BC8
	for <lists+linux-clk@lfdr.de>; Thu, 28 Jul 2022 12:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235301AbiG1KJv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 28 Jul 2022 06:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235889AbiG1KJl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jul 2022 06:09:41 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91CC53D32
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 03:09:39 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id m12so2129592lfj.4
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=BUqatnFwzy7O1x1Y7oCnQMez3coEtfR7Z07+z2mqDIM=;
        b=E/+uSTOSDSMvIY911TS6NsLjCU2k5JY7OTPnQwHkFPfSSxSmQGgjn1sEpME7hms5ZR
         udL2kU6KX8ZxUX99L46psZjfg3TT5nvmXLXWfHc/d9bggduvWGgRDkWgumNGS/Zel5fu
         ZEqZRpZD4u5xuxoz/bZkGwJstGQrFfUmURRspcm4jdU8imSn92Rudp12WY0adZGvFzNE
         4eRsD29SasU+m/xUUqqfrrZRIiCJj/8fE/P3bZ4dgAfc+jVo/OhicYsvtKdLZas86Gcg
         zgnuxQQg71FxjYslCFtwEdvfHAtPgvytwVUXUgeMWsVTG0lwxUyOGrMutbMuFr9rlSuX
         /Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BUqatnFwzy7O1x1Y7oCnQMez3coEtfR7Z07+z2mqDIM=;
        b=KVw7e7fxBLSI2kPEPnwDHWA5H3BND78+39y44/5TeNHyzc2U7pbM0lcQhcpZ3TOokW
         2zMBL/UvKAMuI8tHUxaQ4l+xXrChrJgdntDe7rx63qPj7ncHmx4MubJ7DiRncnuMP/EA
         gnT7tRGY22RuvgMBifCVd6G0UG8pq4LV+eLNNKZ9XaZgM3wJxsBSSZMSysW4EARTzsdv
         1qPczX2ZBwmhdj+tlp8dYbPcmBsmutX3nF1czyJPewfDt3WUzhvo8eCqOmZImM1snT80
         cwUmeG2PJpOUIWBu7J3g3P94ffuIKoMIAHsMelWyJctPII9F0trpjAcshCPN71gm6otg
         Srsg==
X-Gm-Message-State: AJIora98PsSGtL5xUTssIZR79CHKjfmE1MHBqgOYsWN+I8lRz9P/Lkx1
        ZoWF8YSpUUiBDLZoyXY7GOj4GQ==
X-Google-Smtp-Source: AGRyM1vweiBCNpCytMP732q5tdxS2gLMfJ+RJ+bhKD3ocWCdE4ymh77QcXFo4IWFINCqGpkFYitrnw==
X-Received: by 2002:a05:6512:b21:b0:47f:752a:c140 with SMTP id w33-20020a0565120b2100b0047f752ac140mr9193515lfu.349.1659002977983;
        Thu, 28 Jul 2022 03:09:37 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id 10-20020ac25f0a000000b0048137a6486bsm125870lfq.228.2022.07.28.03.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 03:09:37 -0700 (PDT)
Message-ID: <39395257-703b-a5e9-17c3-80f79f67fdc7@linaro.org>
Date:   Thu, 28 Jul 2022 12:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V2 1/3] dt-bindings: clk: meson: add S4 SoC clock
 controller bindings
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <20220728054202.6981-2-yu.tu@amlogic.com>
 <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
 <74cd833a-4773-eeb0-80aa-75ea1cdc093e@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <74cd833a-4773-eeb0-80aa-75ea1cdc093e@amlogic.com>
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

On 28/07/2022 12:05, Yu Tu wrote:
> Hi Krzysztof,
> 	Thanks for your reply.
> 
> On 2022/7/28 16:41, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 28/07/2022 07:42, Yu Tu wrote:
>>> Add new clock controller compatible and dt-bindings header for the
>>> Everything-Else domain of the S4 SoC.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>
>>
>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index c1abc53f9e91..f872d0c0c253 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1775,6 +1775,7 @@ F:	Documentation/devicetree/bindings/clock/amlogic*
>>>   F:	drivers/clk/meson/
>>>   F:	include/dt-bindings/clock/gxbb*
>>>   F:	include/dt-bindings/clock/meson*
>>> +F:	include/dt-bindings/clock/s4-clkc.h
>>>   
>>>   ARM/Amlogic Meson SoC Crypto Drivers
>>>   M:	Corentin Labbe <clabbe@baylibre.com>
>>> diff --git a/include/dt-bindings/clock/s4-clkc.h b/include/dt-bindings/clock/s4-clkc.h
>>> new file mode 100644
>>> index 000000000000..b686c8877419
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/s4-clkc.h
>>
>> Filename with vendor prefix, so:
>> amlogic,s4-clkc.h
> It's fine with me. It's mainly Jerome's opinion.

To clarify: I understand such naming might bring inconsistency, but we
want to bring some order in the bindings directories. They keep growing
and at some point the model names might start conflicting.


Best regards,
Krzysztof
