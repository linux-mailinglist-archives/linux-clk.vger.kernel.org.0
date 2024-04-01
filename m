Return-Path: <linux-clk+bounces-5258-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B55EA8938FC
	for <lists+linux-clk@lfdr.de>; Mon,  1 Apr 2024 10:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F1F0281A9F
	for <lists+linux-clk@lfdr.de>; Mon,  1 Apr 2024 08:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE45DCA4A;
	Mon,  1 Apr 2024 08:24:43 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2157C133;
	Mon,  1 Apr 2024 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711959883; cv=none; b=a96s0j8LYB5R25YmPIiu0ZMlcJdoj8uRZ5GqL3EXJaP8i8fi3KmUWABjrS6xgq2L9/8sYDmVTde4XDnwOLKkvjQYeSrP0SgnJ3ZHUGfUK/RiyOFpb6B5J4NWPmAo5RhX1G+dc2KWgirWeBizfs5JNUVG7WRT/lpybzyxrsVxuX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711959883; c=relaxed/simple;
	bh=bGK/tjyPouBpcr/9GWxrGkfH7GWAsOMrSFXaKmZTAV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5oJvsg9e07+6FB7DZ6lAFJhwyFTSN9A6AUCYMFIjqFe0Sj4neSOwEMIU8ikFewe/Cc82o6etMi/pXYqePjGlUmFBb7HrgxRPJ+vatjEFtrDvEyVNgQnzf8wZ9JBbQuNKwGJotQkWVWeIcsphgTYUJENWuS4BDgyM/4DoPYDT8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8AxPOlHbwpmXOkhAA--.2470S3;
	Mon, 01 Apr 2024 16:24:39 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxNBFFbwpmiidwAA--.10346S2;
	Mon, 01 Apr 2024 16:24:38 +0800 (CST)
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
Subject: [PATCH v2 8/8] LoongArch: dts: Add clock support to Loongson-2K2000
Date: Mon,  1 Apr 2024 16:24:31 +0800
Message-ID: <6d80ee06d1df3942faad04f8332be01572b3237c.1711504700.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711504700.git.zhoubinbin@loongson.cn>
References: <cover.1711504700.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxNBFFbwpmiidwAA--.10346S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur1xuFyxZFWUCw17CF13WrX_yoW8uw18p3
	srCa1UKr409F1xur98trWUGF1kAF95AFnrWanIkFyUGwnIq34UZr18JF93tF4UXr4fX3yI
	qrn5Gry29F4UuabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUxNeODUUUU

The module is supported, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k2000-ref.dts          |  4 ++++
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  | 19 +++++++++++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k2000-ref.dts b/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
index dca91caf895e..a7af345b30ea 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
@@ -39,6 +39,10 @@ linux,cma {
 	};
 };
 
+&clk {
+	status = "okay";
+};
+
 &sata {
 	status = "okay";
 };
diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index a231949b5f55..605efaba7292 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/loongson,ls2k-clk.h>
 
 / {
 	#address-cells = <2>;
@@ -19,21 +20,22 @@ cpu0: cpu@1 {
 			compatible = "loongson,la364";
 			device_type = "cpu";
 			reg = <0x0>;
-			clocks = <&cpu_clk>;
+			clocks = <&clk LOONGSON2_NODE_CLK>;
 		};
 
 		cpu1: cpu@2 {
 			compatible = "loongson,la364";
 			device_type = "cpu";
 			reg = <0x1>;
-			clocks = <&cpu_clk>;
+			clocks = <&clk LOONGSON2_NODE_CLK>;
 		};
 	};
 
-	cpu_clk: cpu-clk {
+	ref_100m: clock-ref-100m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <1400000000>;
+		clock-frequency = <100000000>;
+		clock-output-names = "ref_100m";
 	};
 
 	cpuintc: interrupt-controller {
@@ -51,6 +53,15 @@ bus@10000000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		clk: clock-controller@10010480 {
+			compatible = "loongson,ls2k2000-clk";
+			reg = <0x0 0x10010480 0x0 0x100>;
+			#clock-cells = <1>;
+			clocks = <&ref_100m>;
+			clock-names = "ref_100m";
+			status = "disabled";
+		};
+
 		pmc: power-management@100d0000 {
 			compatible = "loongson,ls2k2000-pmc", "loongson,ls2k0500-pmc", "syscon";
 			reg = <0x0 0x100d0000 0x0 0x58>;
-- 
2.43.0


