Return-Path: <linux-clk+bounces-11101-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE75895C6DE
	for <lists+linux-clk@lfdr.de>; Fri, 23 Aug 2024 09:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C456285B13
	for <lists+linux-clk@lfdr.de>; Fri, 23 Aug 2024 07:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E63813F43B;
	Fri, 23 Aug 2024 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="giS+GPXb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB754140397
	for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398978; cv=none; b=izc/Aj0EYp9XoeJWoyiqWojlFNxyVMlX+6xAqWnq86Z9bM5xg4MmGkDSkq2tiL0ipJ0kG90MtrE7PpwF+A105GYi9z67q+QojypAU0L+cNGw/3BPs2TQyGPCXnuZmM7ODEn4EIcLr1utiffpCXCp7tMS0ileFR9KcaDBnfoE54Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398978; c=relaxed/simple;
	bh=mXPUmP7dBm1hF9aPNvkVq73aIRnUiqmV6bxPVZB7uUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kpyiyLWl2YE9yk3ip7suFwPavjWFQrn2aVxKQ7v7MZRRveqJoYpmYb1GTDRDQQnpnlq9wQHerfWCX6dcCx7aVlDrCT1RaLaGfkFMoaCNTfT9/Q5EGESZo3cwrs0XIh2lXq5yY10H79UN7Z0m7MmyQ1NmAKvyaBOxXUW1EfP66/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=giS+GPXb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37196229356so37221f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724398975; x=1725003775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmP2YyoEl+UqZBO96Ffhdvh7XCvOn2PyzW0uvyy1uCM=;
        b=giS+GPXb0ICULjcFM+pNbCRmhhHnLwjlQm2moSjcQa/xqy1SamUZHa1/PaXDVxk4mM
         w5lyr3xZ9A5RH9DI3EVAWpTN32yJCFzspc8ASKVYEo+ThUBR2J7yPZH4mxzQoKE1sYG5
         6v5l/Bx2zmTcpeApETd4f9bbfJbzCaXD4uh5Q+koBEXpgCU4nH47Hmm20geYJEKVbKYq
         Wggfj6MrTBHyWgPPjGxxWbhmInYjmN+zNUk9EQdNv4f/IrPMZGYXH5kqqd3/tg/yG+6m
         bilMdAzg1MDrJAZlW6ZAp7QBYivq/5XqjnWqFMe01RHP2fMwZxK8xwtd2IZclUu5Ucdu
         otpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724398975; x=1725003775;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmP2YyoEl+UqZBO96Ffhdvh7XCvOn2PyzW0uvyy1uCM=;
        b=afZX7w5VRfFqA+t/3im8QXI+4K7zP/PLs7lFb/8uptc3k67dr55snKyC9G/0SEU/vt
         jWRKqwTKkl/9XCZTGNG+dSYPpHplxLy35Il7dv8jRQjd1DApre9YNMrdY71Q/czqYd5t
         ybhGJo1ps9wkqscs13UiOy+N+eM+/WftAf+uUjYRUD2WY4BnBoHwM9cea+hTKvU/X6k2
         c/xDka8c0z/r/a4KOXfZCEsMzN/sQxVvfZZVWNfckEF2nKUmkyzPfV+e15MxOXVJhi1c
         gyMBvKQjXkr9DLAW8QwT/xUhQTQmjOC4IUH09enl9zPzd6uQZCLc4LAyUDXSeme3fRmp
         1k3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzTDcKKB9lPInLy34s9hcMO1HrIU68oLzUZmRBT9iiubIG7YdvSazXA7nA7JU7lM7FXelAAgUoGrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqq8JC0YMibQng2nX2hC6ogH6xhWUzzeVt7hIMAohurej6THV4
	GU9qJrPUjGTO3aTbC9hI8bv/LfWUhJZbe2z5xd3APCYHmemBQhnhQVB6yqQ028bL/lwKHorh9gE
	s
X-Google-Smtp-Source: AGHT+IGsW2lhogX/jQQ7aTmGIukA+1KEru1fVIORs51u+vDhDGzCYq/S7fM0adWIz+lBkxatIHvO1A==
X-Received: by 2002:a5d:64ce:0:b0:371:733c:7882 with SMTP id ffacd0b85a97d-373118e9fcemr398335f8f.10.1724398975228;
        Fri, 23 Aug 2024 00:42:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ff63esm3485541f8f.87.2024.08.23.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 00:42:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240821232652.1077701-5-sunyeal.hong@samsung.com>
References: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
 <CGME20240821232656epcas2p48fcc8ecd2bedce5cdcc7d34a0069ac2a@epcas2p4.samsung.com>
 <20240821232652.1077701-5-sunyeal.hong@samsung.com>
Subject: Re: (subset) [PATCH v9 4/4] clk: samsung: add top clock support
 for ExynosAuto v920 SoC
Message-Id: <172439897372.16898.6606319087129896109.b4-ty@linaro.org>
Date: Fri, 23 Aug 2024 09:42:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Thu, 22 Aug 2024 08:26:52 +0900, Sunyeal Hong wrote:
> This adds support for CMU_TOP which generates clocks for all the
> function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
> CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this block
> and they will generate bus clocks.
> 
> 

Applied, thanks!

[4/4] clk: samsung: add top clock support for ExynosAuto v920 SoC
      https://git.kernel.org/krzk/linux/c/485e13fe2fb649e60eb49d8bec4404da215c1f5b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


