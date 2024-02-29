Return-Path: <linux-clk+bounces-4256-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE05786C912
	for <lists+linux-clk@lfdr.de>; Thu, 29 Feb 2024 13:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05C72B269F5
	for <lists+linux-clk@lfdr.de>; Thu, 29 Feb 2024 12:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CA37E0E7;
	Thu, 29 Feb 2024 12:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uVYN6Drp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDE17D3E8
	for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709209233; cv=none; b=eCaGjj6/z4SR7sZTFpqyGcj4OW0oCQBR8WO/rDGrk09JbZGjE/RI6YJQCSIHNcbV52gkxsvrG0Ltd2QfOWjQyCbvqkDuaqOMFVaTruDxhNc1rvj7xOUDU2Md16BFwWauRApMivepkowzvpzVIyNiDh3bQ049cMY7/+KSJVmF5D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709209233; c=relaxed/simple;
	bh=UQ1X6gx0yrcSeyqfMpTJ9ZRbI+mwyYwp88EM0UE5IkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lw/IaItKFC2zW+AwkXbqTX/MjjyKLyz21E53+2pR6Q5qlykWY0QIoa/gL1nICicKqZksDRE6BKDxE6iI/hwxZDBS9/sd8T7edSDNuAjoHS7JEcgCcXDfWaMhbHWVtP+ertY3jhLRO3nhmhmy38xCUZFh9Gl0MZCzTA1QyEdI2mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uVYN6Drp; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d27fef509eso9835781fa.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 04:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709209229; x=1709814029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTrYNsYNh8I34xuhimzvwxZF3tuFQv+C2Kfyp8x97Ys=;
        b=uVYN6DrplSMp6CufbXfTVN9c1d1bkUXI1ktZk5N/5/KkWfvJDK7S2Cla5oEGIpoQf8
         7dEn9oI5hxFfRKjmybS8qzdTE5ZkzgTriQ1Gbb9MXiS+2KxzAjqGVqzTJe+kxMsDsQiv
         SCx1IOkAyo1XRBdZVw+b1eRQRCHNVzSea3kb6immuNhXLSKpjcH0tbTx/gkwvAckKxgF
         OSOGHOcI11xf8I2xJ19qskSBrEuYcdaZTCHmKhts/XwSgrboM6v1m9uYFaiVl74QjIbk
         AwwZj4CKBi2Ac5vTEK4GKPpPRBjOMroAFJ5lVBLCQSwEHsLp+PsVU5mU3/Qp7oa4BuRm
         2zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709209229; x=1709814029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTrYNsYNh8I34xuhimzvwxZF3tuFQv+C2Kfyp8x97Ys=;
        b=WInP7D1Tbh6iyvQ2Slcdai9nuROHte7oa9lRs5Oq6jTC49GReITvaLvvghUFAIYJI+
         E/Ig3jju5BmO/ktW/7bLVsnJxa2o4FZgfX5+3PDkMLGI/PGkb0RT0C2Kz0TggBPIgc/G
         RGfooPIRYzvA+CbIdb6JVWlMVxxN/DM/zoj+dHxG9w1oW0v2co369YsvuG4P3B8ONJZ2
         0rpdfS91pzdtWKipp2xh2diyqyrAhARtjruzmbAHUpSez+kVOXQaW+/EMSgU+6gmDABi
         Z6enzfjEiFfixPHqc1NY6KXfKV31w0gIFd566y2LF5rsIgxNm6ghVV1+LLNZEZ0Nqhw0
         QQmg==
X-Forwarded-Encrypted: i=1; AJvYcCUuaVn6rMHz9BrgygM2tS+eepjh5ZWVNUpKDQJFoHLZ6OuZ9hfe8a5W0slbn22G4Ut1CteRfpslhQ8zHckVK9K1n2pBaEDpzi8A
X-Gm-Message-State: AOJu0YwgEQKhj7EGxCYsna0Ft/MeKXElojLVIxsNl6avdKnOsRBFI09c
	h9zUyedf9K0oXI9j2r/GQm11xd3J1zI+sT2BBQ4BgO/hytGUUQwgMg2KEaMeKms=
X-Google-Smtp-Source: AGHT+IG5UiSVq5mBgc9t2q/+o5O401BiVvP3eHJmsBW0nCTwxZdBFBBUMxtUQLlE4voKSVwaJyaZGQ==
X-Received: by 2002:a2e:90d6:0:b0:2d3:e77:7801 with SMTP id o22-20020a2e90d6000000b002d30e777801mr748640ljg.3.1709209229369;
        Thu, 29 Feb 2024 04:20:29 -0800 (PST)
Received: from ta2.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id dx14-20020a05600c63ce00b004129f28e2cdsm5009121wmb.3.2024.02.29.04.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:20:28 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski@linaro.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	semen.protsenko@linaro.org
Cc: alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 4/4] clk: samsung: exynos850: fix propagation of SPI IPCLK rate
Date: Thu, 29 Feb 2024 12:20:21 +0000
Message-ID: <20240229122021.1901785-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
References: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix propagation of SPI IPCLK rate by allowing MUX reparenting for the
dedicated USI MUX clocks. Since these muxes feed just the USI blocks,
reparenting of the muxes do not affect other IPs.

Do not propagate the rate change the from USI muxes to the common bus
dividers (dout_apm_bus and dout_peri_ip). The leaf clocks (HSI2C, I3C)
that are derived from the common bus dividers are no longer affected by
the SPI clock rate change.

