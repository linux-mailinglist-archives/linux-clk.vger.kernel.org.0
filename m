Return-Path: <linux-clk+bounces-3477-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7678384F103
	for <lists+linux-clk@lfdr.de>; Fri,  9 Feb 2024 08:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C742D1F219BD
	for <lists+linux-clk@lfdr.de>; Fri,  9 Feb 2024 07:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD38065BA4;
	Fri,  9 Feb 2024 07:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xR1Bx6DH"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E2665BA2
	for <linux-clk@vger.kernel.org>; Fri,  9 Feb 2024 07:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707464946; cv=none; b=IMeZuixG+yQLfZDBPcV8zQFEIv7odOp2+fZZSRdqRM4R5NHsDmcWb60qhQZe8bzRo4y0UviYDhUDVUHr1n5ceaxEOp9ODgjuaQ0b6yLceDoxGDfw2hHKxv6E4v/TWOX45cDqdPD5ZE1qXRq/noHD/eSw0+6/INZBHSe8uw3nabc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707464946; c=relaxed/simple;
	bh=jK3YIdGz/lKXmBAb1/2WwgYirgeH7LFcrui+HXv+eok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALZaaLuc1FRgWSu9vMcz7+Xbl38MIykfKw3W4KQSvHMh7aAPaDpTEkpOkb1+2CgloFrB80rUXkhF6/M8f9ZSbyErG8dN26QGwq2kpEk2xtQ/xsqdzuWzSRUWCwDSUVvwIxwyPKKfTx7eWy3J9h6tvrdYdstZW6VjE5CkuaJCsls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xR1Bx6DH; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51178bbb5d9so231878e87.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Feb 2024 23:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707464943; x=1708069743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jRpl9jyLQF82ivCaa0/+aYsVthoMcMA2pqnI8tbHSig=;
        b=xR1Bx6DH5J2xF4PT1olOWuD7Y7zb2IEJjMoUc3FJendhjptbiWYi66AsBAR2TkICKl
         cdoJUx+OJbRvn9umDupGmy8aYjeDs32SLoaHKaThLVGIK2zxmpGS5lq+xFcyEklv5qdO
         iFlyv1ut2m5AnI1wQHG816n3UVYIyWC1Jc2pVtUNZ6fa7RTczKW8r7RJoJfyFDTR1fS6
         M3F2hkrO0nHeGsb1IehehfO5bQ96kwnf7DVq3fZ6egiCShSll9el/VyIjXc3p/jMdxWf
         75+osVuDaQmsebTdxqwRX7UKxAjRw0I5IRnz6/hVHry3cDreG5hDScqFoYUEhjDP1wAr
         5Eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707464943; x=1708069743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jRpl9jyLQF82ivCaa0/+aYsVthoMcMA2pqnI8tbHSig=;
        b=MwIVxCqi2Mbdhfn35CN4h3V66yOTXgkSR7OKjRAIGaGSBzSUDfsro1vlQZbjxmN4Pv
         XbaItDM+CQVOOtADPcQbqzUvi3OFhNKnS3TXHXYKem8GBXSuDWKZYdmYhTh1p+bTSfTq
         T7K+k8YkznjLG+armXTAnft3m5G0VFoFzwAGcQg6QlIjngNHunL5airguo2p/WonC8D5
         XIPnAw+q4L0cNW3gjA9v3WNLMN9sdpVgN8dpB2rL4ibXknivKm5qyIJDh/938UmFsADS
         rr1tQhqiXK4cpFjnfBHVanwyK5K2tdF7Wm61Hc5Q4msA2ruRMOZWFK/l1GVHHLoDeX5H
         tOOg==
X-Gm-Message-State: AOJu0Yw1ylBW3+3o7idxR8I5BDyZgD4PPjhW0d+g2A1r9m6e/4PNYygx
	AqR5vf0VOpSbOwTTgXMw+WkcG2L1HykFr168LDqAAAZU0ISJ2Z70IgwRZT+BmrQ=
