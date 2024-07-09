Return-Path: <linux-clk+bounces-9319-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8392B476
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jul 2024 11:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 293C1280ED9
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jul 2024 09:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBF9155756;
	Tue,  9 Jul 2024 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHstazk7"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596B915539D
	for <linux-clk@vger.kernel.org>; Tue,  9 Jul 2024 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720518826; cv=none; b=ZhIhb3mW5n2ut15w3EiSeC1wEapGAVvxnyixXgv2xa0vJOCGM0ZomGvdgrH2yg8hA/At97KUCwvuDXv0vliYST2JT1DA3K+ZqMkZ2zxBBGfyN6hwfHGSk+bhgrQFTl2Ja92eVAFOKD7ALG4WI5fr2m33S92OAYrgptL2Uwzfl/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720518826; c=relaxed/simple;
	bh=pnAmCiqEtv6bo9Hp02vcqdmUetCzi7xTDYOVDbwnqrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LrT39SJPIpTB+G9w80ciuDbiFKMfNrEvh9YDA1vbSDdYLH6F/m/xRCiZVnWYADdSCTyIojgCeHhGhI73WfGBbAvW1z7j/YP0ty5zsjYAt4WENrBMi9AMCpqIIo1GRKKzd/tyNvuhiRpYg6s2VA2ZlXLuhxJ8rkj7b6fb0uok/n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHstazk7; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so6268435a12.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Jul 2024 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720518824; x=1721123624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hz//HnG6eog/yjdqpXcAaTyDoWnZpU66qXx/HzLI9t8=;
        b=hHstazk7H/q4cYnlRVGanp6ZRKI23AbbkouhMpFyX6ekwwCyz5hm0wV0CWihMVCQLQ
         Kk+gkhLi1SBxyT6s5NEz8bcfhSyS9F5FhDOuwxDJUzJdUlI5H3k1r/FxSULNGSV2JgCs
         Tv46XxwMd1YoDfxYfRvVqpap9M1/CSf8i9Ed2cx8MP8ltsJoeNup2wBD9b9/eJ2hWYaJ
         BCpoaWErV6KKGDpBOn+ZEdQU7GaTpRHhabQZhSU1ZjRib1E9ZesyI8aD+K4hkS70Pc/x
         hMOUjOlSvMTUeOiuDu7oGzBak4k5N4okrqgN+hdJJ4Wjrvo9mat2WDedGp/70t6eaunr
         Cr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720518824; x=1721123624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hz//HnG6eog/yjdqpXcAaTyDoWnZpU66qXx/HzLI9t8=;
        b=t0YkccMQizB2WjHPIqpyqY626wLrw3cKymTB325frWTq28AivUR9gG9tbTzw25GTwO
         newhSZiA7oz+JlYLEchCRZYa3089BDKh5qUiM+fvkdSjDtUE/+M2RgldHZ+6PRfJWQou
         lUtIVbQ3/5tiIvOAYBFtTDKMA3aa2vLUyhx4TaFHpdvwsQ8Sythp8nxxvt/QcNcUDF5s
         Hnezli9T2svSrdducJl8RPIBPy4OSx1fgmY6LCMNJwJnKs21gGN4vRyIJMLQ9JGgnHJQ
         Nt7VjDKTLLXMEJR/S2D/BiPS/d74YW/lqH+VCexLigfBE84GlsyqB7xvWAHPsOckjaaV
         guCg==
X-Forwarded-Encrypted: i=1; AJvYcCVxeqWUnBaPXLCMw4yhpdA7aTuPcxOtsACwtqKprvZe/vl1zUcbR1ht1oEXGR6mV4sSoOHnKyFdm1j2Fztd7gK5hBdrQnhvilx2
X-Gm-Message-State: AOJu0YzW14VrxIJhbcUikc3vFdWcTc5pIcf7dXWBoEicxsjXiPji5Bsf
	dEsQocNoAYglJNo/ko+4AyPYMDariXVfaYJN3le1iwejsgiNfHR9MOjhSAxe3TysGzS2A2mRMCa
	u
X-Google-Smtp-Source: AGHT+IE3ArPh6BdHrZDzpaLtMub7dWAJLMvuqqtLxYsv/qwJfi4BdnfMXj6nDVJ3Mf3Hqtymi+vUDA==
X-Received: by 2002:a05:6402:42c7:b0:58d:fd5a:eb54 with SMTP id 4fb4d7f45d1cf-594baf912famr1819867a12.17.1720518823516;
        Tue, 09 Jul 2024 02:53:43 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bd459aafsm863082a12.78.2024.07.09.02.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 02:53:43 -0700 (PDT)
Message-ID: <cef54c07-4ecb-44bd-ad7c-aea475b89ffb@linaro.org>
Date: Tue, 9 Jul 2024 11:53:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: ipq5332: Add icc provider
 ability to gcc
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, djakov@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240709063949.4127310-1-quic_varada@quicinc.com>
 <20240709063949.4127310-4-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240709063949.4127310-4-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.07.2024 8:39 AM, Varadarajan Narayanan wrote:
> IPQ SoCs dont involve RPM in managing NoC related clocks and
> there is no NoC scaling. Linux itself handles these clocks.
> However, these should not be exposed as just clocks and align
> with other Qualcomm SoCs that handle these clocks from a
> interconnect provider.
> 
> Hence include icc provider capability to the gcc node so that
> peripherals can use the interconnect facility to enable these
> clocks.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Doesn't the USB host need to have its path described to keep working?

Konrad

