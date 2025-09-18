Return-Path: <linux-clk+bounces-25634-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6FB1C325
	for <lists+linux-clk@lfdr.de>; Wed,  6 Aug 2025 11:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12A273AF33A
	for <lists+linux-clk@lfdr.de>; Wed,  6 Aug 2025 09:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2970E28A71C;
	Wed,  6 Aug 2025 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IfVt6gm+"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1941328A1D3
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472115; cv=none; b=fMWS8Oszfq+D9FQgIh7hdm8hcwKjP3lxcyMs4UyAgNnrfBpzQytg5zwitnKhzC1LVGWdZ1gF4ZzPM4dL3I75N68dXypIm2nRvzhtJvkvfvamftyeEX0f5poWUz1CTeGBgWEPaSy9yTlVAixZ8NHj6GaZj7odxLk/99+tH6uUpFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472115; c=relaxed/simple;
	bh=AckFgJTdbiQxTv4ig9a0jy4griGBE8YT2uSVqnHLxuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lu17BL6Sm5Rpa78kaMFKbhWYxCIRigr9sDL8cEzYhp4Q/tlyHTGUUd33t5rQkdyH/9N5zXGxraIn/UvfVguoMBnavPE2BEbbrR73cQIVHIWQWzlHgZ4lYYbdkfBS4H8yqeh9zVPJp8e3qb+raHdejLHUmzx6mybw3zdhSWO8fJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IfVt6gm+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459ddf83023so17180865e9.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754472110; x=1755076910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6vM9cRK1GxXlCwOmEZg5CpwmXUlH0wxIAh8E6fj0cA=;
        b=IfVt6gm+p8wld26qBXdCMtQ++TzQFABjiWlgU/dJ2sI8FXtf1Jk21yi6jqDzUHoDcj
         W/ck0lAcRKi4YZLIn9w4B2vZ9vStfs69A8m9kxBX96nJlnBE8X4FYhdrtnPDRxW0vOHq
         VEyHHKzy6/yUve+s9CSZNy1Dw49EbSF8s2Kzo9v4zlElweg2dCQGu3zSvZnh33Nklnje
         8FCwGHvU791bC8+Sl0ROL456tv+keRzw5p0my4/4heq/wR7DiD9wIa9gIcwZOYbTX4uF
         V1DpA8/qY+jWoNEunZeevvd0QsI+29CiSt/NGP5fPhGEj9n0bG7BbhgQwfQZmvhZWDvm
         UjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472110; x=1755076910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6vM9cRK1GxXlCwOmEZg5CpwmXUlH0wxIAh8E6fj0cA=;
        b=ikyDqNcXRqorXxQSCfwA0FVm5Iyin5SMpU1DXAr+La7NuCJJkzeC1DITjGWMij/mjd
         wjjOBownKlsPUOY2twmpRyg1tkix+rRehvAr8vmHD2z1+j5kjw5ecoyiMmGBu9MuUKoy
         oQUkTMb4IcQLq727fXxI3KZyc3a9kdzt3fnTuFFOhc/mEdw99GPd2jnDoZ7l3jhkULXm
         Fe8qDgQRiv85l5DXVyOrmW+FVN3Y4vqajFE3kG7bYQEtO0jHPe1wbP4vyPHnNmg34CVi
         K5ahyuzW5n4mjdQyl0XSv4Ty1dKFOxP+qMuReSOM1taxjRvDWXIHXVkKMsWcMh7soYUx
         7o3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuB0FcdIiSKdOmxtZBjo9kt7vQKcEz3lDA1EZk/Q6u54sL+KGExo7d5dpo6JlNFouMhyny3JS6gIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE2+WNZG9sfoyeoMDSo9LqG6mIbXqD8ybTHuHpOrDrtLKZwX9y
	5mglfrUPBTsNdGojw2SQMLq0Tg/Ty1scWNM++Keju7Shq0iuXqGrHT51Urcxxgg+3BxS83F9yKP
	HcS5a
