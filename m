Return-Path: <linux-clk+bounces-3970-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4562286007F
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 19:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE6C2282B22
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 18:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E23115697D;
	Thu, 22 Feb 2024 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+Wx+AYQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776B2157E81
	for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2024 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708625518; cv=none; b=XdkHnpnPDQcWVWShbuACvxNrbt/vufdMkMTfAHIsVBS9bBkPY576T2wIWL4HnXMY/cLkbSXTxHlTEFv69pRU8EXCEb59lzopL8e6P8KrEOxYal9LITDLi4tsUmh18ey7vJf+VPPwWjc7PxwwW+0/mYfqrqGs85wvu+qTA1pF1TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708625518; c=relaxed/simple;
	bh=pI3HJO7nSWCoJwE1PPPjprkH5x82EvXLR/HqaAiyO0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+Hy5lw4MG73axU8ZOfRSYUo7wWeM8YqYY/l58Ll0Z7jeoAPIWgB8c5gvQWYdEQ3KvHh5qLmVKjjnhg/Wd/s24qjjG8W2zo6MozbzJO6cvdWkp+7YRdbPfo4r2jfbnG5fbL68GXly66TyYOL2md2+zx0tjMja/mXq3b7zbVEDe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+Wx+AYQ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5645efb2942so2049985a12.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2024 10:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708625515; x=1709230315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hMlYF11wNoTSnF9lpUQv8m38HH5K98GcHneUE1T3j80=;
        b=i+Wx+AYQ8IRYN+FlpuBpiMniNhWwfuxOviti+veDcWfSSvIH3l6xbelJxymyeflmcM
         nI+zq52BfmuQi3DHhkTE2HHqNwu/P3+Jdk+aPuanm5FCzayb+oOOGiNmmB5UZ6qAwAYn
         OX3m33a1tVF5EwUuo9f+S93B572xVh9wAlmj9KhBusfIXXw+rrTojHXRHPiCYvPDlvRY
         ea8EKGdnaMQ9k5lCaRn1CEF5m8nVP6RBVskjGJeI/8S2ZBt9rU5BrsST4GKzh53w2D4F
         uNd7Fy2c6/jOxGhBEbyZXZURH65X75NWPTNwBGXb65MqejsUBHvT5NdnXvVVDB+TliLB
         Ku6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708625515; x=1709230315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMlYF11wNoTSnF9lpUQv8m38HH5K98GcHneUE1T3j80=;
        b=CorJ8cp+PvSy5ZWMjDC5GgQn9f35IzhxWToRSIuJK+5MCjQqKQHH2vl/DkJ4x885a9
         ce5WbE5vp5/ySbHDvEhjMHjoieQKXf5Px55CXkrbRIIjiTZfkMdxqjRnQcWumoKu6hqF
         gx6qrpRa4a+erlQws9AoOC+8kO7Ml6WLhxTRLKKSbQDgFkop6uZM1RLzjGbvLSdkdHDP
         kW7TyDlxoHPGsUgSPF8qEFWuMUcHPdgIGps60teFmrrX1kQH8eTwsOeVk9J4rH3uXo2n
         FQkU7xuTGs68gOa3yq5AOYQHZwVlOg7U8dwvSJMfi0S91znGqzoJzc5xJp7mWadTLwst
         vhfg==
X-Forwarded-Encrypted: i=1; AJvYcCUh4UVZQU8GvoopM98fDpM5gvZXHw5t+wSTVkrjQSO/gA0nBKFeZYlPcpZcVv+x/g4HODKAp0J4kxxB9MTD2vo+7hOOKIRrrSvQ
X-Gm-Message-State: AOJu0Yxdgvv42Kw2GgZ2EriHxzYkkQIBKQZBt1DTK8Ukg+u2I+X4wp6t
	d0Qd/8GHYZQ9WHkXa/8kMOuU5P15BjwTqKvMi9bWt/VAheknwIHPEoBDZ0f5Hdc=
X-Google-Smtp-Source: AGHT+IF4lflKIu+tGzDcXcCN6Scj5jnKVXg1nyCYmYi5PHn3lFRQ0FjcVD5g4qXTEU5Dy+ZfocVVVQ==
X-Received: by 2002:a17:906:cd02:b0:a3f:5576:d7b9 with SMTP id oz2-20020a170906cd0200b00a3f5576d7b9mr3248301ejb.5.1708625514785;
        Thu, 22 Feb 2024 10:11:54 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id q12-20020a170906770c00b00a3df13a4fe0sm6274074ejm.15.2024.02.22.10.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 10:11:54 -0800 (PST)
Message-ID: <5781c1a8-8097-49f6-b672-33a6bcf2ffaa@linaro.org>
Date: Thu, 22 Feb 2024 19:11:53 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] dt-bindings: clock: histb-clock: split into two
 header files
Content-Language: en-US
To: forbidden405@outlook.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240222-clk-mv200-v3-0-f30795b50318@outlook.com>
 <20240222-clk-mv200-v3-3-f30795b50318@outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240222-clk-mv200-v3-3-f30795b50318@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2024 17:41, Yang Xiwen via B4 Relay wrote:
> From: Yang Xiwen <forbidden405@outlook.com>
> 
> The CRG driver between different SoCs provides different clocks and
> resets. We should not provide a generic header file across all HiSTB
> SoCs, instead each CRG driver should provide its own.
> 
> Split histb-clock.h into two files: hisilicon,hi3798cv200-crg.h and
> hisilicon,hi3798cv200-sysctrl.h. This header file is for Hi3798CV200
> only actually. For other HiSTB SoCs, some clock definitions are missing.
> 
> Create a new histb-clock.h to include these two files for backward
> compatibility only. Deprecate this file as well.
> 
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
> ---
>  .../dt-bindings/clock/hisilicon,hi3798cv200-crg.h  | 62 ++++++++++++++++++
>  .../clock/hisilicon,hi3798cv200-sysctrl.h          | 17 +++++
>  include/dt-bindings/clock/histb-clock.h            | 73 +++-------------------
>  3 files changed, 87 insertions(+), 65 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


