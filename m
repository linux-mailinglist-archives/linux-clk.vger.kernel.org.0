Return-Path: <linux-clk+bounces-19339-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C921A5BDB2
	for <lists+linux-clk@lfdr.de>; Tue, 11 Mar 2025 11:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CA8918999F3
	for <lists+linux-clk@lfdr.de>; Tue, 11 Mar 2025 10:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BD823099C;
	Tue, 11 Mar 2025 10:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7JNpAur"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6023622F384
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688494; cv=none; b=FWGSBTzkxK+h8auhBtlhkvwM/EFP3A64GGvoDuqm/MhhDPr9UtIGboJq5tN7jHMatZfMwxGTBzaZqwx+JKGV+NnUChlLrASIDFGRmk7WsDhSj2qVTrcCEjY9zX+Tk2jxIZht15n3besAJyyoY6LIBqvqqGRuO/FtOo++/NhLFPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688494; c=relaxed/simple;
	bh=BYofU5pOtAloLhiVKItVqSVBG5/DdyfICMQeX5djgdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3IEiVH0cOAYHfGMAODPWM9uOisIfHcnDS0hF08AWeZknaKfqlx6za12+qEniyfYHDqIo1CKVmJcyEtAcQmQ3oJlImpZ8WYRl2fNUD/QxxbOLC5LykEgZhy2MzYe2PG7gSZPHo5D8PDZJ4gZApGTrqkjiPA/p34J0KgeXCDcUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7JNpAur; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7oOZs025285
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 10:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7n5kb0meLqOObw6J2RN17WUG8TdyIP5nBl657OVgohM=; b=G7JNpAur7Y47Mu50
	dq0osjexVVojOIcj/iqYin3SqoyqmrjwRFDSJKo+Kr1AHTL9GalkQZM2aR6JN74w
	0G1xEY/RILC8zKQheSGLy8keqIYOETk0QnkPdhPU6f6O873xct2Rc74OGX5zJ+Nx
	HErFva0kAMqVFsQiOntUnGuj6DzL//ycVEpTNuZOOtULo9ICGENwKuK60ws9C3Eb
	DJQaJAa/HbuKKlcA/XN+or79bQgOhynwtd557UM684Au8JuaA5c6jPhHMmfRG7Th
	Rt1cVBxol+C2noNRhKA0xc80rXMB1h8/EDiTbRVZRBB2dn5CwCzL8rLf5BTMWkcL
	1apWaw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah4t0ekq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 10:21:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fd4ef023so14490156d6.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 03:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741688491; x=1742293291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7n5kb0meLqOObw6J2RN17WUG8TdyIP5nBl657OVgohM=;
        b=JroK7OK/7IbrMACnWrp8i23nMyYn8qv/xycixL+s6Zo06/VNITxGXl8SZhUNqzOlIh
         VcySBrZ4A/ru33XpfgyoPOpbMl9zR0T878VyczAdRIVg2AEQjmBnhWpisJvgBHZRa6Fk
         cwISZ+P8vsB82sfTed4aYYhrjc0nXQr/zUFU41He4F/f1j4AkE07ALTI2bAWnN+t9QJP
         HpgmQDsD+rKuw+KmVmEOnlYsEdYMw2OkRvMTcM+NvUWp1jCeZbf/occD6BhgeQztJ+YB
         4ZrkNyD/GT2MYQw1d+y3UxZ9EFBGPDjyjqrct9A4q1b0pERaWcW6YzqA/Z1sdhX8za3w
         HGNA==
X-Forwarded-Encrypted: i=1; AJvYcCU9i+GaFePll+gzZMMv6NLWxJhf6/dW7SO/a36r7eOZE5Kxd8H8ptVIsoEHwUQl5iO8Fqmul+EXSjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/AWih4xghOr1P+2sNKzuN8dDGfno4e1N+3T0KhDHTNpehUvnd
	3iV0kLf2sX9FF5GUxyNWCHKHzeC3pKcsuMF87pczYmUoLKdZJnFLpTNo3YuOBy+QtxijK6vrAL7
	LnQ2oSm/80YSTfnxux1iIiK+vhUzwPkYrrGiqtlGg8YuDYSfviVCGuI1Ay1g=
