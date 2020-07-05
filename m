Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57DEE214FBB
	for <lists+linux-clk@lfdr.de>; Sun,  5 Jul 2020 23:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbgGEVJ0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 5 Jul 2020 17:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728448AbgGEVJZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Jul 2020 17:09:25 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86765C08C5DE
        for <linux-clk@vger.kernel.org>; Sun,  5 Jul 2020 14:09:25 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id c139so33120083qkg.12
        for <linux-clk@vger.kernel.org>; Sun, 05 Jul 2020 14:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=91i38o75PUdG0X5h8mF7xqf2WadKC8dcUXQh6Pbzwi8=;
        b=BnniX7fd6bDlySmdSW+WNAkklobN26yxGjstPMYAVEbGxeUk5OhklluUIKgdukQRfq
         GyDzlFePj7kpsWa5E/iv+rD0Nu63ZPC1RepPnyp+x0Bq7SMFWGXzrajKFOCNpbeMEdmr
         Q7c1r+Is9S4zxRlTRUpuXs00REsO7RA9pMbBh3DpSrg0zAfn0otgYJjWvUXrocyXx/go
         qODd+MPdmocun2PhRn63rWYPqT+h6/u6aBpDLDiEu5doTuVn8Cudd2Y93OARyc0DDEIG
         8qgU1QPE3aME8iO8edkYTlPa4Ifa6PrZdLaffG1Wfz3pRQDUjGkaYiX25iWLzgLcgnBL
         KhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=91i38o75PUdG0X5h8mF7xqf2WadKC8dcUXQh6Pbzwi8=;
        b=k9TJombf4j5otaoPXnztXsNPoz7U1mGCtLB8+PRcJqw5KjwCYgACMci/sSl8LPJBst
         AwK9mooObk//9Va4YHIcVc+hYTZac/f29w22ib/9kyYRmNyP5hlxf/7Cy2/Ag1m5RLmu
         KNZS1b+b7JxKwPeXlhwP5C3yXyJABYt0ZJBnqlcszHA5OLDoVwGMY8TaaNlkhRSF0opU
         kH+L5k2EAl/kPg1AJc8JA3T/AZq2TYZZE8vqItyuqfNqR918VcA5jJswR+2Vi6+vDZWY
         aswnxK361CaCEp6WDccZi6hmB4c3Z3Fey/qU9OGIugrF93XDxUT+4PmN9TCtWs7qKjQw
         v1cQ==
X-Gm-Message-State: AOAM533Bmyw2Dmu96Ug3hgFuwPpj9dsB/P/2ZChdVw09U035g1mQ0bfk
        X+jGdJqfF8f/S2Yt5laqimyxow==
X-Google-Smtp-Source: ABdhPJwArG1iIsJeVKeu1y9Mqy5i5wOn3RYeFKpbPMKzZ4g+AKo+9bRCdb/m1zz+QbqKO7CDfSainA==
X-Received: by 2002:a37:4b0f:: with SMTP id y15mr2517345qka.236.1593983364560;
        Sun, 05 Jul 2020 14:09:24 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id m26sm17725759qtc.83.2020.07.05.14.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2020 14:09:24 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 00/13] Enable GPU for SM8150 and SM8250
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
References: <20200629211725.2592-1-jonathan@marek.ca>
 <011a1f99-46bb-12f2-ee07-8cd14d891947@linaro.org>
 <1887f23d-57ef-c83a-4eaf-a8f8d5024ebf@marek.ca>
 <a82bd8ed-fc8f-ea94-7687-cdc17190900a@linaro.org>
 <04900059-6af8-1b48-33f9-7b8426a55fd0@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <0ad7638f-7310-f84e-0ce9-a2f1d1d64079@marek.ca>
