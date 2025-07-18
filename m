Return-Path: <linux-clk+bounces-24899-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC64B0A8C9
	for <lists+linux-clk@lfdr.de>; Fri, 18 Jul 2025 18:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 675DCA8609C
	for <lists+linux-clk@lfdr.de>; Fri, 18 Jul 2025 16:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B482E6D3B;
	Fri, 18 Jul 2025 16:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ylh5KbBs"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015642E6D2F
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752857000; cv=none; b=jlqgV654XqCSFcmDey0hv68HUOKXwS5Zd+yyIGcJT3a0CLrQhISWvK3JC5c0pUcOkKGKw1Npr4Ih35P9IEDEsfd36jeVErJSf/L2mUKXBERUSh9Aowt/riZRclLwLnuogEgKiJ3hgmyN94WRZSOZ1zNp8pUtig2G6rOLfkocUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752857000; c=relaxed/simple;
	bh=zl2XmPcla/ndXnFDbA+nGwqG2fJeK4/YvV3eHZew7Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=An7bVHVSjAwYkBx0uhloX0YRdkieN+fcPBs7RaXnWoGR22420HFhlu+PtNPzluNgf4oUTFz5VF/WyDM4W+Ecxx4ezY9zsGQapCl1Gc+Pj6B5zntc/5NTLwqyEAJK6ZDzSpuOO9DXGXO+1YO7qn0dzthrHbykA5aDUTNP8e8jJnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ylh5KbBs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IGZ1iY021709
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QS06yXcjbSspxBecv3JOOSas1/fugGVTr9GX0MVCJoQ=; b=Ylh5KbBs/AhTwKD8
	TbrkOekYjnCBffFWkS1xyRuNgd3RfyLJQRqK4iObww63pTiV4qFZMZw4es7MltOv
	g7LWTunJ6cl9MVutvxCqXrg0tKcrVAe7dKyhKLo8bRwitwrVGRHgBdllSwm9Dk6+
	mx4rNbY/he3TeIme6GtenjG0hdJ9Nfm8H8+spvFVPS17LMz4HBfivSFsLyuH+oVj
	5rI6ZIYATcmEr9QKCMbatIjr/6RFPq03ut4ztcNVD5A/3/eZXoRUK0AOIqcJQ5HY
	u8xMCdpBvoxgi4jJt4jdcXt5ojaIF97VkUEiTITTvxS0Ce8hUoYaPq7XtnSEOUjI
	AdfVMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8m4ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:43:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31df10dfadso1460071a12.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 09:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856996; x=1753461796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QS06yXcjbSspxBecv3JOOSas1/fugGVTr9GX0MVCJoQ=;
        b=wHf6i/SSo3CTk1QYcEVIj/+U7+CrT4+LfzuEdUZ73R6kIHntGs1wJqvm0jrzmlW9IZ
         969sR4+of1mTfFxn3lbJ3BJm+Ci4kO0ppqElbexPntsr6HRM8U2FfjCTZ2GPUFmH6kit
         sc+kPEd6Fp+pFGF69ZiTc6EwibG+JfDkkOXxGUxOyUIxSLt/9/tDHHlmAq1Kp7ETsafC
         NTAW3O3ZEJyfCO+3wvXOnz2oi49w4z/ErPHPBx2lORe4nZwrfWdq0mVAu9MZq6p+bqBG
         c0bixmQti7OlSQR3JrTeOl6lBo+OGvMx5b3HeIKpE5HuCcPFfW0D5ISDYr3a5qdPpKqm
         a3Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUSzlVNaHJ7CGScyw/0f5QSyuCIT2kiXLAv1/2mmq/rZ+nSZ4t87ZzfkRkjKBM4s513WTl1+KQfaZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Wmv+q+sxKAZxpQF97DMdn5bRHR0AXTmVlaiGkfQKyOh3mSCP
	Bxzg1GRK1qiMt1mipWJ+DZg7EYCWGosoRpIt6723QphOlYNzRcEJokx1XDge2ZWmAnXs/dTuzwM
	gmdS/eVivh4d3kV5UxRRrg7kTiXMYjMetWD+66ESARasTQl3CGydO/hVhbhlGpWI=
X-Gm-Gg: ASbGncvk6BGJe/ef7WBvdspwzVPiUf1MdnJVzn36mYYDQ3kGy7ZXGCgAT+EAdjfok5r
	z2cof89UF4BawolUo3uMlQInxZKqX857RJhiTVzDJvz8nFKi70QXUh/fsrtxvxUaWI0jlwQp+cI
	au1coAASZrhdnMLJU0UA1E6Fr9Ts5dXcS9Z5xDOVvW0nZ1FH16D8utLszG8qfnX+zh1eELcojA5
	Jg1J33hjJm/tl+gph3vyPpRrxGMp/JiqbzvcslC2kqWN+UgRlkMVDXNkd+AQ2Uh4yl0PiJ/gYl8
	gu64/IZ96wV0eqMr6EZYLRCfatbTAEtjeFITYIgOHDmXhlWxXz/xSXseO/fUr9n+bbaqx4/gv7W
	mhcKrkj/Hxso5hFjmt2bVzg==
