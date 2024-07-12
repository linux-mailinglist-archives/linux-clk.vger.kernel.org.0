Return-Path: <linux-clk+bounces-9532-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23192FA66
	for <lists+linux-clk@lfdr.de>; Fri, 12 Jul 2024 14:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39D85284968
	for <lists+linux-clk@lfdr.de>; Fri, 12 Jul 2024 12:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CF416F29F;
	Fri, 12 Jul 2024 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s389APwG"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8523E16F27C
	for <linux-clk@vger.kernel.org>; Fri, 12 Jul 2024 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720788045; cv=none; b=s1NOSlKbqs10qPsYSiVazSrreQympOflCcqtJtQROnMEE1bJ/WF5+zONqRuFb44Pguw3OrzpL1g4+rpIVZokbu7kAkg1FwFSL8CPY3FZz6uJynVwAzgyvq2hWjiN9LjtydKGevR7rm3kQFoUQdGP2dVaxtTGzFe7fAVqwtC7dr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720788045; c=relaxed/simple;
	bh=l8qHLLFgcYqyKIybT5078ez86LsrkQq8Ry8H8vN26qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t6KIKTxxM9uY3WWE63wEM+7WhBTyX9Vsm59sWfwllRB1dYHqja/NP9tzf35GON98t2X2wBNp1GvLd4ArlQFDTZ2VtK8dV7agOWfCrS7WkjpUvvdG2AaG3YyVgCkB83RwqW/ax+NN186L8P66e68EyFjL1lWXWZ0cU/0OYbtL5+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s389APwG; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-58b447c513aso2393619a12.2
        for <linux-clk@vger.kernel.org>; Fri, 12 Jul 2024 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720788042; x=1721392842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QcWJHDsGMn6/ezJKbfxteyuShG+TvDNb0ACdQpM400M=;
        b=s389APwGeCo+OWMqmeiHlN2KGTlcYJoQl7VjiUxgnYepHDmY3AdFFMIUMiD6us+NGo
         fx5dPEcE+CA+kpxuhn98vG4UG14sNT0BfP49id9A6bvP8RwGpZ2f/N1mvRTJvbf28m0t
         g+qKvgexD0z2+dy8yAn8xrVQpNCoVtMHpEJH7RVhSTOsJNdvHtmh7redCMrw6qYi7/i1
         3UA9Hm9u2OwExabQ0QdCse6U2OD9iiYShgibzFvrX58mbDLseFRtBP6uoxNcaFixRAvl
         2TN7qjc0z9F75tP8H+6oIBJU35F2LK00E5fykdzM7YHTzopN4c1G31Rhw8nxb9lKQSrM
         cHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720788042; x=1721392842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcWJHDsGMn6/ezJKbfxteyuShG+TvDNb0ACdQpM400M=;
        b=ZOLCPXf42WKH+Ix/giCe4aam3ZDWbUxUExCdgEQ/Ub9UbaGvuHhZRADIZbw8IP5dEv
         +A/WST7ivYNMuGpa7ZVSwC9yw1fCYNqQ+QkmIYQK1apzCq9m2iXFVetKvtfubMDWGcUK
         P4cGXeOYPCD+NCESVhnc6362uP5/8WmTTRTHzxDscb57/56nurCJYpEcmtIVM3vJhHpO
         prhub2czNqxpvW97PIFtwQA7nvUKxLYy32qud0/xziy7AXrEj3QdosYSo6bkTmSa5UlV
         pRrP5TbXKouWY5IX5c0RiFDwOuJsMm5rNL/F7MLmqhfpTbD3XaYqaPX1vtt7msljr2sS
         LFyg==
X-Forwarded-Encrypted: i=1; AJvYcCWyNObuy0yCSMbpfuHN6V+XZbeYHQuWWvQIGc1Hu1KY0F3ArNEl/TLn6KggOLDDBKXurWjhYndd1fvfpURQlZLV9yM1PVAjFNeI
X-Gm-Message-State: AOJu0YytPNt3IR3IOaCpfsZRZq5cv2wzWBjPcD2b5hbvqTAq7cstJ14/
	kTaoHMaNJj0kLOt6Fkzath29JAbhpI9mFeZfV2EzYJvL2/9/VENsFJezdfWN0cs=
