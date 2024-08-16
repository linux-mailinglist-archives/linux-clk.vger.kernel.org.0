Return-Path: <linux-clk+bounces-10766-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADD8955049
	for <lists+linux-clk@lfdr.de>; Fri, 16 Aug 2024 19:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D3771C20D33
	for <lists+linux-clk@lfdr.de>; Fri, 16 Aug 2024 17:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A501C37BC;
	Fri, 16 Aug 2024 17:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpLv1b5u"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EB81C378B;
	Fri, 16 Aug 2024 17:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830855; cv=none; b=TXkVomEsqEM8dQmXtm6+FM6q3D2+4t9KCBDtNuzGQ13wgqgUudnxHGldDMJ4otJYC9hM498gkmqgAFk3phvVnxRZnsifTHfOyyzBENQ5sDykx+l8nlfKw462mYUkYWnSRUuNmnlpHTsG0Be78U59QQB7dZLotOCDMld1XP2+H7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830855; c=relaxed/simple;
	bh=RiiMU6aNeuQq8tq5MMf1ZW7No4e5f/Q4G7CqOxz9gfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvkcgDa9A6XcEA1Ne6Xc05KyXZIx7tf6n+TRhEh0D44FTXa2K4lPFRdjupvfgQunHXidR0pZjd7heyEcJt71sz3g1WfYukYFzfmAaJ6jTqLse3sTlDkQdr9/xVZEKw0TsvbNfD9YGAd0Cj6lxGYAWzCOXNmselZ10FbfG46hTDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpLv1b5u; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a975fb47eso288304766b.3;
        Fri, 16 Aug 2024 10:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723830852; x=1724435652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2Gyar9xXpBSBPcKMcJ2JXR0iJfwNB8oavimTCcz6ws=;
        b=XpLv1b5ux8BbuMarVGOI3vuTojHBIJuBEglcrUfmP4C10/c4pt2zXMkR40dC1YoyOt
         SIZBSC6skpUxej04t9sHIdQ2JCsLdJYYZ16a1wA4pa/RAdH0iQb3zN7Bg9VdWrARnZXk
         ElRhUCFxAPBIvljOOS12bAD8i8s/cWGBcDiWNewHnYZjemNm9pZ4cClDmYSoI5cR4pv0
         0rDIA1qUT6h+IauIKMoetJonY9bNk3plKK+s+mIkk+JLbu6c6I5vojNXS6ifdBMa0n6G
         cBp/K+kYKQL+t6+cxdkadgmEOJoHpPMMEyebKpsr8u+qViH0N3mk6L0eegStoZ6QUbJo
         sFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723830852; x=1724435652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2Gyar9xXpBSBPcKMcJ2JXR0iJfwNB8oavimTCcz6ws=;
        b=qyRHutG+k5xUT8vRQslazcfwjv1bXZe6f+u2ahqK8QJY/NE0/T/GU4z4g6vgKEmQJ3
         dkVXCPzj8wI3UBWCneSWD59VTIpbfY8KVMhDFi9d08059Bh7+0c1RMSs2LyGNdaijz15
         0TsiGWzqyHZrNwp1UmMLZeEpU8b5N4XzzqfHdCvhhCt3411PoGqOn2ekMsmGYhNNKOQm
         BRKSXEYmZn5jAQMIa7z4gacw8z3m81iKghCw6zQhlAkr2yZLknvZoSNyYmmmXmSH6q+a
         /6b1mLwKvjPq/h88PNqQUo58SMkhqEmFNPlGnSyHYXIFE+TWvL81XFWf6RLywcU4I6k9
         13fg==
X-Forwarded-Encrypted: i=1; AJvYcCWLsSdpgR67inglZvqzTqb5w4Zeeql+Y49IhcIVmQ3nHK5fMvQ2Mgr5aZOgAnd2j3oVGgaYZOXxuPVofIWBTxyw0pdfzWLOds96++Vxlv+nmOecZrEDOLOKiHbC9PfuNnTnfToHiBQTCW26LsZJ/YzELX6X4nTYWZzmZ2V2eMLgZgN1nphPD0r36NE=
X-Gm-Message-State: AOJu0YwO7EbQvDKKHo635GuKMxb8I7ocLhfr+sTPBE1OqV4z13TOu+bI
	sTcSNsM0lBHN3J6XF80dSlceW6IJnrA0Bd63nNnPL4gjdcGofy9D