X-Google-Smtp-Source: AGHT+IECQKy9XnrwpN7leCDwCO/JCDd7qqmVsNEXxLxjQxSuV4dlQc/IrNnGlgmCxN6mWVBb3pU/2Q==
X-Received: by 2002:a05:6512:23a5:b0:511:680c:94c3 with SMTP id c37-20020a05651223a500b00511680c94c3mr553587lfv.11.1707464942711;
        Thu, 08 Feb 2024 23:49:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU45Y1G3ksATvgrrzWfWvs7N5ndlnoXMNCa5PRC5IPXHJBSFI0YDvyPLIRunsdq3DT+tR7mnuY1GayeCaJJ9Qeut8ScspuZ4N0xFSGxUP8JPiJ9O+xE+VVUSPvnHdribVgkvpoinyYpOv6wAJiHKylpDwJ2C5wZe6e/ON5OqFwu9dlu/mWnzB/oJUBQrv7bQ6pU4DDOqrX/QPlUEgOGYf0lC9J6b9xXJC4sJi7t9PQSU3JFnNt5u2n85pR7ellN1tp1iwrG/+TBdnCNFoRkstSmvXJZq00BMWIFrze6G2RGVu4ZUiTqQFg6REP88M1jGUaHrL2+LVwvC1Rt0T64kv6foWzE4Ya4btcackThZgttRMqQ4HmgbAcH+sQuP2RL+Jbj8xCYt1YPxp57z/qGM0CNTyaJp0AU383RO7kmmda8xw1orMqFdShDgbnxYVe9aVyUeT1FzuCG8n7ZDa+lC0QZnQ3ub1zQTQHJfnQk4hnXW6ysrngBZxCgW9T7PxN5y1WnqwZxpAUPQ62EoAS/B1GZwECWgsHwOlub3w==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ay2-20020a05600c1e0200b0040fdc7f4fcdsm1791764wmb.4.2024.02.08.23.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 23:49:02 -0800 (PST)
Message-ID: <7311143a-ea03-4619-99a5-05307704a561@linaro.org>
Date: Fri, 9 Feb 2024 08:49:00 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] dt-bindings: arm: mediatek: convert hifsys to the
 json-schema clock
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240208215926.10085-1-zajec5@gmail.com>
 <20240208215926.10085-2-zajec5@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240208215926.10085-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/02/2024 22:59, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Documented "reg" property
> 2. Documented "#reset-cells" property
> 3. Dropped "syscon" as it was incorrectly used
> 4. Adjusted "compatible" and "reg" in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ----------
>  .../clock/mediatek,mt2701-hifsys.yaml         | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
> deleted file mode 100644
> index 323905af82c3..000000000000
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Mediatek hifsys controller
> -============================
> -
> -The Mediatek hifsys controller provides various clocks and reset
> -outputs to the system.
> -
> -Required Properties:
> -
> -- compatible: Should be:
> -	- "mediatek,mt2701-hifsys", "syscon"
> -	- "mediatek,mt7622-hifsys", "syscon"
> -	- "mediatek,mt7623-hifsys", "mediatek,mt2701-hifsys", "syscon"
> -- #clock-cells: Must be 1
> -
> -The hifsys controller uses the common clk binding from
> -Documentation/devicetree/bindings/clock/clock-bindings.txt
> -The available clocks are defined in dt-bindings/clock/mt*-clk.h.
> -
> -Example:
> -
> -hifsys: clock-controller@1a000000 {
> -	compatible = "mediatek,mt2701-hifsys", "syscon";
> -	reg = <0 0x1a000000 0 0x1000>;
> -	#clock-cells = <1>;
> -	#reset-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> new file mode 100644
> index 000000000000..eb429337cdf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt2701-hifsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek hifsys controller
> +
> +description:
> +  The Mediatek hifsys controller provides various clocks and reset outputs to
> +  the system.
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

If there is going to be resend, drop items here, it's just an enum.

Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


