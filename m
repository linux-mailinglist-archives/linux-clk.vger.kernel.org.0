Return-Path: <linux-clk+bounces-29428-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0969BF1669
	for <lists+linux-clk@lfdr.de>; Mon, 20 Oct 2025 15:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A95DB401D9C
	for <lists+linux-clk@lfdr.de>; Mon, 20 Oct 2025 13:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1010311592;
	Mon, 20 Oct 2025 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZvP4bzob"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D862E8B62
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760965226; cv=none; b=qhK++yadQgF7vGTYtdKqZ/Zb0xdebyTzRGM9DGRg1tolspkYewbOGi/9Nudrzm63nBRXPWkOU1uuHiC2kjTtudXT48SWPDPoZY5lp7Tw6xHLsyxdkR7PnTFaJklvDrBnUoOEvaBLzSMIoCIJm85X7ab8hQQimYeSqOzixrvUEc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760965226; c=relaxed/simple;
	bh=8WkbNdMuBq7DpnVFLltNV+aBM21EVH5APcxMppriAT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGQoxdo5E5BEYcz8EvQZlNXuQSeeYSoN8YSHdfrChQPz+aG2VKs8X7KBkVhLaUdDYS/EI1C6AuH2R72i0iiYsG1PwblXNYAcQv7ueDVepWCQg6dqhTh5mmdRCVyBIFVq/JZq0vxz9IhjNtVsdU7bEXKPczGDI/TGz9BeDVkHmN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZvP4bzob; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso7391944a12.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760965223; x=1761570023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3R4NouHwR2gJkgcsNlR57aYLjQ4OTHNFMDfpxlNGqaQ=;
        b=ZvP4bzobdSik1ScG8uFeYmTGBzPUq/7WRtdLcQsje+O6t3ZhmS2uSLbRrEJiSt90s+
         520swG4nTipatEdgbx2Dua6oxlYspNcO7D2iGKIYGdKuhw3iwxBQI/lRAniaUja5d0uO
         Nx6Cn2v3Yp9+fpf8BtftWzGaDLxCmm73+I8Og4dpwodMZJm6Jl4KR5uvxo8mqJToc64y
         rmj9HKx0BoeU0l8Yy9mjoDR78vw12yqTYLmZCS0VE/1ih2cz+j47E/CsusJN/TsFl3TF
         BU7zQQZm9wvIxfgH5Spdfj5R+LziutJwRBZvlvPoM30EjgUlvoQD/Ak1C0XpGkdO1KxY
         NSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760965223; x=1761570023;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3R4NouHwR2gJkgcsNlR57aYLjQ4OTHNFMDfpxlNGqaQ=;
        b=sNnQ7L0s2Je3bvwv1FLQ7Ctg3A7I408VE42LXhL5paU/SY3VTKv5ixUmCBS0gGhp4j
         t35EE55GNjHBg9F22iQbNuPwR0lfYsIxbZx9XMeUdlPlLmPzTzVJ2C3wNZJYizzvBKkP
         w5W4iO4RN5I9qP1DI29HKyD6TPHTtnadFNNYRStNx5dzFRirAswDKegC3ZuPGzGUmyWh
         3lbZim4ZCh5mGfbIOhpEgz1mV8ZYzorFBx5d6wCOM1cjWI81c51AKLYJdFXDXMGRjjK/
         HtNiy+3ElISuOTWp7qjGe3gUZOiSvNAFvRzwoaAID9FlGKeMvvBRVdLoO7gBe6uIkfI2
         WblQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVnQYkm7XqPX530p9XiCZgxx92qB4uep8XaqbHCRfCAfumUQzsdZ2Hcvcc8Lo7fwou0shYYB4FR84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8+2+1mRt2ISzIrXKPTGT1vDRZRcYPU+Gg5vRpyKimuhttWSqx
	+ikdFgxMD37DBZpZaors6mkY/BlCGgHV+GG9H3BtHUOWaFfS2WV+PbCmANcav4taiPo=
X-Gm-Gg: ASbGncspPi6SOfg2gHzbbVak3PMSrUUvXUmuuD1NQhCXRiE8fQBGOnFoU38u6JKD1H2
	bip5tN9cijH2qQupxZI5RYAirnlQiYXB9ueH5luGFIrumvBUNfAqaMbDv1ffYoiuIYtX54jT2JE
	GihAABSeeKhimSdtBFz7LdZenRPnEmzKO/NG143oPiSPdnvBxovLrlBRObeKwXa3aV5hP8042tq
	ZolHAbWWP+kyPqvyMw+rMyQw7PFjT+bP2PhHN6V9DcrENzH3umwyztZor9omaITkE7oFssOzXSR
	UYsS4fEyRj4eRB41mTBII24zPLDDpim0mNle4uMUZaIFeNRq2Q4lEV8UvlI/DyTi1yhf6z4WI4g
	W3pQDbSnVrtxyk9lBWXszVUcsgN8IeLLtM7ihZ9BtC4s1USxp0Nt071IrGqpN3e/yYCBgBU+iAi
	sSzkRNSl5Nnm/zVb4cHOSkFMCgYTBmEuXK+5AFS4YJbKLZwiXM1+OrnA==
