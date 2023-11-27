Return-Path: <linux-clk+bounces-600-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76037FA8AE
	for <lists+linux-clk@lfdr.de>; Mon, 27 Nov 2023 19:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 525E8B20F3C
	for <lists+linux-clk@lfdr.de>; Mon, 27 Nov 2023 18:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546D43C467;
	Mon, 27 Nov 2023 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VspH+Pf8"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095F81BE;
	Mon, 27 Nov 2023 10:14:50 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a0b65cbf096so299244866b.1;
        Mon, 27 Nov 2023 10:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701108888; x=1701713688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCB3azVd9wPLophpHh17n/6NPQGGZXQWFa2v4yG4E2Q=;
        b=VspH+Pf8grS6nQQbdYBV44lDwBq+/baNFsz6BKTlVGg3THZ0U4e56dMGWsSJGftER8
         Z9EQ+Vgl+HAG7P+0njA/MXIvHSf1hvMNVUbmkF8xYY4JOoWKNB/UZd7wq3Qsg0HNiYdM
         U1VuYOIxeaxh99HoSwGtbjR90O5Iyi3AXJlmCAR+X7HsvjVIgEaPEzr4OZmg4cY4qGZW
         uRFhZIfKOqP740eN62mzlkbU0roFsqGCL95KupXNlpPbgc3ct7akTX7uVtV68oluwPlT
         jsL8DPML45TKQqvHZ2wbkd91ScOs8fKyAvRc5bItWB9l4Ww4OqngRzljUB9AT7Ahlsou
         S0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701108888; x=1701713688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCB3azVd9wPLophpHh17n/6NPQGGZXQWFa2v4yG4E2Q=;
        b=eeJ0n72LxLPDCBnvvSfp8+9YeKPX7FlnK2jK1XnvHal9B2QrJqiPTEm14JLxUUet2C
         0NBmD4bRZg86z05bR9kjHqxnMJpvdw3FTF/Hi/eCJKlZXjEHWyvHwCJXPuGh1bAzOtP+
         rpTXtT6EaPUxRMaarWOGKhrxZl7510xmff5vtkNcCjFbtuNOn86zl/oIfX0ihOM3hpJv
         egwuis6D+5M5gY2GUd2dwPQ1G93Ku6YCYeOMNJ4+QoQrwRoJF44cKg4/en4g5xSmBnZr
         hLuzDUPJwSXmHXZonn18E/WKyfjCCtCR1fV2SnmTJDqlKEMM7KP95Kz3/EuoxyP2vW82
         MNgg==
X-Gm-Message-State: AOJu0Yxku1hBc8amW/TOjfzcOEUgAxRNqMv0j8rFX0llyUenjCuiutIS
	forCeyfILOwqFe36zvLRdQ==
X-Google-Smtp-Source: AGHT+IHBXiX6tNzfpxBBCBOOHOUOoddXdk5QUEny7Bc9fC6yJq3Zw1nLKkMGv1tRNoFhrUeRG3JYlA==
X-Received: by 2002:a17:906:5954:b0:a01:3df:ab1a with SMTP id g20-20020a170906595400b00a0103dfab1amr9747913ejr.75.1701108888378;
        Mon, 27 Nov 2023 10:14:48 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:370c:d8f:2dce:7367])
        by smtp.gmail.com with ESMTPSA id dv19-20020a170906b81300b009a9fbeb15f2sm5952271ejb.62.2023.11.27.10.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:14:48 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH v3 1/2] clk: rockchip: rk3128: Fix aclk_peri_src's parent
Date: Mon, 27 Nov 2023 19:14:16 +0100
Message-ID: <20231127181415.11735-4-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127181415.11735-2-knaerzche@gmail.com>
References: <20231127181415.11735-2-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Finley Xiao <finley.xiao@rock-chips.com>

According to the TRM there are no specific gpll_peri, cpll_peri,
gpll_div2_peri or gpll_div3_peri gates, but a single clk_peri_src gate.
Instead mux_clk_peri_src directly connects to the plls respectively the pll
divider clocks.
Fix this by creating a single gated composite.

