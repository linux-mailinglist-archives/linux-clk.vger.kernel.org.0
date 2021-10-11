Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFBDE42877A
	for <lists+linux-clk@lfdr.de>; Mon, 11 Oct 2021 09:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbhJKHNX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 11 Oct 2021 03:13:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38722 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234226AbhJKHNL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Oct 2021 03:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633936271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4ufHdDwqlN79+UhpsetonLDLuFxLVpaRNLOG0+gN/fs=;
        b=S54aJoFQubylvDHvckDd6KEPRlF6krP3lq11ss/oTWCKumlSX9GMOdSvoGBFqheU55rBRN
        7VLHBPN3XW44ibVTIut/ab+id9uQn4unYSscyxdi1ZL7xPlk6JaWz/cxcPqCXJORKO85HT
        WhWtDM2k3+ZgbQbr3zWxlxpFlirm9I4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-KfWKjbfeMmezZNzY7DUEFQ-1; Mon, 11 Oct 2021 03:11:08 -0400
X-MC-Unique: KfWKjbfeMmezZNzY7DUEFQ-1
Received: by mail-ed1-f69.google.com with SMTP id i7-20020a50d747000000b003db0225d219so15075403edj.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Oct 2021 00:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4ufHdDwqlN79+UhpsetonLDLuFxLVpaRNLOG0+gN/fs=;
        b=ZZurFvuth3laMDv6xGL4B1kXcMPQcoOO/QN6u4bJu7ELz4sBHwFmJYkGfzKoYG2UWu
         LoyVvBR0Z5s/Rxc0bOT5a8lYEEv4SWR31p85nzbqg3dczw6toyDEaGdRid5OlGirWJz/
         Of3F19uKKDWccaHDYzzcBEYek6TDShI7LpsaSmUP4f+C899I2syVh+XS4pqPDdAHmS/t
         QxejB28PgCcjIxq34Pyjf8d5s+YWq8JJLoYvfan3/YOSHSjvS+2zDoyMg5GdIlATwZhy
         alnPznUrAYm8KF5ywtzCR+AbRpAZKcHmESQO1e4dwUFJUWKlKvsKyUSPGuLRZnqd8B22
         g9NA==
X-Gm-Message-State: AOAM531VifxiEul5Ro7RhPZRqLdcGAYymxfwe27fcNberrLaIS4NFPbu
        lNsBmloSbznIn7/psTmXAo/56olWFafOwrGL1PiBZTEUOJFu5MUj06vg8k6JvuSEvQKiM92tkFb
        tsco7Lcrd3gna+h0fvpGqXun47dudqgD1vO9DoAdG+o2r5FQpaWp+vwSVb9ler7CVWc+Q7Njk
X-Received: by 2002:a50:e1c3:: with SMTP id m3mr39024438edl.28.1633936266863;
        Mon, 11 Oct 2021 00:11:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRmTTHfeZR3GBvJS0BieP8VpiV3k5sbhkh02O6Mc2oySZA1exPg32XReVdqCdWp4D448Zz+Q==
X-Received: by 2002:a50:e1c3:: with SMTP id m3mr39024383edl.28.1633936266561;
        Mon, 11 Oct 2021 00:11:06 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id la1sm2996905ejc.48.2021.10.11.00.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 00:11:06 -0700 (PDT)
Subject: Re: [PATCH v3 01/11] ACPI: delay enumeration of devices with a _DEP
 pointing to an INT3472 device
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211010185707.195883-1-hdegoede@redhat.com>
 <20211010185707.195883-2-hdegoede@redhat.com> <YWPXixp/J6KIzWp6@lahna>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0c08069e-7758-fc09-c200-d867d097b499@redhat.com>
Date:   Mon, 11 Oct 2021 09:11:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWPXixp/J6KIzWp6@lahna>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 10/11/21 8:19 AM, Mika Westerberg wrote:
> Hi,
> 
> On Sun, Oct 10, 2021 at 08:56:57PM +0200, Hans de Goede wrote:
>> +/* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
>> +static const char * const acpi_honor_dep_ids[] = {
>> +	"INT3472", /* Camera sensor PMIC / clk and regulator info */
> 
> Is there some reason why we can't do this for all devices with _DEP?
> That way we don't need to maintain lists like this.

Up until now the ACPI core deliberate mostly ignores _DEP-s because the
_DEP method may point to pretty much any random ACPI object and Linux does
not necessarily have a driver for all ACPI objects the driver points too,
which would lead to the devices never getting instantiated.

In hindsight this might not have been the best solution (1), but if we
now start honoring _DEP-s for all devices all of a sudden then this
will almost certainly lead to a whole bunch of regressions.

Note that in this case the HID which triggers this is for the device
being depended upon and for all camera sensors used with the IPU3 and
IPU4 Intel camera blocks this is the INT3472 device. By triggering on
this HID (rather then on the sensor HIDs) I expect that we will not
need to update this list all that often.

Regards,

Hans



1) I believe that Windows does pay more reference to the _DEP-s and we've
had some other related issues lately.

