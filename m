Return-Path: <linux-clk+bounces-19682-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77580A6BFCF
	for <lists+linux-clk@lfdr.de>; Fri, 21 Mar 2025 17:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3EFA485A4F
	for <lists+linux-clk@lfdr.de>; Fri, 21 Mar 2025 16:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF3522C35D;
	Fri, 21 Mar 2025 16:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJO5KoRi"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEFB22C32D
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742574233; cv=none; b=YYFp5ma/w3D5LusC1Rxp432Himue7j1H2rcRjEUHKfjVQ9194h+lNPcppYAWigT2O/Ri7xLkwD9q0HVtMK0oU4VsZvUithBhmeO1JOuozQm+PCi0T51Ko7jEa4qrjZbInmoyVTwjX2WqWDFGAZAWTEnb8QEIKnZ0fo7xvEnA7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742574233; c=relaxed/simple;
	bh=nNTfSGXw2geS8UBiT4FK+yp5IGwsYzhIrt8si9K/yUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpPvIAsHvS50TiZSBVMSqGZEE9TQPp0y9S9X+xDnVrEsc1GxIqyCUpNr+nYNa7sP6qYoGll733/t1VJXjAISDTGBzWzi5/GEE6mI0t20j+zq1ldvPH+aKcrJLv7tIB3auSzcM4LBHgTUXdtIW2zREH8Xv/gxCsQjKXfn9nZs9ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJO5KoRi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATDth000899
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 16:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ld8OromtzDWpFiO+c4IGRa2KeSsgIr6PZMN7pzdN+fc=; b=XJO5KoRioUxrMPY4
	LdIxKld/w8KboUIHZN9dbUw2v0iGIt2zOjFInfDioVQ8W7H2L3oMRmM8UToM/CmG
	0tBbjuCnFbcISLSPD6lNA8BZCzwK2CvgxT5WtCy8UEyxbW2rZu+XddpgKEBL/0M7
	wfUujxFJ3apZY33qnBgXBzfZyFxxcL9vAwJmDPfxlxjVkX0yNw7s2mtpdM3dtiG+
	mKOOiT1v0dTpQoWC5CEsRuSptW+TsncfI7vNd53WQXjinNjsyB4DgEXXkzOfsuqt
	icfnKpZaiVqdtGVIIf68MkgIDy361x87W/Z+JETZ0PpSlQC1WHplNx2bvXzAhblK
	7gqJqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4u9s8ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 16:23:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f99a9524so57453046d6.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 09:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574228; x=1743179028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ld8OromtzDWpFiO+c4IGRa2KeSsgIr6PZMN7pzdN+fc=;
        b=pcJXMffyjaBp3G3zOb3SnJkNBsHg7TM2MxxEJSl3A5Clwa9UALi0ByYjDRKLFYwQCu
         nYPY3VkUalidW6Dn2AnoQD1+EupLHLQHFpAmmRnducGk4RI3fKwDdwvOv7CL9mzzr+zJ
         0Q7c+S3WzGxGwptmZGpwmWKuXPNACOdOWElVFSEBOnNb1bEF+Pdue/xu8pLJFO0UJUWv
         GCHPy19SlFdR2QWlP1/ltJGO8xlB34VZ7buuNGQ8CJAIWO99129pPBgG+QPBtBV8jDfq
         Q3VMY8woIYdUkdqEYEj37muFbc0iZ67y++672anEgwPzaANzNtMbhPLAnwT6vcet+VOs
         HTJA==
X-Forwarded-Encrypted: i=1; AJvYcCXmbB+zM8U320CQpE3J6YoTiw5sExB753zO8rfu7oI5Bpdw7GOuSsRYSBjLs+dA85hJwycQUoXW7FY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWZFUTTfGYT5GhvMNlxdNaTdd3oEM3Aoh7XuU73iSM2NJtU9YN
	xWT5+5OdXOZDOdNzoEiJknmuZ3Wa1GcC3y7iqtQhdWhJvMsRWsr0Qjookwon3F5N2iP2i43idmx
	JJk2+Rc4Xne9YPhNK1ajpFCfaf0yz9s78yKbLLRvhw2Sh7erKJGDR8ic9HE0=
