Return-Path: <linux-clk+bounces-8041-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9516990797A
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jun 2024 19:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C33B1B241C5
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jun 2024 17:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA19149DF0;
	Thu, 13 Jun 2024 17:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RPZSb7cC"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FF912FB0B
	for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298776; cv=none; b=q5Rn0WIUMqy/Xiaj71L+2I74k4dnSR9Ap4PP5lWlzfBgBeEkBrL7H3pQvEBcTe6XlRmylshbuRcePBIYAKhllubDy20NomD8JQAxLEL9YhUyUS0JC7btRkCzWo7MJh55BONhAtpHTWMZx5Zl8OOeYJ+yhxpnuGK9HDXbfl18+pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298776; c=relaxed/simple;
	bh=jYS09S5Oa7ggVzZ5x97A8Tpx43uN/yGAWNqe0aTyZrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGJX1EMAwPkqOOqJqYJ06OWXSOExRB4hw3RoOhF1nLdpP3HQ3Ec1YhtHGNb2c5ZdNj2FPC5Lz9WrCgMvo3DExkriTdUpb6eZcKmgEzbzpk94Ih2otKPY76IHm+IN6+lOwxmIbI62CYXag0mcCxhGaLsnEB27T8rrTorMXtAgRMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RPZSb7cC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c94cf4c9bso1562055e87.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 10:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718298772; x=1718903572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zS0XCjGaIqSnVC7HEUFKa8clFQn0YY6tNYIAXUHVj1g=;
        b=RPZSb7cCza9qzEQONpHy84lZt490DLOhEWSuZ4VJkuox4gg9TcOlgMmkzigqSGMiHK
         WSC7cQdInb5BbFV3rQelvFa/2KAqTTyKQJAQwl4k64vKda0s6Ll/zGkY0ei4wIwypmAf
         CfS8fBH8az+vk6OTIAqqYDiaDB9BiuI+6aJkNRsiYrgrKNVP/On5fLSPkSrJ9CyKRV41
         Pmx+8uThO3qymklXJtv0LkdoLdI8Qq5aBOiMuOfkieRgq09KAkSbGiBp4dAvgSnRRogy
         pVbQF9bh9El4VAVgk7SoEwlHN0ePLQeOUjvgoh89jkCWV6qSBsDiY6+RNJCRZfMvr23I
         MdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298772; x=1718903572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zS0XCjGaIqSnVC7HEUFKa8clFQn0YY6tNYIAXUHVj1g=;
        b=UwSTgAipr/7VLHXpgBPEQQiK78y3ig7JgV/sUJzaR4e0eUMxZR1tHWi3x5xu9RoJgS
         /u4+/QvKIKNAWQ/B24lEpIgLxjKBHw/4M5rwvT1YAHQPcjBl+AheqPakx2U/j3XgFMW6
         kSMp2jzEd+HAfueHwIT/nOPkTmjDNSSwd0UEJ8XiQ1yNKiv7JJBV7eLLDlcPn2IIC1cN
         CHxR3Vr58BKsuiOHnBgNalbM/s6yHV5716uay3mvoBXLWNxxTmb8lYAxATdt4PjVeN64
         m/o7vHJslB+hrZ0iRXK5xLj5Fgjc95JvnzEfVgOXqTAI1sQMF4qdFYKWn0XtyDMiV8Ro
         IBwA==
X-Forwarded-Encrypted: i=1; AJvYcCXauCw3e5zJTcHaNhxECLgwHyrRs76lUtUJIgTrPajdMFNFqdHQ5hzCHnULR6tTTfvnJziDn/+8wUkfivPS5DDk/cEMNtX/D99N
X-Gm-Message-State: AOJu0YxFT3CSefhK5hwSPCrD/kpqih5UbUUtqXM2LirhgTFCWJ+cajhU
	GlwgzbOZPCctWFo9YS6UR0k5XPWvB5yRA7mt9Mis6HFMutRLyqo6U+XgpAn3mm8=