X-Google-Smtp-Source: AGHT+IH8xPC7HF4XYWVv5PE7SDBI+Vce4ObV3z7/ckDEnTizalhYsSty9QXLnAy+hHhqn0YI+RZD4g==
X-Received: by 2002:a17:907:6d02:b0:a80:f747:30c4 with SMTP id a640c23a62f3a-a83928a6336mr239444866b.1.1723830852086;
        Fri, 16 Aug 2024 10:54:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a83838c66b6sm290520866b.16.2024.08.16.10.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 10:54:11 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: David Virag <virag.david003@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] clk: samsung: exynos7885: Add USB related clocks to CMU_FSYS
Date: Fri, 16 Aug 2024 19:50:32 +0200
Message-ID: <20240816175034.769628-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816175034.769628-1-virag.david003@gmail.com>
References: <20240816175034.769628-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos7885 SoC has a DWC3 USB Controller with Exynos USB PHY which in
theory supports USB3 SuperSpeed, but is only used as USB2 in all known
devices.

These clocks are needed for everything related to USB.

While at it, also remove the CLK_SET_RATE_PARENT capability of
CLK_MOUT_FSYS_USB30DRD_USER, since it's not actually needed.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - Remove unnecessary blank lines

Changes in v3:
  - None

 drivers/clk/samsung/clk-exynos7885.c | 71 ++++++++++++++++++++++------
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index a0c9b7cc6942..fc42251731ed 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -20,7 +20,7 @@
 #define CLKS_NR_TOP			(CLK_MOUT_SHARED1_PLL + 1)
 #define CLKS_NR_CORE			(CLK_GOUT_TREX_P_CORE_PCLK_P_CORE + 1)
 #define CLKS_NR_PERI			(CLK_GOUT_WDT1_PCLK + 1)
-#define CLKS_NR_FSYS			(CLK_MOUT_FSYS_USB30DRD_USER + 1)
+#define CLKS_NR_FSYS			(CLK_FSYS_USB30DRD_REF_CLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
@@ -686,30 +686,56 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 /* ---- CMU_FSYS ------------------------------------------------------------ */
 
 /* Register Offset definitions for CMU_FSYS (0x13400000) */
-#define PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER	0x0100
-#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER	0x0120
-#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER	0x0140
-#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER	0x0160
-#define PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER	0x0180
-#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK	0x2030
-#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN	0x2034
-#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_I_ACLK	0x2038
-#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN	0x203c
-#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_I_ACLK	0x2040
-#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN	0x2044
+#define PLL_LOCKTIME_PLL_USB				0x0000
+#define PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER		0x0100
+#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER		0x0120
+#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER		0x0140
+#define PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER		0x0160
+#define PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER		0x0180
+#define PLL_CON0_PLL_USB				0x01a0
+#define CLK_CON_GAT_CLK_FSYS_USB20PHY_CLKCORE		0x200c
+#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK		0x2030
+#define CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN		0x2034
+#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_I_ACLK		0x2038
+#define CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN		0x203c
+#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_I_ACLK		0x2040
+#define CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN		0x2044
+#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_20PHYCTRL	0x2068
+#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_0	0x206c
+#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_1	0x2070
+#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_BUS_CLK_EARLY	0x2074
+#define CLK_CON_GAT_GOUT_FSYS_USB30DRD_REF_CLK		0x2078
 
 static const unsigned long fsys_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_USB,
 	PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER,
 	PLL_CON0_MUX_CLKCMU_FSYS_MMC_CARD_USER,
 	PLL_CON0_MUX_CLKCMU_FSYS_MMC_EMBD_USER,
 	PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER,
 	PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER,
+	PLL_CON0_PLL_USB,
+	CLK_CON_GAT_CLK_FSYS_USB20PHY_CLKCORE,
 	CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK,
 	CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN,
 	CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_I_ACLK,
 	CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN,
 	CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_I_ACLK,
 	CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN,
+	CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_20PHYCTRL,
+	CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_0,
+	CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_1,
+	CLK_CON_GAT_GOUT_FSYS_USB30DRD_BUS_CLK_EARLY,
+	CLK_CON_GAT_GOUT_FSYS_USB30DRD_REF_CLK,
+};
+
+static const struct samsung_pll_rate_table pll_usb_rate_table[] __initconst = {
+	PLL_35XX_RATE(26 * MHZ, 50000000U, 400, 13, 4),
+};
+
+static const struct samsung_pll_clock fsys_pll_clks[] __initconst = {
+	PLL(pll_1418x, CLK_FOUT_USB_PLL, "fout_usb_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_USB, PLL_CON0_PLL_USB,
+	    pll_usb_rate_table),
 };
 
 /* List of parent clocks for Muxes in CMU_FSYS */
