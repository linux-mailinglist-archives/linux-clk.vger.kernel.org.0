Return-Path: <linux-clk+bounces-6526-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B65298B6F0B
	for <lists+linux-clk@lfdr.de>; Tue, 30 Apr 2024 12:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 414431F2323E
	for <lists+linux-clk@lfdr.de>; Tue, 30 Apr 2024 10:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578D61292E6;
	Tue, 30 Apr 2024 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/vVu+Cs"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24F1292C8
	for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714471539; cv=none; b=ol/dtu3AQznXloC8VymgbpdvLpbNzf7VgCYH8aNbDly3/8cXZ6+OmId3bp9ejxKwFboNi1sAuFNjYvTmIV8bhOjKQXVZoHsZNLSEcRQhiI3yJgcN5KUEDaOSC2kBJQ07/tF9g3hSfEbHHuZ4CnguObkCr81pEQHR7xkknPoNf9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714471539; c=relaxed/simple;
	bh=yjnf9AHRZqMRj34Tm4uXwc28cPM6Ap6BSJeHaNIbUF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jsjr/GcNsRxp6Cv03X+hRUwYzFNtJNn/+q/ZtQMjKJfNdkm7z5P4LESTNKI9fFGiiHRJDXFvERaPMimP+KkzhsZydkM6u8Oa21kWU0icTaMbx9GJNvo70INlxqamepj/GhansbZ9ytDT9bGWrA0TvyAjbS0EjewndkmGwPJnAGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/vVu+Cs; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51e75e7a276so198766e87.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714471536; x=1715076336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0c2r4ftfYh1i1ily+9Iyry9v4Wnv2g5Jvj7DDy6gfK4=;
        b=a/vVu+Cs50feEULZioEi+k+nDxq02qErhxZqTgON5eMER9w942bejdaUHXsCveG8ie
         O5bVgldlx+lOIQNZQxcUhTWbkVNpxcMdmKZC095ssw2WRwqWV8X0DaNVudL1dUUwqdp3
         r2EAsjKIQJrM2ZXQRUH41e9sffrtlzG9H4XpFQdmFpFWj9f9wrbVbe6HZNAU9bfPC6pJ
         6Rz++k2oPsfT7RU6WQznZnuMyBMAv0ZJN2h43gQV7XoITu+8QYY3cHf2LgCssKrnpcSy
         9y7TBFvFvkih5MOSAuhQfZ591VnpQSR1QcDnN1HYy6Et0SgiCth7ZlYZzOihkQB/OFYy
         J7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471536; x=1715076336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c2r4ftfYh1i1ily+9Iyry9v4Wnv2g5Jvj7DDy6gfK4=;
        b=Gq6RXhsYQzEBDo5DcOpW7vcVAy/GQq6gAfkpPi0qagD9m20pRViXNjP45q9wHU6NMR
         raqJ83YA0ROYX/q8P8YvCEy/9FMTFOQWpK8mfulh0glYQvtpCE4KZS6CtNmyRODcROk7
         448rYu4aFgQWOkyh7PIIss38s66z3yR9dNJb8L2oXIUzFyhKCyFT5gpxLfNXSTnCblgi
         cjoU0nf4sGVpT89S9862ErCtpQXeIa7PxLBs2vXVtd+NQ1b43rYqBwy1rv2P6EVmbME8
         JQFPiOy/Gi0ZvlwJtHdOABnGcNPA3zKuUA1fnDspkuuOiWcv53Ho3QKHmuGxQxYvwcBI
         kYUA==
X-Forwarded-Encrypted: i=1; AJvYcCUEHX/1Y1OTuyDctKVfPmtqnxLI+iC4ndjfl0dwK+8SfD1WhAEvJbd2ab91r32lyaWBn+diGcL8Gkaz7aXVGDg7z/rtq69ZK5d0
X-Gm-Message-State: AOJu0Yy8UZWLo8yBaQoW79jILLlioWDm+1Y8WeU4CBKsP871Qh/O026A
	NAFBRrvN756/8STf8x6UFIASvAj+UOgWYVPk9EmzBb+vgKp1aSJ14KajBsTG7iU=
