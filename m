Return-Path: <linux-clk+bounces-5917-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D67FC8A48C0
	for <lists+linux-clk@lfdr.de>; Mon, 15 Apr 2024 09:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13C461C219D9
	for <lists+linux-clk@lfdr.de>; Mon, 15 Apr 2024 07:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE2C208C3;
	Mon, 15 Apr 2024 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wlpgHbas"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3001222EE9
	for <linux-clk@vger.kernel.org>; Mon, 15 Apr 2024 07:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713165225; cv=none; b=Uhm5psvjgim7y+p4ScJc8rzVatXt9abNsehDVgldbJQT7ChWDZ5j8epjgX/0lbXr0FmK6AQjTGNN1hjklchoRyqYHCj8axnUXN1Bs+x1FEiH5byjnFw34WuqJX7NXcrDMFU7PhjmX5ODXtfmU7zXb2F1cIY1AHwL+YHxUh3dgeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713165225; c=relaxed/simple;
	bh=CWPK6w3zT6afZGt6HGhP0UmfQDzpzebaNu5gv9LbIxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2WpIu73J2PmekO4fy6KragSMD1CZT9GiCAtwrjvIR3FLT27D7uJ1AKYLrg/G9cANpaz0f6g1q6HYjK1qptOGaoFZb897wuZ3yXrJWqPwpGCFhrgIQe2VVsEE4wnWcFC19wkqHS0VHNHZebMQV57yP2O8lU17TXU6NljSdEUxGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wlpgHbas; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41551639550so17117515e9.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Apr 2024 00:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713165222; x=1713770022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qjbv0BDxFhdQ1QGv5B0joRulZmVtsUIq6ZfbQ+JtryM=;
        b=wlpgHbasYSA/XndgyY01q9XwrfW4Mh9NFMdgK6PkpeoxkaT8+Hy1MAdk+lAX3X1GO3
         W23Glsnjy0bwrem9muBi8vDioR1/bS6L9IdyvSqnPldwMvZbc02eWiZHaseccM1gu45z
         /K2vt6UBSIuGEY63B8+VtWz88HQ8tDKsM6ChJzzEx4S4NfvSPD7w/xw8mH7ne8W+zFEm
         B4u7lxcueFLRcTH6sReBKXBE2xD3R8F9MVO4gHks1AWnVElGcQSG5CYgVsjskpPI5ffF
         zsSGPUinnYtOu5FbPAnDZd4utV1sjspI/5c2ZXhgJafAnQEDS3kcVB8dBke19ojAsjyS
         OQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713165222; x=1713770022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qjbv0BDxFhdQ1QGv5B0joRulZmVtsUIq6ZfbQ+JtryM=;
        b=vf1sGvZluqiLqjVgH76lOZlEWazFhRGJOKUVlxoN9LLwTh1gk8p23HqQ84ovcxBMau
         kwWf7EzBG3BJLYvNwavI2lr1q9l1LSRN+6IiNitqvcD8sGHNtcNCbL91QWXZlBCH5CLU
         JTC6HUYl4XDjl5K2BB+SsodQ8T0ZT3zwDfKdZmcFsb3vCNyohxSj86zfKrX9F6h0w+KX
         c2SROc/rsHoEapcsyTYkvSOL0ognAQvpq4TF9I+7pNBstpZc7kXgYJBKBNM4iH+ykD1U
         XPuq5/NHF5ODY4MpELcvBGVM5pL0n24d3Ew0fgOHfMxRjWglPJlzaygPwXU1VxWv9xyU
         LT0w==
X-Forwarded-Encrypted: i=1; AJvYcCW+Cq19ejhcV4KGxri8uqm2MzUFbGJ7C1U2S8/mWr4slv2JdJ+D/RzVLELD4yJ2EK09L/48YmWKnXhbRXB5kGWa/KWVv1tVGeol
X-Gm-Message-State: AOJu0YwJ+1pTvcuu1uC1bFT7C4oyoOqqLPSL9Q7AWoYmVSCPKa9LDa8y
	d+BbHas0CRme7YKhlHPLQBj8df/VOPZ7KdWLKOANRUcVc8eOLEb7cQw5WDgyevM=
X-Google-Smtp-Source: AGHT+IFw5PvpvWQlXLxEO8rTs0jwGiWfzv6ThaBcqyAtvdCVjmi0upBC2QGhXVNqAcIWfkLcPsLoDw==
X-Received: by 2002:a05:600c:5656:b0:417:d4f6:22eb with SMTP id js22-20020a05600c565600b00417d4f622ebmr7540359wmb.24.1713165222504;
        Mon, 15 Apr 2024 00:13:42 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id t4-20020a1c7704000000b004180c6a26b4sm5439490wmi.1.2024.04.15.00.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 00:13:41 -0700 (PDT)
Message-ID: <f67ca72f-c0ae-4f2f-a435-b00266914053@linaro.org>
Date: Mon, 15 Apr 2024 08:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] clk: samsung: introduce nMUX to reparent MUX
 clocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com,
 s.nawrocki@samsung.com, cw00.choi@samsung.com, mturquette@baylibre.com,
 sboyd@kernel.org, semen.protsenko@linaro.org, linux-clk@vger.kernel.org,
 jaewon02.kim@samsung.com
References: <20240328123440.1387823-1-tudor.ambarus@linaro.org>
 <ab700927-d7b6-44c6-bbe0-8c52e4a0f907@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ab700927-d7b6-44c6-bbe0-8c52e4a0f907@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/13/24 09:47, Krzysztof Kozlowski wrote:
> On 28/03/2024 13:34, Tudor Ambarus wrote:
>> v3:
>> - update first patch:
>>   - remove __nMUX() as it duplicated __MUX() with an exception on flags.
>>   - update commit message
>>   - update comment and say that nMUX() shall be used where MUX reparenting
>>     on clock rate chage is allowed
>> - collect R-b, A-b tags
>>
> 
> Sorry for late response, somehow this end up deep in inbox. You

no worries!

> reference some non existing commits, so I think you do not work on
> mainline trees.

Ah, the horror, you're right, I messed up the fixes reference in commit
2. It's because I started working on this before that patch got
integrated. Would be good to extend checkpatch to catch such situations.

> 
> Also Fixes must come before other patches, so probably first patch
> should be squashed with second. Otherwise second patch is not a complete
> fix.

I don't mind squashing them. I noticed a tag that might help in this
situations: "Depends-on:". But I guess we can't use that in the same
patch set as when the maintainer applies the dependency and adds its
S-o-b tag, it will modify the sha1 of the commit. Will squash them.

Cheers,
ta