X-Google-Smtp-Source: AGHT+IF4DIs4yhHUEegeNOQkPG9w6vChfQrknP91suHvlg4dqlOE2J30dzXQXAoFdscFI/jeF3qEmA==
X-Received: by 2002:a05:6512:5c9:b0:520:ed4e:2203 with SMTP id 2adb3069b0e04-52ca6e562bfmr302107e87.8.1718298772485;
        Thu, 13 Jun 2024 10:12:52 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76? ([2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825858sm292425e87.17.2024.06.13.10.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 10:12:51 -0700 (PDT)
Message-ID: <514cd1cb-4fb2-489d-bc4b-d332fd4d381e@linaro.org>
Date: Thu, 13 Jun 2024 19:12:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] clk: qcom: gcc-sa8775p: Update the GDSC wait_val
 fields and flags
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, quic_jkona@quicinc.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-3-quic_tdas@quicinc.com>
 <9163bc46-983f-4d5a-b009-c12ddd5a5c8a@linaro.org>
 <e6eb1eb3-1130-41ec-bae9-25dad6d22bdc@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e6eb1eb3-1130-41ec-bae9-25dad6d22bdc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/10/24 10:57, Taniya Das wrote:
> Hi Konrad,
> 
> Thanks for your review.
> 
> On 5/31/2024 6:52 PM, Konrad Dybcio wrote:
>> On 31.05.2024 11:02 AM, Taniya Das wrote:
>>> Update the GDSC wait_val fields as per the default hardware values as
>>> otherwise they would lead to GDSC FSM state to be stuck and causing
>>> failures to power on/off. Also add the GDSC flags as applicable and
>>> add support to control PCIE GDSC's using collapse vote registers.
>>>
>>> Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/gcc-sa8775p.c | 40 ++++++++++++++++++++++++++++++++++
>>>   1 file changed, 40 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
>>> index 7bb7aa3a7be5..71fa95f59a0a 100644
>>> --- a/drivers/clk/qcom/gcc-sa8775p.c
>>> +++ b/drivers/clk/qcom/gcc-sa8775p.c
>>> @@ -4203,74 +4203,114 @@ static struct clk_branch gcc_video_axi1_clk = {
>>>   static struct gdsc pcie_0_gdsc = {
>>>       .gdscr = 0xa9004,
>>> +    .collapse_ctrl = 0x4b104,
>>> +    .collapse_mask = BIT(0),
>>> +    .en_rest_wait_val = 0x2,
>>> +    .en_few_wait_val = 0x2,
>>> +    .clk_dis_wait_val = 0xf,
>>>       .pd = {
>>>           .name = "pcie_0_gdsc",
>>>       },
>>>       .pwrsts = PWRSTS_OFF_ON,
>>> +    .flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
>>
>> I have some old dt for this platform, and it doesn't mention the downstream
>> counterpart flag for it (qcom,support-cfg-gdscr), so please double-check
>> whether you really want to poll gdcsr + 0x4.
>>
> 
> Yes, the older code did not have the cfg-gdscr updated in the DT, but as per the latest discussions with design we have concluded to use the polling of GDSCR from the CFG register on all latest designs. We added the support in the latest DT as well to support for 'qcom,support-cfg-gdscr'.
> 
>> The magic values I trust you have better sources for, the collapse off/masks
>> look good.
>>
> 
> Yes, these are the Power-on Reset (PoR) values which the current GDSC driver overrides in gdsc_init(). The GDSC driver for older designs needed these overrides from SW, but the newer designs did not want to make any such changes.


(something may be wrong with your email client, I never got this mail
and only noticed it on the mailling list :/)

That's.. not good.. We should not be randomly overriding these configs.
Do we have a timeline / last known chip where the "older designs"
stopped requiring that explicit setting? Maybe we could turn it into
an opt-in flag and set it for such platforms.

Konrad

