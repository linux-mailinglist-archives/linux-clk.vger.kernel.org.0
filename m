Return-Path: <linux-clk+bounces-14085-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C09B7EB3
	for <lists+linux-clk@lfdr.de>; Thu, 31 Oct 2024 16:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 861AD1F21D13
	for <lists+linux-clk@lfdr.de>; Thu, 31 Oct 2024 15:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1068819FA64;
	Thu, 31 Oct 2024 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vCYasxwU"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055DC19EED7
	for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389335; cv=none; b=gQam5dekX96z6koUk2y59v28nGHeBD+ri6dmROHU+dBfU8j7yxYPBRI+uEAa2+loAAlQgTQl+vmlEX1ta2fSZ3hZ1Uplx/8/LJEK4RlSAYsvwF3Q+w0HvmAzMowPQi3JHDqExiJ81mIFKNZRaVRVQrgvOfvpkDNY9vjMUfiZayA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389335; c=relaxed/simple;
	bh=JkgK1XkJW2hRAO/3wvVIqQgsdkjCn1te84JbhY3/XQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpO0siicBBSaxCzcZvsivgUT08J+1Oxo92HbhCAgChTKshbyDehuue2OG/FnrZgZPz7RoChAiUcKrJ+uPAw/tjxpol1yYzq08r1Sy7yhMZOP8gdphxydFmk72hivcD5UtbJlpjpDp5253rg0BJiXFt2DRoeyiZngWjV+8Zjc5Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vCYasxwU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so803578f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 08:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730389331; x=1730994131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPdLvxvLtEzCHGDZQcWi4oCr/ZFs9WLInCDjjUo5WR0=;
        b=vCYasxwUgnluJH79euxcpRTm8lfKcZwFWnqQOc0hpnTyhc7J2jzY6ob+vocoz2SOuG
         8u2rfm/6qaE2IsvLTy7E8dF90yZVwBiyr3EMmtdZJjC/n566Sma51PVGR3kLt2f0AHcA
         Wt/EeRgAyGQ8U9F45dUrzJROhIHUXCPMi2WLfTL8e5skNfsHPr8GXtq61heKkESFCrlT
         4ZoYLqqf86eC3jjh8aI8B5l5qGe+j1uUgr9JmlIHEn4SPcNgDm6vnQcTH329jvE+IjVy
         65z203gjphe8/p7ZWXycxxJIEfOQPxFHEuzxnDmy1rs4bPPrrw3c87Gt2bOY+naigyK/
         O0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730389331; x=1730994131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPdLvxvLtEzCHGDZQcWi4oCr/ZFs9WLInCDjjUo5WR0=;
        b=LZGEkBvM2ADAksf8eq5DJcY4wVa56MKqduz1niwekX5px6U00Qd1Ak0fWDYi7wORyQ
         iWH38zn9hDo36gYj7lRG4L6esUOTHpbl5h20j5asAR2LbIapD7jgkG3dS4dVKMgjRClE
         5KZAHg4q+5mVZJyrdztTQzGq8ebV3jBOCDbxVsDNWAb+FRGH5/gAYIzD0j84XXmjhBxM
         bXmoam3E7YVH3HXIziWiLPpbNVtPNkzdCjiR3wQ7vuiOx381qvb7lls75SMLNqCNF2TA
         WsVPMmw/P2QSClZu+vnMm6rpmpHOVDQau2JlCYq6HtL92hvV3DgUFMOl430LVrEOgwbF
         exag==
X-Forwarded-Encrypted: i=1; AJvYcCVkrUmwv9jdCDQZ9FO7IwwcnkKBXss9jqYPlhUUUDdbxZ3/YDmtuGDjSheyeHn7LFWsrFzIwrlbWJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwokMvsO3PxBRoGCZqYkRctlJXZHi56bkwp6Z163ajRtc0m5WUx
	e2hRn5n2xWTAiYE19RCiYr/53WNq8NsMCJweCCcy+4atfTn2ITPHOkCO9jcPv1qLAKutQf/q8yX
	g5lA=
X-Google-Smtp-Source: AGHT+IEcjtd5WA/gsEHXNVUi1WTv2rYb/VysvkPiR/8zIUj5oeWb8lvj6Ww3iOFNkRJJFWFHNdTcqg==
X-Received: by 2002:a5d:64a8:0:b0:37d:46e3:4e88 with SMTP id ffacd0b85a97d-381be7654c6mr3679580f8f.9.1730389331386;
        Thu, 31 Oct 2024 08:42:11 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e856sm2478023f8f.87.2024.10.31.08.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 08:42:10 -0700 (PDT)
Message-ID: <b054116e-c6a4-48c3-8162-571d653788a4@linaro.org>
Date: Thu, 31 Oct 2024 15:42:09 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
 <jcqgsgp4ivbokn545sy2rvfllm3vnygfpbufxagotuicacfmgd@v2hlnohlwzdf>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <jcqgsgp4ivbokn545sy2rvfllm3vnygfpbufxagotuicacfmgd@v2hlnohlwzdf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 15:29, Krzysztof Kozlowski wrote:
> How do you imagine writing drivers and request items by order (not by
> name) if the order is different in each flavor?

I don't think I'd be much in favour of relying on declaration order in 
the dts, favouring names to find resources instead, tbh.

The 8250 has regs that sort by address and name in the same order. For 
8280xp we preferred sort by address and you're right the interrupt 
sorting isn't consistent.

However the latest applied dts for CAMSS is sort by address/irq not sort 
by reg-name irq-name.

Unless its a NAK from yourself and Rob, that would certainly be my 
preference for any _new_ additions subsequent.

---
bod

