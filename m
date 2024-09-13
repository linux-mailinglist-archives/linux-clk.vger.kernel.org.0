Return-Path: <linux-clk+bounces-12033-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D3397881F
	for <lists+linux-clk@lfdr.de>; Fri, 13 Sep 2024 20:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F79AB20DAF
	for <lists+linux-clk@lfdr.de>; Fri, 13 Sep 2024 18:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA6813A257;
	Fri, 13 Sep 2024 18:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qwZ26nnW"
X-Original-To: linux-clk@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E794B83CD6;
	Fri, 13 Sep 2024 18:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726253254; cv=none; b=CsV/Deyd1gGyWQAai7f6PniPWg7HerDzGPogyaD6Jag//35Qg+dokxT6zZfELQGlHTlbt83qxizGj6BMDdn+jlVHuU+2aKwi3YxmB3jvQGJCiuLEG3dbUYaaQ0hcQ1ujzDaZ9XABMP128ViCgGKDXfCsIAap1zAyvXU1ABGpXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726253254; c=relaxed/simple;
	bh=z1fpr6fp/TzEvmVPJkr51FgwKdkS776OPIBDPpVIdow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ihCRKy2r8iZU4VOoQjxpUvXfNWE+47qir/ID7TNX7aEWbEm5Za6JdeFT3Y835NifiCRCMJcqmf0A53A5h8WoNiNkqf6sOLd2XIwuR50H7EBuonJ1Ohc72igW4u9eeqWdNppK+UmHp7hXonAl8LXFaVQjKJ9bsTEmyDQfJxTBQJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qwZ26nnW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726253242;
	bh=z1fpr6fp/TzEvmVPJkr51FgwKdkS776OPIBDPpVIdow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qwZ26nnWyrBI6xAGIppLwPZL7GlKfK6j8QnpB1+SF5QFLo5H7rD2hcGKXFRD+tuc3
	 phflT9q3Tq+lfoCl8qybZP8ubs1BscG/1/zkX6vLrs3iwHW+TSvtH+YNvP7eemDfok
	 S6SqtksKUx1IFuzATOggzjVsFzqyqY+Q4KoU964Zd+qPIgI4yPRh3s8O4Sor4+MIjt
	 3dUG+IOnnStBHmwv2TUs5c1C0ZHcdHk0IV4oOMvdMcko99F+nhLAXukEIqLEdC4Uye
	 ql6N4vVfe7thOog5SxC7mnNtj71kkzQfHHhKhHRTMcuhUaMfg6xULvhEcZ0P/2Wf5R
	 X0OuTYUQ5Q7zA==
