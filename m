Return-Path: <linux-clk+bounces-24067-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E040CAF6E0F
	for <lists+linux-clk@lfdr.de>; Thu,  3 Jul 2025 11:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7901C3BEA3C
	for <lists+linux-clk@lfdr.de>; Thu,  3 Jul 2025 09:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EF42D3A72;
	Thu,  3 Jul 2025 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xwrsGYbr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A82D3A64
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533351; cv=none; b=ZU7fOrYuU2siRYaB9LhzRQVWG7l+YjiowEVh1YXAlCjdVKXl5ZFAM+MurQG+GU7+BxKbJENoCGL55JcD9vCu9rahzqs6PA6L8GSPPe/UJz+y/rClHuBtlBPdgZBXCjmfleril0Z5BYSeWKLw/q1hMNTuibKZqoNMlyXJp1Be5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533351; c=relaxed/simple;
	bh=wSBzuFutXlxhtQUuNemypiuvl59GnjyGrzdoy8POasE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fyZElS4EYQOTs01dCfb0PJLxNaNE59EfqlYA/G4YYSMwy2WlXEv5GHBrSz0IZP+sc0gtb0aiBWQUPIMh8tdHDFUZ7MqKVxS6TLSxvQ0ZdS+ECaG5/V++rdlnAtsz19dl4RN/X+8i0SXs5zf9EOKe4Tzz54gB8vmHNyKH8yfUZQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xwrsGYbr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4531e146a24so45681755e9.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751533347; x=1752138147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLpRhZ8oYlqdUPrBtWQJGdWQR4/qJlb3vPx62hFSxUg=;
        b=xwrsGYbrozg0+2KzHDsm/PMkYJdUio9n9EtabwAZdEPKRNBprYQmrmBThrExTr0yxG
         4QJDL7myzv/ZvWXHp3IINF/51+ZOn8un0ezfg5SYgmSbvgh2JZbefB+CIsiHwfwfgtSI
         Pqa3/GLwVwjHt+kj8xa3u/ejHTxA0UHzBOKMl1nD/dubgDxPhatT2OaYga4/YUu+OWe1
         lztn8Yi2mSwy93iO+fHci9t4CDq5SHlHeg/vmWaWGkle3g/3xFmbL1wUuN27o7O7HdLt
         kwVIUR/VHP66mAcL2ilySFJYWs5o+ydmN6BWd51ZzycG0qos2miPuEUBsrvLnYsWrq2u
         IFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751533347; x=1752138147;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fLpRhZ8oYlqdUPrBtWQJGdWQR4/qJlb3vPx62hFSxUg=;
        b=nfG6wWhuQt24E5+gpnNfvyJT4qkrNdnPB7gRoY7r+afI0vNSafsIGNpKZXb+H5k7BR
         meb3havCm2Os+gIIoEXxaK9nkHWFQvRgVmnkLHwRmQNMZUllXCAyN2JvSYa5asNLx0ku
         lN4SXHyeamODWnRCUju0Th31avrFAkFkrhi1R1y9B3BynZMNnrC5Ruk1hRUb4in+E7zZ
         2BOaMEJ2IGd/rYMF3TWNdlSTf9+00gmrzSJ4xvMClBG1jJeeChSqXiKgN5hG/YCDswen
         vKJDOAdRWDTSTUEq2j4upxz2iQ4HJMDtWh1I/SufcwdGsn14ahNnO2jNklJdKPqqoY32
         lkZg==
X-Forwarded-Encrypted: i=1; AJvYcCVIfn7IGEPbqaSMgHmO81wkhIlRM9vu9j0G3JOSuyZirwYWkg/cFMMNnPfVO+iIDMEf28WNMpz6r0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhOdBjVSqKQGvs0FWEMLNbl7voFgckAUn/dtZVg+/pDxhIDaI7
	9HHRpsejtcXmH0jfx+tbgVDcbexofqUaLuFkvdJC6sWUtGb9t2VJxeZxZstBhJ0CbX0=
X-Gm-Gg: ASbGncvhuR+AU7IuxBagcJ0nYKTCNkNW51zH1KGMOPdBcn6wZRP3F96vSHZaZr7vEDt
	Wa7cUM8Lclk6/a7BRYvXtaSc49jt3PYzEh/2DHdr4JaqhNaSkt4kxCTV8bt++vllI1GRAX1rbYM
	vjdKBXvtAW9CCjacn2uoBS8BdSzBXlmrc1ME1bcYSb1+QKDf29hkb75b5DMhtyT16G/aSd1L15v
	LTjMaPkKSrzIV9rCBx5T+apnv35jkExLh+fvXR17w/+ibF4VEWhNFKl/9wQucvWheFK2Vb+NeNQ
	+cODolee69xlABdBbV2viVD/prSd6H/B8YjogCygpPTYsaholn7HlWDX/g7hk50ZSOXzAPxi
