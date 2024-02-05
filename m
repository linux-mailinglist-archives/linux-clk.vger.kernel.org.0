Return-Path: <linux-clk+bounces-3283-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5824184957B
	for <lists+linux-clk@lfdr.de>; Mon,  5 Feb 2024 09:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D70BBB23752
	for <lists+linux-clk@lfdr.de>; Mon,  5 Feb 2024 08:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CA0111A2;
	Mon,  5 Feb 2024 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hDOMFOJP"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD883125A5;
	Mon,  5 Feb 2024 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707122288; cv=none; b=t4MTqcOpA3QN0S/VRevgIDx9p2srIFJtKGuWdld6ib8/uwNfYS7/QRSIwwtOYwEppZ3PVoEZA0v1M4H57IcxXgEUkg+FZ0Jj1L9wi+uw87yaBSD41koe+xSpuYR7c+GJSZWqVFYGkUMb2gnz7f38+Ztu2gGdvTsYy33euCXDO1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707122288; c=relaxed/simple;
	bh=fypnbFmw93LuJzWosCZ5x03J+bJIeVaGp/VErY4fC3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CwlohxQP+2QheZeehIKrLBHHPHKoZLFA7o/6ck20oAkVlAhNE2cQ9GZMRva8wuOCXPhri76Q5KtrBfVdDATGKoTyJlk5f+kOKdwLx+8jGywRCEcmtVia3tKty/8YXxOqW8FAJ0A/y9KbdY0vDC2022qEZW0MmgKLiBIwY+2W9hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hDOMFOJP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4157AOdl010626;
	Mon, 5 Feb 2024 08:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=b16WAGnJxZxdnv2GKc/YTa+d97I0ElUqgHMCcWXI61o=; b=hD
	OMFOJPxZX4kislMp9uw+wEycPMoxrFGTkptbMIePf4T672fpX0Twuxz+pTLFUt44
	EYVfxShgL0/14czOgs9yu4Ry+NLKQb9OrIgeEyfntu1JlcEF6XtP0EZ2Tn45ks+o
	/izb24Bwwt/tY+6rnEBff3312wFLD3CfmLO2c0yfjZOIXa4wcLfm4myGuY9/F4HQ
	2Bx8CvPfS6fU7l7XVXwGWC2bjAlflkcy9zQfPyQ0gdSe8qB6yEa8MTOC62hcw1iO
	XMitQhuQJhXAAxvz3iggnqBMMtFUawhlj+Z58SnE0jSpIzfCwg/u5gvN8lBpeKD5
	YPEKhtZdXcF/v009pLzQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w2t9wr7hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 08:37:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4158btC3019565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Feb 2024 08:37:55 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 5 Feb
 2024 00:37:50 -0800
Message-ID: <04788b2c-a212-b8a2-1124-d904f2f61f5d@quicinc.com>
Date: Mon, 5 Feb 2024 14:07:48 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sm8150: Add gcc_parents_0_ao support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>
References: <20240123-gcc-ao-support-v1-0-6c18d5310874@quicinc.com>
 <20240123-gcc-ao-support-v1-2-6c18d5310874@quicinc.com>
 <d31a52fc-9073-483d-b84b-1f02a5698a89@linaro.org>
 <77903574-696b-90f9-f136-be5c5d219ba1@quicinc.com>
 <5ae84692-b05d-4a43-aabb-4d2e7d9926d5@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <5ae84692-b05d-4a43-aabb-4d2e7d9926d5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NHlNLkE6ya0dZpA2MSe2gcTJ_o-KsjGc
X-Proofpoint-ORIG-GUID: NHlNLkE6ya0dZpA2MSe2gcTJ_o-KsjGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1011 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 mlxlogscore=881
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050065


On 1/25/2024 3:25 PM, Konrad Dybcio wrote:
>
>
> On 1/25/24 06:49, Satya Priya Kakitapalli (Temp) wrote:
>>
>> On 1/23/2024 11:17 PM, Konrad Dybcio wrote:
>>>
>>>
>>> On 1/23/24 17:34, Satya Priya Kakitapalli wrote:
>>>> Add active_only support for gcc_parents_0, this is needed because
>>>> some of the clocks under it are critical which would vote on xo
>>>> blocking the suspend.
>>>>
>>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>> ---
>>>
>>> Is there a need to keep gcc_cpuss_ahb_clk_src around? Do we do any
>>> ratesetting on it? Should we ever turn it off?
>>>
>>
>> The branch clocks under gcc_cpuss_ahb_clk_src are critical clocks, 
>> which are running at 19.2Mhz causing vote on XO during suspend. As of 
>> now no rate setting is happening but this rcg is useful to get the 
>> exact rates from debugfs. Hence this change is needed to avoid XO 
>> shutdown issues.
>
> So, if I underderstood you correctly, this clock serves no purpose other
> than getting rate?
>
> In this case, I'd say we should de-register it from the clock driver and
> use debugcc [1] (contributions welcome!) for precise measurements.
>

Although currently there is no rate-setting happening now, its better to 
keep the rcg modelling as is, considering that it might be needed if 
some use case arises in future.





