Return-Path: <linux-clk+bounces-21066-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B3A9D17B
	for <lists+linux-clk@lfdr.de>; Fri, 25 Apr 2025 21:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFE894E4113
	for <lists+linux-clk@lfdr.de>; Fri, 25 Apr 2025 19:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC4621ADC5;
	Fri, 25 Apr 2025 19:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4RMZY/Y"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44C21ABB7
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 19:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609173; cv=none; b=KhbL4VGEZvrVK6jDjhSh60eR6/1FZ4noR4yddleqIrgGhok0BP5RL252dYRu9jmkPKSUMd+1Z2aL1a79hxKHu06NZRYKE+8niQPwHvLeamD+0f9VJRgpZbDQKPxp2Y+N+Qqyzf0sUmEIeNc9MjTQ8iYLoYu86YaTsXC+hjMLIlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609173; c=relaxed/simple;
	bh=x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKI5gZKNWM9hmbx+HFbZ0gwBHdXNdL36HscbbtQT+qZQoqbm2pqDdoxNt9GFWwCCOmZz0LwLcL04iOLZfKGFWQo63F4ce7whlbPSULn0ckqMntaEDDu+1C6rxpz4NG0hR1iW+i0N17hpmE+bHj6ENc4OES3GDTa/zmOcjH7aGXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4RMZY/Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrV4004665
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 19:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=; b=D4RMZY/YHGrtcRQw
	lVQYHp18r3mZtZ9ZsHHzxGCjgDID+iqFkDbxU4b+CzOWpSPob5qovR9UtF2y7i04
	Q9TyAar5JYujyG1OjGF0BmcsCIL2fQb0lY2c6ingVPmIh1p1CWFFVK7UuplXnaX9
	cbAbCc1ysortnRatYOjDgV4WedQXvO4/8SVgtuaviiWgw+VYspu3a7MYpDky3jKG
	MubdZPAed2QbA/CzjjVmfbfKOfTHHL75UC+ZznfpyoYZqoNunvuf8rJIezSTMtqB
	ke0u5kwSASdhQK7+3c2IforuyCKPF35xaWS7UECVzKKBxIliPe9HkLjWMHOLdsU1
	wFD1sA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a4cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 19:26:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47983a580dbso5994091cf.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 12:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745609170; x=1746213970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=;
        b=E6N7+hd+g1HORHt7beypSenUPjrlLkSloR7ZYiyQPpTd8weuUzBW/EyrtAf281XnCD
         D0sLntFdoUkEs/M9CYe8WtV3MuL4tV7ypW0kis+1+76j757JCNdzDWZG/0IILS6fe9Do
         Rl8yBIQ4oZMEPPnDci0/UyAdMbut4EGhVXa6ICnAbXemrvYQ2jMrTZ9Rb4mCPKC8JUDI
         cWt157sLi+L3bI2UaSmEak19FTa2lBVssa7KfVoANLjKTx8QnkY/hwWPIx/57noopU24
         OBBw83xp6UiGuKpWvEDsX1K7tIEJcI1PDJL02i9vcmmTDleAy7w9ZOwA/ucw/5z+Mx9e
         UTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg/5176ngM3rzShq8IkZ72gjsdXqVCdbTYx29WQVKGr0myAqwD1uR5PSjhXQpFeGTHK3XPl920hRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiYK5c5vLNEprb7Y4HfPLtysh6HK2GvnPPOmFJ0W1iTK1ltERX
	3PEplIxl1p5sMIsEKnmm+ChccOfz0cEnvKMJ6JxjTTY5zg7NWhRHThYslWikTAiS0MV9Mlzimty
	qd05mRySEeLSXqanI8ZQqdEcEcpT2qE47rGCiSSV8jIqwX9Gs5EYozBrH2vE=