Date:   Sun, 5 Jul 2020 17:08:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <04900059-6af8-1b48-33f9-7b8426a55fd0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 7/3/20 1:29 PM, Dmitry Baryshkov wrote:
> On 03/07/2020 18:14, Dmitry Baryshkov wrote:
>> On 03/07/2020 18:08, Jonathan Marek wrote:
>>> On 7/3/20 11:03 AM, Dmitry Baryshkov wrote:
>>>> On 30/06/2020 00:17, Jonathan Marek wrote:
>>>>> This series adds the missing clock drivers and dts nodes to enable
>>>>> the GPU on both SM8150 and SM8250.
>>>>>
>>>>> Note an extra patch [1] is still required for GPU to work on SM8250.
>>>>>
>>>>> Changes in V2:
>>>>> * Added "clk: qcom: gcc: fix sm8150 GPU and NPU clocks" to fix the 
>>>>> newly added
>>>>>    SM8150 GPU gcc clocks
>>>>> * Added "Fixes:" tag to "clk: qcom: clk-alpha-pll: remove 
>>>>> unused/incorrect PLL_CAL_VAL"
>>>>> * Added yaml schemas to gpucc dt-bindings patches
>>>>> * Added "clk: qcom: add common gdsc_gx_do_nothing_enable for gpucc 
>>>>> drivers" and changed
>>>>>    gpucc patches to use it.
>>>>> * Removed CLK_IS_CRITICAL from gpu_cc_ahb_clk
>>>>> * Added missing rpmh regulator level for sm8250 GPU clock levels
>>>>> * Use sm8150/sm8250 iommu compatibles in dts
>>>>> * Add gcc_gpu_gpll0_clk_src/gcc_gpu_gpll0_div_clk_src to gpucc 
>>>>> clocks in dts
>>>>>
>>>>> [1] https://gist.github.com/flto/784f1aca761ebf2fe6c105719a4a04ca
>>>>
>>>> With your patches applied:
>>>>
>>>> [   56.751977] msm msm: [drm:adreno_request_fw] loaded 
>>>> qcom/a650_sqe.fw from new location
>>>> [   56.760166] msm msm: [drm:adreno_request_fw] loaded 
>>>> qcom/a650_gmu.bin from new location
>>>> [   56.768485] arm-smmu 3da0000.iommu: genpd_runtime_resume()
>>>> [   56.774196] PM: gpu_cx_gdsc: Power-on latency exceeded, new value 
>>>> 49531 ns
>>>> [   56.781730] arm-smmu 3da0000.iommu: resume latency exceeded, 
>>>> 462604 ns
>>>> [   56.799559] platform 3d6a000.gmu: [drm:a6xx_gmu_resume] *ERROR* 
>>>> GMU firmware initialization timed out
>>>> [   56.809260] arm-smmu 3da0000.iommu: genpd_runtime_suspend()
>>>> [   56.813062] msm msm: [drm:adreno_load_gpu] *ERROR* Couldn't power 
>>>> up the GPU: -110
>>>>
>>>>
>>>
>>> Do you have your branch published somewhere so I can see what 
>>> could've went wrong?
>>
>> I've applied your patches (this series + the extra one for 
>> gpu/drm/msm) on top of 
>> https://git.linaro.org/landing-teams/working/qualcomm/kernel.git 
>> branch integration-linux-qcomlt .
> 
> A trimmed down version: 
> git.linaro.org/people/dmitry.baryshkov/kernel.git branch sm8250-gpu-test
> 
> 

Hi,

I tried this branch, with only the sm8250-hdk.dts from my other series 
added (USB nodes removed as you don't have those in your branch), and 
the GPU starts up without problems.

Possible differences I can think of:

1) Different firmware version which behaves differently? These are the 
checksums for the firmware I have:

/lib/firmware# md5sum a650_*
f6536ba45c2f9f64ec31438217b6a027  a650_gmu.bin
897be740bed67deaa1943e9c36293165  a650_sqe.fw
00f1b291a2b30c98f05c25506e3f4761  a650_zap.b00
bec0f79c7c6f5b32254facf3c7e046c7  a650_zap.b01
35273e4135147a269076144a3051b498  a650_zap.b02
ce0dd1af27306eb341a01bda642f1c64  a650_zap.elf
09834955a8865073f6ee483f69a98b33  a650_zap.mdt

2) GPU revision is not 650.2 (the downstream driver had workarounds for 
bugs in the first revisions, which I didn't include in the upstream driver)

3) Something in the kernel config is making a difference. Here is the 
kernel config I used to test this: 
https://gist.github.com/flto/c6b1bc48abda6fb580a2f21c51039c81

-Jonathan

