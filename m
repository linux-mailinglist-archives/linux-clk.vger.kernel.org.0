Return-Path: <linux-clk+bounces-16476-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7CE9FE8F0
	for <lists+linux-clk@lfdr.de>; Mon, 30 Dec 2024 17:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D6CB3A217B
	for <lists+linux-clk@lfdr.de>; Mon, 30 Dec 2024 16:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713781ACEA3;
	Mon, 30 Dec 2024 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCJiqH/9"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7601AAA37
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735575085; cv=none; b=n641vSW98FIVLvExCOywkk+9O3C+/t5TwbpNJzzfq8cw/ExOkfb8AvaHoclTQWChNDVcXgaQLdIfQAMZjaSJdXzDxhd19f26gp4Z1rHPFBfiv7rutRBhsk+CAJHU+tFuG471GV6tKFypbs0AFMlCDbobR3K9VcD/iYkAJweKiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735575085; c=relaxed/simple;
	bh=JtCmiPvBP5gUbpCS4zWrWQBq6FGEw68MNkxNFmHNPGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vqk2rmsouQpunPz5BbUP6lAuQwSjM4Xu6zaMFc1GqJy6imloPVlbZs7rCxFBIrEXGfeY0ztAgPcXA6sOoSkeR4aixJ5LatYn386ko4g8LaUrRdwWbwHu3kjfpJ01RXkVMsPdCMEwrHo1qx9pdKt5OTAiCOTn6qh9Lag0x+qbs0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCJiqH/9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUE5a8J025464
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 16:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ks3jFbBC7Vdbuo+s8/8nsb/ifjGqQncIJ1kwzj1u4z8=; b=UCJiqH/9DrhIv49T
	mUmjoEaeFrthywiCjP+inXx2NwwzMzhrvwS+q+qh+X5hr4w8wmyJzr+rC5QiAQfY
	v5whfMJGnMK56YcAQkdXfNOtw2V0Ka20YYHHc6wtkpP/kz/1clxkoF6fb0n5b0lX
	v8eOykQQNz1FqmCU+O0Jg21peImB6rXiKTtipgp8O+hFWdin+dIp6OVZXD5KAivu
	vLcypNTLfy400a+2O09jkSY2ejfY57NjNbmvny5HChIya/D4MkNkxELHEHh0Z13v
	ZpoovTj+2Cc1FAHL7Uhmwpx419N3eZVw75uGYzYHPFfRlXX/1vnE0Qw11nkbK9KE
	2II0dg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uvyt0a0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 16:11:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8f15481bbso23510396d6.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 08:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735575082; x=1736179882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks3jFbBC7Vdbuo+s8/8nsb/ifjGqQncIJ1kwzj1u4z8=;
        b=AWpP/3sGKKfzxXZI63GSVVHMBYFYK7IaD3fCuUja8dh7HfNrY9a0SfySr/efEKySiq
         htgV7mw/V2p1gC94XOnNMUMhF+NwffauKW9URCxUis5+qUPxULQBxjyD4VfCd0EdcHsR
         zdLr0/qY1jpXgijgjlsrWd18s8SC2DJwebi9t+fbtDshH91gN+09OYGIIsHt6p2hqttv
         wD0F3ZXJBguK+LfwsH4C1KZQ4ZY9vJMO2XX7r8vbqJtj9aARmHzit/cV5sBh94MHq+zR
         RyqDxEmwojwwnvRgIfodO1yCshnoiJxPaAFwRbOtE2oOoxk56eq5UXgCmFWrYuuaDQ3s
         bZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCUsUOqCT626DrGG/mgVf0smrvoVOCg6qlqd+NYTad3oea/ulhNEiwbeThHdSOKeqRmX9eK+t0b39F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHR5CT9nLZwFm9bClN7g32ydO/FzpcU/7ZUCFW5MX8KdT8JjBE
	mce/PYMnPj5RbJgh+KLy8B/d7iep2LDqRuJ5QHaq7k989v6XLR8tbxRdk06EJpQr5ZbNjSxKR+h
	kAmo8e6eBsykQ8ciYL6dhEHuqnPIL8a/xu2yILtRZfsgi7teNErAl9DLqTvA=
X-Gm-Gg: ASbGncunGddzQx4dvQ/zYHZJ+oKaXecjgFPLSD94SK00tUNM/5rqMGVGQOWqIkYppO8
	+uJzQXah/cx5k7RLhGqY1CBPFpcTlwhdNJfP9ZbgOcFWeTTmAosALUHxriClI/2A4GBmPRJLKkY
	ZD74YUJ1DQ7WuLkCRDqw/hdm0mptEGHjiZvIOQAEkqBKPWLjL6FNWTfWjKp3So5J8LqRquWYYqw
	aBG1F8rbfk76WCEf3coiJQYqWeE+hvEU4WNvISv8zcL+QfO+QHcVlod5djo+61P8MMFcH2gUg1n
	kFiwyn2WqA/wsEE4GQ0rrIoOVkozQ1+vyvw=
X-Received: by 2002:a05:620a:2a09:b0:7a9:a632:48ad with SMTP id af79cd13be357-7b9ba7d3bc9mr1976756285a.11.1735575081784;
        Mon, 30 Dec 2024 08:11:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2BVxJ+jl0wNFz54SkuMhcOIsWCBO+gH+vcL/CRqGxPgW44umlm1mhoWx6DWa8/uF2ZB/AfQ==
X-Received: by 2002:a05:620a:2a09:b0:7a9:a632:48ad with SMTP id af79cd13be357-7b9ba7d3bc9mr1976753585a.11.1735575081432;
        Mon, 30 Dec 2024 08:11:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b6bsm1493145766b.93.2024.12.30.08.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 08:11:21 -0800 (PST)
Message-ID: <8bea9d64-66f0-4923-8961-dbf06cae377e@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 17:11:19 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-6-06fdd5a7d5bb@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-6-06fdd5a7d5bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WrdeRwtto_QIW3qYQAFRbtmnaU5lNaRY
X-Proofpoint-GUID: WrdeRwtto_QIW3qYQAFRbtmnaU5lNaRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=987
 suspectscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300139

On 27.12.2024 2:11 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

