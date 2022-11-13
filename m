Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85BC6272F1
	for <lists+linux-clk@lfdr.de>; Sun, 13 Nov 2022 23:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235498AbiKMW3f (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 13 Nov 2022 17:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235501AbiKMW3e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Nov 2022 17:29:34 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E590F59E
        for <linux-clk@vger.kernel.org>; Sun, 13 Nov 2022 14:29:33 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 130so9431326pfu.8
        for <linux-clk@vger.kernel.org>; Sun, 13 Nov 2022 14:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YH2t8xQcNkXFcYmYsK0eDIjpEQduRw1EARTtft2eFs=;
        b=jOrziLW7aLSjSZLBe08syhoUV8fs5OjV7iJQsGoEIDLUIzuhMCiMBS+gjAZRRs6Tnm
         Kmsg2nxJXGDtYnjb/AiOlvuI52v1cnV0A29E70RnmVaqWRQy+fJr4HqNfOWIvI96ditm
         EG7zdng71/KR8Ygb3SygVjt5MTK/gFbW1jwzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YH2t8xQcNkXFcYmYsK0eDIjpEQduRw1EARTtft2eFs=;
        b=RF9UBOkc22IVPyFk4oxH2FB3sSJNHrEV5uAuCqX2ePYaBhyjpuIDGIXp8VzpPB7z8m
         bVzdq0YyWcpsbx2d1EBcjAF46+Y2nPm/VQngiz6sHeecU74oSsq1PeJpiDYVzC1ZmSav
         BSsr3YnBHrOqZikLUXC+sGvZ9k7355Ze8p2kwkR3BsQ/yeIQypkVSVEL28+H6kHnQmON
         6ftBRQ8PQqEtloIedGQYCNkt5xD08lMm/FCRjIasvlED1N8Tft3i5sexMKYhI/N3SA10
         gKDHD4j8bgn61oFed4wfXESW8O5ToajLULC3xNOXppgYlPQGaNQSQbCZI73oDgFnnhhV
         UIOw==
X-Gm-Message-State: ANoB5pmOys4vNwWns12B/s6YKWGZZaSNQAoqp537desWbhGdcxPoMrqH
        wPRj7BGTbL5gdILLJWvy3DAQSw==
X-Google-Smtp-Source: AA0mqf7l8lNKOOdyOOOyjlWNKELBTAokp0Kg1PcQfN7SWxrPWXSfQVux/WNJW4YDGtTW6dJ/Vz5w9Q==
X-Received: by 2002:a63:a504:0:b0:456:4f9a:fbb6 with SMTP id n4-20020a63a504000000b004564f9afbb6mr9722958pgf.318.1668378572458;
        Sun, 13 Nov 2022 14:29:32 -0800 (PST)
Received: from [192.168.1.33] ([192.183.212.197])
        by smtp.googlemail.com with ESMTPSA id 132-20020a62148a000000b0056c814a501dsm5375905pfu.10.2022.11.13.14.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Nov 2022 14:29:31 -0800 (PST)
Message-ID: <1bbdca8f-d3a3-0e7d-f4de-53fab4e1f095@schmorgal.com>
Date:   Sun, 13 Nov 2022 14:29:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221003015546.202308-1-doug@schmorgal.com>
 <20221003015546.202308-5-doug@schmorgal.com>
 <20221019073929.3abj6ohhcreifyso@pengutronix.de>
 <a9c974f1-fc66-b964-c7f0-b7e4320f2177@schmorgal.com>
 <20221109092653.qwwexcclg6gxn4cu@pengutronix.de>
Content-Language: en-US
From:   Doug Brown <doug@schmorgal.com>
Subject: Re: [PATCH v2 4/5] pwm: pxa: Wait for final PWM period to finish
In-Reply-To: <20221109092653.qwwexcclg6gxn4cu@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Uwe,

On 11/9/2022 1:26 AM, Uwe Kleine-König wrote:

> There are supported hardwares that (only) support immediate shutdown, so
> consumers cannot rely on a graceful stop anyhow. So I'd say using
> PWMCR_SD=1 is fine. The documentation suggests that in this case "PWM_OUTx stops
> after at most one PSCLK_PWM" which might explain that the problem can
> still be triggered. (i.e. if you reenable before the next PSCLK_PWM
> cycle.)

Thanks for taking a look! Your point about PSCLK_PWM does make sense and
likely explains how I'm still able to trigger the problem.

> BTW, the driver lacks information about how the hardware behaves on
> disable. The most common cases are
> 
>   - emits the inactive output
>   - freezes where it just happens to be (assuming PWMCR_SD=1)
> 
> Would you mind testing that and adding a patch to your series? (Look at
> e.g. drivers/pwm/pwm-sl28cpld.c for the desired format to ease
> grepping.)

Will do. I assume you're referring to the "Limitations" section at the
top of a lot of the drivers. It appears that this hardware always emits
the inactive input when the clock disables -- almost immediately if
PWMCR_SD=1, or at the end of the current duty cycle if PWMCR_SD=0.

Doug