X-Gm-Gg: ASbGncvN8XqwktGs6MHyHL/7/RBjZz024Hgtiq5JKwz7LbvkZIZhG1rih+skljna1hD
	N+PvoOP2RaSkloEw4QWdU0NIxg4Dn3lGEkFrWdlrZAnDAXF0OD+Wb80mT72zV45ar/cW/LU95Of
	64JAIKTjOyCdP/TSkk0pWO+5zRVcKD2cWVxudUNsx15sG8kI9nJM4V5RegiJ6/xKf4WS6W2WR3Y
	OxmoZHAhICmMHLfVkAfHoM8bZSc8v0zvED4xCmR/zndYP15SgwCAuLRBXbIr3HXD0CR3lrQ/4X9
	G/Zu+d1mf/l78/E0tqBvQX1fA9wy1yCSO8QSFazvoeafrzmzWmv2Oj2vNW8HT9XqGLITi8A4Mqt
	8Za3nS0Yb7iyQvutYEoUkBosYmFP8dBSU7PC+sR5TU/Q6zMbAcLw1zUyRiHun7IAp8z8p
X-Received: by 2002:a05:6214:766:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6eb3f36c428mr55377356d6.34.1742574228048;
        Fri, 21 Mar 2025 09:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX98Iv6fQ9nBxZLEJQNiNCADCajpNV88gT+BPE+tv7DjRfCojEFyMDyypb7cv/sb1yB5O5Ig==
X-Received: by 2002:a05:6214:766:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6eb3f36c428mr55376986d6.34.1742574227570;
        Fri, 21 Mar 2025 09:23:47 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c2:310f:a0b3:1d12:b116:f8e6? (2001-14bb-c2-310f-a0b3-1d12-b116-f8e6.rev.dnainternet.fi. [2001:14bb:c2:310f:a0b3:1d12:b116:f8e6])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e70sm2720771fa.105.2025.03.21.09.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:23:46 -0700 (PDT)
Message-ID: <dbdc13ec-13ca-4d80-8c96-26e5e7b4ab3e@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 18:23:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add video clock controller
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
 <20250321-sm6350-videocc-v1-3-c5ce1f1483ee@fairphone.com>
 <wjq7sxdc5enfu6zhp4d53mpyevzbuwm6qc73kwiu2v3v5p4zkk@mevxbzosjai5>
 <D8M2U2EUF169.MWRPXFYRBXMM@fairphone.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <D8M2U2EUF169.MWRPXFYRBXMM@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LbGMnD_2ztwGgKbBW5shaxYeVXu_CwOF
X-Authority-Analysis: v=2.4 cv=FYE3xI+6 c=1 sm=1 tr=0 ts=67dd9295 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=5zAZ7Tx_SugcLKjGGPAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: LbGMnD_2ztwGgKbBW5shaxYeVXu_CwOF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210120

On 21/03/2025 18:15, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Fri Mar 21, 2025 at 4:56 PM CET, Dmitry Baryshkov wrote:
>> On Fri, Mar 21, 2025 at 03:45:01PM +0100, Luca Weiss wrote:
>>> Add a node for the videocc found on the SM6350 SoC.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..ab7118b4f8f8cea56a3957e9df67ee1cd74820a6 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>>   			};
>>>   		};
>>>   
>>> +		videocc: clock-controller@aaf0000 {
>>> +			compatible = "qcom,sm6350-videocc";
>>> +			reg = <0 0x0aaf0000 0 0x10000>;
>>
>> 0x0, please.
> 
> There's currently 80 cases of 0 and 20 of 0x0 in this file, is 0x0
> the preferred way nowadays?
> 
> If so, shall I also change 0 to 0x0 for reg in a separate patch?

I'd say, yes, please, if Bjorn / Konrad do not object.

> 
> Regards
> Luca
> 
>>
>>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>> +				 <&sleep_clk>;
>>> +			clock-names = "iface",
>>> +				      "bi_tcxo",
>>> +				      "sleep_clk";
>>> +			#clock-cells = <1>;
>>> +			#reset-cells = <1>;
>>> +			#power-domain-cells = <1>;
>>> +		};
>>> +
>>>   		cci0: cci@ac4a000 {
>>>   			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
>>>   			reg = <0 0x0ac4a000 0 0x1000>;
>>>
>>> -- 
>>> 2.49.0
>>>
> 


-- 
With best wishes
Dmitry

