Return-Path: <linux-clk+bounces-6523-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B98B6EF9
	for <lists+linux-clk@lfdr.de>; Tue, 30 Apr 2024 12:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D31B6B20CB0
	for <lists+linux-clk@lfdr.de>; Tue, 30 Apr 2024 10:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6BC128833;
	Tue, 30 Apr 2024 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GoDYV3fg"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832161292C4
	for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714471252; cv=none; b=lvJSFZZzpUBHzZhI860eYAT93qlnRNzcj1yiHGflvWwOAljCPUJDRaxWMiaj3gWTBW47p8s2Z39TlG8UH/vFOytwbTrT3N5qT0ok0yZMaCc9dB5YxXtahH5jY+p8EsyYt5lwmEFWLxePr80xahbiviC+11OSthqAvT19HGuv3Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714471252; c=relaxed/simple;
	bh=uh7Pbs04S4vQkji1qgl5aX0QTqaD+RyS7XtlMqFHUdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfEqkp3zeI2EpecVTMwT4sN9cQ0i1Rt/o0gmJJ4cigQfXn8y9qxFZs7h1EmQTbIlgjnoOlRUh3b6mwIRMNg2iXWBZEK/MObf2tkvEJ9gu6BFMHbCOfjbntp2RN8canscc1WHZJUi0BJcGUuEOqAfuz/sNzkZaONDqMPJUKFLWVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GoDYV3fg; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a52223e004dso590005066b.2
        for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 03:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714471249; x=1715076049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GLuTVdYZyI+THYj/VWB0Rq9b/tILX6JU+YIaTVZf5Q8=;
        b=GoDYV3fgv+YGUG5e06iYP7dWZTKEuTBHi5jMEBgdSoD9+ShQfS18kCasqV2Ua/1lXM
         AYATcLiVx016waQli8eH/6JNqy0V6GdkG4xc4GXOdbWCkMWk5tdxwTGOCV/l8lYYpf/h
         q7GUTX/BbGl6sa1HsOSzTd2WJzie+uVRqm/pzgT3Zj1LrXcoTKigx2IX32U5ZNxuKwvg
         qx4NcrXXTQSBclFhEFQUE1e7DIX7XzzZgFB+0zV0tVlSykRa7e8sCIhN4JKRL9y278B1
         tFxvpRP+HtBEutwRd1rLZmVRyEP7NrYJWbxMtWeUk2fSbFuL4xcMGFmEb94AJWc1Xn2J
         URkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471249; x=1715076049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLuTVdYZyI+THYj/VWB0Rq9b/tILX6JU+YIaTVZf5Q8=;
        b=fxBstUjIQXpizt2Kq1LPeCHJGQWsm71YlgZWie/zinboLP+SzesU4ZQjgzY6hpivWV
         se4FIwtFe5Ljh63EhLmWFRIDG5wTUaBl0Nt4In4OfcoerYV2g6h7IDvQZhTOocpcxvzN
         9/gBzwmh7EQ/bT7Khug/y6bkfeEkQSNXCIsDNoHiglWqeY1i4FEfor0PA+K15nutaRMt
         g74K6INvpvBSmQ/yxAik9XVN4Y/CWD5KC/5Wqux+TJkte12S3uGM9DxGj7/YAn+oFwC8
         M4cmZnapFYqrThi2zlvMTBfAQUqj0h4RWcyZ4z+RsjdryxmsXbM/poEdjD+Pv6ZLDvqY
         wjsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcGUfWnaZNdsY1lfOxBYARGyFHiU9WOb6c4GsruUjyWMDSdd9Haiz6VFr1l7f9/D3yCZdt7NxKXg04/n3voiwWnsseoa9/uneU
X-Gm-Message-State: AOJu0YwsjcbiUhSOrd3KMRNhb52yMz2FEtn4970gIpGcKW/yX9jQvAqK
	TJhyjcgseKtgCMkusK2gHTm/OpoZULvFtEtzy4rnrqUzPMqeN7KRJwBAsu0dkEE=
X-Google-Smtp-Source: AGHT+IEghFhcyp53njK0hOxYRWJt3T0Rvh4ZPIy2pkhcVRDv4NV3lo0y4Cysn0IVUyB7fjsMSUTjVQ==
X-Received: by 2002:a17:906:3905:b0:a55:a1d4:84f5 with SMTP id f5-20020a170906390500b00a55a1d484f5mr10415416eje.43.1714471248799;
        Tue, 30 Apr 2024 03:00:48 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709060e0200b00a4da28f42f1sm15130418eji.177.2024.04.30.03.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 03:00:48 -0700 (PDT)
Message-ID: <b4bd6bb1-b1c3-482c-9140-24c8f9f14bff@linaro.org>
Date: Tue, 30 Apr 2024 12:00:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>, Bjorn Andersson
 <andersson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
 <171424646121.1448451.7219465997551736348.b4-ty@kernel.org>
 <c595791a-bf36-481d-a2f5-aa99ec28a4b7@freebox.fr>
 <1bbd5175-31a3-4c4c-b2b6-6ee7c65bb17f@linaro.org>
 <312d3cbd-852e-4b93-8bef-c78827712f56@linaro.org>
 <557bd418-0e37-44b1-b622-3c824a6a7553@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <557bd418-0e37-44b1-b622-3c824a6a7553@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.04.2024 5:04 PM, Bryan O'Donoghue wrote:
> On 29/04/2024 15:52, Konrad Dybcio wrote:
>>>>
>>>> [   10.404521] clk: Disabling unused clocks
>>>> [   10.412141] ------------[ cut here ]------------
>>>> [   10.415538] vmem_ahb_clk status stuck at 'on'
>>
>> We currently don't support VMEM (which is a small SRAM dedicated to venus)
>> upstream, but venus functions without it (albeit I'd expect it to be
>> slower or not fully capable without it)
> 
> Ah vmem right, indeed.
> 
> Just try switching it off Marc, you probably don't need this clock.

??????????

That's what the kernel is trying to do as part of the cleanup.. Either
this clock is always-on or held through some hardware vote. Or the status
bit is wrong.

Just leave it be.

Konrad

