Return-Path: <linux-clk+bounces-12548-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C062989F7D
	for <lists+linux-clk@lfdr.de>; Mon, 30 Sep 2024 12:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DD301C20159
	for <lists+linux-clk@lfdr.de>; Mon, 30 Sep 2024 10:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB37718A921;
	Mon, 30 Sep 2024 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLKzlMdY"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1805189B80
	for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727692511; cv=none; b=h2wNqtmj87D0K5YpIs15ndJ1yOg2SazN1d2z8T2I9kNlceeJ7KUhSE78er4NEgxemUNxJutEY+vJgpc0/rb3lbBi3YtjtJktNaOuoP+lVLmhpwvKgwEsM0nTf8hS7uk6IBAFT5TzVbq2gejlFrHYkYWK9fY25fS+9ZzQ0HV18Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727692511; c=relaxed/simple;
	bh=ejnBLgwJqqjFwgJjER+8c8E0QM4KFSEIDR4O47AjrSc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VYBiXwaf1cVreJMUOlu/YtmWeuA2lOQDRIfi9U+iRnpHs8FPYirxraArPNGYQ+HdTbZdDsSCwOYaswQZ+b05h3rIp0hyRigLaPOs/Bb71hCCiJvIYUK2YpWjeMCygUfR+3zx0bkypDPvcAkOT1/bf4k7iF9ksONHNlrhmGgKE54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lLKzlMdY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb0d0311fso6238555e9.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727692508; x=1728297308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lji+21mQIO7A8/WgDulZAHnUlZFcbKgkhCSPgy/WRJg=;
        b=lLKzlMdY7BMklU0BalUJ8Eoe+pYdCzTYN3tIgShCgqX+jcCTUU7tQZne6RmFx0t4Ty
         RWu3aTj6J6M1F5xU7MmXkC70scCMIRYiuRfPidNHIwrwo1xGdyYr+1AdjrVUR57dP0R3
         pUMKn6IRUy28KQ7AGlgRqfyMqW+ANVGwCJjuHqW+sHh/gqpjK+MlOLoUuEWyorNbWJoM
         cILPn5JnO/v4DrLgIjDHXlnz+6q2gHOc3OFiZRU6K7UgvkoY05MZz0No9SCjzUfd5VhR
         Ult+G27BEh7zYbS8i5n7X9wiya3CsLBWN8yPjGwvRL8bGnGa7c6RZX+drAxxGJp82YIi
         QTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727692508; x=1728297308;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lji+21mQIO7A8/WgDulZAHnUlZFcbKgkhCSPgy/WRJg=;
        b=qRNsbg7X+pivdgIIw65db/ZRq3LmyXHgtPrRKM0oDQrNLxMPLNVEufYYElL+sDi84+
         gO4ISPsKujAq/j2NDw3F+9hdfiE1EhUIlq5zHGaPnuXYCwmSjBfVmyX8LOuDIS3DQGkz
         8isUlVBqHnJmDVo86n+T8x76AKzhtKbHpn/UVEYXJpt40niiQZaSTDMwn2sTQb3Qem2i
         pqQaHLBIhyxQwcU0+rwCWWzi1SC7pZjOM1SOFdEIyBoKgL0Pb2xbQaID/pMcXFKJYXXk
         QrQy6gH403SUxn1rf8QwacAqFV3iqKBqqbIGbPt06X11buaIllEJ8SJb0kiuzmYhUg9P
         LYOA==
X-Forwarded-Encrypted: i=1; AJvYcCXy8nMjwNzKR1EpcH/8l7hsaRoMmmKhVnBhgXCHWH9q4S+oD0V0xHDM17NCOwEulH1M5Xyf+3xgO8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjTn75+q5niC5NzSW0At+LxpZXUAw4MjWBTIzYLXy4kPSQ3w1N
	nyjPLeaMbJF8RHiZryI7x6I3wxRnipN7edSfbhxEM/FApv2VezjIYt+csFPus4dT5CKFUJNeQ/m
	WFQQ=
X-Google-Smtp-Source: AGHT+IEIv3YIzxOMyD91tGVpjiLG4v6GYnFW1k0S/haEur6YF7vfhxTGVB0CNUixANKDjBDthZ0ixA==
X-Received: by 2002:a05:600c:190c:b0:42c:b55f:f4f with SMTP id 5b1f17b1804b1-42f584981bdmr38307095e9.6.1727692508272;
        Mon, 30 Sep 2024 03:35:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57dec11bsm100090265e9.23.2024.09.30.03.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:35:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 sunyeal.hong@samsung.com, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240927102104.3268790-1-ruanjinjie@huawei.com>
References: <20240927102104.3268790-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH] clk: samsung: Fix out-of-bound access of
 of_match_node()
Message-Id: <172769250641.25036.8404145862785909939.b4-ty@linaro.org>
Date: Mon, 30 Sep 2024 12:35:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Fri, 27 Sep 2024 18:21:04 +0800, Jinjie Ruan wrote:
> Currently, there is no terminator entry for exynosautov920_cmu_of_match,
> hence facing below KASAN warning,
> 
> 	==================================================================
> 	BUG: KASAN: global-out-of-bounds in of_match_node+0x120/0x13c
> 	Read of size 1 at addr ffffffe31cc9e628 by task swapper/0/1
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: Fix out-of-bound access of of_match_node()
      https://git.kernel.org/krzk/linux/c/f37d898d2cd0790a7328bb4865fba4a9810c75a0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


