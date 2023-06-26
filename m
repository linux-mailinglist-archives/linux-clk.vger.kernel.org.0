Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0936973E8D6
	for <lists+linux-clk@lfdr.de>; Mon, 26 Jun 2023 20:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbjFZSab (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 26 Jun 2023 14:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbjFZS3s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 14:29:48 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D99D1BEB
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 11:29:42 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fa96fd7a04so15257845e9.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687804181; x=1690396181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ciOBPyu+sPG/PKmYcGSQsv3KkzCK7Nt7aYmMhEDjDGY=;
        b=j4CEk6ctLOsGMGmJWmlUl/9qeH9Ix3rM02o9HB2xpYBYHlFD7BQ5v4L1g7VKorj0eS
         u+UQ1Q4HEzTwSLikfOUzA4HNfR5a2NOxXMyXV8RhBIjpxxqFpYLTbbQR1r3xoE3IvS9O
         yT6JTc8aBedyR0boA3VZ0O/M9smdhh8yA0Egk8WSz5j0cX/WMinxVhqOfHN/x9XQqbSV
         vk5ZKzNueC/weR+IyeNOCGT74B86kM9gGqBQ7Ek/jkgdvsTe1PQX7Fb9AjhkmTBTS82z
         MsWn0oRUD0wntafSTc5sn1Wt+HHtxP6dg2PuNuVlBfiqbhr1MfUrDYM35dmwIoIyApw9
         57pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687804181; x=1690396181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ciOBPyu+sPG/PKmYcGSQsv3KkzCK7Nt7aYmMhEDjDGY=;
        b=RBaPMiMcNWUbN9zHKFxBh1A1jRoJ6fsFetSdDhXwhBLjWMJ/9BBtysmOWcQqeNHK82
         AccKqE2h3ZN/eqITr3N21f+nZZWdKw+F91wWmWQ/e9+eN7pDAi+Kf+vgsYWR6cgDQJEz
         yeqdGuypQGPgoH4v+8J/X0Ajo3HdpK5q1EHTxhXduoC+Fr8v+p76Qxb0/zj8PcaJPMnK
         zoqOuxUdgPrnVpRDt/zC+AdPSD9sTovmP9mqhC0uLUi/qGB1UOt5AnqlWqsb7xXIO4tL
         Kg+xYZ/IjSyYy3gpubhKvU79BAo7fW3i004d4J9Ppu//E6Je1jtRhWbIMA6TuIKNxtas
         nbGw==
X-Gm-Message-State: AC+VfDwPw6sicjdID1q+eN7EsxOMM/xHACh8o4vCzDoGMUhLTPaec7S6
        Kz7z2c3ecUV11g2h7fGyGbAwjg==
X-Google-Smtp-Source: ACHHUZ6SiiVfSIYwx/dCsp5tW8i7z1sIDCnOdX5N2PHNcEVe4w7x5ZWmNvzNg1eUdrPkf/HUzHz1ZQ==
X-Received: by 2002:a7b:c7c9:0:b0:3fa:7d11:ad00 with SMTP id z9-20020a7bc7c9000000b003fa7d11ad00mr7893257wmk.25.1687804180787;
        Mon, 26 Jun 2023 11:29:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id c25-20020a7bc019000000b003f819faff24sm11383213wmb.40.2023.06.26.11.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 11:29:40 -0700 (PDT)
Message-ID: <6311f26f-79ee-c471-649f-5e0b4629cfcc@linaro.org>
Date:   Mon, 26 Jun 2023 20:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom,dispcc-sm6125: Require GCC
 PLL0 DIV clock
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
 <55b0ca89-8f2e-5383-59d4-6809e813abf8@linaro.org>
 <vnp263d43flny2ibt3n7fbloyi26enqrejnobogplfu5fcj6l3@s7zkxrsi2rde>
 <52c57cab-10cf-2e7e-2c1d-fa6506786d45@linaro.org>
 <jmtjuya4c423rmdlo4ubvvqndbxvgapal5otjqnejdpdd25izp@kewbjmqdu2xs>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <jmtjuya4c423rmdlo4ubvvqndbxvgapal5otjqnejdpdd25izp@kewbjmqdu2xs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/06/2023 19:49, Marijn Suijten wrote:
> On 2023-06-26 18:10:44, Krzysztof Kozlowski wrote:
>> On 25/06/2023 21:48, Marijn Suijten wrote:
>>> On 2023-06-24 11:08:54, Krzysztof Kozlowski wrote:
>>>> On 24/06/2023 03:45, Konrad Dybcio wrote:
>>>>> On 24.06.2023 02:41, Marijn Suijten wrote:
>>>>>> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
>>>>>> be passed from DT, and should be required by the bindings.
>>>>>>
>>>>>> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
>>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>>> ---
>>>>> Ideally, you'd stick it at the bottom of the list, as the items: order
>>>>> is part of the ABI
>>>>
>>>> Yes, please add them to the end. Order is fixed.
>>>
>>> Disagreed for bindings that declare clock-names and when the driver
>>> adheres to it, see my reply to Konrad's message.
>>
>> That's the generic rule, with some exceptions of course. Whether one
>> chosen driver (chosen system and chosen version of that system) adheres
>> or not, does not change it. Other driver behaves differently and ABI is
>> for everyone, not only for your specific version of Linux driver.
>>
>> Follow the rule.
> 
> This has no relation to the driver (just that our driver adheres to the
> bindings, as it is supposed to be).  The bindings define a mapping from
> a clock-names=<> entry to a clock on the same index in the clocks=<>
> array.  That relation remains the same with this change.

Not really, binding also defines the list of clocks - their order and
specific entries. This changes.

Best regards,
Krzysztof

