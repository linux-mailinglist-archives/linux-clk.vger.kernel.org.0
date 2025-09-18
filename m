Return-Path: <linux-clk+bounces-25727-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D9AB1F57F
	for <lists+linux-clk@lfdr.de>; Sat,  9 Aug 2025 19:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0844518C255E
	for <lists+linux-clk@lfdr.de>; Sat,  9 Aug 2025 17:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAD42727ED;
	Sat,  9 Aug 2025 17:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TP7Ouw/H"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD36C23B629
	for <linux-clk@vger.kernel.org>; Sat,  9 Aug 2025 17:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754758931; cv=none; b=SmqyVdOMnFn4z07Cqu7E0JMeieRDyrn+HSZ44+/b2mXT7gFgM4mUdECLCNbsNOf9ysi56SRaxW1sTl/F8ewBrmgfSNhpeBT+RA78++DSqNh+1TDxFuDFt8X61v27oqTGtLMcgA3e30GyFYnc3nUJZy/G47CuQAJIvo0nK8iCrHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754758931; c=relaxed/simple;
	bh=oLlStNjf365/EBYlY8hMiCgpuMw8R0zVvmxK0owNE/w=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type:
	 References; b=Vy/kjHGz4IS9uuBrU6H7h9LPKLDAs/DGGB9RCV55djgsxYylE+0YMST456XCvrz0xLZcltsMq77k2Y00b5Mv7uXkbXzVb/tVias5k/s/cYrJaoktyMKWpxD/YTjsywwr1hh9H6RZG9NvzMPhrJYxpubRqQkDVyv+QLy6xSOJBtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TP7Ouw/H; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250809170205euoutp01fb73275fc67297b65c46f93bfa361b99~aJ-Ioy0Z42094920949euoutp01n
	for <linux-clk@vger.kernel.org>; Sat,  9 Aug 2025 17:02:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250809170205euoutp01fb73275fc67297b65c46f93bfa361b99~aJ-Ioy0Z42094920949euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754758925;
	bh=cXcpoYqKpw2AYordukgrvKibmr+AtiKeIGTwu6IdZyU=;
	h=From:Date:Subject:To:Cc:References:From;
	b=TP7Ouw/HTL6FWk+4PiiYStebOLdHCpAs/QPn2IJmwzfLMgpG48W8H6SYYBQpAa1ZU
	 hgjphUeUE1vTifDvFt5PIqn+75iHD4z9lyfog8q9IbdyRuKN5hragcmJHlJ2H4zPqQ
	 wSuXoCI6KmrIHGMOF5wL5yUd/vo4iiahJDtXrAdk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee~aJ-IVxL3m1297712977eucas1p2r;
	Sat,  9 Aug 2025 17:02:05 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250809170205eusmtip12b6ca9982d2161a1964893ca1ae913dd~aJ-H8om130374003740eusmtip1Y;
	Sat,  9 Aug 2025 17:02:05 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 09 Aug 2025 19:02:00 +0200
Subject: [PATCH] clk: thead: Correct parent for DPU pixel clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-fix_clocks_thead_aug_9-v1-1-299c33d7a593@samsung.com>
X-B4-Tracking: v=1; b=H4sIAAd/l2gC/x2MSwqAMAwFryJZW6ifgnoVkVLSVIOi0qoI4t0Nz
	m5g3nsgUWRK0GUPRLo48baKFHkGOLl1JMVeHEpdGt3oVgW+LS4bzskeEzlv3TnaVhkMQu01Vg3
	IeI8k5X/cD+/7ASvvqsFoAAAA
X-Change-ID: 20250809-fix_clocks_thead_aug_9-5cffff4d0c38
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>,  Stephen
	Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,  Michal
	Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee
X-EPHeader: CA
X-CMS-RootMailID: 20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee
References: <CGME20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee@eucas1p2.samsung.com>

The dpu0_pixelclk and dpu1_pixelclk gates were incorrectly parented to
the video_pll_clk.

According to the TH1520 TRM, the "dpu0_pixelclk" should be sourced from
"DPU0 PLL DIV CLK". In this driver, "DPU0 PLL DIV CLK" corresponds to
the `dpu0_clk` clock, which is a divider whose parent is the
`dpu0_pll_clk`.

This patch corrects the clock hierarchy by reparenting `dpu0_pixelclk`
to `dpu0_clk`. By symmetry, `dpu1_pixelclk` is also reparented to its
correct source, `dpu1_clk`.

Fixes: 50d4b157fa96 ("clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC")
Reported-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index cf1bba58f641e9b053cdda5fa52640590c5fa215..dd6359441f7e8a2c9d4a00c640b07af606627cc4 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -767,6 +767,10 @@ static struct ccu_div dpu0_clk = {
 	},
 };
 
+static const struct clk_parent_data dpu0_clk_pd[] = {
+	{ .hw = &dpu0_clk.common.hw }
+};
+
 static struct ccu_div dpu1_clk = {
 	.div		= TH_CCU_DIV_FLAGS(0, 8, CLK_DIVIDER_ONE_BASED),
 	.common		= {
@@ -779,6 +783,10 @@ static struct ccu_div dpu1_clk = {
 	},
 };
 
+static const struct clk_parent_data dpu1_clk_pd[] = {
+	{ .hw = &dpu1_clk.common.hw }
+};
+
 static CLK_FIXED_FACTOR_HW(emmc_sdio_ref_clk, "emmc-sdio-ref",
 			   &video_pll_clk.common.hw, 4, 1, 0);
 
@@ -855,9 +863,9 @@ static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
 static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
 		video_pll_clk_pd, 0x0, BIT(4), 0);
 static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
-		video_pll_clk_pd, 0x0, BIT(5), 0);
+		dpu0_clk_pd, 0x0, BIT(5), 0);
 static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
-		video_pll_clk_pd, 0x0, BIT(6), 0);
+		dpu1_clk_pd, 0x0, BIT(6), 0);
 static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
 		BIT(7), 0);
 static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,

---
base-commit: 561c80369df0733ba0574882a1635287b20f9de2
change-id: 20250809-fix_clocks_thead_aug_9-5cffff4d0c38

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


