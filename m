Return-Path: <linux-clk+bounces-4369-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677E8716DF
	for <lists+linux-clk@lfdr.de>; Tue,  5 Mar 2024 08:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 735911F234DC
	for <lists+linux-clk@lfdr.de>; Tue,  5 Mar 2024 07:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5BB7E777;
	Tue,  5 Mar 2024 07:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KOVC2Ee/"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B27E11E
	for <linux-clk@vger.kernel.org>; Tue,  5 Mar 2024 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709623835; cv=none; b=mEeieJf48CtKwVPvxarxB9ExTxPkbs1doN5wcfKy14sdF13c7Jry0f7Ha5IIoP2j6xzJpBmQh4Wjuyik1UlBi8D8MjpClPQ+aAEQQ9mnTNcWK8mzUmeM1mMk1JWcpbtvecjWPruqnbMwNBwwqRnyYif7DMuYfxW7MYs72wVtnv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709623835; c=relaxed/simple;
	bh=6DVkHf9aV/yId4Lmu6rejZkjFcnUgp8btzQ/SNMEhu8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cpA9zvW1EjgE1lKR184HqSMAhFdiCaLaDB9QhF0jsnXSaTnpuY2y3Hiid8AWwxgjnRIGz2Ii1nAXDoXTWdokBvpgHhzFIfi6F6+pzyx/IgxK+CZ0SlffARUh/UG8hN+za1VaH0VjMHbO+7Bqd6Mo+qgDg+htiq/kHVt3JdEAuCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KOVC2Ee/; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-565a3910f86so7896304a12.3
        for <linux-clk@vger.kernel.org>; Mon, 04 Mar 2024 23:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709623833; x=1710228633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4wPuXdt26uV3nWuiUz2nQdPuj/Zl3n+dEVTtr/ygvVI=;
        b=KOVC2Ee/T2Vg7kvn2SXDv6HODnReP6p6Dbyg5TqZ/8be5jXR3FwPsY1VEgVTJk9nia
         CjmA3TYvPInEefaQH2fYE9zztcRU8Jufe6/RdExP7qKRiL/pdHWCyvf8ftOQ3s+Iuj4n
         CZi6V392A4CZh+KhoRtjitEplN4DgkCFrd0DziQ4k3dx53npppIhMCT6rYXQtNJvRumW
         dkgloAQvDmVsfW+zqDevGP5M6Qk0W1cWeya89y8x6g9vXEntbhmIV4PkuQOjbKp/PI2K
         I11qiY69DMBZpl5HZj0ExbVtvdRIGtCkKB7/Fk9Lf43MXBS+mvJEdMZQYtgzLQfnmt6b
         iHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709623833; x=1710228633;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wPuXdt26uV3nWuiUz2nQdPuj/Zl3n+dEVTtr/ygvVI=;
        b=ocKyl3H4sCZizanh0CCBvclJj++83TuUGwiUjPhGjazRJVkF5kXcydydK0KZzTpA9Q
         AUAApVkpJzfG2NqxuuYnTeZ9Y85udzZn2jZ1tovCtkW6SLtabiJ2AHuvOndlMAxyrBGT
         BtzXf/4Sbphpo+GaR0/hTnzP1QeURe6FR8wz4g5ahDQjWWYg9VprI8AVqAl9M0FsvB5P
         CvX/K9f6e+y/YZimBDvjFNoTPZs0+Ss/mxKQ9qlewFBDt0b8tC0NpjGMiry+dn1YNz34
         M5bTuOp7u50vuh4FkJcp+5n4fLuZY3eW9ZsjYm+RMm+EQoYZqrVd3zocKpfk4izWs5o8
         kyRg==
X-Forwarded-Encrypted: i=1; AJvYcCUR3SO6zLHhGNVrF+3IkJVeyfgSVgFxGd2tbqnTA8B6XTjX4ZfJX1rmQyHxXwHeK+JR7M6MCXlhrUxqlcL16CpiZLL2TtAFgb0k
X-Gm-Message-State: AOJu0Yx2jNyahlJET0cPv1ScyRMqAmM8WVLnVd3vUwNp0UukXevlsY3l
	AxcWt2EY+tVXreP4snFma5KxeP/LGg50KRM8qFyR5roMF16C0qksYiVusFD1P/8=
X-Google-Smtp-Source: AGHT+IHiVogKZl3USP3i/JeeOeTjoVjdXnPeQNrUn2JsCxmrpiq71MOn1lYyswLgrH8QF/253iaF3g==
X-Received: by 2002:aa7:cf06:0:b0:565:a562:9fc3 with SMTP id a6-20020aa7cf06000000b00565a5629fc3mr7041999edy.38.1709623832591;
        Mon, 04 Mar 2024 23:30:32 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id g26-20020a056402321a00b0055fba4996d9sm5517875eda.71.2024.03.04.23.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 23:30:32 -0800 (PST)
Message-ID: <714cc51c-0d54-4475-b4bf-96b59d499097@linaro.org>
Date: Tue, 5 Mar 2024 08:30:30 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindindgs: clock: support NXP i.MX95 BLK CTL
 module
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240228-imx95-blk-ctl-v3-0-40ceba01a211@nxp.com>
 <20240228-imx95-blk-ctl-v3-1-40ceba01a211@nxp.com>
 <20240304143916.GA181628-robh@kernel.org>
 <DU0PR04MB941740A36E953A0E1AD690EC88222@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <58cdfa7c-5483-4193-a5de-bb5fa72de637@linaro.org>
 <DU0PR04MB9417551618EB1C723EF3FA9088222@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <4731e688-4d2e-4b94-9ed1-32cbc823079f@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4731e688-4d2e-4b94-9ed1-32cbc823079f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2024 08:29, Krzysztof Kozlowski wrote:
> On 05/03/2024 08:18, Peng Fan wrote:
>>> Subject: Re: [PATCH v3 1/2] dt-bindindgs: clock: support NXP i.MX95 BLK CTL
>>> module
>>>
>>> On 05/03/2024 05:13, Peng Fan wrote:
>>>>>> +
>>>>>> +examples:
>>>>>> +  # Clock Control Module node:
>>>>>> +  - |
>>>>>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
>>>>>> +
>>>>>> +    syscon@4c410000 {
>>>>>
>>>>> clock-controller@...
>>>>
>>>> But this is a syscon, using clock-controller will trigger dt check
>>>> warning.
>>>
>>> Which warning?
>>
>> I just recalled that node with syscon in compatible string needs
>> has syscon as node, I maybe wrong.
> 
> Just paste the warning, so we can think about it.
> 
>>
>>>
>>>>>
>>>>> As that is the main feature/function.
>>>>>
>>>>>> +      compatible = "nxp,imx95-vpumix-csr", "syscon";
>>>>>> +      reg = <0x4c410000 0x10000>;
>>>>>> +      #clock-cells = <1>;
>>>>>
>>>>> Please make the example as full as possible. For example, add
>>>>> mux-controller node. Do some of the blocks not have mux ctrl?
>>>>
>>>> Yes. The blk ctrl is not just for clock, some registers has mux ctrl,
>>>> such as Pixel_link_sel.
>>>
>>> Then mux-controller should not be allowed for them.
>>
>> You mean I should not add mux-controller under the blk ctrl node?
> 
> mux-controller is already there, isn't it? I am saying your binding is
> not precise. Your binding implies that ALL OF THEM have mux controller.
> You told me it is not true, so you have change the meaning of binding
> and disallow the mux-controller for the cases it is not applicable.
> 

... or create separate binding/schema for the variants with mux-controller.

Best regards,
Krzysztof


