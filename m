Return-Path: <linux-clk+bounces-588-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADE77F9D2C
	for <lists+linux-clk@lfdr.de>; Mon, 27 Nov 2023 11:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2F2DB20C4E
	for <lists+linux-clk@lfdr.de>; Mon, 27 Nov 2023 10:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D795D18041;
	Mon, 27 Nov 2023 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wwgbasqp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB87B10F;
	Mon, 27 Nov 2023 02:12:28 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR6sK8N000814;
	Mon, 27 Nov 2023 10:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sx6V64zmvOt7YMqP3pfR0ES/+ZW/aQszbllSAmtYhVg=;
 b=WwgbasqpBrqzIsNKN1xiTK568rPs2KAZXfYpTE1IUc09GDd5bSL2tM1S35Vc4XpXz8/p
 VxRrIXHu5abP0JZs/PPTcUln5GpXWj/tYWWAh7LvW43/2qrwzDYciApo6KMR5w8GReJC
 fauGB1Yj+4iFVRL55gF8hWSxNV2zG3vjtSNhc6U7T4ta6LWXomXk3Yj3rD3QKERyUlar
 z5wuyIQqbGhPEGRJYu+30APYgrjmogU2NNKmU0rYbosEN+lGlxd+mP8UQgTzXOn9vFpV
 m4WcSjEWPMz02he4Z9jyB7rmY1kz/V2Lk3irF6cX/FkwTT2UC1ftKHwJVOYC4+y/LNCW +w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uk9adktwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 10:12:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARACN1d007248
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 10:12:23 GMT
Received: from [10.50.63.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 02:12:20 -0800
Message-ID: <8ac05276-eec1-fb42-166a-5739822ecdd0@quicinc.com>
Date: Mon, 27 Nov 2023 15:42:12 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 2/3] clk: qcom: clk-rcg2: add support for rcg2 freq
 multi ops
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230916140046.7878-1-ansuelsmth@gmail.com>
 <20230916140046.7878-3-ansuelsmth@gmail.com>
 <419b0e85-5479-30b0-d6a9-b2697d057c55@quicinc.com>
 <655bca09.050a0220.bac1.aa06@mx.google.com>
 <5540adcd-4ba6-53e7-c7fe-b7116e6403ca@quicinc.com>
 <655cb6e6.050a0220.35346.e9a2@mx.google.com>
From: Devi Priya <quic_devipriy@quicinc.com>
In-Reply-To: <655cb6e6.050a0220.35346.e9a2@mx.google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K-vT28wy7eyiIAz1l-2CUQ1fUyE6_SC3
X-Proofpoint-GUID: K-vT28wy7eyiIAz1l-2CUQ1fUyE6_SC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_08,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxlogscore=490 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270070



On 11/21/2023 7:25 PM, Christian Marangi wrote:
>> Hi Christian,
>>
>> WARN does not get printed with the attached patchset.
>> Thanks much!
>>
> Can you also confirm that the code correctly works with your div
> scenario?
> 
> Would love to have some Tested-by tag to move this further!
> 
> (since it seems newer SoC after ipq807x will use this implementation
> even more)

Sorry was not available for a couple of days.
Sure, will validate and add tested-by tag.

Thanks,
Devi Priya
> 
> -- 

