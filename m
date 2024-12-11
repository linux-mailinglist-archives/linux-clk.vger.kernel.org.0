Return-Path: <linux-clk+bounces-15737-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AECC19ECB1C
	for <lists+linux-clk@lfdr.de>; Wed, 11 Dec 2024 12:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF72E16A3B3
	for <lists+linux-clk@lfdr.de>; Wed, 11 Dec 2024 11:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7D3238E22;
	Wed, 11 Dec 2024 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tlanoJJH"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7F2238E21
	for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 11:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916275; cv=none; b=FicrYcHjq0segHqtzrI2ookp9dIUuTvfYwK//o+i0rLj1jrtYKymK2KOv/lkM1N6QbX/07qMLNv3SxTqcxBya/mdsjBHeUbeVggcyk9ZDQ9X/QEdTj6nLzNDHFcM4PmSasuAiUZp8S2R9xywT9lDlnzNDwgMQBSMxmjsy5RbeM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916275; c=relaxed/simple;
	bh=doQ+jxVCijrIMLh7OMLzT8/sHqoOku3Qjpw3S+/LdG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONH9LTqZH8GJcRJ5PnuBPDaoFf7V4ls3rFoehFRNLNYb/RBtowma3WCt9c04V6oU2+imYmjLnZv22IyJBUHMsN8N+Bmt1L2MKGGuUpG7tCPszwzrxTA/p8DLrzlvo+PBU5N62zbBUsFQe29hSsfqRh5rD0hojGYdC7AijUoXN98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tlanoJJH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-432d86a3085so43767905e9.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 03:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733916272; x=1734521072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdVOYxjqZw+NY/Spw9lnEumCFUaVRFED0TdxGULYnmY=;
        b=tlanoJJHrC9aBRFgGGz3kJ5Ht/QNihOU4/AUfoGmb13I6KLYlvl9jjX0eBShlVOX5s
         RH+7tXrrmq99n4kBVzJGjBdW6w95l3u8IvzWDhM55boPsOiB9GUoSboyF5SnGdVQbLqQ
         3F9x/VBiuSCnipGhP0uknYWWhBvSTrIN52Pgvi7ZwyiCqwVtIkytO3IShTRQfBp+LHZC
         gDUvs775OIej8PLMXEnGnYbYnLzJDdujPahpsHt4IUf15V8QwdZ4bNrhVBoss19GBiBz
         77fGDEAwK/m4VRDotTt4idrquDyd1i3op7s4SO3KW3t8df3LtnFxPudvXf18IHGEMB4q
         deHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916272; x=1734521072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdVOYxjqZw+NY/Spw9lnEumCFUaVRFED0TdxGULYnmY=;
        b=xDd++vOcKbSnXZKaTYEAWJ7Fbl6Gp8rILihQI17EM50aEhRTy/Izprw+6As/mHoEJw
         RmqX032+r0br3QrrIu2dqalQJ78zOTR3JR2pMo11ZXnxVLd1JTXCRMkMP/hskmkcvK6S
         RYvpfCMlLVP1Vpn7NN824ZIMUvfOB4VaNMGdbd8ORcKGGGv0Yb0hlpLUP3v/2kra3ptG
         vQ+NS1IhFlj6ku0j69jlpGL3CID2bOyXr40TWpke+nBo7gu4EBL7X/Adb5auefB3cagC
         fxXlXC1sWXs5ihtnIB7trGdRJgwtjEVqy03uLwmPxdsXnaMEEUqYol3umawdj/tfC8Uu
         rihQ==
X-Forwarded-Encrypted: i=1; AJvYcCV43HGoKAslR3ghVQ0uM5IiuRe0oIMIfXQY+7DmyBkuj4COHBF7MXaR52oxigh6Fytru1+UvoPLccc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVvlaMqgvqfF4txVz2lkHdgpK/AWIe55HiZ/Yy23WkGW6D2N4C
	YejuqHj4kPjdBpanobwt+Ig1fJePGByou+hNiiHPWl1TRV1iI/uuii9BEcxIA4E=
X-Gm-Gg: ASbGnctWfIxyv+tPpD46eMnDzeKseFhc74XdjLt7w44ZWkGrIsDs9+BfiUOvfDPRSvy
	rH6qd+MuBXR4CAg1BiOg9cYy1wD4NjqseVA3c2eP8VJWS/IO/wy15MKdUAvPc0ydlN2QFz9YWd0
	jVjUK0crDs0hyshnQSt7JDB/terGYdvH8zlpVMVnEEBxXuyxtINrYKyTv9b8FpuxPxD0fuVpOYM
	2DaGkmnOO763bhTifXmiQeGbRQ1bWCW53CFtLtCm+Kwn1gCFceQgiYD/ZP3Vq3XLNs=
X-Google-Smtp-Source: AGHT+IHfpFkIaDWgwQjHg8s+n3l3A0yqYbHH2mwIG4royHXDzI/IOfZn/Y6bGxTfFIWmUzLK2LmN0Q==
X-Received: by 2002:a05:600c:1d1d:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-4361c419464mr21115285e9.31.1733916271781;
        Wed, 11 Dec 2024 03:24:31 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f981880csm102337305e9.44.2024.12.11.03.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 03:24:31 -0800 (PST)
Message-ID: <a499bc08-1505-4f7c-833c-68240fdec275@linaro.org>
Date: Wed, 11 Dec 2024 11:24:30 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sdm670: add camss and cci
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241210233534.614520-7-mailingradian@gmail.com>
 <20241210233534.614520-12-mailingradian@gmail.com>
 <fe8dbb4e-9d0e-4ecf-874b-be9225ae1487@linaro.org> <Z1jdNaeoictuCK7N@radian>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Z1jdNaeoictuCK7N@radian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 00:30, Richard Acayan wrote:
>> I think you sorted the regs, interrupts but forgot the clocks ?
> Do you mean the first three clocks placed first? The order was suggested
> by Vladimir in [1], but I can undo it.
> 
> [1]https://lore.kernel.org/r/40cd7a52-1c60-40dc-aee6-730b5247b216@linaro.org

We've had a long, long discussion on ordering subsequent.

Have a look at the sc7280 and align your ordering with that.

---
bod

