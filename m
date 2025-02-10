Return-Path: <linux-clk+bounces-17813-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D60A2F6B8
	for <lists+linux-clk@lfdr.de>; Mon, 10 Feb 2025 19:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B7CB7A23F9
	for <lists+linux-clk@lfdr.de>; Mon, 10 Feb 2025 18:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D650C256C87;
	Mon, 10 Feb 2025 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csph2HZM"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0882566F3
	for <linux-clk@vger.kernel.org>; Mon, 10 Feb 2025 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211487; cv=none; b=n8LJyzVnEtKjBkuo7Vp74dq6X/l8F6HMwOrK5YHFzOszQt23UgeTmtfTWMUWFppBX2vq710sCgy8n1kYlz2/YWgaLBEgcgJjtKeQgQywXK4V0B4i7jVhVRw6lIEG39H9nF8LpB6xI9RdYo8NLMN5gQV0u7djBqTfN/jnTIk2Dck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211487; c=relaxed/simple;
	bh=qinDKoM++ZG8IXfNfU1TPPoop+f/Y0BBrjoaVcAsZJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTWq2FE6dHdnTqNQV6VfGVLbR9AJkMGHA5Ac6Il6RAqA8krSt/R2DRgtZ4jl5le2WW169d/vrS+1aC6gt4ywHJZ7HECJb3xXJ8FMXTSgaXsAmZIH7GDK0ffG3xyX895Hs/IhObVg1rlAeHyyfFT3gcChVHQnzsPeXOWGqFW5PAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csph2HZM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AA4uwh002259
	for <linux-clk@vger.kernel.org>; Mon, 10 Feb 2025 18:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7hH0YIMetgk89Mc/p2t6ycOF8BT5TouaRT/5posNTE=; b=csph2HZMhsirrzl4
	T303c8Kj9wX3eqW3ayV9n+Moh8D0+ZH/4Pm5VXsxjBzAEsuxt+wGJ6LtmkvQ0NW/
	oYg5OwMfheB4W4nnuiuvyfl94VNUigU0UAqycfsDbVe+lyvcxq9XJzduR3rl0EXg
	n6a/qZoPBqKqkw9bJESlqvQDyd9i/hz8C7ROqQ6w1D3JCZqQ2Z7ihRepBkcuHqNy
	At2zzPpygI7S5rRwdQm/INwpUeBsC1SSSKoqsPTr9rNIFQV77XgRocLKxKq8NjjD
	2h5jFWF/hr6FhJczYYpnNPnaYgN5RY7wdGSXQJmLC7EANr/PybDVsympdx2dacx8
	OeCd6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyn7fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 10 Feb 2025 18:18:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4719173db00so2559521cf.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Feb 2025 10:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211484; x=1739816284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7hH0YIMetgk89Mc/p2t6ycOF8BT5TouaRT/5posNTE=;
        b=rfGGSGu+Kjk9O+E8kZgRF2npknlnvoJF4YImFQ3e6/KcQbzQykzY3ArYorUqMpIhQk
         qerEcRpo6/Iu6VmE7c3rqJC01Q1fkSAeUx0aBbAfEOxM6nUQCrADYXvMcpBFjHf24jsN
         MWyLaqHXAByW6blnqlx18NJcahKMpnWDdk3sBSfDtkVlWj9pdXFe5XgD4aaccjXKZeZg
         Ue6snHBWncSPJLFZIrF7cEeiMbRyeE2nw25rdke40LMuG7hbp0M4+c9Cfr9pfd5peYdH
         mJk4hB+1MIZ36igHsmESkK/Af8zH+tOzdYdak1qO/KHRVkDwWp0ALP8xnKCgJo7+I6or
         HMkw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Uqwi9ysn/tu3Spnqd6Xxg+O03DgVrpKUWK2lHutDWESSHPfFOvXnI9r2DFYAmoJ1RiPjEVTwoyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaD9kxb8qbAVXK5SKxl9JPuK9+LsJ1Q6SR6ikKfkJPEcOUBvip
	KqzeeKZzyUZypNhkJ4WcOIazGadlZJqnaui+3tFHdjSemYEhFpZV8tPRBEXo2T9Zlx4nAcOlUH+
	HZ6qZaVv/gq16PpuJffzSXc2uu9pu9oQFuADEuOJ3vFnkIfSrfdvqDbjMAT4=
X-Gm-Gg: ASbGncv8H/9vLNMbhimBpJxwekkhZEiKz3u4FEmxyf4weQTVOEaSblZiU6M2nbPXUOK
	BwdPlQQQvk90Hs+OqHD8ggzki5ETswFC/gqh/a1tdZ9caeHCltuQJ4kzB+/FSULthPcvwcqLIiW
	ShadyiIlw/s+n7oZY3skvyNARhKFyN8FRqvVlxOD1Gjzae35tfzl+uMZNrrFuQrqgmz9dIgBrJG
	Gm8uUGKjmC2DVmocluHsKoCewX/G7l4z+yqpu8uWDGaJIrKIK3ZD4S+c6bseSFMgRJj+k4m4lZ6
	6wFH+F0ccm3sFjT6OIRriG+UQ5yCA9owddiPn+/fbJxy7yJGhyn20hQKvEw=
X-Received: by 2002:ac8:590e:0:b0:471:a14c:6847 with SMTP id d75a77b69052e-471a14c8663mr1571181cf.5.1739211483901;
        Mon, 10 Feb 2025 10:18:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAXNmuIboEgfBo9SyYi4AwkYGvwLe1amQ3mO7hi9Y7qYBpldJid3eLK1F44rXVgl2m4+M4pA==
X-Received: by 2002:ac8:590e:0:b0:471:a14c:6847 with SMTP id d75a77b69052e-471a14c8663mr1570831cf.5.1739211483535;
        Mon, 10 Feb 2025 10:18:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de44e4bc17sm7129357a12.70.2025.02.10.10.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:18:03 -0800 (PST)
Message-ID: <ee166cf3-4486-4172-a510-bafa1624ab79@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:17:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] arm64: dts: qcom: ipq9574: Add nsscc node
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, ebiggers@google.com,
        ardb@kernel.org, ross.burton@arm.com, quic_anusha@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
 <20250207073926.2735129-6-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207073926.2735129-6-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yk8n2BvSwJ0SrqqTRW7OLgiE0MsSLxOS
X-Proofpoint-GUID: yk8n2BvSwJ0SrqqTRW7OLgiE0MsSLxOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=874
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100148

On 7.02.2025 8:39 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add a node for the nss clock controller found on ipq9574 based devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V9:
> 	- Rebased on linux-next tip.
> 
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 942290028972..29008b156a7e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -1193,6 +1193,25 @@ pcie0: pci@28000000 {
>  			status = "disabled";
>  		};
>  
> +		nsscc: clock-controller@39b00000 {
> +			compatible = "qcom,ipq9574-nsscc";
> +			reg = <0x39b00000 0x80000>;
> +			clocks = <&xo_board_clk>,
> +				 <&cmn_pll NSS_1200MHZ_CLK>,
> +				 <&cmn_pll PPE_353MHZ_CLK>,
> +				 <&gcc GPLL0_OUT_AUX>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&gcc GCC_NSSCC_CLK>;

This last clock doesn't seem to be used in the driver - is that by design?

Konrad

