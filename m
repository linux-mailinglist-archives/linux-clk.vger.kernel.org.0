Return-Path: <linux-clk+bounces-6578-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B92E8B88B4
	for <lists+linux-clk@lfdr.de>; Wed,  1 May 2024 12:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2900F284697
	for <lists+linux-clk@lfdr.de>; Wed,  1 May 2024 10:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C6854FA1;
	Wed,  1 May 2024 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MizIcAJK"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07653E37
	for <linux-clk@vger.kernel.org>; Wed,  1 May 2024 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714560151; cv=none; b=IqsefgUul7UL8gzKUDVakeXDaLUyTCoZLP4CXwhH9EdzSpFP4cfm14dFjYz5XFrhthdEnSSQ6SLefr64+HJPqVT3hWLzpq2QYdkg2C56tH/Ur2OtEMOUkuswB3In4qsa9LUwQF6MP81v+VbrFD7HwVAB4ePWSQYSP6x9kz7/y0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714560151; c=relaxed/simple;
	bh=KqP//zXSMMYwMX07TpkYRVKV5evikdqY7eNayjNM3O4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTfnH/gDSKs1biDZmcHbS5L2K7DkXiIMmKlfnTZwa7JlDxLoV4jeJ9JmnKvT7KMFN8HWc5y6xsLsAhUbXRWwEspQ5PzI8nmMv1TMR0AZrQZvN0vdKD1OcwNyrGhsv+mp4dI9lmRM3MC89/Cqgu5RLy8Jb7rR2hjN+o0vNWycvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MizIcAJK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34de61b7ca4so123826f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 03:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714560147; x=1715164947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZRLL+HB9HbIggjRHEEHhzaeeMPBAxxAanvwH2etHPw=;
        b=MizIcAJKmaASBueLClj8FAc+gDju1oI7Opx5yOc0rODnVSXv4WEB3M2yqNbvm4hkZQ
         au7z++tMtRDmpLSH9tIXDQCV+Z0L2Iaosr5Oxdqy31ku6z3wPJ3Q4jeG91tV0scTVmph
         udaAq0mHx+/Ee4U6ooczCmQDDfMaGi4TRNZyWw7ynJz8QoXv+aevjiQlKMOiVQo7/LSp
         8YSOLnolzj+6kramRzDaf91olnk5oOmOTTqNOEko3ID220NXiUN9PTd6MfkWYzF65IzO
         MAq9PL49NO8IRz1gbe7D3nzLsumwBhMLkSC27ygR37If2F4im55XGNtFZo7YzQmaCq3e
         zOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714560147; x=1715164947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZRLL+HB9HbIggjRHEEHhzaeeMPBAxxAanvwH2etHPw=;
        b=RYQJunWciInQLLpEOzjGGZP3oT+pqEBpX2aFoplihEfK3O3Sm809k9hxgP2rUuaPkI
         OcyWczpUma18BMNcwJlg7vTA15yoG6YhU8pSUR5l0o2XxifXaUO7DNf5Mq4kqQdybzCI
         mYLBP/uqaiEezS+5gdLn7EsxIKAbE7UZ393JSnBEGYjISyQyvJYVAoDH0ctPPrlonqwU
         TWivfreLEKWUjnMDyKm+BWMWpvrzQ1RLWdP6m7bOWbZdaXEVo89NNsMxyCXw3TqIFz9q
         yh4LQU57KXf3X/0lRPK7/mg9YtPcy1JrPkmzHIgVWwAD+y/cin5mwRaAwfCQ9olAMR9d
         sSmg==
X-Forwarded-Encrypted: i=1; AJvYcCWsF//ogGzB7tOqACboMSm4bs72WYrr6yIm9ujCGgJ7vKVODgObNlB57ynWrZsMBEffvwv3ebYefZu8HbKMiop+10rrRGLLO11/
X-Gm-Message-State: AOJu0YzbpayakrAlLtUvNEVmMi3wkqk0MFIhkGB+Qa9xiXFgi+RVYKsw
	zY0x0VOk8Ik8MkaFDOjNDTXiEG7XQrhWKsm0SjymR+ApRX9StsShSxlG5Et/3UQ=
X-Google-Smtp-Source: AGHT+IFDZK3tB64O9qe5N4VAS8EvYDgaowjyHbKLOl+cnO1NcGhqlxPVfgFSDsBWmT8uyiiMd8d/JQ==
X-Received: by 2002:a5d:4845:0:b0:34b:b50:3689 with SMTP id n5-20020a5d4845000000b0034b0b503689mr2082402wrs.10.1714560146874;
        Wed, 01 May 2024 03:42:26 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d43cf000000b0034da966c3d8sm2560538wrr.16.2024.05.01.03.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 03:42:26 -0700 (PDT)
Message-ID: <d1e755b7-b6f8-4e59-a1af-1a5f692c70a4@linaro.org>
Date: Wed, 1 May 2024 11:42:25 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/8] dt-bindings: clock: qcom: Fix the incorrect order
 of SC8280XP camcc header
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240430142757.16872-1-quic_jkona@quicinc.com>
 <20240430142757.16872-6-quic_jkona@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240430142757.16872-6-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2024 15:27, Jagadeesh Kona wrote:
> Fix the incorrect order of SC8280XP camcc header file in SM8450 camcc
> bindings.
> 
> Fixes: 206cd759fbd2 ("dt-bindings: clock: Add SC8280XP CAMCC")
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index fa0e5b6b02b8..bf23e25d71f5 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -14,9 +14,9 @@ description: |
>     domains on SM8450.
>   
>     See also::
> +    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
> -    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>       include/dt-bindings/clock/qcom,x1e80100-camcc.h
>   
>   allOf:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

