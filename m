Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C266E2B1F
	for <lists+linux-clk@lfdr.de>; Fri, 14 Apr 2023 22:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjDNUcb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 14 Apr 2023 16:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjDNUca (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 16:32:30 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C46676B3
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 13:32:27 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ec816d64afso165203e87.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681504345; x=1684096345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pF8wYlTRr7UhJmkBBdIJdcpPe42pYWprHEZ8trWKnL8=;
        b=vUo2RawMzewrKvOpzDihQ3ZxDMiNBGASJoUa5Xt11CyZ2Dzeys+3KErZRBEu5273S1
         TBYBKOxB3RmhwRc5OVgu0Z2+KJm5qOHP55KcUWwiMHbZ7T3xyNDdt1H6O+NEqsBAHFKV
         JlJdJGcrbx/ApxD/nSD5nphcQeoW0LyIBhS/lJIVuLSe+FgpOoZcr0B9WSOaa4alE/Ad
         v8hnqrFOCMn9CAiVCxICOShT1VVTs8DpknLYf5070+BBDolYf8649baTIjqYf0MdLGZw
         3fmcRQBt8g5TsjfI1IyYjkuUD0zVpfArZX76Wra1aJ0/kMIygKJgOlZKH8X2IpF4wrWG
         5r0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681504345; x=1684096345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pF8wYlTRr7UhJmkBBdIJdcpPe42pYWprHEZ8trWKnL8=;
        b=Cc7DQ/gsPziM/UTgR5enPxrQdiVi6LuCaWJA0qX38PC4vEQ2UdxDUR8tA0dh5Q9Er7
         5rTbKXoJj778jNMHrkj6H4/lUYAhZjUNckxU4jAuDbl9AOultoIa0i41S6qZM1TOTSKJ
         lQau6KN5rhTdZ7s9Yxq433BdnNO9QUb0gsZAmUWMIeHhGPv0El9BOeeuc9OGuD5KwCRH
         uxXra9zEROrCD99hLhYp1X26EFqlI2HCx3FAW6Mm2STINFniZjgpNYddX1jKFeWmexi5
         2md2MKxSYdqFildK2EuSiRCb9c4BKN8Vm7BlHAaj+O5hrqbqD2z14BDdIx/j2/yxzpN/
         JHsQ==
X-Gm-Message-State: AAQBX9fSfag+KihnrpBdbc5QXs36aUAp1U/FnGUvpgZwn0XEki5PG0YZ
        K400hyQesPOh3wpDa7HOtxBlXA==
X-Google-Smtp-Source: AKy350Z0WYbGj4bk7grD+6NmVk3+WiGz+Pgt8Nt3XfsGmQsf/NVlYrV9tSMJOjBSRzIPEPCFG+gf8g==
X-Received: by 2002:a05:6512:230e:b0:4e2:7ab6:15cd with SMTP id o14-20020a056512230e00b004e27ab615cdmr26508lfu.30.1681504345630;
        Fri, 14 Apr 2023 13:32:25 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id h4-20020a2eb0e4000000b002a0d3a51a55sm986956ljl.91.2023.04.14.13.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 13:32:25 -0700 (PDT)
Message-ID: <ed35e238-77f4-862a-c536-97428ce03a2b@linaro.org>
Date:   Fri, 14 Apr 2023 22:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add SM8350
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230413-topic-lahaina_vidcc-v2-0-f721d507e555@linaro.org>
 <20230413-topic-lahaina_vidcc-v2-1-f721d507e555@linaro.org>
 <20faef75-9182-6e67-8ac5-c8234318ab64@linaro.org>
 <CAA8EJprnD0jSH7JvhoEnqhNxC55TeqCvvR64R7U8Ni7M93N2eQ@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJprnD0jSH7JvhoEnqhNxC55TeqCvvR64R7U8Ni7M93N2eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 14.04.2023 18:45, Dmitry Baryshkov wrote:
> On Fri, 14 Apr 2023 at 18:18, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 14/04/2023 13:26, Konrad Dybcio wrote:
>>> SM8350, like most recent higher-end chips has a separate clock
>>> controller block just for the Venus IP. Document it.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../devicetree/bindings/clock/qcom,videocc.yaml    | 29 +++++++++++++
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Krzysztof, Konrad, would it make sense to split it into separate
> bindings? After all, previous videocc bindings used clock-names, while
> this one doesn't.
I'm fine with either of these. Your call, Krzysztof.

Konrad
> 
>>
>> Best regards,
>> Krzysztof
>>
> 
> 
