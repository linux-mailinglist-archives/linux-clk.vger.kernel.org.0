Return-Path: <linux-clk+bounces-2707-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 255338389CD
	for <lists+linux-clk@lfdr.de>; Tue, 23 Jan 2024 09:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D084D1F21178
	for <lists+linux-clk@lfdr.de>; Tue, 23 Jan 2024 08:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B5A57321;
	Tue, 23 Jan 2024 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8DbXT/k"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316C157300
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 08:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706000282; cv=none; b=IulIpVzghMdK/wmm7bHTp65uIHISp3X2kwZRMuhgvtcy/lnnSj4yQc6/Lbp2PnpMnV2FbQxdJPeVNGbUO9kIm4c1xjWrd3pNJHYFWpX0GLCDowODoV1GHWhEAVtjsaeIhMooKNr1cbJEIrVBj1egKL+LoFn8/rXGJg5f/UO4y6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706000282; c=relaxed/simple;
	bh=TAEtUX7AGoyoblV1ruTY9aKViipB6cuUSDtLLHtj3nI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bGZv4cG22yKELLsdFvIsewzXQR2egM6s6rfYNJaUxrITYilS0ioyI/YM2eqVlac6mevSZYiI9X0prvCdepfelvQQ/OzaptNii12Fmw3XbN16H6MPXBEF4qgN9K0JWuF927NOKmGW9Ql2Mxx2Yh7EQrBQKXQwor+EgbUdlwDEeeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8DbXT/k; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-339261a6ec2so2529279f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 00:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706000279; x=1706605079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TAEtUX7AGoyoblV1ruTY9aKViipB6cuUSDtLLHtj3nI=;
        b=z8DbXT/kdFV0e0nY8Z8IvqQblLXQqGHBUUSFCR2J+Tuw/+Ny0j1ZD4thYXycifoDYp
         +kUvdHbUE/cl5Vm4U+M+9ILz/btOQz5uZF/BgXx9JThOls9gl3N06auXkpA/HX7WBxq9
         JHrSfmf0YNPOk7cVwQlBaRZHlq6WIf9rSBmp/5OALpodjBosOXrs6fS0ATrBaRQgh1og
         zn52dOamL7hps+6szezlozyBm/a57nksL5jAMD05RBkeVYJL/WhV75EuSj0ErAM1v/zu
         y2310jEF75Am0YdWjfCZ2Hdsi4+2eyj+z2ebBAociR3s85CJIvrfzKN2XGN1zIjC/vQk
         n+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706000279; x=1706605079;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TAEtUX7AGoyoblV1ruTY9aKViipB6cuUSDtLLHtj3nI=;
        b=os0jIe/SpBP1ELK4sQji7XvcCZ+X3vWcMmYUwNuCzy5cm+OA1/dcDlrPoZlXo6wjow
         cZlpnSnTRhH+VzRpkh5W1HTQzEGmSEYyqi2AReihCPpcl8FntMlB/OLK7kH1RMleaePG
         PStAYUjxrTe16fFX2ULzqOdh1nQ6UMtyLRrhZQGhQAcWaFcQRoPkKzIqFAzmkS9l29mc
         0TL1Pu1SEZtmSKIg4SbtGqtHSwiph7grWIjoc6HnSb/+Oq1MqyIf+SIsB83kdkg5luOX
         etqlfTDgMue2/fbYlO5LES+NmJ8xfcXgWuw0jlSLwhea3p0xSc/28HgK7Ioadf3M4430
         9/6g==
X-Gm-Message-State: AOJu0YyEQjHMnzmLipsuQyeNjPSwzgbR39qLjp9XwfErgBPTu3+gtfaI
	II7cGIx8Pws7XrYTE5oBylMjtvOR7movkRYd/QrZ5QcaRUSjaWi251xCbp92V1Q=
X-Google-Smtp-Source: AGHT+IHD5YKuEThiIkbL848qL0TZ9zQd7/ZSj6LMVYqVOpW3dwe4BCu01VjMMqTy+/OCYMe98X1PcQ==
X-Received: by 2002:a5d:4f8e:0:b0:337:bb0f:3702 with SMTP id d14-20020a5d4f8e000000b00337bb0f3702mr3615197wru.35.1706000279311;
        Tue, 23 Jan 2024 00:57:59 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d5042000000b00337d941604bsm11559252wrt.98.2024.01.23.00.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:57:58 -0800 (PST)
Message-ID: <9d5249a6-5838-4af1-be18-3b9a9e34a937@linaro.org>
Date: Tue, 23 Jan 2024 08:57:56 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: exynos: gs101: define USI8 with I2C
 configuration
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 andre.draszik@linaro.org, semen.protsenko@linaro.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-8-tudor.ambarus@linaro.org>
 <9d12f4f9-1892-48f3-b8d1-8f59788cc91d@linaro.org>
 <6ddbf20c-6929-4cb0-9fdb-570cc7170b9c@linaro.org>
 <7fdc00e1-0a93-43a6-8fb6-c447ad8aef64@linaro.org>
 <a2c64a9f-4467-44ef-a13d-0af80abf4dfd@linaro.org>
In-Reply-To: <a2c64a9f-4467-44ef-a13d-0af80abf4dfd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/23/24 08:44, Tudor Ambarus wrote:
>> However I don't fully understand why that dependency - except patch hunk
>> context - exists. You shouldn't have such dependency.
>>
> Let me try offline, I'll get back to you.

The dropped patches depend on the dt-bindings patch that you queued
through the "next/drivers" branch:

b393a6c5e656 dt-bindings: clock: google,gs101-clock: add PERIC0 clock
management unit

We need the peric0 bindings that are referenced in device tree, that's
why the next/dt64 branch failed to build.

Please let me know if there's something on my side that I have to do
(now or in the future).

Thanks,
ta

