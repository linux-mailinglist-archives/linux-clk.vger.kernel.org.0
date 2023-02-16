Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236586991AC
	for <lists+linux-clk@lfdr.de>; Thu, 16 Feb 2023 11:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbjBPKhe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Feb 2023 05:37:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjBPKhR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 05:37:17 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E7D5454D
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:37:01 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id t16so2091034edd.10
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgVLDkztxJ3G36OLnAJF2EJEJwnivSBpqFWk7+ZtCag=;
        b=hq8cbxBlnTEP1Y387FbX9ihGUGylRD4adtj3mfU0oQHmQ/DN4xaYbmAvUQWRHBVzcE
         ZyuAZUA3vuh/G2c8V+42fs/W3qUKOqpZmKz3Yo0D+sXi14cnHf1ywkLPrGSoI1I7DnYY
         dDddxrMMX2DNGaKdI/UkU+jdqDaNp9oes6x5RyKAhT4NUa2QtWnwv+0l9PGcvsZBOTYC
         5tnXNU21Ei0yXCwsNtJ8FLUwZ942bN9yTSUmx+OBLB+CgmRSanNT9gZzJK4nQanebxbN
         ntL2FBGeORVkGrz8Oi7z1Dj0aw3pMNk3wFP+OWhtPxazS5V3Q0V7U4NCpUrml6eSnE+P
         G0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgVLDkztxJ3G36OLnAJF2EJEJwnivSBpqFWk7+ZtCag=;
        b=NjkGLzuJCvSApKiLCUxp7PO/jwZyd3VjAfiyvHrP7tFpzn7XdvOhJd1zLTKfnfFm2x
         FlqT+1oCdkegDLMnT11E7ikyi4UlGubLffz0nJOSBLikGuHz4UeA8lffqiFijgdbaFQE
         EHkMAmbkNJlzgxnNfMJe2itt/vavmdd2tHgSXnKMaORYPwNhwIQkh9eU/sGzBjg9Ofi/
         tCmxPncsPF95M1VGBywN305tPLPvnaeFBC0ArPwad8WD1BC32w/yT8tRkVVDJBEd9vGX
         rKVDOupadmpPuorP8e6ATiK+WPdDv9gHZUHVfXWxmj/nmLwJ9bK/AdBchXjqGWInV64y
         l6NQ==
X-Gm-Message-State: AO0yUKVIKEhZjX6mZ+NFRyt6KLig5m18HbVBgnLJt/dtkpM8yDY1wm3V
        t+VoV48kCCTz4+l/JDY8Q2OMYA==
X-Google-Smtp-Source: AK7set9yVBI67IL9ONWNBCm7c6rfg7ygOe4la3UN4cRKvQSXQhxWqdkt+l/9kjcaN7rk4DC18k2JDA==
X-Received: by 2002:aa7:ca45:0:b0:4ac:b838:a8fb with SMTP id j5-20020aa7ca45000000b004acb838a8fbmr5040893edt.36.1676543811780;
        Thu, 16 Feb 2023 02:36:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y12-20020a50bb0c000000b004ad15d5ef08sm648113ede.58.2023.02.16.02.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:36:48 -0800 (PST)
Message-ID: <5b5b324d-f1a5-faf9-d740-27b6f62cdb7e@linaro.org>
Date:   Thu, 16 Feb 2023 11:36:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V8 3/7] dt-bindings: pinctrl: qcom: Add support for
 IPQ9574
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230214163116.9924-1-quic_devipriy@quicinc.com>
 <20230214163116.9924-4-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214163116.9924-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/02/2023 17:31, Devi Priya wrote:
> Add new binding document for pinctrl on IPQ9574
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

