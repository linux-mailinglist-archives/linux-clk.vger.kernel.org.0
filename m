Return-Path: <linux-clk+bounces-2548-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2AE832A0E
	for <lists+linux-clk@lfdr.de>; Fri, 19 Jan 2024 14:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B6D61F238EE
	for <lists+linux-clk@lfdr.de>; Fri, 19 Jan 2024 13:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4998D51C4A;
	Fri, 19 Jan 2024 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b="AsKf3Qf+"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE164F21F
	for <linux-clk@vger.kernel.org>; Fri, 19 Jan 2024 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705669548; cv=none; b=mTQovKJOmX0HbsUeZMWV6kBrI2G71do5xJCQAF5Qga4a5HJugORwsh7BT62oEgvlVqwYvV5GuonrWNsbEOeSvPB0B/ljsdf4PILPsxP7raRmbbhbAHBg+F7L3jsXml4mNvcZgIgr1JLQgPWinGWm+2zyuf41BK10clRAXZrIj9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705669548; c=relaxed/simple;
	bh=T3lgeBprbO2ncEnbB/0Iwitj/QDiDU/VqFEnkGf35mA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=raBVyRqMJVxOQNLN3ZbyqnPlj8bTe5H++o7lw2Oxw48RHwkdK083GGvSKmDOncnwxIMP55mcsAqkZ9yFbTQT5HcLkY48nzVc1omqD5OjLgdriA97V4z/y93PHbldYKsfQ1iddXD81HofthEGGoo+NOraJ2SdlaLOrRmKdMJZnOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com; spf=pass smtp.mailfrom=8devices.com; dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b=AsKf3Qf+; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8devices.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so552435a12.1
        for <linux-clk@vger.kernel.org>; Fri, 19 Jan 2024 05:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1705669544; x=1706274344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFT1caunJL2bjnoz3k5PNtNB8wm9Pwof23zyHAFtsu4=;
        b=AsKf3Qf+inNV8NbN2puLEss3HIput0h3qsxTClUX77onxpuIZBwkcLURR7M40hTUHT
         lzvFlqBK9gxylNCnNFnfhq0KyPy2SmprR2CI9um0nyP5KGp2vX+Nw4DcucjoHgtcQPKI
         1kyPJOBkY13ApRCFcjAiWtZUhQgkkoq/Ck4GAulvLBYJaui/dtahrjFfUoLjE+usjaUD
         QlJYU+585VCd22xwiKEELaEEqL5cULplBd7Q/Xo9gORkXclQg/ZNaDOHAllAFA2l8CIe
         UjoK1fnw6CwBG6yc1EqMGlReKvCyVOKJuqjpOGR5ZlILm7yzo4d+WJmZ970BbOvkjn8m
         Kl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705669544; x=1706274344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFT1caunJL2bjnoz3k5PNtNB8wm9Pwof23zyHAFtsu4=;
        b=nsZBJJzfnnrJQknblaBCXa/2LIkkMYjRYzZtvzIvI3gtsnr1S7CiNTVd+Mswn+xg2+
         8M6UQ/FSNnPaSse5G8LiVK875DOciRt6aYt4/qYtuXkNKynYpjviRdiruGXNiBYJh9vR
         jBiOEopB4nxwc8TUyzx0SBPOybBIiBBRC//uiAVHGo6T88kfma047yHythYSEZYISKOZ
         fLkG2zAeraaVLYes6TF9yhrDGEIljARUHD46i6gLeUGLFfXzWkavMHN6LQvp155hfoqn
         8KewOPa1HAbHahs0tKPfc8N3AHCp5CfvKKRwaSGFGfue7vr3Mpewp9Ox6wmoQGE5P9FA
         NByQ==
X-Gm-Message-State: AOJu0Yy3JYVfFpbuWjlUhyks8Pakf97j+U1P7DDfjTjBbaD9633Xn8FL
	7ZVBPgpPY29seBsWZYzANwrBhZz3xH63gZBfy1VbqnDeLpWs1kKuPbbkKdunbwM=
X-Google-Smtp-Source: AGHT+IHxS1+RAbPFLI5ItZKd1sI2ZXvV5S3L/s1ArZxM+sVNnpPAujJTaOL9mZNBaYROs53580hgFQ==
X-Received: by 2002:aa7:c0ce:0:b0:553:5577:dd52 with SMTP id j14-20020aa7c0ce000000b005535577dd52mr1349931edp.81.1705669544444;
        Fri, 19 Jan 2024 05:05:44 -0800 (PST)
Received: from [192.168.2.155] (78-62-132-154.static.zebra.lt. [78.62.132.154])
        by smtp.gmail.com with ESMTPSA id u11-20020a056402110b00b00558aa40f914sm10459377edv.40.2024.01.19.05.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 05:05:44 -0800 (PST)
Message-ID: <d6db40e8-c2af-44fa-b8af-b143899b262a@8devices.com>
Date: Fri, 19 Jan 2024 15:05:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add qdss_at clock needed for wifi
 operation
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1705486629-25592-1-git-send-email-mantas@8devices.com>
 <9b78a7c3-dea9-4d9c-bfd9-13d819d68890@linaro.org>
From: Mantas Pucka <mantas@8devices.com>
In-Reply-To: <9b78a7c3-dea9-4d9c-bfd9-13d819d68890@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-01-18 19:48, Konrad Dybcio wrote:
> On 1/17/24 11:17, Mantas Pucka wrote:
>> Without it system hangs upon wifi firmware load. Bindings already exist
>> for it, so add it based on vendor code.
>>
>> Signed-off-by: Mantas Pucka <mantas@8devices.com>
>> ---
>>   drivers/clk/qcom/gcc-ipq6018.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-ipq6018.c 
>> b/drivers/clk/qcom/gcc-ipq6018.c
>> index b366912cd648..7cdaf7751566 100644
>> --- a/drivers/clk/qcom/gcc-ipq6018.c
>> +++ b/drivers/clk/qcom/gcc-ipq6018.c
>> @@ -3522,6 +3522,22 @@ static struct clk_branch gcc_prng_ahb_clk = {
>>       },
>>   };
>>   +static struct clk_branch gcc_qdss_at_clk = {
>
> Hm, QDSS stands for something something Qualcomm Debug SubSystem
> if I recall correctly, so coresight and friends.. Are you sure
> it's necessary?
>
That's rather strange dependency, I agree. Yet, even manually disabling 
this
clock before wifi driver load would cause failure. On the other hand, 
disabling
it while wifi is already operational seems to cause no trouble. So it 
follows
that clock is only required during wifi startup. Since wifi FW loading 
is done
through SCM call, maybe this could be a Qcom TZ firmware requirement.
>> +    .halt_reg = 0x29024,
>> +    .clkr = {
>> +        .enable_reg = 0x29024,
>> +        .enable_mask = BIT(0),
>> +        .hw.init = &(struct clk_init_data){
>> +            .name = "gcc_qdss_at_clk",
>> +            .parent_hws = (const struct clk_hw *[]){
>> +                &qdss_at_clk_src.clkr.hw },
>> +            .num_parents = 1,
>> +            .flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>
> Does it need to be enabled 24/7, or can it be attached to the wifi 
> device?
>
In fact, attaching to wifi remoteproc seem to work fine. I'll send v2 
without
CLK_IS_CRITICAL if all else is OK.


Mantas


