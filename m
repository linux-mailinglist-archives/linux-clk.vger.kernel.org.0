Return-Path: <linux-clk+bounces-3762-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB5D859CCC
	for <lists+linux-clk@lfdr.de>; Mon, 19 Feb 2024 08:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92C9B28301F
	for <lists+linux-clk@lfdr.de>; Mon, 19 Feb 2024 07:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5ADF20B03;
	Mon, 19 Feb 2024 07:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvGp0G3W"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E63420B12
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708327550; cv=none; b=ac9TLuZ3giG22Y1KW/LXVLCH5BsaaF49QgkIzkbTyMv7THsLntmfGY6Oo039nSFc063DBZNM5WMejnJEuPl7GLSgIAyjn4q6tqGFVxpZBFwMGXFps6Iet/wGapZC/Kw1zPEUurn1KU73Z9cSLqNumqkDDjCHwUtBD62aE6TYOUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708327550; c=relaxed/simple;
	bh=aAlNSmkbf1Sfy7Lsp6k5xIRxtrQSRKifsjuwsMzbR4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0jK73VGmALvm8O2xi+LtUSFj0IKOzbgzVvtFIoCsiickL+klWN522ZtXhiko0Jeyo1PjRj1uqfev9d1C5rhaZxcSEnGYJRNwBHGO+Wqi703JJE0bnIRWHQ+QhA+Sew20eB9pC7Qy0N92poheuRzaRBzdq8rQQU+3ZEyv10QBgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvGp0G3W; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412641511beso5419725e9.2
        for <linux-clk@vger.kernel.org>; Sun, 18 Feb 2024 23:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708327545; x=1708932345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JyWlHIVo/uKNCevCda65piUBa1jGH4C0NasP4jXhaSQ=;
        b=cvGp0G3WIWPhJNBnfcICxzGj5Zb7CJW3i8/tCFx+e0PJuojA/mdItmsLoWGMtlbMON
         BruuYU39Bl2X+1rgKaB3m5Rnv4Zw8W6d2e/KT/2JgRjXhPIfH2H9RxH4DgAJ9BklA6Ma
         Lin0NUEsVwOWFNHOONl8AdnblvlOS+B/Ebn5gyNmvc/Q2t4nN67g/e0tVQQZGpqReqyi
         39805a1+kW7ssVBKJfuyjFPSmxH9KpwhRadUs5tND9RTxnZASLTa8AwtaRfY5il7N8+L
         njxoU36Uw/93KOPf+K2a3c9bCRGxAKoZkPU0UArd8/9Mn1XS1mE698gbdSO4N0W7niIs
         rPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708327545; x=1708932345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyWlHIVo/uKNCevCda65piUBa1jGH4C0NasP4jXhaSQ=;
        b=lygwlpg42L4PVkpOirzNXWemQo2Dh88eMK5owCYmI61QClVB6Ak4qIoQiw84sc0Ox4
         dGnAVThf2F+EJGtkKi3JlzftlWnjQOmTvR+AlEcNJ+Ids94DA0Y8MeUtvbsOgnMnYB99
         pAwLMggr9FGZ9Gyj6asU5r/Z0ooIqC++aNx5XykwnAtxVMdEtUP7u+UivOuD2M31uXov
         22FoNhkHUCneG05+MmWqmRdWX8IEsQLgrquOWDXAa+wd7tWNGfBf/ED99KyPAGoPDqwU
         NjtEvvufJ72IOt0lwqEOtdvLBrG2F8bvx3pgze985TkOkTk4F86bPTW2gXUOReBnKHxe
         QjhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXhTNpsMkMvcHorbpR0vo3Bhd3A1dGe/FPryGF7A591UT+1+Gxas1LVxbl5OeRcu/ip/UthSImKGGNwn0hmfL83FnITvk6rz/9
X-Gm-Message-State: AOJu0YzmQFDUxkOVJfmJwctGRH9rddclbJdN/54LJZzpEx5zY+53dLXX
	/sQoOSClK6NgHsM/GRdNac68amT7yB4vNCQtVdsH3N+rl4gsT0xzKbfemXbhlfM=
X-Google-Smtp-Source: AGHT+IGiV+l4iUJ16bnvbIkxiPu+LfP0YB49TrqZfcIRUhSoVLZ/q7ojDT7tQELF+3Q9V+tEk+Eczg==
X-Received: by 2002:a5d:6a4f:0:b0:33d:1efb:8f13 with SMTP id t15-20020a5d6a4f000000b0033d1efb8f13mr5102948wrw.14.1708327545388;
        Sun, 18 Feb 2024 23:25:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id c5-20020adfe745000000b0033b46b1b6adsm9446076wrn.21.2024.02.18.23.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:25:45 -0800 (PST)
Message-ID: <27e14ec8-3fd9-4e36-ba34-423fe1f3dfa2@linaro.org>
Date: Mon, 19 Feb 2024 08:25:43 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom,hfpll: Convert to YAML
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240218-hfpll-yaml-v2-0-31543e0d6261@z3ntu.xyz>
 <20240218-hfpll-yaml-v2-1-31543e0d6261@z3ntu.xyz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240218-hfpll-yaml-v2-1-31543e0d6261@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/02/2024 21:57, Luca Weiss wrote:
> Convert the .txt documentation to .yaml with some adjustments.
> 
> * APQ8064/IPQ8064/MSM8960 compatibles are dropped since their HFPLLs are
>   a part of GCC so there is no need for a separate compat entry.
> * Change the MSM8974 compatible to follow the updated naming schema.
>   Theis compatible is not used upstream yet.
> * Add qcs404-hfpll. QCS404 currently uses qcom,hfpll. Mark that as
>   deprecated since every SoC appears to need different driver data so
>   "qcom,hfpll" makes no sense to keep
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


