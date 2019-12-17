Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 896491235E4
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2019 20:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbfLQToT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Dec 2019 14:44:19 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41707 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbfLQToT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Dec 2019 14:44:19 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so12287226ljc.8
        for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2019 11:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vye4oexJqkfXygyyqfKKuP3+inegaXkNPqfoCHpgpw4=;
        b=lMjHeNrDcmPquzjFtMxngt+Tg9J0qL9x70PiYWvW1z/pd8s1iFHFz0Vb6ZEYQGn4Gy
         /1+nYCBnjdA55PBOa7Qo5CZZvxuI5jWXO+vNrhqFSH7p7CcklekDI3G31++vd9nMMHil
         C+tGHmaL3kFlB5uaTT9GJ9K/AcJL0q2VGWLHBVUjNzk9+R8KI8Vzo07PLFIbK2I4ZK+S
         ycVfSeVGBr1fFMlqwdStQwEzuzKWEIDjfAsLEZH0Sf6GBPEJ9dmjIjK22vj/60Rn5/y/
         WGsHoWuh6WZzBYhL6jzyPa6GC0TIqL4UGBDDtU2rfWPKLi1UBzvHvgzAK8BHA0RJywP7
         6VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Vye4oexJqkfXygyyqfKKuP3+inegaXkNPqfoCHpgpw4=;
        b=eDhmkZtAQ2hvT0+ypFDC/dz20psYKR/9ozLzymNTIQv/cVLDj2wp6+O9CerP9TmQ7Z
         6V+9vZ3MYYPJAs3ydhRNnBI+zNp51u/9iWFfVM7+z+9kUuvxEzl1WsGs2u5QrBOyOuUv
         jiVlhdwRTLfGD47Go/5hfBfM4z5hhNbHKncb6ZG9INyv5vdFGScywC+C9s6g4vRSk/UI
         Tm7r+ksPyx9GeOJ+Bg7pboXYlAquKr84DhKYXMdspm47gWAnGgXPfeXC/qm747vb19xU
         rZ2qHMQRc/oanFur0dRQSybeS2znXoHDJcD21jsLb2aI+z4oC4a2qFGuVDWWaXcAwKH0
         67Pg==
X-Gm-Message-State: APjAAAWZO3rsmQICcUq2DcgzsSAfJYKEkDS50YC8/SiU1THBdxsabTko
        bRPMOa5YWVwlIJLThLN7gqei4Q==
X-Google-Smtp-Source: APXvYqxGNCXLpZUOsrPpJGhGu15Gp7tw29s3tQRAjYHNkZQ3cn4kdZlrEpaQGbhF+IZ3jDWBkdMdRw==
X-Received: by 2002:a2e:920b:: with SMTP id k11mr4291780ljg.111.1576611857779;
        Tue, 17 Dec 2019 11:44:17 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:411:5312:624c:c19e:baea:21d3])
        by smtp.gmail.com with ESMTPSA id m15sm13324733ljg.4.2019.12.17.11.44.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 11:44:16 -0800 (PST)
Subject: Re: [PATCH v2 0/6] spi: Add Renesas SPIBSC controller
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Boris Brezillon <bbrezillon@kernel.org>
References: <20191206134202.18784-1-chris.brandt@renesas.com>
 <922cfa46-efb5-9e6d-67ea-3ac505b8211c@cogentembedded.com>
 <TY1PR01MB156215E8668C0317FA0826B18A580@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <e6a73df5-31c4-3472-f7bc-a0984f1f5380@cogentembedded.com>
 <TY1PR01MB1562D343E1AB06DCA2973DAC8A550@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <590840ce-a250-2512-3d04-c2420d83f7da@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <90164352-6b74-ff78-261c-374f51f83330@cogentembedded.com>
Date:   Tue, 17 Dec 2019 22:44:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <590840ce-a250-2512-3d04-c2420d83f7da@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/16/2019 11:31 PM, Sergei Shtylyov wrote:

[...]
>> My understanding is that HyperFlash uses standard CFI commands, so all 
> 
>    The CFI command set driver needed some changes too (e.g. using the status
> register to determine if a command is done).
> 
>> we need to do is register a CFI device in the driver, just like we 
>> register a serial flash device.
> 
>> (I guess I could go look at the sample code for our RTOS package and find out)
>>
>>>> library that you are proposing have a very different API than just
>>>> 'send bytes' and 'receive bytes'?
>>>
>>>    There's "prepare" and "transfer" APIs and also "direct map read" API.
> 
>   The 1st one prepares the values to be written in either SPI mode or direct
> read mode registers. Then you can call "transfer" or "direct mao read" which
> would write out the register values into either set...
> 
>> I wonder what is the value of the "direct map read" (other than XIP in 
>> RZ/A systems). If you really want to directly access the flash (no 
>> buffering though the MTD layer), you need to register as a mtd-rom device, 
>> and then you don't really need an API at all.
> 
>   I'd leave this question to Boris, else I never complete this msg. :-) 

   Didn't really summon him, doing that now... :-)

>> Chris

MBR, Sergei
