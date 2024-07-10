Return-Path: <linux-clk+bounces-9402-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A9892D00F
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 13:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96A4D281AC0
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 11:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9944718FC9C;
	Wed, 10 Jul 2024 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/opzkfG"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FB018FA34
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720609520; cv=none; b=af/p2KpeZs6qlhaS2XNs9zT1iyHjxk0Vbryc0RyRWCpnao4E44zi/EV+sc9+yHoHGZY6UREThgo+Sy1rItWOFHHFy20BkwN/nxYgNIf1MxahgtOliQRgP+Id4cR2vRGz4AHE274j9m0W0c8eWsJmGYF8dxApDjNZFaitWOmGUg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720609520; c=relaxed/simple;
	bh=lFhja/oK13TZEjbOv3vm8aB07fh56wskvV6Vynj3smw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uy7uLIyn5aOns3oTX07xr4BkFLtukkjd4fZB0sZV2lRY23nOYhtTGQZhP36hkOC/qh9Q3lwd5AlOaSk8saBEjQHtjTBFLrhOvrdt5tM3T46Fz9YV0/nbtjbN8FAjhzCyyxabMYIKB4ofSwyXMIib2wSxWuH30PemejvBYZIFsyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/opzkfG; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-58be2b8b6b2so7819640a12.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720609516; x=1721214316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N1uslSBcY1r109ea9aNoAipfwZdVf1qf0YKoKuDBSPM=;
        b=a/opzkfG+RFeaxPnN3Y5MBtZCTuBj8p7pwAGCTYmgvaXKJ34hbQj9aHhVp1IRdQZVm
         wap9WZ3DWBFt8AfMmYkluyLkxVL5NMvKwJRTkxYxhbzII6P6xSZUD2BkjLGtjzMxJ7Yu
         8YQ/goVkTbra42sBwUhURHSpEbh4MeDXocP//5dB0FOPxEprCx08W41HLx+vxbzwPwwN
         lsYJ2wl/X0b4n6GwffBC/P1cTISD1340wX07XQ8cZnvpBETIPctC7Lks9vwn7XZc4eBg
         LQQaRw1zF8sxTGhN9me40RKekJESWoHxqvE2vlcNsBapzQMK8HcMIO5ipCs+cIwW5/ow
         K4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720609516; x=1721214316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1uslSBcY1r109ea9aNoAipfwZdVf1qf0YKoKuDBSPM=;
        b=s6qRhIA32qDlgaee2rmDOVIoYpjzSuP9Memqc+0ccjZBPl0huvEKJ/cZxm8erfYTHI
         Cvhsn+xFRZtFBt+rrHbO7iKlyoV/fch4a7nMFFNX0GYpaE8kTj0GF0Gaz+6cEW9LFABh
         6CSG0kWbxQU5YA3brGpJ8kh0DfQrQxawPx6UluqUjzl8ACU3jn5lwBWUxICUXqxadsl8
         521QGaxo8zvC5BMunSEWsEW1yRtEKTbpRO1ugxneCdEZQNiWGntFLg+UWvqE5M4atfXX
         fkydh7zzq92UxSnr4yicauqnT1ZrwiVBuJC2Vvj5BqC23mdcQS0/KNcOSa21S4A/WOL6
         XgXg==
X-Forwarded-Encrypted: i=1; AJvYcCWIH9bquQTAZjVjtEQb6dUP7UATuU6C4zPvIUx/trowMdF5bdDT19uK+ej1OyICy095ecp2USEqYuKDRyqsAC2PFhVUfT6LKHgH
X-Gm-Message-State: AOJu0YzSa8aG/+r3y+z9/zRPbFZ0ITSHJVbLrVmTSvn2x5LucjRJhW8n
	tAnymuQEP3A4AmUAEPpdrkC4gINuHSH/ZJs9+mLTCRJqlz7YY7+oHNh39ObU2cA=
X-Google-Smtp-Source: AGHT+IHV5+H5iUMh88xRNfPWES6W29uZGpbp/Ams8qeQJllpaTwHnNcLQxpsPM7nU3+u3/XE9qZDoQ==
X-Received: by 2002:a05:6402:42c5:b0:57c:a478:2ff4 with SMTP id 4fb4d7f45d1cf-594baf87479mr4224644a12.11.1720609516140;
        Wed, 10 Jul 2024 04:05:16 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bbe2cca6sm2086286a12.27.2024.07.10.04.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 04:05:15 -0700 (PDT)
Message-ID: <325a45b7-bb02-4a32-8590-6abc14ad9619@linaro.org>
Date: Wed, 10 Jul 2024 13:05:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] soc: qcom: cpr3: Fix 'acc_desc' usage
To: Varadarajan Narayanan <quic_varada@quicinc.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, ilia.lin@kernel.org,
 rafael@kernel.org, viresh.kumar@linaro.org, ulf.hansson@linaro.org,
 quic_sibis@quicinc.com, quic_rjendra@quicinc.com, danila@jiaxyga.com,
 neil.armstrong@linaro.org, otto.pflueger@abscue.de, abel.vesa@linaro.org,
 luca@z3ntu.xyz, geert+renesas@glider.be, stephan.gerhold@kernkonzept.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20240710061102.1323550-1-quic_varada@quicinc.com>
 <20240710061102.1323550-2-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240710061102.1323550-2-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2024 8:10 AM, Varadarajan Narayanan wrote:
> cpr3 code assumes that 'acc_desc' is available for SoCs
> implementing CPR version 4 or less. However, IPQ9574 SoC
> implements CPRv4 without ACC. This causes NULL pointer accesses
> resulting in crashes. Hence, check if 'acc_desc' is populated
> before using it.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Does it not work if you drop this patch?

In v15, drv->tcsr is left NULL (from kzalloc), unless data->acc_desc
is present

Konrad

