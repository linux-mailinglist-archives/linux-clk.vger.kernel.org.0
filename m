Return-Path: <linux-clk+bounces-20189-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC58A7D0B1
	for <lists+linux-clk@lfdr.de>; Sun,  6 Apr 2025 23:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C29EF16F293
	for <lists+linux-clk@lfdr.de>; Sun,  6 Apr 2025 21:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A781221772A;
	Sun,  6 Apr 2025 21:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRXyOuRF"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4561A2547
	for <linux-clk@vger.kernel.org>; Sun,  6 Apr 2025 21:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743975154; cv=none; b=VCRljn9PR/6ia0nILVAyZmaIS+p+0kuxLALUBUtfM7Gh0GuXZ14UTjZS4+++FPb9/POuDsPY261fGK0TbYCFG6UWIo6GnGoYqFF/YTjXLwY3cjpxL5B3lRbByVUq7HwmxKh7iu8i8u926UrGXXezAsk6jZ1n1ua4Ho1Y+vgxXJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743975154; c=relaxed/simple;
	bh=S7UwqcJJoO5b9nBl8qVyAYQ7e87sp4oTdoEjMGzFTV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZor7NNiOelGB0UkA8LKaL2q8lHETM1da3j3nZs/pefOshr8xgj2IJ+p7SWajX16rMMHW2mVId7epUiZWSAFb6taLXejzIFcIgY5hOSEJn+lkRSlqHv37ABQvBhprYoMPdX/qcNbG6UDBCQwrfPDKZ4GOm3duUJqFVEp/qN/aNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRXyOuRF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536LG7nk016739
	for <linux-clk@vger.kernel.org>; Sun, 6 Apr 2025 21:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0tjh5MMU03iFzSO9fdJiKaZd
	Vjsqa8YnKVuGo7pzdWg=; b=SRXyOuRFW06+fUjDKuBWELpdmCLnwtTHKnvLay/3
	SMy40zPH0ElyOgjyGKFWAJx9X0SP4Ggw+naoC5aWIAwhHooAEhzZfJMq3NNaMxJC
	t1JcpH0DnlkqO8lol+GnekAXsWJt7oCE9fyTF9ZnoYHH7r6aDzKWos0r77gFCTUK
	DgNlp3+EvS5eWafLR+rgzP7HEfWP98AByJB0gQIbBBQT/18ipYEVeP0HG3vKL0zG
	+hdqVSkpkCd2oKSKn8OShkzTDyGX9WHtTHJ6nrwmwO41hTK/LdoQVK0qG4wf6Ma7
	CXfIKQVr3ehdmedDamOfN6+peC56lsv1brz4fuAzO/yHqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcytbrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 06 Apr 2025 21:32:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c5e92d41so622555785a.1
        for <linux-clk@vger.kernel.org>; Sun, 06 Apr 2025 14:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743975150; x=1744579950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tjh5MMU03iFzSO9fdJiKaZdVjsqa8YnKVuGo7pzdWg=;
        b=ZWsSZCWriUSlCOuQ44jFauyVZ8I6JB/tPF1KJwBacj6xe0BNxqsDzO6j5CArK1hlsx
         9zTl/Uh+4BkAHfE8ZeXnGEh2t84znJZEFj7AdADjhrAqsfqOWnLI++bLJoS+N8PZTtKV
         FKk8GZ54TvfDfu4EE/9DG6oD6czAbKrz6lonBlvqpIW81Vt88gIWzDT4I7VxQyB82TBQ
         yCfBgOuWH9Xq+EoxriV0QPQiS0Oua+H9x9+T8sQO4/jmSTKwHgKIsFXidWsv70PKFtIe
         +NkxfzNqLI1EwUT2JEHUdPATQ2s9p+5ODv9++IJLuK2AahHiSW3qMyy9H/ZKi8eMbifk
         VD7A==
X-Forwarded-Encrypted: i=1; AJvYcCWhnGdod/dHwgrhH+eMCTHR6zjRW2Iau/tUNVUEiJdpbrD90zjtk6cn8vH2/Z32pd8FKt+NdX6DPbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YykBxIaAwZ4076QFdnp9wKM/Nz/ncoroe93j1GZt+k3FCwKxb0e
	c/pzAsBl5RYQ8aQ6PVYOjVyuORb1P9NoeDr7SThOl5kPoaQvLShVBYeZaGSdH/0kewRrTfg9CQ9
	wtPlkikQaWHI5tI/+ZJBhlty3pwtQwgcOj18MqjSMPhEuXHXNIDIV4i9yIig=
