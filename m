Return-Path: <linux-clk+bounces-3829-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BC885B8D0
	for <lists+linux-clk@lfdr.de>; Tue, 20 Feb 2024 11:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 536571F21D82
	for <lists+linux-clk@lfdr.de>; Tue, 20 Feb 2024 10:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F31562160;
	Tue, 20 Feb 2024 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dHxSGSAq"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57EF60DF0
	for <linux-clk@vger.kernel.org>; Tue, 20 Feb 2024 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708424240; cv=none; b=pXg6jHcx69COOIaOHd6nx5H5dduu/k5bMl5RmUxCh4fWifVEG7s6/gj2iXoo+0iHmWA8bPXjGP/H74xjyS4eNzsQ2JnmC9QtbFQv9g7Z2f4q7hKwE72BsreXSYNni9zWYXQQZfRDgz3XiWE8z4Gp4OjxlY5RSFONicuaBm2ODMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708424240; c=relaxed/simple;
	bh=vCnSvQB+jhaRZOo1Tq4ohA4pgOgRJNxOj5qi5MWHCl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgcCpzzqsAGMrl2nwOny4aWWJw81YrlIWIAu+bblpRAH68H9clIKMidaFGiGgkzfDcphGfEIDqvwV0tRHvXXKNqTvSQe7EDY4e1qbW9VYqLlypEDmHyXS2l1h+c1Pe3y4qtpSw1zN9TzoDM7dOlxBu2uZJqpD+qZjQ9LnqL5sZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dHxSGSAq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-511976c126dso6401790e87.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Feb 2024 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708424237; x=1709029037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CIAIF2W269Msnqe6vcvK5AtbB46paiILLo5adq14+A=;
        b=dHxSGSAqcosQ5zcVXLFeq0pvHXr9/rM6r3dRCGuIXJ34E7zmi9XC68ZAHObtqbeitJ
         ItGBExxcXeLZbDqCJAAH8mGRYWvYn3A+n3rMEqIA7P5r3ZpZqUjCW6/V4jgmISL4YdRn
         0K7ZZ3HPqFCQwHvXKzzob+FBDokpu/q0QVrRe1cIGTElT+LLVYQW9q2RBAOPQPT3JlCF
         kX7NBurTyF9MvUmF1sH/Ip7tdZyMn8jQRd0XNuTlF9Q9wfNXQWNSgelxir/mUpFd2s85
         eQc5WJbem/MNsrwXWG0UTO2RaMFgJAFRAL3MUmTj1FUdqVi2xMUQCxm2RW19YCOvwwGT
         p5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708424237; x=1709029037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+CIAIF2W269Msnqe6vcvK5AtbB46paiILLo5adq14+A=;
        b=siT1zd7gw4iFZPiElC+ZIEkelFkmNW7rnhIrNCTSY4bmz2db0CXfSI9N9dzobfX0WH
         zUJPkPy9rUN2J1MQ3w8jtdSf2JpFg6jfoqbhJZO79MB8o7fVT0fYXul7HbWS32bREMX0
         tq+u/4vNjJ3BmzBQ2IaYGfZYLVqlg6vSqQ5KdZDkyWI0P1cBo4vOC6UEI7vHhNUMw4Q/
         hrnBsctHPOlUte7xmccBfKQWNMmsoR+gG5jgKchaxlVm6ZZpdH3Oe25m2qPzpcOpBheQ
         DCIIHXyF2TgQDraXI17+QykIFqFq8Ic0Rm1QQCRqZ5gWSvHhV65PAMLQA9tUjhtbZj5H
         vpCw==
X-Forwarded-Encrypted: i=1; AJvYcCVpVbNli7okwsJ91rRqB06QIA+0/8QuUeS4+P5B4PYD+Dubv8uXHdZG2bYEYY9YHWQloP+F+qZcFB/CXHRee2sV1mJpzIox+PHD
X-Gm-Message-State: AOJu0YyS7Ip+xjkXhEOarijm/P+cCAVpU7vNljjEmvvmPjXN7lAow6Gw
	r/hu7NMSTMcJ6428k4rZWZe2+O6v2XUo4e5hM+j872QV6+ih5q7+0h7CmaQYnzs=
X-Google-Smtp-Source: AGHT+IGkgp4MMQ15Vex1ugunecyAg7RD4UghVsQzM0nCThCpqdp4rYfsCJRbzzDcVYzRRgr1m3MzWQ==
X-Received: by 2002:a05:6512:280f:b0:512:a8a8:487e with SMTP id cf15-20020a056512280f00b00512a8a8487emr5134800lfb.40.1708424237006;
        Tue, 20 Feb 2024 02:17:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6784000000b0033d39626c27sm8491785wru.76.2024.02.20.02.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 02:17:16 -0800 (PST)
Message-ID: <2fb8c959-172f-4089-b39c-f07d741c74e6@linaro.org>
Date: Tue, 20 Feb 2024 11:17:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/5] clk: hisilicon: add CRG driver for Hi3798MV200
 SoC
Content-Language: en-US
To: Yang Xiwen <forbidden405@outlook.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240217-clk-mv200-v2-0-b782e4eb66f7@outlook.com>
 <20240217-clk-mv200-v2-2-b782e4eb66f7@outlook.com>
 <31188f64-7c6b-4279-a2d7-8b5133b1d485@linaro.org>
 <SEZPR06MB6959E45F52C87C08320B7E7A96502@SEZPR06MB6959.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <SEZPR06MB6959E45F52C87C08320B7E7A96502@SEZPR06MB6959.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2024 11:14, Yang Xiwen wrote:
> On 2/20/2024 6:11 PM, Krzysztof Kozlowski wrote:
>> On 17/02/2024 13:52, Yang Xiwen via B4 Relay wrote:
>>> +
>>> +static const struct hisi_crg_funcs hi3798mv200_sysctrl_funcs = {
>>> +	.register_clks = hi3798mv200_sysctrl_clk_register,
>>> +	.unregister_clks = hi3798mv200_sysctrl_clk_unregister,
>>> +};
>>> +
>>> +static const struct of_device_id hi3798mv200_crg_match_table[] = {
>>> +	{ .compatible = "hisilicon,hi3798mv200-crg",
>>> +		.data = &hi3798mv200_crg_funcs },
>>> +	{ .compatible = "hisilicon,hi3798mv200-sysctrl",
>>> +		.data = &hi3798mv200_sysctrl_funcs },
>> These are undocumented compatibles. Run checkpatch or properly order
>> your patchset.
> It's in patch 5. You mean binding patch first and then driver?

https://elixir.bootlin.com/linux/v6.7/source/Documentation/devicetree/bindings/submitting-patches.rst

Best regards,
Krzysztof


