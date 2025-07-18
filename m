Return-Path: <linux-clk+bounces-24900-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB0DB0A910
	for <lists+linux-clk@lfdr.de>; Fri, 18 Jul 2025 19:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B46651C2266F
	for <lists+linux-clk@lfdr.de>; Fri, 18 Jul 2025 17:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7C82E6D2F;
	Fri, 18 Jul 2025 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtPNppuR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9692E62B8
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 17:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752858409; cv=none; b=Y2oXUh/yVVL7b1xIkSA7rcKn0kIkl3QOnFkmlzQ28ruFrN8gmtXmrH44C8lzxaggGZmyYEg+QD0f8ahF5jah04SOJeAOoHoN/Bs33Kb5xToc9r1J0IcXfLndFX4HKi2pGXz/DJHvUql6tYnkxemnIWV5PN/UuTQejQJ68dU/xvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752858409; c=relaxed/simple;
	bh=+DY68w5ZNmT+VTpHTgPRVOK5a5ospGjPiJz62zw1bC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qx82W2hbSL1ix5TMaYKtP/labOXO9xRZR2gOkAAZkpPlUciLwD9HyqRchmH7wg8Sj+x4tLlZ8IWYtdb/+Ne5aZ6E9UD2mCSskWE7f8QjUUla4gjDcRXstOVtDUn77gfiyNjusAoRMhiRUaDTCjs15X79HfJmZ5iXBYnOtLXq0tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtPNppuR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IFtMxA028086
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 17:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vUfMJSGq73ZhN2Mdd4o8iq4iDMXCQpQz47NqFacc8Y=; b=LtPNppuRlpljDRB+
	7ENW6FqiASG6BFMKPAXEWzfokX3cmkanxm2ltmj/sGrkdVxbRUOdqsF7hAE53+Fa
	NGObv5q+71AxPd2yaGzcETuNCYr2jRLdhx8gQHE8+4gMZpQ3tjRleqJ3CFLwcINY
	cQp71QxTno2rwd0fDQY+fJrLsdUZNVkklDOMyk9XHD6a1rL9UnnuZP9zIHnIQ+AB
	5oKI/StVoKSBKV9wdEUNBJcBTIOXeC3rbBLBmquiX9PxlP2lHz32+ogsq5/X+g6Y
	iTlLtxB3iooW/FcCI4VGQxncb9GyuDXM8nNy0yV+6Bvm5fJ88aKhivOia7j58+HZ
	OyEzXA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh64kyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 17:06:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31cc625817so2568781a12.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 10:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752858407; x=1753463207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vUfMJSGq73ZhN2Mdd4o8iq4iDMXCQpQz47NqFacc8Y=;
        b=swesBxc5pMROmrtQdvrJ5fcsqp5G/ZHBr+y/SqGmGOHyEYXfbr96lbFqvjP9Kc3B15
         7vi9vzeHz/lyMhgKs9D4jSpEM28QXCm1YR7/+Ts+XJq8B5XJ72m2lrl6bG8R+lS+2mG0
         B58s9r36XfRIq7LX4vxHnapWBuCwo4AOQdlpUNUGZUkfo6x/wdiakPl4d1ENYoClB+oa
         9ePCzKd0ZOJtRgLMOCG0CrUdYqT8xhS3sdkzDJ9yeoubICXmPg8SgEPUsmX2YEVr89f0
         89afH9u8OdcoOuzFGsDYFkfGk1U43Fv8Dugt4DkwTN8PPrbz0GkP9qlrS/8qZj0xe3so
         o1AA==
X-Forwarded-Encrypted: i=1; AJvYcCWoghA65WHVn4ACdi2FBR9CfJFDb1x+SonoWD4F0+HMh2tZXYcV1N8kvxm4Wb9j0BpEHsXniBGtLv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1knNOcmE0aJyl1GUqZNKx3R9qCqSokDStQ/92SyVyizU/xTHR
	LvnAyc7B2fIa9potA0FTGBj5X2AZTP276SleZjsOXY4qmfRrSR8bPjZMQBhz6msDnOGYldv5Mcv
	Y7WcFW3ilxV2canlI6dwXhifnrvDI5EbphPIsI0OMnIeAa0SQEJ7nVJdkK/pSI/w=
