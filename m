Return-Path: <linux-clk+bounces-14538-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8849C3F32
	for <lists+linux-clk@lfdr.de>; Mon, 11 Nov 2024 14:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF01B285CC5
	for <lists+linux-clk@lfdr.de>; Mon, 11 Nov 2024 13:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D5F19DFAC;
	Mon, 11 Nov 2024 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oA1UE+5m"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A519DF62
	for <linux-clk@vger.kernel.org>; Mon, 11 Nov 2024 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731330307; cv=none; b=cxBG3QApER6tS7jvVA9ln7fl5uAg0bgf5SX8cdKR1euuBhbdq2SqEmBXk2FzGTU4YQNZLCsveDOkMvw/I+fTJIqYqQp3yfuz7ruTQr1qjEhoDrpo5G2sa9f+RixQavGp4spyX6Du/QkiiFoxc+cbaLEBjwcCjKXAVZOW3XKDZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731330307; c=relaxed/simple;
	bh=gIPhYew7dzfquIW0CCemEl1LtulhjVUglcXI1l5PfbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phIeh8nshurLAo76qiuvXEZ1NvQ5n/TjKeeSnh4Gg3llfcwW+URFlKZjSnLi3hYT2ixAPk49T5VEEhumwFjH60WZyDkoTdQkpYd+YIpX0J+pRxaVH0kFHyhqDaw/sxckTxgLfhD7+7fIQgRpAfB4xUcfQJB9E1/M149bA4Yccks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oA1UE+5m; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5ceca7df7f0so5889477a12.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Nov 2024 05:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731330304; x=1731935104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0M43GhstcJGats4HNFv7GstWqj3W279xntuAhQhufno=;
        b=oA1UE+5mpJEqj1na9Ax9ZIF5kFpz7EhkYtvHPrqjVCKz2HGSZ/hjwvj9Bz80HEf3uf
         ZHdo9ZxvIlDRgxeC5a6wlAJ/t2xpx/mNxj4bQpNon6QkmsOdXVKO4q7jLZbjWFcivkAV
         Se1pkaSC73ncEv0ZtZWMt/QxxKyeIrKqwwVs4Fe7JIiwl84FOGLO1HQRYSmPFz9DXr2s
         dHGP4aw4rBEIchDShce+jXP6D6bKLDLBLyKADc9MrwCgtgoJElL0gS5r0bG/hIQk2/By
         ot5ZJLsJ0pQBDFHdY4LS6w6QJ51GDZibZmy4MDQeOlWwhYLzSnKuJlEKE8E43tRaXLn0
         9S/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731330304; x=1731935104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0M43GhstcJGats4HNFv7GstWqj3W279xntuAhQhufno=;
        b=AkbtAPwhvHmKSZ7khkjg7KyOw+mExl3QkMu/v1ts9CI0kNi0E2gSP5i0OO+7njB7gZ
         ssaNTv/d7fB+ppVMxe9AaC5+pBooJK285NCd+RUmTpRCPOICMCNjqus3kWSEQ7GSbfEs
         kamxbUSNA4nGmmcP6q6fdWeHQYrxFC5LCbyObx7f4ovd9+StKRcYHX+JQ06FwBYGVEJ8
         UmW3dhvkB1AebS7kZg6uIC3QKaJF7+laz7tSNGjIpUbWbiHfmniWbqV/OgzWZiMg+8hr
         20Krk9y25GjCmuQml+kBSCJlHzaMXOf8CN+uFuwo7urln5Pqv9cYkCl92SoRREbMxHAp
         xCJA==
X-Forwarded-Encrypted: i=1; AJvYcCU6TTviWW/PYQwl5Q6m9bINqVsk6+iDACnR9dfXsO8VBMR6X9q8A+SJjsWAxYcIt12HE4CjES2bx/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGsDRCAnSW118UK3E5x/yi98V8xE8gs8PptOOTTGFmZ7bE8BtQ
	iMEuzFhc1BY48LylbUgGXVzb3kIGJ6fBrzu60Urr7eGYuGYo7Swav5B3zvuTm6o=
X-Google-Smtp-Source: AGHT+IF+Uy6vJ/mFt2X497WWSHDSPVF+ytSPMRVmm26PsJRMcXFRaq63mpfrNoy58mnodUPBbauLbA==
X-Received: by 2002:a05:6402:3198:b0:5ce:c9ae:347e with SMTP id 4fb4d7f45d1cf-5cf0a45d167mr8162093a12.30.1731330303890;
        Mon, 11 Nov 2024 05:05:03 -0800 (PST)
Received: from [192.168.0.187] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b7f2b8sm4925807a12.32.2024.11.11.05.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 05:05:03 -0800 (PST)
Message-ID: <14689f79-58fd-4be3-87ac-e56cba3deb26@linaro.org>
Date: Mon, 11 Nov 2024 15:05:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: Rework BCM_TCS_CMD macro
To: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, djakov@kernel.org, mturquette@baylibre.com,
 evgreen@chromium.org
References: <20241028163403.522001-1-eugen.hristev@linaro.org>
 <bb5d855954d5ff8694a3978a9f87a9d2.sboyd@kernel.org>
 <6f14d8d7-7b9a-49e3-8aa8-5c99571a7104@linaro.org>
 <b587012e868f8936463c46915b8588c3.sboyd@kernel.org>
 <7b57ccc2-7060-4adf-b896-8992ec05125c@linaro.org>
 <e6637dcc85ca23efaf72af906f364328.sboyd@kernel.org>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <e6637dcc85ca23efaf72af906f364328.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/8/24 21:00, Stephen Boyd wrote:
> Quoting Eugen Hristev (2024-10-30 01:28:14)
>> On 10/30/24 02:40, Stephen Boyd wrote:
>>> 
>>> If the rpmh-rsc code didn't use writel() or readl() I'd believe
>>> that the data member is simply a u32 container. But those
>>> writel() and readl() functions are doing a byte swap, which
>>> seems to imply that the data member is a native CPU endian u32
>>> that needs to be converted to little-endian. Sounds like
>>> BCM_TCS_CMD() should just pack things into a u32 and we can
>>> simply remove the cpu_to_l32() stuff in the macro?
>> 
>> This review [1] from Evan Green on the original patch submission 
>> requested the use of cpu_to_le32
>> 
>> So that's how it ended up there.
>> 
> 
> Thanks. I still don't see why this can't just be treated as a u32
> and then we have writel() take care of it for us.

If the values are in the wrong endianness, e.g. 0xff11 instead of 
0x11ff, the corresponding field would be filled up wrongly, even 
possibly writing unwanted bits. vote_x and vote_y have a mask of length 
14, so there is one byte and another 6 more bits. If the endianness of 
the value is not correct, the one byte might end up written over the 6 
bits and 2 extra bits which are supposed to be for another field.
In my example 0x11 should be in the first 6 bits and the 0xff in the 
next byte, but if the endianness of the cpu is different, we might write 
0xff on the 6 bit field.
So we must ensure that the multi-byte fields are in the correct 
endianness that the hardware expects.

In other words, writel does not know about the multi-byte fields inside 
this u32 which have a specific bit shift, and those fields are expected 
to be in le32 order written to the hardware. Whether or not the cpu is 
le32 is not important because using cpu_to_le32 will make it safe either 
way.

I apologize for my not so great explanation




