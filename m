Return-Path: <linux-clk+bounces-8155-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ED590C819
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jun 2024 12:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1F561C22B7E
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jun 2024 10:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCED81D2A3D;
	Tue, 18 Jun 2024 09:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MNJEuFqX"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C98113B587;
	Tue, 18 Jun 2024 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718703297; cv=none; b=kHV4JTW7jv/5g2eyCn2fOXVzJTubXxxTCG+ShVU+65hxlLxjWNAfE0PAqyFZ/Tr6xCD7818xCIHcIPPDrjAtbVa4F/LMOEX7pTeJhtfwB2lqrNG06ayxZj8h2gkSnmvR/DeMxgyz46qXoz4LIchTYksctcLjJ1FnYCtU376E1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718703297; c=relaxed/simple;
	bh=OkAo6EIj92wKJXQtVAueFl/of18+ooI9LN/LRMNUFT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NJ3TmB2XfmJvHucysTTgkQiKFrj9qZkRZact6nU1gElA6mLAWU+5MvTlE0a86arBOOP+tMDYzpgwqcI2s5oOtBWFmosBF2SDsbm0QJbV3okzThMOFEb+P63jfdjxBnshE+7taoYfq021KTbEzSC/NrfwmG5JPPUtuGGFzVygCLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MNJEuFqX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I37ooU018347;
	Tue, 18 Jun 2024 09:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4RP1l8jk2w2WRZlbBbGJ4pmrEVkuCZtj4kNaPexCg7c=; b=MNJEuFqXexvu8Qcn
	AcU/C02rVrb2YHj9yf0YRNXb+ylxfqfLBWrbjnSEUds1vrlQiLZyumCuxNjkTL4r
	Fhw8osCqP+0uTEGipo+oY6n8mjCgu/nDyVyfgn1kNhWvLlYWWR9eDM0oJkld7eBC
	wppvTWcWRznHOGRczUUvZQpflLIet9DoMEuKf/zxxnetb4b2t6LaKUDmma9/nUUJ
	I8FNNwyEpSQc6ORxkS+hKuQU3KJUKXs0mp0o6veNtZpXxFzI1Hwpm7EPUeJ1Qys7
	vA3c/usOTp1VWJy2CZrIjw4QuDQNF7Vfja1D2X0rYPYp+e0U/Bt6IKY4wVL8l481
	rJ68XQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu22grrrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 09:34:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I9YjTI019073
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 09:34:45 GMT
Received: from [10.218.5.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 02:34:36 -0700
Message-ID: <caedb219-f412-4511-8c92-90e87ca9a0f4@quicinc.com>
Date: Tue, 18 Jun 2024 15:04:26 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 RESEND 5/5] venus: pm_helpers: Use
 dev_pm_genpd_set_hwmode to switch GDSC mode on V6
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Ulf
 Hansson" <ulf.hansson@linaro.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Len Brown
	<len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Andy
 Gross" <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20240413152013.22307-1-quic_jkona@quicinc.com>
 <20240413152013.22307-6-quic_jkona@quicinc.com>
 <5c78ad52-524b-4ad7-b149-0e7252abc2ee@linaro.org>
 <b96ef82c-4033-43e0-9c1e-347ffb500751@quicinc.com>
 <a522f25f-bb38-4ae1-8f13-8e56934e5ef5@linaro.org>
 <dbd1b86c-7b5f-4b92-ab1f-fecfe1486cfc@quicinc.com>
 <621dbaaa-6b86-45b5-988e-a6d9c39b13d7@linaro.org>
 <d36c1163-a3f0-4034-a430-91986e5bbce8@linaro.org>
 <ef194e5c-f136-4dba-bfe0-2c6439892e34@linaro.org>
 <d2e55523-f8fd-4cbe-909c-57de241107e8@linaro.org>
 <1df48a42-3b4e-4eb4-971b-cd4be001ba27@quicinc.com>
 <93a67151-02fa-4c53-8d6e-0ed1600128bf@quicinc.com>
 <01041302-120b-4f9d-87f2-bd841dcd227a@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <01041302-120b-4f9d-87f2-bd841dcd227a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gt_jisChldo_9sVlyTERCw_uv13ANvua
X-Proofpoint-GUID: gt_jisChldo_9sVlyTERCw_uv13ANvua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180070



On 6/17/2024 3:21 PM, Bryan O'Donoghue wrote:
> On 17/06/2024 03:31, Jagadeesh Kona wrote:
>>
>>
>> On 5/31/2024 5:26 PM, Jagadeesh Kona wrote:
>>>
>>>
>>> On 5/10/2024 6:31 PM, Bryan O'Donoghue wrote:
>>>> On 01/05/2024 10:14, Bryan O'Donoghue wrote:
>>>>> On 30/04/2024 21:01, Konrad Dybcio wrote:
>>>>>> On 24.04.2024 11:50 AM, Bryan O'Donoghue wrote:
>>>>>>> On 24/04/2024 10:45, Jagadeesh Kona wrote:
>>>>>>>>
>>>>>>>> Thanks Bryan for testing this series. Can you please confirm if 
>>>>>>>> this issue is observed in every run or only seen during the 
>>>>>>>> first run? Also please let me know on which platform this issue 
>>>>>>>> is observed?
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Jagadeesh
>>>>>>>
>>>>>>> rb5/sm8250
>>>>>>>
>>>>>>> My observation was on a previous _boot_ the stuttering was worse. 
>>>>>>> There is in the video capture three times that I count where the 
>>>>>>> video halts briefly, I guess we need to vote or set an OPP so the 
>>>>>>> firmware knows not to power-collapse quite so aggressively.
>>>>>>
>>>>>> We seem to be having some qualcomm-wide variance on perf/pwr usage 
>>>>>> on some
>>>>>> odd boots.. Any chance you could try like 5 times and see if it 
>>>>>> was a fluke?
>>>>>>
>>>>>> Konrad
>>>>>
>>>>> Sure.
>>>>>
>>>>> The first time I tried it, it was much worse.
>>>>>
>>>>> The second time, captured in the video is only noticeable because I 
>>>>> was *looking* for this specific error i.e. I don't think I would 
>>>>> have noticed the error on the second run, had I not seen the first 
>>>>> run.
>>>>>
>>>>> I'll find some time to do 5x with and 5x without.
>>>>>
>>>>> ---
>>>>> bod
>>>>
>>>> ping bod please remember to do this thanks
>>>>
>>>
>>> Hi Bryan, Could you please let me know if you got a chance to check 
>>> the above? Thank you!
>>>
>>
>> Hi Bryan, Kindly can you please help confirm if this is a real issue 
>> or observed as a fluke? so we can go ahead and mainline these changes.
>>
>> Thanks,
>> Jagadeesh
> 
> So I'm happier with this patchset when I run gstreamer instead of ffmpeg.
> 
> There doesn't appear to be a discernable difference between before/after 
> on framerate or subjective UX with/without this set.
> 
> gst-launch-1.0 -vvv -e filesrc location=sample-5s.mp4 ! qtdemux ! 
> parsebin ! v4l2h264dec ! autovideosink
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Thanks a lot Bryan for helping with the testing.

Thanks,
Jagadeesh

