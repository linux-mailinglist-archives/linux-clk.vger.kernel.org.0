Return-Path: <linux-clk+bounces-30014-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D09C197D7
	for <lists+linux-clk@lfdr.de>; Wed, 29 Oct 2025 10:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C6254013C2
	for <lists+linux-clk@lfdr.de>; Wed, 29 Oct 2025 09:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEED301037;
	Wed, 29 Oct 2025 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJVb5m8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V98/bUpT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA682DE1E0
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731270; cv=none; b=Y3TzNFDw5A8cq50Ziwcy3eaTqAsF1eDIw840qeD1Mlk0uU5B156II8bfJhFjs63ViKrVfam1xq4jKek/2gNITjwyWcMd/EWmruvbTKGUpywR8Sqm+u+Pqecgk2utim0H5oxRC+qOjQy/uzOHO+gO3+60EJWq6XChwI0eNIizFbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731270; c=relaxed/simple;
	bh=i39ojBMoVOOXwlgR5HNEDqk1tN+HVJVkAxzx3lhkPdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGEJgXmAN0cOutDu9lLuw/aHRZ1URocZURA+Y7hNiP4BWToeansrebmv5VxD006tiaa1xYdVVQBHdzXih2nqi1kdXq1f2+3tdbmGO3R7DGm80Csh/ZXKi/+6wKRuich4/NWUORKqm8q/5FLWuO2CGmQ5R364ojXPaDZ07QGFbuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJVb5m8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V98/bUpT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vKLx3755683
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 09:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JpfcAmuJBeUQrVw8dbej9WYWTUCXHqZKpDrMkUB5wGQ=; b=JJVb5m8E9Z5Bvmzk
	KnodKTgWchMqXP9CHdY94KhCpntuT2CGYhvEaKxNVd4eIqoSo8cdpUUuRv47JCXp
	Jr+MXwhQEQgPUgVKHW5VwnsTbIOdE1fFgZUeCoiRLqTBmeLQqUqkRwdzAg2RPsKg
	HfiHPk/L057QDJoUKly0KppQUM19Kp/GsFQg3iwJJyK+wDpCkqbv3+wDAzWpDuck
	akXtIm2NP2I6SZC6NgWNXm1ImzYQkP3laGD5v7z8EMWt95u4Gf2eQ9yOCpw05WUZ
	J7oyqhZkht+zKSL9rb4AG/v/WSUAg6xbZUFZwpjbrowU+EWt652zaANG9IyqBKOQ
	7RPuPw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a022kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 09:47:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c1d388a94so19470546d6.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761731268; x=1762336068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpfcAmuJBeUQrVw8dbej9WYWTUCXHqZKpDrMkUB5wGQ=;
        b=V98/bUpT+K1MXufoiXOZhShqwYPdwf+kRszsoydsgssaKoJ52OjzMnaLfD24E6536a
         PL6PNqruANskIrEGT9/WOGes6iqO93ilerjnHAOeOKx/ghFS/KeWCo3ZrH682SvxcRhe
         eKtRww5rOWz1x7NP8xJiKtL1VlwzByFFwuQNI4/4dy9IA+ckkeXnLKiBQABaPjNuUVn0
         bQGT+IUhB25HYOAicOxMCJudfoCniAuIVpRG/ktBFm5FikvF9RpVyxFoQWH6mBKn2zai
         IAaKdyyBxf5kpEUYUwZXtwcf+9UgazQxOnLHj9t5tZo3qHUjeLRWn7CIEecwr3qYRDot
         8gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731268; x=1762336068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpfcAmuJBeUQrVw8dbej9WYWTUCXHqZKpDrMkUB5wGQ=;
        b=FZXVBFAYQQ44dURVqX3TI6bO2E36vTT2MNMsABdQaOJU6oOdpEeNorj8A8YF8LlF5E
         vCsjzPKzsb2Jdkn+hgKEzQ8nCNPC/uK2W3Baogv5/z2bh9R/nl8kCXXTRVz/rqF0dcsH
         yQSEMGwYYJa/ZTqrzRhdEx3ismiSqpwDoHnXVz/2/b9kKeHZo1qrbQ3Xv4tutC5g2vJK
         PZbZhctsFS5AGI11eTxtNVm+O0bJyg581o95ah4keOJLXQBLa8LxFxJjJthIB3H3V/aO
         VT/VUon7fZpFwqryJdThNuEd426MW5YkWgKhGLyVbJR/5mDm6vrGZ9cpPxRh1x9VQ0OU
         6L0w==
