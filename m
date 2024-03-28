Return-Path: <linux-clk+bounces-4368-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D668716EF
	for <lists+linux-clk@lfdr.de>; Tue,  5 Mar 2024 08:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6C251F21DCF
	for <lists+linux-clk@lfdr.de>; Tue,  5 Mar 2024 07:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676C48173C;
	Tue,  5 Mar 2024 07:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FFjN4vf4"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4158480C0C
	for <linux-clk@vger.kernel.org>; Tue,  5 Mar 2024 07:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709623780; cv=none; b=UKarBzKEcM+6M7KOO7e6tSbBFdSiRI/2cconGYAT+juZFyk6aBTChmKPuDP7JuFg0bIBAx7sKswSJy/VZ3QZJNxLg2SKE2doH1L5z39BWPwO7jW/kLqTIMH3JuNfgJkw+txLM+rPdOvDM47imOd317CPQYoPE8QyLaG+HaShfb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709623780; c=relaxed/simple;
	bh=yNDh4vlQJrOCs90yy+i3TAWHJSSEQIQTqIjnjyp4ZKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxXXxD3LbqRSpar+MJLNXnTCxnXT2vYhI4rG4y7pTd9Qa3K6yC9x4/KFuLD2upoQn1C/nTOy1xxnsxqVK/BYxaeybkmQberIQ0x8LzsC5W+LpKcao/a8bGmptVDy4Zm7QGPfESi1cVCX2SwY7mnwKRyHLn4w5adSpjey+1oOX38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FFjN4vf4; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so8840284a12.0
        for <linux-clk@vger.kernel.org>; Mon, 04 Mar 2024 23:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709623776; x=1710228576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+dHl/4KVm6SPBFckq1kLzufBDh+PEgz0H/48hnpP3Y=;
        b=FFjN4vf4RLZda/YmQae+5n+KtLkrmk1FkUmLAjkNqJG5jET5dOJdEIyAbb49fb5BZc
         ilHdJzTCDlDXNAOvSrkwUuWMOsMiKDKyqDL/zP6k6/WTM0Sv6mQ1sfcmyvQJLbaJN5ZJ
         Ueq1zrprsiwUUfT+f3qo97zEJvlflYlML+qXMjOHAiQcRhEMtHbJKh0UK8JZw70WIINw
         0lV6Q1XnUR/5ckzxYyXxisiXQbeAqXc//FLz+GY3qVY0LsjJqJ3Li7uWam6zkGleeuh1
         dB9YropYZaSFKbAfRs0MvlRx3uv+0r4HoNny8IPovLqy+mQXh27V6T1rrRjRXZrmdSen
         BuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709623776; x=1710228576;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+dHl/4KVm6SPBFckq1kLzufBDh+PEgz0H/48hnpP3Y=;
        b=c8LMy6Agoo0fZQj1sYo9z9WopPt+yLytAz1j6uIY15mj1s3vfabjUXuB+WNHL8zwQp
         Yphy0As9BeLQfg5QtDno+Hv8w9AY7H7HSQ473eaha72geszjypC8w1+aH4X8Xms46P6x
         VMSol5fHrpTNxXm9ZGvFc3OdJQcWeSCPo8OqjhjXv8h7K6rwQTid0fkSFadE/+sQz5BU
         8+9a0d2Hx0LNEq11tE9bFxxhzVkvVBZak1unTRV2rUry+MoXfxpF9A7RqFENu/rkl4CX
         o290Lh037gySX6M0VfheeZ88YVlKLpIHcomsCuR1X7csALJ4Gm/9Al3fJpSwd3KJMNuJ
         GElg==
X-Forwarded-Encrypted: i=1; AJvYcCVNUT7mL2h4oCwCUJuJCbX9OsD2Yq/nJj39evC/t0PVgkhZkDWgsZHunmC+thfu/nFVx5OQwCe6huy4/A1vnM52EdHDsp8AS8wp
X-Gm-Message-State: AOJu0Yx2ChcmINGizJPhU3QVur1bSI1I6ztlgCUP351Tfbkem1zQHZan
	0+Crn0NX1AIjgrqvt4KiiRDRm5uLIIycYZpbE4VKk2SL0mcJtwJZCFgUnK9pRSLhac8S2u6I+P8
	7
X-Google-Smtp-Source: AGHT+IEKrjUtKThBu8Bx1DWPnu7yNlRT6ABbjdaeX+K6Bf5eCDc5o7Vwqanz8U8BZgq5RpD4syie0w==
X-Received: by 2002:aa7:d955:0:b0:566:59f5:26db with SMTP id l21-20020aa7d955000000b0056659f526dbmr2145259eds.11.1709623776570;
        Mon, 04 Mar 2024 23:29:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id g26-20020a056402321a00b0055fba4996d9sm5517875eda.71.2024.03.04.23.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 23:29:36 -0800 (PST)
Message-ID: <4731e688-4d2e-4b94-9ed1-32cbc823079f@linaro.org>
Date: Tue, 5 Mar 2024 08:29:33 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <DU0PR04MB9417551618EB1C723EF3FA9088222@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2024 08:18, Peng Fan wrote:
>> Subject: Re: [PATCH v3 1/2] dt-bindindgs: clock: support NXP i.MX95 BLK CTL
>> module
>>
>> On 05/03/2024 05:13, Peng Fan wrote:
>>>>> +
>>>>> +examples:
>>>>> +  # Clock Control Module node:
>>>>> +  - |
>>>>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
>>>>> +
>>>>> +    syscon@4c410000 {
>>>>
>>>> clock-controller@...
>>>
>>> But this is a syscon, using clock-controller will trigger dt check
>>> warning.
>>
>> Which warning?
> 
> I just recalled that node with syscon in compatible string needs
> has syscon as node, I maybe wrong.

Just paste the warning, so we can think about it.

> 
>>
>>>>
>>>> As that is the main feature/function.
>>>>
>>>>> +      compatible = "nxp,imx95-vpumix-csr", "syscon";
>>>>> +      reg = <0x4c410000 0x10000>;
>>>>> +      #clock-cells = <1>;
>>>>
>>>> Please make the example as full as possible. For example, add
>>>> mux-controller node. Do some of the blocks not have mux ctrl?
>>>
>>> Yes. The blk ctrl is not just for clock, some registers has mux ctrl,
>>> such as Pixel_link_sel.
>>
>> Then mux-controller should not be allowed for them.
> 
> You mean I should not add mux-controller under the blk ctrl node?

mux-controller is already there, isn't it? I am saying your binding is
not precise. Your binding implies that ALL OF THEM have mux controller.
You told me it is not true, so you have change the meaning of binding
and disallow the mux-controller for the cases it is not applicable.

Best regards,
Krzysztof