X-Gm-Gg: ASbGncsNXUuw7tcfsE43In/oykMnP9LRy3hNT323jyUIUjeOi8YJVvx8vrXlXMMJ2gH
	BiLWe7BuCOi2HwcX4maSOOFx+LrAA5u6Gvj4dUFj077nfCpEyl4YOKkWUUXoTsZ0Qo8kcbw/g2H
	tVUEnKomxwhEewU8g8plSLmd0KYyF/zgzDpbcru4UKzfSK4GhNjl/v7oHtz5C3F3csuYIrbYm14
	kmZN9pPpwoPT4U7qa7by1hOKxkzap5hJfkdqCFQB0mpHwp8wjtHT9Oj5V21k1uhs3Dog0sA1pFr
	xpIxIR3veAK1qi9os1lFGNX7DkPnJSxe7chqsz6W5qqLcttRVBnM+XEA/6NSg09E3iF9uw==
X-Received: by 2002:a05:6214:76a:b0:6d8:e6be:50fc with SMTP id 6a1803df08f44-6ea3a68c0c7mr15047436d6.6.1741688491506;
        Tue, 11 Mar 2025 03:21:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcIQJO//UKzyBTgVyWSeQg4V2ARatRjDr52a4Y3G8uijkxkeKaY37pT2XPHYg1wRs+M0N1eQ==
X-Received: by 2002:a05:6214:76a:b0:6d8:e6be:50fc with SMTP id 6a1803df08f44-6ea3a68c0c7mr15047186d6.6.1741688491074;
        Tue, 11 Mar 2025 03:21:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2a385e16dsm288482066b.34.2025.03.11.03.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 03:21:30 -0700 (PDT)
Message-ID: <dd68a0f7-6549-476f-acb5-c2d9559950e5@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 11:21:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom,sm8450-videocc: Add MXC
 power domain
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <lpuuYz9cjRQ3qc_0ZqUQk6SgCgfQ-lSt77HDAxGxNN9oGAQqORCJR2-DVUNcGjyeCqn7QKuLsElBbNDRjGQ1IA==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-1-0cd00612bc0e@quicinc.com>
 <46b6dbf4-0d2d-4165-8657-7bd8a1329d61@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46b6dbf4-0d2d-4165-8657-7bd8a1329d61@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NR6oVP5cUWE4sQxUxrGZlQcx0Lnc84fS
X-Authority-Analysis: v=2.4 cv=fZ9Xy1QF c=1 sm=1 tr=0 ts=67d00eac cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=sSzQ2nv1RjrDmx6RhioA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NR6oVP5cUWE4sQxUxrGZlQcx0Lnc84fS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110069

On 3/11/25 10:49 AM, Bryan O'Donoghue wrote:
> On 06/03/2025 08:55, Jagadeesh Kona wrote:
>> To configure the video PLLs and enable the video GDSCs on SM8450,
>> SM8475, SM8550 and SM8650 platforms, the MXC rail must be ON along
>> with MMCX. Therefore, update the videocc bindings to include
>> the MXC power domain on these platforms.
>>
>> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index 62714fa54db82491a7a108f7f18a253d737f8d61..737efc4b46564c1e475b02873d2dc124329fb775 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -32,9 +32,11 @@ properties:
>>         - description: Video AHB clock from GCC
>>
>>     power-domains:
>> -    maxItems: 1
>>       description:
>> -      MMCX power domain.
>> +      Power domains required for the clock controller to operate
>> +    items:
>> +      - description: MMCX power domain
>> +      - description: MXC power domain
>>
>>     required-opps:
>>       maxItems: 1
>> @@ -72,7 +74,8 @@ examples:
>>         reg = <0x0aaf0000 0x10000>;
>>         clocks = <&rpmhcc RPMH_CXO_CLK>,
>>                  <&gcc GCC_VIDEO_AHB_CLK>;
>> -      power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +      power-domains = <&rpmhpd RPMHPD_MMCX>,
>> +                      <&rpmhpd RPMHPD_MXC>;
>>         required-opps = <&rpmhpd_opp_low_svs>;
>>         #clock-cells = <1>;
>>         #reset-cells = <1>;
>>
>> -- 
>> 2.34.1
>>
>>
> 
> The ordering of these patches is a bit weird with this binding first and then the rest of the bindings later.
> 
> Also switched my linux-arm-msm email recently so only got the first patch with my RB in my Linaro inbox.
> 
> Suggest as standard practice when you get review feedback to CC previous reviewers on all patches in subsequent series, especially if you are picking up an RB on one of those patches.
> 
> TL;DR please cc me on V3.

If you pick up review tags, running b4 prep -c again will CC the folks

Konrad

