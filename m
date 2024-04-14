Return-Path: <linux-clk+bounces-5673-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8B889EB6E
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 09:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C33AB22C5B
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 07:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B0213C90C;
	Wed, 10 Apr 2024 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A6tAjq6a"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CD413C903
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712732796; cv=none; b=nylkT71oSD8zXE/Lrk6Nj+L/KokLWeQVpi8CkNgGFt7UMcPRsYkJf4iDR3nvZXGg/5oEtLzcUM8I1t96nYUr3USYIWq6Yyvnzvzk42iBawYblO/7bGy8S9zSST8QyVl37b7T1vF/mFcBbFSFxy7UOUVXWQttm3q23CHrs1gwbS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712732796; c=relaxed/simple;
	bh=Hzlv0DmxXJ7vbtYZdoas9ZfWsSL4k7t49qjvJAmAIak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6YK2CL7t0RvGgtOtUL9k+206zWiaX0lQKD4FyrciNatG1k+RWxJxEz9VWSIl7/6dZNxQ345Twi4Q0L2zwJ3ixj87ZZK1B0fbSEK2LUjg82UxLiJHCsNCSgqT5u0iSyuiH3cxNaiZrsIktEbig/cskD0zBzBxr/f8xctA7h4dfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A6tAjq6a; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-343f62d8124so3286393f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712732793; x=1713337593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YKCsmxkfmx7L5x9xLDxMcm0/bzPzSIjUC870Wzbk8Vo=;
        b=A6tAjq6a5dOzWGKnE8W27eZLjWDpGM6L4bYEsPBGkzZyJr2+g5Ae/KpJOOoJwNvGbD
         cmSSosZJH6fxsUqQ2vpOS17yL0CNyxoua4OnrL2BKIDkwnVNlqUkrcXVAkE5olr8oY8u
         yjTrcCN3JH8+BgXDEQBVFJT+5iXygk17To+y8NicQ3ZTdvql0IGRiOPprX8PnlGmZ1KM
         FKZLK4IS23SwBagVHiVV7jt7/cAQKDJ7bB+483hNV0GuaL88z6J/SkoZBn9to63/vRRf
         eovizI31LRa4qVpQ8n2o7vYpxPd5l4zjraGSJVS9fleiFwDKZAFCgIkfp0rqcWIg87vy
         OBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712732793; x=1713337593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKCsmxkfmx7L5x9xLDxMcm0/bzPzSIjUC870Wzbk8Vo=;
        b=Fcwj1pqD6MDPlkfYY8R0cmKvKjEszBGXBgdNIMcYbVCIRUKCN6AnU15MfaHEOfFx0E
         aZnQHvgZP8V3NLE//TD5cmbyjkYmIjj9VaLKUKIWacCQM3DKTDruB1nZWTZKN0YDfmvV
         9Ng6LDCbBCMU+0tmekXcOUkhZt5HlYYsTzVfX3dX9zIsqmZMIqO4QFr+3S0O1UMZ/CK2
         mWuURRrQPBXz/fZ0AkfSdvg9LjS0eF2epFWWBgfMl2B468PhqtpW29NDX1wGfOPtVpLd
         Ny2M/X40YRG3WwTG6rEw9A154gkdG+4yVPNw/BoB5OdE3cNoeF2MRW68MHY7IGE/ly5X
         hJCw==
X-Gm-Message-State: AOJu0YyR1tAVBe3GIuAvq9DV0weGc6HxkR/HvG1HnDXoYvD5rt8SGxp+
	whfuvkzTJQtT6g8/tLfn/IpkBWD2RHFmXYJfgKmroH3m0mmOax9XzntRi3lWlQc=
X-Google-Smtp-Source: AGHT+IEcDrat/3qwa4Pa9ArnaQu+VQAX87B+vpAQGcXtK3Q6zEYkXAjZ1zSLvSh5x2RaZgMUoxThZw==
X-Received: by 2002:a05:6000:1e8a:b0:343:41ef:ab1e with SMTP id dd10-20020a0560001e8a00b0034341efab1emr1107585wrb.44.1712732793375;
        Wed, 10 Apr 2024 00:06:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id a3-20020adffb83000000b0034635bd6ba5sm2777170wrr.92.2024.04.10.00.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 00:06:32 -0700 (PDT)
Message-ID: <0fd8811a-03ea-4471-a72d-7138aeb319f5@linaro.org>
Date: Wed, 10 Apr 2024 09:06:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] dt-bindings: stm32: update DT bingding for
 stm32mp25
To: gabriel.fernandez@foss.st.com, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240409171241.274600-1-gabriel.fernandez@foss.st.com>
 <20240409171241.274600-3-gabriel.fernandez@foss.st.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240409171241.274600-3-gabriel.fernandez@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 19:12, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 

A nit, subject: drop second/last, redundant "DT bindings". (plus a
typo...) The "dt-bindings" prefix is already stating that these are
bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Subject: Everything is an update. Be specific.


> RCC driver uses '.index' to define all parent clocks instead '.names'
> because the use of a name to define a parent clock is prohibited.
> This is ABI change, but the RCC driver has not yet merged, unlike all
> others drivers besides Linux.
> 
> Fixes: b5be49db3d47 ("dt-bindings: stm32: add clocks and reset binding for stm32mp25 platform")
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
> 
> Changes in v10:
>   - cosmetic change (add change blank line)
>   - rename USB2 into USBH to be compliant with last Reference Manuel
> 
> Changes in v9:
>   - Update DT binding documentation according S.Boyd remarks on RCC driver:
>     Don't use '.name' to define a parent but use '.index'
>     Then:
>       - remove 'clock-names' property
>       - Add description of all parent clocks used in RCC driver
> 
>   v9 was Acked-by: Conor Dooley <conor.dooley@microchip.com>

Please avoid putting full acks somewhere in the changelog. You confuse
people's filters and maybe tooling as well. "v9 was Acked-by Conor
Dooley", so a proper sentence, not "fake" ack, would work for everyone.


With fixes in the subject:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


