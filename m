Return-Path: <linux-clk+bounces-14534-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28D09C3D01
	for <lists+linux-clk@lfdr.de>; Mon, 11 Nov 2024 12:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08D27B230A8
	for <lists+linux-clk@lfdr.de>; Mon, 11 Nov 2024 11:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C3E194C89;
	Mon, 11 Nov 2024 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EO/Dtp0I"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACC318A6C5
	for <linux-clk@vger.kernel.org>; Mon, 11 Nov 2024 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323997; cv=none; b=PhZokrdJlx0h6imWCd367sRdnk6CrkLBveLguyZRj+w6f/ojuSrk7bA5a2Cdbg/CMSrurR8hxFzsD+kwXsUMJcij5FLEY87qykv4YlnahM6bACg+DxL+ZGnocqtJCEfhw0V0Qx+pHIi6GP0gVy1oyZhj7os2Zxy3nUSomvY4HzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323997; c=relaxed/simple;
	bh=doVS2FjDRkq4c2IHXmTNPcOL4I0Od2rKyJgRrUG5QOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3EwTokRsZ62tvwe/9crSvEccqJcVhjIzLPykmRn5f1QnrIt6YB9seUPQrt4HMF2JFDF9I9YevVX/d3eefbWj7uBLP3cu7uQoTMjjh6G3avOTnII3U0eLBxGftPLkAM/CH7RobjR37HlJ7Nwo8O8bRVjUuNCMZwDW7/L79jLAqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EO/Dtp0I; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4319399a411so41664275e9.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Nov 2024 03:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731323994; x=1731928794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rw4WfXknbvTv9k5vxcl4gUNbP7Ohsij/aCpukU/A3Vk=;
        b=EO/Dtp0IV154LpqV4SO5kkDTm/hZXoBCP82EUWwjf4E2wPCFP4m0NBGGeQEatIiwph
         gKt6hscJpqiKDJKSD4kj/0k4CDmpkEhBGfZhdtcbHQ+S/0g6MHPRrBVlx9WlFndpulDD
         eOa/TXZN8+KY8MYt8jGHfdbted8Bqm+yt3DHxLOy9zA+13eDzCgm8hhNYB/XukWf1p2t
         1Mztkgwi42tBpEmDcIQxvcPt6uz94ULFaNFB6c1Vi08Mn8uOd3rT1wl0lAkoFtDLe1CJ
         011irTrJSuX+DYxx+B798HbhW86uw36Vtw8NP6lOJO3l5pPuGfzIcgijnkb1Ibd2cYSi
         eAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323994; x=1731928794;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw4WfXknbvTv9k5vxcl4gUNbP7Ohsij/aCpukU/A3Vk=;
        b=BU9cSLFU7p53kGroSQ6X5DodzDZekdOv+2wDuh8BPIe45ATwO1dGPs/U4GuMSKSOkr
         spEl2QueTDNySc/O/9kisMHOaRGP3ld4xeUXpL0MWkFvemeh/5A4OW1d8b49TwYhKzj9
         lZKvOp9v+SLhAdz2FTHQwa2BWUxLn+Aj9jWkafmXxh9gB0F08ABDEjuwYuoY+d37+rZj
         FxYdTFCjN4MOXX574TdL1Lgun9aYwl7SEVk8MnoPyxRXm2Y2ba8a5TZuMlFOCZWFJUHt
         ElSvGzHi30KLJaL/izhjqpRg4W3DHWVDma5ZWLByjFzhMjvKiaByLjvXQ39fPb2Uur5x
         tDKw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Fzk93hXu+ykrM55Dt4WOlo6wppI67BKaKsLdRrtmz2+Lr+6dmy1szuymZFmikvdw1bBgqzb9VDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvlXY+l04o933Yu0BK/aiN/CJlgoH5tIRJPkiPsCcbscQBGjbZ
	MiDYerDLuFA0zxBzI3dRd8RUWUc9BvPb5fydGUuRPVcDIqBvvTheNeAo9tvkTAo=
X-Google-Smtp-Source: AGHT+IEPlE7s7WR+Igk2ywhz8l2p851jHgVb2oB6ZyOPVQBtqGnlCuUDU91Ga3Z/F8+t6vhFYowZqw==
X-Received: by 2002:a05:6000:2588:b0:381:c8fe:20b1 with SMTP id ffacd0b85a97d-381f18855b8mr10158643f8f.42.1731323993363;
        Mon, 11 Nov 2024 03:19:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99a0efsm12691906f8f.58.2024.11.11.03.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 03:19:52 -0800 (PST)
Message-ID: <c15bb621-6cd9-4be3-beec-20fecd411547@tuxon.dev>
Date: Mon, 11 Nov 2024 13:19:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-25-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB113329FE5E9E610BEF45DC001865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB113329FE5E9E610BEF45DC001865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 10.11.2024 10:54, Biju Das wrote:
> Hi Claudiu,
> 
> Thanks for the patch.
> 
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 08 November 2024 10:50
>> Subject: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Enable SSI3.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - none
>>
>>  arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 26 ++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-
>> smarc.dtsi
>> index 4aa99814b808..6dd439e68bd4 100644
>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
>> @@ -64,6 +64,11 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
>>  	};
>>  };
>>
> 
> &audio_clk1 {
>        assigned-clocks = <&versa3 xx>;
>        clock-frequency = <11289600>;
> };

audio_clk1 node is in the RZ/G3S dtsi to keep the compilation happy.

For this board the audio clock1 for the SSI 3 is from <&versa3 2>.

If we fill in the audio_clk1 here it will be useless, there will be no
consumers for it and it is not available on board.

Thank you,
Claudiu Beznea

> 
> Maybe add audio_clk1, so that it described properly in clock tree??
> 
> Cheers,
> Biju
> 
>> +&audio_clk2 {
>> +	clock-frequency = <12288000>;
>> +	status = "okay";
>> +};
>> +
>>  &i2c0 {
>>  	status = "okay";
>>
>> @@ -94,6 +99,11 @@ da7212: codec@1a {
>>  };
>>
>>  &pinctrl {
>> +	audio_clock_pins: audio-clock {
>> +		pins = "AUDIO_CLK1", "AUDIO_CLK2";
>> +		input-enable;
>> +	};
>> +
>>  	key-1-gpio-hog {
>>  		gpio-hog;
>>  		gpios = <RZG2L_GPIO(18, 0) GPIO_ACTIVE_LOW>; @@ -151,6 +161,13 @@ cd {
>>  			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
>>  		};
>>  	};
>> +
>> +	ssi3_pins: ssi3 {
>> +		pinmux = <RZG2L_PORT_PINMUX(18, 2, 8)>, /* BCK */
>> +			 <RZG2L_PORT_PINMUX(18, 3, 8)>, /* RCK */
>> +			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
>> +			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
>> +	};
>>  };
>>
>>  &scif0 {
>> @@ -171,3 +188,12 @@ &sdhi1 {
>>  	max-frequency = <125000000>;
>>  	status = "okay";
>>  };
>> +
>> +&ssi3 {
>> +	clocks = <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
>> +		 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
>> +		 <&versa3 2>, <&audio_clk2>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
>> +	status = "okay";
>> +};
>> --
>> 2.39.2
> 

