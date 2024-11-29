Return-Path: <linux-clk+bounces-15101-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C45329DB244
	for <lists+linux-clk@lfdr.de>; Thu, 28 Nov 2024 05:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A302B2211B
	for <lists+linux-clk@lfdr.de>; Thu, 28 Nov 2024 04:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A4013B59A;
	Thu, 28 Nov 2024 04:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Up6jx4PR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF6E360;
	Thu, 28 Nov 2024 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732769156; cv=none; b=laQL4S/hZy9PTWpGJX8oU3CC19FCVB5x3nkLZgf9F9HXrZg1oPQFqJAf02vFYa/4qRdFs7gTsFyk2BqlNyb8jwnkn5YPhHK4ujaoX5DDGybnEl6gu22zeDqbm42PliK+pZZtZTXq0BjHBC2eUH0N5GmZVegGvYE0CrW0EzC1RwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732769156; c=relaxed/simple;
	bh=Nh/umBmDogP6K+8vOrQntqBkOwYJR9zftfW9Lv/r33A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=USG3XuDZvRalhzlTf8gY38TIi0E/49kCtH7xJxz6cBbbK5y3qFkcenCh5VHHE9W0dVKbo7mZS/XYpVfRQ7gU25EeKWg2ZxOK1yhETBUCKSx0kIfiIThe4tIbK6+nhbR8xX/5AED6cJ2HMQVqzaXV0LGRnKc4/+P18Tyk6sXlMVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Up6jx4PR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGRUNO018966;
	Thu, 28 Nov 2024 04:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJA0hZahYt3ouFeJrPPN50GKqvOKT7odLnSpABDr55o=; b=Up6jx4PRNz1yFAhm
	dfccQ2dvTepXsmUdV97mH7ktaZWxatxL0XVO6daOLv07uWQ09Z3/p72bkZHGj872
	gShTaHY4Tdk3XsmF3o0aKhELHcAmGHradCqeUF3lZMUQO5N8LNQH+ufh95ecP7OB
	EOKh57ZPjAq/wTbbkjSbqrYw/0LJjE0Ufg0LEnhZFXRDiNhXTl/Z/o6NsSdVOA2G
	wFzdDsw++gcl2Yt6ShF5+3pJpNt+cjPFgYCyWGvu6pkScfwo06nstgge0QU8LfaU
	JV85yy6a31WlqDJ1/4lUw80rcwQduERdi0PRmjqY0Ebo4cqU59wXtOD5m1RtvxkK
	2H1UqA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y01b1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 04:45:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS4jn72010111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 04:45:49 GMT
Received: from [10.152.201.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 20:45:46 -0800
Message-ID: <73506419-e53d-4f45-8056-811dad1c163f@quicinc.com>
Date: Thu, 28 Nov 2024 10:15:43 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 5/5] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
To: Bjorn Andersson <andersson@kernel.org>
CC: <sboyd@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_varada@quicinc.com>,
        <quic_srichara@quicinc.com>
References: <20240820055618.267554-1-quic_gokulsri@quicinc.com>
 <20240820055618.267554-6-quic_gokulsri@quicinc.com>
 <pdyy4zflklvi5syhwt3oklidq3mwizthds2td4qzglhhdulel5@337xsbehgdp3>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <pdyy4zflklvi5syhwt3oklidq3mwizthds2td4qzglhhdulel5@337xsbehgdp3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AQctSQfs-8J72bleLrV-MpC80p3cbkxM
X-Proofpoint-GUID: AQctSQfs-8J72bleLrV-MpC80p3cbkxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280036


On 10/23/2024 9:22 PM, Bjorn Andersson wrote:
> On Tue, Aug 20, 2024 at 11:26:18AM GMT, Gokul Sriram Palanisamy wrote:
>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>
>> IPQ5332 security software running under trustzone
>> requires metadata size. With V2 cmd, pass metadata
>> size as well.
> Documentation says commit messages should be wrapped at 75 characters,
> not 50...
>
> Please improve the second sentence here, "v2 cmd" is coming out of
> nowhere. Say that there is a new command with a size parameter added.
>
> Is this operation available on all targets, or is it IPQ-specific?
>
>
> I don't see the relationship between this patch and the cover letter
> subject "remove unnecessary q6 clocks". Should this have been send on
> its own?
>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>> Changes in v7:
>> 	- No changes.
>> 	- Rebased on top of linux-next.
>>
>> Changes in v6:
>> 	- Rebased on linux-next
>>
>> Changes in v5:
>> 	- Rebased on linux-next
>>
>> Changes in v4:
>> 	- Rebased on linux-next
>>
>>   drivers/firmware/qcom/qcom_scm.c | 8 ++++++++
>>   drivers/firmware/qcom/qcom_scm.h | 1 +
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index e60bef68401c..aa559fd01932 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -607,6 +607,14 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>>   
>>   	desc.args[1] = mdata_phys;
>>   
>> +	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
>> +					 QCOM_SCM_PAS_INIT_IMAGE_V2)) {
>> +		desc.cmd = QCOM_SCM_PAS_INIT_IMAGE_V2;
>> +		desc.arginfo =
>> +			QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
>> +		desc.args[2] = size;
>> +	}
>> +
> Please avoid default initialization and then conditionally overwrite
> parts of the values. Make a clear:
>
> if (v2 availble) {
> 	prepare v2 request;
> } else {
> 	prepare v1 request;
> }
>
> Regards,
> Bjorn

  sure, will address. Thank you.

Regards,

Gokul

>>   	ret = qcom_scm_call(__scm->dev, &desc, &res);
>>   	qcom_scm_bw_disable();
>>   
>> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
>> index 685b8f59e7a6..008b59cbad36 100644
>> --- a/drivers/firmware/qcom/qcom_scm.h
>> +++ b/drivers/firmware/qcom/qcom_scm.h
>> @@ -96,6 +96,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
>>   
>>   #define QCOM_SCM_SVC_PIL		0x02
>>   #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
>> +#define QCOM_SCM_PAS_INIT_IMAGE_V2	0x1a
>>   #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
>>   #define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
>>   #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
>> -- 
>> 2.34.1
>>

