Return-Path: <linux-clk+bounces-5017-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D0988BD2B
	for <lists+linux-clk@lfdr.de>; Tue, 26 Mar 2024 10:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3D2E1C3695C
	for <lists+linux-clk@lfdr.de>; Tue, 26 Mar 2024 09:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228E23D577;
	Tue, 26 Mar 2024 09:01:49 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28711CD1B;
	Tue, 26 Mar 2024 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443709; cv=none; b=WPOiuCaa2bSW4g+Q/W72IkiR45GlHaiLFs7vxe2PsSf2BaI/tJUUaOKrM6W9YLh5Ha/FjmAeyJuBA5JnUS7ue4b+khCu/z2CxoMmHZQgGUtEgtdDUm7wIkG9oQtJJ96wbTAN538+h38gfzXdGeUh+E/z9+wRqRvNDJ4yXbtTsF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443709; c=relaxed/simple;
	bh=u2CznqHDsZn9kHrDtW04vUny1nwm4VkPC7sF8sTn6jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTHf9eB1GJQwPi146xXlh8Th+LHIuo16kNuUfkB7IlWEPo81YO8JXDWAYx8o4aj5UKoytdklyvC97OZ1lqYTtGPMuxU9ELSM5UTn9oxT6lUxHW/dypsJLLyjit+QYJi/EJ4aMBzCyc1xvSUZAbYWIkRWlyGyVY+vapgH252Anow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.198])
	by gateway (Coremail) with SMTP id _____8BxSOj3jgJmuE4eAA--.51909S3;
	Tue, 26 Mar 2024 17:01:43 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.198])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxXs3zjgJmdLJoAA--.6145S2;
	Tue, 26 Mar 2024 17:01:40 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 4/8] clk: clk-loongson2: Add Loongson-2K0500 clock support
Date: Tue, 26 Mar 2024 17:01:24 +0800
Message-ID: <3acf11e9f99599d4c5534c2c4fda7d5ce05b72f5.1710926402.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710926402.git.zhoubinbin@loongson.cn>
References: <cover.1710926402.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxXs3zjgJmdLJoAA--.6145S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFWfKrWDWr13Cr48Kry3trc_yoW8KrW5pr
	1fCw4fG34rtr40grnxJ34Uuw43ZrW7X3Zrtay2kw1Duan7JF10qF1FyF4xJFs8GryqyFy3
	Zr4q9rsIka1UXrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVWrXDUUUU

The Loongson-2K0500 and Loongson-2K1000 clock is similar, we add its
support by different configurations.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/clk/clk-loongson2.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 00e384290314..4e3b287ff9a0 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -90,6 +90,27 @@ struct loongson2_clk_board_info {
 		.div_width	= _dwidth,			\
 	}
 
+static const struct loongson2_clk_board_info ls2k0500_clks[] = {
+	CLK_PLL(LOONGSON2_NODE_PLL,   "pll_node", 0,    16, 8, 8, 6),
+	CLK_PLL(LOONGSON2_DDR_PLL,    "pll_ddr",  0x8,  16, 8, 8, 6),
+	CLK_PLL(LOONGSON2_DC_PLL,     "pll_soc",  0x10, 16, 8, 8, 6),
+	CLK_PLL(LOONGSON2_PIX0_PLL,   "pll_pix0", 0x18, 16, 8, 8, 6),
+	CLK_PLL(LOONGSON2_PIX1_PLL,   "pll_pix1", 0x20, 16, 8, 8, 6),
+	CLK_DIV(LOONGSON2_NODE_CLK,   "clk_node", "pll_node", 0,    24, 6),
+	CLK_DIV(LOONGSON2_DDR_CLK,    "clk_ddr",  "pll_ddr",  0x8,  24, 6),
+	CLK_DIV(LOONGSON2_HDA_CLK,    "clk_hda",  "pll_ddr",  0xc,  8,  6),
+	CLK_DIV(LOONGSON2_GPU_CLK,    "clk_gpu",  "pll_soc",  0x10, 24, 6),
+	CLK_DIV(LOONGSON2_DC_CLK,     "clk_sb",   "pll_soc",  0x14, 0,  6),
+	CLK_DIV(LOONGSON2_GMAC_CLK,   "clk_gmac", "pll_soc",  0x14, 8,  6),
+	CLK_DIV(LOONGSON2_PIX0_CLK,   "clk_pix0", "pll_pix0", 0x18, 24, 6),
+	CLK_DIV(LOONGSON2_PIX1_CLK,   "clk_pix1", "pll_pix1", 0x20, 24, 6),
+	CLK_SCALE(LOONGSON2_BOOT_CLK, "clk_boot", "clk_sb",   0x28, 8,  3),
+	CLK_SCALE(LOONGSON2_SATA_CLK, "clk_sata", "clk_sb",   0x28, 12, 3),
+	CLK_SCALE(LOONGSON2_USB_CLK,  "clk_usb",  "clk_sb",   0x28, 16, 3),
+	CLK_SCALE(LOONGSON2_APB_CLK,  "clk_apb",  "clk_sb",   0x28, 20, 3),
+	{ /* Sentinel */ },
+};
+
 static const struct loongson2_clk_board_info ls2k1000_clks[] = {
 	CLK_PLL(LOONGSON2_NODE_PLL,   "pll_node", 0,    32, 10, 26, 6),
 	CLK_PLL(LOONGSON2_DDR_PLL,    "pll_ddr",  0x10, 32, 10, 26, 6),
@@ -261,6 +282,7 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id loongson2_clk_match_table[] = {
+	{ .compatible = "loongson,ls2k0500-clk", .data = &ls2k0500_clks },
 	{ .compatible = "loongson,ls2k-clk", .data = &ls2k1000_clks },
 	{ }
 };
-- 
2.43.0


