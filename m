Return-Path: <linux-clk+bounces-5022-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FFB88BD40
	for <lists+linux-clk@lfdr.de>; Tue, 26 Mar 2024 10:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27C571F3E376
	for <lists+linux-clk@lfdr.de>; Tue, 26 Mar 2024 09:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CBD535D6;
	Tue, 26 Mar 2024 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQKmnbqd"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7524CDE7
	for <linux-clk@vger.kernel.org>; Tue, 26 Mar 2024 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443860; cv=none; b=Ls6C5x3pP6ppGHrT8mTspvYzqYz/1a/pagUSuNuJgvYfG8fex/14ycXpoIButi2dW1ve3F5bWO2LHBKEVLM8GF79giipFm3MBa0xB7o0G28Ejp+N+sniNP1mQi9eE+sjVXk8SonzRPYc0i61fQxWQUolnPmu0vgTv7auVEad4yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443860; c=relaxed/simple;
	bh=ZyvDnyVdYW8mApjviyCj1pFwuScQjCQKI2BuXx5sgvw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t5sGBiDU1dJLToV6ZiC3cxfYCz9jOxWJMV2uQ5dvZ2nS3TntPgIUBruBbx7GvvC9sOyg6m/DeuD3UYskL0fCZlrZB2++dd96SOEWJ67/XSaCJawZenMG9SleaDakjekdRecGA3MCnBjidruo4fkwimuL3sYSto+7CiWGXyn0+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rQKmnbqd; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56c0bd07e7bso2138710a12.1
        for <linux-clk@vger.kernel.org>; Tue, 26 Mar 2024 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711443857; x=1712048657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUHFACxolYxK4dRg3Sf0j2U2n01l+uu5n940mo+Zokw=;
        b=rQKmnbqdQHO+Fh9QJXQIwp+GKUpps5x6vM70tfJF9zDSFXS0GtRyEgMBkv31/aydew
         TXgih7QesKG83xi49w7ZJUIl9UxoR6RkvRQtDdiRMB4hG/oSm142JKY7UDe0uVlBsnhR
         6OzU9ur+fNWN97qWDcXnsYnDW6ps3qCuW78wagPNtLdbD6q9W6QAeNDitIMCKEULqFlB
         ZW7yX3Z+SZBy9rNIeY2gtYbCKuLBpbvlJWeumLMZoXgDbAGA5cUOryOqQPkQJ337gGCb
         uw5iepJ7qwIdWBRJF6kQXdvPXUmEnQd3wcSdvEC6SduL5WKBr237kCbMRA0El2WWs2Tl
         Mpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711443857; x=1712048657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUHFACxolYxK4dRg3Sf0j2U2n01l+uu5n940mo+Zokw=;
        b=fBhqtzrPvZRIDsv8Vdq2s5eGraFO2pcQ73s+j9why6+qbMTqeRI8ihmYXnjckaI1KM
         xZvpNt1FNc8YTcYpZIbcDLCWWFZhdhQATyL1mnUBv9DiNuVRc+/QHtzKTC09l2dLwkaP
         kwYOhWJgjY2uwWxwrsXSAmSanaIOTyYLY/LWgISqzPyp38q8lzCQI7s+tFxhNkJ2G/2W
         f6MsQZY0VQpGdlWD3t2q6FjapDjBV8FYzx9FOBDNBKYEFBGEu33/og6Q0lUgI7zjyWm6
         SbOZQ7MJn8QOgu97ic4aOwRmPzoAcMWIJii/hNOGb9eHCZxsV52SM7SPX6itVbV0ALNl
         iwFg==
X-Forwarded-Encrypted: i=1; AJvYcCVBEQL69Y3O3Ft2PlHoJVAJUu0RZge1QZe5gVDIOi8F5sdV9uw3viMPxBhDVALBnG+X7+QP/sbvIp1q0A+Ez5YYtjw51stPA05k
X-Gm-Message-State: AOJu0Yy3aauH3548Nc5j9jJnl/cOGtu7uwX22HMDQ/k3ZqAo6uRQO4HN
	aUnGMUySsFUWlB6a5Y3nfZRNfZqFM5GqpVZ6d1FvXSbcQ45UQ0/cBVsrNlAFVaE=
X-Google-Smtp-Source: AGHT+IEvHcy6UDTsdaGFobIClvyRxp2fSbGk49oVaAThiZZUGAXxspDnmzsU3qZha76m4QuIBn8YEA==
X-Received: by 2002:a17:906:3e0b:b0:a4d:f999:de2d with SMTP id k11-20020a1709063e0b00b00a4df999de2dmr86359eji.8.1711443856748;
        Tue, 26 Mar 2024 02:04:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id ao18-20020a170907359200b00a46aba003eesm3973097ejc.215.2024.03.26.02.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:04:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: samsung,s3c6400-clock: convert to DT Schema
Date: Tue, 26 Mar 2024 10:04:13 +0100
Message-Id: <171144376244.95623.15251693618331114140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312185035.720491-1-krzysztof.kozlowski@linaro.org>
References: <20240312185035.720491-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Mar 2024 19:50:35 +0100, Krzysztof Kozlowski wrote:
> Convert Samsung S3C6400/S3C6410 SoC clock controller bindings to DT
> schema.
> 
> 

Applied with description changes as Conor suggested.

Applied, thanks!

[1/1] dt-bindings: clock: samsung,s3c6400-clock: convert to DT Schema
      https://git.kernel.org/krzk/linux/c/2125459ced054218fa8cf0170a116e2eeaa0f276

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

