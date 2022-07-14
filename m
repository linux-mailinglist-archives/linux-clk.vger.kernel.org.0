Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E48574A1B
	for <lists+linux-clk@lfdr.de>; Thu, 14 Jul 2022 12:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237954AbiGNKHD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 Jul 2022 06:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237845AbiGNKHB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jul 2022 06:07:01 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE8BC4C629
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 03:06:59 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bf9so1936403lfb.13
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oOBAiv4m4zZgCi9RT6omzssmkOXhUIRC7hVNaWRM+pw=;
        b=GuXZXMtlUhn/bYZtCECHZ0J/zYySlyaVpfZP/teUhiOplpvCh9edmjN6uhbm3lL3Vv
         +EDGGkd+YbSyMtthfbb7KShBEE7PKdlSR/z2zhPaOctGQPhNRCFnJ7pm3gB9jSw9tUPc
         GxjppDlh1cqy7OHt2X9G0hMCFMPDhCIlSX15ZNrjQ6P4D2QZ1PA1So8oFFhWWUPb7boa
         +cmAEg+gBJRYQaKFbG62AQGCV2ekA89MdBFpJZabdJof7TI18DSk0qifxNLInE//Kemh
         6pIUi8xymgPMZ7b4NFCvBNLCXSvhlb4Uk1/IJly1j13IDE4/o62Nf7p+iKWZzL11CiSm
         lRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oOBAiv4m4zZgCi9RT6omzssmkOXhUIRC7hVNaWRM+pw=;
        b=MqGDlIgQG4VxKO+sdukzKIOGJnCrZEvkFz5XAgqaJh9Fk7SNEwtaxCYuZ3K2T6IH9e
         RzjKeqMb/L0rMNvtTVXWt90Chh2CxoOulY5kiWqLmU0lp6+vuFhIp3+ehvQ99AFlJPEs
         /IkCfh+9howwrIA0KB7xhIVdee163uscAUt5FbqjZyTIUqFcl5EMXco7Fp0aRT+ykxYz
         u2nQBapFaNK2ZKYvgrn/fvUWdTJr3OBAOGOg6SqLQbaVR6cr0ubV/yqGgcvAX79vhvuj
         QebpJonjX0/WtIgPtwQMTPXRdDhKWLCPb/wNx20254WRGAzIiseAZDvPU01WJm3x2RCT
         yn5A==
X-Gm-Message-State: AJIora/tC0AR7/5e3Ekmqe7JUE/LUYX0ODAo00nwV72hWGJ5F12rS+wg
        l8IZDS4mbAVuSuycMApeJB3Ldg==
X-Google-Smtp-Source: AGRyM1ugycvHaKsXPFMNFG8NES1FUWy518rOmpZZEGCyhQq0Hc3UIsLnZ8+OGalwUyO7nc2wfFv6Qg==
X-Received: by 2002:a05:6512:32c8:b0:48a:10da:b204 with SMTP id f8-20020a05651232c800b0048a10dab204mr3072556lfg.183.1657793218102;
        Thu, 14 Jul 2022 03:06:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z20-20020a2eb534000000b0025d6ecbc897sm203733ljm.46.2022.07.14.03.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 03:06:57 -0700 (PDT)
Message-ID: <463723ee-f155-3bd9-7180-fb0271a19eb6@linaro.org>
Date:   Thu, 14 Jul 2022 13:06:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/6] clk: qcom: msm8996-cpu: Cleanup and migrate to
 parent_data
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220621160621.24415-1-y.oudjana@protonmail.com>
 <Ys85+7rYjQOSPvD/@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Ys85+7rYjQOSPvD/@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/07/2022 00:32, Bjorn Andersson wrote:
> On Tue 21 Jun 11:06 CDT 2022, Yassine Oudjana wrote:
> 
>> This series includes some cleanup of the MSM8996 CPU clock driver, as well as
>> migration from parent_names to parent_data for all of its clocks. The DT schema
>> is also fixed in this series to show the actual clocks consumed by the clock
>> controller and pass checks.
> 
> This series looks almost ready to be merged, could you (or Dmitry?)
> update the two outstanding items?

I have acked the patch 2 and sent the slightly updated revision of 
patch6 (together with the rest of small changes).

> 
> Thanks,
> Bjorn
> 
>>
>> Yassine Oudjana (6):
>>    clk: qcom: msm8996-cpu: Rename DIV_2_INDEX to SMUX_INDEX
>>    clk: qcom: msm8996-cpu: Statically define PLL dividers
>>    clk: qcom: msm8996-cpu: Unify cluster order
>>    clk: qcom: msm8996-cpu: Convert secondary muxes to clk_regmap_mux
>>    dt-bindings: clock: qcom,msm8996-apcc: Fix clocks
>>    clk: qcom: msm8996-cpu: Use parent_data for all clocks
>>
>>   .../bindings/clock/qcom,msm8996-apcc.yaml     |  15 +-
>>   drivers/clk/qcom/clk-cpu-8996.c               | 235 ++++++++++--------
>>   2 files changed, 140 insertions(+), 110 deletions(-)
>>
>> -- 
>> 2.36.1
>>


-- 
With best wishes
Dmitry