X-Google-Smtp-Source: AGHT+IEIp4pVZaCJr7tN/EdmLPzSezIAlShyweot5UnSj4Ph5AnEAkBQ+qrK3+e7xHBN7WGIvBwnyQ==
X-Received: by 2002:a05:6402:2071:b0:58b:565d:ac92 with SMTP id 4fb4d7f45d1cf-594ba6953c2mr6678895a12.22.1720788041646;
        Fri, 12 Jul 2024 05:40:41 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc4e8173sm4562860a12.54.2024.07.12.05.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 05:40:41 -0700 (PDT)
Message-ID: <f9a23663-7a1d-44dc-8e0b-8463c3c88a29@linaro.org>
Date: Fri, 12 Jul 2024 14:40:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm4450: add camera, display and
 gpu clock controller
To: Ajit Pandey <quic_ajipan@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
 <20240611133752.2192401-9-quic_ajipan@quicinc.com>
 <76f5e3c7-a90b-42d2-8169-e5e2211a14a1@linaro.org>
 <ba7d12d3-c582-45ec-beed-e81182fe3252@quicinc.com>
 <95a835e2-9fd9-467b-bd0a-8eeb80ddf678@linaro.org>
 <9c3de930-47b7-45a9-bf7e-6e506ea2accc@quicinc.com>
 <8f7cdb31-c50d-4690-b878-518bad545612@linaro.org>
 <46e6f1f0-d244-4e53-99ce-9fee339dc4de@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <46e6f1f0-d244-4e53-99ce-9fee339dc4de@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 2:31 PM, Ajit Pandey wrote:
> 
> 
> On 7/12/2024 5:52 PM, Konrad Dybcio wrote:
>> On 12.07.2024 11:53 AM, Ajit Pandey wrote:
>>>
>>>
>>> On 7/11/2024 3:25 PM, Konrad Dybcio wrote:
>>>> On 3.07.2024 11:16 AM, Ajit Pandey wrote:
>>>>>
>>>>>
>>>>> On 6/13/2024 1:11 PM, Konrad Dybcio wrote:
>>>>>>
>>>>>>
>>>>>> On 6/11/24 15:37, Ajit Pandey wrote:
>>>>>>> Add device node for camera, display and graphics clock controller on
>>>>>>> Qualcomm SM4450 platform.
>>>>>>>
>>>>>>> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
>>>>>>> ---
>>>>>>
>>>>>> None of these nodes reference a power domain (which would usually be
>>>>>> CX/MX/MMCX). This way, the RPMhPDs will never be scaled.
>>>>>>
>>>>>> The current upstream implementation only allows one power domain to be
>>>>>> scaled, but that's better than none (see other DTs for recent SoCs).
>>>>>>
>>>>>> Konrad
>>>>>
>>>>> SM4450 doesn't support MMCX and CX/MX domains will remain active so
>>>>> power-domains property is actually not required for SM4450 clock nodes.
>>>>
>>>> It's not only about them being active.. some PLLs require e.g. MX to be
>>>> at a certain level, or the system will be unstable
>>>>
>>>> Konrad
>>>
>>> With active I mean CX/MX rails will be default running at minimum level required for clock controllers. Adding power-domains property for CX/MX rails is like a redundant code as that will also scale such rails at default specified minimum level only. Also we hadn't added such property for other targets DT nodes to scale up CX/MX at minimum level.
>>
>> What I mean here is that, the minimum level may not be enough. In such case
>> you would also add a required-opps = <&handle_to_rpmhpd_opp_level>
>>
>> Konrad
>>
> 
> Apologies, but could you please elaborate the use-case where minimum level isn't enough ? I guess for clock controllers configuration min level of CX/MX would be suffice, client will anyhow scale such rails to higher levels depending on their use-case.

The main issue here is with PLLs within the clock controllers. Nobody
votes for them. It's an unsolved problem and we currently work around
cases where it's necessary by requiring that (with runtime pm, so when
there's active consumers of the clock controller) the attached power
domain is at >= SOME_LEVEL

Konrad

