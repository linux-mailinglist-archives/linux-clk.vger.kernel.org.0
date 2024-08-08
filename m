Return-Path: <linux-clk+bounces-10531-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF694BF4D
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 16:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FB0A284007
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 14:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5205418FDA8;
	Thu,  8 Aug 2024 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVtG/y29"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8918F2EA
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126288; cv=none; b=jyUCWogl4dJYKJH7wL+cYjsVeC4AgDAuI+kAoCCLqbLcv3GzcSrzZ10KdgBvwXWb/Xg9UcCZmh9ArEeCiDSZLYKNoUy0Uh0K+o82pFi5W8XIB0zdsB0tqgcoUCYXSy7H6f4xZ4q81KUdnsHSXaR5Hr5OXGOsHIYIz5fPG1sIJ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126288; c=relaxed/simple;
	bh=1ir13MZl0az/9cRAPNM2xtHw/7Fiznd6AQuTHA91Vq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=age46yRUSrjr7rEQuAtuhZZlxx8vM8NxykgRDUnBf3lRs6+BZLg33xIrVhHpMdMbGUOqHFR/LYE1RX1eud4dYGAEU+8MB9gPjnIm6zI5J8jNMXFvxQp4dzJaWactY7E6l0/JW6vnpuVXvGiWA3F/wS/vXYsY5bE0iI7pgkAjUjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVtG/y29; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef7fef3ccfso10277761fa.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126283; x=1723731083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1g12t0G6k+jblt/poXm1qsZh457ASaKEWb3Du9DwTI=;
        b=eVtG/y29mfGWQXa6nxoe9gw7FZaNG2hhV7eKKvQnSgZ/u+4yb1FQ0eFhMRjbY0lUwz
         QCoSAGLz5LYKPU/TOaMBDMasrHL6BckxqhM8S1l62Gf4qTFWLD3xu3dgb2Vi4n44oNCF
         +5TBGPnj3a4Jjf6IhT032Uay/AtuInExw1ojSCW9B8Ax86Zm9V1i/Au0VLc3gLI4OPAr
         5I/uJXIfMuDMyo6LoaaPFgtDHokc6k0QqA+lYksKTl/YGJD2lDEiY53g/POGDab3F69X
         YiJQy3nkRtCseIPNtyh+sNLIIZ07RonN8MkvloWlSucFu3Ysc5QfoZxUxmaN5mUMg00d
         G5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126283; x=1723731083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1g12t0G6k+jblt/poXm1qsZh457ASaKEWb3Du9DwTI=;
        b=ZUvPSFtGTqfTqslj/MxdqjZU26sMODD+Xu2C62RmncbFEamBeFJkA7PNimeCOGLS02
         4DWGVa/GlISDy4Qd2cDJLbhvJfZB5dpOoVC5r9kVHgqqYUjCbpae92mXVW6/KTwosezw
         XvqtxXcpaluNgrXKQd5Mo35XX5EcfgpaeE9CfrTnt4n4Iuzuxp9Ryj7n0RH5KehbfbCw
         /r9DI7LZLuHYTaroUitw5UPNrGsetM4DcLmXKkhJxB4IcTCMKdZkwEhy7NswHeP0T4+i
         XW6921mdet2mzZX74ZvSa/pWmiaHvtk1737dFpfz9JP82tyVzlgdNIniqrD075uoF4TT
         ZYXw==
X-Forwarded-Encrypted: i=1; AJvYcCXTcR9abl4bAJsmi348tJPvmj6KPfh7icGisbX2aRwV4wBnQiFfzch0gKUlud9zqWgoVEv1Eq3NuJA+JFFg+cra3qHaFpsloUah
X-Gm-Message-State: AOJu0YzcRGnARWCt5SfRTr2VVFPh629VMQ0OzC3tCtVXG0k2SU1lD4JR
	SEiaa/wkpsNo2CIgh5ktv7SGOzUYtA0q/JAqHaumkYmtUOiaYAUM6PXY7HMYXFswdrqyeAZwd0i
	K/R+y3A==
X-Google-Smtp-Source: AGHT+IGDyMQHKv0RwbvPX/6d6Xk0Zr0aJrMD0f2Ipsmoyq60Ge259oDU095mhvj+uwb4LCGW4iMZ3g==
X-Received: by 2002:a2e:9cc7:0:b0:2ef:2638:48cd with SMTP id 38308e7fff4ca-2f19de73ee0mr14044491fa.30.1723126283448;
        Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:28 +0100
Subject: [PATCH v5 14/20] clk: imx: imx8mm: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-14-11cffef0634e@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The clk core now does something similar for us as part of
of_clk_add_provider() and of_clk_add_hw_provider() and this i.MX
specific call isn't necessary anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx8mm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 342049b847b9..3f649da0230d 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -609,8 +609,6 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog


