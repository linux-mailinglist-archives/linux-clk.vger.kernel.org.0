Return-Path: <linux-clk+bounces-27289-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AF5B43DA5
	for <lists+linux-clk@lfdr.de>; Thu,  4 Sep 2025 15:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DB6D17545D
	for <lists+linux-clk@lfdr.de>; Thu,  4 Sep 2025 13:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18777306D4D;
	Thu,  4 Sep 2025 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ll3IK9Mz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD25305E21
	for <linux-clk@vger.kernel.org>; Thu,  4 Sep 2025 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993696; cv=none; b=gD7x51zgTkelNLpib92g+V4nRGNifjDML5LITqZcENGhUXxzQmvNYPXaPpy8twqdDF09ifmEcOZvYy+TUAnTfjYQwiIZhcKMOrkAjKljYrsX3V62dHq2XWyAgKnktnyT9y+dhQHu0ACgwI+UCmTMQdrC7vaImaz+imi1OL2Awh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993696; c=relaxed/simple;
	bh=5b17D17KCNLnqi/G2Z2dTgyoEWSeb8SG6sPYeTo5izY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DRhxf3/LExXPgBZgfE69oXshRk2qmi1iw47b8j3a7O3cjIwsH/k3TiidwyNjNtFlqK8Qe3Jbb3SWXPfTiIZIlh2HdELCSY4ybeSReHvEOOMWmC8pnaIobiHs6PqL3y5pej68li4T2p0bU5jCLG6UZ8cnhrJt0h9OUsInwACwXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ll3IK9Mz; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61d1fe6f160so194178a12.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993689; x=1757598489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5PfVj7z1U9Fq+QcRMWYVttXEzyn9uOL+vv6a+ytkds=;
        b=ll3IK9MzbAsGWBYZYSLZwhueudyH7E5mbvXA6FF7OJ+F5GdVVJ5/9kzlfA7Rs00Zdk
         wWLm4/l8mU3uD17NgaH9Dw9w8gvCt96No8IhNVO5h1BkSzxDdcvRKCVwAZCyUTRTFm9E
         xya6RRwKJVKmRupE+mBQoap7vojfayhu+UxgPYGMb8FY+b/YQNU8UpD4ilz/yqaFI8+t
         WpHkmXptPNt6EfA3sH5G8inCFiDVj2Hz9WEqfEwQEBt7CBpbLue/4Qn6wigdH+A93mJr
         dNGeduqbBTL23LYBgzbYpSnWmDnyfjZD9qbw4LWfpNUP4bTYAdRgYeBjz3ourSxYXFOJ
         3XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993689; x=1757598489;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5PfVj7z1U9Fq+QcRMWYVttXEzyn9uOL+vv6a+ytkds=;
        b=s6JrGc6Km4kFFYPrs+YDNmFLdbXwURi9Z1gYF+muUm+2hK62IIumTSLQuaixKlC0qj
         vN4YoKGiLVljfPOkDErtqh9Kq/hp1SHofGqp8lFvbxw13gAq/HCB57btA3jQhbRNk72m
         lBKfyJ5cpixtRqw0f7RetUXr11tdY0dfXY1WKJyVcJ7UiB1PSRPgqfBUOG1+vKR+zntA
         umHqCnQEonYOr6Zs6vY4V+3ruhPG+3iz/bb3CgzUkTDwBEyedtlp8Bt9lDusTGN5ZBZW
         Xrbm645mSZ5LcLOiHVTh5mnez+xLFE2iYXopyR5lQh1Oluzwvso3jFTNHrQPC04t3sv3
         OdBA==
X-Forwarded-Encrypted: i=1; AJvYcCXxGqnLmv6PSJ5EuxAB9YwJEWZ88j6tOCzvLFTjddpi/G4Bh1GDGvSbEFSZBDJ1YDrrcQW3KvdhRWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAv06STC40dxvoBCFKKWfCwLlCeNpfuf/kERfUUyXz4jI7stVb
	uYLS86P4EmrcUFxugOkdhp2MewgOhHDSVXbTw7AY7qgfn6dtv8RXbrbw2d6dIvrJrDM=
X-Gm-Gg: ASbGnctMpAZ/qfTCgOfw639WnTXN6tAppxSYLKbPDpZy+gpNW8cPkA/iX2s8UFsB7Vm
	ArsHrRY24bIa28Vnw2ykL9JbLHGG1q8Gs0OWvQcRYDQoxyNt/cHB/Id9ZJuvOduv82gvncfUBTn
	TIHCz2rSy6K+N4dUEo2hRJXE69QdV/ukbEYh2KPlWJC78vp0dHyn7AQ/T1O2bDZ9jNHLp2Yk/1Y
	cl5fdf8QCVVRYbDrHwSHfUv4oX+7XjBcmsN2nxg12w9O0c2WyZE65D4cFb3H3iaA9x22Kj7Svlt
	XVLfcmwK0nuUGAQKSH70XYzeUon2z5EFsZvzd0mHTakzwqMJWMLhSEq+Ta1rhRd71EzH9mbIpr6
	37c3AYpRSnPbEnH9X+qxUo0CL2dQe6Qe0L6mhdTM=
X-Google-Smtp-Source: AGHT+IFXmHyLiRikp8i7AT0rm9igyDk82338TdO+dG49oonCsmp2DJJwv/hKJNb9HHXBa/ePNM0EKw==
X-Received: by 2002:a05:6402:354c:b0:61c:d7e5:47a3 with SMTP id 4fb4d7f45d1cf-61d0d365421mr10482985a12.3.1756993689530;
        Thu, 04 Sep 2025 06:48:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61edb0fdf1dsm4243221a12.18.2025.09.04.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:48:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250831-usb-v2-0-00b9c0559733@gmail.com>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
Subject: Re: [PATCH v2 0/3] clk: samsung: exynos990: Fix USB clock support
Message-Id: <175699368813.172086.8536010951360222334.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:48:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 31 Aug 2025 12:13:13 +0000, Denzeel Oliva wrote:
> Small fixes for Exynos990 HSI0 USB clocks:
> 
> Add missing LHS_ACEL clock ID and implementation, plus two missing
> USB clock registers. Without these, USB connections fail with errors
> like device descriptor read timeouts and address response issues.
> 
> These changes ensure proper USB operation by adding critical missing
> clock definitions.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: exynos990: Add LHS_ACEL clock ID for HSI0 block
      https://git.kernel.org/krzk/linux/c/eb9bc162775cabfc4cf2b37cb0d3c2c2bf4c4b54
[2/3] clk: samsung: exynos990: Add LHS_ACEL gate clock for HSI0 and update CLK_NR_TOP
      https://git.kernel.org/krzk/linux/c/d0563d320b6014a8d56170253fe0aec524658b9f
[3/3] clk: samsung: exynos990: Add missing USB clock registers to HSI0
      https://git.kernel.org/krzk/linux/c/f00a5dc81744250e7a3f843adfe12d7883282c56

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


