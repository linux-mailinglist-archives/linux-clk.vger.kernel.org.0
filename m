Return-Path: <linux-clk+bounces-19905-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE352A733C1
	for <lists+linux-clk@lfdr.de>; Thu, 27 Mar 2025 15:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0083BF0C4
	for <lists+linux-clk@lfdr.de>; Thu, 27 Mar 2025 13:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5871215F7D;
	Thu, 27 Mar 2025 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAuvpLcP"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB8C215F56
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083911; cv=none; b=USQ3GJDYvvtk99SA40LaX9uoOUdE6RLPxFl59uWg7XQkHLSVJPNCjTxmUOiJ/Ma0iIMLsfqzGRcxw7OHzbJkRlWBKr6tbIz99XzHY+BYxPxJFSvEI8THBKwihCRKz5QSuZ8puubo9GjPEJGR7+yHF5hIxEjF5K56/8mcEScIxXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083911; c=relaxed/simple;
	bh=VNhnJTx5qRiv6L7pHpE6IqT5tyuTXUiIcd6P+EYIWHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/wD+6XguroEI55WFmAjy2CZsSI4PFqpZ4REgHMVamRxzQSKGDkCd7XB3FtTxZqNFTynvUglYCZ7iSgTIzwnUfLnVj+QfSKTvGsWqWYS1zZy5zhzoI9AlmqmUNMVDF5scIQJHemDUVWpNxzkg8sfTfPj9+mYlBfncII+4z/K2PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAuvpLcP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jMCJ021827
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 13:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mJizpHZUN+i8wo/tPHpzrb6b
	WNEg1aYOUdryaSVM/AM=; b=iAuvpLcP7awKlXEdRwZRQZ/zC2F2kXy/bW5MWp/R
	Wt6qPsywqj/sGaUp9r1D2o7cHjUXenCyT35ifi0krrfgH3jOIsqvdGtppctphe0n
	+ka+EyaCB+HkgqwyRkBoUoSZpQN8iZGFep5diCOTNrRkI3KdhKN5MpTao17sk9yC
	GiBNNgBVEMIZ9XHtM4/Sul0HIvsolvtfyf5q5hWk8YrzwxVfb9pNW3B8k1eSUfxK
	RBq9SPHqdJ+lnpkmfwFyw7PKqdSP96NgV24uRxes3yw82t/X2I7g4WOimhq8DV/4
	REibwwOvh7IB/7v8nZXFWMQzf4APPMSFk347/P+dON2ZYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9phwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 13:58:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ac559cbaso175293285a.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 06:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083907; x=1743688707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJizpHZUN+i8wo/tPHpzrb6bWNEg1aYOUdryaSVM/AM=;
        b=QLbg+h3z1tabSiUcpEldmkOGxMwy+9Rs/xCnOf7SETmZREWHxKegUB1vVozLlDVbeM
         HeKVkEskChElDuqRE70joxMQwtj5VCM8nWkjD8uTEOZyEBHejKkN7rBeLRCv0UbgJZ2Z
         cbJfCLg/AHIJmwqjoaij4jUZRgqkE0c01yarmuQI0mOLJhiEktF455P4Gyr9vHgqp/L2
         JstLAuU46/PO6EyMJ1EIOSTQmohTAc09ubv0M4K3mdQcX4LKH9fuQQbNlrxSHUAWx2te
         lc1eAhs7gQSHho6CrvPqbL4ylkJnJe/wLtg0awmZGUx0CZvkG91XjQL8Bt5geJo14vcs
         ABZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1E1E8/Y8AaD5ZLvpTK1H8/nXqZr36PF1u1i81oT9FAFoS6jaUy9x8mNhU4uGWvCtFUqc82PYpTqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyII1QATD/I6B4+MyI5L2OxzDNyqvVUojkOPL19baEQLY8inptV
	5oziWL0hPskn8uu/96R51DITbjBV3HLj3pi/J0FE2BYXIpzWwIsVE7Wy+k4pdTcux1BS+PAOoCu
	quKpzVViR8BbApiTgtsKjnl+4bN9wlwEPhjAkpyxa8swn+/04hHYGK+qOTNI=
X-Gm-Gg: ASbGncs9w4lB6zxb8HVMG6X30dqcteoOCqExhlHYwcmtcdnHtu9zpQ3cF1O3gjJi+dS
	BG36EXuu/D7D2kdbAYatLaKalqNE+Y2UexFHAIIP/2Pbx/FLKpYM4TA16Iq7fDrf/ca9d3dCgwz
	wbMlacarUDhwwbrlNcGhqu2X6HcxrkJNrg4mRjUPqLfChcVemmTIfHglB1jOY0b/T444LeD0pFB
	pX2dCcl2kwdS/e2bYaLNOQ6THZT4Pga7Vg3MHuBaboEY8GDGcnWcuT1Y5TeF0X7oljhWDscOglQ
	Qk0iOf8kcV/6zXHbTxvYoqSrf8uWJj/R8XpthcZ8Zt/nmb3ItpOcMKlH5Tr3NCDf99HPs4ILTJN
	WQ+s=
X-Received: by 2002:a05:620a:4003:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c5ed9db31emr524825285a.1.1743083906679;
        Thu, 27 Mar 2025 06:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVvUacZ3ZPb6poXo5jHT9rs19paU+bmSiQmV3b7QDYst4/RJ6RbhURuqir88JHAjFc/cgqig==
X-Received: by 2002:a05:620a:4003:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c5ed9db31emr524819885a.1.1743083906127;
        Thu, 27 Mar 2025 06:58:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65126aasm2106962e87.257.2025.03.27.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:58:25 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:58:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 08/18] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
Message-ID: <l54frz6ey7s4ezedklup6kiwwvo5ayxspt5ubazimd6nuhzqjj@j75s6qtn7zp5>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-8-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-8-895fafd62627@quicinc.com>
X-Proofpoint-GUID: 3JlKWWwDQdgRratTup74PavirGNf__sU
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e55983 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=CXQnK64LRHhqnx0rWp8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3JlKWWwDQdgRratTup74PavirGNf__sU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096

On Thu, Mar 27, 2025 at 03:22:28PM +0530, Jagadeesh Kona wrote:
> Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sm8550.c | 55 ++++++++++++++++-----------------------
>  1 file changed, 22 insertions(+), 33 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