X-Google-Smtp-Source: AGHT+IGwoRnxtInvigRnSf3xrL3fTWc2gzyovUQB8J5oNTSn7LjfiqRATlNm+qPBQg6sV5IYrs/Wlg==
X-Received: by 2002:ac2:5586:0:b0:51c:cfae:afd0 with SMTP id v6-20020ac25586000000b0051ccfaeafd0mr7262972lfg.21.1714471535866;
        Tue, 30 Apr 2024 03:05:35 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id bv19-20020a170906b1d300b00a58eabf6082sm3724816ejb.199.2024.04.30.03.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 03:05:35 -0700 (PDT)
Message-ID: <27f4f3dd-9375-40cf-8c8f-1c4edf66e31b@linaro.org>
Date: Tue, 30 Apr 2024 12:05:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] arm64: dts: qcom: ipq9574: Add icc provider
 ability to gcc
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, djakov@kernel.org,
 dmitry.baryshkov@linaro.org, quic_anusha@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240418092305.2337429-1-quic_varada@quicinc.com>
 <20240418092305.2337429-7-quic_varada@quicinc.com>
 <a7194edd-a2c8-46fc-bea1-f26b0960e535@linaro.org>
 <Ziov6bWBXYXJ4Zp8@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <Ziov6bWBXYXJ4Zp8@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2024 12:26 PM, Varadarajan Narayanan wrote:
> On Tue, Apr 23, 2024 at 02:58:41PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 4/18/24 11:23, Varadarajan Narayanan wrote:
>>> IPQ SoCs dont involve RPM in managing NoC related clocks and
>>> there is no NoC scaling. Linux itself handles these clocks.
>>> However, these should not be exposed as just clocks and align
>>> with other Qualcomm SoCs that handle these clocks from a
>>> interconnect provider.
>>>
>>> Hence include icc provider capability to the gcc node so that
>>> peripherals can use the interconnect facility to enable these
>>> clocks.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>> ---
>>
>> If this is all you do to enable interconnect (which is not the case,
>> as this patch only satisfies the bindings checker, the meaningful
>> change happens in the previous patch) and nothing explodes, this is
>> an apparent sign of your driver doing nothing.
> 
> It appears to do nothing because, we are just enabling the clock
> provider to also act as interconnect provider. Only when the
> consumers are enabled with interconnect usage, this will create
> paths and turn on the relevant NOC clocks.

No, with sync_state it actually does "something" (sets the interconnect
path bandwidths to zero). And *this* patch does nothing functionally,
it only makes the dt checker happy.

> 
> This interconnect will be used by the PCIe and NSS blocks. When
> those patches were posted earlier, they were put on hold until
> interconnect driver is available.
> 
> Once this patch gets in, PCIe for example will make use of icc.
> Please refer to https://lore.kernel.org/linux-arm-msm/20230519090219.15925-5-quic_devipriy@quicinc.com/.
> 
> The 'pcieX' nodes will include the following entries.
> 
> 	interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
> 			<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
> 	interconnect-names = "pcie-mem", "cpu-pcie";

Okay. What about USB that's already enabled? And BIMC/MEMNOC?

> 
>> The expected reaction to "enabling interconnect" without defining the
>> required paths for your hardware would be a crash-on-sync_state, as all
>> unused (from Linux's POV) resources ought to be shut down.
>>
>> Because you lack sync_state, the interconnects silently retain the state
>> that they were left in (which is not deterministic), and that's precisely
>> what we want to avoid.
> 
> I tried to set 'sync_state' to icc_sync_state to be invoked and
> didn't see any crash.

Have you confirmed that the registers are actually written to, and with
correct values?

Konrad

