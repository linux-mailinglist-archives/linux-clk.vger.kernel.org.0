Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4760628DDC9
	for <lists+linux-clk@lfdr.de>; Wed, 14 Oct 2020 11:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgJNJgx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 14 Oct 2020 05:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbgJNJgx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 05:36:53 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AC3C0613D3
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 02:36:53 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f21so2447710ljh.7
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 02:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AgJUpeJL7pNpYrMzhgRxfluJZLPcBG484GqTiiuhBbs=;
        b=Gf/ZthvmpRme7OiTG3JFCoHy07Vnp33A2qrAVTlrlCgmYyMiQvGIGIqaxewRN2k46z
         6y/vQTQOabTEzacIP1ypJcjQvya/xsXJZTsRuTDc2WR9VxGUcnM9uWtLgTLRbYiEDnwB
         URTnPechdzySVPPUCcmAf5PYm08d2iBPaHrPuLY7TVrWnz7S8J+QaTzG8I56jW99O2UJ
         MBrZo9pf30mz3zL1yMtGo1mrYfiEgkKcjin4IZV84D+m+ZQw5PVC4TU1FR7hJmC1oYFp
         r3oSIUqQQWL7XrIbJNw2rlOy+GOdQIaZqz7Km/bEBaDfmMvh1+2nyyrxO/BnC8xbpMY2
         ALaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AgJUpeJL7pNpYrMzhgRxfluJZLPcBG484GqTiiuhBbs=;
        b=CLHabVdtJ2Ac3GVNRuFySeWEUkTX7ykKYaJ+HF91OHiPh91+RHvASS90nvfn+WOPxI
         HJ/4eiI/GqWPos/cfm7FzF+Uw8+RNVPH4BtOB+6e6aypvN7+iQ6wkPTVWBx2TfUlVnDg
         2HgTTIepO4XqXmL8lNn32tkhUEcW0i+CHYhRc8GLLRk0BQKbo0ykYwC6IfAgshqiiVrM
         QOIh+GQT/z3HbYxn2sEfBquefShnx31Q2zcmJEG2vfPurmb8+TBn/d/Uc46dnERn3jrI
         bVfhdDGQTYd8OJ7A1YZnFpBTiJhrvSIfzenI8WfTjyoRl11/lLY0AUrVoa2aHqPz5uBv
         5TWA==
X-Gm-Message-State: AOAM5307yWN2LRuMAcN1FsyYy1Ii25Mv97K+VGZYGyt9ft/FakAWs8CQ
        x7OokUGpT55UxQNypbEbRYJXTg==
X-Google-Smtp-Source: ABdhPJyAOSZov4CPoN126NEQlg6nopJIQBCnBPiTBrs3IFmZ2rfOMBqft4aRHDurkybx81iwENOjvA==
X-Received: by 2002:a2e:a58a:: with SMTP id m10mr1557154ljp.316.1602668211358;
        Wed, 14 Oct 2020 02:36:51 -0700 (PDT)
Received: from [192.168.1.211] ([94.25.229.2])
        by smtp.gmail.com with ESMTPSA id z22sm943901lfd.23.2020.10.14.02.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 02:36:50 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: qcom,dispcc: document power
 domain bindings
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
 <20201005225914.315852-2-dmitry.baryshkov@linaro.org>
 <160263639992.310579.2985110685040776427@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <36c5d7dc-7b31-69d1-6862-4432ee22a2c4@linaro.org>
Date:   Wed, 14 Oct 2020 12:36:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <160263639992.310579.2985110685040776427@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/10/2020 03:46, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2020-10-05 15:59:12)
>> SM8250 requires special power domain for accessing MMDS_GDSC registers.
> 
> Heh, not sure it's special.
> 
>> Add bindings for the MMCX power domain.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../bindings/clock/qcom,sdm845-dispcc.yaml    | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
>> index 4a3be733d042..ff0db55470ac 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
>> @@ -97,5 +108,22 @@ examples:
>>         #clock-cells = <1>;
>>         #reset-cells = <1>;
>>         #power-domain-cells = <1>;
>> +      /* this is a part of sm8250 setup the power domain example */
>> +      power-domains = <&rpmhpd SDM845_CX>;
>> +      power-domain-names = "mmcx";
>> +      required-opps = <&rpmhpd_opp_low_svs>;
>> +    };
>> +    rpmhpd: power-controller {
> 
> Do we need this node in the example? I think it isn't required but I
> guess it's OK.

It is to be able to resolve "power-domains" and "required-opps" 
properties values.

>> +      compatible = "qcom,sdm845-rpmhpd";
>> +      #power-domain-cells = <1>;
>> +      operating-points-v2 = <&rpmhpd_opp_table>;
>> +
>> +      rpmhpd_opp_table: opp-table {
>> +        compatible = "operating-points-v2";
>> +
>> +        rpmhpd_opp_low_svs: opp3 {


-- 
With best wishes
Dmitry
