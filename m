Return-Path: <linux-clk+bounces-18015-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57830A359FC
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2025 10:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15D553A243A
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2025 09:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8D322D797;
	Fri, 14 Feb 2025 09:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="w/ZqNx6a"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D41022D4D6
	for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524338; cv=none; b=TlikizmlCFkMQ3tGR//3uItgwjFkj7WZ3r4HOPKy82cLd0vpcrcGV1SghzeoBG5xguojt799MMQS2ZSF/OHaVRzdsTt1Vz16U1riUkr44nO9rCfrP/63nA09pfDuHFp0eF7O5UePp7d9UJyhKcHlbenWkwa83FX8GxYO2IDLjg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524338; c=relaxed/simple;
	bh=09wSG3UP8DXNAydNOXO7UcqtL1Q2WajdRDiW/oR5ky0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QVdKgoldGYWFn765P7/m569emWSTuG5x0SSqHa1Uc5Yv08KbXl6ZY2LlhjVtpEG6QSHajpapPTDufB45avZZf6GxRPBd5XsISqQE+tt+6o06pW1+A8n1OPw9chcIEggoI+QdbM2EWJn32waAZeD3r/A8mkRo1kLzWimK2FEIt54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=w/ZqNx6a; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dd93ace00so1006610f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 01:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739524334; x=1740129134; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XWPLpS01eydUHu6GBaBUe8/ayY4CKHZMhz0y47NMUSQ=;
        b=w/ZqNx6a+M2Pc/myYEC492A2kNrYpbyRBq0ytUzsSS1GYHgLk1bcaaIeoAJvRF2JJ2
         01ivQJTq/vrsfJztn42XLtvO5Alo4Cuk1XcjK6UHr1MwFxe9CAmAHj5C292A93AFvtCj
         p2GPoFJ6pY6K/B/RxaMj04qIhr5blexwqgCcjqBWKOYilwSqwap+9Qb9/MXvJge6eO4K
         UYbimlzsfQjh1IPuUAOdlPpwMnCIbtbvPWTm6FY+2Mzn6dJuAQ1ylJN+t9FQ3RSh778j
         aXIk5WgprR9E6MndzyjQlfxBc0sKOLOwlBJq4PBayY42jxeM4w6gkc1sFrNFPudcPqYp
         3RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524334; x=1740129134;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPLpS01eydUHu6GBaBUe8/ayY4CKHZMhz0y47NMUSQ=;
        b=rVRLH6XOlqPpZd4FdTbmGNZ7uZJYj8MKjDCekSmdUBYLMous0RptOBY485dJfclbbe
         D9kU/kIWiLmckmG6QFl465jhXiZNa98ftIT8GcCp0EZff/sUIgdhFq7GUImppetNc+TU
         0KURBzjxuSDnBREtSeTOPQUez7LnT4GzOvy7KBuxDb3cOJLkn53TGlX0kfJ4AUvsR3qe
         69+ZGER6zFUHZ5VAX4wp83vmBTRiyGz9OonYAMDoHjeaOhti12tkPSjlJzmXXwzuLPp/
         64rTdr+EycE20gBmBHZqm/jt/LlGIhC1njoc0BKcGGouC/a1I/So1/z7CD4k76zdEfCK
         pYvg==
X-Forwarded-Encrypted: i=1; AJvYcCXTQmOu4UKU1aCBLjo32FGSAG+kQpQQiFTh9JDekabP020FR+/XjXnL9rLFQ1yzn0yMTmcikAk1boQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjseEuVUi9llKoqLfdE8QJ2ZP5ocTyLq37GHYMQQD9bYvmDH39
	Z68YV4asie7O1V/uvanGd9MY+pUTrGKESnsPpdFxwVN7kCo+gtytNTgUeQyCzIM=
X-Gm-Gg: ASbGncvC+6Y3g397qilpoyjw8sGGmLQQyWkpsiBovoFVMdh2dtOIxC7kJWMlFo8j8FN
	bi5AvcVKzwrDb/BGl4+vKKBMob9VS1qL5urnWKE6NLMIqKuqo9DazfyypADhIIk5SUMlBs+bRKx
	8ihfoI6S8dkQ1Cs71Lky8qn0fK0M7L2ZjnLaOX6lPiyl47NX200xColQ9yCQXOXx3XiRydvvMU+
	IqpBuPHzcQTX+JwxDUFwFADBgCe7RGWmyEEVhXh/Mru3A4tVFqDQqm2TukUPmu2CeGZ9ShMWr0M
	T6fqEeuDaMep/3A=