X-Gm-Gg: ASbGnctiUfKp8Z4mV6HCWSiQ/d22bX+/TenDeEeofn2cAoGD9AcNcnFJ1atZwb8t2/T
	R+PdUCOqgJooCfHObzunWATQdcpO1SLVlzyvEf0DlHtjTayb9dBuQCqAOyt8Lpt7skUBmXiVpgp
	wfeAQ3vYzHfLf+MneOkEsFefIidj82nAqWxaIUSwawZnuZ75G/t7sMtpi5QRvRl1icpSNB81NRJ
	wj7CzseNDxPqB86ebjS1trR0FaOW6CHlvURHyXmKv7jetrYjUk4GZsDa9pUI4/3BMhYjQsatAJm
	nkWDjZmStg3C2iauT31gswd+3uiVTq3/s2JoDnPJvshZ1cFPsiGxwHMHuqYthd2IinZ7NQT3JdM
	gJSwE3IMwtUnjycQ15oQXpANnC2SET7w0eLJLUAZBy/gL2qH7iU0L/g61jyU91VU=
X-Google-Smtp-Source: AGHT+IFKQzeo8NoqRRhAzaTuO6q0WKqiApam0PtFQOFzEV35zWZycj20WFZV52zkqJjGHGzoZ/WaGA==
X-Received: by 2002:a05:600c:4e8e:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-459e7440abfmr16122795e9.2.1754472110212;
        Wed, 06 Aug 2025 02:21:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm30188445e9.6.2025.08.06.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:21:49 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/4] clk: renesas: r9a07g044: Add MSTOP for RZ/G2L
Date: Wed,  6 Aug 2025 12:21:27 +0300
Message-ID: <20250806092129.621194-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add MSTOP configuration for all the module clocks on the RZ/G2L
based SoCs (RZ/G2L, RZ/G2LC).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- added MSTOP for GPIO

 drivers/clk/renesas/r9a07g044-cpg.c | 154 ++++++++++++++--------------
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 2 files changed, 78 insertions(+), 77 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index c851d4eeebbe..fdbc0635a869 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -242,163 +242,163 @@ static const struct {
 } mod_clks = {
 	.common = {
 		DEF_MOD("gic",		R9A07G044_GIC600_GICCLK, R9A07G044_CLK_P1,
-					0x514, 0, 0),
+					0x514, 0, MSTOP(BUS_REG1, BIT(7))),
 		DEF_MOD("ia55_pclk",	R9A07G044_IA55_PCLK, R9A07G044_CLK_P2,
-					0x518, 0, 0),
+					0x518, 0, MSTOP(BUS_PERI_CPU, BIT(13))),
 		DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK, R9A07G044_CLK_P1,
-					0x518, 1, 0),
+					0x518, 1, MSTOP(BUS_PERI_CPU, BIT(13))),
 		DEF_MOD("dmac_aclk",	R9A07G044_DMAC_ACLK, R9A07G044_CLK_P1,
-					0x52c, 0, 0),
+					0x52c, 0, MSTOP(BUS_REG1, BIT(2))),
 		DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
