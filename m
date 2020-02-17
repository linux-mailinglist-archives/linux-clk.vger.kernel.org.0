Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6819A161027
	for <lists+linux-clk@lfdr.de>; Mon, 17 Feb 2020 11:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbgBQKgL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 17 Feb 2020 05:36:11 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39044 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729128AbgBQKgK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Feb 2020 05:36:10 -0500
Received: by mail-wm1-f67.google.com with SMTP id c84so17872869wme.4;
        Mon, 17 Feb 2020 02:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uvtojMvP+V7ADTabtkl+yuRBVwonhrdZ0+EiqW4xzoo=;
        b=iURTU7sanVxWQGKScYzJZFiy6fQWO/TeBrG7roOnsIP1NdEUGfpcfq0XaZg8IAEuEN
         MmAwaiP2YeLvtX8deFeaP2c6uY80JiMcKHc3wXzSGlsd2fOrvREDRny49GcZX94wYNQq
         KR5eVD8PwoYbwXIZUPQtaMIr3OIt4T7r66YehfbhE13V0udIz47zUtXah1acwBQZ9UDC
         o6mMpjGKQTTZmTc1bZuJOVf+KWzI2YLUeAN1znGH8pefP33gOsQPhz8upOjCBmQurz/s
         /jJZrhs3NZd/ikFjhbs8L+T/eKG+eA6TH1nQ9tahl7DO7Ump1t7QlI/2yLeRzIHi43m/
         xzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uvtojMvP+V7ADTabtkl+yuRBVwonhrdZ0+EiqW4xzoo=;
        b=n5ANHjBgfX34MpQCxsK4fBZKW9vWzPLq84DbTUWPL6gzcEbzJ4saBgSWGp6kUj+nWY
         ZuXJT8oi9kEh3ma3AwPoQiMfQooUCCw31+pV3wEh57+AQSWPRIB9/03/Zcv15teFwksw
         RWJyHuzdXXYQigmU41l7SrCA8NmrkZ6ONwYMkopyQS4kH2Xt2hGquNZhB8QZ93fpDJQp
         2JeCacVICNhTpMablSLNiqk6BSUL6M9iVtKl2Q+xDjp9qDzQhrcITqvAjg9TsCExJcCc
         iVtxgKMoFiM/BF+ipiGHEAn4QtWMgxjP4HLRupIorxwBxzlMGyNv7bcLkifE78+v5q68
         4/3A==
X-Gm-Message-State: APjAAAVYHY8km1WJwYO3gwEjJr/DQJi3YfN+mS+ZwSZMjW6OJjR6uLCz
        EEmoBeaOZtGWTGCBaERIhdQ=
X-Google-Smtp-Source: APXvYqz+rhy+3NH5M2AM8t+uz2TLWy7+Y2+NRRLDO2dzDnhxxTh00G3xgbZFNaJDnzuQq9/uakDgiA==
X-Received: by 2002:a1c:9d02:: with SMTP id g2mr20910437wme.108.1581935767021;
        Mon, 17 Feb 2020 02:36:07 -0800 (PST)
Received: from ziggy.stardust ([213.195.113.243])
        by smtp.gmail.com with ESMTPSA id i4sm59907wmd.23.2020.02.17.02.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 02:36:06 -0800 (PST)
Subject: Re: [PATCH v7 5/7] soc: mediatek: add MT6765 scpsys and subdomain
 support
To:     Macpaul Lin <macpaul.lin@mediatek.com>,
        =?UTF-8?B?V2VuZGVsbCBMaW4gKOael+eQpuiAgCk=?= 
        <Wendell.Lin@mediatek.com>, Weiyi Lu <Weiyi.Lu@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>,
        Sean Wang <Sean.Wang@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>,
        ",Ryder Lee" <Ryder.Lee@mediatek.com>,
        Morven-CF Yeh <Morven-CF.Yeh@mediatek.com>,
        Kevin-CW Chen <Kevin-CW.Chen@mediatek.com>,
        Albert-ZL Huang <Albert-ZL.Huang@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <jroedel@suse.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Mediatek WSD Upstream <wsd_upstream@mediatek.com>
References: <1581067250-12744-1-git-send-email-macpaul.lin@mediatek.com>
 <1581067250-12744-6-git-send-email-macpaul.lin@mediatek.com>
 <c704bdab-8489-0b54-59de-401bc4ab24e6@gmail.com>
 <1581562527.19053.18.camel@mtkswgap22>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ef3d8aac-f5ec-cf13-0500-644bf37e36ef@gmail.com>
Date:   Mon, 17 Feb 2020 11:36:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1581562527.19053.18.camel@mtkswgap22>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13/02/2020 03:55, Macpaul Lin wrote:
> On Sun, 2020-02-09 at 22:26 +0100, Matthias Brugger wrote:
>>
>> On 07/02/2020 10:20, Macpaul Lin wrote:
>>> From: Mars Cheng <mars.cheng@mediatek.com>
>>>
>>> This adds scpsys support for MT6765
>>> Add subdomain support for MT6765:
>>> isp, mm, connsys, mfg, and cam.
>>>
>>> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
>>> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> ---
>>>  drivers/soc/mediatek/mtk-scpsys.c | 130 ++++++++++++++++++++++++++++++
>>>  1 file changed, 130 insertions(+)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
>>> index f669d3754627..9940c6d13222 100644
>>> --- a/drivers/soc/mediatek/mtk-scpsys.c
>>> +++ b/drivers/soc/mediatek/mtk-scpsys.c
>>> @@ -15,6 +15,7 @@
>>>  
>>>  #include <dt-bindings/power/mt2701-power.h>
>>>  #include <dt-bindings/power/mt2712-power.h>
>>> +#include <dt-bindings/power/mt6765-power.h>
>>>  #include <dt-bindings/power/mt6797-power.h>
>>>  #include <dt-bindings/power/mt7622-power.h>
>>>  #include <dt-bindings/power/mt7623a-power.h>
>>> @@ -749,6 +750,120 @@ static const struct scp_subdomain scp_subdomain_mt2712[] = {
>>>  	{MT2712_POWER_DOMAIN_MFG_SC2, MT2712_POWER_DOMAIN_MFG_SC3},
>>>  };
>>>  
>>> +/*
>>> + * MT6765 power domain support
>>> + */
>>> +#define SPM_PWR_STATUS_MT6765			0x0180
>>> +#define SPM_PWR_STATUS_2ND_MT6765		0x0184
>>> +
>>
>> The offsets are the same as for MT6797. Could we rename the define to something
>> generic and move it up and put it just under SPM_PWR_STATUS_2ND? Probably as a
>> separate patch.
>>
>> Regards,
>> Matthias
>>
> Loop more related owners in this mail loop.
> 
> After check it with our clock driver owners, there are different
> generations of clock IPs. Because different smart phone chips require
> different cost-function oriented design, even they use the same
> generation of clock IPs, might not have the same offsets. Take MT6765
> and MT6797 for example, the listed offsets are just coincidence.
> 
> Our clock driver owners will work on this to summarize the common offset
> parts for each generations, but at this moment, we suggest just separate
> the files for mt6797 and mt6765. Commonly used header should be come
> with the next chip which clock IP just the same generation of mt6797 or
> mt6765.
> 

Sounds good, no need to do anything here. We can do the cleanup in another patch
afterwards.

Regards,
Matthias

> Thanks
> Macpaul Lin
> 
> 