X-Gm-Gg: ASbGncsRWsuBWVm+ejfDOD1Dam9gWgqEdSFUOq2/35YVjIxRbjhueMwNOFPPh6bbl/U
	OMYZNayAdtkMldk+iP5ZhLl/0gLXjcvASUBOG3YyIgSFjYyzN3unCZRcusYqkAlmsN/a1z5pHTy
	ohSiHua25BYCv4ZPU2eJw0Ht1B6seYy6ds2Aq8pO5pBrCqqJ5+yEpFNi6o50C0EVF3Xm4lMY+mp
	Vsc4BKEfio33F/IGCa9I4TSzxBVEycRRHZXTxIUVSo2O8eqwpp3mz9buZvjtrvpAfJtsV04aX8n
	log7FuKdwHfnrjYBTcDWkdbc+KQov06xFVQO4qgs53BNkNNANBzp6rb81IAfm9YYEqQ=
X-Received: by 2002:ac8:5f94:0:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-4801e0172e5mr21297831cf.10.1745609169928;
        Fri, 25 Apr 2025 12:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq2r9L2pHOoYHGaxcw9IGqNIifgrl5bAlz4s9wksJ/7yXxAXtbVK+GxNShhVnzb9jvGPXJzw==
X-Received: by 2002:ac8:5f94:0:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-4801e0172e5mr21297581cf.10.1745609169507;
        Fri, 25 Apr 2025 12:26:09 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf7397sm180940066b.92.2025.04.25.12.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:26:08 -0700 (PDT)
Message-ID: <68e2c0ee-d5e2-40fd-9ca0-262ed3270628@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:26:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
 <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
 <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
 <5ccb39f9393b44761127717096a38a46@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5ccb39f9393b44761127717096a38a46@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzOSBTYWx0ZWRfXzHpfLTJ/9pRR a872NIQxZljgH9zG8uznBaa5JE4mDirLU4vihjAjQ+JaAS+Bd/jRK3C2xekIZtedXnaxbHt+v5C imvcCCy31o80ttJSzVivuo12UTdZ1nAeJ//lqIZr+LTDWYdwKVb8H5E2CMKt5NH7OqxV/lbtQlZ
 Tj6nQalk0GaowpnotLAdRZsXkUnGyCUgbpchFoQi84I598dlSi2mQiHbgRlB8QEyTMgXdOmJ/Id 786W5cDspQW2jkH1dUrw1dnfAp4p75/aoVZ9kPPblfKKhMhNo7m4ysqw7uXO3K5B6rA+4donOn0 kVC5w9FnR1m4epr/3ACygRm4RtKQm3om+hB1u1Ejlc1UOyyzsZyOEeha49JRT4yKU8zes6JNvs/
 3vH9kmdBRe4/S102wpCkbcNAf985X44KZ+g9M1vK8LnlDIAlg0YYN13YLXb/bLghvACfFwIu
X-Proofpoint-GUID: eZFa1_kPXDV2sGdMx60fN8N5T4tE-HVn
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680be1d2 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8 a=uxr0c4oy3NFgYiDcH2kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: eZFa1_kPXDV2sGdMx60fN8N5T4tE-HVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250139

On 4/25/25 5:13 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-25 11:57, Konrad Dybcio wrote:
>> On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2025-04-23 16:03, Konrad Dybcio wrote:
>>>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>>>> From: Dang Huynh <danct12@riseup.net>
>>>>>
>>>>> Add initial support for MSM8937 SoC.
>>>>>
>>>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> ---
>>
>> [...]
>>
>>>>> +            gpu_opp_table: opp-table {
>>>>> +                compatible = "operating-points-v2";
>>>>> +
>>>>> +                opp-19200000 {
>>>>> +                    opp-hz = /bits/ 64 <19200000>;
>>>>> +                    opp-supported-hw = <0xff>;
>>>>
>>>> The comment from the previous revision still stands
>>> If i remove opp-supported-hw i will got -22 EINVAL messages and the opp will be not fine.
>>
>> Right, I have a series pending to improve this situation a bit..
>>
>> In the meantime, you should be able to define the nvmem cell and
>> fill in meaningful values for this platform
> As I wrote in the previous revision there is no nvmem for GPU on msm8937 only on msm8940.

This seems not to be the case

https://github.com/penglezos/android_kernel_xiaomi_msm8953/blob/pie/arch/arm/boot/dts/qcom/msm8937.dtsi#L2046-L2191

Konrad


