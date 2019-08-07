Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE0B84E0A
	for <lists+linux-clk@lfdr.de>; Wed,  7 Aug 2019 15:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388007AbfHGN5V (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 7 Aug 2019 09:57:21 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:47062 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388008AbfHGN5R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Aug 2019 09:57:17 -0400
Received: by mail-wr1-f65.google.com with SMTP id z1so91491868wru.13
        for <linux-clk@vger.kernel.org>; Wed, 07 Aug 2019 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=JEGhf93f3Akg5xAiAZZbwAtjhXGTAB4HITGZRviUGbw=;
        b=hxltUPayeYBh+lxDyHLGBFwRsdfIsK3H03jSxiT/X/jXjZlCUPV9CmHMKclSe/HCBm
         /9zxcigUzAl1ZkmYidLc0CIWDPKORG4iM2/ni22+l3Z3ozLNU/92lKb2fwY989mKV0xy
         FhKG/1rS1kcl/WZyFLqyXP6tGemSZliw1rdVCNGHoR4/hpanz+LBPKs+Ji+mYYDiHerH
         YpfPI7LhoQlM8zBUon7PWChkmNIJKNakymjqeE1ftwmYJZ5q6/GHvXlsn2oeRH0rcO2f
         mHco3Srg1/In/v+lui9YNh1XO06OPo33pXMavv92Uzpqdgy3ELs+LpY0BEn7yqRNm2GK
         DTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=JEGhf93f3Akg5xAiAZZbwAtjhXGTAB4HITGZRviUGbw=;
        b=j0VSFDPHx8jCMo377dx4s2JDxB2Rgg0f/mICgzY1E45vaPh6jHGEiPq/qY7nNjmn4k
         Ik0KOGCOkCCnBvY/zu7ol5WWl0fdG9Zr3+QhNtEF4zLXSze/913SCPRGBSlmIJVsSB9h
         4mh70HS5gOPtslNyKW8+BxNZmrdahtJIsKVmpd+Uy8W4eCO3dWMkUnSF/PzVgf1PhBMH
         ZtEmyV3tfVW7tYkFTqgNdcKndw7Rla8YdE7eNaYCCfXK/CF27/lb5zuInLcIPIo8xtuc
         2ISQHzpRFA3hNUg2t4F4I/zSpyF4UfkKnMd5mzbsPx2ME/Es2o4mQgns4xAGYsRjByV+
         p3og==
X-Gm-Message-State: APjAAAWG0vubBBK8Kb1YbrICygXrqhCf7/OdQiYItSATlsnZXmCRtF0L
        sT0gojtI6Y4cQeVxXtVZ8lkKRw==
X-Google-Smtp-Source: APXvYqxNBWO6G3Xg9M6cSGKJ3YUVTSJRRAVQcoPT8gpOxFh3XGef3u6b9macerFbJF++7wbX6faRHw==
X-Received: by 2002:adf:e2cb:: with SMTP id d11mr4614004wrj.66.1565186235445;
        Wed, 07 Aug 2019 06:57:15 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id k9sm26301161wrd.46.2019.08.07.06.57.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 06:57:14 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/9] clk: meson: axg-audio: Don't reference clk_init_data after registration
In-Reply-To: <20190806214852.DE14F216F4@mail.kernel.org>
References: <20190731193517.237136-1-sboyd@kernel.org> <20190731193517.237136-4-sboyd@kernel.org> <1jwofqvftg.fsf@starbuckisacylon.baylibre.com> <20190806214852.DE14F216F4@mail.kernel.org>
Date:   Wed, 07 Aug 2019 15:57:13 +0200
Message-ID: <1j1rxxoz7q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 06 Aug 2019 at 14:48, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2019-08-06 01:49:47)
>> On Wed 31 Jul 2019 at 12:35, Stephen Boyd <sboyd@kernel.org> wrote:
>> 
>> > A future patch is going to change semantics of clk_register() so that
>> > clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
>> > referencing this member here so that we don't run into NULL pointer
>> > exceptions.
>> 
>> Hi Stephen,
>> 
>> What to do you indend to do with this one ? Will you apply directly or
>> should we take it ?
>
> I said below:
>
>  Please ack so I can take this through clk tree
>

Missed it, sorry.

>> 
>> We have several changes for the controller which may conflict with this
>> one. It is nothing major but the sooner I know how this changes goes in,
>> the sooner I can rebase the rest.
>
> Will it conflict? I can deal with conflicts.

I'll check to be sure and notify you in the PR if necessary

>
>> 
>> Also, We were (re)using the init_data only on register failures.
>> I understand that you want to guarantee .init is NULL when the clock is
>> registered, but it this particular case, the registeration failed so the
>> clock is not registered.
>> 
>> IMO, it would be better if devm_clk_hw_register() left the init_data
>> untouched if the registration fails.
>
> Do you have other usage of the init_data besides printing out the
> name?

No other use

> I think we could have devm_clk_hw_register() print out the name of the
> clk that failed to register instead, and get rid of more code in drivers
> that way.

Sure, why not.

> Unless of course there are other uses of the init struct?

I was just commenting on the fact that initialization function tends to
rollback what they can in case of failures, usually.

>
>> 
>> >
>> > Cc: Neil Armstrong <narmstrong@baylibre.com>
>> > Cc: Jerome Brunet <jbrunet@baylibre.com>
>> > Signed-off-by: Stephen Boyd <sboyd@kernel.org>
>> > ---
>> >
>> > Please ack so I can take this through clk tree
>> >
>> >  drivers/clk/meson/axg-audio.c | 7 +++++--
>> >  1 file changed, 5 insertions(+), 2 deletions(-)
>> >