-					0x52c, 1, 0),
+					0x52c, 1, MSTOP(BUS_REG1, BIT(3))),
 		DEF_MOD("ostm0_pclk",	R9A07G044_OSTM0_PCLK, R9A07G044_CLK_P0,
-					0x534, 0, 0),
+					0x534, 0, MSTOP(BUS_REG0, BIT(4))),
 		DEF_MOD("ostm1_pclk",	R9A07G044_OSTM1_PCLK, R9A07G044_CLK_P0,
-					0x534, 1, 0),
+					0x534, 1, MSTOP(BUS_REG0, BIT(5))),
 		DEF_MOD("ostm2_pclk",	R9A07G044_OSTM2_PCLK, R9A07G044_CLK_P0,
-					0x534, 2, 0),
+					0x534, 2, MSTOP(BUS_REG0, BIT(6))),
 		DEF_MOD("mtu_x_mck",	R9A07G044_MTU_X_MCK_MTU3, R9A07G044_CLK_P0,
-					0x538, 0, 0),
+					0x538, 0, MSTOP(BUS_MCPU1, BIT(2))),
 		DEF_MOD("gpt_pclk",	R9A07G044_GPT_PCLK, R9A07G044_CLK_P0,
-					0x540, 0, 0),
+					0x540, 0, MSTOP(BUS_MCPU1, BIT(4))),
 		DEF_MOD("poeg_a_clkp",	R9A07G044_POEG_A_CLKP, R9A07G044_CLK_P0,
-					0x544, 0, 0),
+					0x544, 0, MSTOP(BUS_MCPU1, BIT(5))),
 		DEF_MOD("poeg_b_clkp",	R9A07G044_POEG_B_CLKP, R9A07G044_CLK_P0,
-					0x544, 1, 0),
+					0x544, 1, MSTOP(BUS_MCPU1, BIT(6))),
 		DEF_MOD("poeg_c_clkp",	R9A07G044_POEG_C_CLKP, R9A07G044_CLK_P0,
-					0x544, 2, 0),
+					0x544, 2, MSTOP(BUS_MCPU1, BIT(7))),
 		DEF_MOD("poeg_d_clkp",	R9A07G044_POEG_D_CLKP, R9A07G044_CLK_P0,
-					0x544, 3, 0),
+					0x544, 3, MSTOP(BUS_MCPU1, BIT(8))),
 		DEF_MOD("wdt0_pclk",	R9A07G044_WDT0_PCLK, R9A07G044_CLK_P0,
-					0x548, 0, 0),
+					0x548, 0, MSTOP(BUS_REG0, BIT(2))),
 		DEF_MOD("wdt0_clk",	R9A07G044_WDT0_CLK, R9A07G044_OSCCLK,
-					0x548, 1, 0),
+					0x548, 1, MSTOP(BUS_REG0, BIT(2))),
 		DEF_MOD("wdt1_pclk",	R9A07G044_WDT1_PCLK, R9A07G044_CLK_P0,
-					0x548, 2, 0),
+					0x548, 2, MSTOP(BUS_REG0, BIT(3))),
 		DEF_MOD("wdt1_clk",	R9A07G044_WDT1_CLK, R9A07G044_OSCCLK,
-					0x548, 3, 0),
+					0x548, 3, MSTOP(BUS_REG0, BIT(3))),
 		DEF_MOD("spi_clk2",	R9A07G044_SPI_CLK2, R9A07G044_CLK_SPI1,
-					0x550, 0, 0),
+					0x550, 0, MSTOP(BUS_MCPU1, BIT(1))),
 		DEF_MOD("spi_clk",	R9A07G044_SPI_CLK, R9A07G044_CLK_SPI0,
-					0x550, 1, 0),
+					0x550, 1, MSTOP(BUS_MCPU1, BIT(1))),
 		DEF_MOD("sdhi0_imclk",	R9A07G044_SDHI0_IMCLK, CLK_SD0_DIV4,
-					0x554, 0, 0),
+					0x554, 0, MSTOP(BUS_PERI_COM, BIT(0))),
 		DEF_MOD("sdhi0_imclk2",	R9A07G044_SDHI0_IMCLK2, CLK_SD0_DIV4,
-					0x554, 1, 0),
+					0x554, 1, MSTOP(BUS_PERI_COM, BIT(0))),
 		DEF_MOD("sdhi0_clk_hs",	R9A07G044_SDHI0_CLK_HS, R9A07G044_CLK_SD0,
-					0x554, 2, 0),
+					0x554, 2, MSTOP(BUS_PERI_COM, BIT(0))),
 		DEF_MOD("sdhi0_aclk",	R9A07G044_SDHI0_ACLK, R9A07G044_CLK_P1,
-					0x554, 3, 0),
+					0x554, 3, MSTOP(BUS_PERI_COM, BIT(0))),
 		DEF_MOD("sdhi1_imclk",	R9A07G044_SDHI1_IMCLK, CLK_SD1_DIV4,
-					0x554, 4, 0),
+					0x554, 4, MSTOP(BUS_PERI_COM, BIT(1))),
 		DEF_MOD("sdhi1_imclk2",	R9A07G044_SDHI1_IMCLK2, CLK_SD1_DIV4,
-					0x554, 5, 0),
+					0x554, 5, MSTOP(BUS_PERI_COM, BIT(1))),
 		DEF_MOD("sdhi1_clk_hs",	R9A07G044_SDHI1_CLK_HS, R9A07G044_CLK_SD1,
-					0x554, 6, 0),
+					0x554, 6, MSTOP(BUS_PERI_COM, BIT(1))),
 		DEF_MOD("sdhi1_aclk",	R9A07G044_SDHI1_ACLK, R9A07G044_CLK_P1,
-					0x554, 7, 0),
+					0x554, 7, MSTOP(BUS_PERI_COM, BIT(1))),
 		DEF_MOD("gpu_clk",	R9A07G044_GPU_CLK, R9A07G044_CLK_G,
-					0x558, 0, 0),
+					0x558, 0, MSTOP(BUS_REG1, BIT(4))),
 		DEF_MOD("gpu_axi_clk",	R9A07G044_GPU_AXI_CLK, R9A07G044_CLK_P1,
 					0x558, 1, 0),
 		DEF_MOD("gpu_ace_clk",	R9A07G044_GPU_ACE_CLK, R9A07G044_CLK_P1,
 					0x558, 2, 0),
 		DEF_MOD("cru_sysclk",   R9A07G044_CRU_SYSCLK, CLK_M2_DIV2,
-					0x564, 0, 0),
+					0x564, 0, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 		DEF_MOD("cru_vclk",     R9A07G044_CRU_VCLK, R9A07G044_CLK_M2,
-					0x564, 1, 0),
+					0x564, 1, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 		DEF_MOD("cru_pclk",     R9A07G044_CRU_PCLK, R9A07G044_CLK_ZT,
-					0x564, 2, 0),
+					0x564, 2, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 		DEF_MOD("cru_aclk",     R9A07G044_CRU_ACLK, R9A07G044_CLK_M0,
-					0x564, 3, 0),
+					0x564, 3, MSTOP(BUS_PERI_VIDEO, BIT(3))),
 		DEF_MOD("dsi_pll_clk",	R9A07G044_MIPI_DSI_PLLCLK, R9A07G044_CLK_M1,
-					0x568, 0, 0),
+					0x568, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_MOD("dsi_sys_clk",	R9A07G044_MIPI_DSI_SYSCLK, CLK_M2_DIV2,
-					0x568, 1, 0),
+					0x568, 1, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_MOD("dsi_aclk",	R9A07G044_MIPI_DSI_ACLK, R9A07G044_CLK_P1,
-					0x568, 2, 0),
+					0x568, 2, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_MOD("dsi_pclk",	R9A07G044_MIPI_DSI_PCLK, R9A07G044_CLK_P2,
-					0x568, 3, 0),
+					0x568, 3, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_MOD("dsi_vclk",	R9A07G044_MIPI_DSI_VCLK, R9A07G044_CLK_M3,
-					0x568, 4, 0),
+					0x568, 4, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_MOD("dsi_lpclk",	R9A07G044_MIPI_DSI_LPCLK, R9A07G044_CLK_M4,
-					0x568, 5, 0),
+					0x568, 5, MSTOP(BUS_PERI_VIDEO, GENMASK(6, 5))),
 		DEF_COUPLED("lcdc_a",	R9A07G044_LCDC_CLK_A, R9A07G044_CLK_M0,
-					0x56c, 0, 0),
+					0x56c, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(8, 7))),
 		DEF_COUPLED("lcdc_p",	R9A07G044_LCDC_CLK_P, R9A07G044_CLK_ZT,
-					0x56c, 0, 0),
+					0x56c, 0, MSTOP(BUS_PERI_VIDEO, GENMASK(8, 7))),
 		DEF_MOD("lcdc_clk_d",	R9A07G044_LCDC_CLK_D, R9A07G044_CLK_M3,
-					0x56c, 1, 0),
+					0x56c, 1, MSTOP(BUS_PERI_VIDEO, BIT(9))),
 		DEF_MOD("ssi0_pclk",	R9A07G044_SSI0_PCLK2, R9A07G044_CLK_P0,
-					0x570, 0, 0),
+					0x570, 0, MSTOP(BUS_MCPU1, BIT(10))),
 		DEF_MOD("ssi0_sfr",	R9A07G044_SSI0_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 1, 0),
