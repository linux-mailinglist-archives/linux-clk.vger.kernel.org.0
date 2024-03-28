Return-Path: <linux-clk+bounces-4733-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECEB87E78C
	for <lists+linux-clk@lfdr.de>; Mon, 18 Mar 2024 11:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B42E1C2138B
	for <lists+linux-clk@lfdr.de>; Mon, 18 Mar 2024 10:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBA635F0C;
	Mon, 18 Mar 2024 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ngikuw+3"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FD12E633
	for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710758449; cv=none; b=daHyyFxHMU/Nc/Kms7jvHXpKrX3x5nfiiUAs3EP9Yhfg84DflWIRy8Sy3RoGamPhn7BWi5+fN1uA4Tao9bDbvJu/zc6y4wg6b30d5LwqZy66M5Ry/PNWmK+oYbfoZtUTLKXljDqMgbzCv3+NJD/dlloXTIPiQyENCvF6J/1YnOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710758449; c=relaxed/simple;
	bh=i5ixDYb3wbENoImw8j5KKJEmWmhgfjQSVNTIJMv1DhY=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=shPdQ7GthxfsmVL+yY+2hE+jeTjm8fNk2YHbwCA9KNY6jdUTPUqxrh/7AEPJuHgEVsia4K6scZMKkx9zX6JvnyYOhQYhX95+gbA96rkzjIS6MsV61zvFEHcJp7hFDF8bmN3SFuekKau9p4BVJyW653PU34jpU6N1HGuHg+8QOjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ngikuw+3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4140a9f25adso9954775e9.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710758445; x=1711363245; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=xNzf7P8nz60f5DqiZ1A/ORzVISDkI6sI6tCR2mQw6JE=;
        b=Ngikuw+3cNJp9rXoQiOJ2p93RAsF34UruLbhm6ntsmzb9jVrQn7uD1aG7Xz6ErKrxy
         2fPnnQZVHAS6hTNgqCXBwtVIQW2TZ7YlfxjQvLeuIn6xAyind4ZIrh7Z6KU/Gh8JECv6
         vqjpkfV9IjZ9y0uKxq4tvL6YFKofrlbdB5pfdMLk48d/W1gwtxSacexXTPLG0ZDdIomJ
         RuJhePL/Fd/mX8gjzjDdV+ZeBKY+JXSXi8uH67e3mW+vx+WLGysWFlZJpETFAgwfUzuJ
         3s9W6Cz7ufbkn/6/OYUQxQ9NnxJDQs0GL6yzW/11CXrME36NCFesd/wSS2EZt6LVKaAD
         KSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758445; x=1711363245;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNzf7P8nz60f5DqiZ1A/ORzVISDkI6sI6tCR2mQw6JE=;
        b=erLl+97WzXODhQ5cllyQVmD61uxMIZe1DKguljgh7f/9kGEWthb97gOL4q1DnqUKH2
         L7McaMl/Vb74p+LFw/AfIciLU0aEcLcMOWGNuZF5zNP2F1IAtS2B99ffgPYMEMys5/Af
         DmpJOocRBFqVzrDXgJfKqIB3qLSHVMVt2QwOq4fdaem46WWMfm2Ay+pGYGMPDNilAvjU
         tMlnWBTQJfov/Bmu+81eFJTFFQaYanZC93qH2E+a437i7DTfbLsUpzbgXvXU4yVCulAj
         GFTyUFse4u+tXxeLh8dJ8liMAvpTWuGyo0bWuvifDl0ERg92SJKeOATZKixBF+B+rudB
         632g==
X-Forwarded-Encrypted: i=1; AJvYcCU7v2mZtg3Ll3QlS9YlU3z3oEBGL+hxBnSiT0OwwkSrOzUI4qwHSnxfwQd6o4sjMLW0g9Wx9ZnXcTWesfDr0vTIcIa9IIEW/Lgf
X-Gm-Message-State: AOJu0Yzi/ZWHNJxsMqDDQ7Ol9vlJN1n1NVuUWBtxJvw/NM3irD+ifJKW
	Zkmw5krCIsMPJ+vj6RBm7014JANJ290sacArgZk67oldyedakJeRoSlDlQBFUsg=
X-Google-Smtp-Source: AGHT+IF2NPmkDgNrJwjlDs0dlEQjbzK0dB/C1p7NsE17fQtvvBPtrHxeI38T1w1hQ953d1PS97HQkQ==
X-Received: by 2002:a05:600c:4707:b0:414:ca1:6531 with SMTP id v7-20020a05600c470700b004140ca16531mr3050478wmo.41.1710758445095;
        Mon, 18 Mar 2024 03:40:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b00414105c4cd9sm2909256wmg.21.2024.03.18.03.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:44 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
 <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
 <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 01/25] clk: meson: a1: restrict an amount of 'hifi_pll'
 params
Date: Mon, 18 Mar 2024 11:17:14 +0100
In-reply-to: <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
Message-ID: <1jedc7hlg4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Sun 17 Mar 2024 at 17:17, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/15/24 11:58, Jerome Brunet wrote:
>> 
>> On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>> 
>>> Existing values were insufficient to produce accurate clock for audio
>>> devices. New values are safe and most suitable to produce 48000Hz sample
>>> rate.
>> 
>> The hifi pll is not about 48k only. I see no reason to restrict the PLL
>> to a single setting.
>> > You've provided no justification why the PLL driver can't reach the same
>> setting for 48k. The setting below is just the crude part. the fine
>> tuning is done done with the frac parameter so I doubt this provides a
>> more accurate rate.
>> 
>
> You are right, it is not about 48k only. However, there are two issues.
>
> First, indeed, I could just extend the range of multipliers to 1..255.

Why 1..255 ? This is not what I'm pointing out

According to the datasheet - the range is 32 - 64, as currently
set in the driver.

The change you have provided request a multipler of 128/5 = 25,6
If you put assigned-rate = 614400000 in DT, I see no reason can find the
same solution on its own.

> But I am unsure if hifi_pll is able to handle whole range of
> mulptipliers. The value 128 is taken from Amlogic's branch, and I am
> pretty sure that it works.

>
> Second, unfortunately frac parameter currently doesn't work. When frac
> is used enabling of hifi_pll fails in meson_clk_pll_wait_lock(). I see
> it when try to use 44100Hz and multipliers' range is set to 1..255. So,
> support of other rates than 48k requires extra effort.

Then your change is even more problematic because it certainly does not
disable frac ... which you say is broken.

That parameter should be removed with a proper comment explaining why
you are disabling it. That type a limitation / known issue should be
mentionned in your change.

>
>>>
>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>> ---
>>>  drivers/clk/meson/a1-pll.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>>> index 4325e8a6a3ef..00e06d03445b 100644
>>> --- a/drivers/clk/meson/a1-pll.c
>>> +++ b/drivers/clk/meson/a1-pll.c
>>> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>>>  	},
>>>  };
>>>  
>>> -static const struct pll_mult_range hifi_pll_mult_range = {
>>> -	.min = 32,
>>> -	.max = 64,
>>> +static const struct pll_params_table hifi_pll_params_table[] = {
>>> +	PLL_PARAMS(128, 5),
>>> +	{ },
>>>  };
>>>  
>>>  static const struct reg_sequence hifi_init_regs[] = {
>>> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>>>  			.shift   = 6,
>>>  			.width   = 1,
>>>  		},
>>> -		.range = &hifi_pll_mult_range,
>>> +		.table = hifi_pll_params_table,
>>>  		.init_regs = hifi_init_regs,
>>>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>>>  	},
>> 
>> 


-- 
Jerome

