Return-Path: <linux-clk+bounces-29097-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E80BDA504
	for <lists+linux-clk@lfdr.de>; Tue, 14 Oct 2025 17:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 539395037CC
	for <lists+linux-clk@lfdr.de>; Tue, 14 Oct 2025 15:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D2B2C1786;
	Tue, 14 Oct 2025 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlSTloKh"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055FE3002C6
	for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454833; cv=none; b=YfbMqKgp5OP02Tn1D3xZ5XzcdLEHaaavsdfXjb0YkxiN59rwLVG5Lk+cWBv4mMnt8rT4Zhgq8Q3us5twk2E4fA45ugxpWjSRmDI7Uy/jeJ/t/LSkDUUwlxM6FabNgpn0649HMgZiM8RpBpQp6thER5E4pOtMDsXZQKSZOsP3sAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454833; c=relaxed/simple;
	bh=mJ7jw+BTvZD3cCVG63LR4j1UUZ1m5SPY9cT55xpZ3B0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKB4WOKwrNTkscUcspYfxg1Payufti7wSMEFk8jE4rTAmkAaGlxhNVLTXYluzPauDLwgWIoEWoiYQoUs9sNE4lQ6aKoHC6svVTkXtLjbuvO/DzAW0xVbTN4SvjAHjETxFV3VMmSiOLrBkRlQzh6/PKzjNIqhDg9Dchimmy1J8Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlSTloKh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-271067d66fbso53093025ad.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454831; x=1761059631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HD0IjWYUpIX6DQR0YiMfR6c9xGp2dmBh5aCtaTI8LVo=;
        b=TlSTloKhgRKCJO8PbZCdpd1c+b9EwdTaDmjYGMzmUNKUEmrbzNAp/Kt8tFrSF4y5GA
         jk57G2+YAtXYhSYL/Ok/bQtTqidwtO80Xp+OQ6INw8g0DEn15dzVRs1NJP67kfqTqAh7
         dXAbrZwlcoQ7SGtWNWm+6cBHkkn53g5OFVNVkEYFeKiaKw/xbip9p7Bosjl2QmuuJpZG
         gZUGsXJsOX7KuOhctwZPhCNlp+RRB37RU8sdL4RYBtybciqi/3iYOiYjoW/hg5tj5zcN
         JrIf8xrpQpyARAprKHiRUdbEGcxifeoCV0Tecf5A83OAqwcM1YmZxkXWv+vCQhXQVOzg
         n29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454831; x=1761059631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HD0IjWYUpIX6DQR0YiMfR6c9xGp2dmBh5aCtaTI8LVo=;
        b=k6bDCXdAUaN4sJfXvClcDe1GxiisLafa1yJ/n2OrkiMFN7VJ7z2aJUVErAHzXlxEUw
         hggjyYG7DxK3zNikRbq9otDahge5boHD/WRMcz59s6aOOQ1NcRw3Vk+Mg0D289fjuW1N
         AxqqRvhBIxsaSfLxVPVokixOuxgLn+QdPs50FBorTlNZAzOkZr5SAsN9Va1qrlIbv3G5
         xlY8BF4rQYRP4rXZvN6tbbAlZOTKU1WwR9KZfLHrOpq8g1slx8NDGWQtQs0Ng/1Q+KDD
         YaUUXREzo7ucrVXKCZg60fWw+CdBgJpKp1cRq/ipub3qfO7xKe/9YDzOakB5UTMfc49J
         raqw==
X-Forwarded-Encrypted: i=1; AJvYcCWEYmVw7E9pt1XEjXlg0esOXKH9BPWf5GF8t9ElzWOiF9PEOINKKACZ4ASzy1zzUTwAHYD91ZHjQAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRsWeXYeKMyFnkrKElOB0bXw6ix0XThBr5Qz9cjHAyMmo8faT7
	mZHLHTyDDWc5m1ykbrmkgQB/vKY3D1uKDLECApUB+sOR4R2AjTdgNNim
X-Gm-Gg: ASbGncty0FvvLtfxkgQMxcbTWlFgFqZzku43hf2mb5i8Ql39cNux4BnSSCjxRhkmeQY
	Lz/3t9EUqN+VTOTlv0VGgCxgHXIDiXOv21QvsmBDa2fqemT/iq5Njfa/QAp9/enIym6dkyBIWqo
	mCKjdnDo6LPuqaOLSPPGy/UQu8m59IRG0InDuRtkeJIxCElf1g5BUMeTQW+jI8JJ4d0bHBANx6/
	VDVDla8Mu/vw4qC+IpsJptbpw2cRDs5f47JN0PoWReYohDl798dnjMieaXbnBOIq2mqzp/k4SeC
	iYpkcHUnKK+QWZ8WinwNfSrN4Nh43qnAj2CoJZrJVRDi5h5PKHQzNJ6xR+yAQRx+vdBeURUSUXt
	Gdos1kBlqE/nWwO4QKvwDg/T1Xu7dXhvUljoWMLTBcBxm80am2Kfl20WXbbQ/o4g=
