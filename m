Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F35BAE72C
	for <lists+linux-clk@lfdr.de>; Tue, 10 Sep 2019 11:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390352AbfIJJki (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 10 Sep 2019 05:40:38 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38822 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390331AbfIJJkh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Sep 2019 05:40:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id l11so18737919wrx.5
        for <linux-clk@vger.kernel.org>; Tue, 10 Sep 2019 02:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EvP8VdxeT9t7tUbL1sbXB8asiywFNGNg64KnWS1MW/8=;
        b=fx0cD3Czv3GdpUUuYPp8ntM67i13itk37NvtRJvN4QUDr74dVJQzoFDI6jObe83B2p
         +xPRvHOBSpaAtVL/8EFOyh50dU/ZcJynrU9uOQ0SkeNptDHZiG358g1piSuPRlDvYWBy
         B0sfIlpHaNuMgI+SJNMlf9b/gXmKDsAmYnuHdMT9AcLSTLGwDNMElACI033BYcb+hNwi
         gQVUUqkrVhVIMJYBBH3BssIO+BYkycqFOPvLMJJCJXXbQOYDibf57tU1dO+KBstRXdKd
         xh57B7axtmBptTvINYVJJTa6KcWb3bdwuwnioxfdRBTnEgp1WcSeA7BY4upJEuMHHfzq
         vgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EvP8VdxeT9t7tUbL1sbXB8asiywFNGNg64KnWS1MW/8=;
        b=lqkGD5r86Ks4MplO3fqdhBCmBnMPWBD+O9YwvyJuntMRYfGRfXlmAAv5vKM+a11gEt
         SvFv9sJYrBke18+8PkBzfVVXFVJgfQxYo2uv0MHubFE54fQloMSq61JsGKNvbF/GM+qu
         QQXQQOAW8ywTqYrSZdpm5gasWBCsQWR9GwYSbeAzeKv4retVYrLShtHbURYAXA97bWEJ
         F1wGaXAcgyQ5Q1S1qy5KMqpsXgJdAZ6tNdw74mE9iGB8tlyF8ILzXo0vvAja6llEI5Nj
         h5kfxWl3AWl9Veo9d6TWWn5a3lIO0y6fqV0mNywwB5EONYWjhHyQSKTacr+ghBQ1/fmv
         fFpQ==
X-Gm-Message-State: APjAAAW/Z55kwIP/HY8h3StTAJwaD6ALVT/wyEYNj6Vdj9fNKQIlqJlx
        sYMgdrbv9cqe/Uhr+R1j9jTRFA==
X-Google-Smtp-Source: APXvYqx6YTkbYPaK6pXh6rsNKD+uabJDnvaSqoeCBw1zGtpV0kynKpKx+Y2SZ/kl5pfRwPYHEAMhxg==
X-Received: by 2002:a05:6000:1187:: with SMTP id g7mr24899704wrx.192.1568108436046;
        Tue, 10 Sep 2019 02:40:36 -0700 (PDT)
Received: from [192.168.1.6] (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id r9sm30444286wra.19.2019.09.10.02.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 02:40:35 -0700 (PDT)
Subject: Re: [PATCH 2/5] clk: qcom: apcs-msm8916: get parent clock names from
 DT
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
 <20190826164510.6425-2-jorge.ramirez-ortiz@linaro.org>
 <20190909102117.245112089F@mail.kernel.org> <20190909141740.GA23964@igloo>
 <20190909161704.07FAE20640@mail.kernel.org> <20190909165408.GC23964@igloo>
 <20190910091437.CCA78208E4@mail.kernel.org>
 <fcac3f60-6a96-b3ee-f734-a03636fbbee4@linaro.org>
Message-ID: <3517a1e0-6092-362f-f696-fcc1528ce026@linaro.org>
Date:   Tue, 10 Sep 2019 11:40:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fcac3f60-6a96-b3ee-f734-a03636fbbee4@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/10/19 11:34, Jorge Ramirez wrote:
> On 9/10/19 11:14, Stephen Boyd wrote:
>> Quoting Jorge Ramirez-Ortiz, Linaro (2019-09-09 09:54:08)
>>> On 09/09/19 09:17:03, Stephen Boyd wrote:
>>>> But now the binding is different for the same compatible. I'd prefer we
>>>> keep using devm_clk_get() and use a device pointer here and reorder the
>>>> map and parent arrays instead. The clocks property shouldn't change in a
>>>> way that isn't "additive" so that we maintain backwards compatibility.
>>>>
>>>
>>> but the backwards compatibility is fully maintained - that is the main reason
>>> behind the change. the new stuff is that  instead of hardcoding the
>>> names in the source - like it is being done on the msm8916- we provide
>>> the clocks in the dts node (a cleaner approach with the obvious
>>> benefit of allowing new users to be added without having to modify the
>>> sources).
>>>
>>
>> This is not a backwards compatible change.
>>
>>>>> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>>>>> @@ -429,7 +429,8 @@
>>>>>      compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
>>>>>      reg = <0xb011000 0x1000>;
>>>>>      #mbox-cells = <1>;
>>>>> -                   clocks = <&a53pll>;
>>>>> +                 clocks = <&gcc GPLL0_VOTE>, <&a53pll>;
>>>>> +                 clock-names = "aux", "pll";
>>>>>                       #clock-cells = <0>;
>>>>>                };
>>>>>                                                                                                                 
>>
>> Because the "clocks" property changed from
>>
>> 	<&a53pll>
>>
>> to
>>
>> 	<&gcc GPLL0_VOTE>, <&a53pll>
>>
>> and that moves pll to cell 1 instead of cell 0.
>>
>>
> 
> what do you mean by backwards compatible? because this change does not
> break previous clients.

as per the comments I added to the code (in case this helps framing the
discussion)

[..]
legacy bindings only defined the pll parent clock (index = 0) with no
name; when both of the parents are specified in the bindings, the
pll is the second one (index = 1).
[..]



> 
> 
> 
> 
> 
> 
> 

