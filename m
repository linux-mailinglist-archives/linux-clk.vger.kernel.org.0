Return-Path: <linux-clk+bounces-3198-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7813F845306
	for <lists+linux-clk@lfdr.de>; Thu,  1 Feb 2024 09:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EEFA285C63
	for <lists+linux-clk@lfdr.de>; Thu,  1 Feb 2024 08:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E4815AABF;
	Thu,  1 Feb 2024 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EY8zvD/V"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70915AABD
	for <linux-clk@vger.kernel.org>; Thu,  1 Feb 2024 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706777106; cv=none; b=RLqFvd6IMOt0Yle8HYAizuabxlNP6lm0nOHiXZpRkS3hWT39Ih8WhOoczvXE4PJMMl2HxkzZ52j7cEyz+kxKiQLCD/Ojw+xdJaGhsS6Ku/dyGlcljfSivLgEmNEkBk8CUwIqCZeWZ0iCyyXFLL0EsSDu7ZxlL10G8l4Og3XTGlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706777106; c=relaxed/simple;
	bh=H63ky5OGP/fMkHzYxDZrGRGJseXqxobdgokONowi+AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTwCQKUxZ/PwmDjB6Win2lZh2rTeaSQjgPzxsABKJWitOClzujNO4miPOW6JpLcOQSo60JcLEok3bTAgwT8vmR9UxvwSbz6XiqCcLyAtGoTuGwtOG85KndqLFiQTRNEE54qryYpIhq1CdlUucOXr0TJbnwoTOLj4m7Get0/jHqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EY8zvD/V; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55f082c2c92so877777a12.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Feb 2024 00:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706777103; x=1707381903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKhtgxx9F1SKH9mor42U/3ONSOP1lRbYWhFvHuqK0z8=;
        b=EY8zvD/VRbAOm3W1uU8JqIjSCOrRVkuRPDHPc6KXSxmrpUm/WhKi2wnoiXuodjPj1U
         UTb4GJBOifqvl07rsd+btdlRyH8SdFs19sxOvZWeTK+a5iIGO+xi+VqJ4AMFQ1OrNXCf
         Awk+krbV4nlBrL+OOz4YpeU2HJaqBK/NGv67WiEc0pQyyNYKXk8zoK5obDZ4NZNOfIz9
         mHPlxRRRj8t8sOKjwilYA0XDtDjkVW9vWA9d1rCtbPzer0U0bQH5LfZyF4scVeXh39tQ
         LteI1HLeEtbqSQASvfGBcdxFGqzCb1suBez8r7FPVgyUzBgX8zKMbm+ePu2Fm53AIo7r
         M7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706777103; x=1707381903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKhtgxx9F1SKH9mor42U/3ONSOP1lRbYWhFvHuqK0z8=;
        b=frJ7F9OO6PA3yJkPyOhU/bwqmHAOll/61/7yy4Y/xZK+oLvF/qElorUm8Ypy2l4NeJ
         OSsjQUo1h3iElK92jQrlauQIXFQN2+Xjsi+CsfRKiIM3i9KIER7H/s1kd/NI71IWBK8U
         0aKQbUCkQwWL3ISddL5nxFoBUGDWI8MsQoHGAYV3wk/12FKqICxy5XivvAqquB3jxsas
         n6NfH2KNT8BdsQXXe8MGoDJx8vzJesLTNch0nPL3zF6CW3DXLgYvO0/ygJmjcoRVNUCk
         vSdoN5hBef8rPacdAhJJJ14gnA3eW9ngNTfb+8ngUlfwmV0qG4jrEQ7CnKUwsicHlzbo
         eaTw==
X-Gm-Message-State: AOJu0YwZ41sd5fkJyYZVWraFVsFO62mfS1jlDeXVf85/L9JlYtOr5hoQ
	Li7SKS+JuCtRXut76jotVbc/dUQmPHBnSJAyx75bStefpR9eiaiLQg4f+N5u6mM=
X-Google-Smtp-Source: AGHT+IHTv/FFzGdUJfzgXdvklrUopceP0lK0QC1GyD4W+X6XemVEt3RWLSFEynqDLKfI4N94C4i1RA==
X-Received: by 2002:a17:906:3b8e:b0:a35:7c25:b7c6 with SMTP id u14-20020a1709063b8e00b00a357c25b7c6mr1197838ejf.72.1706777103251;
        Thu, 01 Feb 2024 00:45:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWX3fPBRMuTirggrXtYuqHCx13rNhQPzUp6WB0CWgF6dofQYJaknvP85XJs5MmcLpWGYUSqp4vJk6Fu049HtPQ883017R+FwK8HiQrQ0DEM9S6y4h1AruZIIJUhFTyNyrJauaVy7JgxHbddKaqf4lOyj5Wj81WCckyhyGCQi/TuOorLyk6/uuBeQzfhBrmL+z/Hrz1saF6nccWOFb8w98tLCRyB1/qRMLVVpdb5bFH14HzlfHXnuiT3XIpAOw1REzRFCG++OESs1XfNYRFfqd8xyX+JfBu6B5XnmU88nlCjRZ/klv43J5he3J2D17mv9CFsSKypRLZfGwKCIL5d/0xvwjBSNQYM2c9eombyVVjgB39X5NoNBqru8SqoAYahI98gx1HWWpQnjTbc6ycvyBJgK9g7w7U0PPmvF2foP/Yj/5GoNc87N19w+vTL
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id p6-20020a170906228600b00a3589038f0asm4809306eja.198.2024.02.01.00.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 00:45:02 -0800 (PST)
Message-ID: <ddeca5d1-a636-4524-90b4-613655642d91@linaro.org>
Date: Thu, 1 Feb 2024 09:45:00 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 1/3] dt-bindings: clock: npcm845: Add reference 25m
 clock property
Content-Language: en-US
To: Tomer Maimon <tmaimon77@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 tali.perry1@gmail.com, joel@jms.id.au, venture@google.com, yuenn@google.com,
 benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240131182653.2673554-1-tmaimon77@gmail.com>
 <20240131182653.2673554-2-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240131182653.2673554-2-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2024 19:26, Tomer Maimon wrote:
> The NPCM8XX clock driver uses a 25Mhz external clock, therefore adding
> clock property.
> 
> The new required clock property does not break the NPCM8XX clock ABI
> since the NPCM8XX clock driver hasn't merged yet to the Linux vanilla.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


