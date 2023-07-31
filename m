Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABFA769411
	for <lists+linux-clk@lfdr.de>; Mon, 31 Jul 2023 13:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjGaLBw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 31 Jul 2023 07:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjGaLBu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 07:01:50 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8538F12A
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 04:01:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fe383c1a26so1076477e87.1
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801304; x=1691406104;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LW5VB7qFVO9sNI/Xk6NRtf7lETmgtQbluRtmgiCSPs0=;
        b=lXdvBOO7c8AfHI2MkFwa1f9eQSD1yDK7rTQVm0DA3+VKvkyGHPgdll4Qipml6e+rTF
         +eUMF6R4902ZS83ccNONjDMZwW6qNVlHd3hzpTtFvek/+dvgSyN23CkqaH189upmFBBm
         xi6/+te9H3SATz9AbuqB7g9pOmWNVwnLzVlk+q6mXq2m2fvSgd9bpZxS98awi5TeVNPl
         FWu4/or+i/WeOrT1y8t9UEXCLu+VFja4PTdLhKSiPCMu8Ytd5J3hDjalh+Lt+l17U/7d
         veJg5mx3QnAu/fRvaQbkNU0sZM2okVsxtjZpyjqXs766NyAGJ6EAmwF3cfUm1PYJUHbf
         VCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801304; x=1691406104;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LW5VB7qFVO9sNI/Xk6NRtf7lETmgtQbluRtmgiCSPs0=;
        b=laOLmDlN8gBck4SCD+P6A1JJCf0iWeTRbqJxGi6t3hHEBTbd+RGrnPct31+613C+ZH
         /5Qz5IIYAogofXBeU7XCUfwOEp0UCsW7wEVCELKO/q3rp5KjnpWYnBoeyb2NXbkpaxt9
         ixW+Z7UdL8MuorArTRHwcK9rWXB3IMVWLjdGluYT0GF+vRUzDFzm+eijQCfUqNEJAgcJ
         ceoUmj5cJYcBo1/+jhwm1dL6SMXJwZ5fwoR1MuhNYuxR3LM9hdiNUuB9XJVdjGt5iGKi
         /AHTcC1v9JfY7jhg/sdxaeuijavH2e9yOMoX070gqHW4LBYVTAMdqMWotW16SffBmXYy
         BUag==
X-Gm-Message-State: ABy/qLbwsq2/Eb0sHuNU0M9otozzLyPEdnkQC8xa2cR5GxYDGAcw1Ukm
        DaDCSvUKJneDlUlgwgzA9zPivg==
X-Google-Smtp-Source: APBJJlEi4EXjtuy8Ky+SAZvAP9BlSHnxtEorHuvm3tDq5FiVPqwVmE53O96mBn07kMMaoyivnBoa5Q==
X-Received: by 2002:ac2:4da5:0:b0:4fb:85ad:b6e2 with SMTP id h5-20020ac24da5000000b004fb85adb6e2mr4694600lfe.50.1690801303712;
        Mon, 31 Jul 2023 04:01:43 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id r12-20020ac252ac000000b004fb7ac67bbdsm2045292lfm.41.2023.07.31.04.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 04:01:43 -0700 (PDT)
Message-ID: <0ca1922a-5d21-2c00-7514-6f90a9d2cb03@linaro.org>
Date:   Mon, 31 Jul 2023 13:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-msm8996: Use read-only RCG ops for RPM
 bus clocks
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
References: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
 <20230612-topic-rcg2_ro-v1-2-e7d824aeb628@linaro.org>
 <20230613175626.aesimqz2alcqjtok@ripper>
 <e3f69e9d-7c23-d5cd-e203-f1e435ba063a@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <e3f69e9d-7c23-d5cd-e203-f1e435ba063a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13.06.2023 19:54, Konrad Dybcio wrote:
> 
> 
> On 13.06.2023 19:56, Bjorn Andersson wrote:
>> On Mon, Jun 12, 2023 at 11:22:48AM +0200, Konrad Dybcio wrote:
>>> The config/periph/system NoC clocks are wholly controlled by the
>>> RPM firmware and Linux should never ever alter their configuration.
>>>
>>
>> Does Linux need to know about them?
> Not really, but it allows us to get rates of their children.
> 
> We can get rid of them if one can argue debugcc is enough. Unless
> we need clk_get_rate for some reason.
> 
Any opinions?

Konrad