This change involves the following clock path propagation:

usi_spi_0:
    Clock                  Div range    MUX Selection
    ---------------------------------------------------------------------
    gout_spi0_ipclk        -            -
    dout_peri_spi0         /1..32       -
    mout_peri_spi_user     -            { oscclk (26 MHz), dout_peri_ip }

    *Note that the clock rate is no longer propagated to dout_peri_ip.

usi_cmgp0:

    Clock                  Div range    MUX Selection
    ---------------------------------------------------------------------
    gout_cmgp_usi0_ipclk   -           -
    dout_cmgp_usi0         /1..32      -
    mout_cmgp_usi0         -           { clk_rco_cmgp (49.152 MHz)
                                         gout_clkcmu_cmgp_bus }

    *Note that the clock rate is no longer propagated to
     gout_clkcmu_cmgp_bus and dout_apm_bus.

usi_cmgp1:

    Clock                  Div range   MUX Selection
    ---------------------------------------------------------------------
    gout_cmgp_usi1_ipclk   -           -
    dout_cmgp_usi1         /1..32      -
    mout_cmgp_usi1         -           { clk_rco_cmgp (49.152 MHz)
                                         gout_clkcmu_cmgp_bus }

    *Note that the clock rate is no longer propagated to
     gout_clkcmu_cmgp_bus and dout_apm_bus.

This comes with no significant clock range modification. Before this
patch the claimed clock ranges are:

    SPI0:   200 kHz ... 49.9 MHz
    SPI1/2: 400 kHz ... 49.9 MHz

After this patch the clock ranges are:
    SPI0:   203.125 kHz ... 49.9 MHz
    SPI1/2: 384 kHz     ... 49.9 MHz

For SPI1/2 we get an even lower frequency than what was before. For SPI0
the benefit of not modifying common bus clocks, thus other leaf IP nodes
is greater than the change in frequency from 200 to ~203 KHz.

Not tested, the patch was written solely by reading the code.

Fixes: 67c15187d491 ("clk: samsung: exynos850: Propagate SPI IPCLK rate change")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 82cfa22c0788..42b4b4075aeb 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -605,7 +605,7 @@ static const struct samsung_div_clock apm_div_clks[] __initconst = {
 
 static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_CLKCMU_CMGP_BUS, "gout_clkcmu_cmgp_bus", "dout_apm_bus",
-	     CLK_CON_GAT_CLKCMU_CMGP_BUS, 21, CLK_SET_RATE_PARENT, 0),
+	     CLK_CON_GAT_CLKCMU_CMGP_BUS, 21, 0, 0),
 	GATE(CLK_GOUT_CLKCMU_CHUB_BUS, "gout_clkcmu_chub_bus",
 	     "mout_clkcmu_chub_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS, 21, 0, 0),
@@ -974,10 +974,10 @@ static const struct samsung_fixed_rate_clock cmgp_fixed_clks[] __initconst = {
 static const struct samsung_mux_clock cmgp_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_CMGP_ADC, "mout_cmgp_adc", mout_cmgp_adc_p,
 	    CLK_CON_MUX_CLK_CMGP_ADC, 0, 1),
-	MUX_F(CLK_MOUT_CMGP_USI0, "mout_cmgp_usi0", mout_cmgp_usi0_p,
-	      CLK_CON_MUX_MUX_CLK_CMGP_USI_CMGP0, 0, 1, CLK_SET_RATE_PARENT, 0),
-	MUX_F(CLK_MOUT_CMGP_USI1, "mout_cmgp_usi1", mout_cmgp_usi1_p,
-	      CLK_CON_MUX_MUX_CLK_CMGP_USI_CMGP1, 0, 1, CLK_SET_RATE_PARENT, 0),
+	nMUX(CLK_MOUT_CMGP_USI0, "mout_cmgp_usi0", mout_cmgp_usi0_p,
+	     CLK_CON_MUX_MUX_CLK_CMGP_USI_CMGP0, 0, 1),
+	nMUX(CLK_MOUT_CMGP_USI1, "mout_cmgp_usi1", mout_cmgp_usi1_p,
+	     CLK_CON_MUX_MUX_CLK_CMGP_USI_CMGP1, 0, 1),
 };
 
 static const struct samsung_div_clock cmgp_div_clks[] __initconst = {
@@ -1557,9 +1557,8 @@ static const struct samsung_mux_clock peri_mux_clks[] __initconst = {
 	    mout_peri_uart_user_p, PLL_CON0_MUX_CLKCMU_PERI_UART_USER, 4, 1),
 	MUX(CLK_MOUT_PERI_HSI2C_USER, "mout_peri_hsi2c_user",
 	    mout_peri_hsi2c_user_p, PLL_CON0_MUX_CLKCMU_PERI_HSI2C_USER, 4, 1),
-	MUX_F(CLK_MOUT_PERI_SPI_USER, "mout_peri_spi_user",
-	      mout_peri_spi_user_p, PLL_CON0_MUX_CLKCMU_PERI_SPI_USER, 4, 1,
-	      CLK_SET_RATE_PARENT, 0),
+	nMUX(CLK_MOUT_PERI_SPI_USER, "mout_peri_spi_user",
+	     mout_peri_spi_user_p, PLL_CON0_MUX_CLKCMU_PERI_SPI_USER, 4, 1),
 };
 
 static const struct samsung_div_clock peri_div_clks[] __initconst = {
-- 
2.44.0.278.ge034bb2e1d-goog


