Return-Path: <linux-clk+bounces-6214-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1608AC5BB
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 09:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23BEEB21428
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 07:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193AD4D9FD;
	Mon, 22 Apr 2024 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GCwkSpOr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46426ADB
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713771620; cv=none; b=aJT2whSbSfwT1WK/Wh1rOb7oXjzG71Hjuov5phPQRztmuVyQQH8Fv0Ekry6MpyhAMUKVHw4MPIgBa5oNar1PH8WnZgnDNClLaIxLWLT4HPv0kZCT/0NmvzBVNhNi7Zhk20ICwTFf9TLEV4ZgOKhMPIaIdDp6p/sld1RsGk9+uSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713771620; c=relaxed/simple;
	bh=aCqjPF6MUCKiaG25u5tS1RHdEoH9/zJjbqQ9RdLI7kA=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=N/VjxDboLK+QsqwI2PrYXycRyj1BWkod0LoymS/zkg1tBWBNh9/tfYDVhu5m1u6t6Xe/c4lMn0GDwTOmmLmqwH5kfDlfBn1fq+b90mQtWvzLVcykbGveuU2bibp+UvjYdXyjYC0LpWV5sf9XHBgdimaWbAXH+KQpepYaL+7z1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GCwkSpOr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41a0979b999so7011715e9.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713771616; x=1714376416; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=QE+BamrWTuLTpWa6qXzuznIbfPLHvLIlFCqgFnP4XM4=;
        b=GCwkSpOr/+CP+LBJl9F0C4swYduWfnqYUAPbnNuAmV30khxAl+lBSgrwMxg69CPsiF
         We0HJRFsxG99fx2olD4mqqb++cRcaqUDKPanQUKbxVREa6FSv9ODo2wQAWchsKrSnCBO
         PhJqTpkeqEYRgB9WS///rGq07NGeLpgRwDTKPloqYLdwWEYdbzAuydvLuwTfQAVtNcvE
         gip9gRryEgmu0QPJEEvHB5lsYCZmdsVnANI5Wah36lOeqL4EjZfHz+nVoJIEhca/AMpR
         oTvFalucfCYHtTiPxTslpikQ3ru66WcoFmMP3Nm0MfFMwIsyIPQvWhzKILjss4/RZJOO
         PxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713771616; x=1714376416;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QE+BamrWTuLTpWa6qXzuznIbfPLHvLIlFCqgFnP4XM4=;
        b=bn/PBAFiT5kcTPFO3WSJaYrDSx6xE0tN0Q8ylP5f9xaGoSzp0eSmcr0OdVkgZWQEFF
         aRS1MUPxXlgY5+cK3QA8EmdHF3KBtEihe2qejsnWfF8RBjNdYLgVj3zdhGp5AI1rAoYX
         LPSwvEF++qMULv7kz9sRFVsQxJ6MU2uaGUaCPmrsQ5ql8+Nwy3G6Jp2ztnsb+qCBTAzM
         QEDtWySBy9NfYWgaiiC87pnTPb7lYs8sFXovo0ry044TvGYPOa41g9mJBZjKrLda0T38
         NYzzLN+fgzbWkGaKJgAQotdDgP7sHl645O6HYcWvmhwhalP0pExxA/REunwYZ0Z5hTvM
         2BNA==
X-Forwarded-Encrypted: i=1; AJvYcCVoaNHvR9rT+Ux3VrPSJIUNAbmXqfrLz4i4kJHcHflsOE5uKGdFJETYWh9rEMlLk4QFKqk6MF6QMb2ofZOyxHhT2H3EfhrWgfgS
X-Gm-Message-State: AOJu0YxP6HEvmUeEJNIFKZDd2vkHgi4QRe/P3asRnMEI2Vf0XCayZf1c
	ULnkVX8UXITlJSYvN6LA0+OZU2NT9UmzcNTRx8DAR3+vKme+Sja5x3Pv3xvmzEE=
X-Google-Smtp-Source: AGHT+IG1GxMcmf9NdFOYPr777X3p7JMNSnBLkFZFuq+TgYqkM9gLohUFhW5rZ49xsD+geaucH5c0gg==
X-Received: by 2002:adf:fd0c:0:b0:343:f662:18f8 with SMTP id e12-20020adffd0c000000b00343f66218f8mr4577170wrr.63.1713771615818;
        Mon, 22 Apr 2024 00:40:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a619:ccb0:5f40:262c])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d5646000000b0034b19cb1531sm1609899wrw.59.2024.04.22.00.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 00:40:15 -0700 (PDT)
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
 <20240419210949.GA3979121-robh@kernel.org>
 <b86f1058-da53-4a9c-bc12-e7297351b482@salutedevices.com>
 <48e9f035-390b-40c9-a3ad-49880c0b972d@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Rob Herring
 <robh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome
 Brunet <jbrunet@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
