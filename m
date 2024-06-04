Return-Path: <linux-clk+bounces-7695-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E738FAF48
	for <lists+linux-clk@lfdr.de>; Tue,  4 Jun 2024 11:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43EDCB20F23
	for <lists+linux-clk@lfdr.de>; Tue,  4 Jun 2024 09:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CD81448C9;
	Tue,  4 Jun 2024 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LCLjCLVn"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EFF1448C0
	for <linux-clk@vger.kernel.org>; Tue,  4 Jun 2024 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717494898; cv=none; b=g44z1asR+z1i3WBhlw+jjggMKEI63MR3OpFSgvYatuM4BMYu2g29tJuvyobMRrU2KSKvzFQ8IMv947h1fyNOWJH+T0gFDioRJ/Bh69kUjNpo3W5dAewbOZweaBxqWg+cGH8EcqXmubl9x00rWHYBc4IVZwHT522J80Gl9Hlst9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717494898; c=relaxed/simple;
	bh=X2ogPccdDTs13IL08Tf8Bkwcu0VIj1IFTLfvvR7wyB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bgQd8JZioohqagM401SiNT1FTVmbLCkvFFE1VQqHSx8QRem2h2E7iH/gcgJ4U3bm9VssEf9u3/Kdq5XtxC9v3dOa3M3ZMZp0AS01VsnRMY57s0DejGuXdiAIFJLkY4HgSWbvltvgjwLGydjJ/amOt8V/cCWQ7N0XX4RHNEhFx9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LCLjCLVn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42148c0cb1aso7970925e9.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Jun 2024 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717494894; x=1718099694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqG33BTlDFY1JTtCCY4mtc8hNwHOOmvwm9Q2v4L26W0=;
        b=LCLjCLVne/CbZ0ImH+68XeDcA22TsbaROdqtIDs4S7haA/YRQXhm89ARnX8tJE8obx
         LGzfjQhDMj/HXqGt/vaZsLGdycm4hc7bs1cDj5S5Jc2W6mbm4zkelVrVkIfe6mQtx533
         tnHJ2NHpQMoiVZ7uem8cKXJUmhYkFUEX/YTOz697NC6gG0zZHbx+9CzlFgOnthRZZLHX
         Fj3vZkFohH4yjVGZVJ2vpTNLSnyMPUhe/nsoApVkqTXkcwjgCgMWtLhsizQyolgchsVH
         UMz9ooqCiy4eFGbmgf5ld4J8HcMtHbWvgg7b1jmUPG/T87Zx/OyGHasL3ARRlqtssriy
         88LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717494894; x=1718099694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqG33BTlDFY1JTtCCY4mtc8hNwHOOmvwm9Q2v4L26W0=;
        b=EkqkxUCBQvnrABrYn3DTEd2cI2Aadkw+WKMbyJK3GdNso0OM2BevIe9RgzUo7mLBZt
         R18U9DaaxNacv+Jevr8ef7jhhDzyAcqg+2H9dH+kU3zwS4mRE9yG99uHceefucaaXhZF
         8+WF4jp1xSSJbDLI3Bn+m+Rrgf+CL8w2J25ndP4ru/aN3bSGa5FO1k4Cd7JUmJlc6p++
         mpDijaoI+YCJjuHBLeH5v4PxFaYYHASzNBN1VIHOm2CCw1baPE18E3hBJ2RaVrgOuGsK
         ckiGpJe6ACQzQFqjwq+cNnYrC2VGB/p7jlcFrYCuRfBHeC+7p0jWgLvaRZz87OnAl0DW
         sXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCD2qCn0OqapdaB1vqZFkncuttaJxd4M+WCFaKY0xqtJ4uaezLxqnokwO0K3NFRCWiqPja7CI5Y8NQ+K/pCXrVUYCcNYqkRbqL
X-Gm-Message-State: AOJu0YzPX51/hZbwNqT7GHxGtskLsbVRGtIYvDNzFdM5bo10p39pAytP
	mrSGnVKtOU6tqHrTnVpLjXS3XkAgIJtX+yDj2Uj5DWtufxV6DQ13v9r+H7p0K/7o5nicd24t1fy
	i
X-Google-Smtp-Source: AGHT+IFuWoB4BQKHWujuBNN/tLqUteBjiY6L1E/xsaU6QhnEcgVTXAv++hch3aOpdGEUYNU8pLbWlw==
X-Received: by 2002:a05:600c:46cb:b0:41a:a521:9699 with SMTP id 5b1f17b1804b1-4212e045342mr108000555e9.4.1717494894440;
        Tue, 04 Jun 2024 02:54:54 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:60ea:fe6c:6bbc:4888])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4212f9b9ef1sm136678955e9.9.2024.06.04.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:54:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v9 0/5] Add C3 SoC PLLs and Peripheral clock
Date: Tue,  4 Jun 2024 11:53:49 +0200
Message-ID: <171749479841.590656.11363124184470308378.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522082727.3029656-1-xianwei.zhao@amlogic.com>
References: <20240522082727.3029656-1-xianwei.zhao@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (v6.11/drivers), thanks!

[1/5] dt-bindings: clock: add Amlogic C3 PLL clock controller
      https://github.com/BayLibre/clk-meson/commit/0e6be855a96d
[2/5] dt-bindings: clock: add Amlogic C3 SCMI clock controller support
      https://github.com/BayLibre/clk-meson/commit/d309989a0a0a
[3/5] dt-bindings: clock: add Amlogic C3 peripherals clock controller
      https://github.com/BayLibre/clk-meson/commit/fc1c7f941c71
[4/5] clk: meson: c3: add support for the C3 SoC PLL clock
      https://github.com/BayLibre/clk-meson/commit/8a9a129dc565
[5/5] clk: meson: c3: add c3 clock peripherals controller driver
      https://github.com/BayLibre/clk-meson/commit/f06ac3ed04e8

Best regards,
--
Jerome