X-Received: by 2002:a17:90b:1c04:b0:312:e9bd:5d37 with SMTP id 98e67ed59e1d1-31cc2515a29mr5615545a91.6.1752856995998;
        Fri, 18 Jul 2025 09:43:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+SiK5x4mKGH5S3TmuPOs72xqUJSROCjvf33zej2kjfIp7ot9LWhtsKx+NbT7x7Y+uEruIVA==
X-Received: by 2002:a17:90b:1c04:b0:312:e9bd:5d37 with SMTP id 98e67ed59e1d1-31cc2515a29mr5615498a91.6.1752856995510;
        Fri, 18 Jul 2025 09:43:15 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1e61d2sm5340211a91.11.2025.07.18.09.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:43:15 -0700 (PDT)
Message-ID: <f59a6654-e04b-4caf-a570-16016fa4be81@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:43:12 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] dt-bindings: msm/dp: Add support for 4 pixel
 streams
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov
 <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <lekqhgqzb4iimsu44y54cvxbasux264lbuqsbssj5nd66ocvji@nfuxnyukujjy>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <lekqhgqzb4iimsu44y54cvxbasux264lbuqsbssj5nd66ocvji@nfuxnyukujjy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyOSBTYWx0ZWRfX4F2nu4JNTYws
 FIZgqRjD2rhi57JsdnKkjVog4I0jcThajbYNnlWHn9BJM2TKtViI0WLW2XHgUuJ9Fayx5MTmol/
 yx3++toox3cvr7bgaN2ggOcbN52RuDGaPzqjwuJBgMBqNQGH0IQDmxj70bIOxyNekH7tZpg1yt4
 P2WA2wJlR5ZMibLx4fnF6ftXFaG+JjXw8vP4XGoLfzCVyTe40S9y65q47WdE0TA6qeQqNDTssZv
 Ya9ObxpTBloZ2MbstF3WPBlzycTB9J2TjZV3gaMLhsAr/vai4Cutcmyjz4/fyHFnOufOWE4EHVM
 ViyE084L6RgQFKKfQDaYQRtZGKmKaaBOsGshust/d0biBdCVFo5B5W6uUpWvbJLgH21LmUmMQSP
 L2xveHjIM79k2wGF1wTR0khd1UwpDy4+kJRPmqV2GwANhWRF8gGt+U7HXcTwy75OWukOQ2hM
X-Proofpoint-ORIG-GUID: d6z7G01lfJGHAIG7aWd_iD2CMv2-7fil
X-Proofpoint-GUID: d6z7G01lfJGHAIG7aWd_iD2CMv2-7fil
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687a79a5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=1IdYYe72uQdTEr82hC0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=976 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180129



On 7/18/2025 2:22 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 17, 2025 at 04:28:42PM -0700, Jessica Zhang wrote:
>> On some MSM chipsets, the display port controller is capable of supporting
>> up to 4 streams.
>>
>> To drive these additional streams, the pixel clocks for the corresponding
>> stream needs to be enabled.
>>
>> Fixup the documentation of some of the bindings to clarify exactly which
>> stream they correspond to, then add the new bindings and device tree
>> changes.
>>
>> ---
>> Changes in v3:
>> - Fixed dtschema errors (Rob Herring)
>> - Documented all pixel stream clocks (Dmitry)
>> - Ordered compatibility list alphabetically (Dmitry)
>> - Dropped assigned-clocks too (Dmitry)
>> - Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com
>>
>> Changes in v2:
>> - Rebased on top of next-20250523
>> - Dropped merged maintainer patch
>> - Added a patch to make the corresponding dts change to add pixel 1
>>    stream
>> - Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
>> - Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
>> - Updated dp-controller.yaml to include all chipsets that support stream
>>    1 pixel clock (Krzysztof)
>> - Added missing minItems and if statement (Krzysztof)
>> - Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
>>
>> ---
>> Abhinav Kumar (4):
>>        dt-bindings: Fixup x1e80100 to add DP MST support
>>        dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
>>        dt-bindings: display/msm: drop assigned-clock-parents for dp controller
>>        dt-bindings: display/msm: add stream pixel clock bindings for MST
>>
>> Jessica Zhang (1):
>>        arm64: dts: qcom: Add MST pixel streams for displayport
>>
>>   .../bindings/display/msm/dp-controller.yaml        | 53 +++++++++++-----
>>   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 14 +++--
>>   .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
>>   .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  3 -
>>   .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 12 ++--
>>   .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  5 --
>>   .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 11 ++--
>>   .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 21 +++----
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 34 +++++++---
>>   arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 10 ++-
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
>>   arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 30 ++++++---
>>   include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
>>   21 files changed, 235 insertions(+), 133 deletions(-)
>> ---
>> base-commit: 7a88d609b069b7d2f4d10113b18fea02921bedb1
> 
> Can't resolve this commit either in Linus's or in linux-next.

Ack, I'll rebase on top of the latest linux-next.

Thanks,

Jessica Zhang

> 
>> change-id: 20241202-dp_mst_bindings-7536ffc9ae2f
>>
>> Best regards,
>> --
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 