+					0x570, 1, MSTOP(BUS_MCPU1, BIT(10))),
 		DEF_MOD("ssi1_pclk",	R9A07G044_SSI1_PCLK2, R9A07G044_CLK_P0,
-					0x570, 2, 0),
+					0x570, 2, MSTOP(BUS_MCPU1, BIT(11))),
 		DEF_MOD("ssi1_sfr",	R9A07G044_SSI1_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 3, 0),
+					0x570, 3, MSTOP(BUS_MCPU1, BIT(11))),
 		DEF_MOD("ssi2_pclk",	R9A07G044_SSI2_PCLK2, R9A07G044_CLK_P0,
-					0x570, 4, 0),
+					0x570, 4, MSTOP(BUS_MCPU1, BIT(12))),
 		DEF_MOD("ssi2_sfr",	R9A07G044_SSI2_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 5, 0),
+					0x570, 5, MSTOP(BUS_MCPU1, BIT(12))),
 		DEF_MOD("ssi3_pclk",	R9A07G044_SSI3_PCLK2, R9A07G044_CLK_P0,
-					0x570, 6, 0),
+					0x570, 6, MSTOP(BUS_MCPU1, BIT(13))),
 		DEF_MOD("ssi3_sfr",	R9A07G044_SSI3_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 7, 0),
