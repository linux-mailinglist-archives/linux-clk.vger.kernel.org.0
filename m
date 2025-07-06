Return-Path: <linux-clk+bounces-24190-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C160DAF94B5
	for <lists+linux-clk@lfdr.de>; Fri,  4 Jul 2025 15:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEBBE7A1781
	for <lists+linux-clk@lfdr.de>; Fri,  4 Jul 2025 13:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA9930B986;
	Fri,  4 Jul 2025 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qRfmkpVD"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FE030AAB1
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637075; cv=none; b=V5/rRuxNEoDKAQlmZxQEubzsPdAhKu284xGVidt67GMI58VESMxRqyEg+kbKwdabgewV+5twQVKvCrlX3RGVUZR3B/09mnztrBetvY7GdHyvxbZGmi/YbBBTfL5Ca4eZyaqgeCyLCTf8tVuYv597gvFN6oCDKkkwVyEoAvQ346c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637075; c=relaxed/simple;
	bh=miC47NO9VePQREntYQ2C1ptH1JHrH445C2mxs1mptSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMQnuctddJVUcPuyDYxMGkvsTazycXygAaY+uQnsAnWsbYiPPr/UjgRAHbTHCt+d3B9U4zyEpsS4puol0DqkfzK8FLG3pjbDuf2xySByr8TFKEC4gN33B40JRVk7nsx1GOHWz/VT+94VfriWOuQhRzmxYHwDoNAbV0DhCpvveKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qRfmkpVD; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so165512166b.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751637071; x=1752241871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+4pnbmOXAdM0mHM7kF6SCf+HmJcVo3mHL3EXrsTmvo=;
        b=qRfmkpVD+xI+Npzbq1OPbfQdUTJO8vOQ9eX5GxigJa2Tqop1BOwVlQj/S9qRHzx5ty
         viijJo0m9xgO15vGt3QzdtbbE6rX+kxUIf0SNjmKTWN7qsD9gzGXGHe8h/CxP8CoVAsJ
         00dZtJsEQcSkR1yUpcFoxzwhyoSBPCtnHkiH7pz1pJKL4qKLN2dO55QZKACEisQXU1Gs
         8cD0wWE1yYcbGiZRGvbY8OXL+JEzvXr/u3E7dDPab3pA1b6ir403KnL3zfp0tKgftnVm
         C+18Q4E3kv2QP2/PxCrpcfMR1vC5fKkh00Rw/74AUPiotlD/MJ8bM0BoV7i5Hepz2DNo
         icuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637071; x=1752241871;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+4pnbmOXAdM0mHM7kF6SCf+HmJcVo3mHL3EXrsTmvo=;
        b=HAUKGmbERBgKtTleExw0WAoCziw6jsi3exu6vOJD1xX3yN27tmFJlpYfqjcSf8Bp3j
         VfudYi8skaHt9aGL3xH9va7pAKenpnb3hbbaPGJKHtxZFmlZmqf1XhqsiQas6G2Scp6d
         p0Fue0JhUhcbHKGXlOHKwImWjCZh7/UEHzoHiw56iiDJA6x2vk7bepFahlwhL0eQZOM0
         601uokuox69PomZS1m6DD9FvxwZUDlnBhBsdS798UBaR2wYi+sj22ltlhxQLK6TRExCe
         3sXgH1l+ViN/ikOj/dNGqsTD53PSnOEalqY5vSAzoniJ69O7Lnj08HDK+OaWtwEECs0H
         GhAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGNq70LuPuhQPgsonbLCmT98WEeDNk6ir7jViQQhcWhKyhRsBNvCDv/wWv9vxOFa0QPv+3QYNFXik=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrn2OaK7JmFUMGQkKpWh4HH6UCb+4AGYsNnkVwpCVkYWXvcCYG
	9zMhGT7FJ1zpUzXWcaal4AqrVVJJxH94Db0TqHyg/NCkDudiLiDElmiNmsD12yrRzjE=
X-Gm-Gg: ASbGncvnPx834DJkzdnbcZjZVUTtOUmqiJ2x/+sfU4pOzH6PvtWpBoUG5ZNUV8dky6i
	yJ2hFPzuDQNNWSSR09NRv850c8Fc6TZVCgfrjfxv/zu01BOtD0L+996NmahsbMcP3i21LB+Yp71
	R2K7bRyLeplC1a4vqprmM3ItlDW6x35+dNFvxjFHQwCoySfUsGze8cHubcVHXfRHwmXjLx5yK6e
	3Wb8iOq16waGEsEvry0Q5LY981RZ2tEZ9V0eqwLfahKXUrgSRodL+NDx5gCCCgjdWrsk6BVvAHk
	oNd4NH+HhsN1OjMOs5W+fb15rlakfERm8Mf51BnTobyd030h+EMSEXGYxrV2fbz4m7dzdw==