X-Google-Smtp-Source: AGHT+IHB7Zaq1DV8SNQlu/uvUkXW1GOYMzSJKw6n2qPshAIpNTdXKTBQ2IDut6nlYHPtUDgvHL/tTA==
X-Received: by 2002:adf:e390:0:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38dea26e7e4mr10175098f8f.21.1739524334488;
        Fri, 14 Feb 2025 01:12:14 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:baa6:bc65:b9db:3759])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f258dcc45sm4114605f8f.33.2025.02.14.01.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:12:14 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad for s4
In-Reply-To: <20250214-audio_drvier-v2-1-37881fa37c9e@amlogic.com> (jiebing
	chen via's message of "Fri, 14 Feb 2025 10:13:40 +0800")
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
	<20250214-audio_drvier-v2-1-37881fa37c9e@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 10:12:13 +0100
Message-ID: <1jjz9szy8i.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 14 Feb 2025 at 10:13, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> add the s4 audio power domain, add the mclk pad, sclk pad
> and lrclk pad clock id for s4

Incomplete description of the changes that follows

Also the change mixes 2 differents topic for no reason AFAICT.

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml         | 18 ++++++++++++++++++
>  include/dt-bindings/clock/axg-audio-clkc.h             | 11 +++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4ceab82389167079c2258a9acff51a76..364783c6f7572b09d57de2b35d33adb7bcf7db18 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -21,6 +21,7 @@ properties:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
>        - amlogic,sm1-audio-clkc
> +      - amlogic,s4-audio-clkc
>  
>    '#clock-cells':
>      const: 1
> @@ -100,6 +101,9 @@ properties:
>    resets:
>      description: internal reset line
>  
> +  power-domains:
> +    description: audio controller power
> +
>  required:
>    - compatible
>    - '#clock-cells'
> @@ -116,12 +120,26 @@ allOf:
>              enum:
>                - amlogic,g12a-audio-clkc
>                - amlogic,sm1-audio-clkc
> +              - amlogic,s4-audio-clkc
>      then:
>        required:
>          - '#reset-cells'
>      else:
>        properties:
>          '#reset-cells': false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,s4-audio-clkc
> +    then:
> +      required:
> +        - power-domains
> +
> +    else:
> +      properties:
> +        power-domains: false
>  
>  additionalProperties: false
>  
> diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
> index 607f23b83fa7287fe0403682ebf827e2df26a1ce..75dde05343d1fa74304ee21c9ec0541a8f51b15e 100644
> --- a/include/dt-bindings/clock/axg-audio-clkc.h
> +++ b/include/dt-bindings/clock/axg-audio-clkc.h
> @@ -162,5 +162,16 @@
>  #define AUD_CLKID_EARCRX_DMAC_SEL	182
>  #define AUD_CLKID_EARCRX_DMAC_DIV	183
>  #define AUD_CLKID_EARCRX_DMAC		184
> +#define AUD_CLKID_TDM_MCLK_PAD0_SEL     185
> +#define AUD_CLKID_TDM_MCLK_PAD1_SEL     186
> +#define AUD_CLKID_TDM_MCLK_PAD0_DIV     187
> +#define AUD_CLKID_TDM_MCLK_PAD1_DIV     188
> +#define AUD_CLKID_TDM_MCLK_PAD2         189
> +#define AUD_CLKID_TDM_MCLK_PAD2_SEL     190
> +#define AUD_CLKID_TDM_MCLK_PAD2_DIV     191
> +#define AUD_CLKID_TDM_SCLK_PAD3		192
> +#define AUD_CLKID_TDM_SCLK_PAD4		193
> +#define AUD_CLKID_TDM_LRCLK_PAD3	194
> +#define AUD_CLKID_TDM_LRCLK_PAD4	195

I think we've been over the fact that s4 audio clock is very unlikely to be
compatible with the axg/g12 generation.

I doubt they should share the same bindings ID.

>  
>  #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */

-- 
Jerome

