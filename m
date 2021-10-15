Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519A642FC7D
	for <lists+linux-clk@lfdr.de>; Fri, 15 Oct 2021 21:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242823AbhJOTur (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 15 Oct 2021 15:50:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30226 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242828AbhJOTug (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Oct 2021 15:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634327309;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1hH4W57qRLgsm0O9+HdRUSpD7zjpM0ZP5d2Uict6qKQ=;
        b=BhVWlqIJXYy/XX4lYp3F2SGsqwK6JLd7cVF7o3roGTNwblSkctLEDFA0zG7kYKmVI9hSLP
        ODQvWDMVjcah/UvzKWPrlJGovFkM21v5ofzM+R4RTUidtZdElB3BdCqIU9kblC2qNeorsH
        XXS1ElWh6ww+jGeLHpOV7Aiu9Q25B4k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-14Pi6Lp4PNqbPX2dZHzTdQ-1; Fri, 15 Oct 2021 15:48:27 -0400
X-MC-Unique: 14Pi6Lp4PNqbPX2dZHzTdQ-1
Received: by mail-ed1-f69.google.com with SMTP id v2-20020a50f082000000b003db24e28d59so9191104edl.5
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 12:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1hH4W57qRLgsm0O9+HdRUSpD7zjpM0ZP5d2Uict6qKQ=;
        b=wxfjUtTic/DFimtAw8itnDVImngs/D+YCGFbg+kH9coQCf7emjkBtb1Bv4sSuCPcTs
         8ekvKtaus1WwAtkj99BabrjSbcYv6iFCz1cA4N+Vhds1qxkCxaxHTi20bhzR4UAPfee7
         +Nn6RxDvszr2nqYI6cAt1V3GUjcAAHMpsnaUpMCF7Gexta4kg0wdnSy3G7yUheGOF1iW
         fvEe8wIq7KW/a3ZX+7eqg97epdgaLM+dWrzJ42Fm2W23S7mZk/DDSNWIo3BohG81XmFf
         aajooAdkBSaPSGoIh+3/lgKrp5l9ffTdRIw3PHjHogsagHtljE8j4pS97K+L6DPxve3G
         Aw3w==
X-Gm-Message-State: AOAM530u7ODMTIHsomzeW0uPURuucUNmA3+1Iw0qryAycUUSzHZON0MF
        SX9Z20NqlqsQ248UD98EUFXy0rJ/30u8oE7XS8f6CSJ3RnV26la5ErdNWt3UZrg+wMphp3SQNw6
        nKVuDaexXHwsNsveiVxkBAu8FPaTN0jC6GZsQwfxCDS+VbnMsqaPrIT/ycLFcxraeooq02Dzn
X-Received: by 2002:a50:9d48:: with SMTP id j8mr20595786edk.165.1634327306340;
        Fri, 15 Oct 2021 12:48:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBOCFkCR2vdRzxrwAi1cJBTtzNkY4QmZY6+q1a1h0qqrN3XXenbeNF2Zkd++CQueWa9xXBvQ==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr20595754edk.165.1634327306125;
        Fri, 15 Oct 2021 12:48:26 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id v13sm6036701edl.69.2021.10.15.12.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 12:48:25 -0700 (PDT)
Subject: Re: [PATCH 05/12] regulator: Introduce tps68470-regulator driver
To:     Mark Brown <broonie@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211008162121.6628-1-hdegoede@redhat.com>
 <20211008162121.6628-6-hdegoede@redhat.com> <YWQU/SYTT5Vk24XH@sirena.org.uk>
 <f6f2d7e8-fdb8-ed64-0cdd-65aded9fc42c@redhat.com>
 <YWmwZJvDYjPWJdb4@sirena.org.uk>
 <d0d1dc05-4cc6-2f47-88a9-700cfc356d86@redhat.com>
 <YWnPaI/ZECdfYre9@sirena.org.uk>
 <843f939a-7e43-bc12-e9fc-582e01129b63@redhat.com>
 <YWnZIZTPiuAIazV+@sirena.org.uk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c595b143-d7ed-e76b-7734-e03d14e0f76e@redhat.com>
Date:   Fri, 15 Oct 2021 21:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWnZIZTPiuAIazV+@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 10/15/21 9:40 PM, Mark Brown wrote:
> On Fri, Oct 15, 2021 at 09:27:50PM +0200, Hans de Goede wrote:
>> On 10/15/21 8:58 PM, Mark Brown wrote:
> 
>>> I am very confused about why it's in the driver without a DMI quirk
>>> and/or clear comments about why and saying that this is a terrible
>>> example to copy.
> 
>> The DMI quirks live in the ACPI glue code under drivers/platform/x86,
>> that code instantiates the MFD cell and sets the platform-data
>> as part of the cell.
> 
> I can't see how the quirking gets propagated through into the driver and
> I'd really expect that in a situation like this the platform data would
> be passed through as platform data from the code doing the quirks,

That is exactly what is happening here. The platform_data in this
case is just an array of regulator_init_data pointers (one per
regulator in the PMIC):

struct tps68470_regulator_platform_data {
        const struct regulator_init_data *reg_init_data[TPS68470_NUM_REGULATORS];
};

This struct gets filled by platform specific code under drivers/platform/x86
(in later patches in the series).

And the regulator code in this patch consumes this like this:

                if (pdata && pdata->reg_init_data[i])
                        config.init_data = pdata->reg_init_data[i];
                else
                        config.init_data = &tps68470_init[i];

                rdev = devm_regulator_register(&pdev->dev, &regulators[i], &config);

So we have the code doing the quirks determining the regulator_init_data
and passing this through platform_data, which AFAICT is exactly what
you want?

Regards,

Hans

