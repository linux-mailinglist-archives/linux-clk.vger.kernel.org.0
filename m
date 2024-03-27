Return-Path: <linux-clk+bounces-5103-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 019B888ED8C
	for <lists+linux-clk@lfdr.de>; Wed, 27 Mar 2024 19:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32EAD1C3257B
	for <lists+linux-clk@lfdr.de>; Wed, 27 Mar 2024 18:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6AD149E0F;
	Wed, 27 Mar 2024 18:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTAUPWts"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD7B12F5AC
	for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2024 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562530; cv=none; b=edrom4yy3SfT8OAvmMdNM5yFb6kwwsT5korSlZlFUoBoMEUFqKRQsYSzdYOlh3OrbAwVR8svEhvM4WFUT/JifCnNFfOKrsuasekswghAO/dth3LXRnUlxuEE38PfTCZydYR3zgBEavWdaWgC/TI+0ysZC7/HhOVmYn2P6q0YHtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562530; c=relaxed/simple;
	bh=5u26rLbRQMp5PLZVa3f+ZWPCwDNex6/EPYjSFskA7uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrlh81FnhC/YUfY601OpE8PYzt2YumfvCvFBW9b25FPtZhPBIKIP0yw1Rgrt7DnMkrIlM4O/JUDE4X09gIXEuieeJk5MDTRX+EfFujgIFQm8bP5NmPDqJh9iHAf7VWDRX4A/CkxqVzdUiA748Ym90j8wOuNIIDLWK0Pz3ggOCsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KTAUPWts; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512bde3d197so28133e87.0
        for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2024 11:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562526; x=1712167326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hri8V3f2oTKyW4xHT2FPkWxO9/7KdTilVzTVJ704t1E=;
        b=KTAUPWtswYqrRvXtf8YgLF93vACvJbM4wvBl0SVAofxcfEh/2qlrC/p4zFetXDDZrR
         qVEVfQtKOK/1DhEgoWlLpWDdVUQDpnM4LFTQKE6X7SQFkRCnP/mfkZiSj9vhCLAD1MM1
         OwyhbMD92sUKKvjGDFYFOc6GT7WXHxNx1aWbBkdqd975wVqd3SB1F+1VXT0mo4pahaZ0
         B6mwf64kpoCFvbZgiAtVqagDNn8zzb0SCH2vneW0oSPLZ4A4pUPCz2vKVCrJP8knsO+b
         3uMxCpA5lrSNBVFCPjYU7qrCFdyG2CXvCJIhkC44RSspN1UbBK0NPwljxxhqjlDo2NS5
         NxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562526; x=1712167326;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hri8V3f2oTKyW4xHT2FPkWxO9/7KdTilVzTVJ704t1E=;
        b=eJt2aNRV+29Aamv/OwB8al6jk2l4AS3ppQiWscZqKtMioa5COQog6dZyov/TCrvyx9
         7iVYq4RQppCbHzz2EUf80BrsZVF4RVOVS38IguP9D4fAQgFQhvwx5DETbXdrA6/DHQUO
         DY+Bn3kaoc2GsVbDwKrRYZe66lR0jTO30afUgxh8r6lWNAr63BC/+5vBvLOgIcavZeGU
         mb5w9+XYEJBw445aCYL6Q/MYXfnLbmElVxpmx1ZO/8Gfr4Bx4IVDCNvsuo9Vyg2SgDHH
         cf6sjgo67EJRVRJK5P1BDLZnH0PZQmAevgbTxOdNQ5znaKnEDFGEtU0wGrVMik/sisLy
         /DXA==
X-Forwarded-Encrypted: i=1; AJvYcCUAXvXzShxDX1SK3zY9Ys/ed63KI6rtxnzVRuRzgD8dfS3cPk3DVkipqUNzcD739gxzOefVd8AfP6ZmntI8UrewOO+ZbsjAeh1I
X-Gm-Message-State: AOJu0YyvIFTr/VSENoy3LRn1HVamuG8DECtDVYWRC+l8cgHaFnxvJTq1
	R8ER+DVP6R8XBtEYiInZeRoQvnOPUQ2p8PnB4Ikj0t8WEnmZXzDcKq+giezQr/w=
X-Google-Smtp-Source: AGHT+IG3JpBB1fM/hLzE0DwDDSbEcJzbeI62ofpAg4XFckNPl+DeAabUlcVSdklCf/aUXYQC/mIqIQ==
X-Received: by 2002:ac2:5f9a:0:b0:515:9475:513b with SMTP id r26-20020ac25f9a000000b005159475513bmr120135lfe.67.1711562526325;
        Wed, 27 Mar 2024 11:02:06 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id w12-20020a170907270c00b00a469be48551sm5705878ejk.45.2024.03.27.11.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 11:02:05 -0700 (PDT)
Message-ID: <655defd9-ba4f-4839-8210-203e53405e5b@linaro.org>
Date: Wed, 27 Mar 2024 19:02:02 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] clk: qcom: clk-cbf-8996: use HUAYRA_APPS register
 map for cbf_pll
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240326-apss-ipq-pll-cleanup-v3-0-15c4aeeb14ac@gmail.com>
 <20240326-apss-ipq-pll-cleanup-v3-5-15c4aeeb14ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240326-apss-ipq-pll-cleanup-v3-5-15c4aeeb14ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 1:57 PM, Gabor Juhos wrote:
> The register map used for 'cbf_pll' is the same as the one defined for
> the CLK_ALPHA_PLL_TYPE_HUAYRA_APSS indice in the 'clk_alpha_pll_regs'
> array.
> 
> Drop the local register map and use the global one instead to reduce
> code duplication.
> 
> No functional changes intended. Compile tested only.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