X-Google-Smtp-Source: AGHT+IEKaHL8J9Su0mB3XI0LmZS3jYa1Tv+ttRwStxrwJ7gZXvWH4fgHU4a56M1/TXoMiu+j5EZrtA==
X-Received: by 2002:a17:907:6d26:b0:ae3:6cc8:e426 with SMTP id a640c23a62f3a-ae3fbc336f7mr270116966b.9.1751637071005;
        Fri, 04 Jul 2025 06:51:11 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692ecacsm179199366b.57.2025.07.04.06.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 06:51:10 -0700 (PDT)
Message-ID: <930cf8e2-5716-4a36-8238-e573876db869@tuxon.dev>
Date: Fri, 4 Jul 2025 16:51:06 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] PM: domains: Detach on device_unbind_cleanup()
To: Ulf Hansson <ulf.hansson@linaro.org>, rafael@kernel.org
Cc: linux@armlinux.org.uk, gregkh@linuxfoundation.org,
 david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
 dakr@kernel.org, len.brown@intel.com, pavel@kernel.org,
 andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, wsa+renesas@sang-engineering.com,
 mathieu.poirier@linaro.org, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 broonie@kernel.org, robh@kernel.org, jirislaby@kernel.org,
 saravanak@google.com, jic23@kernel.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 bhelgaas@google.com, geert@linux-m68k.org, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, fabrizio.castro.jz@renesas.com,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFoznqfdX7Dvu3VPa5Me10VHGphnRRHrU17w-fie7HrQ5g@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAPDyKFoznqfdX7Dvu3VPa5Me10VHGphnRRHrU17w-fie7HrQ5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ulf,

On 04.07.2025 14:15, Ulf Hansson wrote:
> On Thu, 3 Jul 2025 at 13:27, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hi,
>>
>> Series drops the dev_pm_domain_detach() from platform bus remove and
>> adds it in device_unbind_cleanup() to avoid runtime resumming the device
>> after it was detached from its PM domain.
>>
>> Please provide your feedback.
>>
>> Thank you,
>> Claudiu
>>
>> Changes in v5:
>> - added PD_FLAG_ATTACH_POWER_ON, PD_FLAG_DETACH_POWER_OFF;
>>   due to this a new patch was introduced
>>   "PM: domains: Add flags to specify power on attach/detach"
>>
>> Changes in v4:
>> - added a flag in dev_pm_info that is saved in dev_pm_domain_attach()
>>   and used in device_unbind_cleanup()
>>
>> Changes in v3:
>> - add devm_pm_domain_attach()
>>
>> Changes in v2:
>> - dropped the devres group open/close approach and use
>>   devm_pm_domain_attach()
>> - adjusted patch description to reflect the new approach
>>
>>
>> Claudiu Beznea (3):
>>   PM: domains: Add flags to specify power on attach/detach
>>   PM: domains: Detach on device_unbind_cleanup()
>>   driver core: platform: Drop dev_pm_domain_detach() call
>>
>>  drivers/amba/bus.c                       |  4 ++--
>>  drivers/base/auxiliary.c                 |  2 +-
>>  drivers/base/dd.c                        |  2 ++
>>  drivers/base/platform.c                  |  9 +++------
>>  drivers/base/power/common.c              |  9 ++++++---
>>  drivers/clk/qcom/apcs-sdx55.c            |  2 +-
>>  drivers/gpu/drm/display/drm_dp_aux_bus.c |  2 +-
>>  drivers/i2c/i2c-core-base.c              |  2 +-
>>  drivers/mmc/core/sdio_bus.c              |  2 +-
>>  drivers/rpmsg/rpmsg_core.c               |  2 +-
>>  drivers/soundwire/bus_type.c             |  2 +-
>>  drivers/spi/spi.c                        |  2 +-
>>  drivers/tty/serdev/core.c                |  2 +-
>>  include/linux/pm.h                       |  1 +
>>  include/linux/pm_domain.h                | 10 ++++++++--
>>  15 files changed, 31 insertions(+), 22 deletions(-)
>>
>> --
>> 2.43.0
>>
> 
> The series looks good to me, please add:
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> 
> Rafael, do you intend to pick this via your tree?
> 
> Another note, the similar thing that is being done in patch3 from the
> platform bus, is needed for other buses too (at least the amba bus for
> sure). Claudiu, are you planning to do that as a step on top - or are
> you expecting others to help out?

My plan was to take care of it once the approach here (or something
similar, if any) will end up in a release.

Thank you,
Claudiu

> 
> Kind regards
> Uffe


