Return-Path: <linux-clk+bounces-5354-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA8A8964DA
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 08:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 605E11F23420
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 06:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D09645028;
	Wed,  3 Apr 2024 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZAOvy8hB"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4791044C76
	for <linux-clk@vger.kernel.org>; Wed,  3 Apr 2024 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712126955; cv=none; b=i3KaDxVe/NGj0ACV3zhzvgosGH81wrqsnkNGZ36wp5B7TCtis7d9ttlfeKPTE/xPowg92I1jgCpBItjszuiWdFj4ff/BEiBckjJLNnUdZaouIwSfF5KksV3PbWd+MivMILlX6K8y7IlUkOeqxdCRTEzWI3kkEH0lrUhGeN4nNfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712126955; c=relaxed/simple;
	bh=7KJkmLBmixT+4fy9dHtvE4IRdOGEukGf18B8oGICZ5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDknQcCS+kp9mBKirv02ACl13TvSuBhw3CadVz0e8jEzVBiNUn/YN2bbaAHdXJ+hjdNUH3ESd3V1iY4bF2j3tAqzCFw+Djt45PZG1v+jSUos+tBD5NWvKd8NQlF4Zgly7gvTsTFNJRge095hQ+0NjQRfvvVOhsZRKiJWYdxXUEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZAOvy8hB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a44ad785a44so681731566b.3
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 23:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712126951; x=1712731751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wxEweuhL1xZaCLYP0cmyV86Egllpxaa+cUj5NxoHLJs=;
        b=ZAOvy8hB/Eua6tXpdciwPiV7vsgNfAvkCJwaZvZFMQclW3bFAD+vb/UyZ9SMxKuMC1
         HWogqVreVVl/bMlx0bgDRljVhZ5iQ8WjtZ/uskXf1rOmWkWLxfWlKi95dSVA3Qs5UIe9
         6Chhc9soVzOwjhxiggQwRHRNaVpz7PjXr7qHbFRja9TZx02NJyEfNZPi5LM9K/Gqaxl4
         KpzG9AysAYDLHLYTrV/E1Ize61JgB3Zo8KHEE91eXPHnbQ5YYeKsN138xb+BtxerK6HD
         znP2TnPOwtAwaCuUruHUSA8NymQynEbVOcU1h7X9MVydZEwTS+o/IwVDuVKvC4wHqnkS
         2ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712126951; x=1712731751;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxEweuhL1xZaCLYP0cmyV86Egllpxaa+cUj5NxoHLJs=;
        b=I0IsmEy49i8CnBmA0kAr2dP80Uy2Q6Y5DSmFRLbs9x4wyfLEQyTA4oSKrALjB2lZv6
         99msFYxVrYcan5e+7EXkScj81RhWOMBESQhpQz6Qy/zOy9UrZMG37bqO6RQhA1NDqyR9
         QPMEitpFiB91JblA/nCXYQgvIkNwHczjd90BUO08fAls5AAl8tutVGNECE6u4yrFGnO3
         prgdliM8vAIJ/aClLADUBzytVng/srmc4MA701+aam+o/OXhhqcLBbZ8LiYnv2BfCW+2
         oGoAPmFhsa6feH6PuA4DwIXvzkHktKYPjB+R/ccRFOqF3f6hyJcXwuEUvOAX6pZeBUcd
         5y+A==
X-Forwarded-Encrypted: i=1; AJvYcCVsFsNZ+Q8M3WBBBiulvCR0vdSzRlRwfkItq/nl6gqCBr4OG7adfDD/t9090wxdPgAQC8R2jTrLflJZdRUMO4JXtSPjT7bz78VI
X-Gm-Message-State: AOJu0YyT5U3UtmVtNSWSQ6V2usEcfLwUEuhWXY6tBURu0QtIwMlhV3Sj
	/6y4bmO3Z9prJ/FKQ+lmi+JRJPua3BoiJgxCRL+iqOjSlBQmzlKL5mQKZBmyYfw=
X-Google-Smtp-Source: AGHT+IH47jNQrG02lL1P3WtL0Ax7bnLWp94fzWtTFJZdxXsFUSn26BAOi49TBEW4HCPrcM81wAzXVQ==
X-Received: by 2002:a17:906:a0b:b0:a4e:23b5:3873 with SMTP id w11-20020a1709060a0b00b00a4e23b53873mr9398554ejf.2.1712126951539;
        Tue, 02 Apr 2024 23:49:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id xj9-20020a170906db0900b00a4e3a08e1f1sm5922472ejb.156.2024.04.02.23.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 23:49:10 -0700 (PDT)
Message-ID: <da93a8ed-4fbb-488f-a1af-e701f7191fbd@linaro.org>
Date: Wed, 3 Apr 2024 08:49:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override for
 LUCID EVO PLL
To: Ajit Pandey <quic_ajipan@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
References: <20240330182817.3272224-1-quic_ajipan@quicinc.com>
 <20240330182817.3272224-2-quic_ajipan@quicinc.com>
 <d8c0ca00-7e14-454e-8a65-5dcf14ed7796@linaro.org>
 <e2f108d8-0b25-d799-fbe4-ab6256966982@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <e2f108d8-0b25-d799-fbe4-ab6256966982@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2024 20:35, Ajit Pandey wrote:
> 
> 
> On 3/31/2024 12:49 AM, Krzysztof Kozlowski wrote:
>> On 30/03/2024 19:28, Ajit Pandey wrote:
>>> In LUCID EVO PLL CAL_L_VAL and L_VAL bitfields are part of single
>>> PLL_L_VAL register. Update for L_VAL bitfield values in PLL_L_VAL
>>> register using regmap_write() API in __alpha_pll_trion_set_rate
>>> callback will override LUCID EVO PLL initial configuration related
>>> to PLL_CAL_L_VAL bit fields in PLL_L_VAL register.
>>>
>>> Observed random PLL lock failures during PLL enable due to such
>>> override in PLL calibration value. Use regmap_update_bits() with
>>> L_VAL bitfield mask instead of regmap_write() API to update only
>>> PLL_L_VAL bitfields in __alpha_pll_trion_set_rate callback.
>>>
>>> Fixes: 260e36606a03 ("clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces")
>>>
>>
>> No blank lines between tags.
>>
>> Add Cc-stable tag.
>>
> Sure, will update in next series
> 
>> Please do not combine fixes with new features.
>>  > Best regards,
>> Krzysztof
>>
> 
> Actually this fix is required for correct scaling for few frequencies in 
> this patch series, hence combined them together and pushed this fix as 
> first patch in series so that they get mainlined together and feature 
> functionality will not get impacted.

OK, that's fine but usual way is that such need is expressed in the
cover letter, so maintainer will know what to do. What if this patch
should go to fixes and rest normally to for-next? How do you expect
maintainer to apply the patch? Entire thread and then manually move the
commits? Why making it so complicated for the maintainers?

Best regards,
Krzysztof


