Return-Path: <linux-clk+bounces-6033-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EAE8A7DCB
	for <lists+linux-clk@lfdr.de>; Wed, 17 Apr 2024 10:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C061B21094
	for <lists+linux-clk@lfdr.de>; Wed, 17 Apr 2024 08:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8EE7D07D;
	Wed, 17 Apr 2024 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zBqb4uVw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02777C6C1
	for <linux-clk@vger.kernel.org>; Wed, 17 Apr 2024 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713341542; cv=none; b=VI/dXPxo3Sy6cF4Ti68Ms1uA+X7+XqDeMTL34oOxxDiCoCSbrSkGniTgB7MIsYOZFzr+hW2Jhj4B7yP38CNFZkESGAp9ikYT4YRcqIFV65Sx0zOrVus12qYQ4uAoxGNPY1m13TIV6/0rtctBb8Qa8wlxG5me05kJU1g39PVIegg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713341542; c=relaxed/simple;
	bh=QNQAulVJ4issHP/Ip4Ssd5g6A3f/UOyXaYlTGyCTlKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITXmSJSO8Jfqn4M7Ub4PxyJLioEDaJJ+o8426PT0imuyRe825r0MiRzHXRnQ3Mjiv8rSkCPCPQgsdWvB3phc/0+k5Etw5wSKntLVKqV7TSH5ELKxtrM47/L8Wj51A7Y2znf/T09o0UcgOShrjbbYBiPnxT7agVQnKGEKjhwy0+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zBqb4uVw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518b9527c60so4282682e87.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Apr 2024 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713341539; x=1713946339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TzkbbRIO2QimJ8RWbkwCZ+K7gIC0TeXOrUoZh+Yj+po=;
        b=zBqb4uVwnW4hN/7AlwAL+QWGSmWijKm5+cqeKX+QoJGErtLFP/QiZFppxslFERhizU
         Wt0AIO9BEsYbXgPxPqeLd7KuITJ7VaQwUbBpns8iK8YiCJOnbZ8PMK8yupY1Z1y9X3gc
         VHQuR/8Pe3ccZ9bLOxWn/4qvZVPekOBBxvBx2TK/TisbsPwGzf3KVX+kQG9zrbXdkNCh
         5wHK/iDbD8BCPL99CrOmVTnby8GpFWxGZANjA+kaobUgdFsUlW1U+iN+mvbdoMskP51/
         Ad0hCgdADwqy4825uoj0k63yMWoP/kqbur3hfAY3rNpoDw9eGZVio8Cs8a7YVQgb6D6G
         hnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713341539; x=1713946339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TzkbbRIO2QimJ8RWbkwCZ+K7gIC0TeXOrUoZh+Yj+po=;
        b=PuGYHFEx8FukRcRvcjVl/B+qEkbv6Lq465Vem8dxvdS6t1z7xmLB9qtoKy4cZjdm6W
         eUHqsjQs7HXbtVM5Mbi7epFqSexWcNEPNAB8JC31yl0ARERu9aO2fwWI5eL/SdWgmJ76
         4lANHRgNJuzEA2vMpetgzzoDt5JzZBJv43eQJs5bOOrvnCSy7E/Nl2Mc66gCqNQ7yWU2
         658emGbYVva3Ii/2EaBnZxxfS2OcC9r0559IGRJ5tUFiy6xdlK/ub1u8RSt4RC/rN4Tg
         v1b0pDz5VTmW1pnq5IfqLmTu65277+WWBw2CbGQKdoI7dxOb92OeKfgd6xnyiRr5WV4v
         W/7w==
X-Forwarded-Encrypted: i=1; AJvYcCVVzadPyyV1y1JRaXlt7X5OSAyJ6GVMb4NZOr6CFtxsxHvaauQBHF2b57ptK/rfS6buCUP1qFjUOgp6u2xc2a8z6xKyF72diCwT
X-Gm-Message-State: AOJu0YwWQSTZ3Gn8708U0odfN13tXfpw4Q7fLjn0qhKL6ZGT7EFgcxDj
	bWx5Pmus1s+cPvHJtytLR7pvrwAJ8ylxRd27IUrH3Tsxh+Vl+NY5CaQe9ZS/HyA=
X-Google-Smtp-Source: AGHT+IH4Ux+OgM8GODN1EjrwY/h8hAJyaOMv9iN+0tmp9IOucYOjlUfi/JOumwmy4S2/VC/nm5QgBQ==
X-Received: by 2002:a05:6512:1106:b0:518:9183:864f with SMTP id l6-20020a056512110600b005189183864fmr15160417lfg.34.1713341538799;
        Wed, 17 Apr 2024 01:12:18 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7db8a000000b005700ef75274sm4950049edt.33.2024.04.17.01.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 01:12:18 -0700 (PDT)
Message-ID: <5c2a1b27-5602-461f-abe2-1b65f8245d8f@baylibre.com>
Date: Wed, 17 Apr 2024 10:12:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] Add display support for the MT8365-EVK board
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <afetelidcystq4avtmfcvf6h4l5zdthwozwbhjica6jjybkiln@oxx2fqk65psx>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <afetelidcystq4avtmfcvf6h4l5zdthwozwbhjica6jjybkiln@oxx2fqk65psx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17/04/2024 09:58, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Apr 16, 2024 at 05:53:01PM +0200, Alexandre Mergnat wrote:
>> Alexandre Mergnat (16):
>>        [...]
>>        dt-bindings: pwm: mediatek,pwm-disp: add power-domains property
>>        dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
>> [...]
>> base-commit: 890c94ce8a456aa4d7ead5f5fd2603b98dfe7b7e
>> change-id: 20231023-display-support-c6418b30e419
> 
> I cannot find 890c94ce8a456aa4d7ead5f5fd2603b98dfe7b7e, neither in next
> nor in stable nor in drm-misc nor in Linus' repository.
> 
> For sure it's not based on next, because otherwise you'd have noticed
> that the power-domains property is already documented there. (Currently
> as fb7c3d8ba039df877886fd457538d8b24ca9c84b.)

You're right, this V2 is based on v6.9-rc3

> 
> Best regards
> Uwe
> 

-- 
Regards,
Alexandre

