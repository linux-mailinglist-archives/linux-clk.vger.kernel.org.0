Return-Path: <linux-clk+bounces-17589-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D8DA25288
	for <lists+linux-clk@lfdr.de>; Mon,  3 Feb 2025 07:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 899721639DD
	for <lists+linux-clk@lfdr.de>; Mon,  3 Feb 2025 06:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D47D1DC074;
	Mon,  3 Feb 2025 06:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="U+lc7m8v"
X-Original-To: linux-clk@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937F71EBFE8
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 06:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738564504; cv=none; b=bKvJnzrRq6i7MifXR8sqLQCjvcq6MgCOeEZg6ZRw0xXdtaE8Yq1tMuq+GUv5lGpd45HqMCghk64eTZxsC0zYmtexdgq59SbB0m9fGt9E/SlKvdJ7noQFmO6yFW18+8HA0nU2PWvabAKtHkLXKElMdX0r/OU98GeOyt+QpGICTGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738564504; c=relaxed/simple;
	bh=MvHOs/prmCaGsMdoXg9G8LLJtKC+Frm9bhsedB5JUP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BReDWWslskIgBtU/BxohoxcpdfRDs6njjWSTzn5qMZ3DtDL4uFPqYJvb6ZIr6q00XWU/Wumb+BhKOJxuvWnVXWFIzccqbOI9PiEIXYOiqEg/kVVoFv33ZCLEcmXzoNb+QMJjVqxiWnnGkx4fyDv6mvB6rYrx1EJ5qQ9anNAhXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=U+lc7m8v; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738564500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rXujrocl/q/AoW1/bTP6mXk3VvohzMz5MXKMXXqfQK0=;
	b=U+lc7m8v7Ln+09sAx8bM2qlC3mc3ybFktdoJp3fBrsdrcvexU/YtXhMI/05RXu2M/t64EV
	cW/tfruWSXtMgDOlSIbDALltcE6DTZbKqDRi0+fiRvW6oMdaNbsYD7iBCk9uII4LDnSl/W
	5COMjC4bx4RmOcuL0yMN1i1Es2jvU8gIuPjYrrPTKbj0o79DOdDFG6zr/fDCQjj4QSmfIz
	kKhyvFVwiPk84UiY729caG3LkdJ8wUsQi5RHFpbNHtlt8dcu6SSmGgIqjdWmxxu9Vb+fVW
	XO79XaKJOK9qSMaGl/HN8dSgIingtiqsgLu7IgkeL80li2fG0N+6u4Hs5vGGHA==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm630: Add missing resets to mmc blocks
Date: Mon,  3 Feb 2025 09:34:26 +0300
Message-ID: <20250203063427.358327-4-alexeymin@postmarketos.org>
In-Reply-To: <20250203063427.358327-1-alexeymin@postmarketos.org>
References: <20250203063427.358327-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add resets to eMMC/SD card blocks so linux can properly reset
them during initialization.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a2c079bac1a7..3722e405a97c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1379,6 +1379,7 @@ sdhc_2: mmc@c084000 {
 					<&xo_board>;
 			clock-names = "iface", "core", "xo";
 
+			resets = <&gcc GCC_SDCC2_BCR>;
 
 			interconnects = <&a2noc 3 &a2noc 10>,
 					<&gnoc 0 &cnoc 28>;
@@ -1433,6 +1434,8 @@ sdhc_1: mmc@c0c4000 {
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface", "core", "xo", "ice";
 
+			resets = <&gcc GCC_SDCC1_BCR>;
+
 			interconnects = <&a2noc 2 &a2noc 10>,
 					<&gnoc 0 &cnoc 27>;
 			interconnect-names = "sdhc-ddr", "cpu-sdhc";
-- 
2.45.3


