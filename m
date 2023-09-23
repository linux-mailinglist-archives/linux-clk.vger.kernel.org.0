Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C21A7AC37E
	for <lists+linux-clk@lfdr.de>; Sat, 23 Sep 2023 18:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjIWQOC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 23 Sep 2023 12:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbjIWQOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Sep 2023 12:14:02 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3CD1A8
        for <linux-clk@vger.kernel.org>; Sat, 23 Sep 2023 09:13:54 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-405361bba99so33484495e9.2
        for <linux-clk@vger.kernel.org>; Sat, 23 Sep 2023 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695485633; x=1696090433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3GPALuMdv79HvlC+hoZ6VG1EHRQP+s5tmU7+XY0FYc=;
        b=ClG2By/cMyY0KjAglM5SgraguMJ4fjqI4WpIKLFw/m70ESSjoCHed024p1Y7RQn8LK
         ZSy1ogPk2mbjvgo7tXgEC/IbCqpDH+N1tttfuEeSQguGZODhuE1ZMR7UTCpN59/3nkEd
         zEjLNHoVY4TyeC75ERVOVvKl10rGMZwjX25MITZMy1+UIQGYoToIPupnEk68Pf1SdnRs
         t7f0Fod2koMOZAHGA7XBgmLUZXNrXPQMVWA4ZMMZ3+buzgVLsWA3JDCy4bmPW56Lg2qm
         W1Id5258UDm0zmRbGowzNZuvn1tWbtAbfb0HcJ/Arln5ueFbbJLh97OriVJe6kn7Bc83
         eVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695485633; x=1696090433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3GPALuMdv79HvlC+hoZ6VG1EHRQP+s5tmU7+XY0FYc=;
        b=c8ZjRltZmhX57jI83knAlmXUeiNSSo5DDLlQUbB4pG90n5VtE/UDAs46ebqJgqxHOg
         D/8aJdZ8pr0YECFfUpBYifyMq0zn8QfUPieEKxI/f7LjA2dxEq0c3yrpkbDmE5tEnwF4
         R0WFf/ZGIAvo4g88cxAMsdFXBmdgjVCe8CeUKCzrAs9V4eM2Y0gme1NGNuyUvECe1Sj8
         cku4m3U6C4YzzCcr//NJELgKrALI8colnql4AyGMXWhDEspK7/HIMHgbhPdc5u+M6D0R
         YqfBvmIRB+gpLkB5GIJDqJdBk1NCQtgBdb1FyMo5r5Lz5p+FF4TVUdB+xPhw6r5qON7e
         E0+Q==
X-Gm-Message-State: AOJu0Yx3Qtsht9tjfrmmP7EG9BqOuuVflOzr7pfE+ee3qB4lGAy+/bEs
        z1/7h2tAAjNv7FQ4GYrldxMAyA==
X-Google-Smtp-Source: AGHT+IHHe4O8Gl1Pz9vuF+FUyauFGLf3UWI1UeRDSJWmeFc3tra/aeE7n0vnMDUSKJbPcq+/bdiBxQ==
X-Received: by 2002:a05:600c:230e:b0:401:be77:9a50 with SMTP id 14-20020a05600c230e00b00401be779a50mr2123760wmo.8.1695485632696;
        Sat, 23 Sep 2023 09:13:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id f18-20020a7bc8d2000000b00401d8181f8bsm10399974wml.25.2023.09.23.09.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 09:13:52 -0700 (PDT)
Message-ID: <2565aa33-619c-6c90-de96-29dc5ac5d961@linaro.org>
Date:   Sat, 23 Sep 2023 18:13:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom,camcc.yaml: Convert
 qcom,camcc to a single yaml file
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230923150045.1068556-1-bryan.odonoghue@linaro.org>
 <20230923150045.1068556-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230923150045.1068556-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/09/2023 17:00, Bryan O'Donoghue wrote:
> Move the various camcc yaml files into one. The Camera Clock Controller
> is pretty similar from SoC to SoC.
> 
> Mostly we have some SoCs which require fewer clocks than others. In some
> cases we have SoCs which have required-opps and required-power-domains.
> 
> It is likely we could and should extend the thin CAMCC descriptions such
> as sdm845 an sm6350 to the more robust descriptions such as sm8250 and
> sm8450.
> 
> As a result of listing sm8250 and sm8450 together required-opps and
> power-domains become required for sm8250, which is a NOP for the dtsi
> since both declarations already exist for sm8250.
> 
> sm8250 is also chosen as the example for the new combined camcc.yaml.
> 
> A minor tweak to fix Bjorn's email address in the Maintainer list is
> included.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

No, that's not the right approach. For GCC and CamCC and all other
Qualcomm clock controllers, we split into device schemas, not merge into
one. The one schema is just becoming unreviewable over time with
multiple if:then clauses.

Please use approach like we have for GCC, RPMh interconnects or remote
proc loaders - common file. What's more, here you probably don't even
need common file because it is already there - qcom,gcc.yaml

Best regards,
Krzysztof