Received: from jupiter.universe (dyndsl-091-248-214-164.ewe-ip-backbone.de [91.248.214.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 689B217E3616;
	Fri, 13 Sep 2024 20:47:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E2E634800FF; Fri, 13 Sep 2024 20:47:21 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>,
	Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v10 5/5] clk: rockchip: rk3588: drop RK3588_LINKED_CLK
Date: Fri, 13 Sep 2024 20:45:45 +0200
Message-ID: <20240913184720.57381-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240913184720.57381-1-sebastian.reichel@collabora.com>
References: <20240913184720.57381-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the proper GATE_LINK support, we no longer need to keep the
linked clocks always on. Thus it's time to drop the CLK_IS_CRITICAL
flag for them.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 4d85ae615e15..70d0873a761f 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -12,9 +12,6 @@
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include "clk.h"
 
-#define RK3588_LINKED_CLK		CLK_IS_CRITICAL
-
-
 #define RK3588_GRF_SOC_STATUS0		0x600
 #define RK3588_PHYREF_ALT_GATE		0xc38
 
@@ -1439,7 +1436,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE_NODIV(HCLK_NVM_ROOT,  "hclk_nvm_root", mux_200m_100m_50m_24m_p, 0,
 			RK3588_CLKSEL_CON(77), 0, 2, MFLAGS,
 			RK3588_CLKGATE_CON(31), 0, GFLAGS),
-	COMPOSITE(ACLK_NVM_ROOT, "aclk_nvm_root", gpll_cpll_p, RK3588_LINKED_CLK,
+	COMPOSITE(ACLK_NVM_ROOT, "aclk_nvm_root", gpll_cpll_p, 0,
 			RK3588_CLKSEL_CON(77), 7, 1, MFLAGS, 2, 5, DFLAGS,
 			RK3588_CLKGATE_CON(31), 1, GFLAGS),
 	GATE(ACLK_EMMC, "aclk_emmc", "aclk_nvm_root", 0,
@@ -1668,13 +1665,13 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(42), 9, GFLAGS),
 
 	/* vdpu */
-	COMPOSITE(ACLK_VDPU_ROOT, "aclk_vdpu_root", gpll_cpll_aupll_p, RK3588_LINKED_CLK,
+	COMPOSITE(ACLK_VDPU_ROOT, "aclk_vdpu_root", gpll_cpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(98), 5, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(44), 0, GFLAGS),
 	COMPOSITE_NODIV(ACLK_VDPU_LOW_ROOT, "aclk_vdpu_low_root", mux_400m_200m_100m_24m_p, 0,
 			RK3588_CLKSEL_CON(98), 7, 2, MFLAGS,
 			RK3588_CLKGATE_CON(44), 1, GFLAGS),
-	COMPOSITE_NODIV(HCLK_VDPU_ROOT, "hclk_vdpu_root", mux_200m_100m_50m_24m_p, RK3588_LINKED_CLK,
+	COMPOSITE_NODIV(HCLK_VDPU_ROOT, "hclk_vdpu_root", mux_200m_100m_50m_24m_p, 0,
 			RK3588_CLKSEL_CON(98), 9, 2, MFLAGS,
 			RK3588_CLKGATE_CON(44), 2, GFLAGS),
 	COMPOSITE(ACLK_JPEG_DECODER_ROOT, "aclk_jpeg_decoder_root", gpll_cpll_aupll_spll_p, 0,
@@ -1725,9 +1722,9 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(ACLK_RKVENC0_ROOT, "aclk_rkvenc0_root", gpll_cpll_npll_p, 0,
 			RK3588_CLKSEL_CON(102), 7, 2, MFLAGS, 2, 5, DFLAGS,
 			RK3588_CLKGATE_CON(47), 1, GFLAGS),
-	GATE(HCLK_RKVENC0, "hclk_rkvenc0", "hclk_rkvenc0_root", RK3588_LINKED_CLK,
+	GATE(HCLK_RKVENC0, "hclk_rkvenc0", "hclk_rkvenc0_root", 0,
 			RK3588_CLKGATE_CON(47), 4, GFLAGS),
-	GATE(ACLK_RKVENC0, "aclk_rkvenc0", "aclk_rkvenc0_root", RK3588_LINKED_CLK,
+	GATE(ACLK_RKVENC0, "aclk_rkvenc0", "aclk_rkvenc0_root", 0,
 			RK3588_CLKGATE_CON(47), 5, GFLAGS),
 	COMPOSITE(CLK_RKVENC0_CORE, "clk_rkvenc0_core", gpll_cpll_aupll_npll_p, 0,
 			RK3588_CLKSEL_CON(102), 14, 2, MFLAGS, 9, 5, DFLAGS,
@@ -1737,10 +1734,10 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(48), 6, GFLAGS),
 
 	/* vi */
-	COMPOSITE(ACLK_VI_ROOT, "aclk_vi_root", gpll_cpll_npll_aupll_spll_p, RK3588_LINKED_CLK,
+	COMPOSITE(ACLK_VI_ROOT, "aclk_vi_root", gpll_cpll_npll_aupll_spll_p, 0,
 			RK3588_CLKSEL_CON(106), 5, 3, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(49), 0, GFLAGS),
-	COMPOSITE_NODIV(HCLK_VI_ROOT, "hclk_vi_root", mux_200m_100m_50m_24m_p, RK3588_LINKED_CLK,
+	COMPOSITE_NODIV(HCLK_VI_ROOT, "hclk_vi_root", mux_200m_100m_50m_24m_p, 0,
 			RK3588_CLKSEL_CON(106), 8, 2, MFLAGS,
 			RK3588_CLKGATE_CON(49), 1, GFLAGS),
 	COMPOSITE_NODIV(PCLK_VI_ROOT, "pclk_vi_root", mux_100m_50m_24m_p, 0,
@@ -1910,10 +1907,10 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(ACLK_VOP_ROOT, "aclk_vop_root", gpll_cpll_dmyaupll_npll_spll_p, 0,
 			RK3588_CLKSEL_CON(110), 5, 3, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(52), 0, GFLAGS),
-	COMPOSITE_NODIV(ACLK_VOP_LOW_ROOT, "aclk_vop_low_root", mux_400m_200m_100m_24m_p, RK3588_LINKED_CLK,
+	COMPOSITE_NODIV(ACLK_VOP_LOW_ROOT, "aclk_vop_low_root", mux_400m_200m_100m_24m_p, 0,
 			RK3588_CLKSEL_CON(110), 8, 2, MFLAGS,
 			RK3588_CLKGATE_CON(52), 1, GFLAGS),
-	COMPOSITE_NODIV(HCLK_VOP_ROOT, "hclk_vop_root", mux_200m_100m_50m_24m_p, RK3588_LINKED_CLK,
+	COMPOSITE_NODIV(HCLK_VOP_ROOT, "hclk_vop_root", mux_200m_100m_50m_24m_p, 0,
 			RK3588_CLKSEL_CON(110), 10, 2, MFLAGS,
 			RK3588_CLKGATE_CON(52), 2, GFLAGS),
 	COMPOSITE_NODIV(PCLK_VOP_ROOT, "pclk_vop_root", mux_100m_50m_24m_p, 0,
@@ -2416,7 +2413,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 static struct rockchip_clk_branch rk3588_clk_branches[] = {
 	GATE_LINK(ACLK_ISP1_PRE, "aclk_isp1_pre", "aclk_isp1_root", ACLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 6, GFLAGS),
 	GATE_LINK(HCLK_ISP1_PRE, "hclk_isp1_pre", "hclk_isp1_root", HCLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 8, GFLAGS),
-	GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(31), 2, GFLAGS),
+	GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, 0, RK3588_CLKGATE_CON(31), 2, GFLAGS),
 	GATE_LINK(ACLK_USB, "aclk_usb", "aclk_usb_root", ACLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(42), 2, GFLAGS),
 	GATE_LINK(HCLK_USB, "hclk_usb", "hclk_usb_root", HCLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(42), 3, GFLAGS),
 	GATE_LINK(ACLK_JPEG_DECODER_PRE, "aclk_jpeg_decoder_pre", "aclk_jpeg_decoder_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(44), 7, GFLAGS),
@@ -2428,9 +2425,9 @@ static struct rockchip_clk_branch rk3588_clk_branches[] = {
 	GATE_LINK(HCLK_RKVDEC1_PRE, "hclk_rkvdec1_pre", "hclk_rkvdec1_root", HCLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(41), 4, GFLAGS),
 	GATE_LINK(ACLK_RKVDEC1_PRE, "aclk_rkvdec1_pre", "aclk_rkvdec1_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(41), 5, GFLAGS),
 	GATE_LINK(ACLK_HDCP0_PRE, "aclk_hdcp0_pre", "aclk_vo0_root", ACLK_VOP_LOW_ROOT, 0, RK3588_CLKGATE_CON(55), 9, GFLAGS),
-	GATE_LINK(HCLK_VO0, "hclk_vo0", "hclk_vo0_root", HCLK_VOP_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(55), 5, GFLAGS),
+	GATE_LINK(HCLK_VO0, "hclk_vo0", "hclk_vo0_root", HCLK_VOP_ROOT, 0, RK3588_CLKGATE_CON(55), 5, GFLAGS),
 	GATE_LINK(ACLK_HDCP1_PRE, "aclk_hdcp1_pre", "aclk_hdcp1_root", ACLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(59), 6, GFLAGS),
-	GATE_LINK(HCLK_VO1, "hclk_vo1", "hclk_vo1_root", HCLK_VO1USB_TOP_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(59), 9, GFLAGS),
+	GATE_LINK(HCLK_VO1, "hclk_vo1", "hclk_vo1_root", HCLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(59), 9, GFLAGS),
 	GATE_LINK(ACLK_AV1_PRE, "aclk_av1_pre", "aclk_av1_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(68), 1, GFLAGS),
 	GATE_LINK(PCLK_AV1_PRE, "pclk_av1_pre", "pclk_av1_root", HCLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(68), 4, GFLAGS),
 	GATE_LINK(HCLK_SDIO_PRE, "hclk_sdio_pre", "hclk_sdio_root", HCLK_NVM, 0, RK3588_CLKGATE_CON(75), 1, GFLAGS),
-- 
2.45.2


