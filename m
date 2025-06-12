Return-Path: <linux-clk+bounces-22897-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA28CAD7653
	for <lists+linux-clk@lfdr.de>; Thu, 12 Jun 2025 17:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA64E164F67
	for <lists+linux-clk@lfdr.de>; Thu, 12 Jun 2025 15:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDE129DB6B;
	Thu, 12 Jun 2025 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rAg/G+SW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C118F29C33C
	for <linux-clk@vger.kernel.org>; Thu, 12 Jun 2025 15:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742194; cv=none; b=Yijj0axDMTwBJ0DQxCx68CEEnjZK+Uz4t87QJe0djUKNzh+cDjK9zJw6qTXBPIZfmybFuvnZtoHlyk7eKhAUFmU92l3bBab+KN/SDxRzuu8D/TA++ajGNi0N0XXISE5VbomIImqiCmT9IEwNZrHi9EmukGB5wjJuknrjkiAw8Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742194; c=relaxed/simple;
	bh=z0ar1hJos7ARhEgbjSSfr1bzntLG3QJmXsE49Omcdw8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E8Bm8DeVKNuNwP3l6LfJjuFl7hqDctTEWrWK4nHrRroFht9HZwTMV358qWoriy6rq03k3wyZLStnsnz7+l1N1/ZiY2oUTi1M+foFDUOzz0VmkfdkRunAIFvTxw+OKzlv9ARrn1npFpPqHGnvmJmqeKycG+SsbQb3XcqPIU4FhpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rAg/G+SW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso53049f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Jun 2025 08:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742191; x=1750346991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKvQ0kizkJd8CblYTjjvTx/DyqmBuLZOpwvQ/Oh9KYc=;
        b=rAg/G+SW2txg0b7vzr6ipT/igZ8ZIsSUxWPPHeSBCfVOdSeb37vMFzo/tnXAwVYVDG
         AjduHqrBXzcBgJQmivIkFdCh/UVcFd+Hi8xsj3ZPERGr76CSuHGbnxjF/6N0Y7D7JqRM
         p0nSVJvXoGYwosAy4osuKRzZdwWJeoPMmT8SFkPvB5oiQx9xBg8rX4kRm94p0yGeF0vA
         rCyWw+crKm2xq4MwJ9AtwYZ/cG4t9zn2JkCbD7AMtdqFdF+ZFm5l0mVAWt0tN57m+FVf
         yKLkPof3O1Po4Ju08M4Qb4BVX6M67vubZmCeQmGbdDX3isCSsEAgqGNYS6JpbzOJXMlO
         idAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742191; x=1750346991;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKvQ0kizkJd8CblYTjjvTx/DyqmBuLZOpwvQ/Oh9KYc=;
        b=aT8GTRbmdoe0K2fZH9kZ9P7o2tNo5pn+CipYBzH3GcirKdNEW31eQXKByl2x01qUWz
         dY/cbAg0hF5Q0nwU6DAY6a1TqexnYF9O+1oplw/jf49BuLDBcE6T8P0eF+Wez9eAzeTx
         MhjdI3zGCwvDYLJ+99I2/xGa9ZFh3GjyB1LkdsXbkvqBytBuMe5UfSs6GtXWWcwaRdU4
         kS40KabOIqUsuXjqXy6nTrieQy6ulow1HhdE1YZy5UFTvHpteD0UL6fiqJHhjSs8BX6E
         szZh+GFHRvVpcaQsxyGYCLbLC4GCQnMPc+VsQ8kYzmBOqXvxbPwFmxI0f4YiswLewPev
         LoZg==
X-Forwarded-Encrypted: i=1; AJvYcCXaZyqHQH6sAb5j1wHsJC+qtWENMV8tyghjO5zb+ctEzUgJ4KOet3VD079/bMlDpGUn5PV8ORWPIZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaLRSo6BYImxEY64TVe0ibR/RT45U2lF+odEPRJkDcMECqWYFh
	qVxxrP/VlueLIyA2h68mNlpZsqMwHDPtgB/suTUV8BPKSuTj79qXCeUEd7d2ZoCU7JY=
X-Gm-Gg: ASbGnctr/p7ZhXxzyS5IGzGhDdqJldqABZhEcVFogF+bDA2PrqC9wdBIpsrL4cQ/K8N
	XM1xMRDdx4euZ67Jb5i4CLs4nIUKEKsE5k3hECCe7qIlZKLpd/w1d745gvhW1oZFVY7XFYxsIJs
	t9GGMXp+dIbZUhx9am9pMQDTROD/xLILEuCPuSSt6l+ED2FBudPfsi+16Dyz6RwtC3dfwekzLEk
	gtjvKsNOfdxCRrjGLnY/k4aJnLOLfWvUjCa/0WJ9qOe3uVnTrX3O0scgsXqAfvUlYWvA1f1JXPH
	DNKGdQr+CTqrQ+A+0jWNDrptzdW92ULkmDriZTzdYznt7BIE4T8tP/sFPHFhSD2mm4RINWm1nQ1
	ylSNRf7M=
X-Google-Smtp-Source: AGHT+IHcEf5K0JeoZyRffkMk2oZLKO8IT8ky+qUldOOWFDZEO8dRcFFzDiYHDmEiK60pzDMoVYDLyQ==
X-Received: by 2002:a05:6000:26c1:b0:3a4:f8a9:ba02 with SMTP id ffacd0b85a97d-3a5586b8858mr2648512f8f.1.1749742191063;
        Thu, 12 Jun 2025 08:29:51 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232e4asm23557265e9.11.2025.06.12.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:29:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, 
 sunyeal.hong@samsung.com, shin.son@samsung.com, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 chandan.vn@samsung.com, karthik.sun@samsung.com, dev.tailor@samsung.com
In-Reply-To: <20250529112640.1646740-1-raghav.s@samsung.com>
References: <CGME20250529111705epcas5p25e80695086d6dc0d37343082b7392be7@epcas5p2.samsung.com>
 <20250529112640.1646740-1-raghav.s@samsung.com>
Subject: Re: [PATCH v3 0/4] Add clock support for CMU_HSI2
Message-Id: <174974218878.126240.878153774506566554.b4-ty@linaro.org>
Date: Thu, 12 Jun 2025 17:29:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 29 May 2025 16:56:36 +0530, Raghav Sharma wrote:
> This series sorts clock yaml and adds clock support for the CMU_HSI2 block.
> 
> Patch[1/4]: dt-bindings: clock: exynosautov920: sort clock definitions
>         - Sorts the compatible strings for clocks
> 
> Patch[2/4]: dt-bindings: clock: exynosautov920: add hsi2 clock definitions
>         - Adds DT binding for CMU_HSI2 and clock definitions
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: exynosautov920: sort clock definitions
      https://git.kernel.org/krzk/linux/c/3d6470990bfc8600609177962a53201cb0640daa
[2/4] dt-bindings: clock: exynosautov920: add hsi2 clock definitions
      https://git.kernel.org/krzk/linux/c/da5cb65d25f747236a003b82525eb6de5d49a2e6
[3/4] clk: samsung: exynosautov920: add block hsi2 clock support
      https://git.kernel.org/krzk/linux/c/2d539f31ab0eb3eb3bd9491b7dcd52dec7967e15
[4/4] arm64: dts: exynosautov920: add CMU_HSI2 clock DT nodes
      https://git.kernel.org/krzk/linux/c/e2016763590f571cdc3912d6a7ec848d2b61e6c2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