X-Gm-Gg: ASbGncvPdfHnSv+CkhQ7SSTIsXCWD05PwC1NzeUFNcXeJzUv9TG1gr7Tj4kREhwWvXm
	WMCMjtFfqtSuUiHORwzgRVJbVcxuyHeW8WT8OEWZAsSzFWc6BWqb83Ph1RdjUxGeV6YgCKSPetv
	NV6/Y5/LVHOLd2zmfDMz/XRObYHR9/ch3nZrWCpBgPR4+UJWeAtUk0vHieu6PefJdvyGEjl2JDZ
	azHZ9FhRxi7FJz81T4pbqOeVCYaapdgRJysU9/fWp6WFGWeDr9GiuER0JPeisgm49PBVojv8FBJ
	595g2h7V79dpet9TKGnABAqzos8sW/Z5/jHbzy5em+O14+Pg56ITVZNGFs2ATbnq4ls1r2Y+N6X
	Cq5k=
X-Received: by 2002:a05:620a:4154:b0:7c5:49d6:733a with SMTP id af79cd13be357-7c77dd61f77mr1098207885a.21.1743975150504;
        Sun, 06 Apr 2025 14:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPxi/Cy4ZI0jgCL/m186L4t9f/4IWHa+q0KVz28z2I5NuRx0R5Dr+tUUUDfiYp2TRM9UhMHA==
X-Received: by 2002:a05:620a:4154:b0:7c5:49d6:733a with SMTP id af79cd13be357-7c77dd61f77mr1098205685a.21.1743975150149;
        Sun, 06 Apr 2025 14:32:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bcfcasm14148611fa.79.2025.04.06.14.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 14:32:29 -0700 (PDT)
Date: Mon, 7 Apr 2025 00:32:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rpmh: make clkaN optional
Message-ID: <lt2v3pw4byfdmmgwo35sppmempnyeeu4hsl6eoula5o4h7q22j@z7dmakunwnuk>
References: <20250404072003.515796-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404072003.515796-1-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: B5HqxcEBSaEo5F9a5eSuWh2ImA8VqEA-
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f2f2ef cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=AZcm_5yHBFW_TKN9jTcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: B5HqxcEBSaEo5F9a5eSuWh2ImA8VqEA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=818 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060157

On Fri, Apr 04, 2025 at 03:20:02PM +0800, Pengyu Luo wrote:
> On sm8650, clkaN are missing in cmd-db for some specific devices. This
> caused a boot failure. Printing log during initramfs phase, I found
> 
> [    0.053281] clk-rpmh 17a00000.rsc:clock-controller: missing RPMh resource address for clka1
> 
> Adding the optional property to avoid probing failure which causes
> countless deferred probe. In the downstream tree,similar workarounds
> are introduced for sm7635, sm8550, sm8635, sm8650, sm8750.

Nit: SM7635, SM8550, etc.

> 
> Tested-by: Pengyu Luo <mitltlatltl@gmail.com> # Oneplus Pad Pro / Oneplus Pad 2

I'm not so sure about this tag. You are expected to test the patch that
you are submitting.

> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c7675930f..68704c4f0 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -66,6 +66,8 @@ struct clk_rpmh {
>  struct clk_rpmh_desc {
>  	struct clk_hw **clks;
>  	size_t num_clks;
> +	/* rpmh clock clkaN are optional for this latform */

RPMh, platform

> +	bool clka_optional;
>  };
>  
>  static DEFINE_MUTEX(rpmh_clk_lock);
> @@ -648,6 +650,7 @@ static struct clk_hw *sm8550_rpmh_clocks[] = {
>  static const struct clk_rpmh_desc clk_rpmh_sm8550 = {
>  	.clks = sm8550_rpmh_clocks,
>  	.num_clks = ARRAY_SIZE(sm8550_rpmh_clocks),
> +	.clka_optional = true,
>  };
>  
>  static struct clk_hw *sm8650_rpmh_clocks[] = {
> @@ -679,6 +682,7 @@ static struct clk_hw *sm8650_rpmh_clocks[] = {
>  static const struct clk_rpmh_desc clk_rpmh_sm8650 = {
>  	.clks = sm8650_rpmh_clocks,
>  	.num_clks = ARRAY_SIZE(sm8650_rpmh_clocks),
> +	.clka_optional = true,
>  };
>  
>  static struct clk_hw *sc7280_rpmh_clocks[] = {
> @@ -847,6 +851,7 @@ static struct clk_hw *sm8750_rpmh_clocks[] = {
>  static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
>  	.clks = sm8750_rpmh_clocks,
>  	.num_clks = ARRAY_SIZE(sm8750_rpmh_clocks),
> +	.clka_optional = true,
>  };
>  
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
> @@ -890,6 +895,11 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  		rpmh_clk = to_clk_rpmh(hw_clks[i]);
>  		res_addr = cmd_db_read_addr(rpmh_clk->res_name);
>  		if (!res_addr) {
> +			hw_clks[i] = NULL;
> +
> +			if (desc->clka_optional && !strncmp(rpmh_clk->res_name, "clka", sizeof("clka") - 1))

Carriage return after &&

> +				continue;
> +
>  			dev_err(&pdev->dev, "missing RPMh resource address for %s\n",
>  				rpmh_clk->res_name);
>  			return -ENODEV;
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

