Return-Path: <linux-clk+bounces-23190-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C14ADEC8A
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 14:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63D501BC330E
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 12:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7352EA749;
	Wed, 18 Jun 2025 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VLfABj5Z"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D1E2EBDF0
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249701; cv=none; b=VGUFRfgX3UJvieiGwRv2qaNfl2fDv0QDcLNlQYQ6ktBHj40k5jekZTSoS6scASR+unQxlePyRBCYXd5jVX66T5YK27VMZGaEWI0pxJtcG2FtMWasv/oCn18ajnPwY9f/tDYObIriaYIoJ48F0qciQcUaJpcAaLqHPCLpK4qexe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249701; c=relaxed/simple;
	bh=8QeexMQ+Ddp0T0hHsTz6gc6NzghXhdaWoVKahR3viso=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=e7gWiWOS+YM4LV8V9iznaEIcmftgIqb1x1HOMj4Ig0I4MIwH68wHzcwyek7VAvMQj9zO+oH6h7vuyEmT95z9ghc5jhT3+qN+XzhYVpk0XFl9Mc5t5coL+RN9lzEViy8HZ++aCKf3E7gx/D1VakrxXneEBZmSJ1SN9Iu2Oi0ROFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VLfABj5Z; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618122808euoutp01b4afc53b4a449d404e06150caabc08b4~KItGkhU2g3222832228euoutp01z
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:28:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618122808euoutp01b4afc53b4a449d404e06150caabc08b4~KItGkhU2g3222832228euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750249689;
	bh=Xe91emMRSSYzgLVJyetcqSNKJQUn2nWDQDykjLFdeWE=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=VLfABj5ZVCXKnAPkvx/7N5g7DyRw2cOz5o2fq7YHshjs2RduTxgeAdv/9zLLgTlBX
	 5lQARDBtY5ZynhnY3EKbtPX5hirhKGN7SkWRI5iHqFMutoACbFNbM3sDXg1hIBf41g
	 wm7kl0MyxZqTpQQCsMLzDgeiWpwjdiRwyxpBgOWc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250618122808eucas1p1734efef72b723602969465d6cd0c01d2~KItGDMiIN3060530605eucas1p1O;
	Wed, 18 Jun 2025 12:28:08 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250618122807eusmtip17966074cf02e0a8c674880f2475400b6~KItE1do9C2089120891eusmtip19;
	Wed, 18 Jun 2025 12:28:07 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 18 Jun 2025 14:27:38 +0200
Subject: [PATCH v4 5/9] clk: thead: Mark essential bus clocks as
 CLK_IGNORE_UNUSED
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-rust-next-pwm-working-fan-for-sending-v4-5-a6a28f2b6d8a@samsung.com>
In-Reply-To: <20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,  Guo
	Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>,  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Alexandre
	Ghiti <alex@ghiti.fr>,  Marek Szyprowski <m.szyprowski@samsung.com>,  Benno
	Lossin <lossin@kernel.org>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250618122808eucas1p1734efef72b723602969465d6cd0c01d2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618122808eucas1p1734efef72b723602969465d6cd0c01d2
X-EPHeader: CA
X-CMS-RootMailID: 20250618122808eucas1p1734efef72b723602969465d6cd0c01d2
References: <20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com>
	<CGME20250618122808eucas1p1734efef72b723602969465d6cd0c01d2@eucas1p1.samsung.com>

Probing peripherals in the AON and PERI domains, such as the PVT thermal
sensor and the PWM controller, can lead to boot hangs or unresponsive
devices on the LPi4A board. The root cause is that their parent bus
clocks ('CLK_CPU2AON_X2H' and the 'CLK_PERISYS_APB' clocks) are
automatically gated by the kernel's power-saving mechanisms when the bus
is perceived as idle.

Alternative solutions were investigated, including modeling the parent
bus in the Device Tree with 'simple-pm-bus' or refactoring the clock
driver's parentage. The 'simple-pm-bus' approach is not viable due to
the lack of defined bus address ranges in the hardware manual and its
creation of improper dependencies on the 'pm_runtime' API for consumer
drivers.

Therefore, applying the'`CLK_IGNORE_UNUSED' flag directly to the
essential bus clocks is the most direct and targeted fix. This prevents
the kernel from auto-gating these buses and ensures peripherals remain
accessible.

This change fixes the boot hang associated with the PVT sensor and
resolves the functional issues with the PWM controller.

Link: https://lore.kernel.org/all/9e8a12db-236d-474c-b110-b3be96edf057@samsung.com/ [1]

Reviewed-by: Drew Fustini <drew@pdp7.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index ebfb1d59401d05443716eb0029403b01775e8f73..cf7f6bd428a0faa4611b3fc61edbbc6690e565d9 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -792,11 +792,12 @@ static CCU_GATE(CLK_AON2CPU_A2X, aon2cpu_a2x_clk, "aon2cpu-a2x", axi4_cpusys2_ac
 		0x134, BIT(8), 0);
 static CCU_GATE(CLK_X2X_CPUSYS, x2x_cpusys_clk, "x2x-cpusys", axi4_cpusys2_aclk_pd,
 		0x134, BIT(7), 0);
-static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd, 0x138, BIT(8), 0);
+static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd,
+		0x138, BIT(8), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_CPU2PERI_X2H, cpu2peri_x2h_clk, "cpu2peri-x2h", axi4_cpusys2_aclk_pd,
 		0x140, BIT(9), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB1_HCLK, perisys_apb1_hclk, "perisys-apb1-hclk", perisys_ahb_hclk_pd,
-		0x150, BIT(9), 0);
+		0x150, BIT(9), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB2_HCLK, perisys_apb2_hclk, "perisys-apb2-hclk", perisys_ahb_hclk_pd,
 		0x150, BIT(10), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", perisys_ahb_hclk_pd,

-- 
2.34.1


