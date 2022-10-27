Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9148A60FFE7
	for <lists+linux-clk@lfdr.de>; Thu, 27 Oct 2022 20:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236183AbiJ0SNw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Oct 2022 14:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235730AbiJ0SNv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 14:13:51 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D7C193DF
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 11:13:47 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id d3so4722526ljl.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AH3B2XVD+782BtcBMlI9PyqTgXUoHuH6MusMjljvSDs=;
        b=fvmm7xeIfG0714j5BtaMWH51TgwVKTWCp5poHufD++4vRk5I/kK4JVj6iBiajavhzn
         JG5CWOk5tthB4dpzPbD6E0Vb+VqyNfZ1FckinVysRSEgV7b8gZKUfg3xOcJMjeC6pGvu
         J7ted5WOBqnHjKuMvW61Lnbeq6Yj/I6vCZOr9ugDUaB3ZdfrDlVxpKH24DLrF03+9oF1
         9nE/s+m5WysRxUIB+c8H7On2lsJsHXzqFXrIvRPUOM36m0sNGujPZ5hWOB1ggX3QbtL9
         Yz42a5Phh1WiemRjpp2gOBPo6DCz1falIoDgMLny37IHwUXY3Z4MeQX193115vjLGpFk
         lRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AH3B2XVD+782BtcBMlI9PyqTgXUoHuH6MusMjljvSDs=;
        b=zi6mptXv0DvDdarsGxe4s4RGdqifh6A3XRTzGxnoTVY5KELMNaCE6cNXgm+rZt5t/3
         YPwxJlkl7MjbhS4WAKuNqDgnJqaTEFNS1saGkGLVyqDSrbqgn3GdIAeDtkgE5urZSRsP
         NW4OBBUwqX/N7H5ARBX5FL8MW46hgU2ZWTRS+PTH6y1+3jUPZ80vJSo4u3ee6gnC+jlv
         U2+GdZIlJn6RsDI68l6gEXY6D42EdOmrgKTIXJSdAS32v2yOK7eRUE4Xa/KPxUB3JDeJ
         MFKi25EM8ciq2E1giosHRcAjbMsuhMiUvKpDltXaskdqp73BVaJy8BZhjB33jcGNL9+N
         M06Q==
X-Gm-Message-State: ACrzQf2oM/mQ1bIA7a577o0dDTZoChUtnBt5KM1P54WaCXL+uLOKa++v
        G/XE/iYerK8+3suKDWbJQQHXOA==
X-Google-Smtp-Source: AMsMyM5xYI5/5dwMTnYXc+gGf4S8cfEbL29ctsWNazAgG3BAm21oY79OdUt2kvL6tP9WJNbNyHQQ1A==
X-Received: by 2002:a05:6512:3684:b0:4b0:4ef:dc39 with SMTP id d4-20020a056512368400b004b004efdc39mr770237lfs.91.1666894426146;
        Thu, 27 Oct 2022 11:13:46 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id bk9-20020a05651c238900b0026befa96249sm322815ljb.8.2022.10.27.11.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 11:13:45 -0700 (PDT)
Message-ID: <9a696c92-eac2-e8fc-5081-8feb9c6150c1@linaro.org>
Date:   Thu, 27 Oct 2022 21:13:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: clk: qcom: genpd lockdep warning in gdsc
To:     Stephen Boyd <swboyd@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Yu Zhao <yuzhao@google.com>, linux-arm-msm@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya <quic_c_skakit@quicinc.com>
References: <CAE-0n52xbZeJ66RaKwggeRB57fUAwjvxGxfFMKOKJMKVyFTe+w@mail.gmail.com>
 <CAPDyKFpay0w6n6rtv+bsdcTvL4ijtEPBODo1=XJpUFNdaooTcg@mail.gmail.com>
 <CAE-0n52Bfe-7Fpawct=_3=miLBygR_-YXm1YPnhCWOwxFnjv7g@mail.gmail.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52Bfe-7Fpawct=_3=miLBygR_-YXm1YPnhCWOwxFnjv7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/10/2022 01:18, Stephen Boyd wrote:
> Reviving this old thread because this commit has lead to a couple bugs
> now.
> 
> Quoting Ulf Hansson (2022-06-22 03:26:52)
>> On Fri, 17 Jun 2022 at 21:58, Stephen Boyd <swboyd@chromium.org> wrote:
>>>
>>> Hi Bjorn and Dmitry,
>>>
>>> Yu reported a lockdep warning coming from the gdsc driver. It looks like
>>> the runtime PM usage in gdsc.c is causing lockdep to see an AA deadlock
>>> possibility with 'genpd->mlock'. I suspect this is because we have
>>> commit 1b771839de05 ("clk: qcom: gdsc: enable optional power domain
>>> support"), and that is now calling runtime PM code from within the genpd
>>> code.
> 
> This commit has caused a deadlock at boot for Doug[1] and I see that the
> camera driver on Google CoachZ and Wormdingler devices doesn't work
> after resuming from suspend once this commit is applied. I'm leaning
> towards sending a revert, because it seems to cause 3 issues while
> removing the regulator hack that was in place to enable MMCX. This patch
> is cleaning up the hack, but trading the hack for three more problems.
> 
>> I think genpd already has nested lock support, so the only
>>> solution is to not use runtime PM from within genpd code and start
>>> expressing genpd parent relationships in genpd itself?
>>
>> Not sure exactly what you mean here, but yes, expressing the
>> parent/child domain relationship is always needed.
>>
>> Having gdsc_disable() to do runtime PM calls (gdsc_pm_runtime_put())
>> seems awkward to me. Why is that needed, more exactly?
> 
> It seems like this is needed so that the gdsc_enable() and
> gdsc_disable() calls can read/write the registers for the genpd, while
> those registers live in some clk controller that needs either a
> different clk (probably some AHB clk) or another genpd to be enabled. It
> looks like for qcom,sm8250-dispcc it relies on MMCX gdsc (which is a
> genpd). From a hardware view, the MDSS_GDSC provided by the display clk
> controller is probably not a sub-domain of MMCX. Instead, we need to
> have MMCX enabled so that we can access the registers for the MDSS GDSC.

Yes, exactly.

> 
> My question is if it makes sense to simply describe that the GDSCs
> provided by a device are sub-domains of whatever power domains are
> listed in DT for that device? I think if we did that here for sm8250
> dispcc, we wouldn't need to use runtime PM within the genpd code
> assuming that the MMCX parent genpd is enabled before we attempt to
> read/write the dispcc gdsc registers. Hopefully that is also done, i.e.
> enabling parent domains before enabling child domains if the parent is
> disabled.

I will check this tomorrow. It should be possible to handle the 
MMCX/MDSS_GDSC relationship in this way.

> Is this already being done with pm_genpd_add_subdomain() in
> gdsc_register()? I see that we're attaching that to dispcc's struct
> device::pm_domain, but I assume that is different from the MMCX genpd.

No, I think the only domain there is the MMCX domain, so this call s

> Maybe that is the problem here. Dmitry can you further describe the
> problem being solved?

I must admit, I don't remember what caused me to add this call. May be 
it was added before me getting the pm_genpd_add_subdomain() call in place.

> 
>>
>>> Or maybe genpd
>>> needs to drop locks while calling down into gdsc_disable() and reacquire
>>> them after that?
>>
>> Nope, that doesn't work. This internals of genpd relies on this
>> behaviour, as it allows it to properly deal with power-on|off for
>> parent/child domains, for example.
> 
> Ok.
> 
> [1] https://lore.kernel.org/r/20220922154354.2486595-1-dianders@chromium.org

-- 
With best wishes
Dmitry

