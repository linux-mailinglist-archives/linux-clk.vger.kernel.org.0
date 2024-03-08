Return-Path: <linux-clk+bounces-4456-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA28764B0
	for <lists+linux-clk@lfdr.de>; Fri,  8 Mar 2024 14:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D6B28421B
	for <lists+linux-clk@lfdr.de>; Fri,  8 Mar 2024 13:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90D91D52B;
	Fri,  8 Mar 2024 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Web9H/sb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD1D1CA8A
	for <linux-clk@vger.kernel.org>; Fri,  8 Mar 2024 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709903070; cv=none; b=uCi6FkuelOVhxT3Sorek6T2DJzUFY1MAxa2EzHzGPI3LMJgzLDWX0naKC7gfCdFY0TJ/F9p45hh7ZHpunIBea2CbUDKmoml42IwR/Wrek53/XXxRN2fNiSvvvrzolK+NwTJnDFv/D/kSnoJ/ZdmDQNyNPsjj/m3lyrgYW5hZzpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709903070; c=relaxed/simple;
	bh=yRWdVfpQxqHtySeHiXZsB0Tjfqjdc3FOYFaeh5FUKVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxFsjC/HMZ6NaG8niAdfFMLO7xEiR8PxcAxVdVxsjmmFFuqKW20af3F66ZJPAFhMrpbQQn9DqJmL6mFTs34cMd/yx8AOTY6+XyBfjPjMz7BKfagws2YT4+Nr8PUCqdVcrkMiSaNuUBdUGPkXiBODb+wTVqOq6boGgemOxGleZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Web9H/sb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33e6f9ce76aso596205f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Mar 2024 05:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709903067; x=1710507867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQ57E0ArmK/bVUfP0mzi0MhsZFrvk857kv7W7dfFr2Y=;
        b=Web9H/sbGFVzPeK2q4KjbOJ3YpE5RP1lRrxdMX1V5YQSrhYZpypHYccoZ/5PwoTacg
         o2kHRszVATHZckNnJLMPCRMvK+9xhIWOh0BYaSzAH/gibpKbNYzsmQTaYM9kFvPW8yVn
         zjtNOqKb5uv+ynLTEuJJHZ+4C02qAq1GTFQ2QIt5JryBRQAP6yXMp3eXrVcv5FMIZyy4
         b1SS7+uKp1A79SPzC7V6Kpthy3nWyOI8qy5J8onb/HXS8/D1kb8SG1X2gwJbA0rTrhvI
         xpI2KpK6FhYosMP5Yx1NW8Ou34Bkp8G3yEpquKoIkiQE1JCSIP7sR4yY1yWVBvFIjKsN
         cFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709903067; x=1710507867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ57E0ArmK/bVUfP0mzi0MhsZFrvk857kv7W7dfFr2Y=;
        b=OpjQGcWftpiRz02omDKH1gVDJVDaADu6A0Q45yFPgQpKW6G+BoQqzReeL/SEo+BVeh
         sru03HnrkaAKN2YJkBPM+fvykL1I4OQmFweVcQtN1MCrPDdQQcmwEF9lb/LoM6VFMdQN
         x4nPFa7QsW6G/nZ3vjieUb2BIhKxrAw4Om8up5wNM4QpWOWFqX8SEOODYAiuxChxN8mO
         D5sRPozfF8qu61GlMhuzKQtBNZgNsoRO2U21QN+LHe9mGkj3WT4oacyWjvkHaZBhLzeG
         90GegLHFcAkgcxvv/xtG5heJmifx5xd7NorTM9BEGRLESTPmoHvOwtZH0qcesdO8WDq5
         0vZg==
X-Forwarded-Encrypted: i=1; AJvYcCVkaWF9R5Jh51tCFAG2RHegn6pbKCk7ECme3dxRL9CuPQ/1mPQS2IjhTeUHIb5Oa2g525UdBajqkugBbsxm1InoFfHExfOBU0qd
X-Gm-Message-State: AOJu0Yz2XSCwW9hEhAePSeBkBS2MQRy4Z4eIQsbDwf3RP0/hSUr5ryMO
	AtS61xvtEWpMZ0R566AKx/UKvDR+VvKfAaYWKgqKo5bGYa8DcmbtVfM+bBlkAhY=
X-Google-Smtp-Source: AGHT+IHCkwidEwgVLTE4ZqN7hKFvS6AkaL79HDNSUljGLcAHE0kLzs+LBju0bJVMOYhQqVw7bXiGkA==
X-Received: by 2002:a05:6000:180c:b0:33d:be6f:7dcf with SMTP id m12-20020a056000180c00b0033dbe6f7dcfmr14295647wrh.24.1709903067129;
        Fri, 08 Mar 2024 05:04:27 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d58ea000000b0033d4cf751b2sm22772090wrd.33.2024.03.08.05.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 05:04:26 -0800 (PST)
Message-ID: <291279e1-7abb-4614-91f3-af9ede349817@linaro.org>
Date: Fri, 8 Mar 2024 13:04:25 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: Add camera clock controller driver for
 SM8150
Content-Language: en-US
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240229-camcc-support-sm8150-v1-0-8c28c6c87990@quicinc.com>
 <20240229-camcc-support-sm8150-v1-4-8c28c6c87990@quicinc.com>
 <18567989-fb60-49ae-92e6-94e1bc2fa1c7@linaro.org>
 <83fd1995-a06e-b76a-d91b-de1c1a6ab0ea@quicinc.com>
 <4817a5b0-5407-4437-b94a-fc8a1bfcd25d@linaro.org>
 <e2627a99-307f-1e10-abfd-ce688cc2ec03@quicinc.com>
 <d893e8f8-66a7-4460-9468-0f3a359cece7@linaro.org>
 <35a7ad40-aaf4-476e-8582-b83bac284881@linaro.org>
 <c892f773-7716-4736-3499-5c8254e3618e@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c892f773-7716-4736-3499-5c8254e3618e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2024 12:40, Satya Priya Kakitapalli (Temp) wrote:
> 
> If BIT(0) is set from probe, during any active usecase, the clock gets 
> turned ON automatically when the power domain is turned ON.

Sounds like a very dirty hack really doesn't it.

Can you point out where ?


> But when we use CLK_IS_CRITICAL flag, the framework keeps the power 
> domain ON and doesn't let the power domain to turn off even when there 
> is no active usecase.

---
bod

