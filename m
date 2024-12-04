Return-Path: <linux-clk+bounces-15371-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78E9E45EF
	for <lists+linux-clk@lfdr.de>; Wed,  4 Dec 2024 21:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 892CFBC8111
	for <lists+linux-clk@lfdr.de>; Wed,  4 Dec 2024 17:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C88212B2F;
	Wed,  4 Dec 2024 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C5++uKJV"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB45F20E719
	for <linux-clk@vger.kernel.org>; Wed,  4 Dec 2024 17:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733332796; cv=none; b=TTG69UtlwHp6eci8x2TtaVRnAyQy18w4N6GgM/QyJ4KpWavtTyJ2bE7W5CjemSz0Twwqf8ekqWjhLVvocZknYKS2fvmK3xMsJC1Cigka/iKMPWSimRzKGGgDcq07tQpmJ2xLDr3hMnm0+6f9LWxnTP8092P1YTdcjl2N9YIaZ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733332796; c=relaxed/simple;
	bh=tXXsdLO9KxmhX2kN0v31DZnP6IQNOwIeFG5m8oMHY9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KQrUJA7ZCI7uXVUZdaAemlEYMgSSquK0G+4WhyjWqpW63m+Q8Qjwqp0JU42qHOeRk4/aY+ct4uBCdUuYb+Yt/5bnxVww/zO9FtGS40CT74sLORokdv77iH6xcJ8N+SfHd8w+CZrkic3PzKtLCVP9s5Lcchy1bhv6iYNSpARth1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C5++uKJV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43497839b80so224495e9.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Dec 2024 09:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733332792; x=1733937592; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5T4VPTHC1HjDTFGld2HmMCi4WsaIbmTJEjJcmDhH4GE=;
        b=C5++uKJVUpTJj2eVctQxIPbdqGh1MAXF0AqrxbekJ67bg0MJB0rCSbDgwjerI/i14p
         qPBh6HsHTc4h/4LYtIQO7d8FC4K2AdEW+hBSW+5fzDxG5wBFErsVNjl6At9LMq6No7I3
         z6MEKJ8Jqvt8zG90FxYgkKdlHcz/Ec8k38LsZDiPWWSJ2XBZI3jdNl3R0VvCDCKx62sI
         duj9FP0zaSaAFeuL+lNAekae4AiWAm6EnMbIp6VGep4EwC9LinYpBUPL12JYM1I4DzV+
         oRiIUkOZh1wcOcLAhWR/IFpygtnpgs5XR5E8mPmZROTHBFHNb2M17aiJTDdaD/VyMZPD
         lYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733332792; x=1733937592;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5T4VPTHC1HjDTFGld2HmMCi4WsaIbmTJEjJcmDhH4GE=;
        b=BEoWtqwww3vJsq+syYeQuw8pmx/5+PKF/pE9tx5jPyoOAjMuTb+NockrmDyBdltO3X
         JDla3rDgJ3P18ikqDw4tjC3TNYShX90RpVpA9rWJPzZ3reqKNDjD9UUB8XpBGNkIKCRa
         m+YIEzc8K1syFz9bv+aJ+ZE0XJ+wY6Kiwwk5QkWQlKKDrHHLDYjjMSfrkjqDnOlulibo
         +rafz8haN5vS2GG/6rGVSlA+Rfrw2iozSlueemTpodBoavsn51kJ6CQnOOIc+W5oLD4/
         GwOFW/rbuYtzTryelGyzKoTVBd3deURTK9JaoLS3xnbuxOGPiktzxWVaiQAHYE7RVsDB
         FlcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBXIFZMdrQ6kG0g45fbL20fVjiKrZ8zNU+oj32L46x9YkyzxHAVo8mxoqdCLrhPq6uyfauEdQKl/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYaaM57RDonjB8kFYyKeHMzTNhJX3GiWdScm93/0ZKCqtq+pwc
	BmzyUZ4ZwwJ2jDXj80WAjUw8wrFYymeZ69GJtFuAjRPSKlHebmUGO68Qc8FQLfw=
