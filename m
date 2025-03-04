Return-Path: <linux-clk+bounces-18859-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1DDA4CF1C
	for <lists+linux-clk@lfdr.de>; Tue,  4 Mar 2025 00:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F42323ABA9E
	for <lists+linux-clk@lfdr.de>; Mon,  3 Mar 2025 23:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D9220DD59;
	Mon,  3 Mar 2025 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ld0AO+zA"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65D81EE03B
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 23:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741043768; cv=none; b=t0GgSj8EzS5StVajpqOhbt6fMLKZ74DlWbPin31Sl9Nb+fThFd7YxiOfjqOD3bXDFCD1Y7SYb9CIDyYGAps0Gk9nbRQk50nv7OL8XJwSTpl+kw8R6d0viTfuCAFwuf7AWD/3NMpE1A6LJpj0hRAlRIUEj6lGxBuamh8vIzRj36g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741043768; c=relaxed/simple;
	bh=JtGPOleLjdfXbZkxAW7kB6ce08nn8jQ6Cj9OFLxNyjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azMw3iE8CO6NIaSNAYijBOSvqqwMpQppPzzgPYIaPIZjmuOLgZsTWvJZtUn+ZUkkO6RsRXmFQkuCVekxIBEIh5d4u+SgBWTpViVsXAo1RYtcnDpXRTsYgJKGHj9XRQFQN8SkJWLtNBr0GGZfgfeSJJj6nni+3ELyKCBcx8dfuLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ld0AO+zA; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fee05829edso4472958a91.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 15:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741043766; x=1741648566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JFVk3jY5U6LDFO87gwMrK1J3W+7gmQZoy3PQR5ret7o=;
        b=Ld0AO+zAwPD2AuR8a5pW4CD2cJ0EVug8zfUhFGWnvQQAOrydqeFSvVr272nR9FBXKR
         C0mwv9IAQt48o4h65P66UNM6O6gO0Plhcv3d/i99y3K2N/prB7CX1iL+VFoinrojR5DK
         cVvxI05/IR9dGvtcNp/kOhZp1C272ogPBsDvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741043766; x=1741648566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFVk3jY5U6LDFO87gwMrK1J3W+7gmQZoy3PQR5ret7o=;
        b=KbApSuZi/EJTgUw5a/6ZiEjk/irlhUDiKRIq8A46B+zGKkG02zvLwIwr3kyHNKzZfw
         YimlxPNwzXnPpcP7sfKamMO8TQ8tV2+hl7/8ymzk9g8kjtCONEpJ7j0Bo4o/cLtS8nG0
         3QH7wpZ3l1Ha7SUzY+Ga37O51p5NB6e/IKLkzeob+b1QdrefzX26iss1zcQtb0gEVppb
         TDvQPzgUPPidjpKeAUhE32lYMrQK6WrH4JQOt5D6DPixY2r5Y7P6hsZ9YFV2qagTIgJ+
         AZhtexbn+MePMlzxV1UnOFiXv2H9Xhp8Nay3+5k7jBslMcNqC1ALPr6CnDBLzWKsFjOU
         fOVg==
X-Forwarded-Encrypted: i=1; AJvYcCWvf1XyWn9smT0bnric2ruYUsTs4T8wzo8GveO0GcH4k43qzhrjXrQWsdLpxeu0ATRhROjYjeDjolY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaMhcGrRK9ogKY5iKeuBjf1/SZcb3knKRuhSYA0pcYRui58yp0
	vMiLbjK8E/v8jyn09tcjo3huA1HiJX1X2l5K1bKDUorD7J/8fb3+ZR0TuxdmqQ==
X-Gm-Gg: ASbGnctsMXvC0puJuf7TxKytq5IfqkBGEPbwxEP/Hj8MvxmxGz2/ocBdbTNycagP7Cy
	CP7veaKU3EfI0z2LvKJldjiTdDYuWZseRTIwZD2C7aTydOhS2ORoNydSnQJ8mf2WfBRklvRDIQh
	pAci3UIYHLYt+ptLqusZPiKZZulDZs9YVSTCMShiTvZZ3+RTyeRWGXHeEptu5YYzTsb/cLyjsv6
	LXal8/w112Uym58WcWo0XdMKRI3zA9f8N/fxmRx5XdvENmhd9VoxTE2E6ijYfvjCA/frdEz9mSN
	GBkKKHPVccDc1mIAS5GXZ4pLE0W0wAmwmOzFk5KQmcLsWTubeEF539G4yP6Rynp7Ecq8dOd4isx
	fArJrGwqR
X-Google-Smtp-Source: AGHT+IE9RJqN+FSr3yir/3mq4w/zBZ12bOp9zXc3KTsmManVgz5U5aMY7SLoCn1sLP07bcqz+slxQQ==
X-Received: by 2002:a17:90b:2792:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-2febab50e88mr28906831a91.12.1741043766104;
        Mon, 03 Mar 2025 15:16:06 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6990024sm9558523a91.45.2025.03.03.15.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 15:16:05 -0800 (PST)
Message-ID: <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
Date: Mon, 3 Mar 2025 15:16:02 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Warn (and therefore taint the kernel) on
 clk_ignore_unused
To: Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
 <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/25 14:48, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2025-02-01 08:52:30)
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> If any sort of ignore_unused is in place, it means one of:
>>
>> * power is going to waste
>> * the platform description is incomplete (missing consumer-provider
>>    relationships)
>> * the platform description is just broken
>>
>> Many people will happily declare their job done when a platform
>> magically happens to work as they make use of bootloader-enabled
>> resources, which then leads to double or triple the amount of work
>> of another person, as they attempt to reduce the unnecessary power
>> drainage and/or ensure stabiility throughout a suspend-resume cycle.
>>
>> Issue a good ol' warning (and taint the kernel) to make such cases
>> obvious and hopefully draw more attention to it. This way, it'll be
>> easier to avoid effectively untested code or DT description getting
>> merged into the kernel, or worse, going into production.
>>
>> The clock subsystem plays a crucial part in this quest, as even if
>> the clock controllers themselves don't draw a lot of power when on
>> (comparatively), improper description of clock requirements has been
>> the #1 cause of incomplete/incorrect devicetree bindings in my
>> experience.
> 
> What is a user supposed to do about this warning stack? We already print
> a warning. I don't see us dumping the stack when a driver is unfinished
> and doesn't implement runtime PM to save power.
> 

Agreed, I don't think this is tremendously helpful given that it does 
not even tell you what part is incomplete, it's just a broad warning for 
the entire system.

Assuming you have a clock provided that can be used to turn clocks off, 
and you did not boot with 'clk_ignore_unused' set on the kernel command 
line, then you should discover pretty quickly which driver is not 
managing the clocks as it should no?
-- 
Florian


