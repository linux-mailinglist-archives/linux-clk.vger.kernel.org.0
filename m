Return-Path: <linux-clk+bounces-13287-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C17E9A2D84
	for <lists+linux-clk@lfdr.de>; Thu, 17 Oct 2024 21:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 435731F211EC
	for <lists+linux-clk@lfdr.de>; Thu, 17 Oct 2024 19:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CA621C16D;
	Thu, 17 Oct 2024 19:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSU9hVhu"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED2218D72
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729192392; cv=none; b=EPklwMpIy20fnT9AcDLfWnBe8AqidIUFS6joOpOAY6t4nl/tkUf5FZb36/rUtSNRT3hHizWXrAKdN4iwbEzh2vp8aKZGQ+wcSRlebaMiU6DYhHO5vQUQiX9mpZxh/oGskv0bbpk9r/4K70ht6knhKlWmzqJq50Bhry7lnCLZ0yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729192392; c=relaxed/simple;
	bh=1dd00Qx2EBh8YxOFQdo9vpm8Kon2YqflEBJff8NGjKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYeZbJctcXAfvRPHRAnWiIpzHxUq24CutSRtv9m5ogOo5QzDPtDGDisgf39z3OZl9AxfXKdNHOHgihqvsSOkjxN5ET7zI6kU2WOut7/V326GmkPS0w2jo/htw6Y8SbazT8rfiAgc6SyRNqfJxOQQxfNbf/G1hzknuawjTSkxDPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSU9hVhu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HCmGVW005286
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 19:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PhmGa+PsAmdli0oMgsVFWbNWWhmW21epKoK81/HYQ4=; b=mSU9hVhu5Z3Z5SLO
	xEIUvOW7Z2f1/uXHuqppyXKutqR7VOgwT/8eAW7iki9OdMGqAfLZBCSQA2Wdyz7F
	H16QzBvulkn/oqpZKrqEzdU9FSHGu0U6BZn262TGIcvZ7tQmfqVcHwotVDj1NW3A
	zkRo5Zgs6amSfy/KpgUnSAFsGH/xK1R6H/xA+QwOxDFdkehrIfOIlabCQgLDDGHG
	cl1eTKv24KPny8bVrrpReB9dya4b9uDyfd1MWX8kWlzT9WeEKXvn1QHk51pxrFoD
	8MkdRI1YojtzWbbEXKfQz7xe8JdmFdPaXoZR8YiTYz3SK+H1oS6oh/RSc+IE9Yzv
	XCmwlw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42athc2mdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 19:13:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbe5e8658fso3366076d6.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 12:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729192384; x=1729797184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PhmGa+PsAmdli0oMgsVFWbNWWhmW21epKoK81/HYQ4=;
        b=ANe0JUvznpDrUZa65fWJcAIICDSofaZQMROOs45/WPVvoJug6snjxEFdZFDXEdSZLe
         ZEaY8DqT01/6VpR4ak9V6p/c0q5Ajb1GZYiJWZz/NZXcuOFPzcW6zotYz8SPcF+58rF1
         TWFFpkhQKQAhal7n0lvoqW5W2hRnGeG54nh3Gkvt79aSRQFN/UBNmoTsZh7nfOl3EVoj
         0xaD2eDM2H+aA2mHDz4LcyqRpU1j15Zs7hvL9//HsSaFjw63CbAQQLu81C3qzeKeM6Nh
         rHHYdTAp4FKuc7jjaXxrJPNJMnkIIa8gRC4pP/mE7sBKdd5VxMGEIrhavywDrJwI3xYX
         qYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNGbmCG3Vmn1eg/FveX/k0rR6HooUdlGPMQf7LGpdIOoylKkNVk4yHuAMuV8Ov2+NG301e/Z1Xbqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbUbKM4tPqFIEl4WSIiSNHFOfZwkhz4vJiAwQDhJWSu7c8jb/D
	Gq1wNtteIpYwwMa7T7ghy8x85ExyW9HvDp7bSqOwFjhUe/0zz4H0zgEdJ42GjhfU1x9In9fkfGf
	NvZDoA3kV4FJnrc/cFn4/gPGHS4B7K/qanxLvDrgSsTtdWg3eWfaPoVnVO+U=
X-Received: by 2002:ad4:5763:0:b0:6cb:e6b4:2d36 with SMTP id 6a1803df08f44-6cc91badc7cmr3546276d6.7.1729192384166;
        Thu, 17 Oct 2024 12:13:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNjMUbDedkbOA2MqvkIgvzqY+U4esV1vzQWFnNlX27uENLErxKMt4L1Y3/0J+lvQuQvFuodw==
X-Received: by 2002:ad4:5763:0:b0:6cb:e6b4:2d36 with SMTP id 6a1803df08f44-6cc91badc7cmr3546006d6.7.1729192383743;
        Thu, 17 Oct 2024 12:13:03 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c2677esm1097266b.188.2024.10.17.12.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 12:13:03 -0700 (PDT)
Message-ID: <80220d6f-c4d0-483e-95a1-54a705121a3b@oss.qualcomm.com>
Date: Thu, 17 Oct 2024 21:13:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] clk: qcom: tcsrcc-sm8550: add SAR2130P support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-12-f75e740f0a8d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241017-sar2130p-clocks-v1-12-f75e740f0a8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iRBJXu3ofP8uR00UcaZGJxvbmi-izpQH
X-Proofpoint-ORIG-GUID: iRBJXu3ofP8uR00UcaZGJxvbmi-izpQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=783 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170129

On 17.10.2024 6:57 PM, Dmitry Baryshkov wrote:
> The SAR2130P platform has the same TCSR Clock Controller as the SM8550,
> except for the lack of the UFS clocks. Extend the SM8550 TCSRCC driver
> to support SAR2130P.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

