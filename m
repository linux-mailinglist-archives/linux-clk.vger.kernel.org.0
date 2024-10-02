Return-Path: <linux-clk+bounces-12662-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0262598D1AF
	for <lists+linux-clk@lfdr.de>; Wed,  2 Oct 2024 12:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FDDB1C21DF4
	for <lists+linux-clk@lfdr.de>; Wed,  2 Oct 2024 10:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E883020694C;
	Wed,  2 Oct 2024 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U15x/gDf"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF497200100;
	Wed,  2 Oct 2024 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866140; cv=none; b=V63VH8lQV2qG583NaCjlxmYuD4pp12CQfeJpfIPX5ocr/xtLyTljWgUQrXkddDeXtWzTf3/vZGaq0LYQm2bdjxIlZWiNBMZsENMd9PWTVGpzwfqwypA6mNEOvxkDS0sIN5Z2k9+NHlgXcvoJsnue+5Koxqfa5sl0j6FAxl/OYTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866140; c=relaxed/simple;
	bh=7OviCXFHffO2bkj/xL5xz0DArD3vTiDNKyE94fzpFII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdocrnjv3TcGwittEWBIgH+4F2BV/tI/zqB0fIDpEeHs6mlcLlk3PGxU6L/aYwX7w/IDqlFLtW8K3L5GAQIOOfGJiihnhWn20WGBhuEczMNVPmWncZieDLDvyROwqDVqYqvY66vRQzwpRSomksaoDkKd5p6X/yFEhTnPXzS/l5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U15x/gDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFBCC4CEC5;
	Wed,  2 Oct 2024 10:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866140;
	bh=7OviCXFHffO2bkj/xL5xz0DArD3vTiDNKyE94fzpFII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U15x/gDfugw+t7bdXCeSi8WG8lT0ArCkTgk7oKatp1fDoXs2wjF9M8h3+2yYI1FrF
	 2Ya2d8KeEH6N8rRmiz/JiEGQd1RzWBHSrB20F4kI9SSDuXHi2r2eb+MN6a5FIFm7GW
	 spyLz01ZgmXAixriN4CaQUB4VEUdhJ82D/7tmiVf612cSOEnur9Cj4vEp9Hb8N3FpY
	 pm+hsoXoy3lNsS4fkbEd4ThPqWSoCzjw92jyCl5Vby2W1PiVkVhDuRHJGc7eHdLfwR
	 qmwSxqVsLlWr5jl8j2rq+0sIpY/yiwUIIDN1TSPwlzuOXiHQjMipdYbTyPsLkh7RW8
	 wSD+jn6eDeeIA==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 10/11] riscv: dts: microchip: fix mailbox description
Date: Wed,  2 Oct 2024 11:48:08 +0100
Message-ID: <20241002-finch-sugar-9958077e8c2b@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002-private-unequal-33cfa6101338@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=DOFHAjKnf7tU+evTd+s0TtMPYvUr+DWExrkuybwEW5k=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl/VR49cK83bXR/GN0r4v+xyLctOOfQcn9l1mg7N5FZB 7ceEnvWUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgImYtDEy7E9N8BHdYnf1N/8L pucOvlfebVlXf674PkfolY1NSe+2BjD8U37rVnVGl8O8ri1oXvp2dgmu/q7jAUW7HQ6cr+5cvy2 fHwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

When the binding for the mailbox on PolarFire SoC was originally
written, and later modified, mistakes were made - and the precise
nature of the later modification should have been a giveaway, but alas
I was naive at the time.

A more correct modelling of the hardware is to use two syscons and have
a single reg entry for the mailbox, containing the mailbox region. The
two syscons contain the general control/status registers for the mailbox
and the interrupt related registers respectively. The reason for two
syscons is that the same mailbox is present on the non-SoC version of
the FPGA, which has no interrupt controller, and the shared part of the
rtl was unchanged between devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 9883ca3554c50..f8a45e4f00a0d 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -259,6 +259,11 @@ clkcfg: clkcfg@20002000 {
 			#reset-cells = <1>;
 		};
 
+		sysreg_scb: syscon@20003000 {
+			compatible = "microchip,mpfs-sysreg-scb", "syscon";
+			reg = <0x0 0x20003000 0x0 0x1000>;
+		};
+
 		ccc_se: clock-controller@38010000 {
 			compatible = "microchip,mpfs-ccc";
 			reg = <0x0 0x38010000 0x0 0x1000>, <0x0 0x38020000 0x0 0x1000>,
@@ -521,10 +526,14 @@ usb: usb@20201000 {
 			status = "disabled";
 		};
 
-		mbox: mailbox@37020000 {
+		control_scb: syscon@37020000 {
+			compatible = "microchip,mpfs-control-scb", "syscon", "simple-mfd";
+			reg = <0x0 0x37020000 0x0 0x100>;
+		};
+
+		mbox: mailbox@37020800 {
 			compatible = "microchip,mpfs-mailbox";
-			reg = <0x0 0x37020000 0x0 0x58>, <0x0 0x2000318C 0x0 0x40>,
-			      <0x0 0x37020800 0x0 0x100>;
+			reg = <0x0 0x37020800 0x0 0x100>;
 			interrupt-parent = <&plic>;
 			interrupts = <96>;
 			#mbox-cells = <1>;
-- 
2.45.2