@@ -718,6 +744,7 @@ PNAME(mout_fsys_mmc_card_user_p)	= { "oscclk", "dout_fsys_mmc_card" };
 PNAME(mout_fsys_mmc_embd_user_p)	= { "oscclk", "dout_fsys_mmc_embd" };
 PNAME(mout_fsys_mmc_sdio_user_p)	= { "oscclk", "dout_fsys_mmc_sdio" };
 PNAME(mout_fsys_usb30drd_user_p)	= { "oscclk", "dout_fsys_usb30drd" };
+PNAME(mout_usb_pll_p)			= { "oscclk", "fout_usb_pll" };
 
 static const struct samsung_mux_clock fsys_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_FSYS_BUS_USER, "mout_fsys_bus_user", mout_fsys_bus_user_p,
@@ -731,12 +758,16 @@ static const struct samsung_mux_clock fsys_mux_clks[] __initconst = {
 	MUX_F(CLK_MOUT_FSYS_MMC_SDIO_USER, "mout_fsys_mmc_sdio_user",
 	      mout_fsys_mmc_sdio_user_p, PLL_CON0_MUX_CLKCMU_FSYS_MMC_SDIO_USER,
 	      4, 1, CLK_SET_RATE_PARENT, 0),
-	MUX_F(CLK_MOUT_FSYS_USB30DRD_USER, "mout_fsys_usb30drd_user",
+	MUX(CLK_MOUT_FSYS_USB30DRD_USER, "mout_fsys_usb30drd_user",
 	      mout_fsys_usb30drd_user_p, PLL_CON0_MUX_CLKCMU_FSYS_USB30DRD_USER,
-	      4, 1, CLK_SET_RATE_PARENT, 0),
+	      4, 1),
+	nMUX_F(CLK_MOUT_USB_PLL, "mout_usb_pll", mout_usb_pll_p,
+	    PLL_CON0_PLL_USB, 4, 1, CLK_SET_RATE_PARENT, 0),
 };
 
 static const struct samsung_gate_clock fsys_gate_clks[] __initconst = {
+	GATE(CLK_FSYS_USB20PHY_CLKCORE, "clk_fsys_usb20phy_clkcore", "mout_usb_pll",
+	     CLK_CON_GAT_CLK_FSYS_USB20PHY_CLKCORE, 21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_MMC_CARD_ACLK, "gout_mmc_card_aclk", "mout_fsys_bus_user",
 	     CLK_CON_GAT_GOUT_FSYS_MMC_CARD_I_ACLK, 21, 0, 0),
 	GATE(CLK_GOUT_MMC_CARD_SDCLKIN, "gout_mmc_card_sdclkin",
@@ -752,9 +783,21 @@ static const struct samsung_gate_clock fsys_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_MMC_SDIO_SDCLKIN, "gout_mmc_sdio_sdclkin",
 	     "mout_fsys_mmc_sdio_user", CLK_CON_GAT_GOUT_FSYS_MMC_SDIO_SDCLKIN,
 	     21, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_FSYS_USB30DRD_ACLK_20PHYCTRL, "clk_fsys_usb30drd_aclk_20phyctrl",
+	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_20PHYCTRL, 21, 0, 0),
+	GATE(CLK_FSYS_USB30DRD_ACLK_30PHYCTRL_0, "clk_fsys_usb30drd_aclk_30phyctrl_0",
+	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_0, 21, 0, 0),
+	GATE(CLK_FSYS_USB30DRD_ACLK_30PHYCTRL_1, "clk_fsys_usb30drd_aclk_30phyctrl_1",
+	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_ACLK_30PHYCTRL_1, 21, 0, 0),
+	GATE(CLK_FSYS_USB30DRD_BUS_CLK_EARLY, "clk_fsys_usb30drd_bus_clk_early",
+	     "mout_fsys_bus_user", CLK_CON_GAT_GOUT_FSYS_USB30DRD_BUS_CLK_EARLY, 21, 0, 0),
+	GATE(CLK_FSYS_USB30DRD_REF_CLK, "clk_fsys_usb30drd_ref_clk", "mout_fsys_usb30drd_user",
+	     CLK_CON_GAT_GOUT_FSYS_USB30DRD_REF_CLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info fsys_cmu_info __initconst = {
+	.pll_clks		= fsys_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(fsys_pll_clks),
 	.mux_clks		= fsys_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(fsys_mux_clks),
 	.gate_clks		= fsys_gate_clks,
-- 
2.46.0