Date: Mon, 22 Apr 2024 09:16:01 +0200
In-reply-to: <48e9f035-390b-40c9-a3ad-49880c0b972d@kernel.org>
Message-ID: <1jle55c0bl.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Sun 21 Apr 2024 at 20:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 20/04/2024 18:15, Jan Dakinevich wrote:
>> 
>> 
>> On 4/20/24 00:09, Rob Herring wrote:
>>> On Fri, Apr 19, 2024 at 03:58:10PM +0300, Jan Dakinevich wrote:
>>>> Add device tree bindings for A1 SoC audio clock and reset controllers.
>>>>
>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>> ---
>>>>
>>>> This controller has 6 mandatory and up to 20 optional clocks. To describe
>>>> this, I use 'additionalItems'. It produces correct processed-schema.json:
>>>>
>>>>   "clock-names": {
>>>>       "maxItems": 26,
>>>>       "items": [
>>>>           {
>>>>               "const": "pclk"
>>>>           },
>>>>           {
>>>>               "const": "dds_in"
>>>>           },
>>>>           {
>>>>               "const": "fclk_div2"
>>>>           },
>>>>           {
>>>>               "const": "fclk_div3"
>>>>           },
>>>>           {
>>>>               "const": "hifi_pll"
>>>>           },
>>>>           {
>>>>               "const": "xtal"
>>>>           }
>>>>       ],
>>>>       "additionalItems": {
>>>>           "oneOf": [
>>>>               {
>>>>                   "pattern": "^slv_sclk[0-9]$"
>>>>               },
>>>>               {
>>>>                   "pattern": "^slv_lrclk[0-9]$"
>>>>               }
>>>>           ]
>>>>       },
>>>>       "type": "array",
>>>>       "minItems": 6
>>>>   },
>>>>
>>>> and it behaves as expected. However, the checking is followed by
>>>> complaints like this:
>>>>
>>>>   Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'
>>>>
>>>> And indeed, 'additionalItems' has boolean type in meta-schema. So, how to
>>>> do it right?
>>>
>>> The meta-schemas are written both to prevent nonsense that json-schema 
>>> allows by default (e.g additionalitems (wrong case)) and constraints to 
>>> follow the patterns we expect. I'm happy to loosen the latter case if 
>>> there's really a need. 
>>>
>>> Generally, most bindings shouldn't be using 'additionalItems' at all as 
>>> all entries should be defined, but there's a few exceptions. Here, the 
>>> only reasoning I see is 26 entries is a lot to write out, but that 
>>> wouldn't really justify it. 
>> 
>> Writing a lot of entries don't scary me too much, but the reason is that
>> the existence of optional clock sources depends on schematics. Also, we
>
> Aren't you documenting SoC component, not a board? So how exactly it
> depends on schematics? SoC is done or not done...
>
>> unable to declare dt-nodes for 'clocks' array in any generic way,
>> because their declaration would depends on that what is actually
>> connected to the SoC (dt-node could be "fixed-clock" with specific rate
>> or something else).
>
> So these are clock inputs to the SoC?
>

Yes, possibly.
Like an external crystal or a set clocks provided by an external codec
where the codec is the clock master of the link.

This is same case as the AXG that was discussed here:
https://lore.kernel.org/linux-devicetree/20230808194811.113087-1-alexander.stein@mailbox.org/

IMO, like the AXG, only the pclk is a required clock.
All the others - master and slave clocks - are optional.
The controller is designed to operate with grounded inputs

>> 
>> By the way, I don't know any example (neither for A1 SoC nor for other
>> Amlogic's SoCs) where these optional clocks are used, but they are
>> allowed by hw.

Those scenario exists and have been tested. There is just no dts using
that upstream because they are all mostly copy of the AML ref design.

>> 
>> This is my understanding of this controller. I hope, Jerome Brunet will
>> clarify how it actually works.
>

I think the simpliest way to deal with this to just list all the clocks
with 'minItems = 1'. It is going be hard to read with a lot of '<0>,' in
the DTS when do need those slave clocks but at least the binding doc
will be simple.

> Best regards,
> Krzysztof

If you are going ahead with this, please name the file
amlogic,axg-audio-clkc.yaml because this is really the first controller
of the type and is meant to be documented in the same file.

You are free to handle the conversion of the AXG at the same time if
you'd like. It would be much appreciated if you do.

-- 
Jerome