+					0x570, 7, MSTOP(BUS_MCPU1, BIT(13))),
 		DEF_MOD("usb0_host",	R9A07G044_USB_U2H0_HCLK, R9A07G044_CLK_P1,
-					0x578, 0, 0),
+					0x578, 0, MSTOP(BUS_PERI_COM, BIT(5))),
 		DEF_MOD("usb1_host",	R9A07G044_USB_U2H1_HCLK, R9A07G044_CLK_P1,
-					0x578, 1, 0),
+					0x578, 1, MSTOP(BUS_PERI_COM, BIT(7))),
 		DEF_MOD("usb0_func",	R9A07G044_USB_U2P_EXR_CPUCLK, R9A07G044_CLK_P1,
-					0x578, 2, 0),
+					0x578, 2, MSTOP(BUS_PERI_COM, BIT(6))),
 		DEF_MOD("usb_pclk",	R9A07G044_USB_PCLK, R9A07G044_CLK_P1,
-					0x578, 3, 0),
+					0x578, 3, MSTOP(BUS_PERI_COM, BIT(4))),
 		DEF_COUPLED("eth0_axi",	R9A07G044_ETH0_CLK_AXI, R9A07G044_CLK_M0,
-					0x57c, 0, 0),
+					0x57c, 0, MSTOP(BUS_PERI_COM, BIT(2))),
 		DEF_COUPLED("eth0_chi",	R9A07G044_ETH0_CLK_CHI, R9A07G044_CLK_ZT,
-					0x57c, 0, 0),
+					0x57c, 0, MSTOP(BUS_PERI_COM, BIT(2))),
 		DEF_COUPLED("eth1_axi",	R9A07G044_ETH1_CLK_AXI, R9A07G044_CLK_M0,
-					0x57c, 1, 0),
+					0x57c, 1, MSTOP(BUS_PERI_COM, BIT(3))),
 		DEF_COUPLED("eth1_chi",	R9A07G044_ETH1_CLK_CHI, R9A07G044_CLK_ZT,
-					0x57c, 1, 0),
+					0x57c, 1, MSTOP(BUS_PERI_COM, BIT(3))),
 		DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK, R9A07G044_CLK_P0,
-					0x580, 0, 0),
+					0x580, 0, MSTOP(BUS_MCPU2, BIT(10))),
 		DEF_MOD("i2c1",		R9A07G044_I2C1_PCLK, R9A07G044_CLK_P0,
-					0x580, 1, 0),
+					0x580, 1, MSTOP(BUS_MCPU2, BIT(11))),
 		DEF_MOD("i2c2",		R9A07G044_I2C2_PCLK, R9A07G044_CLK_P0,
-					0x580, 2, 0),
+					0x580, 2, MSTOP(BUS_MCPU2, BIT(12))),
 		DEF_MOD("i2c3",		R9A07G044_I2C3_PCLK, R9A07G044_CLK_P0,
-					0x580, 3, 0),
+					0x580, 3, MSTOP(BUS_MCPU2, BIT(13))),
 		DEF_MOD("scif0",	R9A07G044_SCIF0_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 0, 0),