X-Google-Smtp-Source: AGHT+IEpB6jnvVhDM96CIt4ZF+uBHmqcylICsBSVvBhL7X6XFgQme1VhuXRkTOD5F0uhXQjbeKMrBQ==
X-Received: by 2002:a05:6000:4914:b0:3a4:eef5:dece with SMTP id ffacd0b85a97d-3b1ff9f5966mr5613528f8f.35.1751533346613;
        Thu, 03 Jul 2025 02:02:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52a35sm18381340f8f.57.2025.07.03.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:02:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/26] clk: amlogic: c3-peripherals: naming consistency
 alignment
In-Reply-To: <99ba0e33-cec2-4577-b949-010537a8c4df@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 16:31:12 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-5-e163c9a1fc21@baylibre.com>
	<eb233f20-1927-4944-9b57-f90c998db19a@amlogic.com>
	<1jy0t5d8a2.fsf@starbuckisacylon.baylibre.com>
	<99ba0e33-cec2-4577-b949-010537a8c4df@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 11:02:25 +0200
Message-ID: <1jtt3tbqam.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

>>>>
>>>> -#define C3_CLK_GATE(_name, _reg, _bit, _fw_name, _ops, _flags)       =
  \
>>>> -struct clk_regmap _name =3D {                                        =
    \
>>>> +#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)           =
  \
>>>> +struct clk_regmap c3_##_name =3D {                                   =
    \
>>>>           .data =3D &(struct clk_regmap_gate_data){                   =
      \
>>>>                   .offset =3D (_reg),                                 =
      \
>>>>                   .bit_idx =3D (_bit),                                =
      \
>>>>           },                                                          =
    \
>>>>           .hw.init =3D &(struct clk_init_data) {                      =
      \
>>>> -               .name =3D #_name,                                     =
    \
>>>> +               .name =3D "c3_" #_name,                               =
    \
>>>
>>> Prefixing variable names with 'SoC' is understandable (to avoid duplica=
te
>>> definitions and facilitate variable searching), but is it necessary to =
add
>>> 'SoC' prefixes to clock names?
>> This is part of the description but I'll ellaborate.
>>
>> Some controllers do so, some do not. This is a typical pointless
>> difference that make code sharing difficult and lead to the duplication
>> I'm addressing now.
>
>
> Yes, in fact most clock configurations are consistent across our SoCs. Ov=
er
> the years, we've been continuously working to make our driver code more
> 'common'
> and efficient.
>

No they are not consistent at all when it come to this

Controller prefixing the pclks:
* axg-ao
* axg
* g12-ao
* g12
* gxbb
* s4-periphs

Controllers not prefixing the pclks
* gxbb-ao
* a1-periphs
* c3-periphs
* meson8b

I do not want to invent new names to avoid the names clashes if the
prefixes are dropped. I tried that way and it was a mess.

As noted in the description, clock names will not be prefixed with SoC
name, *except* for the pclks for the historic reason explained above.

>
>>
>> Both with and without are fine but picking one a sticking to it helps a
>> lot. I would have preferred to drop the prefix from the pclk clock
>> names, same as the other clock, but:
>
>
> I still prefer adding SoC prefixes to variable names but not to clock nam=
es.
> clocks with the same name generally have similar functions across differe=
nt
> chips.

It is not a matter of preference.

>
>
>> * It would have changed more clock names and I prefer to minimize those
>> changes
>
>
> Your recent patch series has already made significant changes, and this is
> relatively a minor adjustment=F0=9F=98=89
>
>
>> * It would have caused several name clashes with other clocks.
>>
>> so prefix it is for the peripheral clock.
>>
>> In the end, what matters is consistency.
>>
>>>
>>>>                   .ops =3D _ops,                                      =
      \
>>>>                   .parent_data =3D &(const struct clk_parent_data) {  =
      \
>>>> -                       .fw_name =3D #_fw_name,                       =
    \
>>>> +                       .fw_name =3D (_fw_name),                      =
    \
>>>>                   },                                                  =
    \
>>>>                   .num_parents =3D 1,                                 =
      \
>>>>                   .flags =3D (_flags),                                =
      \
>>>>           },                                                          =
    \
>>>>    }
>>>
>>> [...]
>> --
>> Jerome

--=20
Jerome

