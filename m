Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441B54C4190
	for <lists+linux-clk@lfdr.de>; Fri, 25 Feb 2022 10:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239168AbiBYJhP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 25 Feb 2022 04:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239155AbiBYJhO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 04:37:14 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFC6F42
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 01:36:35 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EF98740300
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 09:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645781793;
        bh=mwBGuSv1vzWcEgYl2MgCXz9QnnQmXLrpGmSTa9ywwuI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=qk45lsTpLT74Z731Io80odzcwBaoFTxG+Ex9+UdRPhdmJoGO9vW6y4Mb2oCr/hm3P
         a3qd6+kEXaJtSUP9Zl/ZtXqLzBxM3SABsJxlR5a8Il+l1tZX8I88h/yKKSUUV6I01g
         DRFJxqp7rC4/ai+ha0dw0AHBcOvES48XJhLinWjnK6HIYzDvQdZv8YY+X82rBA815f
         dmRZwh/gCIT80u78M+aOlLhHR7VlFPIT54eSAKS0o1ICxbK2oej410Ty4oKK942k66
         7iCUwLl8iMrf0pv37dqGhyIPijzTANBJE7OHXSNGASwWf0nUHLabKJoDTXWAK/SRre
         c8UfUrM4p9Awg==
Received: by mail-ed1-f69.google.com with SMTP id eq13-20020a056402298d00b00412cfa4bb0eso2064920edb.7
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 01:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mwBGuSv1vzWcEgYl2MgCXz9QnnQmXLrpGmSTa9ywwuI=;
        b=IVfkpx9Di4OkTBWBi6tKv74htTAL81kI4jKCXg7HRCzzLv9ST0UvxbS6NawyYLhlC5
         Y0tmAHVshdPD5oDTq31Ld9O+EIc0Q2eHG5y9GUmz8fc6HDitvk7XVchDrudUusUEuwdM
         eimcD4/G5IbO0IQtc9/WXCO6280ytTXsyE0pv1elu/wO50uF7JlGxaTwYyk+9zquOQVZ
         bU1Kz/RfG1V03D6vsMF0yqiDjfLrvTSBdX7/DUIKXYUA2u/YcEra1FTWbW2v9m3Uxvgh
         4cjSrR3elyM3mSWAUslwp9Qu6mcD3Z/vSc7OvSyvsO6rHDfjQ4/zAC025Glbnac5SmFs
         0Bdg==
X-Gm-Message-State: AOAM533MJGmSBa+goFi4ko/1Lvu7D0bcGuZacKmMm6zud3P2SPY2VREc
        xAWFBKL1e52N1YoW6DHMFanFnR1qQTSx11/9Zp8K85tQ+7STRnbAvV7FqV+FXbmnd3Nndcd9I+d
        0ero8IiObP+qz0RBOK+lCrrGdJqHoHblRJJkGSg==
X-Received: by 2002:a17:906:4cca:b0:6ce:6a06:bf7 with SMTP id q10-20020a1709064cca00b006ce6a060bf7mr5644762ejt.109.1645781782638;
        Fri, 25 Feb 2022 01:36:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvGXs5zpBbIxYfXArg3HJWTHPHMBjqJChT5RpHzF7M3/UrStNiNcxogS5o2fNS3FLp8Ip6Ag==
X-Received: by 2002:a17:906:4cca:b0:6ce:6a06:bf7 with SMTP id q10-20020a1709064cca00b006ce6a060bf7mr5644737ejt.109.1645781782424;
        Fri, 25 Feb 2022 01:36:22 -0800 (PST)
Received: from [192.168.0.130] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id bo9-20020a170906d04900b006ce6b8e05c1sm773655ejb.150.2022.02.25.01.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 01:36:21 -0800 (PST)
Message-ID: <0aff95ff-5b79-8ae9-48fd-720a9f27cbce@canonical.com>
Date:   Fri, 25 Feb 2022 10:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/11] pci: use helper for safer setting of
 driver_override
Content-Language: en-US
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20220224235206.GA302751@bhelgaas>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220224235206.GA302751@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/02/2022 00:52, Bjorn Helgaas wrote:
> On Thu, Feb 24, 2022 at 08:49:15AM +0100, Krzysztof Kozlowski wrote:
>> On 23/02/2022 22:51, Bjorn Helgaas wrote:
>>> In subject, to match drivers/pci/ convention, do something like:
>>>
>>>   PCI: Use driver_set_override() instead of open-coding
>>>
>>> On Wed, Feb 23, 2022 at 08:13:04PM +0100, Krzysztof Kozlowski wrote:
>>>> Use a helper for seting driver_override to reduce amount of duplicated
>>>> code.
>>>> @@ -567,31 +567,15 @@ static ssize_t driver_override_store(struct device *dev,
>>>>  				     const char *buf, size_t count)
>>>>  {
>>>>  	struct pci_dev *pdev = to_pci_dev(dev);
>>>> -	char *driver_override, *old, *cp;
>>>> +	int ret;
>>>>  
>>>>  	/* We need to keep extra room for a newline */
>>>>  	if (count >= (PAGE_SIZE - 1))
>>>>  		return -EINVAL;
>>>
>>> This check makes no sense in the new function.  Michael alluded to
>>> this as well.
>>
>> I am not sure if I got your comment properly. You mean here:
>> 1. Move this check to driver_set_override()?
>> 2. Remove the check entirely?
> 
> I was mistaken about the purpose of the comment and the check.  I
> thought it had to do with *this* function, and this function doesn't
> add a newline, and there's no obvious connection with PAGE_SIZE.
> 
> But looking closer, I think the "extra room for a newline" is really
> to make sure that *driver_override_show()* can add a newline and have
> it still fit within the PAGE_SIZE sysfs limit.
> 
> Most driver_override_*() functions have the same comment, so maybe
> this was obvious to everybody except me :)  I do see that spi.c adds
> "when displaying value" at the end, which helps a lot.
> 
> Sorry for the wild goose chase.

I think I will move this check anyway to driver_set_override() helper,
because there is no particular benefit to have duplicated all over. The
helper will receive "count" argument so can perform all checks.


Best regards,
Krzysztof
