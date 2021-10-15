Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8723F42FC26
	for <lists+linux-clk@lfdr.de>; Fri, 15 Oct 2021 21:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238472AbhJOTaV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 15 Oct 2021 15:30:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33575 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238348AbhJOTaU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Oct 2021 15:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634326093;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DHgVsI500xUtFvvJhND0q9V1AUlhJG7wr9pcaJspSiE=;
        b=HIjItu4Icvt7zKRnsHURmw7ew3OpCZhEGC+IwgEnpKTSLM/hHH3CXtBiFexfKQYm9JhBpi
        gutx2HDGk5RXLSlwNz7X6Pk/hNNZ8WgpkbV5D247lnCqS1hjVORmI5yp2YYBuaFdmVLPVv
        duCjsaSV675MVhgYZflvN7JhCL57LDo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-MLodbRC5OqKwuiOp0eEBmg-1; Fri, 15 Oct 2021 15:28:12 -0400
X-MC-Unique: MLodbRC5OqKwuiOp0eEBmg-1
Received: by mail-ed1-f69.google.com with SMTP id t18-20020a056402021200b003db9e6b0e57so9146944edv.10
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 12:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DHgVsI500xUtFvvJhND0q9V1AUlhJG7wr9pcaJspSiE=;
        b=2kZDsOkGY+NFYxUKR7mWTum/lG7WCKRisoMcxh59Mj/q/pqd0GHG2HLSZvh4DtpNQJ
         lNGCaYMP/1aPV0/jXeVCyKHPkZ0tbpoIT01X8STCD6qwXJIrW0O9xC5ydoTEbH3CZP2z
         j+011OdDx44mL7PBHSbgiWivLUuz1YSiYODPiI1MpJFRO/Lk8bPmsriSyTicMlYtf6wV
         nXrUU3LwgwgE7Fby2t9c6BCxDaJXuY1PiDj+HdcLvadfRZk2sTZujuZrBp/JJlbU3b7a
         wXGn96L6DZJNyQn88VnGHqwkP1m3nb9nbM/0S5PVrqYNzRu0PZRcK1jCWIC425Kf0Elo
         c3eg==
X-Gm-Message-State: AOAM531c8WXOjRpvXL0V136ASmeEOdVjShXGWySeOLCejNz04YLOPE43
        8CmYwl8BD88RpqP+HCU4oU5IWlFKfaQefZNMNwKgUjWu42tSq/I3R45FmYURcPuYCMoeSfMQ7qL
        dcLmz+Xy+NU5BNfRuZQg0QlpOOwXer36b1svxUQ2/wKLqWwZYIo75EdMnCUEnivN4XLAMmb4H
X-Received: by 2002:a17:906:270e:: with SMTP id z14mr9053755ejc.414.1634326089456;
        Fri, 15 Oct 2021 12:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy99ctIGjGxXAO5TNTGMcJ4devw27O3hL7cIKeEZl4TN6Opbo3iCGN5jicyxAP/sXDRjcROAw==
X-Received: by 2002:a17:906:270e:: with SMTP id z14mr9053711ejc.414.1634326089206;
        Fri, 15 Oct 2021 12:28:09 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id x22sm5218355edv.14.2021.10.15.12.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 12:27:54 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <843f939a-7e43-bc12-e9fc-582e01129b63@redhat.com>
Date:   Fri, 15 Oct 2021 21:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWnPaI/ZECdfYre9@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 10/15/21 8:58 PM, Mark Brown wrote:
> On Fri, Oct 15, 2021 at 08:50:13PM +0200, Hans de Goede wrote:
> 
>> Are you happy with the platform_data for this driver as defined in
>> patch 4/12 ? :
> 
> Some of the other review comments lead me to believe that you'd be
> sending out a new version at some point?

That is correct.

> 
>> https://lore.kernel.org/platform-driver-x86/20211008162121.6628-1-hdegoede@redhat.com/T/#m745cc1191f531a57ae7998f5c8817ba9a46f0fed
> 
> I am very confused about why it's in the driver without a DMI quirk
> and/or clear comments about why and saying that this is a terrible
> example to copy.

The DMI quirks live in the ACPI glue code under drivers/platform/x86,
that code instantiates the MFD cell and sets the platform-data
as part of the cell.

> I'd also expect to get compile test coverage for the driver.

Ack, Stephen made the same remark for the clk driver. I'll fix
this for the next version.

Regards,

Hans


