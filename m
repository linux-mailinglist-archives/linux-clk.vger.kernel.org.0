Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63ADD509ABC
	for <lists+linux-clk@lfdr.de>; Thu, 21 Apr 2022 10:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386678AbiDUIgC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Apr 2022 04:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386697AbiDUIgB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 04:36:01 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2971A1C128
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 01:33:12 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id s25so5506338edi.13
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 01:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7hLXPIweBUa1OCSsueogoc1wGUx6MfJz9AL8E0t93jg=;
        b=U4hZWxQ15Dqk0wtSihPrY5dFY+Zd20Mw5s2nwZe/wuuUZNAPoYt6v3Y+Pk721XjIMY
         fN54vNkZUqedcCEZVb9LaQvCq4jyFloChkMzBlAMlwXRBBMOpjl3jV7yzfnn1L5h7d8f
         gjhu4UIgZeV4rPAHSvnAV2Tru+nY6L+szdOV0wm5scuOBPPtQ2b9FU3br17C+1P9v2my
         QgI/tuS6cJ4JdJCR74VtChP6CVi2iuGRe1XLq1ScwUPPjqsO+4RxTHGfZIg4aH9V8kPV
         xLTZEN0Zs5SPdj1FWHSeNgQ9DPxTfBTZwvt72oMiooqYosg12DekYECdb8i0nE2r9shF
         7FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7hLXPIweBUa1OCSsueogoc1wGUx6MfJz9AL8E0t93jg=;
        b=N4m7q/IOdUGpvgStQHRINfmUrRe8o2ilR8r89+XUUXsgZaHOazmyeybf+8iKTWfLWs
         U39vfttb6pEL/3Ha+uG3nn7s2hPNHAH9bx14AvxpzF6lmFgO/RgGhnXEHnnPqxvMmhIJ
         Kz8OPTIXnVEJhDFmUfNeLrk5zW20y16RkKpn07jukKLFenn3/8qk9EspDFRinG3Z2PTv
         iCZO6d+/cEIMjR+S0Y/Dt6VCFClBtS075sCMLjyzuivWV1X53hFpWhvyCnwkFTlU3XOE
         C9FG+CHzIfxfHmH7D9Nyr9CmufbcvQJXD5oa5DSuC5dKqOUVSsamsf9nSd7ny7dvbSk7
         6fCA==
X-Gm-Message-State: AOAM531qrHig6bJkRYu8bQTV4vI3z8LqCKBI2uF9ukJYy9vY4zdgTKAU
        2lTiMNoJ4e2skb+BwWSxgQC6hg==
X-Google-Smtp-Source: ABdhPJyNiZUR5/1EAoV+iZUhUgCKupJDomQq/+l5hKN9S0IbtjtPAKPEGxqD9/YunVEWQ5kpF8Kh7w==
X-Received: by 2002:a05:6402:51d2:b0:424:536:94dd with SMTP id r18-20020a05640251d200b00424053694ddmr12066971edd.191.1650529990792;
        Thu, 21 Apr 2022 01:33:10 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709063bc800b006e898cfd926sm7546603ejf.134.2022.04.21.01.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 01:33:10 -0700 (PDT)
Message-ID: <51f47c39-4bd2-b378-2868-587c07caf399@linaro.org>
Date:   Thu, 21 Apr 2022 10:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/5] dt-bindings: arm: Add initial bindings for Nuvoton
 Platform
Content-Language: en-US
To:     Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
Cc:     robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        arnd@arndb.de, olof@lixom.net, will@kernel.org, soc@kernel.org,
        cfli0@nuvoton.com
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-6-ychuang3@nuvoton.com>
 <fd9316a6-7df6-e1fa-50dc-ff50934afb5c@linaro.org>
 <caf4867f-7f71-9262-f190-463325eb13ab@nuvoton.com>
 <4e9eaede-2208-bd73-35ae-89e128562653@linaro.org>
 <80994f4b-136f-7669-4674-0c9826e88248@nuvoton.com>
 <43cb61ac-461f-e6ff-b495-44f8befde79f@linaro.org>
 <257d878e-8455-2770-7868-c9445b0eabba@nuvoton.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <257d878e-8455-2770-7868-c9445b0eabba@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/04/2022 10:13, Jacky Huang wrote:
> OK, I got it. Like this,
> 
>    compatible:
>      oneOf:
> 
>        - description: MA35D1 based boards
>          items:
>            - enum:
>                - nuvoton,ma35d1-evb
>                - nuvoton,ma35d1-iot
>                - nuvoton,ma35d1-som512
>                - nuvoton,ma35d1-som1g
>            - const: nuvoton,ma35d1

Yes, exactly. Thank you.

Best regards,
Krzysztof