X-Forwarded-Encrypted: i=1; AJvYcCUB3On9tv8J3Hv+vDIx4i08kjtUOCNpVuavYfdJEplpDn5rlFxqkZXNikiAfiR5bkxd6L1c7fum440=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZwo65BtWmj1xxlhlw7TDE9nVOlQDCTQgDB5c/Nan+OuVt4WpC
	Z0GmHmyoXFcHwHmwVLlqj4g9AZzHFQWmZkdhxUFhkqLSk23WK/HnSgykbl7YpIkzmr8vXG7BzsQ
	hoJaZ3y+RJT09xM1Sdm3IMhCrCmX18xt2yOO2A1i+LhblYEGp1jfsOknFavrlsSc=
X-Gm-Gg: ASbGncvR22RRS5JAdTiUPdgDPBeY+DciZsPO+U6ooO1NLJR8OgYyv0ze33buOqX/D8+
	fwxI/ZJc2kDIyiSzJwJMvdBdO828eWGe9+c8ua0wqr0yoxebRsyFlc5/652Mvl1XpQ2xVmjP1Qg
	qLmORcHSSrEVOxtmI0ml1qeRv64cVI8aHPPNOrq7zJ+L49oISa18y7pPPKnsczdK+wMCDCdhTk/
	9j0OyU1RCuPbxMNB/0mTTmzoZpttXxYcc6GWiVkkXZvQ4UGXhfbeLahrXae2OofLVXVCOG4Ae8S
	7lB5mmGNrfCEeFo/eUk0t0dzRer9hgjtHB3HAvAHwHs3ekYCnZupQJEHwqX7Tik31ewxlinMRlU
	IdRFpwObu/yEDqMGnGG1KmVmNq/URVMSPWm2PDdVN2Qb0qwA4+M2/SJqT
X-Received: by 2002:a05:622a:48:b0:4eb:a0f9:628e with SMTP id d75a77b69052e-4ed15c05fddmr18585301cf.8.1761731267786;
        Wed, 29 Oct 2025 02:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJt04A9D6dUg5RLppWjcNFCeaQ6AVnQltHgwrGTU+2QjaMTswNXk0DHlEjJozyKlLBnm1Gzg==
X-Received: by 2002:a05:622a:48:b0:4eb:a0f9:628e with SMTP id d75a77b69052e-4ed15c05fddmr18585161cf.8.1761731267283;
        Wed, 29 Oct 2025 02:47:47 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b704d7a9867sm1070966b.46.2025.10.29.02.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:47:46 -0700 (PDT)
Message-ID: <c361ea17-7480-4a10-b446-5072e8edd76d@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:47:45 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: gcc-qcs615: Update the SDCC clock to use
 shared_floor_ops
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20251029-sdcc_rcg2_shared_ops-v3-1-ecf47d9601d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251029-sdcc_rcg2_shared_ops-v3-1-ecf47d9601d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MyBTYWx0ZWRfX/H8vXuw0TSQM
 aZcGDoGNL/9r9ro38uch+e+pGt2Wgvc9NFHNSORFSnY8n8jPy6Fj63ZujxG6HVXac/rHNvBohoO
 o2bFlM4MNZ9+BN6kkxl58jGO7lp3BOHHYTiZKLC+TZzNSFG51AZVtxUQrkXrGuQUL0zIJNjAf5T
 owtU4KWwHuqhZ0c1ynP20jRYEb5UqJ9BLFWimZFaXYCbgdEmIT/UVGsu782OnYkwbfxaLFGn/hC
 atwAp7ExH7Cwt/vXEr9iWGdkJesDm2W792OUYDHisZTRJ6rEU/uXZQzD45TVpXl/WxQx8mkdLzC
 iHhcNGDtBnQLNDLLqIszZv1Dk50qMh30iJ+b8xOCZepk6RqESbS8nLUUBfP6Li+d9wEYMyc8hxe
 hIg/RAIdtB8N9DXqBun26byOu3B19Q==
X-Proofpoint-GUID: y1ApIFGcxo21gnH0KjjTlknwxCJT752f
X-Proofpoint-ORIG-GUID: y1ApIFGcxo21gnH0KjjTlknwxCJT752f
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901e2c4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=vufs9Q7Sv56qtQhtIKcA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290073

On 10/29/25 10:37 AM, Taniya Das wrote:
> Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
> boot. This happens due to the floor_ops tries to update the rcg
> configuration even if the clock is not enabled.
> The shared_floor_ops ensures that the RCG is safely parked and the new
> parent configuration is cached in the parked_cfg when the clock is off.
> 
> Ensure to use the ops for the other SDCC clock instances as well.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

I noticed none of SM8[1234567]50 / hamoa / glymur uses _shared_ here.. 

I see that e.g. SM8250's downstream sets it though - should some of
these be fixed up too?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

