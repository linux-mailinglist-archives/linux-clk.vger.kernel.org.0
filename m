Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10825774064
	for <lists+linux-clk@lfdr.de>; Tue,  8 Aug 2023 19:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233698AbjHHRCa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Aug 2023 13:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233936AbjHHRBh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 13:01:37 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75063AAFA
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:01:05 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe4b45a336so33455975e9.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510423; x=1692115223;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rq9CGfMIPSDr9ZlL/JERcR7sYpgjvn+r29Kl2qTSWpE=;
        b=D0RXmz9eyvSztFHQXNF/Izikq1UD3tgchvwNRSsyxAEP425Ot12klJIh3e4iqg2f8u
         DzdfwHhKfOz7Dn5eNN9eEA8MhYusUaTyw2+kgVTL50cAg3G2Kqg1Bf22WALHWPvNxaB8
         PBMyClmxVpRxXsM+2NG+yJHu/58YbPDxLbrnLgFdGTSID4vMhsVV8Cg96Xj0DqMKTVfR
         h436dSKftnw5XKlpfMuhSCO0kHv6Y+/dbMx29od+W1xwJ2eMYJXeQo2PxxCyOK0aYghU
         m+ZFE+578m4yiiP9dcAs7t8xt7f9mxFDtwKqKA+JFPUOm0mP0yYH8sULoD5sMkxx6FW5
         BUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510423; x=1692115223;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rq9CGfMIPSDr9ZlL/JERcR7sYpgjvn+r29Kl2qTSWpE=;
        b=VIpA/vELNznPFOFdRWDUdui66h6X3M7sBBk4pKvrebiX2bMkJxApcyQaGjFkbX6kqL
         ypUpl+ftrBGf3dJ83y934ZXINJ7dYG+nDjZGeH6oPHRAiUa63hUr3hGryjEgRRjItjhZ
         b7kAl8f5BwD8tCvU+AgWclskd4yxZOTyh+SFXdN+DTAELeCAcAs7eUK3sXcri4wDUm1V
         JuCawSQQkWQYgQQnr/QTegAcbxIyzj5ebm5S0K4NG3yf0u4Lxf3kizpw0+97PPPpuEoC
         zIgzwgHUDj7IeTykvGiOAAbM0YGSd5nbSnKyXRIbESWMjDgMxpdJ7swcXfw88LdXkBMS
         WUGA==
X-Gm-Message-State: AOJu0YxRq28oUtVTSKC3kcKuDj9dhxv3mnkiwcps5yEIMWHQR7X37su7
        VUOWAAshAK3inkcZmZuWeT7l48gFpADeYwBfWkc=
X-Google-Smtp-Source: AGHT+IHxzkAXBfNJDNcknbZH6tlIYjJNFyXEZDfCnRpxQMJVfuN4V6svYqKu4KC6ef0+KBpYIwyrmA==
X-Received: by 2002:a2e:9f4b:0:b0:2b9:3db7:322f with SMTP id v11-20020a2e9f4b000000b002b93db7322fmr8508153ljk.18.1691492178941;
        Tue, 08 Aug 2023 03:56:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c378c00b003fd2e89620asm17797634wmr.40.2023.08.08.03.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 03:56:18 -0700 (PDT)
Message-ID: <d7cc1aec-17be-502d-47c1-3163a2766ee4@linaro.org>
Date:   Tue, 8 Aug 2023 12:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 11/11] dt-bindings: clock: samsung: remove define with
 number of clocks
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
 <20230808082738.122804-12-krzysztof.kozlowski@linaro.org>
 <20230808-scarcity-sprung-c0c2abc2971f@spud>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808-scarcity-sprung-c0c2abc2971f@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/08/2023 12:53, Conor Dooley wrote:
> On Tue, Aug 08, 2023 at 10:27:38AM +0200, Krzysztof Kozlowski wrote:
>> Number of clocks supported by Linux drivers might vary - sometimes we
>> add new clocks, not exposed previously.  Therefore this number of clocks
>> should not be in the bindings, because otherwise we should not change
>> it.
> 
> This sentence reads super awkwardly, not by any means important to
> change, but I'd likely word it "Therefore these numbers of clocks should
> not be in the bindings, as that prevents changing them".

That's better, thanks.

> 
>> Remove it entirely from the bindings, once Linux drivers stopped
>> using them.
> 
> I figure there are no consumers in other projects then? If so,

Difficult to say, nothing known to me. Anyway these are not clock IDs,
so if anyone actually relied on number of clocks in the bindings, they
would have trouble in the first place.


> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


Best regards,
Krzysztof

