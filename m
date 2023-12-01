Return-Path: <linux-clk+bounces-709-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A228006B4
	for <lists+linux-clk@lfdr.de>; Fri,  1 Dec 2023 10:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B10301C20906
	for <lists+linux-clk@lfdr.de>; Fri,  1 Dec 2023 09:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860D11CF88;
	Fri,  1 Dec 2023 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aWkydWqr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F15A10FA;
	Fri,  1 Dec 2023 01:19:30 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B15cHvc022539;
	Fri, 1 Dec 2023 09:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Zka4KzIUcTY1DnFiW9G0zPvTAMcdwMCa69wvvZaIvwg=;
 b=aWkydWqruTEOIxl6gXrgbPzkAHePPA/4EVZc3PSFkeJ7KrXKvMtkwhd8kROB8o5Tx8FV
 F6Cixw1mBZZ3qWqohGmHSU5eYHxKCgCLSX5kVS+IVnm2WOJ7PrMZv0eHJeNq4GVif77M
 N+0Y/iyX5AtT+tnagNd7k6GEbgBw6n6gOYuIsZwLXrk4f7l1yyCcQbdGEnU2e8avgvpQ
 hiIbvKFgHhsN3qKOHe2Gz9ZZZnJr7iTxOcVNK/eEayBfdV2bsXoBxd1PowW6i7VSoniB
 f/mxSP0+4tx+BWyfCSoQVP1cfkWa/TxJh7C8ocHYYVsFAK1jxSkNNYx18uz0OGetmoxX DQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upv482ek2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 09:19:24 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B19JNei024942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 09:19:23 GMT
Received: from [10.216.46.214] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 01:19:17 -0800
Message-ID: <f38fa45b-6b57-f941-7bf9-5b6c2d0ea1b8@quicinc.com>
Date: Fri, 1 Dec 2023 14:49:12 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V2 0/4] Add runtime PM support for videocc on SM8150
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20231118123944.2202630-1-quic_skakitap@quicinc.com>
 <47925f9e-32aa-4762-a4ec-aa559e18ff12@kernel.org>
 <26b69814-201b-8d07-d844-27e804aa3016@quicinc.com>
 <2ca148cc-564c-499a-8fdf-487391c9024c@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <2ca148cc-564c-499a-8fdf-487391c9024c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NCiTyvsxjcNA6kaVhnTlc3f9a5qWfh18
X-Proofpoint-ORIG-GUID: NCiTyvsxjcNA6kaVhnTlc3f9a5qWfh18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_06,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312010061


On 11/29/2023 7:30 PM, Konrad Dybcio wrote:
> On 28.11.2023 17:11, Satya Priya Kakitapalli (Temp) wrote:
>> On 11/20/2023 5:18 PM, Konrad Dybcio wrote:
>>> On 18.11.2023 13:39, Satya Priya Kakitapalli wrote:
>>>> Add runtime support for videocc on SM8150 and update the resets
>>>> and video_pll0_config configuration.
>>>>
>>>> Satya Priya Kakitapalli (4):
>>>>     dt-bindings: clock: Update the videocc resets for sm8150
>>>>     clk: qcom: videocc-sm8150: Update the videocc resets
>>>>     clk: qcom: videocc-sm8150: Add missing PLL config properties
>>>>     clk: qcom: videocc-sm8150: Add runtime PM support
>>> Hi, it's good practive to include a link to the previous revision
>>> and a summary of changes.
>>>
>>> The b4 tool [1] does that for you, please consider using it.
>>
>> Hi, I have installed b4 and followed all the steps, but it doesn't populate my cover letter with change log and previous series link, do i need to use some option for that?
> You probably did something like this:
>
> b4 prep -n 8150vidcc --from-thread 26b69814-201b-8d07-d844-27e804aa3016@quicinc.com
>
> Then if you do:
>
> b4 prep --edit-cover
>
> you'll see a note like
>
> EDITME: Imported from f26b69814-201b-8d07-d844-27e804aa3016@quicinc.com
>          Please review before sending.
>
> so you need to do it manually.
>
>
> Generally, when the series has been sent at least once with b4 already,
> you'll notice that `b4 send` appends something like this to the cover
> letter:
>
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20230830-topic-refgenphy-v1-0-892db196a1c0@linaro.org
>
>
> This should be only necessary to do by hand once, since as mentioned it's
> the first time b4 sees this series
>

Thanks for the information, will add them manually.


> Konrad

