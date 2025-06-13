Return-Path: <linux-clk+bounces-22975-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D4AD8C41
	for <lists+linux-clk@lfdr.de>; Fri, 13 Jun 2025 14:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 054183AF08B
	for <lists+linux-clk@lfdr.de>; Fri, 13 Jun 2025 12:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598C04A28;
	Fri, 13 Jun 2025 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idXzmazr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2E3D76
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 12:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818219; cv=none; b=TvZoUDnRMlIbawotbToOS2QQXtdSC66eAoZi3sLQgdALNnuROl1vjoM/KyMJvRL5bYit58aCQzPuviozcn0KI9cVIA0u3govQxaFCDoYr5WbSmb7w/cqlavThAEtYEVqiI4LBwIaFPU/FCHWJzhI9m67JdgjSsKoSH9iw2fzZ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818219; c=relaxed/simple;
	bh=m4rkyYEqJtoOiSYYioayX0Hhab6LqMJvW2vTZ7jZY1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+sf1uZ22ACQo0VZR5dNzToSWd1CirN1kYnlPMdLtvBSGsZG77KS7O47GzJFLo8p3j5FCuKDqFIczFC+IwWcNZP/6GknmohypfeMI1Rnxb1MHOrjK3FXcCdh683UFLEsAGf3AbHUkTy7mU+uLT6UW5eWzgxq+OUe4it0FMoESfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idXzmazr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9DNTN027360
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 12:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WiUakxxSN+1nXzFjzlIrZN1S
	nz6/jGOBgrcWU/AJ22I=; b=idXzmazrXj/gGs0J6hk3EJZjvIe6tM4OM0QVuAiO
	XxVdwqvrfaRy9ch8ZrG6ixjweVV2bzKbQf7Qi60Zy5ab4PnG90/RETPqxNKvRZjS
	eiE1P1Tzxvq1lFwRbqgkyQova1PDSGXfPOepNV0zU6mKAvAqf/V+Fi/GsRivWJeQ
	jqhSh45c7Mt8JKnya7wzmX/xJ4NtDYfpMh5IXhSwKVeMg5IezhsgEbip3M6izkZ9
	aIJ6rpnB3vdu9YX4A7iy/6i1Xty0PW9KjdILPZYVBE1AyScKdPJ3bRsuxXYKiXTj
	NcrY+NFMqfL4tPQ2mUpRXoPGeeP0X0pZgZJeV68/Gt2HIw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhjd2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 12:36:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb01bb5d9aso28435516d6.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 05:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749818216; x=1750423016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiUakxxSN+1nXzFjzlIrZN1Snz6/jGOBgrcWU/AJ22I=;
        b=PcHaew9k/n56EwG6hh9Rs5t3u30zGX0mibwuwrdEkF4ZD/x//FsNBpom0WT5c6Taaz
         5leQQHcbre47P/akkuIEtjGHmTEXYFtlP3cDtzwn9fH7JZm4bP8od765kpjqoEEJmhbU
         rYYb5HFm/zF1YkahioBtU84Kji+s63LsNiaZzYd1um7HsPDzoKM8MG15Y/kdV7MwCKl6
         oJ/dlozGFYoQ5k6cbLQSnudFQmgEdRAclijtIvCiTYQimiDtalNOTrqX3i046DW/KMeS
         9HiBhopcmYXQWMB0cEo6UY/iTuk50vBq582YYU4VnYoYQcwUblaLKlTf9grcNWRrkdxv
         t97Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0XhvbWICUTJaHJy3qTVoZxQqTWq0HlM/gzpv7Q83y8uZrfpANJxG/oFj+SXzm4Nycoztr+ZYCYN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqwjtS0q4eBBWeIytDT6evKqNgmqGI2FdNzcbN7M0wWyHT/Wyr
	KHlXzexXXrhgrz2/dUVb7Qawa/VYqcvn4SIbqsNR2O3graQEI9bpT7ZiRshK7iNm3M2UoTaxLWn
	jjCRmBGajy2awrFwmUS64Ppx7HXz1o9QLsiNFEmGll1D1UmtNWjSkaWfd7Wj1XMM=
X-Gm-Gg: ASbGncuQQ3cL/XpSq7PWPU0dbKiXOY3S3CQqXkcb0OYSFxggzrx78VX+XQ5RVDnBYaD
	gmXC/sLZWOOZg+/9rUGahdQhAJFaAZlJNTNooeWRwNuJ+zf/9HdXosWPEh1ODBG5C6FAau/iSuc
	JMo2FEaJX+LqzZk2+ME1ACrkZ2p4bFYhT1YHXisQSE5/5K2fpvq8RJfNSuvEjfO87ZsZN6RylW6
	kBcBLS8GbtHNe0p0xe5GXdxXCawsryD12XiqJuCIsBEgrLYkTBjv2G0bn97h5EzfAUVeb6Ni+8O
	cWsZl3srsBnzQyr+RIFaeaGxamyvNzjTZAovJanUCszydx1anQKL2NL93qfkIFJmQTWGpZEJiqB
	RWa2RE20Yf+seHdFPYG8t4GalIDf2OINxazw=
X-Received: by 2002:a05:6214:519b:b0:6fa:b1bb:8315 with SMTP id 6a1803df08f44-6fb3e59a061mr40470786d6.6.1749818215672;
        Fri, 13 Jun 2025 05:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKBgV48W2nf8QXu1t8reMR4IVWaqjw4aDfebN45a7V4MAz0VWfAE0OjLFPbHkgdIEljmvRgA==
X-Received: by 2002:a05:6214:519b:b0:6fa:b1bb:8315 with SMTP id 6a1803df08f44-6fb3e59a061mr40470456d6.6.1749818215294;
        Fri, 13 Jun 2025 05:36:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3304f4a8sm5397681fa.3.2025.06.13.05.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:36:54 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:36:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video
 GDSC
Message-ID: <vsl74hdwomghugslc6ol7aa4r6ralx7fswit6eiw3674xxgnr3@pigmgoxpiapw>
References: <20250613102245.782511-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613102245.782511-1-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684c1b68 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rn4lbcPYODbMvauTXpgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: gLSOZ56e7KQPfHi8XgkjMNiy6h0yirFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA5MSBTYWx0ZWRfXx3C3sSU76AQV
 D8v0ArdtXbbbFm9i4rcLKxle92U+Qd7plOS837V4XXrOG76WtLrn/egyMwGv6qRD7l1w5i/5i3U
 dQB5Pvi2MP9q7ihG63tIh1dAy2HcBLdXlXeAUoOmEB80KjoyRKReesUXauLUIdKmRAh29MF6mN1
 P67IRTLqq+LlOSo/wM1pmM1ZAX1/C3NgNnvJYfnyVlVHfbDDKE0YKlMKOa9mrN7tQ6B+6VDEmeQ
 rjtq3EvgITN5CrGL8tnFfvRhcqK73GS2ryeZm8Knbo1VEZPfzM3kaGV7kdS0kTWR/Y6bsjPW66Z
 oWycLdsn3r6g8/Ix67zFkaG0TEdQU45voqnt6L5RKBspf8xpkGBKJc5g/O98Wupq5rz0N55MVA8
 9nDtdDlNpVSx3XJwigL9CX4oMfIJ9ZxOtT66SZbjTbTXeluCL3rnXZ3fj7qeNY1H41sYqP5m
X-Proofpoint-GUID: gLSOZ56e7KQPfHi8XgkjMNiy6h0yirFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=838
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130091

On Fri, Jun 13, 2025 at 12:22:45PM +0200, Loic Poulain wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcm2290.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

