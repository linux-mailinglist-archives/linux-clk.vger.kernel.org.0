Return-Path: <linux-clk+bounces-14929-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B24F99D4A0F
	for <lists+linux-clk@lfdr.de>; Thu, 21 Nov 2024 10:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77B5D2823A1
	for <lists+linux-clk@lfdr.de>; Thu, 21 Nov 2024 09:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFBA1CC158;
	Thu, 21 Nov 2024 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QROOU/8w"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0601CB32F
	for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732181767; cv=none; b=aO2w3tlGaN+/RAafoYXro6j7b60Qu7zVK2x+HWplGZSuzt+tAgstePm9GUYBkMnNJa7C5nQ1zCvIp3L7BijMYLNKnyg1z3zgbKUdM/9cwkq0W1pubhAmH6DGDp2w7eGdEQ9pvNWml11neLC/cQDKdhhGoS7XumW7IiOlNawoHuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732181767; c=relaxed/simple;
	bh=ZT4w+cU3Dvqf35BjhmM5mFr+e38ZJq2cEAW3TsAU6l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdAjY+P/gdt1y/SV192jqsV++3KS3/Ar4qhH7t4EESaYY+D3qb6zf1MyrLLLgRDA6fDksbfaKdqsJLk6BkSTfDfLx3b1Ioq8sC1Jz2Iju83ZSqyBZJ78plOTsqftKnGM6bqIF0M3AuTVxNOubw2uvOLMswWnPjJjA1Dd0a145ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QROOU/8w; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-382433611d0so541426f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 01:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732181764; x=1732786564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Prq+YhLlX1ECW116mG4I8YcjFkeTG4KJTUWMk26Kduo=;
        b=QROOU/8wN7SyCgq7Bg8HdQQLx0TzoYRhXYRZE12nXqu26bbWNNpPbhq/ktgXq/L3yw
         GH8o7K0mZkOvRLXJ/I7z69ttP2JfEEtWKGwg9L0Jymx7TNyVPOFqstduxu+1KocqW67S
         ouurOcGAtRO87yUNC6NenP+vnDPiYw4MTVgxF1eB8z2PdovtdoKxwGTm2IMpaePAlZHz
         zsOBIzDrFtHwA2gXtKKTwdUIJKmwz7z3y6exOuUvb6pABj/PlAHAJ/6lMsopUg+cCYk1
         H8shAZkshw/Dy4sRB/wnQMTLvezTN5fILbBUm0BZAFhKlIJWpsZXSPHoX6JQsPJmatYx
         Q07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732181764; x=1732786564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Prq+YhLlX1ECW116mG4I8YcjFkeTG4KJTUWMk26Kduo=;
        b=AcC9PW6prnFv5PnzpgKyvEWHoiyRe9QcsErVwpPkf62ROeE9Dsrndkh5ZRqW9j1BiX
         ec1uuqKuiwGDlIwVQPM9OW8NRZ9KKCaH+cNCMbEqf4q4NcTX/HhhP/djJi9BXtJBXgoc
         ULu2eWZVPuUv5x5zKGH4HQBJjY6KJFTswG54sYvU5oOzMV9aoy6lokxQPDeIevf0dEPS
         6K6XegnL0N7YCGhstfvJvIzPVvGYX9+Ok/vyhWyqq327tGwEgid3n6MCpXeHeszwmUgU
         ssUP40tMRVFDV3/MhFJje2Q1yxyg3vnv4IyMBPEBEZGrtiz87BBak3md0Pc/gcDjy8Ob
         Yb5A==
X-Forwarded-Encrypted: i=1; AJvYcCURPFgQbsNoixj4UVE4MwQCJsjGG0ln/wpL7b6r2Sawebbbcqu9TiO1dMnaYqjs0YqVmcBBBYeQC3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRiFxNyuPGSHBdqGXNtZhhyOzV2Vm9KdhEL90hidIXpJR4T6cI
	chHUHI0OOtrKelITMQ4BW1Zil8zQrkxi2/hO37yGUzAVP4QsiM/hJoVQPbNfLA0=
X-Google-Smtp-Source: AGHT+IH8By16gKHzbslHUV422fnt6D7QEkphYg4/fq6p6TddFAzWit/hIJ9+bUbGLQja+B7BJ+maEA==
X-Received: by 2002:a5d:588f:0:b0:382:3d04:9646 with SMTP id ffacd0b85a97d-38254ade367mr6612976f8f.11.1732181764122;
        Thu, 21 Nov 2024 01:36:04 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493ea74sm4526510f8f.89.2024.11.21.01.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 01:36:03 -0800 (PST)
Message-ID: <dc76ccab-e1b3-4dc6-8652-3a26146b37ad@linaro.org>
Date: Thu, 21 Nov 2024 09:36:02 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: media: Add qcom,x1e80100-camss binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-2-54075d75f654@linaro.org>
 <92f3f608-1ca6-4c41-9406-28c7ad589872@linaro.org>
 <66d1c50f-ebfc-41c7-95a4-5d555b336da4@linaro.org>
 <bb58d02f-9ed6-476f-8bc6-ad56cb35e37f@linaro.org>
 <91afb347-e8ee-4a97-bd8b-9a1413051cb9@linaro.org>
 <f903025b-08ff-422c-a93e-fad911a7ee43@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f903025b-08ff-422c-a93e-fad911a7ee43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2024 00:37, Vladimir Zapolskiy wrote:
> On 11/21/24 01:27, Bryan O'Donoghue wrote:
>> On 20/11/2024 23:02, Vladimir Zapolskiy wrote:
>>> like "vdd-csiphy-0p9-supply" and "vdd-csiphy-1p2-supply"?
>>
>> In theory, however I'd like to avoid adding endless strings of new names
>> into the driver code for each different power input.
> 
> I don't understand this argument, it's the same degree of endlessness as
> the endlessness of new designed SoCs. Should it be stopped now or what's
> the point here?

I mean to say, I don't want to backdoor a bunch of optional regulators 
with odd names via this method.

Per our previous disucssions/agreements we will do this in a real PHY 
instead of inline in CAMSS.

---
bod

