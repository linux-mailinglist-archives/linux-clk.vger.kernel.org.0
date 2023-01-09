Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECA69662358
	for <lists+linux-clk@lfdr.de>; Mon,  9 Jan 2023 11:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236309AbjAIKlx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Jan 2023 05:41:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237186AbjAIKlP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 05:41:15 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFCE18396
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 02:31:54 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so8627426wms.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 02:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNNA2Bg2H8l2bLuyBCtyD6jA6l2Y0JNnaRMjS+I/nFU=;
        b=TO2d6NkIhQliqQSVJD3GFTooA7F9YByu5IyenUJZSDaCfhy+j/FiqAY6pYVGCMHO6X
         SwPJ30is8h5lgqke0ZpogTV1tAtyZ1+iGf9I/d+vbPmpsLWzrXdQ6fd6aThzis+/NJpY
         x4lC3WBaH5McVsNNPvIOZPcRsdkHKrRXuxJH5X2vLpKIZ8sqVQTax+canncQxaUZ6TQ4
         6CmpVeRySnHrIElJOLsLQeS1ew6SeJTcS0KoSwnQx4qkBioydZJ+niDRbR7G0oTsMaQk
         wQFU7IWVqQPqemiErZKJHT9ey0VtB8f3Sq5pHeW/GwaTBOOMUmVMnoxl7pIJmuzVsOJ9
         MR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNNA2Bg2H8l2bLuyBCtyD6jA6l2Y0JNnaRMjS+I/nFU=;
        b=UeAk+mX04BSXSJHBpGR7rNEoOgXOPmY8HluS2zywhY7ZXcALCnSsxxIlptklE84IG7
         gRgEphHBfHzE44HjbzhU/kHe7ckUmB7CAkBXZEPjI/Vj+/nitIbpTZDiLAecd1NaJJia
         mfwXeRy7qMo1U9Z0xseW/tmtSDm8zcpOmnz2UIVS2OaeaJLV9T3MS3+4VqM9x2wCtPX1
         bDxS8SsQVBvCMi2DseEk7uAucEt24V771U+AfyXbGbrrrfcsS/SlzXpxWJtvSQmPuDkj
         wGFlJL7MrbuVdBQ0DWy0vqb4k7KEtiiuagK6izqfmmGIIS8J3Fbb/teYx3eYDJgGo/qz
         8a7g==
X-Gm-Message-State: AFqh2kpW+XIbnPwsmz7Vqjv0Kn1wV68bB944h4G1tDXBIwM+4LaZUd3N
        Ei6ji7UnMp/rQngVbhpcSdKROA==
X-Google-Smtp-Source: AMrXdXvV7QzMMAVNSAgTaDAOXLPhGuxIfzaA3mcVl/DChX+GMVorkQShhCP/ZdD7kq9fbtT6HhhoDA==
X-Received: by 2002:a05:600c:4fc5:b0:3d9:ecae:84f2 with SMTP id o5-20020a05600c4fc500b003d9ecae84f2mr3382175wmq.25.1673260313580;
        Mon, 09 Jan 2023 02:31:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003d998412db6sm16546190wmn.28.2023.01.09.02.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 02:31:53 -0800 (PST)
Message-ID: <2e52c0a5-3578-c90f-f54e-8cc29f6699a9@linaro.org>
Date:   Mon, 9 Jan 2023 11:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/19] dt-bindings: ARM: MediaTek: Add new document
 bindings of MT8188 clock
Content-Language: en-US
To:     =?UTF-8?B?R2FybWluIENoYW5nICjlvLXlrrbpipgp?= 
        <Garmin.Chang@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "richardcochran@gmail.com" <richardcochran@gmail.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
 <20221230073357.18503-2-Garmin.Chang@mediatek.com>
 <33196eef-b1d5-8dd2-7c59-16a73327e8c0@linaro.org>
 <df20ff7bf661b021d5917956af08883f3b9657e0.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <df20ff7bf661b021d5917956af08883f3b9657e0.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/01/2023 11:14, Garmin Chang (張家銘) wrote:

>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-
>>> clock.yaml
>>
>> Clock controllers do not go to arm but to clock. It's so suprising
>> directory that I missed to notice it in v1... Why putting it in some
>> totally irrelevant directory?
>>
> Do you mean move to the path below ?
> Documentation\devicetree\bindings\clock
> 
> If yes, I will change it in v4.

Yes.



Best regards,
Krzysztof

