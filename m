Return-Path: <linux-clk+bounces-6856-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A28C0EE5
	for <lists+linux-clk@lfdr.de>; Thu,  9 May 2024 13:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 332BD283238
	for <lists+linux-clk@lfdr.de>; Thu,  9 May 2024 11:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB86149DEA;
	Thu,  9 May 2024 11:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLJqdM2U"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29947131724
	for <linux-clk@vger.kernel.org>; Thu,  9 May 2024 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715254405; cv=none; b=qpOaWZ1ofBJbjjukiRB7WdhBezCAwMxs/bbwytAMDk1U1y6LwNU5DmFl7UZf9fYh9nsZ7MdR2SU/RHj/mf5a8087nOB2ilRSy7uPqAFUfjD9v8+2qOOqfBjb5DsCDi0mXeMGfALB5UJtigCg3+dRdgEgf7GXQsPe8eJujLMMEvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715254405; c=relaxed/simple;
	bh=D7puHKjXDTv5CLRZ3bEx0o+8HxlulMS9vgRBINXXqrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcmtomU0CHSix8aTDyx5ibSpvV8MR5j6/PoQk9vy+GiRq3iTrlPXL0Qv4DpdnjJA99oMK2h8u6UbKvbkLI6GRl/0WquayeCpiWsUwRdGtLKImqmiN5wwkO1uJ0EwDLM4qKwjL5FRonmnmxm32bKb8jeRimA79+YIF6BTSSCOH+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLJqdM2U; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61e01d5ea74so7250777b3.2
        for <linux-clk@vger.kernel.org>; Thu, 09 May 2024 04:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715254401; x=1715859201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J580ICpcOc18LR2tYPLoMdkVY56F2qD4SEKK1qAL5yg=;
        b=sLJqdM2UWqAeZGdkFtmSl3wLNDNq7zngJ8r8Xt0q5b7CvcXbqd5MyD7Vmms96aIiuu
         VcpSM7SqVeLZvYtFggs+bvVPt1SWQIJ2e0YsVTctIGG9NN3Ad1IYqqiayC4Jq8P4oRuA
         MOBEbA3KXVVcAV4egUq9jKfHONImo31LrKGHiMsYNbVmsbrBrU3uuOAKNPaghwCkc6zQ
         C771mTzZREStEbdWrT36/M6oXNIu+XGSecc4DH04C4HbwHydfr92h5DL3UINzfOZjKor
         ydizMMhF3NgQrI5BomC9eB2eXsCcecRPDPH7Ha7vap1iSo9A6XpIUCzTBOJ4/h4h8hlI
         ZFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715254401; x=1715859201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J580ICpcOc18LR2tYPLoMdkVY56F2qD4SEKK1qAL5yg=;
        b=csLX4cUttzWi/imsoKNBQkIYsZh0FC6Guaf8cj2dadOrKTAdlE6r2GSMPiZ3JgC/qI
         Kyj8cOrEJJFLREb6EC+BKcV06kpFuQ5uQbc08fKc+IB4PJetEhSgge31/KdIhS/TF/bQ
         F8lsJez6kdPGzH5VuE3sUSJgnM+REBkv78lmOZxvKp5JwQQsPwq63f18Hree2sZa8hZM
         ylPPcARNqSR8pzHzrCBkCTpkQt097FeLuKKAi2EyTbszFbW5JZhAVUr1Ub5//VwAYGrI
         v7ZG8EYOrOaybQE5mwbSkCms01Okcbk6mBR6wr8FfHa2mGoCVrlb+3gZ4h8sH4pDcx4N
         7W2A==
X-Forwarded-Encrypted: i=1; AJvYcCWox5Hd3KtFhdKJtAR2Jm7UPRzm0hJsf+DFPm16iYPoP4TT7l/oEHLfRP5uTBomnpIpuZKjP/HQJd7yeOQ9FRP68iDinNLYEiDT
X-Gm-Message-State: AOJu0YytKCJvtRsdiDmDffx50BD8uVK975A5BipQzajKB5GRebVB3v4d
	2z+JEkCl8yFXNFF4b3PArWBTmPj2a225pdioLOvbZosv71A+waRKLi+yzj6/C1wjaViC3j7gA1n
	DUn39dc85UrJNcoDfVbADwTeYTRpBA9/+HNEdMn+sQBU7ni9y
X-Google-Smtp-Source: AGHT+IEfaCfQubu0abV2NMgYTivyKDCF+wOYcdPXycOmHmsIEbvjKhurZcgORLCZE2y7Zlgc68XyimSEPRYH4Jo0rAQ=
X-Received: by 2002:a0d:df4c:0:b0:614:719a:501c with SMTP id
 00721157ae682-62085c79e1bmr53862627b3.14.1715254399818; Thu, 09 May 2024
 04:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509-videocc-sm8150-dt-node-v4-0-e9617f65e946@quicinc.com> <20240509-videocc-sm8150-dt-node-v4-2-e9617f65e946@quicinc.com>
In-Reply-To: <20240509-videocc-sm8150-dt-node-v4-2-e9617f65e946@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 May 2024 14:33:07 +0300
Message-ID: <CAA8EJpq91Ouuwg59CJfM62cC6LsmzOB64ee330c7h0+Pmx_JJA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sm8150: Add video clock
 controller node
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 May 2024 at 13:24, Satya Priya Kakitapalli
<quic_skakitap@quicinc.com> wrote:
>
> Add device node for video clock controller on Qualcomm
> SM8150 platform.
>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8155p.dtsi |  4 ++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi  | 14 ++++++++++++++
>  2 files changed, 18 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

