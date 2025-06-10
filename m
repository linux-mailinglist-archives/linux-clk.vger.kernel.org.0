Return-Path: <linux-clk+bounces-22736-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CADAD3814
	for <lists+linux-clk@lfdr.de>; Tue, 10 Jun 2025 15:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C47F71894235
	for <lists+linux-clk@lfdr.de>; Tue, 10 Jun 2025 13:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC652DCC14;
	Tue, 10 Jun 2025 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="t2tVslox"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E012D4B73
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560022; cv=none; b=JUX0phTXn8UPAlb6sgLRGl7I7ycFYn85MtMMOQYULCw5+IplpmQ8bPFpuFaS4KzeQCUqdjsL40bGlu4UlVJfcpBhvgw0SHQ/y/Iuu2hQWPzEWxnYCGWn1dusmRSFb4GDuSYwuT5ry1GKuLpwtW/oFAEsSPiDUQn16Oo3EmAfreI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560022; c=relaxed/simple;
	bh=0Lxu7HehLH7DoW/xoCT1Ko+GlSwTKO8zio/z/Fw+EXg=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=RfOnlzQ1huU6V5pP0Jf0HfJRClCSdGRuf3lssfJmpl2GvxViMjD+7NySvI8/0/JmObnUyYg225IZG5+SOS298M2UvWp3ECpV6ar1ONxBlXMiwY76YD6dO6Qkk4ljwqEQrI2Sgcw7I0ul2zaOzc2JXJur9iV6MT6cAd+7CQYNEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=t2tVslox; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250610125335euoutp0290056601bb087341499f229dae95e849~Hr5Cb8RVM2423224232euoutp02d
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 12:53:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250610125335euoutp0290056601bb087341499f229dae95e849~Hr5Cb8RVM2423224232euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749560015;
	bh=bJ5VvscQYJn7ykJa1oEwOsbdE9rQgFXktHrSp9bPepw=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=t2tVslox2bnOIpBG59uP9yLmoELioWWWWFFAHf8n8oemawHupZS6bLnWpz8kpntuw
	 4kllgfy6xyToBFw4vpAyMefN1/Pe8xKS5hcT5lCCpbIuQv/nHUcE4qGdE9ieNBuFc9
	 oEF6LnJ+LKodk2uFdengJDDHGW+ZYScDQfqVrK1w=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250610125334eucas1p25545871cc703378afed320da70c2d2f3~Hr5BaaLph1179011790eucas1p24;
	Tue, 10 Jun 2025 12:53:34 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250610125333eusmtip1bc9d2a9075043a948cec114b0c3acaa3~Hr5APZd950451804518eusmtip1E;
	Tue, 10 Jun 2025 12:53:33 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 10 Jun 2025 14:52:51 +0200
Subject: [PATCH v2 3/7] clk: thead: Mark essential bus clocks as
 CLK_IGNORE_UNUSED
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-rust-next-pwm-working-fan-for-sending-v2-3-753e2955f110@samsung.com>
In-Reply-To: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
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
X-CMS-MailID: 20250610125334eucas1p25545871cc703378afed320da70c2d2f3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250610125334eucas1p25545871cc703378afed320da70c2d2f3
X-EPHeader: CA
X-CMS-RootMailID: 20250610125334eucas1p25545871cc703378afed320da70c2d2f3
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
	<CGME20250610125334eucas1p25545871cc703378afed320da70c2d2f3@eucas1p2.samsung.com>

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

[1] - https://lore.kernel.org/all/9e8a12db-236d-474c-b110-b3be96edf057@samsung.com/

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