X-Gm-Gg: ASbGncucrHsZ3Q8WCIXIB7Q8P2spelETAVGdgdNCc68B7UlrX+h4MYHSikIHqzmdNNk
	zti9j+Brq9L+QJXdiEmz3KbRAsFFjbm8DD3IO4olaFY1fWC2h/nWn35K/ro2Y7AIh4AJBmSWnSK
	d4GIWeNDC7ymRdvZ4gM8NTtd1woMKSgj4mvuW+l613sN+ck1mb/lwl7Lbe78YAwoDDmjyYKFshm
	+tUbZSgNqUWJvvNWN5zOAL4vb2kUIneKyAdnW+mdgS54rBD
X-Google-Smtp-Source: AGHT+IGamjM/ufETyroPqKrH9H7GIRN+D0ykimmkcBZ7eAtT6byGOqzV/kqK41jyST7ik9VBo0aRuw==
X-Received: by 2002:a05:600c:3d0f:b0:431:5f1c:8352 with SMTP id 5b1f17b1804b1-434d3f8e3e9mr46322275e9.5.1733332792107;
        Wed, 04 Dec 2024 09:19:52 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd03:bc0f:6f7:54b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5206649sm31408795e9.0.2024.12.04.09.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:19:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org> (Stephen
	Boyd's message of "Tue, 03 Dec 2024 12:15:48 -0800")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
	<1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
	<c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
	<1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
	<ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
	<df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org>
	<1jr06pkof6.fsf@starbuckisacylon.baylibre.com>
	<37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 04 Dec 2024 18:19:50 +0100
Message-ID: <1jfrn3l615.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 03 Dec 2024 at 12:15, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-12-03 03:15:41)
>> On Mon 02 Dec 2024 at 18:53, Stephen Boyd <sboyd@kernel.org> wrote:
>> >
>> > I think the best approach is to add the reset auxilary device with a
>> > function that creates the auxiliary device directly by string name and
>> > does nothing else. Maybe we can have some helper in the auxiliary
>> > layer that does that all for us, because it's quite a bit of boiler
>> > plate that we need to write over and over again. Something like:
>> >
>> >   int devm_auxiliary_device_create(struct device *parent, const char *name)
>> >
>> > that does the whole kzalloc() + ida dance that
>> > devm_meson_rst_aux_register() is doing today and wraps it all up so that
>> > the device is removed when the parent driver unbinds. Then this clk
>> > driver can register the reset device with a single call and not need to
>> > do anything besides select AUXILIARY_BUS.
>> 
>> I think this is fairly close to what I proposed in the inital RFC, but
>> generic instead of specific.
>
> Ok :-/ I've realized that we need this sort of approach in more places
> to logically split the device without making it SoC specific. It's only
> useful to have the registration API live in the driver when we need to
> call functions provided by that module from the driver registering the
> auxiliary device.
>
>> 
>> I suspect the the generic path is likely to trigger more discussion.
>> I'd like to be able to finish this migration, instead of leaving half
>> finished like it is now.
>
> Is the half finished migration a problem for this cycle? I was intending
> to send the revert later this week and try again next cycle.

Not really, with the fix you applied. There is just code present in
reset that should not be used in its current form. I'd prefer to
sanitise the situation sooner rather than later.

>
>> 
>> May I add back the boiler plate code in drivers/clk/meson, similar to
>> what was proposed in the RFC [1] and propose the generic implementation
>> in parallel ? It will just be a matter of switching when/if it is approved.
>
> Sure. You can make devm_meson_clk_rst_aux_register() use the same
> signature as I proposed above so that it's a one line patch later. And
> definitely drop the imply RESET_MESON and depends on REGMAP part. Maybe
> you can put it in the clkc-utils file?

Sure. Few things I'd like to clarify

* I tend think like Arnd, platform data will be needed eventually. Not
  sure having 2 functions, one with the param, one without is really
  worth it. We could just pass NULL when it is not needed. It is not
  uncommon. Would it be acceptable ? (for the generic helper, the
  temporary solution does not need that for sure)

* You mean (meson-)clkc-utils.c ? I could but that would add dependency on
  the auxiliary_bus for clock controllers that don't need it. It is a
  minor problem really that I could just ignore.
  I'd rather keep this helper separate if possible.

* Why drop 'imply RESET_MESON_AUX' ? I would still like the
  COMMON_CLK_AXG_AUDIO to 'strongly suggest' RESET_MESON_AUX, with
  dependency problem sorted out.
  
-- 
Jerome

