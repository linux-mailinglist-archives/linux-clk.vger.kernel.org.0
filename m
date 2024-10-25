Return-Path: <linux-clk+bounces-13835-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 647469B0D9A
	for <lists+linux-clk@lfdr.de>; Fri, 25 Oct 2024 20:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E62042873AB
	for <lists+linux-clk@lfdr.de>; Fri, 25 Oct 2024 18:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013FC20D515;
	Fri, 25 Oct 2024 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kx8P3c1w"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F81D20D504
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 18:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729881783; cv=none; b=Dvf3wvgcIXalceXSOpwulNvx/bvK+TGasZd1uCphwh6+ZMnEHJS6tZS8m5EKYSflX7JAJeMg6wgvxL0Y2T0uRMLITXdOMgw0hha2uxxDFzIfntQhfACAdTvo3QSoxxshnW2EAOnYa0tFg5GtIf+28QDEHeNPYjzcYF9aO8mezLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729881783; c=relaxed/simple;
	bh=sXpVGo1H7dGGXwCO8hvCponjq9q0Fo312durYrLhaJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mj28JUaT0cCFV+RlF1UTRrpOewRHumFhAaMFJAXpf/HR6q4hSdGCpStKqZspGSohGZqbNGeIdTfZ1n4ii9MnqzlJ9HyyQ2Jr3Ti71pHMlxWqSa1sAu2ZS+jWLqlbRZ6POmVZnV0laEcTOG85zufzjNiHCSCJ1FqVV9afFSnGzMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kx8P3c1w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAG83m007791
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 18:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CftwoMsXWNDvdSWjKSB8oIIniikESu+F6kHXU+lmiTE=; b=kx8P3c1wxhhCFCeU
	0VCAPF+87wcNkF5nuNJT7QZ4sBx8FPeCU4Y2W/BkjzWdC6NtwzngCeBriCRqc1CF
	Uz4zB6lflWm0y2NpNLkRkC3aAhlzSg2lpbro/z5lGQhImCnzn3HhSYe/w0h6a9dt
	G4Hv6mwy6I2FYMK+jfzcYB9gGQ0xh85N57QV08bknX7p+En9ilFX9zBQRx3yyuF8
	NucwgyMUOFvmAVGaJ7P4+uWz1tnxqntxYVADZr7FRMntJDaYx3dKvVy6ZRMlSoq+
	qPWa9iW66tJ9UcAdmA8HPFXtDnkcPWdHOundEgF90m8l9AAQPVkF3X5kbynngTCK
	SQThgQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fk52n0pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 18:43:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-20ca43be4d4so2892325ad.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 11:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729881766; x=1730486566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CftwoMsXWNDvdSWjKSB8oIIniikESu+F6kHXU+lmiTE=;
        b=sGeCMF0XOtCez0uGSL0Gv2Xwvre4A4BAkwD261suoT/f/VYrTmYnkcffD5srIuiFpw
         VX+8HF+eqQX2/EOjdWFiXRifz2CeCJbpK2dA+vWT8wots6i5Q0XQwMe01LP3eMnECw57
         J/CmBZT6u+WfF+67u879APirnahVoqZXd3aKXWaiACWmHYHvXts3WWfGfyQ2q18s12j7
         7+vug/ne4svDB0BGhR5UuYR1kJOeZicoNgPKu5IWsxF7WHWyyjQxD0jimiR+8NNSatwU
         LwRoiTvExgtL+FXuYEJyUmSmdzi0N3NbMdGVwHHs6FKTvycPev/2XkOjecpIp1isRrxr
         VF+g==
X-Forwarded-Encrypted: i=1; AJvYcCWtZKgPUhZyCW6kpLM9GP5Z2jlDTLHRjC62LODaqt7OTBHNkr/711CeQa53iQg5bn/9PamLVPRBDuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFcrEfn/hOjj+0vc2v0I450HuPOA0eU5H2d1nV//UjKopxhhYj
	yvZjXOkRe/clM0iau6JNLw5UFA/5tPp/kXqWz0bUc5IoCZlqTQ9wJNQ4qRCQGHdTWGT3AFhkmbd
	7m09KAq8GnkQwLda+7ej2DDqxAlwOf1xpRpPUKN8BxYPeZQCx4eHdk+/FeOo=
X-Received: by 2002:a17:903:244b:b0:20c:a97d:cc6d with SMTP id d9443c01a7336-210c6d2da27mr402815ad.14.1729881766643;
        Fri, 25 Oct 2024 11:42:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWkKLr4ZwAHpej1ExoPooP2vHAOpOPuW/UAfIFlsj7x1W8eddwvRzMSNmaPvr3Dqx1X2lzAw==
X-Received: by 2002:a17:903:244b:b0:20c:a97d:cc6d with SMTP id d9443c01a7336-210c6d2da27mr402635ad.14.1729881766328;
        Fri, 25 Oct 2024 11:42:46 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a08a70fsm96210266b.224.2024.10.25.11.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:42:45 -0700 (PDT)
Message-ID: <9e0f200b-53dd-4dbf-8b0d-1a2f576d3e3f@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:42:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sa8775p: Add support for clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_imrashai@quicinc.com,
        quic_jkona@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20241025-sa8775p-mm-v4-resend-patches-v6-0-329a2cac09ae@quicinc.com>
 <20241025-sa8775p-mm-v4-resend-patches-v6-2-329a2cac09ae@quicinc.com>
 <e810ab3d-a225-4c85-a755-3aa18c311cc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e810ab3d-a225-4c85-a755-3aa18c311cc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yrOeEglEv2iPGN33RNOHcjvAA4vekUY6
X-Proofpoint-ORIG-GUID: yrOeEglEv2iPGN33RNOHcjvAA4vekUY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=673 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250143

On 25.10.2024 8:42 PM, Konrad Dybcio wrote:
> On 25.10.2024 10:52 AM, Taniya Das wrote:
>> Add support for video, camera, display0 and display1 clock controllers
>> on SA8775P. The dispcc1 will be enabled based on board requirements.

Actually, why would that be? CCF should park it gracefully with
unused cleanup

Konrad

>>
>> Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

