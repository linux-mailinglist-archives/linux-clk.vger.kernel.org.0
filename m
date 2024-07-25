Return-Path: <linux-clk+bounces-9968-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6038693BD21
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jul 2024 09:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF4E7B21DA6
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jul 2024 07:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A99317277F;
	Thu, 25 Jul 2024 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPtgLQZR"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D7171E70;
	Thu, 25 Jul 2024 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721892721; cv=none; b=XQbzGPYHa/a5g82j2eS6GXsk41m0wHiHonldJYM6KK2W8QFf7HtcvGxvlpyw6q4xoMwuERwANz3UBIp1xfPkpxt5F1qIfu0LzzjvnG9fKeUAdh4DvD+8bjrGgRBoCJyN8Pqs3F3fIne6tPWlleby00wqgA+MvzREHK/i5H+ql/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721892721; c=relaxed/simple;
	bh=GXQn+ZUgrSyMhB9EXmBCgrV8m1XI9dGY09dsbyovfIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C8k5gbN7FUhauOWv22Br0yNUaEJkDGvYklS8LlRumJpqjrAmkhiLOtMAwwFJarso0DKR0GjLRyAtKNiV/lBuE9ShXvKQlpXMmOcPZgoTdiIRQPTrXFRofMPZNXQ429TFHEt+SmbmRsjn4+fRrdShy7YPkLepCdFswM8DRASR0/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPtgLQZR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EAEC116B1;
	Thu, 25 Jul 2024 07:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721892720;
	bh=GXQn+ZUgrSyMhB9EXmBCgrV8m1XI9dGY09dsbyovfIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aPtgLQZRqwkKkWp9m/9matsFdVkkywKZUsgh+393PhT4uu2IlhjYlC2J4B8e4jpz5
	 YX8zAMLsFkZYeJDYaTfdgdjKHPsNG4U+LxWKufCNIyctkm2vIOb6I3zbg9VwFwqKqs
	 k/1fiKZfvaF1x5cMdxmbQFdnsFU4OAWI5SD2UWzTr2l2MGqzrnGCkVPXc11eoJCSOB
	 oH9NePdogJa5Q7cpmgpnO+roeXjYQESzu7qiGzpuLTJOal+uAaeQTJuKCMVEZjNwq5
	 E6xdU8BSfPaPnXsd9FPpMpBspN6a0lg66E1nxBvCIWohM9FeuFhiAiKdmsOpVTFj3m
	 zXtjn2JYSl7lg==
Message-ID: <e31a69d9-0cdb-4e5f-9227-c7790538f55d@kernel.org>
Date: Thu, 25 Jul 2024 09:31:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
To: "sunyeal.hong" <sunyeal.hong@samsung.com>, 'Rob Herring' <robh@kernel.org>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Chanwoo Choi' <cw00.choi@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>,
 'Michael Turquette' <mturquette@baylibre.com>,
 'Stephen Boyd' <sboyd@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
 <CGME20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d@epcas2p4.samsung.com>
 <20240722223333.1137947-2-sunyeal.hong@samsung.com>
 <20240723205714.GA1093352-robh@kernel.org>
 <035501dade31$55cc7f40$01657dc0$@samsung.com>
 <03b201dade3f$3d66e3b0$b834ab10$@samsung.com>
 <bf6cd1c9-d60a-4ef1-89f3-5d28e003ce2d@kernel.org>
 <03ef01dade5c$ce407820$6ac16860$@samsung.com>
 <8ee739e7-8405-49d7-93f8-f837effe169b@kernel.org>
 <9647f1b5-9f34-42f0-b7b9-56ad9708855b@kernel.org>
 <041b01dade62$5861b2d0$09251870$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <041b01dade62$5861b2d0$09251870$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/07/2024 09:14, sunyeal.hong wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Thursday, July 25, 2024 3:41 PM
>> To: sunyeal.hong <sunyeal.hong@samsung.com>; 'Rob Herring'
>> <robh@kernel.org>
>> Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>; 'Chanwoo Choi'
>> <cw00.choi@samsung.com>; 'Alim Akhtar' <alim.akhtar@samsung.com>; 'Michael
>> Turquette' <mturquette@baylibre.com>; 'Stephen Boyd' <sboyd@kernel.org>;
>> 'Conor Dooley' <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org;
>> linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC
>> CMU bindings
>>
>> On 25/07/2024 08:37, Krzysztof Kozlowski wrote:
>>>>   then:
>>>>     properties:
>>>>       clocks:
>>>>         items:
>>>>           - description: External reference clock (38.4 MHz)
>>>>           - description: CMU_MISC NOC clock (from CMU_MISC)
>>>>
>>>>       clock-names:
>>>>         items:
>>>>           - const: oscclk
>>>>           - const: noc
>>>>
>>>> If there is anything I misunderstand, please guide me.
>>>>
>>>
>>> You did not address my questions at all instead just copied again the
>>> same. It is not how it works.
>>>
>>> I am not going to discuss like this.
>>
>> And in case it is still unclear - just look at your bindings and DTS.
>> They say you have three clocks!
>>
>> Best regards,
>> Krzysztof
>>
> 
> Let me answer your questions first.
> In the existing V4 patch, clock items were declared in if then for each block, so there was no problem.

No. Again, look at your binding and DTS.

1. What clocks did you define for cmu-top?
2. What clocks did you define for cmu-peric0?

Rob's advice is reasonable and you must follow it, unless you are not
telling us something. There is no other choice, no other compatibles, no
other devices.

> If modified according to Rob's comment, problems may occur as the input clock is configured differently for each block.

But it is not! Look at your binding.


Best regards,
Krzysztof


