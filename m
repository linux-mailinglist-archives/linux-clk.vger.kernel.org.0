Return-Path: <linux-clk+bounces-26261-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9402B29CAD
	for <lists+linux-clk@lfdr.de>; Mon, 18 Aug 2025 10:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3E7318A33D3
	for <lists+linux-clk@lfdr.de>; Mon, 18 Aug 2025 08:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C06D304BA0;
	Mon, 18 Aug 2025 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGlCf3RQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07874304BD7
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506858; cv=none; b=UpfPGvENBS99Ch0x1kXVYNl0IfYHcOppA7fpxOVExdnhu3JeU5kywyV5q0bwu2MBxa9TYKw1J2GzMfEvu0XttIWbAXky0fkdUzwVrlk1YMwm1UoqLEqeq11oQEETabxHEg9TVRoYg24R6Llyh19tyn0cS8SgZ5XXPiqC9ouWhJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506858; c=relaxed/simple;
	bh=cfhhhzhQxZrXxPloRoYunXy+b+gOmZJrF1u84C5Mzbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n4+HIcR3V58drKjD1Vp8ypTa1mDm8gh21AChAdgTTBeb7Th8/lsc9oRfqjkCRvMSZM4LP99TPKIAqvAUSOvRuIO0OJBESj1r7NMR6W9YC2MaQkYB4kO3DYq5vKu3NKPJpxOtceg174Z4vrVG4Nwq7KVez9g010Lgcr33E1xQDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGlCf3RQ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso47294a12.0
        for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755506854; x=1756111654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=;
        b=xGlCf3RQ4OmYcH5KpurF2OaO1+xexpMa7V1UcD1BKoR60Qyf5OdIGs5eLIfRfjd8sB
         GwoJow6gXrqivJeYhMZ7n3IAPAwP1TrKollsllF/aqm5/S3fRQk8cklGJARp7VMDD7oV
         G2JZvvk4hC6VpCYnYCufufk3nBMESnf600hcp/o8imuSeytayRJgvB8DbsBkZ+FYvvL+
         S0+UzRXh4Sv4ztoWVxjTahRrVZIYAm03B9oWwVizrsxRxSfPvAOrqiT6E2BCMWFBeklJ
         BVuQAmvTlUyhngkfX04Ksi/ZaJq5TW+lWXjWy8tmaziLZYTSm3tbNR8pDoYsmIQHdO/T
         yDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506854; x=1756111654;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=;
        b=BfxtF5Nu0ymIXdoLWuF9tiEnFRvsihz6I5sOJffVY8h0Qz/Di5WLquNvfykjz/YWBK
         /uYLqrYcHKWVMQ5hsEdf2wEcbQ1/5ziZU+L1IWBbcHDzdsk11ox2T1BBs04Wk8GzgHpp
         fOco6DkCXM4fXWYXYi36gLyLJEfNBzt3LkAJc8B8AhiR7eWEdiQPv+hG7EJoyz+SZnrT
         gXDcqKYzHQSbrr9fXgUaKuoTBcbGpPvC1eqS/Ovi7CgcqFsW05gANRh0CoCXMY7NcP0l
         av+yodSHfWnoBAvVymfUFXMMEMLF9nsdMHb0WjkGnjj5SoKrV7Z3lt9S2ZqNo9w2SQ3d
         utxw==
X-Gm-Message-State: AOJu0Yy9vd4njbMQpiuQB+5sZUPOAmFOptrUp+6PTsk1F/XcbKAztMsf
	YiGvuJ27Z5IRhG9jpT8pQPRHjAZWyN/btFR8M3ji2hdhnAO6SGNx2qovpwK8d4W4HCQO+cP79gG
	wTCNR
X-Gm-Gg: ASbGncuOk9PsA/ObjBrSckvPs7/6prCtVVogd9QaNxYkCsKYpEgUvrLN/9D92BvlWNn
	xOgC7H9r0EYSMAZs6/VczeWc2wGFypKXsI5ON2hr8TuR0KgRCjl7pyEUmpQCsrF9DWspOx6FSOt
	0I0HZ4H9a3HKk2PIdq4s/JPwtwvLljOBkZwq4b7jVdIF62OlI4O6B4b2CuvvbFkpyloaPIw1io9
	7MpuLbhwOjAIpZ/IUw1uhVmhO//mW3PjKz8g2NV84u22ZLzB26OGXDN1rwsFih27PRX3DRcmBtj
	30Txa7dXvkOGjXWdRT2rz+HudpvUMmGmbP6q3g/xoel/TENVuNIr2Di11a6Qo02qY4m76UL5hM3
	yuXodWJO6JyOAyXS7Bsu0agQsT53XUrv3W0lFuuI=
X-Google-Smtp-Source: AGHT+IHknpi+jVcAiHPe7qLq8tMu11yKP03M4lXkXrorN3kjMjAvXVfdd/sJwjbdKxYg4VZrpI7G9w==
X-Received: by 2002:a05:6402:1d54:b0:615:5cc1:3446 with SMTP id 4fb4d7f45d1cf-618b0f1c504mr4641443a12.5.1755506853905;
        Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da68fsm6627647a12.22.2025.08.18.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, 
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org, 
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 ravi.patel@samsung.com, Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de, 
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250814140943.22531-3-inbaraj.e@samsung.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4@epcas5p1.samsung.com>
 <20250814140943.22531-3-inbaraj.e@samsung.com>
Subject: Re: (subset) [PATCH v2 02/12] clk: samsung: fsd: Add clk id for
 PCLK and PLL in CAM_CSI block
Message-Id: <175550685171.11777.14695565851704310683.b4-ty@linaro.org>
Date: Mon, 18 Aug 2025 10:47:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 14 Aug 2025 19:39:33 +0530, Inbaraj E wrote:
> Add clock id for PCLK and PLL. These clock id will be used for
> operation of CSI driver. PCLK is AXI2APB clock used for register
> access. PLL clock is main clock source for CAM_CSI block.
> 
> 

Applied, thanks!

[02/12] clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block
        https://git.kernel.org/krzk/linux/c/1a713bd3b0c60d826bdde633919bedc1fd38df4d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