X-Google-Smtp-Source: AGHT+IGayW9zCBqvq6aXXWQ9uRWB3OMkgLybK2vzPwD7fbUYhsxu/O7OcSb2DNq+M/Bi8PvU4VO76A==
X-Received: by 2002:a17:907:3d91:b0:b55:befd:8f8d with SMTP id a640c23a62f3a-b647500ec03mr1649485166b.57.1760965221397;
        Mon, 20 Oct 2025 06:00:21 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb9523a7sm803891966b.71.2025.10.20.06.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:00:20 -0700 (PDT)
Message-ID: <a3943a95-b232-4534-bd70-6d1bd405c4bd@linaro.org>
Date: Mon, 20 Oct 2025 14:00:19 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
 <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
 <85bf3468-24bf-4f14-afcd-28878ad84dc9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <85bf3468-24bf-4f14-afcd-28878ad84dc9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2025 13:21, Konrad Dybcio wrote:
> On 10/17/25 4:05 PM, Luca Weiss wrote:
>> Hi Taniya,
>>
>> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>>
>>>
>>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>>> Hi Taniya,
>>>>
>>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>>
>>>>>
>>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>>
>>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>>>>>>> domains.
>>>>>>>>
>>>>>>>> Are those really required to access the registers of the cammcc? Or is
>>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>>
>>>>>>> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
>>>>>>> not on any SM8450 or SM8650 powered board for instance, however it does
>>>>>>> not exclude an option that the problem has to be fixed for other clock
>>>>>>> controllers, but it's Qualcomm to confirm any other touched platforms,
>>>>>>
>>>>>> Please work with Taniya to identify used power domains.
>>>>>>
>>>>>
>>>>> CAMCC requires both MMCX and MXC to be functional.
>>>>
>>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
>>>> need multiple power domains, or in general which clock controller uses
>>>> which power domain.
>>>>
>>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>>
>>>> That'd be highly appreciated since I've been hitting weird issues there
>>>> that could be explained by some missing power domains.
>>>>
>>>
>>> Hi Luca,
>>>
>>> The targets you mentioned does not have any have multiple rail
>>> dependency, but could you share the weird issues with respect to clock
>>> controller I can take a look.
>>
>> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone 4)
>> again, but again hitting some clock issues.
>>
>> For reference, I am testing with following change:
>> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir.zapolskiy@linaro.org/
>>
>> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sensor
>> on this phone - results in following error.
>>
>> [    3.140232] ------------[ cut here ]------------
>> [    3.141264] camcc_mclk1_clk status stuck at 'off'
>> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>
>> Checking the driver against downstream driver, it looks like the RCGs
>> should be using clk_rcg2_shared_ops because of enable_safe_config in
>> downstream, but changing that doesn't really improve the situation, but
>> it does change the error message to this:
>>
>> [    2.933254] ------------[ cut here ]------------
>> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuration.
>> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:136 update_config+0xd4/0xe4
>>
>> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK as
>> iface clk, could something like this be missing on sm6350?
>>
>> I'd appreciate any help or tips for resolving this.
> 
> Is CAMCC_PLL2 online?
> 
> Konrad

Usually if you can't switch on a clock its because a power-domain is off 
or a GDSC is off.

I'd guess one of the power-domains is missing.

Looks...

@Luca Is this actually right ?

camcc: clock-controller@ad00000 {
          compatible = "qcom,sm6350-camcc";
          reg = <0x0 0x0ad00000 0x0 0x16000>;
          clocks = <&rpmhcc RPMH_CXO_CLK>;
          #clock-cells = <1>;
          #reset-cells = <1>;
          #power-domain-cells = <1>;
};

Isn't this clock controller missing at least one power-domain ?

camcc: clock-controller@ad00000 {
          compatible = "qcom,sm6350-camcc";
          reg = <0x0 0x0ad00000 0x0 0x16000>;
          clocks = <&rpmhcc RPMH_CXO_CLK>;
+        power-domains = <&rpmhpd SM6350_CX>;
          #clock-cells = <1>;
          #reset-cells = <1>;
          #power-domain-cells = <1>;
};

Hmm but CX should already be on realistically..

---
bod

