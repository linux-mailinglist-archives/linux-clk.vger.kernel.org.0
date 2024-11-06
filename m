Return-Path: <linux-clk+bounces-14335-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1219BF5C4
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 19:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6F4B1F22633
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 18:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A726220A5C3;
	Wed,  6 Nov 2024 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eAHus6AP"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F74209F57;
	Wed,  6 Nov 2024 18:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730919073; cv=none; b=mjhYdpPlKMTHQmfcnUxtvGHVaqRF3c4JvWn0WjVKVBZMq7QL9JzJ7QebKnhlRGxeRB/YD0cr1w/mPGBwsnZsbER7E3SqsdIJPdsqKMP7wKyWqahAQsabdmz1WlJiVd5p7/qgT4Bh8RYlwpjrsdfBD/uH44E2eL7w7Bljqdjbx+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730919073; c=relaxed/simple;
	bh=rNV5yK4BcBpjeQ1Z2ShecGmi+JipJLJZbv2B4dnvGnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rbStjpRourlY2Ww8W+hfZ3ueuEH0eqn9DPoHnsFsBk/MWMb+SZdEvn3Qq84f3J4uP7rcJwbnJnB9BHjQt19vtP4HcPiaMmV8XxJNe+lwMAlowUTQSNWH6JWPozeORgJg8fw6Rd2aNZCQGCfLWDUyWmUeYN2Ul6rhsl1Flp8QPSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eAHus6AP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A67go0s028867;
	Wed, 6 Nov 2024 18:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FjvD3qX+EAPmeXpT7UbAYaWLeDhSrxmRaHTC9QU1h7Q=; b=eAHus6APjVEIJvhz
	RWodF6hoCg4EY4RSkKqYycPM9LxHZZh/HBgWGQvGTUV56ZKPxeadzq1FjgOH+BRC
	QuixY4NPDTKlnLmJtzJwh4xX6qWy52TeFUXrh7DR7e1Fs3xoM9rDrpOqbBhNbP8z
	x0KaVXd7M9xm4VlouTM+4jtyzixwA6D8X8aeFbX6husATZYS7gKsoahRVuBj8593
	gZr8iVmBMjzi4KCopEkdcWm9PQEQQUHYhtWjmzoawfB1d5PwYK0VYwoco7HLOqQg
	Ah31AZ3JEOEV5FB0C1++aNEMrEg4P3aBw92SU0JYmIXBIwzPwcy7qT3mA4o6oyDO
	waBoSg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd28c3h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 18:14:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6IEnZI013538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 18:14:49 GMT
Received: from [10.216.22.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 10:14:45 -0800
Message-ID: <6486448c-15b3-4c46-8104-e5c8c1b5ec2e@quicinc.com>
Date: Wed, 6 Nov 2024 23:44:41 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings
 for SM8750
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala --cc=linux-arm-msm @ vger . kernel . org"
	<quic_satyap@quicinc.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241021230359.2632414-1-quic_molvera@quicinc.com>
 <20241021230359.2632414-2-quic_molvera@quicinc.com>
 <l7bs5xhoddlwggdd2ufc5lc2d33zkm2ewguwnd4t3gste2gjak@4qmcvkututzm>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <l7bs5xhoddlwggdd2ufc5lc2d33zkm2ewguwnd4t3gste2gjak@4qmcvkututzm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R3X1VpG6yZBDGeZCJgSIn09czhsxFKQz
X-Proofpoint-GUID: R3X1VpG6yZBDGeZCJgSIn09czhsxFKQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=757
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060141



On 10/22/2024 11:46 AM, Krzysztof Kozlowski wrote:
> On Mon, Oct 21, 2024 at 04:03:53PM -0700, Melody Olvera wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> Add bindings and update documentation for clock rpmh driver on SM8750
>> SoCs.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
> 
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> This applies to all your patches.
> 

I will remove the extra "bindings" in the next patch and also cleanup 
where ever required.

> There is already CXO clock, so why pad is needed? All of these clocks
> come via some pad, right? Commit msg could explain here this. Otherwise
> it just duplicates the diff.
> 

Yes, I will fix the CXO clock and remove the newly added pad clock in 
the next patch.

> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

