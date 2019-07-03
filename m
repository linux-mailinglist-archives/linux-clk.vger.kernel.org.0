Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32F245E41B
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2019 14:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfGCMk7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 3 Jul 2019 08:40:59 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:50625 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfGCMk7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Jul 2019 08:40:59 -0400
Received: by mail-wm1-f51.google.com with SMTP id n9so2069720wmi.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2019 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=REnOeEN5yGA6DyLHYZUXObOyZCyVPJqos2PFAeloT7k=;
        b=tozxBVBj8Zx3/S4JOAkF4a5m+vhqYKE2FZcfa+qH6ELSArafWHyGRNUtG6pNYT7Ovt
         R3w4RriHSl55srSSXoSz60ResDvaxdxcBnlkj77F1MXPQ82WER6328sXmSyr5Z/EMTin
         kAZt+LVQ3GpKa9SEdo5HpNqtgLpy66dR5K8Djxhcrqms6IOr5yD+bp93WooNpo0sBFbv
         TGgkW76J/K7eDePQ7M63uxp8HWfr5Jom2D9uQA5KFDp+H3ySKnVMtExmwcvKwU1UfH8C
         bPoMr/V3aIqJ9xwS5Nyy04U+/UEKh5x/GE1NtHu/xl/qRUSD744fvS0ieYvdzSYsxMnV
         HdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=REnOeEN5yGA6DyLHYZUXObOyZCyVPJqos2PFAeloT7k=;
        b=Uub2epdQT11JAn9va6k9XJdKSeYVicVEfI6utcjymdA1PjsoffqY7zIYlGgfwE3/1A
         g6R9as0GUdtzjNMOmU3Ik+4bbIsTPxHgFPAYXpDodhrsAfScbbu30d4PRqtT3Pjgwb8y
         zQQNvCTTZRtUyko8+AxSFrGDoyxbo9Y3mSdkXLs7cRhQtDKh+S7jsfVuQYwc/p7r1pQ5
         VyLWZ0t8pbskENf1YlgOTNfOFMU2i+NGx1l7PomVXcnLiWC4NiOCWvdN3+o/xwaecVS+
         xVx/Y6H3k9FD/Y7C15qYUv9aPVs/Xl2/edntPppzW0+vkfT5oYjmTEggEBFswrTHWlR1
         XPlA==
X-Gm-Message-State: APjAAAWvz7rLhtpjKpprEyskeux/vMIfetk29Rj/1b94881TFrMK8JSd
        vcNAUjHKwigEFuYRvNs57jk3ZQ==
X-Google-Smtp-Source: APXvYqzv39vxjEOuFXIZd2izLbkL+W+voUSFY7XUgtQYBiXS3oC/SBtBaMlJedbypMkeWFSaJyc9mQ==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr2879582wml.97.1562157657223;
        Wed, 03 Jul 2019 05:40:57 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c65sm2327372wma.44.2019.07.03.05.40.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 05:40:56 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        amergnat@baylibre.com
Subject: Re: [RFC/RFT v3 04/14] clk: meson: eeclk: add setup callback
In-Reply-To: <301695b6-52ba-92b1-ca1a-d4d587b33eeb@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-5-narmstrong@baylibre.com> <CAFBinCA1gUUbEj=++1rGcFQ1RdyxSheofAo=TKw3-UaenFAcug@mail.gmail.com> <301695b6-52ba-92b1-ca1a-d4d587b33eeb@baylibre.com>
Date:   Wed, 03 Jul 2019 14:40:55 +0200
Message-ID: <1jo92b70ko.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 03 Jul 2019 at 13:45, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 03/07/2019 01:16, Martin Blumenstingl wrote:
>> +Cc Alexandre Mergnat
>> 
>> On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>
>>> Add a setup() callback in the eeclk structure, to call an optional
>>> call() function at end of eeclk probe to setup clocks.
>>>
>>> It's used for the G12A clock controller to setup the CPU clock notifiers.
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> this will probably work fine, but I want do double check first
>> 
>> are we planning to get rid of meson-eeclk (mid-term)?
>
> AFAIK no, but maybe I'm not aware of it !
>
> Neil
>
>> Alex has some patches to get rid of all these IN_PREFIX logic.

The prefix logic will go away with Alex's rework, so are the input clock
But meson-eeclk, which is just a common probe function do avoid
repeating the same things over and over, will stay

>> I'm asking because if we want to get rid of meson-eeclk it may be the

May I ask why ?

>> time to do so now to have less logic to migrate later on
>> 
>> 
>> Martin
>> 