Also rename all occurrences of aclk_peri_src to clk_peri_src, since it
is the parent for peri aclks, pclks and hclks. That name also matches
the one used in the TRM.

Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
[renamed aclk_peri_src -> clk_peri_src and added commit message]
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/clk/rockchip/clk-rk3128.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index aa53797dbfc1..fcacfe758829 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -138,7 +138,7 @@ PNAME(mux_pll_src_5plls_p)	= { "cpll", "gpll", "gpll_div2", "gpll_div3", "usb480
 PNAME(mux_pll_src_4plls_p)	= { "cpll", "gpll", "gpll_div2", "usb480m" };
 PNAME(mux_pll_src_3plls_p)	= { "cpll", "gpll", "gpll_div2" };
 
-PNAME(mux_aclk_peri_src_p)	= { "gpll_peri", "cpll_peri", "gpll_div2_peri", "gpll_div3_peri" };
+PNAME(mux_clk_peri_src_p)	= { "gpll", "cpll", "gpll_div2", "gpll_div3" };
 PNAME(mux_mmc_src_p)		= { "cpll", "gpll", "gpll_div2", "xin24m" };
 PNAME(mux_clk_cif_out_src_p)		= { "clk_cif_src", "xin24m" };
 PNAME(mux_sclk_vop_src_p)	= { "cpll", "gpll", "gpll_div2", "gpll_div3" };
@@ -275,23 +275,17 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 			RK2928_CLKGATE_CON(0), 11, GFLAGS),
 
 	/* PD_PERI */
-	GATE(0, "gpll_peri", "gpll", CLK_IGNORE_UNUSED,
+	COMPOSITE(0, "clk_peri_src", mux_clk_peri_src_p, 0,
+			RK2928_CLKSEL_CON(10), 14, 2, MFLAGS, 0, 5, DFLAGS,
 			RK2928_CLKGATE_CON(2), 0, GFLAGS),
-	GATE(0, "cpll_peri", "cpll", CLK_IGNORE_UNUSED,
-			RK2928_CLKGATE_CON(2), 0, GFLAGS),
-	GATE(0, "gpll_div2_peri", "gpll_div2", CLK_IGNORE_UNUSED,
-			RK2928_CLKGATE_CON(2), 0, GFLAGS),
-	GATE(0, "gpll_div3_peri", "gpll_div3", CLK_IGNORE_UNUSED,
-			RK2928_CLKGATE_CON(2), 0, GFLAGS),
-	COMPOSITE_NOGATE(0, "aclk_peri_src", mux_aclk_peri_src_p, 0,
-			RK2928_CLKSEL_CON(10), 14, 2, MFLAGS, 0, 5, DFLAGS),
-	COMPOSITE_NOMUX(PCLK_PERI, "pclk_peri", "aclk_peri_src", 0,
+
+	COMPOSITE_NOMUX(PCLK_PERI, "pclk_peri", "clk_peri_src", 0,
 			RK2928_CLKSEL_CON(10), 12, 2, DFLAGS | CLK_DIVIDER_POWER_OF_TWO,
 			RK2928_CLKGATE_CON(2), 3, GFLAGS),
-	COMPOSITE_NOMUX(HCLK_PERI, "hclk_peri", "aclk_peri_src", 0,
+	COMPOSITE_NOMUX(HCLK_PERI, "hclk_peri", "clk_peri_src", 0,
 			RK2928_CLKSEL_CON(10), 8, 2, DFLAGS | CLK_DIVIDER_POWER_OF_TWO,
 			RK2928_CLKGATE_CON(2), 2, GFLAGS),
-	GATE(ACLK_PERI, "aclk_peri", "aclk_peri_src", 0,
+	GATE(ACLK_PERI, "aclk_peri", "clk_peri_src", 0,
 			RK2928_CLKGATE_CON(2), 1, GFLAGS),
 
 	GATE(SCLK_TIMER0, "sclk_timer0", "xin24m", 0,
-- 
2.43.0


