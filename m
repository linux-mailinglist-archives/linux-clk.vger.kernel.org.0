Return-Path: <linux-clk+bounces-6883-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9759E8C1510
	for <lists+linux-clk@lfdr.de>; Thu,  9 May 2024 20:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98D41C2161E
	for <lists+linux-clk@lfdr.de>; Thu,  9 May 2024 18:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCECE7E58C;
	Thu,  9 May 2024 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NvT8V/Ym"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDCF7E0F1
	for <linux-clk@vger.kernel.org>; Thu,  9 May 2024 18:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715280792; cv=none; b=c0A2H00OmjaUzV0ThTaZgJIigGR7QLk3oTo8XLmBNGXqO+ATCmaUq8/XDc/LR0Wua7lidZpiczOrDGqeaj3VN8kQL6O8uO5+/+ld7UtMgwJIo5kwcBFFkJzfrCoGeBKvT2B2dfFYVtWzPKL/sv+4+scI0bAiJPH+VbOpXhXDehI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715280792; c=relaxed/simple;
	bh=FDBcHvqOrEJhX3zGMML2ZNFI5mj1UYFZ6iB1t/P3ChQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OP+O/1UUBEjmaef0gRO37JZLhXafhgb61C4J1uj0xYgZhlcC3R/ZI+yZcQXku4GG5Qy+UqoBGaUHLmCGNlUcrNjOx43Qy9hw6lP+ntVx5tZ9mPL+ufkf/l6+VSGpj733YNjJLVKTkAahbkHLpIVfk/mBJUNfqP6VHNbRy7qLgZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NvT8V/Ym; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so1360690e87.3
        for <linux-clk@vger.kernel.org>; Thu, 09 May 2024 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715280789; x=1715885589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W0PQ9zPz9B0q91yoj81QEUrRLZh7Ep19FlIE+/YTJck=;
        b=NvT8V/YmqLx9LRJEJjOAZ1lCbQ91RAGnnQGoT6RpeVYf/Jf1bZ7ircxc9ZuO++gOOS
         t2CET9OKWyZdacB8gKxop/45KNowQ9MI4pJLxYX902jPzwWcPSSGTi0m9SyxNXqwrhzA
         5BhGfhvmd4AZ5eaHb3srMQcxjyPSXFgm2yYYvbZzpYfg4EqjcgOc0DbNzqYoJx84azWp
         uGJLMAojkXx4c9Us5Vq3OCpz25N6TnfF5n8LHzbYZ6o8CZpTj10Pu64sH0WWJCIDdOK9
         /J/l4ND3yo2cYz/FYZDaVH0E3/RROqV61J1t7SuGVR8GIzjqw+kPiqEfV7OulEqgSs90
         N2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715280789; x=1715885589;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0PQ9zPz9B0q91yoj81QEUrRLZh7Ep19FlIE+/YTJck=;
        b=YKYN1UUoTp1Mg9ycZ4GVXwJaIOu6SF+qq9P+rgJnqa/cvTlAQeXWbduqr+2PBjBT6M
         G8A5llbleDPRTi4jH5nk8xW2Nsxj5cFpdY+w4wNOxyV/8ac0EbNo0pQPbCMQOKYj4b9g
         WLR00Yzybr/mewXkYfvB/yKEtipa2r6Lt9x31mpD7IjA8gwdho1jqv4a9vLwamvmVCjY
         8sgIcRaV9YMQnrd4BQFE3meYzaFccDWahB2BxGjZ0LXyaVOt9GZAQnoNIX4h76fVfxCo
         x+Lb4dL8QpoOiylMZm8ORsULqHcdCkfEusuqfcyG+H9oaDiKZIL4RTK8dtZiJ/4m2XHU
         e22w==
X-Forwarded-Encrypted: i=1; AJvYcCWH3CdFp8+bI9YyixYEErTmeIIWNBpBrK34hGaGcTxeUon+cV6n9fK1SgG1NagoCHahdmg4nr8L7z5MkSf5ZqOEzL7+qxGJSam7
X-Gm-Message-State: AOJu0YxjCbj53VaoNu1675QEstC3tNeShpssewj/B1fQo3WTxrD9x4hW
	C1sIV/FlIEucnSSPTt06yvmkVQ5hUQdvxU5rz46B/hZpcys7z9kL4r8KEZKDTXQ=
X-Google-Smtp-Source: AGHT+IF4h3oCeRGq/vfuBHio/dJbJpsnIXUwROXSPDi5a+PPZLl/+b45+uM39IcVChlp5/TPw/d5GA==
X-Received: by 2002:ac2:59c3:0:b0:51d:3626:321b with SMTP id 2adb3069b0e04-5220fc7b009mr253488e87.23.1715280789167;
        Thu, 09 May 2024 11:53:09 -0700 (PDT)
Received: from [192.168.62.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a178923fesm102190266b.64.2024.05.09.11.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 11:53:08 -0700 (PDT)
Message-ID: <baa81202-f129-4ec2-baca-6ca8b476a37d@linaro.org>
Date: Thu, 9 May 2024 20:53:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from
 Stromer pll configs
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Varadarajan Narayanan
 <quic_varada@quicinc.com>,
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
 Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
References: <20240509-stromer-config-ctl-v1-1-6034e17b28d5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240509-stromer-config-ctl-v1-1-6034e17b28d5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.05.2024 10:08 AM, Gabor Juhos wrote:
> Since the CONFIG_CTL register is only 32 bits wide in the Stromer
> and Stromer Plus PLLs , the 'config_ctl_hi_val' values from the
> IPQ5018 and IPQ5332 configurations are not used so remove those.
> 
> No functional changes.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Hm, it sounds suspicious that we'd have these settings then.. Could somebody from
QC please confirm that everything's alright here?

Konrad

