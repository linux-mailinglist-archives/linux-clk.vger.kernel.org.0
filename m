Return-Path: <linux-clk+bounces-3426-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81284DB3C
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 09:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 148E42822C1
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 08:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99ACC6A325;
	Thu,  8 Feb 2024 08:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQeurFLI"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DB76A320
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707380379; cv=none; b=tomeIOOHiv7QyH/waOG2tTaJCmwTuyj0+xuXMicOb6zcGZLzowym84yGzqNRWe06RdJh3hfm6hdRwexWc2qc0c8l7uAWuYhnHbYS+eekWiS/ad9mGqbH0dDxZoCA61GOcWEGlZ7r1mOVlLDlnR7BcRHW2KnUEfC7asnbP+BZKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707380379; c=relaxed/simple;
	bh=UGPf5+3wQ+z/NLHkHquhVF5dWtm7K3B2ZoWhTVSfXGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQyfvPdJZIt9F935jcZX0oSBtt3aCnXsgahQuDLCXb+cV8HPXJ1f9sDMtj48aR2+0Bf3jHe4+1+8nwtpsWNu2AjvhWuztAheD2+2r6UpF35p3gcnlXWzUKkJf/eJaFlX+eVPqw2Fi9E8DJ5zJts5S5D1V0LJ7IhL+X3oj9nXBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQeurFLI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40f033c2e30so13177095e9.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Feb 2024 00:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707380375; x=1707985175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLq1K/aeXmSiOSUzpIKAxlp0RiVj51kCKambq2bXEWY=;
        b=pQeurFLIx0jq4zzi3VE5aZr9Wr10CHKjigFWe8StRKSvcFwItgRRAHjfbBzRtadcDI
         B7FNC7JR1ivrWWhafOxwcUf+vpPp1Vh83kGGXjcOK+6WDhwM5hy6fwjIfsUP+5/ScEJc
         Hs9huixImHezp0FZtNOkCWImR3sAl3qJcJFBEAFYj+O5+tuKryt3OVLCxySg8EJQ4dCh
         HE4wBihT2OXDfFg8kGn7v8INAO37V0rdXPHW7oiiI3OqpYsA/4B73+YhBfk7jalfAjt7
         G+xxsUxEoHhcMQZspeLUO9zyUUvZFjJ1gibfiPfGzy02PYa4G04t76dsM8VbI8lH8fhu
         d6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707380375; x=1707985175;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLq1K/aeXmSiOSUzpIKAxlp0RiVj51kCKambq2bXEWY=;
        b=mfbYoo4+EvY1LowcXdAKKYyZTIeJRSgcbMv310uHZOAMMS/I9Y6Zd++zNRqWbFQhEb
         LEHzlZ97C8LQ6p51DgpGlFzStPU/OMClTCZXNJRcXvtz0aQQQBa7np6H9OuOwOfEQu7O
         STVc3VcopObmE1kodTsvgjYJ1vyzksaVHfjm7UCd+YWn84dHPTo17GX9wkBoCX3iJI0S
         UU4bH4z5ZVSjMhlzdm62wI3qZHZPTP2Mi3zHXmm5q8XGjO15fiUvXTgwUEKBRBiiOIxo
         CftPZ3+YTeVBg2lNzBsiXT+f5Xh4ObUAYUbryS/q7FmT1vNgNQUqI81ew7d0yzRlFx9D
         YJOA==
X-Gm-Message-State: AOJu0Yz7xWRxkyDRIdw1mYKzmxTGm0nfy8S4kRFkySb84AlDI4SFXF9I
	Ibucjfbu8S33mhUwnkjMUWCRk+z9qQzzJH/gklVtABiyLUonBmg3wfd6xBTdlZBeKE9PFshI9/P
	s
X-Google-Smtp-Source: AGHT+IGGIega8yOnc1W2yjZYzjdbzMl5vVETFwBMjDhVWbjgnXt38c3NO67AyYocMvq942aDR9tcnA==
X-Received: by 2002:a5d:43c6:0:b0:33b:39d6:666d with SMTP id v6-20020a5d43c6000000b0033b39d6666dmr4571389wrr.36.1707380375262;
        Thu, 08 Feb 2024 00:19:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaHxF+olsBfD8wWBCAjtNgPV0hEdOPPuZYSgYYbbEqPmPC5UFXudY+Ub+igeaoMlg8iyiahxIFQ0ahKnoFBLMEEF6qXeaMhhTC+GBY83sstXseImm24uabtHXYUoiNwxwU3frrlDg57UI7iErWC0gczLgeqh6H7CQeu16q2D/1dyvGf9n6rpj/HF23pqeullBD4MwaCCIdUyHvkwFQmk+RLggE/lNlu8oP3xLukXD+w/WkfBlRQu1cpjN9GQstRh8I4wM1IYTY8ZeNPQCxK5Eu4fPbce3ydNUdVixTZECC2VlgdKYWRUrVMpOsFpS6rco69tjhYhBAxBuV5JGxqeeBUg2kUsOHbLJrzL57pb15hWGkQ50cySO3AgbqQMEP6VwHLSGcrz63YfZy+EkZndh8O6xdF7M2BvHHU76xsIgmEtncRQUYAwiOBS53s+G0dRFuxRIURZTCUG3DFyotiY5OY2jeeSyXiltWL4FLcH1KCYvDzUwdzWFOwIw0BkyatI5d7l3WvK/b+7xYNtjNec2xlg==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id r20-20020adfb1d4000000b00337d6f0013esm3099374wra.107.2024.02.08.00.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 00:19:34 -0800 (PST)
Message-ID: <cf0bc574-f120-4f0c-926d-1cd6c353289d@linaro.org>
Date: Thu, 8 Feb 2024 09:19:33 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add video clock bindings
 for SM8650
Content-Language: en-US
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>
References: <20240206113145.31096-1-quic_jkona@quicinc.com>
 <20240206113145.31096-2-quic_jkona@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240206113145.31096-2-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/02/2024 12:31, Jagadeesh Kona wrote:
> Extend device tree bindings of SM8450 videocc to add support for SM8650
> videocc. While it at, fix the incorrect header include in sm8450 videocc
> yaml documentation.

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