X-Gm-Gg: ASbGncuS3jQREpctgZOUiigOuNV+gBZGAtWUqBfGfD9qU2lS/WVYh1Yn+hMVr5BMnx1
	4Id7Id5HBI1j+5PkNDHXM1xa3pLJT383jS4Rrnzei7veC9gWYx7c9a7MBxANQcMj4Jf/gGmd7J7
	MGAMxlFnxbjY4h+hIy4Q4bh0oSrFOBisBM+uJ6xLRBK31gxkgGCEkmeFUF8isPDImXcUpsqUuqW
	GqAgdwGYG6M27fivFojLt+1TAEaIDQXnxnwRivkKbnUNikQYyIiyNgGKAq4enDohEiwen5lhEzs
	WnNP7UeffxN/o8jfRtmYiWRMMURIoJKO47pMVt9hBo2AhZ32C64+8IE4U9yCFaV+FPA=
X-Received: by 2002:a17:90b:3dd0:b0:315:aa6d:f20e with SMTP id 98e67ed59e1d1-31caeb675ccmr11172880a91.4.1752858406643;
        Fri, 18 Jul 2025 10:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECNd4Acv4j/c4235fliuFvXE3ktSNudNK8CmPHlGkQnotpSNMV7ho5S5lABhdRD4LGMCNDEw==
X-Received: by 2002:a17:90b:3dd0:b0:315:aa6d:f20e with SMTP id 98e67ed59e1d1-31caeb675ccmr11172834a91.4.1752858406140;
        Fri, 18 Jul 2025 10:06:46 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.28.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc0be8707sm1455548a91.1.2025.07.18.10.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:06:45 -0700 (PDT)
Message-ID: <0057e05d-efb6-4114-9a3e-f1166a8e99a8@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 22:36:40 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] clk: qcom: Add TCSR clock driver for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-4-pankaj.patil@oss.qualcomm.com>
 <vawtojqbjrtoso4pjoza7vpaiog37hu6gbt7g6mmwbnmwladtx@ebh4amrwxwkk>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <vawtojqbjrtoso4pjoza7vpaiog37hu6gbt7g6mmwbnmwladtx@ebh4amrwxwkk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a7f27 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=tMiizUMu9hGndvLFPAJAbA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=n_IKRFwyw7e_LvP1qQUA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: s2TAQiZWIwIIlEXbLn-ckPwG6ObmFapa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNSBTYWx0ZWRfX0z47DhjB4jbh
 IAai3Mg0AOc0JlymdzCS9tPE3vbN5tXR/T4ffgw3pG1oxalhY5LTunMqmmWE2VFNZAYswBanDyh
 w8itjxiA0b2AjpihlwWoMrVw6+qvYLe6DdVytxwA9w6o5czwewZ6M33V93CCH0CIOtcwMrDs0pm
 36MEIUT5L3+r3I6mVMUYaOorGvW/DlH3eD5JVxy+Col7G2XXeah8o4WQMvDUbelNX9dakkMXWK0
 g05VGnjvQg3WA60nScaroDOMRZ13KKpYlval2DnoLlMrAlUCRFXquX2GWG7OzUA2mr4yIz2C8HD
 hDPruXP1hjiZ8jvaTd/eOK4BFfVy11TY1WFhIUSJD3wecH8VhLXuGryC8NEX6WOscW1N2oX4+i9
 spS3syPoM1NinLpDzYBIw2xnFpgZRbZ/DSQO7T9ruELCydgwf3RfgQQSek3BQEosDOi47F49
X-Proofpoint-ORIG-GUID: s2TAQiZWIwIIlEXbLn-ckPwG6ObmFapa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 mlxlogscore=958 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180135



On 7/16/2025 9:05 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 16, 2025 at 08:50:13PM +0530, Pankaj Patil wrote:

>>
>> +
>> +static int tcsr_cc_glymur_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +
>> +	regmap = qcom_cc_map(pdev, &tcsr_cc_glymur_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	return qcom_cc_really_probe(&pdev->dev, &tcsr_cc_glymur_desc, regmap);
> 
> This is just qcom_cc_probe();
> 

Will take care of it.

>> +}
>> +
>> +static struct platform_driver tcsr_cc_glymur_driver = {
>> +	.probe = tcsr_cc_glymur_probe,
>> +	.driver = {
>> +		.name = "tcsrcc-glymur",
>> +		.of_match_table = tcsr_cc_glymur_match_table,
>> +	},
>> +};
>> +
>> +static int __init tcsr_cc_glymur_init(void)
>> +{
>> +	return platform_driver_register(&tcsr_cc_glymur_driver);
>> +}
>> +subsys_initcall(tcsr_cc_glymur_init);
>> +
>> +static void __exit tcsr_cc_glymur_exit(void)
>> +{
>> +	platform_driver_unregister(&tcsr_cc_glymur_driver);
>> +}
>> +module_exit(tcsr_cc_glymur_exit);
>> +
>> +MODULE_DESCRIPTION("QTI TCSRCC GLYMUR Driver");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.34.1
>>
> 

-- 
Thanks,
Taniya Das


