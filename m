Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED6350F13B
	for <lists+linux-clk@lfdr.de>; Tue, 26 Apr 2022 08:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241728AbiDZGnX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 Apr 2022 02:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236675AbiDZGnV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Apr 2022 02:43:21 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67146336
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 23:40:12 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y3so13630681ejo.12
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 23:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YQBirjcHw1XssjMgenO6HRfRZsWWatGT2BxMsOHFYCE=;
        b=IBjeDJUQPPgNrNiqtJATmu07ecSQmbmK+jJQ9Qkqm68KYBT2mZNkWUVJVPy5PP28iC
         ZZ5YiSPdZxmlFb9F21Hv6A+edHNDWn1wc2SnbnTRFUMJQVRVZYnI6etGe9iHNhOZg5fG
         RMKKEG/rXDg2iKI6iDxzFMiZH+w+BxAN7X+a15HLRXcrIZBPXGDDzgfbFlnhh5Mo+Xwc
         5QLsw9I2ampq1hTraxXnKTLSoGq6LkPZCV7WBSQhuah3W2lWXHHgu1iftsIPNLV/YbGG
         MGepN8bjr7Iauo5KoUBkHqk4ReN7oFG+cfLmxYq0peiDALMtxKCbbfG3TQ89HGsNxOcy
         k0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YQBirjcHw1XssjMgenO6HRfRZsWWatGT2BxMsOHFYCE=;
        b=lLA0T73k8gl7yzNyAaEE0CotaPvBMStJsCYnC/+yeBMxjDZ6pehOwyQgvWIA0TYGpQ
         grixUtUlVOSDJLMpvRoHAf+Wtj737fIyTl05I0OnC2z+ckZyZu0lKn6IEAUOQk5xIX57
         BxT76cxKoYr3hkAvKE4jWYPvzMhBWjEzmDThyb5I/sReWAptaXH+eW9+uwAYYvhnQwAQ
         QiOw+IIS9MqkBeu9qQtJ1hft6JR6z6YheuDwApSXg+5w24gxDOyxZ6dfxMJXXGVnSMgr
         9+3R0krc3RIB3XbdaJO5ZIEbdpyzdGa8zsLHlwKb03XYufYpQ0/VV+YPaNl8pexH2Ec/
         ab1Q==
X-Gm-Message-State: AOAM5306mP13i0QgUj15HjHk8FQhYAX4p8UziTSLfvQzriEdYS+tDNzu
        Aa58Vc79MM9880FaeUUXTRd5jw==
X-Google-Smtp-Source: ABdhPJxZhXFQhcEzCB8B5dlgOiWdecKG+rf6v1oIMQ4/m9NvZbzVShnAUy6VkZ6totD6LEgaHzmIYQ==
X-Received: by 2002:a17:907:8a0d:b0:6f3:a595:6136 with SMTP id sc13-20020a1709078a0d00b006f3a5956136mr4544804ejc.54.1650955211482;
        Mon, 25 Apr 2022 23:40:11 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r13-20020a508d8d000000b00425d3555fc6sm4309024edh.30.2022.04.25.23.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 23:40:11 -0700 (PDT)
Message-ID: <8498c0b4-ed1f-b4a0-d53c-a7addf75ea66@linaro.org>
Date:   Tue, 26 Apr 2022 08:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: clock: qcom,gcc-apq8064: Fix typo in
 compatible and split apq8084
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20220425204001.710238-1-krzysztof.kozlowski@linaro.org>
 <20220425224000.CB7F3C385A4@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425224000.CB7F3C385A4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/04/2022 00:39, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-04-25 13:40:01)
>> The qcom,gcc-apq8064.yaml was meant to describe only APQ8064 and APQ8084
>> should have slightly different bindings (without Qualcomm thermal sensor
>> device).
>>
>> Fixes: a469bf89a009 ("dt-bindings: clock: simplify qcom,gcc-apq8064 Documentation")
>> Reported-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/clock/qcom,gcc-apq8064.yaml      |  4 +-
>>  .../bindings/clock/qcom,gcc-apq8084.yaml      | 42 +++++++++++++++++++
>>  2 files changed, 43 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
> 
> If it's generated with 'format-patch -C -M' does it detect the copy?

Nope, and I think these are default. The files are not that similar,
because while copying I cleaned it up.

format-patch -C20% -M20% also does not detect it. Only `git format-patch
-1 -C20% -M20% --find-copies-harder` detects a copy. I will use it, but
you won't see nice copy-patch.

> 
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
>> new file mode 100644
>> index 000000000000..63d08e82b3d8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
>> @@ -0,0 +1,42 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,gcc-apq8084.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller Binding for APQ8084
>> +
>> +maintainers:
>> +  - Stephen Boyd <sboyd@kernel.org>
>> +  - Taniya Das <tdas@codeaurora.org>
> 
> Please fix Taniya's email quic_tdas@quicinc.com

I wished Codeaurora/QUIC folks updated their emails all over the tree
because otherwise it looks like they do not want or cannot maintain
these files.

Best regards,
Krzysztof