+					0x584, 0, MSTOP(BUS_MCPU2, BIT(1))),
 		DEF_MOD("scif1",	R9A07G044_SCIF1_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 1, 0),
+					0x584, 1, MSTOP(BUS_MCPU2, BIT(2))),
 		DEF_MOD("scif2",	R9A07G044_SCIF2_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 2, 0),
+					0x584, 2, MSTOP(BUS_MCPU2, BIT(3))),
 		DEF_MOD("scif3",	R9A07G044_SCIF3_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 3, 0),
+					0x584, 3, MSTOP(BUS_MCPU2, BIT(4))),
 		DEF_MOD("scif4",	R9A07G044_SCIF4_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 4, 0),
+					0x584, 4, MSTOP(BUS_MCPU2, BIT(5))),
 		DEF_MOD("sci0",		R9A07G044_SCI0_CLKP, R9A07G044_CLK_P0,
-					0x588, 0, 0),
+					0x588, 0, MSTOP(BUS_MCPU2, BIT(7))),
 		DEF_MOD("sci1",		R9A07G044_SCI1_CLKP, R9A07G044_CLK_P0,
-					0x588, 1, 0),
+					0x588, 1, MSTOP(BUS_MCPU2, BIT(8))),
 		DEF_MOD("rspi0",	R9A07G044_RSPI0_CLKB, R9A07G044_CLK_P0,
-					0x590, 0, 0),
+					0x590, 0, MSTOP(BUS_MCPU1, BIT(14))),
 		DEF_MOD("rspi1",	R9A07G044_RSPI1_CLKB, R9A07G044_CLK_P0,
-					0x590, 1, 0),
+					0x590, 1, MSTOP(BUS_MCPU1, BIT(15))),
 		DEF_MOD("rspi2",	R9A07G044_RSPI2_CLKB, R9A07G044_CLK_P0,
-					0x590, 2, 0),
+					0x590, 2, MSTOP(BUS_MCPU2, BIT(0))),
 		DEF_MOD("canfd",	R9A07G044_CANFD_PCLK, R9A07G044_CLK_P0,
-					0x594, 0, 0),
+					0x594, 0, MSTOP(BUS_MCPU2, BIT(9))),
 		DEF_MOD("gpio",		R9A07G044_GPIO_HCLK, R9A07G044_OSCCLK,
-					0x598, 0, 0),
+					0x598, 0, MSTOP(BUS_PERI_CPU, BIT(6))),
 		DEF_MOD("adc_adclk",	R9A07G044_ADC_ADCLK, R9A07G044_CLK_TSU,
-					0x5a8, 0, 0),
+					0x5a8, 0, MSTOP(BUS_MCPU2, BIT(14))),
 		DEF_MOD("adc_pclk",	R9A07G044_ADC_PCLK, R9A07G044_CLK_P0,
-					0x5a8, 1, 0),
+					0x5a8, 1, MSTOP(BUS_MCPU2, BIT(14))),
 		DEF_MOD("tsu_pclk",	R9A07G044_TSU_PCLK, R9A07G044_CLK_TSU,
-					0x5ac, 0, 0),
+					0x5ac, 0, MSTOP(BUS_MCPU2, BIT(15))),
 	},
 #ifdef CONFIG_CLK_R9A07G054
 	.drp = {
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 0a71c5ec24b6..55e815be16c8 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -34,6 +34,7 @@
 #define CPG_BUS_PERI_COM_MSTOP	(0xB6C)
 #define CPG_BUS_PERI_CPU_MSTOP	(0xB70)
 #define CPG_BUS_PERI_DDR_MSTOP	(0xB74)
+#define CPG_BUS_PERI_VIDEO_MSTOP (0xB78)
 #define CPG_BUS_REG0_MSTOP	(0xB7C)
 #define CPG_BUS_REG1_MSTOP	(0xB80)
 #define CPG_BUS_TZCDDR_MSTOP	(0xB84)
-- 
2.43.0


