Return-Path: <linux-clk+bounces-12553-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A476989FD1
	for <lists+linux-clk@lfdr.de>; Mon, 30 Sep 2024 12:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF513282C8D
	for <lists+linux-clk@lfdr.de>; Mon, 30 Sep 2024 10:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15F618D622;
	Mon, 30 Sep 2024 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZSo/vkJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512318BB9E
	for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693518; cv=none; b=DY37Yv1iwwTxc9y2435PVb+kes8dOwqXMaUWirnGMyNIg0KL5XwKLaKczzXizzJ02IrVesHgBXnP8wvAWIwbGavy4Oiogmm+x8oDnlrFmIZKITu8EJC2TqSIvCtee3RXLerp+QFkthzG6MMsm0jVktxa2YWKgMquqOD0TqG6o88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693518; c=relaxed/simple;
	bh=qs7ZJEUvQkDuGY/NdNPSo7a5/3b+K7XWq8qcKl9g+0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rOaIzlxIvNHwZIZw7OUkggnNEhT/VIQqAz+PPJOxV58Zo8Odw2DF/mjuDpTHum8ehrvCMU3CZu0NRQUftcruWtzoHyDwGLxSLV9Sq7YbAauyQoeuVQ+487hgBuX/5PTzKrHmW9Br4yAlmLxN+K+pvRI2RuVY7wm2BWfcVTbPj9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZSo/vkJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42e6dbc8c7dso5849505e9.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727693515; x=1728298315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NrpcGzq2X7FUeooo3oK/NoZGdoCws8o9zjwmd3SwC4=;
        b=eZSo/vkJNw2QUhTp47vWhqDHAXDX5Ph+nFm7KsItW3z3SZ0GvjtKtPMFetYX8sUfBT
         GoBdVqXSuZZjiY0uzgcuHNw/uw+ncDn71HZGcqe5c5P8mpffUckUsMRggzExSHs4MTvI
         aouGbHhxbkD64ErVgr6rbAqnN5UyElu6oXyFZzll3ty3MmPqPTCcUUWC84iGtVPjpIVJ
         1xhtnwmN8GttYO2tfUw3RjkDAVS9HitI2V31ACqbP5vblH3YCjqiRtObQyuTbkBlH7vD
         S7BWNocvGQXDPEmcmPodixFUaN4ZKJ9zSGs1H180n4a1ff+XIyyvQyfvC6xOv4ynaSF/
         WU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727693515; x=1728298315;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NrpcGzq2X7FUeooo3oK/NoZGdoCws8o9zjwmd3SwC4=;
        b=PQdnPvB7CIYeZkBzgafbbc9avVzlpj4lwkzd6+oFjxbuMotBFu7WWpXDKbarhS+1Ps
         LaH4didOmr02PIrAvNquxNNzaA2W9iH4g2eQtT8N+uc6m2GBS79kSNL3IRwDRXY1q+sX
         EcWH8ED4Us+IMdJC+bxv6TTFjtUJBlzxJPbx4B9tAThfXnrQ+6cyIBniKAwrKEW+Ryfi
         +JisQusoF9StrIKAXgfmXVs+3yfqQp7tGyP8bgbFg2kSdTOhWDX3+WzS+uIxsgvrBSxb
         2xIPB5kK+UV1IcKLgy/n4zBvT+HE5B7Ij2DmNS4YiFpqZWVpu/i56XbLcBtnykIiXrEk
         zh3g==
X-Forwarded-Encrypted: i=1; AJvYcCXNoiI+Bs8CJ2CP6C3uDZllvwgyi4b9d32Z7CA0Q0O7gX0+hGJq/NPA3KdmknxDRXynbgPX2+tgirQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7YM07H34UmOfgGl8jidhpZkVDXLM6sbQIZEBLhn3jC0K7Ntww
	XhCeWNuYpW9YcTsln1VBts8UShMlZwJ+1e8UxcYou1U7/8vJPVvkdwbxjnOZrKBI69hvk/irUXM
	It6Q=
X-Google-Smtp-Source: AGHT+IEOO29rsmHXOq1A8VX2uRLf7D10lSyWawJH83ILxagvL2rZ5u7vPabfYAr/tIknh/8GVqnDTg==
X-Received: by 2002:a05:600c:4fd2:b0:42c:baba:13cb with SMTP id 5b1f17b1804b1-42f5e37365bmr26702885e9.2.1727693515024;
        Mon, 30 Sep 2024 03:51:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57dd3106sm98632815e9.7.2024.09.30.03.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:51:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, Inbaraj E <inbaraj.e@samsung.com>
Cc: pankaj.dubey@samsung.com, gost.dev@samsung.com
In-Reply-To: <20240917094355.37887-1-inbaraj.e@samsung.com>
References: <CGME20240917094449epcas5p37c2593fe8f181d6b19a9a1b290488186@epcas5p3.samsung.com>
 <20240917094355.37887-1-inbaraj.e@samsung.com>
Subject: Re: [PATCH 0/2] clk: samsung: remove number of clocks from
 bindings
Message-Id: <172769351330.28623.202959929040095252.b4-ty@linaro.org>
Date: Mon, 30 Sep 2024 12:51:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Tue, 17 Sep 2024 15:13:53 +0530, Inbaraj E wrote:
> This patch series moves number of clock from dt-binding to driver for FSD
> SoC.
> 
> Inbaraj E (2):
>   clk: samsung: fsd: do not define number of clocks in bindings
>   dt-bindings: clock: samsung: remove define with number of clocks for
>     FSD
> 
> [...]

Applied, thanks!

[1/2] clk: samsung: fsd: do not define number of clocks in bindings
      https://git.kernel.org/krzk/linux/c/a86ffa40a64bd4d119c260a99e28f2a71f86d9f4
[2/2] dt-bindings: clock: samsung: remove define with number of clocks for FSD
      https://git.kernel.org/krzk/linux/c/2d3e0135cefccbcd8459112a8afe260e7b51ff6d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


