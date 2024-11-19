Return-Path: <linux-clk+bounces-14863-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168CA9D2991
	for <lists+linux-clk@lfdr.de>; Tue, 19 Nov 2024 16:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB7F0B33E9E
	for <lists+linux-clk@lfdr.de>; Tue, 19 Nov 2024 15:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E40A1D0DF4;
	Tue, 19 Nov 2024 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTafX3XF"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7191CFEB8
	for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029262; cv=none; b=unp3CS0G2qA0CHJbAkWu+1gymfqGalEiE4FEdsfnNoVH3OY2EEbCN5GB82FiU7y9DYT0amtXAxqufUMmWJkHUtlDoC04wmKApG8gWg/om0A4xF3La7saOi+5QPcCnBFIxAvLfmATRkkaocHkVOpCnlHgu+IqEimZaZen/PeoH7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029262; c=relaxed/simple;
	bh=byCRkpmcjLYOiYuZ9sbi5crcjmK3Ichis8Fw/UWZ0gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ieuP414UuZzxARg1JHsgWSBNUF7ZdFSzsvkWgWn33Q+LymOhywLfov1TsbAoRAGPcIZvWkGVV2OJItxS076asU9KqfhHlLXWl4DZ5czFZIuS0UUXq5slUzSTT8hIy3PJ5sYF20BIlFK6wP8xGKiUm7I+xfr+a4CG5lD7YAgh0+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTafX3XF; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e8607c2aso1258770e87.3
        for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 07:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732029259; x=1732634059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XApoDteQx8uwLmT1djRy37kdLKoweLorD9+kK8kGqhI=;
        b=fTafX3XFObAZyuMsqXEblfjYiF2gStJXvv6q7oXGfA5SSmVKJDd0t1nLfdobmoSuNZ
         Q+cYF3e6t+hclfhrSafgT0LtFtOv7FF9k7U0+F6mKMEbNpPipa8aQqBj1y8Ce/6Pq406
         gKWbdSiiYLCN5MY/D+J1ChAtCYxCLTuKZN76Y5qukjnydrNgc9WgLS1mn11Uj5iw3ccF
         N3XxzML01+2m9GvEJFX3T04XzZ7quAFWB4jYUNzGGrkBvutbonvTiNDFtWhE4RTu3Gn1
         U0vovqKSltYLi4fUegJs/Sst6BWWthxDCD+KzRrsL0BbX3r9BRg3AZeoUH3JHoat0MxU
         fWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029259; x=1732634059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XApoDteQx8uwLmT1djRy37kdLKoweLorD9+kK8kGqhI=;
        b=GKldt2OMtAltT3PX7z9B9/lWcEDU6C2G/Bh4HwfDkISNfseJrhuBGGptV84PbvxE0f
         CCzohHt75XBfGJPK/00shYTwpJ0ItLlAJD3ZUe+JqrMIKwwyIitEPqI01YVQ4aW7TNbb
         YT0Hv1fGPQx9BwVNkobuqInpZhXQHam9ygcALdV/KUe2VEUfQJausxTye8zIUM6Tvgi2
         G2Bvf+p1namrfufpoCtPp26E3zSsMzcgFGz4ZhhSmjiM6dYx4GUzV4mU1jdhM0uGN1F9
         bYNfSSNW4VF2uVGNVo94DuXPcmtiBRbB9X5qulmGPuB3ewudFltFKaHtwrb8cfd8BY5L
         CgOA==
X-Forwarded-Encrypted: i=1; AJvYcCWDL4d0Gxesd+822RZXShiP6L1EiqvsIGkbH313EBPviNMYHHODSrozpE5bTraYLk7O7GKA2C5+Ar8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAQzTHLylpCibwJQZHMtqwpFYiGvbS4wTbnlSbDXRCCcdw+F4w
	aBp6ZsNgznDyHzrmMHGlE41r6faWt4GzsLsaYzWqNzakbh4LzCtOKTNe91uuck0=
X-Google-Smtp-Source: AGHT+IEUE1NmZYZC2AMtwb4y1seGjwr4lW0GYMgyKEoTqI2PAHQa8nbgWJxlnLMXfbEliJM6t9Jb8A==
X-Received: by 2002:a05:6512:2389:b0:53b:1625:bcf8 with SMTP id 2adb3069b0e04-53dab2a71bcmr7430240e87.30.1732029258740;
        Tue, 19 Nov 2024 07:14:18 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da2946a3sm196687005e9.35.2024.11.19.07.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 07:14:18 -0800 (PST)
Message-ID: <1aa56690-1cd0-40e4-ab88-9445ad5b1877@linaro.org>
Date: Tue, 19 Nov 2024 15:14:17 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
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
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
 <b91972e9-5cae-4a8c-b672-5b8d96d442d5@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b91972e9-5cae-4a8c-b672-5b8d96d442d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/11/2024 14:44, Vladimir Zapolskiy wrote:
>> +            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> 
> I've forgot to mention that you need to correct the interrupt type
> to rising edge, that's been disucssed.

Ah yes, I forgot about that.

Thanks

---
bod

