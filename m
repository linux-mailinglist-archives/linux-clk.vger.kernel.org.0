Return-Path: <linux-clk+bounces-1772-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1EC819AB7
	for <lists+linux-clk@lfdr.de>; Wed, 20 Dec 2023 09:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C16121F20ECB
	for <lists+linux-clk@lfdr.de>; Wed, 20 Dec 2023 08:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC3B1CF88;
	Wed, 20 Dec 2023 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nr1fyDZf"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95961CAB7
	for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c2db2ee28so67530045e9.2
        for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 00:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703061647; x=1703666447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9bCFfeXqdM2g4XB4+Gj5tpzo4H+2Jggs88xOD7WpKk=;
        b=Nr1fyDZfQAJHhq/GHb3X/zSZnmmrCdZNiqKJv0hZi314/Me8j2V/6XBV4IyPNSZ4bl
         oBCynSoiyJoEtoylS2Gvr/dEdFjT+EJnaEGhX3ZLlEuXY3G91WYRC+0cpqZn/J6yfgd+
         In7zAoC5+qFmqvu9V2l4YrMSOm+9o/ba+Kj3RThrrJsaQS0oF+MbXfwKWpO7zkJkVpch
         BNMdsI45fBe5gDdAUROcRwdENlqQ+/njIIM5N0VmKXFG+OJ6VQaUvnWZdpW2/2ymKddT
         wH5pwG/6/R5ubX/cNLzmhdoiQs9lKlOtLO9bQrWrYM7Jl5LXztPkrWWNo8rdrWm3c3Dz
         4/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703061647; x=1703666447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9bCFfeXqdM2g4XB4+Gj5tpzo4H+2Jggs88xOD7WpKk=;
        b=EOvcuHtXDPooemwlfw16RX+AV+UqV1vqPNXMllIg1qe7UNGt/w1N723YSTgxNu2bMu
         +aBkDSeA0BSOuACxW8cLA1JUMim77b/YMYkqvd3GPTBzWP4Q7V4tivJvsl0Naiu7lnUr
         SlyNJeX1RBffvrLISbQPCW+Ylw+/7erLy2a5Js4FndyaZdefyl1byOTC8KL0oTV0ThiI
         OE6nbiPS28mFKndGnpKA/irZ84d8PGQ2pgKbaqtvRdWR5NsM+UXvyL6SZhX0vTd+VlJN
         80A965eiF3ApBnDzBmX5YQ4utn19ln8UG6OR7F+zoRLDyKEuFN8sF3ovLEDuE3YG3nrd
         2WDA==
X-Gm-Message-State: AOJu0YxGG+MSaUff2H1RF5miDM1PiZrS/hDEhZMPXVr1eDxF0Yj7sxYQ
	2nuyQePeF/nsYF4uCVeVigTnPg==
X-Google-Smtp-Source: AGHT+IFBCsvEI7sl0gIM4cI7UOtQ69eB4wNSoVXnNe2KR8F6iDEyLZVt+BYJbipCui9m8ELu2zwG2w==
X-Received: by 2002:a05:600c:5487:b0:40b:5e59:cccf with SMTP id iv7-20020a05600c548700b0040b5e59cccfmr10901500wmb.176.1703061647018;
        Wed, 20 Dec 2023 00:40:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c138700b00405c7591b09sm6299174wmf.35.2023.12.20.00.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 00:40:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.8
Date: Wed, 20 Dec 2023 09:40:43 +0100
Message-Id: <20231220084043.21549-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.8

for you to fetch changes up to 5583e92be5c45448e6ea461e1780d46c17d14963:

  clk: samsung: Improve kernel-doc comments (2023-11-16 20:46:03 +0100)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.8

Few kernel-doc fixes for Samsung SoC clock controllers.

----------------------------------------------------------------
Sam Protsenko (2):
      clk: samsung: Fix kernel-doc comments
      clk: samsung: Improve kernel-doc comments

 drivers/clk/samsung/clk-cpu.h |  30 ++++----
 drivers/clk/samsung/clk.h     | 157 +++++++++++++++++++++++-------------------
 2 files changed, 101 insertions(+), 86 deletions(-)

