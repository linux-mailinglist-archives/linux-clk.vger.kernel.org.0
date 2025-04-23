Return-Path: <linux-clk+bounces-20956-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D365A98BF1
	for <lists+linux-clk@lfdr.de>; Wed, 23 Apr 2025 15:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C63277A3D37
	for <lists+linux-clk@lfdr.de>; Wed, 23 Apr 2025 13:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3032F1A83F2;
	Wed, 23 Apr 2025 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DeLymmwS"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AE61A316A
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416457; cv=none; b=cap6c6vf18DF93wxaODrS8LHbCshtzgidvJMVzgUcZ5kSsyzU7CRwqwZLXpGGahfknbkNuwc4j1qQsut17graEJ36K/nbhM0Y4hJ0VvdnRo4ylkEgEymEMPztkoZB1QMLICjlSPEsA0FpHQKWSKcSE3TXr/v0/PipK+5H/8WR5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416457; c=relaxed/simple;
	bh=Ph0l8bR+Uh/iYP/SWlhiMjeLVi3TEspfupl8tbIi5Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQlN2DpIFXJ1JV0aP1gPnUJgpZ0NFdOKCOOsDQB7L+FwcGEGCrCKorkQSh+aXdvpLkm0VuIwsE3iKoR/AAAewcLsaN9vMKizzNIAk/PaEvI7v03IOZYfS8U7Y/DsC0wO5v6mDhqjsdG+Qir0+BN5509WMRwtUeI2UEHtIP2kBgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DeLymmwS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAqACm013399
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJX2fb/ffnpa/u3aYJ64X7d+kE1K0IKu9sD+lgBHlKg=; b=DeLymmwSMCbIy49E
	r5QVfafjNeO5exfLzXBvDczdCEQWbWvZ11WkESac/Rq0arZQLUSoJaELhn20+YIZ
	sC+UQfw+/VMJJgLlZanr2oEEhZqyDuTtnboBdB5iMjHldgpGT8ppytlhB/+pckxS
	5BGXW+ki9ikYF7VAuGSy94VON6HvUbcVQaS6BYicOMI+nz+/dPaqOIMt1DD66Uco
	/tJxpKHQvUikXqBi/4DOWR1wK5XlafuCwOIGZ0hRKMymFHxOmTLTnTlK3OsUYoxS
	0ckxiVqN9S7gSTClq+tP/+yjl/eoLxsYVYANw5DfUqrXoT7lVDMSr+/+5VG4KM1d
	7zRTeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a9vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:54:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so124703185a.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 06:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416453; x=1746021253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJX2fb/ffnpa/u3aYJ64X7d+kE1K0IKu9sD+lgBHlKg=;
        b=LoinnTsolLOa/hWKAied/cWiiI9Cqqzolf1QyEEuefKFcYgHQSaV7B4voi4JIAQJt8
         EwzaR7xzuuRAdTENtAvhO+NAUn52Nbl836rP8DZ+67miTGqJvOi0iKKmt5EZH1Y5Yy5W
         9FZ2yz9QL/5mi53cFOHUey4UMqHdp4g4WJB2bTvmsZXxNfMXafEfzdtdrNR8Gjza8X/W
         PN352gbcXvqZ+RLGZw0e1fxKDC9Zxi4T3dHEOYTftEzcrpDdR5zbFUsXqMHkexRKxKP+
         YeNTTQWdCVfCVrxyD7QRCTiJccfl9YzsFqduKWOUWfEdiZvIrTO3Ij9sXN/vKGbFH0kd
         VIxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbxdJpAaT6de3evOCLPaC/WvMYJoT5kAtg4mDJLc1I4rGLfExbVEOcdQfU80/p1ifOKT4vDDkc6RY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW26uzkbNTMYzip2NJiQnTxGRbKvXN+FCMYYa3ZVqZeqFuUp5M
	hAQMlLz6B7qGlqPetmpLJgxHe6Gt/xWX9nXGZuohP99QlXHMF73Bx+gQ71qadRhzQhCXzdSX7i5
	kqUs+rhIdqXFNUFPDCxVDiKGE3X9QimYsdISHs1HZQRz8n62YjcAz5Ndyrqk=
X-Gm-Gg: ASbGncuSNbjsDJ0m0Zn7xAzysfbP05oLEmda/xF+AJ/PsUIETtIbhtaR/opeu+dGQMp
	tUx5OE9h3i61GzWmvE+Y2EKF66mf9HAlFJ+3opuGNY05swo8fzTBAk7z0u8t83RI39VYpEttZvr
	9ywIWoRAUN1YRCeVUfUabWSyTRyIUy5h4p01AkIYxdjtFxgov13bfkyrFO9VJCefiitCVW1TC8U
	C0qchx2UjhfkWkZMTJuUnqjWI5Ef+rcYzL7eXMHnLWEuOUMWUYEI+QhmLJNXmU74RixZw5G/wFe
	aAt+dnG3XtaczspKBQgHnzFLYfwpk03BddjXqbNabPGaZb0s9+m6x0qIeyv65z+Z0jU=
X-Received: by 2002:a05:620a:17a1:b0:7c5:8f37:5eb8 with SMTP id af79cd13be357-7c94d2cdeb6mr185089585a.12.1745416453366;
        Wed, 23 Apr 2025 06:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5GSKl5nOJGI1IDLlBzmI6OWMLujvoHpe4eYG3KxeTMc/rjtv7PPTjZDEBvTI5D7TyWEbafg==
X-Received: by 2002:a05:620a:17a1:b0:7c5:8f37:5eb8 with SMTP id af79cd13be357-7c94d2cdeb6mr185087885a.12.1745416452864;
        Wed, 23 Apr 2025 06:54:12 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acbbab86f15sm299799566b.76.2025.04.23.06.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:54:12 -0700 (PDT)
Message-ID: <da5f63ad-3206-436f-9b0f-4e966b817fc3@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:54:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: Add Xiaomi Redmi 3S
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-5-bf9879ef14d9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250421-msm8937-v5-5-bf9879ef14d9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NiBTYWx0ZWRfX4bzQY3Yfki4y iPptNqQnVzrqXwKFqUdQP0xc/94NGmb+2yn8oZNvELkz6Jn51jyGidV8TStAgo1iLWotw7zoEfj tf4sniohl9tV0o6HYGcQs/6egZ0ZdwIs7Cqcy9mTSEbhDZ+xBlxNEc8Szip9d9YVdX7YHZQis/0
 mMf67XPqBRXTGzfgY0jbZHlkNshMjuz3c4p/DNv69qmqYGOWGKS3MruGv1dLyckocBktT4dYXsP tWDYPiortQiWoD/MHz6zgzpGSPc9bpCKm0P27uROetMssb1+2Bq1XkEw6taYsmiXkgPR0GLvgJT KsZD7Cpf3SORPKfYba16WTaK/llr8vI3Aclt5UOLuRli7STkE7X8Zw+1J3rDxusLzU/qqZBSkaq
 VpC1mcctItVN1KpBs0N3mPRb0CupppZBeuZ/ZTEjSUJ+l90Kyvv/M0+6Vdw0hJ8gpOB9Laqu
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808f106 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=VJhJOi4SVWMle1XIrLYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=YF3nxe-81eYA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: AtQz2DKCKrhbNUXueYJgVuvtp9meqFn7
X-Proofpoint-GUID: AtQz2DKCKrhbNUXueYJgVuvtp9meqFn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=685 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230096

On 4/21/25 10:18 PM, Barnabás Czémán wrote:
> Add initial support for Xiaomi Redmi 3S (land).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

