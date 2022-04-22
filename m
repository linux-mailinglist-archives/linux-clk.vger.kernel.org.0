Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6DC350C316
	for <lists+linux-clk@lfdr.de>; Sat, 23 Apr 2022 01:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbiDVWTs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 22 Apr 2022 18:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234174AbiDVWTK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2022 18:19:10 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E391F32BCC3
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 14:10:58 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id c10so12730282wrb.1
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 14:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Nv090Fcw5CRXAaqf5egbVl68mvzRIHG6Z9TCjtt4enM=;
        b=PIt2cs6jOIOUgaIna9c9dpTesElZzi3jz1neSNkXEomyGjBVvXOjSMkMZa20d8GjHn
         erpB9HYm3lg9hrfn1M//0zFVvG+EbcFUubN1KHYOhKenQOPxFNLOqqLsCuWhiWkeElBE
         Jqs9U9EJMCcXPLC6GdUw63M9JCWvA9OKaNdPswN7ACPgo8/PBXFusy870BIyn5yhw36I
         CvUzyiq/XEzRjXKDo9XzuH7K414dVacWP5Pnyx+uNEbDw8+/BaHeb28uUfs7NZcBIAMV
         jdRLpuFPPVZaiR4KJSA/dKfpp+lRyIHFxkB4PAtAWBoGVYJDC7kjOhS/E39JWtnZXP0C
         2v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Nv090Fcw5CRXAaqf5egbVl68mvzRIHG6Z9TCjtt4enM=;
        b=L/R7uAA9UUb4MNZNm8+1Iz6PISeGkXgq2d3AyzimjxL6uXTU3MjVfH+7wEZhAAVVa0
         ivdquehrm8/CM0Os8Ihlkmo//tfGy5Prhs+/wE5CzWlIrykJ3Rz+/jq7IlBHkbvGkHR0
         Tt7ydgB65lmj9cRBTQVyFhpeIv0swIasTXMEMur+K2dYp/NyJaxp2fNxiKzcjeqvODov
         xTixiIh2RrZMovnjCboauBsN0OrqaP+Bne9fa9HrTMDER04Fs7Wjyr3Pl9qkMyj+401f
         dciKzlfVK4IHAq55vnVi9045HVHv5vKEbZlNJ7gWgdnia5mmnN4YftMybNIK2BOEmIT9
         jGqA==
X-Gm-Message-State: AOAM53259u51SqP4pnW/9tBIF6MYR3I3yYYovF+RdNj3ZQXoRdcpewAt
        pso7aHORAnPAm68KCMt5sONSOw==
X-Google-Smtp-Source: ABdhPJwxuOWuvmk+e3OO09OIMy4zsdVziUGh9Xv6Vja6F3VDwf9pI5Otah7WhFWcP1DDUrl34YXANA==
X-Received: by 2002:a05:6000:1547:b0:20a:79dd:289f with SMTP id 7-20020a056000154700b0020a79dd289fmr5406068wry.56.1650661857407;
        Fri, 22 Apr 2022 14:10:57 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
        by smtp.gmail.com with ESMTPSA id n2-20020adfc602000000b0020ac8335e46sm2970537wrg.99.2022.04.22.14.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 14:10:56 -0700 (PDT)
Message-ID: <986c73df-9634-d18b-eed3-37584fa2ea89@conchuod.ie>
Date:   Fri, 22 Apr 2022 22:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>
Cc:     mturquette@baylibre.com, aou@eecs.berkeley.edu,
        Paul Walmsley <paul.walmsley@sifive.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, daire.mcnamara@microchip.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        conor.dooley@microchip.com, atulkhare@rivosinc.com
References: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9>
 <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
 <20220422210040.68019C385AA@smtp.kernel.org>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220422210040.68019C385AA@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 22/04/2022 22:00, Stephen Boyd wrote:
> Quoting Conor Dooley (2022-04-22 12:59:09)
>> On 22/04/2022 20:39, Palmer Dabbelt wrote:
>>>
>>> Thanks.  These generally look good to me, but I don't see acks from everyone.  I'm perfectly fine treating these as fixes and taking them through the RISC-V tree, but looks like it's mostly clk stuff so
>>>
>>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> Ye, hopefully they go via clk. Stephen replied to v1 or 2 so
>> I figure they're in his queue :)
> 
> It helps to be explicit in the cover letter. It's in my queue but I put
> it on hold because the cover letter didn't clarify what tree it was
> intended for nor the priority of what is being fixed.

Ah right, my bad. The coordinating things between trees stuff is
still pretty new to me. If you could take the lot via clk, that'd
be great?
 
> Is boot broken? Do I need to send these up to Linus next week as part of
> fixes for this merge window?

Boot is not broken, I was hoping this would go into 5.18 to avoid
having to deal with two different sorts of reference clock DT
entries - 5.18 where the DT provides the mss pll & 5.18+n where
the DT provides the input to the mss pll.

So, not next week urgent, but as fixes for this window please.

Thanks,
Conor.