X-Google-Smtp-Source: AGHT+IFRQLmuf3B5tJjyYF3pZfYmZi5fc1ieIRhHxVxnxxNuJHod8Y/ic6ZrqFiTWo/NNq55W9lf4w==
X-Received: by 2002:a17:903:94e:b0:290:55d5:41dd with SMTP id d9443c01a7336-29055d5427dmr167011775ad.5.1760454831073;
        Tue, 14 Oct 2025 08:13:51 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:6d70:c338:e681:47e3:e797])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8f9bbsm167171125ad.121.2025.10.14.08.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:13:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: r9a09g077: Add xSPI core and module clocks
Date: Tue, 14 Oct 2025 16:13:25 +0100
Message-ID: <20251014151325.160062-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add module and core clocks used by xSPI (Expanded SPI) IP on the
R9A09G077 SoC.

The xSPI block uses PCLKH as its bus clock, while the operation clock
(XSPI_CLKn) is derived from PLL4. To support this, define new selectors
and dividers (FSELXSPI0/1 and DIVSEL_XSPI0/1) in SCKCR.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 35 ++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 4ec6c4ddc5f5..e08b1a589ccc 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -54,6 +54,10 @@
 #define DIVSCI3ASYNC	CONF_PACK(SCKCR3, 12, 2)
 #define DIVSCI4ASYNC	CONF_PACK(SCKCR3, 14, 2)
 
+#define FSELXSPI0	CONF_PACK(SCKCR, 0, 3)
+#define FSELXSPI1	CONF_PACK(SCKCR, 8, 3)
+#define DIVSEL_XSPI0	CONF_PACK(SCKCR, 6, 1)
+#define DIVSEL_XSPI1	CONF_PACK(SCKCR, 14, 1)
 #define SEL_PLL		CONF_PACK(SCKCR, 22, 1)
 
 
@@ -72,7 +76,7 @@ enum rzt2h_clk_types {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_ETCLKE,
+	LAST_DT_CORE_CLK = R9A09G077_XSPI_CLK1,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -88,12 +92,16 @@ enum clk_ids {
 	CLK_SEL_CLK_PLL2,
 	CLK_SEL_CLK_PLL4,
 	CLK_PLL4D1,
+	CLK_PLL4D1_DIV3,
+	CLK_PLL4D1_DIV4,
 	CLK_SCI0ASYNC,
 	CLK_SCI1ASYNC,
 	CLK_SCI2ASYNC,
 	CLK_SCI3ASYNC,
 	CLK_SCI4ASYNC,
 	CLK_SCI5ASYNC,
+	CLK_DIVSELXSPI0_SCKCR,
+	CLK_DIVSELXSPI1_SCKCR,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -105,6 +113,15 @@ static const struct clk_div_table dtable_1_2[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_6_8_16_32_64[] = {
+	{6, 64},
+	{5, 32},
+	{4, 16},
+	{3, 8},
+	{2, 6},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_24_25_30_32[] = {
 	{0, 32},
 	{1, 30},
@@ -119,6 +136,7 @@ static const char * const sel_clk_pll0[] = { ".loco", ".pll0" };
 static const char * const sel_clk_pll1[] = { ".loco", ".pll1" };
 static const char * const sel_clk_pll2[] = { ".loco", ".pll2" };
 static const char * const sel_clk_pll4[] = { ".loco", ".pll4" };
+static const char * const sel_clk_pll4d1_div3_div4[] = { ".pll4d1_div3", ".pll4d1_div4" };
 
 static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -154,6 +172,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_DIV(".sci5async", CLK_SCI5ASYNC, CLK_PLL4D1, DIVSCI5ASYNC,
 		dtable_24_25_30_32),
 
+	DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
+	DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
+	DEF_MUX(".divselxspi0", CLK_DIVSELXSPI0_SCKCR, DIVSEL_XSPI0,
+		sel_clk_pll4d1_div3_div4,
+		ARRAY_SIZE(sel_clk_pll4d1_div3_div4), CLK_MUX_HIWORD_MASK),
+	DEF_MUX(".divselxspi1", CLK_DIVSELXSPI1_SCKCR, DIVSEL_XSPI1,
+		sel_clk_pll4d1_div3_div4,
+		ARRAY_SIZE(sel_clk_pll4d1_div3_div4), CLK_MUX_HIWORD_MASK),
+
 	/* Core output clk */
 	DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA55C0,
 		dtable_1_2),
@@ -178,9 +205,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
 	DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
 	DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
+	DEF_DIV("XSPI_CLK0", R9A09G077_XSPI_CLK0, CLK_DIVSELXSPI0_SCKCR,
+		FSELXSPI0, dtable_6_8_16_32_64),
+	DEF_DIV("XSPI_CLK1", R9A09G077_XSPI_CLK1, CLK_DIVSELXSPI1_SCKCR,
+		FSELXSPI1, dtable_6_8_16_32_64),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
+	DEF_MOD("xspi0", 4, R9A09G077_CLK_PCLKH),
+	DEF_MOD("xspi1", 5, R9A09G077_CLK_PCLKH),
 	DEF_MOD("sci0fck", 8, CLK_SCI0ASYNC),
 	DEF_MOD("sci1fck", 9, CLK_SCI1ASYNC),
 	DEF_MOD("sci2fck", 10, CLK_SCI2ASYNC),
-- 
2.43.0


